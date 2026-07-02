module(..., package.seeall)

local var_0_0 = "%02d"
local var_0_1 = {
	OPERATORS = 3,
	WEAPONS = 2,
	BARRACKS = 4
}
local var_0_2 = {
	NonWeaponTypes = {
		LOOT.itemTypes.WATCH,
		LOOT.itemTypes.VEHICLE_CAMO
	},
	BarracksTypes = {
		LOOT.itemTypes.PLAYERCARD,
		LOOT.itemTypes.EMBLEM,
		LOOT.itemTypes.SPRAYS,
		LOOT.itemTypes.GESTURES
	}
}

local function var_0_3(arg_1_0, arg_1_1)
	return GameBattlesMatchLobby(arg_1_0, arg_1_1)
end

LUI.FlowManager.RequestSetStack("GameBattlesMatchLobby", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "MPMainMenu"
	}
})
LUI.FlowManager.RegisterFenceGroup("GameBattlesMatchLobby", {
	"mlgSchedule"
})

local var_0_4 = "frontEnd.MP.GameBattlesMatchLobby"

local function var_0_5(arg_2_0)
	local var_2_0 = {
		math.floor(arg_2_0 / 3600 % 24),
		math.floor(arg_2_0 / 60 % 60),
		arg_2_0 % 60
	}

	for iter_2_0, iter_2_1 in pairs(var_2_0) do
		var_2_0[iter_2_0] = string.format(var_0_0, iter_2_1)
	end

	return unpack(var_2_0)
end

local function var_0_6(arg_3_0, arg_3_1, arg_3_2)
	arg_3_2 = arg_3_2 or false

	arg_3_0:registerEventHandler("update_gamebattles_timer", nil)

	if arg_3_0.gamebattlesTimer then
		arg_3_0.gamebattlesTimer:closeTree()

		arg_3_0.gamebattlesTimer = nil
	end

	if arg_3_2 then
		arg_3_0:dispatchEventToRoot({
			name = "gamebattles_timer_stop",
			immediate = true,
			controller = arg_3_1
		})
	end
end

