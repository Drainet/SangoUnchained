module(..., package.seeall)


Monster = require ("kalacool.sango.Classes.Objects.Character.enemy")

function new(config)

local fireball = Monster.new()

    -- set monster's body
    fireball.name ="monster"
    fireball.body = display.newImage("fire3.png")

    fireball.image:insert(fireball.body)

    --fireball.body:translate(config.x,config.y)
    
    fireball.body.x = fireball.image.x
    fireball.body.y = fireball.image.y
    fireball.image.x = config.x
    fireball.image.y = config.y

    
   physics.addBody(fireball.image,"dynamic")



function fireball:move(x,y)
    fireball.image:setLinearVelocity(x,y)

end

function fireball:jump(config)
    fireball.body:setLinearVelocity(config.x,config.y)
end


return fireball
end

