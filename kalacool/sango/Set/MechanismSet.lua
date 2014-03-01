MechanismSet = {}
	button =  require("kalacool.sango.Classes.Objects.Mechanisms.Triggers.Trigger_Button")
	receiver =  require("kalacool.sango.Classes.Objects.Mechanisms.Receivers.Receiver_Rock")
	disappearFloor = require("kalacool.sango.Classes.Objects.Mechanisms.SelfTriggers.SelfTrigger_DisappearFloor")
	destructibleBlock =  require("kalacool.sango.Classes.Objects.Mechanisms.Others.DestructibleBlock")
	destructibleBlockStone =  require("kalacool.sango.Classes.Objects.Mechanisms.Others.blockStone")
	powerGenerator = require("kalacool.sango.Classes.Objects.Mechanisms.Triggers.Trigger_PowerGenerator")
	powerDoor =  require("kalacool.sango.Classes.Objects.Mechanisms.Receivers.Receiver_PowerDoor")



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

	function  MechanismSet.newDestructibleBlock(config)
		local mechanism  = destructibleBlock.new(config)
		return mechanism 
	end

	function  MechanismSet.newDestructibleBlockStone(config)
		local mechanism  = destructibleBlockStone.new(config)
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

