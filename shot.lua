local music = require("music")
local player = require("player")
local enemy = require("enemy")
local globalFunctions = require("globalFunctions")


local shot = {}
shot.__index = shot

function shot:load()
    self.img = love.graphics.newImage("images/shotpx.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 500
    self.arrayShot = {}
end

function shot:new(player)
    local instance = setmetatable({}, shot)
    instance.x = player.x
    instance.y = player.y
    instance.img = self.img
    instance.width = self.width
    instance.height = self.height
    instance.speed = self.speed
    instance.rotation = 0
    instance.toBeRemoved = false
    instance.damage = 1
    table.insert(self.arrayShot, instance)
end

function shot.updateAll(dt)
    shot.moveAll(dt)
    shot.checkForRemove()
    shot.checkIfHit()
    shot.rotateAll(dt)
end

function shot:draw()
    love.graphics.draw(self.img, self.x, self.y, self.rotation, 1, 1, self.width/2, self.height/2)
end

function shot:keypressed(key, player)
    self:shoot(player, key)
end

function shot.drawAll()
    for k, v in pairs(shot.arrayShot) do
        v:draw()
    end
end

function shot:shoot(player, key)
    if key == "l" then
        self:new(player)
        music:shot()
    end
end

function shot:move(dt)
    self.y = self.y - self.speed*dt
end

function shot.moveAll(dt)
    for k, v in pairs(shot.arrayShot) do
        v:move(dt)
    end
end

function shot:rotate(dt)
    self.rotation = self.rotation + 6*dt
end

function shot.rotateAll(dt)
    for k,v in pairs(shot.arrayShot) do
        v:rotate(dt)
    end
end

function shot:checkPassedHeight()
    if self.y > love.graphics.getHeight() then self.toBeRemoved = true
    end
end

function shot.checkIfHit()
    for a,b in pairs(enemy.arrayEnemy) do
        for c, d in pairs(shot.arrayShot)do
            if globalFunctions.checkColision(b,d) then
                d.toBeRemoved = true
                b:takeDamage(d.damage)
                player.hits = player.hits + 1
            end
        end
    end
end

function shot:remove()
    for k, v in pairs(shot.arrayShot) do
        if v == self then
            table.remove(shot.arrayShot, k)
        end
    end
end

function shot.removeAll()
    shot.arrayShot = {}
end

function shot.checkForRemove()
    for k,v in pairs(shot.arrayShot) do
        if v.toBeRemoved == true then
            v:remove()
        end
    end
end

return shot

