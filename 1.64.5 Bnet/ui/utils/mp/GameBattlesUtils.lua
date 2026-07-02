GAMEBATTLES = GAMEBATTLES or {}
GAMEBATTLES.INVALID_MATCH_ID = "0"
GAMEBATTLES.MATCH_LOBBY_BUTTON_COOLDOWN = 2000
GAMEBATTLES.INPUT_CHANGE_DEBOUNCE_TIME = 1000
GAMEBATTLES.shouldShowAllCharacters = Dvar.IBEGCHEFE("gamebattles_show_all_characters")
GAMEBATTLES.shouldShowFenceToRefreshSchedule = false
GAMEBATTLES.confirmedExpiredMatches = {}
GAMEBATTLES.expiredMatchesToConfirm = {}
GAMEBATTLES.FENCES_FORCING_LEAVE_MENU = hashset({
	"AcceptingInvite",
	"AcceptingInviteWithoutCancel"
})
GAMEBATTLES.GAMEBATTLES_LOBBY_CHARACTERS_POSITION = {
	1,
	0,
	3,
	2,
	4,
	5,
	7,
	6,
	9,
	8,
	10,
	11
}
GAMEBATTLES.MAX_LOBBY_CHARACTERS_POSITIONS = #GAMEBATTLES.GAMEBATTLES_LOBBY_CHARACTERS_POSITION
GAMEBATTLES.URL = {
	MLG_TERMS_OF_SERVICE = "https://accounts.majorleaguegaming.com/terms_of_service",
	MLG_PRIVACY_POLICY = "https://accounts.majorleaguegaming.com/privacy_policy"
}

function MLG.ResetGameBattleMatchId(arg_1_0)
	MLG.DEHBFHFDFJ(GAMEBATTLES.INVALID_MATCH_ID)
end

GAMEBATTLES.MLG_ACCOUNT_STATE = {
	ACCOUNT_ERROR = 4,
	NO_ACCOUNT = 3,
	UNAVAILABLE = 0,
	HAS_ACCOUNT = 2,
	RETRIEVING = 1
}
GAMEBATTLES.MLG_RECIPE_PRESET = {
	RECIPE_CWL = 1,
	RECIPE_MAX = 3,
	RECIPE_GB = 2,
	RECIPE_DEFAULT = 0
}
GAMEBATTLES.MLG_INPUT_TYPE_PRESET = {
	KBM = 0,
	GPad = 1,
	KBM_GPad = 2
}
GAMEBATTLES.MLG_SCHEDULE_STATE = {
	AVAILABLE = 2,
	RETRIEVAL_ERROR = 3,
	RETRIEVING = 1,
	UNAVAILABLE = 0
}
GAMEBATTLES.MLG_CODE_STATE = {
	AVAILABLE = 2,
	RETRIEVAL_ERROR = 3,
	RETRIEVING = 1,
	UNAVAILABLE = 0
}
GAMEBATTLES.MLG_ERR_CODE = {
	MATCH_HISTORY_RETRIEVAL_ERROR = 3,
	NO_SOCIAL_PRIVILEGES = 4,
	FIRST_TIME_ENTRY = 2,
	USER_NOT_REGISTERED = 1,
	CANNOT_CONNECT = 0
}
GAMEBATTLES.MLG_REPORT_STATE = {
	SEND_SUCCESS = 3,
	IDLE = 0,
	SEND_ERROR = 4,
	DS_SENDING = 2,
	SENDING = 1
}
GAMEBATTLES.MLG_GAME_STATUS = {
	WON_AWAY = 2,
	UNPLAYED = 0,
	WON_HOME = 1,
	NO_SHOW = 3
}
GAMEBATTLES.MLG_MATCH_JOIN_STATE = {
	JOIN_ERROR = 4,
	CANT_HOST = 5,
	IDLE = 0,
	CLIENT = 3,
	TRY_CREATE = 1,
	HOST = 2
}
GAMEBATTLES.MLG_MATCH_CHECK_STATE = {
	MATCH_EXPIRED = 2,
	CHECK_IN_PROGRESS = 1,
	FAILED = 0,
	MATCH_VALID = 3
}
GAMEBATTLES.MLG_MATCH_HISTORY_STATE = {
	AVAILABLE = 2,
	RETRIEVAL_ERROR = 3,
	RETRIEVING = 1,
	UNAVAILABLE = 0
}
GAMEBATTLES.LOBBY_ANIMATION_STATE = {
	HAS_LEFT_MATCH = 2,
	HAS_NOT_JOINED = 0,
	HAS_JOINED = 1
}
GAMEBATTLES.TELEMETRY = {}
GAMEBATTLES.TELEMETRY.ACTION = {
	REFRESH_SCHEDULE = "refresh_schedule",
	MATCH_START = "match_start",
	LEAVE_MATCH = "leave_match",
	JOIN_MATCH = "join_match",
	LEAVE_MENU = "leave_menu",
	FENCE_CLOSED = "fence_close",
	FORFEIT = "forfeit"
}

