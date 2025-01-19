-- --! file:main_bak.lua
-- -- these are various tutorials from the following URL https://sheepolution.com/learn/book/18
-- -- I duplicated the main.lua so I can revisit some of these coding exercises as needed


-- -- Remember that you can add the following code at the top of your main.lua to have the output appear right away, and you don't need to close your game for it.
-- io.stdout:setvbuf("no")


-- function love.load()
 	
-- 	Tick = require "lib.tick"
--  	Object = require "lib.classic"
-- 	-- require "player"
-- 	-- require "enemy"
-- 	-- require "bullet"

-- 	-- a panda shooting a snake character test
-- 	-- player = Player()
-- 	-- enemy = Enemy()
-- 	-- listOfBullets = {}

-- 	--drawing a circle
-- 	circle = {}
-- 	circle.x = 100
-- 	circle.y = 100
-- 	circle.radius = 25
-- 	circle.speed = 200

-- 	-- an arrow that follows the mouse cursor (rotating with it)
-- 	arrow = {}
-- 	arrow.x = 200
-- 	arrow.y = 200
-- 	arrow.speed = 300
-- 	arrow.angle = 0
-- 	arrow.image = love.graphics.newImage("assets/arrow_right.png")
-- 	arrow.origin_x = arrow.image:getWidth() / 2
-- 	arrow.origin_y = arrow.image:getHeight() / 2

-- 	-- an animated sprite
-- 	image = love.graphics.newImage("assets/jump_3.png")
-- 	local width = image:getWidth()
-- 	local height = image:getHeight()
	
-- 	frames = {}

-- 	local frame_width = 117
-- 	local frame_height = 231
-- 	maxFrames = 5

-- 	-- cutting the animated sprite into quads and iterating over 5 frames
-- 	for i = 0, 1 do
-- 		for j = 0, 2 do
-- 			table.insert(frames, love.graphics.newQuad(1 + j * (frame_width + 2), 1 + i * (frame_height + 6), frame_width, frame_height, width, height))
-- 			if #frames == maxFrames then
-- 				break
-- 			end
-- 		end
-- 		print("I don't break!")
-- 	end

-- 	currentFrame = 1

-- 	--love.graphics.setBackgroundColor(1,1,1)

-- 	--audio tests
-- 	song = love.audio.newSource("assets/song.ogg", "stream")
-- 	song:setVolume(0.2)
-- 	song:setLooping(true)
-- 	song:play()

-- 	sfx = love.audio.newSource("assets/sfx.ogg", "static")

-- 	--tilemap tests
-- 	tileImage = love.graphics.newImage("assets/tileset.png")
-- 	local tileImageWidth = tileImage:getWidth()
-- 	local tileImageHeight = tileImage:getHeight()
-- 	tileWidth = (tileImageWidth / 3) - 2
-- 	tileHeight = (tileImageHeight / 2) - 2

-- 	tileQuads = {}

-- 	-- drawing tiles based on an image of tiles, using quads to get the appropriate quad image
-- 	for i=0,1 do
-- 		for j=0,2 do
-- 			table.insert(tileQuads, love.graphics.newQuad(1 + j * (tileWidth + 2), 1 + i * (tileHeight + 2), tileWidth, tileHeight, tileImageWidth, tileImageHeight))
-- 		end
-- 	end

-- 	-- a tilemap referring to different positions in the tile map image
-- 	tilemap = {
-- 		{1, 6, 6, 2, 1, 6, 6, 2},
-- 		{3, 0, 0, 4, 5, 0, 0, 3},
-- 		{3, 0, 0, 0, 0, 0, 0, 3},
-- 		{4, 2, 0, 0, 0, 0, 1, 5},
-- 		{1, 5, 0, 0, 0, 0, 4, 2},
-- 		{3, 0, 0, 0, 0, 0, 0, 3},
-- 		{3, 0, 0, 1, 2, 0, 0, 3},
-- 		{4, 6, 6, 5, 4, 6, 6, 5}
-- 	}

-- 	--colors table of RGB values that can be used to draw rectangles or even tint images with color 
-- 	colors = {
-- 		{1,1,1},
-- 		{1,0,0},
-- 		{1,0,1},
-- 		{0,0,1},
-- 		{0,1,1}
-- 	}

-- 	-- a player that can only move along tiles
-- 	tilePlayer = {
-- 		image = love.graphics.newImage("assets/tilePlayer.png"),
-- 		tile_x = 2,
-- 		tile_y = 2
-- 	}

-- end

-- function love.keypressed(key)
-- 	-- player:keypressed(key)
-- 	local x = tilePlayer.tile_x
-- 	local y = tilePlayer.tile_y

-- 	if key == "left" then
-- 		x = x -1 
-- 	elseif key == "right" then
-- 		x = x + 1
-- 	elseif key == "up" then
-- 		y = y -1
-- 		sfx:play()
-- 	elseif key == "down" then
-- 		y = y + 1
-- 	end

-- 	if tileIsEmpty(x, y) then
-- 		tilePlayer.tile_x = x
-- 		tilePlayer.tile_y = y
-- 	end
-- end

-- -- function love.update(dt)
-- 	Tick.update(dt)
-- 	-- player:update(dt)
-- 	-- enemy:update(dt)

