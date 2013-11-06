module (..., package.seeall)

monster_AI = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_AI")



function new(monster , target , option)
    local AI = monster_AI:new()
    -- set AI attribute
    AI.target = target
    AI.monster = monster

    function AI:run()
        local dir = 1

        local function AI_RUN()  return AI:run () end
        if math.abs(target.image.y - monster.image.y) > 30 then
            dir = AI:monsterDir()
            monster:move(dir.x*0.5,dir.y*0.2)
            timer.performWithDelay(1000, AI_RUN )

        elseif AI:getDistance() < 1000 then
            dir = AI:monsterDir()
            monster:move(dir.x, 0)
            timer.performWithDelay(100 , AI_RUN )
        else
            timer.performWithDelay(1500 , AI_RUN )
        end


    end


    return AI
end


