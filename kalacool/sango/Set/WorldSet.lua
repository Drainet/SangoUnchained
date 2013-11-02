
local FloorClass = require ("kalacool.sango.Classes.Objects.World.StaticWorld.Floor")
local Thorn = require ("kalacool.sango.Classes.Objects.World.StaticWorld.Thorn")
local Box = require ("kalacool.sango.Classes.Objects.World.DynamicWorld.Box")
local CompanionCube = require ("kalacool.sango.Classes.Objects.World.DynamicWorld.CompanionCube")
local WoodenDoor = require ("kalacool.sango.Classes.Objects.World.InteractiveWorld.WoodenDoor")
local SpinningCog = require ("kalacool.sango.Classes.Objects.World.InteractiveWorld.SpinningCog")
local FloatingFloor = require ("kalacool.sango.Classes.Objects.World.InteractiveWorld.FloatingFloor")

local hor_floor = require ("kalacool.sango.Classes.Objects.World.StaticWorld.hor_floor")
local leftTop_floor = require ("kalacool.sango.Classes.Objects.World.StaticWorld.leftTop_floor")
local par_floor = require ("kalacool.sango.Classes.Objects.World.StaticWorld.par_floor")

WorldSet={}

function WorldSet.newFloorClass(config)
    return FloorClass.new(config)
end

function WorldSet.newThorn(config)
    return Thorn.new(config)
end

function WorldSet.newBox(config)
    return Box.new(config)
end

function WorldSet.newCompanionCube(config)
    return CompanionCube.new(config)
end

function WorldSet.newWoodenDoor(config)
    return WoodenDoor.new(config)
end

function WorldSet.newSpinningCog(config)
    return SpinningCog.new(config)
end

function WorldSet.newFloatingFloor(config)
    return FloatingFloor.new(config)
end


function WorldSet.newhor_floor(config)
    return hor_floor.new(config)
end

function WorldSet.newleftTop_floor(config)
    return leftTop_floor.new(config)
end

function WorldSet.newpar_floor(config)
    return par_floor.new(config)
end

return WorldSet