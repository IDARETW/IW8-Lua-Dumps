module(..., package.seeall)

local var_0_0 = 84 * _1080p
local var_0_1 = 4 * _1080p

local function var_0_2(arg_1_0, arg_1_1)
	arg_1_0._showFullText = arg_1_1

	arg_1_0.Time:setEndTime(Tournament.EAIGGBFGDJ())

	local var_1_0 = arg_1_0:GetCurrentAnchorsAndPositions()

	arg_1_0.FullText:SetAlpha(arg_1_1 and 1 or 0)

	if arg_1_1 then
		local var_1_1 = LAYOUT.GetTextWidth(arg_1_0.FullText, controllerIndex)

		if IsLanguageArabic() then
			arg_1_0:SetRight(var_1_0.left + (var_1_1 + var_0_0 + var_0_1))
		else
			arg_1_0:SetLeft(var_1_0.right - (var_1_1 + var_0_0 + var_0_1))
		end
	elseif IsLanguageArabic() then
		arg_1_0:SetRight(var_1_0.left + (var_0_0 + var_0_1))
	else
		arg_1_0:SetLeft(var_1_0.right - (var_0_0 + var_0_1))
	end
end

local function var_0_3(arg_2_0, arg_2_1)
	local var_2_0

	if not arg_2_0._timerHandlerAdded then
		arg_2_0.Time:addEventHandler("timeout", function(arg_3_0, arg_3_1)
			arg_2_0.Time:Wait(1000).onComplete = function()
				arg_2_0:SetTimer(arg_2_0._showFullText)
			end
		end)

		arg_2_0._timerHandlerAdded = true
	end

	arg_2_0:SetTimer(arg_2_1)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetupRegistrationTimer = var_0_3
	arg_5_0.SetTimer = var_0_2

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end
end

function RegistrationTime(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 84 * _1080p, 0, 30 * _1080p)

	var_6_0.id = "RegistrationTime"
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

	var_6_4:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_6_4:SetPixelGridEnabled(true)
	var_6_4:SetPixelGridContrast(0.5, 0)
	var_6_4:SetPixelGridBlockWidth(2, 0)
	var_6_4:SetPixelGridBlockHeight(2, 0)
	var_6_4:SetPixelGridGutterWidth(1, 0)
	var_6_4:SetPixelGridGutterHeight(1, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Backer = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Highlight"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 6, 0, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.Highlight = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "FullText"

	var_6_8:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_6_8:SetAlpha(0, 0)
	var_6_8:setText(Engine.CBBHFCGDIC("TOURNAMENT/REGISTRATION_CUTOFF"), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetWordWrap(false)
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 10, _1080p * 80, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_8)

	var_6_0.FullText = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "Time"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Center)
	var_6_10:setEndTime(0)
	var_6_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -74, _1080p * -4, _1080p * -14, _1080p * 14)
	var_6_0:addElement(var_6_10)

	var_6_0.Time = var_6_10

	local function var_6_11()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_11

	local var_6_12 = {
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

	var_6_4:RegisterAnimationSequence("AR", var_6_12)

	local var_6_13 = {
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

	var_6_6:RegisterAnimationSequence("AR", var_6_13)

	local function var_6_14()
		var_6_4:AnimateSequence("AR")
		var_6_6:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_14

	local var_6_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Off", var_6_15)

	local var_6_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Off", var_6_16)

	local function var_6_17()
		var_6_4:AnimateSequence("Off")
		var_6_8:AnimateSequence("Off")
	end

	var_6_0._sequences.Off = var_6_17

	local var_6_18 = {
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

	var_6_4:RegisterAnimationSequence("LeftAligned", var_6_18)

	local var_6_19 = {
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

	var_6_6:RegisterAnimationSequence("LeftAligned", var_6_19)

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

	var_6_8:RegisterAnimationSequence("LeftAligned", var_6_20)

	local function var_6_21()
		var_6_4:AnimateSequence("LeftAligned")
		var_6_6:AnimateSequence("LeftAligned")
		var_6_8:AnimateSequence("LeftAligned")
	end

	var_6_0._sequences.LeftAligned = var_6_21

	local var_6_22 = {
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

	var_6_4:RegisterAnimationSequence("RightAligned", var_6_22)

	local var_6_23 = {
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

	var_6_6:RegisterAnimationSequence("RightAligned", var_6_23)

	local var_6_24 = {
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

	var_6_8:RegisterAnimationSequence("RightAligned", var_6_24)

	local function var_6_25()
		var_6_4:AnimateSequence("RightAligned")
		var_6_6:AnimateSequence("RightAligned")
		var_6_8:AnimateSequence("RightAligned")
	end

	var_6_0._sequences.RightAligned = var_6_25

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("RegistrationTime", RegistrationTime)
LockTable(_M)
