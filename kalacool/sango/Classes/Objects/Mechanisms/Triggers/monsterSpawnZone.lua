--Classes/Objects/Mechanisms/monsterSpawnZones/monsterSpawnZone.lua

module(..., package.seeall)

local scene = scene
Mechanism =  require('kalacool.sango.Classes.Objects.Mechanisms.Mechanism')

function new(config)
	local monsterSpawnZone = Mechanism.new()
	local scene = scene

	-- Set monsterSpawnZone image
	monsterSpawnZone.image = display.newImage( "kalacool/sango/image/Mechanism/monsterSpawnZone.png" )
 
 	monsterSpawnZone.image.type = "monsterSpawnZone"
	monsterSpawnZone.image.x = config.x
	monsterSpawnZone.image.y = config.y
	monsterSpawnZone.currentWave = config.wave
	monsterSpawnZone.isActive = false

	physics.addBody(monsterSpawnZone.image , "static" , {Filter = monsterSpawnZone.Filter})
	monsterSpawnZone.image.isSensor = true

	function monsterSpawnZone.onCollsion(self , event)
		if(monsterSpawnZone.image.type=="monsterSpawnZone" and event.other.type == "player") then
			if(monsterSpawnZone.isActive == false) then
				monsterSpawnZone.isActive = true
            	scene:dispatchEvent({name='nextWave', nextWave = monsterSpawnZone.currentWave })
			end
		end	
	end

	monsterSpawnZone.collision = monsterSpawnZone.onCollsion
 	monsterSpawnZone.image:addEventListener( "collision" , monsterSpawnZone )

	return monsterSpawnZone
end