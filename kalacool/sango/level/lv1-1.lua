    -- Generated by Kalacool Editor

module(..., package.seeall)
require("kalacool.sango.Set.WorldSet")
require("kalacool.sango.Set.SupplementSet")
require("kalacool.sango.Set.MechanismSet")
function CreateLevel(physics)

    display.setDefault( 'background', 0, 0, 0 )
    physics.setGravity(0.0,20.0)
    local collFilter = nil
    local level = display.newGroup()
    level.layers = {}
    level.name = "1-1"

----
 

local MonsterSpawnWavesClass = require "kalacool.sango.System.MonsterSpawnWaves"
MonsterImageGroup = display.newGroup()
MonsterSpawnWavesClass.NextWaveHandler(MonsterImageGroup)
level.layers["StaticWorld"] = display.newGroup()
level.layers["StaticWorld"].name = "StaticWorld"
level.layers["StaticWorld"].objects = {}
level.layers["DynamicWorld"] = display.newGroup()
level.layers["DynamicWorld"].name = "StaticWorld"
level.layers["DynamicWorld"].objects = {}
level.layers["InteractiveWorld"] = display.newGroup()
level.layers["InteractiveWorld"].name = "StaticWorld"
level.layers["InteractiveWorld"].objects = {}
level.layers["Monster"] = display.newGroup()
level.layers["Monster"].name = "Monster"
level.layers["Monster"].objects = {}
level.layers["Supplement"] = display.newGroup()
level.layers["Supplement"].name = "Supplement"
level.layers["Supplement"].objects = {}
level.layers["Image"] = display.newGroup()
level.layers["Image"].name = "Image"
level.layers["Image"].objects = {}
 level.layers["StaticWorld"].objects["object0"] = WorldSet.newhor_floor({x=780,y=1430})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object0"].image)
 level.layers["StaticWorld"].objects["object1"] = WorldSet.newhor_floor({x=1380,y=1430})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object1"].image)
 level.layers["StaticWorld"].objects["object2"] = WorldSet.newhor_floor({x=1980,y=1430})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object2"].image)
 level.layers["StaticWorld"].objects["object3"] = WorldSet.newhor_floor({x=470,y=1140})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object3"].image)
 level.layers["StaticWorld"].objects["object3"].image:rotate(270)
 level.layers["StaticWorld"].objects["object4"] = WorldSet.newhor_floor({x=470,y=540})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object4"].image)
 level.layers["StaticWorld"].objects["object4"].image:rotate(270)
 level.layers["StaticWorld"].objects["object5"] = WorldSet.newhor_floor({x=780,y=250})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object5"].image)
 level.layers["StaticWorld"].objects["object6"] = WorldSet.newhor_floor({x=1380,y=250})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object6"].image)
 level.layers["StaticWorld"].objects["object7"] = WorldSet.newhor_floor({x=1980,y=250})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object7"].image)
 level.layers["StaticWorld"].objects["object8"] = WorldSet.newhor_floor({x=2580,y=250})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object8"].image)
 level.layers["StaticWorld"].objects["object9"] = WorldSet.newhor_floor({x=2580,y=1430})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object9"].image)
 level.layers["StaticWorld"].objects["object10"] = WorldSet.newhor_floor({x=2890,y=540})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object10"].image)
 level.layers["StaticWorld"].objects["object10"].image:rotate(270)
 level.layers["StaticWorld"].objects["object11"] = WorldSet.newhor_floor({x=2890,y=1140})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object11"].image)
 level.layers["StaticWorld"].objects["object11"].image:rotate(270)
 level.layers["InteractiveWorld"].objects["object12"] = MechanismSet.newDestructibleBlockStone({x=510,y=1390})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object12"].image)
 level.layers["InteractiveWorld"].objects["object13"] = MechanismSet.newDestructibleBlockStone({x=570,y=1330})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object13"].image)
 level.layers["InteractiveWorld"].objects["object14"] = MechanismSet.newDestructibleBlockStone({x=570,y=1390})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object14"].image)
 level.layers["InteractiveWorld"].objects["object15"] = MechanismSet.newDestructibleBlockStone({x=630,y=1390})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object15"].image)
 level.layers["InteractiveWorld"].objects["object16"] = MechanismSet.newDestructibleBlockStone({x=630,y=1330})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object16"].image)
 level.layers["InteractiveWorld"].objects["object17"] = MechanismSet.newDestructibleBlockStone({x=690,y=1390})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object17"].image)
 level.layers["InteractiveWorld"].objects["object18"] = MechanismSet.newDestructibleBlockStone({x=690,y=1330})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object18"].image)
 level.layers["InteractiveWorld"].objects["object19"] = MechanismSet.newDestructibleBlockStone({x=750,y=1330})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object19"].image)
 level.layers["InteractiveWorld"].objects["object20"] = MechanismSet.newDestructibleBlockStone({x=750,y=1390})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object20"].image)
 level.layers["InteractiveWorld"].objects["object21"] = MechanismSet.newDestructibleBlockStone({x=870,y=1330})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object21"].image)
 level.layers["InteractiveWorld"].objects["object22"] = MechanismSet.newDestructibleBlockStone({x=930,y=1390})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object22"].image)
 level.layers["InteractiveWorld"].objects["object23"] = MechanismSet.newDestructibleBlockStone({x=930,y=1330})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object23"].image)
 level.layers["InteractiveWorld"].objects["object24"] = MechanismSet.newDestructibleBlockStone({x=870,y=1390})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object24"].image)
 level.layers["InteractiveWorld"].objects["object25"] = MechanismSet.newDestructibleBlockStone({x=810,y=1330})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object25"].image)
 level.layers["InteractiveWorld"].objects["object26"] = MechanismSet.newDestructibleBlockStone({x=810,y=1390})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object26"].image)
 level.layers["InteractiveWorld"].objects["object27"] = MechanismSet.newDestructibleBlockStone({x=510,y=1330})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object27"].image)
