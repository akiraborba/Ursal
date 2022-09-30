local background = require("background")
local font = require("font")
local globalFunctions = require("globalFunctions")
local music = require("music")

local transition1 = {}

function transition1:load()
end

function transition1:update(dt)
end

function transition1:draw()
    music:playBackground()
    background:drawTransition()
    self:text()
    self:text2()
    self:pressText()
end

function transition1:keypressed(key)
    self:checkKey(key)
end

function transition1:text()
    local titleFont = font.new(35)
    local text = "O Baixo Astral de Monstronaro e seus capangas esta contaminando mundo. A URSAL precisa agir em defesa do mundo!"
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, 20, love.graphics.getHeight()/4, 500, "center")
    love.graphics.setColor(0.8, 0.7, 0.1)
    love.graphics.printf(text, 24, love.graphics.getHeight()/4, 500, "center")
    love.graphics.setColor(1, 1, 1)
end

function transition1:text2()
    local titleFont = font.new(35)
    local text = "Pressione A e D para ir para esquerda e direita, e L para atirar"
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, 20, love.graphics.getHeight()/2, 500, "center")
    love.graphics.setColor(0.9, 0.8, 0.1)
    love.graphics.printf(text, 24, love.graphics.getHeight()/2, 500, "center")
    love.graphics.setColor(1, 1, 1)
end

function transition1:pressText()
    local titleFont = font.new(30)
    local text = "Pressione qualquer tecla para iniciar"
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, 0, love.graphics.getHeight()*0.8, 540, "center")
    love.graphics.setColor(1, 1, 0.9)
    love.graphics.printf(text, 5, love.graphics.getHeight()*0.8, 540, "center")
    love.graphics.setColor(1, 1, 1)
    font:reset()
end

function transition1:checkKey(key)
    if key then
        globalFunctions:loadNextScene()
        music:transition()
    end
end

return transition1