module(..., package.seeall)


Mechanism =  require('kalacool.sango.Classes.Objects.Mechanisms.Mechanism')
function new(config)
	local PowerGenerator = Mechanism.new()
	local scene = scene

	-- Set attribute of PowerGenerator 
	PowerGenerator.key 		= config.key
	PowerGenerator.isActive = false
	PowerGenerator.HP 		= 2
	-- Set PowerGenerator image
	local sheet = graphics.newImageSheet( "kalacool/sango/image/Mechanism/Trigger_PowerGenerator.png", { width=130, height=180, numFrames=2 } )
    local sequenceData = {
        { name = "active", start=1, count=2, time=100, loopCount=1 }
    }
    local body =  display.newSprite( sheet , sequenceData )

    PowerGenerator.body = body
    PowerGenerator.body:setSequence("active")
    
	PowerGenerator.body.x 	= PowerGenerator.image.x
	PowerGenerator.body.y 	= PowerGenerator.image.y
	PowerGenerator.image.x 	= config.x
	PowerGenerator.image.y 	= config.y
	PowerGenerator.image:insert(PowerGenerator.body)
	PowerGenerator.image.type = "trigger"

	physics.addBody(PowerGenerator.image , "static" , {filter = { categoryBits = 128}})
	PowerGenerator.image.isSensor = true

	function PowerGenerator:active()
		PowerGenerator.body:setSequence("active")
		PowerGenerator.body:play()
	end

    function PowerGenerator:hurt(damage)
        PowerGenerator.HP = PowerGenerator.HP - damage
    end

    function PowerGenerator.dead()
        PowerGenerator:sendActiveSignal()
		PowerGenerator:active()
		PowerGenerator.isActive = true

    end

	function PowerGenerator.onCollsion(self , event)
		if (event.phase == "began") then
            if (event.other.type == "bullet" or event.other.type == "explosive") then
                PowerGenerator:hurt(event.other.power)
                if(PowerGenerator.HP < 1) then
                    timer.performWithDelay( 10, PowerGenerator.dead, 1) 
                end
            end
        end	
	end

	PowerGenerator.collision = PowerGenerator.onCollsion
 	PowerGenerator.image:addEventListener( "collision" , PowerGenerator )

	return PowerGenerator
end