module (..., package.seeall)

monster_AI = require("kalacool.sango.Classes.Objects.Character.Enemy.Monster_AI")
ObjectClass = require('kalacool.sango.Classes.Object')


function new(monster , target , option)
    local AI = monster_AI:new()
    local attackStyle = 1
    -- set AI attribute
    AI.target = target
    AI.monster = monster
    dirTable = {1 , -1}
    
    function AI.run()
        AI.timerID = nil
        --- monster self in parol range

        --------- new AI start
        if(monster.rest==true)then -- shot by shotgun, hurt true
            if AI.timerID == nil then
                AI.timerID =  timer.performWithDelay(500 , AI.run) -- cooldown attack
                AI.timers[1] = AI.timerID
            end
        else -- hurt false
            if(dog.image.x-monster.image.x>600)then -- far? true
                monster.image:setLinearVelocity(2000,0)
                monster.body.xScale=-2
                if(monster.body.sequence ~= "move")then
                    monster.body:setSequence( "move" )
                    monster.body:play()
                end
                if(monster.image.y-dog.image.y>10)then
                    monster.image:setLinearVelocity(850,-820)
                    if(monster.body.sequence ~= "jump")then
                        monster.body:setSequence( "jump" )
                        monster.body:play()
                    end
                elseif(monster.image.y-dog.image.y<10)then
                    monster.image:setLinearVelocity(800,770)
                    if(monster.body.sequence ~= "jump")then
                        monster.body:setSequence( "jump" )
                        monster.body:play()
                    end
                end

                if AI.timerID == nil then
                    AI.timerID =  timer.performWithDelay(200 , AI.run)
                    AI.timers[1] = AI.timerID
                end
            else -- far? false, chase a little bit and choose attack style
                monster.image:setLinearVelocity(350,0)
                monster.body.xScale=-2
                if(monster.body.sequence ~= "move")then
                    monster.body:setSequence( "move" )
                    monster.body:play()
                end
                if(monster.image.y-dog.image.y>50)then
                    monster.image:setLinearVelocity(300,-320)
                    if(monster.body.sequence ~= "jump")then
                        monster.body:setSequence( "jump" )
                        monster.body:play()
                    end
                elseif(monster.image.y-dog.image.y<10)then
                    monster.image:setLinearVelocity(300,420)
                    if(monster.body.sequence ~= "jump")then
                        monster.body:setSequence( "jump" )
                        monster.body:play()
                    end
                end 

                if(attackStyle==1)then  -- attack style 1, shoot
                    monster.body.xScale=-2
                    monster.image:setLinearVelocity(0,0)
                    monster.body:setSequence( "shoot" )
                    monster.body:play()
                    AI:attack(1,700)
                    attackStyle=2
                    if AI.timerID == nil then
                        AI.timerID =  timer.performWithDelay(2500 , AI.run) -- cooldown attack
                        AI.timers[1] = AI.timerID
                    end
                elseif(attackStyle==2) then -- attack style 2, smash
                    monster.body.xScale=-2
                    monster.image:setLinearVelocity(300,0)
                    monster.body:setSequence( "jump" )
                    monster.body:play()
                    if(monster.image.y-dog.image.y>10)then
                        monster.image:setLinearVelocity(450,-420)
                    elseif(monster.image.y-dog.image.y<10)then
                        monster.image:setLinearVelocity(400,370)
                    end 
                    attackStyle=1
                    if AI.timerID == nil then
                        AI.timerID =  timer.performWithDelay(2500 , AI.run) -- cooldown attack
                        AI.timers[1] = AI.timerID
                    end
                end 
            end -- far? end
            if AI.timerID == nil then
                AI.timerID =  timer.performWithDelay(400 , AI.run) 
                AI.timers[1] = AI.timerID
            end
        end
    
        --------- new AI end


        --------- AI start
        -- if(monster.rest==true)then -- shot by shotgun
        --     monster.image:setLinearVelocity(-200,50)
        --     monster.body:setSequence( "hurt" )
        --     monster.body:play()
        -- elseif(daze>6 and dog.image.x-monster.image.x>150 and dog.image.x-monster.image.x<500)then -- ready to shoot and in range ( not close to player and not too far )
        --     monster.body.xScale=-2
        --     monster.image:setLinearVelocity(0,0)
        --     monster.body:setSequence( "shoot" )
        --     monster.body:play()
        --     AI:attack(1,700)
        --     daze = 0
        -- elseif(daze>6 and dog.image.x-monster.image.x<151)then -- ready to shoot and in range ( not close to player and not too far )
        --     monster.body.xScale=-2
        --     monster.image:setLinearVelocity(300,0)
        --     monster.body:setSequence( "jump" )
        --     monster.body:play()
        --     daze = 0
        -- elseif(daze<3)then -- after shooting (cooldown)
        --     monster.image:setLinearVelocity(0,0)
        --     monster.body:setSequence( "normal" )
        --     monster.body:play()
        -- elseif(dog.image.x-monster.image.x>600)then -- chase player  (very far)

        --     monster.image:setLinearVelocity(2000,0)
        --     monster.body.xScale=-2
        --     if(monster.body.sequence ~= "move")then
        --         monster.body:setSequence( "move" )
        --         monster.body:play()
        --     end
        --     if(monster.image.y-dog.image.y>10)then
        --         monster.image:setLinearVelocity(850,-820)
        --         if(monster.body.sequence ~= "jump")then
        --             monster.body:setSequence( "jump" )
        --             monster.body:play()
        --         end
        --     elseif(monster.image.y-dog.image.y<10)then
        --         monster.image:setLinearVelocity(800,770)
        --         if(monster.body.sequence ~= "jump")then
        --             monster.body:setSequence( "jump" )
        --             monster.body:play()
        --         end
        --     end
        --     daze = daze + 1
        -- elseif(dog.image.x-monster.image.x>150)then -- chase player (not far)

        --     monster.image:setLinearVelocity(850,0)
        --     monster.body.xScale=-2
        --     if(monster.body.sequence ~= "move")then
        --         monster.body:setSequence( "move" )
        --         monster.body:play()
        --     end
        --     if(monster.image.y-dog.image.y>10)then
        --         monster.image:setLinearVelocity(550,-520)
        --         if(monster.body.sequence ~= "jump")then
        --             monster.body:setSequence( "jump" )
        --             monster.body:play()
        --         end
        --     elseif(monster.image.y-dog.image.y<10)then
        --         monster.image:setLinearVelocity(500,470)
        --         if(monster.body.sequence ~= "jump")then
        --             monster.body:setSequence( "jump" )
        --             monster.body:play()
        --         end
        --     end
        --     daze = daze + 1
        -- else -- very close to player 
        --     monster.image:setLinearVelocity(0,0)
        --     monster.body:setSequence( "normal" )
        --     monster.body:play()
        --     daze = daze + 1
        -- end
        -- AI.timerID =  timer.performWithDelay(400 , AI.run)
        -- AI.timers[1] = AI.timerID
    
        --------- AI end

        

        -- if ( AI:isMonsterInPatrolRange() ) then
           
        --     if (AI:isPlayerVisible() ) then -- can see player
        --         local dir = AI:monsterDir(target.image)
        --         monster:move(dir.x,-1)
        --     else    -- can't see player , hanging around
        --         R = math.random(1,2)
        --         monster:move(dirTable[R] *0.5, -0.8)
        --     end
        --     AI.timerID =  timer.performWithDelay(1500 , AI.run)
        --     AI.timers[1] = AI.timerID
        -- --- monster not in partol range ,then go back    
        -- else 
        --     AI.timerID = nil
        --     AI.backHome()
        -- end


    end
    function AI.backHome()
        -- local dir = AI:monsterDir(AI.monster.config)
        -- monster:move(dir.x ,-0.8)
        -- if (AI.timerID == nil) then
        --     AI.timerID =  timer.performWithDelay(1500 , AI.backHome ,2)
        --     AI.timerID2 = timer.performWithDelay(4500, AI.run )
        --     AI.timers[1] = AI.timerID
        --     AI.timers[2] = AI.timerID2
        -- end
    end
    function AI:attack(dir,time)
        monster.image:setLinearVelocity(0, 0);
        function attackDelay()
             AS.Play_monster_laser()

            AI.bullet = AI:new_bullet()
            AI.bullet.image.x = AI.monster.image.x
            AI.bullet.image.y = AI.monster.image.y
            AI.bullet.image:setLinearVelocity(dir*350,0)

            AI.bullet = AI:new_bullet()
            AI.bullet.image.x = AI.monster.image.x
            AI.bullet.image.y = AI.monster.image.y
            AI.bullet.image:setLinearVelocity(dir*350,250)

            AI.bullet = AI:new_bullet()
            AI.bullet.image.x = AI.monster.image.x
            AI.bullet.image.y = AI.monster.image.y
            AI.bullet.image:setLinearVelocity(dir*350,-250)
        end
        AI.timers[2] = timer.performWithDelay(time , attackDelay)
        --AI.head.rotation = math.deg( angle ) 
