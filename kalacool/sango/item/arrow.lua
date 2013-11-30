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
    Filter = { categoryBits = 2, maskBits = 5 }
    local bullet=display.newGroup()
	local angle= (Atan2( vy,vx)*180/Pi)
	
	--Animation:newSpark(70*Cos(angle*Pi/180)+x,70*Sin(angle*Pi/180)+y)
    --for i = 1,6 do
    local oneshot = display.newImageRect( "kalacool/sango/image/item/arrow.png",200,20 )
	
	

    local dangle = angle
	

    oneshot.x = 150*Cos(dangle*Pi/180)+x
    oneshot.y = 160*Sin(dangle*Pi/180)+y
	oneshot.angle=dangle
	

    oneshot.name="oneshot"
    oneshot.type="bullet"
    oneshot.power = 50
    oneshot:setStrokeColor(0,0,0)
    local Shape1= { 88,4, 88,-4, 92,-4, 92,4 }
    local Shape2= { -96,4, -96,-4, 88,-4, 88,4 }
    physics.addBody( oneshot,{ density=5.0, friction=0, bounce=0,shape = Shape1,filter=Filter}
    , { density=5.0, friction=0.6, bounce=0,shape = Shape2})
    --"kinematic",
    oneshot.isBullet = true
    oneshot.damage="safe"
    --oneshot.gravityScale = 0

    --physics.setDrawMode( "hybrid" )


    oneshot.rotation=oneshot.angle

    --oneshot.isFixedRotation = true
    

    --Runtime:addEventListener( "enterFrame", oneshot.norotate )
	
    oneshot:setLinearVelocity(1000*Cos(dangle*Pi/180), 1000*Sin(dangle*Pi/180) )

    bullet:insert(oneshot)

    function oneshot:remove(event)

        display.remove(bullet)
        scene:removeEventListener('arrowControl', oneshot  )
        scene:removeEventListener( 'removeAllEvent', oneshot )

    end

    function oneshot:arrowControl(event)

        --if(oneshot.stick~=true)then
            local vx, vy =  oneshot:getLinearVelocity()
            local angle= (Atan2( vy,vx)*180/Pi)
            oneshot.rotation=angle
        -- else
        --     if(oneshot.stickObject.x==nil)then
        --         oneshot.remove()
        --     else
        --         print( oneshot.stickObject )
        --         oneshot.x=oneshot.stickObject.x+oneshot.dx
        --         oneshot.y=oneshot.stickObject.y+oneshot.dy
                
        --     end
            
        -- end

        
    end

    function oneshot:removeAllEvent(event)
        oneshot.remove()
    end


    scene:addEventListener( 'arrowControl', oneshot )
    scene:addEventListener( 'removeAllEvent', oneshot )
    

    --oneshot.listeners[1] = {event='arrowControl' , listener = oneshot}


    function oneshot:preCollision( event )

            
        --Animation:newSpark(event.x,event.y)

        if(oneshot.cool == true)then
            if(event.other.bodyType~="dynamic" and event.contact~= nil)then
                event.contact.isEnabled=false
            end

        elseif(event.selfElement == 1  )then
            --scene:removeEventListener('arrowControl', oneshot  )
            --if(event.other.bodyType=="static")then
                
                -- oneshot.stick = true
                -- oneshot.stickObject = event.other
                -- oneshot.dx = oneshot.x - event.other.x
                -- oneshot.dy = oneshot.y - event.other.y

                --event.contact.isEnabled=false
                scene:removeEventListener('arrowControl', oneshot  )
                oneshot.power = 0



                local  function GG()
                    
                    local myJoint = physics.newJoint( "pivot", self, event.other, event.x, event.y )
                    myJoint.isLimitEnabled = true -- (boolean)
                    myJoint:setRotationLimits( 0, 0 )
                    --myJoint.maxForce = 999999999999
                    --myJoint.maxTorque = 99999999999999999
                    --oneshot.bodyType = "static"
                end
                timer.performWithDelay( 0,GG,1 )

                if(event.other.bodyType~="kinematic")then
                    oneshot:removeEventListener( "preCollision")
                else
                    oneshot.cool = true
                end
        end

        --[[if(event.other.bodyType~="static")then
            
        end]]
        
        
                

    end

    oneshot:addEventListener( "preCollision")
    



    --[[function bullet.timeout( event )
	
		display.remove(bullet)
	
	end
	
	timer.performWithDelay( 3000,bullet.timeout,1 )]]
	
	
	
	

    return bullet
end




