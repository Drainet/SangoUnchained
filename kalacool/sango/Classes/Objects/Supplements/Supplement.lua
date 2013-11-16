module(..., package.seeall)


ObjectClass =  require('kalacool.sango.Classes.Object')
function new()
	local Supplements = ObjectClass.new()
	local scene = scene

	Supplements.image = display.newGroup( )
	Supplements.Filter = { categoryBits = 8, maskBits = 2 } 

	function Supplements.coolDown()
		Supplements.image.isBodyActive = false
		Supplements.image.alpha = 0.5
	end
	function Supplements.renew()
		Supplements.image.isBodyActive = true
		Supplements.image.alpha = 1
	end

	function Supplements:removeAllEvent()
		timer.cancel(Supplements.timerRenew)
		timer.cancel(Supplements.timerCoolDown)
		Supplements.dispose()
	end

	 scene:addEventListener( 'removeAllEvent', Supplements)
	 Supplements.listeners[1] = {event='removeAllEvent', listener = Supplements}

	return Supplements
end