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
            timer.performWithDelay( 5000, removePopOut )
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

    scene:addEventListener( 'Ach3', Content )
    function Content.Ach3()
        newAchievementConfig.num = 3
        addPopOut()
        achievementConfigClass.setCurAchievementConfig(newAchievementConfig)

        scene:removeEventListener( 'Ach3', Content )
    end

    scene:addEventListener( 'Ach4', Content )
    function Content.Ach4()
        newAchievementConfig.num = 4
        addPopOut()
        achievementConfigClass.setCurAchievementConfig(newAchievementConfig)

        scene:removeEventListener( 'Ach4', Content )
    end

    scene:addEventListener( 'Ach5', Content )
    function Content.Ach5()
        newAchievementConfig.num = 5
        addPopOut()
        achievementConfigClass.setCurAchievementConfig(newAchievementConfig)

        scene:removeEventListener( 'Ach5', Content )
    end
-------- Edit Achievement End --------

-------- Dispose Function Start --------
    scene:addEventListener( 'removeAllEvent', Content )
    function Content.removeAllEvent()
        scene:removeEventListener( 'Ach1', Content )
        scene:removeEventListener( 'Ach2', Content )
        scene:removeEventListener( 'Ach3', Content )
        scene:removeEventListener( 'Ach4', Content )
        scene:removeEventListener( 'Ach5', Content )
    end
-------- Dispose Function End --------

	return Content

end