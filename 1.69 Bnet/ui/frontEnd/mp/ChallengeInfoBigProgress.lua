module(..., package.seeall)

function ChallengeInfoBigProgress(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 521 * _1080p, 0, 716 * _1080p)

	var_1_0.id = "ChallengeInfoBigProgress"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIText.new()

	var_1_4.id = "TierLabel"

	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 485.35, _1080p * 597.64, _1080p * 617.64)

	local function var_1_5()
		local var_2_0 = var_1_0:GetDataSource().currentTierLabel:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_4:setText(var_2_0, 0)
		end
	end

	var_1_4:SubscribeToModelThroughElement(var_1_0, "currentTierLabel", var_1_5)
	var_1_0:addElement(var_1_4)

	var_1_0.TierLabel = var_1_4

	local var_1_6
	local var_1_7 = LUI.UIText.new()

	var_1_7.id = "ProgressNumber"

	var_1_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_7:SetAlignment(LUI.Alignment.Right)
	var_1_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 242.52, _1080p * 536, _1080p * 562)

	local function var_1_8()
		local var_3_0 = var_1_0:GetDataSource().currentProgress:GetValue(var_1_1)

		if var_3_0 ~= nil then
			var_1_7:setText(var_3_0, 0)
		end
	end

	var_1_7:SubscribeToModelThroughElement(var_1_0, "currentProgress", var_1_8)
	var_1_0:addElement(var_1_7)

	var_1_0.ProgressNumber = var_1_7

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "ProgressMax"

	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 263.52, _1080p * 489.48, _1080p * 536, _1080p * 562)

	local function var_1_11()
		local var_4_0 = var_1_0:GetDataSource().currentTierMax:GetValue(var_1_1)

		if var_4_0 ~= nil then
			var_1_10:setText(var_4_0, 0)
		end
	end

	var_1_10:SubscribeToModelThroughElement(var_1_0, "currentTierMax", var_1_11)
	var_1_0:addElement(var_1_10)

	var_1_0.ProgressMax = var_1_10

	local var_1_12
	local var_1_13 = LUI.UIText.new()

	var_1_13.id = "ProgressDivider"

	var_1_13:SetRGBFromInt(12566463, 0)
	var_1_13:setText("/", 0)
	var_1_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_13:SetAlignment(LUI.Alignment.Center)
	var_1_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 237.52, _1080p * 270.52, _1080p * 536, _1080p * 562)
	var_1_0:addElement(var_1_13)

	var_1_0.ProgressDivider = var_1_13

	local var_1_14
	local var_1_15 = LUI.UIStyledText.new()

	var_1_15.id = "RewardLabel"

	var_1_15:setText(Engine.CBBHFCGDIC("MENU/XP_REWARD"), 0)
	var_1_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_15:SetAlignment(LUI.Alignment.Left)
	var_1_15:SetStartupDelay(1000)
	var_1_15:SetLineHoldTime(500)
	var_1_15:SetAnimMoveTime(500)
	var_1_15:SetEndDelay(1000)
	var_1_15:SetCrossfadeTime(500)
	var_1_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_15:SetMaxVisibleLines(1)
	var_1_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 180, _1080p * 470, _1080p * 490)
	var_1_0:addElement(var_1_15)

	var_1_0.RewardLabel = var_1_15

	local var_1_16
	local var_1_17 = LUI.UIText.new()

	var_1_17.id = "RewardValue"

	var_1_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_17:SetAlignment(LUI.Alignment.Right)
	var_1_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 156.71, _1080p * 231.69, _1080p * 470, _1080p * 490)

	local function var_1_18()
		local var_5_0 = var_1_0:GetDataSource().currentTierXP:GetValue(var_1_1)

		if var_5_0 ~= nil then
			var_1_17:setText(var_5_0, 0)
		end
	end

	var_1_17:SubscribeToModelThroughElement(var_1_0, "currentTierXP", var_1_18)
	var_1_0:addElement(var_1_17)

	var_1_0.RewardValue = var_1_17

	local var_1_19
	local var_1_20 = MenuBuilder.BuildRegisteredType("ChallengeInfoProgressBar", {
		controllerIndex = var_1_1
	})

	var_1_20.id = "ProgressBar"

	var_1_20:SetDataSourceThroughElement(var_1_0, nil)
	var_1_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 489.48, _1080p * 512, _1080p * 539.5)
	var_1_0:addElement(var_1_20)

	var_1_0.ProgressBar = var_1_20

	local var_1_21
	local var_1_22 = MenuBuilder.BuildRegisteredType("ChallengesTiers", {
		controllerIndex = var_1_1
	})

	var_1_22.id = "ChallengesTiers"

	var_1_22:SetDataSourceThroughElement(var_1_0, nil)
	var_1_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -1.65, _1080p * 509.99, _1080p * 607.64, _1080p * 691.64)
	var_1_0:addElement(var_1_22)

	var_1_0.ChallengesTiers = var_1_22

	local function var_1_23()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_23

	local var_1_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 113.98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 242.52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 490
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

	var_1_15:RegisterAnimationSequence("RightToLeft", var_1_24)

	local var_1_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 104.98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 490
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

	var_1_17:RegisterAnimationSequence("RightToLeft", var_1_25)

	local function var_1_26()
		var_1_15:AnimateSequence("RightToLeft")
		var_1_17:AnimateSequence("RightToLeft")
	end

	var_1_0._sequences.RightToLeft = var_1_26

	var_1_20:SetDataSourceThroughElement(var_1_0, nil)
	var_1_22:SetDataSourceThroughElement(var_1_0, nil)

	if CONDITIONS.IsArabic(var_1_0) then
		ACTIONS.AnimateSequence(var_1_0, "RightToLeft")
	end

	return var_1_0
end

MenuBuilder.registerType("ChallengeInfoBigProgress", ChallengeInfoBigProgress)
LockTable(_M)
