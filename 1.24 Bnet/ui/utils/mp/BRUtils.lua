BR = BR or {}
BR.END_GAME_TIMER_LENGTH = 22000
BR.END_GAME_TIMER_LENGTH_SECONDS = BR.END_GAME_TIMER_LENGTH / 1000
BR.ARMOR_EMPTY_HINT_MAX_ANIM_LENGTH = 10000
BR.INVALID_CLIENT_NUM = -1
BR.DEFAULT_MAP = "mp_don3"
BR.GameEndState = {
	BM_DEFEAT = 4,
	BR_DEFEAT = 2,
	BR_VICTORY = 1,
	BM_VICTORY = 3
}
BR.CUSTOM_SWATCH_ANIM_APPEND_STR = "CustomSwatch"
BR.ExitGameCommandType = {
	MAP_RESTART = 2,
	LEAVE_TUTORIAL = 1
}
BR.OVERLAY_STATE = {
	FADE_IN_BLACK = 7,
	FADE_OUT_BLACK = 6,
	KILL_BINK_SHOW_BLACK = 5,
	GULAG_NO_SKIP_PROMPT = 1,
	ONBOARDING = 4,
	OFF = 0,
	GULAG_SHOW_SKIP_PROMPT = 2,
	INFIL_NO_SKIP_PROMPT = 3
}
BR.SPLASH_TYPES = {
	VENDOR_CLOSED = 9,
	SQUAD_BUYBACK = 10,
	DMZ_PLUNDER_WIN = 11,
	RESPAWN_USED = 4,
	CHOPPEREXFIL_NAME2 = 15,
	SQUAD_RESPAWN = 6,
	GULAG_REDEPLOYMENT = 7,
	ELIMINATED = 5,
	BRCREDITS = 17,
	CHOPPEREXFIL_NAME3 = 16,
	CAPTURED = 2,
	FINISH_THEM = 19,
	OFF = 0,
	VICTORY = 1,
	GULAG_VICTORY = 3,
	CHOPPEREXFIL_NAME1 = 14,
	CHOPPEREXFIL_NAME0 = 13,
	TRANSIENTFADEOUT = 18,
	DMZ_PLUNDER_LOSS = 12
}
BR.PlayAgainChoice = {
	WITHOUT_PARTY = 1,
	WITH_PARTY = 2,
	NONE = 0
}
BR.LoadoutNotifyStates = {
	DEFAULT = 0,
	SHOW = 1
}
BR.TransitionType = {
	TRANSITION_RETURNING_TO_COMBAT = 2,
	TRANSITION_INSTANT_HIDE = 5,
	TRANSITION_SQUAD_WIPED = 6,
	TRANSITION_FADE_TO_BLACK = 1,
	TRANSITION_INITIAL_SPAWN = 4,
	TRANSITION_EXITING_GULAG = 3,
	TRANSITION_FADE_IN_FROM_BLACK = 0
}
BR.EventTypes = {
	FIRESALE = 1,
	JAILBREAK = 2
}
BR.CIRCLE_STATES = {
	BLOOD_MONEY_TIMER = 5,
	CIRCLE_IS_READY = 0,
	INVALID = -1,
	FINAL_CIRCLE = 3,
	BLOOD_MONEY_TIMER_OT = 7,
	BLOOD_MONEY_TIMER_RED_OT = 8,
	CIRCLE_MOVING = 1,
	BLOOD_MONEY_TIMER_RED = 6,
	HIDE = 4,
	CIRCLE_MOVING_WARNING = 2
}
BR.CIRCLE_STATE_DATA = {
	[BR.CIRCLE_STATES.INVALID] = {
		anim = "Hide"
	},
	[BR.CIRCLE_STATES.CIRCLE_IS_READY] = {
		anim = "CircleIsReady"
	},
	[BR.CIRCLE_STATES.CIRCLE_MOVING] = {
		isEnabledForRealism = true,
		anim = "CircleMoving"
	},
	[BR.CIRCLE_STATES.CIRCLE_MOVING_WARNING] = {
		isEnabledForRealism = true,
		anim = "CircleMovingWarning"
	},
	[BR.CIRCLE_STATES.FINAL_CIRCLE] = {
		anim = "FinalCircle"
	},
	[BR.CIRCLE_STATES.HIDE] = {
		anim = "Hide"
	},
	[BR.CIRCLE_STATES.BLOOD_MONEY_TIMER] = {
		anim = "BloodMoneyTimer"
	},
	[BR.CIRCLE_STATES.BLOOD_MONEY_TIMER_RED] = {
		anim = "BloodMoneyTimerRed"
	},
	[BR.CIRCLE_STATES.BLOOD_MONEY_TIMER_OT] = {
		anim = "BloodMoneyTimerOT"
	},
	[BR.CIRCLE_STATES.BLOOD_MONEY_TIMER_RED_OT] = {
		anim = "BloodMoneyTimerRedOT"
	}
}
BR.ALTIMETER_STATES = {
	GROUND = 0,
	FREEFALL = 1,
	PARACHUTE_OPEN = 2
}
BR.INFIL_STARTED_STATES = {
	NOT_STARTED = 0,
	HAS_STARTED = 1
}
BR.INFILED_STATES = {
	NOT_COMPLETE = 0,
	IS_COMPLETE = 1
}

