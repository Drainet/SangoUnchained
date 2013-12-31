module(..., package.seeall)

local PlayerClass  = require "kalacool.sango.Classes.Objects.Character.Player"

function new(config)
	local Cat = PlayerClass.new(config)

	function Cat.default()
		Cat.body:setSequence( "jump" )
		Cat.body:play()
		
		Cat.setgun("notegun")
		physics.addBody( Cat.image
			,{ density=40.0, friction=1, bounce=0,shape=Cat.Shape,filter=Cat.Filter} 
			,{ density=40.0, friction=1, bounce=0,shape=Cat.foot,filter=Cat.Filter} )
		Cat.image.isFixedRotation 	= true
		Cat.alive					= true
		Cat.heart.full()
	end
	
	local sheet = graphics.newImageSheet( _Player.Cat.ImagePath, _Player.Cat.ImageOption)
	
	local sequenceData = {
		{ name="normal"	, start=1, count=3, time=800 },
		{ name="jump"	, start=4, count=3, time=200 },
		{ name="dead"	, start=7, count=3, time=200 }
 
	}

    local body = display.newSprite( sheet, sequenceData )
	Cat.body = body
	
    local hang =  display.newImage(_Player.Cat.hang.ImagePath , 0, 0)
	Cat.hang = hang

    hang.xReference	= _Player.Cat.hang.xReference
    hang.yReference	= _Player.Cat.hang.yReference

    Cat.image:insert(body)
    Cat.image:insert(hang)

    Cat.Filter = { categoryBits = 2, maskBits = 1 }
	
	local shapew=38
	local shapeh=72

	Cat.Shape	= { -shapew,-shapeh, shapew,-shapeh, shapew,66, -shapew,66 }
	Cat.foot	= { -shapew+2,66, shapew-2,66, shapew-2,shapeh, -shapew+2,shapeh }
	--physics.setDrawMode( "hybrid" )
    
	hang.x 	= Cat.image.x + 27
    hang.y 	= Cat.image.y - 8
		
	body.x 	= Cat.x
    body.y 	= Cat.y
	
	Cat.image.x = config.x
	Cat.image.y = config.y

    Cat.image:addEventListener( "collision")
   	Cat.image:addEventListener( "preCollision")
   	
   	Cat.default()
	
	return Cat
end