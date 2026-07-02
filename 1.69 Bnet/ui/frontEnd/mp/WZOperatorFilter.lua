module(..., package.seeall)

local var_0_0 = {
	LOOT.operatorFilterOptions.FAVORITES,
	LOOT.operatorFilterOptions.ALL,
	LOOT.operatorFilterOptions.VANGUARD_ONLY,
	LOOT.operatorFilterOptions.COLD_WAR_ONLY,
	LOOT.operatorFilterOptions.MODERN_WARFARE_ONLY
}

local function var_0_1(arg_1_0)
	for iter_1_0 = 1, #arg_1_0._categoryButtons do
		local var_1_0 = var_0_0[iter_1_0] == arg_1_0._currentOperatorFilterType

		arg_1_0._categoryButtons[iter_1_0]:SetSelected(var_1_0)

		if var_1_0 then
			arg_1_0._selectedIndex = iter_1_0
		end
	end

	local var_1_1 = LUI.IsLastInputGamepad(arg_1_0._controllerIndex)

	ACTIONS.AnimateSequence(arg_1_0, var_1_1 and "ShowDPadInput" or "ShowKBMInput")

	if var_1_1 then
		arg_1_0.DpadButton.Image:setImage(RegisterMaterial("button_dpad_vertical"))
	end

	local var_1_2 = LOOT.GetPlayerPreferenceForLootType(arg_1_0._controllerIndex, LOOT.itemTypes.OPERATOR)

	if var_1_2 then
		var_1_2.operatorFilterPreference:set(arg_1_0._currentOperatorFilterType)
	end

	local var_1_3 = arg_1_0:getParent()

	if var_1_3 then
		var_1_3:processEvent({
			name = "operator_filter_changed",
			controllerIndex = arg_1_0._controllerIndex
		})
	end
end

local function var_0_2(arg_2_0)
	return arg_2_0._currentOperatorFilterType
end

local function var_0_3(arg_3_0, arg_3_1)
	assert(arg_3_1 and type(arg_3_1) == "number", "You must provide a number value for the favorites count.")
	arg_3_0.OperatorFilterFavorites.Text:setText(Engine.CBBHFCGDIC("MENU/FAVORITES_CAPS", arg_3_1, LOOT.MAX_FAVORITE_OPERATORS))
end

local function var_0_4(arg_4_0, arg_4_1)
	assert(arg_4_1 and arg_4_1.targetFilter, "You must pass a reference to the filter you want to animate.")
	ACTIONS.AnimateSequence(arg_4_1.targetFilter, arg_4_1.doWarning and "PulseWarning" or arg_4_1.isSelected and "PulseConfirmSelected" or "PulseConfirm")
end

local function var_0_5(arg_5_0)
	local var_5_0 = LOOT.GetPlayerPreferenceForLootType(arg_5_0._controllerIndex, LOOT.itemTypes.OPERATOR)

	if var_5_0 then
		arg_5_0._currentOperatorFilterType = LOOT.operatorFilterOptions.ALL

		var_5_0.operatorFilterPreference:set(LOOT.operatorFilterOptions.ALL)
	end
end

