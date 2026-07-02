BR = BR or {}
BR.END_GAME_TIMER_LENGTH = 22000
BR.END_GAME_TIMER_LENGTH_SECONDS = BR.END_GAME_TIMER_LENGTH / 1000
BR.ARMOR_EMPTY_HINT_MAX_ANIM_LENGTH = 10000
BR.INVALID_CLIENT_NUM = -1
BR.DEFAULT_MAP = "mp_wz_island"
BR.PLAY_AGAIN_SQUAD_CONFIRM_ID_OMNVAR = "ui_br_rocket_ammo"
BR.END_GAME_RESULT_MENU = "BrEndGameResults"
BR.GameEndState = {
	BM_DEFEAT = 4,
	BR_DEFEAT = 2,
	BR_VICTORY = 1,
	BM_VICTORY = 3
}
BR.PlayAgainSquadState = {
	MATCH_STARTING_LOCKED = 2,
	MATCH_STARTING = 1,
	WAITING = 0
}
BR.CUSTOM_SWATCH_ANIM_APPEND_STR = "CustomSwatch"
BR.ExitGameCommandType = {
	MAP_RESTART = 2,
	LEAVE_TUTORIAL = 1
}
BR.OVERLAY_STATE = {
	CINEMATIC_SHOW_SKIP_PROMPT = 12,
	PROMO_VIDEO = 9,
	KILL_BINK_SHOW_BLACK = 5,
	BORDER_WITH_CENTER_ALPHA = 10,
	INFIL_WITH_CHYRON = 11,
	GULAG_SHOW_SKIP_PROMPT = 2,
	STRETCHED_FULLSCREEN_WITH_ALPHA = 14,
	INFIL_NO_SKIP_PROMPT = 3,
	FADE_IN_BLACK = 7,
	FADE_OUT_BLACK = 6,
	BORDER_DURING_DELAY_WITH_NOTIFY = 13,
	GULAG_NO_SKIP_PROMPT = 1,
	BRING_BACK_ASPECT_RATIO_BG_AFTER_DELAY = 8,
	OFF = 0,
	ONBOARDING = 4
}
BR.OVERLAY_DATA = {
	[BR.OVERLAY_STATE.OFF] = {
		enableInputWidgets = true,
		hideOverlay = true,
		useGulagChyron = true
	},
	[BR.OVERLAY_STATE.GULAG_NO_SKIP_PROMPT] = {
		useGulagChyron = true
	},
	[BR.OVERLAY_STATE.GULAG_SHOW_SKIP_PROMPT] = {
		skipPromptStringRef = "MP_BR_INGAME/SKIP_TO_GULAG_INPUT_PROMPT",
		useGulagChyron = true,
		showSkipPrompt = true
	},
	[BR.OVERLAY_STATE.INFIL_NO_SKIP_PROMPT] = {},
	[BR.OVERLAY_STATE.ONBOARDING] = {
		customShowAnim = "ShowOnboarding"
	},
	[BR.OVERLAY_STATE.KILL_BINK_SHOW_BLACK] = {
		skipFinishCheck = true,
		killExitTimer = true,
		skipChyron = true,
		customShowAnim = CONDITIONS.IsBRX1Variant() and "HideAllExceptBlackRedact" or "HideAllExceptBlack"
	},
	[BR.OVERLAY_STATE.FADE_OUT_BLACK] = {
		customShowAnim = "FadeOutBlack",
		skipFinishCheck = true,
		enableInputWidgets = true,
		skipChyron = true
	},
	[BR.OVERLAY_STATE.FADE_IN_BLACK] = {
		customShowAnim = "FadeInBlack",
		skipFinishCheck = true,
		skipChyron = true
	},
	[BR.OVERLAY_STATE.BRING_BACK_ASPECT_RATIO_BG_AFTER_DELAY] = {
		skipFinishCheck = true,
		customShowAnim = "ShowWithAlpha",
		disableInputWidgets = true,
		enableSubtitles = true,
		delayedAnimTimer = 109000,
		dataToUseAfterTimer = {
			shouldDisableInput = true,
			anim = "ShowWithAlpha"
		}
	},
	[BR.OVERLAY_STATE.PROMO_VIDEO] = {
		skipFinishCheck = true,
		enableSubtitles = true,
		disableInputWidgets = true,
		customShowAnim = "ShowWithAlpha"
	},
	[BR.OVERLAY_STATE.BORDER_WITH_CENTER_ALPHA] = {
		customShowAnim = "ShowBorderedWithAlpha",
		enableSubtitles = true
	},
	[BR.OVERLAY_STATE.INFIL_WITH_CHYRON] = {
		customShowAnim = "ShowInfilChyron"
	},
	[BR.OVERLAY_STATE.CINEMATIC_SHOW_SKIP_PROMPT] = {
		skipPromptStringRef = "MP_BR_INGAME/SKIP_CINEMATIC_INPUT_PROMPT",
		startDelay = 100,
		disableResize = true,
		showSkipPrompt = true,
		customShowAnim = "ShowBorderedWithAlpha",
		enableSubtitles = true
	},
	[BR.OVERLAY_STATE.BORDER_DURING_DELAY_WITH_NOTIFY] = {
		delayTimer = 20600,
		notifyServerAfterTimer = true,
		customShowAnim = "ShowInfilChyron",
		skipFinishCheck = true
	},
	[BR.OVERLAY_STATE.STRETCHED_FULLSCREEN_WITH_ALPHA] = {
		isStretchedFullscreen = true,
		overHud = false,
		customShowAnim = "ShowWithAlpha"
	}
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
	JAILBREAK = 2,
	AUAVSCAN_PRONE = 10,
	HVTHUNT = 3,
	OVERDRIVE = 4,
	RESURGENCE = 5,
	AUAVSCAN = 6,
	FRESNO_INC = 11,
	FIRESALE = 1,
	ARMOREDTRUCK = 7,
	FRESNO = 8,
	OUTBREAK = 12,
	NONE = 0
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
	PARACHUTE_OPEN = 2,
	ASCENDING = 3
}
BR.INFIL_STARTED_STATES = {
	NOT_STARTED = 0,
	HAS_STARTED = 1
}
BR.INFILED_STATES = {
	NOT_COMPLETE = 0,
	IS_COMPLETE = 1
}
BR.SUBWAY_STATES = {
	CHANGING_STATION = 1,
	ARRIVED_AT_STATION = 0
}
BR.EXFIL_RADIO_STATE = {
	DROPPED = 2,
	INCOMING = 1,
	HIDDEN = 0,
	HELD = 3,
	RESPAWNING = 4
}
BR.DOV2_NUKE_STATE = {
	ARMED = 4,
	DROPPED = 2,
	INCOMING = 1,
	HIDDEN = 0,
	HELD = 3
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

	local var_1_8 = 7
	local var_1_9 = 16

	var_1_2.codeDigits = MP.ExtractBitsFromBitPositionInValue(var_1_3, var_1_9, var_1_8)

	return var_1_2
end

BR.KEYPAD_OMNVAR_STATE = {
	On = 1,
	Off = 0,
	Fail = 3,
	Success = 2
}
BR.SLICED_KEYPAD_NUMBER_IMAGES_MAP = {
	[0] = {
		slicedImage = "ui_mp_br_bunker_keypad_0_top"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_1_top"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_2_top"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_3_top"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_4_top"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_5_top"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_6_top"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_7_top"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_8_top"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_9_top"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_0_bottom"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_1_bottom"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_2_bottom"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_3_bottom"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_4_bottom"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_5_bottom"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_6_bottom"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_7_bottom"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_8_bottom"
	},
	{
		slicedImage = "ui_mp_br_bunker_keypad_9_bottom"
	}
}
BR.PLAY_AGAIN_WITHOUT_PARTY_COMMAND = "playagain 0"
BR.PLAY_AGAIN_WITH_PARTY_COMMAND = "playagain 1"
BR.ABORT_PLAY_AGAIN_WITHOUT_PARTY_COMMAND = "playagainabort 0"
BR.ABORT_PLAY_AGAIN_WITH_PARTY_COMMAND = "playagainabort 1"
BR.NUKE_INVALID_TIMER_STATE = -1
BR.NUKE_LAUNCHED_TIMER_STATE = 3

function BR.PlayAgainAction(arg_2_0, arg_2_1)
	if not CONDITIONS.IsPlayAgainAllowed() then
		return
	end

	if Lobby.IsNotAloneInPrivateParty() then
		if CONDITIONS.IsPlayAgainEnabledForPartyHost() then
			DebugPrint("------ Play Again State: party host")
			ACTIONS.OpenPopupMenu(arg_2_0, "PlayAgainPartyHostPopup", true, arg_2_1)
		elseif CONDITIONS.IsPlayAgainEnabled(arg_2_0) then
			DebugPrint("------ Play Again State: party member")
			ACTIONS.OpenPopupMenu(arg_2_0, "PlayAgainPartyMemberPopup", true, arg_2_1)
		end
	else
		DebugPrint("------ Play Again State: not in a party")
		ACTIONS.OpenPopupMenu(arg_2_0, "PlayAgainPopup", true, arg_2_1)
	end
end

function BR.PlayAgainWithSquadAction(arg_3_0, arg_3_1)
	if not CONDITIONS.IsPlayAgainAllowed() then
		return
	end

	local var_3_0 = Game.DBACJGFHDD(arg_3_1)

	Engine.EBHIFJCGBH("play_again_squad_request", tonumber(var_3_0))
end

function BR.GetInflationModeRedeployAmount()
	if CONDITIONS.IsBRInflation() then
		local var_4_0 = Dvar.CFHDGABACF("scr_br_alt_mode_inflation_cost")

		if var_4_0 then
			local var_4_1 = tonumber(var_4_0)

			if var_4_1 then
				return var_4_1 * BRCONTRACTS.PLUNDER_MULTIPLIER
			end
		end
	end

	return -1
end

function BR.GetPlayAgainChoice()
	return Dvar.CFHDGABACF("LSORRMTOPP")
end

function BR.GetNumTierSkips(arg_6_0)
	return ScheduledChallenges.HCHJBFIEH(arg_6_0)
end

function BR.GetNumChallengesBanked(arg_7_0)
	local var_7_0 = ScheduledChallenges.CCECJEFJDH(arg_7_0)

	return var_7_0 and #var_7_0 or 0
end

function BR.SetPlayAgainChoice(arg_8_0)
	assert(arg_8_0 >= 0 and arg_8_0 <= BR.PlayAgainChoice.WITH_PARTY)
	Dvar.DFIJDJFIFD("LSORRMTOPP", arg_8_0)
end

function BR.AbortPlayAgain(arg_9_0)
	Engine.EBIDFIDHIE(arg_9_0)
end

function BR.ExecuteBREndTransition(arg_10_0, arg_10_1, arg_10_2)
	Engine.BEFHEEBHIA()

	local var_10_0 = arg_10_0:getRootParent()

	if var_10_0.squadEliminatedLayer then
		LUI.UIRoot.SetLuiLayerKeycatch(var_10_0.squadEliminatedLayer, arg_10_1, false)
	end

	if CONDITIONS.IsBRQuarryTutorialMap() and arg_10_2 == "map_restart" then
		Engine.EBHIFJCGBH("exit_squad_eliminated", BR.ExitGameCommandType.MAP_RESTART)

		return
	end

	Engine.EBIDFIDHIE(arg_10_2)
end

function BR.SetupEndgameDataSource(arg_11_0)
	DataSources.inGame.BR.BREndGameTime = LUI.DataSourceInControllerModel.new("alwaysLoaded.brEndGameTime")

	local var_11_0 = tonumber(Engine.DCJHCAFIIA())

	DataSources.inGame.BR.BREndGameTime:SetValue(arg_11_0, var_11_0 + BR.END_GAME_TIMER_LENGTH_SECONDS)
end

function BR.GetRemainingEndgameTime(arg_12_0)
	local var_12_0 = DataSources.inGame.BR.BREndGameTime

	if not var_12_0 then
		BR.SetupEndgameDataSource(arg_12_0)

		var_12_0 = DataSources.inGame.BR.BREndGameTime
	end

	local var_12_1 = tonumber(Engine.DCJHCAFIIA())
	local var_12_2 = var_12_0:GetValue(arg_12_0)

	if var_12_2 - var_12_1 > 0 then
		return Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_12_2 - var_12_1))
	end
