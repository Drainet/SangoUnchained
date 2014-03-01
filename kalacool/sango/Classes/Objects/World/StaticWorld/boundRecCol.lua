--Classes/Objects/World/StaticWorld/boundRec.lua

module(..., package.seeall)

local scene = scene
local StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')

--INSTANCE FUNCTIONS
function new(config)

    local boundRec = StaticWorldClass.new()
    boundRec.image = display.newRect( 0, 0, 20, 3250 )
    boundRec.image.damage = "fatal"

    boundRec.show(config)
    physics.addBody( boundRec.image , "static", { density = 1.0, friction = 0.1, bounce = 0.2 } )
    


    return boundRec
end