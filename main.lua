require("Class")

require "kalacool.sango.System.globalVariable"
require "kalacool.sango.System.GlobalPara.World"

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
								"Texture: " .. string.format("%.3f", system.getInfo("textureMemoryUsed")/(1024*1024)) .. " MB "
	end

	Runtime:addEventListener("enterFrame", Performance)
--------------- Performance End ---------------
