module(..., package.seeall)

local function var_0_0(arg_1_0)
	if CONDITIONS.IsWZWipFlowEnabled() and (arg_1_0 == LOOT.itemTypes.EMBLEM or arg_1_0 == LOOT.itemTypes.PLAYERCARD or arg_1_0 == LOOT.itemTypes.GESTURES) then
		return true
	end

	return false
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.MenuTitle)
	assert(arg_2_0.RarityHeader)
	assert(arg_2_0.RarityHighButton)
	assert(arg_2_0.RarityLowButton)
	assert(arg_2_0.RarityNoneButton)
	assert(arg_2_0.SeasonsRecentButton)
	assert(arg_2_0.SeasonsOldButton)
	assert(arg_2_0.SeasonsNoneButton)
	assert(arg_2_0.SeasonsHeader)
	assert(arg_2_0.DisplayLockedButton)
	assert(arg_2_0.HideLockedButton)
	assert(arg_2_0.LockedHeader)
	assert(arg_2_0.OfficerHeader)
	assert(arg_2_0.OfficerNoneButton)
	assert(arg_2_0.OfficerFirstButton)
	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER"))

	arg_2_0._lootType = arg_2_2.type

	local var_2_0 = arg_2_2.menu

	local function var_2_1(arg_3_0)
		if arg_3_0 == nil then
			return
		end

		ACTIONS.AnimateSequence(arg_2_0.SeasonsRecentButton.Selected, arg_3_0 == LOOT.seasonsSortingOptions.RECENT_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_2_0.SeasonsOldButton.Selected, arg_3_0 == LOOT.seasonsSortingOptions.OLD_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_2_0.SeasonsNoneButton.Selected, arg_3_0 == LOOT.seasonsSortingOptions.NONE and "On" or "Off")

		local var_3_0 = LOOT.GetPlayerPreferenceForLootType(arg_2_1, arg_2_0._lootType)

		if var_3_0 then
			var_3_0.seasonSortPreference:set(arg_3_0)
		end
	end

	if Dvar.IBEGCHEFE("NRTLNOPOSM") then
		arg_2_0.SeasonsRecentButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			var_2_0.seasonsSortingType = LOOT.seasonsSortingOptions.RECENT_FIRST

			var_2_1(var_2_0.seasonsSortingType)
		end)
		arg_2_0.SeasonsOldButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
			var_2_0.seasonsSortingType = LOOT.seasonsSortingOptions.OLD_FIRST

			var_2_1(var_2_0.seasonsSortingType)
		end)
		arg_2_0.SeasonsNoneButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			var_2_0.seasonsSortingType = LOOT.seasonsSortingOptions.NONE

			var_2_1(var_2_0.seasonsSortingType)
		end)
		var_2_1(var_2_0.seasonsSortingType)
	else
		var_2_0.seasonsSortingType = LOOT.seasonsSortingOptions.NONE

		var_2_1(var_2_0.seasonsSortingType)
		arg_2_0.SeasonsRecentButton:closeTree()

		arg_2_0.SeasonsRecentButton = nil

		arg_2_0.SeasonsOldButton:closeTree()

		arg_2_0.SeasonsOldButton = nil

		arg_2_0.SeasonsNoneButton:closeTree()

		arg_2_0.SeasonsNoneButton = nil

		arg_2_0.SeasonsHeader:closeTree()

		arg_2_0.SeasonsHeader = nil
	end

	local function var_2_2(arg_7_0)
		if arg_7_0 == nil then
			return
		end

		ACTIONS.AnimateSequence(arg_2_0.RarityLowButton.Selected, arg_7_0 == LOOT.raritySortingOptions.LOW_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_2_0.RarityHighButton.Selected, arg_7_0 == LOOT.raritySortingOptions.HIGH_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_2_0.RarityNoneButton.Selected, arg_7_0 == LOOT.raritySortingOptions.NONE and "On" or "Off")

		local var_7_0 = LOOT.GetPlayerPreferenceForLootType(arg_2_1, arg_2_0._lootType)

		if var_7_0 then
			var_7_0.raritySortPreference:set(arg_7_0)
		end
	end

	arg_2_0.RarityLowButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		var_2_0.raritySortingType = LOOT.raritySortingOptions.LOW_FIRST

		var_2_2(var_2_0.raritySortingType)
	end)
	arg_2_0.RarityHighButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		var_2_0.raritySortingType = LOOT.raritySortingOptions.HIGH_FIRST

		var_2_2(var_2_0.raritySortingType)
	end)
	arg_2_0.RarityNoneButton:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		var_2_0.raritySortingType = LOOT.raritySortingOptions.NONE

		var_2_2(var_2_0.raritySortingType)
	end)
	var_2_2(var_2_0.raritySortingType)

	if var_0_0(arg_2_0._lootType) then
		local function var_2_3()
			if arg_2_2.data == nil or arg_2_2.data.filterByTitleType == nil then
				return
			end

			ACTIONS.AnimateSequence(arg_2_0.FilterByTitleColdWarButton.Selected, arg_2_2.data.filterByTitleType == LOOT.filterOptions.COLD_WAR_ONLY and "On" or "Off")
			ACTIONS.AnimateSequence(arg_2_0.FilterByTitleMWButton.Selected, arg_2_2.data.filterByTitleType == LOOT.filterOptions.MODERN_WARFARE_ONLY and "On" or "Off")
			ACTIONS.AnimateSequence(arg_2_0.FilterByTitleVanguardButton.Selected, arg_2_2.data.filterByTitleType == LOOT.filterOptions.VANGUARD_ONLY and "On" or "Off")
			ACTIONS.AnimateSequence(arg_2_0.FilterByTitleAllButton.Selected, arg_2_2.data.filterByTitleType == LOOT.filterOptions.ALL and "On" or "Off")

			local var_11_0 = LOOT.GetPlayerPreferenceForLootType(arg_2_1, arg_2_0._lootType)

			if var_11_0 then
				var_11_0.filterByTitlePreference:set(arg_2_2.data.filterByTitleType)
			end

			var_2_0.filterByTitleType = arg_2_2.data.filterByTitleType
		end

		arg_2_0.FilterByTitleColdWarButton:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			if arg_2_2.data then
				arg_2_2.data.filterByTitleType = LOOT.filterOptions.COLD_WAR_ONLY

				var_2_3()
			end
		end)
		arg_2_0.FilterByTitleMWButton:addEventHandler("button_action", function(arg_13_0, arg_13_1)
			if arg_2_2.data then
				arg_2_2.data.filterByTitleType = LOOT.filterOptions.MODERN_WARFARE_ONLY

				var_2_3()
			end
		end)
		arg_2_0.FilterByTitleVanguardButton:addEventHandler("button_action", function(arg_14_0, arg_14_1)
			if arg_2_2.data then
				arg_2_2.data.filterByTitleType = LOOT.filterOptions.VANGUARD_ONLY

				var_2_3()
			end
		end)
		arg_2_0.FilterByTitleAllButton:addEventHandler("button_action", function(arg_15_0, arg_15_1)
			if arg_2_2.data then
				arg_2_2.data.filterByTitleType = LOOT.filterOptions.ALL

				var_2_3()
			end
		end)
		var_2_3()
	end

	if Dvar.IBEGCHEFE("OKPQTKQLSO") then
		local function var_2_4(arg_16_0)
			if arg_16_0 == nil then
				return
			end

			ACTIONS.AnimateSequence(arg_2_0.DisplayLockedButton.Selected, arg_16_0 == LOOT.lockedSortingOptions.SHOW and "On" or "Off")
			ACTIONS.AnimateSequence(arg_2_0.HideLockedButton.Selected, arg_16_0 == LOOT.lockedSortingOptions.HIDE and "On" or "Off")
			LUI.DataSourceInControllerModel.new("frontend.MP.players.lockedSortingType"):SetValue(arg_2_1, arg_16_0)
		end

		arg_2_0.DisplayLockedButton:addEventHandler("button_action", function(arg_17_0, arg_17_1)
			var_2_0.lockedSortingType = LOOT.lockedSortingOptions.SHOW

			var_2_4(var_2_0.lockedSortingType)
		end)
		arg_2_0.HideLockedButton:addEventHandler("button_action", function(arg_18_0, arg_18_1)
			var_2_0.lockedSortingType = LOOT.lockedSortingOptions.HIDE

			var_2_4(var_2_0.lockedSortingType)
		end)
		var_2_4(var_2_0.lockedSortingType)
	else
		arg_2_0.DisplayLockedButton:closeTree()

		arg_2_0.DisplayLockedButton = nil

		arg_2_0.HideLockedButton:closeTree()

		arg_2_0.HideLockedButton = nil

		arg_2_0.LockedHeader:closeTree()

		arg_2_0.LockedHeader = nil
	end

	if arg_2_0._lootType == LOOT.itemTypes.EMBLEM then
		if not Dvar.IBEGCHEFE("OKPQTKQLSO") then
			ACTIONS.AnimateSequence(arg_2_0, "ShowRarityNoLocked")
		end

		if not Dvar.IBEGCHEFE("NRTLNOPOSM") then
			ACTIONS.AnimateSequence(arg_2_0, "ShowRarityNoSeasons")
		end

		local function var_2_5(arg_19_0)
			if arg_19_0 == nil then
				return
			end

			ACTIONS.AnimateSequence(arg_2_0.OfficerNoneButton.Selected, arg_19_0 == LOOT.officerSortingOptions.NONE and "On" or "Off")
			ACTIONS.AnimateSequence(arg_2_0.OfficerFirstButton.Selected, arg_19_0 == LOOT.officerSortingOptions.OFFICER_FIRST and "On" or "Off")
			PlayerData.BFFBGAJGD(arg_2_1, CoD.StatsGroup.NonGame).sortPreferences.emblemSortPreference.officerSortPreference:set(arg_19_0)
		end

		arg_2_0.OfficerNoneButton:addEventHandler("button_action", function(arg_20_0, arg_20_1)
			var_2_0.officerSortingType = LOOT.officerSortingOptions.NONE

			var_2_5(var_2_0.officerSortingType)
		end)
		arg_2_0.OfficerFirstButton:addEventHandler("button_action", function(arg_21_0, arg_21_1)
			var_2_0.officerSortingType = LOOT.officerSortingOptions.OFFICER_FIRST

			var_2_5(var_2_0.officerSortingType)
		end)
		var_2_5(var_2_0.officerSortingType)
	else
		arg_2_0.OfficerHeader:closeTree()

		arg_2_0.OfficerHeader = nil

		arg_2_0.OfficerNoneButton:closeTree()

		arg_2_0.OfficerNoneButton = nil

		arg_2_0.OfficerFirstButton:closeTree()

		arg_2_0.OfficerFirstButton = nil
	end

	if not var_0_0(arg_2_0._lootType) then
		ACTIONS.AnimateSequence(arg_2_0, "FilterByTitleHidden")
	end

	arg_2_0.bindButton = LUI.UIBindButton.new()
	arg_2_0.bindButton.id = "selfBindButton"

	arg_2_0:addElement(arg_2_0.bindButton)
	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_22_0, arg_22_1)
		if arg_22_1.qualifier == "keyboard" or arg_22_1.qualifier == "gamepad" then
			arg_2_0.expandScrollBarOnClose = true
		end
	end)
	arg_2_0:addEventHandler("menu_close", function(arg_23_0, arg_23_1)
		if arg_2_0.expandScrollBarOnClose then
			var_2_0:dispatchEventToChildren({
				name = "expand"
			})
		end
	end)
