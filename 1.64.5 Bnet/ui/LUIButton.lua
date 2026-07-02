LUI.UIButton = LUI.Class(LUI.UIElement)

function LUI.UIButton.MouseEnter(arg_1_0, arg_1_1)
	if arg_1_0:AcceptsFocusType(FocusType.MouseOver) and not arg_1_0:isInFocus() then
		if arg_1_0.disabled then
			arg_1_0:processEvent({
				name = "button_over_disable"
			})
		else
			arg_1_0:processEvent({
				name = "button_over",
				controller = arg_1_1.controller,
				focusType = FocusType.MouseOver
			})
		end
	end
end

function LUI.UIButton.MouseLeave(arg_2_0, arg_2_1)
	if arg_2_0._focusable and not arg_2_0:isInFocus() then
		if arg_2_0.disabled then
			if arg_2_0.isActive then
				arg_2_0:processEvent({
					name = "button_disable_active"
				})
			else
				arg_2_0:processEvent({
					name = "button_disable"
				})
			end
		elseif arg_2_0.isActive then
			arg_2_0:processEvent({
				name = "button_active",
				snap = arg_2_1.snap
			})
		else
			arg_2_0:processEvent({
				name = "button_up",
				snap = arg_2_1.snap
			})
		end
	end
end

function LUI.UIButton.LeftMouseUp(arg_3_0, arg_3_1)
	if arg_3_1.inside then
		if not arg_3_0.disabled then
			if arg_3_0:HasEventHandler("button_action") and arg_3_0.actionSFX and (not arg_3_0.properties or not arg_3_0.properties.muteAction) then
				Engine.BJDBIAGIDA(arg_3_0.actionSFX)
			end

			return arg_3_0:processEvent({
				name = "button_action",
				mouse = true,
				controller = arg_3_1.controller
			})
		else
			if arg_3_0.actionDisabledSFX then
				Engine.BJDBIAGIDA(arg_3_0.actionDisabledSFX)
			elseif arg_3_0.properties and arg_3_0.properties.disableSound then
				Engine.BJDBIAGIDA(arg_3_0.properties.disableSound)
			end

			arg_3_0:processEvent({
				name = "button_action_disable",
				controller = arg_3_1.controller
			})

			return true
		end
	end
end

function LUI.UIButton.GamepadButton(arg_4_0, arg_4_1)
	if not arg_4_0:isInFocus() or arg_4_1.down ~= true then
		return arg_4_0:dispatchEventToChildren(arg_4_1)
	end

	if arg_4_1.qualifier == ButtonQualifiers.Mousewheel then
		return false
	end

	if arg_4_1.button == "primary" then
		local var_4_0 = arg_4_1.qualifier and arg_4_1.qualifier == ButtonQualifiers.Keyboard or false
		local var_4_1 = (not var_4_0 or not arg_4_0.blockKeyboardSound) and arg_4_0:HasEventHandler("button_action")

		if arg_4_0.actionSFX and (not arg_4_0.properties or not arg_4_0.properties.muteAction) and var_4_1 then
			Engine.BJDBIAGIDA(arg_4_0.actionSFX)
		end

		if not arg_4_0.disabled then
			arg_4_0:processEvent({
				name = "button_action",
				controller = arg_4_1.controller,
				keyboard = var_4_0
			})
		else
			if arg_4_0.actionDisabledSFX and var_4_1 then
				Engine.BJDBIAGIDA(arg_4_0.actionDisabledSFX)
			elseif arg_4_0.properties and arg_4_0.properties.disableSound and var_4_1 then
				Engine.BJDBIAGIDA(arg_4_0.properties.disableSound)
			end

			arg_4_0:processEvent({
				name = "button_action_disable",
				controller = arg_4_1.controller
			})
		end

		return arg_4_0:HasEventHandler("button_action") or arg_4_0:dispatchEventToChildren(arg_4_1)
	elseif arg_4_0:dispatchEventToChildren(arg_4_1) then
		return true
	elseif arg_4_0.directionalInputEnabled then
		return arg_4_0:FocusNextElement(arg_4_0, arg_4_1.button, FocusType.Gamepad, arg_4_1.qualifier, arg_4_1.controller)
	else
		return arg_4_1.button == "up" or arg_4_1.button == "down" or arg_4_1.button == "left" or arg_4_1.button == "right"
	end
