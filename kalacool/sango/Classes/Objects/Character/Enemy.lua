module(..., package.seeall)

CharacterClass = require("kalacool.sango.Classes.Objects.Character")


function new()

    local Enemy = CharacterClass.new()
    local scene = scene

    Enemy.image = display.newGroup( )
    Enemy.image.damage = "fatal"
    Enemy.alive = true


    -- Percentage of monster get damage reduce
    Enemy.damageReduce = 1
    Enemy.HP = 1


    --event to recive player's message, and set attack target
    function Enemy:onPlayerShow(event)
    	Enemy.target = event.target
    	Enemy:newAI()
    	Enemy.AI:run()
    end

    function Enemy:hurt(damage)
        Enemy.HP = Enemy.HP - damage*Enemy.damageReduce
    end

    function Enemy.onCollision(self, event)
        
        if (event.phase == "began") then
            if (event.other.type == "bullet") then
                if(Enemy.HP > 1) then
                    Enemy:hurt(1)
                else
                    Enemy:dead()
                end

            end
        end
    end

    function Enemy:removeAllEvent()
        Enemy:dead()
    end

    function Enemy:dead()
        Enemy.alive = false
        Enemy.hide()
        Enemy.AI:stop()
        Enemy.dispose()
    end
    


    Enemy.collision = Enemy.onCollision
    Enemy.image:addEventListener("collision", Enemy)

    scene:addEventListener( 'onPlayerShow', Enemy )
    scene:addEventListener( 'onPlayerHide', Enemy )
    scene:addEventListener('removeAllEvent',Enemy)

    Enemy.listeners[1] = {event='onPlayerShow' , listener = Enemy}
    Enemy.listeners[2] = {event='onPlayerHide' , listener = Enemy}
    Enemy.listeners[3] = {event="collision", listener = Enemy}
    Enemy.listeners[4] = {event='removeAllEvent', listener = Enemy}
    return Enemy
end
