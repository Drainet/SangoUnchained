module(..., package.seeall)

ObjectClass = require('kalacool.sango.Classes.Object')
--AI = require("kalacool.sango.Classes.Objects.Character.Enemy.MonsterAI.Fireball_AI")

function new(config)

local Bar = ObjectClass.new()
    Bar.image = display.newGroup( )
    Bar.barBG = display.newRect( 640 , 50 , 640 , 50 )
    Bar.barBG:setFillColor(0.4,0.4,0.4)
    Bar.barLife = display.newRect( 640 , 50 , 640 , 50 )
    Bar.barLife:setFillColor( 0.8 , 0.1 , 0.1 )
    Bar.BossName = display.newText({ text=config.name , x=640,y=50 ,width=640,height=50, fontSize=40 , align="center"})
    Bar.BossName:setFillColor( 1,1,1 )
    Bar.image:insert(Bar.barBG)
    Bar.image:insert( Bar.barLife )
    Bar.image:insert(Bar.BossName)  
    --- Bar attribute ---
    Bar.MaxHP =config.HP
    Bar.width = 640
    --- Bar attribute end ---
    function Bar:hurt(curHP)
        transition.to( Bar.barLife, {time=10 , width=Bar.width * ( curHP/Bar.MaxHP)})
    end

return Bar
end

