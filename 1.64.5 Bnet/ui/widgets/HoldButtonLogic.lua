local var_0_0 = "onProgress"
local var_0_1 = "onCancel"
local var_0_2 = "onConfirm"
local var_0_3 = {
	PRESS_DURATION = 1,
	ON_FILL_COMPLETE_DELAY = 1,
	EMPTY_DURATION = 150
}

local function var_0_4(arg_1_0, arg_1_1)
	arg_1_1.buttons = arg_1_1.buttons or {
		primary = true
	}
	arg_1_1.emptyDuration = arg_1_1.emptyDuration or var_0_3.EMPTY_DURATION
	arg_1_1.onFillCompleteDelay = arg_1_1.onFillCompleteDelay or var_0_3.ON_FILL_COMPLETE_DELAY
	arg_1_1.clickKeyboardAndMouse = arg_1_1.clickKeyboardAndMouse or false

	if arg_1_1.requireFocus == nil then
		arg_1_1.requireFocus = true
	end

	return arg_1_1
end

local function var_0_5(arg_2_0, arg_2_1)
	if arg_2_0 == var_0_0 then
		return arg_2_1.onProgress
	elseif arg_2_0 == var_0_2 then
		return arg_2_1.onConfirm
	else
		return arg_2_1.onCancel
	end
end

local function var_0_6(arg_3_0, arg_3_1)
	if arg_3_0 == var_0_0 then
		return arg_3_1.onProgress
	elseif arg_3_0 == var_0_2 then
		return arg_3_1.onConfirm
	else
		return arg_3_1.onCancel
	end
end

local function var_0_7(arg_4_0, arg_4_1)
	return arg_4_0 and arg_4_0.target or arg_4_1
end

local function var_0_8(arg_5_0, arg_5_1)
	return arg_5_0._isKBMActive and var_0_3.PRESS_DURATION or arg_5_1.duration
end

