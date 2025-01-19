--! file:main.lua
-- these are various tutorials from the following URL https://sheepolution.com/learn/book/18


-- Remember that you can add the following code at the top of your main.lua to have the output appear right away, and you don't need to close your game for it.
io.stdout:setvbuf("no")


function love.load()
	Tick = require "lib.tick"
 	Object = require "lib.classic"
	Lume = require "lib.lume"

	player = {
		x = 100,
		y = 100,
		size = 25,
		image = love.graphics.newImage("assets/face.png")
	}

	coins = {}

	--checking if save data exists, then reading it and updating the vars.
	if love.filesystem.getInfo("savedata.txt") then
		file = love.filesystem.read("savedata.txt")
		data = Lume.deserialize(file)

		--apply Player info
		player.x = data.player.x
		player.y = data.player.y
		player.size = data.player.size

		for i,v in ipairs(data.coins) do
			coins[i] = {
				x = v.x,
				y = v.y,
				size = 10,
				image = love.graphics.newImage("assets/dollar.png")
			}
		end
		coinCounter = data.coinCounter
	else
		for i=1,25 do
			table.insert(coins,
				{
					--random position of coin
					x = love.math.random (50, 650),
					y = love.math.random (50, 550),
					size = 10,
					image = love.graphics.newImage("assets/dollar.png")
				}
			)
		end
		coinCounter = 0
	end

end

function love.keypressed(key)
	if key == "space" then
		saveGame()
	-- how to reset the save data and restart the game (quit)
	elseif key == "p" then
		love.filesystem.remove("savedata.txt")
		love.event.quit("restart")
	end
end

function love.update(dt)
	Tick.update(dt)

	if love.keyboard.isDown("left") then
		player.x = player.x - 200 * dt
	elseif love.keyboard.isDown("right") then
		player.x = player.x + 200 * dt
	end
	if love.keyboard.isDown("up") then
		player.y = player.y - 200 * dt
	elseif love.keyboard.isDown("down") then
		player.y = player.y + 200 * dt
	end

	-- to remove things from a table without skipping entries when something is removed, we should loop through table in reverse
	-- start at the end of the table, until 1, with steps of minus 1
	
	for i = #coins, 1, -1 do
		-- use coins[i] rather than v
		if checkCollision(player, coins[i]) then
			table.remove(coins, i)
			player.size = player.size + 1
			coinCounter = coinCounter + 1
		end
	end
end


function love.draw()
	love.graphics.circle("line", player.x, player.y, player.size)
	love.graphics.draw(player.image, player.x, player.y, 0, 1, 1, player.image:getWidth()/2, player.image:getHeight()/2)

	for i,v in ipairs(coins) do
		love.graphics.circle("line", v.x, v.y, v.size)
		love.graphics.draw(v.image, v.x, v.y, 0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
	end

	love.graphics.print("Coins: " .. coinCounter, 10, 10)

end

function checkCollision(p1, p2)
	-- calculating distance in 1 line
	-- subtract x & y, sqr difference, sum squares, find root of sum
	local distance = math.sqrt((p1.x - p2.x)^2 + (p1.y - p2.y)^2)
	-- return whether distance is lower than sum of sizes
	return distance < p1.size + p2.size
end


--saving the game
function saveGame()
	data = {}
	data.player = {
		x = player.x,
		y = player.y,
		size = player.size
	}

	data.coins = {}
	for i,v in ipairs(coins) do
		-- in this case data,coins[i] = value is the same as table.insert(data.coins, value)
		data.coins[i] = {x = v.x, y = v.y}
	end

	data.coinCounter = coinCounter

	serialized = Lume.serialize(data)
	love.filesystem.write("savedata.txt", serialized)
end

