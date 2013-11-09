module(..., package.seeall)


Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")
AI = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Fireball_AI")

function new(config)

local fireball = Monster.new()
    
    -- set monster's attribute
    fireball.HP = 3
    fireball.moveSpeed = 300
    -- set monster's body
    fireball.name ="monster"
    fireball.body = display.newImage("kalacool/sango/image/item/fire3.png")

    fireball.image:insert(fireball.body)
    fireball.body.x = fireball.image.x
    fireball.body.y = fireball.image.y
    fireball.image.x = config.x
    fireball.image.y = config.y

    -- add physics attribute
    local Filter = { categoryBits = 4, maskBits = 2 }   -- collision with {Player , ENV object}
    physics.addBody(fireball.image,"dynamic",{density = 3,filter = Filter})

    -- set monster float
    fireball.image.gravityScale = 0

function fireball:newAI()
    fireball.AI = AI.new(fireball, fireball.target)
end
function fireball:move(x,y)
    fireball.image:setLinearVelocity(x*fireball.moveSpeed , y*fireball.moveSpeed)

end

function fireball:jump(x,y)
    fireball.body:setLinearVelocity(x,y)
end

return fireball
end

