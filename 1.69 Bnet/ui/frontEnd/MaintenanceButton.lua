module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.Text)
	arg_1_0.Text:setText(arg_1_1)
end

function RefreshAnimation(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0._lastState ~= arg_2_1 then
		arg_2_0._lastState = arg_2_1

		if arg_2_2 then
			arg_2_1 = arg_2_1 .. "Snap"
		end

		ACTIONS.AnimateSequence(arg_2_0, arg_2_1)
	end
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:SetNotifyOnLayoutInit(true)
	arg_3_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		arg_3_0.isInHoverState = true

		RefreshAnimation(arg_4_0, "ButtonOver")
	end)
	arg_3_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		arg_3_0.isInHoverState = false

		RefreshAnimation(arg_5_0, "ButtonUp", arg_5_1.snap)
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		RefreshAnimation(arg_6_0, "ButtonUpDisabled", arg_6_1.snap)
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_7_0, arg_7_1)
		RefreshAnimation(arg_7_0, "ButtonOverDisabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	arg_3_0.SetText = var_0_0
end

function MaintenanceButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_8_0.id = "MaintenanceButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Background"

	var_8_4:SetRGBFromTable(SWATCHES.CH2.NeutralGray, 0)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 38)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIStyledText.new()

	var_8_6.id = "Text"

	var_8_6:SetRGBFromTable(SWATCHES.CH2.White, 0)
	var_8_6:setText(ToUpperCase(""), 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_6:SetAlignment(LUI.Alignment.Center)
	var_8_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_6:SetStartupDelay(2000)
	var_8_6:SetLineHoldTime(400)
	var_8_6:SetAnimMoveTime(300)
	var_8_6:SetAnimMoveSpeed(50)
	var_8_6:SetEndDelay(1500)
	var_8_6:SetCrossfadeTime(750)
	var_8_6:SetFadeInTime(300)
	var_8_6:SetFadeOutTime(300)
	var_8_6:SetMaxVisibleLines(1)
	var_8_6:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_8_6:SetOutlineRGBFromInt(0, 0)
	var_8_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -15, _1080p * 15)
	var_8_0:addElement(var_8_6)

	var_8_0.Text = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Lock"

	var_8_8:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_8_8:SetAlpha(0, 0)
	var_8_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_8_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -10, _1080p * -13, _1080p * 13)
	var_8_0:addElement(var_8_8)

	var_8_0.Lock = var_8_8

	local function var_8_9()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_9

	local var_8_10
	local var_8_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_8_6:RegisterAnimationSequence("AR", var_8_11)

	local var_8_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 36
		}
	}

	var_8_8:RegisterAnimationSequence("AR", var_8_12)

	local function var_8_13()
		var_8_6:AnimateSequence("AR")
		var_8_8:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_13

	local var_8_14
	local var_8_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonOver", var_8_15)

	local var_8_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_16)

	local var_8_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOver", var_8_17)

	local function var_8_18()
		var_8_4:AnimateSequence("ButtonOver")
		var_8_6:AnimateSequence("ButtonOver")
		var_8_8:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_18

	local var_8_19
	local var_8_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.NeutralGray
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonUp", var_8_20)

	local var_8_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_21)

	local var_8_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUp", var_8_22)

	local function var_8_23()
		var_8_4:AnimateSequence("ButtonUp")
		var_8_6:AnimateSequence("ButtonUp")
		var_8_8:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_23

	local var_8_24
	local var_8_25 = {
		{
			value = 0.74,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonOverDisabled", var_8_25)

	local var_8_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOverDisabled", var_8_26)

	local var_8_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOverDisabled", var_8_27)

	local function var_8_28()
		var_8_4:AnimateSequence("ButtonOverDisabled")
		var_8_6:AnimateSequence("ButtonOverDisabled")
		var_8_8:AnimateSequence("ButtonOverDisabled")
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_28

	local var_8_29
	local var_8_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.NeutralGray
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonUpDisabled", var_8_30)

	local var_8_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpDisabled", var_8_31)

	local var_8_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUpDisabled", var_8_32)

	local function var_8_33()
		var_8_4:AnimateSequence("ButtonUpDisabled")
		var_8_6:AnimateSequence("ButtonUpDisabled")
		var_8_8:AnimateSequence("ButtonUpDisabled")
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_33

	local var_8_34
	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonUpSnap", var_8_35)

	local var_8_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpSnap", var_8_36)

	local var_8_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUpSnap", var_8_37)

	local function var_8_38()
		var_8_4:AnimateSequence("ButtonUpSnap")
		var_8_6:AnimateSequence("ButtonUpSnap")
		var_8_8:AnimateSequence("ButtonUpSnap")
	end

	var_8_0._sequences.ButtonUpSnap = var_8_38

	local var_8_39
	local var_8_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.NeutralGray
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonUpDisabledSnap", var_8_40)

	local var_8_41 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpDisabledSnap", var_8_41)

	local var_8_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_8_42)

	local function var_8_43()
		var_8_4:AnimateSequence("ButtonUpDisabledSnap")
		var_8_6:AnimateSequence("ButtonUpDisabledSnap")
		var_8_8:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_8_0._sequences.ButtonUpDisabledSnap = var_8_43

	local var_8_44
	local var_8_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Enabled", var_8_45)

	local var_8_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Enabled", var_8_46)

	local function var_8_47()
		var_8_6:AnimateSequence("Enabled")
		var_8_8:AnimateSequence("Enabled")
	end

	var_8_0._sequences.Enabled = var_8_47

	local var_8_48
	local var_8_49 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Disabled", var_8_49)

	local var_8_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Disabled", var_8_50)

	local function var_8_51()
		var_8_6:AnimateSequence("Disabled")
		var_8_8:AnimateSequence("Disabled")
	end

	var_8_0._sequences.Disabled = var_8_51

	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("MaintenanceButton", MaintenanceButton)
LockTable(_M)
