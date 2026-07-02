module(..., package.seeall)

local var_0_0 = -5 * _1080p

local function var_0_1(arg_1_0)
	local var_1_0 = LAYOUT.GetTextWidth(arg_1_0.RewardCount)

	arg_1_0.Backer:SetLeft(arg_1_0.RewardCount:GetCurrentAnchorsAndPositions().right - var_1_0 + var_0_0)
end

local function var_0_2(arg_2_0, arg_2_1)
	if arg_2_1 then
		assert(arg_2_1.amount)
		assert(arg_2_1.image)
		arg_2_0.RewardCount:setText(arg_2_1.amount)

		local var_2_0 = RegisterMaterial(arg_2_1.image)
		local var_2_1 = Engine.DFEIGFBEH(var_2_0)

		arg_2_0.ChallengeRewardIcon:setImage(var_2_0)

		if var_2_1 > 1 then
			ACTIONS.AnimateSequence(arg_2_0, "Icon2x1")
		else
			ACTIONS.AnimateSequence(arg_2_0, "Icon1x1")
		end

		if arg_2_1.color then
			arg_2_0.ChallengeRewardIcon:SetRGBFromTable(arg_2_1.color)
		end
	end

	arg_2_0:UpdateBacker()
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Setup = var_0_2
	arg_3_0.UpdateBacker = var_0_1
end

function ChallengeReward(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 50 * _1080p)

	var_4_0.id = "ChallengeReward"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Backer"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_4:SetAlpha(0.3, 0)
	var_4_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_4_4:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -100, _1080p * 29, _1080p * 22, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Backer = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "ChallengeRewardIcon"

	var_4_6:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_4_6:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * 5, _1080p * 29, _1080p * -26, _1080p * -2)
	var_4_0:addElement(var_4_6)

	var_4_0.ChallengeRewardIcon = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "RewardCount"

	var_4_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_8:setText("30000", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Right)
	var_4_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -100, 0, _1080p * -28, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.RewardCount = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 15
		}
	}

	var_4_4:RegisterAnimationSequence("Icon1x1", var_4_10)

	local var_4_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 29
		}
	}

	var_4_6:RegisterAnimationSequence("Icon1x1", var_4_11)

	local var_4_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_4_8:RegisterAnimationSequence("Icon1x1", var_4_12)

	local function var_4_13()
		var_4_4:AnimateSequence("Icon1x1")
		var_4_6:AnimateSequence("Icon1x1")
		var_4_8:AnimateSequence("Icon1x1")
	end

	var_4_0._sequences.Icon1x1 = var_4_13

	local var_4_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 3
		}
	}

	var_4_4:RegisterAnimationSequence("Icon2x1", var_4_14)

	local var_4_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 29
		}
	}

	var_4_6:RegisterAnimationSequence("Icon2x1", var_4_15)

	local var_4_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -24
		}
	}

	var_4_8:RegisterAnimationSequence("Icon2x1", var_4_16)

	local function var_4_17()
		var_4_4:AnimateSequence("Icon2x1")
		var_4_6:AnimateSequence("Icon2x1")
		var_4_8:AnimateSequence("Icon2x1")
	end

	var_4_0._sequences.Icon2x1 = var_4_17

	var_0_3(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ChallengeReward", ChallengeReward)
LockTable(_M)
