module(..., package.seeall)



local PlayerClass  = require "kalacool.sango.Classes.Objects.Character.Player"


function new(config)
    --create Doggy display object


    local Doggy = PlayerClass.new(config)


    

	
	


	function Doggy.default()
		Doggy.body:setSequence( "jump" )
		Doggy.body:play()
		Doggy.setgun("shotgun")
		
		physics.addBody( Doggy.image,{ density=40.0, friction=1, bounce=0,shape=Doggy.Shape,filter=Doggy.Filter} )
		Doggy.image.isFixedRotation = true
		Doggy.alive=true
		Doggy.heart.full()

	end
	

	
	
	
	
	
	local sheet = graphics.newImageSheet( "kalacool/sango/image/character/dog_body.png", { width=150, height=141, numFrames=9 } )
	
	local sequenceData = {
 
		{ name="normal", start=1, count=3, time=800 },
		{ name="jump", start=4, count=3, time=200 },
		{ name="dead", start=7, count=3, time=200 }
 
	}

    local body = display.newSprite( sheet, sequenceData )
	Doggy.body = body
	
    local hang =  display.newImage("kalacool/sango/image/character/dog_hang_gun.png",0,0)
	Doggy.hang = hang
	
	


    hang.xReference=27
    hang.yReference=-8

    Doggy.image:insert(body)
    Doggy.image:insert(hang)

    Doggy.Filter = { categoryBits = 2, maskBits = 1 }
	
	local shapew=38
	local shapeh=72

	Doggy.Shape= { -shapew,-shapeh, shapew,-shapeh, shapew,shapeh, -shapew,shapeh }
    
	
	hang.x=Doggy.image.x+27
    hang.y=Doggy.image.y-8
		
	
	body.x=Doggy.x
    body.y=Doggy.y
	
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
 

