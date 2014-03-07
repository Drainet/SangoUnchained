module(..., package.seeall)

Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")
--AI = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Fireball_AI")

function new(config)

local fireball = Monster.new()
    fireball.Robot = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Fireball_AI")
    --- set monster's patrol range ---
    fireball.patrolRange = {}  
    fireball.patrolRange.xL = config.xL
    fireball.patrolRange.xR = config.xR
    fireball.wave           = config.wave
    fireball.originPosition = config
    fireball.config         = config
    --- set monster's attribute ---
    fireball.HP                 = _Enemy.Monster_fireball.HP
    fireball.moveSpeed          = _Enemy.Monster_fireball.moveSpeed
    fireball.attackRange        = _Enemy.Monster_fireball.attackRange
    fireball.visibleDistance    = _Enemy.Monster_fireball.visibleDistance
    --- set monster's body ---
    fireball.name               = _Enemy.Monster_fireball.name
    fireball.body = display.newImage( _Enemy.Monster_fireball.ImagePath)

    fireball.image:insert(fireball.body)
    fireball.body.x     = fireball.image.x
    fireball.body.y     = fireball.image.y
    fireball.image.x    = config.x
    fireball.image.y    = config.y

    --- add physics attribute ---
    -- local Filter = { categoryBits = 4, maskBits = 98 }   -- collision with {Player}
    physics.addBody(fireball.image,_Enemy.Monster_fireball.Physic.Type, _Enemy.Monster_fireball.Physic.Option)
    fireball.image.isFixedRotation  = _Enemy.Monster_fireball.isFixedRotation    -- Monster no Rotate
    fireball.image.damageValue      = _Enemy.Monster_fireball.damageValue

    --- set monster float ---
    fireball.image.gravityScale     = _Enemy.Monster_fireball.gravityScale
    
function fireball:move(x,y)
    fireball.image:setLinearVelocity(x*fireball.moveSpeed , y*fireball.moveSpeed)

end

return fireball
end

