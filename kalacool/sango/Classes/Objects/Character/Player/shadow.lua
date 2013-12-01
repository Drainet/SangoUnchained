module(..., package.seeall)



local PlayerClass  = require "kalacool.sango.Classes.Objects.Character.Player"


function new(config)
    --create Doggy display object


    local Doggy = PlayerClass.new(config)

    Doggy.pack = {}
    

    
    --Doggy.pack[1].isonAir=true
    --Doggy.pack[2].isonAir=true
	
	
    

	function Doggy.default()
		Doggy.buffNum = 0
		Doggy.show(Doggy.image.lastCheckPoint)

		Doggy.body:setSequence( "jump" )
		Doggy.body:play()

		local GetAndSetStatus = require "kalacool.sango.System.GetAndSetStatus"
    	local characterConfig = GetAndSetStatus.getCurCharacterConfig()

		Doggy.pack[1]={name=characterConfig.wpn1,isonAir=true,nowNum=nil}
    	Doggy.pack[2]={name=characterConfig.wpn2,isonAir=true,nowNum=nil}


		Doggy.setgun( Doggy.pack[Doggy.switch.state].name )
		--Doggy.setgun("rifle")
		physics.addBody( Doggy.image
			,{ density=10.0, friction=1, bounce=0,shape=Doggy.Shape,filter=Doggy.Filter}
			,{ density=10.0, friction=1, bounce=0,shape=Doggy.foot,filter=Doggy.Filter} )
		Doggy.image.isFixedRotation = true
		Doggy.image.isBullet = true
		Doggy.alive=true

		Doggy.heart.full()
		Doggy.invincible(15)

	end
	

	
	
	
	
	
	local sheet = graphics.newImageSheet( "kalacool/sango/image/character/shadow.png", { width=120, height=113, numFrames=9 } )
	
	local sequenceData = {
 
		{ name="normal",frames= { 2, 1, 3}, time=300 , loopDirection = "bounce" },
		{ name="jump", start=4, count=3, time=200 ,loopDirection = "bounce"},
		{ name="dead", start=7, count=3, time=200 ,loopDirection = "bounce"}
 
	}

	
	
	local body = display.newSprite( sheet, sequenceData )
	Doggy.body = body

	

    Doggy.image:insert(body)

    Doggy.handGroup = display.newGroup( )
    Doggy.image:insert(Doggy.handGroup)

    Doggy.hand = display.newImage( "kalacool/sango/image/character/shadowhand.png" )
    Doggy.hand.x = 0
    Doggy.hand.y = 0
    Doggy.hand.fistX = 3
    Doggy.hand.fistY = 28
    Doggy.handGroup:insert(Doggy.hand)

    Doggy.handGroup.xReference=14--shoulder position
    Doggy.handGroup.yReference=10
    

    Doggy.Filter = { categoryBits = 2, maskBits = 5 }

	
	local shapew=30
	local shapeh=56

	Doggy.Shape= { -shapew,-shapeh, shapew,-shapeh, shapew,53, -shapew,53 }
	Doggy.foot= { -shapew+2,53, shapew-2,53, shapew-2,shapeh, -shapew+2,shapeh }
	--physics.setDrawMode( "hybrid" )
    
	
	
		
	
	--body.x=Doggy.x
    --body.y=Doggy.y
	
	

	

    Doggy.image:addEventListener( "collision")
    Doggy.image:addEventListener( "preCollision")
   	--Doggy.image:addEventListener( "postCollision")
   	Doggy.default()

    --Doggy.listeners[table.maxn(Doggy.listeners)+1]= {event="collision",listener=Doggy.crash}

   
	
 
    --add to Instances table
    return Doggy
end
 
