SOUNDS = {}
SOUNDS.PlayingLoopedSounds = {}

function SOUNDS.PlayLoopedSound(arg_1_0)
	SOUNDS.PlayingLoopedSounds[arg_1_0] = true
end

function SOUNDS.StopLoopedSound(arg_2_0)
	local var_2_0 = false
	local var_2_1 = 0

	if SOUNDS.PlayingLoopedSounds[arg_2_0] then
		SOUNDS.PlayingLoopedSounds[arg_2_0] = nil
		var_2_0 = true
	end

	return var_2_0
end

function SOUNDS.StopAllLoopedSounds()
	SOUNDS.PlayingLoopedSounds = {}
end

function SOUNDS.IsLoopedSoundPlaying(arg_4_0)
	return SOUNDS.PlayingLoopedSounds[arg_4_0] ~= nil
end

function SOUNDS.UpdateLoopingSounds()
	for iter_5_0, iter_5_1 in pairs(SOUNDS.PlayingLoopedSounds) do
		Engine.BJDBIAGIDA(iter_5_0)
	end
end
