--[[
---------------------------------------------------------------
	This is parameter about everything in Enemy Object
---------------------------------------------------------------
--]]

	---------------- Enemy Start ----------------
	_Enemy = {}
	----------------[ Monster_Cannon ] ----------------
		_Enemy.Monster_Cannon = {}

		_Enemy.Monster_Cannon.name 				= "monster"			
		_Enemy.Monster_Cannon.HP 				= 10	
		_Enemy.Monster_Cannon.moveSpeed			= 0
		_Enemy.Monster_Cannon.attackSpeed		= 2000
		_Enemy.Monster_Cannon.bulletSpeed		= 600
		_Enemy.Monster_Cannon.visibleDistance	= 1280
		_Enemy.Monster_Cannon.head 				= {}
			_Enemy.Monster_Cannon.head.ImagePath	= "kalacool/sango/image/monster/Cannon/cannon_head.png"
			_Enemy.Monster_Cannon.head.RX			= -2
			_Enemy.Monster_Cannon.head.RY			= -33
		_Enemy.Monster_Cannon.ImageSheetPath 	= "kalacool/sango/image/monster/Cannon/cannon_body_animation.png"
		_Enemy.Monster_Cannon.ImageSheetOption 	= { width=60, height=80, numFrames=10 }
		_Enemy.Monster_Cannon.ImageSheetSequence = 
		{
        	{name="loading", start=1, count=10, time= _Enemy.Monster_Cannon.attackSpeed , loopCount = 1}
    	}   
		_Enemy.Monster_Cannon.Physic 			= {}
			_Enemy.Monster_Cannon.Physic.Type		= "static"
			_Enemy.Monster_Cannon.Physic.Option		= {density = 3,filter = { categoryBits = 4, maskBits = 67 }}
		_Enemy.Monster_Cannon.bullet 						= {}
			_Enemy.Monster_Cannon.bullet.ImageSheetPath 	= "kalacool/sango/image/monster/Cannon/cannon_bullet_animation.png"
			_Enemy.Monster_Cannon.bullet.ImageSheetOption 	= { width=51, height=49, numFrames=8 }
			_Enemy.Monster_Cannon.bullet.ImageSheetSequence =
			{
            	{ name="fly", 		start=1, count=4, time= 400 },
            	{ name="explosion", start=5, count=4, time= 300 }
        	}
			_Enemy.Monster_Cannon.bullet.Physic 			= {}
				_Enemy.Monster_Cannon.bullet.Physic.Type 		= "dynamic"
				_Enemy.Monster_Cannon.bullet.Physic.Option 		= {density = 1 , filter = { categoryBits = 4 , maskBits = 67} }
			_Enemy.Monster_Cannon.bullet.gravityScale 		= 0
			_Enemy.Monster_Cannon.bullet.damage 			= "fatal"
			_Enemy.Monster_Cannon.bullet.damageValue 		= 2
	----

	----------------[ Monster_fireball ] ----------------
		_Enemy.Monster_fireball = {}

		_Enemy.Monster_fireball.HP 				= 10
		_Enemy.Monster_fireball.moveSpeed 		= 300
		_Enemy.Monster_fireball.attackRange 	= 300
		_Enemy.Monster_fireball.visibleDistance = 1000
		_Enemy.Monster_fireball.name 			= "monster"
		_Enemy.Monster_fireball.ImagePath		= "kalacool/sango/image/monster/FireBall/fireball.png"
		_Enemy.Monster_fireball.Physic			= {}
			_Enemy.Monster_fireball.Physic.Type		= "dynamic"
			_Enemy.Monster_fireball.Physic.Option	= {density = 10,filter = {categoryBits = 4, maskBits = 98 }}
		_Enemy.Monster_fireball.isFixedRotation	= true
		_Enemy.Monster_fireball.damageValue		= 1
		_Enemy.Monster_fireball.gravityScale	= 0

	----
	----------------[ Monster_Slime ] ----------------
		_Enemy.Monster_Slime = {}

		_Enemy.Monster_Slime.HP 				= 10
		_Enemy.Monster_Slime.moveSpeed			= 300
		_Enemy.Monster_Slime.attackRange 		= 200
		_Enemy.Monster_Slime.visibleDistance 	= 800
		_Enemy.Monster_Slime.name 				= "monster"
		_Enemy.Monster_Slime.ImagePath			= "kalacool/sango/image/monster/Slime/slime.png"
		_Enemy.Monster_Slime.Physic				= {}
			_Enemy.Monster_Slime.Type				= "dynamic"
			_Enemy.Monster_Slime.Option				= {density = 10, friction = 0.7,filter = { categoryBits = 4, maskBits = 99}}
		_Enemy.Monster_Slime.isFixedRotation	= true
		_Enemy.Monster_Slime.damageValue		= 1
	----

	---------------- Enemy End ----------------

	----------------[ Monster_Warrior ] ----------------
		_Enemy.Monster_Warrior = {}

		_Enemy.Monster_Warrior.HP 				= 10
		_Enemy.Monster_Warrior.moveSpeed		= 300
		_Enemy.Monster_Warrior.attackRange 		= 200
		_Enemy.Monster_Warrior.visibleDistance 	= 800
		_Enemy.Monster_Warrior.name 				= "monster"
		_Enemy.Monster_Warrior.ImageSheet			= graphics.newImageSheet( "kalacool/sango/image/monster/warrior/warrior.png",{ width=518, height=252, numFrames=18 })
		_Enemy.Monster_Warrior.ImageSequence		= {
 			
 			{ name="move", start=1,count=3, time=500,loopDirection = "bounce"},
			{ name="chop", start=1,count=18, time=1000,loopCount = 0}

		}
	
		_Enemy.Monster_Warrior.Physic				= {}
		_Enemy.Monster_Warrior.Type				= "dynamic"
		_Enemy.Monster_Warrior.Option				= {density = 20, friction = 0.7,filter = { categoryBits = 4, maskBits = 99}}
		_Enemy.Monster_Warrior.isFixedRotation	= true
		_Enemy.Monster_Warrior.damageValue		= 1
	----

	---------------- Enemy End ----------------




	

