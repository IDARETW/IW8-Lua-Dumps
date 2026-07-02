local var_0_0 = 0.001

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0.action(arg_1_0.currentValue, arg_1_1)
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	local var_2_0 = arg_2_0.currentValue

	arg_2_0.currentValue = arg_2_1

	arg_2_0:UpdateContent()

	if (arg_2_0.applyable == false or arg_2_4) and var_2_0 ~= arg_2_1 and arg_2_0.autoFunctionCall then
		arg_2_0.action(arg_2_0.currentValue, arg_2_2)
	end

	if arg_2_0.onRefresh then
		arg_2_0:onRefresh(arg_2_2, arg_2_0.currentValue, arg_2_3)
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	if arg_3_0.dividedRangeValue == nil then
		local var_3_0 = math.floor((arg_3_1 - arg_3_0.min) / arg_3_0.step + 0.5)

		arg_3_1 = arg_3_0.min + arg_3_0.step * var_3_0
	elseif arg_3_1 < arg_3_0.dividedRangeValue then
		local var_3_1 = math.floor((arg_3_0.dividedRangeValue - arg_3_1) / arg_3_0.step + 0.5)

		arg_3_1 = arg_3_0.dividedRangeValue - arg_3_0.step * var_3_1
	elseif arg_3_1 > arg_3_0.dividedRangeValue then
		local var_3_2 = math.floor((arg_3_1 - arg_3_0.dividedRangeValue) / arg_3_0.dividedRangeStep + 0.5)

		arg_3_1 = arg_3_0.dividedRangeValue + arg_3_0.dividedRangeStep * var_3_2
	end

	if arg_3_1 < arg_3_0.min then
		arg_3_1 = arg_3_1 + arg_3_0.step
	elseif arg_3_1 > arg_3_0.max then
		if arg_3_0.dividedRangeValue == nil then
			arg_3_1 = arg_3_1 - arg_3_0.step
		else
			arg_3_1 = arg_3_1 - arg_3_0.dividedRangeStep
		end
	end

	return arg_3_1
end

local function var_0_4(arg_4_0, arg_4_1)
	if arg_4_0.dividedRangeValue == nil then
		return arg_4_1 + arg_4_0.step
	elseif arg_4_1 >= arg_4_0.dividedRangeValue - arg_4_0.step and arg_4_1 < arg_4_0.dividedRangeValue then
		return arg_4_0.dividedRangeValue
	elseif arg_4_1 < arg_4_0.dividedRangeValue then
		return arg_4_1 + arg_4_0.step
	else
		return arg_4_1 + arg_4_0.dividedRangeStep
	end
end

