module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.RewardB
	local var_1_1 = arg_1_1.loot
	local var_1_2 = arg_1_1.xp

	if (not var_1_1 or var_1_1.unlocked) and (not var_1_2 or var_1_2.amount == 0) then
		ACTIONS.AnimateSequence(arg_1_0, "HideAll")
	else
		if var_1_1 and not var_1_1.unlocked then
			ACTIONS.AnimateSequence(arg_1_0, "LootReward")
			arg_1_0.RewardA:UpdateCardConfig(var_1_1)
		else
			ACTIONS.AnimateSequence(arg_1_0, "XpReward")

			var_1_0 = arg_1_0.RewardA
		end

		if var_1_2 and var_1_2.amount > 0 then
			var_1_0:SetAlpha(1)

			var_1_2.amount = Engine.CBBHFCGDIC("CHALLENGE/N_XP", var_1_2.amount)

			var_1_0:UpdateCardConfig(var_1_2)
		else
			var_1_0:SetAlpha(0)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupRewards = var_0_0

	local var_2_0 = true

	arg_2_0.RewardA:SetMiniMode(var_2_0)
	arg_2_0.RewardB:SetMiniMode(var_2_0)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function TournamentRewardPreview(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 180 * _1080p, 0, 110 * _1080p)

	var_3_0.id = "TournamentRewardPreview"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "RewardA"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 82, 0, _1080p * 110)
	var_3_0:addElement(var_3_4)

	var_3_0.RewardA = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "RewardB"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 98, _1080p * 180, 0, _1080p * 110)
	var_3_0:addElement(var_3_6)

	var_3_0.RewardB = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Title"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_REWARD"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 180, _1080p * -27, _1080p * -7)
	var_3_0:addElement(var_3_8)

	var_3_0.Title = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("LootReward", var_3_10)

	local function var_3_11()
		var_3_6:AnimateSequence("LootReward")
	end

	var_3_0._sequences.LootReward = var_3_11

	local var_3_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("XpReward", var_3_12)

	local function var_3_13()
		var_3_6:AnimateSequence("XpReward")
	end

	var_3_0._sequences.XpReward = var_3_13

	local var_3_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("HideAll", var_3_14)

	local var_3_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("HideAll", var_3_15)

	local var_3_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("HideAll", var_3_16)

	local function var_3_17()
		var_3_4:AnimateSequence("HideAll")
		var_3_6:AnimateSequence("HideAll")
		var_3_8:AnimateSequence("HideAll")
	end

	var_3_0._sequences.HideAll = var_3_17

	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_18)

	local function var_3_19()
		var_3_8:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_19

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TournamentRewardPreview", TournamentRewardPreview)
LockTable(_M)
