--Classes/Objects/World/StaticWorld/Thorn.lua



module(..., package.seeall)

local scene = scene
local StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')


--INSTANCE FUNCTIONS
function new(config)

    local Thorn = StaticWorldClass.new()
    Thorn.setImage(_World.StaticWorld.Thorn.ImagePath)
    Thorn.image.damage = _World.StaticWorld.Thorn.Damage

    Thorn.show(config)
    Shape = {-47,61,-39,-61,37,-66,47,65}
    physics.addBody( Thorn.image, _World.StaticWorld.Thorn.Physic.Type, _World.StaticWorld.Thorn.Physic.Option )


    return Thorn
end