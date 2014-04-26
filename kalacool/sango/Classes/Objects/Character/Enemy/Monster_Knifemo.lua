module(..., package.seeall)


Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")

function new(config)

    local knifemo = Monster.new()
   
    knifemo.Robot = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Knifemo_AI")
    -- set monster's patrol range
    knifemo.patrolRange = {}  
    
    knifemo.originPosition = config
    knifemo.config = config
    -- set monster's attribute
    knifemo.HP                = 500
    
    -- set monster's body
    knifemo.name = "KnifeMo"

    local sheet = graphics.newImageSheet( "kalacool/sango/image/monster/knifemo.png",{ width=100, height=100, numFrames=25 } )
    
    local sequenceData = {
 
        { name="normal", start=1,count=3, time=600,loopDirection = "bounce" },
        { name="move", start=4,count=3, time=600,loopDirection = "bounce" },
        { name="jump", start=7,count=4, time=200,loopDirection = "bounce"},
        { name="shoot", start=11,count=2, time=400,loopDirection = "bounce"}

    }
    
    
    knifemo.body  = display.newSprite(sheet, sequenceData)

    knifemo.body:setSequence( "normal" )
    knifemo.body:play()

    knifemo.image:insert(knifemo.body)
    knifemo.body.x    = knifemo.image.x
    knifemo.body.y    = knifemo.image.y
    knifemo.image.x   = config.x
    knifemo.image.y   = config.y
    knifemo.wave      = config.wave
    knifemo.body.xScale=2
    knifemo.body.yScale=2
    -- add physics attribute
    -- local Filter = { categoryBits = 4, maskBits = 99 }   -- collision with {Player}
    local  Shape = {-50,-70,50,-70,50,90,-50,90}
    physics.addBody(knifemo.image,"dynamic",{ density=10.0, friction=0, bounce=0,shape=Shape, filter = { categoryBits = 4, maskBits = 99}})
    knifemo.image.isFixedRotation = true    -- Monster no Rotate
    knifemo.image.damageValue     = 1
    --physics.setDrawMode( "hybrid" )

    function knifemo:objectState(event)
        -- if(dog.image.x<knifemo.image.x)then
        --     knifemo.image:setLinearVelocity(-200,0)
        --     knifemo.body.xScale=2
        --     if(knifemo.body.sequence ~= "move")then
        --         knifemo.body:setSequence( "move" )
        --         knifemo.body:play()
        --     end
        -- elseif(dog.image.x>knifemo.image.x)then
        --     knifemo.image:setLinearVelocity(200,0)
        --     knifemo.body.xScale=-2
        --     if(knifemo.body.sequence ~= "move")then
        --         knifemo.body:setSequence( "move" )
        --         knifemo.body:play()
        --     end
        -- end
    end
    scene:addEventListener( 'objectState', knifemo )
    knifemo.listeners[table.maxn(knifemo.listeners)+1] = {event='objectState' , listener = knifemo}
return knifemo
end

