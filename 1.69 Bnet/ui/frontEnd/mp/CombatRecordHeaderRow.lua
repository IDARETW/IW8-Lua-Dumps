module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if #arg_1_1 == 2 then
		ACTIONS.AnimateSequence(arg_1_0, "TwoRow")
	elseif #arg_1_1 == 5 then
		ACTIONS.AnimateSequence(arg_1_0, "FiveRow")
	elseif #arg_1_1 == 6 then
		ACTIONS.AnimateSequence(arg_1_0, "SixRow")
	elseif #arg_1_1 == 7 then
		ACTIONS.AnimateSequence(arg_1_0, "SevenRow")
	else
		assert(false, "Trying to use an unsupported number of header strings.")
	end

	for iter_1_0, iter_1_1 in ipairs(arg_1_1) do
		assert(arg_1_0["Field" .. iter_1_0])
		arg_1_0["Field" .. iter_1_0]:setText(ToUpperCase(Engine.CBBHFCGDIC(iter_1_1)))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupHeader = var_0_0
end

function CombatRecordHeaderRow(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 39 * _1080p)

	var_3_0.id = "CombatRecordHeaderRow"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIBlur.new()

	var_3_4.id = "ListBlur"

	var_3_4:SetBlurStrength(1.5, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.ListBlur = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Background"

	var_3_6:SetRGBFromInt(0, 0)
	var_3_6:SetAlpha(0.8, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Background = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Field1"

	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetStartupDelay(1000)
	var_3_8:SetLineHoldTime(400)
	var_3_8:SetAnimMoveTime(150)
	var_3_8:SetEndDelay(1000)
	var_3_8:SetCrossfadeTime(400)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_8:SetMaxVisibleLines(1)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 230, _1080p * 8, _1080p * 28)
	var_3_0:addElement(var_3_8)

	var_3_0.Field1 = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Field2"

	var_3_10:SetRGBFromTable(SWATCHES.combatRecord.upRow, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetStartupDelay(1000)
	var_3_10:SetLineHoldTime(400)
	var_3_10:SetAnimMoveTime(150)
	var_3_10:SetEndDelay(1000)
	var_3_10:SetCrossfadeTime(400)
	var_3_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_10:SetMaxVisibleLines(1)
	var_3_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -758, _1080p * -644, _1080p * 8, _1080p * 28)
	var_3_0:addElement(var_3_10)

	var_3_0.Field2 = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "Field3"

	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetStartupDelay(1000)
	var_3_12:SetLineHoldTime(400)
	var_3_12:SetAnimMoveTime(150)
	var_3_12:SetEndDelay(1000)
	var_3_12:SetCrossfadeTime(400)
	var_3_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_12:SetMaxVisibleLines(1)
	var_3_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -631, _1080p * -517, _1080p * 8, _1080p * 28)
	var_3_0:addElement(var_3_12)

	var_3_0.Field3 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "Field4"

	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetStartupDelay(1000)
	var_3_14:SetLineHoldTime(400)
	var_3_14:SetAnimMoveTime(150)
	var_3_14:SetEndDelay(1000)
	var_3_14:SetCrossfadeTime(400)
	var_3_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_14:SetMaxVisibleLines(1)
	var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -505, _1080p * -391, _1080p * 8, _1080p * 28)
	var_3_0:addElement(var_3_14)

	var_3_0.Field4 = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIStyledText.new()

	var_3_16.id = "Field5"

	var_3_16:setText("", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Center)
	var_3_16:SetStartupDelay(1000)
	var_3_16:SetLineHoldTime(400)
	var_3_16:SetAnimMoveTime(150)
	var_3_16:SetEndDelay(1000)
	var_3_16:SetCrossfadeTime(400)
	var_3_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_16:SetMaxVisibleLines(1)
	var_3_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -379, _1080p * -265, _1080p * 8, _1080p * 28)
	var_3_0:addElement(var_3_16)

	var_3_0.Field5 = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "Field6"

	var_3_18:setText("", 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Center)
	var_3_18:SetStartupDelay(1000)
	var_3_18:SetLineHoldTime(400)
	var_3_18:SetAnimMoveTime(150)
	var_3_18:SetEndDelay(1000)
	var_3_18:SetCrossfadeTime(400)
	var_3_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_18:SetMaxVisibleLines(1)
	var_3_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -253, _1080p * -139, _1080p * 8, _1080p * 28)
	var_3_0:addElement(var_3_18)

	var_3_0.Field6 = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIStyledText.new()

	var_3_20.id = "Field7"

	var_3_20:setText("", 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_20:SetAlignment(LUI.Alignment.Center)
	var_3_20:SetStartupDelay(1000)
	var_3_20:SetLineHoldTime(400)
	var_3_20:SetAnimMoveTime(150)
	var_3_20:SetEndDelay(1000)
	var_3_20:SetCrossfadeTime(400)
	var_3_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_20:SetMaxVisibleLines(1)
	var_3_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -127, _1080p * -13, _1080p * 8, _1080p * 28)
	var_3_0:addElement(var_3_20)

	var_3_0.Field7 = var_3_20

	local function var_3_21()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_21

	local var_3_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -758
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -580
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_10:RegisterAnimationSequence("FiveRow", var_3_22)

	local var_3_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -568
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -392
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_12:RegisterAnimationSequence("FiveRow", var_3_23)

	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -379
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -203
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_14:RegisterAnimationSequence("FiveRow", var_3_24)

	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_16:RegisterAnimationSequence("FiveRow", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("FiveRow", var_3_26)

	local var_3_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("FiveRow", var_3_27)

	local function var_3_28()
		var_3_10:AnimateSequence("FiveRow")
		var_3_12:AnimateSequence("FiveRow")
		var_3_14:AnimateSequence("FiveRow")
		var_3_16:AnimateSequence("FiveRow")
		var_3_18:AnimateSequence("FiveRow")
		var_3_20:AnimateSequence("FiveRow")
	end

	var_3_0._sequences.FiveRow = var_3_28

	local var_3_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -758
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -644
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_10:RegisterAnimationSequence("SevenRow", var_3_29)

	local var_3_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -631
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -517
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_12:RegisterAnimationSequence("SevenRow", var_3_30)

	local var_3_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -505
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -391
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_14:RegisterAnimationSequence("SevenRow", var_3_31)

	local var_3_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -379
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_16:RegisterAnimationSequence("SevenRow", var_3_32)

	local var_3_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -253
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -139
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_18:RegisterAnimationSequence("SevenRow", var_3_33)

	local var_3_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -127
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_20:RegisterAnimationSequence("SevenRow", var_3_34)

	local function var_3_35()
		var_3_10:AnimateSequence("SevenRow")
		var_3_12:AnimateSequence("SevenRow")
		var_3_14:AnimateSequence("SevenRow")
		var_3_16:AnimateSequence("SevenRow")
		var_3_18:AnimateSequence("SevenRow")
		var_3_20:AnimateSequence("SevenRow")
	end

	var_3_0._sequences.SevenRow = var_3_35

	local var_3_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
		},
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
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_8:RegisterAnimationSequence("SixRow", var_3_36)

	local var_3_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -758
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -617
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_10:RegisterAnimationSequence("SixRow", var_3_37)

	local var_3_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -607
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -466
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_12:RegisterAnimationSequence("SixRow", var_3_38)

	local var_3_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -456
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -315
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_14:RegisterAnimationSequence("SixRow", var_3_39)

	local var_3_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -305
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -164
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_16:RegisterAnimationSequence("SixRow", var_3_40)

	local var_3_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -154
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_18:RegisterAnimationSequence("SixRow", var_3_41)

	local var_3_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("SixRow", var_3_42)

	local function var_3_43()
		var_3_8:AnimateSequence("SixRow")
		var_3_10:AnimateSequence("SixRow")
		var_3_12:AnimateSequence("SixRow")
		var_3_14:AnimateSequence("SixRow")
		var_3_16:AnimateSequence("SixRow")
		var_3_18:AnimateSequence("SixRow")
		var_3_20:AnimateSequence("SixRow")
	end

	var_3_0._sequences.SixRow = var_3_43

	local var_3_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -339
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_3_10:RegisterAnimationSequence("TwoRow", var_3_44)

	local var_3_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("TwoRow", var_3_45)

	local var_3_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("TwoRow", var_3_46)

	local var_3_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("TwoRow", var_3_47)

	local var_3_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("TwoRow", var_3_48)

	local var_3_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("TwoRow", var_3_49)

	local function var_3_50()
		var_3_10:AnimateSequence("TwoRow")
		var_3_12:AnimateSequence("TwoRow")
		var_3_14:AnimateSequence("TwoRow")
		var_3_16:AnimateSequence("TwoRow")
		var_3_18:AnimateSequence("TwoRow")
		var_3_20:AnimateSequence("TwoRow")
	end

	var_3_0._sequences.TwoRow = var_3_50

	var_3_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CombatRecordHeaderRow", CombatRecordHeaderRow)
LockTable(_M)
