module(..., package.seeall)

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
            -- Content.buttonNextLevel()        
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
        -- Runtime:removeEventListener( "enterFrame", onEveryFrame )
        storyboard.gotoScene( "kalacool.sango.Scene.scene1-2", "fade", 200  )
        storyboard.removeAll()
    end
------------------- Button Function End -------------------
		
	return Content

end