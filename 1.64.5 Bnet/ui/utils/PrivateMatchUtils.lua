PRIVATE_MATCH = PRIVATE_MATCH or {}

local function var_0_0()
	if Engine.BHICADFIHA() then
		Dvar.DFIJDJFIFD("LSLKTTRKPQ", 1)
	end
end

local function var_0_1()
	local var_2_0 = Dvar.CFHDGABACF("PKMLMMTSN")

	Dvar.DFIJDJFIFD("LSLKTTRKPQ", var_2_0)
	var_0_0()
end

local function var_0_2()
	local var_3_0 = Dvar.CFHDGABACF("MLMKTRTSPL")

	Dvar.DFIJDJFIFD("LSLKTTRKPQ", var_3_0)
	var_0_0()
end

local function var_0_3()
	local var_4_0 = Dvar.CFHDGABACF("LPPNKPRPRP")

	Dvar.DFIJDJFIFD("LSLKTTRKPQ", var_4_0)
	var_0_0()
end

local function var_0_4()
	local var_5_0 = Dvar.CFHDGABACF("MPOKORMSKP")

	Dvar.DFIJDJFIFD("LSLKTTRKPQ", var_5_0)
	var_0_0()
end

local function var_0_5()
	Dvar.BDEHAEGHAF("scr_br_gametype", "")
	PRIVATE_MATCH.SetupPrivateMatchGameType(Lobby.MatchmakingGameType.GAME_TYPE_BR)
end

local function var_0_6()
	Dvar.BDEHAEGHAF("scr_br_gametype", "mini")
	PRIVATE_MATCH.SetupPrivateMatchGameType(Lobby.MatchmakingGameType.GAME_TYPE_BR)
end

local function var_0_7()
	Dvar.BDEHAEGHAF("scr_br_gametype", "dmz")
	PRIVATE_MATCH.SetupPrivateMatchGameType(Lobby.MatchmakingGameType.GAME_TYPE_BM)
end

local function var_0_8()
	Dvar.BDEHAEGHAF("scr_br_gametype", "jugg")
	PRIVATE_MATCH.SetupPrivateMatchGameType(Lobby.MatchmakingGameType.GAME_TYPE_BR)
end

local function var_0_9()
	Dvar.BDEHAEGHAF("scr_br_gametype", "truckwar")
	PRIVATE_MATCH.SetupPrivateMatchGameType(Lobby.MatchmakingGameType.GAME_TYPE_BR)
end

local function var_0_10()
	Dvar.BDEHAEGHAF("scr_br_gametype", "kingslayer")
	PRIVATE_MATCH.SetupPrivateMatchGameType(Lobby.MatchmakingGameType.GAME_TYPE_BM)
end

local function var_0_11()
	Dvar.BDEHAEGHAF("scr_br_gametype", "rebirth")
	PRIVATE_MATCH.SetupPrivateMatchGameType(Lobby.MatchmakingGameType.GAME_TYPE_BR)
end

local function var_0_12()
	Dvar.BDEHAEGHAF("scr_br_gametype", "dbd")
	PRIVATE_MATCH.SetupPrivateMatchGameType(Lobby.MatchmakingGameType.GAME_TYPE_BR)
end

local function var_0_13()
	Dvar.BDEHAEGHAF("scr_br_gametype", "rebirth_reverse")
	PRIVATE_MATCH.SetupPrivateMatchGameType(Lobby.MatchmakingGameType.GAME_TYPE_BR)
end

