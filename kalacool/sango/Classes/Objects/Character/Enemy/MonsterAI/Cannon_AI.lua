module (..., package.seeall)

monster_AI = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_AI")



function new(monster , target , option)
    local AI = monster_AI:new()
    -- set AI attribute
    AI.target = target
    AI.monster = monster

    function AI.run()
        if ( AI:isPlayerVisible() and target.image.x - monster.image.x > 0) then
            angle =  math.acos( math.abs(monster.image.y - target.image.y) /  AI:getDistance() )
            dir = AI:monsterDir(target.image)
            monster:attack(angle,dir.x,dir.y)

            AI.timerID = timer.performWithDelay( monster.attackSpeed, AI.run,1)
        else 
            AI.timerID = timer.performWithDelay( 2000, AI.run,1)
        end
            AI.timers[1] = AI.timerID
    end


    return AI
end


