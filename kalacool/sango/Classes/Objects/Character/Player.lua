module(..., package.seeall)
local scene = scene
CharacterClass = require('kalacool.sango.Classes.Objects.Character')
require "kalacool.sango.animation.Animation"
require "kalacool.sango.Set.Weapon"

local heartClass = require "kalacool.sango.HUD.Heart"
local switchClass = require "kalacool.sango.HUD.Switch"

local Pi    = math.pi
local Sqr   = math.sqrt
local Rad   = math.rad
local Sin   = math.sin
local Cos   = math.cos
local Ceil  = math.ceil
local Atan2 = math.atan2




 
function new(config)
    --create Player display objectc
	
	--local Heart = heartClass.new(3)
	

    local Player = CharacterClass.new()
	Player.image=display.newGroup()
	Player.HUD=display.newGroup()
	Player.image.type="player"
	Player.alive=true
	Player.noDead=true
	Player.heart=heartClass.new(5)
	Player.switch=switchClass.new(Player)
	Player.image.lastCheckPoint=config	
	Player.image.heart = Player.heart
	Player.HUD:insert(Player.heart.image)
	Player.HUD:insert(Player.switch)
	Player.Filter =  { categoryBits = 2, maskBits = 61 }
	Player.onBody = 15

	Player.isSticky=true		

	--- Dog buff effect ---
	Player.image.shootFaster = false
	Player.image.magazineRate = 1
	Player.image.shootFasterBuffTime =0
	--- Dog buff effect  END ---
	
-------Ë®≠ÂÊßstart---
	function Player.setgun()
		if(Player.Weapon~=nil)then
			Player.Weapon.magazine.cancelReload()
			display.remove( Player.Weapon.magazine.image )
			display.remove( Player.Weapon.sprite )
		end
		Player.Weapon=Weapon.newgun( Player.pack[Player.switch.state].name)
		Player.bullet=Player.Weapon.bullet
		Player.Magazine = Player.Weapon.magazine
		Player.image.Magazine = Player.Weapon.magazine
		Player.Magazine.isonAir= Player.pack[Player.switch.state].isonAir
		Player.HUD:insert(Player.Weapon.magazine.image)
		local temp = Player.Magazine.ammoMax

		if(Player.pack[Player.switch.state].nowNum ~= nil)then
			Player.Magazine.ammoMax = Player.pack[Player.switch.state].nowNum
		end
		
		Player.Magazine.isonAir= Player.pack[Player.switch.state].isonAir
		Player.Magazine.start()
		Player.Magazine.ammoMax = temp

		Player.gun = Player.Weapon.sprite

    	--Player.gun.xReference=18
    	--Player.gun.yReference=-8
    	Player.gun.x = Player.hand.fistX
    	Player.gun.y = Player.hand.fistY

    	Player.handGroup:insert(Player.gun)
    	Player.gun:toBack()
    	
    	--Player.image:insert(Player.hang)

    	--Player.hang.x=Player.image.x+25-config.x
    	--Player.hang.y=Player.image.y-11-config.y

	end
-------Ë®≠ÂÊßend---

