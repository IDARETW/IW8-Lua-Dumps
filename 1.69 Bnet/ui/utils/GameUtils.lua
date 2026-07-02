GAME = GAME or {}

function GAME.PauseGame()
	PreGame.RemoveDuckAudioTemporarily()

	if Engine.IGAJBFHE() then
		Engine.BEHFHDEBDG()

		if not LUI.FlowManager.IsInStack("pre_game") then
			Engine.DGBECFGFCH(PauseReason.KEY_INPUT)
		end
	else
		Engine.DGBECFGFCH(PauseReason.KEY_INPUT)
	end
end

function GAME.PrintWeaponAttributes()
	local var_2_0 = {
		"",
		"all",
		"primaryCurrent",
		"primary",
		"offhand",
		"item",
		"altmode",
		"exclusive"
	}

	if Engine.BGAAHHAGAC() or Engine.BHICADFIHA() then
		local var_2_1 = Dvar.CFHDGABACF("MMTMMPTQKM")

		if var_2_1 then
			Dvar.BDEHAEGHAF("scr_list_inventory", var_2_0[var_2_1])
		end
	end
end
