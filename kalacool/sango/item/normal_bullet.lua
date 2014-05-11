module (..., package.seeall)

local physics = require "physics"
require "kalacool.sango.animation.Animation"
physics.setReportCollisionsInContentCoordinates( true )

local Pi    = math.pi
local Sqr   = math.sqrt
local Rad   = math.rad
local Sin   = math.sin
local Cos   = math.cos
local Ceil  = math.ceil
local Atan2 = math.atan2

function new(x,y,vx,vy)
    AS.Play_mp5_fire()
    Filter = { categoryBits = 64, maskBits = 182 }
    local bullet=display.newGroup()
	local angle= (Atan2( vy,vx)*180/Pi)
	
	--Animation:newSpark(70*Cos(angle*Pi/180)+x,70*Sin(angle*Pi/180)+y)
    --for i = 1,6 do
    local oneshot = display.newImageRect( "kalacool/sango/image/item/bullet.png",50,10 )
	
	

    local dangle = angle
	

    oneshot.x = 50*Cos(dangle*Pi/180)+x
    oneshot.y = 50*Sin(dangle*Pi/180)+y
	oneshot.angle=dangle
	

    oneshot.name="oneshot"
    oneshot.type="bullet"
    oneshot.power = 2
    oneshot:setStrokeColor(0,0,0)
    
    physics.addBody( oneshot,{ density=2, friction=0, bounce=0,   filter=Filter} )
    --"kinematic",
    oneshot.isBullet = true
    oneshot.gravityScale = 0


    oneshot.rotation=oneshot.angle

    oneshot.isFixedRotation = true
    
    dangle = dangle+ math.random(-3,3)
    --Runtime:addEventListener( "enterFrame", oneshot.norotate )
	
    oneshot:setLinearVelocity(2000*Cos(dangle*Pi/180), 2000*Sin(dangle*Pi/180) )

    function oneshot:collision( event )
            
        if ( event.phase == "began" ) then
            --if(event.object1.name=="oneshot") then
            
                
                Animation:newFlare(event.x,event.y)
                
                display.remove( self )
          


        end

    end
    oneshot:addEventListener( "collision")

    bullet:insert(oneshot)
    



    function bullet.timeout( event )
	
		display.remove(bullet)
	
	end
	
	timer.performWithDelay( 3000,bullet.timeout,1 )
	
	
	
	

    return bullet
end




