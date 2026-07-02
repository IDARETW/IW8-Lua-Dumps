module(..., package.seeall)

function GenericButtonWhite(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 60 * _1080p)

	var_1_0.id = "GenericButtonWhite"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "BackgroundDarkener"

	var_1_4:SetRGBFromInt(13421772, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BackgroundDarkener = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "BackgroundTop"

	var_1_6:SetRGBFromInt(9011842, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 417, _1080p * 3, _1080p * 57)
	var_1_0:addElement(var_1_6)

	var_1_0.BackgroundTop = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "Text"

	var_1_8:SetRGBFromInt(13421772, 0)
	var_1_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OK")), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_8:SetStartupDelay(2000)
	var_1_8:SetLineHoldTime(400)
	var_1_8:SetAnimMoveTime(300)
	var_1_8:SetAnimMoveSpeed(50)
	var_1_8:SetEndDelay(1500)
	var_1_8:SetCrossfadeTime(750)
	var_1_8:SetFadeInTime(300)
	var_1_8:SetFadeOutTime(300)
	var_1_8:SetMaxVisibleLines(1)
	var_1_8:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_1_8:SetOutlineRGBFromInt(0, 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -11, _1080p * 13)
	var_1_0:addElement(var_1_8)

	var_1_0.Text = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Lock"

	var_1_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_1_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -10, _1080p * -13, _1080p * 13)
	var_1_0:addElement(var_1_10)

	var_1_0.Lock = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_13)

	local var_1_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonOver", var_1_14)

	local function var_1_15()
		var_1_8:AnimateSequence("ButtonOver")
		var_1_10:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_15

	local var_1_16
	local var_1_17 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_17)

	local function var_1_18()
		var_1_8:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_18

	local var_1_19
	local var_1_20 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_1_8:RegisterAnimationSequence("Locked", var_1_20)

	local var_1_21 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Locked", var_1_21)

	local function var_1_22()
		var_1_8:AnimateSequence("Locked")
		var_1_10:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_22

	local var_1_23
	local var_1_24 = {
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

	var_1_8:RegisterAnimationSequence("NewNotification", var_1_24)

	local function var_1_25()
		var_1_8:AnimateSequence("NewNotification")
	end

	var_1_0._sequences.NewNotification = var_1_25

	local var_1_26
	local var_1_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOverDisabled", var_1_27)

	local function var_1_28()
		var_1_8:AnimateSequence("ButtonOverDisabled")
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_28

	local var_1_29
	local var_1_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUpDisabled", var_1_30)

	local var_1_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonUpDisabled", var_1_31)

	local function var_1_32()
		var_1_8:AnimateSequence("ButtonUpDisabled")
		var_1_10:AnimateSequence("ButtonUpDisabled")
	end

	var_1_0._sequences.ButtonUpDisabled = var_1_32

	local var_1_33
	local var_1_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUpSnap", var_1_34)

	local function var_1_35()
		var_1_8:AnimateSequence("ButtonUpSnap")
	end

	var_1_0._sequences.ButtonUpSnap = var_1_35

	local var_1_36
	local var_1_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_1_37)

	local function var_1_38()
		var_1_8:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_1_0._sequences.ButtonUpDisabledSnap = var_1_38

	local var_1_39
	local var_1_40 = {
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

	var_1_8:RegisterAnimationSequence("AR", var_1_40)

	local var_1_41 = {
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

	var_1_10:RegisterAnimationSequence("AR", var_1_41)

	local function var_1_42()
		var_1_8:AnimateSequence("AR")
		var_1_10:AnimateSequence("AR")
	end

	var_1_0._sequences.AR = var_1_42

	local var_1_43
	local var_1_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("Enabled", var_1_44)

	local var_1_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Enabled", var_1_45)

	local function var_1_46()
		var_1_8:AnimateSequence("Enabled")
		var_1_10:AnimateSequence("Enabled")
	end

	var_1_0._sequences.Enabled = var_1_46

	local var_1_47
	local var_1_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Disabled", var_1_48)

	local var_1_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Disabled", var_1_49)

	local function var_1_50()
		var_1_8:AnimateSequence("Disabled")
		var_1_10:AnimateSequence("Disabled")
	end

	var_1_0._sequences.Disabled = var_1_50

	var_1_0:addEventHandler("disable", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Disabled")
	end)
	var_1_0:addEventHandler("enable", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Enabled")
	end)

	return var_1_0
end

MenuBuilder.registerType("GenericButtonWhite", GenericButtonWhite)
LockTable(_M)
