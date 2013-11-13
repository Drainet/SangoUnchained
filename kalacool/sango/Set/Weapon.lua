Weapon={}


local magazineClass = require "kalacool.sango.item.magazine"
--local sheetmagazineClass = require "kalacool.sango.item.sheet_magazine"

function Weapon.newShotgun()

	local gun={}


	local gunsheet = graphics.newImageSheet( "kalacool/sango/image/character/dao12.png",{ width=300, height=141, numFrames=3 } )
	
	local gunsequenceData = {
 
		{ name="shoot", frames= {1,2,3,1}, time=300 ,loopCount = 1}

	}
	
    local sprite =  display.newSprite(gunsheet, gunsequenceData)
	
	gun.sprite = sprite
	gun.magazine=magazineClass.new(5,300,500,100,"kalacool/sango/image/UI/shell.png")
	gun.bullet=require "kalacool.sango.item.bullet"
	gun.recoil=550
	return gun
end


function Weapon.newNotegun()


	local gun={}
	
	gun.magazine=magazineClass.new(3,200,600,0,"kalacool/sango/image/UI/note_shell.png")
	gun.bullet= require "kalacool.sango.item.note_bullet"
	gun.recoil=600
	return gun
end

function Weapon.newRifle()


	local gun={}

	local gunsheet = graphics.newImageSheet( "kalacool/sango/image/character/kar98.png",{ width=600, height=141, numFrames=3 } )
	
	local gunsequenceData = {
 
		{ name="shoot", frames= {1,2,3,1}, time=300 ,loopCount = 1}

	}

	local sprite =  display.newSprite(gunsheet, gunsequenceData)
	
	gun.sprite = sprite
	gun.magazine=magazineClass.new(1,600,1000,0,"kalacool/sango/image/UI/rifleShell.png")
	gun.bullet= require "kalacool.sango.item.rifle_bullet"
	gun.recoil=2000
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

	if(name=="rifle")then
		gun=Weapon.newRifle()
	end
	

	return gun
end

return Weapon