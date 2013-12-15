local achievementConfigClass = require "kalacool.sango.System.GetAndSetAch"
local storyboard = require( "storyboard" )
local widget = require( "widget" )
local scene = storyboard.newScene()
local achievements = {}
-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view

    local buttonBack
    
----------------- Background Start -------------
    local background = display.newImage( "kalacool/sango/image/UI/Achievement/background.png" )
    background.x = display.contentWidth/2       ; background.y = display.contentHeight/2
    group:insert( background )
----------------- Background End -------------

----------------- buttonHandler Start -------------
    local buttonHandler = function( event )
        if event.target.id == "Back" then
            storyboard.gotoScene( "kalacool.sango.Scene.Menu", "fade", 200  )
        end
    end
----------------- buttonHandler End -------------

----------------- Menu Buttion Start -------------
    
    buttonBack = widget.newButton
        {
            id = "Back",
            defaultFile = "kalacool/sango/image/UI/Menu/buttonBlue.png",
            overFile = "kalacool/sango/image/UI/Menu/buttonOrange.png",
            label = "Back",
            labelColor = {default = {255, 255, 255, 255}},
            font = "arial",
            fontSize = 28,
            emboss = true,
            onPress = buttonHandler,
        }

    buttonBack.x =display.contentWidth/2 + 450 ; buttonBack.y = display.contentHeight/2 + 300

    group:insert( buttonBack )
----------------- Menu Buttion End -------------
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view
    local params = event.params
    local achievementConfig = {}
    achievementConfig = achievementConfigClass.getCurAchievementConfig()

    if params == nil then
        storyboard.removeScene( storyboard.getPrevious() )
    end
    ----------------- scrollListener Start -------------
        local function scrollListener( event )
            local phase = event.phase
            local direction = event.direction
            
            if "began" == phase then
                --print( "Began" )
            elseif "moved" == phase then
                --print( "Moved" )
            elseif "ended" == phase then
                --print( "Ended" )
            end
            
            -- If the scrollView has reached it's scroll limit
            if event.limitReached then
                if "up" == direction then
                    print( "Reached Top Limit" )
                elseif "down" == direction then
                    print( "Reached Bottom Limit" )
                elseif "left" == direction then
                    print( "Reached Left Limit" )
                elseif "right" == direction then
                    print( "Reached Right Limit" )
                end
            end
                    
            return true
        end
    ----------------- scrollListener End -------------

    ----------------- ScrollView Start -------------
        local scrollView = widget.newScrollView
        {
            top = 50,
            left = 150,
            width = display.contentWidth - 200 ,
            height = display.contentHeight - 200,
            scrollHeight = 5000,
            topPadding = 100,
            bottomPadding = 5000,
            id = "onBottom",
            horizontalScrollDisabled = true,
            verticalScrollDisabled = false,
            listener = scrollListener,
            
            hideBackground = false,
            backgroundColor = { 0.2, 0.2, 0.2 } ,
        }
        group:insert( scrollView )
    ----------------- ScrollView End -------------

    ----------------- Achievement Content Start -------------
        for i=1,achievementConfig.totalAch do
            achievements[i] = {}
            if achievementConfig[i].unlock == true then
                achievements[i].Image = display.newImage( achievementConfig[i].image, display.contentCenterX-500, (i-1)*170 )
            else
                achievements[i].Image = display.newImage( "kalacool/sango/image/UI/Achievement/locked.png", display.contentCenterX-500, (i-1)*170 )
            end
            achievements[i].Title = display.newText("", display.contentCenterX-320, (i-1)*170 -30, native.systemFontBold, 30) 
            achievements[i].Title.text = tostring(achievementConfig[i].achName)
            achievements[i].Description = display.newText("", display.contentCenterX-300, (i-1)*170 , native.systemFontBold, 20) 
            achievements[i].Description.text = tostring(achievementConfig[i].description)
            scrollView:insert( achievements[i].Image )
            scrollView:insert( achievements[i].Title )
            scrollView:insert( achievements[i].Description )
        end
    ----------------- Achievement Content End -------------

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