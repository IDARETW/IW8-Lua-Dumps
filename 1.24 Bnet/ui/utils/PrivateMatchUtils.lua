PRIVATE_MATCH = PRIVATE_MATCH or {}

function PRIVATE_MATCH.ShouldDisplayMap(arg_1_0, arg_1_1)
	if not (Engine.EAIICIFIFA() == Lobby.DIJCBCJCAH(arg_1_0)) then
		return false
	end

	local var_1_0 = Lobby.CBEIEIFCEF(arg_1_0)

	if Dvar.IBEGCHEFE("PMTLOTQQS") and var_1_0 == Lobby.DLC1_MAP_PACK_INDEX then
		return false
	end

	if var_1_0 == Lobby.DLC2_MAP_PACK_INDEX and not Dvar.IBEGCHEFE("NLOTPSPSOQ") then
		return false
	end

	local var_1_1 = Lobby.CJEHDHDGBH(arg_1_0)

	if Dvar.IBEGCHEFE("lui_checkIfLevelInFileSystem") and not Engine.DDCGBHDIBF(var_1_1) then
		return false
	end

	if Engine.EAIICIFIFA() and not CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(self) and (var_1_1 == "cp_sv_vacant" or var_1_1 == "cp_sv_village2") then
		return false
	end

	local var_1_2 = Engine.BAJHDFAJJF(var_1_0)

	if IsSystemLink() and not var_1_2 then
		return false
	end

	return true
end

function PRIVATE_MATCH.GameTypeSupportsCustomGames(arg_2_0)
	if CONDITIONS.AreDevFeaturesEnabled() then
		return true
	end

	if CONDITIONS.IsLaunchChunk() then
		return true
	end

	if CONDITIONS.IsThirdGameMode() then
		return arg_2_0 == CP.WAVE_SURVIVAL or arg_2_0 == CP.CLASSIC_MISSIONS
	else
		local var_2_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_2_0, CSV.gameTypesTable.cols.hideInUI)

		return var_2_0 and var_2_0 ~= "1"
	end
end

function PRIVATE_MATCH.MapSupportsCustomGames(arg_3_0)
	if CONDITIONS.AreDevFeaturesEnabled() then
		return true
	end

	if CONDITIONS.IsLaunchChunk() then
		return true
	end

	if Lobby.GetCurrentGameType() == CP.CLASSIC_MISSIONS then
		return CP.GetEnabledClassicMissionsTable()[arg_3_0]
	end

	local var_3_0 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, arg_3_0, CSV.mpMapTable.cols.hideInMapSelect)

	return var_3_0 and #var_3_0 > 0 and var_3_0 ~= "1"
end

function PRIVATE_MATCH.ValidateGameSetup()
	local var_4_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
	local var_4_1 = Lobby.GetCurrentGameType()
	local var_4_2 = PRIVATE_MATCH.GameTypeSupportsCustomGames(var_4_1) and PRIVATE_MATCH.MapSupportsCustomGames(var_4_0)

	if not var_4_2 and not CONDITIONS.AreDevFeaturesEnabled() then
		PRIVATE_MATCH.SetDefaultMatchRules()
	end

	assert(var_4_2, "Current gametype or map is not supported without dev features enabled. (Current GameType: " .. var_4_1 .. "  CurrentMap: " .. var_4_0 .. ")")

	return var_4_2
end

function PRIVATE_MATCH.SetupPrivateMatchLobbyScene(arg_5_0, arg_5_1)
	local var_5_0 = PlayerData.BFFBGAJGD(arg_5_1, CoD.StatsGroup.PrivateLoadouts).squadMembers.loadouts[0].weaponSetups[0].weapon:get() .. "_mp"

	FrontEndScene.RequestWeaponWorldModels({
		var_5_0
	})

	if CONDITIONS.IsCoreMultiplayer() then
		Engine.BBEEIGHJBA("music_mainmenu_mp")
	else
		CP.PlayFrontendMusic()
	end

	MP_COMMON.SetupStreaming(arg_5_0, arg_5_1, true)
	WEAPON.StreamAllWeapons(arg_5_1)
end

