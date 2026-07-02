CP = CP or {}
CP.TeamMaxSize = 4
CP.CheckpointResetStartUTC = 1582826688
CP.CheckpointResetPeriodUTC = 305
CP.SortCPScoreboard = {
	BY_SCORE = 0,
	BY_CURRENCY = 1,
	BY_CLIENT_NUM = 2
}
CP.IntelCategories = {
	MYMODES = "MyModes",
	CWL = "Cwl",
	STANDARD = "Standard",
	ALTERNATE = "Alternate",
	LARGE = "Large"
}
CP.SPEC_OPS = "cp_survival"
CP.WAVE_SURVIVAL = "cp_wave_sv"
CP.CLASSIC_MISSIONS = "cp_specops"
CP.REAPER_AMMO_MAX = 2
CP.SCOREBOARD_COLUMN_WIDTH = 108 * _1080p

function CP.ClearAllPickupMunitions(arg_1_0)
	local var_1_0 = PlayerData.BFFBGAJGD(arg_1_0, CoD.StatsGroup.Coop).alienSession.escapedRank0:get()
	local var_1_1 = PlayerData.BFFBGAJGD(arg_1_0, CoD.StatsGroup.Coop).alienSession.escapedRank1:get()
	local var_1_2 = PlayerData.BFFBGAJGD(arg_1_0, CoD.StatsGroup.Coop).alienSession.escapedRank2:get()

	if var_1_0 == 1 then
		PlayerData.BFFBGAJGD(arg_1_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[0].munition:set("empty1")
		PlayerData.BFFBGAJGD(arg_1_0, CoD.StatsGroup.Coop).alienSession.escapedRank0:set(0)
	end

	if var_1_1 == 1 then
		PlayerData.BFFBGAJGD(arg_1_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[1].munition:set("empty2")
		PlayerData.BFFBGAJGD(arg_1_0, CoD.StatsGroup.Coop).alienSession.escapedRank1:set(0)
	end

	if var_1_2 == 1 then
		PlayerData.BFFBGAJGD(arg_1_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[2].munition:set("empty3")
		PlayerData.BFFBGAJGD(arg_1_0, CoD.StatsGroup.Coop).alienSession.escapedRank2:set(0)
	end
end

function CP.ClearAllPickupMunitionsInGame(arg_2_0)
	local var_2_0 = PlayerData.BFFBGAJGD(arg_2_0, CoD.StatsGroup.Coop).alienSession.escapedRank0:get()
	local var_2_1 = PlayerData.BFFBGAJGD(arg_2_0, CoD.StatsGroup.Coop).alienSession.escapedRank1:get()
	local var_2_2 = PlayerData.BFFBGAJGD(arg_2_0, CoD.StatsGroup.Coop).alienSession.escapedRank2:get()

	if var_2_0 == 1 then
		PlayerData.BFFBGAJGD(arg_2_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[0].munition:set("empty1")
	end

	if var_2_1 == 1 then
		PlayerData.BFFBGAJGD(arg_2_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[1].munition:set("empty2")
	end

	if var_2_2 == 1 then
		PlayerData.BFFBGAJGD(arg_2_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[2].munition:set("empty3")
	end
end

function CP.ClearPickupMunitionSlot(arg_3_0, arg_3_1)
	local var_3_0

	if arg_3_1 == 0 then
		var_3_0 = PlayerData.BFFBGAJGD(arg_3_0, CoD.StatsGroup.Coop).alienSession.escapedRank0:get()
	elseif arg_3_1 == 1 then
		var_3_0 = PlayerData.BFFBGAJGD(arg_3_0, CoD.StatsGroup.Coop).alienSession.escapedRank1:get()
	elseif arg_3_1 == 2 then
		var_3_0 = PlayerData.BFFBGAJGD(arg_3_0, CoD.StatsGroup.Coop).alienSession.escapedRank2:get()
	end

	if var_3_0 == 1 and arg_3_1 == 0 then
		PlayerData.BFFBGAJGD(arg_3_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[0].munition:set("empty1")
		PlayerData.BFFBGAJGD(arg_3_0, CoD.StatsGroup.Coop).alienSession.escapedRank0:set(0)
	end

	if var_3_0 == 1 and arg_3_1 == 1 then
		PlayerData.BFFBGAJGD(arg_3_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[1].munition:set("empty2")
		PlayerData.BFFBGAJGD(arg_3_0, CoD.StatsGroup.Coop).alienSession.escapedRank1:set(0)
	end

	if var_3_0 == 1 and arg_3_1 == 2 then
		PlayerData.BFFBGAJGD(arg_3_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionSetups[2].munition:set("empty3")
		PlayerData.BFFBGAJGD(arg_3_0, CoD.StatsGroup.Coop).alienSession.escapedRank2:set(0)
	end
end

function CP.ClearWaveLoadout(arg_4_0, arg_4_1)
	local var_4_0 = PlayerData.BFFBGAJGD(arg_4_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadoutWaveMode

	var_4_0.loadoutPerks[0]:set("specialty_null")
	var_4_0.loadoutPerks[1]:set("specialty_null")
	var_4_0.loadoutPerks[2]:set("specialty_null")
	var_4_0.weaponSetups[0].attachmentSetup[0].attachment:set("none")
	var_4_0.weaponSetups[0].attachmentSetup[1].attachment:set("none")
	var_4_0.weaponSetups[0].attachmentSetup[2].attachment:set("none")
	var_4_0.weaponSetups[0].attachmentSetup[3].attachment:set("none")
	var_4_0.weaponSetups[0].attachmentSetup[4].attachment:set("none")
	var_4_0.weaponSetups[1].attachmentSetup[0].attachment:set("none")
	var_4_0.weaponSetups[1].attachmentSetup[1].attachment:set("none")
	var_4_0.weaponSetups[1].attachmentSetup[2].attachment:set("none")
	var_4_0.weaponSetups[1].attachmentSetup[3].attachment:set("none")
	var_4_0.weaponSetups[1].attachmentSetup[4].attachment:set("none")
	PlayerData.BFFBGAJGD(arg_4_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionWaveModeSetups[0].munition:set("empty1")
	PlayerData.BFFBGAJGD(arg_4_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionWaveModeSetups[1].munition:set("empty2")
	PlayerData.BFFBGAJGD(arg_4_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.munitionWaveModeSetups[2].munition:set("empty3")

	if arg_4_1 == nil then
		PlayerData.BFFBGAJGD(arg_4_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.currencyWaveMode:set(0)
		var_4_0.equipmentSetups[0].equipment:set("equip_frag")
		var_4_0.equipmentSetups[1].equipment:set("equip_flash")
		WEAPON.EquipBaseWeapon(var_4_0.weaponSetups[0], "iw8_pi_golf21")
		WEAPON.EquipBaseWeapon(var_4_0.weaponSetups[1], "iw8_pi_golf21")
		WEAPON.EquipBaseWeapon(var_4_0.weaponSetups[2], "none")
	end
end

function CP.ClearEquipmentPrimary(arg_5_0)
	PlayerData.BFFBGAJGD(arg_5_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadoutWaveMode.equipmentSetups[0].equipment:set("none")
end

function CP.ClearEquipmentSecondary(arg_6_0)
	PlayerData.BFFBGAJGD(arg_6_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadoutWaveMode.equipmentSetups[1].equipment:set("none")
end

function CP.UpdateWeaponsFromScript(arg_7_0)
	local var_7_0 = PlayerData.BFFBGAJGD(arg_7_0, CoD.StatsGroup.Coop).waveSurvivalWeapon[0]:get()
	local var_7_1 = PlayerData.BFFBGAJGD(arg_7_0, CoD.StatsGroup.Coop).waveSurvivalWeapon[1]:get()
	local var_7_2 = PlayerData.BFFBGAJGD(arg_7_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadoutWaveMode

	WEAPON.EquipBaseWeapon(var_7_2.weaponSetups[0], var_7_0)
	WEAPON.EquipBaseWeapon(var_7_2.weaponSetups[1], var_7_1)
end

function CP.UpdateCurrencyFromScript(arg_8_0)
	PlayerData.BFFBGAJGD(arg_8_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.currencyWaveMode:set(CP.ScriptCurrencyGet(arg_8_0))
end

function CP.GetAttachmentSurvivalCost(arg_9_0)
	local var_9_0

	return arg_9_0 == "optic" and 1000 or arg_9_0 == "muzzle" and 500 or arg_9_0 == "undermount" and 800 or arg_9_0 == "gunperk" and 1000 or arg_9_0 == "magazine" and 1250 or arg_9_0 == "extra" and 600 or arg_9_0 == "backpiece" and 500 or arg_9_0 == "unique" and 500 or arg_9_0 == "reargrip" and 900 or arg_9_0 == "trigger" and 700 or arg_9_0 == "guard" and 850 or arg_9_0 == "pump" and 1100 or 1000
end

function CP.GetMapsDataSources(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = Lobby.GetCurrentGameType()
	local var_10_1 = {}

	for iter_10_0 = 0, Lobby.DEFCCIGHCF() - 1 do
		local var_10_2 = Lobby.CJEHDHDGBH(iter_10_0)

		if PRIVATE_MATCH.ShouldDisplayMap(iter_10_0, arg_10_1) and PRIVATE_MATCH.MapSupportsCustomGames(var_10_2) then
			local var_10_3 = Lobby.CBEIEIFCEF(iter_10_0)
			local var_10_4 = {
				name = Lobby.CAAHCDGEDH(iter_10_0),
				ref = var_10_2,
				desc = Lobby.BGCBFAABHB(iter_10_0),
				image = Lobby.EAJBIDDDGF(iter_10_0),
				isOwned = Engine.BAJHDFAJJF(var_10_3)
			}
			local var_10_5 = Lobby.GetGameTypesTableForMapIndex(iter_10_0)

			if var_10_0 and var_10_5[var_10_0] then
				table.insert(var_10_1, var_10_4)
			end
		end
	end

	table.sort(var_10_1, function(arg_11_0, arg_11_1)
		if arg_11_0.name ~= arg_11_1.name then
			return arg_11_0.name < arg_11_1.name
		end
	end)

	if CONDITIONS.IsWeGameGovBanned() then
		var_10_1 = WeGame.WhitelistGameMaps(var_10_1)
	end

	local var_10_6 = LUI.DataSourceFromList.new(#var_10_1)

	function var_10_6.MakeDataSourceAtIndex(arg_12_0, arg_12_1)
		local var_12_0 = arg_10_0 .. ".map." .. arg_12_1 + 1
		local var_12_1 = var_10_1[arg_12_1 + 1]
		local var_12_2 = LUI.DataSourceInGlobalModel.new(var_12_0 .. ".isOwned")

		var_12_2:SetValue(arg_10_1, var_12_1.isOwned)

		return {
			name = LUI.DataSourceInGlobalModel.new(var_12_0 .. ".name", var_12_1.name),
			desc = LUI.DataSourceInGlobalModel.new(var_12_0 .. ".desc", var_12_1.desc),
			image = LUI.DataSourceInGlobalModel.new(var_12_0 .. ".image", var_12_1.image),
			disabled = LUI.DataSourceInGlobalModel.new(var_12_0 .. ".disabled", var_12_1.disabled),
			isOwned = var_12_2,
			ref = var_12_1.ref,
			listIndex = arg_12_1
		}
	end

	function var_10_6.GetDefaultFocusIndex()
		local var_13_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")

		for iter_13_0 = 0, var_10_6:GetCountValue(arg_10_1) - 1 do
			if var_10_6:GetDataSourceAtIndex(iter_13_0).ref == var_13_0 then
				return {
					x = 0,
					y = iter_13_0
				}
			end
		end
	end

	return var_10_6
end

function CP.GetEnabledClassicMissionsTable()
	local var_14_0 = Dvar.DHEEJCCJBH("OLKNTQKTPP")
	local var_14_1 = {}

	if #var_14_0 > 0 then
		local var_14_2 = string.gsub(var_14_0, " ", "")

		var_14_1 = LUI.KeyValueSplit(var_14_2, ",")
	end

	return var_14_1
end

function CP.GetClassicSpecOpsMissionInfo(arg_15_0)
	local var_15_0 = StringTable.BJJBBCJGEJ(CSV.specOpsMissionTable.file, CSV.specOpsMissionTable.cols.map, arg_15_0)

	return (CSV.ReadRow(CSV.specOpsMissionTable, var_15_0))
end

function CP.GetBestScoreForMap(arg_16_0, arg_16_1)
	local var_16_0 = Dvar.CFHDGABACF("cp_so_best_score")

	if var_16_0 then
		return var_16_0
	end

	if arg_16_0 and #arg_16_0 > 0 and arg_16_1 then
		local var_16_1 = PlayerData.BFFBGAJGD(arg_16_1, CoD.StatsGroup.Coop).ClassicSOBestScore[arg_16_0]

		if var_16_1 then
			return var_16_1:get()
		end
	end

	return 0
end

function CP.GetStarsEarnedForMap(arg_17_0, arg_17_1)
	local var_17_0 = Dvar.CFHDGABACF("cp_so_star_count")

	if var_17_0 then
		return var_17_0
	end

	if arg_17_0 and #arg_17_0 > 0 and arg_17_1 then
		local var_17_1 = PlayerData.BFFBGAJGD(arg_17_1, CoD.StatsGroup.Coop).ClassicSOStarCount[arg_17_0]

		if var_17_1 then
			return var_17_1:get()
		end
	end

	return 0
end

function CP.GetTotalStarsEarned(arg_18_0)
	local var_18_0 = 0
	local var_18_1 = 0
	local var_18_2 = CP.GetEnabledClassicMissionsTable()

	for iter_18_0, iter_18_1 in pairs(var_18_2) do
		var_18_0 = var_18_0 + CP.GetStarsEarnedForMap(iter_18_0, arg_18_0)
		var_18_1 = var_18_1 + 3
	end

	return var_18_0, var_18_1
end

function CP.GetStarUnlocksTable()
	local var_19_0 = {}
	local var_19_1 = StringTable.BFHCAIIDA(CSV.specOpsRewards.file)

	for iter_19_0 = 0, var_19_1 - 1 do
		local var_19_2 = CSV.ReadRow(CSV.specOpsRewards, iter_19_0)

		var_19_2.lootReward = Challenge.GetLootReward(var_19_2.rewardID)

		table.insert(var_19_0, var_19_2)
	end

	return var_19_0
end

function CP.GetPlaylistReward(arg_20_0, arg_20_1)
	local var_20_0

	if arg_20_0 and arg_20_1 then
		arg_20_0 = tostring(arg_20_0)

		local var_20_1 = tonumber(StringTable.DIFCHIGDFB(CSV.cpRewardTable.file, CSV.cpRewardTable.cols.uniqueIdentifier + arg_20_1, arg_20_0, CSV.cpRewardTable.cols.rewardID))

		if var_20_1 and var_20_1 > 0 then
			var_20_0 = Challenge.GetLootReward(var_20_1)
		end
	end

	return var_20_0
end

function CP.GetNextReward(arg_21_0)
	local var_21_0 = CP.GetStarUnlocksTable()

	for iter_21_0 = 1, #var_21_0 do
		local var_21_1 = var_21_0[iter_21_0]

		if arg_21_0 < tonumber(var_21_1.stars) then
			return var_21_1
		end
	end
end

function CP.IsRaidPlaylistUnlocked(arg_22_0, arg_22_1)
	local var_22_0 = true

	if arg_22_0 == 101 then
		local var_22_1 = 0

		var_22_0 = PlayerData.BFFBGAJGD(arg_22_1, CoD.StatsGroup.Coop).raid_complete[var_22_1]:get()
	end

	if var_22_0 == 0 then
		return false
	else
		return true
	end
end

function CP.TimeTextFormat(arg_23_0, arg_23_1)
	local var_23_0 = math.floor(arg_23_0 / 3600)

	if var_23_0 > 0 then
		local var_23_1 = math.floor(arg_23_0 / 60 - var_23_0 * 60)
		local var_23_2 = string.format("%.2d", arg_23_0 - var_23_0 * 60 * 60 - var_23_1 * 60)

		return Engine.CBBHFCGDIC("LUA_MENU_CP/STATS_TIME_PLAYED_HOURS", string.format("%.2d", var_23_0), string.format("%.2d", var_23_1), var_23_2)
	else
		local var_23_3 = math.floor(arg_23_0 / 60)
		local var_23_4 = string.format("%.2d", math.floor(arg_23_0 - var_23_3 * 60))

		return Engine.CBBHFCGDIC("LUA_MENU_CP/STATS_TIME_PLAYED_MINUTES", string.format("%.2d", var_23_3), var_23_4)
	end
end

function CP.PlayFrontendMusic()
	if not Engine.EAIICIFIFA() then
		return
	end

	local var_24_0 = Engine.IJEBHJIJF()

	assert(var_24_0)

	local var_24_1 = CP.GetMusic(var_24_0)

	assert(var_24_1)
	Engine.BBEEIGHJBA(var_24_1)
end

function CP.StartEMPGlitch(arg_25_0)
	arg_25_0:SetGlitchAmount(0)
end

function CP.StopEMPGlitch(arg_26_0)
	arg_26_0:SetGlitchAmount(0)
end

function CP.InitGameTypeToSurvival()
	MatchRules.CIGFFEAEFD("gametype", CP.SPEC_OPS)
end

function CP.RunDefaultConfig(arg_28_0)
	assert(Engine.EAIICIFIFA(), "Running Aliens Config when not in aliens mode\n")

	if Engine.EAIICIFIFA() then
		Engine.EBIDFIDHIE(CPConfig.default_aliens, arg_28_0)
	end
end

function CP.GetMusic(arg_29_0)
	return CoD.Music.MainCPMusic
end

function CP.PlayIntroVideo(arg_30_0, arg_30_1, arg_30_2)
	({}).video = arg_30_1

	LUI.FlowManager.RequestPopupMenu(nil, "CPVideoOverlay", false, arg_30_0, false, {
		videoRef = arg_30_1,
		endEvent = arg_30_2
	})
end

function CP.VideoOverlayPop()
	Engine.EBCGADABJ()
end

function CP.GetMapImage(arg_32_0)
	local var_32_0 = "loading_mp_generic_bg"
	local var_32_1 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, arg_32_0, CSV.mpMapTable.cols.loadingImage)

	if var_32_1 and #var_32_1 > 0 then
		var_32_0 = var_32_1
	end

	return var_32_0
end

function CP.CurrencySubtract(arg_33_0, arg_33_1)
	local var_33_0 = CP.CurrencyGet(arg_33_0) - arg_33_1

	PlayerData.BFFBGAJGD(arg_33_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.currencyWaveMode:set(var_33_0)
end

function CP.CurrencyGet(arg_34_0)
	return (DataSources.alwaysLoaded.CP.loadOut.currencyWaveLua:GetValue(arg_34_0))
end

function CP.ScriptCurrencyGet(arg_35_0)
	return (DataSources.inGame.CP.currentPlayerCash:GetValue(arg_35_0))
end

function CP.HasSeenCinematic(arg_36_0, arg_36_1)
	local var_36_0 = tonumber(StringTable.DIFCHIGDFB(CSV.cpCinematics.file, CSV.cpCinematics.cols.ref, arg_36_1, CSV.cpCinematics.cols.index))

	return (PlayerData.BFFBGAJGD(arg_36_0, CoD.StatsGroup.Coop).has_seen_cinematic[var_36_0]:get())
end

function CP.HasSeenIntro(arg_37_0, arg_37_1)
	return (PlayerData.BFFBGAJGD(arg_37_0, CoD.StatsGroup.Coop).has_seen_cinematic[arg_37_1]:get())
end

function CP.SetHasSeenCinematic(arg_38_0, arg_38_1)
	PlayerData.BFFBGAJGD(arg_38_0, CoD.StatsGroup.Coop).has_seen_cinematic[arg_38_1]:set(1)
end

function CP.SetHasSeenIntroVideo(arg_39_0, arg_39_1)
	local var_39_0 = tonumber(StringTable.DIFCHIGDFB(CSV.cpCinematics.file, CSV.cpCinematics.cols.ref, arg_39_1, CSV.cpCinematics.cols.index))

	PlayerData.BFFBGAJGD(arg_39_0, CoD.StatsGroup.Coop).has_seen_cinematic[var_39_0]:set(1)
end

function CP.CheckpointRefreshTimer(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_0:Wait(1000, true)
	local var_40_1 = PlayerData.BFFBGAJGD(arg_40_1, CoD.StatsGroup.Coop).checkpointReached.week:get()

	function var_40_0.onComplete()
		return CP.CheckpointRefreshTimer(arg_40_0, arg_40_1)
	end

	local var_40_2 = CP.CheckpointResetPeriodUTC
	local var_40_3 = Engine.DEIDGHDBHD() - CP.CheckpointResetStartUTC
	local var_40_4 = math.floor(var_40_3 / var_40_2)

	if var_40_1 < var_40_4 then
		PlayerData.BFFBGAJGD(arg_40_1, CoD.StatsGroup.Coop).checkpointReached.cp_raid_complex:set(0)
		PlayerData.BFFBGAJGD(arg_40_1, CoD.StatsGroup.Coop).checkpointReached.cp_dntsk_raid:set(0)
		PlayerData.BFFBGAJGD(arg_40_1, CoD.StatsGroup.Coop).checkpointReached.week:set(var_40_4)

		local var_40_5 = var_40_4
	end
end
