module(..., package.seeall)
local scene = scene
CharacterClass = require('kalacool.sango.Classes.Objects.Character')
require "kalacool.sango.animation.Animation"
require "kalacool.sango.Set.Weapon"
system.activate( "multitouch" )

local joystickClass = require( "kalacool.sango.HUD.joystick" )

local heartClass = require "kalacool.sango.HUD.Heart"
local powerClass = require "kalacool.sango.HUD.power"
local switchClass = require "kalacool.sango.HUD.Switch"
local SFclass = require "kalacool.sango.HUD.SF"

local Pi    = math.pi
local Sqr   = math.sqrt
local Rad   = math.rad
local Sin   = math.sin
local Cos   = math.cos
local Ceil  = math.ceil
local Atan2 = math.atan2
 
function new(config)
    --create Player display objectc

    local Player = CharacterClass.new()
	Player.image=display.newGroup()
	Player.HUD=display.newGroup()
	Player.image.type="player"
	Player.isFloat = false
	Player.alive=true
	Player.noDead=true
	Player.image.power = 4
	Player.powerTank = powerClass.new(_Player.player.Power)
	Player.heart=heartClass.new(_Player.player.Life)
	Player.switch=switchClass.new(Player)
	Player.SF=SFclass.new(Player)
	Player.image.lastCheckPoint=config	
	Player.image.heart = Player.heart
	Player.touchAreaA = display.newRect( 320, 360,640 , 720 )
	Player.touchAreaA.alpha = 0.2
	Player.HUD:insert(Player.touchAreaA)

	Player.touchAreaB = display.newRect( 960, 360,640 , 720 )
	Player.touchAreaB.alpha = 0.2
	Player.HUD:insert(Player.touchAreaB)

	Player.HUD:insert(Player.heart.image)
	Player.HUD:insert(Player.switch)
	Player.HUD:insert(Player.SF)
	
	
	Player.HUD:insert(Player.powerTank.image)
	Player.Filter =  { categoryBits = 2, maskBits = 189 }
	Player.onBody = 15
	Player.shootable= true
	Player.isSticky=true		
	Player.isShooting = false
	Player.fingerX = nil 
	Player.fingerY = nil	--- Dog buff effect ---
	Player.image.shootFaster = false
	Player.image.magazineRate = 1
	Player.image.shootFasterBuffTime =0
	--- Dog buff effect  END ---
	function Player.superfloat()
		if(Player.alive==true)then
			--Player.image.gravityScale = 0
			Player.isFloat = true
			Player.image:setLinearVelocity( 0 ,0)
			Player.body:setSequence( "float" )
			Player.body:play()
		end
	end
	function Player.unSuperfloat()
		print(Player.image.gravityScale)
		if(Player.alive==true)then
			-- Player.image.gravityScale = 1
			Player.isFloat = false
			Player.image.isAwake = true
			Player.image:setLinearVelocity(0,3)
		end
	end
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
	    		if(Player.body.sequence ~= "normal"  and Player.isFloat == false )then
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
				--event.contact.isEnabled=false
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
			if(event.selfElement == 3 and event.other.type == "enemy")then
				Player.knife.isVisible = true
				Player.knife:play()
				
			end
			if( event.other.damage=="fatal"and Player.isInvincible==false and(event.selfElement ~= 3)and(event.selfElement ~= 4)) then
				Animation:wound()
				Player.unSuperfloat()
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

	function Player:objectState(event)
		--Player.image.gravityScale = 0
		if(Player.isShooting == true)then
			local coolX= -camera.x+Player.fingerX-Player.image.x
			local coolY= -camera.y+Player.fingerY-Player.image.y
			local ratio = math.sqrt((coolX)^2+(coolY)^2)
			local angle = (Atan2( coolY,coolX)*180/Pi)		

			

			
	
			if(Player.image.xScale == 1)then
				Player.handGroup.rotation=  angle+180
			elseif(Player.image.xScale == -1)then
				Player.handGroup.rotation=  angle*-1
			end

			if (angle>-90 and angle<90) then
				Player.image.xScale = -1
			elseif ((angle>=90 and angle<360)or(angle<=-90 and angle>-180)) then
				Player.image.xScale = 1
			end
			
			if(Player.shootable==true and Player.powerTank.value>0 and Player.alive==true )then
				Player.gun:setSequence( "shoot" )
				Player.gun:play()
				Player.powerTank.reduce(Player.Weapon.para.cost)
				Player.Magazine.pop()
				Player.shootable=false
				function coolover( )
					Player.shootable=true
				end
				timer.performWithDelay( Player.Weapon.para.rate, coolover, 1)

				local bulletgroup=Player.bullet.new(Player.image.x + Player.handGroup.x , Player.image.y + Player.handGroup.y, 1000*coolX/ratio, 1000*coolY/ratio)

				camera:insert(bulletgroup)			
			    local vx, vy = Player.image:getLinearVelocity()								
				local limit=_Player.Doggy.Speed+100
				local standard=_Player.Doggy.Speed



				if(Player.isFloat ~= true)then
				
					if(vx-standard*coolX/ratio>limit)then
									
						Player.image:setLinearVelocity( limit, -standard*3.5*coolY/ratio )

					elseif(vx-standard*coolX/ratio<-limit)then
						Player.image:setLinearVelocity( -limit, -standard*3.5*coolY/ratio )
					else 
						--standard*1.8*coolY/ratio
						Player.image:setLinearVelocity( vx-standard*coolX/ratio, -standard*3.5*coolY/ratio )
					end			
				end
			end
		end
		
		
		if(Player.isFloat == true and Player.alive==true)then
			Player.image:setLinearVelocity(0,0)
			if(Player.body.sequence ~= "float" )then
					Player.body:setSequence( "float" )
					Player.body:play()
			end
			
		end
		--print( count)
		if(Player.onBody < 3)then
			Player.onBody = Player.onBody +1
		end


		if(Player.alive==true and Player.onBody >= 3)then

			local vx, vy = Player.image:getLinearVelocity()
			if(vx<0)then
				Player.image:setLinearVelocity(0,vy)
			end
	        
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
	function Player.control( event )
		
		-- local coolX= -camera.x+Player.fingerX-Player.image.x
			-- local coolY= -camera.y+Player.fingerY-Player.image.y
			-- local ratio = math.sqrt((coolX)^2+(coolY)^2)
			-- local angle= (Atan2( coolY,coolX)*180/Pi)		

			if(event.joyAngle~=false )then

				if(event.joyAngle>=0 and event.joyAngle<90)then
					event.joyAngle = 0
					event.joyY=-1
					event.joyX=0
				elseif(event.joyAngle>=90 and event.joyAngle<180)then
					event.joyAngle = 180
					event.joyY=1
					event.joyX=0
				end

				local angle=  event.joyAngle-90
		
				if(Player.image.xScale == 1)then
					Player.handGroup.rotation=  angle+180
				elseif(Player.image.xScale == -1)then
					Player.handGroup.rotation=  angle*-1
				end

				if (angle>-90 and angle<90) then
					Player.image.xScale = -1
				elseif ((angle>=90 and angle<360)or(angle<=-90 and angle>-180)) then
					Player.image.xScale = 1
				end
				
				if(Player.shootable==true and Player.powerTank.value>0 and Player.alive==true )then
					Player.gun:setSequence( "shoot" )
					Player.gun:play()
					Player.powerTank.reduce(Player.Weapon.para.cost)
					Player.Magazine.pop()
					Player.shootable=false
					function coolover( )
						Player.shootable=true
					end
					timer.performWithDelay( Player.Weapon.para.rate, coolover, 1)
	
					local bulletgroup=Player.bullet.new(Player.image.x + Player.handGroup.x , Player.image.y + Player.handGroup.y, 1000*event.joyX, 1000*event.joyY)

					camera:insert(bulletgroup)			
				    local vx, vy = Player.image:getLinearVelocity()								
					local limit=Player.Weapon.recoil+100
					local standard=_Player.Doggy.Speed

					if(Player.isFloat ~= true)then
					
						if(vx-standard*event.joyX>limit)then
										
							Player.image:setLinearVelocity( limit, -standard*1.8*event.joyY )

						elseif(vx-standard*event.joyX<-limit)then
							Player.image:setLinearVelocity( -limit, -standard*1.8*event.joyY )
						else 
							
							Player.image:setLinearVelocity( vx-standard*event.joyX, -standard*1.8*event.joyY )
						end			
					end
				end
			end
	end

	-- Player.joystick = joystickClass.newJoystick{
	-- 	outerImage = "",						-- Outer Image - Circular - Leave Empty For Default Vector
	-- 	outerRadius = 60,						-- Outer Radius - Size Of Outer Joystick Element - The Limit
	-- 	outerAlpha = 0.5,							-- Outer Alpha ( 0 - 1 )
	-- 	--innerImage = "joystickInner.png",		-- Inner Image - Circular - Leave Empty For Default Vector
	-- 	innerRadius = 50,						-- Inner Radius - Size Of Touchable Joystick Element
	-- 	innerAlpha = 1,							-- Inner Alpha ( 0 - 1 )
	-- 	--backgroundImage = "joystickDial.png",	-- Background Image
	-- 	background_x = 0,						-- Background X Offset
	-- 	background_y = 0,						-- Background Y Offset
	-- 	backgroundAlpha = 1,					-- Background Alpha ( 0 - 1 )
	-- 	position_x = 150,						-- X Position Top - From Left Of Screen - Positions Outer Image
	-- 	position_y = 500,						-- Y Position - From Left Of Screen - Positions Outer Image
	-- 	ghost = 155,							-- Set Alpha Of Touch Ghost ( 0 - 255 )
	-- 	joystickAlpha = 0.4,					-- Joystick Alpha - ( 0 - 1 ) - Sets Alpha Of Entire Joystick Group
	-- 	joystickFade = true,					-- Fade Effect ( true / false )
	-- 	joystickFadeDelay = 2000,				-- Fade Effect Delay ( In MilliSeconds )
	-- 	onMove = Player.control				-- Move Event
	-- }
	-- Player.HUD:insert(Player.joystick)

	function Player.touchAreaA:touch( event )
	    local phase = event.phase

		if "began" == phase then
			--display.getCurrentStage():setFocus( Player.touchAreaA)
			--display.getCurrentStage():setFocus( display.getCurrentStage() )
			

			Player.noSticky( )
			
			--if(Player.Magazine.shootable==true and Player.Magazine.ammo>0 and Player.alive==true )then
			
			Player.isShooting = true	
			Player.fingerX = event.x
			Player.fingerY = event.y
				--Player.image:applyLinearImpulse( -6500*(coolX)/ratio, -6500*(coolY)/ratio,Player.image.x,Player.image.y )

			
		end
		if "moved" == phase then
			Player.fingerX = event.x
			Player.fingerY = event.y
		end


		if "ended" == phase then
			display.getCurrentStage():setFocus( nil )
			Player.isShooting = false
		end
	    return true
	end 

	function Player.touchAreaB:touch( event )
	    local phase = event.phase

		if "began" == phase then
			--display.getCurrentStage():setFocus( event.target.target , event.target.id )
			--display.getCurrentStage():setFocus( display.getCurrentStage() )
			

			Player.noSticky( )
			
			--if(Player.Magazine.shootable==true and Player.Magazine.ammo>0 and Player.alive==true )then
			
				
			
			Player.image.y = event.y-camera.y
				--Player.image:applyLinearImpulse( -6500*(coolX)/ratio, -6500*(coolY)/ratio,Player.image.x,Player.image.y )

			
		end
		if "moved" == phase then
			
			Player.image.y = event.y-camera.y
		end


		if "ended" == phase then
			display.getCurrentStage():setFocus( nil )
			
		end
	    return true
	end 

	function Player:screenTouch( event )
		scene:dispatchEvent({name='Ach1'})
		
		-- local phase = event.target.phase

		-- if "began" == phase then
		-- 	--display.getCurrentStage():setFocus( event.target.target , event.target.id )
		-- 	display.getCurrentStage():setFocus( display.getCurrentStage() )
			

		-- 	Player.noSticky( )
		-- 	--print(event.y)
		-- 	--if(Player.Magazine.shootable==true and Player.Magazine.ammo>0 and Player.alive==true )then
			
		-- 	Player.isShooting = true	
		-- 	Player.fingerX = event.target.x
		-- 	Player.fingerY = event.target.y
		-- 		--Player.image:applyLinearImpulse( -6500*(coolX)/ratio, -6500*(coolY)/ratio,Player.image.x,Player.image.y )

			
		-- end
		-- if "moved" == phase then
		-- 	Player.fingerX = event.target.x
		-- 	Player.fingerY = event.target.y
		-- end


		-- if "ended" == phase then
		-- 	display.getCurrentStage():setFocus( nil )
		-- 	Player.isShooting = false
		-- end
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
				Player.image.x = Player.image.x+5
				Player:setPlayerShow()
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
	scene:addEventListener( 'objectState', Player )
	-- scene:addEventListener( 'screenTouch', Player )
	Player.touchAreaA:addEventListener('touch',Player.touchAreaA)
	--Player.touchAreaB:addEventListener('touch',Player.touchAreaB)

	--Player.runtimeListeners[table.maxn(Player.runtimeListeners)+1] = {event="touch",listener=Player.shoot}
	--Player.listeners[table.maxn(Player.listeners)+1] = {event='removeAllEvent' , listener = Player}
	Player.listeners[table.maxn(Player.listeners)+1] = {event='objectState' , listener = Player}
	Player.listeners[table.maxn(Player.listeners)+1] = {event='screenTouch' , listener = Player}
	--Player.listeners[2] = {event='onSwitchTouch',listener=Player}
 
    --add to Instances table
    return Player
end
 

