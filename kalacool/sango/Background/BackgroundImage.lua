module(...,package.seeall)

local secne = secne
function new(imagePath)
	local Background = display.newGroup()
	
	Background.image1 = display.newImage(imagePath, true)
	Background.image1.x = display.contentWidth/2
	Background.image1.y = display.contentHeight/2


	Background.image2 = display.newImage(imagePath, true)
	Background.image2.x = -display.contentWidth/2
	Background.image2.y = display.contentHeight/2 

	Background.image3 = display.newImage(imagePath, true)
	Background.image3.x = 3*display.contentWidth/2
	Background.image3.y = display.contentHeight/2 
	Background:insert(Background.image1)
	Background:insert(Background.image2)
	Background:insert(Background.image3)
	function Background:move(x,y)
		self.image1.x =  display.contentWidth/2  + (x%display.contentWidth)
		self.image1.y =  display.contentHeight/2 +  y 
		self.image2.x = -display.contentWidth/2  + (x%display.contentWidth)
		self.image2.y =  display.contentHeight/2 +  y 
		self.image3.x =3*display.contentWidth/2  + (x%display.contentWidth) 
		self.image3.y =  display.contentHeight/2 +  y 
	end

	return Background
end