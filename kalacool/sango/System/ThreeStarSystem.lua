module(..., package.seeall)
local storyboard = require( "storyboard" )
local scene = scene

function new(config)

--[[
---------------------------------------------------------------------------
    this is star system for achievement, there are 4 kinds of
star you can collect.

    index   |   star    |     description

    1       |   health  |   did't dead
    2       |   weapon  |   use specific weapon to complete level. If this is enable, you 
                            have to add variable "wp1" and "wp2" at "starSystemClass.new" 
                            in scene.lua
    3       |   time    |   complete the level in limited time
                            ct = counting time
    4       |   collect |   get the special item in level

---------------------------------------------------------------------------
]]--
    local Content = display.newGroup()


-------- define function Start--------

---- Health ----
    function Content.HealthInit(thisStar)
        scene:addEventListener( 'HealthFail', Content )
        function Content.HealthFail()
            thisStar.pass = false
            scene:removeEventListener( 'HealthFail', Content )
        end
    end
----
---- Weapon ----
    function Content.WeaponInit(thisStar)
        local characterConfigClass = require "kalacool.sango.System.GetAndSetStatus"
        characterConfig = characterConfigClass.getCurCharacterConfig()
        if config.wp1 ~= characterConfig.wpn1ID or config.wp2 ~= characterConfig.wpn2ID then
            thisStar.pass = false
        end
    end
----
---- Time ----
    function Content.TimeInit(thisStar)
        local countingTime = display.newText(Content, "", display.contentWidth-80, display.contentHeight-80, native.systemFont, 50)
        local remainTime = config.ct

        function Content.counting()
            if remainTime >= 0 then
                countingTime.text = remainTime
                remainTime = remainTime - 1
                rt = timer.performWithDelay(1000, Content.counting, 1)
            else
                thisStar.pass = false
            end
        end
        Content.counting()
    end
----
---- Collect ----
    function Content.CollectInit(thisStar)
        if thisStar.index == 1 then
            scene:addEventListener( 'GotCollectableItemOne', Content )
            thisStar.pass = false
            function Content.GotCollectableItemOne()
                thisStar.pass = true
            end
        elseif thisStar.index == 2 then
            scene:addEventListener( 'GotCollectableItemTwo', Content )
            thisStar.pass = false
            function Content.GotCollectableItemTwo()
                thisStar.pass = true
            end
        elseif thisStar.index == 3 then
            scene:addEventListener( 'GotCollectableItemThr', Content )
            thisStar.pass = false
            function Content.GotCollectableItemThr()
                thisStar.pass = true
            end
        end
    end
----
-------- define function End-------


-------- Set which star you can collect in this level --------
    local star = {}
    local sheetData = { width=181, height=167, numFrames=2 }
    local sheet = graphics.newImageSheet( "kalacool/sango/image/UI/starSystem/star.png", sheetData )
    local sequenceData =
    {
        { name="emptyStar"  , start=1, count=1 } ,
        { name="yellowStar" , start=2, count=1 }
    }

    star[1] = {}
    star[2] = {}
    star[3] = {}

    star[1].index = 1
    star[2].index = 2
    star[3].index = 3

    star[1].type = config.fs    --First Star
    star[2].type = config.ss    --Second Star
    star[3].type = config.ts    --Third Star

    star[1].pass = true
    star[2].pass = true
    star[3].pass = true

    star[1].image   = display.newSprite( sheet, sequenceData )
    star[2].image   = display.newSprite( sheet, sequenceData )
    star[3].image   = display.newSprite( sheet, sequenceData )

    star[1].image.x   = display.contentWidth/2 - 170    ; star[1].image.y   = 100
    star[2].image.x   = display.contentWidth/2          ; star[2].image.y   = 100
    star[3].image.x   = display.contentWidth/2 + 170    ; star[3].image.y   = 100

    Content:insert(star[1].image)
    Content:insert(star[2].image)
    Content:insert(star[3].image)
--------

    for i = 1, table.maxn(star) do
        local thisStar = star[i]

        if thisStar.type == 1 then 
            Content.HealthInit(thisStar)
        elseif thisStar.type == 2 then
            Content.WeaponInit(thisStar)
        elseif thisStar.type == 3 then
            Content.TimeInit(thisStar)
        elseif thisStar.type == 4 then
            Content.CollectInit(thisStar)
        end
    end

    scene:addEventListener( 'pauseAllEvent', Content )
    function Content.pauseAllEvent()
        if rt ~= nil then
            timer.pause( rt ) 
        end
    end

    scene:addEventListener( 'resumeAllEvent', Content )
    function Content.resumeAllEvent()
        timer.resume( rt ) 
    end

    function Content.levelComplete()
        for i = 1, table.maxn(star) do
            if star[i].pass == true then
                star[i].image:setSequence( "yellowStar" )
            end
        end
        Content.removeAllEvent()
        Content.setLevelStar()
    end

    function Content.removeAllEvent()
        scene:removeEventListener( 'levelComplete', Content )
        scene:removeEventListener( 'GotCollectableItemOne', Content )
        scene:removeEventListener( 'GotCollectableItemTwo', Content )
        scene:removeEventListener( 'GotCollectableItemThr', Content )
        scene:removeEventListener( 'HealthFail', Content )
        scene:removeEventListener( 'removeAllEvent', Content )
    end

    function Content.setLevelStar()
        local starVariable = 0
        if star[1].pass == true then
            starVariable = starVariable + 4
        end
        if star[2].pass == true then
            starVariable = starVariable + 2
        end
        if star[3].pass == true then
            starVariable = starVariable + 1
        end
    ------------------- Save your record Start ---------------
        local newCurLevelConfig={}
        newCurLevelConfig.num = tonumber( (storyboard.getCurrentSceneName()):sub(string.find(storyboard.getCurrentSceneName(), "-")+1) )
        
        local levelConfigClass = require "kalacool.sango.System.GetAndSetLV"
        newCurLevelConfig.star = starVariable
        newCurLevelConfig.pass = true
        levelConfigClass.setCurLevelConfig(newCurLevelConfig)
    ------------------- Save your record End ---------------
    end

    scene:addEventListener( 'levelComplete', Content )
    scene:addEventListener( 'removeAllEvent', Content )

	return Content

end