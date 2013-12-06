module(..., package.seeall)

CharacterClass = require("kalacool.sango.Classes.Objects.Character")
require("kalacool.sango.Set.SupplementSet")

-- Monster dorp item list
local dropItemTable = {
    {name = "ShootFaster" , func = SupplementSet.newSupShootFaster} ,
    {name = "MoreLife"  , func = SupplementSet.newSupMoreLife} , 
    {name = "ReloadBullet"  ,func = SupplementSet.new_SupReloadBullet}
}


function new()

    local Enemy = CharacterClass.new()
    local scene = scene

    Enemy.image = display.newGroup( )
    
   


   -- ALL attribute of Monster
        --basic type & name
        Enemy.image.damage = "fatal"
        Enemy.alive = true
        -- basic attribute , HP , DEF , attackRange , visibleDistance
        Enemy.damageReduce = 1     -- Percentage of monster get damage reduce
        Enemy.HP = 1
        Enemy.visibleDistance = 1000
        
        -- attribute of different Monster
        Enemy.moveSpeed = 0
        Enemy.attackSpeed = 0
        Enemy.attackRange = 0
    -- attribute end
   
    
    -- event to recive player's message, and set attack target
    -- set AI for Monster
    function Enemy:onPlayerShow(event)

    	Enemy.target = event.target
    	Enemy:newAI()
    	Enemy.AI:run()
    end

    -- event to remove all monster listener & stop AI 
    function Enemy:removeAllEvent(event)
        Enemy.dead()
    end

    function Enemy:hurt(damage)
        Enemy.HP = Enemy.HP - damage*Enemy.damageReduce
    end

    function Enemy.onCollision(self, event)
                                    print(event.other.type)
        if (event.phase == "began") then
            
            if (event.other.type == "bullet" or event.other.type == "explosive") then
                
                if(Enemy.HP > 1) then
                    
                    Enemy:hurt(event.other.power)
                end
                if(Enemy.HP <=1) then
                    if(Enemy.alive == true) then
                        
                        timer.performWithDelay( 10,Enemy.dead,1) 
                        Enemy.alive = false
                    end
                end
            end
        end
    end

    -- Monster dead drop item
    function Enemy:dropItem()
     print( #dropItemTable )  
        for i =1,#dropItemTable do 
            if(dropItemTable[i].name == Enemy.config.name) then
                SUP = dropItemTable[i].func({ x = Enemy.image.x , y = Enemy.image.y }) 
                break
            end
        end
        camera:insert(SUP.image)
    end

    -- Monster dead remove all listener and timer
    function Enemy.dead()
        Enemy.alive = false
        if(Enemy.config.name ~= nil) then
            Enemy:dropItem()
        end
        Enemy.hide()
        Enemy.AI:stop()
        Enemy.dispose()
    end
    

    Enemy.collision = Enemy.onCollision
    Enemy.image:addEventListener("collision", Enemy)

    scene:addEventListener( 'onPlayerShow', Enemy )
    scene:addEventListener( 'onPlayerHide', Enemy )
    scene:addEventListener( 'removeAllEvent', Enemy)

    Enemy.listeners[1] = {event='onPlayerShow' , listener = Enemy}
    Enemy.listeners[2] = {event='onPlayerHide' , listener = Enemy}
    Enemy.listeners[3] = {event="collision", listener = Enemy}
    Enemy.listeners[4] = {event='removeAllEvent', listener = Enemy}
    return Enemy
end
