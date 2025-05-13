local gfx <const> = playdate.graphics

class("Ship").extends(gfx.sprite)


local imageSpriteShip = gfx.image.new("assets/ship")

local velocity = 0

function Ship:init()
    Ship.super.init(self, imageSpriteShip)

    self:moveTo(300,160)

    velocity = 0


end

function Ship:update()
    Ship.super:update(self)

    local crankPosition = playdate.getCrankPosition()
    local crankPositionRadians = math.rad(crankPosition)
    self:setRotation(crankPosition)

    if playdate.buttonIsPressed(playdate.kButtonA) then
        velocity = 5
    else
        velocity = 0

    end

    local vX, vY = velocity * math.cos(crankPositionRadians), velocity * math.sin(crankPositionRadians)

    self:moveBy(vX,vY)

    if self.x < -10 then
        self:moveTo(410, self.y)
    elseif self.x > 410 then
        self:moveTo(-10, self.y)
    end

    if self.y < -10 then
        self:moveTo(self.x, 250)
    elseif self.y > 250 then
        self:moveTo(self.x, -10)
    end

end