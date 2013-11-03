EnemySet = {}
monsterFireball = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_fireball")

function EnemySet.new_Monster_Fireball(config)

    local monster = monsterFireball.new(config)
    
    return monster
end