PRIVATE_MATCH.WarzoneGameTypeSetupTable = {
	DefaultBitmapFilterDvar = "LORLPQNNTN",
	pr_br_dmz = {
		BitmapFilterDvar = "ORNSLMTMT",
		UpdateMinPlayerDvar = var_0_3,
		UpdateGameTypeDvar = var_0_7
	},
	pr_br_dmz_solo = {
		BitmapFilterDvar = "ORNSLMTMT",
		UpdateMinPlayerDvar = var_0_3,
		UpdateGameTypeDvar = var_0_7
	},
	pr_br_dmz_duos = {
		BitmapFilterDvar = "ORNSLMTMT",
		UpdateMinPlayerDvar = var_0_3,
		UpdateGameTypeDvar = var_0_7
	},
	pr_br_dmz_quads = {
		BitmapFilterDvar = "ORNSLMTMT",
		UpdateMinPlayerDvarPlayer = var_0_3,
		UpdateGameTypeDvar = var_0_7
	},
	pr_br_bm = {
		BitmapFilterDvar = "ORNSLMTMT",
		UpdateMinPlayerDvar = var_0_3,
		UpdateGameTypeDvar = var_0_7
	},
	pr_br_bm_solo = {
		BitmapFilterDvar = "ORNSLMTMT",
		UpdateMinPlayerDvar = var_0_3,
		UpdateGameTypeDvar = var_0_7
	},
	pr_br_bm_duos = {
		BitmapFilterDvar = "ORNSLMTMT",
		UpdateMinPlayerDvar = var_0_3,
		UpdateGameTypeDvar = var_0_7
	},
	pr_br_bm_quads = {
		BitmapFilterDvar = "ORNSLMTMT",
		UpdateMinPlayerDvar = var_0_3,
		UpdateGameTypeDvar = var_0_7
	},
	pr_br_mini = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_2,
		UpdateGameTypeDvar = var_0_6
	},
	pr_br_jugg = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_8
	},
	pr_br_jugg_quads = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_8
	},
	pr_br_truck = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_9
	},
	pr_br_truck_duos = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_9
	},
	pr_br_truck_trios = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_9
	},
	pr_br_kingslayer = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_10
	},
	pr_br_rebirth_s = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_4,
		UpdateGameTypeDvar = var_0_13
	},
	pr_br_rebirth_d = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_4,
		UpdateGameTypeDvar = var_0_11
	},
	pr_br_rebirth_t = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_4,
		UpdateGameTypeDvar = var_0_11
	},
	pr_br_rebirth_q = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_4,
		UpdateGameTypeDvar = var_0_11
	},
	pr_br_rebmini_d = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_4,
		UpdateGameTypeDvar = var_0_6
	},
	pr_br_rebmini_t = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_4,
		UpdateGameTypeDvar = var_0_6
	},
	pr_br_rebmini_q = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_4,
		UpdateGameTypeDvar = var_0_6
	},
	pr_br_iron_solo = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_12
	},
	pr_br_iron_duos = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_12
	},
	pr_br_iron_trios = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_12
	},
	pr_br_iron_quads = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_12
	},
	pr_br_vn_solo = {
		BitmapFilterDvar = "LORLPQNNTN",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_5
	},
	pr_br_vn_duos = {
		BitmapFilterDvar = "LORLPQNNTN",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_5
	},
	pr_br_vn_trios = {
		BitmapFilterDvar = "LORLPQNNTN",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_5
	},
	pr_br_vn_quads = {
		BitmapFilterDvar = "LORLPQNNTN",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_5
	},
	pr_br_vn_mini = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_2,
		UpdateGameTypeDvar = var_0_6
	},
	pr_br_res_solo = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_2,
		UpdateGameTypeDvar = var_0_11
	},
	pr_br_res_duos = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_2,
		UpdateGameTypeDvar = var_0_11
	},
	pr_br_res_trios = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_2,
		UpdateGameTypeDvar = var_0_11
	},
	pr_br_res_quads = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_2,
		UpdateGameTypeDvar = var_0_11
	},
	pr_br_vn_res_quads = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_2,
		UpdateGameTypeDvar = var_0_11
	},
	pr_br_vn_res_trios = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_2,
		UpdateGameTypeDvar = var_0_11
	},
	pr_br_vn_res_duos = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_2,
		UpdateGameTypeDvar = var_0_11
	},
	pr_re_iron_quads = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_12
	},
	pr_re_iron_trios = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_12
	},
	pr_re_iron_duos = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_12
	},
	pr_re_iron_solos = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_1,
		UpdateGameTypeDvar = var_0_12
	},
	pr_br_fortune_s = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_4,
		UpdateGameTypeDvar = var_0_13
	},
	pr_br_fortune_d = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_4,
		UpdateGameTypeDvar = var_0_11
	},
	pr_br_fortune_t = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_4,
		UpdateGameTypeDvar = var_0_11
	},
	pr_br_fortune_q = {
		BitmapFilterDvar = "NSTTKMQTRO",
		UpdateMinPlayerDvar = var_0_4,
		UpdateGameTypeDvar = var_0_11
	},
	DefaultUpdateMinPlayerDvar = function()
		local var_15_0 = Dvar.CFHDGABACF("PKMLMMTSN")

		Dvar.DFIJDJFIFD("LSLKTTRKPQ", var_15_0)
		var_0_0()
	end,
	DefaultUpdateGameTypeDvar = function()
		Dvar.BDEHAEGHAF("scr_br_gametype", "")
		PRIVATE_MATCH.SetupPrivateMatchGameType(Lobby.MatchmakingGameType.GAME_TYPE_BR)
	end
}
PRIVATE_MATCH.WarzoneButtonType = {
	SETUP = 2,
	LAST = 4,
	PLAYER_LIST = 4,
	START_MATCH = 1,
	SQUAD_SELECT = 3,
	NONE = 0
}
PRIVATE_MATCH.WarzoneButtonActionTable = {
	[PRIVATE_MATCH.WarzoneButtonType.START_MATCH] = {
		action = function(arg_17_0, arg_17_1)
			DebugPrint("WZ private start match button is clicked. \n")

			if Lobby.GetTotalNumBots() == 0 then
				DebugPrint("WZ private start match action triggers. \n")
				arg_17_0:SetLockState(true)

				if PRIVATE_MATCH.ShouldForceSquadFill() then
					Lobby.ForceEnableFill(arg_17_0, arg_17_1)
				end

				Lobby.BJCJAHAGDC(true)
				Lobby.CFFJAEECFA(arg_17_1)
				Lobby.StartPrivateMatchDS(arg_17_1)
				arg_17_0.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU/LOCKED"), 0)
			end
		end
	},
	[PRIVATE_MATCH.WarzoneButtonType.SETUP] = {
		action = function(arg_18_0, arg_18_1)
			local var_18_0 = LUI.FlowManager.GetScopedData(arg_18_0)

			LUI.FlowManager.RequestAddMenu("GameModes", true, arg_18_1 or event.controller, false, {
				isWarzone = var_18_0.isWarzone,
				matchmakerSettings = var_18_0.matchmakerSettings
			}, true)
		end
	},
	[PRIVATE_MATCH.WarzoneButtonType.SQUAD_SELECT] = {
		action = function(arg_19_0, arg_19_1)
			LUI.FlowManager.RequestAddMenu("WarzonePrivateMatchSquadMenu", true, arg_19_1, false, nil, true)
		end
	},
	[PRIVATE_MATCH.WarzoneButtonType.PLAYER_LIST] = {
		action = function(arg_20_0, arg_20_1)
			local var_20_0

			if PRIVATE_MATCH.GetLobbyCurrentPlayerCount() > 1 then
				var_20_0 = Lobby.FJCJFBBF() and "LUA_MENU/UNMUTE_ALL" or "LUA_MENU/MUTE_ALL"
			end

			local var_20_1 = MenuBuilder.BuildRegisteredType("WarzonePrivateMatchPlayerListPopup", {
				controllerIndex = arg_20_1
			})

			LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_20_1, false, {
				isPrimaryButtonRightSide = true,
				disableQuickAccessShortcuts = false,
				primaryButtonText = "LUA_MENU_MP/VIEW_REPORT_PLAYER",
				isAltOneButtonRightSide = true,
				altOneButtonText = var_20_0,
				widget = var_20_1
			})
		end
	}
}

