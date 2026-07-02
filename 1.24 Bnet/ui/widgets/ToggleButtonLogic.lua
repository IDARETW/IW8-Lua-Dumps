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
	var_0_2(arg_4_1, arg_4_0.ButtonTrue, false)
	var_0_2(arg_4_1, arg_4_0.ButtonFalse, true)

	local var_4_0 = arg_4_0._currentValue and arg_4_0.ButtonTrue or arg_4_0.ButtonFalse
	local var_4_1 = arg_4_0._currentValue and arg_4_0.ButtonFalse or arg_4_0.ButtonTrue
	local var_4_2 = arg_4_0._isInOverState and "ButtonOver" or "ButtonUp"

	ACTIONS.AnimateSequence(var_4_0, var_4_2)
	ACTIONS.AnimateSequence(var_4_1, var_4_2 .. "NotSelected")
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0._currentValue ~= arg_5_2 then
		arg_5_0._currentValue = arg_5_2

		arg_5_0.action(arg_5_0, arg_5_1, arg_5_0._currentValue)
	end

	var_0_3(arg_5_0, arg_5_0._currentValue)
	Engine.BJDBIAGIDA(CoD.SFX.OtherAdjust)

	return true
end

local function var_0_5(arg_6_0, arg_6_1)
	var_0_4(arg_6_0, arg_6_1, not arg_6_0._currentValue)

	return true
end

local function var_0_6(arg_7_0)
	if not arg_7_0.bindButton then
		local var_7_0 = LUI.UIBindButton.new()

		var_7_0.id = "selfBindButton"

		arg_7_0:addElement(var_7_0)

		arg_7_0.bindButton = var_7_0
	end
end