local function var_0_6(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1 and arg_6_1.iterator and type(arg_6_1.iterator) == "number" and arg_6_1.iterator or -1
	local var_6_1 = false
	local var_6_2 = arg_6_0._selectedIndex + var_6_0

	if var_6_2 > #arg_6_0._categoryButtons then
		var_6_2 = 1
	end

	local var_6_3 = arg_6_0._categoryButtons[var_6_2]

	if var_6_3 and not var_6_3.disabled then
		var_6_1 = true
		arg_6_0._selectedIndex = var_6_2
	else
		local var_6_4 = var_6_0 > 0 and #arg_6_0._categoryButtons or 1

		for iter_6_0 = var_6_0 > 0 and 1 or #arg_6_0._categoryButtons, var_6_4, var_6_0 do
			if not arg_6_0._categoryButtons[iter_6_0].disabled then
				arg_6_0._selectedIndex = iter_6_0
				var_6_1 = true

				break
			end
		end
	end

	if var_6_1 then
		arg_6_0._currentOperatorFilterType = var_0_0[arg_6_0._selectedIndex]

		var_0_1(arg_6_0)
	end
end

local function var_0_7(arg_7_0)
	local var_7_0 = LUI.UIBindButton.new()

	var_7_0.id = "bindButton"

	arg_7_0:addElement(var_7_0)

	arg_7_0.bindButton = var_7_0

	arg_7_0.bindButton:addEventHandler("button_up", var_0_6(arg_7_0))
	arg_7_0.bindButton:addEventHandler("button_down", var_0_6(arg_7_0, {
		iterator = 1
	}))
end

local function var_0_8(arg_8_0, arg_8_1)
	assert(arg_8_1 and arg_8_1.filterToSet)

	arg_8_0._currentOperatorFilterType = arg_8_1.filterToSet

	var_0_1(arg_8_0)
end

local function var_0_9(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0

	arg_9_0._currentOperatorFilterType = LOOT.operatorFilterOptions.ALL
	arg_9_0.SetFilterToDefault = var_0_5
	arg_9_0.SetFavoriteCount = var_0_3
	arg_9_0.AnimateFilterDisplay = var_0_4
	arg_9_0.SetInitialFilter = var_0_8
	arg_9_0.GetCurrentFilter = var_0_2
	arg_9_0.UpdateCategoryButtons = var_0_1
	arg_9_0._controllerIndex = arg_9_1
	arg_9_0._categoryButtons = {
		arg_9_0.OperatorFilterFavorites,
		arg_9_0.OperatorFilterAllOperatorsButton,
		arg_9_0.OperatorFilterVanguardButton,
		arg_9_0.OperatorFilterBlackOpsButton,
		arg_9_0.OperatorFilterModernWarfareButton
	}

	ACTIONS.AnimateSequence(arg_9_0.OperatorFilterFavorites, "SetFavoriteIcon")
	arg_9_0.OperatorFilterFavorites:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		if arg_9_0.OperatorFilterFavorites._isEnabled then
			arg_9_0._currentOperatorFilterType = LOOT.operatorFilterOptions.FAVORITES

			var_0_1(arg_9_0)
		end
	end)
	arg_9_0.OperatorFilterAllOperatorsButton:addEventHandler("button_action", function(arg_11_0, arg_11_1)
		if arg_9_0.OperatorFilterAllOperatorsButton._isEnabled then
			arg_9_0._currentOperatorFilterType = LOOT.operatorFilterOptions.ALL

			var_0_1(arg_9_0)
		end
	end)
	arg_9_0.OperatorFilterModernWarfareButton:addEventHandler("button_action", function(arg_12_0, arg_12_1)
		if arg_9_0.OperatorFilterModernWarfareButton._isEnabled then
			arg_9_0._currentOperatorFilterType = LOOT.operatorFilterOptions.MODERN_WARFARE_ONLY

			var_0_1(arg_9_0)
		end
	end)
	arg_9_0.OperatorFilterBlackOpsButton:addEventHandler("button_action", function(arg_13_0, arg_13_1)
		if arg_9_0.OperatorFilterBlackOpsButton._isEnabled then
			arg_9_0._currentOperatorFilterType = LOOT.operatorFilterOptions.COLD_WAR_ONLY

			var_0_1(arg_9_0)
		end
	end)
	arg_9_0.OperatorFilterVanguardButton:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		if arg_9_0.OperatorFilterVanguardButton._isEnabled then
			arg_9_0._currentOperatorFilterType = LOOT.operatorFilterOptions.VANGUARD_ONLY

			var_0_1(arg_9_0)
		end
	end)

	local var_9_1 = {
		selectedSwatch = SWATCHES.WZGlobalSwatches.WZBackground,
		selectedTextSwatch = SWATCHES.WZGlobalSwatches.WZText,
		unselectedSwatch = SWATCHES.WZGlobalSwatches.WZBackground,
		unselectedTextSwatch = SWATCHES.WZGlobalSwatches.WZDescription
	}

	arg_9_0.OperatorFilterFavorites:ApplyTheme(var_9_1)
	arg_9_0.OperatorFilterAllOperatorsButton:ApplyTheme(var_9_1)
	arg_9_0.OperatorFilterVanguardButton:ApplyTheme(var_9_1)
	arg_9_0.OperatorFilterBlackOpsButton:ApplyTheme(var_9_1)
	arg_9_0.OperatorFilterModernWarfareButton:ApplyTheme(var_9_1)
	arg_9_0:addEventHandler("button_up", function(arg_15_0, arg_15_1)
		var_0_6(var_9_0)
	end)
	arg_9_0:addEventHandler("button_down", function(arg_16_0, arg_16_1)
		var_0_6(var_9_0, {
			iterator = 1
		})
	end)

	local var_9_2 = LUI.UIBindButton.new()

	var_9_2.id = "bindButton"

	arg_9_0:addElement(var_9_2)

	arg_9_0.bindButton = var_9_2

	arg_9_0.bindButton:addEventHandler("button_up", function(arg_17_0, arg_17_1)
		var_0_6(arg_9_0)
	end)
	arg_9_0.bindButton:addEventHandler("button_down", function(arg_18_0, arg_18_1)
		var_0_6(arg_9_0, {
			iterator = 1
		})
	end)
	arg_9_0:addAndCallEventHandler("update_input_type", var_0_1)
	var_0_1(arg_9_0)
