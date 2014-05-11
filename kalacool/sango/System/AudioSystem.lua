module(..., package.seeall)
local storyboard = require( "storyboard" )
local scene = scene

function new(config)
	AUDIO = {}

	function AUDIO.Load_level()
		shotgun_fire = audio.loadSound( "kalacool/sango/audio/shotgun_fire.mp3" )
		mp5_fire = audio.loadSound( "kalacool/sango/audio/mp5_fire.mp3" )
		door_close = audio.loadSound( "kalacool/sango/audio/door_close.mp3" )
		Win_TaDa = audio.loadSound( "kalacool/sango/audio/Win_TaDa.mp3" )
		jetpack_active = audio.loadSound( "kalacool/sango/audio/jetpack_active.mp3" )
		exploding = audio.loadSound( "kalacool/sango/audio/exploding.mp3" )
		monster_laser = audio.loadSound( "kalacool/sango/audio/monster_laser.mp3" )
	end

	------------------ level audio -----------------------

	-- AS.Play_shotgun_fire()
	function AUDIO.Play_shotgun_fire()
		local WepaonChannel = audio.play( shotgun_fire )
	end

	-- AS.Play_mp5_fire()
	function AUDIO.Play_mp5_fire()
		local WepaonChannel = audio.play( mp5_fire )
	end

	-- AS.door_close()
	function AUDIO.Play_door_close()
		local WorldChannel = audio.play( door_close )
	end

	-- AS.Play_Win_TaDa()
	function AUDIO.Play_Win_TaDa()
		local UIChannel = audio.play( Win_TaDa )
	end

	-- AS.Play_jetpack_active()
	function AUDIO.Play_jetpack_active()
		local PlayerChannel = audio.play( jetpack_active )
	end

	-- AS.Play_exploding()
	function AUDIO.Play_exploding()
		local PlayerChannel = audio.play( exploding )
	end

	-- AS.Play_monster_laser()
	function AUDIO.Play_monster_laser()
		local PlayerChannel = audio.play( monster_laser )
	end

	------------------ Music -----------------------

	-- AS.Play_TheComplex()
	function AUDIO.Play_TheComplex()
		if MusicChannel == nil then
			backgroundMusic = audio.loadStream( "kalacool/sango/audio/music/TheComplex.mp3" )
			MusicChannel = audio.play( backgroundMusic , { channel=1, loops=-1 } )
		-- elseif audio.isChannelPlaying( MusicChannel ) == false then
		-- 	MusicChannel = audio.play( backgroundMusic , { channel=1, loops=-1, fadein=5000 } )
		end
	end

	-- AS.Play_FullOn()
	function AUDIO.Play_FullOn()
		if MusicChannel == nil then
			backgroundMusic = audio.loadStream( "kalacool/sango/audio/music/FullOn.mp3" )
			MusicChannel = audio.play( backgroundMusic , { channel=1, loops=-1 } )
		-- elseif audio.isChannelPlaying( MusicChannel ) == false then
		-- 	backgroundMusic = audio.loadStream( "kalacool/sango/audio/music/FullOn.mp3" )
		-- 	MusicChannel = audio.play( backgroundMusic , { channel=1, loops=-1, fadein=5000 } )
		end
	end

	-- AS.Stop_Music()
	function AUDIO.Stop_Music()
		audio.stop( MusicChannel )
		MusicChannel = nil
		audio.dispose( backgroundMusic )
		backgroundMusic = nil
	end

	-- AS.Dispose_level()
	function AUDIO.Dispose_level()
		audio.dispose( shotgun_fire )
		audio.dispose( mp5_fire )
		audio.dispose( door_close )
		audio.dispose( Win_TaDa )
		audio.dispose( jetpack_active )
		audio.dispose( exploding )
		audio.dispose( monster_laser )
		shotgun_fire = nil
		mp5_fire = nil
		door_close = nil
		Win_TaDa = nil
		jetpack_active = nil
		exploding = nil
		monster_laser = nil
	end


	return AUDIO
end



