module(..., package.seeall)

SupplementsObject =  require('kalacool.sango.Classes.Objects.Supplements.Supplement')
function new(config)
	local Item = SupplementsObject.new()
	local scene = scene

	-- set attribute of Item
	Item.body = display.newImage("kalacool/sango/image/Supplement/collectable/dogFood.png")
	Item.image:insert(Item.body)
	Item.body.x = Item.image.x
	Item.body.y = Item.image.y
	Item.image.x = config.x
	Item.image.y = config.y
	Item.starIndex = config.starIndex

	physics.addBody(Item.image,"static", {Filter = Item.Filter})
	Item.image.isSensor = true


	-- collectable icon collision 
	function Item.image.collision(self, event)
		if(event.other.type == "player") then

			Item.image:removeSelf( )
			Item.image = nil
			if Item.starIndex == 1 then
				scene:dispatchEvent({name = 'GotCollectableItemOne'})
			elseif Item.starIndex == 2 then
				scene:dispatchEvent({name = 'GotCollectableItemTwo'})
			elseif Item.starIndex == 3 then
				scene:dispatchEvent({name = 'GotCollectableItemThr'})
			end
		end
	end	



	Item.image:addEventListener( "collision")
	Item.listeners[table.maxn(Item.listeners)+1] = {event="collision", listener = Item}
	return Item
end