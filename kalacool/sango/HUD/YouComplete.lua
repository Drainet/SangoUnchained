module(..., package.seeall)
local scene = scene

function new()
    
    local widget = require( "widget" )
    local storyboard = require( "storyboard" )

    local buttonBackToLvSel
    local buttonNextLevel

    Runtime:removeEventListener( "touch", dog.shoot)
    physics.pause()
	
	local Content = display.newGroup()

------------------- buttonHandler Start ---------------
	local buttonHandler = function( event )
        if event.target.id == "backToLvSel" then
            Content.backToLvSel()
        elseif event.target.id == "buttonNextLevel" then
            Content.buttonNextLevel()        
        end
    end
------------------- buttonHandler End ---------------

------------------- niceText Start ---------------
    niceText = display.newText("GOOD JOB !!", 0, 0, native.systemFont, 180)
    niceText.x = display.contentWidth/2; niceText.y = display.contentHeight/2 - 300
    niceText:setTextColor( 110, 20, 0 )

    transition.to( niceText, { time=1, alpha=0 } )
    transition.to( niceText, { time=100, alpha=1, delay=100, x=display.contentWidth/2, y=display.contentHeight/2 - 100 } )
    
    Content:insert( niceText )
------------------- niceText End ---------------


------------------- buttonBackToLvSel Start ---------------
    buttonBackToLvSel = widget.newButton
        {
            id = "backToLvSel",
            defaultFile = "kalacool/sango/image/UI/pauseMenu/buttonBlue.png",
            label = "Leave",
            fontSize = 28,
            emboss = true,
            onPress = buttonHandler,
        }

    buttonNextLevel = widget.newButton
        {
            id = "buttonNextLevel",
            defaultFile = "kalacool/sango/image/UI/pauseMenu/buttonBlue.png",
            label = "Next",
            fontSize = 28,
            emboss = true,
            onPress = buttonHandler,
        }

    buttonBackToLvSel.x =display.contentWidth/2 - 200 ; buttonBackToLvSel.y = display.contentHeight/2 + 300
    buttonNextLevel.x =display.contentWidth/2 + 200     ; buttonNextLevel.y = display.contentHeight/2 + 300

    ---- If this is the final Level
    if( tonumber( (storyboard.getCurrentSceneName()):sub(string.find(storyboard.getCurrentSceneName(), "-")+1) ) == totalLevel ) then
        buttonNextLevel.isVisible = false
    end

    Content:insert( buttonBackToLvSel )
    Content:insert( buttonNextLevel )
------------------- buttonBackToLvSel End ---------------


------------------- Button Function Start -------------------
    function Content.backToLvSel()
        Content:removeSelf()
        Content = nil
        storyboard.gotoScene( "kalacool.sango.Scene.LevelSelect", "fade", 200  )
        storyboard.removeAll()
    end

    function Content.buttonNextLevel()
        Content:removeSelf()
        Content = nil
        local CurScene = tostring(storyboard.getCurrentSceneName() )
        local numberLV = tonumber(CurScene:sub(string.find(CurScene, "-")+1) )
        local NxtScene = CurScene:sub(1,string.len(CurScene)-1) .. (numberLV + 1)
        scene:dispatchEvent({name='callCentralStop'})
        storyboard.gotoScene( NxtScene, "fade", 200  )
        storyboard.removeAll()
    end
------------------- Button Function End -------------------
		
	return Content

end