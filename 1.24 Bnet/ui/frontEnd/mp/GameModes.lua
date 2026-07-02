module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("GameModes", {
	"host"
})

local function var_0_0()
	local var_1_0 = Lobby.GetCurrentGameType()
	local var_1_1 = Lobby.gameModeCategories.STANDARD

	if MLG.AreMLGRulesEnabled() then
		var_1_1 = Lobby.gameModeCategories.CWL
	else
		for iter_1_0 = 0, StringTable.BFHCAIIDA(CSV.gameTypesTable.file) - 1 do
			local var_1_2 = CSV.ReadRow(CSV.gameTypesTable, iter_1_0)

			if var_1_2.ref == var_1_0 then
				var_1_1 = var_1_2.category

				break
			end
		end
	end

	return var_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = LUI.FlowManager.GetScopedData(arg_2_0)

	assert(var_2_0.matchmakerSettings)

	if var_2_0.matchmakerSettings then
		var_2_0.matchmakerSettings.recipe = arg_2_2.recipe
		var_2_0.matchmakerSettings.gameType = arg_2_2.ref
	end

	LUI.FlowManager.RequestLeaveMenu(arg_2_0, true, true)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	assert(arg_3_2)

	local var_3_0 = false
	local var_3_1 = Dvar.CFHDGABACF("NPSTLPMPSS") ~= -1
	local var_3_2 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
	local var_3_3 = Lobby.GetMapIndexByRef(var_3_2)
	local var_3_4 = Lobby.GetGameTypesTableForMapIndex(var_3_3)

	if arg_3_2.category == Lobby.gameModeCategories.MYMODES then
		MatchRules.DBDCFEHABG(arg_3_3)

		var_3_0 = true

		Dvar.DFIJDJFIFD("NPSTLPMPSS", arg_3_3)
	else
		Dvar.DFIJDJFIFD("NPSTLPMPSS", -1)
	end

	local var_3_5 = arg_3_2.ref
	local var_3_6 = Lobby.GetCurrentGameType()

	if var_3_5 ~= var_3_6 or var_3_0 ~= var_3_1 or arg_3_2.isMLGMode ~= MLG.AreMLGRulesEnabled() then
		if var_3_6 then
			Lobby.FixTeamLimitsAndDifficultiesIfNecessary(var_3_6, var_3_5)
		end

		MatchRules.CIGFFEAEFD("gametype", var_3_5)

		if not (var_3_4 and var_3_4[var_3_5]) and not CONDITIONS.AreDevFeaturesEnabled() then
			local var_3_7 = Lobby.GetDefaultMapForGameType(var_3_5)

			assert(var_3_7 and #var_3_7 > 0, "Selected gametype does not have a default map defined in gametypestable.csv")
			Dvar.BDEHAEGHAF("NSQLTTMRMP", var_3_7)

			if CONDITIONS.IsCoreMultiplayer(arg_3_0) then
				Dvar.BDEHAEGHAF("OKPMLLKRP", var_3_7)
			end
		end

		if arg_3_2.category ~= Lobby.gameModeCategories.MYMODES then
			MatchRules.BCECADEHDA()
		end

		local var_3_8 = IsLocalPlay()
		local var_3_9 = IsSystemLink()
		local var_3_10 = IsPrivateMatch()

		if var_3_8 then
			Engine.DAGFFDGFII(MPConfig.default_splitscreen, arg_3_1)
		end

		if var_3_9 then
			Engine.DAGFFDGFII(CoD.GetMPSystemLinkCfg(), arg_3_1)
		end

		if arg_3_2.isMLGMode then
			if MatchRules.DHIADABBII() then
				MatchRules.BIHEJBBCDH()
			end

			MLG.SetUsingMLGRules(true)
			MatchRules.CIGFFEAEFD("cwlRulesEnabled", true)
			Lobby.ClearAllBots()
		else
			LoadoutDrafting.EABHFICBCE(false)
			MLG.SetUsingMLGRules(false)

			if arg_3_2.category ~= Lobby.gameModeCategories.MYMODES then
				MatchRules.BCECADEHDA()
			end
		end

		if var_3_10 then
			Engine.DAGFFDGFII(CoD.GetMPOnlineCfg(), arg_3_1)

			local var_3_11 = Dvar.CFHDGABACF("ROMTTTNL")

			if Dvar.CFHDGABACF("OOTQKOTRM") ~= var_3_11 then
				Dvar.DFIJDJFIFD("OOTQKOTRM", var_3_11)
				Engine.EBIDFIDHIE("xtogprivateslots; xtogprivateslots; xsessionupdate;")
			end
		end

		Engine.DAGFFDGFII("xupdatepartystate")
	end

	LUI.FlowManager.RequestLeaveMenu(arg_3_0, true, true)
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.modes

	assert(var_4_0)

	arg_4_0.currentCategoryId = arg_4_1.id

	arg_4_0.Modes:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_4_1.id == Lobby.gameModeCategories.MYMODES then
			arg_5_0.OptionsButton:SetAlpha(1)
			arg_5_0.OptionsButton:SetButtonDisabled(false)
			arg_5_0.OptionsButton:SetMouseFocusBlocker(false)

			arg_5_0.MainButton.navigation = {}
			arg_5_0.MainButton.navigation.right = arg_5_0.OptionsButton
			arg_5_0.OptionsButton.navigation = {}
			arg_5_0.OptionsButton.navigation.left = arg_5_0.MainButton

			arg_4_0.Scrollbar:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 664, _1080p * 674, _1080p * 216, _1080p * 756)
		else
			arg_5_0.OptionsButton:SetAlpha(0)
			arg_5_0.OptionsButton:SetButtonDisabled(true)
			arg_5_0.OptionsButton:SetMouseFocusBlocker(true)

			arg_5_0.MainButton.navigation = nil
			arg_5_0.OptionsButton.navigation = nil

			arg_4_0.Scrollbar:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 541, _1080p * 551, _1080p * 216, _1080p * 756)
		end

		local var_5_0 = arg_4_0.Modes:GetContentIndex(arg_5_1, arg_5_2)

		arg_5_0.MainButton.modeInfo = var_4_0[var_5_0 + 1]
		arg_5_0.OptionsButton.modeInfo = var_4_0[var_5_0 + 1]

		if arg_4_0.currentCategoryId == Lobby.gameModeCategories.CWL then
			arg_5_0.MainButton.Text:setText(Engine.CBBHFCGDIC(arg_5_0.MainButton.modeInfo.CDLName))
		else
			arg_5_0.MainButton.Text:setText(arg_5_0.MainButton.modeInfo.name)
		end

		if not arg_5_0.registeredHandlers then
			arg_5_0.registeredHandlers = true

			arg_5_0.MainButton:setActionSFX(SOUND_SETS.default.action)
			arg_5_0.MainButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
				local var_6_0 = LUI.FlowManager.GetScopedData(arg_6_0)

				if var_6_0.isTournament or var_6_0.isWarzone then
					var_0_1(arg_4_0, arg_6_1.controller, arg_6_0.modeInfo, var_5_0)
				else
					var_0_2(arg_4_0, arg_6_1.controller, arg_6_0.modeInfo, var_5_0)
				end
			end)
			arg_5_0.OptionsButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
				local var_7_0 = MenuBuilder.BuildRegisteredType("RecipeOptionsPopup", {
					controllerIndex = arg_4_0._controllerIndex,
					buttonIndex = var_5_0
				})

				LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_4_0._controllerIndex, false, {
					disableQuickAccessShortcuts = false,
					widget = var_7_0
				})
			end)
			arg_5_0.MainButton:addEventHandler("button_over", function(arg_8_0, arg_8_1)
				arg_4_0.ModeDetails:SetMode(arg_8_0.modeInfo, arg_4_0.currentCategoryId)
			end)
			arg_5_0.OptionsButton:addEventHandler("button_over", function(arg_9_0, arg_9_1)
				arg_4_0.ModeDetails:SetMode(arg_9_0.modeInfo, arg_4_0.currentCategoryId)
			end)
			arg_5_0.MainButton:addEventHandler("grid_anim", function(arg_10_0, arg_10_1)
				arg_10_0:SetAlpha(arg_10_1.value)
			end)
		end
	end)
	arg_4_0.Modes:SetNumChildren(#var_4_0)
	arg_4_0.Modes:RefreshContent()
	arg_4_0.Modes:SetDefaultFocus(nil)

	local var_4_1 = Lobby.GetCurrentGameType()
	local var_4_2 = false

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		if iter_4_1.ref == var_4_1 and iter_4_1.isMLGMode == MLG.AreMLGRulesEnabled() then
			arg_4_0.Modes:SetDefaultFocus({
				x = 0,
				y = iter_4_0 - 1
			})

			var_4_2 = true

			break
		end
	end

	arg_4_0.Modes:processEvent({
		name = "lose_focus",
		controller = arg_4_0._controllerIndex
	})

	if var_4_2 then
		arg_4_0.Modes:GainFocus()
	else
		arg_4_0.Modes:FocusFirstItem()
	end

	if arg_4_1.id == Lobby.gameModeCategories.MYMODES and #var_4_0 == 0 then
		Engine.BJDBIAGIDA(CoD.SFX.FocusGamepad)
		ACTIONS.AnimateSequence(arg_4_0, "NoCustomModesShow")

		if IsLanguageArabic() then
			arg_4_0.NoCustomModesDesc:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 753, _1080p * 1358, _1080p * 296, _1080p * 326)
		end
	else
		ACTIONS.AnimateSequence(arg_4_0, "NoCustomModesHide")
	end
