module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0
	local var_1_1 = PROGRESSION.GetClanNextRankUnlocks(arg_1_0, 1, false)

	if var_1_1 then
		for iter_1_0, iter_1_1 in pairs(var_1_1) do
			for iter_1_2, iter_1_3 in pairs(iter_1_1) do
				var_1_0 = iter_1_3
			end
		end
	end

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = var_0_0(arg_2_1)

	if var_2_0 then
		local var_2_1 = {
			type = var_2_0.lootType,
			ref = var_2_0.lootRef,
			lootID = var_2_0.lootID
		}

		arg_2_0.RewardCard:SetRewardData(var_2_1)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = PROGRESSION.GetClanRankMinXP(arg_3_2)
	local var_3_1 = PROGRESSION.GetClanRankMaxXP(arg_3_2)
	local var_3_2 = PROGRESSION.GetClanXP(arg_3_1) - var_3_0
	local var_3_3 = PROGRESSION.GetClanRankPercentageFromXPValues(var_3_2, var_3_0, var_3_1)

	arg_3_0.XPProgressBar:SetProgress(var_3_3)
	arg_3_0.XPLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y_XP", var_3_2, var_3_1))
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = not arg_4_2 and "LUA_MENU/CLAN_LEVEL_VALUE" or "LUA_MENU/CLAN_LEVEL_VALUE_MAX"

	arg_4_0.ClanLevelLabel:setText(Engine.CBBHFCGDIC(var_4_0, arg_4_1))
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = PROGRESSION.GetClanRank(arg_5_1)
	local var_5_1 = PROGRESSION.GetClanDisplayRank(arg_5_1)
	local var_5_2 = var_5_0 == PROGRESSION.GetMaxClanRank()

	var_0_3(arg_5_0, var_5_1, var_5_2)

	if not var_5_2 then
		var_0_2(arg_5_0, arg_5_1, var_5_0)
		var_0_1(arg_5_0, var_5_1)
	else
		ACTIONS.AnimateSequence(arg_5_0, "MaxRank")
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.SetClanProgression = var_0_4
end

function ClanProgressionWidget(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 100 * _1080p)

	var_7_0.id = "ClanProgressionWidget"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("LootItemCardNano", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "RewardCard"

	var_7_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -75, 0, 0, _1080p * 100)
	var_7_0:addElement(var_7_4)

	var_7_0.RewardCard = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIStyledText.new()

	var_7_6.id = "NextUnlocksLabel"

	var_7_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_7_6:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PROGRESSION_NEXT_UNLOCKS"), 0)
	var_7_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_6:SetWordWrap(false)
	var_7_6:SetAlignment(LUI.Alignment.Right)
	var_7_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -265, _1080p * -85, _1080p * 80, _1080p * 100)
	var_7_0:addElement(var_7_6)

	var_7_0.NextUnlocksLabel = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "XPProgressBar"

	var_7_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -85, _1080p * 58, _1080p * 68)
	var_7_0:addElement(var_7_8)

	var_7_0.XPProgressBar = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIStyledText.new()

	var_7_10.id = "ClanLevelLabel"

	var_7_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_7_10:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_LEVEL_VALUE"), 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetWordWrap(false)
	var_7_10:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 165, _1080p * 30, _1080p * 50)
	var_7_0:addElement(var_7_10)

	var_7_0.ClanLevelLabel = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIStyledText.new()

	var_7_12.id = "XPLabel"

	var_7_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_7_12:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y_XP"), 0)
	var_7_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_12:SetWordWrap(false)
	var_7_12:SetAlignment(LUI.Alignment.Right)
	var_7_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -265, _1080p * -85, _1080p * 30, _1080p * 50)
	var_7_0:addElement(var_7_12)

	var_7_0.XPLabel = var_7_12

	local function var_7_13()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_13

	local var_7_14
	local var_7_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("MaxRank", var_7_15)

	local var_7_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("MaxRank", var_7_16)

	local var_7_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("MaxRank", var_7_17)

	local var_7_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -500
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
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

	var_7_10:RegisterAnimationSequence("MaxRank", var_7_18)

	local var_7_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("MaxRank", var_7_19)

	local function var_7_20()
		var_7_4:AnimateSequence("MaxRank")
		var_7_6:AnimateSequence("MaxRank")
		var_7_8:AnimateSequence("MaxRank")
		var_7_10:AnimateSequence("MaxRank")
		var_7_12:AnimateSequence("MaxRank")
	end

	var_7_0._sequences.MaxRank = var_7_20

	var_0_5(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("ClanProgressionWidget", ClanProgressionWidget)
LockTable(_M)
