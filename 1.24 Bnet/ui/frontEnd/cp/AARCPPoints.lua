module(..., package.seeall)

local var_0_0 = 1000
local var_0_1 = 2500

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	ACTIONS.AnimateSequence(arg_1_0, "Intro")

	local var_1_0 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
	local var_1_1 = PlayercardUtils.GetFrontendDataSources(var_1_0, arg_1_1)

	arg_1_0.SmallPlayerCard:SetDataSource(var_1_1, arg_1_1)
	arg_1_0.PointsLabel:setupTextValueIntTween(0, arg_1_2.matchDataPackage.currentCPpoints - arg_1_2.matchDataPackage.startCPpoints, var_0_0, LUI.EASING.inOutSine, Engine.CBBHFCGDIC("AAR/POINTS"))
	ACTIONS.ScaleFullscreen(arg_1_0.Darken)

	arg_1_0:Wait(var_0_1 + var_0_0).onComplete = function()
		ACTIONS.AdvancePostGame(arg_1_0)
	end
end

function AARCPPoints(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "AARCPPoints"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Darken"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_3_4:SetAlpha(0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Darken = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("SmallPlayerCard", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "SmallPlayerCard"

	var_3_6.GradientBacker:SetAlpha(0, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 702, _1080p * 1222, _1080p * 855, _1080p * 979)
	var_3_0:addElement(var_3_6)

	var_3_0.SmallPlayerCard = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("BannerGradient", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "XPHighlightBanner"

	var_3_8:SetAlpha(0, 0)
	var_3_8:SetPixelGridEnabled(true)
	var_3_8:SetPixelGridContrast(0.5, 0)
	var_3_8:SetPixelGridBlockWidth(2, 0)
	var_3_8:SetPixelGridBlockHeight(2, 0)
	var_3_8:SetPixelGridGutterWidth(1, 0)
	var_3_8:SetPixelGridGutterHeight(1, 0)
	var_3_8.BGAdd:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_3_8.BGMult:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_3_8.BGMult:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -900, _1080p * 904, _1080p * -4, _1080p * 68)
	var_3_0:addElement(var_3_8)

	var_3_0.XPHighlightBanner = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "PointsLabel"

	var_3_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 693, _1080p * 1231, _1080p * 534, _1080p * 604)
	var_3_0:addElement(var_3_10)

	var_3_0.PointsLabel = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "InstructionLabel"

	var_3_12:setText(Engine.CBBHFCGDIC("AAR/INSTRUCTION"), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 1922, _1080p * 712, _1080p * 740)
	var_3_0:addElement(var_3_12)

	var_3_0.InstructionLabel = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "PointAcquiredLabel"

	var_3_14:setText(Engine.CBBHFCGDIC("AAR/POINT_ACQUIRED"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 1922, _1080p * 200, _1080p * 228)
	var_3_0:addElement(var_3_14)

	var_3_0.PointAcquiredLabel = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "CPPointsImage"

	var_3_16:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 896, _1080p * 1024, _1080p * 350, _1080p * 478)
	var_3_0:addElement(var_3_16)

	var_3_0.CPPointsImage = var_3_16

	local function var_3_17()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_17

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_3_6:RegisterAnimationSequence("Intro", var_3_18)

	local var_3_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -83
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 87
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 20,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -127
		},
		{
			duration = 20,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 131
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -999
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1003
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Intro", var_3_19)

	local var_3_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_3_10:RegisterAnimationSequence("Intro", var_3_20)

	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 710
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 738
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_3_12:RegisterAnimationSequence("Intro", var_3_21)

	local var_3_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_3_14:RegisterAnimationSequence("Intro", var_3_22)

	local var_3_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_3_16:RegisterAnimationSequence("Intro", var_3_23)

	local function var_3_24()
		var_3_6:AnimateSequence("Intro")
		var_3_8:AnimateSequence("Intro")
		var_3_10:AnimateSequence("Intro")
		var_3_12:AnimateSequence("Intro")
		var_3_14:AnimateSequence("Intro")
		var_3_16:AnimateSequence("Intro")
	end

	var_3_0._sequences.Intro = var_3_24

	local function var_3_25()
		return
	end

	var_3_0._sequences.Outro = var_3_25

	var_0_2(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARCPPoints", AARCPPoints)
LockTable(_M)