local function var_0_5(arg_5_0, arg_5_1)
	if arg_5_0.dividedRangeValue == nil then
		return arg_5_1 - arg_5_0.step
	elseif arg_5_1 > arg_5_0.dividedRangeValue and arg_5_1 < arg_5_0.dividedRangeValue + arg_5_0.dividedRangeStep then
		return arg_5_0.dividedRangeValue
	elseif arg_5_1 < arg_5_0.dividedRangeValue then
		return arg_5_1 - arg_5_0.step
	else
		return arg_5_1 - arg_5_0.dividedRangeStep
	end
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_2.action)
	assert(arg_6_0.min)
	assert(arg_6_0.max)
	assert(arg_6_0.UpdateContent)

	arg_6_0.wrapAround = arg_6_2.wrapAround ~= false
	arg_6_0.autoFunctionCall = arg_6_2.autoFunctionCall ~= false
	arg_6_0.decimalPlacesToRound = arg_6_2.decimalPlacesToRound
	arg_6_0.action = arg_6_2.action
	arg_6_0.defaultValueGetter = arg_6_2.defaultValueGetter
	arg_6_0.valueGetter = arg_6_2.valueGetter
	arg_6_0.onRefresh = arg_6_2.onRefresh
	arg_6_0.onReset = arg_6_2.onReset
	arg_6_0.onDependencyParentRefresh = arg_6_2.onDependencyParentRefresh
	arg_6_0.applyable = arg_6_2.applyable == true
	arg_6_0.resettable = arg_6_2.resettable == true

	if not arg_6_2.defaultValue and arg_6_0.valueGetter then
		arg_6_0.currentValue = arg_6_0.valueGetter(arg_6_1)
	else
		arg_6_0.currentValue = arg_6_2.defaultValue or arg_6_0.min
	end

	assert(arg_6_0.currentValue >= arg_6_0.min - var_0_0 and arg_6_0.currentValue <= arg_6_0.max + var_0_0)
	arg_6_0:UpdateContent()

	if not arg_6_0.wrapAround then
		if arg_6_0.currentValue == arg_6_0.min then
			arg_6_0:processEvent({
				name = "arrow_button_left_blocked"
			})
		elseif arg_6_0.currentValue == arg_6_0.max then
			arg_6_0:processEvent({
				name = "arrow_button_right_blocked"
			})
		end
	end

	if not arg_6_0.autoFunctionCall then
		arg_6_0:addEventHandler("button_action", function(arg_7_0, arg_7_1)
			arg_6_0.action(arg_6_0.currentValue, arg_7_1.controller)
		end)
	end

	function arg_6_0.SetCurrentValue(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
		var_0_2(arg_8_0, arg_8_1, arg_6_1, arg_8_2, arg_8_3)
	end

	if arg_6_0.initialized then
		return true
	end

	if not arg_6_0.bindButton then
		local var_6_0 = LUI.UIBindButton.new()

		var_6_0.id = "selfBindButton"

		arg_6_0:addElement(var_6_0)

		arg_6_0.bindButton = var_6_0

		arg_6_0.bindButton:registerEventHandler("enable", function(arg_9_0, arg_9_1)
			return
		end)
	end

	arg_6_0.bindButton:ElementDisable()
	arg_6_0:addEventHandler("gain_focus", function(arg_10_0, arg_10_1)
		if not arg_6_0:IsDisabled() then
			arg_6_0.bindButton:ElementEnable(arg_10_1)
		end
	end)
	arg_6_0:addEventHandler("lose_focus", function(arg_11_0, arg_11_1)
		arg_6_0.bindButton:ElementDisable()
	end)
	arg_6_0.bindButton:registerEventHandler("popup_inactive", function(arg_12_0, arg_12_1)
		return
	end)

	local function var_6_1(arg_13_0, arg_13_1)
		local var_13_0 = var_0_5(arg_6_0, arg_6_0.currentValue)

		if arg_6_0.decimalPlacesToRound then
			var_13_0 = LUI.Round(var_13_0, arg_6_0.decimalPlacesToRound)
		end

		local var_13_1 = math.max(arg_6_0.min, var_13_0)

		if arg_6_0.currentValue <= arg_6_0.min then
			if arg_6_0.wrapAround then
				var_13_1 = arg_6_0.max
			else
				return
			end
		end

		local var_13_2 = var_0_3(arg_6_0, var_13_1)

		if var_13_2 == arg_6_0.min and not arg_6_0.wrapAround then
			arg_6_0:processEvent({
				name = "arrow_button_left_blocked"
			})
		else
			arg_6_0:processEvent({
				name = "arrow_button_left_moved"
			})
		end

		arg_6_0:processEvent({
			name = "arrow_button_right_not_blocked"
		})

		if arg_6_0.fillElement then
			Engine.BJDBIAGIDA(CoD.SFX.AdjustSlider)
		else
			Engine.BJDBIAGIDA(CoD.SFX.OtherAdjust)
		end

		var_0_2(arg_6_0, var_13_2, arg_13_1.controller, true)

		return true
	end

	local function var_6_2(arg_14_0, arg_14_1)
		local var_14_0 = var_0_4(arg_6_0, arg_6_0.currentValue)

		if arg_6_0.decimalPlacesToRound then
			var_14_0 = LUI.Round(var_14_0, arg_6_0.decimalPlacesToRound)
		end

		local var_14_1 = math.min(arg_6_0.max, var_14_0)

		if arg_6_0.currentValue == arg_6_0.max then
			if arg_6_0.wrapAround then
				var_14_1 = arg_6_0.min
			else
				return
			end
		end

		local var_14_2 = var_0_3(arg_6_0, var_14_1)

		if var_14_2 == arg_6_0.max and not arg_6_0.wrapAround then
			arg_6_0:processEvent({
				name = "arrow_button_right_blocked"
			})
		else
			arg_6_0:processEvent({
				name = "arrow_button_right_moved"
			})
		end

		arg_6_0:processEvent({
			name = "arrow_button_left_not_blocked"
		})

		if arg_6_0.fillElement then
			Engine.BJDBIAGIDA(CoD.SFX.AdjustSlider)
		else
			Engine.BJDBIAGIDA(CoD.SFX.OtherAdjust)
		end

		var_0_2(arg_6_0, var_14_2, arg_14_1.controller, true)

		return true
	end

	if arg_6_2.enableButtonInput ~= false then
		arg_6_0.bindButton:addEventHandler("button_left", var_6_1)
		arg_6_0.bindButton:addEventHandler("button_right", var_6_2)
	end

	arg_6_0:addEventHandler("left_arrow_clicked", var_6_1)
	arg_6_0:addEventHandler("right_arrow_clicked", var_6_2)
	arg_6_0:addEventHandler("refresh_values", function(arg_15_0, arg_15_1)
		arg_15_0:SetCurrentValue(arg_15_0.currentValue)

		return true
	end)
	arg_6_0:addEventHandler("seek_value", function(arg_16_0, arg_16_1)
		if arg_16_0.valueGetter then
			arg_16_0:SetCurrentValue(arg_16_0.valueGetter(arg_16_1.controllerIndex or arg_6_1))
		end
	end)
	arg_6_0:addEventHandler("reset_value", function(arg_17_0, arg_17_1)
		if arg_17_0.defaultValueGetter and not arg_17_0.disabled and (not arg_17_0.applyable or arg_17_0.resettable) then
			arg_17_0:SetCurrentValue(arg_17_0.defaultValueGetter(arg_17_1.controllerIndex or arg_6_1), nil, true)
			arg_17_0:onReset(arg_17_1.controllerIndex)
		end
	end)
	arg_6_0:addEventHandler("apply_value", function(arg_18_0, arg_18_1)
		if arg_18_0.applyable then
			var_0_1(arg_6_0, arg_18_1.controllerIndex or arg_6_1)
		end
	end)
	arg_6_0:addEventHandler("parent_value_changed", function(arg_19_0, arg_19_1)
		if arg_19_0.onDependencyParentRefresh then
			local var_19_0 = arg_19_0.onDependencyParentRefresh(arg_19_0, arg_19_1.controllerIndex or arg_6_1, arg_19_0.currentValue, arg_19_1.parentId, arg_19_1.parentValue)

			if var_19_0 == true then
				arg_19_0:onRefresh(arg_19_1.controllerIndex, arg_19_0._currentValue)
			elseif var_19_0 ~= nil then
				arg_19_0:SetCurrentValue(var_19_0)
			end
		end
	end)
	arg_6_0:addEventHandler("refresh_option", function(arg_20_0, arg_20_1)
		arg_20_0:onRefresh(arg_20_1.controllerIndex, arg_20_0.currentValue)
	end)

	local var_6_3 = 350

	if arg_6_0.ArrowLeft then
		local var_6_4
		local var_6_5

		local function var_6_6()
			if arg_6_0.ArrowLeft.m_mouseOver and arg_6_0.ArrowLeft.m_leftMouseDown and arg_6_0.ArrowLeft:isInFocus() and not arg_6_0.ArrowLeft:IsDisabled() then
				arg_6_0:processEvent({
					name = "left_arrow_clicked",
					controller = arg_6_1
				})

				if not arg_6_2.clickRepeatDisabled then
					var_6_4 = arg_6_0:Wait(var_6_3)
					var_6_4.onComplete = var_6_6
				end
			else
				var_6_4 = nil
			end
		end

		local function var_6_7()
			if var_6_4 then
				function var_6_4.onComplete()
					return
				end

				var_6_4 = nil
			end

			var_6_6()
		end

		arg_6_0.ArrowLeft:addEventHandler("leftmousedown", var_6_7)
	end

	if arg_6_0.ArrowRight then
		local var_6_8
		local var_6_9

		local function var_6_10()
			if arg_6_0.ArrowRight.m_mouseOver and arg_6_0.ArrowRight.m_leftMouseDown and arg_6_0.ArrowRight:isInFocus() and not arg_6_0.ArrowRight:IsDisabled() then
				arg_6_0:processEvent({
					name = "right_arrow_clicked",
					controller = arg_6_1
				})

				if not arg_6_2.clickRepeatDisabled then
					var_6_8 = arg_6_0:Wait(var_6_3)
					var_6_8.onComplete = var_6_10
				end
			else
				var_6_8 = nil
			end
		end

		local function var_6_11()
			if var_6_8 then
				function var_6_8.onComplete()
					return
				end

				var_6_8 = nil
			end

			var_6_10()
		end

		arg_6_0.ArrowRight:addEventHandler("leftmousedown", var_6_11)
	end

	arg_6_0.initialized = true
end

function LUI.AddUICustomArrowButtonLogic(arg_27_0, arg_27_1, arg_27_2)
	assert(arg_27_2.max)
	assert(arg_27_2.min)
	assert(arg_27_2.UpdateContent)

	arg_27_0.max = arg_27_2.max
	arg_27_0.min = arg_27_2.min
	arg_27_0.UpdateContent = arg_27_2.UpdateContent
	arg_27_0.step = arg_27_2.step or 1

	var_0_6(arg_27_0, arg_27_1, arg_27_2)
end

local function var_0_7(arg_28_0)
	assert(arg_28_0.updateDuration)
	arg_28_0.Text:setText(arg_28_0.labels[arg_28_0.currentValue], arg_28_0.updateDuration)

	if arg_28_0.SetPipPosition and arg_28_0.currentValue then
		arg_28_0:SetPipPosition(arg_28_0.currentValue)
	end
end

function LUI.AddUIArrowTextButtonLogic(arg_29_0, arg_29_1, arg_29_2)
	assert(arg_29_2.labels)
	assert(arg_29_0.Text)

	arg_29_0.labels = arg_29_2.labels
	arg_29_0.max = #arg_29_0.labels
	arg_29_0.min = 1
	arg_29_0.step = 1
	arg_29_0.updateDuration = arg_29_2.updateDuration or 0
	arg_29_0.UpdateContent = arg_29_2.UpdateContent or var_0_7

	arg_29_0:SetButtonDisabled(arg_29_0.max == arg_29_0.min)
	var_0_6(arg_29_0, arg_29_1, arg_29_2)
end

ArrowBarFillDirections = {
	LEFT_TO_RIGHT,
	RIGHT_TO_LEFT
}

local function var_0_8(arg_30_0)
	assert(arg_30_0.currentValue <= arg_30_0.max + var_0_0 and arg_30_0.currentValue >= arg_30_0.min - var_0_0)
	assert(arg_30_0.updateDuration)

	local var_30_0 = 0

	if arg_30_0.dividedRangeValue == nil then
		var_30_0 = (arg_30_0.currentValue - arg_30_0.min) / (arg_30_0.max - arg_30_0.min)
	elseif arg_30_0.currentValue <= arg_30_0.dividedRangeValue then
		var_30_0 = (arg_30_0.currentValue - arg_30_0.min) / (arg_30_0.dividedRangeValue - arg_30_0.min) * arg_30_0.dividedRangeFraction
	else
		var_30_0 = (arg_30_0.currentValue - arg_30_0.dividedRangeValue) / (arg_30_0.max - arg_30_0.dividedRangeValue) * (1 - arg_30_0.dividedRangeFraction) + arg_30_0.dividedRangeFraction
	end

	if arg_30_0.direction == ArrowBarFillDirections.LEFT_TO_RIGHT then
		arg_30_0.fillElement:SetAnchors(0, 1 - var_30_0, 0, 0, arg_30_0.updateDuration)

		if arg_30_0.fillMarkerElement then
			local var_30_1, var_30_2, var_30_3, var_30_4 = arg_30_0.fillMarkerElement:getLocalRect()
			local var_30_5 = (var_30_3 / _1080p - var_30_1 / _1080p) / 2

			arg_30_0.fillMarkerElement:SetAnchorsAndPosition(var_30_0, 1 - var_30_0, 0, 0, _1080p * -var_30_5, _1080p * var_30_5, 0, 0)
		end
	else
		arg_30_0.fillElement:SetAnchors(1 - var_30_0, 0, 0, 0, arg_30_0.updateDuration)

		if arg_30_0.fillMarkerElement then
			local var_30_6, var_30_7, var_30_8, var_30_9 = arg_30_0.fillMarkerElement:getLocalRect()
			local var_30_10 = (var_30_8 / _1080p - var_30_6 / _1080p) / 2

			arg_30_0.fillMarkerElement:SetAnchorsAndPosition(1 - var_30_0, var_30_0, 0, 0, _1080p * -var_30_10, _1080p * var_30_10, 0, 0)
		end
	end

	if arg_30_0.showTextLabel then
		arg_30_0.Text:setText(string.format("%.2f", arg_30_0.currentValue), arg_30_0.updateDuration)
		arg_30_0.ShowNumberFunction(true)
	end
end

local function var_0_9(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1.percent
	local var_31_1 = arg_31_0.min

	if arg_31_0.dividedRangeValue == nil then
		var_31_1 = Lerp(var_31_0, arg_31_0.min, arg_31_0.max)
	elseif var_31_0 <= arg_31_0.dividedRangeFraction then
		var_31_0 = var_31_0 / arg_31_0.dividedRangeFraction
		var_31_1 = Lerp(var_31_0, arg_31_0.min, arg_31_0.dividedRangeValue)
	else
		local var_31_2 = (var_31_0 - arg_31_0.dividedRangeFraction) / (1 - arg_31_0.dividedRangeFraction)

		var_31_1 = Lerp(var_31_2, arg_31_0.dividedRangeValue, arg_31_0.max)
	end

	if arg_31_0.decimalPlacesToRound ~= nil then
		var_31_1 = LUI.Round(var_31_1, arg_31_0.decimalPlacesToRound)
	end

	if arg_31_0.snapToStep then
		var_31_1 = var_0_3(arg_31_0, var_31_1)
	end

	local var_31_3 = LUI.clamp(var_31_1, arg_31_0.min, arg_31_0.max)

	if var_31_3 == arg_31_0.min and not arg_31_0.wrapAround then
		arg_31_0:processEvent({
			name = "arrow_button_left_blocked"
		})
	else
		arg_31_0:processEvent({
			name = "arrow_button_left_not_blocked"
		})
	end

	if var_31_3 == arg_31_0.max and not arg_31_0.wrapAround then
		arg_31_0:processEvent({
			name = "arrow_button_right_blocked"
		})
	else
		arg_31_0:processEvent({
			name = "arrow_button_right_not_blocked"
		})
	end

	arg_31_0:SetCurrentValue(var_31_3)
end

function LUI.AddMouseSliderLogic(arg_32_0)
	local function var_32_0(arg_33_0, arg_33_1)
		if not arg_33_0:IsDisabled() then
			local var_33_0 = arg_33_0:getWidth()
			local var_33_1, var_33_2, var_33_3, var_33_4 = arg_33_0:getRect()
			local var_33_5, var_33_6 = arg_33_1.root:PixelsToUnits(var_33_1, var_33_2)
			local var_33_7, var_33_8 = arg_33_1.root:PixelsToUnits(arg_33_1.x, arg_33_1.y)
			local var_33_9 = (var_33_7 - var_33_5) / var_33_0
			local var_33_10 = LUI.clamp(var_33_9, 0, 1)

			arg_33_0:dispatchEventToParent({
				name = "set_bar_fill_percent",
				percent = var_33_10
			})
		end
	end

	arg_32_0.GenericFillBar:SetHandleMouse(true)
	arg_32_0.GenericFillBar:registerEventHandler("leftmousedown", var_32_0)
	arg_32_0.GenericFillBar:registerEventHandler("mousedrag", var_32_0)
end

function LUI.AddUIArrowFillBarButtonLogic(arg_34_0, arg_34_1, arg_34_2)
	assert(arg_34_2.fillElement)
	assert(arg_34_2.max)
	assert(arg_34_2.min)

	arg_34_0.fillElement = arg_34_2.fillElement
	arg_34_0.fillMarkerElement = arg_34_2.fillMarkerElement
	arg_34_0.max = arg_34_2.max
	arg_34_0.min = arg_34_2.min
	arg_34_0.step = arg_34_2.step or 1

	if Engine.CGABICJHAI() and arg_34_2.pcstep then
		arg_34_0.step = arg_34_2.pcstep
	end

	if arg_34_2.snapToStep == nil then
		arg_34_0.snapToStep = Engine.CGABICJHAI()
	else
		arg_34_0.snapToStep = arg_34_2.snapToStep
	end

	arg_34_0.direction = arg_34_2.direction or ArrowBarFillDirections.LEFT_TO_RIGHT

	assert(arg_34_0.direction == ArrowBarFillDirections.LEFT_TO_RIGHT or arg_34_0.direction == ArrowBarFillDirections.RIGHT_TO_LEFT)

	arg_34_0.updateDuration = arg_34_2.updateDuration or 0
	arg_34_0.UpdateContent = arg_34_2.UpdateContent or var_0_8
	arg_34_0.showTextLabel = arg_34_2.showTextLabel
	arg_34_0.dividedRangeValue = arg_34_2.dividedRangeValue
	arg_34_0.dividedRangeFraction = arg_34_2.dividedRangeFraction or 0.5
	arg_34_0.dividedRangeStep = arg_34_2.dividedRangeStep or arg_34_0.step

	assert(arg_34_0.dividedRangeValue == nil or arg_34_0.min < arg_34_0.dividedRangeValue and arg_34_0.dividedRangeValue < arg_34_0.max)
	assert(arg_34_0.dividedRangeFraction > 0 and arg_34_0.dividedRangeFraction < 1)
	var_0_6(arg_34_0, arg_34_1, arg_34_2)
	arg_34_0:registerEventHandler("set_bar_fill_percent", var_0_9)
end
