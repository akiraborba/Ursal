local background = {}

function background:load()
    self.img = {}
    self.img[0] = love.graphics.newImage("images/openpx.png")
    self.img[1] = love.graphics.newImage("images/dungeonpx.png")
    self.img[2] = love.graphics.newImage("images/gatepx.png")
    self.img[3] = love.graphics.newImage("images/forestpx.png")
    self.img[4] = love.graphics.newImage("images/finalpx.png")
end

function background:draw(scene, c1, c2, c3)
    love.graphics.setColor(c1, c2, c3)
    love.graphics.draw(self.img[scene], 0, 0)
    love.graphics.setColor(1,1,1)
end

function background:drawTransition()
    love.graphics.setColor(0.3, 0.3, 0.7)
    love.graphics.draw(self.img[0], 0, 0)
    love.graphics.setColor(1,1,1)
end

return background