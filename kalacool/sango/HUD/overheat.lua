module(..., package.seeall)

function new()

	local overheat = {}

	overheat.image = display.newGroup( )

	overheat.rect = display.newImage( "kalacool/sango/image/UI/overheat.png", 1030, 50 )
	overheat.back = display.newImage( "kalacool/sango/image/UI/overheat.png", 1030, 50 )
	overheat.rect:scale( 0.6, 0.6 )
	overheat.back:scale( 0.6, 0.6 )
	overheat.rect.alpha = 0.8
	overheat.back.alpha = 0.8
	overheat.rect:setFillColor( 1,0,0 )
	overheat.rect.anchorX = 0
	overheat.back.anchorX = 0
	overheat.max = 200
	overheat.value = 0
	overheat.cost = 0

	local mask = graphics.newMask( "kalacool/sango/image/UI/maskframe.png" )
	overheat.rect:setMask( mask )
	
	overheat.image:insert( overheat.back )
	overheat.image:insert( overheat.rect )

	overheat.lock = false

	function overheat.show()
		--overheat.rect.width = overheat.value
		overheat.rect.maskX = overheat.value-200
	end
	overheat.show()
	function overheat.upgrade()
		if(overheat.value>0)then
			overheat.value = overheat.value-1
			overheat.show()
			if(overheat.value<overheat.max-15)then
				overheat.lock = false
			end
		end
	end
	function overheat.addheat()
		if(overheat.value<overheat.max)then
			overheat.value = overheat.value+overheat.cost
			overheat.show()
		else
			overheat.lock = true
		end
	end
	function overheat.setcost(cost)
		 overheat.cost = cost
	end
	return overheat
end