function GAMEBATTLES.ApplyGameSettings(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.gametype

	Dvar.BDEHAEGHAF("MOLPOSLOMO", var_2_0)

	local var_2_1 = arg_2_0.map

	Dvar.BDEHAEGHAF("NSQLTTMRMP", var_2_1)
	MLG.DHDGADDDII(arg_2_1)
end

function GAMEBATTLES.GetCodcastersCount(arg_3_0)
	assert(arg_3_0 ~= nil)

	return arg_3_0.totalPlayerCount - (arg_3_0.teams[1].playerCount + arg_3_0.teams[2].playerCount)
end

function GAMEBATTLES.GetNoshowTime()
	local var_4_0 = Dvar.CFHDGABACF("NTNOSQRROL")

	if var_4_0 ~= nil and var_4_0 ~= 0 then
		return var_4_0
	end

	return 600
end

function GAMEBATTLES.GetNoBackOutTime()
	return 30
end

function GAMEBATTLES.GetIntermissionTime()
	local var_6_0 = Dvar.CFHDGABACF("NRMTLLNQKR")

	if var_6_0 ~= nil and var_6_0 ~= 0 then
		return var_6_0
	end

	return 300
end

function GAMEBATTLES.GetScheduleRefreshInterval()
	return Dvar.CFHDGABACF("NRNNMRTSMP") * 1000
end

function GAMEBATTLES.SetScheduleRefreshInterval(arg_8_0)
	Dvar.DFIJDJFIFD("NRNNMRTSMP", arg_8_0 / 1000)
end

function GAMEBATTLES.GetMatchHistoryRefreshInterval()
	return Dvar.CFHDGABACF("LRTRNSRPML") * 1000
end

function GAMEBATTLES.SetMatchHistoryRefreshInterval(arg_10_0)
	Dvar.DFIJDJFIFD("LRTRNSRPML", arg_10_0 / 1000)
end

function GAMEBATTLES.GetMatchProgressInfo(arg_11_0)
	local var_11_0 = GAMEBATTLES.GetSecondsUntilNoShow(arg_11_0) <= 0
	local var_11_1 = false
	local var_11_2, var_11_3, var_11_4 = GAMEBATTLES.GetMatchVictoryInfo(arg_11_0)

	if var_11_2 ~= 0 or var_11_3 ~= 0 then
		var_11_0 = true

		local var_11_5 = arg_11_0.gameCount / 2

		if var_11_5 < var_11_2 or var_11_5 < var_11_3 then
			var_11_1 = true
		end
	end

	return var_11_0, var_11_1 or var_11_4
end

function GAMEBATTLES.GetMatchVictoryInfo(arg_12_0)
	local var_12_0 = 0
	local var_12_1 = 0
	local var_12_2 = false

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.games) do
		if iter_12_1.status == GAMEBATTLES.MLG_GAME_STATUS.WON_AWAY then
			var_12_0 = var_12_0 + 1
		elseif iter_12_1.status == GAMEBATTLES.MLG_GAME_STATUS.WON_HOME then
			var_12_1 = var_12_1 + 1
		elseif iter_12_1.status == GAMEBATTLES.MLG_GAME_STATUS.NO_SHOW then
			var_12_2 = true
		end
	end

	return var_12_0, var_12_1, var_12_2
end

function GAMEBATTLES.GetFirstActiveMatch(arg_13_0)
	local var_13_0 = MLG.DFJDECFDHI(arg_13_0)

	for iter_13_0 = 0, var_13_0 - 1 do
		local var_13_1 = MLG.EBJFHEJBC(arg_13_0, iter_13_0)
		local var_13_2, var_13_3 = GAMEBATTLES.GetMatchProgressInfo(var_13_1)

		if not var_13_3 and not GAMEBATTLES.IsMatchExpired(arg_13_0, var_13_1) then
			return var_13_1
		end
	end

	return nil
