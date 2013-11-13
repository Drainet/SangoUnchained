module(..., package.seeall)

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
	--Player.HUD=display.newGroup()
	Player.image.type="player"
	Player.alive=true
	Player.heart=heartClass.new(3)
	Player.switch=switchClass.new(Player)
	Player.lastCheckPoint=config
	Player.isSticky=true

-------設定槍 start---
	function Player.setgun()
		if(Player.Weapon~=nil)then
			Player.Weapon.magazine.cancelReload()
			display.remove( Player.Weapon.magazine.image )
			display.remove( Player.Weapon.sprite )
			
		end
		
		Player.Weapon=Weapon.newgun( Player.pack[Player.switch.state].name)
		Player.bullet=Player.Weapon.bullet
		Player.Magazine = Player.Weapon.magazine
		Player.Magazine.isonAir= Player.pack[Player.switch.state].isonAir

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
-------設定槍 end---

--------碰撞 start---
	
	function Player.setpreCollision()
    	Player.isSticky=true
    	
    	Player.stickTimer=nil
    end

    function Player.image:preCollision(event )

    	---腳快撞到粗糙安全物體表面----
    	if( Player.isSticky == true and event.other.damage=="safe" and event.other.surface=="rough" and event.selfElement == 2) then
    		--and (self.y+self.height/2-20)<(event.other.y-event.other.height/2)
    		--print( self.y+self.height/2)
    		--print( event.other.y-event.other.height/2)
    		local vx, vy = event.other:getLinearVelocity()
    		self:setLinearVelocity( vx, vy )

    	end


	end



	function Player.image:collision(event )
	
		if ( event.phase == "began" ) then
			---腳撞到安全物體表面----
			if(event.other.damage=="safe" and event.selfElement == 2 ) then
				Player.body:setSequence( "normal" )
				Player.body:play()
				Player.Magazine.onGround()

				--timer.resume( Player.Magazine.reloadTimer )
			end
			
	    	
			
			---撞到致命物體表面----
			if( event.other.damage=="fatal") then

				timer.performWithDelay( 0, Player.dead,1 )

			end


		elseif ( event.phase == "ended" ) then

			---腳離開安全物體表面----
			if(event.other.damage=="safe" and event.selfElement == 2) then
				Player.body:setSequence( "jump" )
				Player.body:play()
				Player.Magazine.onAir()

			end

		end
	
	end
--------碰撞 end---

--------開槍 start---
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
				Player.stickTimer=timer.performWithDelay( 150, Player.setpreCollision ,1 )
			end

			if(Player.Magazine.shootable==true and Player.Magazine.ammo>0 and Player.alive==true)then
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

	end
		
--------開槍 end---

	


-------復活 死亡 start---

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

-------復活 死亡 end---

	-- Send message to All monster to trace player's path
	function Player:setPlayerShow()
    	scene:dispatchEvent( {name='onPlayerShow',target = Player} )
    end

    function Player:onSwitchTouch(event)
    	Player.setgun( Player.pack[Player.switch.state] )
    end

   
   

	Runtime:addEventListener( "touch", Player.shoot)
	--scene:addEventListener( 'onSwitchTouch', Player )

	Player.listeners[1] = {event="touch",listener=Player.shoot}
	--Player.listeners[2] = {event='onSwitchTouch',listener=Player}

	
 
    --add to Instances table
    return Player
end
 

