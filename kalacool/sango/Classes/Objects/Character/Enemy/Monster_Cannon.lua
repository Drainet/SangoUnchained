module(..., package.seeall)


Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")
ObjectClass = require('kalacool.sango.Classes.Object')
function new(config)

local cannon = Monster.new()
    cannon.Robot = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Cannon_AI")
    -- set monster's attribute 
    cannon.name             = _Enemy.Monster_Cannon.name
    cannon.HP               = _Enemy.Monster_Cannon.HP
    cannon.moveSpeed        = _Enemy.Monster_Cannon.moveSpeed
    cannon.attackSpeed      = _Enemy.Monster_Cannon.attackSpeed
    cannon.bulletSpeed      = _Enemy.Monster_Cannon.bulletSpeed
    cannon.visibleDistance  = _Enemy.Monster_Cannon.visibleDistance
    cannon.config = config
    --set Cannon's head
    cannon.head = display.newImage( _Enemy.Monster_Cannon.head.ImagePath )
    cannon.image:insert(cannon.head)
    cannon.head.RX =        _Enemy.Monster_Cannon.head.RX
    cannon.head.RY =        _Enemy.Monster_Cannon.head.RY

    -- set Cannon's body
    local sheet = graphics.newImageSheet( _Enemy.Monster_Cannon.ImageSheetPath, _Enemy.Monster_Cannon.ImageSheetOption )
    local sequenceData = _Enemy.Monster_Cannon.ImageSheetSequence
    local body =  display.newSprite( sheet , sequenceData )
    cannon.body = body
    body:setSequence( "loading" )
    body:play()
    cannon.image:insert(cannon.body)
    cannon.body.x = cannon.image.x
    cannon.body.y = cannon.image.y
    cannon.image.x = config.x
    cannon.image.y = config.y

    cannon.head.x = cannon.body.x + cannon.head.RX
    cannon.head.y = cannon.body.y + cannon.head.RY
    cannon.head.rotation = 0
    -- add physics attribute
    -- local Filter = { categoryBits = 4, maskBits = 67 } 
    physics.addBody(cannon.image, _Enemy.Monster_Cannon.Physic.Type, _Enemy.Monster_Cannon.Physic.Option)

    cannon.image.isFixedRotation = true
function cannon:attack(angle,dirX,dirY)

        cannon.bullet = cannon:new_bullet()
        cannon.bullet.image.x = cannon.image.x
        cannon.bullet.image.y = cannon.image.y
        cannon.bullet.image:setLinearVelocity(cannon.bulletSpeed*angle*dirX , cannon.bulletSpeed*(1- angle)*dirY)
        cannon.body:play()
end


-- New A bullet
function cannon:new_bullet()
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
            bullet.image:setLinearVelocity(0, 0)
            bullet.body:setSequence("explosion")
            bullet.body:play()
            timerBullet = timer.performWithDelay( 300, bullet.dispose)     
        end

        bullet.image:addEventListener("collision",bullet)
        camera:insert(bullet.image)
        return bullet
end

function cannon:turnHead()
    cannon.head.rotation = 100
end

function cannon.dispose()
    local scene = scene
    scene:dispatchEvent({name='Ach2'})
end



return cannon
end

