--eventCentral.lua
module(..., package.seeall)
local scene = scene

function new()

    local eventCental = {}

    local function allEnterFrame()
        scene:dispatchEvent({name='floatingFloorMoving',target = Player} )
        scene:dispatchEvent({name='moveLayer'})
        scene:dispatchEvent({name='arrowControl'})
        scene:dispatchEvent({name='playerState'})
    end    

--------------------------------- EventCentral API ---------------------------------
    function eventCental.start()
        Runtime:addEventListener("enterFrame", allEnterFrame)
    end

    function eventCental.pause()
        scene:dispatchEvent({name='pauseAllEvent'})
    end

    function eventCental.resume()
        scene:dispatchEvent({name='resumeAllEvent'})
    end

    function eventCental.stop()
        Runtime:removeEventListener("enterFrame", allEnterFrame)
        scene:dispatchEvent({name='removeAllEvent'})
    end
--------------------------------- EventCentral API End ---------------------------------

--------------------------------- External EventCentral API Start ---------------------------------
    function eventCental:callCentralStart(event)
        eventCental.start()
    end

    function eventCental:callCentralPause(event)
        eventCental.pause()
    end

    function eventCental:callCentralStop(event)
        eventCental.stop()
    end

    scene:addEventListener( 'callCentralStart', eventCental )
    scene:addEventListener( 'callCentralPause', eventCental )
    scene:addEventListener( 'callCentralStop', eventCental )
--------------------------------- External EventCentral API End ---------------------------------

    return eventCental
end
