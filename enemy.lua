local globalFunctions = require("globalFunctions")

local enemy = {}
enemy.__index = enemy

function enemy:load()
    self.img = {}
    self.img[1] = love.graphics.newImage("images/damarespx.png")
    self.img[2] = love.graphics.newImage("images/guedespx.png")
    self.img[3] = love.graphics.newImage("images/salespx.png")
    self.img[4] = love.graphics.newImage("images/bolsopx.png")
    self.img[5] = love.graphics.newImage("images/bolsobosspx.png")
    self.passed = false
    self.arrayEnemy = {}
end

function enemy:newLevel1()
    local instance = setmetatable({}, enemy)
    instance.img =  self.img[1]
    instance.width = instance.img:getWidth()
    instance.height = instance.img:getHeight()
    instance.x =  math.random(love.graphics.getWidth() - instance.width)
    instance.y = instance.height * -1
    instance.speed = math.random(200,300)
    instance.angle = math.random(-1,1)
    instance.rotation = math.random()
    instance.health = 1
    table.insert(self.arrayEnemy, instance)
end

function enemy:newLevel2()
    local instance = setmetatable({}, enemy)
    instance.img =  self.img[2]
    instance.width = instance.img:getWidth()
    instance.height = instance.img:getHeight()
    instance.x =  math.random(love.graphics.getWidth() - instance.width)
    instance.y = instance.height * -1
    instance.speed = math.random(250,350)
    instance.angle = math.random(-1,1)
    instance.rotation = math.random()
    instance.health = 1
    table.insert(self.arrayEnemy, instance)
end

function enemy:newLevel3()
    local instance = setmetatable({}, enemy)
    instance.img =  self.img[3]
    instance.width = instance.img:getWidth()
    instance.height = instance.img:getHeight()
    instance.x =  math.random(love.graphics.getWidth() - instance.width)
    instance.y = instance.height * -1
    instance.speed = math.random(300,350)
    instance.angle = math.random(-1,1)
    instance.rotation = math.random()
    instance.health = 1
    table.insert(self.arrayEnemy, instance)
end

function enemy:newLevel4()
    local instance = setmetatable({}, enemy)
    instance.img =  self.img[4]
    instance.width = instance.img:getWidth()
    instance.height = instance.img:getHeight()
    instance.x =  math.random(love.graphics.getWidth() - instance.width)
    instance.y = instance.height * -1
    instance.speed = math.random(300,350)
    instance.angle = math.random(-1,1)
    instance.rotation = math.random()
    instance.health = 1
    table.insert(self.arrayEnemy, instance)
end

function enemy:newBoss()
    local instance = setmetatable({}, enemy)
    instance.img =  self.img[5]
    instance.width = instance.img:getWidth()
    instance.height = instance.img:getHeight()
    instance.x =  math.random(love.graphics.getWidth() - instance.width)
    instance.y = instance.height * -1
    instance.speed = math.random(300,350)
    instance.angle = math.random(-1,1)
    instance.rotation = math.random()
    instance.health = 100
    table.insert(self.arrayEnemy, instance)
end

function enemy:draw()
    love.graphics.draw(self.img, self.x, self.y, self.rotation, 1,1, self.width/2, self.height/2)
end

function enemy.drawAll()
    for k, v in pairs(enemy.arrayEnemy) do
        v:draw()
    end
end

function enemy.updateAll(dt)
    enemy.moveAll(dt)
    enemy.checkForRemove()
    enemy.checkAllIfPassed()
    enemy.rotateAll(dt)
end

function enemy:move(dt)
    self.y = self.y + self.speed*dt
    if self.x >= love.graphics.getWidth() - self.width or self.x < 0 then
        self.angle = self.angle * -1
    end
    self.x = self.x + (self.speed * self.angle * dt)
end

function enemy.moveAll(dt)
    for k, v in pairs(enemy.arrayEnemy) do
        v:move(dt)
    end
end

function enemy:rotate(dt)
    self.rotation = self.rotation + 1.3*dt
end

function enemy.rotateAll(dt)
    for k, v in pairs(enemy.arrayEnemy) do
        v:rotate(dt)
    end
end

function enemy:remove()
    for k, v in pairs(enemy.arrayEnemy) do
        if v == self then
            table.remove(enemy.arrayEnemy, k)
        end
    end
end

function enemy.removeAll()
    enemy.arrayEnemy = {}
end

function enemy.checkForRemove()
    for k,v in pairs(enemy.arrayEnemy) do
        if v.health <= 0 then
            v:remove()
        end
    end
end

function enemy:takeDamage(damage)
    self.health = self.health - damage
end

function enemy:checkIfPassed()
    if self.y + self.height >= love.graphics.getHeight() then
        enemy.passed = true
    end
end

function enemy.checkAllIfPassed()
    for k, v in pairs(enemy.arrayEnemy) do
        v:checkIfPassed()
        if v.passed then
            return true
        end
    end
end

return enemy