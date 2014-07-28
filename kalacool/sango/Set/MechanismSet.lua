MechanismSet = {}
	button =  require("kalacool.sango.Classes.Objects.Mechanisms.Triggers.Trigger_Button")
	receiver =  require("kalacool.sango.Classes.Objects.Mechanisms.Receivers.Receiver_Rock")
	disappearFloor = require("kalacool.sango.Classes.Objects.Mechanisms.SelfTriggers.SelfTrigger_DisappearFloor")
	monsterSpawnZone = require("kalacool.sango.Classes.Objects.Mechanisms.Triggers.monsterSpawnZone")
	destructibleBlock =  require("kalacool.sango.Classes.Objects.Mechanisms.Others.DestructibleBlock")
	BlockStone =  require("kalacool.sango.Classes.Objects.Mechanisms.Others.blockStone")
	BlockObs =  require("kalacool.sango.Classes.Objects.Mechanisms.Others.blockObs")
	BlockSand =  require("kalacool.sango.Classes.Objects.Mechanisms.Others.blockSand")
	powerGenerator = require("kalacool.sango.Classes.Objects.Mechanisms.Triggers.Trigger_PowerGenerator")
	powerDoor =  require("kalacool.sango.Classes.Objects.Mechanisms.Receivers.Receiver_PowerDoor")
	dirt =  require("kalacool.sango.Classes.Objects.Mechanisms.Others.Dirt")
	disappearFloorVertical = require("kalacool.sango.Classes.Objects.Mechanisms.SelfTriggers.SelfTrigger_DisappearFloor_vertical")
	
	function MechanismSet.newTriggerButton(config)
	    local mechanism = button.new(config)
	    return mechanism 
	end

	function MechanismSet.newReceiverRock(config)
		local mechanism  = receiver.new(config)
		return mechanism 
	end

	function MechanismSet.newDisappearFloor(config)
		local mechanism  = disappearFloor.new(config)
		return mechanism 
	end

	function MechanismSet.newMonsterSpawnZone(config)
	    local mechanism = monsterSpawnZone.new(config)
	    return mechanism 
	end

	function  MechanismSet.newDestructibleBlock(config)
		local mechanism  = destructibleBlock.new(config)
		return mechanism 
	end

	function  MechanismSet.newDestructibleBlockStone(config)
		local mechanism  = BlockStone.new(config)
		return mechanism 
	end

	function  MechanismSet.newDestructibleBlockObs(config)
		local mechanism  = BlockObs.new(config)
		return mechanism 
	end

	function  MechanismSet.newDestructibleBlockSand(config)
		local mechanism  = BlockSand.new(config)
		return mechanism 
	end

	function MechanismSet.newPowerGenerator(config)
		local mechanism  = powerGenerator.new(config)
		return mechanism 
	end

	function MechanismSet.newPowerDoor (config)
		local mechanism  = powerDoor.new(config)
		return mechanism 
	end

	function  MechanismSet.newDirtBlock(config)
		local mechanism  = dirt.new(config)
		return mechanism 
	end

	function MechanismSet.newDisappearFloorVertical(config)
		local mechanism  = disappearFloorVertical.new(config)
		return mechanism 
	end