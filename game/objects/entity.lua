--!file: entity.lua

Entity = Object:extend()

function Entity:new(x, y, image_path)
	self.x = x
	self.y = y
	self.image = love.graphics.newImage(image_path)
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()

	self.last = {}
	self.last.x = self.x
	self.last.y = self.y

	self.strength = 0 -- for determining which side pushes the other away
	self.tempStrength = 0 -- for passing on the strength to other entities

	-- for gravity
	self.gravity = 0
	self.weight = 400
end

function Entity:update(dt)
	-- set current pos to previous pos
	self.last.x = self.x
	self.last.y = self.y
	-- Reset the strength
	self.tempStrength = self.strength

	-- increase gravity using the weight
	self.gravity = self.gravity + self.weight * dt

	-- increase y pos
	self.y = self.y + self.gravity * dt

end

function Entity:draw()
	love.graphics.draw(self.image, self.x, self.y)
end

function Entity:checkCollision(e)
	-- e is the other entity with which we check collision with
	-- compact formula

	return self.x + self.width > e.x
	and self.x < e.x + e.width
	and self.y + self.height > e.y
	and self.y < e.y +e.height
end

function Entity:wasVerticallyAligned(e)
	-- same as checkCollision but x and width part removed
	-- using the last.y because want to know this from the prev pos
	return self.last.y < e.last.y + e.height and self.last.y + self.height > e.last.y
end

function Entity:wasHorizontallyAligned(e)
	-- same as above but removing the y and height
	return self.last.x < e.last.x + e.width and self.last.x + self.width > e.last.x
end

function Entity:resolveCollision(e)
	-- check who's strength is highest using the tempStrength
	if self.tempStrength > e.tempStrength then
		-- in order to know when to continue to check for collision, we return the value so we can use it in main.lua
		return e:resolveCollision(self)
	end

	if self:checkCollision(e) then
		-- copy the tempStrength
		self.tempStrength = e.tempStrength
		if self:wasVerticallyAligned(e) then
			-- for the horizontal collision, do a check to see if you walk through it horizontally (but could potentially jump on top of it)
			if self.x + self.width/2 < e.x + e.width/2 then
				local a = self:checkResolve(e, "right")
				local b = e:checkResolve(self, "left")
				if a and b then
					self:collide(e, "right")
				end
			else
				local a = self:checkResolve(e, "left")
				local b = e:checkResolve(self, "right")
				if a and b then
					self:collide(e, "left")
				end
			end
		elseif self:wasHorizontallyAligned(e) then
			if self.y + self.height/2 < e.y + e.height/2 then
				local a = self:checkResolve(e, "bottom")
				local b = e:checkResolve(self, "top")
				if a and b then
					self:collide(e, "bottom")
				end
			else
				local a = self:checkResolve(e, "top")
				local b = e:checkResolve(self, "bottom")
				if a and b then
					self:collide(e, "top")
				end
			end
		end
		return true --because there was collision we return true
	end
	return false --there was no collision so we return false (or no return = nil)
end

function Entity:checkResolve(e, direction)
	return true
end

function Entity:collide(e, direction)
	if direction == "right" then
		-- pushback = right side of the player - left side of wall
		local pushback = self.x + self.width - e.x
		self.x = self.x - pushback
	elseif direction == "left" then
		-- pushback = right side of the wall - left side of player
		local pushback = e.x + e.width - self.x
		self.x = self.x + pushback
	elseif direction == "bottom" then
		-- pushback = bottom side of the player - top side of wall
		local pushback = self.y + self.height - e.y
		self.y = self.y - pushback
		-- if we are touching a wall from the bottom (standing on the ground) reset gravity
		self.gravity = 0
	elseif direction == "top" then
		-- pushback = bottom side of the wall - top side of player
		local pushback = e.y + e.height - self.y
		self.y = self.y + pushback
	end
end
