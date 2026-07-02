module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = GetCurrentLanguage()

	if GenerallyLongLanguages[var_1_0] then
		ACTIONS.AnimateSequence(arg_1_0, "SmallerLabels")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.AdjustLabelSizes = var_0_0

	arg_2_0.AdjustLabelSizes(arg_2_0)
end

function XPBoostElement(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 188 * _1080p, 0, 195 * _1080p)

	var_3_0.id = "XPBoostElement"
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

	var_3_4.id = "WZWipBacker"

	var_3_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -67, _1080p * -27)
	var_3_0:addElement(var_3_4)

	var_3_0.WZWipBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Image"

	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -55.5, _1080p * 54.5, 0, _1080p * 110)
	var_3_0:addElement(var_3_6)

	var_3_0.Image = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Desc1"

	var_3_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_8:SetStartupDelay(1000)
	var_3_8:SetLineHoldTime(400)
	var_3_8:SetAnimMoveTime(750)
	var_3_8:SetAnimMoveSpeed(50)
	var_3_8:SetEndDelay(1000)
	var_3_8:SetCrossfadeTime(400)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(1)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, _1080p * -5, _1080p * 143, _1080p * 161)
	var_3_0:addElement(var_3_8)

	var_3_0.Desc1 = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Desc2"

	var_3_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetWordWrap(false)
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_10:SetStartupDelay(1000)
	var_3_10:SetLineHoldTime(400)
	var_3_10:SetAnimMoveTime(750)
	var_3_10:SetAnimMoveSpeed(50)
	var_3_10:SetEndDelay(1000)
	var_3_10:SetCrossfadeTime(400)
	var_3_10:SetFadeInTime(300)
	var_3_10:SetFadeOutTime(300)
	var_3_10:SetMaxVisibleLines(1)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, _1080p * -5, _1080p * 161, _1080p * 179)
	var_3_0:addElement(var_3_10)

	var_3_0.Desc2 = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "Desc3"

	var_3_12:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetWordWrap(false)
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_12:SetStartupDelay(1000)
	var_3_12:SetLineHoldTime(400)
	var_3_12:SetAnimMoveTime(750)
	var_3_12:SetAnimMoveSpeed(50)
	var_3_12:SetEndDelay(1000)
	var_3_12:SetCrossfadeTime(400)
	var_3_12:SetFadeInTime(300)
	var_3_12:SetFadeOutTime(300)
	var_3_12:SetMaxVisibleLines(1)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, _1080p * -5, _1080p * 179, _1080p * 197)
	var_3_0:addElement(var_3_12)

	var_3_0.Desc3 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "Title"

	var_3_14:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_14:SetWordWrap(false)
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_14:SetStartupDelay(1000)
	var_3_14:SetLineHoldTime(400)
	var_3_14:SetAnimMoveTime(750)
	var_3_14:SetAnimMoveSpeed(50)
	var_3_14:SetEndDelay(1000)
	var_3_14:SetCrossfadeTime(400)
	var_3_14:SetFadeInTime(300)
	var_3_14:SetFadeOutTime(300)
	var_3_14:SetMaxVisibleLines(1)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, _1080p * -5, _1080p * 123, _1080p * 141)
	var_3_0:addElement(var_3_14)

	var_3_0.Title = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 141
		}
	}

	var_3_8:RegisterAnimationSequence("SmallerLabels", var_3_17)

	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 173
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 157
		}
	}

	var_3_10:RegisterAnimationSequence("SmallerLabels", var_3_18)

	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 173
		}
	}

	var_3_12:RegisterAnimationSequence("SmallerLabels", var_3_19)

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 139
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 123
		}
	}

	var_3_14:RegisterAnimationSequence("SmallerLabels", var_3_20)

	local function var_3_21()
		var_3_8:AnimateSequence("SmallerLabels")
		var_3_10:AnimateSequence("SmallerLabels")
		var_3_12:AnimateSequence("SmallerLabels")
		var_3_14:AnimateSequence("SmallerLabels")
	end

	var_3_0._sequences.SmallerLabels = var_3_21

	local var_3_22
	local var_3_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		}
	}

	var_3_4:RegisterAnimationSequence("Show2Desc", var_3_23)

	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 143
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_3_8:RegisterAnimationSequence("Show2Desc", var_3_24)

	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 161
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 179
		}
	}

	var_3_10:RegisterAnimationSequence("Show2Desc", var_3_25)

	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 179
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 197
		}
	}

	var_3_12:RegisterAnimationSequence("Show2Desc", var_3_26)

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 141
		}
	}

	var_3_14:RegisterAnimationSequence("Show2Desc", var_3_27)

	local function var_3_28()
		var_3_4:AnimateSequence("Show2Desc")
		var_3_8:AnimateSequence("Show2Desc")
		var_3_10:AnimateSequence("Show2Desc")
		var_3_12:AnimateSequence("Show2Desc")
		var_3_14:AnimateSequence("Show2Desc")
	end

	var_3_0._sequences.Show2Desc = var_3_28

	local var_3_29
	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -67
		}
	}

	var_3_4:RegisterAnimationSequence("Show3Desc", var_3_30)

	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 143
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_3_8:RegisterAnimationSequence("Show3Desc", var_3_31)

	local var_3_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 161
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 179
		}
	}

	var_3_10:RegisterAnimationSequence("Show3Desc", var_3_32)

	local var_3_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 181
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 199
		}
	}

	var_3_12:RegisterAnimationSequence("Show3Desc", var_3_33)

	local var_3_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 141
		}
	}

	var_3_14:RegisterAnimationSequence("Show3Desc", var_3_34)

	local function var_3_35()
		var_3_4:AnimateSequence("Show3Desc")
		var_3_8:AnimateSequence("Show3Desc")
		var_3_10:AnimateSequence("Show3Desc")
		var_3_12:AnimateSequence("Show3Desc")
		var_3_14:AnimateSequence("Show3Desc")
	end

	var_3_0._sequences.Show3Desc = var_3_35

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("XPBoostElement", XPBoostElement)
LockTable(_M)
