--Classes/Objects/World.lua

module(..., package.seeall)

local scene = scene
local ObjectClass = require('kalacool.sango.Classes.Object')


--INSTANCE FUNCTIONS
function new()

	World = ObjectClass.new()
				
	return World
end


