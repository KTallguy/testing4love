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

end


function love.draw()
	player:draw()
	enemy:draw()

	for i,v in ipairs(listOfBullets) do
		v:draw()
	end

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
