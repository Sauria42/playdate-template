import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/graphics"

import "sprites"
import "menu"

local gfx <const> = playdate.graphics
local sprite <const> = gfx.sprite

local ship = Ship()

local function init()
    ship:add()
    showMenu()
end

function playdate.update()
    sprite.update()
    if playdate.buttonJustPressed(playdate.kButtonA) then
        hideMenu()
    end
end

init()