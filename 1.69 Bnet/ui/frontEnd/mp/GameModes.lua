module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("GameModes", {
	"host"
})

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 then
		arg_1_0.Fade:SetAlpha(1)
		arg_1_0.Fade:SetAlpha(0, 200)

		if not Onboarding.WarzonePrivateMatch.WasCompleted(arg_1_0, arg_1_1) then
			LUI.FlowManager.RequestPopupMenu(arg_1_0, "onboardingpopup", true, arg_1_1, false, ONBOARDING_DATA.GetOnboardinWarzonePrivateMatchData())
			Onboarding.WarzonePrivateMatch.MarkCompleted(arg_1_0, arg_1_1)
		end

		arg_1_0:registerEventHandler("popup_active", function(arg_2_0, arg_2_1)
			if LUI.FlowManager.IsInStack("AcceptingInvite") and LUI.FlowManager.IsInStack("WarzonePrivateMatchLobby") then
				Lobby.LeaveCustomGameLobby()
				LUI.FlowManager.RequestLeaveMenu(arg_1_0, false, true)
				LUI.FlowManager.RequestLeaveMenuByName("WarzonePrivateMatchLobby", false, true)
			end
		end)
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_3_0.bindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		if arg_3_2 then
			Lobby.LeaveCustomGameLobby()
			LUI.FlowManager.RequestRestoreMenu("BRMainMenu", nil, arg_3_1)
		else
			LUI.FlowManager.RequestLeaveMenu(arg_3_0, true, true)
		end
	end)
end

