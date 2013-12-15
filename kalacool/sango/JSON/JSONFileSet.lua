local JSONFileHelper  = require "kalacool.sango.JSON.JSONFileHelper"

JSONFileSet = {}
JSONFileSet.playerTable 			= JSONFileHelper.loadTable('player.json')
JSONFileSet.levelTable  			= JSONFileHelper.loadTable('level.json')
JSONFileSet.weaponStoreTable  		= JSONFileHelper.loadTable('weaponStore.json')
JSONFileSet.characterStoreTable 	= JSONFileHelper.loadTable('characterStore.json')
JSONFileSet.achievementTable  		= JSONFileHelper.loadTable('achievement.json')


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
	levelJson[1].star = 0
	levelJson[1].pass = false

	levelJson[2] = {}
	levelJson[2].LVName = '1-2'
	levelJson[2].star = 0
	levelJson[2].pass = false

	levelJson[3] = {}
	levelJson[3].LVName = '1-3'
	levelJson[3].star = 0
	levelJson[3].pass = false

	levelJson[4] = {}
	levelJson[4].LVName = '1-4'
	levelJson[4].star = 0
	levelJson[4].pass = false

	levelJson[5] = {}
	levelJson[5].LVName = '1-5'
	levelJson[5].star = 0
	levelJson[5].pass = false

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
	weaponStoreJson[1].description = ""
	weaponStoreJson[1].spcialUnclockDescription = ""

	weaponStoreJson[2] ={}
	weaponStoreJson[2].itemName = "Kar-98"
	weaponStoreJson[2].weaponStoreItemID = 2
	weaponStoreJson[2].price = 1000
	weaponStoreJson[2].unlock = true
	weaponStoreJson[2].description = ""
	weaponStoreJson[2].spcialUnclockDescription = ""

	weaponStoreJson[3] ={}
	weaponStoreJson[3].itemName = "XBOW"
	weaponStoreJson[3].weaponStoreItemID = 3
	weaponStoreJson[3].price = 1000
	weaponStoreJson[3].unlock = true
	weaponStoreJson[3].description = ""
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
	characterStoreJson[1].description = ""
	characterStoreJson[1].spcialUnclockDescription = ""

	characterStoreJson[2] ={}
	characterStoreJson[2].itemName = "Shadow"
	characterStoreJson[2].characterStoreItemID = 2
	characterStoreJson[2].price = 1000
	characterStoreJson[2].unlock = true
	characterStoreJson[2].description = ""
	characterStoreJson[2].spcialUnclockDescription = ""

	JSONFileSet.characterStoreTable = characterStoreJson
	JSONFileHelper.saveTable(characterStoreJson,'characterStore.json')
	end

if JSONFileSet.achievementTable  == nil then 
	achievementStoreJson = {}
	achievementStoreJson[1] ={}
	achievementStoreJson[1].achName = "First Shot"
	achievementStoreJson[1].achievementItemID = 1
	achievementStoreJson[1].image = "kalacool/sango/image/UI/Achievement/ach1.png"
	achievementStoreJson[1].unlock = false
	achievementStoreJson[1].description = "Use your weapon for first time!"

	achievementStoreJson[2] ={}
	achievementStoreJson[2].achName = "Meet the Shadow"
	achievementStoreJson[2].achievementItemID = 2
	achievementStoreJson[2].image = "kalacool/sango/image/UI/Achievement/ach2.png"
	achievementStoreJson[2].unlock = false
	achievementStoreJson[2].description = "Use Character - Shadow"

	JSONFileSet.achievementTable = achievementStoreJson
	JSONFileHelper.saveTable(achievementStoreJson,'achievement.json')
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
function JSONFileSet:saveAchievementTable()
	JSONFileHelper.saveTable(self.achievementTable,'achievement.json')
	end

return JSONFileSet