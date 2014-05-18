module(..., package.seeall)





function new(max)

	local overheat = {}

	overheat.image = display.newGroup( )

	overheat.rect = display.newRect( 50, 200, max, 30 )
	overheat.back = display.newRect( 50, 200, max, 30 )
	overheat.back:setFillColor( 0.5 )
	overheat.rect:setFillColor( 255,0,0 )
	overheat.rect.anchorX = 0
	overheat.back.anchorX = 0
	overheat.max = max
	overheat.value = 0

	
	overheat.image:insert( overheat.back )
	overheat.image:insert( overheat.rect )

	overheat.lock = false

	function overheat.show()
		overheat.rect.width = overheat.value
	end
	overheat.show()
	function overheat.upgrade()
		if(overheat.value>0)then
			overheat.value = overheat.value-1
			overheat.show()
			if(overheat.value<overheat.max-10)then
				overheat.lock = false
			end
		
		end

	end
	function overheat.addheat()
		if(overheat.value<overheat.max)then
			overheat.value = overheat.value+10
			overheat.show()
		else
			overheat.lock = true
		end
	end
	return overheat
end