--------Á¢∞Ê start---
	
	function Player.setpreCollision()
    	Player.isSticky=true
    	
    	Player.stickTimer=nil
    end

    function Player.image:preCollision(event )

    	---≥Âø´ûÂà∞Á≤óÁÂÆâÂÖ®©ÈË°®Èù¢----
    	-- if( Player.isSticky == true and event.other.damage=="safe" and event.other.surface=="rough" and event.selfElement == 1) then
    	-- 	--and (self.y+self.height/2-20)<(event.other.y-event.other.height/2)
    	-- 	--print( self.y+self.height/2)
    	-- 	--print( event.other.y-event.other.height/2)
    	-- 	local vx, vy = event.other:getLinearVelocity()
    	-- 	self:setLinearVelocity( vx, vy )

    	-- end

    	if(event.contact~=nil)then

	    	if(event.other.damage=="safe" and event.selfElement == 1 and event.contact.isEnabled==true) then

	    		Player.onBody = 0
	    		if(Player.body.sequence ~= "normal" )then
					Player.body:setSequence( "normal" )
					Player.body:play()
				end
				if(Player.Magazine.isonAir == true)then
					Player.Magazine.onGround()
				end

			end

		end

		if( event.other.damage=="fatal" and Player.isInvincible==true) then

			if(event.contact~=nil)then
				event.contact.isEnabled=false
			end
		end




	end



	function Player.image:collision(event )
	
		if ( event.phase == "began" ) then
			---≥Ê∞Â®Áâ©È´îË°®---
			-- if(event.other.damage=="safe" and event.selfElement == 1 ) then
			-- 	Player.body:setSequence( "normal" )
			-- 	Player.body:play()
			-- 	Player.Magazine.onGround()

			-- 	--timer.resume( Player.Magazine.reloadTimer )
			-- end

			if( event.other.damage=="fatal"and Player.isInvincible==false) then
				Animation:wound()

				if(event.other.damageValue == nil )then
					
					Player.heart.zero()
				else
					
					for i=1,event.other.damageValue do

						Player.heart.hurt()
						Player.invincible(8)
						Player.noSticky( )
						if(self.x <= event.other.x)then
							Player.image:setLinearVelocity( -200, -300 )
						else	
							Player.image:setLinearVelocity( 200, -300 )
						end

					end
					
				end

				if(Player.heart.num<=0)then
					timer.performWithDelay( 0, Player.dead,1 )
				end
					
					

			end
			
	    	
			
			---ûÂà∞¥ÂëΩ©ÈË°®Èù¢----
			


		elseif ( event.phase == "ended" ) then

			---≥Èõ¢ãÂ®Áâ©È´îË°®---
			if(event.other.damage=="safe" and event.selfElement == 1) then

				
				-- Player.body:setSequence( "jump" )
				-- Player.body:play()

				-- if(Player.Magazine.isonAir == false)then
				-- 	Player.Magazine.onAir()
				-- end
				

			end

		end

	end



	

	function Player:playerState(event)

		


		--print( count)
		if(Player.onBody < 3)then
			Player.onBody = Player.onBody +1
		end


		if(Player.alive==true and Player.onBody >= 3)then

			local vx, vy = Player.image:getLinearVelocity()
	        
	        if((vy>30 or vy<-30) )then

	        	

	        	if(Player.body.sequence ~= "jump" )then
					Player.body:setSequence( "jump" )
					Player.body:play()
				end
	        	
				

				if(Player.Magazine.isonAir == false)then
					Player.Magazine.onAir()
				end

	        else

	        end

	    end

	    


	    
    end




--------Á¢∞Ê end---
	function Player.noSticky( )
		Player.isSticky=false
			

		if(Player.stickTimer~=nil)then
			timer.cancel( Player.stickTimer )
			Player.stickTimer=nil
		end

		if(Player.stickTimer==nil)then
			Player.stickTimer=timer.performWithDelay( 100, Player.setpreCollision ,1 )
		end

	end



