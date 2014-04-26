--Classes/Objects/Character/Enemy/Monster_flappybird.lua

module(..., package.seeall)

local scene = scene

CharacterClass = require("kalacool.sango.Classes.Objects.Character")
require("kalacool.sango.Set.SupplementSet")
LifeBar = require ("kalacool.sango.Classes.Objects.Character.Enemy.Boss_LifeBar" )

--INSTANCE FUNCTIONS
function new(config)


    local flappybird = CharacterClass.new()
    local sheet = graphics.newImageSheet( _Enemy.Monster_flappybird.ImageSheetPath, _Enemy.Monster_flappybird.ImageSheetOption )
    local sequenceData = _Enemy.Monster_flappybird.ImageSheetSequence
    local body =  display.newSprite( sheet , sequenceData )
    flappybird.body = body

    -------------------------override enemy
    flappybird.image = display.newGroup( )

    -- ALL attribute of Monster
        --basic type & name
        flappybird.image.damage = "fatal"
        flappybird.image.type = "enemy"
        flappybird.alive = true
        flappybird.config = config
        -- basic attribute , HP , DEF , attackRange , visibleDistance
        flappybird.damageReduce = 1     -- Percentage of monster get damage reduce
        flappybird.HP   = _Enemy.Monster_flappybird.HP
        flappybird.name  = _Enemy.Monster_flappybird.name
        flappybird.wave      = config.wave
        flappybird.LifeBar = LifeBar.new(flappybird)
    -- attribute end

    function flappybird:hurt(damage)
        flappybird.HP = flappybird.HP - damage*flappybird.damageReduce
    end

    function flappybird:normalSpeed()
        body:setSequence( "normal" )
        flappybird.image:setLinearVelocity(_Enemy.Monster_flappybird.Velocity,0)
    end

    function flappybird.onCollision(self, event)
        if (event.phase == "began") then
            if (event.other.type == "explosive") then
                body:setSequence( "hurt" )
                flappybird:hurt(event.other.power)
                flappybird.image:setLinearVelocity(_Enemy.Monster_flappybird.Velocity*0.55,0)
                flappybird.timers[2] = timer.performWithDelay(2000, flappybird.normalSpeed)
                if(flappybird.name) then
                   flappybird.LifeBar:hurt(flappybird.HP)
                end
                if(flappybird.HP <=1) then
                    if(flappybird.alive == true) then
                        --- kill monster delay ---
                        timer.performWithDelay( 10,flappybird.dead,1) 
                        flappybird.alive = false
                        if(flappybird.name) then
                           flappybird.LifeBar.dispose()
                        end
                    end
                end
            end
        end
    end

    function flappybird.dead()
        flappybird.alive = false
        if(flappybird.config.name ~= nil) then
            flappybird:dropItem()
        end
        flappybird.hide()
        flappybird.dispose()
        scene:dispatchEvent({name='gotMoney',money = 100})
        scene:dispatchEvent({name='monsterDeadInWave',wave = flappybird.wave})
    end

    flappybird.collision = flappybird.onCollision
    flappybird.image:addEventListener("collision", flappybird)

    flappybird.listeners[table.maxn(flappybird.listeners)+1] = {event="collision", listener = flappybird}
    ------------------------------------------ override end

    body:setSequence( "normal" )
    body:play()

    flappybird.image:insert(flappybird.body)
    flappybird.body.x    = flappybird.image.x
    flappybird.body.y    = flappybird.image.y
    flappybird.image.x   = config.x
    flappybird.image.y   = config.y
    
    local time = (config.xR - config.x )/_Enemy.Monster_flappybird.Velocity
    flappybird.image.damage = _Enemy.Monster_flappybird.Damage

    physics.addBody( flappybird.image, _Enemy.Monster_flappybird.Physic.Type, _Enemy.Monster_flappybird.Physic.Option ) 
	flappybird.image:setLinearVelocity(_Enemy.Monster_flappybird.Velocity,0)

    function flappybird.stop()
    	flappybird.image:setLinearVelocity(0,0)
    end

    flappybird.timers[1] = timer.performWithDelay(time*1000, flappybird.stop)


    return flappybird
end