local function var_0_7(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = Engine.CCEJJCCDEG(arg_4_2)

	if var_4_0 <= 0 then
		var_0_6(arg_4_0, arg_4_1, true)
	else
		if not LUI.FlowManager.IsInStack("GameBattlesMatchLobby") then
			return true
		end

		local var_4_1 = LUI.FlowManager.GetScopedData("GameBattlesMatchLobby").matchLobby

		if var_4_1 and var_4_1:IsInPlayMenuWidget() then
			local var_4_2, var_4_3, var_4_4 = var_0_5(var_4_0)
			local var_4_5 = ""
			local var_4_6 = var_4_1.activeTabWidget.GameBattlesUpcomingMatch

			if GAMEBATTLES.IsInIntermissionInterval(var_4_1.gbMatch) then
				var_4_5 = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/INTERMISSION_COUNTDOWN_TIME_STRING", var_4_3, var_4_4)
			elseif GAMEBATTLES.IsInNoShowInterval(var_4_1.gbMatch) then
				var_4_5 = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/NO_SHOW_COUNTDOWN_TIME_STRING", var_4_3, var_4_4)
			else
				var_4_5 = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/COUNTDOWN_TIME_STRING", var_4_2, var_4_3, var_4_4)
			end

			var_4_6.MatchTime:setText(var_4_5, 0)
		end
	end

	return true
end

local function var_0_8(arg_5_0, arg_5_1, arg_5_2)
	var_0_6(arg_5_0, arg_5_1, false)

	arg_5_0.currentGameBattlesTimerTime = arg_5_2

	if not arg_5_0.gamebattlesTimer then
		arg_5_0.gamebattlesTimer = LUI.UITimer.new({
			interval = 1000,
			event = {
				name = "update_gamebattles_timer",
				controller = arg_5_1
			}
		})
		arg_5_0.gamebattlesTimer.id = "gamebattlesTimer"

		arg_5_0:addElement(arg_5_0.gamebattlesTimer)
	end

	arg_5_0:registerEventHandler("update_gamebattles_timer", function(arg_6_0, arg_6_1)
		var_0_7(arg_6_0, arg_6_1.controller, arg_6_0.currentGameBattlesTimerTime)
	end)
	var_0_7(arg_5_0, arg_5_1, arg_5_2)
end

local function var_0_9(arg_7_0)
	local var_7_0 = Engine.DBFFAEEFGJ()

	var_0_6(var_7_0, arg_7_0, false)
	GAMEBATTLES.RemoveSubscriptions(arg_7_0)
end

local function var_0_10(arg_8_0)
	local var_8_0 = Engine.BECCFCBIAA("gpadEnabled", arg_8_0)

	MLG.DIDBJAGCDI(arg_8_0, var_8_0)
end

local function var_0_11(arg_9_0, arg_9_1)
	if arg_9_1 then
		MLG.EAJACAJIHI(arg_9_0)
	else
		MLG.DAIBFGCGF(arg_9_0)
	end
end

local function var_0_12(arg_10_0, arg_10_1)
	arg_10_0:SubscribeToModel(arg_10_0.matchJoinStateDataSource:GetModel(arg_10_1), function(arg_11_0)
		local var_11_0 = DataModel.JJEHAEBDF(arg_11_0)

		if var_11_0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.HOST or var_11_0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.CLIENT then
			arg_10_0:SubscribeToPlayerCountChange(arg_10_1)
			var_0_10(arg_10_1)

			arg_10_0.isJoiningMatch = false
		elseif var_11_0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.JOIN_ERROR then
			arg_10_0:ResetMenuState(arg_10_1, nil, true)
			LUI.FlowManager.RequestPopupMenu(arg_10_0, "MLGGamebattlesCantJoinGamePopup", false, arg_10_1, false, {
				controllerIndex = arg_10_1
			})

			arg_10_0.isJoiningMatch = false
		elseif var_11_0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.CANT_HOST then
			arg_10_0:ResetMenuState(arg_10_1, nil, true)
			LUI.FlowManager.RequestPopupMenu(arg_10_0, "MLGGamebattlesCantHostGamePopup", false, arg_10_1, false, {
				controllerIndex = arg_10_1
			})

			arg_10_0.isJoiningMatch = false
		end

		arg_10_0:RefreshVisuals(arg_10_1)
	end)
end

local function var_0_13(arg_12_0, arg_12_1)
	local function var_12_0(arg_13_0)
		if DataModel.JJEHAEBDF(arg_13_0) == 0 and arg_12_0.isMatchStarting then
			Engine.DAGFFDGFII("xstopparty", arg_12_1)

			if not LUI.FlowManager.IsInStack("GameBattlesMatchLobby") then
				return
			end

			LUI.FlowManager.GetScopedData("GameBattlesMatchLobby").matchLobby:HandleMatchStart(arg_12_1)
		end
	end

	local var_12_1 = Engine.DBFFAEEFGJ()

	var_12_1:SubscribeToModel(arg_12_0.teamAlliesCountDataSource:GetModel(arg_12_1), var_12_0)
	var_12_1:SubscribeToModel(arg_12_0.teamAxisCountDataSource:GetModel(arg_12_1), var_12_0)
end

local function var_0_14(arg_14_0, arg_14_1)
	local var_14_0 = Engine.DBFFAEEFGJ()

	var_14_0:UnsubscribeFromModel(arg_14_0.teamAlliesCountDataSource:GetModel(arg_14_1))
	var_14_0:UnsubscribeFromModel(arg_14_0.teamAxisCountDataSource:GetModel(arg_14_1))
end

local function var_0_15(arg_15_0, arg_15_1)
	MLG.IJEIFEIAG(arg_15_1)
	arg_15_0:SubscribeToMatchJoinState(arg_15_1)
end

local function var_0_16(arg_16_0, arg_16_1)
	MLG.DEHBFHFDFJ(arg_16_0)
	MLG.DEEBFIGGJE(arg_16_1)
end

local function var_0_17(arg_17_0)
	GAMEBATTLES.LeaveGameBattleMatchLobby(arg_17_0)
end

local function var_0_18(arg_18_0, arg_18_1)
	if arg_18_0 then
		GAMEBATTLES.RecordTelemetryEvent(arg_18_1, GAMEBATTLES.TELEMETRY.ACTION.LEAVE_MENU, arg_18_0:GetTelemetryData())
	end

	Dvar.DHEGHJJJHI("LNQLRSNMQS", false)
	Dvar.DHEGHJJJHI("MPTLKKKQNT", true)
	Dvar.DHEGHJJJHI("MTMMPLSRNL", false)
	Dvar.DHEGHJJJHI("MQMQRMLRQP", false)
	Dvar.DHEGHJJJHI("NNPMRQSQN", true)
	Engine.DAGFFDGFII("xstopparty", arg_18_1)
	var_0_9(arg_18_1)

	if arg_18_0 then
		arg_18_0:ResetMenuState(arg_18_1)
	end

	MLG.DFHFIFFCHB(0)
	MLG.ResetGameBattleMatchId(arg_18_1)

	if CONDITIONS.IsCoreMultiplayer() then
		MatchRules.CJGCIGEBB(0)
	end

	Lobby.EAHFJBBBBD(PartyUIRoot.MP_MAIN_MENU)
end

local function var_0_19(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	arg_19_2 = arg_19_2 or false
	arg_19_3 = arg_19_3 or false

	if not arg_19_3 then
		arg_19_0:UnsubscribeFromPlayerCountChange(arg_19_1)
		var_0_17(arg_19_1)

		arg_19_0.hasLeftMatch = true
	end

	if arg_19_0:GetCurrentMenu() and not arg_19_2 then
		arg_19_0:dispatchEventToCurrentMenu({
			name = "update_lobby_models",
			immediate = true,
			controller = arg_19_1
		})
	end

	arg_19_0.isMatchStarting = false
	arg_19_0.isMatchButtonEnabled = true
	arg_19_0.isRefreshEnabled = true

	arg_19_0:EnableLobbyRefresh(arg_19_1)
end

local function var_0_20(arg_20_0, arg_20_1)
	GAMEBATTLES.RecordTelemetryEvent(arg_20_1, GAMEBATTLES.TELEMETRY.ACTION.LEAVE_MATCH, arg_20_0:GetTelemetryData())
	Dvar.DHEGHJJJHI("MQMQRMLRQP", false)
	Dvar.DHEGHJJJHI("NNPMRQSQN", true)
	arg_20_0:ResetMenuState(arg_20_1)
	arg_20_0:StartMatchButtonCooldown(arg_20_1)
end

local function var_0_21(arg_21_0, arg_21_1)
	return function(arg_22_0, arg_22_1)
		var_0_20(arg_21_0, arg_21_1)
	end
end

local function var_0_22(arg_23_0, arg_23_1)
	return function(arg_24_0, arg_24_1)
		LUI.FlowManager.RequestLeaveMenu(arg_23_0, true, true)
	end
end

local function var_0_23(arg_25_0, arg_25_1)
	if arg_25_0:IsInPlayMenuWidget() then
		local var_25_0 = arg_25_0.activeTabWidget
		local var_25_1 = var_25_0.MatchLobbyButton
		local var_25_2 = var_25_0.GameBattlesUpcomingMatch
		local var_25_3 = arg_25_0.matchJoinStateDataSource:GetValue(arg_25_1)
		local var_25_4 = MLG.DEFJAJGIJH(arg_25_1)
		local var_25_5 = GAMEBATTLES.HasJoinedMatch(arg_25_1)

		if not arg_25_0.gbMatch then
			ACTIONS.AnimateSequence(var_25_2, "NoUpcomingMatch")

			if var_25_4 == GAMEBATTLES.MLG_CODE_STATE.RETRIEVAL_ERROR then
				var_25_2:ShowErrorMessage("LUA_MENU/GAME_BATTLES_LOBBY_NO_MATCH_DATA")
			else
				var_25_2:ShowErrorMessage("PLATFORM/NO_UPCOMING_MATCH")
			end

			var_25_2.Title:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/NO_SCHEDULED_MATCH"))

			if not arg_25_0.isWhitelistedForGameBattles then
				var_25_1:SetButtonVisibility(false)
			end
		else
			ACTIONS.AnimateSequence(var_25_2, "HasUpcomingMatch")

			if var_25_5 then
				var_25_2.Title:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_INFO"))
			else
				var_25_2.Title:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/NEXT_MATCH"))
			end

			var_25_2:ShowMatchData(arg_25_1, arg_25_0.gbMatch)

			if arg_25_0.isMatchButtonEnabled then
				var_25_1:SetButtonVisibility(true)
			else
				var_25_1.Button:SetButtonDisabled(true)
			end
		end

		if not GAMEBATTLES.IsMatchAvailable(arg_25_1) then
			var_25_1:SetButtonVisibility(false)
		else
			local var_25_6 = GAMEBATTLES.AreAllPlayersReady(arg_25_1)
			local var_25_7 = arg_25_0.isMatchStarting or var_25_6 or not arg_25_0.isMatchButtonEnabled

			var_25_1.Button:SetButtonDisabled(var_25_7)

			if arg_25_0.isMatchInProgress then
				var_25_2.MatchTime:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_IN_PROGRESS"), 0)
			end
		end

		if var_25_5 and not arg_25_0.hasLeftMatch then
			if MLG.BFEDICDJJE(arg_25_1) or arg_25_0.isMatchStarting or GAMEBATTLES.AreAllPlayersReady(arg_25_1) then
				var_25_1:setText(Engine.CBBHFCGDIC("LUA_MENU/COMMITTED_TO_START_CAPS"))
			elseif var_25_3 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.TRY_CREATE then
				var_25_1:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/JOINING_GAME"))
			else
				var_25_1:setText(Engine.CBBHFCGDIC("LUA_MENU/COMMIT_TO_START_CAPS"))
			end

			if arg_25_0.lastLobbyAnimation == GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_JOINED or arg_25_0.lastLobbyAnimation == GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_NOT_JOINED then
				ACTIONS.AnimateSequence(var_25_0.LobbyMembersAxis, "HasJoinedMatchLeftTeam")
				ACTIONS.AnimateSequence(var_25_0.LobbyMembersAllies, "HasJoinedMatchRightTeam")

				arg_25_0.lastLobbyAnimation = GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_JOINED
			elseif arg_25_0.lastLobbyAnimation ~= GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_JOINED then
				ACTIONS.AnimateSequence(var_25_0.LobbyMembersAxis, "HasEnteredMatchLeftTeam")
				ACTIONS.AnimateSequence(var_25_0.LobbyMembersAllies, "HasEnteredMatchRightTeam")

				arg_25_0.lastLobbyAnimation = GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_JOINED
			end
		elseif arg_25_0.isWhitelistedForGameBattles then
			var_25_1:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/JOIN_BY_ID_BUTTON"))
		else
			var_25_1:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/JOIN_MATCH"))

			if arg_25_0.lastLobbyAnimation == GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_NOT_JOINED then
				ACTIONS.AnimateSequence(var_25_0.LobbyMembersAxis, "HasNotJoinedMatchLeftTeam")
				ACTIONS.AnimateSequence(var_25_0.LobbyMembersAllies, "HasNotJoinedMatchRightTeam")

				arg_25_0.lastLobbyAnimation = GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_NOT_JOINED
			elseif arg_25_0.lastLobbyAnimation ~= GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_LEFT_MATCH then
				ACTIONS.AnimateSequence(var_25_0.LobbyMembersAxis, "HasLeftMatchLeftTeam")
				ACTIONS.AnimateSequence(var_25_0.LobbyMembersAllies, "HasLeftMatchRightTeam")

				arg_25_0.lastLobbyAnimation = GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_LEFT_MATCH
			end
		end

		var_25_0:UpdateTeamListsVisuals(arg_25_1, var_25_5)
	end
end

local function var_0_24(arg_26_0, arg_26_1)
	if arg_26_0.gbMatch and arg_26_0:IsInPlayMenuWidget() then
		if GAMEBATTLES.IsInIntermissionInterval(arg_26_0.gbMatch) then
			arg_26_0.checkIntermissionStartTimer = LUI.UITimer.new({
				interval = 1000,
				event = {
					name = "gamebattles_intermission_start_check",
					controller = arg_26_1
				}
			})
			arg_26_0.checkIntermissionStartTimer.id = "checkIntermissionStartTimer"

			arg_26_0:addElement(arg_26_0.checkIntermissionStartTimer)
			arg_26_0:registerAndCallEventHandler("gamebattles_intermission_start_check", function(arg_27_0, arg_27_1)
				local var_27_0 = GAMEBATTLES.GetCurrentMatch(arg_26_1)

				if var_27_0 then
					local var_27_1 = var_27_0.intermissionStartEpochTime

					if var_27_1 and var_27_1 ~= "0" then
						local var_27_2 = Engine.BAHGDJFBEF(var_27_1, GAMEBATTLES.GetIntermissionTime())

						if var_27_2 > Engine.DCJHCAFIIA() then
							var_0_8(Engine.DBFFAEEFGJ(), arg_26_1, var_27_2)
						end

						arg_27_0:registerEventHandler("gamebattles_intermission_start_check", nil)
						arg_27_0.checkIntermissionStartTimer:closeTree()

						arg_27_0.checkIntermissionStartTimer = nil
					end
				end
			end)
		elseif not arg_26_0.isMatchStarting and not arg_26_0.isMatchInProgress then
			var_0_8(Engine.DBFFAEEFGJ(), arg_26_1, arg_26_0.gbMatch.matchTime)
		end
	end
end

local function var_0_25(arg_28_0, arg_28_1)
	if not arg_28_0.isMatchButtonEnabled then
		return true
	end

	if GAMEBATTLES.HasJoinedMatch(arg_28_1) then
		arg_28_0:StartMatchButtonCooldown(arg_28_1)
		var_0_11(arg_28_1, not MLG.BFEDICDJJE(arg_28_1))
	elseif arg_28_0.isWhitelistedForGameBattles then
		OSK.CBJGJDGFC(arg_28_1, Engine.CBBHFCGDIC("MLG_GAMEBATTLES/JOIN_BY_ID_BUTTON"), "", 8, true, true, true, function(arg_29_0, arg_29_1)
			if arg_29_1 and arg_29_1 ~= "" then
				var_0_16(arg_29_1, arg_29_0)
			end
		end)
	else
		GAMEBATTLES.RecordTelemetryEvent(arg_28_1, GAMEBATTLES.TELEMETRY.ACTION.JOIN_MATCH, arg_28_0:GetTelemetryData())

		if GAMEBATTLES.HandleInputTypeSelected(arg_28_0.gbMatch.inputType, arg_28_1) then
			arg_28_0:StartMatchButtonCooldown(arg_28_1)

			arg_28_0.shouldAttemptJoinAfterRefresh = true

			GAMEBATTLES.ShowFenceToRefreshSchedule()
		end
	end

	arg_28_0:RefreshVisuals(arg_28_1)
end

local function var_0_26(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = true

	if GAMEBATTLES.HasJoinedMatch(arg_30_1) then
		GAMEBATTLES.RecordTelemetryEvent(arg_30_1, GAMEBATTLES.TELEMETRY.ACTION.FORFEIT, arg_30_0:GetTelemetryData())
		MLG.GFIFIGIFH(arg_30_1)
		GAMEBATTLES.ShowMatchForfeitPopup(arg_30_1, arg_30_0.gbMatch, arg_30_2)
		GAMEBATTLES.SetLastSeenResultsMatchId(arg_30_1, arg_30_0.gbMatch.matchId)
	elseif GAMEBATTLES.IsInIntermissionInterval(arg_30_0.gbMatch) then
		var_30_0 = false
		arg_30_0.isMatchInProgress = true
	elseif GAMEBATTLES.IsMatchExpired(arg_30_1, arg_30_0.gbMatch) then
		local var_30_1 = arg_30_0.gbMatch.matchId

		LUI.FlowManager.RequestPopupMenu(arg_30_0, "MLGGamebattlesMatchExpiredPopup", false, arg_30_1, false, {
			matchID = var_30_1
		})
		GAMEBATTLES.SetLastSeenResultsMatchId(arg_30_1, var_30_1)
	else
		var_30_0 = false
	end

	if var_30_0 then
		arg_30_0:ResetMenuState(arg_30_1)

		arg_30_0:Wait(500).onComplete = function()
			arg_30_0:RefreshMatch(arg_30_1)
		end
	end
end

local function var_0_27(arg_32_0, arg_32_1)
	if Lobby.CAEJIEEEDF() == 0 then
		Lobby.CJBHJEAFGH(2)
	end

	local var_32_0 = arg_32_0.teamAlliesCountDataSource:GetValue(arg_32_1)
	local var_32_1 = arg_32_0.teamAxisCountDataSource:GetValue(arg_32_1)
	local var_32_2 = GAMEBATTLES.IsMatchInProgress(arg_32_1)
	local var_32_3 = var_32_0 == 0 and 1 or var_32_1 == 0 and 2 or nil

	if not var_32_2 and var_32_3 then
		arg_32_0:HandleMatchForfeit(arg_32_1, var_32_3)
	elseif not arg_32_0.isMatchStarting then
		GAMEBATTLES.RecordTelemetryEvent(arg_32_1, GAMEBATTLES.TELEMETRY.ACTION.MATCH_START, arg_32_0:GetTelemetryData())

		if not MLG.BFEDICDJJE(arg_32_1) then
			arg_32_0:UnsubscribeFromModel(arg_32_0.areAllPlayersCommitReadySource:GetModel(arg_32_1))
			var_0_11(arg_32_1, true)
		end

		local var_32_4 = GAMEBATTLES.HasJoinedMatch(arg_32_1)

		arg_32_0.isMatchStarting = var_32_4
		arg_32_0.isMatchInProgress = var_32_4

		MLG.DHJCBAAHII(arg_32_1)
		CODCASTER.SetCODCastingEnabled(MP_COMMON.IsMatchRulesCODCastingEnabled(true))
	end
end

local function var_0_28()
	if Dvar.IBEGCHEFE("LOLSNQLPKO") then
		local var_33_0 = Engine.IJEBHJIJF()

		if not Dvar.IBEGCHEFE("MTMMPLSRNL") and GAMEBATTLES.HasJoinedMatch(var_33_0) then
			GAMEBATTLES.LeaveGameBattleMatchLobby(var_33_0)
		end
	end

	Dvar.DHEGHJJJHI("MTMMPLSRNL", true)
	Dvar.DHEGHJJJHI("MPTLKKKQNT", false)

	if CONDITIONS.IsCoreMultiplayer() then
		MatchRules.CJGCIGEBB(1)
	end

	if Dvar.IBEGCHEFE("TQRNTTMSL") then
		RANDOM.RollForAll()
	end
end

local function var_0_29()
	WipeGlobalModelsAtPath(var_0_4)
	CODCASTER.SetCODCastingEnabled(false)

	local var_34_0 = Engine.IJEBHJIJF()
	local var_34_1 = LUI.FlowManager.GetScopedData("GameBattlesMatchLobby").matchLobby

	var_0_18(var_34_1, var_34_0)
end

local function var_0_30(arg_35_0, arg_35_1)
	Lobby.EAHFJBBBBD(PartyUIRoot.GAME_BATTLES_MATCH)
	Lobby.RefreshMLGRules(arg_35_0, arg_35_1)
	Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)
	Dvar.DHEGHJJJHI("NQORMNOQQM", false)
end

local function var_0_31(arg_36_0, arg_36_1)
	if Dvar.IBEGCHEFE("MQNNLTKNTS") == true then
		Lobby.OpenAfterActionReport(arg_36_1, false)
		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	end
end

local function var_0_32(arg_37_0, arg_37_1)
	arg_37_0.bindButton = LUI.UIBindButton.new()
	arg_37_0.bindButton.id = "selfBindButton"

	arg_37_0:addElement(arg_37_0.bindButton)
	arg_37_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_37_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 1,
		side = "left",
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	arg_37_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	arg_37_0.bindButton:addEventHandler("button_start", function(arg_38_0, arg_38_1)
		local var_38_0 = arg_38_1.controller or arg_37_1

		ACTIONS.OpenOptionsMenu(var_38_0)
		ACTIONS.PlaySoundSetSound(arg_37_0, "selectAlt", false)
	end)
	arg_37_0.bindButton:addEventHandler("button_alt2", function(arg_39_0, arg_39_1)
		FRIENDS.OpenFriendsList(arg_39_1.controller)
	end)
end

local function var_0_33(arg_40_0, arg_40_1, arg_40_2)
	Dvar.DHEGHJJJHI("LNQLRSNMQS", true)
	Dvar.DFIJDJFIFD("OOTQKOTRM", 1)
end

local function var_0_34(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_1.controller or Engine.IJEBHJIJF()

	PRIVATE_MATCH.SetupPrivateMatchTabs(arg_41_0, var_41_0, {
		firstTabName = "LUA_MENU/PLAY",
		firstTabWidget = "GameBattlesMatchLobbyPlayMenu",
		leaveMenuFunction = function(arg_42_0, arg_42_1)
			local var_42_0 = false
			local var_42_1

			if arg_41_0.gbMatch then
				var_42_1 = Engine.CCEJJCCDEG(Engine.BAHGDJFBEF(arg_41_0.gbMatch.matchTime, GAMEBATTLES.GetNoshowTime()))
			end

			local var_42_2 = GAMEBATTLES.HasJoinedMatch(arg_42_1.controller)

			if var_42_2 and var_42_1 and var_42_1 < GAMEBATTLES.GetNoBackOutTime() and not GAMEBATTLES.IsInIntermissionInterval(arg_41_0.gbMatch) then
				LUI.FlowManager.RequestPopupMenu(arg_41_0, "PopupYesNo", true, arg_42_1.controller, false, {
					yesAction = var_0_22(arg_41_0, var_41_0),
					message = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CONFIRM_BACK_OUT"),
					actionSFX = SOUND_SETS.popups.privateSelect,
					popupSFX = SOUND_SETS.popups.privatePopup
				})

				var_42_0 = true
			elseif arg_41_0.gbMatch and var_42_2 and not arg_41_0.hasLeftMatch then
				LUI.FlowManager.RequestPopupMenu(arg_41_0, "PopupYesNo", true, arg_42_1.controller, false, {
					yesAction = var_0_21(arg_41_0, arg_42_1.controller),
					message = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/LEAVE_MATCH_LOBBY"),
					actionSFX = SOUND_SETS.popups.privateSelect,
					popupSFX = SOUND_SETS.popups.privatePopup
				})

				var_42_0 = true
			else
				LUI.FlowManager.RequestPopupMenu(arg_41_0, "PopupYesNo", true, arg_42_1.controller, false, {
					yesAction = var_0_22(arg_41_0, var_41_0),
					message = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/LEAVE_MENU"),
					actionSFX = SOUND_SETS.popups.privateSelect,
					popupSFX = SOUND_SETS.popups.privatePopup
				})

				var_42_0 = true
			end

			return var_42_0
		end,
		callbackFunc = function(arg_43_0)
			local var_43_0 = arg_43_0 == 0
			local var_43_1 = arg_43_0 == 1

			arg_41_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				side = "left",
				button_ref = "button_right_trigger"
			})

			if var_43_0 then
				arg_41_0.HelperBar.ButtonHelperText:PushButtonPrompt({
					side = "left",
					button_ref = "button_right_trigger",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("MENU/GAME_BATTLES_SCHEDULE_BUTTON")
				})

				if arg_41_0.isRefreshEnabled then
					arg_41_0.HelperBar.ButtonHelperText:PushButtonPrompt({
						side = "left",
						button_ref = "button_alt1",
						priority = 4,
						helper_text = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/SCHEDULE_REFRESH")
					})
				end

				if arg_41_0.lastLobbyAnimation == GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_LEFT_MATCH then
					arg_41_0.lastLobbyAnimation = GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_NOT_JOINED
				end

				arg_41_0:dispatchEventToCurrentMenu({
					name = "update_gamebattles_timer",
					immediate = true,
					controller = var_41_0
				})
				arg_41_0:dispatchEventToCurrentMenu({
					name = "update_lobby_models",
					immediate = true,
					controller = var_41_0
				})
				arg_41_0:RefreshVisuals(var_41_0)
			else
				arg_41_0.HelperBar.ButtonHelperText:PopButtonPrompt({
					side = "left",
					button_ref = "button_alt1"
				})
			end

			if var_43_1 and CONDITIONS.IsCoreMultiplayer() then
				arg_41_0.HelperBar.ButtonHelperText:PushButtonPrompt({
					side = "left",
					button_ref = "button_right_trigger",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/CHANGE_STREAK_VALUES")
				})
			end

			Lobby.SetupReopenAAR(arg_41_0, var_41_0, var_43_0)
		end
	})
	arg_41_0:HandleCountdownStart(var_41_0)
	arg_41_0:RefreshVisuals(var_41_0)
	arg_41_0:UpdateTabBreadcrumbs(var_41_0)
end

local function var_0_35(arg_44_0, arg_44_1)
	if not GAMEBATTLES.HasJoinedMatch(arg_44_1) or arg_44_0.isRefreshEnabled then
		if arg_44_0:IsInPlayMenuWidget() then
			arg_44_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				priority = 4,
				helper_text = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/SCHEDULE_REFRESH")
			})
			arg_44_0.activeTabWidget:SetRefreshPromptVisibility(true)
		end

		arg_44_0.isRefreshEnabled = true
	end
