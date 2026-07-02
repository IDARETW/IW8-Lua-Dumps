module(..., package.seeall)

local var_0_0 = 1500

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 == nil then
		return
	end

	if CONDITIONS.IsBRGameType(arg_1_0) then
		local var_1_0 = arg_1_2.contractBonus or 0

		arg_1_0.ContractBonusXP.Value:setupTextValueIntTween(0, var_1_0, var_0_0, LUI.EASING.inOutSine)
	end

	local var_1_1 = arg_1_2.matchXP or 0
	local var_1_2 = arg_1_2.challengeBonus or 0
	local var_1_3 = arg_1_2.earnedXP + arg_1_2.earnedSeasonXP
	local var_1_4 = arg_1_2.currentCPpoints - arg_1_2.startCPpoints

	arg_1_0.MatchXP.Value:setupTextValueIntTween(0, math.max(var_1_1, 0), var_0_0, LUI.EASING.inOutSine)
	arg_1_0.ChallengeBonusXP.Value:setupTextValueIntTween(0, math.max(var_1_2, 0), var_0_0, LUI.EASING.inOutSine)
	arg_1_0.RoundTotalXP:setupTextValueIntTween(0, math.max(var_1_3, 0), var_0_0, LUI.EASING.inOutSine)
	arg_1_0.TotalPointCount:setupTextValueIntTween(0, math.max(var_1_4, 0), var_0_0, LUI.EASING.inOutSine)
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.InitProgression = var_0_1

	if LOOT.IsDoubleXPActiveByType(arg_2_1, LOOT.doubleXPType.ANY) then
		arg_2_0.DoubleXP:setImage(RegisterMaterial("icon_double_xp"))
		ACTIONS.AnimateSequence(arg_2_0, "ShowDoubleXP")
	else
		ACTIONS.AnimateSequence(arg_2_0, "HideDoubleXP")
	end

	if CONDITIONS.IsBRGameType(arg_2_0) then
		ACTIONS.AnimateSequence(arg_2_0, "InitBR")
	end

	if Engine.EAIICIFIFA() then
		ACTIONS.AnimateSequence(arg_2_0, "ShowPointsEarned")
	end
end

