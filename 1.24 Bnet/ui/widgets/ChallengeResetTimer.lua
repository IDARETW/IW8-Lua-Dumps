module(..., package.seeall)

local function var_0_0(arg_1_0)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
		LAYOUT.SetTextBoxSize(arg_1_0.Text, arg_1_0.Backer, arg_1_0.Text:getText(), 9, nil, LUI.Alignment.Left, 0)

		local var_1_0, var_1_1, var_1_2, var_1_3 = arg_1_0.Backer:getLocalRect()

		arg_1_0.Highlight:SetRight(var_1_2)
		arg_1_0.Highlight:SetLeft(var_1_2 - 6 * _1080p)
	else
		local var_1_4 = LAYOUT.GetTextWidth(arg_1_0.Text)

		if arg_1_0._isLeftAligned then
			LAYOUT.SetTextBoxSize(arg_1_0.Text, arg_1_0.Backer, arg_1_0.Text:getText(), 4, nil, LUI.Alignment.Left, 0)
		else
			arg_1_0.Backer:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -135, 0, 0, 0)
		end

		local var_1_5, var_1_6, var_1_7, var_1_8 = arg_1_0.Backer:getLocalRect()

		arg_1_0.Highlight:SetLeft(var_1_5)
		arg_1_0.Highlight:SetRight(var_1_5 + 6 * _1080p)
	end
end

local function var_0_1(arg_2_0)
	arg_2_0._isLeftAligned = false

	ACTIONS.AnimateSequence(arg_2_0, "RightAligned")
	var_0_0(arg_2_0)
end

local function var_0_2(arg_3_0)
	arg_3_0._isLeftAligned = true

	ACTIONS.AnimateSequence(arg_3_0, "LeftAligned")
	var_0_0(arg_3_0)
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0.Text:setText(arg_4_1)
	var_0_0()
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._isLeftAligned = true
	arg_5_0.SetupAlignment = var_0_0
	arg_5_0.SetupRightAlignment = var_0_1
	arg_5_0.SetupLeftAlignment = var_0_2
	arg_5_0.SetTimer = var_0_3

	arg_5_0:SetupAlignment()
end

function ChallengeResetTimer(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 78 * _1080p, 0, 30 * _1080p)

	var_6_0.id = "ChallengeResetTimer"
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

	var_6_4.id = "Backer"

	var_6_4:SetRGBFromTable(SWATCHES.genericMenu.warningDark, 0)
	var_6_4:SetPixelGridEnabled(true)
	var_6_4:SetPixelGridContrast(0.5, 0)
	var_6_4:SetPixelGridBlockWidth(2, 0)
	var_6_4:SetPixelGridBlockHeight(2, 0)
	var_6_4:SetPixelGridGutterWidth(1, 0)
	var_6_4:SetPixelGridGutterHeight(1, 0)
	var_6_4:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -78, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Backer = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Highlight"

	var_6_6:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_6_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -78, _1080p * -72, 0, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.Highlight = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "Text"

	var_6_8:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetWordWrap(false)
	var_6_8:SetAlignment(LUI.Alignment.Right)
	var_6_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_8:SetTintFontIcons(true)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 34, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_8)

	var_6_0.Text = var_6_8

	local function var_6_9()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_9

	local var_6_10
	local var_6_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -78
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_6_4:RegisterAnimationSequence("AR", var_6_11)

	local var_6_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -6
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_6_6:RegisterAnimationSequence("AR", var_6_12)

	local var_6_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_6_8:RegisterAnimationSequence("AR", var_6_13)

	local function var_6_14()
		var_6_4:AnimateSequence("AR")
		var_6_6:AnimateSequence("AR")
		var_6_8:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_14

	local var_6_15
	local var_6_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Off", var_6_16)

	local var_6_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Off", var_6_17)

	local function var_6_18()
		var_6_4:AnimateSequence("Off")
		var_6_8:AnimateSequence("Off")
	end

	var_6_0._sequences.Off = var_6_18

	local var_6_19
	local var_6_20 = {
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 78
		}
	}

	var_6_4:RegisterAnimationSequence("LeftAligned", var_6_20)

	local var_6_21 = {
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		}
	}

	var_6_6:RegisterAnimationSequence("LeftAligned", var_6_21)

	local var_6_22 = {
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
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_6_8:RegisterAnimationSequence("LeftAligned", var_6_22)

	local function var_6_23()
		var_6_4:AnimateSequence("LeftAligned")
		var_6_6:AnimateSequence("LeftAligned")
		var_6_8:AnimateSequence("LeftAligned")
	end

	var_6_0._sequences.LeftAligned = var_6_23

	local var_6_24
	local var_6_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -78
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_6_4:RegisterAnimationSequence("RightAligned", var_6_25)

	local var_6_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -72
		}
	}

	var_6_6:RegisterAnimationSequence("RightAligned", var_6_26)

	local var_6_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_6_8:RegisterAnimationSequence("RightAligned", var_6_27)

	local function var_6_28()
		var_6_4:AnimateSequence("RightAligned")
		var_6_6:AnimateSequence("RightAligned")
		var_6_8:AnimateSequence("RightAligned")
	end

	var_6_0._sequences.RightAligned = var_6_28

	local var_6_29
	local var_6_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Normal", var_6_30)

	local var_6_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Normal", var_6_31)

	local var_6_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy
		}
	}

	var_6_8:RegisterAnimationSequence("Normal", var_6_32)

	local function var_6_33()
		var_6_4:AnimateSequence("Normal")
		var_6_6:AnimateSequence("Normal")
		var_6_8:AnimateSequence("Normal")
	end

	var_6_0._sequences.Normal = var_6_33

	local var_6_34
	local var_6_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Warning", var_6_35)

	local var_6_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Warning", var_6_36)

	local var_6_37 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_8:RegisterAnimationSequence("Warning", var_6_37)

	local function var_6_38()
		var_6_4:AnimateSequence("Warning")
		var_6_6:AnimateSequence("Warning")
		var_6_8:AnimateSequence("Warning")
	end

	var_6_0._sequences.Warning = var_6_38

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ChallengeResetTimer", ChallengeResetTimer)
LockTable(_M)