local function var_0_2()
	local var_5_0 = Lobby.GetCurrentGameType()
	local var_5_1 = Lobby.gameModeCategories.STANDARD

	if MLG.AreMLGRulesEnabled() then
		var_5_1 = Lobby.gameModeCategories.CWL
	else
		for iter_5_0 = 0, StringTable.BFHCAIIDA(CSV.gameTypesTable.file) - 1 do
			local var_5_2 = CSV.ReadRow(CSV.gameTypesTable, iter_5_0)

			if var_5_2.ref == var_5_0 then
				var_5_1 = var_5_2.category

				break
			end
		end
	end

	return var_5_1
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = LUI.FlowManager.GetScopedData(arg_6_0)

	assert(var_6_0.matchmakerSettings)

	if var_6_0.matchmakerSettings then
		var_6_0.matchmakerSettings.recipe = arg_6_2.recipe
		var_6_0.matchmakerSettings.gameType = arg_6_2.ref
	end

	LUI.FlowManager.RequestLeaveMenu(arg_6_0, true, true)
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = LUI.FlowManager.GetScopedData(arg_7_0)

	if var_7_0.matchmakerSettings.gameType ~= arg_7_2.ref then
		var_7_0.matchmakerSettings.gameType = arg_7_2.ref
		var_7_0.matchmakerSettings.recipe = arg_7_2.privateRecipe
		var_7_0.matchmakerSettings.name = arg_7_2.name
		var_7_0.matchmakerSettings.squadSize = arg_7_2.privateSquadSize
		var_7_0.matchmakerSettings.maps[1] = arg_7_2.privateMap

		PRIVATE_MATCH.SetupWarzoneGameType(arg_7_2.ref)
		PRIVATE_MATCH.SetupWarzoneMinPlayerNum(arg_7_2.ref)
		MatchRules.BCECADEHDA(arg_7_2.privateRecipe)
		MatchRules.CIGFFEAEFD(Lobby.MatchRulesMembers.RecipeName, arg_7_2.privateRecipe)
		Engine.EBIDFIDHIE("xsessionupdate;")
	end

	LUI.FlowManager.RequestLeaveMenu(arg_7_0, true, true)
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	assert(arg_8_2)

	local var_8_0 = false
	local var_8_1 = Dvar.CFHDGABACF("NPSTLPMPSS") ~= -1
	local var_8_2 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
	local var_8_3 = Lobby.GetMapIndexByRef(var_8_2)
	local var_8_4 = Lobby.GetGameTypesTableForMapIndex(var_8_3)

	if arg_8_2.category == Lobby.gameModeCategories.MYMODES then
		MatchRules.DBDCFEHABG(arg_8_3)

		var_8_0 = true

		Dvar.DFIJDJFIFD("NPSTLPMPSS", arg_8_3)
	else
		Dvar.DFIJDJFIFD("NPSTLPMPSS", -1)
	end

	local var_8_5 = arg_8_2.ref
	local var_8_6 = Lobby.GetCurrentGameType()

	if var_8_5 ~= var_8_6 or var_8_0 ~= var_8_1 or arg_8_2.isMLGMode ~= MLG.AreMLGRulesEnabled() then
		if var_8_6 then
			Lobby.FixTeamLimitsAndDifficultiesIfNecessary(var_8_6, var_8_5)
		end

		MatchRules.CIGFFEAEFD("gametype", var_8_5)

		if not (var_8_4 and var_8_4[var_8_5]) and not CONDITIONS.AreDevFeaturesEnabled() then
			local var_8_7 = Lobby.GetDefaultMapForGameType(var_8_5)

			assert(var_8_7 and #var_8_7 > 0, "Selected gametype does not have a default map defined in gametypestable.csv")
			Dvar.BDEHAEGHAF("NSQLTTMRMP", var_8_7)

			if CONDITIONS.IsCoreMultiplayer(arg_8_0) then
				Dvar.BDEHAEGHAF("OKPMLLKRP", var_8_7)
			end
		end

		if arg_8_2.category ~= Lobby.gameModeCategories.MYMODES then
			MatchRules.BCECADEHDA()
		end

		local var_8_8 = IsLocalPlay()
		local var_8_9 = IsSystemLink()
		local var_8_10 = IsPrivateMatch()

		if var_8_8 then
			Engine.DAGFFDGFII(MPConfig.default_splitscreen, arg_8_1)
		end

		if var_8_9 then
			Engine.DAGFFDGFII(CoD.GetMPSystemLinkCfg(), arg_8_1)
		end

		if arg_8_2.isMLGMode then
			if MatchRules.DHIADABBII() then
				MatchRules.BIHEJBBCDH()
			end

			MLG.SetUsingMLGRules(true)
			MatchRules.CIGFFEAEFD("cwlRulesEnabled", true)
			Lobby.ClearAllBots()
		else
			LoadoutDrafting.EABHFICBCE(false)
			MLG.SetUsingMLGRules(false)

			if arg_8_2.category ~= Lobby.gameModeCategories.MYMODES then
				MatchRules.BCECADEHDA()
			end
		end

		if var_8_10 then
			Engine.DAGFFDGFII(CoD.GetMPOnlineCfg(), arg_8_1)

			local var_8_11 = Dvar.CFHDGABACF("ROMTTTNL")

			if Dvar.CFHDGABACF("OOTQKOTRM") ~= var_8_11 then
				Dvar.DFIJDJFIFD("OOTQKOTRM", var_8_11)
				Engine.EBIDFIDHIE("xtogprivateslots; xtogprivateslots; xsessionupdate;")
			end
		end

		Engine.DAGFFDGFII("xupdatepartystate")
	end

	LUI.FlowManager.RequestLeaveMenu(arg_8_0, true, true)
end

local function var_0_6(arg_9_0)
	if arg_9_0 then
		if LUI.FlowManager.IsMenuOnTop("GameModes") then
			LUI.FlowManager.RequestLeaveMenuByName("GameModes", true, true)
		end

		if LUI.FlowManager.IsMenuOnTop("LobbySquadActions") then
			LUI.FlowManager.RequestLeaveMenuByName("LobbySquadActions", true, true)
		end

		Lobby.LeaveCustomGameLobby()

		if LUI.FlowManager.IsMenuOnTop("WarzonePrivateMatchLobby") then
			LUI.FlowManager.RequestLeaveMenuByName("WarzonePrivateMatchLobby", true, true)
		end
	end
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_2.button
	local var_10_1 = arg_10_2.categoryInfo
	local var_10_2 = arg_10_2.index
	local var_10_3 = arg_10_2.modeInfo

	if var_10_1 and var_10_1.id == Lobby.gameModeCategories.MYMODES then
		var_10_0.OptionsButton:SetAlpha(1)
		var_10_0.OptionsButton:SetButtonDisabled(false)
		var_10_0.OptionsButton:SetMouseFocusBlocker(false)

		var_10_0.MainButton.navigation = {}
		var_10_0.MainButton.navigation.right = var_10_0.OptionsButton
		var_10_0.OptionsButton.navigation = {}
		var_10_0.OptionsButton.navigation.left = var_10_0.MainButton

		if arg_10_0.Scrollbar then
			arg_10_0.Scrollbar:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 664, _1080p * 674, _1080p * 216, _1080p * 756)
		end
	else
		var_10_0.OptionsButton:SetAlpha(0)
		var_10_0.OptionsButton:SetButtonDisabled(true)
		var_10_0.OptionsButton:SetMouseFocusBlocker(true)

		var_10_0.MainButton.navigation = nil
		var_10_0.OptionsButton.navigation = nil

		if arg_10_0.Scrollbar then
			arg_10_0.Scrollbar:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 541, _1080p * 551, _1080p * 216, _1080p * 756)
		end
	end

	var_10_0.index = var_10_2
	var_10_0.MainButton.modeInfo = var_10_3
	var_10_0.OptionsButton.modeInfo = var_10_3

	var_10_0:InitGameModeButton(arg_10_1)

	if arg_10_0.currentCategoryId == Lobby.gameModeCategories.CWL then
		var_10_0.MainButton.Text:setText(Engine.CBBHFCGDIC(var_10_0.MainButton.modeInfo.CDLName))
	else
		var_10_0.MainButton.Text:setText(var_10_0.MainButton.modeInfo.name)
	end

	if not var_10_0.registeredHandlers then
		var_10_0.registeredHandlers = true

		var_10_0.MainButton:setActionSFX(SOUND_SETS.default.action)
		var_10_0.MainButton:addEventHandler("button_action", function(arg_11_0, arg_11_1)
			local var_11_0 = LUI.FlowManager.GetScopedData(arg_11_0)

			if var_11_0.isTournament then
				var_0_3(arg_10_0, arg_11_1.controller, arg_11_0.modeInfo, var_10_2)
			elseif var_11_0.isWarzone then
				local var_11_1 = true

				if IsPrivateMatch() then
					local var_11_2 = Engine.CGEFDFCIJA()
					local var_11_3 = arg_11_0.modeInfo.privateSquadSize

					if not (var_11_2 <= tonumber(var_11_3)) and var_11_2 > 1 then
						var_11_1 = false

						LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_10_1, false, {
							hideLeaveParty = true,
							invalidPlaylists = {},
							playlistName = var_10_3.name,
							minMaxPlayersAllowed = tonumber(var_11_3),
							leavePartyAction = var_0_6
						})
					end
				end

				if var_11_1 then
					var_0_4(arg_10_0, arg_11_1.controller, arg_11_0.modeInfo, arg_11_0)
					arg_10_0.ModeDetails:SetupSelectedIndicator(arg_10_1, true)
				end
			else
				var_0_5(arg_10_0, arg_11_1.controller, arg_11_0.modeInfo, var_10_2)
			end
		end)
		var_10_0.OptionsButton:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			local var_12_0 = MenuBuilder.BuildRegisteredType("RecipeOptionsPopup", {
				controllerIndex = arg_10_0._controllerIndex,
				buttonIndex = var_10_2
			})

			LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_10_0._controllerIndex, false, {
				disableQuickAccessShortcuts = false,
				widget = var_12_0
			})
		end)
		var_10_0.MainButton:addEventHandler("button_over", function(arg_13_0, arg_13_1)
			local var_13_0 = LUI.FlowManager.GetScopedData(arg_13_0)

			if var_13_0.matchmakerSettings then
				if var_13_0.matchmakerSettings.gameType == arg_13_0.modeInfo.ref then
					arg_10_0.ModeDetails:SetupSelectedIndicator(arg_10_1, true)
				else
					arg_10_0.ModeDetails:SetupSelectedIndicator(arg_10_1, false)
				end
			end

			arg_10_0.ModeDetails:SetMode(arg_13_0.modeInfo, arg_10_0.currentCategoryId)
		end)
		var_10_0.OptionsButton:addEventHandler("button_over", function(arg_14_0, arg_14_1)
			arg_10_0.ModeDetails:SetMode(arg_14_0.modeInfo, arg_10_0.currentCategoryId)
		end)
		var_10_0.MainButton:addEventHandler("grid_anim", function(arg_15_0, arg_15_1)
			arg_15_0:SetAlpha(arg_15_1.value)
		end)
	end
