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

    return Content

end