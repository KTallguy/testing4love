--! file:main.lua


function love.load()
 	
	Tick = require "lib.tick"
 	Object = require "lib.classic"
	require "player"
	require "enemy"
	require "bullet"

	player = Player()
	enemy = Enemy()
	listOfBullets = {}

	circle = {}
	circle.x = 100
	circle.y = 100
	circle.radius = 25
	circle.speed = 200

	arrow = {}
	arrow.x = 200
	arrow.y = 200
	arrow.speed = 300
	arrow.angle = 0
	arrow.image = love.graphics.newImage("assets/arrow_right.png")
	arrow.origin_x = arrow.image:getWidth() / 2
	arrow.origin_y = arrow.image:getHeight() / 2


	frames = {}
	for i = 1,5 do
		table.insert(frames, love.graphics.newImage("assets/jump" .. i .. ".png"))
	end

	currentFrame = 1

	--love.graphics.setBackgroundColor(1,1,1)

end

function love.keypressed(key)
	player:keypressed(key)
end

function love.update(dt)
	Tick.update(dt)
	player:update(dt)
	enemy:update(dt)

	for i,v in ipairs(listOfBullets) do
		v:update(dt)
		v:checkCollision(enemy)
		if v.dead then
			table.remove(listOfBullets, i)
		end
	end

	currentFrame = currentFrame + 10 * dt
	if currentFrame >= 6 then
		currentFrame = 1
	end

	--love.mouse.getPosition() returns the x & y pos of mouse cursor
	mouse_x, mouse_y = love.mouse.getPosition()
	arrow.angle = math.atan2(mouse_y - arrow.y, mouse_x - arrow.x)
	cos = math.cos(arrow.angle)
	sin = math.sin(arrow.angle)

	local distance = getDistance(arrow.x, arrow.y, mouse_x, mouse_y)
	if distance < 400 then
		arrow.x = arrow.x + arrow.speed * cos * (distance/100) * dt
		arrow.y = arrow.y + arrow.speed * sin * (distance/100) * dt
	end
	-- angle = math.atan2(mouse_y - circle.y, mouse_x - circle.x)
	-- cos = math.cos(angle)
	-- sin = math.sin(angle)

	-- local distance = getDistance(circle.x, circle.y, mouse_x, mouse_y)
	-- if distance < 400 then
	-- 	circle.x = circle.x + circle.speed * cos * (distance/100) * dt
	-- 	circle.y = circle.y + circle.speed * sin * (distance/100) * dt
	-- end
end


function love.draw()
	player:draw()
	enemy:draw()

	for i,v in ipairs(listOfBullets) do
		v:draw()
	end

	love.graphics.draw(frames[math.floor(currentFrame)], arrow.x, arrow.y)

	-- --circle test
	-- love.graphics.circle("line", circle.x, circle.y, circle.radius)
	-- -- print angle
	-- love.graphics.print("angle: " .. angle, 10, 10)

	-- --lines to visualize the velocity
	-- love.graphics.line(circle.x, circle.y, mouse_x, circle.y)
	-- love.graphics.line(circle.x, circle.y, circle.x, mouse_y)

	-- --the angle
	-- love.graphics.line(circle.x, circle.y, mouse_x, mouse_y)

	-- --the distance -> hypotenuse (pythagorean theorum hehe)
	-- local distance = getDistance(circle.x, circle.y, mouse_x, mouse_y)
	-- love.graphics.circle("line", circle.x, circle.y, distance)

	-- arrow draw test
	love.graphics.draw(arrow.image, arrow.x, arrow.y, arrow.angle, 1, 1, arrow.origin_x, arrow.origin_y)
	love.graphics.circle("fill", mouse_x, mouse_y, 5)
	
end

function getDistance(x1, y1, x2, y2)
	local horizontal_distance = x1 - x2
	local vertical_distance = y1 - y2

	local a = horizontal_distance ^2
	local b = vertical_distance ^2

	local c = a + b
	local distance = math.sqrt(c)
	return distance

end

function checkCollision(a, b)
	local a_left = a.x
	local a_right = a.x + a.width
	local a_top = a.y
	local a_bottom = a.y + a.height

	local b_left = b.x
	local b_right = b.x + b.width
	local b_top = b.y
	local b_bottom = b.y + b.height

	-- if a_right > b_left		--If Red's right side is further to the right than Blue's left side.
	-- and a_left < b_right	--and Red's left side is further to the left than Blue's right side.
	-- and a_bottom > b_top	--and Red's bottom side is further to the bottom than Blue's top side.
	-- and a_top > b_bottom then	--and Red's top side is further to the top than Blue's bottom side then..		return true
	-- else
	-- 	return false
	-- end

	return a_right > b_left
		and a_left < b_right
		and a_bottom > b_top
		and a_top < b_bottom

end
