local var_0_0 = 0.001

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0.action(arg_1_0._currentValue, arg_1_0._decimalPlacesToRound, arg_1_1)
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = arg_2_0._currentValue

	arg_2_0._currentValue = arg_2_1

	if arg_2_3 then
		arg_2_0._explicitValue = arg_2_1
	end

	if not arg_2_0._applyable and var_2_0 ~= arg_2_1 then
		arg_2_0.action(arg_2_0._currentValue, arg_2_0._decimalPlacesToRound, arg_2_2)
	end

	arg_2_0:UpdateContent()

	if arg_2_0._onRefresh then
		arg_2_0:_onRefresh(arg_2_2, arg_2_0._currentValue, arg_2_3)
	end
end

local function var_0_3(arg_3_0)
	assert(arg_3_0._currentValue >= arg_3_0._min - var_0_0 and arg_3_0._currentValue <= arg_3_0._max + var_0_0)
	assert(arg_3_0._updateDuration)
	assert(arg_3_0._max - arg_3_0._min > 0)

	local var_3_0 = 0

	LUI.clamp(arg_3_0._currentValue, arg_3_0._min, arg_3_0._max)

	local var_3_1 = (arg_3_0._currentValue - arg_3_0._min) / (arg_3_0._max - arg_3_0._min)

	arg_3_0.fillElement:SetAnchors(0, 1 - var_3_1, 0.5, 0.5, arg_3_0._updateDuration)
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0._min

	arg_4_0._min = arg_4_2

	if arg_4_2 > arg_4_0._currentValue then
		arg_4_0:SetCurrentValue(arg_4_2)
	elseif arg_4_2 < arg_4_0._currentValue and arg_4_0._currentValue > arg_4_0._explicitValue then
		if arg_4_2 < arg_4_0._explicitValue then
			arg_4_0:SetCurrentValue(arg_4_0._explicitValue)
		else
			arg_4_0:SetCurrentValue(arg_4_2)
		end
	else
		var_0_3(arg_4_0)
	end
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._max = arg_5_2

	if arg_5_2 < arg_5_0._currentValue then
		arg_5_0:SetCurrentValue(arg_5_2)
	elseif arg_5_2 > arg_5_0._currentValue and arg_5_0._currentValue < arg_5_0._explicitValue then
		if arg_5_2 > arg_5_0._explicitValue then
			arg_5_0:SetCurrentValue(arg_5_0._explicitValue)
		else
			arg_5_0:SetCurrentValue(arg_5_2)
		end
	else
		var_0_3(arg_5_0)
	end
end

local function var_0_6(arg_6_0)
	var_0_3(arg_6_0)

	local var_6_0 = math.max(0, arg_6_0._decimalPlacesToRound)

	arg_6_0.EditBox.Text.textEdit:setTextEditText(string.format("%." .. var_6_0 .. "f", arg_6_0._currentValue))
end

