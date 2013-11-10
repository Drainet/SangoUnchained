    -- Generated by Kalacool Editor

module(..., package.seeall)
require("kalacool.sango.Set.WorldSet")

require('kalacool.sango.set.SupplementSet')
function CreateLevel(physics)

    display.setDefault( 'background', 0, 0, 0 )
    physics.setGravity(0.0,20.0)
    local collFilter = nil
    local level = display.newGroup()
    level.layers = {}
    level.name = "1-1"

level.layers["StaticWorld"] = display.newGroup()
level.layers["StaticWorld"].name = "StaticWorld"
level.layers["StaticWorld"].objects = {}
level.layers["DynamicWorld"] = display.newGroup()
level.layers["DynamicWorld"].name = "StaticWorld"
level.layers["DynamicWorld"].objects = {}
level.layers["InteractiveWorld"] = display.newGroup()
level.layers["InteractiveWorld"].name = "StaticWorld"
level.layers["InteractiveWorld"].objects = {}
 level.layers["StaticWorld"].objects["object0"] = WorldSet.newhor_floor({x=324,y=710})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object0"].image)
 level.layers["StaticWorld"].objects["object1"] = WorldSet.newleftTop_floor({x=886,y=874})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object1"].image)
 level.layers["StaticWorld"].objects["object2"] = WorldSet.newhor_floor({x=1444,y=1034})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object2"].image)
 level.layers["StaticWorld"].objects["object3"] = WorldSet.newpar_floor({x=1760,y=1202})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object3"].image)
 level.layers["StaticWorld"].objects["object4"] = WorldSet.newhor_floor({x=2072,y=1372})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object4"].image)
 level.layers["StaticWorld"].objects["object5"] = WorldSet.newhor_floor({x=2658,y=1384})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object5"].image)
 level.layers["StaticWorld"].objects["object6"] = WorldSet.newhor_floor({x=3252,y=1390})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object6"].image)
 level.layers["StaticWorld"].objects["object7"] = WorldSet.newhor_floor({x=3858,y=1396})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object7"].image)
 level.layers["StaticWorld"].objects["object8"] = WorldSet.newpar_floor({x=4182,y=1230})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object8"].image)
 level.layers["StaticWorld"].objects["object9"] = WorldSet.newhor_floor({x=4510,y=1086})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object9"].image)
 level.layers["StaticWorld"].objects["object10"] = WorldSet.newhor_floor({x=5102,y=1096})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object10"].image)
 level.layers["StaticWorld"].objects["object11"] = WorldSet.newleftTop_floor({x=5668,y=1262})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object11"].image)
 level.layers["StaticWorld"].objects["object12"] = WorldSet.newhor_floor({x=6238,y=1424})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object12"].image)
 level.layers["StaticWorld"].objects["object13"] = WorldSet.newpar_floor({x=6550,y=1584})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object13"].image)
 level.layers["StaticWorld"].objects["object14"] = WorldSet.newhor_floor({x=6870,y=1742})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object14"].image)
 level.layers["StaticWorld"].objects["object15"] = WorldSet.newhor_floor({x=7472,y=1750})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object15"].image)
 level.layers["StaticWorld"].objects["object16"] = WorldSet.newhor_floor({x=8062,y=1760})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object16"].image)
 level.layers["StaticWorld"].objects["object17"] = WorldSet.newhor_floor({x=8656,y=1766})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object17"].image)
 level.layers["StaticWorld"].objects["object18"] = WorldSet.newpar_floor({x=8984,y=1634})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object18"].image)
 level.layers["StaticWorld"].objects["object19"] = WorldSet.newpar_floor({x=8988,y=1372})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object19"].image)
 level.layers["StaticWorld"].objects["object20"] = WorldSet.newhor_floor({x=9266,y=1210})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object20"].image)
 level.layers["StaticWorld"].objects["object21"] = WorldSet.newpar_floor({x=9610,y=1048})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object21"].image)
 level.layers["StaticWorld"].objects["object22"] = WorldSet.newhor_floor({x=9934,y=872})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object22"].image)
 level.layers["StaticWorld"].objects["object23"] = WorldSet.newpar_floor({x=10218,y=684})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object23"].image)
 level.layers["StaticWorld"].objects["object24"] = WorldSet.newpar_floor({x=10216,y=372})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object24"].image)
 level.layers["InteractiveWorld"].objects["object25"] = WorldSet.newWoodenDoor({x=10098,y=708})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object25"].image)

 level.layers["InteractiveWorld"].objects["object26"] = WorldSet.newfloatingFloor({x=800,y=672})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object26"].image)
 --set supplements in game
 level.layers["InteractiveWorld"].objects["object28"] = SupplementSet.new_Sup_ShootFaster({x=324,y=600})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object28"].image)
 level.layers["InteractiveWorld"].objects["object27"] = SupplementSet.new_Sup_MoreLife({x=390,y=600})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object27"].image)


    level:insert(level.layers["StaticWorld"])

    level:insert(level.layers["DynamicWorld"])

    level:insert(level.layers["InteractiveWorld"])

    return level

end -- CreateLevel