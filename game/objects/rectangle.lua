--! file: rectangle.lua

local Shape = require "objects.shape"

-- Pass Object as first argument.
-- Rectangle = Object.extend(Object) -- this code makes "Rectangle" a class
-- Rectangle = Object:extend() -- this is the same as Rectangle = Object.extend(Object)
local Rectangle = Shape:extend() -- a subclass of "Shape" 

--function Rectangle.new(self) --executed when called, "constructor"
function Rectangle:new(x, y, width, height) -- the same as Rectangle.new(self)
	-- self.test = math.random (1,1000) --the "self" property represents the instance
	Rectangle.super.new(self, x, y) -- super allows rectangle to call the new function from the base class of shape
	self.width = width
	self.height = height
end

-- --function Rectangle.update(self, dt)	
-- function Rectangle:update(dt) -- same as Rectangle.update(self, dt)... ":" is passing the object left as the first argument
-- 	self.x = self.x + self.speed * dt
-- end

function Rectangle:draw()
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

return Rectangle
