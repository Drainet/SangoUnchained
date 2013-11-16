--Classes/Objects/World/InteractiveWorld/FloatingFloor.lua

module(..., package.seeall)

local scene = scene
--INSTANCE FUNCTIONS
function setBackgroundLayer(level,player,imgArr)

    local BackgroundLayer = display.newGroup( )
    BackgroundLayer.player = player
    BackgroundLayer.level = level

    local background = require "kalacool.sango.Background.BackgroundImage"
    local backgroundArr = {}

    for i = 1,table.getn(imgArr) do
        backgroundArr[i] = background.new(imgArr[i].imgPath)
        for j=1,table.getn(backgroundArr) do
            backgroundArr[table.getn(backgroundArr)-j+1]:toBack()
        end
    end

    for i=1,table.getn(imgArr)  do
         BackgroundLayer:insert(backgroundArr[i])
    end
   
   function BackgroundLayer:moveLayer(event)
        movex = self.level.x - self.player.image.x
        movey = self.level.y - self.player.image.y
        for i=1,table.getn(imgArr) do
            backgroundArr[i]:move(movex/imgArr[i].x,movey/imgArr[i].y)
        end
   end


   function BackgroundLayer:removeAllEvent(event)
        scene:removeEventListener( 'moveLayer', BackgroundLayer )
    end
    
    scene:addEventListener( 'removeAllEvent',  BackgroundLayer )

    
    scene:addEventListener( 'moveLayer', BackgroundLayer )

    return BackgroundLayer
end

