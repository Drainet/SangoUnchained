module(..., package.seeall)
local scene = scene
CharacterClass = require('kalacool.sango.Classes.Objects.Character')
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
    --create Player display object
	
	--local Heart = heartClass.new(3)
	

    local Player = CharacterClass.new()
	Player.image=display.newGroup()
	Player.HUD=display.newGroup()
	Player.image.type="player"
	Player.alive=true
	Player.heart=heartClass.new(3)
	Player.switch=switchClass.new(Player)
	Player.lastCheckPoint=config	
	Player.image.heart = Player.heart
	Player.HUD:insert(Player.heart.image)
	Player.HUD:insert(Player.switch)

	Player.isSticky=true		
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

		Player.hang = Player.Weapon.sprite

    	Player.hang.xReference=25
    	Player.hang.yReference=-11

    	Player.image:insert(Player.hang)

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
    	if( Player.isSticky == true and event.other.damage=="safe" and event.other.surface=="rough" and event.selfElement == 2) then
    		--and (self.y+self.height/2-20)<(event.other.y-event.other.height/2)
    		--print( self.y+self.height/2)
    		--print( event.other.y-event.other.height/2)
    		local vx, vy = event.other:getLinearVelocity()
    		self:setLinearVelocity( vx, vy )

    	end

    	if(event.other.damage=="safe" and event.selfElement == 2 ) then
    		if(Player.body.sequence ~= "normal")then
				Player.body:setSequence( "normal" )
				Player.body:play()
			end
			Player.Magazine.onGround()

				--timer.resume( Player.Magazine.reloadTimer )
		end

		if( event.other.damage=="fatal" and Player.isInvincible==true) then

			if(event.contact~=nil)then
				event.contact.isEnabled=false
			end
		end

		if( event.other.damage=="fatal"and Player.isInvincible==false) then

			timer.performWithDelay( 0, Player.dead,1 )

		end


	end



	function Player.image:collision(event )
	
		if ( event.phase == "began" ) then
			---≥Ê∞Â®Áâ©È´îË°®---
			if(event.other.damage=="safe" and event.selfElement == 2 ) then
				Player.body:setSequence( "normal" )
				Player.body:play()
				Player.Magazine.onGround()

				--timer.resume( Player.Magazine.reloadTimer )
			end
			
	    	
			
			---ûÂà∞¥ÂëΩ©ÈË°®Èù¢----
			


		elseif ( event.phase == "ended" ) then

			---≥Èõ¢ãÂ®Áâ©È´îË°®---
			if(event.other.damage=="safe" and event.selfElement == 2) then
				Player.body:setSequence( "jump" )
				Player.body:play()
				Player.Magazine.onAir()

			end

		end



	
	end
--------Á¢∞Ê end---

--------ãÊ start---
	function Player.shoot( event )

		
		local phase = event.phase
		if "began" == phase then

			Player.isSticky=false
			--Player.image:removeEventListener( "preCollision" )

			if(Player.stickTimer~=nil)then
				timer.cancel( Player.stickTimer )
				Player.stickTimer=nil
			end

			if(Player.stickTimer==nil)then
				Player.stickTimer=timer.performWithDelay( 100, Player.setpreCollision ,1 )
			end
			--print(event.y)
			if(Player.Magazine.shootable==true and Player.Magazine.ammo>0 and Player.alive==true )then
				Player.hang:setSequence( "shoot" )
				Player.hang:play()
				Player.Magazine.pop()	
				local coolX= -camera.x+event.x-Player.image.x
				local coolY= -camera.y+event.y-Player.image.y
				local ratio = math.sqrt((coolX)^2+(coolY)^2)
				local bulletgroup=Player.bullet.new(Player.image.x , Player.image.y, 1000*(coolX)/ratio, 1000*(coolY)/ratio)

				local angle= (Atan2( coolY,coolX)*180/Pi)


				if (angle>-90 and angle<90) then
					Player.image.xScale = -1
				elseif ((angle>90 and angle<180)or(angle<-90 and angle>-180)) then
					Player.image.xScale = 1
				end

				if(Player.image.xScale == 1)then
					Player.hang.rotation=  angle+180
				elseif(Player.image.xScale == -1)then
					Player.hang.rotation=  angle*-1
				end
				camera:insert(bulletgroup)			
			        local vx, vy = Player.image:getLinearVelocity()								
				local limit=Player.Weapon.recoil+200
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
		Player.show(Player.lastCheckPoint)
		Player.default()
		
	end

	function Player:dead( event )

		Player.alive=false
		Player.heart.zero()
		physics.removeBody( Player.image )
		Player.Magazine:cancelReload()
		Player.body:setSequence( "dead" )
		Player.body:play()
		timer.performWithDelay( 1000, Player.respawn,1 )

	end

	function Player.invincible(  )

		local function shine( event )
			if(math.fmod(event.count,2)==1)then
				Player.image.alpha = 0.7
			else
				Player.image.alpha = 0.2
			end

			if(event.count==15)then
				Player.image.alpha = 1
				Player.isInvincible=false
				Player.image.isAwake=true
			end
			-- body
		end

		timer.performWithDelay( 100, shine,15 )
		
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

    function Player:removeAllEvent(event)
        Player.dispose()
        
    end

   
   

	Runtime:addEventListener( "touch", Player.shoot)
	scene:addEventListener( 'removeAllEvent', Player )

	Player.listeners[1] = {event="touch",listener=Player.shoot}
	Player.listeners[2] = {event='removeAllEvent' , listener = Player}
	--Player.listeners[2] = {event='onSwitchTouch',listener=Player}

	
 
    --add to Instances table
    return Player
end
 

