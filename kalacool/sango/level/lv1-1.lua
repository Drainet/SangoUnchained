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
level.layers["Image"] = display.newGroup()
level.layers["Image"].name = "Image"
level.layers["Image"].objects = {}
 level.layers["InteractiveWorld"].objects["object0"] = MechanismSet.newDestructibleBlock({x=1426,y=902})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object0"].image)
 level.layers["InteractiveWorld"].objects["object1"] = MechanismSet.newDestructibleBlock({x=1246,y=912})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object1"].image)
 level.layers["InteractiveWorld"].objects["object2"] = MechanismSet.newDestructibleBlock({x=1074,y=934})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object2"].image)
 level.layers["InteractiveWorld"].objects["object3"] = MechanismSet.newDestructibleBlock({x=898,y=914})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object3"].image)
 level.layers["InteractiveWorld"].objects["object4"] = MechanismSet.newDestructibleBlock({x=724,y=914})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object4"].image)
 level.layers["InteractiveWorld"].objects["object5"] = MechanismSet.newDestructibleBlock({x=570,y=914})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object5"].image)
 level.layers["InteractiveWorld"].objects["object6"] = MechanismSet.newDestructibleBlock({x=408,y=908})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object6"].image)
 level.layers["InteractiveWorld"].objects["object7"] = MechanismSet.newDestructibleBlock({x=414,y=1148})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object7"].image)
 level.layers["InteractiveWorld"].objects["object8"] = MechanismSet.newDestructibleBlock({x=576,y=1154})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object8"].image)
 level.layers["InteractiveWorld"].objects["object9"] = MechanismSet.newDestructibleBlock({x=730,y=1154})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object9"].image)
 level.layers["InteractiveWorld"].objects["object10"] = MechanismSet.newDestructibleBlock({x=904,y=1154})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object10"].image)
 level.layers["InteractiveWorld"].objects["object11"] = MechanismSet.newDestructibleBlock({x=1074,y=1154})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object11"].image)
 level.layers["InteractiveWorld"].objects["object12"] = MechanismSet.newDestructibleBlock({x=1252,y=1152})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object12"].image)
 level.layers["InteractiveWorld"].objects["object13"] = MechanismSet.newDestructibleBlock({x=1432,y=1142})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object13"].image)
 level.layers["InteractiveWorld"].objects["object14"] = MechanismSet.newDestructibleBlock({x=244,y=774})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object14"].image)
 level.layers["InteractiveWorld"].objects["object15"] = MechanismSet.newDestructibleBlock({x=242,y=606})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object15"].image)
 level.layers["InteractiveWorld"].objects["object16"] = MechanismSet.newDestructibleBlock({x=238,y=434})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object16"].image)
 level.layers["InteractiveWorld"].objects["object17"] = MechanismSet.newDestructibleBlock({x=236,y=270})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object17"].image)
 level.layers["InteractiveWorld"].objects["object18"] = MechanismSet.newDestructibleBlock({x=394,y=114})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object18"].image)
 level.layers["InteractiveWorld"].objects["object19"] = MechanismSet.newDestructibleBlock({x=240,y=102})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object19"].image)
 level.layers["InteractiveWorld"].objects["object20"] = MechanismSet.newDestructibleBlock({x=234,y=954})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object20"].image)
 level.layers["InteractiveWorld"].objects["object21"] = MechanismSet.newDestructibleBlock({x=250,y=1154})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object21"].image)
 level.layers["InteractiveWorld"].objects["object22"] = MechanismSet.newDestructibleBlock({x=566,y=102})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object22"].image)
 level.layers["InteractiveWorld"].objects["object23"] = MechanismSet.newDestructibleBlock({x=720,y=102})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object23"].image)
 level.layers["InteractiveWorld"].objects["object24"] = MechanismSet.newDestructibleBlock({x=914,y=94})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object24"].image)
 level.layers["InteractiveWorld"].objects["object25"] = MechanismSet.newDestructibleBlock({x=1054,y=94})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object25"].image)
 level.layers["InteractiveWorld"].objects["object26"] = MechanismSet.newDestructibleBlock({x=1254,y=94})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object26"].image)
 level.layers["InteractiveWorld"].objects["object27"] = MechanismSet.newDestructibleBlock({x=1414,y=94})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object27"].image)
 level.layers["InteractiveWorld"].objects["object28"] = MechanismSet.newDestructibleBlock({x=1574,y=94})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object28"].image)
 level.layers["InteractiveWorld"].objects["object29"] = MechanismSet.newDestructibleBlock({x=1754,y=92})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object29"].image)
 level.layers["InteractiveWorld"].objects["object30"] = MechanismSet.newDestructibleBlock({x=1914,y=94})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object30"].image)
 level.layers["InteractiveWorld"].objects["object31"] = MechanismSet.newDestructibleBlock({x=2062,y=98})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object31"].image)
 level.layers["InteractiveWorld"].objects["object32"] = MechanismSet.newDestructibleBlock({x=2234,y=74})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object32"].image)
 level.layers["InteractiveWorld"].objects["object33"] = MechanismSet.newDestructibleBlock({x=2414,y=114})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object33"].image)
 level.layers["InteractiveWorld"].objects["object34"] = MechanismSet.newDestructibleBlock({x=2338,y=266})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object34"].image)
 level.layers["InteractiveWorld"].objects["object35"] = MechanismSet.newDestructibleBlock({x=2414,y=434})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object35"].image)
 level.layers["InteractiveWorld"].objects["object36"] = MechanismSet.newDestructibleBlock({x=2370,y=606})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object36"].image)
 level.layers["InteractiveWorld"].objects["object37"] = MechanismSet.newDestructibleBlock({x=2372,y=774})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object37"].image)
 level.layers["InteractiveWorld"].objects["object38"] = MechanismSet.newDestructibleBlock({x=2374,y=934})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object38"].image)
 level.layers["InteractiveWorld"].objects["object39"] = MechanismSet.newDestructibleBlock({x=2354,y=1094})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object39"].image)
 level.layers["InteractiveWorld"].objects["object40"] = MechanismSet.newDestructibleBlock({x=2394,y=1274})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object40"].image)
 level.layers["InteractiveWorld"].objects["object41"] = MechanismSet.newDestructibleBlock({x=1750,y=1108})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object41"].image)
 level.layers["InteractiveWorld"].objects["object42"] = MechanismSet.newDestructibleBlock({x=1434,y=1314})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object42"].image)
 level.layers["InteractiveWorld"].objects["object43"] = MechanismSet.newDestructibleBlock({x=1594,y=1234})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object43"].image)
 level.layers["InteractiveWorld"].objects["object44"] = MechanismSet.newDestructibleBlock({x=1912,y=1112})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object44"].image)
 level.layers["InteractiveWorld"].objects["object45"] = MechanismSet.newDestructibleBlock({x=2072,y=1110})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object45"].image)
 level.layers["InteractiveWorld"].objects["object46"] = MechanismSet.newDestructibleBlock({x=2234,y=1434})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object46"].image)
 level.layers["InteractiveWorld"].objects["object47"] = MechanismSet.newDestructibleBlock({x=2394,y=1454})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object47"].image)
 level.layers["InteractiveWorld"].objects["object48"] = MechanismSet.newDestructibleBlock({x=2072,y=1430})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object48"].image)
 level.layers["InteractiveWorld"].objects["object49"] = MechanismSet.newDestructibleBlock({x=1912,y=1432})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object49"].image)
 level.layers["InteractiveWorld"].objects["object50"] = MechanismSet.newDestructibleBlock({x=1750,y=1428})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object50"].image)
 level.layers["InteractiveWorld"].objects["object51"] = MechanismSet.newDestructibleBlock({x=1594,y=1434})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object51"].image)
 level.layers["InteractiveWorld"].objects["object52"] = MechanismSet.newDestructibleBlock({x=1234,y=1334})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object52"].image)
 level.layers["InteractiveWorld"].objects["object53"] = MechanismSet.newDestructibleBlock({x=894,y=1334})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object53"].image)
 level.layers["InteractiveWorld"].objects["object54"] = MechanismSet.newDestructibleBlock({x=74,y=1314})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object54"].image)
 level.layers["InteractiveWorld"].objects["object55"] = MechanismSet.newDestructibleBlock({x=574,y=1734})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object55"].image)
 level.layers["InteractiveWorld"].objects["object56"] = MechanismSet.newDestructibleBlock({x=1234,y=1494})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object56"].image)
 level.layers["InteractiveWorld"].objects["object57"] = MechanismSet.newDestructibleBlock({x=94,y=1794})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object57"].image)
 level.layers["InteractiveWorld"].objects["object58"] = MechanismSet.newDestructibleBlock({x=250,y=1574})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object58"].image)
 level.layers["InteractiveWorld"].objects["object59"] = MechanismSet.newDestructibleBlock({x=114,y=2114})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object59"].image)
 level.layers["InteractiveWorld"].objects["object60"] = MechanismSet.newDestructibleBlock({x=94,y=1954})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object60"].image)
 level.layers["InteractiveWorld"].objects["object61"] = MechanismSet.newDestructibleBlock({x=576,y=1574})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object61"].image)
 level.layers["InteractiveWorld"].objects["object62"] = WorldSet.newWoodenDoor({x=722,y=1420})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object62"].image)
 level.layers["InteractiveWorld"].objects["object63"] = MechanismSet.newDestructibleBlock({x=2586,y=1580})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object63"].image)
 level.layers["InteractiveWorld"].objects["object64"] = MechanismSet.newDestructibleBlock({x=2394,y=1734})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object64"].image)
 level.layers["InteractiveWorld"].objects["object65"] = MechanismSet.newDestructibleBlock({x=2454,y=1914})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object65"].image)
 level.layers["InteractiveWorld"].objects["object66"] = MechanismSet.newDestructibleBlock({x=1434,y=1574})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object66"].image)
 level.layers["InteractiveWorld"].objects["object67"] = MechanismSet.newDestructibleBlock({x=1414,y=1734})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object67"].image)
 level.layers["InteractiveWorld"].objects["object68"] = MechanismSet.newDestructibleBlock({x=1594,y=1734})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object68"].image)
 level.layers["InteractiveWorld"].objects["object69"] = MechanismSet.newDestructibleBlock({x=1750,y=1708})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object69"].image)
 level.layers["InteractiveWorld"].objects["object70"] = MechanismSet.newDestructibleBlock({x=1912,y=1712})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object70"].image)
 level.layers["InteractiveWorld"].objects["object71"] = MechanismSet.newDestructibleBlock({x=2072,y=1710})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object71"].image)
 level.layers["InteractiveWorld"].objects["object72"] = MechanismSet.newDestructibleBlock({x=2454,y=2114})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object72"].image)
 level.layers["InteractiveWorld"].objects["object73"] = MechanismSet.newDestructibleBlock({x=2234,y=2074})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object73"].image)
 level.layers["InteractiveWorld"].objects["object74"] = MechanismSet.newDestructibleBlock({x=2072,y=1990})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object74"].image)
 level.layers["InteractiveWorld"].objects["object75"] = MechanismSet.newDestructibleBlock({x=1912,y=1992})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object75"].image)
 level.layers["InteractiveWorld"].objects["object76"] = MechanismSet.newDestructibleBlock({x=1754,y=2054})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object76"].image)
 level.layers["InteractiveWorld"].objects["object77"] = MechanismSet.newDestructibleBlock({x=1594,y=2074})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object77"].image)
 level.layers["InteractiveWorld"].objects["object78"] = MechanismSet.newDestructibleBlock({x=1432,y=1982})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object78"].image)
 level.layers["InteractiveWorld"].objects["object79"] = MechanismSet.newDestructibleBlock({x=1254,y=2054})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object79"].image)
 level.layers["InteractiveWorld"].objects["object80"] = MechanismSet.newDestructibleBlock({x=1034,y=2034})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object80"].image)
 level.layers["InteractiveWorld"].objects["object81"] = MechanismSet.newDestructibleBlock({x=1094,y=1874})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object81"].image)
 level.layers["InteractiveWorld"].objects["object82"] = MechanismSet.newDestructibleBlock({x=1114,y=1694})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object82"].image)
 level.layers["InteractiveWorld"].objects["object83"] = MechanismSet.newDestructibleBlock({x=730,y=1574})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object83"].image)
 level.layers["InteractiveWorld"].objects["object84"] = MechanismSet.newDestructibleBlock({x=730,y=1854})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object84"].image)
 level.layers["InteractiveWorld"].objects["object85"] = MechanismSet.newDestructibleBlock({x=574,y=1894})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object85"].image)
 level.layers["InteractiveWorld"].objects["object86"] = MechanismSet.newDestructibleBlock({x=94,y=1634})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object86"].image)
 level.layers["InteractiveWorld"].objects["object87"] = MechanismSet.newDestructibleBlock({x=1254,y=2234})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object87"].image)
 level.layers["InteractiveWorld"].objects["object88"] = MechanismSet.newDestructibleBlock({x=994,y=2234})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object88"].image)
 level.layers["InteractiveWorld"].objects["object89"] = MechanismSet.newDestructibleBlock({x=810,y=2134})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object89"].image)
 level.layers["InteractiveWorld"].objects["object90"] = MechanismSet.newDestructibleBlock({x=636,y=2134})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object90"].image)
 level.layers["InteractiveWorld"].objects["object91"] = MechanismSet.newDestructibleBlock({x=454,y=2128})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object91"].image)
 level.layers["InteractiveWorld"].objects["object92"] = MechanismSet.newDestructibleBlock({x=270,y=2134})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object92"].image)
 level.layers["InteractiveWorld"].objects["object93"] = MechanismSet.newDestructibleBlock({x=94,y=2274})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object93"].image)
 level.layers["InteractiveWorld"].objects["object94"] = MechanismSet.newDestructibleBlock({x=414,y=1848})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object94"].image)
 level.layers["InteractiveWorld"].objects["object95"] = MechanismSet.newDestructibleBlock({x=84,y=1146})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object95"].image)
 level.layers["InteractiveWorld"].objects["object96"] = MechanismSet.newDestructibleBlock({x=74,y=954})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object96"].image)
 level.layers["InteractiveWorld"].objects["object97"] = MechanismSet.newDestructibleBlock({x=74,y=94})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object97"].image)
 level.layers["InteractiveWorld"].objects["object98"] = MechanismSet.newDestructibleBlock({x=70,y=262})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object98"].image)
 level.layers["InteractiveWorld"].objects["object99"] = MechanismSet.newDestructibleBlock({x=72,y=426})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object99"].image)
 level.layers["InteractiveWorld"].objects["object100"] = MechanismSet.newDestructibleBlock({x=76,y=598})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object100"].image)
 level.layers["InteractiveWorld"].objects["object101"] = MechanismSet.newDestructibleBlock({x=78,y=766})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object101"].image)
 level.layers["InteractiveWorld"].objects["object102"] = MechanismSet.newDestructibleBlock({x=1594,y=814})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object102"].image)
 level.layers["InteractiveWorld"].objects["object103"] = MechanismSet.newDestructibleBlock({x=1744,y=868})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object103"].image)
 level.layers["InteractiveWorld"].objects["object104"] = MechanismSet.newDestructibleBlock({x=2214,y=474})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object104"].image)
 level.layers["InteractiveWorld"].objects["object105"] = MechanismSet.newDestructibleBlock({x=2054,y=474})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object105"].image)
 level.layers["InteractiveWorld"].objects["object106"] = MechanismSet.newDestructibleBlock({x=1900,y=472})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object106"].image)
 level.layers["InteractiveWorld"].objects["object107"] = MechanismSet.newDestructibleBlock({x=1738,y=468})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object107"].image)
 level.layers["InteractiveWorld"].objects["object108"] = MechanismSet.newDestructibleBlock({x=1574,y=454})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object108"].image)
 level.layers["InteractiveWorld"].objects["object109"] = MechanismSet.newDestructibleBlock({x=1420,y=462})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object109"].image)
 level.layers["InteractiveWorld"].objects["object110"] = MechanismSet.newDestructibleBlock({x=1240,y=472})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object110"].image)
 level.layers["InteractiveWorld"].objects["object111"] = MechanismSet.newDestructibleBlock({x=574,y=734})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["object111"].image)


 level.layers["InteractiveWorld"].objects["99"] = MechanismSet.newDestructibleBlockStone({x=822,y=1530})
 level.layers["InteractiveWorld"]:insert(level.layers["InteractiveWorld"].objects["99"].image)

 level.layers["StaticWorld"].objects["boundTop"] = WorldSet.newboundRecRow({x=2700,y=-120})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["boundTop"].image)
 level.layers["StaticWorld"].objects["boundDown"] = WorldSet.newboundRecRow({x=2700,y=3030})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["boundDown"].image)
 level.layers["StaticWorld"].objects["boundLeft"] = WorldSet.newboundRecCol({x=-700,y=1500})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["boundLeft"].image)
 level.layers["StaticWorld"].objects["boundRight"] = WorldSet.newboundRecCol({x=6100,y=1500})
 level.layers["StaticWorld"]:insert(level.layers["StaticWorld"].objects["boundRight"].image)
 
    level:insert(level.layers["StaticWorld"])

    level:insert(level.layers["DynamicWorld"])

    level:insert(level.layers["InteractiveWorld"])

    level:insert(level.layers["Monster"])

    level:insert(level.layers["Supplement"])

    level:insert(level.layers["Image"])

    return level

end -- CreateLevel