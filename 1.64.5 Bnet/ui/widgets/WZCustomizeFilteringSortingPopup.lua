module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuTitle)
	assert(arg_1_0.SortByWeaponDataNoneButton)
	assert(arg_1_0.SortByWeaponDataLockedFirstButton)
	assert(arg_1_0.SortByWeaponDataUnlockedFirstButton)
	assert(arg_1_0.SortByWeaponDataNewFirstButton)
	assert(arg_1_0.SortByWeaponDataLowestLevelFirstButton)
	assert(arg_1_0.SortByWeaponDataHighestLevelFirstButton)
	assert(arg_1_0.SortByWeaponDataHeader)
	assert(arg_1_0.FilterByTitleMWOnlyButton)
	assert(arg_1_0.FilterByTitleColdWarOnlyButton)
	assert(arg_1_0.FilterByTitleAllButton)
	assert(arg_1_0.FilterByTitleHeader)

	arg_1_0._lootType = arg_1_2.type

	if CONDITIONS.AllT9WeaponsAreHidden() then
		arg_1_2.data.weaponFilterType = LOOT.weaponFilterOptions.ALL

		local var_1_0 = LOOT.GetPlayerPreferenceForLootType(arg_1_1, arg_1_0._lootType)

		if var_1_0 then
			var_1_0.weaponFilterPreference:set(arg_1_2.data.weaponFilterType)
		end
	elseif arg_1_2.numWeaponsByGameType[LUI.GAME_SOURCE_ID.COLD_WAR] == 0 then
		if arg_1_2.data.weaponFilterType == LOOT.weaponFilterOptions.COLD_WAR then
			arg_1_2.data.weaponFilterType = LOOT.weaponFilterOptions.ALL
		end

		WZWIP.AnimateThemeElement(arg_1_0.FilterByTitleColdWarOnlyButton, "Disabled")
		ACTIONS.AnimateSequence(arg_1_0.FilterByTitleColdWarOnlyButton.Selected, "Off")
	elseif arg_1_2.numWeaponsByGameType[LUI.GAME_SOURCE_ID.MODERN_WARFARE] == 0 then
		if arg_1_2.data.weaponFilterType == LOOT.weaponFilterOptions.MODERN_WARFARE then
			arg_1_2.data.weaponFilterType = LOOT.weaponFilterOptions.ALL
		end

		WZWIP.AnimateThemeElement(arg_1_0.FilterByTitleMWOnlyButton, "Disabled")
		ACTIONS.AnimateSequence(arg_1_0.FilterByTitleMWOnlyButton.Selected, "Off")
	elseif arg_1_2.numWeaponsByGameType[LUI.GAME_SOURCE_ID.VANGUARD] == 0 then
		if arg_1_2.data.weaponFilterType == LOOT.weaponFilterOptions.VANGUARD then
			arg_1_2.data.weaponFilterType = LOOT.weaponFilterOptions.ALL
		end

		WZWIP.AnimateThemeElement(arg_1_0.FilterByTitleVanguardOnlyButton, "Disabled")
		ACTIONS.AnimateSequence(arg_1_0.FilterByTitleVanguardOnlyButton.Selected, "Off")
	end

	if not CONDITIONS.AllT9WeaponsAreHidden() then
		local function var_1_1()
			if arg_1_2.data.weaponFilterType == nil then
				return
			end

			ACTIONS.AnimateSequence(arg_1_0.FilterByTitleAllButton.Selected, arg_1_2.data.weaponFilterType == LOOT.weaponFilterOptions.ALL and "On" or "Off")
			ACTIONS.AnimateSequence(arg_1_0.FilterByTitleColdWarOnlyButton.Selected, arg_1_2.data.weaponFilterType == LOOT.weaponFilterOptions.COLD_WAR and "On" or "Off")
			ACTIONS.AnimateSequence(arg_1_0.FilterByTitleMWOnlyButton.Selected, arg_1_2.data.weaponFilterType == LOOT.weaponFilterOptions.MODERN_WARFARE and "On" or "Off")
			ACTIONS.AnimateSequence(arg_1_0.FilterByTitleVanguardOnlyButton.Selected, arg_1_2.data.weaponFilterType == LOOT.weaponFilterOptions.VANGUARD and "On" or "Off")

			local var_2_0 = LOOT.GetPlayerPreferenceForLootType(arg_1_1, arg_1_0._lootType)

			if var_2_0 then
				var_2_0.weaponFilterPreference:set(arg_1_2.data.weaponFilterType)
			end
		end

		arg_1_0.FilterByTitleAllButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			arg_1_2.data.weaponFilterType = LOOT.weaponFilterOptions.ALL

			var_1_1()
		end)
		arg_1_0.FilterByTitleColdWarOnlyButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			if arg_1_2.numWeaponsByGameType[LUI.GAME_SOURCE_ID.COLD_WAR] > 0 then
				arg_1_2.data.weaponFilterType = LOOT.weaponFilterOptions.COLD_WAR

				var_1_1()
			end
		end)
		arg_1_0.FilterByTitleMWOnlyButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
			if arg_1_2.numWeaponsByGameType[LUI.GAME_SOURCE_ID.MODERN_WARFARE] > 0 then
				arg_1_2.data.weaponFilterType = LOOT.weaponFilterOptions.MODERN_WARFARE

				var_1_1()
			end
		end)
		arg_1_0.FilterByTitleVanguardOnlyButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			if arg_1_2.numWeaponsByGameType[LUI.GAME_SOURCE_ID.VANGUARD] > 0 then
				arg_1_2.data.weaponFilterType = LOOT.weaponFilterOptions.VANGUARD

				var_1_1()
			end
		end)
		var_1_1()
	end

	local function var_1_2()
		if arg_1_2.data.weaponSortingByWeaponDataType == nil then
			return
		end

		ACTIONS.AnimateSequence(arg_1_0.SortByWeaponDataHighestLevelFirstButton.Selected, arg_1_2.data.weaponSortingByWeaponDataType == LOOT.weaponSortByWeaponDataOptions.HIGHEST_LEVEL_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.SortByWeaponDataLowestLevelFirstButton.Selected, arg_1_2.data.weaponSortingByWeaponDataType == LOOT.weaponSortByWeaponDataOptions.LOWEST_LEVEL_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.SortByWeaponDataNewFirstButton.Selected, arg_1_2.data.weaponSortingByWeaponDataType == LOOT.weaponSortByWeaponDataOptions.NEW_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.SortByWeaponDataUnlockedFirstButton.Selected, arg_1_2.data.weaponSortingByWeaponDataType == LOOT.weaponSortByWeaponDataOptions.UNLOCKED_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.SortByWeaponDataLockedFirstButton.Selected, arg_1_2.data.weaponSortingByWeaponDataType == LOOT.weaponSortByWeaponDataOptions.LOCKED_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.SortByWeaponDataNoneButton.Selected, arg_1_2.data.weaponSortingByWeaponDataType == LOOT.weaponSortByWeaponDataOptions.NONE and "On" or "Off")

		local var_7_0 = LOOT.GetPlayerPreferenceForLootType(arg_1_1, arg_1_0._lootType)

		if var_7_0 then
			var_7_0.weaponSortByWeaponDataPreference:set(arg_1_2.data.weaponSortingByWeaponDataType)
		end
	end

	arg_1_0.SortByWeaponDataHighestLevelFirstButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		arg_1_2.data.weaponSortingByWeaponDataType = LOOT.weaponSortByWeaponDataOptions.HIGHEST_LEVEL_FIRST

		var_1_2()
	end)
	arg_1_0.SortByWeaponDataLowestLevelFirstButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		arg_1_2.data.weaponSortingByWeaponDataType = LOOT.weaponSortByWeaponDataOptions.LOWEST_LEVEL_FIRST

		var_1_2()
	end)
	arg_1_0.SortByWeaponDataNewFirstButton:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		arg_1_2.data.weaponSortingByWeaponDataType = LOOT.weaponSortByWeaponDataOptions.NEW_FIRST

		var_1_2()
	end)
	arg_1_0.SortByWeaponDataUnlockedFirstButton:addEventHandler("button_action", function(arg_11_0, arg_11_1)
		arg_1_2.data.weaponSortingByWeaponDataType = LOOT.weaponSortByWeaponDataOptions.UNLOCKED_FIRST

		var_1_2()
	end)
	arg_1_0.SortByWeaponDataLockedFirstButton:addEventHandler("button_action", function(arg_12_0, arg_12_1)
		arg_1_2.data.weaponSortingByWeaponDataType = LOOT.weaponSortByWeaponDataOptions.LOCKED_FIRST

		var_1_2()
	end)
	arg_1_0.SortByWeaponDataNoneButton:addEventHandler("button_action", function(arg_13_0, arg_13_1)
		arg_1_2.data.weaponSortingByWeaponDataType = LOOT.weaponSortByWeaponDataOptions.NONE

		var_1_2()
	end)
	var_1_2()