end

local function var_0_4(arg_11_0, arg_11_1)
	local var_11_0 = {
		title = Engine.CBBHFCGDIC(arg_11_1.title),
		message = Engine.CBBHFCGDIC(arg_11_1.message)
	}
	local var_11_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_11_0)

	var_11_1.id = "CustomModeDataErrorPopup"

	return var_11_1
end

MenuBuilder.registerType("CustomModeDataErrorPopup", var_0_4)

local function var_0_5(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_0.Tabs)

	arg_12_0._controllerIndex = arg_12_1

	if not IsSystemLink() then
		local var_12_0 = LUI.UITimer.new({
			interval = 500,
			event = "update_lobby"
		})

		var_12_0.id = "lobbyTimer"

		arg_12_0:addElement(var_12_0)
		arg_12_0:registerEventHandler("update_lobby", function(arg_13_0, arg_13_1)
			local var_13_0 = {
				forceSuperfactionBasedOnTeam = true,
				widget = arg_12_0
			}

			Lobby.UpdateClientCharacters(arg_12_1, var_13_0)
		end)
	end

	local var_12_1

	if arg_12_2.isTournament then
		arg_12_0.categories = {
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT"),
				id = Lobby.gameModeCategories.PRIVATE_TOURNAMENT,
				modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.PRIVATE_TOURNAMENT)
			}
		}
	elseif CONDITIONS.IsWeGameGovBanned() then
		arg_12_0.categories = {
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
		var_12_1 = 2
	elseif arg_12_2.isWarzone then
		arg_12_0.categories = {
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/GAMEMODE_BATTLE_ROYALE"),
				id = Lobby.gameModeCategories.BATTLE_ROYALE,
				modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.BATTLE_ROYALE)
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/GAMEMODE_PLUNDER"),
				id = Lobby.gameModeCategories.PLUNDER,
				modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.PLUNDER)
			},
			{
				name = Engine.CBBHFCGDIC("LUA_MENU/GAMEMODE_WARZONE_ALTERNATE"),
				id = Lobby.gameModeCategories.WARZONE_ALTERNATE,
				modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.WARZONE_ALTERNATE)
			}
		}
	else
		arg_12_0.categories = {
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
		var_12_1 = 4
	end

	arg_12_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/GAME_TYPES"))

	local var_12_2 = {}
	local var_12_3 = var_0_0()

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.categories) do
		table.insert(var_12_2, {
			name = iter_12_1.name,
			focusFunction = function()
				var_0_3(arg_12_0, iter_12_1)
				Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
			end,
			hasDefaultFocus = iter_12_1.id == var_12_3
		})
	end

	arg_12_0.Tabs:SetTabs(var_12_2)

	if not arg_12_2.isTournament and not arg_12_2.isWarzone then
		local function var_12_4(arg_15_0, arg_15_1)
			arg_12_0:Wait(500).onComplete = function()
				arg_12_0.categories[var_12_1].modes = Lobby.GetModesForCategory(Lobby.gameModeCategories.MYMODES)

				var_0_3(arg_12_0, arg_12_0.categories[var_12_1])
			end
		end

		arg_12_0:addEventHandler("recipe_rename_complete", var_12_4)
		arg_12_0:addEventHandler("recipe_delete_complete", var_12_4)
	end

	assert(arg_12_0.TabBacker)

	local function var_12_5()
		arg_12_0.TabBacker:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 160)
	end

	arg_12_0:addAndCallEventHandler("onVideoChange", var_12_5)
	LAYOUT.AddAspectRatioFadeFrame(arg_12_0, arg_12_1)
	assert(arg_12_0.Darken)
	ACTIONS.ScaleFullscreen(arg_12_0.Darken)
