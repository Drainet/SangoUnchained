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
			,{ density=10.0, friction=0, bounce=0,shape=Doggy.foot,filter=Doggy.Filter} 
			,{ density=10.0, friction=0, bounce=0,shape=Doggy.Shape,filter=Doggy.Filter}
            ,{ isSensor = true,radius = 70,filter=Doggy.Filter})
		Doggy.image.isFixedRotation = true
		Doggy.image.isBullet 		= true
        Doggy.image.gravityScale = 0
		Doggy.alive 				= true

		Doggy.heart.full()
		Doggy.invincible(15)

	end
	
	local sheet = graphics.newImageSheet( _Player.Doggy.ImageSheetPath, _Player.Doggy.ImageSheetOption)
	
	local sequenceData = _Player.Doggy.ImageSheetSequence
	
	local body = display.newSprite( sheet, sequenceData )
	Doggy.body = body

    Doggy.image:insert(body)

    Doggy.handGroup = display.newGroup( )
    Doggy.image:insert(Doggy.handGroup)

    Doggy.knife = display.newSprite( graphics.newImageSheet( "kalacool/sango/image/character/knife.png",  { width=150, height=150, numFrames=6 })
        , {{ name="normal", frames= {6,5,4,3,2,1}, time=300  ,loopCount = 1}} )
    Doggy.image:insert(Doggy.knife)

    Doggy.knife:setSequence( "normal" )
    Doggy.knife.isVisible = false

    Doggy.hand = display.newImage( _Player.Doggy.hand.ImagePath )
    Doggy.hand.x 		= 0
    Doggy.hand.y 		= 0
    Doggy.hand.fistX 	= _Player.Doggy.hand.fistX
    Doggy.hand.fistY 	= _Player.Doggy.hand.fistY
    Doggy.handGroup:insert(Doggy.hand)

    Doggy.handGroup.anchorChildren = true
    Doggy.handGroup.anchorX=0.5 --shoulder position
    Doggy.handGroup.anchorY=0.53

    Doggy.handGroup.x = 14
    Doggy.handGroup.y = 5
    -- local dodo =  display.newCircle( Doggy.handGroup.x, Doggy.handGroup.y, 2 )
    -- Doggy.image:insert(dodo)
    --Doggy.Filter = { categoryBits = 2, maskBits = 37 }

	local shapew = 30
	local shapeh = 56

	Doggy.Shape = { -shapew, -shapeh+30, shapew, -shapeh+30, shapew,53, -shapew,53 }
	Doggy.foot	= { -shapew+2, 53, shapew-2,53, shapew-2, shapeh, -shapew+2, shapeh }
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
 

