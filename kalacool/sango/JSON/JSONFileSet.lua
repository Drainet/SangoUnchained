local JSONFileHelper  = require "kalacool.sango.JSON.JSONFileHelper"

JSONFileSet = {}
JSONFileSet.playerTable = JSONFileHelper.loadTable('player.json')
JSONFileSet.levelTable  = JSONFileHelper.loadTable('level.json')
JSONFileSet.weaponStoreTable  = JSONFileHelper.loadTable('weaponStore.json')
JSONFileSet.characterStoreTable  = JSONFileHelper.loadTable('characterStore.json')
if JSONFileSet.playerTable == nil then 
	playerJson = {}
	playerJson.character = "Doggy"
	playerJson.characterID = 1
	playerJson.weapon1 = "DAO-12"
	playerJson.weapon1ID = 1
	playerJson.weapon2 = "Kar-98"
	playerJson.weapon2ID = 2
	playerJson.firstPerk = ""
	playerJson.description = ""
	JSONFileSet.playerTable = playerJson
	JSONFileHelper.saveTable(playerJson,'player.json')
	end

if JSONFileSet.levelTable  == nil then 
	levelJson = {}
	levelJson[1] = {}
	levelJson[1].LVName = '1-1'
	levelJson[1].star = "000"
	levelJson[2] = {}
	levelJson[2].LVName = '1-2'
	levelJson[2].star = "000"
	levelJson[3] = {}
	levelJson[3].LVName = '1-3'
	levelJson[3].star = "000"
	levelJson[4] = {}
	levelJson[4].LVName = '1-4'
	levelJson[4].star = "000"
	JSONFileSet.levelTable = levelJson
	JSONFileHelper.saveTable(levelJson,'level.json')
	end

if JSONFileSet.weaponStoreTable  == nil then 
	weaponStoreJson = {}
	weaponStoreJson[1] ={}
	weaponStoreJson[1].itemName = "DAO-12"
	weaponStoreJson[1].weaponStoreItemID = 1
	weaponStoreJson[1].price = 1000
	weaponStoreJson[1].unlock = true
	weaponStoreJson[1].descripion = ""
	weaponStoreJson[1].spcialUnclockDescription = ""

	weaponStoreJson[2] ={}
	weaponStoreJson[2].itemName = "Kar-98"
	weaponStoreJson[2].weaponStoreItemID = 2
	weaponStoreJson[2].price = 1000
	weaponStoreJson[2].unlock = true
	weaponStoreJson[2].descripion = ""
	weaponStoreJson[2].spcialUnclockDescription = ""

	weaponStoreJson[3] ={}
	weaponStoreJson[3].itemName = "XBOX"
	weaponStoreJson[3].weaponStoreItemID = 3
	weaponStoreJson[3].price = 1000
	weaponStoreJson[3].unlock = true
	weaponStoreJson[3].descripion = ""
	weaponStoreJson[3].spcialUnclockDescription = ""
	JSONFileSet.weaponStoreTable = weaponStoreJson
	JSONFileHelper.saveTable(weaponStoreJson,'weaponStore.json')
	end

if JSONFileSet.characterStoreTable  == nil then 
	characterStoreJson = {}
	characterStoreJson[1] ={}
	characterStoreJson[1].itemName = "Doggy"
	characterStoreJson[1].characterStoreItemID = 1
	characterStoreJson[1].price = 1000
	characterStoreJson[1].unlock = true
	characterStoreJson[1].descripion = ""
	characterStoreJson[1].spcialUnclockDescription = ""

	characterStoreJson[2] ={}
	characterStoreJson[2].itemName = "Shadow"
	characterStoreJson[2].characterStoreItemID = 2
	characterStoreJson[2].price = 1000
	characterStoreJson[2].unlock = true
	characterStoreJson[2].descripion = ""
	characterStoreJson[2].spcialUnclockDescription = ""

	JSONFileSet.characterStoreTable = characterStoreJson
	JSONFileHelper.saveTable(characterStoreJson,'characterStore.json')
	end

function JSONFileSet:savePlayerTable()
	JSONFileHelper.saveTable(self.playerTable,'player.json')
	end
function JSONFileSet:saveLevelTable()
	JSONFileHelper.saveTable(self.levelTable,'level.json')
	end
function JSONFileSet:saveWeaponStoreTable()
	JSONFileHelper.saveTable(self.weaponStore,'weaponStore.json')
	end
function JSONFileSet:saveCharacterStoreTable()
	JSONFileHelper.saveTable(self.characterStoreTable,'characterStore.json')
	end


return JSONFileSet