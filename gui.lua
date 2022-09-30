local player = require("player")
local gui = {}

function gui:draw()
    self:counter()
end

function gui:counter()
    love.graphics.setColor(0.2,1,0.6)
    love.graphics.rectangle("fill", 20, 20, (player.hits/100)*130, 30)
    love.graphics.setColor(0.9,0.9, 0.9)
    love.graphics.setLineWidth(4)
    love.graphics.rectangle("line", 20, 20, 130, 30)
end

return gui