end

local function var_0_36(arg_45_0)
	arg_45_0.HelperBar.ButtonHelperText:PopButtonPrompt({
		side = "left",
		button_ref = "button_alt1"
	})

	if arg_45_0:IsInPlayMenuWidget() then
		arg_45_0.activeTabWidget:SetRefreshPromptVisibility(false)
	end

	arg_45_0.isRefreshEnabled = false
end

local function var_0_37(arg_46_0, arg_46_1)
	if not arg_46_0.isMatchStarting and not GAMEBATTLES.AreAllPlayersReady(arg_46_1) then
		arg_46_0.isMatchButtonEnabled = true
	end
end

local function var_0_38(arg_47_0)
	arg_47_0.isMatchButtonEnabled = false
end

local function var_0_39(arg_48_0, arg_48_1)
	arg_48_0.gbMatch = GAMEBATTLES.GetFirstActiveMatch(arg_48_1)
	arg_48_0.lastLobbyAnimation = GAMEBATTLES.LOBBY_ANIMATION_STATE.HAS_NOT_JOINED
	arg_48_0.isMatchStarting = false
	arg_48_0.isMatchInProgress = false
	arg_48_0.isMatchButtonEnabled = true
	arg_48_0.hasLeftMatch = false

	if arg_48_0.gbMatch then
		local var_48_0, var_48_1, var_48_2 = GAMEBATTLES.GetMatchVictoryInfo(arg_48_0.gbMatch)
		local var_48_3 = var_48_0 + var_48_1

		arg_48_0.currentMatchId = arg_48_0.gbMatch.matchId

		if var_48_3 == 0 then
			GAMEBATTLES.SetLastResultsRound(arg_48_1, 0)
		end

		if var_48_3 < arg_48_0.gbMatch.gameCount then
			MLG.DFHFIFFCHB(var_48_3)
			GAMEBATTLES.ApplyGameSettings(arg_48_0.gbMatch.games[var_48_3 + 1], arg_48_1)
		end

		Lobby.CIIBDIGFFC(true)

		if not var_48_2 and var_48_3 > 0 and var_48_3 > GAMEBATTLES.GetLastResultsRound(arg_48_1) then
			local function var_48_4()
				GAMEBATTLES.SetLastResultsRound(arg_48_1, var_48_3)
			end

			local var_48_5 = {
				controllerIndex = arg_48_1,
				gbMatch = arg_48_0.gbMatch,
				alliesWins = var_48_0,
				axisWins = var_48_1,
				onConfirm = var_48_4
			}

			LUI.FlowManager.RequestPopupMenu(arg_48_0, "MLGGamebattlesMatchResultsPopup", false, arg_48_1, false, var_48_5)
		end
	else
		Lobby.CIIBDIGFFC(false)
	end
