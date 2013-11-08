--Classes/Objects/World/DynamicWorld.lua

module(..., package.seeall)

local scene = scene
WorldClass = require('kalacool.sango.Classes.Objects.World')


--INSTANCE FUNCTIONS
function new()

    DynamicWorld = WorldClass.new()


    return DynamicWorld
end