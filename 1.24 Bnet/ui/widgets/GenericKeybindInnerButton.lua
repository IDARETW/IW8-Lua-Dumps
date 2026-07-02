module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 and not arg_1_0.ChangedMarker then
		local var_1_0
		local var_1_1 = LUI.UIImage.new()

		var_1_1.id = "ChangedMarker"

		var_1_1:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
		var_1_1:setImage(RegisterMaterial("ui_changed_indicator"), 0)
		var_1_1:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, _1080p * 7, _1080p * 39)
		arg_1_0:addElement(var_1_1)

		arg_1_0.ChangedMarker = var_1_1
	elseif not arg_1_1 and arg_1_0.ChangedMarker then
		arg_1_0.ChangedMarker:closeTree()

		arg_1_0.ChangedMarker = nil
	end
end

local function var_0_1(arg_2_0)
	arg_2_0.SetChanged = var_0_0

	arg_2_0:SetHandleMouseButton(true)
	arg_2_0:addEventHandler("gain_focus", function(arg_3_0, arg_3_1)
		if not arg_3_0:IsDisabled() then
			ACTIONS.AnimateSequence(arg_3_0, "GainFocus")
			ACTIONS.AnimateSequenceByElement(arg_3_0, {
				elementPath = "self.GenericInnerButtonBackground",
				sequenceName = "GainFocus",
				elementName = "GenericInnerButtonBackground"
			})
		end
	end)
	arg_2_0:addEventHandler("binding", function(arg_4_0, arg_4_1)
		if arg_4_0.GenericInnerButtonBackground then
			ACTIONS.AnimateSequence(arg_4_0.GenericInnerButtonBackground, "Binding")
		end
	end)
	arg_2_0:addEventHandler("button_active", function(arg_5_0, arg_5_1)
		if arg_5_0.GenericInnerButtonBackground then
			ACTIONS.AnimateSequence(arg_5_0.GenericInnerButtonBackground, "DefaultSequence")
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
		arg_2_0.Text:SetAlignment(LUI.Alignment.Center)
	end
end

function GenericKeybindInnerButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 54 * _1080p)

	var_6_0.id = "GenericKeybindInnerButton"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("GenericInnerButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "GenericInnerButtonBackground"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.GenericInnerButtonBackground = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "LeftLine"

	var_6_6:SetAlpha(0.2, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 1, _1080p * -10, _1080p * 10)
	var_6_0:addElement(var_6_6)

	var_6_0.LeftLine = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "Text"

	var_6_8:SetRGBFromTable(SWATCHES.KeyBinding.binding, 0)
	var_6_8:SetAlpha(0.6, 0)
	var_6_8:setText("KEY", 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_8:SetWordWrap(false)
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_8:SetStartupDelay(1000)
	var_6_8:SetLineHoldTime(400)
	var_6_8:SetAnimMoveTime(150)
	var_6_8:SetAnimMoveSpeed(50)
	var_6_8:SetEndDelay(1000)
	var_6_8:SetCrossfadeTime(400)
	var_6_8:SetFadeInTime(300)
	var_6_8:SetFadeOutTime(300)
	var_6_8:SetMaxVisibleLines(1)
	var_6_8:SetOutlineRGBFromInt(0, 0)
	var_6_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 17, 0, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_8)

	var_6_0.Text = var_6_8

	local function var_6_9()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_9

	local var_6_10 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOver", var_6_10)

	local function var_6_11()
		var_6_6:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_11

	local var_6_12 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUp", var_6_12)

	local function var_6_13()
		var_6_6:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_13

	local var_6_14 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("GainFocus", var_6_14)

	local function var_6_15()
		var_6_8:AnimateSequence("GainFocus")
	end

	var_6_0._sequences.GainFocus = var_6_15

	local var_6_16 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("LoseFocus", var_6_16)

	local function var_6_17()
		var_6_8:AnimateSequence("LoseFocus")
	end

	var_6_0._sequences.LoseFocus = var_6_17

	local var_6_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("NoLeftLine", var_6_18)

	local function var_6_19()
		var_6_6:AnimateSequence("NoLeftLine")
	end

	var_6_0._sequences.NoLeftLine = var_6_19

	local function var_6_20()
		return
	end

	var_6_0._sequences.ButtonUpActive = var_6_20

	local function var_6_21()
		return
	end

	var_6_0._sequences.ButtonOverActive = var_6_21

	local function var_6_22()
		return
	end

	var_6_0._sequences.Binding = var_6_22

	local var_6_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("BindingLoop", var_6_23)

	local function var_6_24()
		var_6_8:AnimateLoop("BindingLoop")
	end

	var_6_0._sequences.BindingLoop = var_6_24

	local var_6_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			value = 0,
			duration = 90,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		},
		{
			value = 1,
			duration = 110,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_6_8:RegisterAnimationSequence("BindingSuccess", var_6_25)

	local function var_6_26()
		var_6_8:AnimateSequence("BindingSuccess")
	end

	var_6_0._sequences.BindingSuccess = var_6_26

	local var_6_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.binding
		}
	}

	var_6_8:RegisterAnimationSequence("Empty", var_6_27)

	local function var_6_28()
		var_6_8:AnimateSequence("Empty")
	end

	var_6_0._sequences.Empty = var_6_28

	local var_6_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.notificationBackground
		}
	}

	var_6_8:RegisterAnimationSequence("ResetText", var_6_29)

	local function var_6_30()
		var_6_8:AnimateSequence("ResetText")
	end

	var_6_0._sequences.ResetText = var_6_30

	local var_6_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_6_6:RegisterAnimationSequence("AR", var_6_31)

	local var_6_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_6_8:RegisterAnimationSequence("AR", var_6_32)

	local function var_6_33()
		var_6_6:AnimateSequence("AR")
		var_6_8:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_33

	var_6_0:addEventHandler("lose_focus", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "LoseFocus")
		ACTIONS.AnimateSequenceByElement(var_6_0, {
			elementPath = "self.GenericInnerButtonBackground",
			sequenceName = "LoseFocus",
			elementName = "GenericInnerButtonBackground"
		})
	end)
	var_6_0:addEventHandler("button_active", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonUpActive")
	end)
	var_6_0:addEventHandler("button_over_active", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonOverActive")
	end)
	var_6_0:addEventHandler("button_over", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonOver")
	end)
	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("GenericKeybindInnerButton", GenericKeybindInnerButton)
LockTable(_M)
