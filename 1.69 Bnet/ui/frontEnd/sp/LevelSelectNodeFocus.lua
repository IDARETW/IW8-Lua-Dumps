module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.MissionNumber:setText(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetMissionNum = var_0_0
	arg_2_0:Wait(200).onComplete = function()
		arg_2_0.LabelH1:setText("303")
		arg_2_0.LabelH2:setText("r/s 12/95 +")
	end
end

function LevelSelectNodeFocus(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 12 * _1080p, 0, 12 * _1080p)

	var_4_0.id = "LevelSelectNodeFocus"
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

	var_4_4.id = "Ghost"

	var_4_4:SetAlpha(0, 0)
	var_4_4:SetGlitchAmount(0.03, 0)
	var_4_4:setImage(RegisterMaterial("campaign_decoration_square_01"), 0)
	var_4_4:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -37, _1080p * 37, _1080p * -37, _1080p * 37)
	var_4_0:addElement(var_4_4)

	var_4_0.Ghost = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Backer"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_6:SetAlpha(0.35, 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -37, _1080p * 37, _1080p * -37, _1080p * 37)
	var_4_0:addElement(var_4_6)

	var_4_0.Backer = var_4_6

	local var_4_7
	local var_4_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_9 = LUI.UIBorder.new(var_4_8)

	var_4_9.id = "Border"

	var_4_9:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -37, _1080p * 37, _1080p * -37, _1080p * 37)
	var_4_0:addElement(var_4_9)

	var_4_0.Border = var_4_9

	local var_4_10
	local var_4_11 = LUI.UIImage.new()

	var_4_11.id = "DiagonalUR"

	var_4_11:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_11:SetZRotation(-45, 0)
	var_4_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 29, _1080p * 30, _1080p * -38.75, _1080p * -19)
	var_4_0:addElement(var_4_11)

	var_4_0.DiagonalUR = var_4_11

	local var_4_12
	local var_4_13 = LUI.UIImage.new()

	var_4_13.id = "DashH"

	var_4_13:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_13:SetAlpha(0.5, 0)
	var_4_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 40, _1080p * 60, _1080p * -37, _1080p * -30)
	var_4_0:addElement(var_4_13)

	var_4_0.DashH = var_4_13

	local var_4_14
	local var_4_15 = LUI.UIStyledText.new()

	var_4_15.id = "LabelH1"

	var_4_15:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_15:SetAlpha(0.75, 0)
	var_4_15:SetScale(-0.2, 0)
	var_4_15:SetGlitchAmount(0.01, 0)
	var_4_15:setText("303", 0)
	var_4_15:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_15:SetAlignment(LUI.Alignment.Left)
	var_4_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 38, _1080p * 62, _1080p * -32, _1080p * -14)
	var_4_0:addElement(var_4_15)

	var_4_0.LabelH1 = var_4_15

	local var_4_16
	local var_4_17 = LUI.UIImage.new()

	var_4_17.id = "DiagonalBL"

	var_4_17:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_17:SetZRotation(-45, 0)
	var_4_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * -29, _1080p * 20, _1080p * 39)
	var_4_0:addElement(var_4_17)

	var_4_0.DiagonalBL = var_4_17

	local var_4_18
	local var_4_19 = LUI.UIImage.new()

	var_4_19.id = "Box1"

	var_4_19:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_19:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 14, _1080p * 24, _1080p * -23, _1080p * -13)
	var_4_0:addElement(var_4_19)

	var_4_0.Box1 = var_4_19

	local var_4_20
	local var_4_21 = LUI.UIImage.new()

	var_4_21.id = "MissionBacker"

	var_4_21:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_21:SetAlpha(0.3, 0)
	var_4_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 9, _1080p * -9, _1080p * 23)
	var_4_0:addElement(var_4_21)

	var_4_0.MissionBacker = var_4_21

	local var_4_22
	local var_4_23 = LUI.UIStyledText.new()

	var_4_23.id = "MissionNumber"

	var_4_23:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_23:setText("99", 0)
	var_4_23:SetFont(FONTS.GetFont(FONTS.StreakRegular.File))
	var_4_23:SetAlignment(LUI.Alignment.Left)
	var_4_23:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 8, 0, _1080p * 18)
	var_4_0:addElement(var_4_23)

	var_4_0.MissionNumber = var_4_23

	local var_4_24
	local var_4_25 = LUI.UIStyledText.new()

	var_4_25.id = "LabelH2"

	var_4_25:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_25:SetAlpha(0.75, 0)
	var_4_25:SetScale(-0.2, 0)
	var_4_25:SetGlitchAmount(0.01, 0)
	var_4_25:setText("r/s 12/95 +", 0)
	var_4_25:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_25:SetAlignment(LUI.Alignment.Left)
	var_4_25:SetDecodeLetterLength(75)
	var_4_25:SetDecodeMaxRandChars(75)
	var_4_25:SetDecodeUpdatesPerLetter(75)
	var_4_25:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -46, _1080p * 46, _1080p * -55, _1080p * -37)
	var_4_0:addElement(var_4_25)

	var_4_0.LabelH2 = var_4_25

	local var_4_26
	local var_4_27 = LUI.UIImage.new()

	var_4_27.id = "DashV"

	var_4_27:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_27:SetAlpha(0.5, 0)
	var_4_27:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -43, _1080p * -39, _1080p * -37, _1080p * -27)
	var_4_0:addElement(var_4_27)

	var_4_0.DashV = var_4_27

	local var_4_28
	local var_4_29 = LUI.UIImage.new()

	var_4_29.id = "Cross"

	var_4_29:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_29:setImage(RegisterMaterial("hud_frame_cross"), 0)
	var_4_29:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * -38, _1080p * -37, _1080p * -31)
	var_4_0:addElement(var_4_29)

	var_4_0.Cross = var_4_29

	local var_4_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("DefaultSequence", var_4_30)

	local var_4_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("DefaultSequence", var_4_31)

	local var_4_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_11:RegisterAnimationSequence("DefaultSequence", var_4_32)

	local var_4_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_13:RegisterAnimationSequence("DefaultSequence", var_4_33)

	local var_4_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_15:RegisterAnimationSequence("DefaultSequence", var_4_34)

	local var_4_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_17:RegisterAnimationSequence("DefaultSequence", var_4_35)

	local var_4_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("DefaultSequence", var_4_36)

	local var_4_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("DefaultSequence", var_4_37)

	local var_4_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_23:RegisterAnimationSequence("DefaultSequence", var_4_38)

	local var_4_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_25:RegisterAnimationSequence("DefaultSequence", var_4_39)

	local var_4_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_27:RegisterAnimationSequence("DefaultSequence", var_4_40)

	local var_4_41 = {
		{
			value = 0,
			duration = 2100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_29:RegisterAnimationSequence("DefaultSequence", var_4_41)

	local function var_4_42()
		var_4_6:AnimateSequence("DefaultSequence")
		var_4_9:AnimateSequence("DefaultSequence")
		var_4_11:AnimateSequence("DefaultSequence")
		var_4_13:AnimateSequence("DefaultSequence")
		var_4_15:AnimateSequence("DefaultSequence")
		var_4_17:AnimateSequence("DefaultSequence")
		var_4_19:AnimateSequence("DefaultSequence")
		var_4_21:AnimateSequence("DefaultSequence")
		var_4_23:AnimateSequence("DefaultSequence")
		var_4_25:AnimateSequence("DefaultSequence")
		var_4_27:AnimateSequence("DefaultSequence")
		var_4_29:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_42

	local var_4_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -37,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 37,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0.35,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_6:RegisterAnimationSequence("Selected", var_4_43)

	local var_4_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -37,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 37,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_9:RegisterAnimationSequence("Selected", var_4_44)

	local var_4_45 = {
		{
			value = -0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 29,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38.75,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -19,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_11:RegisterAnimationSequence("Selected", var_4_45)

	local var_4_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_13:RegisterAnimationSequence("Selected", var_4_46)

	local var_4_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_15:RegisterAnimationSequence("Selected", var_4_47)

	local var_4_48 = {
		{
			value = -0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -29,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -30,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_17:RegisterAnimationSequence("Selected", var_4_48)

	local var_4_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
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
		}
	}

	var_4_19:RegisterAnimationSequence("Selected", var_4_49)

	local var_4_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -23,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 9,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_21:RegisterAnimationSequence("Selected", var_4_50)

	local var_4_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_23:RegisterAnimationSequence("Selected", var_4_51)

	local var_4_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_4_25:RegisterAnimationSequence("Selected", var_4_52)

	local var_4_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_27:RegisterAnimationSequence("Selected", var_4_53)

	local var_4_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_29:RegisterAnimationSequence("Selected", var_4_54)

	local function var_4_55()
		var_4_6:AnimateSequence("Selected")
		var_4_9:AnimateSequence("Selected")
		var_4_11:AnimateSequence("Selected")
		var_4_13:AnimateSequence("Selected")
		var_4_15:AnimateSequence("Selected")
		var_4_17:AnimateSequence("Selected")
		var_4_19:AnimateSequence("Selected")
		var_4_21:AnimateSequence("Selected")
		var_4_23:AnimateSequence("Selected")
		var_4_25:AnimateSequence("Selected")
		var_4_27:AnimateSequence("Selected")
		var_4_29:AnimateSequence("Selected")
	end

	var_4_0._sequences.Selected = var_4_55

	local var_4_56 = {
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -37
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 37
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		},
		{
			value = 0.25,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		},
		{
			value = 0,
			duration = 180,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Deselected", var_4_56)

	local var_4_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -37
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 37
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -37
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 37
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
		{
			value = 0,
			duration = 180,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("Deselected", var_4_57)

	local var_4_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 29
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -19
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38.75
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38.75
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -19
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 29
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 29
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38.75
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -19
		},
		{
			value = -0.9,
			duration = 180,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 180,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_4_11:RegisterAnimationSequence("Deselected", var_4_58)

	local var_4_59 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_13:RegisterAnimationSequence("Deselected", var_4_59)

	local var_4_60 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_15:RegisterAnimationSequence("Deselected", var_4_60)

	local var_4_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -30
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -30
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -29
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -30
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -29
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		},
		{
			value = -0.9,
			duration = 180,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			value = 0,
			duration = 180,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		}
	}

	var_4_17:RegisterAnimationSequence("Deselected", var_4_61)

	local var_4_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Deselected", var_4_62)

	local var_4_63 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -23
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 9
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23
		},
		{
			value = 0.3,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -23
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 9
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			value = 0,
			duration = 180,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Deselected", var_4_63)

	local var_4_64 = {
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_23:RegisterAnimationSequence("Deselected", var_4_64)

	local var_4_65 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_25:RegisterAnimationSequence("Deselected", var_4_65)

	local var_4_66 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_27:RegisterAnimationSequence("Deselected", var_4_66)

	local var_4_67 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Glitch_Amount
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_29:RegisterAnimationSequence("Deselected", var_4_67)

	local function var_4_68()
		var_4_6:AnimateSequence("Deselected")
		var_4_9:AnimateSequence("Deselected")
		var_4_11:AnimateSequence("Deselected")
		var_4_13:AnimateSequence("Deselected")
		var_4_15:AnimateSequence("Deselected")
		var_4_17:AnimateSequence("Deselected")
		var_4_19:AnimateSequence("Deselected")
		var_4_21:AnimateSequence("Deselected")
		var_4_23:AnimateSequence("Deselected")
		var_4_25:AnimateSequence("Deselected")
		var_4_27:AnimateSequence("Deselected")
		var_4_29:AnimateSequence("Deselected")
	end

	var_4_0._sequences.Deselected = var_4_68

	local var_4_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_23:RegisterAnimationSequence("MissionPulse", var_4_69)

	local function var_4_70()
		var_4_23:AnimateLoop("MissionPulse")
	end

	var_4_0._sequences.MissionPulse = var_4_70

	local var_4_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60,
			easing = LUI.EASING.snap
		},
		{
			duration = 600,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 40,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 4000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 40,
			easing = LUI.EASING.snap
		},
		{
			duration = 600,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 4180,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 66,
			easing = LUI.EASING.snap
		}
	}

	var_4_13:RegisterAnimationSequence("DashLoop", var_4_71)

	local var_4_72 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.75,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 4420,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.75,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.75,
			duration = 4780,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_4_15:RegisterAnimationSequence("DashLoop", var_4_72)

	local var_4_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -27
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37,
			easing = LUI.EASING.snap
		},
		{
			duration = 180,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -27,
			easing = LUI.EASING.snap
		},
		{
			duration = 600,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 27,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 600,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 4000,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 27,
			easing = LUI.EASING.snap
		},
		{
			duration = 4000,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37,
			easing = LUI.EASING.snap
		},
		{
			duration = 600,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 600,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -27,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 4180,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31,
			easing = LUI.EASING.snap
		},
		{
			duration = 4180,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -21,
			easing = LUI.EASING.snap
		}
	}

	var_4_27:RegisterAnimationSequence("DashLoop", var_4_73)

	local var_4_74 = {
		{
			value = 0,
			duration = 180,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 600,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 3280,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 4780,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_4_29:RegisterAnimationSequence("DashLoop", var_4_74)

	local function var_4_75()
		var_4_13:AnimateLoop("DashLoop")
		var_4_15:AnimateLoop("DashLoop")
		var_4_27:AnimateLoop("DashLoop")
		var_4_29:AnimateLoop("DashLoop")
	end

	var_4_0._sequences.DashLoop = var_4_75

	local var_4_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 48
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -49
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 55
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 52
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -44
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -55
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 49
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("FlashGhost", var_4_76)

	local function var_4_77()
		var_4_4:AnimateSequence("FlashGhost")
	end

	var_4_0._sequences.FlashGhost = var_4_77

	var_0_1(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("LevelSelectNodeFocus", LevelSelectNodeFocus)
LockTable(_M)
