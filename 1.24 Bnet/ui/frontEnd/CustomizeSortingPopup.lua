module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuTitle)
	assert(arg_1_0.RarityHeader)
	assert(arg_1_0.RarityHighButton)
	assert(arg_1_0.RarityLowButton)
	assert(arg_1_0.RarityNoneButton)
	assert(arg_1_0.SeasonsRecentButton)
	assert(arg_1_0.SeasonsOldButton)
	assert(arg_1_0.SeasonsNoneButton)
	assert(arg_1_0.SeasonsHeader)
	assert(arg_1_0.DisplayLockedButton)
	assert(arg_1_0.HideLockedButton)
	assert(arg_1_0.LockedHeader)
	assert(arg_1_0.OfficerHeader)
	assert(arg_1_0.OfficerNoneButton)
	assert(arg_1_0.OfficerFirstButton)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER"))

	arg_1_0._lootType = arg_1_2.type

	local var_1_0 = arg_1_2.menu

	local function var_1_1(arg_2_0)
		if arg_2_0 == nil then
			return
		end

		ACTIONS.AnimateSequence(arg_1_0.SeasonsRecentButton.Selected, arg_2_0 == LOOT.seasonsSortingOptions.RECENT_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.SeasonsOldButton.Selected, arg_2_0 == LOOT.seasonsSortingOptions.OLD_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.SeasonsNoneButton.Selected, arg_2_0 == LOOT.seasonsSortingOptions.NONE and "On" or "Off")

		local var_2_0 = LOOT.GetPlayerPreferenceForLootType(arg_1_1, arg_1_0._lootType)

		if var_2_0 then
			var_2_0.seasonSortPreference:set(arg_2_0)
		end
	end

	if Dvar.IBEGCHEFE("NRTLNOPOSM") then
		arg_1_0.SeasonsRecentButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			var_1_0.seasonsSortingType = LOOT.seasonsSortingOptions.RECENT_FIRST

			var_1_1(var_1_0.seasonsSortingType)
		end)
		arg_1_0.SeasonsOldButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			var_1_0.seasonsSortingType = LOOT.seasonsSortingOptions.OLD_FIRST

			var_1_1(var_1_0.seasonsSortingType)
		end)
		arg_1_0.SeasonsNoneButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
			var_1_0.seasonsSortingType = LOOT.seasonsSortingOptions.NONE

			var_1_1(var_1_0.seasonsSortingType)
		end)
		var_1_1(var_1_0.seasonsSortingType)
	else
		var_1_0.seasonsSortingType = LOOT.seasonsSortingOptions.NONE

		var_1_1(var_1_0.seasonsSortingType)
		arg_1_0.SeasonsRecentButton:closeTree()

		arg_1_0.SeasonsRecentButton = nil

		arg_1_0.SeasonsOldButton:closeTree()

		arg_1_0.SeasonsOldButton = nil

		arg_1_0.SeasonsNoneButton:closeTree()

		arg_1_0.SeasonsNoneButton = nil

		arg_1_0.SeasonsHeader:closeTree()

		arg_1_0.SeasonsHeader = nil
	end

	local function var_1_2(arg_6_0)
		if arg_6_0 == nil then
			return
		end

		ACTIONS.AnimateSequence(arg_1_0.RarityLowButton.Selected, arg_6_0 == LOOT.raritySortingOptions.LOW_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.RarityHighButton.Selected, arg_6_0 == LOOT.raritySortingOptions.HIGH_FIRST and "On" or "Off")
		ACTIONS.AnimateSequence(arg_1_0.RarityNoneButton.Selected, arg_6_0 == LOOT.raritySortingOptions.NONE and "On" or "Off")

		local var_6_0 = LOOT.GetPlayerPreferenceForLootType(arg_1_1, arg_1_0._lootType)

		if var_6_0 then
			var_6_0.raritySortPreference:set(arg_6_0)
		end
	end

	arg_1_0.RarityLowButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		var_1_0.raritySortingType = LOOT.raritySortingOptions.LOW_FIRST

		var_1_2(var_1_0.raritySortingType)
	end)
	arg_1_0.RarityHighButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		var_1_0.raritySortingType = LOOT.raritySortingOptions.HIGH_FIRST

		var_1_2(var_1_0.raritySortingType)
	end)
	arg_1_0.RarityNoneButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		var_1_0.raritySortingType = LOOT.raritySortingOptions.NONE

		var_1_2(var_1_0.raritySortingType)
	end)
	var_1_2(var_1_0.raritySortingType)

	if Dvar.IBEGCHEFE("OKPQTKQLSO") then
		local function var_1_3(arg_10_0)
			if arg_10_0 == nil then
				return
			end

			ACTIONS.AnimateSequence(arg_1_0.DisplayLockedButton.Selected, arg_10_0 == LOOT.lockedSortingOptions.SHOW and "On" or "Off")
			ACTIONS.AnimateSequence(arg_1_0.HideLockedButton.Selected, arg_10_0 == LOOT.lockedSortingOptions.HIDE and "On" or "Off")
			LUI.DataSourceInControllerModel.new("frontend.MP.players.lockedSortingType"):SetValue(arg_1_1, arg_10_0)
		end

		arg_1_0.DisplayLockedButton:addEventHandler("button_action", function(arg_11_0, arg_11_1)
			var_1_0.lockedSortingType = LOOT.lockedSortingOptions.SHOW

			var_1_3(var_1_0.lockedSortingType)
		end)
		arg_1_0.HideLockedButton:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			var_1_0.lockedSortingType = LOOT.lockedSortingOptions.HIDE

			var_1_3(var_1_0.lockedSortingType)
		end)
		var_1_3(var_1_0.lockedSortingType)
	else
		arg_1_0.DisplayLockedButton:closeTree()

		arg_1_0.DisplayLockedButton = nil

		arg_1_0.HideLockedButton:closeTree()

		arg_1_0.HideLockedButton = nil

		arg_1_0.LockedHeader:closeTree()

		arg_1_0.LockedHeader = nil
	end

	if arg_1_0._lootType == LOOT.itemTypes.EMBLEM then
		if not Dvar.IBEGCHEFE("OKPQTKQLSO") then
			ACTIONS.AnimateSequence(arg_1_0, "ShowRarityNoLocked")
		end

		if not Dvar.IBEGCHEFE("NRTLNOPOSM") then
			ACTIONS.AnimateSequence(arg_1_0, "ShowRarityNoSeasons")
		end

		local function var_1_4(arg_13_0)
			if arg_13_0 == nil then
				return
			end

			ACTIONS.AnimateSequence(arg_1_0.OfficerNoneButton.Selected, arg_13_0 == LOOT.officerSortingOptions.NONE and "On" or "Off")
			ACTIONS.AnimateSequence(arg_1_0.OfficerFirstButton.Selected, arg_13_0 == LOOT.officerSortingOptions.OFFICER_FIRST and "On" or "Off")
			PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.NonGame).sortPreferences.emblemSortPreference.officerSortPreference:set(arg_13_0)
		end

		arg_1_0.OfficerNoneButton:addEventHandler("button_action", function(arg_14_0, arg_14_1)
			var_1_0.officerSortingType = LOOT.officerSortingOptions.NONE

			var_1_4(var_1_0.officerSortingType)
		end)
		arg_1_0.OfficerFirstButton:addEventHandler("button_action", function(arg_15_0, arg_15_1)
			var_1_0.officerSortingType = LOOT.officerSortingOptions.OFFICER_FIRST

			var_1_4(var_1_0.officerSortingType)
		end)
		var_1_4(var_1_0.officerSortingType)
	else
		arg_1_0.OfficerHeader:closeTree()

		arg_1_0.OfficerHeader = nil

		arg_1_0.OfficerNoneButton:closeTree()

		arg_1_0.OfficerNoneButton = nil

		arg_1_0.OfficerFirstButton:closeTree()

		arg_1_0.OfficerFirstButton = nil
	end

	arg_1_0.bindButton = LUI.UIBindButton.new()
	arg_1_0.bindButton.id = "selfBindButton"

	arg_1_0:addElement(arg_1_0.bindButton)
	arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_16_0, arg_16_1)
		if arg_16_1.qualifier == "keyboard" or arg_16_1.qualifier == "gamepad" then
			arg_1_0.expandScrollBarOnClose = true
		end
	end)
	arg_1_0:addEventHandler("menu_close", function(arg_17_0, arg_17_1)
		if arg_1_0.expandScrollBarOnClose then
			var_1_0:dispatchEventToChildren({
				name = "expand"
			})
		end
	end)
