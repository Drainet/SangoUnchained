module(..., package.seeall)

CharacterClass = require("kalacool.sango.Classes.Objects.Character")
AI = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_AI")


function new()

    local Enemy = CharacterClass.new()
    local scene = scene

    Enemy.image = display.newGroup( )
    Enemy.alive = true


    function Enemy:onPlayerShow(event)
        print( "XXXname = ", event.target.image.x )
    	Enemy.target = event.target
    	Enemy.AI = AI.new(self, event.target)
    	Enemy.AI:run()
    end

    function Enemy:norotate( event)
    	Enemy.image.rotation = 0
    end


	scene:addEventListener( 'onPlayerShow', Enemy )
    scene:addEventListener( 'onPlayerHide', Enemy )
    Runtime:addEventListener( 'norotate', Enemy.norotate )

    Enemy.listeners[1] = {event='onPlayerShow' , listener = Enemy}
    Enemy.listeners[2] = {event='onPlayerHide' , listener = Enemy}
    Enemy.listeners[3] = {enent='norotate' , listener = Enemy.norotate}

    return Enemy
end
