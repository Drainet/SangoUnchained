module (..., package.seeall)

monster_AI = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_AI")

function new(monster , target , option)
    local AI = monster_AI:new()
    -- set AI attribute
    AI.target = target
    AI.monster = monster
    dirTable = {1 , -1}
    
    function AI.run()
        AI.timerID = nil
        --- monster self in parol range
        if ( AI:isMonsterInPatrolRange() ) then
           
            if (AI:isPlayerVisible() ) then -- can see player
                local dir = AI:monsterDir(target.image)
                monster:move(dir.x,-1)
            end
            AI.timerID =  timer.performWithDelay(4000 , AI.run)
            AI.timers[1] = AI.timerID
        --- monster not in partol range ,then go back    
        else 
            AI.timerID = nil
        end
    end
    
    return AI
end