end

local function var_0_8(arg_16_0, arg_16_1)
	local var_16_0 = MenuBuilder.BuildRegisteredType("WarzonePrivateGameModeHeader", {
		controllerIndex = arg_16_0
	})

	var_16_0.id = "gameModeHeader" .. arg_16_1

	var_16_0.Title:setText(arg_16_1)
	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 40)

	return var_16_0
end

local function var_0_9(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = MenuBuilder.BuildRegisteredType("GameModeButton", {
		controllerIndex = arg_17_1
	})
	local var_17_1 = {
		button = var_17_0,
		index = arg_17_2.index,
		modeInfo = arg_17_2
	}

	var_0_7(arg_17_0, arg_17_1, var_17_1)

	return var_17_0
end

local function var_0_10(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_2.modes
	local var_18_1 = arg_18_2.headerName

	arg_18_0.Modes:AddElement(var_0_8(arg_18_1, var_18_1))

	for iter_18_0, iter_18_1 in ipairs(var_18_0) do
		iter_18_1.index = iter_18_0

		if iter_18_1.privateSubAlternative == "0" then
			arg_18_0.Modes:AddElement(var_0_9(arg_18_0, arg_18_1, iter_18_1))
		end
	end
end

local function var_0_11(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_2.modes
	local var_19_1 = arg_19_2.headerAlternativeName
	local var_19_2

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		iter_19_1.index = iter_19_0

		if iter_19_1.privateSubAlternative == "1" then
			var_19_2 = true
		end
	end

	if var_19_2 then
		arg_19_0.Modes:AddElement(var_0_8(arg_19_1, var_19_1))
	end

	for iter_19_2, iter_19_3 in ipairs(var_19_0) do
		iter_19_3.index = iter_19_2

		if iter_19_3.privateSubAlternative == "1" then
			arg_19_0.Modes:AddElement(var_0_9(arg_19_0, arg_19_1, iter_19_3))
		end
	end
end

local function var_0_12(arg_20_0, arg_20_1)
	local var_20_0 = {
		scrollingThresholdX = 1,
		maxRows = 14,
		maxVisibleRows = 14,
		buildArrowsLabel = true,
		wrapX = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 3,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = arg_20_1,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 560,
		rowHeight = _1080p * 40,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}

	arg_20_0.Modes = LUI.UIGrid.new(var_20_0)
	arg_20_0.Modes.id = "Modes"

	arg_20_0.Modes:setUseStencil(true)
	arg_20_0.Modes:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 111, _1080p * 671, _1080p * 216, _1080p * 756)
	arg_20_0:addElement(arg_20_0.Modes)
end

local function var_0_13(arg_21_0, arg_21_1)
	arg_21_0.ModeDetails = MenuBuilder.BuildRegisteredType("ModeDetails", {
		controllerIndex = arg_21_1
	})
	arg_21_0.ModeDetails.id = "ModeDetails"

	arg_21_0.ModeDetails:SetDataSourceThroughElement(arg_21_0.Modes, "DataSources.frontEnd.MP.lobby.modes")
	arg_21_0.ModeDetails.GenericItemInfo.BodyText:setText("", 0)
	arg_21_0.ModeDetails.GenericItemInfo.HeaderText:setText(ToUpperCase(""), 0)
	arg_21_0.ModeDetails:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 718, _1080p * 1392, _1080p * 216, _1080p * 486)
	arg_21_0:addElement(arg_21_0.ModeDetails)
end

local function var_0_14(arg_22_0, arg_22_1)
	if arg_22_0.Modes then
		arg_22_0.Modes:closeTree()

		arg_22_0.Modes = nil
	end

	if arg_22_0.ModeDetails then
		arg_22_0.ModeDetails:closeTree()

		arg_22_0.ModeDetails = nil
	end

	var_0_12(arg_22_0, arg_22_1)
	var_0_13(arg_22_0, arg_22_1)
end

local function var_0_15(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1.modes

	assert(var_23_0)

	arg_23_0.currentCategoryId = arg_23_1.id

	if CONDITIONS.IsWZPrivateMatch(arg_23_0) then
		var_0_14(arg_23_0, arg_23_0._controllerIndex)
		var_0_10(arg_23_0, arg_23_0._controllerIndex, arg_23_1)
		var_0_11(arg_23_0, arg_23_0._controllerIndex, arg_23_1)
		arg_23_0.Modes:SetFocusedPosition({
			x = 0,
			y = 1
		}, true)

		return
	end

	arg_23_0.Modes:SetRefreshChild(function(arg_24_0, arg_24_1, arg_24_2)
		local var_24_0 = arg_23_0.Modes:GetContentIndex(arg_24_1, arg_24_2)
		local var_24_1 = var_23_0[var_24_0 + 1]

		var_0_7(arg_23_0, arg_23_0._controllerIndex, {
			button = arg_24_0,
			categoryInfo = arg_23_1,
			index = var_24_0,
			modeInfo = var_24_1
		})
	end)
	arg_23_0.Modes:SetNumChildren(#var_23_0)
	arg_23_0.Modes:RefreshContent()
	arg_23_0.Modes:SetDefaultFocus(nil)

	local var_23_1 = Lobby.GetCurrentGameType()
	local var_23_2 = false

	for iter_23_0, iter_23_1 in ipairs(var_23_0) do
		if iter_23_1.ref == var_23_1 and iter_23_1.isMLGMode == MLG.AreMLGRulesEnabled() then
			arg_23_0.Modes:SetDefaultFocus({
				x = 0,
				y = iter_23_0 - 1
			})

			var_23_2 = true

			break
		end
	end

	arg_23_0.Modes:processEvent({
		name = "lose_focus",
		controller = arg_23_0._controllerIndex
	})

	if var_23_2 then
		arg_23_0.Modes:GainFocus()
	else
		arg_23_0.Modes:FocusFirstItem()
	end

	if arg_23_1.id == Lobby.gameModeCategories.MYMODES and #var_23_0 == 0 then
		Engine.BJDBIAGIDA(CoD.SFX.FocusGamepad)
		ACTIONS.AnimateSequence(arg_23_0, "NoCustomModesShow")

		if IsLanguageArabic() then
			arg_23_0.NoCustomModesDesc:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 753, _1080p * 1358, _1080p * 296, _1080p * 326)
		end
	else
		ACTIONS.AnimateSequence(arg_23_0, "NoCustomModesHide")
	end
end

local function var_0_16(arg_25_0, arg_25_1)
	local var_25_0 = {
		title = Engine.CBBHFCGDIC(arg_25_1.title),
		message = Engine.CBBHFCGDIC(arg_25_1.message)
	}
	local var_25_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_25_0)

	var_25_1.id = "CustomModeDataErrorPopup"

	return var_25_1
end

MenuBuilder.registerType("CustomModeDataErrorPopup", var_0_16)

local function var_0_17(arg_26_0, arg_26_1)
	if not IsSystemLink() then
		arg_26_0.lobbyTimer = LUI.UITimer.new({
			interval = 500,
			event = "update_lobby"
		})
		arg_26_0.lobbyTimer.id = "lobbyTimer"

		arg_26_0:addElement(arg_26_0.lobbyTimer)
		arg_26_0:registerEventHandler("update_lobby", function(arg_27_0, arg_27_1)
			local var_27_0 = {
				forceSuperfactionBasedOnTeam = true,
				widget = arg_26_0
			}

			Lobby.UpdateClientCharactersDelayed(arg_26_0, arg_26_1, var_27_0)
		end)
	end
end

local function var_0_18(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	if not arg_28_2.isTournament and not arg_28_2.isWarzone then
		local function var_28_0(arg_29_0, arg_29_1)
			arg_28_0:Wait(500).onComplete = function()
				arg_28_0.categories[arg_28_3].modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.MYMODES)

				var_0_15(arg_28_0, arg_28_0.categories[arg_28_3])
			end
		end

		arg_28_0:addEventHandler("recipe_rename_complete", var_28_0)
		arg_28_0:addEventHandler("recipe_delete_complete", var_28_0)
	end
end

local function var_0_19(arg_31_0, arg_31_1)
	assert(arg_31_0.TabBacker)

	local function var_31_0()
		arg_31_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 160)
	end

	arg_31_0:addAndCallEventHandler("onVideoChange", var_31_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_31_0, arg_31_1)
	assert(arg_31_0.Darken)
	ACTIONS.ScaleFullscreen(arg_31_0.Darken)