local function var_0_9(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	return arg_6_0._buttonOptions.fill:SetProgress(arg_6_1, arg_6_2 or 0, arg_6_3)
end

local function var_0_10(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0._buttonOptions.fill:SetAlpha(arg_7_1, arg_7_2, arg_7_3)
end

local function var_0_11(arg_8_0)
	var_0_9(arg_8_0, 0, arg_8_0._buttonOptions.emptyDuration, LUI.EASING.inQuadratic)
	var_0_10(arg_8_0, 1, 350, LUI.EASING.inCubic)

	arg_8_0.fillTween = nil
end

local function var_0_12(arg_9_0, arg_9_1)
	assert(arg_9_0._buttonOptions)
	assert(arg_9_0._buttonOptions.duration)

	arg_9_0._buttonOptions.duration = arg_9_1
end

local function var_0_13(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0._buttonOptions.soundFX

	return var_10_0 and var_10_0[arg_10_1] and var_10_0.gamepadOnly and not arg_10_0._isKBMActive
end

local function var_0_14(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0._buttonOptions.animations

	return var_11_0 and var_11_0[arg_11_1] and var_11_0.gamepadOnly and not arg_11_0._isKBMActive
end

local function var_0_15(arg_12_0, arg_12_1)
	return not arg_12_1.buttons[arg_12_0.button]
end

local function var_0_16(arg_13_0, arg_13_1)
	return arg_13_1.requireFocus and not arg_13_0:isInFocus()
end

local function var_0_17(arg_14_0)
	return arg_14_0.disabled
end

local function var_0_18(arg_15_0, arg_15_1)
	if var_0_13(arg_15_0, arg_15_1) then
		local var_15_0 = var_0_5(arg_15_1, arg_15_0._buttonOptions.soundFX)

		Engine.BJDBIAGIDA(var_15_0)
	end
end

local function var_0_19(arg_16_0, arg_16_1, arg_16_2)
	if var_0_14(arg_16_0, arg_16_1) then
		local var_16_0 = var_0_6(arg_16_1, arg_16_0._buttonOptions.animations)

		ACTIONS.AnimateSequence(arg_16_2, var_16_0)
	end
end

local function var_0_20(arg_17_0, arg_17_1)
	arg_17_0:processEvent({
		isMouse = true,
		name = "gamepad_button",
		button = "primary",
		down = arg_17_1
	})
end

local function var_0_21(arg_18_0, arg_18_1)
	arg_18_0:ReleaseButton()
end

local function var_0_22(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0:Wait(arg_19_2.onFillCompleteDelay).onComplete = function()
		local var_20_0 = arg_19_2.onFillParams

		if var_20_0 then
			assert(type(var_20_0) == "table")
			arg_19_2.onFill(arg_19_1, var_20_0)
		else
			arg_19_2:onFill()
		end
	end
end

local function var_0_23(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	if arg_21_1.fillTween ~= arg_21_3 then
		return
	end

	local var_21_0 = var_0_7(arg_21_0._buttonOptions.animations, arg_21_1)

	var_0_10(arg_21_0, 0, 350, LUI.EASING.inCubic)
	var_0_18(arg_21_0, var_0_2)
	var_0_19(arg_21_0, var_0_2, var_21_0)
	var_0_22(arg_21_0, arg_21_2, arg_21_0._buttonOptions)
end

local function var_0_24(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0._buttonOptions
	local var_22_1 = var_0_7(var_22_0.animations, arg_22_1)
	local var_22_2 = var_22_0.clickKeyboardAndMouse

	arg_22_0._isKBMActive = false

	if var_0_15(arg_22_2, var_22_0) or var_0_16(arg_22_1, var_22_0) or var_0_17(arg_22_1) then
		return
	end

	if var_22_2 and (arg_22_2.qualifier == ButtonQualifiers.Keyboard or arg_22_2.isMouse) then
		arg_22_0._isKBMActive = true
	end

	if not arg_22_2.down and not arg_22_0._isKBMActive then
		arg_22_1:ReleaseButton()
		var_0_18(arg_22_0, var_0_1)
		var_0_19(arg_22_0, var_0_1, var_22_1)
	else
		var_0_18(arg_22_0, var_0_0)
		var_0_19(arg_22_0, var_0_0, var_22_1)

		if not arg_22_1.fillTween then
			var_0_9(arg_22_0, 0)

			local var_22_3 = var_0_8(arg_22_0, var_22_0)

			arg_22_1.fillTween = var_0_9(arg_22_0, 1, var_22_3, LUI.EASING.inOutQuadratic)

			local var_22_4 = arg_22_1.fillTween

			function arg_22_1.fillTween.onComplete()
				var_0_23(arg_22_0, arg_22_1, arg_22_2, var_22_4)
			end
		end
	end
end

local function var_0_25(arg_24_0)
	arg_24_0:registerEventHandler("mousedown", function(arg_25_0, arg_25_1)
		var_0_20(arg_24_0, true)
	end)
	arg_24_0:registerEventHandler("mouseup", function(arg_26_0, arg_26_1)
		var_0_20(arg_24_0, false)
	end)

	if arg_24_0._buttonOptions.requireFocus then
		arg_24_0:addEventHandler("lose_focus", var_0_21)
	end

	arg_24_0:addEventHandler("gamepad_button", function(arg_27_0, arg_27_1)
		var_0_24(arg_24_0, arg_27_0, arg_27_1)
	end)
end

function LUI.AddUIHoldButtonLogic(arg_28_0, arg_28_1, arg_28_2)
	assert(arg_28_2.fill)
	assert(arg_28_2.fill.SetProgress)
	assert(arg_28_2.onFill)
	assert(arg_28_2.duration)

	arg_28_0._controllerIndex = arg_28_1
	arg_28_0._buttonOptions = var_0_4(arg_28_0, arg_28_2)
	arg_28_0.UpdateDuration = var_0_12
	arg_28_0.ReleaseButton = var_0_11

	var_0_9(arg_28_0, 0)
	var_0_25(arg_28_0)
end
