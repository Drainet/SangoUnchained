module(..., package.seeall)
require("kalacool.sango.Set.EnemySet")
local scene = scene
local Monster = {}
local Wave    = {}

function NextWaveHandler(ImageGroup)
    local imageGroup = ImageGroup

    local Content = display.newGroup()
    
    scene:addEventListener( "monsterDeadInWave", Content )
    function Content:monsterDeadInWave(event)
        Wave[tonumber(event.wave)] = Wave[tonumber(event.wave)] - 1
        if (Wave[tonumber(event.wave)] == 0) and Wave[tonumber(event.wave)+1] ~= nil then
            scene:dispatchEvent({name='nextWave', nextWave = tonumber(event.wave) + 1})
        elseif (Wave[tonumber(event.wave)] == 0) and Wave[tonumber(event.wave)+1] == nil then
            scene:dispatchEvent({name='levelComplete'})
            display.getCurrentStage():setFocus( nil )
            local completeClass = require "kalacool.sango.HUD.YouComplete"
            local complete = completeClass.new()
        end     
    end

    scene:addEventListener( "nextWave", Content )
    function Content:nextWave(event)

        local Text = display.newText("", display.contentWidth/2, display.contentHeight/2 -100, native.systemFont, 100)

        local function Ready()
            local function Go()
                local function noText()
                    Text.text = "" 
                    Text = nil
                        for i = 1, Wave[event.nextWave] do
                            imageGroup:insert(EnemySet.newMonster(Monster[1]).image)
                            table.remove(Monster,1)
                        end
                        scene:dispatchEvent( {name='onPlayerShow',target = dog} )
                end
                Text.text = "Go"
                timer.performWithDelay( 800, noText )
            end
            Text.text = "Ready"
            timer.performWithDelay( 800, Go )
        end
        Text.text = "Wave " .. event.nextWave
        timer.performWithDelay( 1500, Ready )
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
        scene:removeEventListener( 'removeAllEvent', Content )
        Wave = nil
        Wave = {}
    end
    -------- Dispose Function End --------

	return Content

end

function addMonster(config)
    -- print(config.ID)
    table.insert(Monster, table.maxn(Monster)+1, config )  
    if Wave[config.wave] == nil then
        Wave[config.wave] = 1
    else 
        Wave[config.wave] = Wave[config.wave] + 1
    end
    -- print(Wave[config.wave]
end

