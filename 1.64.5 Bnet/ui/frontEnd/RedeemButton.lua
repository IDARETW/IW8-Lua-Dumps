module(..., package.seeall)

local function var_0_0(arg_1_0)
	ACTIONS.AnimateSequence(arg_1_0, "Glint")
	arg_1_0.Shine:SetAlpha(0.5)
end

local function var_0_1(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, "GlintStop")
	arg_2_0.Shine:SetAlpha(0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.StartGlint = var_0_0
	arg_3_0.StopGlint = var_0_1

	arg_3_0.GlintMask:SetAlpha(1)
	arg_3_0.Shine:SetMask(arg_3_0.GlintMask)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_3_0, "WZWipSetup")
	end
end

function RedeemButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 491 * _1080p, 0, 58 * _1080p)

	var_4_0.id = "RedeemButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Texture"

	var_4_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_6:SetAlpha(0.1, 0)
	var_4_6:SetPixelGridEnabled(true)
	var_4_6:SetPixelGridContrast(0.8, 0)
	var_4_6:SetPixelGridBlockWidth(2, 0)
	var_4_6:SetPixelGridBlockHeight(2, 0)
	var_4_6:SetPixelGridGutterWidth(1, 0)
	var_4_6:SetPixelGridGutterHeight(1, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.Texture = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Highlight"

	var_4_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_8:SetAlpha(0.5, 0)
	var_4_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_4_8:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_4_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -59, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.Highlight = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "HighlightBottom"

	var_4_10:SetAlpha(0.6, 0)
	var_4_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -2, _1080p * -2, _1080p * -1, _1080p * 1)
	var_4_0:addElement(var_4_10)

	var_4_0.HighlightBottom = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "HighlightTop"

	var_4_12:SetAlpha(0.6, 0)
	var_4_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -1, _1080p * 1)
	var_4_0:addElement(var_4_12)

	var_4_0.HighlightTop = var_4_12

	local var_4_13
	local var_4_14 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_15 = LUI.UIBorder.new(var_4_14)

	var_4_15.id = "Lines"

	var_4_15:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_15:SetBorderThicknessLeft(_1080p * 0, 0)
	var_4_15:SetBorderThicknessRight(_1080p * 0, 0)
	var_4_0:addElement(var_4_15)

	var_4_0.Lines = var_4_15

	local var_4_16
	local var_4_17 = LUI.UIStyledText.new()

	var_4_17.id = "RedeemText"

	var_4_17:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_17:setText(Engine.CBBHFCGDIC("BATTLEPASS/REDEEM_FREE_REWARD"), 0)
	var_4_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_17:SetWordWrap(false)
	var_4_17:SetAlignment(LUI.Alignment.Center)
	var_4_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_17:SetStartupDelay(2000)
	var_4_17:SetLineHoldTime(400)
	var_4_17:SetAnimMoveTime(2000)
	var_4_17:SetAnimMoveSpeed(150)
	var_4_17:SetEndDelay(2000)
	var_4_17:SetCrossfadeTime(250)
	var_4_17:SetFadeInTime(300)
	var_4_17:SetFadeOutTime(300)
	var_4_17:SetMaxVisibleLines(1)
	var_4_17:SetShadowRGBFromInt(0, 0)
	var_4_17:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 11, _1080p * -11, _1080p * -14, _1080p * 14)
	var_4_0:addElement(var_4_17)

	var_4_0.RedeemText = var_4_17

	local var_4_18
	local var_4_19 = LUI.UIImage.new()

	var_4_19.id = "Shine"

	var_4_19:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_19:SetAlpha(0.5, 0)
	var_4_19:SetZRotation(-45, 0)
	var_4_19:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_4_19:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_4_19:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -85, _1080p * -43, _1080p * -106, _1080p * 106)
	var_4_0:addElement(var_4_19)

	var_4_0.Shine = var_4_19

	local var_4_20
	local var_4_21 = LUI.UIImage.new()

	var_4_21.id = "GlintMask"

	var_4_21:SetAlpha(0, 0)
	var_4_21:setImage(RegisterMaterial("stencil_mask"), 0)
	var_4_0:addElement(var_4_21)

	var_4_0.GlintMask = var_4_21

	local function var_4_22()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_22

	local var_4_23
	local var_4_24 = {
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
			value = _1080p * -85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -43
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 43,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 85,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 43
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 85
		}
	}

	var_4_19:RegisterAnimationSequence("Glint", var_4_24)

	local function var_4_25()
		var_4_19:AnimateLoop("Glint")
	end

	var_4_0._sequences.Glint = var_4_25

	local var_4_26
	local var_4_27 = {
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
			value = _1080p * -85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -43
		}
	}

	var_4_19:RegisterAnimationSequence("GlintStop", var_4_27)

	local function var_4_28()
		var_4_19:AnimateSequence("GlintStop")
	end

	var_4_0._sequences.GlintStop = var_4_28

	local var_4_29
	local var_4_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2DarkHilite
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipSetup", var_4_30)

	local var_4_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2DarkHilite
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipSetup", var_4_31)

	local var_4_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2_Highlight
		}
	}

	var_4_15:RegisterAnimationSequence("WZWipSetup", var_4_32)

	local var_4_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2_Highlight
		}
	}

	var_4_17:RegisterAnimationSequence("WZWipSetup", var_4_33)

	local var_4_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2_Highlight
		}
	}

	var_4_19:RegisterAnimationSequence("WZWipSetup", var_4_34)

	local function var_4_35()
		var_4_6:AnimateSequence("WZWipSetup")
		var_4_8:AnimateSequence("WZWipSetup")
		var_4_15:AnimateSequence("WZWipSetup")
		var_4_17:AnimateSequence("WZWipSetup")
		var_4_19:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_35

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("RedeemButton", RedeemButton)
LockTable(_M)
