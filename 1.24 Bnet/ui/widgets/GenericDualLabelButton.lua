module(..., package.seeall)

local function var_0_0(arg_1_0)
	if IsLanguageRightToLeft(GetCurrentLanguage()) then
		local var_1_0 = 0
		local var_1_1 = 1
		local var_1_2 = 40 * _1080p
		local var_1_3 = 240 * _1080p

		arg_1_0.DynamicText:SetAnchorsAndPosition(var_1_0, var_1_1, 0.5, 0.5, var_1_2, var_1_3, _1080p * -21, _1080p * 15)
		arg_1_0.DynamicText:SetAlignment(LUI.Alignment.Left)
		arg_1_0.DynamicText:SetOptOutRightToLeftAlignmentFlip(true)

		local var_1_4 = 170 * _1080p
		local var_1_5 = -40 * _1080p

		arg_1_0.Text:SetAnchorsAndPosition(0, 0, 0.5, 0.5, var_1_4, var_1_5, _1080p * -21, _1080p * 15)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0._lastState ~= arg_2_1 then
		arg_2_0._lastState = arg_2_1

		ACTIONS.AnimateSequence(arg_2_0, arg_2_1)
		var_0_0(arg_2_0)
	end
end

function PostLoadFunc(arg_3_0)
	local var_3_0, var_3_1, var_3_2, var_3_3 = arg_3_0.DynamicText:getLocalRect()
	local var_3_4 = 1
	local var_3_5 = 0
	local var_3_6 = var_3_0
	local var_3_7 = var_3_2
	local var_3_8 = LUI.Alignment.Left

	arg_3_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		var_0_1(arg_4_0, "ButtonOver")
		arg_3_0.Background:SetupButton(arg_3_0.Text, arg_3_0.Text:getText(), var_3_8)
	end)
	arg_3_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		var_0_1(arg_5_0, "ButtonUp")
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		var_0_1(arg_6_0, "ButtonUpDisabled")
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_7_0, arg_7_1)
		var_0_1(arg_7_0, "ButtonOverDisabled")
		arg_3_0.Background:SetupButton(arg_3_0.Text, arg_3_0.Text:getText(), var_3_8)
	end)
	arg_3_0:addEventHandler("button_active", function(arg_8_0, arg_8_1)
		var_0_1(arg_8_0, "ButtonActive")
	end)
	arg_3_0:addEventHandler("button_over_active", function(arg_9_0, arg_9_1)
		var_0_1(arg_9_0, "ButtonOverActive")
	end)
	arg_3_0:addEventHandler("button_disable_active", function(arg_10_0, arg_10_1)
		var_0_1(arg_10_0, "ButtonDisabledActive")
	end)
	arg_3_0:addEventHandler("button_over_disable_active", function(arg_11_0, arg_11_1)
		var_0_1(arg_11_0, "ButtonOverDisabledActive")
	end)
	var_0_0(arg_3_0)
end

