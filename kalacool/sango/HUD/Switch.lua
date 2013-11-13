module(..., package.seeall)





function new()
    
	local switch = display.newImage("kalacool/sango/image/UI/switch.png",400,30)
	
	switch.state = 1
    
	
	


	
	function switch:touch( event )
	    if event.phase == "began" then
	        if(switch.state == 1)then
	        	switch.state = 2
	        else
	        	switch.state = 1
	        end
	        scene:dispatchEvent( {name='onSwitchTouch'} )
	    end
	    
	end 
	switch:addEventListener( "touch",switch)	
	return switch
end