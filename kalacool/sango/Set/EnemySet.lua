EnemySet = {}
monsterFireball = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_fireball")
monsterCannon = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_Cannon")
function EnemySet.new_Monster_Fireball(config)
    local monster = monsterFireball.new(config)
    return monster
end

function EnemySet.new_Monster_Cannon(config)
	local monster = monsterCannon.new(config)
	return monster
end