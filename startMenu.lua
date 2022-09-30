local background = require("background")
local font = require("font")
local globalFunctions = require("globalFunctions")
local music = require("music")

local start = {}

function start:load()
end

function start:update(dt)
end

function start:draw()
    music:playBackground()
    background:draw(0, 0.4, 0.4, 0.8)
    self.title()
    self.pressText()
end

function start:keypressed(key)
    self.checkKey(key)
end

function start.title()
    local titleFont = font.new(70)
    local text = "Ursal contra o Baixo Astral"
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, 0, love.graphics.getHeight()/4, 540, "center")
    love.graphics.setColor(1, 0.8, 0.9)
    love.graphics.printf(text, 5, love.graphics.getHeight()/4, 540, "center")
    love.graphics.setColor(1, 1, 1)
end

function start.pressText()
    local titleFont = font.new(30)
    local text = "Pressione qualquer tecla para iniciar"
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, 0, love.graphics.getHeight()*0.4, 540, "center")
    love.graphics.setColor(1, 1, 0.9)
    love.graphics.printf(text, 5, love.graphics.getHeight()*0.4, 540, "center")
    love.graphics.setColor(1, 1, 1)
    font:reset()
end

function start.checkKey(key)
    if key then
        globalFunctions:loadNextScene()
        music:transition()
    end
end

return start