module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Text:setText(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.SetName = var_0_0

	function arg_2_0.Enable(arg_3_0)
		arg_3_0._disabled = false

		ACTIONS.AnimateSequence(arg_3_0, "Unfocused")
	end

	function arg_2_0.Disable(arg_4_0)
		arg_4_0._disabled = true

		ACTIONS.AnimateSequence(arg_4_0, "Disabled")
	end

	function arg_2_0.IsEnabled(arg_5_0)
		return not arg_5_0._disabled
	end

	arg_2_0:registerEventHandler("focus_tab", function(arg_6_0, arg_6_1)
		if arg_6_1.index == arg_6_0.index then
			if arg_6_1.playSound then
				arg_6_0._sequences.Focused()
			else
				arg_6_0._sequences.FocusedNoSound()
			end

			arg_6_0.focused = true
		elseif arg_6_0.focused then
			arg_6_0._sequences.UnFocused()

			arg_6_0.focused = false
		end
	end)
	arg_2_0:SetHandleMouse(true)
	arg_2_0:registerEventHandler("mouseenter", function(arg_7_0, arg_7_1)
		if not arg_7_0.focused then
			if not arg_7_0._disabled then
				arg_7_0._sequences.Highlighted()
			else
				arg_7_0._sequences.Focused()
			end
		end
	end)
	arg_2_0:registerEventHandler("mouseleave", function(arg_8_0, arg_8_1)
		if arg_8_0.focused and not arg_8_0._disabled then
			arg_8_0._sequences.FocusedNoSound()
		else
			arg_8_0._sequences.UnFocused()
		end
	end)
	arg_2_0:registerEventHandler("leftmousedown", function(arg_9_0, arg_9_1)
		return
	end)
	arg_2_0:registerEventHandler("leftmouseup", function(arg_10_0, arg_10_1)
		if arg_10_1.inside and not arg_10_0._disabled then
			arg_10_0:playSound("menu_open")
			arg_10_0:dispatchEventToCurrentMenu({
				name = "tab_mouse_select",
				index = arg_10_0.index
			})
		end
	end)
	arg_2_0:registerEventHandler("tab_disable_blur", function(arg_11_0, arg_11_1)
		ACTIONS.AnimateSequence(arg_11_0, "NoBlur")
	end)
	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "disabled", function(arg_12_0)
		if DataModel.JJEHAEBDF(arg_12_0) then
			arg_2_0:Disable()
		end
	end)
end

function LoadoutTab(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 110 * _1080p, 0, 30 * _1080p)

	var_13_0.id = "LoadoutTab"
	var_13_0._animationSets = {}
	var_13_0._sequences = {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIBlur.new()

	var_13_4.id = "Blur"

	var_13_0:addElement(var_13_4)

	var_13_0.Blur = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIImage.new()

	var_13_6.id = "Background"

	var_13_6:SetAlpha(0, 0)
	var_13_0:addElement(var_13_6)

	var_13_0.Background = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIImage.new()

	var_13_8.id = "DisabledIcon"

	var_13_8:SetAlpha(0, 0)
	var_13_8:SetZRotation(2, 0)
	var_13_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 1)
	var_13_0:addElement(var_13_8)

	var_13_0.DisabledIcon = var_13_8

	local var_13_9
	local var_13_10 = LUI.UIStyledText.new()

	var_13_10.id = "Text"

	var_13_10:setText("", 0)
	var_13_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_10:SetAlignment(LUI.Alignment.Center)
	var_13_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -60, _1080p * 60, _1080p * 6, _1080p * 24)
	var_13_0:addElement(var_13_10)

	var_13_0.Text = var_13_10

	local var_13_11
	local var_13_12 = LUI.UIImage.new()

	var_13_12.id = "Highlight"

	var_13_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_13_12:SetAlpha(0, 0)
	var_13_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -4, _1080p * -2)
	var_13_0:addElement(var_13_12)

	var_13_0.Highlight = var_13_12

	local function var_13_13()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_13

	local var_13_14 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("Focused", var_13_14)

	local var_13_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_13_10:RegisterAnimationSequence("Focused", var_13_15)

	local var_13_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_13_12:RegisterAnimationSequence("Focused", var_13_16)

	local function var_13_17()
		var_13_6:AnimateSequence("Focused")
		var_13_10:AnimateSequence("Focused")
		var_13_12:AnimateSequence("Focused")
	end

	var_13_0._sequences.Focused = var_13_17

	local var_13_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("UnFocused", var_13_18)

	local var_13_19 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("UnFocused", var_13_19)

	local var_13_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("UnFocused", var_13_20)

	local function var_13_21()
		var_13_6:AnimateSequence("UnFocused")
		var_13_10:AnimateSequence("UnFocused")
		var_13_12:AnimateSequence("UnFocused")
	end

	var_13_0._sequences.UnFocused = var_13_21

	local function var_13_22()
		return
	end

	var_13_0._sequences.Locked = var_13_22

	local var_13_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("Disabled", var_13_23)

	local function var_13_24()
		var_13_8:AnimateSequence("Disabled")
	end

	var_13_0._sequences.Disabled = var_13_24

	local function var_13_25()
		return
	end

	var_13_0._sequences.Highlighted = var_13_25

	local function var_13_26()
		return
	end

	var_13_0._sequences.NoBlur = var_13_26

	local var_13_27 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("FocusedNoSound", var_13_27)

	local var_13_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_13_10:RegisterAnimationSequence("FocusedNoSound", var_13_28)

	local var_13_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("FocusedNoSound", var_13_29)

	local function var_13_30()
		var_13_6:AnimateSequence("FocusedNoSound")
		var_13_10:AnimateSequence("FocusedNoSound")
		var_13_12:AnimateSequence("FocusedNoSound")
	end

	var_13_0._sequences.FocusedNoSound = var_13_30

	var_0_1(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("LoadoutTab", LoadoutTab)
LockTable(_M)
