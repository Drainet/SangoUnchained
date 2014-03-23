Weapon={}


local magazineClass = require "kalacool.sango.item.magazine"
--local sheetmagazineClass = require "kalacool.sango.item.sheet_magazine"

function Weapon.newShotgun()

	local gun={}


	local gunsheet = graphics.newImageSheet( "kalacool/sango/image/character/dao12.png",{ width=374, height=88, numFrames=3 } )
	
	local gunsequenceData = {
 
		{ name="shoot", frames= {1,2,3,1}, time=300 ,loopCount = 1}

	}
	
    local sprite =  display.newSprite(gunsheet, gunsequenceData)
	
	gun.sprite = sprite
	gun.para = {cost = 1 , rate = 250}
	gun.magazine=magazineClass.new(7,300,500,100,"kalacool/sango/image/UI/shell.png")
	gun.bullet=require "kalacool.sango.item.bullet"
	gun.recoil=400
	return gun
end

function Weapon.newMP7()

	local gun={}


	local gunsheet = graphics.newImageSheet( "kalacool/sango/image/character/mp7.png",{ width=374, height=88, numFrames=3 } )
	
	local gunsequenceData = {
 
		{ name="shoot", frames= {1,2,3,1}, time=100 ,loopCount = 1}

	}
	
    local sprite =  display.newSprite(gunsheet, gunsequenceData)
	
	gun.sprite = sprite
	gun.para = {cost = 1 , rate = 70}
	gun.magazine=magazineClass.new(7,300,500,100,"kalacool/sango/image/UI/shell.png")
	gun.bullet=require "kalacool.sango.item.normal_bullet"
	-- gun.recoil=300
	gun.recoil=400	
	return gun
end


function Weapon.newNotegun()


	local gun={}
	
	gun.magazine=magazineClass.new(3,200,600,0,"kalacool/sango/image/UI/note_shell.png")
	gun.bullet= require "kalacool.sango.item.note_bullet"
	gun.recoil=500
	return gun
end

function Weapon.newRifle()


	local gun={}

	local gunsheet = graphics.newImageSheet( "kalacool/sango/image/character/kar98.png",{ width=374, height=88, numFrames=3 } )
	
	local gunsequenceData = {
 
		{ name="shoot", frames= {1,2,3,1}, time=100 ,loopCount = 1}

	}

	local sprite =  display.newSprite(gunsheet, gunsequenceData)
	gun.para = {cost = 5 , rate = 150}
	gun.sprite = sprite
	gun.magazine=magazineClass.new(1,600,1000,0,"kalacool/sango/image/UI/rifleShell.png")
	gun.bullet= require "kalacool.sango.item.rifle_bullet"
	gun.recoil=800
	return gun
end

function Weapon.newXbow()


	local gun={}

	local gunsheet = graphics.newImageSheet( "kalacool/sango/image/character/xbow.png",{ width=374, height=88, numFrames=3 } )
	
	local gunsequenceData = {
 
		{ name="shoot", frames= {1,2,3,1}, time=100 ,loopCount = 1}

	}

	local sprite =  display.newSprite(gunsheet, gunsequenceData)
	gun.para = {cost = 1 , rate = 150}
	gun.sprite = sprite
	gun.magazine=magazineClass.new(4,500,1000,0,"kalacool/sango/image/UI/arrow.png")
	gun.bullet= require "kalacool.sango.item.arrow"
	gun.recoil=400
	return gun
end

function Weapon.newgun(name)

	local gun={}

	if(name=="DAO-12")then
		gun=Weapon.newShotgun()
	end
	
	if(name=="notegun")then
		gun=Weapon.newNotegun()
	end

	if(name=="Kar-98")then
		gun=Weapon.newRifle()
	end

	if(name=="XBOW")then
		gun=Weapon.newXbow()
	end

	if(name=="MP7")then
		gun=Weapon.newMP7()
	end
	

	return gun
end

return Weapon