function BR.GetUnpackedKeypadData(arg_1_0)
	local var_1_0
	local var_1_1
	local var_1_2 = {}
	local var_1_3 = DataSources.inGame.player.BRData.keypadPackedData:GetValue(arg_1_0)
	local var_1_4 = 1
	local var_1_5 = 2

	var_1_2.state = MP.ExtractBitsFromBitPositionInValue(var_1_3, var_1_5, var_1_4)

	local var_1_6 = 3
	local var_1_7 = 4

	var_1_2.codeLength = MP.ExtractBitsFromBitPositionInValue(var_1_3, var_1_7, var_1_6)

	return var_1_2
end

BR.KEYPAD_OMNVAR_STATE = {
	On = 1,
	Off = 0,
	Fail = 3,
	Success = 2
}
BR.PLAY_AGAIN_WITHOUT_PARTY_COMMAND = "playagain 0"
BR.PLAY_AGAIN_WITH_PARTY_COMMAND = "playagain 1"
BR.ABORT_PLAY_AGAIN_WITHOUT_PARTY_COMMAND = "playagainabort 0"
BR.ABORT_PLAY_AGAIN_WITH_PARTY_COMMAND = "playagainabort 1"

function BR.PlayAgainAction(arg_2_0, arg_2_1)
	if not CONDITIONS.IsPlayAgainAllowed() then
		return
	end

	if Lobby.IsNotAloneInPrivateParty() then
		if CONDITIONS.IsPlayAgainEnabledForPartyHost() then
			DebugPrint("------ Plag Again State: party host")
			ACTIONS.OpenPopupMenu(arg_2_0, "PlayAgainPartyHostPopup", true, arg_2_1)
		elseif CONDITIONS.IsPlayAgainEnabled(arg_2_0) then
			DebugPrint("------ Plag Again State: party member")
			ACTIONS.OpenPopupMenu(arg_2_0, "PlayAgainPartyMemberPopup", true, arg_2_1)
		end
	else
		DebugPrint("------ Plag Again State: not in a party")
		ACTIONS.OpenPopupMenu(arg_2_0, "PlayAgainPopup", true, arg_2_1)
	end
end

function BR.GetInflationModeRedeployAmount()
	if CONDITIONS.IsBRInflation() then
		local var_3_0 = Dvar.CFHDGABACF("scr_br_alt_mode_inflation_cost")

		if var_3_0 then
			local var_3_1 = tonumber(var_3_0)

			if var_3_1 then
				return var_3_1 * BRCONTRACTS.PLUNDER_MULTIPLIER
			end
		end
	end

	return -1
end

function BR.GetPlayAgainChoice()
	return Dvar.CFHDGABACF("LSORRMTOPP")
end

function BR.SetPlayAgainChoice(arg_5_0)
	assert(arg_5_0 >= 0 and arg_5_0 <= BR.PlayAgainChoice.WITH_PARTY)
	Dvar.DFIJDJFIFD("LSORRMTOPP", arg_5_0)
end

function BR.AbortPlayAgain(arg_6_0)
	Engine.EBIDFIDHIE(arg_6_0)
end

function BR.ExecuteBREndTransition(arg_7_0, arg_7_1, arg_7_2)
	Engine.BEFHEEBHIA()

	local var_7_0 = arg_7_0:getRootParent()

	if var_7_0.squadEliminatedLayer then
		LUI.UIRoot.SetLuiLayerKeycatch(var_7_0.squadEliminatedLayer, arg_7_1, false)
	end

	if CONDITIONS.IsBRQuarryTutorialMap() and arg_7_2 == "map_restart" then
		Engine.EBHIFJCGBH("exit_squad_eliminated", BR.ExitGameCommandType.MAP_RESTART)

		return
	end

	Engine.EBIDFIDHIE(arg_7_2)
end

function BR.SetupEndgameDataSource(arg_8_0)
	DataSources.inGame.BR.BREndGameTime = LUI.DataSourceInControllerModel.new("alwaysLoaded.brEndGameTime")

	local var_8_0 = tonumber(Engine.DCJHCAFIIA())

	DataSources.inGame.BR.BREndGameTime:SetValue(arg_8_0, var_8_0 + BR.END_GAME_TIMER_LENGTH_SECONDS)
end

function BR.GetRemainingEndgameTime(arg_9_0)
	local var_9_0 = DataSources.inGame.BR.BREndGameTime

	if not var_9_0 then
		BR.SetupEndgameDataSource(arg_9_0)

		var_9_0 = DataSources.inGame.BR.BREndGameTime
	end

	local var_9_1 = tonumber(Engine.DCJHCAFIIA())
	local var_9_2 = var_9_0:GetValue(arg_9_0)

	if var_9_2 - var_9_1 > 0 then
		return Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_9_2 - var_9_1))
	end
end

function BR.GetTotalTeamCash(arg_10_0)
	local var_10_0 = Game.BFEEGCHICA(arg_10_0, "ui_br_team_cash_banked") or 0
	local var_10_1 = Game.BFEEGCHICA(arg_10_0, "ui_br_team_cash_pockets") or 0
	local var_10_2 = 0

	if var_10_0 ~= nil and var_10_1 ~= nil then
		var_10_2 = var_10_0 + var_10_1

		if CONDITIONS.IsRiskGametype() then
			-- block empty
		else
			var_10_2 = var_10_2 * BRLOOT.TEAM_CASH_SCALAR
		end
	end

	return var_10_2
end
