module(..., package.seeall)

local ConfigClass = require "kalacool.sango.System.GetAndSetAch"
local JSONtable = require "kalacool.sango.JSON.JSONFileSet"

function new()

--[[
---------------------------------------------------------------------------
    this is achievement system. you just need dispatchEvent to this module,
and it will unlocked !

---------------------------------------------------------------------------
]]--
    local scene = scene
    local Content = display.newGroup()
    local characterConfig = {} 
    ---- the money you earn in this level
    local tempMoney = 0 

    function Content:gotMoney(event)
        characterConfig.money = JSONtable.playerTable.money
        tempMoney = tempMoney + tonumber(event.money)
        -- print("plus 100, and now you total add " .. tempMoney)
    end
    scene:addEventListener( 'gotMoney', Content )
    
    scene:dispatchEvent({name='gotMoney',money = 100})

-------- Save Money Record Start --------
    function Content.setTotalMoney()
        characterConfig.money = JSONtable.playerTable.money
        -- print("player have:" .. characterConfig.money)
        characterConfig.money = tonumber(characterConfig.money) + tempMoney
        JSONtable.playerTable.money = characterConfig.money
        -- print("player now have:" .. JSONtable.playerTable.money)
        JSONtable:savePlayerTable()
    end
-------- Save Money Record End --------

-------- Dispose Function Start --------
    scene:addEventListener( 'removeAllEvent', Content )
    function Content.removeAllEvent()
        Content.setTotalMoney()
        scene:removeEventListener( 'gotMoney', Content )
    end
-------- Dispose Function End --------
    return Content

end