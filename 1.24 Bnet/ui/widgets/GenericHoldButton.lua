module(..., package.seeall)

function RefreshAnimation(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		if arg_1_2 then
			assert(arg_1_0._sequences and arg_1_0._sequences[arg_1_1 .. "Snap"])
			ACTIONS.AnimateSequence(arg_1_0, arg_1_1 .. "Snap")
		else
			ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
		end
	end
end

local function var_0_0(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = LUI.Alignment.Left

	arg_2_0:SetNotifyOnLayoutInit(true)
	arg_2_0:addEventHandler("layout_initialized", function(arg_3_0, arg_3_1)
		if arg_3_0.Text then
			var_2_0 = arg_3_0.Text:getHorizontalAlignment()

			arg_3_0.Background:SetupButton(arg_3_0.Text, arg_3_0.Text:getText(), var_2_0)
		end
	end)
	arg_2_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_2_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_2_0, "ButtonUp")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		RefreshAnimation(arg_6_0, "ButtonUpDisabled", arg_6_1.snap)
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_7_0, arg_7_1)
		RefreshAnimation(arg_7_0, "ButtonOverDisabled")
		arg_2_0.Background:SetupButton(arg_2_0.Text, arg_2_0.Text:getText(), var_2_0)
	end)
end

function GenericHoldButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_8_0.id = "GenericHoldButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "Background"

	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "GenericProgressBar"

	var_8_6.Fill:SetRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_8_6.Fill:SetAlpha(0.6, 0)
	var_8_6.Frame:SetAlpha(0, 0)
	var_8_6.Cap:SetAlpha(0, 0)
	var_8_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1)
	var_8_0:addElement(var_8_6)

	var_8_0.GenericProgressBar = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "Text"

	var_8_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_8:setText(ToUpperCase(""), 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_8:SetAlignment(LUI.Alignment.Left)
	var_8_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_8:SetStartupDelay(2000)
	var_8_8:SetLineHoldTime(400)
	var_8_8:SetAnimMoveTime(2000)
	var_8_8:SetAnimMoveSpeed(150)
	var_8_8:SetEndDelay(2000)
	var_8_8:SetCrossfadeTime(250)
	var_8_8:SetFadeInTime(300)
	var_8_8:SetFadeOutTime(300)
	var_8_8:SetMaxVisibleLines(1)
	var_8_8:SetOutlineRGBFromInt(0, 0)
	var_8_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -11, _1080p * 13)
	var_8_0:addElement(var_8_8)

	var_8_0.Text = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "Lock"

	var_8_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_8_10:SetAlpha(0, 0)
	var_8_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_8_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -33, _1080p * -7, _1080p * -13, _1080p * 13)
	var_8_0:addElement(var_8_10)

	var_8_0.Lock = var_8_10

	local function var_8_11()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_11

	local var_8_12
	local var_8_13 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOver", var_8_13)

	local var_8_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonOver", var_8_14)

	local function var_8_15()
		var_8_8:AnimateSequence("ButtonOver")
		var_8_10:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_15

	local var_8_16
	local var_8_17 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUp", var_8_17)

	local var_8_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUp", var_8_18)

	local function var_8_19()
		var_8_8:AnimateSequence("ButtonUp")
		var_8_10:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_19

	local var_8_20
	local var_8_21 = {
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

	var_8_8:RegisterAnimationSequence("Locked", var_8_21)

	local function var_8_22()
		var_8_8:AnimateSequence("Locked")
	end

	var_8_0._sequences.Locked = var_8_22

	local var_8_23
	local var_8_24 = {
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

	var_8_8:RegisterAnimationSequence("NewNotification", var_8_24)

	local function var_8_25()
		var_8_8:AnimateSequence("NewNotification")
	end

	var_8_0._sequences.NewNotification = var_8_25

	local var_8_26
	local var_8_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOverDisabled", var_8_27)

	local var_8_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonOverDisabled", var_8_28)

	local function var_8_29()
		var_8_8:AnimateSequence("ButtonOverDisabled")
		var_8_10:AnimateSequence("ButtonOverDisabled")
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_29

	local var_8_30
	local var_8_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUpDisabled", var_8_31)

	local var_8_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUpDisabled", var_8_32)

	local function var_8_33()
		var_8_8:AnimateSequence("ButtonUpDisabled")
		var_8_10:AnimateSequence("ButtonUpDisabled")
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_33

	local var_8_34
	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUpSnap", var_8_35)

	local var_8_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUpSnap", var_8_36)

	local function var_8_37()
		var_8_8:AnimateSequence("ButtonUpSnap")
		var_8_10:AnimateSequence("ButtonUpSnap")
	end

	var_8_0._sequences.ButtonUpSnap = var_8_37

	local var_8_38
	local var_8_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUpDisabledSnap", var_8_39)

	local var_8_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUpDisabledSnap", var_8_40)

	local function var_8_41()
		var_8_8:AnimateSequence("ButtonUpDisabledSnap")
		var_8_10:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_8_0._sequences.ButtonUpDisabledSnap = var_8_41

	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("GenericHoldButton", GenericHoldButton)
LockTable(_M)