end

local function var_0_40(arg_50_0, arg_50_1)
	arg_50_0:DisableLobbyRefresh()

	local var_50_0 = GAMEBATTLES.GetScheduleRefreshInterval()

	arg_50_0.refreshButtonCooldown = arg_50_0:Wait(var_50_0)

	function arg_50_0.refreshButtonCooldown.onComplete()
		arg_50_0:EnableLobbyRefresh(arg_50_1)
	end
end

local function var_0_41(arg_52_0, arg_52_1)
	arg_52_0:DisableMatchButton()

	arg_52_0.refreshButtonCooldown = arg_52_0:Wait(GAMEBATTLES.MATCH_LOBBY_BUTTON_COOLDOWN)

	function arg_52_0.refreshButtonCooldown.onComplete()
		arg_52_0:EnableMatchButton(arg_52_1)
		arg_52_0:RefreshVisuals(arg_52_1)
	end
end

local function var_0_42(arg_54_0)
	local var_54_0 = arg_54_0.activeTabWidget

	return var_54_0 and var_54_0.id == "GameBattlesMatchLobbyPlayMenu" and true or false
end

local function var_0_43(arg_55_0, arg_55_1)
	if arg_55_0.isRefreshEnabled then
		GAMEBATTLES.RecordTelemetryEvent(arg_55_1, GAMEBATTLES.TELEMETRY.ACTION.REFRESH_SCHEDULE, arg_55_0:GetTelemetryData())
		GAMEBATTLES.ShowFenceToRefreshSchedule()

		if MLG.BIHFEHBCFB(arg_55_1) ~= GAMEBATTLES.INVALID_MATCH_ID then
			MLG.ResetGameBattleMatchId(arg_55_1)
		end

		arg_55_0:StartRefreshButtonCooldown(arg_55_1)
	end
