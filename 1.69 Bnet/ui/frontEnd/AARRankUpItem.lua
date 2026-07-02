module(..., package.seeall)

function AARRankUpItem(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 540 * _1080p)

	var_1_0.id = "AARRankUpItem"
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

	var_1_4.id = "Triangle3"

	var_1_4:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:SetScale(-0.5, 0)
	var_1_4:setImage(RegisterMaterial("campaign_world_map_triangle"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -17, _1080p * 18, _1080p * -170, _1080p * -134)
	var_1_0:addElement(var_1_4)

	var_1_0.Triangle3 = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Triangle2"

	var_1_6:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_1_6:SetAlpha(0, 0)
	var_1_6:SetScale(-0.5, 0)
	var_1_6:setImage(RegisterMaterial("campaign_world_map_triangle"), 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -17, _1080p * 18, _1080p * -188, _1080p * -152)
	var_1_0:addElement(var_1_6)

	var_1_0.Triangle2 = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Triangle1"

	var_1_8:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_1_8:SetAlpha(0, 0)
	var_1_8:SetScale(-0.5, 0)
	var_1_8:setImage(RegisterMaterial("campaign_world_map_triangle"), 0)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -17, _1080p * 18, _1080p * -206, _1080p * -170)
	var_1_0:addElement(var_1_8)

	var_1_0.Triangle1 = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Arrow"

	var_1_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:setImage(RegisterMaterial("campaign_decoration_triangle"), 0)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -208, _1080p * -192, _1080p * 18, _1080p * 34)
	var_1_0:addElement(var_1_10)

	var_1_0.Arrow = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "LabelH1"

	var_1_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_12:SetAlpha(0, 0)
	var_1_12:SetScale(-0.2, 0)
	var_1_12:SetGlitchAmount(0.01, 0)
	var_1_12:setText(MarkLocalized("n/r"), 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 178, _1080p * 202, _1080p * -33, _1080p * -15)
	var_1_0:addElement(var_1_12)

	var_1_0.LabelH1 = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIStyledText.new()

	var_1_14.id = "LabelH2"

	var_1_14:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_14:SetAlpha(0, 0)
	var_1_14:SetScale(-0.2, 0)
	var_1_14:SetGlitchAmount(0.01, 0)
	var_1_14:setText(MarkLocalized("r/s 12/95 +"), 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetDecodeLetterLength(75)
	var_1_14:SetDecodeMaxRandChars(75)
	var_1_14:SetDecodeUpdatesPerLetter(75)
	var_1_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 171, _1080p * 263, _1080p * -49, _1080p * -31)
	var_1_0:addElement(var_1_14)

	var_1_0.LabelH2 = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIText.new()

	var_1_16.id = "RankValue"

	var_1_16:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_1_16:setText("", 0)
	var_1_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_16:SetAlignment(LUI.Alignment.Center)
	var_1_16:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_1_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -1000, _1080p * 1000, _1080p * -128, 0)
	var_1_0:addElement(var_1_16)

	var_1_0.RankValue = var_1_16

	local var_1_17
	local var_1_18 = LUI.UIImage.new()

	var_1_18.id = "RankIcon"

	var_1_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 326, _1080p * 84, _1080p * 376)
	var_1_0:addElement(var_1_18)

	var_1_0.RankIcon = var_1_18

	local function var_1_19()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_19

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 410,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Celebration", var_1_20)

	local var_1_21 = {
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
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 310,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Celebration", var_1_21)

	local var_1_22 = {
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
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 210,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Celebration", var_1_22)

	local var_1_23 = {
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
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 210,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Celebration", var_1_23)

	local var_1_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 240,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 124
		},
		{
			duration = 240,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 326
		},
		{
			duration = 240,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 34
		},
		{
			duration = 240,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 416
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 190,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 421,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 331,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 39,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 420
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 29,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 321,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 128
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 406,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 114,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 39
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 331
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 139,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 431,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 332
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 406,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 321,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 114,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 29,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 326,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 34,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 421,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 416,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 326,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 34,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 124,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 39,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 331,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 421,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 331
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 406,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 39
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 114,
			easing = LUI.EASING.snap
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 326
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 34
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 416
		},
		{
			duration = 30,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 124
		},
		{
			value = 0.3,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("Celebration", var_1_24)

	local function var_1_25()
		var_1_4:AnimateSequence("Celebration")
		var_1_6:AnimateSequence("Celebration")
		var_1_8:AnimateSequence("Celebration")
		var_1_16:AnimateSequence("Celebration")
		var_1_18:AnimateSequence("Celebration")
	end

	var_1_0._sequences.Celebration = var_1_25

	local var_1_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 530,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 270,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Intro", var_1_26)

	local var_1_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 530,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 170,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Intro", var_1_27)

	local var_1_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 530,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Intro", var_1_28)

	local var_1_29 = {
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 380,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 470,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Intro", var_1_29)

	local var_1_30 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Text,
			value = MarkLocalized("n/r")
		},
		{
			value = 0.5,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.75,
			duration = 1050,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("Intro", var_1_30)

	local var_1_31 = {
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 450,
			property = TWEEN_PROPERTY.Text,
			value = MarkLocalized("r/s 12/95 +")
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.75,
			duration = 860,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 190,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("Intro", var_1_31)

	local var_1_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1070,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Intro", var_1_32)

	local var_1_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -306,
			easing = LUI.EASING.snap
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 756,
			easing = LUI.EASING.snap
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -396,
			easing = LUI.EASING.snap
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 846,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 34
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 326
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 376
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 84
		},
		{
			value = 1,
			duration = 1600,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("Intro", var_1_33)

	local function var_1_34()
		var_1_4:AnimateSequence("Intro")
		var_1_6:AnimateSequence("Intro")
		var_1_8:AnimateSequence("Intro")
		var_1_10:AnimateSequence("Intro")
		var_1_12:AnimateSequence("Intro")
		var_1_14:AnimateSequence("Intro")
		var_1_16:AnimateSequence("Intro")
		var_1_18:AnimateSequence("Intro")
	end

	var_1_0._sequences.Intro = var_1_34

	return var_1_0
end

MenuBuilder.registerType("AARRankUpItem", AARRankUpItem)
LockTable(_M)
