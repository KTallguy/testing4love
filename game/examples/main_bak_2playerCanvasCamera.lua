-- --! file:main.lua
-- -- these are various tutorials from the following URL https://sheepolution.com/learn/book/18


-- -- Remember that you can add the following code at the top of your main.lua to have the output appear right away, and you don't need to close your game for it.
-- io.stdout:setvbuf("no")


-- function love.load()
-- 	Tick = require "lib.tick"
--  	Object = require "lib.classic"
-- 	Lume = require "lib.lume"

-- 	screenCanvas = love.graphics.newCanvas(400,600)

-- 	player1 = {
-- 		x = 100,
-- 		y = 100,
-- 		size = 25,
-- 		image = love.graphics.newImage("assets/face.png")
-- 	}
-- 	player2 = {
-- 		x = 100,
-- 		y = 100,
-- 		size = 25,
-- 		image = love.graphics.newImage("assets/face.png")
-- 	}

-- 	coins = {}
-- 	score1 = 0
-- 	score2 = 0
	

-- 	for i=1,25 do
-- 		table.insert(coins,
-- 			{
-- 				--random position of coin
-- 				x = love.math.random (50, 650),
-- 				y = love.math.random (50, 550),
-- 				size = 10,
-- 				image = love.graphics.newImage("assets/dollar.png")
-- 			}
-- 		)
-- 	end

-- end

-- function love.keypressed(key)


-- end

-- function love.update(dt)
-- 	Tick.update(dt)

-- 	if love.keyboard.isDown("left") then
-- 		player1.x = player1.x - 200 * dt
-- 	elseif love.keyboard.isDown("right") then
-- 		player1.x = player1.x + 200 * dt
-- 	end
-- 	if love.keyboard.isDown("up") then
-- 		player1.y = player1.y - 200 * dt
-- 	elseif love.keyboard.isDown("down") then
-- 		player1.y = player1.y + 200 * dt
-- 	end

-- 	if love.keyboard.isDown("a") then
-- 		player2.x = player2.x - 200 * dt
-- 	elseif love.keyboard.isDown("d") then
-- 		player2.x = player2.x + 200 * dt
-- 	end
-- 	if love.keyboard.isDown("w") then
-- 		player2.y = player2.y - 200 * dt
-- 	elseif love.keyboard.isDown("s") then
-- 		player2.y = player2.y + 200 * dt
-- 	end

-- 	-- to remove things from a table without skipping entries when something is removed, we should loop through table in reverse
-- 	-- start at the end of the table, until 1, with steps of minus 1
	
-- 	for i = #coins, 1, -1 do
-- 		-- use coins[i] rather than v
-- 		if checkCollision(player1, coins[i]) then
-- 			table.remove(coins, i)
-- 			player1.size = player1.size + 1
-- 			score1 = score1 + 1
-- 		elseif checkCollision(player2, coins[i]) then
-- 			table.remove(coins, i)
-- 			player2.size = player2.size + 1
-- 			score2 = score2 + 1
-- 		end
-- 	end

-- end


-- function love.draw()
-- 	--drawing two canvases for two players
-- 	love.graphics.setCanvas(screenCanvas)
-- 		love.graphics.clear()
-- 		drawGame(player1)
-- 	love.graphics.setCanvas()
-- 	love.graphics.draw(screenCanvas)


-- 	love.graphics.setCanvas(screenCanvas)
-- 		love.graphics.clear()
-- 		drawGame(player2)
-- 	love.graphics.setCanvas()
-- 	love.graphics.draw(screenCanvas, 400)

-- 	-- add line to separate the 2 players' screens
-- 	love.graphics.line(400, 0, 400, 600)

-- 	love.graphics.print("Player 1: " .. score1, 10, 10)
-- 	love.graphics.print("Player 2: " .. score2, 10, 30)

-- end

-- function drawGame(focus)
-- 	love.graphics.push() -- copies state of the current coordinate transforms and pushes it onto the stack (the following is the gamespace) 
-- 		love.graphics.translate(-focus.x + 200, -focus.y + 300)

-- 		love.graphics.circle("line", player1.x, player1.y, player1.size)
-- 		love.graphics.draw(player1.image, player1.x, player1.y, 0, 1, 1, player1.image:getWidth()/2, player1.image:getHeight()/2)
		
-- 		love.graphics.setColor(1,0.5,0.5,1)
-- 		love.graphics.circle("line", player2.x, player2.y, player2.size)
-- 		love.graphics.draw(player2.image, player2.x, player2.y, 0, 1, 1, player2.image:getWidth()/2, player2.image:getHeight()/2)

-- 		for i,v in ipairs(coins) do
-- 			love.graphics.setColor(1,1,1,1)
-- 			love.graphics.circle("line", v.x, v.y, v.size)
-- 			love.graphics.draw(v.image, v.x, v.y, 0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
-- 		end
-- 	love.graphics.pop() -- get the copy of that coord. state and apply it
-- end

-- function checkCollision(p1, p2)
-- 	-- calculating distance in 1 line
-- 	-- subtract x & y, sqr difference, sum squares, find root of sum
-- 	local distance = math.sqrt((p1.x - p2.x)^2 + (p1.y - p2.y)^2)
-- 	-- return whether distance is lower than sum of sizes
-- 	return distance < p1.size + p2.size
-- end

