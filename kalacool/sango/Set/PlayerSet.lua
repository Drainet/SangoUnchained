
local DoggyClass  = require "kalacool.sango.Classes.Objects.Character.Player.Doggy"
local CatClass  = require "kalacool.sango.Classes.Objects.Character.Player.Cat"
PlayerSet={}

function PlayerSet.newDoggy(config)


	return DoggyClass.new(config)
end


function PlayerSet.newCat(config)


	return CatClass.new(config)
end

return PlayerSet