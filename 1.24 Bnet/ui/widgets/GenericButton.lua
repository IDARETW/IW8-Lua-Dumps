module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.Text)
	arg_1_0.Text:setText(arg_1_1)
end

function RefreshAnimation(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0._lastState ~= arg_2_1 then
		arg_2_0._lastState = arg_2_1

		if arg_2_2 then
			assert(arg_2_0._sequences and arg_2_0._sequences[arg_2_1 .. "Snap"])
			ACTIONS.AnimateSequence(arg_2_0, arg_2_1 .. "Snap")
		else
			ACTIONS.AnimateSequence(arg_2_0, arg_2_1)
		end
	end
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = LUI.Alignment.Left

	arg_3_0:SetNotifyOnLayoutInit(true)
	arg_3_0:addEventHandler("layout_initialized", function(arg_4_0, arg_4_1)
		if arg_4_0.Text then
			var_3_0 = arg_4_0.Text:getHorizontalAlignment()

			arg_4_0.Background:SetupButton(arg_4_0.Text, arg_4_0.Text:getText(), var_3_0)
		end
	end)
	arg_3_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		RefreshAnimation(arg_5_0, "ButtonOver")
		arg_3_0.Background:SetupButton(arg_3_0.Text, arg_3_0.Text:getText(), var_3_0)
	end)
	arg_3_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		RefreshAnimation(arg_6_0, "ButtonUp", arg_6_1.snap)
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		RefreshAnimation(arg_7_0, "ButtonUpDisabled", arg_7_1.snap)
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		RefreshAnimation(arg_8_0, "ButtonOverDisabled")
		arg_3_0.Background:SetupButton(arg_3_0.Text, arg_3_0.Text:getText(), var_3_0)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	arg_3_0.SetText = var_0_0
end

function GenericButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_9_0.id = "GenericButton"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "BackgroundDarkener"

	var_9_4:SetRGBFromInt(0, 0)
	var_9_4:SetAlpha(0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.BackgroundDarkener = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "Background"

	var_9_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_6)

	var_9_0.Background = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIStyledText.new()

	var_9_8.id = "Text"

	var_9_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_9_8:setText(ToUpperCase(""), 0)
	var_9_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_8:SetAlignment(LUI.Alignment.Left)
	var_9_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_8:SetStartupDelay(2000)
	var_9_8:SetLineHoldTime(400)
	var_9_8:SetAnimMoveTime(300)
	var_9_8:SetAnimMoveSpeed(50)
	var_9_8:SetEndDelay(1500)
	var_9_8:SetCrossfadeTime(750)
	var_9_8:SetFadeInTime(300)
	var_9_8:SetFadeOutTime(300)
	var_9_8:SetMaxVisibleLines(1)
	var_9_8:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_9_8:SetOutlineRGBFromInt(0, 0)
	var_9_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -11, _1080p * 13)
	var_9_0:addElement(var_9_8)

	var_9_0.Text = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "Lock"

	var_9_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_9_10:SetAlpha(0, 0)
	var_9_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_9_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -10, _1080p * -13, _1080p * 13)
	var_9_0:addElement(var_9_10)

	var_9_0.Lock = var_9_10

	local function var_9_11()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_11

	local var_9_12 = {
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

	var_9_8:RegisterAnimationSequence("ButtonOver", var_9_12)

	local var_9_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonOver", var_9_13)

	local function var_9_14()
		var_9_8:AnimateSequence("ButtonOver")
		var_9_10:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_14

	local var_9_15 = {
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

	var_9_8:RegisterAnimationSequence("ButtonUp", var_9_15)

	local function var_9_16()
		var_9_8:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_16

	local var_9_17 = {
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

	var_9_8:RegisterAnimationSequence("Locked", var_9_17)

	local var_9_18 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("Locked", var_9_18)

	local function var_9_19()
		var_9_8:AnimateSequence("Locked")
		var_9_10:AnimateSequence("Locked")
	end

	var_9_0._sequences.Locked = var_9_19

	local var_9_20 = {
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

	var_9_8:RegisterAnimationSequence("NewNotification", var_9_20)

	local function var_9_21()
		var_9_8:AnimateSequence("NewNotification")
	end

	var_9_0._sequences.NewNotification = var_9_21

	local var_9_22 = {
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

	var_9_8:RegisterAnimationSequence("ButtonOverDisabled", var_9_22)

	local function var_9_23()
		var_9_8:AnimateSequence("ButtonOverDisabled")
	end

	var_9_0._sequences.ButtonOverDisabled = var_9_23

	local var_9_24 = {
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

	var_9_8:RegisterAnimationSequence("ButtonUpDisabled", var_9_24)

	local var_9_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonUpDisabled", var_9_25)

	local function var_9_26()
		var_9_8:AnimateSequence("ButtonUpDisabled")
		var_9_10:AnimateSequence("ButtonUpDisabled")
	end

	var_9_0._sequences.ButtonUpDisabled = var_9_26

	local var_9_27 = {
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

	var_9_8:RegisterAnimationSequence("ButtonUpSnap", var_9_27)

	local function var_9_28()
		var_9_8:AnimateSequence("ButtonUpSnap")
	end

	var_9_0._sequences.ButtonUpSnap = var_9_28

	local var_9_29 = {
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

	var_9_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_9_29)

	local function var_9_30()
		var_9_8:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_9_0._sequences.ButtonUpDisabledSnap = var_9_30

	local var_9_31 = {
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

	var_9_8:RegisterAnimationSequence("AR", var_9_31)

	local var_9_32 = {
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

	var_9_10:RegisterAnimationSequence("AR", var_9_32)

	local function var_9_33()
		var_9_8:AnimateSequence("AR")
		var_9_10:AnimateSequence("AR")
	end

	var_9_0._sequences.AR = var_9_33

	local var_9_34 = {
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

	var_9_8:RegisterAnimationSequence("Enabled", var_9_34)

	local var_9_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("Enabled", var_9_35)

	local function var_9_36()
		var_9_8:AnimateSequence("Enabled")
		var_9_10:AnimateSequence("Enabled")
	end

	var_9_0._sequences.Enabled = var_9_36

	local var_9_37 = {
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

	var_9_8:RegisterAnimationSequence("Disabled", var_9_37)

	local var_9_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("Disabled", var_9_38)

	local function var_9_39()
		var_9_8:AnimateSequence("Disabled")
		var_9_10:AnimateSequence("Disabled")
	end

	var_9_0._sequences.Disabled = var_9_39

	var_9_0:addEventHandler("disable", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "Disabled")
	end)
	var_9_0:addEventHandler("enable", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "Enabled")
	end)
	PostLoadFunc(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("GenericButton", GenericButton)
LockTable(_M)
