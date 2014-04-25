module(..., package.seeall)
require("kalacool.sango.Set.EnemySet")
local scene = scene
local Monster = {}
local Wave    = {}

function NextWaveHandler(ImageGroup)
    local imageGroup = ImageGroup
    local timers = {}
    local Content = display.newGroup()
    local Text = display.newText("", display.contentWidth/2, display.contentHeight/2 -100, native.systemFont, 100)
    
    scene:addEventListener( "monsterDeadInWave", Content )
    function Content:monsterDeadInWave(event)
        Wave[tonumber(event.wave)] = Wave[tonumber(event.wave)] - 1
        if (Wave[tonumber(event.wave)] == 0) and Wave[tonumber(event.wave)+1] ~= nil then
            -- scene:dispatchEvent({name='nextWave', nextWave = tonumber(event.wave) + 1})
        elseif (Wave[tonumber(event.wave)] == 0) and Wave[tonumber(event.wave)+1] == nil then
            -- scene:dispatchEvent({name='levelComplete'})
            -- display.getCurrentStage():setFocus( nil )
            -- local completeClass = require "kalacool.sango.HUD.YouComplete"
            -- local complete = completeClass.new()
        end     
    end

    scene:addEventListener( "nextWave", Content )
    function Content:nextWave(event)
        local function noText()
            Text.text = "" 
            if Wave[event.nextWave] ~= nil then
                for i = 1, Wave[event.nextWave] do
                    imageGroup:insert(EnemySet.newMonster(Monster[1]).image)
                    table.remove(Monster,1)
                end
                scene:dispatchEvent( {name='onPlayerShow',target = dog} )
            end
        end

        -- local function Go()
        --     Text.text = "Go"
        --     timers[3] = timer.performWithDelay( 800, noText )
        -- end

        -- local function Ready()
        --     Text.text = "Ready"
        --     timers[2] = timer.performWithDelay( 800, Go )
        -- end

        -- Text.text = "Wave " .. event.nextWave
        timers[1] = timer.performWithDelay( 1000, noText )
    end

    scene:addEventListener( 'addMonsterWaveAmount', Content )
    function Content:addMonsterWaveAmount(event)
        Wave[event.whichWave] = Wave[event.whichWave] + event.howMany
    end    

    -------- Dispose Function Start --------
    scene:addEventListener( 'removeAllEvent', Content )
    function Content.removeAllEvent()
        imageGroup:removeSelf()
        imageGroup = nil
        scene:removeEventListener( "monsterDeadInWave", Content )
        scene:removeEventListener( "nextWave", Content )
        scene:removeEventListener( 'addMonsterWaveAmount', Content )
        scene:removeEventListener( 'pauseAllEvent', Content )
        scene:removeEventListener( 'removeAllEvent', Content )
        Text:removeSelf()
        Text = nil
        Wave = {}
        Monster = {}
        for i = 1,table.maxn( timers) do
            if(timers[i]~=nil)then
                timer.cancel( timers[i] )
            end
        end
    end
    -------- Dispose Function End --------

    scene:addEventListener( 'pauseAllEvent', Content )
    function Content.pauseAllEvent()
        for i = 1,table.maxn( timers) do
            if(timers[i]~=nil)then
                timer.pause( timers[i] )
            end
        end
    end

    scene:addEventListener( 'resumeAllEvent', Content )
    function Content.resumeAllEvent()
        for i = 1,table.maxn( timers) do
            if(timers[i]~=nil)then
                timer.resume( timers[i] )
            end
        end
    end

	return Content
end

function addMonster(config)
    table.insert(Monster, table.maxn(Monster)+1, config )  
    if Wave[config.wave] == nil then
        Wave[config.wave] = 1
    else 
        Wave[config.wave] = Wave[config.wave] + 1
    end
end