end

function LUI.UIButton.SetFocusable(arg_5_0, arg_5_1)
	arg_5_0._focusable = arg_5_1
end

function LUI.UIButton.AcceptsFocusType(arg_6_0, arg_6_1)
	if not arg_6_0._focusable then
		return false
	end

	if arg_6_0.m_requireFocusType then
		return arg_6_1 == arg_6_0.m_requireFocusType
	end

	return true
end

local function var_0_0(arg_7_0)
	local var_7_0 = arg_7_0

	while var_7_0 do
		if var_7_0.buttonDescription and var_7_0.buttonDescription ~= "" then
			return var_7_0.buttonDescription
		end

		var_7_0 = var_7_0:getParent()
	end

	return nil
end

function LUI.UIButton.SetButtonDescription(arg_8_0, arg_8_1)
	arg_8_0.buttonDescription = arg_8_1
end

function LUI.UIButton.PlayGainFocusGamepadSFX(arg_9_0, arg_9_1)
	if arg_9_0.gainFocusGamepadSFX and arg_9_1.shouldPlayButtonSound ~= false and arg_9_0.shouldPlayButtonSound ~= false then
		if arg_9_0.differentSoundsForFocusDirection == false or not arg_9_1.direction then
			Engine.BJDBIAGIDA(arg_9_0.gainFocusGamepadSFX)
		elseif arg_9_1.direction == "up" then
			Engine.BJDBIAGIDA(arg_9_0.gainFocusUpGamepadSFX)
		elseif arg_9_1.direction == "down" then
			Engine.BJDBIAGIDA(arg_9_0.gainFocusDownGamepadSFX)
		elseif arg_9_1.direction == "left" then
			Engine.BJDBIAGIDA(arg_9_0.gainFocusDownGamepadSFX)
		elseif arg_9_1.direction == "right" then
			Engine.BJDBIAGIDA(arg_9_0.gainFocusDownGamepadSFX)
		end
	end
end

function LUI.UIButton.GainFocus(arg_10_0, arg_10_1)
	if arg_10_0:isInFocus() then
		return true
	end

	if arg_10_0:AcceptsFocusType(arg_10_1.focusType) then
		arg_10_0:setFocus(true)

		if arg_10_1.focusType ~= FocusType.MenuFlow then
			if arg_10_1.focusType == FocusType.MouseOver and arg_10_0.gainFocusSFX then
				Engine.BJDBIAGIDA(arg_10_0.gainFocusSFX)
			else
				arg_10_0:PlayGainFocusGamepadSFX(arg_10_1)
			end
		elseif arg_10_1.direction then
			arg_10_0:PlayGainFocusGamepadSFX(arg_10_1)
		end

		local var_10_0 = arg_10_0:GetCurrentMenu()

		if var_10_0 and arg_10_1.focusType == FocusType.MouseOver then
			arg_10_0:dispatchEventToCurrentMenu({
				name = "update_current_grid_focus",
				child = arg_10_0,
				focusType = arg_10_1.focusType
			})
		end

		if arg_10_0.disabled then
			if arg_10_0.isActive then
				arg_10_0:processEvent({
					name = "button_over_disable_active"
				})
			else
				arg_10_0:processEvent({
					name = "button_over_disable",
					focusType = arg_10_1.focusType
				})
			end
		elseif arg_10_0.isActive then
			arg_10_0:processEvent({
				name = "button_over_active",
				controller = arg_10_1.controller,
				focusType = arg_10_1.focusType
			})
		else
			arg_10_0:processEvent({
				name = "button_over",
				controller = arg_10_1.controller,
				focusType = arg_10_1.focusType
			})
		end

		if var_10_0 then
			local var_10_1 = Engine.CGABICJHAI() and var_0_0(arg_10_0) or arg_10_0.buttonDescription

			if var_10_1 then
				arg_10_0:dispatchEventToCurrentMenu({
					name = "update_button_description",
					text = var_10_1
				})
			end

			arg_10_0:dispatchEventToCurrentMenu({
				name = "button_focused",
				button = arg_10_0
			})
		end

		return true
	end

	return false
end

