module(..., package.seeall)

function new()
    
    local widget = require( "widget" )
    local storyboard = require( "storyboard" )
	
	local Content = display.newGroup()

------------------- buttonHandler Start ---------------
	local buttonHandler = function( event )
        if event.target.id == "Pause" then
            Content.Pause()
    	elseif event.target.id == "Resume" then
	    	Content.Resume()
	    elseif event.target.id == "NewGame" then
            Content.NewGame()
        elseif event.target.id == "FreeView" then
            Content.FreeView()
        elseif event.target.id == "MainMenu" then
            Content.MainMenu()
        end
    end
------------------- buttonHandler End ---------------


------------------- pauseButton Start ---------------
        buttonPause = widget.newButton
            {
                id = "Pause",
                defaultFile = "kalacool/sango/image/UI/pauseMenu/pauseButton.png",
                onPress = buttonHandler,
            }

        buttonPause.x =display.contentWidth-40; buttonPause.y = 40

    Content:insert( buttonPause )

------------------- pauseButton End ---------------


------------------- pauseMenu Start --------------- 
    local pauseMenu = display.newGroup()
    pauseMenu.isVisible = false

        menuBackground= display.newImage("kalacool/sango/image/UI/pauseMenu/pauseMenu.png")

        buttonResume = widget.newButton
            {
                id = "Resume",
                defaultFile = "kalacool/sango/image/UI/pauseMenu/buttonBlue.png",
                label = "Resume",
                fontSize = 28,
                emboss = true,
                onPress = buttonHandler,
            }

        buttonNewGame = widget.newButton
            {
                id = "NewGame",
                defaultFile = "kalacool/sango/image/UI/pauseMenu/buttonBlue.png",
                label = "NewGame",
                fontSize = 28,
                emboss = true,
                onPress = buttonHandler,
            }

        buttonFreeView = widget.newButton
            {
                id = "FreeView",
                defaultFile = "kalacool/sango/image/UI/pauseMenu/buttonBlue.png",
                label = "FreeView",
                fontSize = 28,
                emboss = true,
                onPress = buttonHandler,
            }

        buttonMainMenu = widget.newButton
            {
                id = "MainMenu",
                defaultFile = "kalacool/sango/image/UI/pauseMenu/buttonBlue.png",
                label = "Main Menu",
                fontSize = 28,
                emboss = true,
                onPress = buttonHandler,
            }

        menuBackground.x = display.contentWidth/2   ; menuBackground.y = display.contentHeight/2
        buttonResume.x = display.contentWidth/2     ; buttonResume.y = display.contentHeight/2      -250
        buttonNewGame.x = display.contentWidth/2    ; buttonNewGame.y = display.contentHeight/2     -150
        buttonFreeView.x = display.contentWidth/2   ; buttonFreeView.y = display.contentHeight/2    -50
        buttonMainMenu.x = display.contentWidth/2   ; buttonMainMenu.y = display.contentHeight/2    +250

        pauseMenu:insert(menuBackground)
        pauseMenu:insert(buttonResume)
        pauseMenu:insert(buttonNewGame)
        pauseMenu:insert(buttonFreeView)
        pauseMenu:insert(buttonMainMenu)

    Content:insert( pauseMenu )
------------------- pauseMenu End ---------------


------------------- Button Function Start -------------------
    function Content.Pause()
    	Runtime:removeEventListener( "touch", dog.shoot)
    	physics.pause()
        buttonPause.isVisible = false
        pauseMenu.isVisible   = true
    end

    function Content.Resume()  
        Runtime:addEventListener( "touch", dog.shoot)  	
		physics.start()
		buttonPause.isVisible = true
        pauseMenu.isVisible   = false
	end

	function Content.NewGame()    	
		storyboard.gotoScene( "kalacool.sango.Scene.LevelSelect", "fade", 200  )
        storyboard.removeAll()
	end

    function Content.FreeView()      
        
    end

    function Content.MainMenu()      
        storyboard.gotoScene( "kalacool.sango.Scene.Menu", "fade", 200  )
        storyboard.removeAll()
    end
------------------- Button Function End -------------------
	
		
	return Content

end