end

function WZOperatorFilter(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 185 * _1080p)

	var_19_0.id = "WZOperatorFilter"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = LUI.UIImage.new()

	var_19_4.id = "Backing"

	var_19_4:SetRGBFromInt(0, 0)
	var_19_4:SetAlpha(0.5, 0)
	var_19_4:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_19_4:SetBlendMode(BLEND_MODE.multiply)
	var_19_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -144, _1080p * 408, _1080p * -176, _1080p * 306)
	var_19_0:addElement(var_19_4)

	var_19_0.Backing = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("WZOperatorFilterSelectTextButton", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "OperatorFilterVanguardButton"

	var_19_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_FISHER/VANGUARD")), 0)
	var_19_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 89, _1080p * 509, _1080p * 71, _1080p * 111)
	var_19_0:addElement(var_19_6)

	var_19_0.OperatorFilterVanguardButton = var_19_6

	local var_19_7
	local var_19_8 = MenuBuilder.BuildRegisteredType("WZOperatorFilterSelectTextButton", {
		controllerIndex = var_19_1
	})

	var_19_8.id = "OperatorFilterBlackOpsButton"

	var_19_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), 0)
	var_19_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 89, _1080p * 509, _1080p * 111, _1080p * 151)
	var_19_0:addElement(var_19_8)

	var_19_0.OperatorFilterBlackOpsButton = var_19_8

	local var_19_9
	local var_19_10 = MenuBuilder.BuildRegisteredType("WZOperatorFilterSelectTextButton", {
		controllerIndex = var_19_1
	})

	var_19_10.id = "OperatorFilterModernWarfareButton"

	var_19_10.Text:setText(Engine.CBBHFCGDIC("VIDSUBTITLES/MODERNWARFARE"), 0)
	var_19_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 89, _1080p * 509, _1080p * 151, _1080p * 191)
	var_19_0:addElement(var_19_10)

	var_19_0.OperatorFilterModernWarfareButton = var_19_10

	local var_19_11
	local var_19_12 = MenuBuilder.BuildRegisteredType("WZOperatorFilterSelectTextButton", {
		controllerIndex = var_19_1
	})

	var_19_12.id = "OperatorFilterAllOperatorsButton"

	var_19_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("WZ_TU_TANGO/ALL_OPERATORS")), 0)
	var_19_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 89, _1080p * 509, _1080p * 31, _1080p * 71)
	var_19_0:addElement(var_19_12)

	var_19_0.OperatorFilterAllOperatorsButton = var_19_12

	local var_19_13
	local var_19_14 = MenuBuilder.BuildRegisteredType("WZOperatorFilterSelectTextButton", {
		controllerIndex = var_19_1
	})

	var_19_14.id = "OperatorFilterFavorites"

	var_19_14.Text:setText(Engine.CBBHFCGDIC("MENU/FAVORITES_CAPS"), 0)
	var_19_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 89, _1080p * 509, _1080p * -9, _1080p * 31)
	var_19_0:addElement(var_19_14)

	var_19_0.OperatorFilterFavorites = var_19_14

	local var_19_15
	local var_19_16 = MenuBuilder.BuildRegisteredType("WZOperatorFilterSelectImageButton", {
		controllerIndex = var_19_1
	})

	var_19_16.id = "DpadButton"

	var_19_16:SetScale(-0.78, 0)
	var_19_16.Image:SetLeft(_1080p * -64, 0)
	var_19_16.Image:SetRight(_1080p * 64, 0)
	var_19_16.Image:SetTop(_1080p * -64, 0)
	var_19_16.Image:SetBottom(_1080p * 64, 0)
	var_19_16.Image:setImage(RegisterMaterial("button_dpad_vertical"), 0)
	var_19_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -17, _1080p * 123, _1080p * 21, _1080p * 161)
	var_19_0:addElement(var_19_16)

	var_19_0.DpadButton = var_19_16

	local function var_19_17()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_17

	local var_19_18
	local var_19_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_16:RegisterAnimationSequence("ShowKBMInput", var_19_19)

	local function var_19_20()
		var_19_16:AnimateSequence("ShowKBMInput")
	end

	var_19_0._sequences.ShowKBMInput = var_19_20

	local var_19_21
	local var_19_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_16:RegisterAnimationSequence("ShowDPadInput", var_19_22)

	local function var_19_23()
		var_19_16:AnimateSequence("ShowDPadInput")
	end

	var_19_0._sequences.ShowDPadInput = var_19_23

	local var_19_24
	local var_19_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 111
		}
	}

	var_19_6:RegisterAnimationSequence("ShowFavoriteFilter", var_19_25)

	local var_19_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 151
		}
	}

	var_19_8:RegisterAnimationSequence("ShowFavoriteFilter", var_19_26)

	local var_19_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		}
	}

	var_19_12:RegisterAnimationSequence("ShowFavoriteFilter", var_19_27)

	local var_19_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 31
		}
	}

	var_19_14:RegisterAnimationSequence("ShowFavoriteFilter", var_19_28)

	local function var_19_29()
		var_19_6:AnimateSequence("ShowFavoriteFilter")
		var_19_8:AnimateSequence("ShowFavoriteFilter")
		var_19_12:AnimateSequence("ShowFavoriteFilter")
		var_19_14:AnimateSequence("ShowFavoriteFilter")
	end

	var_19_0._sequences.ShowFavoriteFilter = var_19_29

	local var_19_30
	local var_19_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 111
		}
	}

	var_19_6:RegisterAnimationSequence("HideFavoriteFilter", var_19_31)

	local var_19_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 151
		}
	}

	var_19_8:RegisterAnimationSequence("HideFavoriteFilter", var_19_32)

	local var_19_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		}
	}

	var_19_12:RegisterAnimationSequence("HideFavoriteFilter", var_19_33)

	local var_19_34 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 31
		}
	}

	var_19_14:RegisterAnimationSequence("HideFavoriteFilter", var_19_34)

	local function var_19_35()
		var_19_6:AnimateSequence("HideFavoriteFilter")
		var_19_8:AnimateSequence("HideFavoriteFilter")
		var_19_12:AnimateSequence("HideFavoriteFilter")
		var_19_14:AnimateSequence("HideFavoriteFilter")
	end

	var_19_0._sequences.HideFavoriteFilter = var_19_35

	var_0_9(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("WZOperatorFilter", WZOperatorFilter)
LockTable(_M)
