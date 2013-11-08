module(..., package.seeall)

local PlayerClass  = require "kalacool.sango.Classes.Objects.Character.Player"


function new(config)
	local Cat = PlayerClass.new(x,y)
	
	
	
	local hang =  display.newImage("kalacool/sango/image/character/cat_hand.png",0,0)
	Cat.hang = hang
	
	local body =  display.newImage("kalacool/sango/image/character/cat_body.png",0,0)
	Cat.body = body
	
	
	
	
	
	Cat.setgun("notegun",5,200,2500)
	--Cat.setgun("shotgun",5,500,1000)
	
	
	hang.xReference=20
    hang.yReference=-3
	
	hang.x=Cat.image.x+20
    hang.y=Cat.image.y-3
		
	
	body.x=Cat.x
    body.y=Cat.y
	
	Cat.image:insert(Cat.body)
	Cat.image:insert(Cat.hang)
	
	local Filter = { categoryBits = 2, maskBits = 1 }

	
    physics.addBody( Cat.image,{ density=40.0, friction=1, bounce=0,shape=Shape,filter=Filter} )
	
	Cat.image.x=config.x
	Cat.image.y=config.y
	
	
	
	
	
	
	
	
	
	

	
	return Cat
end