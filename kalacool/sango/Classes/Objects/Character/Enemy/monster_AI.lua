module (..., package.seeall)

timer = require("timer")



function new(enemy , target , option)
    local ROBOT = {}

    ROBOT.enemy = enemy
   -- ROBOT.target = target
    local monster ={}
    local player = {}
    print("======",enemy.image.x)
    monster.x = enemy.image.x
    monster.y = enemy.image.y
    player.x = target.image.x
    player.y = target.image.y

    

    --- Other function ---    
    function ROBOT:getDistance()
        local distance = math.sqrt( math.pow((monster.x - target.image.x),2) + math.pow((monster.y - target.image.y),2))
        return distance
    end

    function ROBOT:run()
        local dir = 1

        local function AI_RUN()  return ROBOT:run () end

        if monster.y - target.image.y > 10 and ROBOT:getDistance() < 100 then
            ROBOT.enemy:move(0,-300)
            timer.performWithDelay(1000 , AI_RUN )

        elseif ROBOT:getDistance() < 500 then
            ROBOT.enemy:move(ROBOT:enemyDir() * 200, 0)
            timer.performWithDelay(100 , AI_RUN )
        else
            timer.performWithDelay(1000 , AI_RUN )
        end


    end

    function ROBOT:enemyDir()
        local dir
        print(target.image.x)
        if  target.image.x - monster.x> 0 then
            dir = 1
        else
            dir = -1
        end
        return dir
    end


    return ROBOT
end