function LUI.UIButton.LoseFocus(arg_11_0, arg_11_1)
	if arg_11_0:isInFocus() then
		arg_11_0:setFocus(false)

		if arg_11_0.disabled then
			if arg_11_0.isActive then
				arg_11_0:processEvent({
					name = "button_disable_active",
					snap = arg_11_1.snap
				})
			else
				arg_11_0:processEvent({
					name = "button_disable",
					snap = arg_11_1.snap
				})
			end
		elseif arg_11_0.isActive then
			arg_11_0:processEvent({
				name = "button_active",
				snap = arg_11_1.snap
			})
		else
			arg_11_0:processEvent({
				name = "button_up",
				snap = arg_11_1.snap
			})
		end
	end
end

function LUI.UIButton.ElementEnable(arg_12_0, arg_12_1)
	arg_12_0.disabled = nil

	if arg_12_0:isInFocus() then
		arg_12_0:processEvent({
			name = "button_over",
			controller = arg_12_1.controller
		})
	else
		arg_12_0:processEvent({
			name = "button_up"
		})
	end

	return false
end

function LUI.UIButton.ElementDisable(arg_13_0, arg_13_1)
	arg_13_0.disabled = true

	if arg_13_0:isInFocus() then
		arg_13_0:processEvent({
			name = "button_over_disable"
		})
	else
		arg_13_0:processEvent({
			name = "button_disable"
		})
	end

	return false
end

function LUI.UIButton.SetButtonDisabled(arg_14_0, arg_14_1)
	if arg_14_1 and not arg_14_0:IsDisabled() then
		arg_14_0:processEvent({
			name = "disable"
		})
	elseif not arg_14_1 and arg_14_0:IsDisabled() then
		arg_14_0:processEvent({
			name = "enable"
		})
	end
end

function LUI.UIButton.IsDisabled(arg_15_0)
	return arg_15_0.disabled
end

function LUI.UIButton.SetDirectionalInputEnabled(arg_16_0, arg_16_1)
	arg_16_0.directionalInputEnabled = arg_16_1
end

function LUI.UIButton.SetActive(arg_17_0, arg_17_1)
	arg_17_0.isActive = true

	if arg_17_0:isInFocus() then
		if arg_17_0.disabled then
			arg_17_0:processEvent({
				name = "button_over_disable_active"
			})
		else
			arg_17_0:processEvent({
				name = "button_over_active"
			})
		end
	elseif arg_17_0.disabled then
		arg_17_0:processEvent({
			name = "button_disable_active"
		})
	else
		arg_17_0:processEvent({
			name = "button_active"
		})
	end

	return true
end

function LUI.UIButton.RemoveActive(arg_18_0, arg_18_1)
	arg_18_0.isActive = false

	if arg_18_0:isInFocus() then
		if arg_18_0.disabled then
			arg_18_0:processEvent({
				name = "button_over_disable"
			})
		else
			arg_18_0:processEvent({
				name = "button_over",
				controller = arg_18_1.controller
			})
		end
	elseif arg_18_0.disabled then
		arg_18_0:processEvent({
			name = "button_disable"
		})
	else
		arg_18_0:processEvent({
			name = "button_up"
		})
	end

	return true
end

function LUI.UIButton.SetButtonActive(arg_19_0, arg_19_1)
	if arg_19_1 and not arg_19_0.isActive then
		if arg_19_0.disabled then
			arg_19_0:processEvent({
				name = "disable_active"
			})
		else
			arg_19_0:processEvent({
				name = "active"
			})
		end
	elseif not arg_19_1 and arg_19_0.isActive then
		if arg_19_0.disabled then
			arg_19_0:processEvent({
				name = "disable"
			})
		else
			arg_19_0:processEvent({
				name = "enable"
			})
		end
	end

	arg_19_0.isActive = arg_19_1
end

function LUI.UIButton.IsActive(arg_20_0)
	return arg_20_0.isActive
end

function LUI.UIButton.SetAsEditBoxHandler(arg_21_0, arg_21_1)
	arg_21_0:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_IBEAM)
end

function LUI.UIButton.SetupElement(arg_22_0)
	arg_22_0:registerEventHandlerIfFree("enable", LUI.UIButton.ElementEnable)
	arg_22_0:registerEventHandlerIfFree("disable", LUI.UIButton.ElementDisable)
