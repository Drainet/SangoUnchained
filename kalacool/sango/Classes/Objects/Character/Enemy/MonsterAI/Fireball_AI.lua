module (..., package.seeall)

monster_AI = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_AI")



function new(monster , target)
    local AI = monster_AI:new()
    -- set AI attribute
    AI.target = target
    AI.monster = monster

    function AI.run()
        if (AI:isPlayerInPatrolRange() and AI:isPlayerVisible()) then
            if (AI:isPlayerInAttackRange()) then  -- Attack
                AI:attack()
            else  -- Trace player
                AI:trace()
            end
        elseif (not AI:isMonsterInPatrolRange() ) then --Monster not in Patrol Range , back to patrol range
            AI:backHome()
        else  --stay
            AI:stay()
        end
    end

    function AI:stay()
        monster:move(0 , 0)
        AI.timerID =  timer.performWithDelay(500 , AI.run)
    end

    function AI:backHome()
        local dir = AI:monsterDir(AI.monster.config)
        monster:move(dir.x*0.5 , dir.y*0.5)
        AI.timerID =  timer.performWithDelay(500 , AI.run)
    end

    function AI:attack()
        local dir = AI:monsterDir(target.image)
        monster:move(dir.x*1.5, dir.y)
        AI.timerID = timer.performWithDelay(1500 , AI.run)
    end

    function AI:trace()
        if math.abs(target.image.y - monster.image.y) > 30 then
            local dir = AI:monsterDir(target.image)
            monster:move(dir.x*0.5,dir.y*0.2)
            AI.timerID = timer.performWithDelay(1000, AI.run )

        elseif AI.isPlayerVisible() then
            local dir = AI:monsterDir(target.image)
            monster:move(dir.x, 0)
            AI.timerID = timer.performWithDelay(100 , AI.run)
        else
            AI.timerID = timer.performWithDelay(1500 , AI.run)
        end

    end
    return AI
end


