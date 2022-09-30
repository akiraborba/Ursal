local startMenu = require("startMenu")
local transition1 = require("transition1")
local level1 = require("level1")
local level2 = require("level2")
local level3 = require("level3")
local level4 = require("level4")
local transition2 = require("transition2")
local globalFunctions = require("globalFunctions")

sceneManager = {}

function sceneManager:load()
    self.timer = 0
    self.scenes = {}
    self.scenes[0] = startMenu
    self.scenes[1] = transition1
    self.scenes[2] = level1
    self.scenes[3] = level2
    self.scenes[4] = level3
    self.scenes[5] = level4
    self.scenes[6] = transition2
    self:loadAll()
end

function sceneManager:update(dt)
    self:checkGameOver(dt)
    self:checkGameWin(dt)
    self:updateScene()
    self:checkEndGame()
    self.scenes[self.sceneToLoad]:update(dt)
end

function sceneManager:draw()
    self.scenes[self.sceneToLoad]:draw()
end

function sceneManager:loadAll()
    for k,v in pairs(self.scenes) do
        v:load()
    end
end

function sceneManager:keypressed(key)
    self.scenes[self.sceneToLoad]:keypressed(key)
end

function sceneManager:updateScene()
    self.sceneToLoad = globalFunctions.nextScene
end

function sceneManager:checkGameOver(dt)
    if globalFunctions.gameOver.state or transition2.endGame then
        self.timer = self.timer + dt
        if self.timer >= 3 then
            self:loadAll()
            globalFunctions.nextScene = 0
            globalFunctions:reset()
            self.timer = 0
        end
    end
end

function sceneManager:checkEndGame()
    if transition2.endGame then
            self:loadAll()
            globalFunctions.nextScene = 0
            globalFunctions:reset()
            self.timer = 0
    end
end

function sceneManager:checkGameWin(dt)
    if globalFunctions.gameWin.state then
        self.timer = self.timer + dt
        if self.timer >= 3 then
            self.timer = 0
            globalFunctions:loadNextScene()
            globalFunctions:reset()
            return
        end
    end
end

return sceneManager