end

local function var_0_44(arg_56_0, arg_56_1)
	local function var_56_0(arg_57_0, arg_57_1)
		local var_57_0 = false

		for iter_57_0, iter_57_1 in pairs(arg_57_1) do
			if LOOT.IsCategoryNew(arg_57_0, iter_57_1) then
				var_57_0 = true

				break
			end
		end

		return var_57_0
	end

	local function var_56_1(arg_58_0, arg_58_1)
		assert(arg_58_0)

		local var_58_0 = arg_56_0.Tabs:GetTabAtIndex(arg_58_0)

		if var_58_0 and var_58_0.SetBreadcrumb then
			var_58_0:SetBreadcrumb(arg_58_1)
		end
	end

	local var_56_2 = var_56_0(arg_56_1, var_0_2.NonWeaponTypes)
	local var_56_3 = #WEAPON.GetNewWeaponIDs(arg_56_1, {
		getBaseWeapon = false
	}) > 0

	arg_56_0.isWeaponTabNew = var_56_2 or var_56_3
	arg_56_0.isBarracksNew = var_56_0(arg_56_1, var_0_2.BarracksTypes)

	var_56_1(var_0_1.WEAPONS, arg_56_0.isWeaponTabNew)
	var_56_1(var_0_1.BARRACKS, arg_56_0.isBarracksNew)