end

local function var_0_20(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0._myModesCategoryIndex = nil

	if arg_33_2.isTournament then
		arg_33_0.categories = {
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT"),
				id = Lobby.gameModeCategories.PRIVATE_TOURNAMENT,
				modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.PRIVATE_TOURNAMENT)
			}
		}
	elseif CONDITIONS.IsWeGameGovBanned() then
		arg_33_0.categories = {
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/STANDARD_MODES"),
				id = Lobby.gameModeCategories.STANDARD,
				modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.STANDARD)
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/MY_MODES"),
				id = Lobby.gameModeCategories.MYMODES,
				modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.MYMODES)
			}
		}
		arg_33_0._myModesCategoryIndex = 2
	elseif arg_33_2.isWarzone then
		arg_33_0.categories = {}

		local var_33_0 = {
			name = Engine.CBBHFCGDIC("LUA_MENU/GAMEMODE_BATTLE_ROYALE"),
			headerName = Engine.CBBHFCGDIC("LUA_MENU_MP/BR_CORE"),
			headerAlternativeName = Engine.CBBHFCGDIC("LUA_MENU_MP/BR_ALTERNATIVE"),
			id = Lobby.gameModeCategories.BATTLE_ROYALE,
			modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.BATTLE_ROYALE, {
				menu = arg_33_0
			})
		}
		local var_33_1 = {
			name = Engine.CBBHFCGDIC("LUA_MENU/GAMEMODE_PLUNDER"),
			headerName = Engine.CBBHFCGDIC("LUA_MENU_MP/PLUNDER_CORE"),
			headerAlternativeName = Engine.CBBHFCGDIC("LUA_MENU_MP/PLUNDER_ALTERNATIVE"),
			id = Lobby.gameModeCategories.PLUNDER,
			modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.PLUNDER, {
				menu = arg_33_0
			})
		}
		local var_33_2 = {
			name = Engine.CBBHFCGDIC("LUA_MENU_CANTEEN/GAMEMODE_REBIRTH"),
			headerName = Engine.CBBHFCGDIC("LUA_MENU_CANTEEN/REBIRTH_CORE"),
			headerAlternativeName = Engine.CBBHFCGDIC("LUA_MENU_CANTEEN/REBIRTH_ALTERNATIVE"),
			id = Lobby.gameModeCategories.REBIRTH,
			modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.REBIRTH, {
				menu = arg_33_0
			})
		}
		local var_33_3 = {
			name = Engine.CBBHFCGDIC("LUA_MENU_FISHER/GAMEMODE_VANGUARD"),
			headerName = Engine.CBBHFCGDIC("LUA_MENU_FISHER/VANGUARD_CORE"),
			headerAlternativeName = Engine.CBBHFCGDIC("LUA_MENU_FISHER/VANGUARD_ALT"),
			id = Lobby.gameModeCategories.VANGUARD,
			modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.VANGUARD, {
				menu = arg_33_0
			})
		}
		local var_33_4 = {
			name = Engine.CBBHFCGDIC("LUA_MENU/GAMEMODE_FORTUNE"),
			headerName = Engine.CBBHFCGDIC("LUA_MENU/FORTUNE_CORE"),
			headerAlternativeName = Engine.CBBHFCGDIC("LUA_MENU/FORTUNE_ALT"),
			id = Lobby.gameModeCategories.FORTUNE,
			modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.FORTUNE, {
				menu = arg_33_0
			})
		}
		local var_33_5 = {
			name = Engine.CBBHFCGDIC("LUA_MENU/GAMEMODE_WARZONE_ALTERNATE"),
			headerName = Engine.CBBHFCGDIC("LUA_MENU_MP/ALTERNATIVE"),
			headerAlternativeName = Engine.CBBHFCGDIC("LUA_MENU_MP/ALTERNATIVE"),
			id = Lobby.gameModeCategories.WARZONE_ALTERNATE,
			modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.WARZONE_ALTERNATE, {
				menu = arg_33_0
			})
		}

		if var_33_0.modes and #var_33_0.modes > 0 then
			table.insert(arg_33_0.categories, var_33_0)
		end

		if var_33_1.modes and #var_33_1.modes > 0 then
			table.insert(arg_33_0.categories, var_33_1)
		end

		if var_33_2.modes and #var_33_2.modes > 0 then
			table.insert(arg_33_0.categories, var_33_2)
		end

		if var_33_3.modes and #var_33_3.modes > 0 then
			table.insert(arg_33_0.categories, var_33_3)
		end

		if var_33_4.modes and #var_33_4.modes > 0 then
			table.insert(arg_33_0.categories, var_33_4)
		end

		if var_33_5.modes and #var_33_5.modes > 0 then
			table.insert(arg_33_0.categories, var_33_5)
		end
	else
		arg_33_0.categories = {
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/STANDARD_MODES"),
				id = Lobby.gameModeCategories.STANDARD,
				modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.STANDARD)
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/ALTERNATE_MODES"),
				id = Lobby.gameModeCategories.ALTERNATE,
				modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.ALTERNATE)
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/CWL_MODES"),
				id = Lobby.gameModeCategories.CWL,
				modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.CWL)
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/MY_MODES"),
				id = Lobby.gameModeCategories.MYMODES,
				modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.MYMODES)
			}
		}
		arg_33_0._myModesCategoryIndex = 4
	end
