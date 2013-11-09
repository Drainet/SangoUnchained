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
	

	physics.addBody(Item.image,"static", {Filter = Item.Filter})

	-- buff effect   -> attack speed up
	Item.newRate = 0.5
	Item.buffTime = 5000
	
	-- buff icon collision 
	function Item.image.preCollision(self, event)
		if(event.other.type == "player") then
		event.contact.isEnabled = false
		
		--set icon cooldown
		timer.performWithDelay(0, Item.coolDown)

		Item.oldRate = event.other.Magazine.rate
		event.other.Magazine.rate = Item.newRate
		Item.effectTarget = event.other

		timer.performWithDelay( Item.buffTime, Item.effectCallback)
		end
	end	

	-- buff effect turn down
	function Item.effectCallback()
		Item.effectTarget.Magazine.rate = Item.oldRate
		timer.performWithDelay(Item.buffTime , Item.renew)
	end


	Item.image:addEventListener( "preCollision")

	return Item
end