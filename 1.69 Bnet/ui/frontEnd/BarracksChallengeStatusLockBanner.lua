module(..., package.seeall)

function BarracksChallengeStatusLockBanner(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 425 * _1080p, 0, 70 * _1080p)

	var_1_0.id = "BarracksChallengeStatusLockBanner"
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

	var_1_4.id = "Gradient"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.lockedText, 0)
	var_1_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50)
	var_1_0:addElement(var_1_4)

	var_1_0.Gradient = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "CornerShadow"

	var_1_6:SetRGBFromInt(0, 0)
	var_1_6:SetAlpha(0.4, 0)
	var_1_6:setImage(RegisterMaterial("ui_upper_left_corner"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 72, 0, _1080p * 2)
	var_1_0:addElement(var_1_6)

	var_1_0.CornerShadow = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Corner"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.lockBannerMain, 0)
	var_1_8:setImage(RegisterMaterial("ui_upper_left_corner"), 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 70, 0, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.Corner = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Lock"

	var_1_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_1_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 35, _1080p * 8, _1080p * 39)
	var_1_0:addElement(var_1_10)

	var_1_0.Lock = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "Text"

	var_1_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_1_12:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/CHALLENGE_AVAILABLE_WITH_FULL_GAME")), 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetShadowMinDistance(-0.3, 0)
	var_1_12:SetShadowMaxDistance(1, 0)
	var_1_12:SetShadowUOffset(0.001, 0)
	var_1_12:SetShadowRGBFromInt(1710618, 0)
	var_1_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 66, _1080p * -9, _1080p * 16, _1080p * 34)
	var_1_0:addElement(var_1_12)

	var_1_0.Text = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "GradientLine"

	var_1_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_1_14:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_1_0:addElement(var_1_14)

	var_1_0.GradientLine = var_1_14

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "Glow"

	var_1_16:SetAlpha(0.3, 0)
	var_1_16:SetPixelGridEnabled(true)
	var_1_16:SetPixelGridContrast(0.5, 0)
	var_1_16:SetPixelGridBlockWidth(2, 0)
	var_1_16:SetPixelGridBlockHeight(2, 0)
	var_1_16:SetPixelGridGutterWidth(1, 0)
	var_1_16:SetPixelGridGutterHeight(1, 0)
	var_1_16.Glow:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_1_16:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 3, _1080p * 27)
	var_1_0:addElement(var_1_16)

	var_1_0.Glow = var_1_16

	local function var_1_17()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_17

	local var_1_18 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("ShowLock", var_1_18)

	local var_1_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_1_10:RegisterAnimationSequence("ShowLock", var_1_19)

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -22
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 66,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -9,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_12:RegisterAnimationSequence("ShowLock", var_1_20)

	local var_1_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -356
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_14:RegisterAnimationSequence("ShowLock", var_1_21)

	local var_1_22 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_16:RegisterAnimationSequence("ShowLock", var_1_22)

	local function var_1_23()
		var_1_4:AnimateSequence("ShowLock")
		var_1_10:AnimateSequence("ShowLock")
		var_1_12:AnimateSequence("ShowLock")
		var_1_14:AnimateSequence("ShowLock")
		var_1_16:AnimateSequence("ShowLock")
	end

	var_1_0._sequences.ShowLock = var_1_23

	return var_1_0
end

MenuBuilder.registerType("BarracksChallengeStatusLockBanner", BarracksChallengeStatusLockBanner)
LockTable(_M)
