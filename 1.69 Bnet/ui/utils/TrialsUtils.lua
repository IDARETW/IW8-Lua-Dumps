TRIALS = TRIALS or {}
TRIALS.ObjectiveType = {
	WAYPOINT = "hud_icon_objective_trial_waypoints",
	STOPWATCH = "hud_icon_objective_trial_time",
	TAG = "hud_icon_objective_trial_dogtag",
	BOMB = "hud_icon_objective_trial_explosion",
	TARGET = "hud_icon_objective_trial_target",
	ENEMY = "hud_icon_objective_trial_enemy"
}
TRIALS.Status = {
	FINISHED = 3,
	UNSCHEDULED = 5,
	INACTIVE = 4,
	IN_PROGRESS = 1,
	CLAIMABLE = 2
}
TRIALS.EventDvarColumns = {
	SILVER = 3,
	COUNTRY_CODE = 1,
	GOLD = 2,
	BRONZE = 4
}

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = true

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() then
		if Engine.JEDFGECDJ() > 1 then
			var_1_0 = false

			local function var_1_1()
				local var_2_0 = Lobby.KickPlayersAndGetFirstActiveControllerIndex(arg_1_1, true)

				if var_2_0 >= 0 then
					LUI.FlowManager.RequestAddMenu(arg_1_2, false, var_2_0, false, {})
				end
			end

			LUI.FlowManager.RequestPopupMenu(arg_1_0, "OpeningMenuWithSplitscreenWarning", true, arg_1_1, false, {
				yesAction = var_1_1
			})
		elseif Lobby.IsNotAloneInPrivateParty() then
			var_1_0 = false

			local function var_1_2()
				Engine.DAGFFDGFII("xstopprivateparty 0 1", arg_1_1)
				LUI.FlowManager.RequestAddMenu(arg_1_2, false, arg_1_1, false, {})
			end

			LUI.FlowManager.RequestPopupMenu(arg_1_0, "ConfirmShouldBreakupPrivateParty", true, arg_1_1, false, {
				yesAction = var_1_2
			})
		end
	end

	if var_1_0 then
		local function var_1_3()
			LUI.FlowManager.RequestAddMenu(arg_1_2, false, arg_1_1, false, {})
		end

		Lobby.TryNavigateToLobby(var_1_3)
	end
end

function TRIALS.OpenTrialsMenu(arg_5_0, arg_5_1)
	local var_5_0 = CONDITIONS.IsMagmaGameMode() and "TrialsBR" or "TrialsMP"

	var_0_0(arg_5_0, arg_5_1, var_5_0)
end

function TRIALS.OpenTrialEventMenu(arg_6_0, arg_6_1)
	local var_6_0 = CONDITIONS.IsMagmaGameMode() and "TrialEventBR" or "TrialEventMP"

	var_0_0(arg_6_0, arg_6_1, var_6_0)
end

function TRIALS.GetStatus(arg_7_0, arg_7_1)
	Trials.BHBDDIGEFJ(arg_7_0, arg_7_1)
end