function LUI.AddUIToggleButtonLogic(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_2.action)
	assert(#arg_8_2.labels == 2)
	assert(arg_8_2.defaultValue == OPTIONS.disableButtonOptions.ENABLED or arg_8_2.defaultValue == OPTIONS.disableButtonOptions.DISABLED)

	arg_8_0.action = arg_8_2.action
	arg_8_0.ToggleValue = var_0_5

	arg_8_0.ButtonFalse.Text:setText(arg_8_2.labels[1])
	arg_8_0.ButtonTrue.Text:setText(arg_8_2.labels[2])

	arg_8_0._currentValue = arg_8_2.defaultValue == OPTIONS.disableButtonOptions.ENABLED

	var_0_3(arg_8_0, arg_8_0._currentValue)

	if arg_8_0._initialized then
		return true
	end

	var_0_6(arg_8_0)

	local function var_8_0(arg_9_0, arg_9_1)
		if (arg_9_0:isInFocus() or arg_9_0:getParent():isInFocus()) and not arg_9_0:getParent().disabled == true then
			var_0_4(arg_8_0, arg_8_1, false)

			return true
		end
	end

	local function var_8_1(arg_10_0, arg_10_1)
		if (arg_10_0:isInFocus() or arg_10_0:getParent():isInFocus()) and not arg_10_0:getParent().disabled == true then
			var_0_4(arg_8_0, arg_8_1, true)

			return true
		end
	end

	local function var_8_2(arg_11_0, arg_11_1)
		arg_11_0._isInOverState = false

		if arg_11_0._currentValue then
			ACTIONS.AnimateSequence(arg_11_0.ButtonFalse, "ButtonUpNotSelected")
			ACTIONS.AnimateSequence(arg_11_0.ButtonTrue, "ButtonUp")
		else
			ACTIONS.AnimateSequence(arg_11_0.ButtonFalse, "ButtonUp")
			ACTIONS.AnimateSequence(arg_11_0.ButtonTrue, "ButtonUpNotSelected")
		end
	end

	local function var_8_3(arg_12_0, arg_12_1)
		arg_12_0._isInOverState = true

		if arg_12_0._currentValue then
			ACTIONS.AnimateSequence(arg_12_0.ButtonFalse, "ButtonOverNotSelected")
			ACTIONS.AnimateSequence(arg_12_0.ButtonTrue, "ButtonOver")
		else
			ACTIONS.AnimateSequence(arg_12_0.ButtonFalse, "ButtonOver")
			ACTIONS.AnimateSequence(arg_12_0.ButtonTrue, "ButtonOverNotSelected")
		end
	end

	local function var_8_4(arg_13_0, arg_13_1)
		arg_13_0._isInOverState = false

		if arg_13_0._currentValue then
			ACTIONS.AnimateSequence(arg_13_0.ButtonFalse, "ButtonUpActiveNotSelected")
			ACTIONS.AnimateSequence(arg_13_0.ButtonTrue, "ButtonUpActive")
		else
			ACTIONS.AnimateSequence(arg_13_0.ButtonFalse, "ButtonUpActive")
			ACTIONS.AnimateSequence(arg_13_0.ButtonTrue, "ButtonUpActiveNotSelected")
		end
	end

	local function var_8_5(arg_14_0, arg_14_1)
		arg_14_0._isInOverState = true

		if arg_14_0._currentValue then
			ACTIONS.AnimateSequence(arg_14_0.ButtonFalse, "ButtonOverActiveNotSelected")
			ACTIONS.AnimateSequence(arg_14_0.ButtonTrue, "ButtonOverActive")
		else
			ACTIONS.AnimateSequence(arg_14_0.ButtonFalse, "ButtonOverActive")
			ACTIONS.AnimateSequence(arg_14_0.ButtonTrue, "ButtonOverActiveNotSelected")
		end
	end

	local function var_8_6(arg_15_0, arg_15_1)
		var_0_4(arg_15_0, arg_15_1.controller, arg_15_0._currentValue)

		return true
	end

	arg_8_0:addEventHandler("refresh_values", var_8_6)
	arg_8_0.bindButton:addEventHandler("button_left", var_8_0)
	arg_8_0.bindButton:addEventHandler("button_right", var_8_1)
	arg_8_0:addEventHandler("false_option_clicked", var_8_0)
	arg_8_0:addEventHandler("true_option_clicked", var_8_1)
	arg_8_0:addEventHandler("button_up", var_8_2)
	arg_8_0:addEventHandler("button_over", var_8_3)
	arg_8_0:addEventHandler("button_active", var_8_4)
	arg_8_0:addEventHandler("button_over_active", var_8_5)
	arg_8_0:addEventHandler("button_action_disable", function(arg_16_0, arg_16_1)
		arg_16_0:dispatchEventToParent({
			name = "request_active",
			target = arg_16_0
		})
	end)

	local function var_8_7()
		arg_8_0:processEvent({
			name = "false_option_clicked",
			controller = arg_8_1
		})

		if arg_8_0:IsActive() or not Dvar.IBEGCHEFE("LSQNRLMKST") then
			return true
		end
	end

	arg_8_0.ButtonFalse:SetHandleMouse(true)
	arg_8_0.ButtonFalse:addEventHandler("button_action", var_8_7)

	local function var_8_8()
		arg_8_0:processEvent({
			name = "true_option_clicked",
			controller = arg_8_1
		})

		if arg_8_0:IsActive() or not Dvar.IBEGCHEFE("LSQNRLMKST") then
			return true
		end
	end

	arg_8_0.ButtonTrue:SetHandleMouse(true)
	arg_8_0.ButtonTrue:addEventHandler("button_action", var_8_8)

	local function var_8_9()
		arg_8_0:processEvent({
			name = "title_clicked",
			controller = arg_8_1
		})
	end

	arg_8_0.GenericOptionButtonBase.Title:SetHandleMouse(true)
	arg_8_0.GenericOptionButtonBase.Title:addEventHandler("leftmousedown", var_8_9)

	arg_8_0.SetCurrentValue = var_0_4
	arg_8_0._initialized = true
end
