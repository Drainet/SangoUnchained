module(..., package.seeall)






function new(num,rate,reload)
    
	local Magazine = {}
	Magazine.shellImage="kalacool/sango/image/UI/shell.png"
	Magazine.shootable=true
	Magazine.reloadable=true
	magazine=display.newRect(10,10,50*num,90)
	magazine.strokeWidth = 3
	magazine:setFillColor(140, 140, 140)
	magazine:setStrokeColor(180, 180, 180)
	Magazine.ammo=0
	Magazine.ammoMax=num
	Magazine.rate=rate
	Magazine.reloadSpeed=reload
	
	
	
    
	
	function Magazine.reload( )
		
		if(Magazine.ammo<Magazine.ammoMax and Magazine.reloadable == true) then
			
			Magazine.ammo=Magazine.ammo+1
			Magazine[Magazine.ammo]=display.newImage(Magazine.shellImage,40*Magazine.ammo-15,20)
			--Magazine[Magazine.ammo].height=75
			--Magazine[Magazine.ammo].width =25
			
		end	
	
	end
	
	

	function Magazine:coolDown()
		Magazine.shootable=true
	end

	function Magazine.startReload()
		
		if(Magazine.reloadTimer~=nil)then
			
			timer.cancel(Magazine.reloadTimer)
		end

		if( Magazine.reloadable == true)then
			
			Magazine.reloadTimer=timer.performWithDelay( Magazine.reloadSpeed, Magazine.reload, Magazine.ammoMax )
		end
	end

	function Magazine:pop()
		
		if(Magazine.ammo>0)then
			display.remove(Magazine[Magazine.ammo])
			Magazine.ammo=Magazine.ammo-1
			
			Magazine.startReload()
			Magazine.shootable=false
			timer.performWithDelay( Magazine.rate, Magazine.coolDown,1 )
		end
		
		
	end

	
	
	function Magazine.start()
		
		for i = 1,num do
			Magazine.reload( )
		end
		Magazine.reloadable=false

	end
		
	return Magazine

end








