module(..., package.seeall)
ObjectClass = require('kalacool.sango.Classes.Object')





function new(num,rate,reloadCool,reloadSpeed,image)
    
	local Magazine = ObjectClass.new()
	Magazine.image = display.newGroup( )
	Magazine.shellImage=image
	
	Magazine.shootable=true
	Magazine.reloadable=true
	--local magazine=display.newRect(28*num,45,50*num,90)
	--magazine.strokeWidth = 3
	--magazine:setFillColor(140, 140, 140)
	--magazine:setStrokeColor(180, 180, 180)
	--Magazine.image:insert(magazine)
	Magazine.ammo=0
	Magazine.ammoMax=num
	Magazine.rate=rate
	Magazine.reloadSpeed = reloadSpeed
	Magazine.reloadCool = reloadCool
	Magazine.isonAir=true
	
	
-------補子彈 補完cancel start---
	function Magazine.reload( )
		
		if(Magazine.ammo<Magazine.ammoMax) then
			
			-- and Magazine.reloadable == true
			Magazine.ammo=Magazine.ammo+1
			--Magazine[Magazine.ammo]=display.newImage(Magazine.shellImage,40*Magazine.ammo ,45)
			--Magazine.image:insert(Magazine[Magazine.ammo])
		end

		if(Magazine.ammo>=Magazine.ammoMax ) then
			--or Magazine.reloadable == false
			Magazine:cancelReload()
			
		end	

	
	end
-------補子彈 補完cancel end---
	
-------開始補子彈前判斷 (等待或補子彈) start---
	function Magazine.startReload( )

		Magazine.reloadTimer=timer.performWithDelay( Magazine.reloadSpeed, Magazine.reload, Magazine.ammoMax - Magazine.ammo)
		Magazine.timers[3] = Magazine.reloadTimer
		if(Magazine.isonAir==true)then
			
			timer.pause( Magazine.reloadTimer )
		end
	end
-------開始補子彈前判斷 (等待或補子彈) end---

--------冷卻後觸發事件->射擊冷卻 補子彈冷卻 start----
	function Magazine:coolDown()
		Magazine.shootable=true
	end

	function Magazine.reloadCoolDown()
		Magazine.startReload( )

	end
--------冷卻後觸發事件->射擊冷卻 補子彈冷卻 end----
	

	function Magazine:cancelReload()
		
		if(Magazine.reloadCoolTimer~=nil)then
			timer.cancel( Magazine.reloadCoolTimer )
		end
		if(Magazine.reloadTimer~=nil)then
			timer.cancel( Magazine.reloadTimer )
		end

	end

	function Magazine:pop()
		
		if(Magazine.ammo>0)then
			
			display.remove(Magazine[Magazine.ammo])
			Magazine.ammo=Magazine.ammo-1
			
			Magazine.shootable=false
			Magazine.timers[1] = timer.performWithDelay( Magazine.rate *dog.image.magazineRate, Magazine.coolDown,1 )
			
			Magazine:cancelReload()
			Magazine.reloadCoolTimer=timer.performWithDelay( Magazine.reloadCool, Magazine.reloadCoolDown,1 )
			Magazine.timers[2] = Magazine.reloadCoolTimer

		end
		
		
	end

------- 空中和地面觸發事件 Start --
	function Magazine.onAir()
		
		Magazine.isonAir=true
		if(Magazine.reloadTimer~=nil)then
			
			timer.pause( Magazine.reloadTimer )
		end

	end
	function Magazine.onGround()
		
		Magazine.isonAir=false
		if(Magazine.reloadTimer~=nil)then
			
			timer.resume( Magazine.reloadTimer )
		end
	end
-------空中和地面觸發事件 End--

	
	function Magazine.start()
		
		for i = 1,Magazine.ammoMax do
			Magazine.reload( )
		end
		
		Magazine.reloadCoolTimer=timer.performWithDelay( Magazine.reloadCool, Magazine.reloadCoolDown,1 )
	end
		
	return Magazine

end








