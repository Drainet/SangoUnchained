module(..., package.seeall)
require("kalacool.sango.Set.EnemySet")
local scene = scene
local Monster = {}
local Wave    = {}

function NextWaveHandler(ImageGroup)
    local imageGroup = ImageGroup

    local Content = display.newGroup()
    
    scene:addEventListener( "monsterDeadInWave", Content )
    function Content:monsterDeadInWave(event)
        print(event.wave)
        Wave[tonumber(event.wave)] = Wave[tonumber(event.wave)] - 1
        if (Wave[tonumber(event.wave)] == 0) and Wave[tonumber(event.wave)+1] ~= nil then
            print("gogo")
            scene:dispatchEvent({name='nextWave',nextWave = tonumber(event.wave) + 1})
        end     
    end

    scene:addEventListener( "nextWave", Content )
    function Content:nextWave(event)
        if event.nextWave == 1 then
            for i = 1, Wave[event.nextWave] do
                imageGroup:insert(EnemySet.newMonster(Monster[1]).image)
                table.remove(Monster,1)
            end
        else
            for i = 1, Wave[event.nextWave] do
                imageGroup:insert(EnemySet.newMonster(Monster[1]).image)
                table.remove(Monster,1)
            end
            scene:dispatchEvent( {name='onPlayerShow',target = dog} )
        end
    end

	return Content

end

function addMonster(config)
    table.insert(Monster, table.maxn(Monster)+1, config )  
    if Wave[config.wave] == nil then
        Wave[config.wave] = 1
    else 
        Wave[config.wave] = Wave[config.wave] + 1
    end
end

