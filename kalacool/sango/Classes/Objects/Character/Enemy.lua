module(..., package.seeall)

CharacterClass = require("kalacool.sango.Classes.Objects.Character")
require("kalacool.sango.Set.SupplementSet")
LifeBar = require ("kalacool.sango.Classes.Objects.Character.Enemy.Boss_LifeBar" )
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
        Enemy.image.type = "enemy"
        Enemy.alive = true
        -- basic attribute , HP , DEF , attackRange , visibleDistance
        Enemy.damageReduce = 1     -- Percentage of monster get damage reduce
        Enemy.HP = 1
        Enemy.wave = 1
        Enemy.visibleDistance = 1000
        Enemy.AIactive = 0
        -- attribute of different Monster
        Enemy.moveSpeed = 0
        Enemy.attackSpeed = 0
        Enemy.attackRange = 0
    -- attribute end
        
    
    -- event to recive player's message, and set attack target
    -- set AI for Monster
    function Enemy:onPlayerShow(event)

        if Enemy.AIactive == 0 then
            Enemy.AIactive = 1
            startTime = math.random(1500)
        	Enemy.target = event.target
        	Enemy:newAI()
            Enemy.timers[1] = timer.performWithDelay( startTime , Enemy.AI.run )
            ---- Call Life Bar for Boss Monster ----
            if(Enemy.name) then
                Enemy.LifeBar = LifeBar.new(Enemy)
            end
            ---- End ----
        end
        
-- =======
--         startTime = math.random(2000)
--     	Enemy.target = event.target

        
--     	Enemy:newAI()
    	
--         Enemy.timers[1] = timer.performWithDelay( startTime , Enemy.AI.run )
--         ---- Call Life Bar for Boss Monster ----
--         if(Enemy.name) then
--             Enemy.LifeBar = LifeBar.new(Enemy)
--         end

-- >>>>>>> 4799141d5b0e4258f6f05b859e7349fdf616ddbd
    end


    function Enemy:hurt(damage)
        Enemy.HP = Enemy.HP - damage*Enemy.damageReduce
    end

    function Enemy.onCollision(self, event)
        if (event.phase == "began") then
            
            if (event.other.type == "bullet" or event.other.type == "explosive" or event.otherElement == 3) then
                Enemy:hurt(event.other.power)
                if(Enemy.name) then
                   Enemy.LifeBar:hurt(Enemy.HP)
                   print(Enemy.HP)
                end
                if(Enemy.HP <=1) then
                    if(Enemy.alive == true) then
                        --- kill monster delay ---
                        timer.performWithDelay( 10,Enemy.dead,1) 
                        Enemy.alive = false
                        if(Enemy.name) then
                           Enemy.LifeBar.dispose()
                        end
                    end
                end
            end
        end
    end

    --- Monster dead drop item ---
    function Enemy:dropItem()
        for i =1,#dropItemTable do 
            if(dropItemTable[i].name == Enemy.config.name) then
                SUP = dropItemTable[i].func({ x = Enemy.image.x , y = Enemy.image.y }) 
                break
            end
        end
        camera:insert(SUP.image)
    end

    --- Monster dead remove all listener and timer ---
    function Enemy.dead()
        Enemy.alive = false
        if(Enemy.config.name ~= nil) then
            Enemy:dropItem()
        end
        Enemy.hide()
        --Enemy.AI:stop()
        Enemy.AI.dispose()
        Enemy.dispose()
        scene:dispatchEvent({name='gotMoney',money = 100})
        scene:dispatchEvent({name='monsterDeadInWave',wave = Enemy.wave})
    end
    
   
    --- New monster AI ---
    function Enemy:newAI()
        
         Enemy.AI = Enemy.Robot.new(Enemy, Enemy.target)

    end
     

    Enemy.collision = Enemy.onCollision
    Enemy.image:addEventListener("collision", Enemy)
    scene:addEventListener( 'onPlayerShow', Enemy )
    scene:addEventListener( 'onPlayerHide', Enemy )

    Enemy.listeners[table.maxn(Enemy.listeners)+1] = {event='onPlayerShow' , listener = Enemy}
    Enemy.listeners[table.maxn(Enemy.listeners)+1] = {event='onPlayerHide' , listener = Enemy}
    Enemy.listeners[table.maxn(Enemy.listeners)+1] = {event="collision", listener = Enemy}

    return Enemy
end
