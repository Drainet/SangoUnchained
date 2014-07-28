--Classes/Objects/World/StaticWorld.lua

module(..., package.seeall)

local scene = scene
WorldClass = require('kalacool.sango.Classes.Objects.World')


--INSTANCE FUNCTIONS
function new()

	StaticWorld = WorldClass.new()
    
				
	return StaticWorld
end