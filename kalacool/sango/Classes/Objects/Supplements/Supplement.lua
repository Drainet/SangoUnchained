module(..., package.seeall)


ObjectClass =  require('kalacool.sango.Classes.Object')
function new()
	local Supplements = ObjectClass.new()
	local scene = scene

	Supplements.image = display.newGroup( )
	Supplements.Filter = { categoryBits = 1, maskBits = 2 } 


	return Supplements
end