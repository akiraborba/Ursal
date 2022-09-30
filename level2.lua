local globalFunctions = require("globalFunctions")
local enemy = require("enemy")
local shot = require("shot")
local player = require("player")
local gui = require("gui")
local music = require("music")
local font = require("font")
local background = require("background")

local level2 = {}

function level2:load()
    enemy:load()
    shot:load()
    player:load()
    self.timer = 0
    self.configs = {}
    self.configs.maxEnemy = 10
    self.configs.goalEnemy = 100
    self.levelopened = false
end

function level2:update(dt)
    self.timer = self.timer + dt
    if (not globalFunctions.gameOver.state) and (not globalFunctions.gameWin.state) and self.timer > 1 then
        player:update(dt)
        shot.updateAll(dt)
        enemy.updateAll(dt)
        self:checkForWin()
        self:checkForGameOver()
    end
end

function level2:draw()
    background:draw(2, 0.6, 0.4, 0.6)
    globalFunctions:draw()
    if not self.levelopened then
        music:stopBackground()
        music:openlevel()
        self.levelopened = true
    end
    if self.timer <= 1 then
        self:welcomeMessage()
    end
    if self.timer > 1 then
        music:playBackground()
        player:draw()
        enemy.drawAll()
        shot.drawAll()
        gui:draw()
    end
end

function level2:keypressed(key)
    if (not globalFunctions.gameOver.state) and (not globalFunctions.gameWin.state) and self.timer > 1 then
        shot:keypressed(key, player)
    end
end

function level2:checkToCreateEnemy()
    if #enemy.arrayEnemy < self.configs.maxEnemy then
        enemy:newLevel2()
        else
    end
end

function level2:checkForWin()
    if player.hits >= self.configs.goalEnemy then
        globalFunctions.gameWin.state = true
        enemy.removeAll()
        shot.removeAll()
        player:reset()
    else
        self:checkToCreateEnemy()
    end
end

function level2:checkForGameOver()
    if player.dead or enemy.checkAllIfPassed() then
        globalFunctions.gameOver.state = true
        player:blinkDead()
        enemy.removeAll()
        shot.removeAll()
    end
end

function level2:welcomeMessage()
    font.new(40)
    local text = "Level 1"
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, 20, love.graphics.getHeight()/3, 500, "center")
    love.graphics.setColor(0.7, 0.7, 0.7)
    love.graphics.printf(text, 24, love.graphics.getHeight()/3, 500, "center")
    love.graphics.setColor(1, 1, 1)
    font.new(55)
    local text = "URSAL\nvs\nGuedes"
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, 20, love.graphics.getHeight()/2 - 50, 500, "center")
    love.graphics.setColor(0.9, 0.6, 0.2)
    love.graphics.printf(text, 24, love.graphics.getHeight()/2 - 50, 500, "center")
    love.graphics.setColor(1, 1, 1)
    font:reset()
    music:openlevel()
end


return level2