end

local function var_0_21(arg_34_0, arg_34_1)
	assert(arg_34_0.Tabs)
	assert(arg_34_0.categories)

	local var_34_0 = {}
	local var_34_1 = var_0_2()

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.categories) do
		table.insert(var_34_0, {
			name = iter_34_1.name,
			focusFunction = function()
				var_0_15(arg_34_0, iter_34_1)
				Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
			end,
			hasDefaultFocus = iter_34_1.id == var_34_1
		})
	end

	arg_34_0.Tabs:SetTabs(var_34_0)
end

local function var_0_22(arg_36_0, arg_36_1, arg_36_2)
	arg_36_0._controllerIndex = arg_36_1

	var_0_20(arg_36_0, arg_36_1, arg_36_2)
	var_0_21(arg_36_0, arg_36_1)
	var_0_18(arg_36_0, arg_36_1, arg_36_2, arg_36_0._myModesCategoryIndex)
	var_0_17(arg_36_0, arg_36_1)
	var_0_19(arg_36_0, arg_36_1)
	arg_36_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/GAME_TYPES"))

	local var_36_0 = arg_36_2.isWarzonePrivateMatchHost and arg_36_2.isWarzone and CONDITIONS.IsMagmaGameMode() and IsPrivateMatch()

	var_0_1(arg_36_0, arg_36_1, var_36_0)
	var_0_0(arg_36_0, arg_36_1, var_36_0)
