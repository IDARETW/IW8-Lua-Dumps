local function var_0_0(arg_1_0)
	ACTIONS.AnimateSequence(arg_1_0, "Selected")
end

local function var_0_1(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, "NotSelected")
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0 ~= arg_3_2 then
		var_0_0(arg_3_1)
	else
		var_0_1(arg_3_1)
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_0._lastState ~= arg_4_1 then
		arg_4_0._lastState = arg_4_1

		WZWIP.AnimateThemeElement(arg_4_0, arg_4_1)
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	var_0_2(arg_5_1, arg_5_0.ButtonTrue, false)
	var_0_2(arg_5_1, arg_5_0.ButtonFalse, true)

	local var_5_0 = arg_5_0._currentValue and arg_5_0.ButtonTrue or arg_5_0.ButtonFalse
	local var_5_1 = arg_5_0._currentValue and arg_5_0.ButtonFalse or arg_5_0.ButtonTrue
	local var_5_2 = arg_5_0._isInOverState and "ButtonOver" or "ButtonUp"

	var_0_3(var_5_0, var_5_2)
	var_0_3(var_5_1, var_5_2 .. "NotSelected")
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0._currentValue ~= arg_6_2 then
		arg_6_0._currentValue = arg_6_2

		arg_6_0.action(arg_6_0, arg_6_1, arg_6_0._currentValue)
	end

	var_0_4(arg_6_0, arg_6_0._currentValue)
	Engine.BJDBIAGIDA(CoD.SFX.OtherAdjust)

	return true
end

local function var_0_6(arg_7_0, arg_7_1)
	var_0_5(arg_7_0, arg_7_1, not arg_7_0._currentValue)

	return true
end

local function var_0_7(arg_8_0)
	if not arg_8_0.bindButton then
		local var_8_0 = LUI.UIBindButton.new()

		var_8_0.id = "selfBindButton"

		arg_8_0:addElement(var_8_0)

		arg_8_0.bindButton = var_8_0
	end
end

function LUI.AddUIToggleButtonLogic(arg_9_0, arg_9_1, arg_9_2)
	assert(arg_9_2.action)
	assert(#arg_9_2.labels == 2)
	assert(arg_9_2.defaultValue == OPTIONS.disableButtonOptions.ENABLED or arg_9_2.defaultValue == OPTIONS.disableButtonOptions.DISABLED)

	arg_9_0.action = arg_9_2.action
	arg_9_0.ToggleValue = var_0_6

	arg_9_0.ButtonFalse.Text:setText(arg_9_2.labels[1])
	arg_9_0.ButtonTrue.Text:setText(arg_9_2.labels[2])

	arg_9_0._currentValue = arg_9_2.defaultValue == OPTIONS.disableButtonOptions.ENABLED

	var_0_4(arg_9_0, arg_9_0._currentValue)

	if arg_9_0._initialized then
		return true
	end

	var_0_7(arg_9_0)

	local function var_9_0(arg_10_0, arg_10_1)
		if (arg_10_0:isInFocus() or arg_10_0:getParent():isInFocus()) and not arg_10_0:getParent().disabled == true then
			var_0_5(arg_9_0, arg_9_1, false)

			return true
		end
	end

	local function var_9_1(arg_11_0, arg_11_1)
		if (arg_11_0:isInFocus() or arg_11_0:getParent():isInFocus()) and not arg_11_0:getParent().disabled == true then
			var_0_5(arg_9_0, arg_9_1, true)

			return true
		end
	end

	local function var_9_2(arg_12_0, arg_12_1)
		arg_12_0._isInOverState = false

		var_0_3(arg_12_0.ButtonFalse, arg_12_0._currentValue and "ButtonUpNotSelected" or "ButtonUp")
		var_0_3(arg_12_0.ButtonTrue, arg_12_0._currentValue and "ButtonUp" or "ButtonUpNotSelected")
	end

	local function var_9_3(arg_13_0, arg_13_1)
		arg_13_0._isInOverState = true

		var_0_3(arg_13_0.ButtonFalse, arg_13_0._currentValue and "ButtonOverNotSelected" or "ButtonOver")
		var_0_3(arg_13_0.ButtonTrue, arg_13_0._currentValue and "ButtonOver" or "ButtonOverNotSelected")
	end

	local function var_9_4(arg_14_0, arg_14_1)
		arg_14_0._isInOverState = false

		var_0_3(arg_14_0.ButtonFalse, arg_14_0._currentValue and "ButtonUpActiveNotSelected" or "ButtonUpActive")
		var_0_3(arg_14_0.ButtonTrue, arg_14_0._currentValue and "ButtonUpActive" or "ButtonUpActiveNotSelected")
	end

	local function var_9_5(arg_15_0, arg_15_1)
		arg_15_0._isInOverState = true

		var_0_3(arg_15_0.ButtonFalse, arg_15_0._currentValue and "ButtonOverActiveNotSelected" or "ButtonOverActive")
		var_0_3(arg_15_0.ButtonTrue, arg_15_0._currentValue and "ButtonOverActive" or "ButtonOverActiveNotSelected")
	end

	local function var_9_6(arg_16_0, arg_16_1)
		var_0_5(arg_16_0, arg_16_1.controller, arg_16_0._currentValue)

		return true
	end

	arg_9_0:addEventHandler("refresh_values", var_9_6)
	arg_9_0.bindButton:addEventHandler("button_left", var_9_0)
	arg_9_0.bindButton:addEventHandler("button_right", var_9_1)
	arg_9_0:addEventHandler("false_option_clicked", var_9_0)
	arg_9_0:addEventHandler("true_option_clicked", var_9_1)
	arg_9_0:addEventHandler("button_up", var_9_2)
	arg_9_0:addEventHandler("button_over", var_9_3)
	arg_9_0:addEventHandler("button_active", var_9_4)
	arg_9_0:addEventHandler("button_over_active", var_9_5)
	arg_9_0:addEventHandler("button_action_disable", function(arg_17_0, arg_17_1)
		arg_17_0:dispatchEventToParent({
			name = "request_active",
			target = arg_17_0
		})
	end)

	local function var_9_7()
		arg_9_0:processEvent({
			name = "false_option_clicked",
			controller = arg_9_1
		})

		if arg_9_0:IsActive() or not Dvar.IBEGCHEFE("LSQNRLMKST") then
			return true
		end
	end

	arg_9_0.ButtonFalse:SetHandleMouse(true)
	arg_9_0.ButtonFalse:addEventHandler("button_action", var_9_7)

	local function var_9_8()
		arg_9_0:processEvent({
			name = "true_option_clicked",
			controller = arg_9_1
		})

		if arg_9_0:IsActive() or not Dvar.IBEGCHEFE("LSQNRLMKST") then
			return true
		end
	end

	arg_9_0.ButtonTrue:SetHandleMouse(true)
	arg_9_0.ButtonTrue:addEventHandler("button_action", var_9_8)

	local function var_9_9()
		arg_9_0:processEvent({
			name = "title_clicked",
			controller = arg_9_1
		})
	end

	arg_9_0.GenericOptionButtonBase.Title:SetHandleMouse(true)
	arg_9_0.GenericOptionButtonBase.Title:addEventHandler("leftmousedown", var_9_9)

	arg_9_0.SetCurrentValue = var_0_5
	arg_9_0._initialized = true
end
