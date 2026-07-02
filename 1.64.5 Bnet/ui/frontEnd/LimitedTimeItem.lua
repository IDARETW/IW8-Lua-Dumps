module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.LimitedTime)
	arg_1_0.LimitedTime:setText(Engine.CBBHFCGDIC("STORE/X_PERCENT_OFF", tostring(arg_1_1)))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5)
	assert(arg_2_0.Background)
	assert(arg_2_0.TimeRemaining)
	assert(arg_2_0.LimitedTime)

	local function var_2_0(arg_3_0)
		if arg_3_0 and arg_3_0 < STORE.LimitedTimeWarningThreshold then
			ACTIONS.AnimateSequence(arg_2_0, CONDITIONS.IsMagmaGameMode() and "WZLimitedTimeBundleWarning" or "LimitedTimeBundleWarning")
		else
			ACTIONS.AnimateSequence(arg_2_0, CONDITIONS.IsMagmaGameMode() and "WZLimitedTimeBundle" or "LimitedTimeBundle")
		end
	end

	if arg_2_5 then
		STORE.RunTimer(arg_2_0, arg_2_1, arg_2_0.TimeRemaining, arg_2_2, arg_2_3, arg_2_4, var_2_0)
	else
		STORE.RunTimer(arg_2_0, arg_2_1, arg_2_0.TimeRemaining, arg_2_2, arg_2_3, arg_2_4)
	end

	local var_2_1 = _1080p * 15
	local var_2_2 = LAYOUT.GetTextWidth(arg_2_0.TimeRemaining)
	local var_2_3 = LAYOUT.GetTextWidth(arg_2_0.LimitedTime)
	local var_2_4, var_2_5, var_2_6, var_2_7 = arg_2_0:getLocalRect()
	local var_2_8
	local var_2_9
	local var_2_10
	local var_2_11
	local var_2_12
	local var_2_13

	if arg_2_0._isShort then
		if IsLanguageChinese() then
			ACTIONS.AnimateSequence(arg_2_0, "ShortTimerCHT")
		else
			ACTIONS.AnimateSequence(arg_2_0, "ShortTimer")
		end
	else
		if IsLanguageArabic() then
			var_2_8 = var_2_1
			var_2_9 = var_2_8 + var_2_2 + var_2_1 * 1.5
			var_2_10 = var_2_9
			var_2_11 = var_2_10 + var_2_3 + var_2_1 * 1.5
			var_2_12 = var_2_4 + var_2_11
		else
			var_2_10 = var_2_1
			var_2_11 = var_2_10 + var_2_3 + var_2_1
			var_2_8 = var_2_11
			var_2_9 = var_2_8 + var_2_2 + var_2_1
			var_2_12 = var_2_4 + var_2_9
		end

		arg_2_0:SetRight(var_2_12)
		arg_2_0.LimitedTime:SetLeft(var_2_10)
		arg_2_0.LimitedTime:SetRight(var_2_11)
		arg_2_0.TimeRemaining:SetLeft(var_2_8)
		arg_2_0.TimeRemaining:SetRight(var_2_9)
	end
end

local function var_0_2(arg_4_0, arg_4_1)
	arg_4_0._isShort = arg_4_1
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetupTimeLimit = var_0_1
	arg_5_0.SetupDiscountPercentage = var_0_0
	arg_5_0.SetIsShort = var_0_2

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end
end

function LimitedTimeItem(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 30 * _1080p)

	var_6_0.id = "LimitedTimeItem"
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

	var_6_4.id = "Background"

	var_6_4:SetRGBFromInt(16765696, 0)
	var_6_4:setImage(RegisterMaterial("menu_highlight_backing_ch2"), 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "TimeRemaining"

	var_6_6:SetRGBFromInt(0, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 150, _1080p * 295, _1080p * -9, _1080p * 9)
	var_6_0:addElement(var_6_6)

	var_6_0.TimeRemaining = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIText.new()

	var_6_8.id = "LimitedTime"

	var_6_8:SetRGBFromInt(0, 0)
	var_6_8:setText(Engine.CBBHFCGDIC("MENU/STORE_LIMITED_TIME"), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 15, _1080p * 172, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_8)

	var_6_0.LimitedTime = var_6_8

	local function var_6_9()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_9

	local var_6_10
	local var_6_11 = {
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

	var_6_6:RegisterAnimationSequence("AR", var_6_11)

	local var_6_12 = {
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

	var_6_8:RegisterAnimationSequence("AR", var_6_12)

	local function var_6_13()
		var_6_6:AnimateSequence("AR")
		var_6_8:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_13

	local var_6_14
	local var_6_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -103
		}
	}

	var_6_4:RegisterAnimationSequence("ShortTimer", var_6_15)

	local var_6_16 = {
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

	var_6_6:RegisterAnimationSequence("ShortTimer", var_6_16)

	local var_6_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ShortTimer", var_6_17)

	local function var_6_18()
		var_6_4:AnimateSequence("ShortTimer")
		var_6_6:AnimateSequence("ShortTimer")
		var_6_8:AnimateSequence("ShortTimer")
	end

	var_6_0._sequences.ShortTimer = var_6_18

	local var_6_19
	local var_6_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -59
		}
	}

	var_6_4:RegisterAnimationSequence("ShortTimerCHT", var_6_20)

	local var_6_21 = {
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

	var_6_6:RegisterAnimationSequence("ShortTimerCHT", var_6_21)

	local var_6_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ShortTimerCHT", var_6_22)

	local function var_6_23()
		var_6_4:AnimateSequence("ShortTimerCHT")
		var_6_6:AnimateSequence("ShortTimerCHT")
		var_6_8:AnimateSequence("ShortTimerCHT")
	end

	var_6_0._sequences.ShortTimerCHT = var_6_23

	local var_6_24
	local var_6_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleBG
		}
	}

	var_6_4:RegisterAnimationSequence("LimitedTimeBundle", var_6_25)

	local function var_6_26()
		var_6_4:AnimateSequence("LimitedTimeBundle")
	end

	var_6_0._sequences.LimitedTimeBundle = var_6_26

	local var_6_27
	local var_6_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningBG
		}
	}

	var_6_4:RegisterAnimationSequence("LimitedTimeBundleWarning", var_6_28)

	local function var_6_29()
		var_6_4:AnimateSequence("LimitedTimeBundleWarning")
	end

	var_6_0._sequences.LimitedTimeBundleWarning = var_6_29

	local var_6_30
	local var_6_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_6_4:RegisterAnimationSequence("WZLimitedTimeBundle", var_6_31)

	local var_6_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_6_6:RegisterAnimationSequence("WZLimitedTimeBundle", var_6_32)

	local function var_6_33()
		var_6_4:AnimateSequence("WZLimitedTimeBundle")
		var_6_6:AnimateSequence("WZLimitedTimeBundle")
	end

	var_6_0._sequences.WZLimitedTimeBundle = var_6_33

	local var_6_34
	local var_6_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.LimitedTimeBundleWarningBG
		}
	}

	var_6_4:RegisterAnimationSequence("WZLimitedTimeBundleWarning", var_6_35)

	local function var_6_36()
		var_6_4:AnimateSequence("WZLimitedTimeBundleWarning")
	end

	var_6_0._sequences.WZLimitedTimeBundleWarning = var_6_36

	var_0_3(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("LimitedTimeItem", LimitedTimeItem)
LockTable(_M)
