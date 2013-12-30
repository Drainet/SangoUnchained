--[[
---------------------------------------------------------------
	This is parameter about everything in Monster Object
---------------------------------------------------------------
--]]

	_Monster = {}

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
				_World.DynamicWorld.CompanionCube.Physic.Option	= { density=10, friction=0.7, bounce=0.5}
			_World.DynamicWorld.CompanionCube.isFixedRotation= true 
		----
	---------------- Dynamic World End ----------------




	

