--eventCentral.lua

module(..., package.seeall)

local scene = scene

function new()

    local eventCental = {}

    local function allEnterFrame()
        scene:dispatchEvent({name='floatingFloorMoving',target = Player} )
        scene:dispatchEvent({name='moveLayer'})
        scene:dispatchEvent({name='arrowControl'})
    end    

--------------------------------- EventCentral API ---------------------------------
    function eventCental.start()
        Runtime:addEventListener("enterFrame", allEnterFrame)
    end

    function eventCental.pause()
        scene:dispatchEvent({name='pauseAllEvent'})
    end

    function eventCental.stop()
        Runtime:removeEventListener("enterFrame", allEnterFrame)
        scene:dispatchEvent({name='removeAllEvent'})
    end
--------------------------------- EventCentral API End ---------------------------------

    return eventCental
end
