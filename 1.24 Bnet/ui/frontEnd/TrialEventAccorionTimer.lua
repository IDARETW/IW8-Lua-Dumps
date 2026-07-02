module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = tonumber(Engine.DCJHCAFIIA())
	local var_1_1 = TRIALS.GetNextStartingTrialEventTime()
	local var_1_2 = false

	if var_1_1 == nil then
		var_1_2 = true
		var_1_1 = Dvar.CFHDGABACF("MOKTSOLQMP")
	end

	local var_1_3 = var_1_1 - var_1_0

	arg_1_0.Time:setEndTime(Engine.BFBIDEGDFB() + var_1_3 * 1000)

	if var_1_3 > 86400 then
		if var_1_2 then
			arg_1_0.Time:SetCustomFormat("TRIALEVENT/TIMER_ENDS_IN_DAYS")
		else
			arg_1_0.Time:SetCustomFormat("TRIALEVENT/TIMER_NEXT_IN_DAYS")
		end

		arg_1_0.Time:SetCustomFormatType(LUI.UICountdown.CustomFormatType.DAYHRMIN)
	else
		if var_1_2 then
			arg_1_0.Time:SetCustomFormat("TRIALEVENT/TIMER_ENDS_IN_HOURS")
		else
			arg_1_0.Time:SetCustomFormat("TRIALEVENT/TIMER_NEXT_IN_HOURS")
		end

		arg_1_0.Time:SetCustomFormatType(LUI.UICountdown.CustomFormatType.HRMINSEC)
	end

	arg_1_0.Time:useLocalizedFormat()
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetEndTime = var_0_0
end

function TrialEventAccorionTimer(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 154 * _1080p, 0, 30 * _1080p)

	var_3_0.id = "TrialEventAccorionTimer"
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

	var_3_4.id = "Backer"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_3_4:SetPixelGridEnabled(true)
	var_3_4:SetPixelGridContrast(0.5, 0)
	var_3_4:SetPixelGridBlockWidth(2, 0)
	var_3_4:SetPixelGridBlockHeight(2, 0)
	var_3_4:SetPixelGridGutterWidth(1, 0)
	var_3_4:SetPixelGridGutterHeight(1, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Highlight"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 6, 0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Highlight = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "FullText"

	var_3_8:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_3_8:SetAlpha(0, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("TOURNAMENT/REGISTRATION_CUTOFF"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 10, _1080p * 80, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_8)

	var_3_0.FullText = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Time"

	var_3_10:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Right)
	var_3_10:setEndTime(0)
	var_3_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -4, _1080p * -10, _1080p * 10)
	var_3_0:addElement(var_3_10)

	var_3_0.Time = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_13)

	local var_3_14 = {
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

	var_3_6:RegisterAnimationSequence("AR", var_3_14)

	local function var_3_15()
		var_3_4:AnimateSequence("AR")
		var_3_6:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Off", var_3_17)

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Off", var_3_18)

	local function var_3_19()
		var_3_4:AnimateSequence("Off")
		var_3_8:AnimateSequence("Off")
	end

	var_3_0._sequences.Off = var_3_19

	local var_3_20
	local var_3_21 = {
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

	var_3_4:RegisterAnimationSequence("LeftAligned", var_3_21)

	local var_3_22 = {
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

	var_3_6:RegisterAnimationSequence("LeftAligned", var_3_22)

	local var_3_23 = {
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

	var_3_8:RegisterAnimationSequence("LeftAligned", var_3_23)

	local function var_3_24()
		var_3_4:AnimateSequence("LeftAligned")
		var_3_6:AnimateSequence("LeftAligned")
		var_3_8:AnimateSequence("LeftAligned")
	end

	var_3_0._sequences.LeftAligned = var_3_24

	local var_3_25
	local var_3_26 = {
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

	var_3_4:RegisterAnimationSequence("RightAligned", var_3_26)

	local var_3_27 = {
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

	var_3_6:RegisterAnimationSequence("RightAligned", var_3_27)

	local var_3_28 = {
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

	var_3_8:RegisterAnimationSequence("RightAligned", var_3_28)

	local function var_3_29()
		var_3_4:AnimateSequence("RightAligned")
		var_3_6:AnimateSequence("RightAligned")
		var_3_8:AnimateSequence("RightAligned")
	end

	var_3_0._sequences.RightAligned = var_3_29

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TrialEventAccorionTimer", TrialEventAccorionTimer)
LockTable(_M)