MonsterSpawnWavesClass.addMonster({ID=1,x=1800,y=936,wave=1,xL=400,xR=3000})
MonsterSpawnWavesClass.addMonster({ID=1,x=1800,y=936,wave=2,xL=400,xR=3000})
-- MonsterSpawnWavesClass.addMonster({ID=1,x=2126,y=1058,wave=1,xL=400,xR=3000})
-- MonsterSpawnWavesClass.addMonster({ID=1,x=2100,y=880,wave=1,xL=400,xR=3000})
-- MonsterSpawnWavesClass.addMonster({ID=1,x=1840,y=760,wave=1,xL=400,xR=3000})
-- MonsterSpawnWavesClass.addMonster({ID=3,x=2218,y=1364,wave=1,xL=400,xR=3000})
-- MonsterSpawnWavesClass.addMonster({ID=3,x=1958,y=524,wave=1,xL=400,xR=3000})
-- MonsterSpawnWavesClass.addMonster({ID=2,x=1612,y=648,wave=2,xL=400,xR=3000})
-- MonsterSpawnWavesClass.addMonster({ID=2,x=1600,y=820,wave=2,xL=400,xR=3000})
-- MonsterSpawnWavesClass.addMonster({ID=2,x=1736,y=990,wave=2,xL=400,xR=3000})
-- MonsterSpawnWavesClass.addMonster({ID=4,x=1342,y=828,wave=3,xL=400,xR=3000})
-- MonsterSpawnWavesClass.addMonster({ID=4,x=1408,y=970,wave=3,xL=400,xR=3000})
MonsterSpawnWavesClass.addMonster({ID=99,x=1408,y=970,wave=3,xL=400,xR=3000})
 level.layers["StaticWorld"].objects["boundTop"] = WorldSet.newboundRecRow({x=2700,y=-120})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["boundTop"].image)
 level.layers["StaticWorld"].objects["boundDown"] = WorldSet.newboundRecRow({x=2700,y=3030})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["boundDown"].image)
 level.layers["StaticWorld"].objects["boundLeft"] = WorldSet.newboundRecCol({x=-700,y=1500})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["boundLeft"].image) level.layers["StaticWorld"].objects["boundRight"] = WorldSet.newboundRecCol({x=6100,y=1500}) level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["boundRight"].image)scene:dispatchEvent({name='nextWave',nextWave = 1})
    level:insert(MonsterImageGroup)

    level:insert(level.layers["StaticWorld"])

    level:insert(level.layers["DynamicWorld"])

    level:insert(level.layers["InteractiveWorld"])

    level:insert(level.layers["Monster"])

    level:insert(level.layers["Supplement"])

    level:insert(level.layers["Image"])

    return level

end -- CreateLevel