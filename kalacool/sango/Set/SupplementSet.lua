SupplementSet = {}


local shootFaster = require('kalacool.sango.Classes.Objects.Supplements.Buff.ShootFaster')
local moreLife = require('kalacool.sango.Classes.Objects.Supplements.Buff.MoreLife')
local reloadBullet = require('kalacool.sango.Classes.Objects.Supplements.Buff.ReloadBullet')
--------------------------------------------------------------------------------------------------------
local dogFood = require('kalacool.sango.Classes.Objects.Supplements.Collectable.DogFood')

function SupplementSet.newSupShootFaster(config)
	local buffItem = shootFaster.new(config)
	return buffItem
end

function SupplementSet.newSupMoreLife(config)
	local buffItem = moreLife.new(config)
	return buffItem
end
function SupplementSet.newSupReloadBullet(config)
	local buffItem = reloadBullet.new(config)
	return buffItem
end
--------------------------------------------------------------------------------------------------------
function SupplementSet.newDogFood(config)
	local collectableItem = dogFood.new(config)
	return collectableItem
end