end

function GameModes(arg_37_0, arg_37_1)
	local var_37_0 = LUI.UIElement.new()

	var_37_0.id = "GameModes"
	var_37_0._animationSets = var_37_0._animationSets or {}
	var_37_0._sequences = var_37_0._sequences or {}

	local var_37_1 = arg_37_1 and arg_37_1.controllerIndex

	if not var_37_1 and not Engine.DDJFBBJAIG() then
		var_37_1 = var_37_0:getRootController()
	end

	assert(var_37_1)

	var_37_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_37_1
	})
	var_37_0.HelperBar.id = "HelperBar"

	var_37_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_37_0.HelperBar:setPriority(10)
	var_37_0:addElement(var_37_0.HelperBar)

	local var_37_2 = var_37_0
	local var_37_3
	local var_37_4 = {
		worldBlur = 1,
		controllerIndex = var_37_1
	}
	local var_37_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_37_4)

	var_37_5.id = "WorldBlur"

	var_37_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, _1080p * 54, 0)
	var_37_0:addElement(var_37_5)

	var_37_0.WorldBlur = var_37_5

	local var_37_6
	local var_37_7 = LUI.UIImage.new()

	var_37_7.id = "Darken"

	var_37_7:SetRGBFromInt(0, 0)
	var_37_7:SetAlpha(0.5, 0)
	var_37_0:addElement(var_37_7)

	var_37_0.Darken = var_37_7

	local var_37_8
	local var_37_9 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_37_1
	})

	var_37_9.id = "Cinematic"

	var_37_0:addElement(var_37_9)

	var_37_0.Cinematic = var_37_9

	local var_37_10
	local var_37_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_37_1
	})

	var_37_11.id = "TabBacker"

	var_37_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_37_0:addElement(var_37_11)

	var_37_0.TabBacker = var_37_11

	local var_37_12

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		local var_37_13 = {
			scrollingThresholdX = 1,
			buildArrowsLabel = true,
			maxVelocity = 5000,
			adjustSizeToContent = false,
			scrollingThresholdY = 3,
			wrapX = false,
			maxVisibleColumns = 1,
			maxVisibleRows = 11,
			wrapY = true,
			arrowsVerticalOffset = 0,
			springCoefficient = 400,
			controllerIndex = var_37_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("GameModeButton", {
					controllerIndex = var_37_1
				})
			end,
			refreshChild = function(arg_39_0, arg_39_1, arg_39_2)
				return
			end,
			spacingX = _1080p * 10,
			spacingY = _1080p * 10,
			columnWidth = _1080p * 560,
			rowHeight = _1080p * 40,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_37_12 = LUI.UIGrid.new(var_37_13)
		var_37_12.id = "Modes"

		var_37_12:setUseStencil(true)
		var_37_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 111, _1080p * 671, _1080p * 216, _1080p * 756)
		var_37_0:addElement(var_37_12)

		var_37_0.Modes = var_37_12
	end

	local var_37_14

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		var_37_14 = MenuBuilder.BuildRegisteredType("ModeDetails", {
			controllerIndex = var_37_1
		})
		var_37_14.id = "ModeDetails"

		if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
			var_37_14:SetDataSourceThroughElement(var_37_12, "DataSources.frontEnd.MP.lobby.modes")
		end

		var_37_14.GenericItemInfo.BodyText:setText("", 0)
		var_37_14.GenericItemInfo.HeaderText:setText(ToUpperCase(""), 0)
		var_37_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 718, _1080p * 1392, _1080p * 216, _1080p * 416)
		var_37_0:addElement(var_37_14)

		var_37_0.ModeDetails = var_37_14
	end

	local var_37_15
	local var_37_16 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_37_1
	})

	var_37_16.id = "MenuTitle"

	var_37_16.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/GAME_TYPES")), 0)
	var_37_16.Line:SetLeft(0, 0)
	var_37_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_37_0:addElement(var_37_16)

	var_37_0.MenuTitle = var_37_16

	local var_37_17

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		var_37_17 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
			controllerIndex = var_37_1
		})
		var_37_17.id = "Scrollbar"

		var_37_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 536, _1080p * 546, _1080p * 216, _1080p * 756)
		var_37_0:addElement(var_37_17)

		var_37_0.Scrollbar = var_37_17
	end

	local var_37_18
	local var_37_19 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_37_1
	})

	var_37_19.id = "NoCustomModesBG"

	var_37_19:SetAlpha(0.6, 0)
	var_37_19.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_37_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 718, _1080p * 1392, _1080p * 216, _1080p * 416)
	var_37_0:addElement(var_37_19)

	var_37_0.NoCustomModesBG = var_37_19

	local var_37_20
	local var_37_21 = LUI.UIText.new()

	var_37_21.id = "NoCustomModesDesc"

	var_37_21:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_37_21:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_CUSTOM_MODES_DESC"), 0)
	var_37_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_37_21:SetLeading(5 * _1080p, 0)
	var_37_21:SetAlignment(LUI.Alignment.Left)
	var_37_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 753, _1080p * 1358, _1080p * 296, _1080p * 317)
	var_37_0:addElement(var_37_21)

	var_37_0.NoCustomModesDesc = var_37_21

	local var_37_22
	local var_37_23 = LUI.UIStyledText.new()

	var_37_23.id = "NoCustomModesTitle"

	var_37_23:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_37_23:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NO_CUSTOM_MODES_TITLE")), 0)
	var_37_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_37_23:SetWordWrap(false)
	var_37_23:SetAlignment(LUI.Alignment.Left)
	var_37_23:SetOptOutRightToLeftAlignmentFlip(true)
	var_37_23:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_37_23:SetStartupDelay(1000)
	var_37_23:SetLineHoldTime(400)
	var_37_23:SetAnimMoveTime(150)
	var_37_23:SetAnimMoveSpeed(50)
	var_37_23:SetEndDelay(1000)
	var_37_23:SetCrossfadeTime(400)
	var_37_23:SetFadeInTime(300)
	var_37_23:SetFadeOutTime(300)
	var_37_23:SetMaxVisibleLines(1)
	var_37_23:SetDecodeLetterLength(30)
	var_37_23:SetDecodeMaxRandChars(6)
	var_37_23:SetDecodeUpdatesPerLetter(4)
	var_37_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 753, _1080p * 1355, _1080p * 246, _1080p * 296)
	var_37_0:addElement(var_37_23)

	var_37_0.NoCustomModesTitle = var_37_23

	local var_37_24

	if CONDITIONS.InFrontendPublicMP(var_37_0) then
		local var_37_25 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_37_1
		})

		var_37_25.id = "MPPlayerDetails"

		var_37_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_37_0:addElement(var_37_25)

		var_37_0.MPPlayerDetails = var_37_25
	end

	local var_37_26
	local var_37_27 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_37_1
			})
		end,
		controllerIndex = var_37_1
	}
	local var_37_28 = LUI.TabManager.new(var_37_27)

	var_37_28.id = "Tabs"

	var_37_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 91, _1080p * 991, _1080p * 108, _1080p * 160)
	var_37_0:addElement(var_37_28)

	var_37_0.Tabs = var_37_28

	local var_37_29
	local var_37_30 = LUI.UIImage.new()

	var_37_30.id = "Fade"

	var_37_30:SetRGBFromInt(0, 0)
	var_37_30:SetAlpha(0, 0)
	var_37_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -97, _1080p * 2017, _1080p * -80, _1080p * 1160)
	var_37_0:addElement(var_37_30)

	var_37_0.Fade = var_37_30

	local function var_37_31()
		return
	end

	var_37_0._sequences.DefaultSequence = var_37_31

	local var_37_32

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		local var_37_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_37_12:RegisterAnimationSequence("NoCustomModesShow", var_37_33)
	end

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		local var_37_34 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_37_14:RegisterAnimationSequence("NoCustomModesShow", var_37_34)
	end

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		local var_37_35 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_37_17:RegisterAnimationSequence("NoCustomModesShow", var_37_35)
	end

	local var_37_36 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_37_19:RegisterAnimationSequence("NoCustomModesShow", var_37_36)

	local var_37_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_37_21:RegisterAnimationSequence("NoCustomModesShow", var_37_37)

	local var_37_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_37_23:RegisterAnimationSequence("NoCustomModesShow", var_37_38)

	local function var_37_39()
		if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
			var_37_12:AnimateSequence("NoCustomModesShow")
		end

		if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
			var_37_14:AnimateSequence("NoCustomModesShow")
		end

		if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
			var_37_17:AnimateSequence("NoCustomModesShow")
		end

		var_37_19:AnimateSequence("NoCustomModesShow")
		var_37_21:AnimateSequence("NoCustomModesShow")
		var_37_23:AnimateSequence("NoCustomModesShow")
	end

	var_37_0._sequences.NoCustomModesShow = var_37_39

	local var_37_40

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		local var_37_41 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_37_12:RegisterAnimationSequence("NoCustomModesHide", var_37_41)
	end

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		local var_37_42 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_37_14:RegisterAnimationSequence("NoCustomModesHide", var_37_42)
	end

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		local var_37_43 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_37_17:RegisterAnimationSequence("NoCustomModesHide", var_37_43)
	end

	local var_37_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_37_19:RegisterAnimationSequence("NoCustomModesHide", var_37_44)

	local var_37_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_37_21:RegisterAnimationSequence("NoCustomModesHide", var_37_45)

	local var_37_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_37_23:RegisterAnimationSequence("NoCustomModesHide", var_37_46)

	local function var_37_47()
		if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
			var_37_12:AnimateSequence("NoCustomModesHide")
		end

		if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
			var_37_14:AnimateSequence("NoCustomModesHide")
		end

		if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
			var_37_17:AnimateSequence("NoCustomModesHide")
		end

		var_37_19:AnimateSequence("NoCustomModesHide")
		var_37_21:AnimateSequence("NoCustomModesHide")
		var_37_23:AnimateSequence("NoCustomModesHide")
	end

	var_37_0._sequences.NoCustomModesHide = var_37_47

	local var_37_48

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		local var_37_49 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 486
			}
		}

		var_37_14:RegisterAnimationSequence("WZPrivateMatch", var_37_49)
	end

	local function var_37_50()
		if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
			var_37_14:AnimateSequence("WZPrivateMatch")
		end
	end

	var_37_0._sequences.WZPrivateMatch = var_37_50

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) and CONDITIONS.IsWZPrivateMatch(var_37_0) then
		ACTIONS.AnimateSequence(var_37_0, "WZPrivateMatch")
	end

	ACTIONS.AnimateSequence(var_37_0, "NoCustomModesHide")

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		var_37_14:SetDataSourceThroughElement(var_37_12, "DataSources.frontEnd.MP.lobby.modes")
	end

	if not CONDITIONS.IsWZPrivateMatch(var_37_0) and not CONDITIONS.IsWZPrivateMatch(var_37_0) then
		local var_37_51 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.vertical,
			eventListener = var_37_17,
			startCap = var_37_17.startCap,
			endCap = var_37_17.endCap,
			sliderArea = var_37_17.sliderArea,
			slider = var_37_17.sliderArea and var_37_17.sliderArea.slider,
			fixedSizeSlider = var_37_17.sliderArea and var_37_17.sliderArea.fixedSizeSlider
		})

		var_37_12:AddScrollbar(var_37_51)
	end

	var_37_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_37_52 = LUI.UIBindButton.new()

	var_37_52.id = "selfBindButton"

	var_37_0:addElement(var_37_52)

	var_37_0.bindButton = var_37_52

	var_0_22(var_37_0, var_37_1, arg_37_1)

	return var_37_0
end

MenuBuilder.registerType("GameModes", GameModes)
LockTable(_M)
