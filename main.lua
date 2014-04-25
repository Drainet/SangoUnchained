require("Class")

require "kalacool.sango.System.globalVariable"
require "kalacool.sango.System.GlobalPara.World"
require "kalacool.sango.System.GlobalPara.Enemy"
require "kalacool.sango.System.GlobalPara.Player"
DataSetClass = require "kalacool.sango.System.DataCollect"
JSONFileSet = require "kalacool.sango.JSON.JSONFileSet"

display.setStatusBar( display.HiddenStatusBar ) 

local storyboard = require "storyboard"
scene = storyboard.newScene()

local options = 
	{
		effect = "fade",
		time = 400,
		params =
			{
				firstTimeCome = true,
			}
	}
storyboard.gotoScene( "kalacool.sango.Scene.Menu", options)

------------------ Android Back Button Start ------------------
local function onKeyEvent( event )

   local phase = event.phase
   local keyName = event.keyName
   print( event.phase, event.keyName )

   if ( "back" == keyName and phase == "up" ) then
		local function onComplete( event )
			if "clicked" == event.action then
				local i = event.index
				if 1 == i then
					native.cancelAlert( alert )
				elseif 2 == i then
					-- scene:dispatchEvent({name='sendData'})
					native.requestExit()
				end
			end
		end
		local alert = native.showAlert( "EXIT", "離開遊戲?", { "否", "是" }, onComplete )
		-- group:insert(alert);
		return true
   end
   return true  --SEE NOTE BELOW
end
--add the key callback
Runtime:addEventListener( "key", onKeyEvent )
------------------ Android Back Button End ------------------

-------- Data Collect Start ---------
DataCollect = DataSetClass.new()
-------- Data Collect End ---------

--------------- Performance Start ---------------
	performanceText = display.newText("", 0, 0, native.systemFont, 30)
	local maxMemory = 0
	local function Performance()
		performanceText:setFillColor( 255, 0, 0 )
		performanceText.x, performanceText.y = display.contentWidth/2 -400, display.contentHeight - 50

		if maxMemory < collectgarbage("count") then
			maxMemory = collectgarbage("count")
		end

		performanceText.text =  "Memory: ".. string.format("%.3f", collectgarbage("count")) .. " KB\n" ..
								"Max: ".. string.format("%.3f", maxMemory) .. "KB \n" ..
								"Texture: " .. string.format("%.3f", system.getInfo("textureMemoryUsed")/(1024*1024)) .. " MB\n"
								.. "time: " .. string.format("%.3f", system.getTimer() )  .."123"						
	end

	Runtime:addEventListener("enterFrame", Performance)
--------------- Performance End ---------------
