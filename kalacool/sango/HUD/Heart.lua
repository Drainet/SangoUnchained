module(..., package.seeall)





function new(HP)
    
	local Heart =  {}
	Heart.image = display.newGroup( )
	Heart.num = 0
	Heart.max = HP
	
    
	
	function Heart.heal()
	
		if(Heart.num < Heart.max)then
		
			Heart.num = Heart.num + 1
			display.remove(Heart[Heart.num])
			Heart[Heart.num] = display.newImage("kalacool/sango/image/UI/heart.png",60*(Heart.num)-40,110)
			Heart.image:insert(Heart[Heart.num])
		
		end
		
	end
	
	

    function Heart.full()
		for i = Heart.num,Heart.max do
			Heart.heal()
    	end

	end
	Heart.full()

	function Heart.hurt()

		

		if(Heart.num > 0)then
		
			
			display.remove(Heart[Heart.num])
			Heart[Heart.num]=display.newImage("kalacool/sango/image/UI/blackheart.png",60*(Heart.num)-40,110)
        	Heart.image:insert(Heart[Heart.num]) 
			Heart.num = Heart.num - 1
			
		end
		
	end

	function Heart.zero()
		for i=Heart.num,1,-1 do

			Heart.hurt()
			
    	end

	end



	
		
	return Heart

end