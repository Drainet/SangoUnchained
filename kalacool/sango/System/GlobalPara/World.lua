--[[
---------------------------------------------------------------
	This is parameter about everything in World Object
---------------------------------------------------------------
--]]

	_World = {}

	---------------- Dynamic World Start ----------------
		_World.DynamicWorld = {}

		----------------[ Box ] ----------------
			_World.DynamicWorld.Box = {}

			_World.DynamicWorld.Box.ImagePath 	= "kalacool/sango/image/world/dynamicWorld/box.png"			
			_World.DynamicWorld.Box.Damage 		= "safe"		--  "safe" = no damage, "fatal" = have damage 		
			_World.DynamicWorld.Box.Physic		= {}
				_World.DynamicWorld.Box.Physic.Type		= "dynamic"
				_World.DynamicWorld.Box.Physic.Option	= { density=5, friction=0.6, bounce=0.1 }
		----
		----------------[ CompanionCube ] ----------------
			_World.DynamicWorld.CompanionCube = {}

			_World.DynamicWorld.CompanionCube.ImagePath 		= "kalacool/sango/image/world/dynamicWorld/companionCube.png"			
			_World.DynamicWorld.CompanionCube.Damage 		= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.DynamicWorld.CompanionCube.Physic			= {}
				_World.DynamicWorld.CompanionCube.Physic.Type	= "dynamic"
				_World.DynamicWorld.CompanionCube.Physic.Option	= { density=6.5, friction=0.7, bounce=0.5}
			_World.DynamicWorld.CompanionCube.isFixedRotation= true 
		----
	---------------- Dynamic World End ----------------

	---------------- Interactive World Start ----------------
		_World.InteractiveWorld = {}

		----------------[ chasingTrap ] ----------------
			_World.InteractiveWorld.chasingTrap = {}

			_World.InteractiveWorld.chasingTrap.ImagePath 	= "kalacool/sango/image/world/interactiveWorld/chasingTrap.png"	
			_World.InteractiveWorld.chasingTrap.Damage 	= "fatal"		--  "safe" = no damage, "fatal" = have damage			
			_World.InteractiveWorld.chasingTrap.Physic			= {}
				_World.InteractiveWorld.chasingTrap.Physic.Type	= "kinematic"
				_World.InteractiveWorld.chasingTrap.Physic.Option	= { density=1, friction=0.3, bounce=0}
			_World.InteractiveWorld.chasingTrap.Velocity = 230
		----
		----------------[ flappybird ] ----------------
			_World.InteractiveWorld.flappybird = {}

			_World.InteractiveWorld.flappybird.ImagePath 	= "kalacool/sango/image/world/interactiveWorld/flappybird.png"	
			_World.InteractiveWorld.flappybird.Damage 	= "fatal"		--  "safe" = no damage, "fatal" = have damage			
			_World.InteractiveWorld.flappybird.Physic			= {}
				_World.InteractiveWorld.flappybird.Physic.Type	= "kinematic"
				_World.InteractiveWorld.flappybird.Physic.Option	= { density=1, friction=0.3, bounce=0, shape = { 158,-324,299,-166,341,-6,390,48,389,102,347,206,298,260,65,312}}
			_World.InteractiveWorld.flappybird.Velocity = 230
		----
		----------------[ Drum ] ----------------
			_World.InteractiveWorld.Drum = {}

			_World.InteractiveWorld.Drum.ImagePath 	= "kalacool/sango/image/world/interactiveWorld/Drum.png"			
			_World.InteractiveWorld.Drum.Damage 		= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.InteractiveWorld.Drum.Physic			= {}
				_World.InteractiveWorld.Drum.Physic.Type		= "dynamic"
				_World.InteractiveWorld.Drum.Physic.Option	= { density = 5,friction=1, bounce=0, filter = { categoryBits = 4, maskBits = 241}}
		----
		----------------[ FireBall ] ----------------
			_World.InteractiveWorld.FireBall = {}

			_World.InteractiveWorld.FireBall.ImagePath 	= "kalacool/sango/image/world/interactiveWorld/fireBall.png"			
			_World.InteractiveWorld.FireBall.Damage 		= "fatal"		--  "safe" = no damage, "fatal" = have damage			
			_World.InteractiveWorld.FireBall.Physic			= {}
				_World.InteractiveWorld.FireBall.Physic.Type		= "kinematic"
				_World.InteractiveWorld.FireBall.Physic.Option	= { density=10, friction=99, bounce=0, shape={-35,-1,-13,-10,14,-2,25,26,6,54,-24,54,-43,42,-49,22}, filter={ categoryBits = 1, maskBits = 2 }}
			_World.InteractiveWorld.FireBall.Velocity		= {}
				_World.InteractiveWorld.FireBall.Velocity.Vx		= -250
				_World.InteractiveWorld.FireBall.Velocity.Vy		= 500
			_World.InteractiveWorld.FireBall.RespawnTimeBegin	= 2		--  the least sec that fireball respawn		
			_World.InteractiveWorld.FireBall.RespawnTimeEnd 		= 3		--  the most sec that fireball respawn
		----
		----------------[ FloatingFloor ] ----------------
			_World.InteractiveWorld.FloatingFloor = {}

			_World.InteractiveWorld.FloatingFloor.ImagePath = "kalacool/sango/image/world/interactiveWorld/floatingFloor.png"				
			_World.InteractiveWorld.FloatingFloor.Speed		= 200	
			_World.InteractiveWorld.FloatingFloor.Damage 	= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.InteractiveWorld.FloatingFloor.Physic			= {}
				_World.InteractiveWorld.FloatingFloor.Physic.Type	= "kinematic"
				_World.InteractiveWorld.FloatingFloor.Physic.Option	= { density=10, friction=99, bounce=0}
		----
		----------------[ SpinningTire ] ----------------
			_World.InteractiveWorld.SpinningTire = {}

			_World.InteractiveWorld.SpinningTire.ImagePath 	= "kalacool/sango/image/world/interactiveWorld/tire.png"	
			_World.InteractiveWorld.SpinningTire.Damage 		= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.InteractiveWorld.SpinningTire.Physic			= {}
				_World.InteractiveWorld.SpinningTire.Physic.Type		= "kinematic"
				_World.InteractiveWorld.SpinningTire.Physic.Option	= { density=0.1, friction=0.9, bounce=0}
			_World.InteractiveWorld.SpinningTire.AngularVelocity	= 200
		----
		----------------[ WoodenDoor ] ----------------
			_World.InteractiveWorld.WoodenDoor = {}

			_World.InteractiveWorld.WoodenDoor.ImagePath 	= "kalacool/sango/image/world/interactiveWorld/woodenDoor.png"	
			_World.InteractiveWorld.WoodenDoor.Damage 		= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.InteractiveWorld.WoodenDoor.Physic			= {}
				_World.InteractiveWorld.WoodenDoor.Physic.Type		= "kinematic"
				_World.InteractiveWorld.WoodenDoor.Physic.Option	= { density=1, friction=0.3, bounce=0}
		----
	---------------- Interactive World End ----------------

	---------------- Static _World Start ----------------
		_World.StaticWorld = {}

		----------------[ checkDoor ] ----------------
			_World.StaticWorld.checkDoor = {}

			_World.StaticWorld.checkDoor.ImagePath 	= "kalacool/sango/image/world/staticWorld/portal.png"	
			_World.StaticWorld.checkDoor.ImageSheet = { width=180, height=250, numFrames=4}	
			_World.StaticWorld.checkDoor.Damage 	= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.StaticWorld.checkDoor.Physic			= {}
				_World.StaticWorld.checkDoor.Physic.Type	= "static"
				_World.StaticWorld.checkDoor.Physic.Option	= nil 	--too complex QQ
		----
		----------------[ hor_floor ] ----------------
			_World.StaticWorld.hor_floor = {}

			_World.StaticWorld.hor_floor.ImagePath 	= "kalacool/sango/image/world/staticWorld/hor_floor.png"	
			_World.StaticWorld.hor_floor.Damage 	= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.StaticWorld.hor_floor.Physic			= {}
				_World.StaticWorld.hor_floor.Physic.Type	= "static"
				_World.StaticWorld.hor_floor.Physic.Option	= { density=1, friction=0.9, bounce=0 ,filter = { categoryBits = 128}}
		----
		----------------[ S_hor_floor ] ----------------
			_World.StaticWorld.S_hor_floor = {}

			_World.StaticWorld.S_hor_floor.ImagePath 	= "kalacool/sango/image/world/staticWorld/S_hor_floor.png"	
			_World.StaticWorld.S_hor_floor.Damage 	= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.StaticWorld.S_hor_floor.Physic			= {}
				_World.StaticWorld.S_hor_floor.Physic.Type	= "static"
				_World.StaticWorld.S_hor_floor.Physic.Option	= { density=1, friction=0.9, bounce=0}
		----
		----------------[ M_hor_floor ] ----------------
			_World.StaticWorld.M_hor_floor = {}

			_World.StaticWorld.M_hor_floor.ImagePath 	= "kalacool/sango/image/world/staticWorld/M_hor_floor.png"	
			_World.StaticWorld.M_hor_floor.Damage 	= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.StaticWorld.M_hor_floor.Physic			= {}
				_World.StaticWorld.M_hor_floor.Physic.Type	= "static"
				_World.StaticWorld.M_hor_floor.Physic.Option	= { density=1, friction=0.9, bounce=0}
		----
		----------------[ leftTop_floor ] ----------------
			_World.StaticWorld.leftTop_floor = {}

			_World.StaticWorld.leftTop_floor.ImagePath 	= "kalacool/sango/image/world/staticWorld/leftTop_floor.png"	
			_World.StaticWorld.leftTop_floor.Damage 	= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.StaticWorld.leftTop_floor.Physic			= {}
				_World.StaticWorld.leftTop_floor.Physic.Type	= "static"
				_World.StaticWorld.leftTop_floor.Physic.Option	= { density=1, friction=0, bounce=0, shape={ -250, -130, -240, -150, 260, 130, 250, 150 }}
		----
		----------------[ par_floor ] ----------------
			_World.StaticWorld.par_floor = {}

			_World.StaticWorld.par_floor.ImagePath 	= "kalacool/sango/image/world/staticWorld/par_floor.png"	
			_World.StaticWorld.par_floor.Damage 	= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.StaticWorld.par_floor.Physic			= {}
				_World.StaticWorld.par_floor.Physic.Type	= "static"
				_World.StaticWorld.par_floor.Physic.Option	= { density=1, friction=0.9, bounce=0}
		----
		----------------[ Thorn ] ----------------
			_World.StaticWorld.Thorn = {}

			_World.StaticWorld.Thorn.ImagePath 	= "kalacool/sango/image/world/staticWorld/thorn.png"	
			_World.StaticWorld.Thorn.Damage 	= "fatal"		--  "safe" = no damage, "fatal" = have damage			
			_World.StaticWorld.Thorn.Physic			= {}
				_World.StaticWorld.Thorn.Physic.Type	= "static"
				_World.StaticWorld.Thorn.Physic.Option	= { density=1, friction=0.3, bounce=0}
		----

		----------------[ pipeUp ] ----------------
			_World.StaticWorld.pipeUp = {}

			_World.StaticWorld.pipeUp.ImagePath 	= "kalacool/sango/image/world/staticWorld/pipeUp.png"	
			_World.StaticWorld.pipeUp.Damage 	= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.StaticWorld.pipeUp.Physic			= {}
				_World.StaticWorld.pipeUp.Physic.Type	= "static"
				_World.StaticWorld.pipeUp.Physic.Option	= { density=1, friction=0.3, bounce=0}
		----

		----------------[ pipeDown ] ----------------
			_World.StaticWorld.pipeDown = {}

			_World.StaticWorld.pipeDown.ImagePath 	= "kalacool/sango/image/world/staticWorld/pipeDown.png"	
			_World.StaticWorld.pipeDown.Damage 	= "safe"		--  "safe" = no damage, "fatal" = have damage			
			_World.StaticWorld.pipeDown.Physic			= {}
				_World.StaticWorld.pipeDown.Physic.Type	= "static"
				_World.StaticWorld.pipeDown.Physic.Option	= { density=1, friction=0.3, bounce=0}
		----

	---------------- Static World End ----------------


	

