local sceneManager = require("sceneManager")
local music = require("music")
local background = require("background")
local font = require("font")
local globalFunctions = require("globalFunctions")
main = {}

function love.load()
    sceneManager:load()
    music:load()
    background:load()
    font:load()
    globalFunctions:load()
end

function love.update(dt)
    sceneManager:update(dt)
end

function love.draw()
    sceneManager:draw()
end

function love.keypressed(key)
    sceneManager:keypressed(key)
end
