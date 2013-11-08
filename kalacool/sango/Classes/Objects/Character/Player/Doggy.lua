module(..., package.seeall)



local PlayerClass  = require "kalacool.sango.Classes.Objects.Character.Player"


function new(config)
    --create Doggy display object


    local Doggy = PlayerClass.new(config)


    function Doggy.image:preCollision(event )

    	
    	if(event.other.damage=="safe" and event.other.surface=="rough" and (self.y+self.height/2-10)<(event.other.y-event.other.height/2) ) then
    		--print( self.y+self.height/2)
    		--print( event.other.y-event.other.height/2)
    		local vx, vy = event.other:getLinearVelocity()
    		Doggy.image:setLinearVelocity( vx, vy )

    	end

	end
	function Doggy.image:postCollision(event )
    	

    	
	
	end
	
	function Doggy.image:collision(event )
	
		if ( event.phase == "began" ) then
			if(event.other.damage=="safe") then
				Doggy.body:setSequence( "normal" )
				Doggy.body:play()
				Doggy.Magazine.reloadable=true
				Doggy.Magazine.startReload()
				
			end

			if( event.other.damage=="fatal") then
			
				Doggy.body:setSequence( "dead" )
				Doggy.body:play()
				timer.performWithDelay( 100, Doggy.dead,1 )


			end

			
			

		elseif ( event.phase == "ended" ) then
			if(event.other.damage=="safe") then
				Doggy.body:setSequence( "jump" )
				Doggy.body:play()
				Doggy.Magazine.reloadable=false
			end
			


		end
	
	end


	function Doggy.default()
		Doggy.body:setSequence( "jump" )
		Doggy.body:play()
		Doggy.setgun("shotgun",5,350,100)
		Doggy.image.bodyType="dynamic"
		Doggy.alive=true
		Doggy.heart.full()

	end
	

	
	
	
	Doggy.setgun("shotgun",5,350,100)
	
	local sheet = graphics.newImageSheet( "kalacool/sango/image/character/dog_body.png", { width=75, height=141, numFrames=9 } )
	
	local sequenceData = {
 
		{ name="normal", start=1, count=3, time=200 },
		{ name="jump", start=4, count=3, time=200 },
		{ name="dead", start=7, count=3, time=200 }
 
	}

    local body = display.newSprite( sheet, sequenceData )
	Doggy.body = body
	
    local hang =  display.newImage("kalacool/sango/image/character/dog_hang_gun.png",0,0)
	Doggy.hang = hang
	
	
    
    
	
	body:play()

    hang.xReference=27
    hang.yReference=-8

    Doggy.image:insert(body)
    Doggy.image:insert(hang)

    local Filter = { categoryBits = 2, maskBits = 1 }
	
	local shapew=38
	local shapeh=72

	local Shape= { -shapew,-shapeh, shapew,-shapeh, shapew,shapeh, -shapew,shapeh }
    physics.addBody( Doggy.image,{ density=40.0, friction=1, bounce=0,shape=Shape,filter=Filter} )
    
	
	
	hang.x=Doggy.image.x+27
    hang.y=Doggy.image.y-8
		
	
	body.x=Doggy.x
    body.y=Doggy.y
	
	Doggy.image.x= config.x
	Doggy.image.y= config.y

	Doggy.image.isFixedRotation = true
	
	Doggy.body:setSequence( "jump" )
	Doggy.body:play()
	
	
	
    Doggy.image:addEventListener( "collision")
   	Doggy.image:addEventListener( "preCollision")
   	--Doggy.image:addEventListener( "postCollision")


    --Doggy.listeners[table.maxn(Doggy.listeners)+1]= {event="collision",listener=Doggy.crash}


	
 
    --add to Instances table
    return Doggy
end
 

