Weapon={}


local magazineClass = require "kalacool.sango.item.magazine"
--local sheetmagazineClass = require "kalacool.sango.item.sheet_magazine"

function Weapon.newShotgun()

	local gun={}
	
	gun.magazine=magazineClass.new(5,300,500,100,"kalacool/sango/image/UI/shell.png")
	gun.bullet=require "kalacool.sango.item.bullet"

	return gun
end


function Weapon.newNotegun()


	local gun={}
	
	gun.magazine=magazineClass.new(3,200,600,0,"kalacool/sango/image/UI/note_shell.png")
	gun.bullet= require "kalacool.sango.item.note_bullet"

	return gun
end

function Weapon.newgun(name)

	local gun={}

	if(name=="shotgun")then
		gun=Weapon.newShotgun()
	end
	
	if(name=="notegun")then
		gun=Weapon.newNotegun()
	end
	

	return gun
end

return Weapon