
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local eventCentralClass = require "eventCentral"
eventCentral = eventCentralClass.new()

-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view

    eventCentral.start()
    camera = display.newGroup()
    HUD = display.newGroup()

    require( "tilebg" )
    local bg = tileBG()

    local pauseMenuClass = require "kalacool.sango.HUD.PauseMenu"
    local pauseMenu = pauseMenuClass.new()

    local levelDirector = require "kalacool.sango.level.lv1-5"

    local physics = require("physics")
    physics.start()
    --physics.setDrawMode( "hybrid" )
 
    local myLevel = levelDirector.CreateLevel(physics)

    require "kalacool.sango.Set.PlayerSet"

    dog=PlayerSet.newDoggy({x=100,y=2000})
    dog:setPlayerShow()

    camera:insert(bg)
    camera:insert(myLevel)
    camera:insert(dog.image)
    HUD:insert(pauseMenu)
    HUD:insert(dog.HUD )
    group:insert( camera )
    group:insert( HUD )

    function onEveryFrame()
        
        local movex = myLevel.x - dog.image.x
        local movey = myLevel.y - dog.image.y
        camera.x = 650 + movex
        camera.y = 400 + movey 
        --print(collectgarbage("count"))
        --print(system.getInfo("textureMemoryUsed")/ (1024 * 1024))
    end

    Runtime:addEventListener( "enterFrame", onEveryFrame )

end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view
    Runtime:removeEventListener( "enterFrame", onEveryFrame )
    dog.dispose()
    storyboard.removeScene("kalacool.sango.Scene.scene1-5")

end

-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
    local group = self.view
    physics.stop()
    eventCentral.stop()
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