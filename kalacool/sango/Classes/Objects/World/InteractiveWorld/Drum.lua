--Classes/Objects/World/InteractiveWorld/Drum.lua

module(..., package.seeall)

local scene = scene
InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')
require('kalacool.sango.animation.Animation')

--INSTANCE FUNCTIONS
function new(config)

    local Drum = InteractiveWorldClass.new()
    Drum.setImage(_World.InteractiveWorld.Drum.ImagePath)
    Drum.image.damage = _World.InteractiveWorld.Drum.Damage
    -- Drum.image.type = "explosive"
    Drum.show(config)
    Drum.dead = false
    physics.addBody( Drum.image, _World.InteractiveWorld.Drum.Physic.Type, _World.InteractiveWorld.Drum.Physic.Option)

    function Drum:removeAllEvent(event)
        Drum.dispose()
    end

    function Drum:collision(event)
        if ((event.other.type == "bullet" or event.other.type == "explosive") and Drum.dead == false and event.phase == "began") then
            Drum.image:boom()
        end
	end

    function Drum.image:boom()
        if(Drum.image.x~=nil) then
            Animation:newExplode(Drum.image.x,Drum.image.y)
            local function createCircleSenser() 
                if(Drum.image~=nil) then
                    local circle = display.newCircle( Drum.image.x, Drum.image.y, 300 )  
                    circle.removed = false
                    circle.type = "explosive"
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
                            end
                    end 
                    circle.myName = "circle" 
                    circle:setFillColor(0,0,0,0)
                    physics.addBody( circle, "dynamic" ,{ isSensor = true,radius =300,filter = { categoryBits = 32,maskBits = 39}}) 
                    circle.collision = onLocalCollision  
                    circle:addEventListener( "collision", circle )
                    camera:insert(circle)    
                    timer.performWithDelay( 10, circle.removeSensor ,1 )
                end
            end
            timer.performWithDelay( 9,createCircleSenser,1) 
            timer.performWithDelay( 10,Drum.dispose,1) 
            Drum.dead = true
        end
    end
 	
 	Drum.image:addEventListener( "collision", Drum)
 	Drum.listeners[1] = {event='removeAllEvent' , listener = Drum}

 	Drum[2] = {event="preCollision" , listener = Drum}
    Drum[1] = {event='removeAllEvent' , listener = Drum}

    return Drum
end