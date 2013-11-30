
local DoggyClass  = require "kalacool.sango.Classes.Objects.Character.Player.Doggy"
local CatClass  = require "kalacool.sango.Classes.Objects.Character.Player.Cat"
local shadow  = require "kalacool.sango.Classes.Objects.Character.Player.shadow"
PlayerSet={}

function PlayerSet.newDoggy(config)


	return DoggyClass.new(config)
end


function PlayerSet.newCat(config)


	return CatClass.new(config)
end

function PlayerSet.newShadow(config)


	return shadow.new(config)
end
return PlayerSet