function PRIVATE_MATCH.SetDefaultMatchRules(arg_6_0)
	if CONDITIONS.IsLaunchChunk() then
		return
	end

	arg_6_0 = arg_6_0 or {}

	if Dvar.IBEGCHEFE("LLPNKKORPT") or Lobby.DFFFFJHCEH() then
		local var_6_0 = Lobby.GetCurrentGameType()
		local var_6_1 = var_6_0
		local var_6_2 = Dvar.DHEEJCCJBH("OKPMLLKRP")

		if var_6_2 and #var_6_2 > 0 then
			Dvar.BDEHAEGHAF("NSQLTTMRMP", var_6_2)
		end

		if not MatchRules.EAIEFBHGJ() then
			MatchRules.CJGCIGEBB(1)
		end

		if CONDITIONS.IsCoreMultiplayer() then
			if (not PRIVATE_MATCH.GameTypeSupportsCustomGames(var_6_0) or #var_6_0 == 0 or var_6_0 == "trial") and not CONDITIONS.AreDevFeaturesEnabled() then
				var_6_1 = Dvar.DHEEJCCJBH("ORMSMKOKL")

				Dvar.BDEHAEGHAF("MOLPOSLOMO", var_6_1)
				MatchRules.CIGFFEAEFD("gametype", var_6_1)
				MatchRules.BCECADEHDA()

				local var_6_3 = Lobby.GetDefaultMapForGameType(var_6_1)

				Dvar.BDEHAEGHAF("NSQLTTMRMP", var_6_3)
				Engine.DAGFFDGFII("reset OKPMLLKRP")
			end

			if arg_6_0.isTournament then
				MatchRules.CIGFFEAEFD(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.HardcoreModeOn, false)
			end
		elseif CONDITIONS.IsThirdGameMode() and not (var_6_0 == CP.CLASSIC_MISSIONS or var_6_0 == CP.WAVE_SURVIVAL and CONDITIONS.IsSurvivalModeAllowed() or CONDITIONS.AreDevFeaturesEnabled()) and not CONDITIONS.AreDevFeaturesEnabled() then
			var_6_1 = CP.CLASSIC_MISSIONS

			Dvar.BDEHAEGHAF("MOLPOSLOMO", var_6_1)
			MatchRules.CIGFFEAEFD("gametype", var_6_1)
		end

		local var_6_4 = Dvar.DHEEJCCJBH("NSQLTTMRMP")

		if (not PRIVATE_MATCH.MapSupportsCustomGames(var_6_4) or #var_6_4 == 0) and not CONDITIONS.AreDevFeaturesEnabled() then
			local var_6_5 = Lobby.GetDefaultMapForGameType(var_6_1)

			Dvar.BDEHAEGHAF("NSQLTTMRMP", var_6_5)
		end

		local var_6_6 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
		local var_6_7 = Lobby.GetMapIndexByRef(var_6_6)
		local var_6_8

		if var_6_7 and var_6_7 >= 0 then
			var_6_8 = Lobby.GetGameTypesTableForMapIndex(var_6_7)
		end

		if not (var_6_8 and var_6_8[var_6_1]) and not CONDITIONS.AreDevFeaturesEnabled() then
			local var_6_9 = Lobby.GetDefaultMapForGameType(var_6_1)

			assert(var_6_9 and #var_6_9 > 0, "Selected gametype does not have a default map defined in gametypestable.csv")
			Dvar.BDEHAEGHAF("NSQLTTMRMP", var_6_9)
			Engine.DAGFFDGFII("reset OKPMLLKRP")
		end

		if CONDITIONS.IsThirdGameMode() then
			Engine.DAGFFDGFII("enable_pvpe 0")
		end

		Engine.DAGFFDGFII("xupdatepartystate")
	end
end

function PRIVATE_MATCH.DisplayDevCheatWarning(arg_7_0)
	if CONDITIONS.AreDevFeaturesEnabled() then
		local var_7_0 = LUI.UIText.new()

		var_7_0:SetAlignment(LUI.Alignment.Left)
		var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 536, _1080p * 584, _1080p * 604)
		arg_7_0:addElement(var_7_0)

		arg_7_0.CheatLabel = var_7_0

		local var_7_1 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
		local var_7_2 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_7_1, CSV.mpMapTable.cols.hideInMapSelect)

		if #var_7_2 > 0 and var_7_2 ~= "1" then
			var_7_0:SetRGBFromTable(COLORS.white)
			var_7_0:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
			var_7_0:setText(Engine.JCBDICCAH("Dev Cheat Enabled - All Maps & Game Modes allowed!\nToggle \"lui_dev_features_enabled\" to test features only available on Ship."))
		else
			var_7_0:SetRGBFromTable(COLORS.red)
			var_7_0:SetFont(FONTS.GetFont(FONTS.MainBold.File))
			var_7_0:setText(Engine.JCBDICCAH("Dev Cheat Enabled - The current map, \"" .. var_7_1 .. "\", is only available on Dev Builds. ERRORS are expected!\nToggle \"lui_dev_features_enabled\" to test features only available on Ship."))
		end
	end
end

function PRIVATE_MATCH.SetupPrivateMatchTabs(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = LUI.FlowManager.GetScopedData(arg_8_0)
	local var_8_1 = arg_8_2 and arg_8_2.firstTabWidget
	local var_8_2 = arg_8_2 and arg_8_2.firstTabName
	local var_8_3 = arg_8_2 and arg_8_2.callbackFunc

	if var_8_1 == nil then
		if Engine.HEEFCICJE() then
			var_8_1 = "WarzonePrivateMatchLobbyPlayMenu"
		elseif IsPrivateMatch() then
			var_8_1 = "PrivateMatchLobbyPlayMenu"
		elseif IsSystemLink() then
			var_8_1 = "SystemLinkLobbyPlayMenu"
		end
	end

	if var_8_2 == nil then
		var_8_2 = "LUA_MENU/PLAY"
	end

	local function var_8_4(arg_9_0, arg_9_1)
		arg_9_0._backButtonHandlerSet = true

		if not arg_9_0.bindButton then
			arg_9_0.bindButton = LUI.UIBindButton.new()
			arg_9_0.bindButton.id = "selfBindButton"

			arg_9_0:addElement(self.bindButton)
		end

		arg_9_0.bindButton:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
			local var_10_0 = arg_9_0.activeTabWidget
			local var_10_1 = true

			if var_10_0 and var_10_0.BackButtonOverride then
				var_10_1 = var_10_0.BackButtonOverride(arg_10_0, arg_10_1)
			end

			if var_10_1 and arg_9_1 ~= nil then
				arg_9_1(arg_10_0, arg_10_1)
			end
		end)
	end

	if arg_8_2.leaveMenuFunction then
		var_8_4(arg_8_0, arg_8_2.leaveMenuFunction)
	end

	local function var_8_5(arg_11_0)
		if Engine.JEDFGECDJ() > 1 and var_8_0.activeTabIndex ~= 0 then
			local var_11_0 = Engine.CGHHDHCDEC(arg_8_1)

			arg_11_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_left_trigger",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", var_11_0 + 1)
			})
		else
			arg_11_0:AddButtonHelperText({
				helper_text = "",
				button_ref = "button_left_trigger"
			})
		end
	end

	local function var_8_6(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
		if arg_12_0.activeTabWidget and arg_12_0.activeTabWidget.Cleanup and var_8_0.activeTabIndex ~= arg_12_2 then
			arg_12_0.activeTabWidget:Cleanup(arg_12_1)
		end

		if var_8_0.activeTabIndex and arg_12_2 == var_8_0.activeTabIndex and arg_12_0.activeTabWidget then
			return
		end

		TAB.UpdateBuiltWidgetOnTabChange(arg_12_0, var_8_0.activeTabIndex, "activeTabWidget", arg_12_2, arg_12_3, arg_12_4, {
			buildPriority = -1,
			controllerIndex = arg_12_1
		})

		var_8_0.activeTabIndex = arg_12_2

		if arg_12_0._backButtonHandlerSet and arg_12_2 ~= 0 then
			local var_12_0 = arg_12_0.activeTabWidget

			if var_12_0 and not var_12_0.BackButtonOverride then
				function var_12_0.BackButtonOverride(arg_13_0, arg_13_1)
					local var_13_0 = arg_13_1.qualifier ~= "keyboard" and arg_13_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad

					arg_12_0.Tabs:FocusTab(arg_12_1, 0, var_13_0)

					return false
				end
			end
		end

		if arg_12_0.Vignette then
			if arg_12_4 == "PrivateMatchLobbyPlayMenu" then
				arg_12_0.Vignette:SetAlpha(0.7, 250)
			else
				arg_12_0.Vignette:SetAlpha(0, 500)
			end
		end

		if arg_12_4 == "WarzonePrivateMatchLobbyPlayMenu" or arg_12_4 == "PrivateMatchLobbyPlayMenu" or arg_12_4 == "SystemLinkPlayMenu" or arg_12_4 == "SystemLinkLobbyPlayMenu" then
			Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabPlay)
		elseif arg_12_4 == "MPWeaponMenu" then
			Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabWeapons)
		elseif arg_12_4 == "MPOperatorMenu" then
			Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabOperators)
		elseif arg_12_4 == "MPCustomizeMenu" then
			Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabBarracks)
		end

		var_8_5(arg_12_0)
	end

	var_8_5(arg_8_0)
	arg_8_0.bindButton:addEventHandler("button_left_trigger", function(arg_14_0, arg_14_1)
		if Engine.JEDFGECDJ() > 1 and var_8_0.activeTabIndex ~= 0 then
			local var_14_0 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")
			local var_14_1 = var_14_0:GetValue(arg_8_1) or arg_14_1.controller
			local var_14_2 = Engine.CGHHDHCDEC(var_14_1)

			var_14_0:SetValue(var_14_1, var_14_2)
			arg_14_0:AddButtonHelperText({
				helper_text = "",
				button_ref = "button_left_trigger"
			})
			arg_14_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_left_trigger",
				priority = 3,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", var_14_1 + 1)
			})
		end
	end)

	local var_8_7 = {}
	local var_8_8 = {
		name = ToUpperCase(Engine.CBBHFCGDIC(var_8_2)),
		hasDefaultFocus = var_8_0.activeTabIndex == 0,
		focusFunction = function(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
			var_8_6(arg_8_0, arg_15_1, arg_15_2, arg_15_3, var_8_1)

			if var_8_3 then
				var_8_3(arg_15_2)
			end

			if arg_8_0.MapBackgroundImage then
				if Dvar.IBEGCHEFE("tournament_in_system_link") ~= true or not Engine.BHICADFIHA() then
					arg_8_0.MapBackgroundImage:SetAlpha(1, 0)
					arg_8_0.MapBackgroundImage:SetRGBFromTable(COLORS.black)
					arg_8_0.MapBackgroundImage:SetRGBFromTable(COLORS.white, 500)
				else
					arg_8_0.MapBackgroundImage:SetAlpha(0, 0)
				end
			end
		end
	}
	local var_8_9 = {
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WEAPONS")),
		hasDefaultFocus = var_8_0.activeTabIndex == 1,
		focusFunction = function(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
			var_8_6(arg_8_0, arg_16_1, arg_16_2, arg_16_3, "MPWeaponMenu")

			if var_8_3 then
				var_8_3(arg_16_2)
			end

			if arg_8_0.MapBackgroundImage then
				arg_8_0.MapBackgroundImage:SetAlpha(0, 500)
			end
		end
	}
	local var_8_10 = {
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPERATORS")),
		hasDefaultFocus = var_8_0.activeTabIndex == 2,
		focusFunction = function(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
			var_8_6(arg_8_0, arg_17_1, arg_17_2, arg_17_3, "MPOperatorMenu")

			if var_8_3 then
				var_8_3(arg_17_2)
			end

			if arg_8_0.MapBackgroundImage then
				arg_8_0.MapBackgroundImage:SetAlpha(0, 500)
			end
		end
	}
	local var_8_11 = {
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BARRACKS")),
		hasDefaultFocus = var_8_0.activeTabIndex == 3,
		focusFunction = function(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
			var_8_6(arg_8_0, arg_18_1, arg_18_2, arg_18_3, "MPCustomizeMenu")

			if var_8_3 then
				var_8_3(arg_18_2)
			end

			if arg_8_0.MapBackgroundImage then
				arg_8_0.MapBackgroundImage:SetAlpha(0, 500)
			end
		end
	}

	var_8_7[#var_8_7 + 1] = var_8_8

	if Dvar.CFHDGABACF("scr_allow_custom_loadouts") == 1 then
		var_8_7[#var_8_7 + 1] = var_8_9
	end

	var_8_7[#var_8_7 + 1] = var_8_10
	var_8_7[#var_8_7 + 1] = var_8_11

	arg_8_0.Tabs:SetTabs(var_8_7)
	arg_8_0.Tabs:SetAlignment(LUI.Alignment.Left)
end

function PRIVATE_MATCH.GetGameTypeImage(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = ""

	if MatchRules.EAIEFBHGJ() and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.TacticalModeOn) then
		var_19_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_19_0, CSV.gameTypesTable.cols.realismImage)
	elseif MLG.IsCDLActive(arg_19_2) then
		var_19_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_19_0, CSV.gameTypesTable.cols.CDLImage)
	elseif arg_19_1 then
		var_19_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_19_0, CSV.gameTypesTable.cols.hardcoreImage)
	end

	if #var_19_0 == 0 then
		var_19_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_19_0, CSV.gameTypesTable.cols.image)
		var_19_0 = #var_19_0 == 0 and "icon_playlist_generic" or var_19_0
	end

	return var_19_0
end

function PRIVATE_MATCH.GetGameTypeName(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = ""

	if MLG.IsCDLActive(arg_20_2) then
		var_20_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_20_0, CSV.gameTypesTable.cols.CDLName)
	end

	if #var_20_0 == 0 then
		var_20_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_20_0, CSV.gameTypesTable.cols.name)
	end

	if arg_20_1 then
		var_20_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/HARDCORE_GAME_TYPE", var_20_0)
	else
		var_20_0 = Engine.CBBHFCGDIC(var_20_0)
	end

	return var_20_0
end
