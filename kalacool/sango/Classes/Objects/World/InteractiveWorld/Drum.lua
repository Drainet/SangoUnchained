--Classes/Objects/World/InteractiveWorld/Drum.lua

module(..., package.seeall)

local scene = scene
InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')
require('kalacool.sango.animation.Animation')

--INSTANCE FUNCTIONS
function new(config)

    local Drum = InteractiveWorldClass.new()
    Drum.setImage('kalacool/sango/image/world/interactiveWorld/Drum.png')
    Drum.image.damage = "safe"
    Drum.image.surface = "rough"
    Drum.image.type = "explosive"
    Drum.show(config)
    Drum.dead = false
    physics.addBody( Drum.image,  "dynamic",{ density = 5,friction=0.3, bounce=0,shape = {-50,-64,50,-64,50,64,-50,64}} )

    function Drum:removeAllEvent(event)
        Drum.dispose()
    end

    function Drum.preCollision(self, event)
        if (event.other.type == "bullet" and Drum.dead == false) then
            Drum.image:boom()
        end
	end


    function Drum.image:boom()
        if(Drum.image.x~=nil) then
        Animation:newBom(Drum.image.x,Drum.image.y)
            local function createCircleSenser() 
                if(Drum.image.x~=nil) then
                    local circle = display.newCircle( Drum.image.x, Drum.image.y, 500 )  
                    circle.removed = false
                    circle.damage = "fatal"
                    circle.damageValue = 3
                    circle.power = 10
                    function circle.removeSensor()
                        display.remove(circle)
                    end

                    local function onLocalCollision(self, event )  
                        if ( event.phase == "began" and self.myName == "circle" and event.other.type~= "bullet" and event.other.type ~= "explosive") then  
                            xVelocity = event.other.x-self.x  
                            yVelocity = event.other.y-self.y
                            distance = math.sqrt( xVelocity*xVelocity + yVelocity*yVelocity)
                            xVelocity = (xVelocity)/distance
                            yVelocity = (yVelocity)/distance

                            if distance <=500 then
                                distance = 500 - distance
                                local ratio = distance / 500
                                event.other:setLinearVelocity(ratio* xVelocity*3000, ratio*yVelocity *3000)
                            end

                            if circle.removed ==  false then
                                timer.performWithDelay( 10, circle.removeSensor ,1 )
                                circle.removed =true
                            end  
                            
                        elseif(event.other.type == "explosive") then
                            event.other:boom()
                        end
                    end 
                        circle.myName = "circle" 
                        circle:setFillColor(0,0,0,0)
                        physics.addBody( circle, "static" ,{ isSensor = true,radius =500,filter = { categoryBits = 32,maskBits = 39}}) 
                        circle.collision = onLocalCollision  
                        circle:addEventListener( "collision", circle )
                        camera:insert(circle)    
                        timer.performWithDelay( 10, circle.removeSensor ,1 )
                        -- physics.setDrawMode( "hybrid" )
                end
            end
            timer.performWithDelay( 9,createCircleSenser,1) 
            timer.performWithDelay( 10,Drum.dispose,1) 
            Drum.dead = true
        end
    end

 	Drum.image.isFixedRotation = true
 	Drum.image:addEventListener( "preCollision", Drum)
 	Drum.listeners[1] = {event='removeAllEvent' , listener = Drum}

 	Drum[2] = {event="preCollision" , listener = Drum}
    Drum[1] = {event='removeAllEvent' , listener = Drum}

    return Drum
end