end


-- New A bullet
function AI:new_bullet()
        local bullet = ObjectClass.new()
        bullet.image = display.newGroup()
        -- set Bullet Animation
        local sheet = graphics.newImageSheet( "kalacool/sango/image/monster/Cannon/cannon_bullet_animation.png",{ width=51, height=49, numFrames=8 } )
        local sequenceData = {
                { name="fly",       start=1, count=4, time= 400 },
                { name="explosion", start=5, count=4, time= 300 }
            }

        local body =  display.newSprite( sheet , sequenceData )
        bullet.body = body
        bullet.body:setSequence( "fly" )
        bullet.body:play()
        bullet.image:insert(body)

        -- set Bullet Attribute
        -- local Filter = { categoryBits = 4 , maskBits = 67}
        physics.addBody(bullet.image, "dynamic", {density = 1 , filter = { categoryBits = 4 , maskBits = 3} }) 
        bullet.image.isFixedRotation    = true
        bullet.image.gravityScale       = 0
        bullet.image.damage             = "fatal"
        bullet.image.damageValue        = 1
        bullet.image.isBullet           = true

        function bullet.collision(self , event)

            if(event.otherElement ~= 3)then
                bullet.image:setLinearVelocity(0, 0)
                bullet.body:setSequence("explosion")
                bullet.body:play()
                timerBullet = timer.performWithDelay( 300, bullet.dispose)     
            end

            
        end

        bullet.image:addEventListener("collision",bullet)
        camera:insert(bullet.image)
        return bullet
end
    -- function AI:stop()
    --     if (AI.timerID ~= nil) then
    --          timer.cancel(AI.timerID)
    --     end
    --     if (AI.timerID2 ~= nil) then
    --          timer.cancel(AI.timerID)
    --     end
    -- end
    return AI
end


