local storyboard = require( "storyboard" )
local widget = require( "widget" )
local characterConfigClass = require "kalacool.sango.System.GetAndSetStatus"
local scene = storyboard.newScene()

--Order in [ 1, 2, 3, .... total ]
local totalChar = 2
local totalWpn  = 4

local characterConfig = {}

------------ Declare Buttons Start ------------
    local btnCharNext, btnCharLast, btnWpn1Next, btnWpn1Last, btnWpn2Next, btnWpn2Last
    local buttonExit
------------ Declare Buttons End ------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view

------------------- buttonHandler Start ---------------
    local buttonHandler = function( event )
        if event.target.id == "charSelNext" then
            group.charSelNext()
        elseif event.target.id == "charSelLast" then
            group.charSelLast()
        elseif event.target.id == "charWpn1Next" then
            group.charWpn1Next()
        elseif event.target.id == "charWpn1Last" then
            group.charWpn1Last()
        elseif event.target.id == "charWpn2Next" then
            group.charWpn2Next()
        elseif event.target.id == "charWpn2Last" then
            group.charWpn2Last()
        elseif event.target.id == "Exit" then
            group.Exit()
        end
    end
------------------- buttonHandler End ---------------


------------------- charSelMenu Start --------------- 
    local charSelMenu = display.newGroup()

        local menuBackground= display.newImage("kalacool/sango/image/UI/chSel/charSelMenu.png", true)
        menuBackground.alpha = 0.9
        menuBackground.x = display.contentWidth/2    ; menuBackground.y = display.contentHeight/2 

        ---- Buttons Start----
            btnCharNext = widget.newButton
                {
                    id = "charSelNext",
                    defaultFile = "kalacool/sango/image/UI/chSel/next.png",
                    font = "arial",
                    onPress = buttonHandler,
                }

            btnCharLast = widget.newButton
                {
                    id = "charSelLast",
                    defaultFile = "kalacool/sango/image/UI/chSel/last.png",
                    font = "arial",
                    onPress = buttonHandler,
                }

            btnWpn1Next = widget.newButton
                {
                    id = "charWpn1Next",
                    defaultFile = "kalacool/sango/image/UI/chSel/next.png",
                    font = "arial",
                    onPress = buttonHandler,
                }

            btnWpn1Last = widget.newButton
                {
                    id = "charWpn1Last",
                    defaultFile = "kalacool/sango/image/UI/chSel/last.png",
                    font = "arial",
                    onPress = buttonHandler,
                }

            btnWpn2Next = widget.newButton
                {
                    id = "charWpn2Next",
                    defaultFile = "kalacool/sango/image/UI/chSel/next.png",
                    font = "arial",
                    onPress = buttonHandler,
                }

            btnWpn2Last = widget.newButton
                {
                    id = "charWpn2Last",
                    defaultFile = "kalacool/sango/image/UI/chSel/last.png",
                    font = "arial",
                    onPress = buttonHandler,
                }

            buttonExit = widget.newButton
                {
                    id = "Exit",
                    defaultFile = "kalacool/sango/image/UI/chSel/exitBtn.png",
                    font = "arial",
                    onPress = buttonHandler,
                }
        ---- Buttons End----

        ---- Text Start----
            local curCharText = display.newText("", 0, 0, "arial", 70)
            local curWpn1Text = display.newText("", 0, 0, "arial", 70)
            local curWpn2Text = display.newText("", 0, 0, "arial", 70)

            curCharText:setFillColor( 0, 0, 0 )
            curWpn1Text:setFillColor( 0, 0, 0 )
            curWpn2Text:setFillColor( 0, 0, 0 )

            curCharText.x = menuBackground.x - 350   ; curCharText.y = menuBackground.y - 230
            curWpn1Text.x = menuBackground.x - 350   ; curWpn1Text.y = menuBackground.y 
            curWpn2Text.x = menuBackground.x - 350   ; curWpn2Text.y = menuBackground.y + 125
        ---- Text End ----

        btnCharNext.x = menuBackground.x - 70       ; btnCharNext.y = curCharText.y
        btnCharLast.x = menuBackground.x - 170       ; btnCharLast.y = curCharText.y
        btnWpn1Next.x = menuBackground.x - 70       ; btnWpn1Next.y = curWpn1Text.y 
        btnWpn1Last.x = menuBackground.x - 170       ; btnWpn1Last.y = curWpn1Text.y 
        btnWpn2Next.x = menuBackground.x - 70       ; btnWpn2Next.y = curWpn2Text.y
        btnWpn2Last.x = menuBackground.x - 170       ; btnWpn2Last.y = curWpn2Text.y

        buttonExit.x = display.contentWidth - 185   ; buttonExit.y = 70

        charSelMenu:insert(menuBackground)

        charSelMenu:insert(btnCharNext)
        charSelMenu:insert(btnCharLast)
        charSelMenu:insert(btnWpn1Next)
        charSelMenu:insert(btnWpn1Last)
        charSelMenu:insert(btnWpn2Next)
        charSelMenu:insert(btnWpn2Last)
        charSelMenu:insert(buttonExit)

        charSelMenu:insert(curCharText)
        charSelMenu:insert(curWpn1Text)
        charSelMenu:insert(curWpn2Text)


    group:insert( charSelMenu )
