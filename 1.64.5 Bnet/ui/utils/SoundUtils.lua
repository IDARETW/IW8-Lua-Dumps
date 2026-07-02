SOUNDS = {}
SOUNDS.PlayingLoopedSounds = {}

function SOUNDS.PlayLoopedSound(arg_1_0, arg_1_1)
	if not SOUNDS.IsLoopedSoundPlaying(arg_1_0) then
		SOUNDS.PlayingLoopedSounds[arg_1_0] = {
			hasStartedPlayback = false,
			fadeTimeMs = arg_1_1 and arg_1_1.fadeTimeMs and arg_1_1.fadeTimeMs or nil
		}
	end
end

function SOUNDS.StopLoopedSound(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1 and arg_2_1.immediate
	local var_2_1 = SOUNDS.PlayingLoopedSounds[arg_2_0]

	if var_2_1 then
		if var_2_1.id and Engine.CHFEJIG(var_2_1.id) then
			if var_2_0 then
				Engine.EAGBECEBGA(var_2_1.id)
			end

			SOUNDS.PlayingLoopedSounds[arg_2_0] = nil

			return true
		else
			return false
		end
	else
		return false
	end
end

function SOUNDS.StopAllLoopedSounds(arg_3_0)
	for iter_3_0, iter_3_1 in pairs(SOUNDS.PlayingLoopedSounds) do
		SOUNDS.StopLoopedSound(iter_3_0, arg_3_0)
	end
end

function SOUNDS.IsLoopedSoundPlaying(arg_4_0)
	local var_4_0 = SOUNDS.PlayingLoopedSounds[arg_4_0]

	return var_4_0 and var_4_0.id and Engine.CHFEJIG(var_4_0.id)
end

function SOUNDS.UpdateLoopingSounds()
	for iter_5_0, iter_5_1 in pairs(SOUNDS.PlayingLoopedSounds) do
		local var_5_0 = iter_5_1.id

		if not var_5_0 or not Engine.CHFEJIG(var_5_0) then
			local var_5_1 = Engine.BJDBIAGIDA(iter_5_0)

			iter_5_1.id = var_5_1

			if iter_5_1.fadeTimeMs ~= nil and not iter_5_1.hasStartedPlayback then
				Engine.CDFIDGJGHE(var_5_1, 0, tonumber(iter_5_1.fadeTimeMs))
			end

			iter_5_1.hasStartedPlayback = true
		end
	end
end
