--Classes/Objects/World/StaticWorld/CompanionCube.lua

module(..., package.seeall)

local scene = scene
DynamicWorldClass = require('kalacool.sango.Classes.Objects.World.DynamicWorld')

--INSTANCE FUNCTIONS
function new(config)

    local CompanionCube = DynamicWorldClass.new()
    CompanionCube.setImage('kalacool/sango/image/world/dynamicWorld/companionCube.png')
    CompanionCube.image.damage = "safe"
    CompanionCube.image.surface = "smooth"
    CompanionCube.show(config)
    physics.addBody( CompanionCube.image, "dynamic", { density=10, friction=0.7, bounce=0.5} )
    CompanionCube.image.isFixedRotation = true
    

    return CompanionCube
end