end

function GAMEBATTLES.GetLastCompletedMatch(arg_14_0)
	for iter_14_0 = MLG.DFJDECFDHI(arg_14_0) - 1, 0, -1 do
		local var_14_0 = MLG.EBJFHEJBC(arg_14_0, iter_14_0)
		local var_14_1, var_14_2 = GAMEBATTLES.GetMatchProgressInfo(var_14_0)

		if var_14_2 then
			return var_14_0
		end
	end

	return nil
end

function GAMEBATTLES.GetMatchByMatchID(arg_15_0, arg_15_1)
	local var_15_0 = MLG.DFJDECFDHI(arg_15_0)

	for iter_15_0 = 0, var_15_0 - 1 do
		local var_15_1 = MLG.EBJFHEJBC(arg_15_0, iter_15_0)

		if var_15_1.matchId == arg_15_1 then
			return var_15_1
		end
	end

	return nil
end

function GAMEBATTLES.GetCurrentMatch(arg_16_0)
	if MLG.DEFJAJGIJH(arg_16_0) ~= GAMEBATTLES.MLG_SCHEDULE_STATE.AVAILABLE then
		return nil
	end

	local var_16_0 = MLG.DBHIJDDIFH(arg_16_0)

	if var_16_0 < 0 then
		return nil
	end

	return (MLG.EBJFHEJBC(arg_16_0, var_16_0))
end

function GAMEBATTLES.IsCurrentMatchCompleted(arg_17_0)
	local var_17_0 = GAMEBATTLES.GetCurrentMatch(arg_17_0)

	if var_17_0 ~= nil then
		local var_17_1, var_17_2 = GAMEBATTLES.GetMatchProgressInfo(var_17_0)

		return var_17_2
	end

	return false
end

function GAMEBATTLES.IsMatchExpired(arg_18_0, arg_18_1)
	if not (GAMEBATTLES.GetSecondsUntilNoShow(arg_18_1) <= 0) then
		return false
	end

	local var_18_0 = arg_18_1.matchId

	if MLG.BIHFEHBCFB(arg_18_0) == var_18_0 and GAMEBATTLES.HasJoinedMatch(arg_18_0) then
		return false
	end

	for iter_18_0, iter_18_1 in ipairs(arg_18_1.games) do
		if iter_18_1.status ~= GAMEBATTLES.MLG_GAME_STATUS.UNPLAYED then
			return false
		end
	end

	if Dvar.IBEGCHEFE("OLTPPRMMKT") then
		local var_18_1 = GAMEBATTLES.confirmedExpiredMatches[var_18_0]

		if var_18_1 ~= nil then
			return var_18_1
		else
			GAMEBATTLES.expiredMatchesToConfirm[var_18_0] = true
		end
	end

	return true
end