end

function BR.GetTotalTeamCash(arg_13_0)
	local var_13_0 = Game.BFEEGCHICA(arg_13_0, "ui_br_team_cash_banked") or 0
	local var_13_1 = Game.BFEEGCHICA(arg_13_0, "ui_br_team_cash_pockets") or 0
	local var_13_2 = 0

	if var_13_0 ~= nil and var_13_1 ~= nil then
		var_13_2 = var_13_0 + var_13_1

		if CONDITIONS.IsRiskGametype() then
			-- block empty
		else
			var_13_2 = var_13_2 * BRLOOT.TEAM_CASH_SCALAR
		end
	end

	return var_13_2
end

function BR.GetPrestigeStorePopupData(arg_14_0)
	local function var_14_0(arg_15_0)
		ACTIONS.LeaveMenu(arg_15_0)

		if arg_14_0 then
			arg_14_0()
		end
	end

	return {
		title = "PRESTIGE/STORE_POPUP_HEADING",
		titleFlavor = "PRESTIGE/STORE_POPUP_FLAVOR",
		panelData = {
			{
				imageHeading = "PRESTIGE/STORE_PANEL_HEADING_1",
				image = "ui_mp_br_upsell_prestige_store_popup_1",
				desc = "PRESTIGE/STORE_PANEL_DESC_1"
			},
			{
				imageHeading = "PRESTIGE/STORE_PANEL_HEADING_2",
				image = "ui_mp_br_upsell_prestige_store_popup_2",
				desc = "PRESTIGE/STORE_PANEL_DESC_2"
			},
			{
				imageHeading = "PRESTIGE/STORE_PANEL_HEADING_3",
				image = "ui_mp_br_upsell_prestige_store_popup_3",
				desc = "PRESTIGE/STORE_PANEL_DESC_3"
			}
		},
		confirmButton = {
			action = var_14_0
		}
	}
end

function BR.GetNukeTimerType(arg_16_0)
	local var_16_0 = 1536

	return BitwiseOperators.band(arg_16_0, var_16_0)
end

function BR.GetX2LocomotiveState(arg_17_0)
	local var_17_0 = 7

	return BitwiseOperators.band(arg_17_0, var_17_0)
end

function BR.IsOverlayStateOverHud(arg_18_0)
	local var_18_0 = BR.OVERLAY_DATA[arg_18_0].overHud

	var_18_0 = var_18_0 == nil and true or var_18_0

	return var_18_0
end
