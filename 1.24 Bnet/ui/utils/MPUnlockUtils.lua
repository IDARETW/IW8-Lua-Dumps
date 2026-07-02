UNLOCK = UNLOCK or {}

function UNLOCK.SplitCompoundUnlockRef(arg_1_0)
	local var_1_0 = LUI.Split(arg_1_0, "+")

	assert(#var_1_0 >= 2)

	local var_1_1 = var_1_0[1]
	local var_1_2 = var_1_0[2]

	return var_1_1, var_1_2
end

function UNLOCK.DebugGetRecentUnlocksData(arg_2_0)
	return {
		{
			name = "AK-47",
			type = "Weapon",
			icon = RegisterMaterial("icon_weapon_ar_akilo47")
		},
		{
			name = "M1911",
			type = "Handgun",
			icon = RegisterMaterial("icon_weapon_pi_mike_1911")
		}
	}
end

function UNLOCK.DebugGetNextUnlocksData(arg_3_0)
	return {
		{
			name = "Javelin",
			type = "Launcher",
			icon = RegisterMaterial("icon_weapon_la_juliet")
		}
	}
end

function UNLOCK.DebugGetNextUnlockRank(arg_4_0)
	return PROGRESSION.GetPlayerRank(arg_4_0) + 2
end
