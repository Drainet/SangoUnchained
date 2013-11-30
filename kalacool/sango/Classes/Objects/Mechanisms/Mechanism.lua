module(..., package.seeall)


ObjectClass =  require('kalacool.sango.Classes.Object')
function new()
	local Mechanism = ObjectClass.new()
	local scene = scene

	Mechanism.image = display.newGroup( )
	Mechanism.Filter = { categoryBits = 16 , maskBits = 11} 
	Mechanism.key = nil
	
	function Mechanism:active()
	end

	 -- send the target's position to ALL receivers to check
	function Mechanism:sendActiveSignal()
		scene:dispatchEvent( {name='getActiveSignal', key = Mechanism.key})
	end
	 -- receive active signal ,if signal is match then active self
	function Mechanism:getActiveSignal(event)
		if(Mechanism.image.type == "receiver" and Mechanism.key==event.key) then
			Mechanism:active()
		end
	end

	function Mechanism.onCollsion(slef , event)
		if(Mechanism.image.type=="trigger" and event.other.type == "player") then
			if(Mechanism.isActive == false) then
				Mechanism:sendActiveSignal()
				Mechanism:active()
				Mechanism.isActive = true
			end
		end
			
	end

	function Mechanism:removeAllEvent()
		Mechanism.dispose()
		if(Mechanism.timerID ~= nil) then
			timer.cancel( Mechanism.timerID )
		end
	end

	Mechanism.collision = Mechanism.onCollsion
 	Mechanism.image:addEventListener( "collision" , Mechanism )
	scene:addEventListener( 'removeAllEvent', Mechanism)
	scene:addEventListener( 'getActiveSignal', Mechanism)
	Mechanism.listeners[1] = {event='removeAllEvent', listener = Mechanism}
	Mechanism.listeners[2] = {event='getActiveSignal', listener = Mechanism}
	Mechanism.listeners[3] = {event="collision", listener = Mechanism}
	return Mechanism
end