function PRIVATE_MATCH.ShouldForceSquadFill()
	return Dvar.DHEEJCCJBH("scr_br_gametype") == MP.GameMode.TruckWarGameType
end

function PRIVATE_MATCH.ShouldDisplayMap(arg_22_0, arg_22_1)
	if Engine.EAIICIFIFA() and Lobby.DIJCBCJCAH(arg_22_0) ~= true then
		return false
	end

	local var_22_0 = Lobby.CBEIEIFCEF(arg_22_0)

	if Dvar.IBEGCHEFE("PMTLOTQQS") and var_22_0 == Lobby.DLC1_MAP_PACK_INDEX then
		return false
	end

	if var_22_0 == Lobby.DLC2_MAP_PACK_INDEX and not Dvar.IBEGCHEFE("NLOTPSPSOQ") then
		return false
	end

	local var_22_1 = Lobby.CJEHDHDGBH(arg_22_0)

	if Dvar.IBEGCHEFE("lui_checkIfLevelInFileSystem") and not Engine.DDCGBHDIBF(var_22_1) then
		return false
	end

	local var_22_2 = Engine.BAJHDFAJJF(var_22_0)

	if IsSystemLink() and not var_22_2 then
		return false
	end

	return true
end

function PRIVATE_MATCH.GameTypeSupportsCustomGames(arg_23_0)
	if CONDITIONS.IsLaunchChunk() then
		return true
	end

	local var_23_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_23_0, CSV.gameTypesTable.cols.privateExclusiveMode)

	if var_23_0 == "cp" and not CONDITIONS.IsThirdGameMode() then
		return false
	elseif var_23_0 == "magma" and not CONDITIONS.IsMagmaGameMode() then
		return false
	end

	if CONDITIONS.AreDevFeaturesEnabled() then
		return true
	end

	local var_23_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_23_0, CSV.gameTypesTable.cols.hideInUI)

	return var_23_1 and var_23_1 ~= "1"
