module(..., package.seeall)

CharacterClass = require('kalacool.sango.Classes.Objects.Character')
require "kalacool.sango.Set.Weapon"

local heartClass = require "kalacool.sango.HUD.Heart"


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
	Player.image.type="player"
	Player.alive=true
	Player.heart=heartClass.new(3)
	Player.lastCheckPoint=config	
	Player.image.heart = Player.heart
	
	function Player.setgun(name,num,rate,reload)
		Player.Weapon=Weapon.newgun(name,num,rate,reload)
		Player.bullet=Player.Weapon.bullet
		Player.Magazine = Player.Weapon.magazine
		Player.image.Magazine = Player.Weapon.magazine
		Player.Magazine.start()

	end
	
	
	
	function Player.shoot( event )

		
		local phase = event.phase
		if "began" == phase then
			
			if(Player.Magazine.shootable==true and Player.Magazine.ammo>0 and Player.alive==true)then
				Player.Magazine.pop()	
				local coolX= -camera.x+event.x-Player.image.x
				local coolY= -camera.y+event.y-Player.image.y
				local ratio = math.sqrt((coolX)^2+(coolY)^2)
				local bulletgroup=Player.bullet.new(6,Player.image.x,Player.image.y, 1000*(coolX)/ratio, 1000*(coolY)/ratio)

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
								
				Player.image:setLinearVelocity( -600*(coolX)/ratio, -600*(coolY)/ratio )
				--Player.image:applyLinearImpulse( -6000*(coolX)/ratio, -6000*(coolY)/ratio,Player.image.x,Player.image.y )

			end
		end

	end
		
	
	function Player:norotate( event )

		Player.image.rotation = 0
		

	end
	
	function Player:switchWeapon( event )

		

	end

	function Player:respawn( event )
		Player.show(Player.lastCheckPoint)
		Player.default()
		
	end

	function Player:dead( event )

		Player.alive=false
		Player.heart.zero()
		Player.image.bodyType="static"	
		timer.performWithDelay( 500, Player.respawn,1 )

	end

	-- Send message to All monster to trace player's path
	function Player:setPlayerShow()
    	scene:dispatchEvent( {name='onPlayerShow',target = Player} )
    end

	Runtime:addEventListener( "touch", Player.shoot)
	Runtime:addEventListener( "enterFrame", Player.norotate)
    

	Player.listeners[1] = {event="touch",listener=Player.shoot}
	Player.listeners[2] = {event="enterFrame",listener=Player.norotate}

	
 
    --add to Instances table
    return Player
end
 