end

local function var_0_45(arg_59_0)
	return {
		gbMatch = arg_59_0.gbMatch or GAMEBATTLES.JSON.NULL,
		hasLeft = arg_59_0.hasLeftMatch,
		matchStarting = arg_59_0.isMatchStarting,
		matchInProgress = arg_59_0.isMatchInProgress,
		buttonEnabled = arg_59_0.isMatchButtonEnabled,
		refreshEnabled = arg_59_0.isRefreshEnabled
	}
end

local function var_0_46(arg_60_0, arg_60_1, arg_60_2)
	assert(arg_60_0.MenuTitle)
	assert(arg_60_0.Tabs)
	assert(arg_60_0.HelperBar)

	arg_60_0.isWhitelistedForGameBattles = GAMEBATTLES.IsWhitelistedForGameBattles(arg_60_1)
	LUI.FlowManager.GetScopedData(arg_60_0).matchLobby = arg_60_0
	arg_60_0.InitializeMatchLobby = var_0_39
	arg_60_0.RefreshVisuals = var_0_23
	arg_60_0.HandleMatchStart = var_0_27
	arg_60_0.HandleMatchForfeit = var_0_26
	arg_60_0.SubscribeToMatchJoinState = var_0_12
	arg_60_0.HandleMatchLobbyButtonInput = var_0_25
	arg_60_0.EnableLobbyRefresh = var_0_35
	arg_60_0.DisableLobbyRefresh = var_0_36
	arg_60_0.StartRefreshButtonCooldown = var_0_40
	arg_60_0.HandleCountdownStart = var_0_24
	arg_60_0.IsInPlayMenuWidget = var_0_42
	arg_60_0.RefreshMatch = var_0_43
	arg_60_0.ResetMenuState = var_0_19
	arg_60_0.StartMatchButtonCooldown = var_0_41
	arg_60_0.EnableMatchButton = var_0_37
	arg_60_0.DisableMatchButton = var_0_38
	arg_60_0.SubscribeToPlayerCountChange = var_0_13
	arg_60_0.UnsubscribeFromPlayerCountChange = var_0_14
	arg_60_0.LeaveMenu = var_0_18
	arg_60_0.UpdateTabBreadcrumbs = var_0_44
	arg_60_0.GetTelemetryData = var_0_45
	arg_60_0.isRefreshEnabled = false
	arg_60_0.teamAlliesCountDataSource = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.teamAlliesCount")
	arg_60_0.teamAxisCountDataSource = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.teamAxisCount")
	arg_60_0.matchJoinStateDataSource = LUI.DataSourceInGlobalModel.new("frontEnd.mlg.matchJoinState")
	arg_60_0.areAllPlayersCommitReadySource = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areAllPlayersCommitReady")
	arg_60_0.isLocalCommitReadySource = LUI.DataSourceInGlobalModel.new("frontEnd.mlg.isLocalCommitReady")
	arg_60_0.gameInProgressDataSource = LUI.DataSourceInGlobalModel.new("frontEnd.mlg.gameInProgress")

	arg_60_0:StartRefreshButtonCooldown(arg_60_1)
	arg_60_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"))
	var_0_30(arg_60_0, arg_60_1)
	PRIVATE_MATCH.SetupPrivateMatchLobbyScene(arg_60_0, arg_60_1)
	var_0_32(arg_60_0, arg_60_1)
	var_0_31(arg_60_0, arg_60_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_60_0.TabBacker)
	arg_60_0:InitializeMatchLobby(arg_60_1)

	if not Onboarding.GameBattles.WasCompleted(arg_60_0, arg_60_1) then
		LUI.FlowManager.RequestPopupMenu(arg_60_0, "GameBattlesFirstTimePopup", false, arg_60_1, false, {
			controllerIndex = arg_60_1
		})
	end

	arg_60_0:addEventHandler("menu_create", var_0_34)
	arg_60_0:registerEventHandler("gamebattles_input_leave_lobby", function(arg_61_0, arg_61_1)
		var_0_20(arg_61_0, arg_61_1.controller)
		Engine.CIGGHDDHGJ(arg_61_1.controller, not Engine.BECCFCBIAA("gpadEnabled", arg_61_1.controller))

		return true
	end)
	arg_60_0:registerEventHandler("refresh_match", function(arg_62_0, arg_62_1)
		arg_62_0:RefreshMatch(arg_62_1.controller)

		return true
	end)
	arg_60_0:registerEventHandler("gamebattles_schedule_data_refreshed", function(arg_63_0, arg_63_1)
		GAMEBATTLES.RecordTelemetryEvent(arg_63_1.controller, GAMEBATTLES.TELEMETRY.ACTION.FENCE_CLOSED, arg_63_0:GetTelemetryData())

		local function var_63_0()
			arg_63_0:InitializeMatchLobby(arg_63_1.controller)
			arg_63_0:HandleCountdownStart(arg_63_1.controller)

			if arg_63_0:IsInPlayMenuWidget() then
				arg_63_0.activeTabWidget:InitializePlayMenu(arg_63_1.controller)
			end

			arg_63_0:RefreshVisuals(arg_63_1.controller)
		end

		local function var_63_1()
			local var_65_0 = GAMEBATTLES.GetLastCompletedMatch(arg_60_1)

			if var_65_0 then
				local var_65_1 = tonumber(var_65_0.matchId)

				if var_65_1 ~= GAMEBATTLES.GetLastSeenResultsMatchId(arg_60_1) then
					if GAMEBATTLES.HasJoinedMatch(arg_60_1) then
						arg_63_0:ResetMenuState(arg_60_1, true)
					end

					local var_65_2, var_65_3, var_65_4 = GAMEBATTLES.GetMatchVictoryInfo(var_65_0)

					if not var_65_4 then
						arg_63_0:registerEventHandler("gamebattles_match_results_popup_closed", function(arg_66_0, arg_66_1)
							local function var_66_0()
								GAMEBATTLES.SetLastSeenResultsMatchId(arg_60_1, var_65_1)
							end

							local var_66_1 = {
								isMatchEnd = true,
								controllerIndex = arg_60_1,
								gbMatch = var_65_0,
								alliesWins = var_65_2,
								axisWins = var_65_3,
								onConfirm = var_66_0
							}

							LUI.FlowManager.RequestPopupMenu(arg_66_0, "MLGGamebattlesMatchResultsPopup", false, arg_60_1, false, var_66_1)
							arg_66_0:registerEventHandler("gamebattles_match_results_popup_closed", nil)
						end)

						local var_65_5 = {
							controllerIndex = arg_60_1,
							gbMatch = var_65_0,
							alliesWins = var_65_2,
							axisWins = var_65_3
						}

						LUI.FlowManager.RequestPopupMenu(arg_63_0, "MLGGamebattlesMatchResultsPopup", false, arg_60_1, false, var_65_5)
					end
				end
			end
		end

		local function var_63_2()
			if arg_63_0.shouldAttemptJoinAfterRefresh then
				if arg_63_0.gbMatch then
					arg_63_0.isJoiningMatch = true

					arg_63_0:DisableLobbyRefresh()
					var_0_15(arg_63_0, arg_60_1)

					arg_63_0.hasLeftMatch = false
				else
					local var_68_0 = arg_63_0.currentMatchId

					LUI.FlowManager.RequestPopupMenu(arg_63_0, "MLGGamebattlesMatchExpiredPopup", false, arg_60_1, false, {
						matchID = var_68_0
					})
					GAMEBATTLES.SetLastSeenResultsMatchId(arg_60_1, var_68_0)
					arg_63_0:ResetMenuState(arg_60_1)
				end

				arg_63_0.shouldAttemptJoinAfterRefresh = false
			end
		end

		var_63_0()
		GAMEBATTLES.WaitForConditionToExecute(arg_63_0, 2000, 500, function()
			return GAMEBATTLES.GetFirstActiveMatch(arg_60_1)
		end, function()
			var_63_0()
		end, nil, function()
			var_63_2()
			var_63_1()

			if Dvar.IBEGCHEFE("NKOONQRRTM") and not arg_63_0.gbMatch and GAMEBATTLES.HasJoinedMatch(arg_60_1) then
				arg_63_0:ResetMenuState(arg_60_1, true)
			end

			arg_63_0:RefreshVisuals(arg_63_1.controller)
		end)

		return true
	end)
	arg_60_0:registerEventHandler("gamebattles_match_lobby_button_action", function(arg_72_0, arg_72_1)
		arg_72_0:HandleMatchLobbyButtonInput(arg_72_1.controller)

		return true
	end)
	arg_60_0:registerEventHandler("gamebattles_onboarding_popup_canceled", function(arg_73_0, arg_73_1)
		LUI.FlowManager.RequestLeaveMenu(arg_73_0, true, true)

		return true
	end)
	arg_60_0:SubscribeToModel(arg_60_0.gameInProgressDataSource:GetModel(arg_60_1), function(arg_74_0)
		if DataModel.JJEHAEBDF(arg_74_0) and GAMEBATTLES.HasJoinedMatch(arg_60_1) then
			arg_60_0:HandleMatchStart(arg_60_1)
		end
	end)

	local var_60_0 = Engine.DBFFAEEFGJ()

	var_60_0:SubscribeToModel(arg_60_0.areAllPlayersCommitReadySource:GetModel(arg_60_1), function(arg_75_0)
		if DataModel.JJEHAEBDF(arg_75_0) then
			var_0_6(var_60_0, arg_60_1, false)

			if not LUI.FlowManager.IsInStack("GameBattlesMatchLobby") then
				return
			end

			local var_75_0 = LUI.FlowManager.GetScopedData("GameBattlesMatchLobby").matchLobby

			var_75_0:HandleMatchStart(arg_60_1)
			var_75_0:RefreshVisuals(arg_60_1)
		end
	end)
	var_60_0:registerEventHandler("gamebattles_timer_stop", function(arg_76_0, arg_76_1)
		if not LUI.FlowManager.IsInStack("GameBattlesMatchLobby") then
			return true
		end

		local var_76_0 = LUI.FlowManager.GetScopedData("GameBattlesMatchLobby").matchLobby

		if GAMEBATTLES.IsMatchStarted(var_76_0.gbMatch) or GAMEBATTLES.AreAllPlayersReady(arg_60_1) or GAMEBATTLES.IsInIntermissionInterval(var_76_0.gbMatch) then
			var_76_0:HandleMatchStart(arg_76_1.controller)
		elseif GAMEBATTLES.IsInNoShowInterval(var_76_0.gbMatch) and var_76_0:IsInPlayMenuWidget() then
			local var_76_1 = Engine.BAHGDJFBEF(var_76_0.gbMatch.matchTime, GAMEBATTLES.GetNoshowTime())

			var_0_8(arg_76_0, arg_60_1, var_76_1)
		end

		var_76_0:RefreshVisuals(arg_76_1.controller)

		return true
	end)
	var_60_0:registerEventHandler("input_method_changed", function(arg_77_0, arg_77_1)
		if not LUI.FlowManager.IsInStack("GameBattlesMatchLobby") then
			return
		end

		if GAMEBATTLES.HasJoinedMatch(arg_60_1) then
			GAMEBATTLES.ExecutionDebounce(arg_77_0, "inputMethodChangedDebounce", GAMEBATTLES.INPUT_CHANGE_DEBOUNCE_TIME, function()
				var_0_10(arg_60_1)
			end)
		end
	end)
	var_60_0:registerEventHandler("gamebattles_social_leave_menu", function(arg_79_0, arg_79_1)
		if not LUI.FlowManager.IsInStack("GameBattlesMatchLobby") then
			return true
		end

		local var_79_0 = LUI.FlowManager.GetScopedData("GameBattlesMatchLobby").matchLobby

		var_0_18(var_79_0, arg_60_1)

		return true
	end)
	var_60_0:SubscribeToModel(arg_60_0.isLocalCommitReadySource:GetModel(arg_60_1), function(arg_80_0)
		if not DataModel.JJEHAEBDF(arg_80_0) then
			if not LUI.FlowManager.IsInStack("GameBattlesMatchLobby") then
				return
			end

			local var_80_0 = LUI.FlowManager.GetScopedData("GameBattlesMatchLobby").matchLobby

			if var_80_0 and var_80_0.isMatchStarting then
				var_80_0:RefreshMatch(arg_60_1)
			end
		end
	end)

	if Dvar.IBEGCHEFE("gamebattles_invite_leave_fix_enabled") then
		var_60_0._previousPopupMenuHandler = var_60_0.m_eventHandlers.popupmenu

		var_60_0:addEventHandler("popupmenu", function(arg_81_0, arg_81_1)
			if not LUI.FlowManager.IsInStack("GameBattlesMatchLobby") or not GAMEBATTLES.FENCES_FORCING_LEAVE_MENU[arg_81_1.menu] then
				return
			end

			local var_81_0 = LUI.FlowManager.GetScopedData("GameBattlesMatchLobby").matchLobby

			if var_81_0 and not var_81_0.isJoiningMatch then
				LUI.FlowManager.RequestLeaveMenu(var_81_0, true, true)

				local var_81_1 = Engine.DBFFAEEFGJ()

				var_81_1:registerEventHandler("popupmenu", var_81_1._previousPopupMenuHandler)
			end
		end)
	end
