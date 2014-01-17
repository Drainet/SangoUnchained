require("Class")

require "kalacool.sango.System.globalVariable"
require "kalacool.sango.System.GlobalPara.World"
require "kalacool.sango.System.GlobalPara.Enemy"
require "kalacool.sango.System.GlobalPara.Player"

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



