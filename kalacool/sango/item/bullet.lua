module (..., package.seeall)

local physics = require "physics"
require "kalacool.sango.animation.Animation"
ObjectClass = require('kalacool.sango.Classes.Object')
physics.setReportCollisionsInContentCoordinates( true )


local Pi    = math.pi
local Sqr   = math.sqrt
local Rad   = math.rad
local Sin   = math.sin
local Cos   = math.cos
local Ceil  = math.ceil
local Atan2 = math.atan2


function new(x,y,vx,vy)
    local Filter = { categoryBits = 64, maskBits = 55 }




--INSTANCE FUNCTIONS


	

    local bullet=ObjectClass.new()
    bullet.image = display.newGroup( )
	local angle= (Atan2( vy,vx)*180/Pi)
	
	--Animation:newSpark(70*Cos(angle*Pi/180)+x,70*Sin(angle*Pi/180)+y)
    for i = 1,6 do
        local oneshot = display.newImage( "kalacool/sango/image/item/bullet.png" )
		
		oneshot.xScale = 2
		oneshot.yScale = 1.2

        local dangle = angle+ math.random(-10,10)
		

        oneshot.x = 50*Cos(dangle*Pi/180)+x+math.random(-5,5)
        oneshot.y = 50*Sin(dangle*Pi/180)+y+math.random(-5,5)
		oneshot.angle=dangle
		

        oneshot.name="oneshot"
        oneshot.type="bullet"
        oneshot.power = 1
        oneshot:setStrokeColor(0,0,0)
        --local Shape= { 88,4, 88,-4, 96,-4, 96,4 }
        physics.addBody( oneshot,{ density=150.0, friction=0, bounce=0.3,  filter=Filter} )
        --"kinematic",
        oneshot.isBullet = true
        oneshot.gravityScale = 0


        oneshot.rotation=oneshot.angle

        oneshot.isFixedRotation = true
        

        --Runtime:addEventListener( "enterFrame", oneshot.norotate )
		
        oneshot:setLinearVelocity(1000*Cos(dangle*Pi/180), 1000*Sin(dangle*Pi/180) )

        bullet.image:insert(oneshot)

        function oneshot:collision( event )
        	
			if ( event.phase == "began" ) then
				--if(event.object1.name=="oneshot") then
				
					--local x= 100*Cos(self.angle*Pi/180)+self.x
					--local y= 100*Sin(self.angle*Pi/180)+self.y
					--print(event.x)
					--print(event.y)
					Animation:newSpark(event.x,event.y)
					
					display.remove( self )
				--[[elseif(event.object2.name=="oneshot")then
					local x= 80*Cos(event.object2.angle*Pi/180)+event.object2.x
					local y= 80*Sin(event.object2.angle*Pi/180)+event.object2.y
					Animation:newSpark(x,y)
					
					display.remove( event.object2 )
				end]]

			--elseif ( event.phase == "ended" ) then


			end

		end

		oneshot:addEventListener( "collision")

    end



    function bullet.timeout( event )
	
		display.remove(bullet.image)
	
	end
	
	bullet.timers[1] = timer.performWithDelay( 300,bullet.timeout,1 )
	
	
	
	

    return bullet.image
end





