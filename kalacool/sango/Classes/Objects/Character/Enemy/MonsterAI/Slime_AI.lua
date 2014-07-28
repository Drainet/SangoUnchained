module (..., package.seeall)

monster_AI = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_AI")



function new(monster , target , option)
    local AI = monster_AI:new()
    -- set AI attribute
    AI.target = target
    AI.monster = monster
    dirTable = {1 , -1}
    AI.onTheGround = false
    function AI.run()
        -- AI.timerID = nil
        --- monster self in parol range
        if ( AI:isPlayerInPatrolRange() ) then
            if(AI.onTheGround==true) then
                AI.onTheGround = false
                
                -- if (AI:isPlayerVisible() ) then -- can see player
                    local dir = AI:monsterDir(target.image)
                    monster:move(dir.x,-1)
                -- else    -- can't see player , hanging around
                --     R = math.random(1,2)
                --     monster:move(dirTable[R] *0.5, -0.8)
                -- end
                
            end
            AI.timerID =  timer.performWithDelay(2000 , AI.run)
            AI.timers[1] = AI.timerID
        --- monster not in partol range ,then go back    
        else 
            -- AI.backHome()
            AI.timerID =  timer.performWithDelay(500 , AI.run)
            AI.timers[1] = AI.timerID
        end


    end
    -- function AI.backHome()
    --     local dir = AI:monsterDir(AI.monster.config)
    --     monster:move(dir.x ,-0.8)
    --     if (AI.timerID == nil) then
    --         AI.timerID =  timer.performWithDelay(1500 , AI.backHome ,2)
    --         AI.timerID2 = timer.performWithDelay(4500, AI.run )
    --         AI.timers[1] = AI.timerID
    --         AI.timers[2] = AI.timerID2
    --     end
    -- end
    -- function AI:stop()
    --     if (AI.timerID ~= nil) then
    --          timer.cancel(AI.timerID)
    --     end
    --     if (AI.timerID2 ~= nil) then
    --          timer.cancel(AI.timerID)
    --     end
    -- end
    return AI
end