------------------- charSelMenu End --------------- 

------------------- characterCongif Default Setting Start ---------------
    characterConfig = characterConfigClass.getCurCharacterConfig()
    curCharText.text = characterConfig.char  
    curWpn1Text.text = characterConfig.wpn1
    curWpn2Text.text = characterConfig.wpn2
------------------- characterCongif Default Setting End ---------------

------------------- Button Functions Start -------------------

    ---- Next and Last Buttons Start ----
        function group.charSelNext()
            if(characterConfig.charID + 1 > totalChar) then
                characterConfig.charID = 1
            else
                characterConfig.charID = characterConfig.charID + 1   
            end 
            group.ChangeText()
        end

        function group.charSelLast()
            if(characterConfig.charID - 1 < 1) then
                characterConfig.charID = totalChar
            else
                characterConfig.charID = characterConfig.charID - 1    
            end
            group.ChangeText() 
        end
        
        function group.charWpn1Next()
            if(characterConfig.wpn1ID + 1 > totalWpn) then
                characterConfig.wpn1ID = 1
            else
                characterConfig.wpn1ID = characterConfig.wpn1ID + 1
            end
            group.ChangeText()
        end

        function group.charWpn1Last()
            if(characterConfig.wpn1ID - 1 < 1) then
                characterConfig.wpn1ID = totalWpn
            else
                characterConfig.wpn1ID = characterConfig.wpn1ID - 1
            end
            group.ChangeText()
        end

        function group.charWpn2Next()
            if(characterConfig.wpn2ID + 1 > totalWpn) then
                characterConfig.wpn2ID = 1
            else
                characterConfig.wpn2ID = characterConfig.wpn2ID + 1
            end
            group.ChangeText()
        end

        function group.charWpn2Last()
            if(characterConfig.wpn2ID - 1 < 1) then
                characterConfig.wpn2ID = totalWpn
            else
                characterConfig.wpn2ID = characterConfig.wpn2ID - 1
            end
            group.ChangeText()
        end
    ---- Next and Last Buttons End ----

    function group.ChangeText()
        ------------ Get new select Character Table Start ------------
            local selCharTbl = characterConfigClass.getCharacterStoreItemConfig({num = characterConfig.charID})
        ------------ Get new select Character Table End ------------
        ------------ Get new select Weapon Table Start ------------
            local selWpn1Tbl = characterConfigClass.getWeaponStoreItemConfig({num = characterConfig.wpn1ID})
            local selWpn2Tbl = characterConfigClass.getWeaponStoreItemConfig({num = characterConfig.wpn2ID})
        ------------ Get new select Weapon Table End ------------
            local newCurCharacterConfig={}
        ------------ Create New Character Table to Insert Start ------------
            newCurCharacterConfig.char      = selCharTbl.charName
            newCurCharacterConfig.charID    = selCharTbl.charID
        ------------ Create New Character Table to Insert End ------------
        ------------ Create New Weapon Table to Insert Start ------------
            newCurCharacterConfig.wpn1      = selWpn1Tbl.wpnName
            newCurCharacterConfig.wpn1ID    = selWpn1Tbl.wpnID
            newCurCharacterConfig.wpn2      = selWpn2Tbl.wpnName
            newCurCharacterConfig.wpn2ID    = selWpn2Tbl.wpnID
        ------------ Create New Weapon Table to Insert End ------------
            characterConfigClass.setCurCharacterConfig(newCurCharacterConfig)
        ------------ Update Current Character Status End ------------
            characterConfig = characterConfigClass.getCurCharacterConfig()        
            curCharText.text = characterConfig.char  
            curWpn1Text.text = characterConfig.wpn1
            curWpn2Text.text = characterConfig.wpn2
        ------------ Update Current Character Status End ------------
    end 

    function group.Exit()
        storyboard.hideOverlay("kalacool.sango.Scene.CharacterSelect")
    end
------------------- Button Functions End -------------------

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