module(..., package.seeall)

CharacterClass = require("kalacool.sango.Classes.Objects.Character")


function new()

    local Enemy = CharacterClass.new()
    local scene = scene

    Enemy.image = display.newGroup( )
    Enemy.image.type = "fatal"
    Enemy.alive = true
    --event to recive player's message, and set attack target
    function Enemy:onPlayerShow(event)
    	Enemy.target = event.target
    	Enemy:newAI()
    	Enemy.AI:run()
    end

    function Enemy.norotate()
    	Enemy.image.rotation = 0
    end
    function Enemy:dead()
        Enemy.alive = false
    end
    
    Runtime:addEventListener( "enterFrame", Enemy.norotate )
    scene:addEventListener( 'onPlayerShow', Enemy )
    scene:addEventListener( 'onPlayerHide', Enemy )
    
   

    Enemy.listeners[1] = {event='onPlayerShow' , listener = Enemy}
    Enemy.listeners[2] = {event='onPlayerHide' , listener = Enemy}
    Enemy.listeners[3] = {enent="enterFrame" , listener = Enemy.norotate}

    return Enemy
end
