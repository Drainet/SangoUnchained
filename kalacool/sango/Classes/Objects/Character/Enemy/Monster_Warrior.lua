module(..., package.seeall)


Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")

function new(config)

local warrior = Monster.new()
    warrior.Robot = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Slime_AI")

    -- set monster's patrol range
    warrior.patrolRange = {}  
    warrior.patrolRange.xL = config.xL
    warrior.patrolRange.xR = config.xR
    warrior.originPosition = config
    warrior.config = config
    -- set monster's attribute
    warrior.HP                = _Enemy.Monster_Warrior.HP
    warrior.moveSpeed         = _Enemy.Monster_Warrior.moveSpeed
    warrior.attackRange       = _Enemy.Monster_Warrior.attackRange
    warrior.visibleDistance   = _Enemy.Monster_Warrior.visibleDistance
    -- set monster's body
    warrior.name              = _Enemy.Monster_Warrior.name
    warrior.body              = display.newSprite( _Enemy.Monster_Warrior.ImageSheet,_Enemy.Monster_Warrior.ImageSequence)
    warrior.body:setSequence( "chop" )
    warrior.body:play()

    warrior.body.xScale = -1

    warrior.image:insert(warrior.body)
    warrior.body.x    = warrior.image.x
    warrior.body.y    = warrior.image.y
    warrior.image.x   = config.x
    warrior.image.y   = config.y

    -- add physics attribute
    -- local Filter = { categoryBits = 4, maskBits = 99 }   -- collision with {Player}
    local shape = {0,50,30,50,30,126,0,126}
    _Enemy.Monster_Warrior.Option.shape = shape 
    physics.addBody(warrior.image, _Enemy.Monster_Warrior.Type, _Enemy.Monster_Warrior.Option)
    warrior.image.isFixedRotation = _Enemy.Monster_Warrior.isFixedRotation    -- Monster no Rotate
    warrior.image.damageValue     = _Enemy.Monster_Warrior.damageValue

    function warrior:move(x,y)
        warrior.image:setLinearVelocity(x*warrior.moveSpeed , y*warrior.moveSpeed)
    end
    --physics.setDrawMode( "hybrid" )
return warrior
end

