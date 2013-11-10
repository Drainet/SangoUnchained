--Classes/Objects/World/InteractiveWorld.lua

module(..., package.seeall)

local scene = scene
local WorldClass = require('kalacool.sango.Classes.Objects.World')

--INSTANCE FUNCTIONS
function new()

    InteractiveWorld = WorldClass.new()

    return InteractiveWorld
end