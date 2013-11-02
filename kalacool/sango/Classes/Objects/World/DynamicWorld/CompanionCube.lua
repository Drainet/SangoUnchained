--Classes/Objects/World/StaticWorld/CompanionCube.lua

module(..., package.seeall)

local scene = scene
DynamicWorldClass = require('kalacool.sango.Classes.Objects.World.DynamicWorld')

--INSTANCE FUNCTIONS
function new(config)

    local CompanionCube = DynamicWorldClass.new()
    CompanionCube.setImage('kalacool/sango/image/world/dynamicWorld/companionCube.png')
    CompanionCube.show(config)
    physics.addBody( CompanionCube.image, "dynamic", { density=30, friction=0.2, bounce=0.99} )

    return CompanionCube
end