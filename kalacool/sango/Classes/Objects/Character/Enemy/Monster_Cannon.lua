module(..., package.seeall)


Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")
-- AI = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.cannon_AI")

function new(config)

local cannon = Monster.new()
    
    -- set monster's attribute
    cannon.HP = 3
    cannon.moveSpeed = 0
    cannon.attackSpeed = 100

    -- set monster's body
    cannon.name ="monster"
    cannon.body = display.newImage("kalacool/sango/image/monster/cannon.png")
    cannon.image:insert(cannon.body)
    cannon.body.x = cannon.image.x
    cannon.body.y = cannon.image.y
    cannon.image.x = config.x
    cannon.image.y = config.y

    -- add physics attribute
    local Filter = { categoryBits = 4, maskBits = 3 } 
    physics.addBody(cannon.image,"static",{density = 3,filter = Filter})

function cannon:newAI()
    cannon.AI = AI.new(cannon, cannon.target)
end

function cannon:attack(x,y)
    cannon.body:setLinearVelocity(x,y)
end

return cannon
end

