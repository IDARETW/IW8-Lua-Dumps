module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = LUI.Split(arg_1_1.ui_reward_splits, "|")[1]
	local var_1_1 = RegisterMaterial("icon_xp_token")
	local var_1_2 = Engine.CBBHFCGDIC("LUA_MENU/REWARD_XP", 5000)
	local var_1_3 = Engine.CBBHFCGDIC("LUA_MENU/REWARD_XP", 7500)
	local var_1_4 = Engine.CBBHFCGDIC("LUA_MENU/REWARD_XP", 10000)

	arg_1_0.Tier1Reward:setText(var_1_2)
	arg_1_0.Tier1RewardImage:setImage(var_1_1)
	arg_1_0.Tier2Reward:setText(var_1_3)
	arg_1_0.Tier2RewardImage:setImage(var_1_1)
	arg_1_0.Tier3Reward:setText(var_1_4)
	arg_1_0.Tier3RewardImage:setImage(var_1_1)
	arg_1_0.Tier1.Score:setText(arg_1_1.scoreType == "time" and Engine.BFBIAHJJFA(arg_1_1.tier1) or arg_1_1.tier1)
	arg_1_0.Tier2.Score:setText(arg_1_1.scoreType == "time" and Engine.BFBIAHJJFA(arg_1_1.tier2) or arg_1_1.tier2)
	arg_1_0.Tier3.Score:setText(arg_1_1.scoreType == "time" and Engine.BFBIAHJJFA(arg_1_1.tier3) or arg_1_1.tier3)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupTrialReward = var_0_0

	arg_2_0.HowManyStars:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_HOW_MANY_STARS", 1), 0)
	ACTIONS.AnimateSequence(arg_2_0.Tier1.Stars, "Tier1")
	ACTIONS.AnimateSequence(arg_2_0.Tier2.Stars, "Tier2")
	ACTIONS.AnimateSequence(arg_2_0.Tier3.Stars, "Tier3")

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function TrialSkinnyReward(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 650 * _1080p, 0, 450 * _1080p)

	var_3_0.id = "TrialSkinnyReward"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "Rewards"

	var_3_4:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_3_4:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_REWARDS"), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 18, _1080p * -18, _1080p * 10, _1080p * -404)
	var_3_0:addElement(var_3_4)

	var_3_0.Rewards = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "HowManyStars"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_HOW_MANY_STARS"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -243, _1080p * 247, _1080p * -33, _1080p * -15)
	var_3_0:addElement(var_3_6)

	var_3_0.HowManyStars = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "RewardName"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_8:SetAlpha(0, 0)
	var_3_8:setText("XP REWARDS", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 77, _1080p * 577, _1080p * 64, _1080p * 88)
	var_3_0:addElement(var_3_8)

	var_3_0.RewardName = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Tier3RewardImage"

	var_3_10:SetScale(0.5, 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 143, _1080p * 289, _1080p * -152, _1080p * -5)
	var_3_0:addElement(var_3_10)

	var_3_0.Tier3RewardImage = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Tier2RewardImage"

	var_3_12:SetScale(0.5, 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -73, _1080p * 73, _1080p * -152, _1080p * -5)
	var_3_0:addElement(var_3_12)

	var_3_0.Tier2RewardImage = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "Tier1RewardImage"

	var_3_14:SetScale(0.5, 0)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -289, _1080p * -143, _1080p * -152, _1080p * -5)
	var_3_0:addElement(var_3_14)

	var_3_0.Tier1RewardImage = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("TrialSkinnyRewardTier", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "Tier1"

	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 199, _1080p * 290, _1080p * 400)
	var_3_0:addElement(var_3_16)

	var_3_0.Tier1 = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("TrialSkinnyRewardTier", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "Tier2"

	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 234, _1080p * 416, _1080p * 290, _1080p * 400)
	var_3_0:addElement(var_3_18)

	var_3_0.Tier2 = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("TrialSkinnyRewardTier", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "Tier3"

	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 450, _1080p * 632, _1080p * 290, _1080p * 400)
	var_3_0:addElement(var_3_20)

	var_3_0.Tier3 = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIText.new()

	var_3_22.id = "Tier1Reward"

	var_3_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_22:setText("", 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_22:SetAlignment(LUI.Alignment.Center)
	var_3_22:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 42, _1080p * 174, _1080p * 229, _1080p * 265)
	var_3_0:addElement(var_3_22)

	var_3_0.Tier1Reward = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIText.new()

	var_3_24.id = "Tier2Reward"

	var_3_24:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_24:setText("", 0)
	var_3_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_24:SetAlignment(LUI.Alignment.Center)
	var_3_24:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 259, _1080p * 391, _1080p * 229, _1080p * 265)
	var_3_0:addElement(var_3_24)

	var_3_0.Tier2Reward = var_3_24

	local var_3_25
	local var_3_26 = LUI.UIText.new()

	var_3_26.id = "Tier3Reward"

	var_3_26:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_26:setText("", 0)
	var_3_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_26:SetAlignment(LUI.Alignment.Center)
	var_3_26:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 475, _1080p * 607, _1080p * 229, _1080p * 265)
	var_3_0:addElement(var_3_26)

	var_3_0.Tier3Reward = var_3_26

	local function var_3_27()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_27

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_28)

	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 299
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -307
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 95
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_30)

	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -289
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -143
		}
	}

	var_3_10:RegisterAnimationSequence("AR", var_3_31)

	local var_3_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 143
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 289
		}
	}

	var_3_14:RegisterAnimationSequence("AR", var_3_32)

	local var_3_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 450
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 632
		}
	}

	var_3_16:RegisterAnimationSequence("AR", var_3_33)

	local var_3_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		}
	}

	var_3_20:RegisterAnimationSequence("AR", var_3_34)

	local var_3_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 475
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 607
		}
	}

	var_3_22:RegisterAnimationSequence("AR", var_3_35)

	local var_3_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 174
		}
	}

	var_3_26:RegisterAnimationSequence("AR", var_3_36)

	local function var_3_37()
		var_3_4:AnimateSequence("AR")
		var_3_6:AnimateSequence("AR")
		var_3_8:AnimateSequence("AR")
		var_3_10:AnimateSequence("AR")
		var_3_14:AnimateSequence("AR")
		var_3_16:AnimateSequence("AR")
		var_3_20:AnimateSequence("AR")
		var_3_22:AnimateSequence("AR")
		var_3_26:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_37

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TrialSkinnyReward", TrialSkinnyReward)
LockTable(_M)
