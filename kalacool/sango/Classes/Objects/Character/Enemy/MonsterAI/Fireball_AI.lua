module (..., package.seeall)

monster_AI = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_AI")



function new(monster , target)
    local AI = monster_AI:new()
    -- set AI attribute
    AI.target = target
    AI.monster = monster

    dirTable ={
                [1] = {x =  1  , y =  1  },
                [2] = {x =  1  , y = -1  },
                [3] = {x = -1  , y =  1  },
                [4] = {x = -1  , y = -1  }
              }

    function AI.run()
        monster.image.gravityScale = 0
        -- if (AI:isPlayerInPatrolRange() and AI:isPlayerVisible()  and (math.abs(monster.image.y - monster.config.y) <500) ) then
        if (AI:isPlayerInPatrolRange() ) then
           
            if (AI:isPlayerInAttackRange()) then  -- Attack
                -- AI:attack()
                AI:trace()
            else  -- Trace player
                AI:trace()
            end
        -- elseif ( not AI:isMonsterInPatrolRange()) then --Monster not in Patrol Range , back to patrol range
        --     AI:backHome()
        else  --stay
            monster.image:setLinearVelocity( 0, 0 )
            AI:hangingAround()
        end
    end

    function AI:hangingAround()
        R = math.random(1,4)
        --monster:move(dirTable[R].x*0.5 , dirTable[R].y*0.5)
        AI.timerID =  timer.performWithDelay(1000, AI.run)
        AI.timers[1] = AI.timerID
    end

    -- function AI:backHome()
    --     local dir = AI:monsterDir(AI.monster.config)
    --     monster:move(dir.x , dir.y)
    --     AI.timerID =  timer.performWithDelay(500 , AI.run)
    --     AI.timers[1] = AI.timerID
    -- end

    -- function AI:attack()
    --     local dir = AI:monsterDir(target.image)
    --     if (dir.y > 0) then
    --         monster.image.gravityScale = -0.98
    --     else
    --         monster.image.gravityScale = 0.98
    --     end
    --     monster:move(dir.x*1.05, dir.y*1.05)
    --     AI.timerID = timer.performWithDelay(1000 , AI.run)
    --     AI.timers[1] = AI.timerID
    -- end

    function AI:trace()
            if math.abs(target.image.y - monster.image.y) > 30 then
            local dir = AI:monsterDir(target.image)
            local angle = AI:monsterAngle(target.image)
            monster:move(dir.x*math.sin(angle),dir.y*math.cos(angle))
            AI.timerID = timer.performWithDelay(1000, AI.run )

        elseif AI.isPlayerVisible() then
            local dir = AI:monsterDir(target.image)
            local  angle = AI:monsterAngle(target.image)
            monster:move(dir.x*math.sin(angle),dir.y*math.cos(angle))
            AI.timerID = timer.performWithDelay(1000 , AI.run)
        else
            AI.timerID = timer.performWithDelay(1500 , AI.run)
        end
            AI.timers[1] = AI.timerID
    end
    return AI
end


