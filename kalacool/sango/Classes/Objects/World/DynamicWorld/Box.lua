--Classes/Objects/World/StaticWorld/Box.lua

module(..., package.seeall)

local scene = scene
DynamicWorldClass = require('kalacool.sango.Classes.Objects.World.DynamicWorld')

--INSTANCE FUNCTIONS
function new(config)

    local Box = DynamicWorldClass.new()
    Box.setImage(_World.DynamicWorld.Box.ImagePath)
    Box.image.damage = _World.DynamicWorld.Box.Damage
    
    Box.image.surface = _World.DynamicWorld.Box.Surface
    Box.show(config)
    physics.addBody( Box.image, _World.DynamicWorld.Box.Physic.Type, _World.DynamicWorld.Box.Physic.Option )

    function Box.image:collision(event )
    	if ( event.phase == "began" ) then
			if( event.other.damage=="fatal" ) then
				Box.dispose()
			end
		end
	end

	Box.image:addEventListener( "collision")

    return Box
end