module(..., package.seeall)


ObjectClass =  require('kalacool.sango.Classes.Object')
function new()
	local Supplements = ObjectClass.new()
	local scene = scene

	Supplements.image = display.newGroup( )
	Supplements.Filter = { categoryBits = 1, maskBits = 2 } 

	function Supplements.coolDown()
		Supplements.image.isBodyActive = false
		Supplements.image.alpha = 0.5
	end
	function Supplements.renew()
		Supplements.image.isBodyActive = true
		Supplements.image.alpha = 1
	end
	return Supplements
end