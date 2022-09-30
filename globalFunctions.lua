local music = require("music")
local globalFunctions = {}

function globalFunctions:load()
    self.gameOver = {}
    self.gameOver.state = false
    self.gameOver.img = love.graphics.newImage("images/gameOver.png")
    self.gameOver.width = self.gameOver.img:getWidth()
    self.gameOver.height = self.gameOver.img:getHeight()
    self.gameWin = {}
    self.gameWin.state = false
    self.gameWin.img = love.graphics.newImage("images/win.png")
    self.gameWin.width = self.gameWin.img:getWidth()
    self.gameWin.height = self.gameWin.img:getHeight()
    self.gameWin.blinkTime = 0
    self.endmusic = false
    self.nextScene = 0
    self.winCanvas = love.graphics.newCanvas()
end

function globalFunctions:update(dt)
end

function globalFunctions:draw()
    if self.gameOver.state == true then
        self:newGameOver()
    end
    if self.gameWin.state == true then
        self:newGameWin()
    end
end

function globalFunctions:newGameOver()
    love.graphics.draw(self.gameOver.img, love.graphics.getWidth()/2 - self.gameOver.width/2, love.graphics.getHeight()/2 - self.gameOver.height/2)
    music:stopBackground()
    if not self.endmusic then
        music:lost()
        self.endmusic = true
    end
end

function globalFunctions:newGameWin()
    self.winCanvas:renderTo(
        function()
            love.graphics.draw(
                self.gameWin.img,
                love.graphics.getWidth()/2 - self.gameWin.width/2,
                love.graphics.getHeight()/2 - self.gameWin.height/2
            )
        end
    )
    love.graphics.draw(self.winCanvas)
    music:stopBackground()
    if not self.endmusic then
        music:won()
        self.endmusic = true
    end
end


function globalFunctions:blink(dt)
    self.gameWin.blinkTime = self.gameWin.blinkTime + 0.05*dt
    if self.gameWin.blinkTime < 0.008 then
        self.gameWin.img = love.graphics.newImage("images/win.png")
    else
        self.gameWin.img = love.graphics.newImage("images/win2.png")
        if self.gameWin.blinkTime > 0.016 then self.gameWin.blinkTime = 0
        end
    end
end

function globalFunctions.checkColision(a, b) 
    local colision = {}
    colision.left = b.x < a.x + a.width 
    colision.right = b.x + b.width > a.x
    colision.up = b.y < a.y + a.height
    colision.down = b.y + b.height > a.y
    result = colision.left and colision.right and colision.up and colision.down
    return result
end

function globalFunctions:loadScene(sceneNumber)
    self.nextScene = sceneNumber
end

function globalFunctions:loadNextScene()
    self.nextScene = self.nextScene + 1
end

function globalFunctions:reset()
    self.endmusic = false
    self.gameWin.state = false
    self.gameOver.state = false
    self.winCanvas:renderTo(function() love.graphics.clear() end)
end

return globalFunctions