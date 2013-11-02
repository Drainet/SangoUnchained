Enemy ={enemy = {}}
ROBOT = require("kalacool.sango.character.enemy.monster_AI")


function Enemy:attackTarget(target)
    self.target = target
end
function Enemy:new()
    local enemy = setmetatable({} , {__index = Enemy} )
    --enemy.body = display.newCircle(x,y,15)
    --physics.addBody(enemy.body,"dynamic",{friction = 0.3})
    --enemy.jumpSpeed = 300
    --enemy.target = target
    --enemy.AI = ROBOT:new(enemy , enemy.target)
    --print("[]--" ..enemy.AI.enemy.body.x)
    --enemy.AI:run()
    --table.insert(self.enemy , self)
    --camera:insert(enemy.body)

    return enemy
end
function Enemy:move() end
function Enemy:jump()  end
function Enemy:attack() end
