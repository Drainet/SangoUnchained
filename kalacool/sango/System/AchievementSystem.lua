module(..., package.seeall)

local scene = scene
local achievementConfigClass = require "kalacool.sango.System.GetAndSetAch"

function new(config)

--[[
---------------------------------------------------------------------------
    this is achievement system. you just need dispatchEvent to this module,
and it will unlocked !

---------------------------------------------------------------------------
]]--
    local Content = display.newGroup()
    local achievementImage
    local newAchievementConfig = {}
    local popOutAchievement = {}
    local curAchievement = achievementConfigClass.getCurAchievementConfig()

-------- Initalize Function Start --------
    local function removePopOut()
        popOutAchievement.achievementBkgrd:removeSelf()
        popOutAchievement.achievementBkgrd = nil
        popOutAchievement.achievementImage:removeSelf()
        popOutAchievement.achievementImage = nil
        popOutAchievement.achievementTitle:removeSelf()
        popOutAchievement.achievementTitle = nil
    end

    local function addPopOut()
        if curAchievement[newAchievementConfig.num].unlock == false then
            popOutAchievement.achievementBkgrd = display.newRect( display.contentWidth/2, 200, 700, 150 )
            popOutAchievement.achievementBkgrd:setFillColor(0, 0, 0)
            popOutAchievement.achievementImage = display.newImage( curAchievement[newAchievementConfig.num].image, display.contentWidth/2-200, 200 )
            popOutAchievement.achievementTitle = display.newText(curAchievement[newAchievementConfig.num].achName, display.contentWidth/2 , 200, native.systemFontBold, 30)
            timer.performWithDelay( 2000, removePopOut )
        end
    end
-------- Initalize Function End --------

-------- Edit Achievement Start --------
    scene:addEventListener( 'Ach1', Content )
    function Content.Ach1()
        newAchievementConfig.num = 1
        addPopOut()
        achievementConfigClass.setCurAchievementConfig(newAchievementConfig)

        scene:removeEventListener( 'Ach1', Content )
    end

    scene:addEventListener( 'Ach2', Content )
    function Content.Ach2()
        newAchievementConfig.num = 2
        addPopOut()
        achievementConfigClass.setCurAchievementConfig(newAchievementConfig)

        scene:removeEventListener( 'Ach2', Content )
    end
-------- Edit Achievement End --------

-------- Dispose Function Start --------
    scene:addEventListener( 'removeAllEvent', Content )
    function Content.removeAllEvent()
        scene:removeEventListener( 'Ach1', Content )
        scene:removeEventListener( 'Ach2', Content )
    end
-------- Dispose Function End --------

-------- define function Start--------




-------- Set which star you can collect in this level --------

--------

 
    ------------------- Save your record Start ---------------
        -- local newCurLevelConfig={}
        -- newCurLevelConfig.num = tonumber( (storyboard.getCurrentSceneName()):sub(string.find(storyboard.getCurrentSceneName(), "-")+1) )
        
        -- local levelConfigClass = require "kalacool.sango.System.GetAndSetLV"
        -- newCurLevelConfig.star = starVariable
        -- newCurLevelConfig.pass = true
        -- levelConfigClass.setCurLevelConfig(newCurLevelConfig)
    ------------------- Save your record End ---------------

	return Content

end