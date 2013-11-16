module (..., package.seeall)

monster_AI = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_AI")



function new(monster , target , option)
    local AI = monster_AI:new()
    -- set AI attribute
    AI.target = target
    AI.monster = monster

    function AI.run()
        if ( AI:isPlayerVisible() ) then
            angle =  math.pow( math.abs(monster.image.x - target.image.x), 2 ) / math.pow( AI:getDistance() , 2 )
            dir = AI:monsterDir(target.image)
            monster:attack(angle,dir.x,dir.y)

            AI.timerID = timer.performWithDelay( monster.attackSpeed, AI.run)
        else 
            AI.timerID = timer.performWithDelay( 2000, AI.run)
        end

    end


    return AI
end


