module(..., package.seeall)

local JSONtable = require "kalacool.sango.JSON.JSONFileSet"

function getCurAchievementConfig()
	local achievementConfig = {}
	local i = 1

	while JSONtable.achievementTable[i] ~= nil do
		achievementConfig[i] = {}

		achievementConfig[i].achName 				= JSONtable.achievementTable[i].achName
		achievementConfig[i].achievementItemID 		= JSONtable.achievementTable[i].achievementItemID
		achievementConfig[i].image					= JSONtable.achievementTable[i].image
		achievementConfig[i].unlock					= JSONtable.achievementTable[i].unlock
		achievementConfig[i].description			= JSONtable.achievementTable[i].description
		i = i + 1
	end
	-- total Achievements
	achievementConfig.totalAch = i - 1 

	return achievementConfig
end

-- Unlock this Achievement
function setCurAchievementConfig(newCurAchievementConfig)
	local achievementConfig = {}
	local index = tonumber(newCurAchievementConfig.num)

	JSONtable.achievementTable[index].unlock = true

	JSONtable:saveAchievementTable()
end