module (..., package.seeall)

local physics = require "physics"
require "kalacool.sango.animation.Animation"


local Pi    = math.pi
local Sqr   = math.sqrt
local Rad   = math.rad
local Sin   = math.sin
local Cos   = math.cos
local Ceil  = math.ceil
local Atan2 = math.atan2

function new(num,x,y,vx,vy)
    Filter = { categoryBits = 2, maskBits = 1 }
    local bullet=display.newGroup()
	local angle= (Atan2( vy,vx)*180/Pi)
	
	Animation:newSpark(70*Cos(angle*Pi/180)+x,70*Sin(angle*Pi/180)+y)
    for i = 1,num do
        local oneshot = display.newImage( "kalacool/sango/image/item/note.png" )
		
		

        local dangle = angle+ math.random(-10,10)
		

        oneshot.x = 50*Cos(dangle*Pi/180)+x+math.random(-5,5)
        oneshot.y = 50*Sin(dangle*Pi/180)+y+math.random(-5,5)
		oneshot.angle=dangle
		

        --oneshot.name="oneshot"

        oneshot:setStrokeColor(0,0,0)
        
        physics.addBody( oneshot,{ density=20.0, friction=0, bounce=0.8,  radius=12 , filter=Filter} )
        --"kinematic",
        oneshot.isBullet = true
        
        
        --oneshot.rotation=dangle
		
		local v=600+ math.random(-100,100)
		
        oneshot:setLinearVelocity(v*Cos(dangle*Pi/180), v*Sin(dangle*Pi/180) )

        bullet:insert(oneshot)
    end
	
	function bullet.timeout( event )
	
		display.remove(bullet)
	
	end
	
	timer.performWithDelay( 4500,bullet.timeout,1 )

    return bullet
end

local function crash( event )

    if ( event.phase == "began" ) then

		

    elseif ( event.phase == "ended" ) then

        



        -- print( "ended: " .. event.object1.myName .. " & " .. event.object2.myName )

    end

end
Runtime:addEventListener( "collision", crash)


