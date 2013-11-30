--Classes/Object.lua

module(..., package.seeall)

local scene = scene
	--inherits Base Class

--INSTANCE FUNCTIONS
function new()
    --creates our instance's display image
	local Object={}
	Object.listeners={}
	
	function Object.setImage(img)
		Object.image = display.newImage(img)
	end
	
	function Object.show(config)
		--show this object somewhere on-screen
		
		Object.image.x, Object.image.y = config.x, config.y
		Object.image.isVisible = true
	end

	function Object.hide()
		--hide this object
		Object.image.isVisible = false
	end
	
	function Object.dispose()
		--hide this object
		for i = 1,table.maxn( Object.listeners) do
			--print(Object.listeners[i].event)
			scene:removeEventListener( Object.listeners[i].event, Object.listeners[i].listener )
			Runtime:removeEventListener(Object.listeners[i].event, Object.listeners[i].listener)
		end
		display.remove( Object.image )
		Object.image = nil

	end
	
	

    
	return Object
end

