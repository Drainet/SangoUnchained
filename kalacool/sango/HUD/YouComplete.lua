module(..., package.seeall)

function new()
    
    local widget = require( "widget" )
    local storyboard = require( "storyboard" )

    Runtime:removeEventListener( "touch", dog.shoot)
    physics.pause()
	
	local Content = display.newGroup()

------------------- buttonHandler Start ---------------
	local buttonHandler = function( event )
        if event.target.id == "backToLvSel" then
            Content.backToLvSel()
        end
    end
------------------- buttonHandler End ---------------

------------------- niceText Start ---------------
    niceText = display.newText("GOOD JOB !!", 0, 0, native.systemFont, 180)
    niceText.x = display.contentWidth/2; niceText.y = display.contentHeight/2 - 300

    transition.to( niceText, { time=1, alpha=0 } )
    transition.to( niceText, { time=100, alpha=1, delay=100, x=display.contentWidth/2, y=display.contentHeight/2 - 100 } )

    Content:insert( niceText )
------------------- niceText End ---------------


------------------- buttonBackToLvSel Start ---------------
    buttonBackToLvSel = widget.newButton
        {
            id = "backToLvSel",
            defaultFile = "kalacool/sango/image/UI/pauseMenu/buttonBlue.png",
            label = "Back",
            fontSize = 28,
            emboss = true,
            onPress = buttonHandler,
        }

        buttonBackToLvSel.x =display.contentWidth/2; buttonBackToLvSel.y = display.contentHeight/2 + 300

    Content:insert( buttonBackToLvSel )
------------------- buttonBackToLvSel End ---------------


------------------- Button Function Start -------------------
    function Content.backToLvSel()
        Content:removeSelf()
        storyboard.gotoScene( "kalacool.sango.Scene.LevelSelect", "fade", 200  )
        storyboard.removeAll()
    end
------------------- Button Function End -------------------
		
	return Content

end