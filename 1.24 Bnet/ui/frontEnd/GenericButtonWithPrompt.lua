module(..., package.seeall)

function GenericButtonWithPrompt(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_1_0.id = "GenericButtonWithPrompt"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "GenericButtonBackground"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 38)
	var_1_0:addElement(var_1_4)

	var_1_0.GenericButtonBackground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "Text"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_6:setText(ToUpperCase(""), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_6:SetStartupDelay(2000)
	var_1_6:SetLineHoldTime(400)
	var_1_6:SetAnimMoveTime(2000)
	var_1_6:SetAnimMoveSpeed(150)
	var_1_6:SetEndDelay(2000)
	var_1_6:SetCrossfadeTime(250)
	var_1_6:SetFadeInTime(300)
	var_1_6:SetFadeOutTime(300)
	var_1_6:SetMaxVisibleLines(1)
	var_1_6:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_1_6:SetOutlineRGBFromInt(0, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 51, _1080p * -117, _1080p * -12, _1080p * 12)
	var_1_0:addElement(var_1_6)

	var_1_0.Text = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Image"

	var_1_8:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_SECONDARY_BUTTON"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 18, _1080p * 46, _1080p * -14, _1080p * 14)
	var_1_0:addElement(var_1_8)

	var_1_0.Image = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "CurrencyImage"

	var_1_10:setImage(RegisterMaterial("icon_currency_key"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 336, _1080p * 374, 0, _1080p * 38)
	var_1_0:addElement(var_1_10)

	var_1_0.CurrencyImage = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "Cost"

	var_1_12:setText("", 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 381, _1080p * 436, _1080p * 7, _1080p * 31)
	var_1_0:addElement(var_1_12)

	var_1_0.Cost = var_1_12

	local function var_1_13()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_13

	local var_1_14 = {
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

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_14)

	local function var_1_15()
		var_1_6:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_15

	local var_1_16 = {
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

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_16)

	local function var_1_17()
		var_1_6:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_17

	local var_1_18 = {
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

	var_1_6:RegisterAnimationSequence("Locked", var_1_18)

	local function var_1_19()
		var_1_6:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_19

	local var_1_20 = {
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

	var_1_6:RegisterAnimationSequence("NewNotification", var_1_20)

	local function var_1_21()
		var_1_6:AnimateSequence("NewNotification")
	end

	var_1_0._sequences.NewNotification = var_1_21

	local var_1_22 = {
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

	var_1_6:RegisterAnimationSequence("ButtonOverDisabled", var_1_22)

	local function var_1_23()
		var_1_6:AnimateSequence("ButtonOverDisabled")
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_23

	local var_1_24 = {
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

	var_1_6:RegisterAnimationSequence("ButtonUpDisabled", var_1_24)

	local function var_1_25()
		var_1_6:AnimateSequence("ButtonUpDisabled")
	end

	var_1_0._sequences.ButtonUpDisabled = var_1_25

	local var_1_26 = {
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

	var_1_6:RegisterAnimationSequence("ButtonUpSnap", var_1_26)

	local function var_1_27()
		var_1_6:AnimateSequence("ButtonUpSnap")
	end

	var_1_0._sequences.ButtonUpSnap = var_1_27

	local var_1_28 = {
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

	var_1_6:RegisterAnimationSequence("ButtonUpDisabledSnap", var_1_28)

	local function var_1_29()
		var_1_6:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_1_0._sequences.ButtonUpDisabledSnap = var_1_29

	local var_1_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		}
	}

	var_1_6:RegisterAnimationSequence("AR", var_1_30)

	local function var_1_31()
		var_1_6:AnimateSequence("AR")
	end

	var_1_0._sequences.AR = var_1_31

	return var_1_0
end

MenuBuilder.registerType("GenericButtonWithPrompt", GenericButtonWithPrompt)
LockTable(_M)