--------ãÊ start---

	function Player:screenTouch( event )
		
		local phase = event.target.phase

		if "began" == phase then

			
			

			Player.noSticky( )
			--print(event.y)
			if(Player.Magazine.shootable==true and Player.Magazine.ammo>0 and Player.alive==true )then
				Player.gun:setSequence( "shoot" )
				Player.gun:play()
				Player.Magazine.pop()	
				local coolX= -camera.x+event.target.x-Player.image.x
				local coolY= -camera.y+event.target.y-Player.image.y
				local ratio = math.sqrt((coolX)^2+(coolY)^2)
				local bulletgroup=Player.bullet.new(Player.image.x , Player.image.y, 1000*(coolX)/ratio, 1000*(coolY)/ratio)

				local angle= (Atan2( coolY,coolX)*180/Pi)


				if (angle>-90 and angle<90) then
					Player.image.xScale = -1
				elseif ((angle>90 and angle<180)or(angle<-90 and angle>-180)) then
					Player.image.xScale = 1
				end

				if(Player.image.xScale == 1)then
					Player.handGroup.rotation=  angle+180
				elseif(Player.image.xScale == -1)then
					Player.handGroup.rotation=  angle*-1
				end
				camera:insert(bulletgroup)			
			        local vx, vy = Player.image:getLinearVelocity()								
				local limit=Player.Weapon.recoil+100
				local standard=Player.Weapon.recoil
				if(vx-standard*(coolX)/ratio>limit)then
								
					Player.image:setLinearVelocity( limit, -standard*(coolY)/ratio )

				elseif(vx-standard*(coolX)/ratio<-limit)then
					Player.image:setLinearVelocity( -limit, -standard*(coolY)/ratio )
				else 
					
					Player.image:setLinearVelocity( vx-standard*(coolX)/ratio, -standard*(coolY)/ratio )
				end
								
				

				--Player.image:applyLinearImpulse( -6500*(coolX)/ratio, -6500*(coolY)/ratio,Player.image.x,Player.image.y )

			end
		end
		return true

	end
		
--------ãÊ end---

	


-------Âæ©Ê¥ª Ê≠ª‰∫° start---

	function Player:respawn( event )
		--Player.show(Player.image.lastCheckPoint)
		scene:dispatchEvent( {name='playerRespawn'} )
		Player.default()
		
	end

	function Player:dead( event )

		Player.alive=false
		
		physics.removeBody( Player.image )
		Player.Magazine:cancelReload()
		Player.body:setSequence( "dead" )
		Player.body:play()
		Player.respawnTimer = timer.performWithDelay( 1000, Player.respawn,1 )
		Player.timers[2] = Player.respawnTimer

		if Player.noDead == true then
			scene:dispatchEvent({name='HealthFail'})
			Player.noDead = false
		end
	end

	function Player.invincible(time)

		local function shine( event )
			if(math.fmod(event.count,2)==1)then
				Player.image.alpha = 0.7
			else
				Player.image.alpha = 0.2
			end


			if(event.count==time)then
				Player.image.alpha = 1
				Player.isInvincible=false
				Player.image.isAwake=true
			end
			-- body
		end

		if(Player.shineTimer~=nil)then
		 	timer.cancel( Player.shineTimer )
		end

		Player.shineTimer = timer.performWithDelay( 100, shine,time )
		Player.timers[1] = Player.shineTimer
		
		Player.isInvincible=true

	end

-------Âæ©Ê¥ª Ê≠ª‰∫° end---

	-- Send message to All monster to trace player's path
	function Player:setPlayerShow()
    	scene:dispatchEvent( {name='onPlayerShow',target = Player} )
    end

    function Player:onSwitchTouch(event)
    	Player.setgun( Player.pack[Player.switch.state] )
    end

  --   function Player:removeAllEvent(event)
    	
  --       Player.dispose()

  -- 		Player.Magazine:cancelReload()

  --       if(Player.shineTimer~=nil)then
		--  	timer.cancel( Player.shineTimer )
		-- end
		-- if(Player.respawnTimer~=nil)then
		--  	timer.cancel( Player.respawnTimer )
		-- end
        
  --   end

   
   

	
	--scene:addEventListener( 'removeAllEvent', Player )
	scene:addEventListener( 'playerState', Player )
	scene:addEventListener( 'screenTouch', Player )

	--Player.runtimeListeners[table.maxn(Player.runtimeListeners)+1] = {event="touch",listener=Player.shoot}
	--Player.listeners[table.maxn(Player.listeners)+1] = {event='removeAllEvent' , listener = Player}
	Player.listeners[table.maxn(Player.listeners)+1] = {event='playerState' , listener = Player}
	Player.listeners[table.maxn(Player.listeners)+1] = {event='screenTouch' , listener = Player}
	--Player.listeners[2] = {event='onSwitchTouch',listener=Player}

	
 
    --add to Instances table
    return Player
end
 