local function var_0_7(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_1.percent
	local var_7_1 = arg_7_0._max - arg_7_0._min
	local var_7_2 = math.pow(10, arg_7_0._decimalPlacesToRound)
	local var_7_3 = arg_7_0._min
	local var_7_4 = Lerp(var_7_0, arg_7_0._min, arg_7_0._max)
	local var_7_5 = math.ceil(var_7_4 * var_7_2 - 0.5) / var_7_2
	local var_7_6 = LUI.clamp(var_7_5, arg_7_0._min, arg_7_0._max)

	if arg_7_0._decimalPlacesToRound ~= nil then
		var_7_6 = LUI.Round(var_7_6, arg_7_0._decimalPlacesToRound)
	end

	arg_7_0:SetCurrentValue(var_7_6, true)
end

local function var_0_8(arg_8_0, arg_8_1)
	local var_8_0 = string.len(string.format("%." .. arg_8_0._decimalPlacesToRound .. "f", arg_8_0._max))
	local var_8_1 = string.len(string.format("%." .. arg_8_0._decimalPlacesToRound .. "f", arg_8_0._min))
	local var_8_2 = math.max(var_8_1, var_8_0)
	local var_8_3 = {
		autoSelectAllOnActive = true,
		isNumeric = true,
		isPassword = false,
		autoConfirmOnTab = true,
		autoConfirmOnOutsideClick = true,
		isNumericEmpty = true,
		useAutoAlign = true,
		alignment = LUI.Alignment.Left,
		maxInputStringLength = var_8_2,
		focusType = FocusType.MouseOver,
		font = CoD.TextSettings.SmallFont.Font,
		defaultValue = string.format("%." .. arg_8_0._decimalPlacesToRound .. "f", LUI.Round(arg_8_0._currentValue, arg_8_0._decimalPlacesToRound)),
		textSelectionColor = arg_8_0._textSelectionColor,
		name = arg_8_0._name,
		min = arg_8_0._min,
		max = arg_8_0._max
	}

	LUI.AddEditBoxLogic(arg_8_0.EditBox.Text, arg_8_1, var_8_3)

	function arg_8_0.EditBox.Text.m_eventHandlers.button_action(arg_9_0, arg_9_1)
		if not arg_9_0._textEditingActive then
			if Engine.CGABICJHAI() or LUI.IsLastInputKeyboardMouse(arg_9_1.controller) then
				local var_9_0 = arg_9_0.textEdit:getText()

				if arg_8_0._firstInteraction then
					if not isNumeric then
						local var_9_1 = ""
					end

					arg_8_0._firstInteraction = false
				end

				arg_9_0.textEdit:setTextEditActive()

				arg_9_0._textEditingActive = true

				if arg_9_0._buttonActionCallbackFunc then
					arg_9_0._buttonActionCallbackFunc()
				end
			end

			return true
		end
	end

	arg_8_0.EditBox:SetAsEditBoxHandler(true)
	arg_8_0.EditBox.Text:SetTextEditCompleteCallbackFunc(function(arg_10_0, arg_10_1)
		local var_10_0 = ""

		if not arg_10_1.cancelled then
			var_10_0 = arg_10_1.text or ""
		end

		arg_10_0:dispatchEventToParent({
			name = "slider_edit_box_complete",
			newValue = var_10_0
		})
	end)
end

function LUI.AddSliderWithEditBoxLogic(arg_11_0, arg_11_1, arg_11_2)
	assert(arg_11_2.fillElement)
	assert(arg_11_2.max)
	assert(arg_11_2.min)
	assert(arg_11_2.decimalPlacesToRound)

	arg_11_0.fillElement = arg_11_2.fillElement
	arg_11_0._name = arg_11_2.name
	arg_11_0._max = arg_11_2.max
	arg_11_0._min = arg_11_2.min
	arg_11_0._step = arg_11_2.step or 1
	arg_11_0._textSelectionColor = arg_11_2.textSelectionColor
	arg_11_0._valueGetter = arg_11_2.valueGetter
	arg_11_0._onRefresh = arg_11_2.onRefresh
	arg_11_0._onReset = arg_11_2.onReset
	arg_11_0._defaultValueGetter = arg_11_2.defaultValueGetter
	arg_11_0._onDependencyParentRefresh = arg_11_2.onDependencyParentRefresh
	arg_11_0._applyable = arg_11_2.applyable == true

	if Engine.CGABICJHAI() and arg_11_2.pcstep then
		arg_11_0._step = arg_11_2.pcstep
	end

	arg_11_0._updateDuration = arg_11_2.updateDuration or 0
	arg_11_0.UpdateContent = var_0_6

	assert(arg_11_2.action)

	arg_11_0.action = arg_11_2.action
	arg_11_0._currentValue = arg_11_2.defaultValue or arg_11_0._min
	arg_11_0._decimalPlacesToRound = arg_11_2.decimalPlacesToRound
	arg_11_0._currentValue = LUI.clamp(arg_11_0._currentValue, arg_11_0._min, arg_11_0._max)
	arg_11_0._explicitValue = arg_11_0._currentValue

	assert(arg_11_0._currentValue >= arg_11_0._min - var_0_0 and arg_11_0._currentValue <= arg_11_0._max + var_0_0)
	var_0_8(arg_11_0, arg_11_1)

	function arg_11_0.SetCurrentValue(arg_12_0, arg_12_1, arg_12_2)
		var_0_2(arg_12_0, arg_12_1, arg_11_1, arg_12_2)
	end

	arg_11_0.SetMinimumValue = var_0_4
	arg_11_0.SetMaximumValue = var_0_5

	arg_11_0:SetCurrentValue(arg_11_0._currentValue)

	if arg_11_0._initialized then
		return true
	end

	if not arg_11_0.bindButton then
		local var_11_0 = LUI.UIBindButton.new()

		var_11_0.id = "selfBindButton"

		arg_11_0:addElement(var_11_0)

		arg_11_0.bindButton = var_11_0
	end

	local function var_11_1(arg_13_0, arg_13_1)
		if arg_11_0:isInFocus() then
			local var_13_0 = arg_11_0._currentValue - arg_11_0._step

			if var_13_0 >= arg_11_0._min then
				Engine.BJDBIAGIDA(CoD.SFX.AdjustSlider)
			else
				var_13_0 = arg_11_0._min
			end

			if arg_11_0._decimalPlacesToRound then
				var_13_0 = LUI.Round(var_13_0, arg_11_0._decimalPlacesToRound)
			end

			var_0_2(arg_11_0, var_13_0, arg_13_1.controller, true)

			return true
		end

		return false
	end

	local function var_11_2(arg_14_0, arg_14_1)
		if arg_11_0:isInFocus() then
			local var_14_0 = arg_11_0._currentValue + arg_11_0._step

			if var_14_0 <= arg_11_0._max then
				Engine.BJDBIAGIDA(CoD.SFX.AdjustSlider)
			else
				var_14_0 = arg_11_0._max
			end

			if arg_11_0._decimalPlacesToRound then
				var_14_0 = LUI.Round(var_14_0, arg_11_0._decimalPlacesToRound)
			end

			var_0_2(arg_11_0, var_14_0, arg_14_1.controller, true)

			return true
		end

		return false
	end

	arg_11_0.bindButton:addEventHandler("button_left", var_11_1)
	arg_11_0.bindButton:addEventHandler("button_right", var_11_2)

	arg_11_0._initialized = true

	arg_11_0:registerEventHandler("set_slider_fill_percent", var_0_7)
	arg_11_0:addEventHandler("slider_edit_box_complete", function(arg_15_0, arg_15_1)
		local var_15_0 = arg_15_1.newValue

		if tonumber(var_15_0) ~= nil then
			local var_15_1 = LUI.clamp(tonumber(var_15_0), arg_15_0._min, arg_15_0._max)

			arg_15_0:SetCurrentValue(var_15_1, true)
		else
			arg_15_0:SetCurrentValue(arg_15_0._currentValue, true)
		end
	end)

	local function var_11_3(arg_16_0, arg_16_1)
		if not arg_16_0:IsDisabled() then
			local var_16_0 = arg_16_0:getWidth()
			local var_16_1, var_16_2, var_16_3, var_16_4 = arg_16_0:getRect()
			local var_16_5, var_16_6 = arg_16_1.root:PixelsToUnits(var_16_1, var_16_2)
			local var_16_7, var_16_8 = arg_16_1.root:PixelsToUnits(arg_16_1.x, arg_16_1.y)
			local var_16_9 = (var_16_7 - var_16_5) / var_16_0
			local var_16_10 = LUI.clamp(var_16_9, 0, 1)

			arg_16_0:dispatchEventToParent({
				name = "set_slider_fill_percent",
				percent = var_16_10
			})
		end
	end

	local function var_11_4(arg_17_0, arg_17_1)
		Engine.BFAABIIGDC(true)
		var_11_3(arg_17_0, arg_17_1)
	end

	local function var_11_5(arg_18_0, arg_18_1)
		Engine.BFAABIIGDC(false)
	end

	arg_11_0:addEventHandler("refresh_values", function(arg_19_0, arg_19_1)
		arg_19_0:SetCurrentValue(arg_19_0._currentValue)

		return true
	end)
	arg_11_0:addEventHandler("seek_value", function(arg_20_0, arg_20_1)
		if arg_20_0._valueGetter then
			local var_20_0 = arg_20_0._valueGetter(arg_20_1.controllerIndex or arg_11_1)

			arg_20_0:SetCurrentValue(var_20_0)

			arg_20_0._explicitValue = var_20_0
		end
	end)
	arg_11_0:addEventHandler("reset_value", function(arg_21_0, arg_21_1)
		if arg_21_0._defaultValueGetter and not arg_21_0.disabled and not arg_21_0._applyable then
			arg_21_0:SetCurrentValue(tonumber(arg_21_0._defaultValueGetter(arg_21_1.controllerIndex or arg_11_1)), true)
			arg_21_0:_onReset(arg_21_1.controllerIndex)
		end

		Engine.BFAABIIGDC(false)

		arg_21_0.GenericFillBar.m_leftMouseDown = nil
	end)
	arg_11_0:addEventHandler("apply_value", function(arg_22_0, arg_22_1)
		if arg_22_0._applyable then
			var_0_1(arg_22_0, arg_22_1.controllerIndex or arg_11_1)
		end
	end)
	arg_11_0:addEventHandler("parent_value_changed", function(arg_23_0, arg_23_1)
		if arg_23_0._onDependencyParentRefresh then
			local var_23_0 = arg_23_0._onDependencyParentRefresh(arg_23_0, arg_23_1.controllerIndex or arg_11_1, arg_23_0._currentValue, arg_23_1.parentId, arg_23_1.parentValue)

			if var_23_0 == true then
				arg_23_0:_onRefresh(arg_23_1.controllerIndex, arg_23_0._currentValue)
			elseif var_23_0 ~= nil then
				arg_23_0:SetCurrentValue(var_23_0)
			end
		end
	end)
	arg_11_0:addEventHandler("refresh_option", function(arg_24_0, arg_24_1)
		arg_24_0:_onRefresh(arg_24_1.controllerIndex, arg_24_0._currentValue)
	end)

	local function var_11_6(arg_25_0, arg_25_1)
		var_11_5(arg_25_0, arg_25_1)

		arg_25_0.m_leftMouseDown = nil
	end

	arg_11_0.GenericFillBar:SetHandleMouse(true)
	arg_11_0.GenericFillBar:registerEventHandler("leftmousedown", var_11_4)
	arg_11_0.GenericFillBar:registerEventHandler("leftmouseup", var_11_5)
	arg_11_0.GenericFillBar:registerEventHandler("mouse_capture_lost", var_11_5)
	arg_11_0.GenericFillBar:registerEventHandler("mousedrag", var_11_3)
	arg_11_0.GenericFillBar:registerEventHandler("update_input_type", var_11_6)
	arg_11_0:addEventHandler("mouseup", function(arg_26_0, arg_26_1)
		return true
	end)
	arg_11_0:addEventHandler("mousedown", function(arg_27_0, arg_27_1)
		return true
	end)
	arg_11_0:addEventHandler("mousedrag", function(arg_28_0, arg_28_1)
		return true
	end)
end
