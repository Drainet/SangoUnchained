module (..., package.seeall)

monster_AI = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_AI")
ObjectClass = require('kalacool.sango.Classes.Object')


function new(monster , target , option)
    local AI = monster_AI:new()
    return AI
end


