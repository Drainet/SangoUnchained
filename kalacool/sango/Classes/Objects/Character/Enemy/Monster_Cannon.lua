module(..., package.seeall)


Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")
AI = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Cannon_AI")

function new(config)

local cannon = Monster.new()
    
    -- set monster's attribute 
    cannon.name ="monster"
    cannon.HP = 10
    cannon.moveSpeed = 0
    cannon.attackSpeed = 3000
    cannon.bulletSpeed = 300
    cannon.visibleDistance = 500
    
    --set Cannon's head
    cannon.head = display.newImage( "kalacool/sango/image/monster/Cannon/cannon_head.png" )
    cannon.image:insert(cannon.head)
    cannon.head.RX = -12
    cannon.head.RY = -43

    -- set Cannon's body
    local sheet = graphics.newImageSheet( "kalacool/sango/image/monster/Cannon/cannon_body_animation.png", { width=82, height=98, numFrames=10 } )
    local sequenceData = {
        { name="loading", start=1, count=10, time= 3000 , loopCount = 1}
    }   
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
    local Filter = { categoryBits = 4, maskBits = 3 } 
    physics.addBody(cannon.image,"static",{density = 3,filter = Filter})

    cannon.image.isFixedRotation = true


function cannon:newAI()
    cannon.AI = AI.new(cannon, cannon.target)
end

function cannon:attack(angle,dirX,dirY)

        cannon.bullet = cannon:new_bullet()
        cannon.bullet.x = cannon.image.x
        cannon.bullet.y = cannon.image.y
        cannon.bullet:setLinearVelocity(cannon.bulletSpeed*angle*dirX , cannon.bulletSpeed*(1- angle)*dirY)
        cannon.body:play()
end


-- New A bullet
function cannon:new_bullet()
        local bullet = display.newGroup( )

        -- set Bullet Animation
        local sheet = graphics.newImageSheet( "kalacool/sango/image/monster/Cannon/cannon_bullet_animation.png", { width=51, height=49, numFrames=8 } )
        local sequenceData = {
            { name="fly", start=1, count=4, time= 400},
            { name="explosion", start=5, count=4, time= 300 }
        }
        local body =  display.newSprite( sheet , sequenceData )
        bullet.body = body
        bullet.body:setSequence( "fly" )
        bullet.body:play()
        bullet:insert(body)

        -- set Bullet Attribute
        local Filter = { categoryBits = 4 , maskBits = 3}
        physics.addBody(bullet, "dynamic", {density = 1 , filter = Filter }) 
        bullet.isFixedRotation = true
        bullet.gravityScale = 0
        bullet.damage = "fatal"
        bullet.isBullet = true

        function bullet.collision(self , event)
                bullet:setLinearVelocity(0, 0)
                bullet.body:setSequence("explosion")
                bullet.body:play()
                timerBullet = timer.performWithDelay( 300, bullet.dispose)
        end

        function bullet:removeAllEvent()
            timer.cancel( timerBullet )
            bullet.dispose() 
        end

        function bullet.dispose()
            display.remove( bullet )
        end
        -- Listeners of Bullet
        bullet:addEventListener( 'removeAllEvent', bullet )
        bullet:addEventListener("collision")
        camera:insert(bullet)
        return bullet
end

function cannon:turnHead()
    cannon.head.rotation = 100
end



return cannon
end

