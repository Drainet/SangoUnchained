module(..., package.seeall)

SupplementsObject =  require('kalacool.sango.Classes.Objects.Supplements.Supplement')
function new(config)
	local Item = SupplementsObject.new()
	local scene = scene

	-- set attribute of Item
	Item.body = display.newImage("kalacool/sango/image/Supplement/moreLife.png")
	Item.image:insert(Item.body)
	Item.body.x = Item.image.x
	Item.body.y = Item.image.y
	Item.image.x = config.x
	Item.image.y = config.y

	physics.addBody(Item.image,"static", {Filter = Item.Filter})

	-- buff effect  -> add one more life to player
	Item.addLifeNum = 1

	-- buff icon collision 
	function Item.image.preCollision(self, event)
		if(event.other.type == "player") then
		-- set icon not collision with Player
		event.contact.isEnabled = false

		-- set icon cooldown 
		timer.performWithDelay(0, Item.coolDown)

		event.other.heart.max = event.other.heart.max + Item.addLifeNum
		Item.addLifeNum = Item.addLifeNum - 1
		event.other.heart.full()
		timer.performWithDelay(20000, Item.renew)
		end
	end	

	Item.image:addEventListener( "preCollision")

	return Item
end