end

function GameModes(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0.id = "GameModes"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	var_18_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_18_1
	})
	var_18_0.HelperBar.id = "HelperBar"

	var_18_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_18_0.HelperBar:setPriority(10)
	var_18_0:addElement(var_18_0.HelperBar)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = {
		worldBlur = 1,
		controllerIndex = var_18_1
	}
	local var_18_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_18_4)

	var_18_5.id = "WorldBlur"

	var_18_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, _1080p * 54, 0)
	var_18_0:addElement(var_18_5)

	var_18_0.WorldBlur = var_18_5

	local var_18_6
	local var_18_7 = LUI.UIImage.new()

	var_18_7.id = "Darken"

	var_18_7:SetRGBFromInt(0, 0)
	var_18_7:SetAlpha(0.5, 0)
	var_18_0:addElement(var_18_7)

	var_18_0.Darken = var_18_7

	local var_18_8
	local var_18_9 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_18_1
	})

	var_18_9.id = "Cinematic"

	var_18_0:addElement(var_18_9)

	var_18_0.Cinematic = var_18_9

	local var_18_10
	local var_18_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_18_1
	})

	var_18_11.id = "TabBacker"

	var_18_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_18_0:addElement(var_18_11)

	var_18_0.TabBacker = var_18_11

	local var_18_12
	local var_18_13 = {
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
		controllerIndex = var_18_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GameModeButton", {
				controllerIndex = var_18_1
			})
		end,
		refreshChild = function(arg_20_0, arg_20_1, arg_20_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 560,
		rowHeight = _1080p * 40,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_18_14 = LUI.UIGrid.new(var_18_13)

	var_18_14.id = "Modes"

	var_18_14:setUseStencil(true)
	var_18_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 111, _1080p * 671, _1080p * 216, _1080p * 756)
	var_18_0:addElement(var_18_14)

	var_18_0.Modes = var_18_14

	local var_18_15
	local var_18_16 = MenuBuilder.BuildRegisteredType("ModeDetails", {
		controllerIndex = var_18_1
	})

	var_18_16.id = "ModeDetails"

	var_18_16:SetDataSourceThroughElement(var_18_14, "DataSources.frontEnd.MP.lobby.modes")
	var_18_16.GenericItemInfo.BodyText:setText("", 0)
	var_18_16.GenericItemInfo.HeaderText:setText(ToUpperCase(""), 0)
	var_18_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 718, _1080p * 1392, _1080p * 216, _1080p * 416)
	var_18_0:addElement(var_18_16)

	var_18_0.ModeDetails = var_18_16

	local var_18_17
	local var_18_18 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_18_1
	})

	var_18_18.id = "MenuTitle"

	var_18_18.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/GAME_TYPES")), 0)
	var_18_18.Line:SetLeft(0, 0)
	var_18_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_18_0:addElement(var_18_18)

	var_18_0.MenuTitle = var_18_18

	local var_18_19
	local var_18_20 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_18_1
	})

	var_18_20.id = "Scrollbar"

	var_18_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 536, _1080p * 546, _1080p * 216, _1080p * 756)
	var_18_0:addElement(var_18_20)

	var_18_0.Scrollbar = var_18_20

	local var_18_21
	local var_18_22 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_18_1
	})

	var_18_22.id = "NoCustomModesBG"

	var_18_22:SetAlpha(0.6, 0)
	var_18_22.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_18_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 718, _1080p * 1392, _1080p * 216, _1080p * 416)
	var_18_0:addElement(var_18_22)

	var_18_0.NoCustomModesBG = var_18_22

	local var_18_23
	local var_18_24 = LUI.UIText.new()

	var_18_24.id = "NoCustomModesDesc"

	var_18_24:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_18_24:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_CUSTOM_MODES_DESC"), 0)
	var_18_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_24:SetLeading(5 * _1080p, 0)
	var_18_24:SetAlignment(LUI.Alignment.Left)
	var_18_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 753, _1080p * 1358, _1080p * 296, _1080p * 317)
	var_18_0:addElement(var_18_24)

	var_18_0.NoCustomModesDesc = var_18_24

	local var_18_25
	local var_18_26 = LUI.UIStyledText.new()

	var_18_26.id = "NoCustomModesTitle"

	var_18_26:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_18_26:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NO_CUSTOM_MODES_TITLE")), 0)
	var_18_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_26:SetWordWrap(false)
	var_18_26:SetAlignment(LUI.Alignment.Left)
	var_18_26:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_26:SetStartupDelay(1000)
	var_18_26:SetLineHoldTime(400)
	var_18_26:SetAnimMoveTime(150)
	var_18_26:SetAnimMoveSpeed(50)
	var_18_26:SetEndDelay(1000)
	var_18_26:SetCrossfadeTime(400)
	var_18_26:SetFadeInTime(300)
	var_18_26:SetFadeOutTime(300)
	var_18_26:SetMaxVisibleLines(1)
	var_18_26:SetDecodeLetterLength(30)
	var_18_26:SetDecodeMaxRandChars(6)
	var_18_26:SetDecodeUpdatesPerLetter(4)
	var_18_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 753, _1080p * 1355, _1080p * 246, _1080p * 296)
	var_18_0:addElement(var_18_26)

	var_18_0.NoCustomModesTitle = var_18_26

	local var_18_27

	if CONDITIONS.InFrontendPublicMP(var_18_0) then
		local var_18_28 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_18_1
		})

		var_18_28.id = "MPPlayerDetails"

		var_18_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_18_0:addElement(var_18_28)

		var_18_0.MPPlayerDetails = var_18_28
	end

	local var_18_29
	local var_18_30 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_18_1
			})
		end,
		controllerIndex = var_18_1
	}
	local var_18_31 = LUI.TabManager.new(var_18_30)

	var_18_31.id = "Tabs"

	var_18_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 91, _1080p * 991, _1080p * 108, _1080p * 160)
	var_18_0:addElement(var_18_31)

	var_18_0.Tabs = var_18_31

	local function var_18_32()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_32

	local var_18_33
	local var_18_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_14:RegisterAnimationSequence("NoCustomModesShow", var_18_34)

	local var_18_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_16:RegisterAnimationSequence("NoCustomModesShow", var_18_35)

	local var_18_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_20:RegisterAnimationSequence("NoCustomModesShow", var_18_36)

	local var_18_37 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_22:RegisterAnimationSequence("NoCustomModesShow", var_18_37)

	local var_18_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_24:RegisterAnimationSequence("NoCustomModesShow", var_18_38)

	local var_18_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_26:RegisterAnimationSequence("NoCustomModesShow", var_18_39)

	local function var_18_40()
		var_18_14:AnimateSequence("NoCustomModesShow")
		var_18_16:AnimateSequence("NoCustomModesShow")
		var_18_20:AnimateSequence("NoCustomModesShow")
		var_18_22:AnimateSequence("NoCustomModesShow")
		var_18_24:AnimateSequence("NoCustomModesShow")
		var_18_26:AnimateSequence("NoCustomModesShow")
	end

	var_18_0._sequences.NoCustomModesShow = var_18_40

	local var_18_41
	local var_18_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_14:RegisterAnimationSequence("NoCustomModesHide", var_18_42)

	local var_18_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_16:RegisterAnimationSequence("NoCustomModesHide", var_18_43)

	local var_18_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_20:RegisterAnimationSequence("NoCustomModesHide", var_18_44)

	local var_18_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_22:RegisterAnimationSequence("NoCustomModesHide", var_18_45)

	local var_18_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_24:RegisterAnimationSequence("NoCustomModesHide", var_18_46)

	local var_18_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_26:RegisterAnimationSequence("NoCustomModesHide", var_18_47)

	local function var_18_48()
		var_18_14:AnimateSequence("NoCustomModesHide")
		var_18_16:AnimateSequence("NoCustomModesHide")
		var_18_20:AnimateSequence("NoCustomModesHide")
		var_18_22:AnimateSequence("NoCustomModesHide")
		var_18_24:AnimateSequence("NoCustomModesHide")
		var_18_26:AnimateSequence("NoCustomModesHide")
	end

	var_18_0._sequences.NoCustomModesHide = var_18_48

	ACTIONS.AnimateSequence(var_18_0, "NoCustomModesHide")
	var_18_16:SetDataSourceThroughElement(var_18_14, "DataSources.frontEnd.MP.lobby.modes")

	local var_18_49 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_18_20,
		startCap = var_18_20.startCap,
		endCap = var_18_20.endCap,
		sliderArea = var_18_20.sliderArea,
		slider = var_18_20.sliderArea and var_18_20.sliderArea.slider,
		fixedSizeSlider = var_18_20.sliderArea and var_18_20.sliderArea.fixedSizeSlider
	})

	var_18_14:AddScrollbar(var_18_49)
	var_18_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_18_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_18_50 = LUI.UIBindButton.new()

	var_18_50.id = "selfBindButton"

	var_18_0:addElement(var_18_50)

	var_18_0.bindButton = var_18_50

	var_18_0.bindButton:addEventHandler("button_secondary", function(arg_25_0, arg_25_1)
		if not arg_25_1.controller then
			local var_25_0 = var_18_1
		end

		ACTIONS.LeaveMenu(var_18_0)
	end)
	var_0_5(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("GameModes", GameModes)
LockTable(_M)
