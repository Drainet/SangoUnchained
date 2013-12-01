module(..., package.seeall)


Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")
AI = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Fireball_AI")

function new(config)

local fireball = Monster.new()
    -- set monster's patrol range
    fireball.patrolRange = {}  
    fireball.patrolRange.xL = config.xL
    fireball.patrolRange.xR = config.xR
    fireball.originPosition = config
    fireball.config = config
    -- set monster's attribute
    fireball.HP = 10
    fireball.moveSpeed = 300
    fireball.attackRange = 300
    fireball.visibleDistance = 1000
    -- set monster's body
    fireball.name ="monster"
    fireball.body = display.newImage("kalacool/sango/image/item/fire3.png")

    fireball.image:insert(fireball.body)
    fireball.body.x = fireball.image.x
    fireball.body.y = fireball.image.y
    fireball.image.x = config.x
    fireball.image.y = config.y

    -- add physics attribute
    local Filter = { categoryBits = 4, maskBits = 34 }   -- collision with {Player}
    physics.addBody(fireball.image,"dynamic",{density = 10,filter = Filter})
    fireball.image.isFixedRotation = true    -- Monster no Rotate
    fireball.image.damageValue = 1

    -- set monster float
    fireball.image.gravityScale = 0

function fireball:newAI()
    fireball.AI = AI.new(fireball, fireball.target)
end
function fireball:move(x,y)
    fireball.image:setLinearVelocity(x*fireball.moveSpeed , y*fireball.moveSpeed)

end

return fireball
end

