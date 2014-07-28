module(..., package.seeall)

ObjectClass = require('kalacool.sango.Classes.Object')



function new(time , image)
	local buffHUD = ObjectClass.new() 
	buffHUD.image = display.newGroup( )
	local self = display.newImage(image)
	local myText = display.newText(time, 40, 200 + dog.buffNum*80 , native.systemFont, 60)
	myText:setFillColor(0, 255, 0 )
	--buffHUD.image = buffImage
	self.x=60
	self.y=230+ dog.buffNum*80
	--HUD:insert(self)
	--HUD:insert(myText)
	buffHUD.image:insert(self)
	buffHUD.image:insert(myText)
	
	dog.buffNum = dog.buffNum+1
	

	function buffHUD.timeout(event)
		myText.text = time-event.count
		dog.image.shootFasterBuffTime = dog.image.shootFasterBuffTime -1
		print(  time-event.count )
		if(event.count==time)then
			display.remove(self)
			display.remove(myText)
			self=nil
			dog.buffNum = dog.buffNum-1
		end		
	end
	buffHUD.timer = timer.performWithDelay( 1000, buffHUD.timeout , time )
	buffHUD.timers[1] = buffHUD.timer
--[[
	function buffHUD.dispose()
		timer.cancel( buffHUD.timer )
		display.remove(buffHUD.image)
		buffHUD.image = nil
		dog.buffNum = dog.buffNum-1		
	end
]]--
	return buffHUD
end

