module(..., package.seeall)





function new(Player)
    
	local sf = display.newImage("kalacool/sango/image/UI/sf.png",1230,600)
	
	
	
	


	
	function sf:touch( event )
	    if event.phase == "began" then

	    	if(Player.isFloat == false)then
	    		Player.superfloat()
	    		
	    	
	    	elseif(Player.isFloat == true)then
	    		Player.unSuperfloat()
	    		
	    		--print( "gggg" )
	    	end

	    end
	    return true
	end 
	sf:addEventListener( "touch",sf)	
	return sf
end