module(..., package.seeall)

local scene = scene

function new(config)

--[[
---------------------------------------------------------------------------
    this is achievement system. you just need dispatchEvent to this module,
and it will unlocked !

---------------------------------------------------------------------------
]]--
    local Content = display.newGroup()
    local achievement = {}

    scene:addEventListener( 'Ach1', Content )
    function Content.Ach1()
        print("unlock one ach1")
        scene:removeEventListener( 'Ach1', Content )
    end

    scene:addEventListener( 'Ach2', Content )
    function Content.Ach2()
        print("unlock one ach2")
        scene:removeEventListener( 'Ach2', Content )
    end

    scene:addEventListener( 'removeAllEvent', Content )
    function Content.removeAllEvent()
        scene:removeEventListener( 'Ach1', Content )
        scene:removeEventListener( 'Ach2', Content )
    end


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