end

function CustomizeSortingPopup(arg_24_0, arg_24_1)
	local var_24_0 = LUI.UIVerticalNavigator.new()

	var_24_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_24_0.id = "CustomizeSortingPopup"
	var_24_0._animationSets = var_24_0._animationSets or {}
	var_24_0._sequences = var_24_0._sequences or {}

	local var_24_1 = arg_24_1 and arg_24_1.controllerIndex

	if not var_24_1 and not Engine.DDJFBBJAIG() then
		var_24_1 = var_24_0:getRootController()
	end

	assert(var_24_1)

	local var_24_2 = var_24_0
	local var_24_3
	local var_24_4 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_24_1
	})

	var_24_4.id = "RarityLowButton"

	var_24_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COMMON_FIRST")), 0)
	var_24_4.Text:SetAlignment(LUI.Alignment.Left)
	var_24_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 150, _1080p * 190)
	var_24_0:addElement(var_24_4)

	var_24_0.RarityLowButton = var_24_4

	local var_24_5
	local var_24_6 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_24_1
	})

	var_24_6.id = "RarityHighButton"

	var_24_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LEGENDARY_FIRST")), 0)
	var_24_6.Text:SetAlignment(LUI.Alignment.Left)
	var_24_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 199, _1080p * 239)
	var_24_0:addElement(var_24_6)

	var_24_0.RarityHighButton = var_24_6

	local var_24_7
	local var_24_8 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_24_1
	})

	var_24_8.id = "RarityNoneButton"

	var_24_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ALPHABETICAL")), 0)
	var_24_8.Text:SetAlignment(LUI.Alignment.Left)
	var_24_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 250, _1080p * 290)
	var_24_0:addElement(var_24_8)

	var_24_0.RarityNoneButton = var_24_8

	local var_24_9
	local var_24_10 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_24_1
	})

	var_24_10.id = "RarityHeader"

	var_24_10.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/SORT_RARITY"), 0)
	var_24_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 110, _1080p * 150)
	var_24_0:addElement(var_24_10)

	var_24_0.RarityHeader = var_24_10

	local var_24_11

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_24_11 = MenuBuilder.BuildRegisteredType("GenericHeader", {
			controllerIndex = var_24_1
		})
		var_24_11.id = "FilterByTitleHeader"

		var_24_11.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/FILTER_BY_TITLE"), 0)
		var_24_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 310, _1080p * 350)
		var_24_0:addElement(var_24_11)

		var_24_0.FilterByTitleHeader = var_24_11
	end

	local var_24_12

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_24_12 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
			controllerIndex = var_24_1
		})
		var_24_12.id = "FilterByTitleColdWarButton"

		var_24_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COLD_WAR_ONLY")), 0)
		var_24_12.Text:SetAlignment(LUI.Alignment.Left)
		var_24_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 352, _1080p * 392)
		var_24_0:addElement(var_24_12)

		var_24_0.FilterByTitleColdWarButton = var_24_12
	end

	local var_24_13

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_24_13 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
			controllerIndex = var_24_1
		})
		var_24_13.id = "FilterByTitleMWButton"

		var_24_13.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MW_ONLY")), 0)
		var_24_13.Text:SetAlignment(LUI.Alignment.Left)
		var_24_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 400, _1080p * 440)
		var_24_0:addElement(var_24_13)

		var_24_0.FilterByTitleMWButton = var_24_13
	end

	local var_24_14

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_24_14 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
			controllerIndex = var_24_1
		})
		var_24_14.id = "FilterByTitleVanguardButton"

		var_24_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/VANGUARD_ONLY")), 0)
		var_24_14.Text:SetAlignment(LUI.Alignment.Left)
		var_24_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 450, _1080p * 490)
		var_24_0:addElement(var_24_14)

		var_24_0.FilterByTitleVanguardButton = var_24_14
	end

	local var_24_15

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_24_15 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
			controllerIndex = var_24_1
		})
		var_24_15.id = "FilterByTitleAllButton"

		var_24_15.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ALL")), 0)
		var_24_15.Text:SetAlignment(LUI.Alignment.Left)
		var_24_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 500, _1080p * 540)
		var_24_0:addElement(var_24_15)

		var_24_0.FilterByTitleAllButton = var_24_15
	end

	local var_24_16
	local var_24_17 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_24_1
	})

	var_24_17.id = "SeasonsRecentButton"

	var_24_17.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEWEST_FIRST")), 0)
	var_24_17.Text:SetAlignment(LUI.Alignment.Left)
	var_24_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 600, _1080p * 640)
	var_24_0:addElement(var_24_17)

	var_24_0.SeasonsRecentButton = var_24_17

	local var_24_18
	local var_24_19 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_24_1
	})

	var_24_19.id = "SeasonsOldButton"

	var_24_19.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OLDEST_FIRST")), 0)
	var_24_19.Text:SetAlignment(LUI.Alignment.Left)
	var_24_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 650, _1080p * 690)
	var_24_0:addElement(var_24_19)

	var_24_0.SeasonsOldButton = var_24_19

	local var_24_20
	local var_24_21 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_24_1
	})

	var_24_21.id = "SeasonsNoneButton"

	var_24_21.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OFF")), 0)
	var_24_21.Text:SetAlignment(LUI.Alignment.Left)
	var_24_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 700, _1080p * 740)
	var_24_0:addElement(var_24_21)

	var_24_0.SeasonsNoneButton = var_24_21

	local var_24_22
	local var_24_23 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_24_1
	})

	var_24_23.id = "SeasonsHeader"

	var_24_23.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/SORT_SEASONS"), 0)
	var_24_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 560, _1080p * 600)
	var_24_0:addElement(var_24_23)

	var_24_0.SeasonsHeader = var_24_23

	local var_24_24
	local var_24_25 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_24_1
	})

	var_24_25.id = "OfficerHeader"

	var_24_25.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/SORT_OFFICER"), 0)
	var_24_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 760, _1080p * 800)
	var_24_0:addElement(var_24_25)

	var_24_0.OfficerHeader = var_24_25

	local var_24_26
	local var_24_27 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_24_1
	})

	var_24_27.id = "OfficerNoneButton"

	var_24_27.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ALPHABETICAL")), 0)
	var_24_27.Text:SetAlignment(LUI.Alignment.Left)
	var_24_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 800, _1080p * 840)
	var_24_0:addElement(var_24_27)

	var_24_0.OfficerNoneButton = var_24_27

	local var_24_28
	local var_24_29 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_24_1
	})

	var_24_29.id = "OfficerFirstButton"

	var_24_29.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OFFICER_FIRST")), 0)
	var_24_29.Text:SetAlignment(LUI.Alignment.Left)
	var_24_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 850, _1080p * 890)
	var_24_0:addElement(var_24_29)

	var_24_0.OfficerFirstButton = var_24_29

	local var_24_30
	local var_24_31 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_24_1
	})

	var_24_31.id = "DisplayLockedButton"

	var_24_31.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/DISPLAY_LOCKED_ITEMS")), 0)
	var_24_31.Text:SetAlignment(LUI.Alignment.Left)
	var_24_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 950, _1080p * 990)
	var_24_0:addElement(var_24_31)

	var_24_0.DisplayLockedButton = var_24_31

	local var_24_32
	local var_24_33 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_24_1
	})

	var_24_33.id = "HideLockedButton"

	var_24_33.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/HIDE_LOCKED_ITEMS")), 0)
	var_24_33.Text:SetAlignment(LUI.Alignment.Left)
	var_24_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 1000, _1080p * 1040)
	var_24_0:addElement(var_24_33)

	var_24_0.HideLockedButton = var_24_33

	local var_24_34
	local var_24_35 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_24_1
	})

	var_24_35.id = "LockedHeader"

	var_24_35.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/FILTER_LOCKED_ITEMS"), 0)
	var_24_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 910, _1080p * 950)
	var_24_0:addElement(var_24_35)

	var_24_0.LockedHeader = var_24_35

	local var_24_36
	local var_24_37 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_24_1
	})

	var_24_37.id = "MenuTitle"

	var_24_37.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER"), 0)
	var_24_37.Line:SetLeft(0, 0)
	var_24_37:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_24_0:addElement(var_24_37)

	var_24_0.MenuTitle = var_24_37

	local function var_24_38()
		return
	end

	var_24_0._sequences.DefaultSequence = var_24_38

	local var_24_39
	local var_24_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 760
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 800
		}
	}

	var_24_25:RegisterAnimationSequence("ShowRarityNoLocked", var_24_40)

	local var_24_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 840
		}
	}

	var_24_27:RegisterAnimationSequence("ShowRarityNoLocked", var_24_41)

	local var_24_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 850
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 890
		}
	}

	var_24_29:RegisterAnimationSequence("ShowRarityNoLocked", var_24_42)

	local function var_24_43()
		var_24_25:AnimateSequence("ShowRarityNoLocked")
		var_24_27:AnimateSequence("ShowRarityNoLocked")
		var_24_29:AnimateSequence("ShowRarityNoLocked")
	end

	var_24_0._sequences.ShowRarityNoLocked = var_24_43

	local var_24_44
	local var_24_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 597
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 637
		}
	}

	var_24_17:RegisterAnimationSequence("ShowRarityNoSeasons", var_24_45)

	local var_24_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 647
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 687
		}
	}

	var_24_19:RegisterAnimationSequence("ShowRarityNoSeasons", var_24_46)

	local var_24_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 567
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 607
		}
	}

	var_24_21:RegisterAnimationSequence("ShowRarityNoSeasons", var_24_47)

	local var_24_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 557
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 597
		}
	}

	var_24_23:RegisterAnimationSequence("ShowRarityNoSeasons", var_24_48)

	local var_24_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 311
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 351
		}
	}

	var_24_25:RegisterAnimationSequence("ShowRarityNoSeasons", var_24_49)

	local var_24_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 351
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 391
		}
	}

	var_24_27:RegisterAnimationSequence("ShowRarityNoSeasons", var_24_50)

	local var_24_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 441
		}
	}

	var_24_29:RegisterAnimationSequence("ShowRarityNoSeasons", var_24_51)

	local var_24_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 550
		}
	}

	var_24_31:RegisterAnimationSequence("ShowRarityNoSeasons", var_24_52)

	local var_24_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 560
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 600
		}
	}

	var_24_33:RegisterAnimationSequence("ShowRarityNoSeasons", var_24_53)

	local var_24_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 510
		}
	}

	var_24_35:RegisterAnimationSequence("ShowRarityNoSeasons", var_24_54)

	local function var_24_55()
		var_24_17:AnimateSequence("ShowRarityNoSeasons")
		var_24_19:AnimateSequence("ShowRarityNoSeasons")
		var_24_21:AnimateSequence("ShowRarityNoSeasons")
		var_24_23:AnimateSequence("ShowRarityNoSeasons")
		var_24_25:AnimateSequence("ShowRarityNoSeasons")
		var_24_27:AnimateSequence("ShowRarityNoSeasons")
		var_24_29:AnimateSequence("ShowRarityNoSeasons")
		var_24_31:AnimateSequence("ShowRarityNoSeasons")
		var_24_33:AnimateSequence("ShowRarityNoSeasons")
		var_24_35:AnimateSequence("ShowRarityNoSeasons")
	end

	var_24_0._sequences.ShowRarityNoSeasons = var_24_55

	local var_24_56

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_24_57 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_11:RegisterAnimationSequence("FilterByTitleHidden", var_24_57)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_24_58 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_12:RegisterAnimationSequence("FilterByTitleHidden", var_24_58)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_24_59 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_13:RegisterAnimationSequence("FilterByTitleHidden", var_24_59)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_24_60 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_14:RegisterAnimationSequence("FilterByTitleHidden", var_24_60)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_24_61 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_24_15:RegisterAnimationSequence("FilterByTitleHidden", var_24_61)
	end

	local var_24_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 350
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 390
		}
	}

	var_24_17:RegisterAnimationSequence("FilterByTitleHidden", var_24_62)

	local var_24_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 440
		}
	}

	var_24_19:RegisterAnimationSequence("FilterByTitleHidden", var_24_63)

	local var_24_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 450
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 490
		}
	}

	var_24_21:RegisterAnimationSequence("FilterByTitleHidden", var_24_64)

	local var_24_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 310
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 350
		}
	}

	var_24_23:RegisterAnimationSequence("FilterByTitleHidden", var_24_65)

	local var_24_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 510
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 550
		}
	}

	var_24_25:RegisterAnimationSequence("FilterByTitleHidden", var_24_66)

	local var_24_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 550
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 590
		}
	}

	var_24_27:RegisterAnimationSequence("FilterByTitleHidden", var_24_67)

	local var_24_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 600
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 640
		}
	}

	var_24_29:RegisterAnimationSequence("FilterByTitleHidden", var_24_68)

	local var_24_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 700
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 740
		}
	}

	var_24_31:RegisterAnimationSequence("FilterByTitleHidden", var_24_69)

	local var_24_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 750
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 790
		}
	}

	var_24_33:RegisterAnimationSequence("FilterByTitleHidden", var_24_70)

	local var_24_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 660
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 700
		}
	}

	var_24_35:RegisterAnimationSequence("FilterByTitleHidden", var_24_71)

	local function var_24_72()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_24_11:AnimateSequence("FilterByTitleHidden")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_24_12:AnimateSequence("FilterByTitleHidden")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_24_13:AnimateSequence("FilterByTitleHidden")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_24_14:AnimateSequence("FilterByTitleHidden")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_24_15:AnimateSequence("FilterByTitleHidden")
		end

		var_24_17:AnimateSequence("FilterByTitleHidden")
		var_24_19:AnimateSequence("FilterByTitleHidden")
		var_24_21:AnimateSequence("FilterByTitleHidden")
		var_24_23:AnimateSequence("FilterByTitleHidden")
		var_24_25:AnimateSequence("FilterByTitleHidden")
		var_24_27:AnimateSequence("FilterByTitleHidden")
		var_24_29:AnimateSequence("FilterByTitleHidden")
		var_24_31:AnimateSequence("FilterByTitleHidden")
		var_24_33:AnimateSequence("FilterByTitleHidden")
		var_24_35:AnimateSequence("FilterByTitleHidden")
	end

	var_24_0._sequences.FilterByTitleHidden = var_24_72

	var_0_1(var_24_0, var_24_1, arg_24_1)

	return var_24_0
end

MenuBuilder.registerType("CustomizeSortingPopup", CustomizeSortingPopup)
LockTable(_M)
