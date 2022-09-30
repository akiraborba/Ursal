local music = {}

function music:load()
    love.audio.setVolume(0.4)
    self.background = love.audio.newSource("sounds/background.wav","static")
    self.gameOver = love.audio.newSource("sounds/lost.wav", "static")
    self.shotmusic = love.audio.newSource("sounds/shot.wav", "static")
    self.winner = love.audio.newSource("sounds/won.wav", "static")
    self.transit = love.audio.newSource("sounds/transition.wav", "static")
    self.levelopen = love.audio.newSource("sounds/levelopen.wav", "static")
    self.backgroundPlaying = false
end

function music:lost()
    self.background:stop()
    self.gameOver:play()
end

function music:playBackground()
    if self.background:isPlaying() then 
        return
    end
    if not self.background:isPlaying() then
        self.background:play()
    end
end

function music:stopBackground()
    self.background:stop()
    self.backgroundPlaying = false
end

function music:shot()
    self.shotmusic:play()
end

function music:won()
    self.background:stop()
    self.winner:play()
    self.backgroundPlaying = false
end

function music:transition()
    self.transit:play()
end

function music:openlevel()
    self.levelopen:play()
end

return music