-- 	-- for i,v in ipairs(listOfBullets) do
-- 	-- 	v:update(dt)
-- 	-- 	v:checkCollision(enemy)
-- 	-- 	if v.dead then
-- 	-- 		table.remove(listOfBullets, i)
-- 	-- 	end
-- 	-- end

-- 	currentFrame = currentFrame + 10 * dt
-- 	if currentFrame >= 6 then
-- 		currentFrame = 1
-- 	end

-- 	--love.mouse.getPosition() returns the x & y pos of mouse cursor
-- 	mouse_x, mouse_y = love.mouse.getPosition()
-- 	arrow.angle = math.atan2(mouse_y - arrow.y, mouse_x - arrow.x)
-- 	cos = math.cos(arrow.angle)
-- 	sin = math.sin(arrow.angle)

-- 	local distance = getDistance(arrow.x, arrow.y, mouse_x, mouse_y)
-- 	if distance < 400 then
-- 		arrow.x = arrow.x + arrow.speed * cos * (distance/100) * dt
-- 		arrow.y = arrow.y + arrow.speed * sin * (distance/100) * dt
-- 	end
-- 	-- angle = math.atan2(mouse_y - circle.y, mouse_x - circle.x)
-- 	-- cos = math.cos(angle)
-- 	-- sin = math.sin(angle)

-- 	-- local distance = getDistance(circle.x, circle.y, mouse_x, mouse_y)
-- 	-- if distance < 400 then
-- 	-- 	circle.x = circle.x + circle.speed * cos * (distance/100) * dt
-- 	-- 	circle.y = circle.y + circle.speed * sin * (distance/100) * dt
-- 	-- end
-- end


-- function love.draw()
-- 	-- player:draw()
-- 	-- enemy:draw()

-- 	-- for i,v in ipairs(listOfBullets) do
-- 	-- 	v:draw()
-- 	-- end%
-- 	love.graphics.draw(image, frames[math.floor(currentFrame)], 100, 100)


-- 	--ipairs loops through a table
-- 	--iteration 'i' is iteration of the loop (1,2,3,4 etc.)
-- 	--iteration 'v' is value of pos 'i'

-- 	-- --circle test
-- 	-- love.graphics.circle("line", circle.x, circle.y, circle.radius)
-- 	-- -- print angle
-- 	-- love.graphics.print("angle: " .. angle, 10, 10)

-- 	-- --lines to visualize the velocity
-- 	-- love.graphics.line(circle.x, circle.y, mouse_x, circle.y)
-- 	-- love.graphics.line(circle.x, circle.y, circle.x, mouse_y)

-- 	-- --the angle
-- 	-- love.graphics.line(circle.x, circle.y, mouse_x, mouse_y)

-- 	-- --the distance -> hypotenuse (pythagorean theorum hehe)
-- 	-- local distance = getDistance(circle.x, circle.y, mouse_x, mouse_y)
-- 	-- love.graphics.circle("line", circle.x, circle.y, distance)

-- 	-- arrow draw test
-- 	love.graphics.draw(arrow.image, arrow.x, arrow.y, arrow.angle, 1, 1, arrow.origin_x, arrow.origin_y)
-- 	love.graphics.circle("fill", mouse_x, mouse_y, 5)


-- 	for i,row in ipairs(tilemap) do
-- 		for j,tiles in ipairs(row) do
-- 			if tiles ~= 0 then
-- 				-- --set color via rgb decimal values
-- 				-- love.graphics.setColor(colors[tiles])
-- 				--draw tile
-- 				love.graphics.draw(tileImage, tileQuads[tiles], j * tileWidth, i * tileHeight)
-- 			end
-- 		end
-- 	end

-- 	love.graphics.draw(tilePlayer.image, tilePlayer.tile_x * tileWidth, tilePlayer.tile_y * tileHeight)


-- end

-- function tileIsEmpty(x, y)
-- 	-- used to check if the tilePlayer can move into a tile (only if it's empty ie. equals 0)
-- 	return tilemap[y][x] == 0
-- end

-- function getDistance(x1, y1, x2, y2)
-- 	local horizontal_distance = x1 - x2
-- 	local vertical_distance = y1 - y2

-- 	local a = horizontal_distance ^2
-- 	local b = vertical_distance ^2

-- 	local c = a + b
-- 	local distance = math.sqrt(c)
-- 	return distance

-- end

-- function checkCollision(a, b)
-- 	local a_left = a.x
-- 	local a_right = a.x + a.width
-- 	local a_top = a.y
-- 	local a_bottom = a.y + a.height

-- 	local b_left = b.x
-- 	local b_right = b.x + b.width
-- 	local b_top = b.y
-- 	local b_bottom = b.y + b.height

-- 	-- if a_right > b_left		--If Red's right side is further to the right than Blue's left side.
-- 	-- and a_left < b_right	--and Red's left side is further to the left than Blue's right side.
-- 	-- and a_bottom > b_top	--and Red's bottom side is further to the bottom than Blue's top side.
-- 	-- and a_top > b_bottom then	--and Red's top side is further to the top than Blue's bottom side then..		return true
-- 	-- else
-- 	-- 	return false
-- 	-- end

-- 	return a_right > b_left
-- 		and a_left < b_right
-- 		and a_bottom > b_top
-- 		and a_top < b_bottom

-- end
