local enemy = require("enemy")
local globalFunctions = require("globalFunctions")

local player = {}

function player:load()
    self.img = love.graphics.newImage("images/playerpx.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 400
    self.x = love.graphics.getWidth()/2
    self.y = love.graphics.getHeight() - self.height*1.1
    self.blinkTime = 0
    self.hits = 0
    self.dead = false
    self.rotation = 1
    self.health = 1
end

function player:update(dt)
    self:move(dt)
    self:limit()
    self:checkforDead()
    self:checkIfColide()
end

function player:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, self.rotation, 1, self.width/2, 0)
end

function player: move(dt) 
    if love.keyboard.isDown("a") then 
        self.x =  self.x - self.speed*dt
        self.rotation = -1
    end
    if love.keyboard.isDown("d") then
        self.x =  self.x + self.speed*dt
        self.rotation = 1
    end
end

function player:limit() 
    if self.x <= self.width/2 then 
        self.x = self.width/2 
    end
    if self.y <= 0 then
        self.y = 0 
    end
    if self.x + self.width/2 >= love.graphics.getWidth() then 
        self.x = love.graphics.getWidth() - self.width/2 
    end
end

function player:checkIfColide()
    for a,b in pairs(enemy.arrayEnemy) do
        if globalFunctions.checkColision(b, player) then
                self.health = self.health - 1
        end
    end
end

function player:blinkDead(dt)
    self.img = love.graphics.newImage("images/playerdeadpx.png")
end

function player:checkforDead()
    if self.health <= 0 then
        self.health = 0
        self.dead = true
        self:blinkDead()
    end
end

function player:reset()
    self.hits = 0
    self.dead = false
    self.health = 1
    self.x = love.graphics.getWidth()/2
    self.y = love.graphics.getHeight() - self.height*1.1
end
   
return player