end

function PRIVATE_MATCH.MapSupportsCustomGames(arg_24_0)
	if CONDITIONS.AreDevFeaturesEnabled() then
		return true
	end

	if CONDITIONS.IsLaunchChunk() then
		return true
	end

	if Lobby.GetCurrentGameType() == CP.CLASSIC_MISSIONS then
		return CP.GetEnabledClassicMissionsTable()[arg_24_0]
	end

	local var_24_0 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, arg_24_0, CSV.mpMapTable.cols.hideInMapSelect)

	if var_24_0 == nil then
		return false
	elseif #var_24_0 <= 0 then
		return false
	elseif var_24_0 == "1" or var_24_0 == 1 then
		return false
	end

	return true
end

function PRIVATE_MATCH.ValidateGameSetup()
	local var_25_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
	local var_25_1 = Lobby.GetCurrentGameType()
	local var_25_2 = PRIVATE_MATCH.GameTypeSupportsCustomGames(var_25_1) and PRIVATE_MATCH.MapSupportsCustomGames(var_25_0)

	if not var_25_2 and not CONDITIONS.AreDevFeaturesEnabled() then
		PRIVATE_MATCH.SetDefaultMatchRules()
	end

	assert(var_25_2, "Current gametype or map is not supported without dev features enabled. (Current GameType: " .. var_25_1 .. "  CurrentMap: " .. var_25_0 .. ")")

	return var_25_2
end

function PRIVATE_MATCH.SetupPrivateMatchLobbyScene(arg_26_0, arg_26_1)
	local var_26_0 = LOADOUT.GetLoadoutStatsGroup()
	local var_26_1 = PlayerData.BFFBGAJGD(arg_26_1, var_26_0).squadMembers.loadouts[0].weaponSetups[0].weapon:get() .. "_mp"

	FrontEndScene.RequestWeaponWorldModels({
		var_26_1
	})

	if CONDITIONS.IsCoreMultiplayer() then
		Engine.BBEEIGHJBA(CoD.Music.MainMPMusic)
	else
		CP.PlayFrontendMusic()
	end

	MP_COMMON.SetupStreaming(arg_26_0, arg_26_1, true)
	WEAPON.StreamAllWeapons(arg_26_1)
end

