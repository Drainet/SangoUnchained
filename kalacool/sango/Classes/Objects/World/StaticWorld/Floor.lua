--Classes/Objects/World/StaticWorld/Floor.lua



module(..., package.seeall)

local scene = scene
StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')


--INSTANCE FUNCTIONS
function new(config)

	local Floor = StaticWorldClass.new()
	Floor.setImage('kalacool/sango/image/world/staticWorld/floor.png')
	Floor.show(config)
    physics.addBody( Floor.image, "static", { density=1, friction=0.3, bounce=0} )
    
				
	return Floor
end