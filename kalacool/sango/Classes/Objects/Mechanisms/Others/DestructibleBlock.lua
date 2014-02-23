module(..., package.seeall)


ObjectClass =  require('kalacool.sango.Classes.Object')
function new(config)
	local Block = ObjectClass.new()
	local scene = scene

	--- set Attribute of Block
	Block.image = display.newGroup( )
	Block.Filter = { categoryBits = 1} 
	Block.HP = 10
	Block.MaxHP = 10
	--- set Block's image
	local sheet = graphics.newImageSheet( "kalacool/sango/image/Mechanism/block.png", { width=150, height=150, numFrames=4} )
    local sequenceData = {
    	{ name="start", start=1, count=1, time= Block.remainTime, loopCount=1 },
        { name="break1", start=2, count=1, time= Block.remainTime, loopCount=1 },
        { name="break2", start=3, count=1, time= Block.remainTime, loopCount=1 },
        { name="break3", start=4, count=1, time= Block.remainTime, loopCount=1 }
    }
    local body =  display.newSprite( sheet , sequenceData )

    Block.body = body
    Block.body:setSequence( "start")
    Block.body:play()

	Block.body.x = Block.image.x
	Block.body.y = Block.image.y
	Block.image.x = config.x
	Block.image.y =  config.y
	Block.image.surface = "rough"
	Block.image.damage = "safe"
	Block.image:insert(Block.body)

	physics.addBody( Block.image ,"static" , {friction=1,Filter=Block.Filter} )


	function Block.image:collision(event)
		if( event.other.type == "bullet") then
			if ( event.phase == "began") then
				Block.HP = Block.HP -event.other.power
				if (Block.HP < 1) then
					timer.performWithDelay( 100, Block.dispose)
				elseif (Block.HP/Block.MaxHP < 1/4) then
					Block.body:setSequence( "break3")
				elseif(Block.HP/Block.MaxHP < 2/4 and Block.HP/Block.MaxHP >= 1/4)	then
					Block.body:setSequence( "break2")
				elseif(Block.HP/Block.MaxHP < 3/4 and Block.HP/Block.MaxHP >= 2/4)  then
					Block.body:setSequence( "break1")
				end
			end
		end
	end


 	Block.image:addEventListener( "collision" )
	Block.listeners[1] = {event="collision", listener = Block}
	return Block
end