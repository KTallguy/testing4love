--! file:examples.lua
-- require("testsubdir.example") -- this '.' is the directory path
-- print(Test) --global var

-- local r1, r2

-- function love.load()
	
-- 	Tick = require "lib.tick"
-- 	Object = require "lib.classic"

-- 	local Rectangle = require "objects.rectangle"
-- 	local Circle = require "objects.circle"

-- 	r1 = Rectangle(100, 100, 200, 50) --creating a unique instance of rectangle
-- 	r2 = Circle(350, 80, 40)

-- 	x = 30
-- 	y = 50

-- 	ListOfRectangles = {}
-- 	drawRectangle = false

-- 	-- Tick.delay(function () drawRectangle = true end, 2)

-- end

-- function createRect()
-- 	-- storing a "key or property" of a variable is done like the below
-- 	rect = {}
-- 	rect.width = 70 	-- this is the same as rect["width"] = 100
-- 	rect.length = 90
-- 	rect.x = 100
-- 	rect.y = 100
-- 	rect.speed = 100

-- 	table.insert(ListOfRectangles, rect)

-- end

-- function love.keypressed(key)
-- 	if key == "space" then
-- 		createRect()
-- 	end

-- 	if key == "g" then
-- 		x = math.random(100,500)
-- 		y = math.random(100,500)
-- 	end
-- end

-- function love.update(dt)
-- 	Tick.update(dt)

-- 	r1:update(dt) -- When we use a colon (:), the function-call will automatically pass the object left of the colon as first argument.
-- 	r2:update(dt)

-- 	for i,v in ipairs(ListOfRectangles) do
-- 		v.x = v.x + v.speed * dt
-- 	end

-- end

-- function love.draw()
-- 	for i,v in ipairs(ListOfRectangles) do
-- 		love.graphics.rectangle("line", v.x, v.y, rect.width, rect.length)
-- 	end

-- 	-- if drawRectangle then
-- 	-- 	love.graphics.rectangle("fill", 400,400,300,200)
-- 	-- end

-- 	love.graphics.rectangle("line", x,y,100,100)

-- 	function love.draw()
-- 		r1:draw()
-- 		r2:draw()
-- 	end

	
-- end







---------------------------------



-- function love.load()
 	
-- 	Tick = require "lib.tick"
--  	Object = require "lib.classic"

-- 	myImage = love.graphics.newImage("assets/sheep.png")
-- 	width = myImage:getWidth()
-- 	height = myImage:getHeight()

-- 	r1 = {
-- 		x = 10,
-- 		y = 100,
-- 		width = 100,
-- 		height = 100
-- 	}
	
-- 	r2 = {
-- 		x = 250,
-- 		y = 120,
-- 		width = 150,
-- 		height = 120
-- 	}

-- 	love.graphics.setBackgroundColor(1,1,1)

-- end

-- function love.keypressed(key)

-- end

-- function love.update(dt)
-- 	Tick.update(dt)
-- 	r1.x = r1.x + 100 * dt
-- end


-- function love.draw()

-- 	local mode
-- 	if checkCollision (r1,r2) then
-- 		mode = "fill"
-- 	else
-- 		mode = "line"
-- 	end

-- 	love.graphics.setColor(255/255, 0/255, 0/255, 255/255)
-- 	love.graphics.rectangle(mode, r1.x, r1.y, r1.width, r1.height)
-- 	love.graphics.setColor(0/255, 0/255, 255/255, 255/255)
-- 	love.graphics.rectangle(mode, r2.x, r2.y, r2.width, r2.height)

-- 	-- Some drawn sheep
-- 	-- love.graphics.setColor(255/255, 200/255, 40/255, 127/255) -- RGB colors but 0 ~ 1
-- 	-- love.graphics.draw(myImage, 400, 100, -90, 2, 2, width/2, height/2)
-- 	-- love.graphics.setColor(1,1,1)
-- 	-- love.graphics.draw(myImage, 100, 100, 0, 2, 2, width/2, height/2)

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










---------------------------------

	-- fruits = {"apple", "banana"}
	-- table.insert(fruits, "pear")
	-- table.insert(fruits, "pineapple")
	-- table.remove(fruits, 2)
	-- fruits[1] = "tomato"


-- storing a "key or property" of a variable is done like the below
-- rect = {}
-- rect.width = 70 	-- this is the same as rect["width"] = 100
-- rect.length = 90
-- rect.x = 100
-- rect.y = 100
-- rect.speed = 100

-- table.insert(ListOfRectangles, rect)


-- How to iterate through lists
--
-- function love.update(dt)
-- 	--	print(dt)
-- 		Tick.update(dt)
	
-- 		for i,v in ipairs(ListOfRectangles) do
-- 			v.x = v.x + v.speed * dt
-- 		end
-- 	end	


-- controls

	-- if love.keyboard.isDown("right") then
	-- 	rect.x = rect.x + rect.speed * dt
	-- elseif love.keyboard.isDown("left") then
	-- 	rect.x = rect.x - rect.speed * dt
	-- end
