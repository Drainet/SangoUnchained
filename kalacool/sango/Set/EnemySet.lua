EnemySet = {}
monsterFireball = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_fireball")
monsterCannon = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_Cannon")
monsterSlime = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_Slime")
monsterWarrior = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_Warrior")
function EnemySet.newMonsterFireball(config)
    local monster = monsterFireball.new(config)
    return monster
end

function EnemySet.newMonsterCannon(config)
	local monster = monsterCannon.new(config)
	return monster
end


function EnemySet.newMonsterSlime(config)
	local monster = monsterSlime.new(config)
	return monster
end

function EnemySet.newMonsterWarrior(config)
	local monster = monsterWarrior.new(config)
	return monster
end