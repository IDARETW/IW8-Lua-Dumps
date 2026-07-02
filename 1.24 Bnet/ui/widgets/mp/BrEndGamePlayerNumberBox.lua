module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0, "InitIntro")
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.PlayerNumber:SetPixelGridEnabled(true)
	arg_2_0.PlayerNumber:SetPixelGridContrast(0.2, 0)
	arg_2_0.PlayerNumber:SetPixelGridBlockWidth(2, 0)
	arg_2_0.PlayerNumber:SetPixelGridBlockHeight(2, 0)
	arg_2_0.PlayerNumber:SetPixelGridGutterWidth(1, 0)
	arg_2_0.PlayerNumber:SetPixelGridGutterHeight(1, 0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._placementNum = arg_3_1

	arg_3_0.PlayerNumber:setText(Engine.JCBDICCAH(arg_3_1))
	arg_3_0.PlayerNumberSuffix:setText(arg_3_2)

	local var_3_0 = LAYOUT.GetTextWidth(arg_3_0.PlayerNumber) / 2
	local var_3_1 = LAYOUT.GetElementWidth(arg_3_0.PlayerNumberSuffix)
	local var_3_2 = -4 * _1080p

	arg_3_0.PlayerNumberSuffix:SetLeft(var_3_0 + var_3_2)
	arg_3_0.PlayerNumberSuffix:SetRight(var_3_0 + var_3_1 + var_3_2)
end

local function var_0_3(arg_4_0)
	ACTIONS.AnimateSequence(arg_4_0, "Intro")
	ACTIONS.AnimateSequence(arg_4_0, "IntroSlam")

	if arg_4_0._placementNum == 1 then
		Engine.BJDBIAGIDA(SOUND_SETS.brAAR.firstPlace)
	elseif arg_4_0._placementNum == 2 then
		Engine.BJDBIAGIDA(SOUND_SETS.brAAR.secondPlace)
	elseif arg_4_0._placementNum == 3 then
		Engine.BJDBIAGIDA(SOUND_SETS.brAAR.thirdPlace)
	else
		Engine.BJDBIAGIDA(SOUND_SETS.brAAR.genericPlace)
	end
end

function PostLoadFunc(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.InitIntroState = var_0_0
	arg_5_0.SetPlayerNumber = var_0_2
	arg_5_0.PlayIntro = var_0_3
	arg_5_0._placementNum = 0

	var_0_1(arg_5_0, arg_5_1)
end

function BrEndGamePlayerNumberBox(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 330 * _1080p, 0, 330 * _1080p)

	var_6_0.id = "BrEndGamePlayerNumberBox"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "grid"

	var_6_4:SetRGBFromInt(7985663, 0)
	var_6_4:SetAlpha(0.1, 0)
	var_6_4:SetPixelGridEnabled(true)
	var_6_4:SetPixelGridContrast(0.5, 0)
	var_6_4:SetPixelGridBlockWidth(2, 0)
	var_6_4:SetPixelGridBlockHeight(2, 0)
	var_6_4:SetPixelGridGutterWidth(1, 0)
	var_6_4:SetPixelGridGutterHeight(1, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 39, _1080p * 286, _1080p * 305, _1080p * 49)
	var_6_0:addElement(var_6_4)

	var_6_0.grid = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "PlayerNumberBorderTopL"

	var_6_6:SetRGBFromInt(7985663, 0)
	var_6_6:SetAlpha(0.6, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 39, _1080p * 286, _1080p * 313, _1080p * 323)
	var_6_0:addElement(var_6_6)

	var_6_0.PlayerNumberBorderTopL = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "PlayerNumberBorderTopL2"

	var_6_8:SetRGBFromInt(7985663, 0)
	var_6_8:SetAlpha(0.5, 0)
	var_6_8:SetZRotation(90, 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 38, _1080p * 285, _1080p * 299)
	var_6_0:addElement(var_6_8)

	var_6_0.PlayerNumberBorderTopL2 = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIText.new()

	var_6_10.id = "PlayerNumberTitle"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_10:setText(Engine.CBBHFCGDIC("MENU/YOU_PLACED"), 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Center)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -165, _1080p * 165, 0, _1080p * 36)
	var_6_0:addElement(var_6_10)

	var_6_0.PlayerNumberTitle = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIStyledText.new()

	var_6_12.id = "PlayerNumber"

	var_6_12:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_6_12:setText("100", 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_12:SetWordWrap(false)
	var_6_12:SetAlignment(LUI.Alignment.Center)
	var_6_12:SetShadowMinDistance(-0.6, 0)
	var_6_12:SetShadowMaxDistance(0.9, 0)
	var_6_12:SetShadowRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -165, _1080p * 165, _1080p * 110, _1080p * 238)
	var_6_0:addElement(var_6_12)

	var_6_0.PlayerNumber = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIText.new()

	var_6_14.id = "PlayerNumberSuffix"

	var_6_14:SetRGBFromInt(7985663, 0)
	var_6_14:SetAlpha(0.65, 0)
	var_6_14:setText("th", 0)
	var_6_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_14:SetWordWrap(false)
	var_6_14:SetAlignment(LUI.Alignment.Left)
	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 91, _1080p * 129, _1080p * 130, _1080p * 158)
	var_6_0:addElement(var_6_14)

	var_6_0.PlayerNumberSuffix = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIImage.new()

	var_6_16.id = "bottomRight"

	var_6_16:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
	var_6_16:setImage(RegisterMaterial("menu_roundend_bracket"), 0)
	var_6_16:SetUMin(1, 0)
	var_6_16:SetUMax(0, 0)
	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 224, _1080p * 288, _1080p * 243, _1080p * 307)
	var_6_0:addElement(var_6_16)

	var_6_0.bottomRight = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIImage.new()

	var_6_18.id = "topRight"

	var_6_18:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
	var_6_18:setImage(RegisterMaterial("menu_roundend_bracket"), 0)
	var_6_18:SetUMin(1, 0)
	var_6_18:SetUMax(0, 0)
	var_6_18:SetVMin(1, 0)
	var_6_18:SetVMax(0, 0)
	var_6_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 224, _1080p * 288, _1080p * 47, _1080p * 111)
	var_6_0:addElement(var_6_18)

	var_6_0.topRight = var_6_18

	local var_6_19
	local var_6_20 = LUI.UIImage.new()

	var_6_20.id = "topLeft"

	var_6_20:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
	var_6_20:setImage(RegisterMaterial("menu_roundend_bracket"), 0)
	var_6_20:SetVMin(1, 0)
	var_6_20:SetVMax(0, 0)
	var_6_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 37, _1080p * 101, _1080p * 47, _1080p * 111)
	var_6_0:addElement(var_6_20)

	var_6_0.topLeft = var_6_20

	local var_6_21
	local var_6_22 = LUI.UIImage.new()

	var_6_22.id = "bottomLeft"

	var_6_22:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
	var_6_22:setImage(RegisterMaterial("menu_roundend_bracket"), 0)
	var_6_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 37, _1080p * 101, _1080p * 243, _1080p * 307)
	var_6_0:addElement(var_6_22)

	var_6_0.bottomLeft = var_6_22

	local var_6_23
	local var_6_24 = LUI.UIImage.new()

	var_6_24.id = "LineLeft"

	var_6_24:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_6_24:SetAlpha(0, 0)
	var_6_24:SetZRotation(45, 0)
	var_6_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 101, _1080p * 278, _1080p * 279)
	var_6_0:addElement(var_6_24)

	var_6_0.LineLeft = var_6_24

	local var_6_25
	local var_6_26 = LUI.UIImage.new()

	var_6_26.id = "LineRight"

	var_6_26:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_6_26:SetAlpha(0, 0)
	var_6_26:SetZRotation(45, 0)
	var_6_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 225, _1080p * 297, _1080p * 73, _1080p * 74)
	var_6_0:addElement(var_6_26)

	var_6_0.LineRight = var_6_26

	local function var_6_27()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_27

	local var_6_28
	local var_6_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 286
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 39
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 286
		}
	}

	var_6_6:RegisterAnimationSequence("Intro", var_6_29)

	local var_6_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 275
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 289
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 38
		},
		{
			value = 0,
			duration = 130,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 285
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 299
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 38
		}
	}

	var_6_8:RegisterAnimationSequence("Intro", var_6_30)

	local var_6_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Intro", var_6_31)

	local var_6_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("Intro", var_6_32)

	local var_6_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 233
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 278
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 224
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 288
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 243
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 307
		}
	}

	var_6_16:RegisterAnimationSequence("Intro", var_6_33)

	local var_6_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 278
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 121
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 47
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 111
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 224
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 288
		}
	}

	var_6_18:RegisterAnimationSequence("Intro", var_6_34)

	local var_6_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 123
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 101
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 49
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 113
		}
	}

	var_6_20:RegisterAnimationSequence("Intro", var_6_35)

	local var_6_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 233
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 111
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 101
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 243
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 307
		}
	}

	var_6_22:RegisterAnimationSequence("Intro", var_6_36)

	local var_6_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_24:RegisterAnimationSequence("Intro", var_6_37)

	local var_6_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_26:RegisterAnimationSequence("Intro", var_6_38)

	local function var_6_39()
		var_6_6:AnimateSequence("Intro")
		var_6_8:AnimateSequence("Intro")
		var_6_12:AnimateSequence("Intro")
		var_6_14:AnimateSequence("Intro")
		var_6_16:AnimateSequence("Intro")
		var_6_18:AnimateSequence("Intro")
		var_6_20:AnimateSequence("Intro")
		var_6_22:AnimateSequence("Intro")
		var_6_24:AnimateSequence("Intro")
		var_6_26:AnimateSequence("Intro")
	end

	var_6_0._sequences.Intro = var_6_39

	local var_6_40
	local var_6_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 286
		}
	}

	var_6_6:RegisterAnimationSequence("InitIntro", var_6_41)

	local var_6_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 275
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 289
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 38
		}
	}

	var_6_8:RegisterAnimationSequence("InitIntro", var_6_42)

	local var_6_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("InitIntro", var_6_43)

	local var_6_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("InitIntro", var_6_44)

	local var_6_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 233
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 278
		}
	}

	var_6_16:RegisterAnimationSequence("InitIntro", var_6_45)

	local var_6_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 278
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 121
		}
	}

	var_6_18:RegisterAnimationSequence("InitIntro", var_6_46)

	local var_6_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 123
		}
	}

	var_6_20:RegisterAnimationSequence("InitIntro", var_6_47)

	local var_6_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 233
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 111
		}
	}

	var_6_22:RegisterAnimationSequence("InitIntro", var_6_48)

	local function var_6_49()
		var_6_6:AnimateSequence("InitIntro")
		var_6_8:AnimateSequence("InitIntro")
		var_6_12:AnimateSequence("InitIntro")
		var_6_14:AnimateSequence("InitIntro")
		var_6_16:AnimateSequence("InitIntro")
		var_6_18:AnimateSequence("InitIntro")
		var_6_20:AnimateSequence("InitIntro")
		var_6_22:AnimateSequence("InitIntro")
	end

	var_6_0._sequences.InitIntro = var_6_49

	local var_6_50
	local var_6_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 600,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 2,
			duration = 50,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuintic
		}
	}

	var_6_12:RegisterAnimationSequence("IntroSlam", var_6_51)

	local var_6_52 = {
		{
			value = 0,
			duration = 650,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.65,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("IntroSlam", var_6_52)

	local function var_6_53()
		var_6_12:AnimateSequence("IntroSlam")
		var_6_14:AnimateSequence("IntroSlam")
	end

	var_6_0._sequences.IntroSlam = var_6_53

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("BrEndGamePlayerNumberBox", BrEndGamePlayerNumberBox)
LockTable(_M)