function TRIALS.GetHighestEventUnlockedMedal(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	if arg_8_0 == "time" then
		if arg_8_1 <= 0 then
			return 0
		elseif arg_8_1 <= tonumber(arg_8_4) then
			return 3
		elseif arg_8_1 <= tonumber(arg_8_3) then
			return 2
		elseif arg_8_1 <= tonumber(arg_8_2) then
			return 1
		else
			return 0
		end
	elseif arg_8_1 >= tonumber(arg_8_4) then
		return 3
	elseif arg_8_1 >= tonumber(arg_8_3) then
		return 2
	elseif arg_8_1 >= tonumber(arg_8_2) then
		return 1
	else
		return 0
	end
end

function TRIALS.GetTrialsEventData(arg_9_0)
	local var_9_0 = CSV.trialEventMissionTable
	local var_9_1 = StringTable.BFHCAIIDA(var_9_0.file)
	local var_9_2 = {}
	local var_9_3 = Dvar.CFHDGABACF("NRTPTSNRNK")

	if var_9_3 == nil then
		var_9_3 = 0
	end

	for iter_9_0 = 0, var_9_1 - 1 do
		local var_9_4 = CSV.ReadRow(var_9_0, iter_9_0)

		if var_9_4.ui_previewImage ~= "" and var_9_4.ui_name ~= "" and var_9_4.ui_description ~= "" then
			var_9_4.bestScore = 0

			if var_9_4.playerDataId and var_9_4.playerDataId ~= "" then
				var_9_4.bestScore = PlayerData.BFFBGAJGD(arg_9_0, CoD.StatsGroup.Ranked).trialsBestScore[var_9_4.playerDataId]:get()
			end

			var_9_4.startTime = var_9_3 + var_9_4.startEpochTime
			var_9_4.lootIds = {
				var_9_4.tier1_loot,
				var_9_4.tier2_loot,
				var_9_4.tier3_loot
			}
			var_9_4.bestMedal = TRIALS.GetHighestEventUnlockedMedal(var_9_4.scoreType, tonumber(var_9_4.bestScore), var_9_4.tier1, var_9_4.tier2, var_9_4.tier3)
			var_9_4.bestRewardedLoot = OnlineProgression.CCIBICJFFC(arg_9_0, iter_9_0 + 1)

			table.insert(var_9_2, var_9_4)
		end
	end

	return (LUI.DeepCopy(var_9_2))
end

function TRIALS.GetSpecificTrialMissionFromEventData(arg_10_0, arg_10_1)
	local var_10_0 = CSV.trialEventMissionTable
	local var_10_1 = StringTable.BFHCAIIDA(var_10_0.file)
	local var_10_2 = Dvar.CFHDGABACF("NRTPTSNRNK")

	if var_10_2 == nil then
		var_10_2 = 0
	end

	for iter_10_0 = 0, var_10_1 - 1 do
		local var_10_3 = CSV.ReadRow(var_10_0, iter_10_0)

		if var_10_3.id == tostring(arg_10_1) then
			var_10_3.bestScore = 0

			if var_10_3.playerDataId and var_10_3.playerDataId ~= "" then
				var_10_3.bestScore = PlayerData.BFFBGAJGD(arg_10_0, CoD.StatsGroup.Ranked).trialsBestScore[var_10_3.playerDataId]:get()
			end

			var_10_3.startTime = var_10_2 + var_10_3.startEpochTime
			var_10_3.lootIds = {
				var_10_3.tier1_loot,
				var_10_3.tier2_loot,
				var_10_3.tier3_loot
			}
			var_10_3.bestMedal = TRIALS.GetHighestEventUnlockedMedal(var_10_3.scoreType, tonumber(var_10_3.bestScore), var_10_3.tier1, var_10_3.tier2, var_10_3.tier3)
			var_10_3.bestRewardedLoot = OnlineProgression.CCIBICJFFC(arg_10_0, iter_10_0 + 1)

			return (LUI.DeepCopy(var_10_3))
		end
	end

	return nil
end

function TRIALS.SetupEndTimer(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0:setEndTime(Engine.BFBIDEGDFB() + arg_11_2 * 1000)

	if arg_11_1 and arg_11_2 > 86400 then
		arg_11_0:SetCustomFormat("TRIALEVENT/EVENT_TIME_LEFT_COUNTDOWN_DAYS")
		arg_11_0:SetCustomFormatType(LUI.UICountdown.CustomFormatType.DAYHRMIN)
	else
		arg_11_0:SetCustomFormat("TRIALEVENT/EVENT_TIME_LEFT_COUNTDOWN")
		arg_11_0:SetCustomFormatType(LUI.UICountdown.CustomFormatType.HRMINSEC)
	end

	arg_11_0:useLocalizedFormat()
end

function TRIALS.SetupEndGlobalTimer(arg_12_0)
	local var_12_0 = Dvar.CFHDGABACF("MOKTSOLQMP") - tonumber(Engine.DEIDGHDBHD() or Engine.DCJHCAFIIA())
	local var_12_1 = var_12_0 > 0

	if var_12_1 then
		TRIALS.SetupEndTimer(arg_12_0, true, var_12_0)
	end

	return var_12_1
end

function TRIALS.IsLobbyStatePreventedInTrials(arg_13_0)
	return hashset({
		"waiting"
	})[arg_13_0]
end

function TRIALS.GetNextStartingTrialEventTime()
	local var_14_0 = CSV.trialEventMissionTable
	local var_14_1 = StringTable.BFHCAIIDA(var_14_0.file)
	local var_14_2 = Dvar.CFHDGABACF("NRTPTSNRNK")
	local var_14_3 = tonumber(Engine.DEIDGHDBHD() or Engine.DCJHCAFIIA())

	if var_14_2 == nil then
		var_14_2 = 0
	end

	local var_14_4

	for iter_14_0 = 0, var_14_1 - 1 do
		local var_14_5 = CSV.ReadRow(var_14_0, iter_14_0)
		local var_14_6 = var_14_2 + tonumber(var_14_5.startEpochTime)

		if var_14_3 < var_14_6 and (var_14_4 == nil or var_14_6 < var_14_4) then
			var_14_4 = var_14_6
		end
	end

	return var_14_4
end

function TRIALS.ParticipationAwardGiven(arg_15_0)
	return OnlineProgression.CCIBICJFFC(arg_15_0, 0) > 0
end

function TRIALS.GiveParticipationAward(arg_16_0)
	return OnlineProgression.CHAHIBGCEG(arg_16_0, 0, 1)
end

function TRIALS.AllGoldAwardGiven(arg_17_0)
	return OnlineProgression.CCIBICJFFC(arg_17_0, 0) > 1
end

function TRIALS.GiveAllGoldAward(arg_18_0)
	return OnlineProgression.CHAHIBGCEG(arg_18_0, 0, 2)
end

function TRIALS.GetCurrentTrialEventMapName()
	local var_19_0 = ""
	local var_19_1 = Dvar.CFHDGABACF("OLSTKPRLST")
	local var_19_2 = CSV.trialEventMissionTable
	local var_19_3 = StringTable.BFHCAIIDA(var_19_2.file)

	if var_19_1 and var_19_1 <= var_19_3 and var_19_1 > 0 then
		var_19_0 = CSV.ReadRow(CSV.trialEventMissionTable, var_19_1 - 1).ui_name
	end

	return var_19_0
end

function TRIALS.FixUpLoot(arg_20_0)
	local var_20_0 = TRIALS.GetTrialsEventData(arg_20_0)
	local var_20_1 = not TRIALS.AllGoldAwardGiven(arg_20_0)

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		if iter_20_1.bestMedal > iter_20_1.bestRewardedLoot then
			OnlineProgression.CHAHIBGCEG(arg_20_0, iter_20_0, iter_20_1.bestMedal)
		end

		var_20_1 = var_20_1 and iter_20_1.bestMedal >= 3
	end

	if var_20_1 then
		TRIALS.GiveAllGoldAward(arg_20_0)
	end
end

TRIALS.TicketID = 200005
TRIALS.ParticipationLootID = 80358
TRIALS.CompletionLootID = 775
