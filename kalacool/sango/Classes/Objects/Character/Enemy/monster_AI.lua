module (..., package.seeall)

timer = require("timer")



function new()
    local ROBOT = {}

    function ROBOT:getDistance()
        local distance = math.sqrt( math.pow((ROBOT.monster.image.x - ROBOT.target.image.x),2) + math.pow((ROBOT.monster.image.y - ROBOT.target.image.y),2))
        return distance
    end

    function ROBOT:monsterDir()
        local dir={}
        if  ROBOT.target.image.x > ROBOT.monster.image.x then
            dir.x = 1
        else
            dir.x = -1
        end
        if ROBOT.target.image.y > ROBOT.monster.image.y  then
            dir.y = 1
        else
            dir.y = -1
        end
        return dir
    end


    return ROBOT
end


