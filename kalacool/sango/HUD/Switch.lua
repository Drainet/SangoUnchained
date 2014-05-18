module(..., package.seeall)





function new(Player)
    
	local switch = display.newImage("kalacool/sango/image/UI/switch.png",display.contentWidth-50,display.contentHeight-55)
	switch.alpha = 0.6
	
	switch.state = 1
	switch:scale( 1.3, 1.3)
	


	
	function switch:touch( event )
	    if event.phase == "began" then
	    	AS.Play_switch()
	    	
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
	    return true
	end 
	switch:addEventListener( "touch",switch)	
	return switch
end