function PRIVATE_MATCH.SetDefaultMatchRules(arg_27_0)
	if CONDITIONS.IsLaunchChunk() then
		return
	end

	arg_27_0 = arg_27_0 or {}

	if Dvar.IBEGCHEFE("LLPNKKORPT") or Lobby.DFFFFJHCEH() then
		local var_27_0 = Lobby.GetCurrentGameType()
		local var_27_1 = var_27_0
		local var_27_2 = Dvar.DHEEJCCJBH("OKPMLLKRP")

		if var_27_2 and #var_27_2 > 0 then
			Dvar.BDEHAEGHAF("NSQLTTMRMP", var_27_2)
		end

		if not MatchRules.EAIEFBHGJ() then
			MatchRules.CJGCIGEBB(1)
		end

		if CONDITIONS.IsCoreMultiplayer() then
			if not PRIVATE_MATCH.GameTypeSupportsCustomGames(var_27_0) or #var_27_0 == 0 or var_27_0 == "trial" then
				var_27_1 = Dvar.DHEEJCCJBH("ORMSMKOKL")

				Dvar.BDEHAEGHAF("MOLPOSLOMO", var_27_1)
				MatchRules.CIGFFEAEFD("gametype", var_27_1)
				MatchRules.BCECADEHDA()

				local var_27_3 = Lobby.GetDefaultMapForGameType(var_27_1)

				Dvar.BDEHAEGHAF("NSQLTTMRMP", var_27_3)
				Engine.DAGFFDGFII("reset OKPMLLKRP")
			end

			if arg_27_0.isTournament then
				MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.HardcoreModeOn, false)
			end
		elseif CONDITIONS.IsThirdGameMode() and not (var_27_0 == CP.CLASSIC_MISSIONS or var_27_0 == CP.WAVE_SURVIVAL and CONDITIONS.IsSurvivalModeAllowed() or CONDITIONS.AreDevFeaturesEnabled()) and not CONDITIONS.AreDevFeaturesEnabled() then
			var_27_1 = CP.CLASSIC_MISSIONS

			Dvar.BDEHAEGHAF("MOLPOSLOMO", var_27_1)
			MatchRules.CIGFFEAEFD("gametype", var_27_1)
		end

		local var_27_4 = Dvar.DHEEJCCJBH("NSQLTTMRMP")

		if (not PRIVATE_MATCH.MapSupportsCustomGames(var_27_4) or #var_27_4 == 0) and not CONDITIONS.AreDevFeaturesEnabled() then
			local var_27_5 = Lobby.GetDefaultMapForGameType(var_27_1)

			Dvar.BDEHAEGHAF("NSQLTTMRMP", var_27_5)
		end

		local var_27_6 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
		local var_27_7 = Lobby.GetMapIndexByRef(var_27_6)
		local var_27_8

		if var_27_7 and var_27_7 >= 0 then
			var_27_8 = Lobby.GetGameTypesTableForMapIndex(var_27_7)
		end

		if not (var_27_8 and var_27_8[var_27_1]) and not CONDITIONS.AreDevFeaturesEnabled() then
			local var_27_9 = Lobby.GetDefaultMapForGameType(var_27_1)

			assert(var_27_9 and #var_27_9 > 0, "Selected gametype does not have a default map defined in gametypestable.csv")
			Dvar.BDEHAEGHAF("NSQLTTMRMP", var_27_9)
			Engine.DAGFFDGFII("reset OKPMLLKRP")
		end

		if CONDITIONS.IsThirdGameMode() then
			Engine.DAGFFDGFII("enable_pvpe 0")
		end

		Engine.DAGFFDGFII("xupdatepartystate")
	end
end

function PRIVATE_MATCH.DisplayDevCheatWarning(arg_28_0)
	if CONDITIONS.AreDevFeaturesEnabled() then
		local var_28_0 = LUI.UIText.new()

		var_28_0:SetAlignment(LUI.Alignment.Left)
		var_28_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 536, _1080p * 584, _1080p * 604)
		arg_28_0:addElement(var_28_0)

		arg_28_0.CheatLabel = var_28_0

		local var_28_1 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
		local var_28_2 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_28_1, CSV.mpMapTable.cols.hideInMapSelect)

		if #var_28_2 > 0 and var_28_2 ~= "1" then
			var_28_0:SetRGBFromTable(COLORS.white)
			var_28_0:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
			var_28_0:setText(Engine.JCBDICCAH("Dev Cheat Enabled - All Maps & Game Modes allowed!\nToggle \"lui_dev_features_enabled\" to test features only available on Ship."))
		else
			var_28_0:SetRGBFromTable(COLORS.red)
			var_28_0:SetFont(FONTS.GetFont(FONTS.MainBold.File))
			var_28_0:setText(Engine.JCBDICCAH("Dev Cheat Enabled - The current map, \"" .. var_28_1 .. "\", is only available on Dev Builds. ERRORS are expected!\nToggle \"lui_dev_features_enabled\" to test features only available on Ship."))
		end
	end
end

