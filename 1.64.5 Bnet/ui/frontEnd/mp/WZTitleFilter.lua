module(..., package.seeall)

local var_0_0 = {
	LOOT.filterOptions.VANGUARD_ONLY,
	LOOT.filterOptions.COLD_WAR_ONLY,
	LOOT.filterOptions.MODERN_WARFARE_ONLY
}

local function var_0_1(arg_1_0)
	for iter_1_0 = 1, #arg_1_0._categoryButtons do
		local var_1_0 = var_0_0[iter_1_0] == arg_1_0._currentFilterType

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

	if _unlocksFilterPreference then
		_unlocksFilterPreference:set(arg_1_0._currentFilterType)
	end

	local var_1_2 = arg_1_0:getParent()

	if var_1_2 then
		var_1_2:processEvent({
			name = "filter_changed",
			controllerIndex = arg_1_0._controllerIndex
		})
	end
end

local function var_0_2(arg_2_0)
	return arg_2_0._currentFilterType
end

local function var_0_3(arg_3_0, arg_3_1)
	assert(arg_3_1 and arg_3_1.targetFilter, "You must pass a reference to the filter you want to animate.")
	ACTIONS.AnimateSequence(arg_3_1.targetFilter, arg_3_1.doWarning and "PulseWarning" or arg_3_1.isSelected and "PulseConfirmSelected" or "PulseConfirm")
end

local function var_0_4(arg_4_0)
	if _unlocksFilterPreference then
		arg_4_0._currentFilterType = LOOT.operatorFilterOptions.VANGUARD_ONLY

		_unlocksFilterPreference:set(LOOT.operatorFilterOptions.VANGUARD_ONLY)
	end
end

local function var_0_5(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1 and arg_5_1.iterator and type(arg_5_1.iterator) == "number" and arg_5_1.iterator or -1
	local var_5_1 = false
	local var_5_2 = arg_5_0._selectedIndex + var_5_0

	if var_5_2 > #arg_5_0._categoryButtons then
		var_5_2 = 1
	end

	local var_5_3 = arg_5_0._categoryButtons[var_5_2]

	if var_5_3 and not var_5_3.disabled then
		var_5_1 = true
		arg_5_0._selectedIndex = var_5_2
	else
		local var_5_4 = var_5_0 > 0 and #arg_5_0._categoryButtons or 1

		for iter_5_0 = var_5_0 > 0 and 1 or #arg_5_0._categoryButtons, var_5_4, var_5_0 do
			if not arg_5_0._categoryButtons[iter_5_0].disabled then
				arg_5_0._selectedIndex = iter_5_0
				var_5_1 = true

				break
			end
		end
	end

	if var_5_1 then
		arg_5_0._currentFilterType = var_0_0[arg_5_0._selectedIndex]

		if arg_5_0._unlocksFilterPreference then
			arg_5_0._unlocksFilterPreference:set(arg_5_0._currentFilterType)
		end

		var_0_1(arg_5_0)
	end
end

local function var_0_6(arg_6_0)
	local var_6_0 = LUI.UIBindButton.new()

	var_6_0.id = "bindButton"

	arg_6_0:addElement(var_6_0)

	arg_6_0.bindButton = var_6_0

	arg_6_0.bindButton:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		var_0_5(arg_6_0)
	end)
	arg_6_0.bindButton:addEventHandler("button_down", function(arg_8_0, arg_8_1)
		var_0_5(arg_6_0, {
			iterator = 1
		})
	end)
end

local function var_0_7(arg_9_0, arg_9_1)
	assert(arg_9_1 and arg_9_1.defaultFilter)

	arg_9_0._currentFilterType = arg_9_1.defaultFilter
	arg_9_0._unlocksFilterPreference = arg_9_1.filterPreference

	if arg_9_0._unlocksFilterPreference then
		local var_9_0 = arg_9_0._unlocksFilterPreference:get()

		if var_9_0 then
			if var_9_0 == LOOT.filterOptions.VANGUARD_ONLY then
				arg_9_0._currentFilterType = LOOT.filterOptions.VANGUARD_ONLY
			elseif var_9_0 == LOOT.filterOptions.MODERN_WARFARE_ONLY then
				arg_9_0._currentFilterType = LOOT.filterOptions.MODERN_WARFARE_ONLY
			elseif var_9_0 == LOOT.filterOptions.COLD_WAR_ONLY then
				arg_9_0._currentFilterType = LOOT.filterOptions.COLD_WAR_ONLY
			end
		end
	end

	var_0_1(arg_9_0)
end

local function var_0_8(arg_10_0, arg_10_1)
	arg_10_0._currentFilterType = arg_10_1

	if arg_10_0._unlocksFilterPreference then
		arg_10_0._unlocksFilterPreference:set(arg_10_0._currentFilterType)
	end

	var_0_1(arg_10_0)
end

