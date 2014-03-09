module(..., package.seeall)

Monster = require ("kalacool.sango.Classes.Objects.Character.Enemy")
--AI = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.smashball_AI")

function new(config)

local smashball = Monster.new()
    smashball.Robot = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Smashball_AI")
    --- set monster's patrol range ---
    smashball.patrolRange = {}  
    smashball.patrolRange.xL = config.xL
    smashball.patrolRange.xR = config.xR
    smashball.wave           = config.wave
    smashball.originPosition = config
    smashball.config         = config
    --- set monster's attribute ---
    smashball.HP                 = _Enemy.Monster_smashball.HP
    smashball.moveSpeed          = _Enemy.Monster_smashball.moveSpeed
    smashball.attackRange        = _Enemy.Monster_smashball.attackRange
    smashball.visibleDistance    = _Enemy.Monster_smashball.visibleDistance
    --- set monster's body ---
    smashball.name               = _Enemy.Monster_smashball.name
    local sheet = graphics.newImageSheet( _Enemy.Monster_smashball.ImageSheetPath, _Enemy.Monster_smashball.ImageSheetOption )
    local sequenceData = _Enemy.Monster_smashball.ImageSheetSequence
    local body =  display.newSprite( sheet , sequenceData )
    smashball.body = body
    body:setSequence( "normal" )
    body:play()

    smashball.image:insert(smashball.body)
    smashball.body.x     = smashball.image.x
    smashball.body.y     = smashball.image.y
    smashball.image.x    = config.x
    smashball.image.y    = config.y

    --- add physics attribute ---
    -- local Filter = { categoryBits = 4, maskBits = 98 }   -- collision with {Player}
    physics.addBody(smashball.image,_Enemy.Monster_smashball.Physic.Type, _Enemy.Monster_smashball.Physic.Option)
    smashball.image.isFixedRotation  = _Enemy.Monster_smashball.isFixedRotation    -- Monster no Rotate
    smashball.image.damageValue      = _Enemy.Monster_smashball.damageValue

    --- set monster float ---
    smashball.image.gravityScale     = _Enemy.Monster_smashball.gravityScale
    
function smashball:move(x,y)
    smashball.image:setLinearVelocity(x*smashball.moveSpeed , y*smashball.moveSpeed)
end

function smashball:charge()
    body:setSequence( "charge" )
end

function smashball:smash(x,y)
    smashball.image:setLinearVelocity(x, y)
end

function smashball:normal()
    body:setSequence( "normal" )
end

return smashball
end

