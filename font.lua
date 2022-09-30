local font = {}

function font:load()
    self.arrayFont = {}
    self.mainFont = love.graphics.newFont("/fonts/gameFont.ttf", 40)
    love.graphics.setFont(self.mainFont)
end

function font.new(size, font)
    if font then
        local newFont = love.graphics.newFont(font, size)
        love.graphics.setFont(newFont)
    else
        local newFont = love.graphics.newFont("/fonts/gameFont.ttf", size)
        love.graphics.setFont(newFont)
    end
end

function font:reset()
    love.graphics.setFont(self.mainFont)
end

return font