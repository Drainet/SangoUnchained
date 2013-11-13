module(..., package.seeall)



local PlayerClass  = require "kalacool.sango.Classes.Objects.Character.Player"


function new(config)
    --create Doggy display object


    local Doggy = PlayerClass.new(config)

    Doggy.pack={"shotgun","rifle"}
    

	
	
    

	function Doggy.default()
		Doggy.body:setSequence( "jump" )
		Doggy.body:play()


		Doggy.setgun( Doggy.pack[Doggy.switch.state] )
		--Doggy.setgun("rifle")
		physics.addBody( Doggy.image
			,{ density=40.0, friction=1, bounce=0,shape=Doggy.Shape,filter=Doggy.Filter}
			,{ density=40.0, friction=1, bounce=0,shape=Doggy.foot,filter=Doggy.Filter} )
		Doggy.image.isFixedRotation = true
		Doggy.alive=true
		Doggy.heart.full()

	end
	

	
	
	
	
	
	local sheet = graphics.newImageSheet( "kalacool/sango/image/character/coodog.png", { width=150, height=141, numFrames=9 } )
	
	local sequenceData = {
 
		{ name="normal",frames= { 2, 1, 3}, time=300 , loopDirection = "bounce" },
		{ name="jump", start=4, count=3, time=200 ,loopDirection = "bounce"},
		{ name="dead", start=7, count=3, time=200 ,loopDirection = "bounce"}
 
	}

	
	
	local body = display.newSprite( sheet, sequenceData )
	Doggy.body = body

	

    Doggy.image:insert(body)
    

    Doggy.Filter = { categoryBits = 2, maskBits = 1 }
	
	local shapew=38
	local shapeh=72

	Doggy.Shape= { -shapew,-shapeh, shapew,-shapeh, shapew,66, -shapew,66 }
	Doggy.foot= { -shapew+2,66, shapew-2,66, shapew-2,shapeh, -shapew+2,shapeh }
	--physics.setDrawMode( "hybrid" )
    
	
	
		
	
	--body.x=Doggy.x
    --body.y=Doggy.y
	
	Doggy.image.x= config.x
	Doggy.image.y= config.y

	

    Doggy.image:addEventListener( "collision")
    Doggy.image:addEventListener( "preCollision")
   	--Doggy.image:addEventListener( "postCollision")
   	Doggy.default()

    --Doggy.listeners[table.maxn(Doggy.listeners)+1]= {event="collision",listener=Doggy.crash}

   
	
 
    --add to Instances table
    return Doggy
end
 

