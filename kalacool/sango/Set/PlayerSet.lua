
local Doggy  = require "kalacool.sango.Classes.Objects.Character.Player.Doggy"
local Cat  = require "kalacool.sango.Classes.Objects.Character.Player.Cat"
local Shadow  = require "kalacool.sango.Classes.Objects.Character.Player.shadow"
PlayerSet={}

-- function PlayerSet.newDoggy(config)


-- 	return DoggyClass.new(config)
-- end


-- function PlayerSet.newCat(config)


-- 	return CatClass.new(config)
-- end

-- function PlayerSet.newShadow(config)


-- 	return shadow.new(config)
-- end

function PlayerSet.new(name,config)
	if(name == "Shadow")then
		return Shadow.new(config)
	end

	if(name == "Doggy")then
		return Doggy.new(config)
	end

	
end
return PlayerSet