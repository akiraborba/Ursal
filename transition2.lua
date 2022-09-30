local background = require("background")
local font = require("font")
local globalFunctions = require("globalFunctions")
local music = require("music")

local transition2 = {}

function transition2:load()
    self.endGame = false
end

function transition2:update(dt)
end

function transition2:draw()
    music:playBackground()
    background:drawTransition()
    self:text()
    self:text2()
    self:pressText()
end

function transition2:keypressed(key)
    self:checkKey(key)
end

function transition2:text()
    local titleFont = font.new(35)
    local text = "Monstronaro foi derrotado!"
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, 20, love.graphics.getHeight()/4, 500, "center")
    love.graphics.setColor(0.8, 0.7, 0.1)
    love.graphics.printf(text, 24, love.graphics.getHeight()/4, 500, "center")
    love.graphics.setColor(1, 1, 1)
end

function transition2:text2()
    local titleFont = font.new(35)
    local text = "O mundo foi libertado do Baixo Astral gracas a Ursal"
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, 20, love.graphics.getHeight()/2, 500, "center")
    love.graphics.setColor(0.9, 0.8, 0.1)
    love.graphics.printf(text, 24, love.graphics.getHeight()/2, 500, "center")
    love.graphics.setColor(1, 1, 1)
end

function transition2:pressText()
    local titleFont = font.new(30)
    local text = "Pressione qualquer tecla"
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, 0, love.graphics.getHeight()*0.8, 540, "center")
    love.graphics.setColor(1, 1, 0.9)
    love.graphics.printf(text, 5, love.graphics.getHeight()*0.8, 540, "center")
    love.graphics.setColor(1, 1, 1)
    font:reset()
end

function transition2:checkKey(key)
    if key then
        self.endGame = true
    end
end

return transition2