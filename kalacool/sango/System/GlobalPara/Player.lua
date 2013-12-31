--[[
---------------------------------------------------------------
	This is parameter about everything in Player Object
---------------------------------------------------------------
--]]

	_Player = {}

	---------------- [ Doggy ] ----------------
		_Player.Doggy = {}

		_Player.Doggy.ImageSheetPath 		= "kalacool/sango/image/character/coodog.png"
		_Player.Doggy.ImageSheetOption 		= { width=120, height=113, numFrames=9 }
		_Player.Doggy.ImageSheetSequence 	= 
		{
			{ name="normal", frames= {2, 1, 3}, time=300 , loopDirection = "bounce" },
			{ name="jump",	 start=4, count=3,  time=200 , loopDirection = "bounce" },
			{ name="dead",   start=7, count=3,  time=200 , loopDirection = "bounce" }
		}
		_Player.Doggy.hand 				= {}
			_Player.Doggy.hand.ImagePath	= "kalacool/sango/image/character/coodoghand.png"
			_Player.Doggy.hand.fistX		= 13
			_Player.Doggy.hand.fistY		= 21
	----
	---------------- [ shadow ] ----------------
		_Player.shadow = {}

		_Player.shadow.ImageSheetPath 		= "kalacool/sango/image/character/shadow.png"
		_Player.shadow.ImageSheetOption 	= { width=120, height=113, numFrames=9 }
		_Player.shadow.ImageSheetSequence 	= 
		{
			{ name="normal", frames={1, 2, 3}, time=300 ,loopDirection = "bounce" },
			{ name="jump",   start=4, count=3, time=200 ,loopDirection = "bounce" },
			{ name="dead",   start=7, count=3, time=200 ,loopDirection = "bounce" }
		}
		_Player.shadow.hand 				= {}
			_Player.shadow.hand.ImagePath		= "kalacool/sango/image/character/shadowhand.png"
			_Player.shadow.hand.fistX			= 3
			_Player.shadow.hand.fistY			= 28
	----
	---------------- [ Cat ] ----------------
		_Player.Cat = {}

		_Player.Cat.ImageSheetPath 		= "kalacool/sango/image/character/cat.png"
		_Player.Cat.ImageSheetOption 	= { width=150, height=141, numFrames=9 }
		_Player.Cat.ImageSheetSwquence 	= 
		{
			{ name="normal"	, start=1, count=3, time=800 },
			{ name="jump"	, start=4, count=3, time=200 },
			{ name="dead"	, start=7, count=3, time=200 }
		}
		_Player.Cat.hang 				= {}
			_Player.Cat.hang.ImagePath		= "kalacool/sango/image/character/cat_hand.png"
			_Player.Cat.hang.xReference		= 27
			_Player.Cat.hang.yReference		= -8
	----




	

