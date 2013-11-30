module(..., package.seeall)





function new(time , image)

	local self = display.newImage(image)
	local myText = display.newText(time, 40, 200 + dog.buffNum*80 , native.systemFont, 60)
	myText:setTextColor(0, 255, 0 )
	
	self.x=60
	self.y=230+ dog.buffNum*80
	HUD:insert(self)
	HUD:insert(myText)

	dog.buffNum = dog.buffNum+1

	function timeout(event)
		myText.text = time-event.count
		print(  time-event.count )
		if(event.count==time)then
			display.remove(self)
			display.remove(myText)
			self=nil
			dog.buffNum = dog.buffNum-1
		end
		
	end
	timer.performWithDelay( 1000, timeout , time )

end