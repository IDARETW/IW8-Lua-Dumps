module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	assert(arg_1_0.Background)
	assert(arg_1_0.TimeRemaining)
	assert(arg_1_0.LimitedTime)

	local function var_1_0(arg_2_0)
		if arg_2_0 and arg_2_0 < STORE.LimitedTimeWarningThreshold then
			ACTIONS.AnimateSequence(arg_1_0, "LimitedTimeBundleWarning")
		else
			ACTIONS.AnimateSequence(arg_1_0, "LimitedTimeBundle")
		end
	end

	if arg_1_5 then
		STORE.RunTimer(arg_1_0, arg_1_1, arg_1_0.TimeRemaining, arg_1_2, arg_1_3, arg_1_4, var_1_0)
	else
		STORE.RunTimer(arg_1_0, arg_1_1, arg_1_0.TimeRemaining, arg_1_2, arg_1_3, arg_1_4)
	end

	local var_1_1 = _1080p * 15
	local var_1_2 = LAYOUT.GetTextWidth(arg_1_0.TimeRemaining)
	local var_1_3 = LAYOUT.GetTextWidth(arg_1_0.LimitedTime)
	local var_1_4, var_1_5, var_1_6, var_1_7 = arg_1_0:getLocalRect()
	local var_1_8
	local var_1_9
	local var_1_10
	local var_1_11
	local var_1_12
	local var_1_13

	if arg_1_0._isShort then
		if IsLanguageChinese() then
			ACTIONS.AnimateSequence(arg_1_0, "ShortTimerCHT")
		else
			ACTIONS.AnimateSequence(arg_1_0, "ShortTimer")
		end
	else
		if IsLanguageArabic() then
			var_1_8 = var_1_1
			var_1_9 = var_1_8 + var_1_2 + var_1_1 * 1.5
			var_1_10 = var_1_9
			var_1_11 = var_1_10 + var_1_3 + var_1_1 * 1.5
			var_1_12 = var_1_4 + var_1_11
		else
			var_1_10 = var_1_1
			var_1_11 = var_1_10 + var_1_3 + var_1_1
			var_1_8 = var_1_11
			var_1_9 = var_1_8 + var_1_2 + var_1_1
			var_1_12 = var_1_4 + var_1_9
		end

		arg_1_0:SetRight(var_1_12)
		arg_1_0.LimitedTime:SetLeft(var_1_10)
		arg_1_0.LimitedTime:SetRight(var_1_11)
		arg_1_0.TimeRemaining:SetLeft(var_1_8)
		arg_1_0.TimeRemaining:SetRight(var_1_9)
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	arg_3_0._isShort = arg_3_1
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupTimeLimit = var_0_0
	arg_4_0.SetIsShort = var_0_1

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function LimitedTimeItem(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 30 * _1080p)

	var_5_0.id = "LimitedTimeItem"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Background"

	var_5_4:SetRGBFromTable(SWATCHES.Arena.NewSecondary, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Tab"

	var_5_6:SetRGBFromTable(SWATCHES.Arena.NewPrimary, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 8, 0, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Tab = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "TimeRemaining"

	var_5_8:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 150, _1080p * 295, _1080p * -9, _1080p * 9)
	var_5_0:addElement(var_5_8)

	var_5_0.TimeRemaining = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIText.new()

	var_5_10.id = "LimitedTime"

	var_5_10:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_5_10:setText(Engine.CBBHFCGDIC("MENU/STORE_LIMITED_TIME"), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 15, _1080p * 172, _1080p * -12, _1080p * 12)
	var_5_0:addElement(var_5_10)

	var_5_0.LimitedTime = var_5_10

	local function var_5_11()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_11

	local var_5_12
	local var_5_13 = {
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
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		}
	}

	var_5_6:RegisterAnimationSequence("AR", var_5_13)

	local var_5_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 160
		}
	}

	var_5_8:RegisterAnimationSequence("AR", var_5_14)

	local var_5_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 127
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 284
		}
	}

	var_5_10:RegisterAnimationSequence("AR", var_5_15)

	local function var_5_16()
		var_5_6:AnimateSequence("AR")
		var_5_8:AnimateSequence("AR")
		var_5_10:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_16

	local var_5_17
	local var_5_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -103
		}
	}

	var_5_4:RegisterAnimationSequence("ShortTimer", var_5_18)

	local var_5_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 160
		}
	}

	var_5_8:RegisterAnimationSequence("ShortTimer", var_5_19)

	local var_5_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ShortTimer", var_5_20)

	local function var_5_21()
		var_5_4:AnimateSequence("ShortTimer")
		var_5_8:AnimateSequence("ShortTimer")
		var_5_10:AnimateSequence("ShortTimer")
	end

	var_5_0._sequences.ShortTimer = var_5_21

	local var_5_22
	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -59
		}
	}

	var_5_4:RegisterAnimationSequence("ShortTimerCHT", var_5_23)

	local var_5_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 160
		}
	}

	var_5_8:RegisterAnimationSequence("ShortTimerCHT", var_5_24)

	local var_5_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ShortTimerCHT", var_5_25)

	local function var_5_26()
		var_5_4:AnimateSequence("ShortTimerCHT")
		var_5_8:AnimateSequence("ShortTimerCHT")
		var_5_10:AnimateSequence("ShortTimerCHT")
	end

	var_5_0._sequences.ShortTimerCHT = var_5_26

	local var_5_27
	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleBG
		}
	}

	var_5_4:RegisterAnimationSequence("LimitedTimeBundle", var_5_28)

	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleTab
		}
	}

	var_5_6:RegisterAnimationSequence("LimitedTimeBundle", var_5_29)

	local function var_5_30()
		var_5_4:AnimateSequence("LimitedTimeBundle")
		var_5_6:AnimateSequence("LimitedTimeBundle")
	end

	var_5_0._sequences.LimitedTimeBundle = var_5_30

	local var_5_31
	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningBG
		}
	}

	var_5_4:RegisterAnimationSequence("LimitedTimeBundleWarning", var_5_32)

	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningTab
		}
	}

	var_5_6:RegisterAnimationSequence("LimitedTimeBundleWarning", var_5_33)

	local function var_5_34()
		var_5_4:AnimateSequence("LimitedTimeBundleWarning")
		var_5_6:AnimateSequence("LimitedTimeBundleWarning")
	end

	var_5_0._sequences.LimitedTimeBundleWarning = var_5_34

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("LimitedTimeItem", LimitedTimeItem)
LockTable(_M)
