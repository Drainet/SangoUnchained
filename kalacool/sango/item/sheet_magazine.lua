module(..., package.seeall)


local magazineClass = require "kalacool.sango.item.magazine"



function new(num,rate,reloadCool,reloadSpeed)
    
	local Magazine = magazineClass.new(num,rate,reloadCool,reloadSpeed)
	Magazine.shellImage="kalacool/sango/image/UI/note_shell.png"
	
	
	--[[function Magazine.startReload( )
		
		for i = Magazine.ammo+1,Magazine.ammoMax do
			Magazine.reload( )
		end
	
	end]]
	
	


	--[[function Magazine:pop()
		Magazine.reloadable=true
		if(Magazine.ammo>0)then
			display.remove(Magazine[Magazine.ammo])
			Magazine.ammo=Magazine.ammo-1
			
			Magazine.shootable=false
			timer.performWithDelay( Magazine.rate, Magazine.coolDown,1 )
		end
		if(Magazine.ammo==0)then
		
			timer.performWithDelay( Magazine.reloadSpeed, Magazine.start,1 )
			
		end
		
		
	end]]
	
	return Magazine

end








