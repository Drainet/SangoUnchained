EnemySet = {}
monsterFireball = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_fireball")
monsterSmashball = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_smashball")
monsterCannon = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_Cannon")
monsterSlime = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_Slime")
monsterKnifemo = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_Knifemo")
monsterGiantSlime = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_giantSlime")
flappybird = require ("kalacool.sango.Classes.Objects.Character.Enemy.Monster_flappybird")

chasingTrap = require ("kalacool.sango.Classes.Objects.World.InteractiveWorld.chasingTrap")



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
	elseif config.ID == 99 then
    	local monster = monsterKnifemo.new(config)
		return monster
	elseif config.ID == 98 then
    	local monster = monsterGiantSlime.new(config)
		return monster
	elseif config.ID == 301 then
    	local monster = chasingTrap.new(config)
		return monster
	elseif config.ID == 302 then
    	local monster = flappybird.new(config)
		return monster

	end

end
