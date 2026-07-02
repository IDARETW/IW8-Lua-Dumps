LUI.UIBindButton = LUI.Class(LUI.UIElement)

function LUI.UIBindButton.GamepadButton(arg_1_0, arg_1_1)
	if arg_1_1.down == true then
		local var_1_0 = false
		local var_1_1 = {
			controller = arg_1_1.controller,
			qualifier = arg_1_1.qualifier
		}

		if not arg_1_0.disabled then
			var_1_0 = true

			if arg_1_1.button == "primary" then
				var_1_1.name = "button_primary"
			elseif arg_1_1.button == "secondary" then
				var_1_1.name = "button_secondary"
			elseif arg_1_1.button == "alt1" then
				var_1_1.name = "button_alt1"
			elseif arg_1_1.button == "alt2" then
				var_1_1.name = "button_alt2"
			elseif arg_1_1.button == "right_trigger" then
				var_1_1.name = "button_right_trigger"
			elseif arg_1_1.button == "left_trigger" then
				var_1_1.name = "button_left_trigger"
			elseif arg_1_1.button == "shoulderr" then
				var_1_1.name = "button_shoulderr"
			elseif arg_1_1.button == "shoulderl" then
				var_1_1.name = "button_shoulderl"
			elseif arg_1_1.button == "right_stick" then
				var_1_1.name = "button_right_stick"
			elseif arg_1_1.button == "left_stick" then
				var_1_1.name = "button_left_stick"
			elseif arg_1_1.button == "left" then
				var_1_1.name = "button_left"
			elseif arg_1_1.button == "right" then
				var_1_1.name = "button_right"
			elseif arg_1_1.button == "up" then
				var_1_1.name = "button_up"
			elseif arg_1_1.button == "down" then
				var_1_1.name = "button_down"
			elseif arg_1_1.button == "start" then
				var_1_1.name = "button_start"
			elseif arg_1_1.button == "select" then
				var_1_1.name = "button_select"
			elseif arg_1_1.button == "options" then
				var_1_1.name = "button_options"
			else
				var_1_0 = false
			end
		end

		if var_1_0 and arg_1_0:processEvent(var_1_1) then
			if arg_1_0.actionSFX then
				Engine.BJDBIAGIDA(arg_1_0.actionSFX)
			end

			return true
		end
	end

	return arg_1_0:dispatchEventToChildren(arg_1_1)
end

function LUI.UIBindButton.ElementEnable(arg_2_0, arg_2_1)
	arg_2_0.disabled = nil
end

function LUI.UIBindButton.ElementDisable(arg_3_0, arg_3_1)
	if not arg_3_0._doNotDisable then
		arg_3_0.disabled = true
	end
end

function LUI.UIBindButton.AlwaysEnabled(arg_4_0, arg_4_1)
	if arg_4_1 then
		arg_4_0.disabled = false
	end

	arg_4_0._doNotDisable = arg_4_1
end

function LUI.UIBindButton.enable(arg_5_0)
	arg_5_0:processEvent({
		dispatchChildren = true,
		name = "enable"
	})
end

function LUI.UIBindButton.disable(arg_6_0)
	arg_6_0:processEvent({
		dispatchChildren = true,
		name = "disable"
	})
end

function LUI.UIBindButton.SetActionSFX(arg_7_0, arg_7_1)
	arg_7_0.actionSFX = arg_7_1
end

function LUI.UIBindButton.build(arg_8_0, arg_8_1)
	return (LUI.UIBindButton.new())
end

function LUI.UIBindButton.init(arg_9_0)
	LUI.UIElement.init(arg_9_0)

	arg_9_0.id = "LUIBindButton"
	arg_9_0.setActionSFX = LUI.UIBindButton.SetActionSFX

	arg_9_0:registerEventHandlerIfFree("enable", LUI.UIBindButton.ElementEnable)
	arg_9_0:registerEventHandlerIfFree("disable", LUI.UIBindButton.ElementDisable)
	arg_9_0:registerEventHandlerIfFree("popup_active", LUI.UIBindButton.ElementDisable)
	arg_9_0:registerEventHandlerIfFree("popup_inactive", LUI.UIBindButton.ElementEnable)
	arg_9_0:registerEventHandler("gamepad_button", LUI.UIBindButton.GamepadButton)
end
