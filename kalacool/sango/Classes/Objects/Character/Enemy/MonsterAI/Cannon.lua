module (..., package.seeall)

monster_AI = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_AI")



function new(monster , target , option)
    local AI = monster_AI:new()
    -- set AI attribute
    AI.target = target
    AI.monster = monster

    function AI:run()
        if ( AI:isPlayerVisible() ) then
            



        end
    end

    local function AI_RUN()  return AI:run () end
    

    


    return AI
end


