module(..., package.seeall)

local JSONtable = require "kalacool.sango.JSON.JSONFileSet"

function getCurLevelConfig()

	local LevelConfig = {}
	characterConfig.char 	= JSONtable.playerTable.character
	characterConfig.charID 	= JSONtable.playerTable.characterID
	characterConfig.wpn1 	= JSONtable.playerTable.weapon1 
	characterConfig.wpn1ID 	= JSONtable.playerTable.weapon1ID 
	characterConfig.wpn2 	= JSONtable.playerTable.weapon2
	characterConfig.wpn2ID 	= JSONtable.playerTable.weapon2ID
		
	return characterConfig
end

function getCharacterStoreItemConfig(config)
	local characterConfig = {}
	local index = tonumber(config.num)
	characterConfig.charName 					= JSONtable.characterStoreTable[index].itemName
	characterConfig.charID	 					= JSONtable.characterStoreTable[index].characterStoreItemID
	characterConfig.price 						= JSONtable.characterStoreTable[index].price
	characterConfig.unlock 						= JSONtable.characterStoreTable[index].unlock
	characterConfig.descripion 					= JSONtable.characterStoreTable[index].descripion
	characterConfig.spcialUnclockDescription 	= JSONtable.characterStoreTable[index].spcialUnclockDescription
		
	return characterConfig
end

function getWeaponStoreItemConfig(config)
	local weaponConfig = {}
	local index = tonumber(config.num)
	weaponConfig.wpnName 					= JSONtable.weaponStoreTable[index].itemName
	weaponConfig.wpnID	 					= JSONtable.weaponStoreTable[index].weaponStoreItemID
	weaponConfig.price 						= JSONtable.weaponStoreTable[index].price
	weaponConfig.unlock 					= JSONtable.weaponStoreTable[index].unlock
	weaponConfig.descripion 				= JSONtable.weaponStoreTable[index].descripion
	weaponConfig.spcialUnclockDescription 	= JSONtable.weaponStoreTable[index].spcialUnclockDescription
		
	return weaponConfig
end

function setCurCharacterConfig(newCurCharacterConfig)
	local characterConfig = {}
	-- characterConfig.char = JSONtable.playerTable.character
	JSONtable.playerTable.character 	= newCurCharacterConfig.char
	JSONtable.playerTable.characterID 	= newCurCharacterConfig.charID
	JSONtable.playerTable.weapon1 		= newCurCharacterConfig.wpn1
	JSONtable.playerTable.weapon1ID 	= newCurCharacterConfig.wpn1ID
	JSONtable.playerTable.weapon2 		= newCurCharacterConfig.wpn2
	JSONtable.playerTable.weapon2ID 	= newCurCharacterConfig.wpn2ID

	JSONtable:savePlayerTable()

end