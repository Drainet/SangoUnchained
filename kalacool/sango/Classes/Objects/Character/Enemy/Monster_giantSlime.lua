module(..., package.seeall)


Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")

function new(config)

local GiantSlime = Monster.new()
    GiantSlime.Robot = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.GiantSlime_AI")

    -- set monster's patrol range
    GiantSlime.patrolRange = {}  
    GiantSlime.patrolRange.xL = config.xL
    GiantSlime.patrolRange.xR = config.xR
    GiantSlime.originPosition = config
    GiantSlime.config = config
    -- set monster's attribute
    GiantSlime.HP                = _Enemy.Monster_GiantSlime.HP
    GiantSlime.moveSpeedX        = _Enemy.Monster_GiantSlime.moveSpeedX
    GiantSlime.moveSpeedY        = _Enemy.Monster_GiantSlime.moveSpeedY
    GiantSlime.attackRange       = _Enemy.Monster_GiantSlime.attackRange
    GiantSlime.visibleDistance   = _Enemy.Monster_GiantSlime.visibleDistance
    -- set monster's body
    GiantSlime.name              = _Enemy.Monster_GiantSlime.name
    GiantSlime.body              = display.newImage( _Enemy.Monster_GiantSlime.ImagePath)

    GiantSlime.image:insert(GiantSlime.body)
    GiantSlime.body.x    = GiantSlime.image.x
    GiantSlime.body.y    = GiantSlime.image.y
    GiantSlime.wave      = config.wave
    GiantSlime.image.x   = config.x
    GiantSlime.image.y   = config.y

    -- add physics attribute
    -- local Filter = { categoryBits = 4, maskBits = 99 }   -- collision with {Player}
    physics.addBody(GiantSlime.image, _Enemy.Monster_GiantSlime.Type, _Enemy.Monster_GiantSlime.Option)
    GiantSlime.image.isFixedRotation = _Enemy.Monster_GiantSlime.isFixedRotation    -- Monster no Rotate
    GiantSlime.image.damageValue     = _Enemy.Monster_GiantSlime.damageValue

    function GiantSlime:move(x,y)
        GiantSlime.image:setLinearVelocity(x*GiantSlime.moveSpeedX , y*GiantSlime.moveSpeedY)
        if (temp == 1)then
            GiantSlime:spawnMinion()
        end
    end

    function GiantSlime:spawnMinion()
        
        require("kalacool.sango.Set.EnemySet")
        camera:insert(EnemySet.newMonster({ID=4,x=GiantSlime.image.x+10,y=GiantSlime.image.y+100 +10,wave=GiantSlime.wave,xL=GiantSlime.patrolRange.xL,xR=GiantSlime.patrolRange.xR}).image)
        camera:insert(EnemySet.newMonster({ID=4,x=GiantSlime.image.x-10,y=GiantSlime.image.y+100 +10,wave=GiantSlime.wave,xL=GiantSlime.patrolRange.xL,xR=GiantSlime.patrolRange.xR}).image)
        camera:insert(EnemySet.newMonster({ID=4,x=GiantSlime.image.x+10,y=GiantSlime.image.y+100 -10,wave=GiantSlime.wave,xL=GiantSlime.patrolRange.xL,xR=GiantSlime.patrolRange.xR}).image)
        camera:insert(EnemySet.newMonster({ID=4,x=GiantSlime.image.x-10,y=GiantSlime.image.y+100 -10,wave=GiantSlime.wave,xL=GiantSlime.patrolRange.xL,xR=GiantSlime.patrolRange.xR}).image)
        scene:dispatchEvent( {name='onPlayerShow',target = dog} )
        scene:dispatchEvent( {name='addMonsterWaveAmount', whichWave = GiantSlime.wave, howMany = 4})

    end

return GiantSlime
end

