EnemySet = {}
monsterFireball = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_fireball")
monsterSmashball = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_smashball")
monsterCannon = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_Cannon")
monsterSlime = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_Slime")

----ID = 1
function EnemySet.newMonster(config)
	if config.ID 	 == 1 then
    	local monster = monsterFireball.new(config)
    	return monster
	elseif config.ID == 2 then
		local monster = monsterSmashball.new(config)
    	return monster
    elseif config.ID == 3 then
    	local monster = monsterCannon.new(config)
		return monster
	elseif config.ID == 4 then
    	local monster = monsterSlime.new(config)
		return monster
	end
end
