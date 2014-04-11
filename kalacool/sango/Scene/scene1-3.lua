local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local eventCentralClass = require "eventCentral"

local movex, movey

eventCentral = eventCentralClass.new()

-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view

end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view
    storyboard.removeScene( storyboard.getPrevious() )

    eventCentral.start()
    camera = display.newGroup()
    HUD = display.newGroup()

    local pauseMenuClass = require "kalacool.sango.HUD.PauseMenu"
    local pauseMenu = pauseMenuClass.new()

    -- local starSystemClass = require "kalacool.sango.System.ThreeStarSystem"
    -- local starSystem = starSystemClass.new({fs=1,ss=2,ts=3, wp1=1,wp2=2,ct=80 })

    -- local achievementSystemClass = require "kalacool.sango.System.AchievementSystem"
    -- local achievement = achievementSystemClass.new()

    -- local moneySystemClass = require "kalacool.sango.System.MoneySystem"
    -- local moneySystem = moneySystemClass.new()

    local levelDirector = require "kalacool.sango.level.lv1-3"

    local physics = require("physics")
    physics.start()
    --physics.setDrawMode( "hybrid" )
 
    local myLevel = levelDirector.CreateLevel(physics)
      
    require "kalacool.sango.Set.PlayerSet"

    local GetAndSetStatus = require "kalacool.sango.System.GetAndSetStatus"
    local characterConfig = GetAndSetStatus.getCurCharacterConfig()

    dog=PlayerSet.new(characterConfig.char,{x=500,y=1000})
    dog:setPlayerShow()

    local BackgroundSet = require "kalacool.sango.Background.BackgroundSet"
    local background = BackgroundSet.setBackgroundLayer(myLevel,dog,
        {{imgPath = "kalacool/sango/image/test/castle.jpg",x = 40,y = 10}})

    camera:insert(myLevel)
    camera:insert(dog.image)
    HUD:insert(pauseMenu )
    -- HUD:insert(starSystem)
    HUD:insert(dog.HUD )
    group:insert( background )
    group:insert( camera )
    group:insert( HUD )

    function onEveryFrame()     
        movex = myLevel.x - dog.image.x
        movey = myLevel.y - dog.image.y

        if(640 + movex > cameraMaxRange.left) then
            camera.x = cameraMaxRange.left
        elseif(640 + movex < cameraMaxRange.right) then
            camera.x = cameraMaxRange.right
        else
            camera.x = 640 + movex
        end
        
        if(460 + movey > cameraMaxRange.up) then
            camera.y = cameraMaxRange.up
        elseif(460 + movey < cameraMaxRange.down) then
            camera.y = cameraMaxRange.down
        else
            camera.y = 460 + movey
        end
    end
    Runtime:addEventListener( "enterFrame", onEveryFrame )

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view
    Runtime:removeEventListener( "enterFrame", onEveryFrame )
    physics.stop()
    eventCentral.stop()
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