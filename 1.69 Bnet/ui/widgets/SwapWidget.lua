module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:SetAlpha(arg_1_1 and 1 or 0)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.ReplacesText:setText(Engine.CBBHFCGDIC("LUA_MENU/REPLACES_X", arg_2_1))
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetVisible = var_0_0
	arg_3_0.SetReplacesText = var_0_1

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function SwapWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "SwapWidget"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Backer"

	var_4_4:SetRGBFromTable(SWATCHES.CAC.swapTag, 0)
	var_4_4:SetAlpha(0.55, 0)
	var_4_4:SetPixelGridEnabled(true)
	var_4_4:SetPixelGridContrast(0.5, 0)
	var_4_4:SetPixelGridBlockWidth(2, 0)
	var_4_4:SetPixelGridBlockHeight(2, 0)
	var_4_4:SetPixelGridGutterWidth(1, 0)
	var_4_4:SetPixelGridGutterHeight(1, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 38, _1080p * 112, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Backer = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "Text"

	var_4_6:setText(Engine.CBBHFCGDIC("LUA_MENU/SWAP"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetWordWrap(false)
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_6:SetStartupDelay(1000)
	var_4_6:SetLineHoldTime(400)
	var_4_6:SetAnimMoveTime(150)
	var_4_6:SetAnimMoveSpeed(500)
	var_4_6:SetEndDelay(1000)
	var_4_6:SetCrossfadeTime(400)
	var_4_6:SetFadeInTime(300)
	var_4_6:SetFadeOutTime(300)
	var_4_6:SetMaxVisibleLines(1)
	var_4_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 40, _1080p * 106, _1080p * -10, _1080p * 10)
	var_4_0:addElement(var_4_6)

	var_4_0.Text = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Cap"

	var_4_8:SetRGBFromTable(SWATCHES.CAC.swapTag, 0)
	var_4_8:SetAlpha(0.55, 0)
	var_4_8:SetPixelGridEnabled(true)
	var_4_8:SetPixelGridContrast(0.5, 0)
	var_4_8:SetPixelGridBlockWidth(2, 0)
	var_4_8:SetPixelGridBlockHeight(2, 0)
	var_4_8:SetPixelGridGutterWidth(1, 0)
	var_4_8:SetPixelGridGutterHeight(1, 0)
	var_4_8:setImage(RegisterMaterial("cac_equip_cap"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 8, _1080p * 38, 0, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.Cap = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Fill"

	var_4_10:SetRGBFromTable(SWATCHES.CAC.swapTag, 0)
	var_4_10:setImage(RegisterMaterial("icon_swap"), 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 30, 0, 0)
	var_4_0:addElement(var_4_10)

	var_4_0.Fill = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIText.new()

	var_4_12.id = "ReplacesText"

	var_4_12:setText(Engine.CBBHFCGDIC("LUA_MENU/REPLACES_X"), 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -332, 0, _1080p * -9, _1080p * 9)
	var_4_0:addElement(var_4_12)

	var_4_0.ReplacesText = var_4_12

	local function var_4_13()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_13

	local var_4_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 240,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 33
		},
		{
			duration = 240,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 107
		},
		{
			value = 0,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.55,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 38,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 112,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_4:RegisterAnimationSequence("TurnOn", var_4_14)

	local var_4_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 240,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 30
		},
		{
			duration = 240,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 96
		},
		{
			value = 0,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 106
		}
	}

	var_4_6:RegisterAnimationSequence("TurnOn", var_4_15)

	local var_4_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 33
		},
		{
			value = 0,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 240,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 3
		},
		{
			duration = 240,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 33
		},
		{
			value = 0.55,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 38,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_8:RegisterAnimationSequence("TurnOn", var_4_16)

	local var_4_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.5,
			duration = 80,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		}
	}

	var_4_10:RegisterAnimationSequence("TurnOn", var_4_17)

	local var_4_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_12:RegisterAnimationSequence("TurnOn", var_4_18)

	local function var_4_19()
		var_4_4:AnimateSequence("TurnOn")
		var_4_6:AnimateSequence("TurnOn")
		var_4_8:AnimateSequence("TurnOn")
		var_4_10:AnimateSequence("TurnOn")
		var_4_12:AnimateSequence("TurnOn")
	end

	var_4_0._sequences.TurnOn = var_4_19

	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_20)

	local var_4_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		}
	}

	var_4_12:RegisterAnimationSequence("AR", var_4_21)

	local function var_4_22()
		var_4_6:AnimateSequence("AR")
		var_4_12:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_22

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SwapWidget", SwapWidget)
LockTable(_M)
