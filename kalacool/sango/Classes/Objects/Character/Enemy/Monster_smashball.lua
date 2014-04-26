module(..., package.seeall)

Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")
ObjectClass = require('kalacool.sango.Classes.Object')
--AI = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.smashball_AI")

function new(config)

local smashball = Monster.new()
    smashball.Robot = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Smashball_AI")
    --- set monster's patrol range ---
    smashball.patrolRange = {}  
    smashball.patrolRange.xL = config.xL
    smashball.patrolRange.xR = config.xR
    smashball.wave           = config.wave
    smashball.originPosition = config
    smashball.config         = config
    --- set monster's attribute ---
    smashball.HP                 = _Enemy.Monster_smashball.HP
    smashball.moveSpeed          = _Enemy.Monster_smashball.moveSpeed
    smashball.attackRange        = _Enemy.Monster_smashball.attackRange
    smashball.visibleDistance    = _Enemy.Monster_smashball.visibleDistance
    --- set monster's body ---
    smashball.name               = _Enemy.Monster_smashball.name
    local sheet = graphics.newImageSheet( _Enemy.Monster_smashball.ImageSheetPath, _Enemy.Monster_smashball.ImageSheetOption )
    local sequenceData = _Enemy.Monster_smashball.ImageSheetSequence
    local body =  display.newSprite( sheet , sequenceData )
    smashball.body = body
    body:setSequence( "normal" )
    body:play()

    smashball.image:insert(smashball.body)
    smashball.body.x     = smashball.image.x
    smashball.body.y     = smashball.image.y
    smashball.image.x    = config.x
    smashball.image.y    = config.y

    --- add physics attribute ---
    -- local Filter = { categoryBits = 4, maskBits = 98 }   -- collision with {Player}
    physics.addBody(smashball.image,_Enemy.Monster_smashball.Physic.Type, _Enemy.Monster_smashball.Physic.Option)
    smashball.image.isFixedRotation  = _Enemy.Monster_smashball.isFixedRotation    -- Monster no Rotate
    smashball.image.damageValue      = _Enemy.Monster_smashball.damageValue

    --- set monster float ---
    smashball.image.gravityScale     = _Enemy.Monster_smashball.gravityScale
    
function smashball:move(x,y)
    smashball.image:setLinearVelocity(x*smashball.moveSpeed , y*smashball.moveSpeed)
end

function smashball:charge()
    body:setSequence( "charge" )
end

function smashball:smash(x,y)
    smashball.image:setLinearVelocity(x, y)
end

function smashball:normal()
    body:setSequence( "normal" )
end

function smashball:attack(angle,dirX,dirY)

        smashball.bullet = smashball:new_bullet()
        smashball.bullet.image.x = smashball.image.x
        smashball.bullet.image.y = smashball.image.y
        smashball.bullet.image:setLinearVelocity(600*math.sin(angle)*dirX , 600*math.cos(angle)*dirY)
        smashball.body:play()

        --smashball.head.rotation = math.deg( angle ) 

end

function smashball:new_bullet()
        local bullet = ObjectClass.new()
        bullet.image = display.newGroup()
        -- set Bullet Animation
        local sheet = graphics.newImageSheet( _Enemy.Monster_Cannon.bullet.ImageSheetPath, _Enemy.Monster_Cannon.bullet.ImageSheetOption )
        local sequenceData = _Enemy.Monster_Cannon.bullet.ImageSheetSequence

        local body =  display.newSprite( sheet , sequenceData )
        bullet.body = body
        bullet.body:setSequence( "fly" )
        bullet.body:play()
        bullet.image:insert(body)

        -- set Bullet Attribute
        -- local Filter = { categoryBits = 4 , maskBits = 67}
        physics.addBody(bullet.image, _Enemy.Monster_Cannon.bullet.Physic.Type, _Enemy.Monster_Cannon.bullet.Physic.Option) 
        bullet.image.isFixedRotation    = true
        bullet.image.gravityScale       = _Enemy.Monster_Cannon.bullet.gravityScale
        bullet.image.damage             = _Enemy.Monster_Cannon.bullet.damage
        bullet.image.damageValue        = _Enemy.Monster_Cannon.bullet.damageValue
        bullet.image.isBullet           = true

        function bullet.collision(self , event)

            if(event.otherElement ~= 3)then
                bullet.image:setLinearVelocity(0, 0)
                bullet.body:setSequence("explosion")
                bullet.body:play()
                timerBullet = timer.performWithDelay( 600, bullet.dispose)     
            end

            
        end

        bullet.image:addEventListener("collision",bullet)
        camera:insert(bullet.image)
        return bullet
end

return smashball
end

