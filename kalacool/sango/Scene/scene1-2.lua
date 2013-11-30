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
    backgroundlayer = display.newGroup( )

  --  require( "tilebg" )
   -- local bg = tileBG()

    local pauseMenuClass = require "kalacool.sango.HUD.PauseMenu"
    local pauseMenu = pauseMenuClass.new()

    local levelDirector = require "kalacool.sango.level.lv1-2"

    local physics = require("physics")
    physics.start()
    --physics.setDrawMode( "hybrid" )
 
    local myLevel = levelDirector.CreateLevel(physics)

    require "kalacool.sango.Set.PlayerSet"

    dog=PlayerSet.newShadow({x=300,y=300})
    dog:setPlayerShow()

    local BackgroundSet = require "kalacool.sango.Background.BackgroundSet"
    local background = BackgroundSet.setBackgroundLayer(myLevel,dog,
        {{imgPath = "kalacool/sango/image/test/back.png",x = 40,y = 10}
        ,{imgPath = "kalacool/sango/image/test/backgrass.png",x = 30,y = 10}
        ,{imgPath = "kalacool/sango/image/test/backitem.png",x = 20,y = 10}})

  --  camera:insert(bg)

    camera:insert(myLevel)
    camera:insert(dog.image)
    HUD:insert( pauseMenu )
    HUD:insert(dog.HUD )
    group:insert( background)
    group:insert( camera )
    group:insert( HUD )

    function onEveryFrame()
        local movex = myLevel.x - dog.image.x
        local movey = myLevel.y - dog.image.y
        camera.x = 640 + movex
        camera.y = 360 + movey
    end
    Runtime:addEventListener( "enterFrame", onEveryFrame )

end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view
    storyboard.removeScene( storyboard.getPrevious() )

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view
    Runtime:removeEventListener( "enterFrame", onEveryFrame )

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