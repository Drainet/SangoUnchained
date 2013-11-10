local JSONFileHelper  = require "kalacool.sango.JSON.JSONFileHelper"

JSONFileSet = {}
JSONFileSet.playerTable = JSONFileHelper.loadTable('player.json')
JSONFileSet.levelTable  = JSONFileHelper.loadTable('level.json')
JSONFileSet.storeTable  = JSONFileHelper.loadTable('store.json')
if JSONFileSet.playerTable == nil then 
	playerJson = {}
	playerJson.character = "cat"
	playerJson.weapon = "gun"
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

if JSONFileSet.storeTable  == nil then 
	storeJson = {}
	storeJson[1] ={}
	storeJson[1].itemName = "guitar"
	storeJson[1].price = 1000
	storeJson[1].unlock = true
	storeJson[1].descripion = ""
	storeJson[1].spcialUnclockDescription = ""
	JSONFileSet.storeTable = storeJson
	JSONFileHelper.saveTable(storeJson,'store.json')
	end

function JSONFileSet:savePlayerTable()
	JSONFileHelper.saveTable(self.playerTable,'player.json')
	end
function JSONFileSet:saveLevelTable()
	JSONFileHelper.saveTable(self.levelTable,'level.json')
	end
function JSONFileSet:saveStoreTable()
	JSONFileHelper.saveTable(self.storeTable,'store.json')
	end


return JSONFileSet