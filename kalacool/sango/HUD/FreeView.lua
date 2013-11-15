local widget = require( "widget" )

local freeViewGroup = display.newGroup()

buttonBack = widget.newButton
            {
                id = "Pause",
                defaultFile = "kalacool/sango/image/UI/pauseMenu/pauseButton.png",
                onPress = buttonHandler,
            }

        buttonPause.x =display.contentWidth/2; buttonPause.y = display.contentHeight - 100

    freeViewGroup:insert( buttonBack )