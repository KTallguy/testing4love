function love.load()
end


function sayNumber(num)
	Output = "I like the number " .. num
	return Output
end

function love.update()

end

function love.draw()
	love.graphics.print(sayNumber(5234123), 100,100)
end
