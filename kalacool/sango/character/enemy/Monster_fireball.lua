monsterFireball = {Instance={}}
Robot = require("kalacool.sango.character.enemy.monster_AI")
Enemy = require("kalacool.sango.character.enemy.enemy")
monsterFireball = Enemy:new()


function monsterFireball:new(x, y, player)
local fireball = setmetatable({},{__index = monsterFireball})
fireball.name ="monster"

fireball.body = display.newImage("fireball.png")
fireball.body:translate(x,y)

physics.addBody(fireball.body,"kinamic")
fireball:attackTarget(player)

fireball.AI = ROBOT:new(fireball,fireball.target)
fireball.AI:run()

table.insert(fireball , self)
camera:insert(fireball.body)
---set monster not to rotate
function norotate()
    fireball.body.rotation = 0
end
Runtime:addEventListener( "enterFrame", norotate)

return fireball
end

function monsterFireball:move(x,y)
    self.body:setLinearVelocity(x,y)
end

function monsterFireball:jump(x,y)
    self.body:setLinearVelocity(x,y)
end


return monsterFireball