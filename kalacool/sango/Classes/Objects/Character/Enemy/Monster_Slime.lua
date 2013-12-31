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
    slime.HP                = _Enemy.Monster_Slime.HP
    slime.moveSpeed         = _Enemy.Monster_Slime.moveSpeed
    slime.attackRange       = _Enemy.Monster_Slime.attackRange
    slime.visibleDistance   = _Enemy.Monster_Slime.visibleDistance
    -- set monster's body
    slime.name              = _Enemy.Monster_Slime.name
    slime.body              = display.newImage( _Enemy.Monster_Slime.ImagePath)

    slime.image:insert(slime.body)
    slime.body.x    = slime.image.x
    slime.body.y    = slime.image.y
    slime.image.x   = config.x
    slime.image.y   = config.y

    -- add physics attribute
    -- local Filter = { categoryBits = 4, maskBits = 99 }   -- collision with {Player}
    physics.addBody(slime.image, _Enemy.Monster_Slime.Type, _Enemy.Monster_Slime.Option)
    slime.image.isFixedRotation = _Enemy.Monster_Slime.isFixedRotation    -- Monster no Rotate
    slime.image.damageValue     = _Enemy.Monster_Slime.damageValue

    function slime:move(x,y)
        slime.image:setLinearVelocity(x*slime.moveSpeed , y*slime.moveSpeed)
    end

return slime
end

