--! file:main.lua
-- these are various tutorials from the following URL https://sheepolution.com/learn/book/18


-- Remember that you can add the following code at the top of your main.lua to have the output appear right away, and you don't need to close your game for it.
io.stdout:setvbuf("no")


function love.load()
	Tick = require "lib.tick"
 	Object = require "lib.classic"
	Lume = require "lib.lume"
	require "objects.entity"
	require "objects.player"
	require "objects.wall"
	require "objects.box"
	
	player = Player(100, 100)
	box = Box(400, 150)

	objects = {}
	table.insert(objects, player)
	table.insert(objects, box)

	walls = {} -- create a walls table that doesn't check collision with itself

	map = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
        {1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
    }

	for i,v in ipairs(map) do
		for j,w in ipairs(v) do
			if w == 1 then
				table.insert(walls, Wall((j-1)*50, (i-1)*50))
			end
		end
	end
end

function love.keypressed(key)
	-- player jumps when up is pressed
	if key == "up" then
		player:jump()
	end
end

function love.update(dt)
	-- update all the objects in the table
	for i,v in ipairs(objects) do
		v:update(dt)
	end
	
	for i,v in ipairs(walls) do --separate table for walls 
		v:update(dt)
	end

	local loop = true
	local limit = 0

	while loop do
		-- set loop to false, if no collision happened it will stay false
		loop = false

		limit = limit + 1
		if limit > 100 then 
			break -- 100 loops means we stop because endless loop
		end

		-- go through all the objects except the last one
		for i=1, #objects-1 do
			for j=i+1, #objects do -- go through all the objects starting from position i + 1
				local collision = objects[i]:resolveCollision(objects[j])
				if collision then
					loop = true
				end
			end
		end

		-- walls are separate, for each object check collision with every wall, walls don't move so they don't need to check collision with one another
		for i,wall in ipairs(walls) do
			for j,object in ipairs(objects) do
				local collision = object:resolveCollision(wall)
				if collision then
					loop = true
				end
			end
		end

	end
end

function love.draw()
	-- draw all the objs
	for i,v in ipairs(objects) do
		v:draw()
	end
	for i,v in ipairs(walls) do
		v:draw()
	end
end
