--Classes/Objects/World/StaticWorld/boundRec.lua

module(..., package.seeall)

--INSTANCE FUNCTIONS
function new(config)

    local boundRec = display.newRect( 0, config.y, 50000, 150)
    boundRec.anchorX = 0
	boundRec.anchorY = 0
    boundRec.damage = "safe"

    -- boundRec.show(config)
    physics.addBody( boundRec , "static", { density=1, friction=0.9, bounce=0 ,filter = { categoryBits = 128}} )
    


    return boundRec
end