function GenericDualLabelButton(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIButton.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 38 * _1080p)

	var_12_0.id = "GenericDualLabelButton"
	var_12_0._animationSets = {}
	var_12_0._sequences = {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "Background"

	var_12_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.Background = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIStyledText.new()

	var_12_6.id = "Text"

	var_12_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_12_6:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_12_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_6:SetAlignment(LUI.Alignment.Left)
	var_12_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_12_6:SetStartupDelay(1000)
	var_12_6:SetLineHoldTime(500)
	var_12_6:SetAnimMoveTime(500)
	var_12_6:SetAnimMoveSpeed(50)
	var_12_6:SetEndDelay(1000)
	var_12_6:SetCrossfadeTime(500)
	var_12_6:SetFadeInTime(300)
	var_12_6:SetFadeOutTime(300)
	var_12_6:SetMaxVisibleLines(1)
	var_12_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -170, _1080p * -12, _1080p * 12)
	var_12_0:addElement(var_12_6)

	var_12_0.Text = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIStyledText.new()

	var_12_8.id = "DynamicText"

	var_12_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_8:SetAlpha(0.5, 0)
	var_12_8:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_12_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_8:SetAlignment(LUI.Alignment.Right)
	var_12_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_12_8:SetStartupDelay(1000)
	var_12_8:SetLineHoldTime(500)
	var_12_8:SetAnimMoveTime(500)
	var_12_8:SetAnimMoveSpeed(50)
	var_12_8:SetEndDelay(1000)
	var_12_8:SetCrossfadeTime(500)
	var_12_8:SetFadeInTime(300)
	var_12_8:SetFadeOutTime(300)
	var_12_8:SetMaxVisibleLines(1)
	var_12_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -170, _1080p * -20, _1080p * -9, _1080p * 9)
	var_12_0:addElement(var_12_8)

	var_12_0.DynamicText = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIImage.new()

	var_12_10.id = "Lock"

	var_12_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_10:SetAlpha(0, 0)
	var_12_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_12_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -33, _1080p * -7, _1080p * -13, _1080p * 13)
	var_12_0:addElement(var_12_10)

	var_12_0.Lock = var_12_10

	local function var_12_11()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_11

	local var_12_12 = {
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

	var_12_6:RegisterAnimationSequence("ButtonOver", var_12_12)

	local var_12_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOver", var_12_13)

	local var_12_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonOver", var_12_14)

	local function var_12_15()
		var_12_6:AnimateSequence("ButtonOver")
		var_12_8:AnimateSequence("ButtonOver")
		var_12_10:AnimateSequence("ButtonOver")
	end

	var_12_0._sequences.ButtonOver = var_12_15

	local var_12_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonUp", var_12_16)

	local var_12_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -170
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUp", var_12_17)

	local var_12_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonUp", var_12_18)

	local function var_12_19()
		var_12_6:AnimateSequence("ButtonUp")
		var_12_8:AnimateSequence("ButtonUp")
		var_12_10:AnimateSequence("ButtonUp")
	end

	var_12_0._sequences.ButtonUp = var_12_19

	local var_12_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Locked", var_12_20)

	local var_12_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -39
		}
	}

	var_12_8:RegisterAnimationSequence("Locked", var_12_21)

	local var_12_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_12_10:RegisterAnimationSequence("Locked", var_12_22)

	local function var_12_23()
		var_12_6:AnimateSequence("Locked")
		var_12_8:AnimateSequence("Locked")
		var_12_10:AnimateSequence("Locked")
	end

	var_12_0._sequences.Locked = var_12_23

	local var_12_24 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("NewNotification", var_12_24)

	local var_12_25 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("NewNotification", var_12_25)

	local var_12_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("NewNotification", var_12_26)

	local function var_12_27()
		var_12_6:AnimateSequence("NewNotification")
		var_12_8:AnimateSequence("NewNotification")
		var_12_10:AnimateSequence("NewNotification")
	end

	var_12_0._sequences.NewNotification = var_12_27

	local var_12_28 = {
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

	var_12_6:RegisterAnimationSequence("ButtonOverDisabled", var_12_28)

	local var_12_29 = {
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

	var_12_8:RegisterAnimationSequence("ButtonOverDisabled", var_12_29)

	local function var_12_30()
		var_12_6:AnimateSequence("ButtonOverDisabled")
		var_12_8:AnimateSequence("ButtonOverDisabled")
	end

	var_12_0._sequences.ButtonOverDisabled = var_12_30

	local var_12_31 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonUpDisabled", var_12_31)

	local var_12_32 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUpDisabled", var_12_32)

	local function var_12_33()
		var_12_6:AnimateSequence("ButtonUpDisabled")
		var_12_8:AnimateSequence("ButtonUpDisabled")
	end

	var_12_0._sequences.ButtonUpDisabled = var_12_33

	local var_12_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonActive", var_12_34)

	local var_12_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonActive", var_12_35)

	local function var_12_36()
		var_12_6:AnimateSequence("ButtonActive")
		var_12_8:AnimateSequence("ButtonActive")
	end

	var_12_0._sequences.ButtonActive = var_12_36

	local var_12_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOverActive", var_12_37)

	local var_12_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverActive", var_12_38)

	local function var_12_39()
		var_12_6:AnimateSequence("ButtonOverActive")
		var_12_8:AnimateSequence("ButtonOverActive")
	end

	var_12_0._sequences.ButtonOverActive = var_12_39

	local function var_12_40()
		return
	end

	var_12_0._sequences.ButtonDisabledActive = var_12_40

	local function var_12_41()
		return
	end

	var_12_0._sequences.ButtonOverDisabledActive = var_12_41

	PostLoadFunc(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("GenericDualLabelButton", GenericDualLabelButton)
LockTable(_M)
