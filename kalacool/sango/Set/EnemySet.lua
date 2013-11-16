EnemySet = {}
monsterFireball = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_fireball")
monsterCannon = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_Cannon")
function EnemySet.newMonsterFireball(config)
    local monster = monsterFireball.new(config)
    return monster
end

function EnemySet.newMonsterCannon(config)
	local monster = monsterCannon.new(config)
	return monster
end