end

local function var_0_47(arg_82_0, arg_82_1)
	local var_82_0 = LUI.UIHorizontalNavigator.new()

	var_82_0.id = "GameBattlesMatchLobby"

	local var_82_1 = arg_82_1 and arg_82_1.controllerIndex

	if not var_82_1 and not Engine.DDJFBBJAIG() then
		var_82_1 = var_82_0:getRootController()
	end

	assert(var_82_1)
	var_0_33(var_82_0, var_82_1, arg_82_1)

	var_82_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_82_1
	})
	var_82_0.HelperBar.id = "HelperBar"

	var_82_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_82_0.HelperBar:setPriority(10)
	var_82_0:addElement(var_82_0.HelperBar)

	local var_82_2 = var_82_0
	local var_82_3
	local var_82_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_82_1
	})

	var_82_4.id = "TabBacker"

	var_82_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_82_0:addElement(var_82_4)

	var_82_0.TabBacker = var_82_4

	local var_82_5
	local var_82_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_82_1
	})

	var_82_6.id = "MenuTitle"

	var_82_6.MenuTitle:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"), 0)
	var_82_6.Line:SetLeft(0, 0)
	var_82_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_82_0:addElement(var_82_6)

	var_82_0.MenuTitle = var_82_6

	local var_82_7
	local var_82_8 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_82_1
			})
		end,
		controllerIndex = var_82_1
	}
	local var_82_9 = LUI.TabManager.new(var_82_8)

	var_82_9.id = "Tabs"

	var_82_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 996, _1080p * 108, _1080p * 160)
	var_82_0:addElement(var_82_9)

	var_82_0.Tabs = var_82_9

	local var_82_10
	local var_82_11 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_82_1
	})

	var_82_11.id = "LobbyMembersFooter"

	var_82_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_82_0:addElement(var_82_11)

	var_82_0.LobbyMembersFooter = var_82_11

	local var_82_12

	if CONDITIONS.IsUserSignedInDemonware(var_82_1) then
		local var_82_13 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_82_1
		})

		var_82_13.id = "MPPlayerDetails"

		var_82_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_82_0:addElement(var_82_13)

		var_82_0.MPPlayerDetails = var_82_13
	end

	var_0_46(var_82_0, var_82_1, arg_82_1)

	return var_82_0
end

MenuBuilder.registerType("GameBattlesMatchLobby", var_0_47)
LUI.FlowManager.RegisterStackPushBehaviour("GameBattlesMatchLobby", var_0_28)
LUI.FlowManager.RegisterStackPopBehaviour("GameBattlesMatchLobby", var_0_29)
LockTable(_M)
