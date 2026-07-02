module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuTitle)
	assert(arg_1_0.FilterByTitleVGOnlyButton)
	assert(arg_1_0.FilterByTitleMWOnlyButton)
	assert(arg_1_0.FilterByTitleColdWarOnlyButton)
	assert(arg_1_0.FilterByTitleAllButton)
	assert(arg_1_0.FilterByTitleHeader)

	local function var_1_0(arg_2_0)
		local var_2_0
		local var_2_1 = LOOT.GetPlayerBundleLockerFilterPreference(arg_2_0)

		if var_2_1 then
			var_2_0 = var_2_1:get()
		end

		ACTIONS.AnimateSequence(arg_1_0.FilterByTitleAllButton.Selected, var_2_0 == LOOT.bundleLockerFilterOptions.ALL and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.FilterByTitleColdWarOnlyButton.Selected, var_2_0 == LOOT.bundleLockerFilterOptions.COLD_WAR_ONLY and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.FilterByTitleMWOnlyButton.Selected, var_2_0 == LOOT.bundleLockerFilterOptions.MODERN_WARFARE_ONLY and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.FilterByTitleVGOnlyButton.Selected, var_2_0 == LOOT.bundleLockerFilterOptions.VANGUARD_ONLY and "On" or "Off")
	end

	arg_1_0.FilterByTitleAllButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		local var_3_0 = LOOT.GetPlayerBundleLockerFilterPreference(arg_1_1)

		if var_3_0 then
			var_3_0:set(LOOT.bundleLockerFilterOptions.ALL)
		end

		var_1_0(arg_3_1.controller)
	end)
	arg_1_0.FilterByTitleColdWarOnlyButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		local var_4_0 = LOOT.GetPlayerBundleLockerFilterPreference(arg_1_1)

		if var_4_0 then
			var_4_0:set(LOOT.bundleLockerFilterOptions.COLD_WAR_ONLY)
		end

		var_1_0(arg_4_1.controller)
	end)
	arg_1_0.FilterByTitleMWOnlyButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		local var_5_0 = LOOT.GetPlayerBundleLockerFilterPreference(arg_1_1)

		if var_5_0 then
			var_5_0:set(LOOT.bundleLockerFilterOptions.MODERN_WARFARE_ONLY)
		end

		var_1_0(arg_5_1.controller)
	end)
	arg_1_0.FilterByTitleVGOnlyButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		local var_6_0 = LOOT.GetPlayerBundleLockerFilterPreference(arg_1_1)

		if var_6_0 then
			var_6_0:set(LOOT.bundleLockerFilterOptions.VANGUARD_ONLY)
		end

		var_1_0(arg_6_1.controller)
	end)
	var_1_0(arg_1_1)
end

function BundleLockerFilteringSortingPopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalNavigator.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_7_0.id = "BundleLockerFilteringSortingPopup"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "FilterByTitleHeader"

	var_7_4.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/FILTER_BY_TITLE"), 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 248, _1080p * 288)
	var_7_0:addElement(var_7_4)

	var_7_0.FilterByTitleHeader = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "FilterByTitleAllButton"

	var_7_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ALL")), 0)
	var_7_6.Text:SetAlignment(LUI.Alignment.Left)
	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 288, _1080p * 328)
	var_7_0:addElement(var_7_6)

	var_7_0.FilterByTitleAllButton = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "FilterByTitleColdWarOnlyButton"

	var_7_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COLD_WAR_ONLY")), 0)
	var_7_8.Text:SetAlignment(LUI.Alignment.Left)
	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 338, _1080p * 378)
	var_7_0:addElement(var_7_8)

	var_7_0.FilterByTitleColdWarOnlyButton = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "FilterByTitleMWOnlyButton"

	var_7_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MW_ONLY")), 0)
	var_7_10.Text:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 387, _1080p * 427)
	var_7_0:addElement(var_7_10)

	var_7_0.FilterByTitleMWOnlyButton = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "FilterByTitleVGOnlyButton"

	var_7_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/VANGUARD_ONLY")), 0)
	var_7_12.Text:SetAlignment(LUI.Alignment.Left)
	var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 437, _1080p * 477)
	var_7_0:addElement(var_7_12)

	var_7_0.FilterByTitleVGOnlyButton = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "MenuTitle"

	var_7_14.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")), 0)
	var_7_14.Line:SetLeft(0, 0)
	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_7_0:addElement(var_7_14)

	var_7_0.MenuTitle = var_7_14

	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("BundleLockerFilteringSortingPopup", BundleLockerFilteringSortingPopup)
LockTable(_M)
