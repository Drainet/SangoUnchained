module(..., package.seeall)


Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")

function new(config)

local slime = Monster.new()
    slime.Robot = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Slime_AI")

    -- set monster's patrol range
    slime.patrolRange = {}  
    slime.patrolRange.xL = config.xL
    slime.patrolRange.xR = config.xR
    slime.originPosition = config
    slime.config = config
    -- set monster's attribute
    slime.HP = 10
    slime.moveSpeed = 300
    slime.attackRange = 200
    slime.visibleDistance = 800
    -- set monster's body
    slime.name ="monster"
    slime.body = display.newImage("kalacool/sango/image/monster/Slime/slime.png")

    slime.image:insert(slime.body)
    slime.body.x = slime.image.x
    slime.body.y = slime.image.y
    slime.image.x = config.x
    slime.image.y = config.y

    -- add physics attribute
    local Filter = { categoryBits = 4, maskBits = 99 }   -- collision with {Player}
    physics.addBody(slime.image,"dynamic",{density = 10, friction = 0.7,filter = Filter})
    slime.image.isFixedRotation = true    -- Monster no Rotate
    slime.image.damageValue = 1

    function slime:move(x,y)
        slime.image:setLinearVelocity(x*slime.moveSpeed , y*slime.moveSpeed)
    end

return slime
end

