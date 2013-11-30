module(..., package.seeall)


Mechanism =  require('kalacool.sango.Classes.Objects.Mechanisms.Mechanism')
function new(config)
	local Trigger = Mechanism.new()
	local scene = scene

	-- Set attribute of trigger 
	Trigger.key = config.key
	Trigger.isActive = false
	-- Set trigger image
	local sheet = graphics.newImageSheet( "kalacool/sango/image/Mechanism/button_1.png", { width=78, height=63, numFrames=2 } )
    local sequenceData = {
        { name="active", start=1, count=2, time=100,loopCount=1}
    }
    local body =  display.newSprite( sheet , sequenceData )

    Trigger.body = body
    Trigger.body:setSequence("active")
 
    
	Trigger.body.x = Trigger.image.x
	Trigger.body.y = Trigger.image.y
	Trigger.image.x = config.x
	Trigger.image.y =  config.y
	Trigger.image:insert(Trigger.body)
	Trigger.image.type = "trigger"

	physics.addBody(Trigger.image , "static" , {Filter = Trigger.Filter})
	Trigger.image.isSensor = true
	function Trigger:active()
		Trigger.body:setSequence("active")
		Trigger.body:play()
	end

	return Trigger
end