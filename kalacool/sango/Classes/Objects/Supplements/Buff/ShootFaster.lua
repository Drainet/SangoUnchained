module(..., package.seeall)

SupplementsObject =  require('kalacool.sango.Classes.Objects.Supplements.Supplement')
function new(config)
	local Item = SupplementsObject.new()
	local scene = scene

	-- set attribute of Item
	Item.body = display.newImage("kalacool/sango/image/Supplement/shootFaster.jpg")
	Item.image:insert(Item.body)
	Item.body.x = Item.image.x
	Item.body.y = Item.image.y
	Item.image.x = config.x
	Item.image.y = config.y
	Item.shootFaster = false

	physics.addBody(Item.image,"static", {filter = Item.Filter})
	Item.image.isSensor = true
	-- buff effect   -> attack speed up
	Item.newRate = 0.5
	Item.buffTime = 5000

	-- buff icon collision 
	function Item.image.collision(self, event)
		if(event.other.type == "player" and Item.shootFaster == false) then
		Item.shootFaster = true
		--set icon cooldown
		Item.timerCoolDown = timer.performWithDelay(0, Item.coolDown)
		Item.timerRenew = timer.performWithDelay( Item.buffTime, Item.effectCallback ,1)
		if(event.phase == "began")then
			local buffHUD = require "kalacool.sango.HUD.buffHUD"
    		buffHUD.new(math.ceil(Item.buffTime/1000) , "kalacool/sango/image/Supplement/shootFaster.jpg")
		end
		Item.oldRate = event.other.Magazine.rate
		event.other.Magazine.rate = Item.newRate
		Item.effectTarget = event.other

		end
	end	

	-- buff effect turn down
	function Item.effectCallback()
		Item.shootFaster = false
		Item.effectTarget.Magazine.rate = Item.oldRate
		Item.timerRenew = timer.performWithDelay(Item.buffTime , Item.renew)
	end


	Item.image:addEventListener( "collision")
	Item.listeners[table.maxn(Item.listeners)+1] = {event="collision", listener = Item}
	return Item
end