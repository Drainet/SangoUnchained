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

	-- buff effect
	Item.newRate = 0.5
	Item.effectTime = 10
	function Item.image:collision(self, event)
		
		if (event.phase =="began") then
			Item.oldRate = event.other.Magazine.rate
			event.other.Magazine.rate = Item.newRate
			Item.effectTarget = event.other

			print("SpeedUP")
			timer.performWithDelay( 5000, Item.callBack)
		end	
	end	

	function Item:callbcak()
		print("SpeedDown")
		Item.effectTarget.Magazine.rate = Iten.oldRate
	end

	Item.image:addEventListener( "collision")

	return Item
end