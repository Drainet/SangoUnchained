Weapon={}


local magazineClass = require "kalacool.sango.item.magazine"
local sheetmagazineClass = require "kalacool.sango.item.sheet_magazine"

function Weapon.newShotgun(num,rate,reload)

	local gun={}
	
	gun.magazine=magazineClass.new(num,rate,reload)
	gun.bullet=require "kalacool.sango.item.bullet"

	return gun
end


function Weapon.newNotegun(num,rate,reload)


	local gun={}
	
	gun.magazine=sheetmagazineClass.new(num,rate,reload)
	gun.bullet= require "kalacool.sango.item.note_bullet"

	return gun
end

function Weapon.newgun(name,num,rate,reload)

	local gun={}
	if(name=="shotgun")then
		gun=Weapon.newShotgun(num,rate,reload)
	end
	
	if(name=="notegun")then
		gun=Weapon.newNotegun(num,rate,reload)
	end
	

	return gun
end

return Weapon