module (..., package.seeall)

timer = require("timer")



function new()
    local ROBOT = {}

    function ROBOT:getDistance()
        local distance = math.sqrt( math.pow((ROBOT.monster.image.x - ROBOT.target.image.x),2) + math.pow((ROBOT.monster.image.y - ROBOT.target.image.y),2))
        return distance
    end

    function ROBOT:monsterDir(target)
        local dir={}
        if  target.x > ROBOT.monster.image.x then
            dir.x = 1
        else
            dir.x = -1
        end
        if target.y > ROBOT.monster.image.y  then
            dir.y = 1
        else
            dir.y = -1
        end
        return dir
    end    
    -- stop AI
    function ROBOT:stop()
        timer.cancel(ROBOT.timerID)
    end

    -- find if player is in Patrol Range
    function ROBOT:isPlayerInPatrolRange()
        if (ROBOT.target.image.x > ROBOT.monster.config.x and ROBOT.target.image.x < ROBOT.monster.config.xR) then
            return true
        else 
            return false
        end
    end
    
    -- find if player is Visible
    function ROBOT:isPlayerVisible()
        if (ROBOT:getDistance() < ROBOT.monster.visibleDistance) then
            return true
        else
            return false
        end
    end

    --find if player is in attack range
    function ROBOT:isPlayerInAttackRange()
        if (ROBOT:getDistance() < ROBOT.monster.attackRange) then
            return true
        else
            return false
        end
    end

    -- find if monster is in Patrol range
    function ROBOT:isMonsterInPatrolRange()
        if (ROBOT.monster.image.x < (ROBOT.monster.config.x +50)  and ROBOT.monster.image.x > (ROBOT.monster.config.x-50) ) then
            return true
        else
            return false
        end
    end


    return ROBOT
end


