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
	Item.isUsed = false

	physics.addBody(Item.image,"static", {filter = Item.Filter})
	Item.image.isSensor = true
	-- buff effect   -> attack speed up
	Item.newRate = 0.3
	Item.buffTime = 5000

	-- buff icon collision 
	function Item.image.collision(self, event)
		if(event.other.type == "player" and Item.isUsed == false and event.phase == "began") then
			Item.shootFaster = true
			Item.isUsed = true
			--set icon cooldown
			Item.timerCoolDown = timer.performWithDelay(0, Item.coolDown)
			Item.timerRenew = timer.performWithDelay( Item.buffTime + event.other.shootFasterBuffTime*1000, Item.effectCallback ,1)
			Item.effectTarget = event.other
			print( "alpha = "..Item.image.alpha )
			if (event.other.shootFaster == false) then
				-- set HUD
				local buffHUD = require "kalacool.sango.HUD.buffHUD"
	    		event.other.shooterFasterHUD = buffHUD.new(math.ceil(Item.buffTime/1000) , "kalacool/sango/image/Supplement/shootFaster.jpg")
				event.other.magazineRate = Item.newRate
				event.other.shootFaster = true
				event.other.shootFasterBuffTime = Item.buffTime/1000
			-- active same Buff if Buff time not over
			elseif (event.other.shootFaster == true) then
				local buffHUD = require "kalacool.sango.HUD.buffHUD"
				-- delete old shootFaster HUD
				event.other.shooterFasterHUD.dispose()
				-- add new shootFaster HUD
				event.other.shootFasterBuffTime = event.other.shootFasterBuffTime + Item.buffTime/1000
		    	event.other.shooterFasterHUD = buffHUD.new(math.ceil(event.other.shootFasterBuffTime) , "kalacool/sango/image/Supplement/shootFaster.jpg")

			end
		end

	end	

	-- buff effect turn down
	function Item.effectCallback()
		if(Item.effectTarget.shootFasterBuffTime == 1)then
			Item.effectTarget.shootFaster = false
			Item.effectTarget.magazineRate = 1
		end
		print( Item.effectTarget.shootFasterBuffTime.. " AA" )
		Item.isUsed = false
		Item.timerRenew = timer.performWithDelay(Item.buffTime , Item.renew)
	end

	
	Item.image:addEventListener( "collision")
	Item.listeners[table.maxn(Item.listeners)+1] = {event="collision", listener = Item}
	Item.timers[1] = Item.timerCoolDown
	Item.timers[2] = Item.timerRenew
	return Item
end