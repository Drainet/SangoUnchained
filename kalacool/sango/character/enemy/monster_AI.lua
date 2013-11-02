ROBOT = {AI = {}}
timer = require("timer")
function ROBOT:getDistance()
    local distance = math.sqrt( math.pow((self.enemy.body.x-self.target.x),2) + math.pow((self.enemy.body.y-self.target.y),2))
    return distance
end

function ROBOT:new(enemy , target , option)
    local ai = setmetatable({}, {__index = ROBOT})

    ai.enemy = enemy
    ai.target = target
    print(ai.enemy.body.x.." --- "..ai:getDistance())
    --table.insert(self.AI , self)
    return ai
end

function ROBOT:run()
    local dir = 1

        local function AI_RUN()  return self:run () end

        if self.enemy.body.y -self.target.y > 10 and self:getDistance() < 100 then
            self.enemy:jump(0,-300)
            timer.performWithDelay(1000 , AI_RUN )

        elseif self:getDistance() < 500 then
            self.enemy:move(self:enemyDir() * 200, 0)
            timer.performWithDelay(100 , AI_RUN )
        else
            timer.performWithDelay(1000 , AI_RUN )
        end


end

function ROBOT:enemyDir()
    local dir
    if self.target.x - self.enemy.body.x > 0 then
        dir = 1
    else
        dir = -1
    end
    return dir
end

return ROBOT