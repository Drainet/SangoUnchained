--Classes/Objects/DataCollect


module(..., package.seeall)



--INSTANCE FUNCTIONS
function new()
	Collect = {}
	Collect.sceneData = {}
	Collect.deviceID = system.getInfo("deviceID")
	Collect.sceneNum = 0
	Collect.sampleingRate =1000    --- Get max memory sampling rate
	local scene = scene
	---- get User total use time ----
	function Collect:getUseTime()  
		Collect.totalUseTime = system.getTimer()
	end
	----  add a collectot in scene ----
	function Collect:addSceneCollect(config)
		------  Data Format ------
		-- 
		-- 		===  config  ===
		-- 		ex: scene 1-3
		-- 		config.senario = 1  ,  config.level = 3
		-- 
		-- 		===  sceneData format  ===
		-- 		SceneData[1] = config.senario
		--		SceneData[2] = config.level
		-- 		SceneData[3] = total level use time
		-- 		SceneData[4] = dead times
		-- 		SceneData[5] = first weapon
		-- 		SceneData[6] = second weapon
		-- 		SceneData[7] = Max memory use
		-- 
		------  Data Format END ------

		Collect.sceneNum = Collect.sceneNum +1
		local SceneData = {}
		SceneData[1] = config.senario
		SceneData[2] = config.level
		SceneData[3] = system.getTimer()
		SceneData[4] = 0
		SceneData[5] = dog.Weapon.name
		SceneData[6] = dog.pack[2].name
		SceneData[7] = 0
		Collect.sceneData[Collect.sceneNum] = SceneData
		Collect.memory_timer = timer.performWithDelay(Collect.sampleingRate, Collect.maxMemoryGet)
		
		if(Collect.sceneNum~= 1)then
			scene:addEventListener( 'HealthFail', Collect )
			scene:addEventListener( 'removeAllEvent', Collect )
		end

		
		print(Collect.sceneNum)
		print("Weapon1 = "..Collect.sceneData[Collect.sceneNum][5])
		print("Weapon2 = "..Collect.sceneData[Collect.sceneNum][6])
		print("Level "..Collect.sceneData[Collect.sceneNum][1].."-"..Collect.sceneData[Collect.sceneNum][2])
	end
	---- Get Player Dead event ----
	function Collect:HealthFail(event)
		Collect.sceneData[Collect.sceneNum][4] = Collect.sceneData[Collect.sceneNum][4] +1
		print(Collect.sceneData[Collect.sceneNum][4])
	end
	---- Get Leave level message ----
	function Collect:removeAllEvent(event)
		
		--- play time ---
		Collect.sceneData[Collect.sceneNum][3] = system.getTimer() - Collect.sceneData[Collect.sceneNum][3]
		print("playtime= "..Collect.sceneData[Collect.sceneNum][3])
		scene:removeEventListener( 'removeAllEvent', Collect )
    	scene:removeEventListener( 'HealthFail', Collect )
    	timer.cancel( Collect.memory_timer )

	end
	---- Get Max Memory use ----
	function Collect.maxMemoryGet()
		if(Collect.sceneData[Collect.sceneNum][7] < collectgarbage("count")) then 
			Collect.sceneData[Collect.sceneNum][7] = collectgarbage("count")
		end
		Collect.memory_timer = timer.performWithDelay(Collect.sampleingRate, Collect.maxMemoryGet)
		print("memory = "..Collect.sceneData[Collect.sceneNum][7])
	end

	print("DEVIDE = "..Collect.deviceID )
	

	scene:addEventListener( 'HealthFail', Collect )
	scene:addEventListener( 'removeAllEvent', Collect )
	return Collect
end