function GAMEBATTLES.ShowMatchForfeitPopup(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_2 == 1 and 2 or 1
	local var_19_1 = {
		currentDateTime = Engine.BEDAHJJBFJ(),
		forfeitTeamName = arg_19_1.teams[var_19_0].teamName,
		forfeitTeamId = arg_19_1.teams[var_19_0].teamId,
		winningTeamName = arg_19_1.teams[arg_19_2].teamName,
		winningTeamId = arg_19_1.teams[arg_19_2].teamId,
		matchID = arg_19_1.matchId
	}

	LUI.FlowManager.RequestPopupMenu(self, "MLGGamebattlesMatchForfeitPopup", false, arg_19_0, false, var_19_1)
end

function GAMEBATTLES.GetClientCharacterData(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = {}
	local var_20_1 = {}
	local var_20_2 = {}
	local var_20_3 = {}
	local var_20_4 = GAMEBATTLES.shouldShowAllCharacters

	if arg_20_3 > 0 then
		local var_20_5 = arg_20_2 == 1 and OPERATOR.SuperFaction.EAST or OPERATOR.SuperFaction.WEST

		for iter_20_0 = 0, arg_20_3 - 1 do
			local var_20_6 = arg_20_1:GetDataSourceAtIndex(iter_20_0, arg_20_0)
			local var_20_7 = var_20_6.isPlaceHolderPlayer:GetValue(arg_20_0)

			if var_20_6 and not var_20_7 or var_20_4 then
				local var_20_8 = var_20_6.memberIndex:GetValue(arg_20_0)

				if var_20_4 then
					var_20_8 = arg_20_2 == 1 and iter_20_0 or GAMEBATTLES.MAX_LOBBY_CHARACTERS_POSITIONS / 2 + iter_20_0
				end

				local var_20_9 = arg_20_2 == 1 and "default_eastern" or "default_western"
				local var_20_10, var_20_11 = OPERATOR.GetWeaponClassDefaultOperatorSkin(arg_20_0, var_20_9)
				local var_20_12 = WEAPON.GetWeaponModelNameFromRef(WEAPON.DefaultPrimary, {
					includeStickers = true,
					includeCamos = true,
					includeAttachments = true
				})
				local var_20_13 = WEAPON.GetWeaponModelNameFromRef(WEAPON.DefaultSecondary, {
					includeStickers = true,
					includeCamos = true,
					includeAttachments = true
				})

				table.insert(var_20_1, var_20_11)
				table.insert(var_20_2, var_20_10)
				table.insert(var_20_3, var_20_12)
				table.insert(var_20_3, var_20_13)
				table.insert(var_20_0, {
					memberIndex = var_20_8,
					primaryWeaponModel = var_20_12,
					secondaryWeaponModel = var_20_13,
					bodyModel = var_20_11,
					headModel = var_20_10,
					superfactionIndex = var_20_5
				})
			end
		end
	end

	return var_20_0, var_20_1, var_20_2, var_20_3
end

function GAMEBATTLES.RequestClientCharacterData(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0 then
		FrontEndScene.RequestBodyModels(arg_21_0)
	end

	if arg_21_1 then
		FrontEndScene.RequestHeadModels(arg_21_1)
	end

	if arg_21_2 then
		FrontEndScene.RequestWeaponWorldModels(arg_21_2)
	end
end

function GAMEBATTLES.UpdateClientCharacters(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	for iter_22_0, iter_22_1 in ipairs(arg_22_1) do
		for iter_22_2, iter_22_3 in ipairs(iter_22_1) do
			local var_22_0 = iter_22_3.memberIndex + 1
			local var_22_1 = arg_22_3[var_22_0]
			local var_22_2 = iter_22_3.bodyModel
			local var_22_3 = iter_22_3.headModel
			local var_22_4 = iter_22_3.primaryWeaponModel
			local var_22_5 = iter_22_3.secondaryWeaponModel
			local var_22_6 = Lobby.GetWalkAnimationForIndex(var_22_2, var_22_3, var_22_0, var_22_4)
			local var_22_7 = {
				showCharacter = true,
				operatorPose = var_22_6,
				element = arg_22_2,
				weaponModel = var_22_4,
				secondaryModel = var_22_5
			}

			OPERATOR.UpdateClientCharacter(var_22_1, var_22_2, var_22_3, var_22_7)
			FrontEndScene.SetCharacterVisible(var_22_1, true)
		end
	end
end

function GAMEBATTLES.HasJoinedMatch(arg_23_0)
	local var_23_0 = MLG.CIGIDJACJB(arg_23_0)

	return var_23_0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.HOST or var_23_0 == GAMEBATTLES.MLG_MATCH_JOIN_STATE.CLIENT
end

function GAMEBATTLES.IsMatchAvailable(arg_24_0)
	return MLG.DEFJAJGIJH(arg_24_0) == GAMEBATTLES.MLG_SCHEDULE_STATE.AVAILABLE
end

function GAMEBATTLES.GetSecondsUntilNoShow(arg_25_0)
	local var_25_0

	if arg_25_0 then
		var_25_0 = Engine.CCEJJCCDEG(Engine.BAHGDJFBEF(arg_25_0.matchTime, GAMEBATTLES.GetNoshowTime()))
	end

	return var_25_0
end

function GAMEBATTLES.IsMatchStarted(arg_26_0)
	local var_26_0 = false

	if arg_26_0 then
		local var_26_1, var_26_2 = GAMEBATTLES.GetMatchProgressInfo(arg_26_0)

		var_26_0 = var_26_1
	end

	return var_26_0
end

function GAMEBATTLES.IsMatchInProgress(arg_27_0)
	if LUI.DataSourceInGlobalModel.new("frontEnd.mlg.gameInProgress"):GetValue(arg_27_0) then
		return true
	end

	return false
end

function GAMEBATTLES.IsInNoShowInterval(arg_28_0)
	local var_28_0 = false

	if arg_28_0 then
		local var_28_1 = Engine.CCEJJCCDEG(arg_28_0.matchTime)
		local var_28_2 = GAMEBATTLES.GetSecondsUntilNoShow(arg_28_0)

		var_28_0 = var_28_1 <= 0 and var_28_2 > 0
	end

	return var_28_0
end

function GAMEBATTLES.IsInIntermissionInterval(arg_29_0)
	if arg_29_0 then
		local var_29_0, var_29_1 = GAMEBATTLES.GetMatchProgressInfo(arg_29_0)
		local var_29_2, var_29_3, var_29_4 = GAMEBATTLES.GetMatchVictoryInfo(arg_29_0)
		local var_29_5 = var_29_2 + var_29_3

		return var_29_0 and not var_29_1 and var_29_5 > 0
	end

	return false
end

function GAMEBATTLES.IsWhitelistedForGameBattles(arg_30_0)
	return MLG.BGGFEEDBGA(arg_30_0)
end

function GAMEBATTLES.AreAllPlayersReady(arg_31_0)
	return LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areAllPlayersCommitReady"):GetValue(arg_31_0) or false
end

function GAMEBATTLES.HandleInputTypeSelected(arg_32_0, arg_32_1)
	local var_32_0 = Engine.BECCFCBIAA("gpadEnabled", arg_32_1)
	local var_32_1 = var_32_0 and GAMEBATTLES.MLG_INPUT_TYPE_PRESET.GPad or GAMEBATTLES.MLG_INPUT_TYPE_PRESET.KBM

	if arg_32_0 == GAMEBATTLES.MLG_INPUT_TYPE_PRESET.KBM_GPad then
		return true
	elseif arg_32_0 == var_32_1 then
		Dvar.DHEGHJJJHI("MQMQRMLRQP", true)
		Dvar.DHEGHJJJHI("NNPMRQSQN", false)

		return true
	elseif OPTIONS.DualInputConnected(arg_32_1) then
		Dvar.DHEGHJJJHI("MQMQRMLRQP", true)
		Dvar.DHEGHJJJHI("NNPMRQSQN", false)
		Engine.CIGGHDDHGJ(arg_32_1, not var_32_0)

		return true
	else
		LUI.FlowManager.RequestPopupMenu(self, "PopupOK", true, arg_32_1, false, {
			message = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/POPUP_PLUG_INPUT")
		})

		return false
	end
end

function GAMEBATTLES.LeaveGameBattleMatchLobby(arg_33_0)
	MLG.JAIGJGGF(arg_33_0)
end

function GAMEBATTLES.LeaveGameBattlesMenu(arg_34_0)
	if not LUI.FlowManager.IsInStack("GameBattlesMatchLobby") then
		return
	end

	LUI.FlowManager.GetScopedData("GameBattlesMatchLobby").matchLobby:LeaveMenu(arg_34_0)
end

function GAMEBATTLES.SetLastSeenResultsMatchId(arg_35_0, arg_35_1)
	if arg_35_1 then
		PlayerData.BFFBGAJGD(arg_35_0, CoD.StatsGroup.NonGame).gamebattlesResultsMatchId:set(arg_35_1)
	end
end

function GAMEBATTLES.GetLastSeenResultsMatchId(arg_36_0)
	return PlayerData.BFFBGAJGD(arg_36_0, CoD.StatsGroup.NonGame).gamebattlesResultsMatchId:get() or 0
end

function GAMEBATTLES.SetLastResultsRound(arg_37_0, arg_37_1)
	if arg_37_1 then
		PlayerData.BFFBGAJGD(arg_37_0, CoD.StatsGroup.NonGame).gamebattlesResultsRound:set(arg_37_1)
	end
end

function GAMEBATTLES.GetLastResultsRound(arg_38_0)
	return PlayerData.BFFBGAJGD(arg_38_0, CoD.StatsGroup.NonGame).gamebattlesResultsRound:get() or 0
end

function GAMEBATTLES.ExecutionDebounce(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	if arg_39_0[arg_39_1] then
		arg_39_0[arg_39_1].onComplete = function()
			return
		end
		arg_39_0[arg_39_1] = nil
	end

	arg_39_0[arg_39_1] = arg_39_0:Wait(arg_39_2)
	arg_39_0[arg_39_1].onComplete = function()
		arg_39_3()

		arg_39_0[arg_39_1] = nil
	end
end

function GAMEBATTLES.ExecutionCooldown(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	if arg_42_0[arg_42_1] then
		return false
	end

	arg_42_3()

	arg_42_0[arg_42_1] = arg_42_0:Wait(arg_42_2)
	arg_42_0[arg_42_1].onComplete = function()
		arg_42_0[arg_42_1] = nil
	end

	return true
end

function GAMEBATTLES.ShowFenceToRefreshSchedule()
	GAMEBATTLES.ResetConfirmedExpiredMatches()

	GAMEBATTLES.shouldShowFenceToRefreshSchedule = true
end

function GAMEBATTLES.WaitForConditionToExecute(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4, arg_45_5, arg_45_6)
	local var_45_0 = Engine.BFBIDEGDFB()

	local function var_45_1()
		if arg_45_6 then
			arg_45_6()
		end
	end

	local var_45_2

	local function var_45_3()
		if Engine.BFBIDEGDFB() - var_45_0 > arg_45_1 then
			if arg_45_5 then
				arg_45_5()
			end

			var_45_1()
		elseif arg_45_3() then
			arg_45_4()
			var_45_1()
		else
			arg_45_0:Wait(arg_45_2).onComplete = var_45_3
		end
	end

	var_45_3()
end

function GAMEBATTLES.RemoveSubscriptions(arg_48_0)
	local var_48_0 = Engine.DBFFAEEFGJ()
	local var_48_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areAllPlayersCommitReady")
	local var_48_2 = LUI.DataSourceInGlobalModel.new("frontEnd.mlg.isLocalCommitReady")

	var_48_0:UnsubscribeFromModel(var_48_1:GetModel(arg_48_0))
	var_48_0:UnsubscribeFromModel(var_48_2:GetModel(arg_48_0))
	var_48_0:registerEventHandler("gamebattles_timer_stop", nil)
	var_48_0:registerEventHandler("input_method_changed", nil)
	var_48_0:registerEventHandler("gamebattles_social_leave_menu", nil)
	var_48_0:registerEventHandler("update_gamebattles_timer", nil)

	if var_48_0.gamebattlesTimer then
		var_48_0.gamebattlesTimer:closeTree()

		var_48_0.gamebattlesTimer = nil
	end
end

GAMEBATTLES.JSON = {}
GAMEBATTLES.JSON.NULL = {}

function GAMEBATTLES.JSON.Stringify(arg_49_0)
	local var_49_0 = {}
	local var_49_1
	local var_49_2
	local var_49_3 = false
	local var_49_4 = #arg_49_0 == 0
	local var_49_6

	if var_49_4 then
		local var_49_5 = CountTableKeys(arg_49_0)

		var_49_1 = "{"
		var_49_6 = "}"
	else
		var_49_1 = "["
		var_49_6 = "]"
	end

	table.insert(var_49_0, var_49_1)

	for iter_49_0, iter_49_1 in pairs(arg_49_0) do
		local var_49_7 = type(iter_49_1)
		local var_49_8 = var_49_4 and "\"" .. iter_49_0 .. "\":" or nil
		local var_49_9

		if iter_49_1 == GAMEBATTLES.JSON.NULL then
			var_49_9 = "null"
		elseif var_49_7 == "table" then
			var_49_9 = GAMEBATTLES.JSON.Stringify(iter_49_1)
		elseif var_49_7 == "string" then
			var_49_9 = "\"" .. iter_49_1 .. "\""
		elseif var_49_7 == "number" or var_49_7 == "boolean" then
			var_49_9 = tostring(iter_49_1)
		end

		if var_49_9 then
			var_49_3 = true

			table.insert(var_49_0, var_49_8)
			table.insert(var_49_0, var_49_9)
			table.insert(var_49_0, ",")
		end
	end

	if var_49_3 then
		table.remove(var_49_0, #var_49_0)
	end

	table.insert(var_49_0, var_49_6)

	return table.concat(var_49_0)
end

function GAMEBATTLES.RecordTelemetryEvent(arg_50_0, arg_50_1, arg_50_2)
	if Dvar.IBEGCHEFE("OKRQOSSLTM") then
		local var_50_0 = arg_50_2 and GAMEBATTLES.JSON.Stringify(arg_50_2) or ""

		MLG.CHHGCCAEHH(arg_50_0, arg_50_1, var_50_0)
	end
end

function GAMEBATTLES.ResetConfirmedExpiredMatches()
	GAMEBATTLES.confirmedExpiredMatches = {}
end
