module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	Challenge.SetupSeasonEndsTimer(arg_1_0, arg_1_0.TierSkipResetTimer, "CHALLENGE/NEXT_REFRESH_TIMER_CW_STYLE_NO_ICON")
	arg_1_0.RewardResetTimer:SetupLeftAlignment()
	Challenge.SetupDailyResetTimer(arg_1_0.RewardResetTimer, arg_1_0.RewardResetTimer.Text, nil, {
		labelKeyOverride = "CHALLENGE/RESETS_IN_REFRESH_TIMER_CW_STYLE_NO_ICON",
		textSwatchOverride = SWATCHES.BattlePass.White
	})
	arg_1_0.RewardResetTimer:SetupAlignment()
	arg_1_0.TierSkipCount:setText(BR.GetNumTierSkips(arg_1_1))

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
		ACTIONS.AnimateSequence(arg_1_0.ChallengeHeader, "ARChallengeMenu")
		ACTIONS.AnimateSequence(arg_1_0.RewardResetTimer, "ARLargerFont")
	end

	ACTIONS.AnimateSequence(arg_1_0, "ShowOnlyGlobalHint")
end

function WZChallengesDailyStorageInfo(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1081 * _1080p, 0, 333 * _1080p)

	var_2_0.id = "WZChallengesDailyStorageInfo"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "Background"

	var_2_4:SetAlpha(0, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "GradiantBackground"

	var_2_6:SetRGBFromTable(SWATCHES.CH2.CH2Backer, 0)
	var_2_6:SetAlpha(0.5, 0)
	var_2_6:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1081, 0, _1080p * 333)
	var_2_0:addElement(var_2_6)

	var_2_0.GradiantBackground = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "TierSkipCount"

	var_2_8:SetRGBFromTable(SWATCHES.BattlePass.White, 0)
	var_2_8:setText("9", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_8:SetWordWrap(false)
	var_2_8:SetAlignment(LUI.Alignment.Right)
	var_2_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 227, _1080p * 259, _1080p * 47.5, _1080p * 97.5)
	var_2_0:addElement(var_2_8)

	var_2_0.TierSkipCount = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "TierSkipTitle"

	var_2_10:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_10:SetAlpha(0.7, 0)
	var_2_10:setText(ToUpperCase(Engine.CBBHFCGDIC("WZ_TU_TANGO/TIER_SKIP_REWARDS")), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetWordWrap(false)
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_10:SetStartupDelay(1500)
	var_2_10:SetLineHoldTime(400)
	var_2_10:SetAnimMoveTime(300)
	var_2_10:SetAnimMoveSpeed(50)
	var_2_10:SetEndDelay(1000)
	var_2_10:SetCrossfadeTime(500)
	var_2_10:SetFadeInTime(300)
	var_2_10:SetFadeOutTime(300)
	var_2_10:SetMaxVisibleLines(1)
	var_2_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 227, _1080p * 467, _1080p * -66.5, _1080p * -38.5)
	var_2_0:addElement(var_2_10)

	var_2_0.TierSkipTitle = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIImage.new()

	var_2_12.id = "TierSkipIcon"

	var_2_12:setImage(RegisterMaterial("ui_t9_shared_icon_logos_challenges_dailyTierSkips"), 0)
	var_2_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 69, _1080p * 201, _1080p * -77.5, _1080p * 78.5)
	var_2_0:addElement(var_2_12)

	var_2_0.TierSkipIcon = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIStyledText.new()

	var_2_14.id = "TierSkipPremiumPassText"

	var_2_14:SetRGBFromTable(SWATCHES.BattlePass.BRVIPGold, 0)
	var_2_14:setText(ToUpperCase(Engine.CBBHFCGDIC("WZ_TU_TANGO/PREMIUM_PASS_OWNED")), 0)
	var_2_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_14:SetWordWrap(false)
	var_2_14:SetAlignment(LUI.Alignment.Left)
	var_2_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_14:SetTintFontIcons(true)
	var_2_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 265, _1080p * 461, _1080p * 72.5, _1080p * 90.5)
	var_2_0:addElement(var_2_14)

	var_2_0.TierSkipPremiumPassText = var_2_14

	local var_2_15
	local var_2_16 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = var_2_1
	})

	var_2_16.id = "ChallengeHeader"

	var_2_16.Title:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_2_16.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/GLOBAL_REWARDS")), 0)
	var_2_16.Line:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_2_16.Line:SetAlpha(0, 0)
	var_2_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -40, 0)
	var_2_0:addElement(var_2_16)

	var_2_0.ChallengeHeader = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIImage.new()

	var_2_18.id = "Divider"

	var_2_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -3, _1080p * -1)
	var_2_0:addElement(var_2_18)

	var_2_0.Divider = var_2_18

	local var_2_19
	local var_2_20 = MenuBuilder.BuildRegisteredType("WZGlobalHint", {
		controllerIndex = var_2_1
	})

	var_2_20.id = "GlobalHint"

	var_2_20.Title:setText(Engine.CBBHFCGDIC("CHALLENGE/ACTIVE_DAILY_SELECTION_GLOBAL_HINT"), 0)
	var_2_20:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 4, _1080p * 44)
	var_2_0:addElement(var_2_20)

	var_2_0.GlobalHint = var_2_20

	local var_2_21
	local var_2_22 = LUI.UIStyledText.new()

	var_2_22.id = "TierSkipResetTimer"

	var_2_22:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_22:setText("Timer", 0)
	var_2_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_22:SetWordWrap(false)
	var_2_22:SetAlignment(LUI.Alignment.Left)
	var_2_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_22:SetTintFontIcons(true)
	var_2_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 227, _1080p * 423, _1080p * -86.5, _1080p * -68.5)
	var_2_0:addElement(var_2_22)

	var_2_0.TierSkipResetTimer = var_2_22

	local var_2_23
	local var_2_24 = LUI.UIStyledText.new()

	var_2_24.id = "TierSkipRewardsTitle"

	var_2_24:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_24:SetAlpha(0.7, 0)
	var_2_24:setText(Engine.CBBHFCGDIC("LUA_MENU/AVAILABLE"), 0)
	var_2_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_24:SetWordWrap(false)
	var_2_24:SetAlignment(LUI.Alignment.Left)
	var_2_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 265, _1080p * 461, _1080p * 52.5, _1080p * 72.5)
	var_2_0:addElement(var_2_24)

	var_2_0.TierSkipRewardsTitle = var_2_24

	local var_2_25
	local var_2_26 = LUI.UIStyledText.new()

	var_2_26.id = "TierSkipDesc"

	var_2_26:SetRGBFromTable(SWATCHES.BattlePass.White, 0)
	var_2_26:setText(Engine.CBBHFCGDIC("WZ_TU_TANGO/TIER_SKIP_REWARD_DESC"), 0)
	var_2_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_26:SetAlignment(LUI.Alignment.Left)
	var_2_26:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 227, _1080p * 467, _1080p * -31.5, _1080p * -13.5)
	var_2_0:addElement(var_2_26)

	var_2_0.TierSkipDesc = var_2_26

	local var_2_27
	local var_2_28 = LUI.UIImage.new()

	var_2_28.id = "InfoDivider"

	var_2_28:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_28:SetAlpha(0.7, 0)
	var_2_28:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 485, _1080p * 486, _1080p * -110.5, _1080p * 110.5)
	var_2_0:addElement(var_2_28)

	var_2_0.InfoDivider = var_2_28

	local var_2_29
	local var_2_30 = LUI.UIStyledText.new()

	var_2_30.id = "RewardTitle"

	var_2_30:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_30:SetAlpha(0.7, 0)
	var_2_30:setText(ToUpperCase(Engine.CBBHFCGDIC("WZ_TU_TANGO/DAILY_REWARD")), 0)
	var_2_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_30:SetWordWrap(false)
	var_2_30:SetAlignment(LUI.Alignment.Left)
	var_2_30:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_30:SetStartupDelay(1500)
	var_2_30:SetLineHoldTime(400)
	var_2_30:SetAnimMoveTime(300)
	var_2_30:SetAnimMoveSpeed(50)
	var_2_30:SetEndDelay(1000)
	var_2_30:SetCrossfadeTime(500)
	var_2_30:SetFadeInTime(300)
	var_2_30:SetFadeOutTime(300)
	var_2_30:SetMaxVisibleLines(1)
	var_2_30:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -277, _1080p * -21, _1080p * -66.5, _1080p * -38.5)
	var_2_0:addElement(var_2_30)

	var_2_0.RewardTitle = var_2_30

	local var_2_31
	local var_2_32 = LUI.UIImage.new()

	var_2_32.id = "RewardIcon"

	var_2_32:setImage(RegisterMaterial("ui_t9_shared_icon_logos_challenges_dailyDurableRewards"), 0)
	var_2_32:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -564, _1080p * -292, _1080p * -72.5, _1080p * 23.5)
	var_2_0:addElement(var_2_32)

	var_2_0.RewardIcon = var_2_32

	local var_2_33
	local var_2_34 = LUI.UIStyledText.new()

	var_2_34.id = "RewardPreviewPrompt"

	var_2_34:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_34:SetAlpha(0.7, 0)
	var_2_34:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_REWARD_LSTICK"), 0)
	var_2_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_34:SetWordWrap(false)
	var_2_34:SetAlignment(LUI.Alignment.Left)
	var_2_34:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -277, _1080p * -81, _1080p * 47.5, _1080p * 67.5)
	var_2_0:addElement(var_2_34)

	var_2_0.RewardPreviewPrompt = var_2_34

	local var_2_35
	local var_2_36 = LUI.UIStyledText.new()

	var_2_36.id = "RewardDesc"

	var_2_36:SetRGBFromTable(SWATCHES.BattlePass.White, 0)
	var_2_36:setText(Engine.CBBHFCGDIC("WZ_TU_TANGO/DAILY_REWARD_DESC"), 0)
	var_2_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_36:SetAlignment(LUI.Alignment.Left)
	var_2_36:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -277, _1080p * -37, _1080p * -31.5, _1080p * -13.5)
	var_2_0:addElement(var_2_36)

	var_2_0.RewardDesc = var_2_36

	local var_2_37
	local var_2_38 = LUI.UIStyledText.new()

	var_2_38.id = "RewardType"

	var_2_38:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_38:SetAlpha(0.7, 0)
	var_2_38:setText(Engine.CBBHFCGDIC("WZ_TU_TANGO/REWARD_TYPE"), 0)
	var_2_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_38:SetWordWrap(false)
	var_2_38:SetAlignment(LUI.Alignment.Center)
	var_2_38:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -562, _1080p * -292, _1080p * 26.5, _1080p * 44.5)
	var_2_0:addElement(var_2_38)

	var_2_0.RewardType = var_2_38

	local var_2_39
	local var_2_40 = MenuBuilder.BuildRegisteredType("ChallengeResetTimer", {
		controllerIndex = var_2_1
	})

	var_2_40.id = "RewardResetTimer"

	var_2_40:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -277, _1080p * -200, _1080p * -98.5, _1080p * -68.5)
	var_2_0:addElement(var_2_40)

	var_2_0.RewardResetTimer = var_2_40

	local function var_2_41()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_41

	local var_2_42
	local var_2_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 381
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 183
		}
	}

	var_2_10:RegisterAnimationSequence("AR", var_2_43)

	local var_2_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 101.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 71.5
		}
	}

	var_2_14:RegisterAnimationSequence("AR", var_2_44)

	local var_2_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -693
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		}
	}

	var_2_16:RegisterAnimationSequence("AR", var_2_45)

	local var_2_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -613
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 42
		}
	}

	var_2_20:RegisterAnimationSequence("AR", var_2_46)

	local var_2_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -64.5
		}
	}

	var_2_22:RegisterAnimationSequence("AR", var_2_47)

	local var_2_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 84.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 48.5
		}
	}

	var_2_24:RegisterAnimationSequence("AR", var_2_48)

	local var_2_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 209
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 461
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32.5
		}
	}

	var_2_26:RegisterAnimationSequence("AR", var_2_49)

	local var_2_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -200
		}
	}

	var_2_30:RegisterAnimationSequence("AR", var_2_50)

	local var_2_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 46.5
		}
	}

	var_2_34:RegisterAnimationSequence("AR", var_2_51)

	local var_2_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -316
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -7.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32.5
		}
	}

	var_2_36:RegisterAnimationSequence("AR", var_2_52)

	local var_2_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 22.5
		}
	}

	var_2_38:RegisterAnimationSequence("AR", var_2_53)

	local function var_2_54()
		var_2_10:AnimateSequence("AR")
		var_2_14:AnimateSequence("AR")
		var_2_16:AnimateSequence("AR")
		var_2_20:AnimateSequence("AR")
		var_2_22:AnimateSequence("AR")
		var_2_24:AnimateSequence("AR")
		var_2_26:AnimateSequence("AR")
		var_2_30:AnimateSequence("AR")
		var_2_34:AnimateSequence("AR")
		var_2_36:AnimateSequence("AR")
		var_2_38:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_54

	local var_2_55
	local var_2_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_56)

	local var_2_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_57)

	local var_2_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_58)

	local var_2_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_59)

	local var_2_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_60)

	local var_2_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_61)

	local var_2_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_16:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_62)

	local var_2_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_18:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_63)

	local var_2_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_22:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_64)

	local var_2_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_24:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_65)

	local var_2_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_26:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_66)

	local var_2_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_28:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_67)

	local var_2_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_30:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_68)

	local var_2_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_32:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_69)

	local var_2_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_34:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_70)

	local var_2_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_36:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_71)

	local var_2_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_38:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_72)

	local var_2_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_40:RegisterAnimationSequence("ShowOnlyGlobalHint", var_2_73)

	local function var_2_74()
		var_2_4:AnimateSequence("ShowOnlyGlobalHint")
		var_2_6:AnimateSequence("ShowOnlyGlobalHint")
		var_2_8:AnimateSequence("ShowOnlyGlobalHint")
		var_2_10:AnimateSequence("ShowOnlyGlobalHint")
		var_2_12:AnimateSequence("ShowOnlyGlobalHint")
		var_2_14:AnimateSequence("ShowOnlyGlobalHint")
		var_2_16:AnimateSequence("ShowOnlyGlobalHint")
		var_2_18:AnimateSequence("ShowOnlyGlobalHint")
		var_2_22:AnimateSequence("ShowOnlyGlobalHint")
		var_2_24:AnimateSequence("ShowOnlyGlobalHint")
		var_2_26:AnimateSequence("ShowOnlyGlobalHint")
		var_2_28:AnimateSequence("ShowOnlyGlobalHint")
		var_2_30:AnimateSequence("ShowOnlyGlobalHint")
		var_2_32:AnimateSequence("ShowOnlyGlobalHint")
		var_2_34:AnimateSequence("ShowOnlyGlobalHint")
		var_2_36:AnimateSequence("ShowOnlyGlobalHint")
		var_2_38:AnimateSequence("ShowOnlyGlobalHint")
		var_2_40:AnimateSequence("ShowOnlyGlobalHint")
	end

	var_2_0._sequences.ShowOnlyGlobalHint = var_2_74

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("WZChallengesDailyStorageInfo", WZChallengesDailyStorageInfo)
LockTable(_M)