function PRIVATE_MATCH.SetupPrivateMatchTabs(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = LUI.FlowManager.GetScopedData(arg_29_0)
	local var_29_1 = arg_29_2 and arg_29_2.firstTabWidget
	local var_29_2 = arg_29_2 and arg_29_2.firstTabName
	local var_29_3 = arg_29_2 and arg_29_2.callbackFunc

	if var_29_1 == nil then
		if CONDITIONS.IsMagmaGameMode() then
			var_29_1 = "WarzonePrivateMatchLobbyPlayMenu"
		elseif IsPrivateMatch() then
			var_29_1 = "PrivateMatchLobbyPlayMenu"
		elseif IsSystemLink() then
			var_29_1 = "SystemLinkLobbyPlayMenu"
		end
	end

	if var_29_2 == nil then
		var_29_2 = "LUA_MENU/PLAY"
	end

	local function var_29_4(arg_30_0, arg_30_1)
		arg_30_0._backButtonHandlerSet = true

		if not arg_30_0.bindButton then
			arg_30_0.bindButton = LUI.UIBindButton.new()
			arg_30_0.bindButton.id = "selfBindButton"

			arg_30_0:addElement(self.bindButton)
		end

		arg_30_0.bindButton:addEventHandler("button_secondary", function(arg_31_0, arg_31_1)
			local var_31_0 = arg_30_0.activeTabWidget
			local var_31_1 = true

			if var_31_0 and var_31_0.BackButtonOverride then
				var_31_1 = var_31_0.BackButtonOverride(arg_31_0, arg_31_1)
			end

			if var_31_1 and arg_30_1 ~= nil then
				arg_30_1(arg_31_0, arg_31_1)
			end
		end)
	end

	if arg_29_2.leaveMenuFunction then
		var_29_4(arg_29_0, arg_29_2.leaveMenuFunction)
	end

	local function var_29_5(arg_32_0)
		if Engine.JEDFGECDJ() > 1 and var_29_0.activeTabIndex ~= 0 then
			local var_32_0 = Engine.CGHHDHCDEC(arg_29_1)

			arg_32_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_left_trigger",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", var_32_0 + 1)
			})
		else
			arg_32_0:AddButtonHelperText({
				helper_text = "",
				button_ref = "button_left_trigger"
			})
		end
	end

	local function var_29_6(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
		if arg_33_0.activeTabWidget and arg_33_0.activeTabWidget.Cleanup and var_29_0.activeTabIndex ~= arg_33_2 then
			arg_33_0.activeTabWidget:Cleanup(arg_33_1)
		end

		if var_29_0.activeTabIndex and arg_33_2 == var_29_0.activeTabIndex and arg_33_0.activeTabWidget then
			return
		end

		TAB.UpdateBuiltWidgetOnTabChange(arg_33_0, var_29_0.activeTabIndex, "activeTabWidget", arg_33_2, arg_33_3, arg_33_4, {
			buildPriority = -1,
			controllerIndex = arg_33_1
		})

		var_29_0.activeTabIndex = arg_33_2

		if arg_33_0._backButtonHandlerSet and arg_33_2 ~= 0 then
			local var_33_0 = arg_33_0.activeTabWidget

			if var_33_0 and not var_33_0.BackButtonOverride then
				function var_33_0.BackButtonOverride(arg_34_0, arg_34_1)
					local var_34_0 = arg_34_1.qualifier ~= "keyboard" and arg_34_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad

					arg_33_0.Tabs:FocusTab(arg_33_1, 0, var_34_0)

					return false
				end
			end
		end

		if arg_33_0.Vignette then
			if arg_33_4 == "PrivateMatchLobbyPlayMenu" then
				arg_33_0.Vignette:SetAlpha(0.7, 250)
			else
				arg_33_0.Vignette:SetAlpha(0, 500)
			end
		end

		local var_33_1 = arg_33_4 == "WZOperatorSelect"

		if var_33_1 then
			arg_33_0.activeTabWidget._currentMenu = arg_33_0

			arg_33_0.activeTabWidget:UpdateButtonPrompts(arg_33_1)
		end

		if arg_33_0.PartyWidget then
			arg_33_0.PartyWidget:SetAlpha(var_33_1 and 0 or 1)
			arg_33_0.PartyWidget:EnableSocialMenu(not var_33_1)
		end

		if arg_33_4 == "WarzonePrivateMatchLobbyPlayMenu" or arg_33_4 == "PrivateMatchLobbyPlayMenu" or arg_33_4 == "SystemLinkPlayMenu" or arg_33_4 == "SystemLinkLobbyPlayMenu" then
			Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabPlay)
		elseif arg_33_4 == "MPWeaponMenu" then
			Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabWeapons)
		elseif arg_33_4 == "MPOperatorMenu" or arg_33_4 == "WZOperatorSelect" then
			Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabOperators)
		elseif arg_33_4 == "MPCustomizeMenu" then
			Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabBarracks)
		end

		var_29_5(arg_33_0)

		if Dvar.IBEGCHEFE("NQTLNRKLNQ") then
			local var_33_2 = arg_33_0._tabsData[arg_33_2 + 1]

			LOOT.UpdateClearBreadcrumbButtonHelpers(arg_33_0, var_33_2)
		end
	end

	var_29_5(arg_29_0)
	arg_29_0.bindButton:addEventHandler("button_left_trigger", function(arg_35_0, arg_35_1)
		if Engine.JEDFGECDJ() > 1 and var_29_0.activeTabIndex ~= 0 then
			local var_35_0 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")
			local var_35_1 = var_35_0:GetValue(arg_29_1) or arg_35_1.controller
			local var_35_2 = Engine.CGHHDHCDEC(var_35_1)

			var_35_0:SetValue(var_35_1, var_35_2)
			arg_35_0:AddButtonHelperText({
				helper_text = "",
				button_ref = "button_left_trigger"
			})
			arg_35_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_left_trigger",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", var_35_1 + 1)
			})
		end
	end)

	local var_29_7 = {}
	local var_29_8 = {
		canClearNewIndicators = false,
		isPlayTab = true,
		name = ToUpperCase(Engine.CBBHFCGDIC(var_29_2)),
		hasDefaultFocus = var_29_0.activeTabIndex == 0,
		focusFunction = function(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
			var_29_6(arg_29_0, arg_36_1, arg_36_2, arg_36_3, var_29_1)

			if var_29_3 then
				var_29_3(arg_36_2)
			end

			if arg_29_0.MapBackgroundImage then
				if Dvar.IBEGCHEFE("tournament_in_system_link") ~= true or not Engine.BHICADFIHA() then
					arg_29_0.MapBackgroundImage:SetAlpha(1, 0)
					arg_29_0.MapBackgroundImage:SetRGBFromTable(COLORS.black)
					arg_29_0.MapBackgroundImage:SetRGBFromTable(COLORS.white, 500)
				else
					arg_29_0.MapBackgroundImage:SetAlpha(0, 0)
				end
			end
		end
	}
	local var_29_9 = {
		isWeaponsTab = true,
		canClearNewIndicators = true,
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WEAPONS")),
		hasDefaultFocus = var_29_0.activeTabIndex == 1,
		focusFunction = function(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
			var_29_6(arg_29_0, arg_37_1, arg_37_2, arg_37_3, "MPWeaponMenu")

			if var_29_3 then
				var_29_3(arg_37_2)
			end

			if arg_29_0.MapBackgroundImage then
				arg_29_0.MapBackgroundImage:SetAlpha(0, 500)
			end
		end
	}
	local var_29_10 = {
		canClearNewIndicators = true,
		isOperatorTab = true,
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPERATORS")),
		hasDefaultFocus = var_29_0.activeTabIndex == 2,
		isWZOperatorTab = CONDITIONS.IsWZWipOperatorFlowEnabled(),
		focusFunction = function(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
			var_29_6(arg_29_0, arg_38_1, arg_38_2, arg_38_3, CONDITIONS.IsWZWipOperatorFlowEnabled() and "WZOperatorSelect" or "MPOperatorMenu")

			if var_29_3 then
				var_29_3(arg_38_2)
			end

			if arg_29_0.MapBackgroundImage then
				arg_29_0.MapBackgroundImage:SetAlpha(0, 500)
			end
		end
	}
	local var_29_11 = {
		isBarracksTab = true,
		canClearNewIndicators = true,
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BARRACKS")),
		hasDefaultFocus = var_29_0.activeTabIndex == 3,
		focusFunction = function(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
			var_29_6(arg_29_0, arg_39_1, arg_39_2, arg_39_3, "MPCustomizeMenu")

			if var_29_3 then
				var_29_3(arg_39_2)
			end

			if arg_29_0.MapBackgroundImage then
				arg_29_0.MapBackgroundImage:SetAlpha(0, 500)
			end
		end
	}

	var_29_7[#var_29_7 + 1] = var_29_8

	if Dvar.CFHDGABACF("scr_allow_custom_loadouts") == 1 then
		var_29_7[#var_29_7 + 1] = var_29_9
	end

	var_29_7[#var_29_7 + 1] = var_29_10
	var_29_7[#var_29_7 + 1] = var_29_11
	arg_29_0._tabsData = var_29_7

	arg_29_0.Tabs:SetTabs(var_29_7)
	arg_29_0.Tabs:SetAlignment(LUI.Alignment.Left)
end

function PRIVATE_MATCH.GetGameTypeImage(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = ""

	if MatchRules.EAIEFBHGJ() and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.TacticalModeOn) then
		var_40_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_40_0, CSV.gameTypesTable.cols.realismImage)
	elseif MLG.IsCDLActive(arg_40_2) then
		var_40_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_40_0, CSV.gameTypesTable.cols.CDLImage)
	elseif arg_40_1 then
		var_40_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_40_0, CSV.gameTypesTable.cols.hardcoreImage)
	end

	if #var_40_0 == 0 then
		var_40_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_40_0, CSV.gameTypesTable.cols.image)
		var_40_0 = #var_40_0 == 0 and "icon_playlist_generic" or var_40_0
	end

	return var_40_0
end

function PRIVATE_MATCH.GetGameTypeName(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = ""

	if MLG.IsCDLActive(arg_41_2) then
		var_41_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_41_0, CSV.gameTypesTable.cols.CDLName)
	end

	if #var_41_0 == 0 then
		var_41_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_41_0, CSV.gameTypesTable.cols.name)
	end

	if arg_41_1 then
		var_41_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/HARDCORE_GAME_TYPE", var_41_0)
	else
		var_41_0 = Engine.CBBHFCGDIC(var_41_0)
	end

	return var_41_0
end

function PRIVATE_MATCH.DoesMapNeedsMultipleModes(arg_42_0)
	local var_42_0 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, arg_42_0, CSV.mpMapTable.cols.hasMultipleModes)

	return var_42_0 and var_42_0 ~= "" and var_42_0 == "1"
end

function PRIVATE_MATCH.SetupWarzoneGameType(arg_43_0)
	local var_43_0 = PRIVATE_MATCH.WarzoneGameTypeSetupTable[arg_43_0]

	if var_43_0 and var_43_0.UpdateGameTypeDvar then
		var_43_0.UpdateGameTypeDvar()
	else
		PRIVATE_MATCH.WarzoneGameTypeSetupTable.DefaultUpdateGameTypeDvar()
	end
end

function PRIVATE_MATCH.SetupWarzoneMinPlayerNum(arg_44_0)
	local var_44_0 = PRIVATE_MATCH.WarzoneGameTypeSetupTable[arg_44_0]

	if var_44_0 and var_44_0.UpdateMinPlayerDvar then
		var_44_0.UpdateMinPlayerDvar()
	else
		PRIVATE_MATCH.WarzoneGameTypeSetupTable.DefaultUpdateMinPlayerDvar()
	end
end

function PRIVATE_MATCH.SetupPrivateMatchGameType(arg_45_0)
	assert(type(arg_45_0) == "number")
	Dvar.DFIJDJFIFD("QTNLKTKN", arg_45_0)
end

function PRIVATE_MATCH.GetLobbyMaxPlayerCount()
	return Dvar.CFHDGABACF("OOTQKOTRM")
end

function PRIVATE_MATCH.GetLobbyMinPlayerCount()
	return (Dvar.CFHDGABACF("LSLKTTRKPQ"))
end

function PRIVATE_MATCH.GetLobbyCurrentPlayerCount()
	local var_48_0 = Lobby.BDCAFCJEFC()

	if var_48_0 then
		return #var_48_0
	end

	return 0
end

function PRIVATE_MATCH.CheckMatchRuleGameModeData(arg_49_0, arg_49_1)
	if MatchRules.EAIEFBHGJ() then
		local var_49_0 = LUI.FlowManager.GetScopedData("WarzonePrivateMatchLobby")

		var_49_0.isSoloGameMode = SQUAD.GetSquadSize() == 1
		var_49_0.wzGameRef = MatchRules.BIJEDCBCBH("recipeName")
	end
end

function PRIVATE_MATCH.IsWZSoloGameModeLobby(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = LUI.FlowManager.GetScopedData("WarzonePrivateMatchLobby")
	local var_50_1 = false

	if arg_50_2 then
		local var_50_2 = var_50_0.matchmakerSettings and var_50_0.matchmakerSettings.recipe and #var_50_0.matchmakerSettings.recipe > 0

		var_50_1 = var_50_0.isSoloGameMode or var_50_2 and var_50_0.matchmakerSettings.squadSize == "1"
	else
		var_50_1 = var_50_0.isSoloGameMode
	end

	return var_50_1
end

function PRIVATE_MATCH.ClearupWZPrivateGameModeRecipe(arg_51_0)
	assert(CONDITIONS.IsWZPrivateMatch(arg_51_0))

	if MatchRules.EAIEFBHGJ() then
		MatchRules.CIGFFEAEFD(Lobby.MatchRulesMembers.RecipeName, "")
		MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.ExecConfig, false)
	end
end

function PRIVATE_MATCH.IsWZPrivateMatchRecipeReady(arg_52_0)
	assert(CONDITIONS.IsWZPrivateMatch(arg_52_0))

	if MatchRules.EAIEFBHGJ() then
		local var_52_0 = MatchRules.BIJEDCBCBH(Lobby.MatchRulesMembers.RecipeName)

		if var_52_0 and #var_52_0 > 0 and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.ExecConfig) then
			return true
		end
	end

	return false
end
