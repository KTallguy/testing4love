-- -- file:bullet.lua
-- Paired with player_panda.lua & enemy_snake.lua, was for the shooting bullets tutorial game


-- Bullet = Object:extend()

-- function Bullet:new(x, y)
-- 	self.image = love.graphics.newImage("assets/bullet.png")
-- 	self.x = x
-- 	self.y = y
-- 	self.speed = 700
-- 	self.width = self.image:getWidth()
-- 	self.height = self.image:getHeight()
-- end

-- function Bullet:checkCollision(obj)
-- 	local self_left = self.x
-- 	local self_right = self.x + self.width
-- 	local self_top = self.y
-- 	local self_bottom = self.y + self.height

-- 	local obj_left = obj.x
-- 	local obj_right = obj.x + obj.width
-- 	local obj_top = obj.y
-- 	local obj_bottom = obj.y + obj.height

-- 	if self_right > obj_left
-- 	and self_left < obj_right
-- 	and self_bottom > obj_top
-- 	and self_top < obj_bottom then
-- 		self.dead = true
-- 		--Increase enemy speed
-- 		if obj.speed > 0 then
-- 			obj.speed = obj.speed + 50
-- 		else
-- 			obj.speed = obj.speed - 50		
-- 		end
-- 	end

-- end


-- function Bullet:update(dt)
-- 	self.y = self.y + self.speed * dt

-- 	-- if bullet is out of screen restart game
-- 	if self.y > love.graphics.getHeight() then
-- 		love.load()
-- 	end
-- end

-- function Bullet:draw()
-- 	love.graphics.draw(self.image, self.x, self.y)
-- end