function AARBreakdown(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 290 * _1080p)

	var_3_0.id = "AARBreakdown"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "RoundTotalXP"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_4:setText("0000", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_4:SetWordWrap(false)
	var_3_4:SetAlignment(LUI.Alignment.Right)
	var_3_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -171, _1080p * -41, _1080p * 169, _1080p * 205)
	var_3_0:addElement(var_3_4)

	var_3_0.RoundTotalXP = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "TotalXPLabel"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU/TOTAL_XP_EARNED"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 400, _1080p * 169, _1080p * 205)
	var_3_0:addElement(var_3_6)

	var_3_0.TotalXPLabel = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("AARXPBreakdown", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "ChallengeBonusXP"

	var_3_8.Title:setText(Engine.CBBHFCGDIC("AAR/CHALLENGE_BONUS"), 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 50, _1080p * -41, _1080p * 120, _1080p * 144)
	var_3_0:addElement(var_3_8)

	var_3_0.ChallengeBonusXP = var_3_8

	local var_3_9

	if CONDITIONS.IsBRGameType(var_3_0) then
		var_3_9 = MenuBuilder.BuildRegisteredType("AARXPBreakdown", {
			controllerIndex = var_3_1
		})
		var_3_9.id = "ContractBonusXP"

		var_3_9:SetAlpha(0, 0)
		var_3_9.Title:setText(Engine.CBBHFCGDIC("AAR/CONTRACT_BONUS"), 0)
		var_3_9:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 50, _1080p * -41, _1080p * 170, _1080p * 194)
		var_3_0:addElement(var_3_9)

		var_3_0.ContractBonusXP = var_3_9
	end

	local var_3_10
	local var_3_11 = MenuBuilder.BuildRegisteredType("AARXPBreakdown", {
		controllerIndex = var_3_1
	})

	var_3_11.id = "MatchXP"

	var_3_11.Title:setText(Engine.CBBHFCGDIC("AAR/MATCH_XP"), 0)
	var_3_11:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 50, _1080p * -41, _1080p * 73, _1080p * 97)
	var_3_0:addElement(var_3_11)

	var_3_0.MatchXP = var_3_11

	local var_3_12
	local var_3_13 = LUI.UIText.new()

	var_3_13.id = "Text"

	var_3_13:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_13:setText(Engine.CBBHFCGDIC("AAR/XP_BREAKDOWN"), 0)
	var_3_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_13:SetAlignment(LUI.Alignment.Left)
	var_3_13:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_13:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 50, _1080p * -41, _1080p * 12, _1080p * 42)
	var_3_0:addElement(var_3_13)

	var_3_0.Text = var_3_13

	local var_3_14
	local var_3_15 = LUI.UIImage.new()

	var_3_15.id = "DoubleXP"

	var_3_15:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_15:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_3_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -506, _1080p * -474, _1080p * 37, _1080p * 69)
	var_3_0:addElement(var_3_15)

	var_3_0.DoubleXP = var_3_15

	local var_3_16
	local var_3_17 = LUI.UIStyledText.new()

	var_3_17.id = "XPActive"

	var_3_17:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_17:setText(Engine.CBBHFCGDIC("LUA_MENU/ACTIVE"), 0)
	var_3_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_17:SetWordWrap(false)
	var_3_17:SetAlignment(LUI.Alignment.Left)
	var_3_17:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -474, _1080p * -376, _1080p * 41, _1080p * 65)
	var_3_0:addElement(var_3_17)

	var_3_0.XPActive = var_3_17

	local var_3_18
	local var_3_19 = LUI.UIImage.new()

	var_3_19.id = "Divider"

	var_3_19:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 509, _1080p * 222, _1080p * 223)
	var_3_0:addElement(var_3_19)

	var_3_0.Divider = var_3_19

	local var_3_20
	local var_3_21 = LUI.UIText.new()

	var_3_21.id = "TotalPointCount"

	var_3_21:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_21:SetAlpha(0, 0)
	var_3_21:setText("0000", 0)
	var_3_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_21:SetWordWrap(false)
	var_3_21:SetAlignment(LUI.Alignment.Right)
	var_3_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -171, _1080p * -41, _1080p * 241, _1080p * 271)
	var_3_0:addElement(var_3_21)

	var_3_0.TotalPointCount = var_3_21

	local var_3_22
	local var_3_23 = LUI.UIText.new()

	var_3_23.id = "TotalAcquiredPoint"

	var_3_23:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_23:SetAlpha(0, 0)
	var_3_23:setText(Engine.CBBHFCGDIC("LUA_MENU/POINTS_ACQUIRED"), 0)
	var_3_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_23:SetAlignment(LUI.Alignment.Left)
	var_3_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 400, _1080p * 241, _1080p * 265)
	var_3_0:addElement(var_3_23)

	var_3_0.TotalAcquiredPoint = var_3_23

	local var_3_24
	local var_3_25 = MenuBuilder.BuildRegisteredType("EarnRateBuff", {
		controllerIndex = var_3_1
	})

	var_3_25.id = "EarnRateBuff"

	var_3_25.EarnRate:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_25:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -235, _1080p * -35, _1080p * 37, _1080p * 69)
	var_3_0:addElement(var_3_25)

	var_3_0.EarnRateBuff = var_3_25

	local function var_3_26()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_26

	local var_3_27
	local var_3_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Intro", var_3_28)

	local var_3_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Intro", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Intro", var_3_30)

	local var_3_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_11:RegisterAnimationSequence("Intro", var_3_31)

	local var_3_32 = {
		{
			value = 0,
			duration = 900,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("Intro", var_3_32)

	local var_3_33 = {
		{
			value = 0,
			duration = 900,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("Intro", var_3_33)

	local var_3_34 = {
		{
			value = 0,
			duration = 900,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("Intro", var_3_34)

	local function var_3_35()
		var_3_4:AnimateSequence("Intro")
		var_3_6:AnimateSequence("Intro")
		var_3_8:AnimateSequence("Intro")
		var_3_11:AnimateSequence("Intro")
		var_3_19:AnimateSequence("Intro")
		var_3_21:AnimateSequence("Intro")
		var_3_23:AnimateSequence("Intro")
	end

	var_3_0._sequences.Intro = var_3_35

	local var_3_36
	local var_3_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_15:RegisterAnimationSequence("ShowDoubleXP", var_3_37)

	local var_3_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_17:RegisterAnimationSequence("ShowDoubleXP", var_3_38)

	local function var_3_39()
		var_3_15:AnimateSequence("ShowDoubleXP")
		var_3_17:AnimateSequence("ShowDoubleXP")
	end

	var_3_0._sequences.ShowDoubleXP = var_3_39

	local var_3_40
	local var_3_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_15:RegisterAnimationSequence("HideDoubleXP", var_3_41)

	local var_3_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_17:RegisterAnimationSequence("HideDoubleXP", var_3_42)

	local function var_3_43()
		var_3_15:AnimateSequence("HideDoubleXP")
		var_3_17:AnimateSequence("HideDoubleXP")
	end

	var_3_0._sequences.HideDoubleXP = var_3_43

	local var_3_44
	local var_3_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("ShowPointsEarned", var_3_45)

	local var_3_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_23:RegisterAnimationSequence("ShowPointsEarned", var_3_46)

	local function var_3_47()
		var_3_21:AnimateSequence("ShowPointsEarned")
		var_3_23:AnimateSequence("ShowPointsEarned")
	end

	var_3_0._sequences.ShowPointsEarned = var_3_47

	local var_3_48
	local var_3_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 129
		}
	}

	var_3_8:RegisterAnimationSequence("InitBR", var_3_49)

	if CONDITIONS.IsBRGameType(var_3_0) then
		local var_3_50 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 136
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 160
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_9:RegisterAnimationSequence("InitBR", var_3_50)
	end

	local var_3_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 97
		}
	}

	var_3_11:RegisterAnimationSequence("InitBR", var_3_51)

	local function var_3_52()
		var_3_8:AnimateSequence("InitBR")

		if CONDITIONS.IsBRGameType(var_3_0) then
			var_3_9:AnimateSequence("InitBR")
		end

		var_3_11:AnimateSequence("InitBR")
	end

	var_3_0._sequences.InitBR = var_3_52

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARBreakdown", AARBreakdown)
LockTable(_M)