end

function LUI.UIButton.setGainFocusAllSFX(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0:setGainFocusSFX(arg_23_1, arg_23_2)
	arg_23_0:setGainFocusGamepadSFX(arg_23_1, arg_23_2)
end

function LUI.UIButton.clearChildrenSFX(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:getFirstChild()

	while var_24_0 do
		local var_24_1 = var_24_0:getNextSibling()

		var_24_0[arg_24_1] = nil

		LUI.UIButton.clearChildrenSFX(var_24_0, arg_24_1)

		var_24_0 = var_24_1
	end
end

function LUI.UIButton.setGainFocusSFX(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.gainFocusSFX = arg_25_1

	if arg_25_2 ~= nil and arg_25_2.clearChildrenSFX ~= nil and arg_25_2.clearChildrenSFX == true then
		LUI.UIButton.TestInt = 0

		LUI.UIButton.clearChildrenSFX(arg_25_0, "gainFocusSFX")
	end
end

function LUI.UIButton.setGainFocusGamepadSFX(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0.gainFocusGamepadSFX = arg_26_1

	if arg_26_2 ~= nil and arg_26_2.clearChildrenSFX ~= nil and arg_26_2.clearChildrenSFX == true then
		LUI.UIButton.clearChildrenSFX(arg_26_0, "gainFocusGamepadSFX")
	end
end

function LUI.UIButton.setGainFocusGamepadDifferentSFX(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	if not arg_27_1 or not arg_27_2 then
		return
	end

	arg_27_0.gainFocusUpGamepadSFX = arg_27_1
	arg_27_0.gainFocusDownGamepadSFX = arg_27_2

	if arg_27_3 ~= nil and arg_27_3.clearChildrenSFX ~= nil and arg_27_3.clearChildrenSFX == true then
		LUI.UIButton.clearChildrenSFX(arg_27_0, "gainFocusUpGamepadSFX")
		LUI.UIButton.clearChildrenSFX(arg_27_0, "gainFocusDownGamepadSFX")
	end

	arg_27_0.differentSoundsForFocusDirection = true
end

function LUI.UIButton.setActionSFX(arg_28_0, arg_28_1)
	arg_28_0.actionSFX = arg_28_1
end

function LUI.UIButton.setActionDisabledSFX(arg_29_0, arg_29_1)
	arg_29_0.actionDisabledSFX = arg_29_1
end

function LUI.UIButton.build(arg_30_0, arg_30_1)
	return (LUI.UIButton.new())
end

function LUI.UIButton.init(arg_31_0)
	LUI.UIElement.init(arg_31_0)

	arg_31_0.id = "LUIButton"

	arg_31_0:SetFocusable(true)
	arg_31_0:SetHandleMouse(true)

	arg_31_0.gainFocusGamepadSFX = CoD.SFX.FocusGamepad
	arg_31_0.gainFocusSFX = CoD.SFX.MouseOver
	arg_31_0.actionSFX = CoD.SFX.MouseClick
	arg_31_0.differentSoundsForFocusDirection = false
	arg_31_0.gainFocusUpGamepadSFX = CoD.SFX.FocusGamepad
	arg_31_0.gainFocusDownGamepadSFX = CoD.SFX.FocusGamepad
	arg_31_0.directionalInputEnabled = true

	if Engine.EABCCIBFIG() then
		arg_31_0:registerEventHandler("mouseenter", LUI.UIButton.MouseEnter)
		arg_31_0:registerEventHandler("mouseleave", LUI.UIButton.MouseLeave)
		arg_31_0:registerEventHandler("leftmouseup", LUI.UIButton.LeftMouseUp)
	end

	arg_31_0:registerEventHandler("gamepad_button", function(arg_32_0, arg_32_1)
		return arg_32_0:GamepadButton(arg_32_1)
	end)
	arg_31_0:registerEventHandler("gain_focus", function(arg_33_0, arg_33_1)
		return arg_33_0:GainFocus(arg_33_1)
	end)
	arg_31_0:registerEventHandler("lose_focus", function(arg_34_0, arg_34_1)
		return arg_34_0:LoseFocus(arg_34_1)
	end)
	LUI.UIButton.SetupElement(arg_31_0)
end
