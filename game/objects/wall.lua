--! file:player.lua

Wall = Entity:extend()

function Wall:new(x, y)
	Wall.super.new(self, x, y, "assets/wall.png")
	self.strength = 100
	self.weight = 0
end
