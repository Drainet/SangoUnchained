    -- Generated by Kalacool Editor

module(..., package.seeall)
require("kalacool.sango.Set.WorldSet")
require("kalacool.sango.Set.EnemySet")
require("kalacool.sango.Set.SupplementSet")
require("kalacool.sango.Set.MechanismSet")
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
level.layers["Monster"] = display.newGroup()
level.layers["Monster"].name = "Monster"
level.layers["Monster"].objects = {}
level.layers["Supplement"] = display.newGroup()
level.layers["Supplement"].name = "Supplement"
level.layers["Supplement"].objects = {}
 level.layers["StaticWorld"].objects["object0"] = WorldSet.newhor_floor({x=600,y=1770})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object0"].image)
 level.layers["StaticWorld"].objects["object2"] = WorldSet.newS_hor_floor({x=310,y=1720})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object2"].image)
 level.layers["StaticWorld"].objects["object2"].image:rotate(90)
 level.layers["StaticWorld"].objects["object3"] = WorldSet.newS_hor_floor({x=310,y=1640})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object3"].image)
 level.layers["StaticWorld"].objects["object3"].image:rotate(90)
 level.layers["StaticWorld"].objects["object4"] = WorldSet.newS_hor_floor({x=310,y=1560})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object4"].image)
 level.layers["StaticWorld"].objects["object4"].image:rotate(90)
 level.layers["StaticWorld"].objects["object5"] = WorldSet.newM_hor_floor({x=500,y=1530})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object5"].image)
 level.layers["StaticWorld"].objects["object6"] = WorldSet.newM_hor_floor({x=860,y=1530})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object6"].image)
 level.layers["StaticWorld"].objects["object7"] = WorldSet.newM_hor_floor({x=1080,y=1770})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object7"].image)
 level.layers["StaticWorld"].objects["object8"] = WorldSet.newS_hor_floor({x=1270,y=1740})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object8"].image)
 level.layers["StaticWorld"].objects["object8"].image:rotate(90)
 level.layers["StaticWorld"].objects["object9"] = WorldSet.newS_hor_floor({x=1050,y=1500})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object9"].image)
 level.layers["StaticWorld"].objects["object9"].image:rotate(90)
 level.layers["StaticWorld"].objects["object10"] = WorldSet.newM_hor_floor({x=1220,y=1450})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object10"].image)
 level.layers["StaticWorld"].objects["object11"] = WorldSet.newM_hor_floor({x=1780,y=1690})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object11"].image)
 level.layers["StaticWorld"].objects["object12"] = WorldSet.newM_hor_floor({x=1920,y=1270})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object12"].image)
 level.layers["StaticWorld"].objects["object13"] = WorldSet.newM_hor_floor({x=1580,y=1450})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object13"].image)
 level.layers["StaticWorld"].objects["object14"] = WorldSet.newhor_floor({x=1560,y=1690})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object14"].image)
 level.layers["StaticWorld"].objects["object15"] = WorldSet.newS_hor_floor({x=1970,y=1660})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object15"].image)
 level.layers["StaticWorld"].objects["object15"].image:rotate(90)
 level.layers["StaticWorld"].objects["object16"] = WorldSet.newS_hor_floor({x=1970,y=1580})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object16"].image)
 level.layers["StaticWorld"].objects["object16"].image:rotate(90)
 level.layers["StaticWorld"].objects["object17"] = WorldSet.newS_hor_floor({x=1750,y=1320})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object17"].image)
 level.layers["StaticWorld"].objects["object17"].image:rotate(90)
 level.layers["StaticWorld"].objects["object18"] = WorldSet.newS_hor_floor({x=1750,y=1400})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object18"].image)
 level.layers["StaticWorld"].objects["object18"].image:rotate(90)
 level.layers["StaticWorld"].objects["object19"] = WorldSet.newM_hor_floor({x=2140,y=1530})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object19"].image)
 level.layers["StaticWorld"].objects["object20"] = WorldSet.newhor_floor({x=2620,y=1530})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object20"].image)
 level.layers["InteractiveWorld"].objects["object21"] = WorldSet.newfloatingFloor({x=2800,y=1290})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object21"].image)
 level.layers["StaticWorld"].objects["object22"] = WorldSet.newM_hor_floor({x=2110,y=1100})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object22"].image)
 level.layers["StaticWorld"].objects["object22"].image:rotate(90)
 level.layers["StaticWorld"].objects["object23"] = WorldSet.newS_hor_floor({x=2960,y=1530})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object23"].image)
 level.layers["StaticWorld"].objects["object24"] = WorldSet.newS_hor_floor({x=3040,y=1530})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object24"].image)
 level.layers["StaticWorld"].objects["object25"] = WorldSet.newM_hor_floor({x=3090,y=1360})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object25"].image)
 level.layers["StaticWorld"].objects["object25"].image:rotate(90)
 level.layers["StaticWorld"].objects["object26"] = WorldSet.newM_hor_floor({x=3090,y=1240})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object26"].image)
 level.layers["StaticWorld"].objects["object26"].image:rotate(90)
 level.layers["StaticWorld"].objects["object27"] = WorldSet.newM_hor_floor({x=2110,y=940})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object27"].image)
 level.layers["StaticWorld"].objects["object27"].image:rotate(90)
 level.layers["StaticWorld"].objects["object28"] = WorldSet.newhor_floor({x=2400,y=750})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object28"].image)
 level.layers["StaticWorld"].objects["object29"] = WorldSet.newhor_floor({x=3000,y=750})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object29"].image)
 level.layers["StaticWorld"].objects["object30"] = WorldSet.newhor_floor({x=3380,y=1050})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object30"].image)
 level.layers["StaticWorld"].objects["object31"] = WorldSet.newS_hor_floor({x=2320,y=1110})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object31"].image)
 level.layers["StaticWorld"].objects["object32"] = WorldSet.newS_hor_floor({x=2240,y=1110})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object32"].image)
 level.layers["StaticWorld"].objects["object33"] = WorldSet.newS_hor_floor({x=2400,y=1110})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object33"].image)
 level.layers["StaticWorld"].objects["object34"] = WorldSet.newS_hor_floor({x=2160,y=1110})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object34"].image)
 level.layers["InteractiveWorld"].objects["object35"] = WorldSet.newWoodenDoor({x=3586,y=888})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object35"].image)
 level.layers["StaticWorld"].objects["object36"] = WorldSet.newM_hor_floor({x=3480,y=750})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object36"].image)
 level.layers["StaticWorld"].objects["object37"] = WorldSet.newM_hor_floor({x=3660,y=720})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["object37"].image)
 level.layers["StaticWorld"].objects["object37"].image:rotate(90)
 level.layers["Supplement"].objects["object38"] = SupplementSet.newDogFood({x=940,y=1708,starIndex=1})
 level.layers["Supplement"]:insert(level.layers["Supplement"].objects["object38"].image)
 level.layers["Supplement"].objects["object39"] = SupplementSet.newDogFood({x=1440,y=1628,starIndex=2})
 level.layers["Supplement"]:insert(level.layers["Supplement"].objects["object39"].image)
 level.layers["Supplement"].objects["object40"] = SupplementSet.newDogFood({x=2260,y=1048,starIndex=3})
 level.layers["Supplement"]:insert(level.layers["Supplement"].objects["object40"].image)
    level:insert(level.layers["StaticWorld"])

    level:insert(level.layers["DynamicWorld"])

    level:insert(level.layers["InteractiveWorld"])

    level:insert(level.layers["Monster"])

    level:insert(level.layers["Supplement"])

    return level

end -- CreateLevel