end

function CustomizeSortingPopup(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIVerticalNavigator.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_18_0.id = "CustomizeSortingPopup"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_18_1
	})

	var_18_4.id = "RarityLowButton"

	var_18_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COMMON_FIRST")), 0)
	var_18_4.Text:SetAlignment(LUI.Alignment.Left)
	var_18_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 288, _1080p * 328)
	var_18_0:addElement(var_18_4)

	var_18_0.RarityLowButton = var_18_4

	local var_18_5
	local var_18_6 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_18_1
	})

	var_18_6.id = "RarityHighButton"

	var_18_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LEGENDARY_FIRST")), 0)
	var_18_6.Text:SetAlignment(LUI.Alignment.Left)
	var_18_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 338, _1080p * 378)
	var_18_0:addElement(var_18_6)

	var_18_0.RarityHighButton = var_18_6

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "RarityNoneButton"

	var_18_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ALPHABETICAL")), 0)
	var_18_8.Text:SetAlignment(LUI.Alignment.Left)
	var_18_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 388, _1080p * 428)
	var_18_0:addElement(var_18_8)

	var_18_0.RarityNoneButton = var_18_8

	local var_18_9
	local var_18_10 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_18_1
	})

	var_18_10.id = "RarityHeader"

	var_18_10.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/SORT_RARITY"), 0)
	var_18_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 248, _1080p * 288)
	var_18_0:addElement(var_18_10)

	var_18_0.RarityHeader = var_18_10

	local var_18_11
	local var_18_12 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_18_1
	})

	var_18_12.id = "SeasonsRecentButton"

	var_18_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEWEST_FIRST")), 0)
	var_18_12.Text:SetAlignment(LUI.Alignment.Left)
	var_18_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 500, _1080p * 540)
	var_18_0:addElement(var_18_12)

	var_18_0.SeasonsRecentButton = var_18_12

	local var_18_13
	local var_18_14 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_18_1
	})

	var_18_14.id = "SeasonsOldButton"

	var_18_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OLDEST_FIRST")), 0)
	var_18_14.Text:SetAlignment(LUI.Alignment.Left)
	var_18_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 550, _1080p * 590)
	var_18_0:addElement(var_18_14)

	var_18_0.SeasonsOldButton = var_18_14

	local var_18_15
	local var_18_16 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_18_1
	})

	var_18_16.id = "SeasonsNoneButton"

	var_18_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OFF")), 0)
	var_18_16.Text:SetAlignment(LUI.Alignment.Left)
	var_18_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 600, _1080p * 640)
	var_18_0:addElement(var_18_16)

	var_18_0.SeasonsNoneButton = var_18_16

	local var_18_17
	local var_18_18 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_18_1
	})

	var_18_18.id = "SeasonsHeader"

	var_18_18.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/SORT_SEASONS"), 0)
	var_18_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 460, _1080p * 500)
	var_18_0:addElement(var_18_18)

	var_18_0.SeasonsHeader = var_18_18

	local var_18_19
	local var_18_20 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_18_1
	})

	var_18_20.id = "DisplayLockedButton"

	var_18_20.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/DISPLAY_LOCKED_ITEMS")), 0)
	var_18_20.Text:SetAlignment(LUI.Alignment.Left)
	var_18_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 712, _1080p * 752)
	var_18_0:addElement(var_18_20)

	var_18_0.DisplayLockedButton = var_18_20

	local var_18_21
	local var_18_22 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_18_1
	})

	var_18_22.id = "HideLockedButton"

	var_18_22.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/HIDE_LOCKED_ITEMS")), 0)
	var_18_22.Text:SetAlignment(LUI.Alignment.Left)
	var_18_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 762, _1080p * 802)
	var_18_0:addElement(var_18_22)

	var_18_0.HideLockedButton = var_18_22

	local var_18_23
	local var_18_24 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_18_1
	})

	var_18_24.id = "LockedHeader"

	var_18_24.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/FILTER_LOCKED_ITEMS"), 0)
	var_18_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 672, _1080p * 712)
	var_18_0:addElement(var_18_24)

	var_18_0.LockedHeader = var_18_24

	local var_18_25
	local var_18_26 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_18_1
	})

	var_18_26.id = "MenuTitle"

	var_18_26.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER"), 0)
	var_18_26.Line:SetLeft(0, 0)
	var_18_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_18_0:addElement(var_18_26)

	var_18_0.MenuTitle = var_18_26

	local var_18_27
	local var_18_28 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_18_1
	})

	var_18_28.id = "OfficerHeader"

	var_18_28.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/SORT_OFFICER"), 0)
	var_18_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 839, _1080p * 879)
	var_18_0:addElement(var_18_28)

	var_18_0.OfficerHeader = var_18_28

	local var_18_29
	local var_18_30 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_18_1
	})

	var_18_30.id = "OfficerNoneButton"

	var_18_30.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ALPHABETICAL")), 0)
	var_18_30.Text:SetAlignment(LUI.Alignment.Left)
	var_18_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 879, _1080p * 919)
	var_18_0:addElement(var_18_30)

	var_18_0.OfficerNoneButton = var_18_30

	local var_18_31
	local var_18_32 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_18_1
	})

	var_18_32.id = "OfficerFirstButton"

	var_18_32.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OFFICER_FIRST")), 0)
	var_18_32.Text:SetAlignment(LUI.Alignment.Left)
	var_18_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 928, _1080p * 968)
	var_18_0:addElement(var_18_32)

	var_18_0.OfficerFirstButton = var_18_32

	local function var_18_33()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_33

	local var_18_34
	local var_18_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 678
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 718
		}
	}

	var_18_28:RegisterAnimationSequence("ShowRarityNoLocked", var_18_35)

	local var_18_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 718
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 758
		}
	}

	var_18_30:RegisterAnimationSequence("ShowRarityNoLocked", var_18_36)

	local var_18_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 769
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 809
		}
	}

	var_18_32:RegisterAnimationSequence("ShowRarityNoLocked", var_18_37)

	local function var_18_38()
		var_18_28:AnimateSequence("ShowRarityNoLocked")
		var_18_30:AnimateSequence("ShowRarityNoLocked")
		var_18_32:AnimateSequence("ShowRarityNoLocked")
	end

	var_18_0._sequences.ShowRarityNoLocked = var_18_38

	local var_18_39
	local var_18_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ShowRarityNoSeasons", var_18_40)

	local var_18_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_14:RegisterAnimationSequence("ShowRarityNoSeasons", var_18_41)

	local var_18_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_16:RegisterAnimationSequence("ShowRarityNoSeasons", var_18_42)

	local var_18_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_18:RegisterAnimationSequence("ShowRarityNoSeasons", var_18_43)

	local var_18_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 460
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 500
		}
	}

	var_18_28:RegisterAnimationSequence("ShowRarityNoSeasons", var_18_44)

	local var_18_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 500
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 540
		}
	}

	var_18_30:RegisterAnimationSequence("ShowRarityNoSeasons", var_18_45)

	local var_18_46 = {
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

	var_18_32:RegisterAnimationSequence("ShowRarityNoSeasons", var_18_46)

	local function var_18_47()
		var_18_12:AnimateSequence("ShowRarityNoSeasons")
		var_18_14:AnimateSequence("ShowRarityNoSeasons")
		var_18_16:AnimateSequence("ShowRarityNoSeasons")
		var_18_18:AnimateSequence("ShowRarityNoSeasons")
		var_18_28:AnimateSequence("ShowRarityNoSeasons")
		var_18_30:AnimateSequence("ShowRarityNoSeasons")
		var_18_32:AnimateSequence("ShowRarityNoSeasons")
	end

	var_18_0._sequences.ShowRarityNoSeasons = var_18_47

	var_0_0(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("CustomizeSortingPopup", CustomizeSortingPopup)
LockTable(_M)
