module(..., package.seeall)





function new(value)
    
	local power =  {}
	power.image = display.newGroup( )
	power.value = value
	power.UI =  display.newImage( "kalacool/sango/image/UI/power.png",70,220 )
	power.mtext = display.newText( tostring(power.value) , 150, 220, native.systemFont, 40 )
	--power.max = HP
	power.image:insert( power.UI )
    power.image:insert( power.mtext )
	
	-- function power.heal()
	
	-- 	if(power.num < power.max)then
		
	-- 		power.num = power.num + 1
	-- 		display.remove(power[power.num])
	-- 		power[power.num] = display.newImage("kalacool/sango/image/UI/power.png",60*(power.num)-20,130)
	-- 		power.image:insert(power[power.num])
		
	-- 	end
		
	-- end
	function power.reduce( cost )
	
		power.value = power.value - cost
		power.mtext.text = tostring(power.value)
	end
	

 --    function power.full()
	-- 	for i = power.num,power.max do
	-- 		power.heal()
 --    	end

	-- end
	-- power.full()

	-- function power.hurt()

		

	-- 	if(power.num > 0)then
		
			
	-- 		display.remove(power[power.num])
	-- 		power[power.num]=display.newImage("kalacool/sango/image/UI/blackpower.png",60*(power.num)-20,130)
 --        	power.image:insert(power[power.num]) 
	-- 		power.num = power.num - 1
			
	-- 	end
		
	-- end

	-- function power.zero()
	-- 	for i=power.num,1,-1 do

	-- 		power.hurt()
			
 --    	end

	-- end



	
		
	return power

end