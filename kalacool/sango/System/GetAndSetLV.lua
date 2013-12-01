module(..., package.seeall)

local JSONtable = require "kalacool.sango.JSON.JSONFileSet"

function getCurLevelConfig(config)
	local LevelConfig = {}
	local index = tonumber(config.num)

	LevelConfig.LVName 	= JSONtable.levelTable[index].LVName
	LevelConfig.star 	= JSONtable.levelTable[index].star
	LevelConfig.pass 	= JSONtable.levelTable[index].pass
		
	return LevelConfig
end

function setCurLevelConfig(newCurlevelConfig)
	local LevelConfig = {}
	local index = tonumber(newCurlevelConfig.num)

	JSONtable.levelTable[index].star = newCurlevelConfig.star
	JSONtable.levelTable[index].pass = newCurlevelConfig.pass

	JSONtable:saveLevelTable()

end