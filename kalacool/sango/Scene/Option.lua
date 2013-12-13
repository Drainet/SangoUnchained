local storyboard = require( "storyboard" )
local widget = require( "widget" )
local scene = storyboard.newScene()

-- Called when the scene's view does not exist:
function scene:createScene( event )

    local screenGroup = self.view

----------------- Background Start -------------
    local background = display.newImage( "kalacool/sango/image/UI/Menu/menu_background.png" )
    screenGroup:insert( background )
----------------- Background End -------------


----------------- buttonHandler Start -------------
    local buttonHandler = function( event )
        if event.target.id == "Audio" then
            --storyboard.gotoScene( "kalacool.sango.Scene.", "fade", 200  )
        elseif event.target.id == "Credit" then
            --storyboard.gotoScene( "kalacool.sango.Scene.", "fade", 200  )
        elseif event.target.id == "Back" then
            storyboard.gotoScene( "kalacool.sango.Scene.Menu", "fade", 200  )
        end
    end
----------------- buttonHandler End -------------


----------------- Option Buttion Start -------------
    local buttonAudio = widget.newButton
        {
            id = "Audio",
            defaultFile = "kalacool/sango/image/UI/Menu/buttonBlue.png",
            overFile = "kalacool/sango/image/UI/Menu/buttonOrange.png",
            label = "Audio",
            font = "arial",
            fontSize = 28,
            emboss = true,
            onPress = buttonHandler,
        }

    local buttonCredit = widget.newButton
        {
            id = "Credit",
            defaultFile = "kalacool/sango/image/UI/Menu/buttonBlue.png",
            overFile = "kalacool/sango/image/UI/Menu/buttonOrange.png",
            label = "Credit",
            font = "arial",
            fontSize = 28,
            emboss = true,
            onPress = buttonHandler,
        }

    local buttonBack = widget.newButton
        {
            id = "Back",
            defaultFile = "kalacool/sango/image/UI/Menu/buttonBlue.png",
            overFile = "kalacool/sango/image/UI/Menu/buttonOrange.png",
            label = "Back",
            font = "arial",
            fontSize = 28,
            emboss = true,
            onPress = buttonHandler,
        }
    background.x = display.contentWidth/2       ; background.y = display.contentHeight/2
    buttonAudio.x =display.contentWidth/2; buttonAudio.y = display.contentHeight/2
    buttonCredit.x =display.contentWidth/2; buttonCredit.y = display.contentHeight/2+100
    buttonBack.x =display.contentWidth/2; buttonBack.y = display.contentHeight/2+200

    screenGroup:insert( buttonCredit )
    screenGroup:insert( buttonAudio )
    screenGroup:insert( buttonBack )
----------------- Option Buttion End -------------


end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    storyboard.removeScene( storyboard.getPrevious() )
    local group = self.view

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view
end

-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
    local group = self.view
end



-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene