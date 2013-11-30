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
        if event.target.id == "Play" then
            storyboard.gotoScene( "kalacool.sango.Scene.LevelSelect", "fade", 200  )
        elseif event.target.id == "Achievement" then
            --storyboard.gotoScene( "kalacool.sango.Scene.Achievement", "fade", 200  )
        elseif event.target.id == "Option" then
            storyboard.gotoScene( "kalacool.sango.Scene.Option", "fade", 200  )
        elseif event.target.id == "Exit" then
            os.exit()
        end
    end
----------------- buttonHandler End -------------


----------------- Menu Buttion Start -------------
    local buttonPlay = widget.newButton
        {
            id = "Play",
            defaultFile = "kalacool/sango/image/UI/Menu/buttonBlue.png",
            overFile = "kalacool/sango/image/UI/Menu/buttonOrange.png",
            label = "Play",
            fontSize = 28,
            emboss = true,
            onPress = buttonHandler,
        }

    local buttonAchievement = widget.newButton
        {
            id = "Achievement",
            defaultFile = "kalacool/sango/image/UI/Menu/buttonBlue.png",
            overFile = "kalacool/sango/image/UI/Menu/buttonOrange.png",
            label = "Achievement",
            fontSize = 28,
            emboss = true,
            onPress = buttonHandler,
        }

    local buttonOption = widget.newButton
        {
            id = "Option",
            defaultFile = "kalacool/sango/image/UI/Menu/buttonBlue.png",
            overFile = "kalacool/sango/image/UI/Menu/buttonOrange.png",
            label = "Option",
            fontSize = 28,
            emboss = true,
            onPress = buttonHandler,
        }

    local buttonExit = widget.newButton
        {
            id = "Exit",
            defaultFile = "kalacool/sango/image/UI/Menu/buttonBlue.png",
            overFile = "kalacool/sango/image/UI/Menu/buttonOrange.png",
            label = "Exit",
            fontSize = 28,
            emboss = true,
            onPress = buttonHandler,
        }

    buttonPlay.x =display.contentWidth/2        ; buttonPlay.y = display.contentHeight/2        -100
    buttonAchievement.x =display.contentWidth/2 ; buttonAchievement.y = display.contentHeight/2
    buttonOption.x =display.contentWidth/2      ; buttonOption.y = display.contentHeight/2      +100
    buttonExit.x =display.contentWidth/2        ; buttonExit.y = display.contentHeight/2        +200

    screenGroup:insert( buttonPlay )
    screenGroup:insert( buttonAchievement )
    screenGroup:insert( buttonOption )
    screenGroup:insert( buttonExit )
----------------- Menu Buttion End -------------
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view
    local params = event.params
    if params == nil then
        storyboard.removeScene( storyboard.getPrevious() )
    end
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