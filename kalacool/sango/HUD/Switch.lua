module(..., package.seeall)





function new(Player)
    
	local switch = display.newImage("kalacool/sango/image/UI/switch.png",300,30)
	
	switch.state = 1
    
	
	


	
	function switch:touch( event )
	    if event.phase == "began" then

	    	
	    	Player.pack[switch.state].nowNum=Player.Weapon.magazine.ammo
	    	

	        if(switch.state == 1)then
	        	switch.state = 2
	        else
	        	switch.state = 1
	        end
	        --scene:dispatchEvent( {name='onSwitchTouch'} )
	        Player.pack[switch.state].isonAir=Player.Weapon.magazine.isonAir
	        Player.setgun()
	    end
	    
	end 
	switch:addEventListener( "touch",switch)	
	return switch
end