end

function WZCustomizeFilteringSortingPopup(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIVerticalNavigator.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_14_0.id = "WZCustomizeFilteringSortingPopup"

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3

	if not CONDITIONS.AllT9WeaponsAreHidden() then
		local var_14_4 = MenuBuilder.BuildRegisteredType("GenericHeader", {
			controllerIndex = var_14_1
		})

		var_14_4.id = "FilterByTitleHeader"

		var_14_4.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/FILTER_BY_TITLE"), 0)
		var_14_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 170, _1080p * 210)
		var_14_0:addElement(var_14_4)

		var_14_0.FilterByTitleHeader = var_14_4
	end

	local var_14_5

	if not CONDITIONS.AllT9WeaponsAreHidden() then
		local var_14_6 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
			controllerIndex = var_14_1
		})

		var_14_6.id = "FilterByTitleAllButton"

		var_14_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ALL")), 0)
		var_14_6.Text:SetAlignment(LUI.Alignment.Left)
		var_14_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 211, _1080p * 251)
		var_14_0:addElement(var_14_6)

		var_14_0.FilterByTitleAllButton = var_14_6
	end

	local var_14_7

	if not CONDITIONS.AllT9WeaponsAreHidden() then
		local var_14_8 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
			controllerIndex = var_14_1
		})

		var_14_8.id = "FilterByTitleColdWarOnlyButton"

		var_14_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COLD_WAR_ONLY")), 0)
		var_14_8.Text:SetAlignment(LUI.Alignment.Left)
		var_14_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 260, _1080p * 300)
		var_14_0:addElement(var_14_8)

		var_14_0.FilterByTitleColdWarOnlyButton = var_14_8
	end

	local var_14_9

	if not CONDITIONS.AllT9WeaponsAreHidden() then
		local var_14_10 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
			controllerIndex = var_14_1
		})

		var_14_10.id = "FilterByTitleMWOnlyButton"

		var_14_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MW_ONLY")), 0)
		var_14_10.Text:SetAlignment(LUI.Alignment.Left)
		var_14_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 310, _1080p * 350)
		var_14_0:addElement(var_14_10)

		var_14_0.FilterByTitleMWOnlyButton = var_14_10
	end

	local var_14_11

	if not CONDITIONS.AllT9WeaponsAreHidden() then
		local var_14_12 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
			controllerIndex = var_14_1
		})

		var_14_12.id = "FilterByTitleVanguardOnlyButton"

		var_14_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/VANGUARD_ONLY")), 0)
		var_14_12.Text:SetAlignment(LUI.Alignment.Left)
		var_14_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 360, _1080p * 400)
		var_14_0:addElement(var_14_12)

		var_14_0.FilterByTitleVanguardOnlyButton = var_14_12
	end

	local var_14_13
	local var_14_14 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_14_1
	})

	var_14_14.id = "SortByWeaponDataHeader"

	var_14_14.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/SORT_BY_WEAPON_DATA"), 0)
	var_14_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 450, _1080p * 490)
	var_14_0:addElement(var_14_14)

	var_14_0.SortByWeaponDataHeader = var_14_14

	local var_14_15
	local var_14_16 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_14_1
	})

	var_14_16.id = "SortByWeaponDataHighestLevelFirstButton"

	var_14_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/HIGHEST_LEVEL_FIRST")), 0)
	var_14_16.Text:SetAlignment(LUI.Alignment.Left)
	var_14_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 490, _1080p * 530)
	var_14_0:addElement(var_14_16)

	var_14_0.SortByWeaponDataHighestLevelFirstButton = var_14_16

	local var_14_17
	local var_14_18 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_14_1
	})

	var_14_18.id = "SortByWeaponDataLowestLevelFirstButton"

	var_14_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LOWEST_LEVEL_FIRST")), 0)
	var_14_18.Text:SetAlignment(LUI.Alignment.Left)
	var_14_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 540, _1080p * 580)
	var_14_0:addElement(var_14_18)

	var_14_0.SortByWeaponDataLowestLevelFirstButton = var_14_18

	local var_14_19
	local var_14_20 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_14_1
	})

	var_14_20.id = "SortByWeaponDataNewFirstButton"

	var_14_20.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_FIRST")), 0)
	var_14_20.Text:SetAlignment(LUI.Alignment.Left)
	var_14_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 590, _1080p * 630)
	var_14_0:addElement(var_14_20)

	var_14_0.SortByWeaponDataNewFirstButton = var_14_20

	local var_14_21
	local var_14_22 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_14_1
	})

	var_14_22.id = "SortByWeaponDataUnlockedFirstButton"

	var_14_22.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/UNLOCKED_FIRST")), 0)
	var_14_22.Text:SetAlignment(LUI.Alignment.Left)
	var_14_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 640, _1080p * 680)
	var_14_0:addElement(var_14_22)

	var_14_0.SortByWeaponDataUnlockedFirstButton = var_14_22

	local var_14_23
	local var_14_24 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_14_1
	})

	var_14_24.id = "SortByWeaponDataLockedFirstButton"

	var_14_24.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LOCKED_FIRST")), 0)
	var_14_24.Text:SetAlignment(LUI.Alignment.Left)
	var_14_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 690, _1080p * 730)
	var_14_0:addElement(var_14_24)

	var_14_0.SortByWeaponDataLockedFirstButton = var_14_24

	local var_14_25
	local var_14_26 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_14_1
	})

	var_14_26.id = "SortByWeaponDataNoneButton"

	var_14_26.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NONE_CAPS")), 0)
	var_14_26.Text:SetAlignment(LUI.Alignment.Left)
	var_14_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 740, _1080p * 780)
	var_14_0:addElement(var_14_26)

	var_14_0.SortByWeaponDataNoneButton = var_14_26

	local var_14_27
	local var_14_28 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_14_1
	})

	var_14_28.id = "MenuTitle"

	var_14_28.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")), 0)
	var_14_28.Line:SetLeft(0, 0)
	var_14_28:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_14_0:addElement(var_14_28)

	var_14_0.MenuTitle = var_14_28

	var_0_0(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("WZCustomizeFilteringSortingPopup", WZCustomizeFilteringSortingPopup)
LockTable(_M)