local function var_0_9(arg_11_0)
	arg_11_0.FilterModernWarfareButton:addEventHandler("button_action", function(arg_12_0, arg_12_1)
		if arg_11_0.FilterModernWarfareButton._isEnabled then
			var_0_8(arg_11_0, LOOT.filterOptions.MODERN_WARFARE_ONLY)
		end
	end)
	arg_11_0.FilterBlackOpsButton:addEventHandler("button_action", function(arg_13_0, arg_13_1)
		if arg_11_0.FilterBlackOpsButton._isEnabled then
			var_0_8(arg_11_0, LOOT.filterOptions.COLD_WAR_ONLY)
		end
	end)
	arg_11_0.FilterVanguardButton:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		if arg_11_0.FilterVanguardButton._isEnabled then
			var_0_8(arg_11_0, LOOT.filterOptions.VANGUARD_ONLY)
		end
	end)

	local var_11_0 = {
		selectedSwatch = SWATCHES.CH2.SnipeOverlayModernWarfare,
		unselectedSwatch = SWATCHES.WZGlobalSwatches.WZBackground,
		unselectedTextSwatch = SWATCHES.WZGlobalSwatches.WZDescription
	}
	local var_11_1 = {
		selectedSwatch = SWATCHES.CH2.SnipeOverlayBOColdWar,
		unselectedSwatch = SWATCHES.WZGlobalSwatches.WZBackground,
		unselectedTextSwatch = SWATCHES.WZGlobalSwatches.WZDescription
	}
	local var_11_2 = {
		selectedSwatch = SWATCHES.WZCH3.WZCH3VanguardGold,
		unselectedSwatch = SWATCHES.WZGlobalSwatches.WZBackground,
		unselectedTextSwatch = SWATCHES.WZGlobalSwatches.WZDescription
	}

	arg_11_0.FilterModernWarfareButton:ApplyTheme(var_11_0)
	arg_11_0.FilterBlackOpsButton:ApplyTheme(var_11_1)
	arg_11_0.FilterVanguardButton:ApplyTheme(var_11_2)
	arg_11_0:addEventHandler("button_up", function(arg_15_0, arg_15_1)
		var_0_5(filterInstance)
	end)
	arg_11_0:addEventHandler("button_down", function(arg_16_0, arg_16_1)
		var_0_5(filterInstance, {
			iterator = 1
		})
	end)
	arg_11_0:addAndCallEventHandler("update_input_type", var_0_1)
end

local function var_0_10(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0

	arg_17_0._currentFilterType = LOOT.filterOptions.VANGUARD_ONLY
	arg_17_0.SetFilterToDefault = var_0_4
	arg_17_0.AnimateFilterDisplay = var_0_3
	arg_17_0.SetInitialFilter = var_0_7
	arg_17_0.GetCurrentFilter = var_0_2
	arg_17_0.UpdateCategoryButtons = var_0_1
	arg_17_0._controllerIndex = arg_17_1
	arg_17_0._categoryButtons = {
		arg_17_0.FilterVanguardButton,
		arg_17_0.FilterBlackOpsButton,
		arg_17_0.FilterModernWarfareButton
	}

	var_0_9(arg_17_0)
	var_0_6(arg_17_0)
end

function WZTitleFilter(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 142 * _1080p)

	var_18_0.id = "WZTitleFilter"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = LUI.UIImage.new()

	var_18_4.id = "Backing"

	var_18_4:SetRGBFromInt(0, 0)
	var_18_4:SetAlpha(0.5, 0)
	var_18_4:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_18_4:SetBlendMode(BLEND_MODE.multiply)
	var_18_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -144, _1080p * 408, _1080p * -176, _1080p * 306)
	var_18_0:addElement(var_18_4)

	var_18_0.Backing = var_18_4

	local var_18_5
	local var_18_6 = MenuBuilder.BuildRegisteredType("WZOperatorFilterSelectTextButton", {
		controllerIndex = var_18_1
	})

	var_18_6.id = "FilterVanguardButton"

	var_18_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_DIVER/VANGUARD")), 0)
	var_18_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 83, _1080p * 503, _1080p * 12, _1080p * 52)
	var_18_0:addElement(var_18_6)

	var_18_0.FilterVanguardButton = var_18_6

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("WZOperatorFilterSelectTextButton", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "FilterBlackOpsButton"

	var_18_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), 0)
	var_18_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 83, _1080p * 503, _1080p * 52, _1080p * 92)
	var_18_0:addElement(var_18_8)

	var_18_0.FilterBlackOpsButton = var_18_8

	local var_18_9
	local var_18_10 = MenuBuilder.BuildRegisteredType("WZOperatorFilterSelectTextButton", {
		controllerIndex = var_18_1
	})

	var_18_10.id = "FilterModernWarfareButton"

	var_18_10.Text:setText(Engine.CBBHFCGDIC("VIDSUBTITLES/MODERNWARFARE"), 0)
	var_18_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 83, _1080p * 503, _1080p * 92, _1080p * 132)
	var_18_0:addElement(var_18_10)

	var_18_0.FilterModernWarfareButton = var_18_10

	local var_18_11
	local var_18_12 = MenuBuilder.BuildRegisteredType("WZOperatorFilterSelectImageButton", {
		controllerIndex = var_18_1
	})

	var_18_12.id = "DpadButton"

	var_18_12:SetScale(-0.78, 0)
	var_18_12.Image:SetLeft(_1080p * -64, 0)
	var_18_12.Image:SetRight(_1080p * 64, 0)
	var_18_12.Image:SetTop(_1080p * -64, 0)
	var_18_12.Image:SetBottom(_1080p * 64, 0)
	var_18_12.Image:setImage(RegisterMaterial("button_dpad_vertical"), 0)
	var_18_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -17, _1080p * 123, _1080p * 2, _1080p * 142)
	var_18_0:addElement(var_18_12)

	var_18_0.DpadButton = var_18_12

	local function var_18_13()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_13

	local var_18_14
	local var_18_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ShowKBMInput", var_18_15)

	local function var_18_16()
		var_18_12:AnimateSequence("ShowKBMInput")
	end

	var_18_0._sequences.ShowKBMInput = var_18_16

	local var_18_17
	local var_18_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ShowDPadInput", var_18_18)

	local function var_18_19()
		var_18_12:AnimateSequence("ShowDPadInput")
	end

	var_18_0._sequences.ShowDPadInput = var_18_19

	var_0_10(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("WZTitleFilter", WZTitleFilter)
LockTable(_M)
