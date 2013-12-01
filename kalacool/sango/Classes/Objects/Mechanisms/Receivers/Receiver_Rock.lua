module(..., package.seeall)


Mechanism =  require('kalacool.sango.Classes.Objects.Mechanisms.Mechanism')
function new(config)
	local Receiver = Mechanism.new()
	local scene = scene

	-- Set attribute of Receiver 
	Receiver.image.isActive = false
	Receiver.key = config.key
	Receiver.explosioinTime = 2000
	-- Set Receiver image
	local sheet = graphics.newImageSheet( "kalacool/sango/image/Mechanism/receiver_rock.png", { width=546, height=597, numFrames=9 } )
    local sequenceData = {
        { name="explosion", start=1, count=9, time=Receiver.explosioinTime },
      --  { name="normal", start=1, count=1, time= 100 }
    }
    local body =  display.newSprite( sheet , sequenceData )

    Receiver.body = body
    Receiver.body:setSequence( "explosion")
 
    
	Receiver.body.x = Receiver.image.x
	Receiver.body.y = Receiver.image.y
	Receiver.image.x = config.x
	Receiver.image.y =  config.y
	Receiver.image:insert(Receiver.body)
	Receiver.image.type = "receiver"
	physics.addBody(Receiver.image , "static" , {Filter = Receiver.Filter})

	function Receiver:active()
		Receiver.isActive = true
		Receiver.body:setSequence( "explosion" )
        Receiver.body:play()
       --	Receiver.body:stop( )
		Receiver.timerID = timer.performWithDelay( Receiver.explosioinTime, Receiver.dispose )
	end
	
	return Receiver
end