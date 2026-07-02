module(..., package.seeall)

local var_0_0 = 3

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	if arg_1_3 then
		arg_1_0.Title.Text:setText(arg_1_3)
	end

	local var_1_0 = #arg_1_2 > var_0_0 and var_0_0 or #arg_1_2

	if arg_1_4 then
		var_1_0 = arg_1_4
	end

	ACTIONS.AnimateSequence(arg_1_0, arg_1_0.lootCardLayoutAnimations[var_1_0])

	local var_1_1 = BATTLEPASS.GetTier(arg_1_1)

	for iter_1_0 = 1, var_1_0 do
		local var_1_2 = arg_1_0.lootCards[iter_1_0]
		local var_1_3 = arg_1_0.lootCardFreeBanners[iter_1_0]

		if arg_1_2[iter_1_0] then
			var_1_2.Card:UpdateCardConfig(arg_1_2[iter_1_0])

			if not BATTLEPASS.IsOwned(arg_1_1) and (not arg_1_2[iter_1_0].isFreeLoot or not arg_1_5) then
				ACTIONS.AnimateSequence(var_1_2, "LockedSnap")
			end

			if arg_1_2[iter_1_0].isFreeLoot then
				var_1_3:SetAlpha(1)
			else
				var_1_3:SetAlpha(0)
			end
		end
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.lootCards = {
		arg_2_0.LootCard,
		arg_2_0.LootCard2,
		arg_2_0.LootCard3
	}
	arg_2_0.lootCardFreeBanners = {
		arg_2_0.LootCardFreeBanner1,
		arg_2_0.LootCardFreeBanner2,
		arg_2_0.LootCardFreeBanner3
	}
	arg_2_0.lootCardLayoutAnimations = {
		"OneItem",
		"TwoItems",
		"ThreeItems"
	}
	arg_2_0.InitTierUnlocks = var_0_1
end

function BattlePassUnlockItem(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 580 * _1080p, 0, 360 * _1080p)

	var_3_0.id = "BattlePassUnlockItem"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("BattlePassTierProgressionLoot", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "LootCard3"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 405, _1080p * 555, _1080p * 83, _1080p * 283)
	var_3_0:addElement(var_3_4)

	var_3_0.LootCard3 = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("BattlePassTierProgressionLoot", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "LootCard2"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 215, _1080p * 365, _1080p * 83, _1080p * 283)
	var_3_0:addElement(var_3_6)

	var_3_0.LootCard2 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("BattlePassTierProgressionLoot", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "LootCard"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 175, _1080p * 83, _1080p * 283)
	var_3_0:addElement(var_3_8)

	var_3_0.LootCard = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "LootCardFreeBanner1"

	var_3_10:SetAlpha(0, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 175, _1080p * 59, _1080p * 83)
	var_3_0:addElement(var_3_10)

	var_3_0.LootCardFreeBanner1 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "LootCardFreeBanner2"

	var_3_12:SetAlpha(0, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 214, _1080p * 366, _1080p * 59, _1080p * 83)
	var_3_0:addElement(var_3_12)

	var_3_0.LootCardFreeBanner2 = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "LootCardFreeBanner3"

	var_3_14:SetAlpha(0, 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 405, _1080p * 555, _1080p * 59, _1080p * 83)
	var_3_0:addElement(var_3_14)

	var_3_0.LootCardFreeBanner3 = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "Title"

	var_3_16.Text:setText("", 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 250, 0, _1080p * 50)
	var_3_0:addElement(var_3_16)

	var_3_0.Title = var_3_16

	local function var_3_17()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_17

	local var_3_18
	local var_3_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("OneItem", var_3_19)

	local var_3_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("OneItem", var_3_20)

	local var_3_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("OneItem", var_3_21)

	local function var_3_22()
		var_3_4:AnimateSequence("OneItem")
		var_3_6:AnimateSequence("OneItem")
		var_3_8:AnimateSequence("OneItem")
	end

	var_3_0._sequences.OneItem = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("TwoItems", var_3_24)

	local var_3_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("TwoItems", var_3_25)

	local var_3_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("TwoItems", var_3_26)

	local function var_3_27()
		var_3_4:AnimateSequence("TwoItems")
		var_3_6:AnimateSequence("TwoItems")
		var_3_8:AnimateSequence("TwoItems")
	end

	var_3_0._sequences.TwoItems = var_3_27

	local var_3_28
	local var_3_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ThreeItems", var_3_29)

	local var_3_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ThreeItems", var_3_30)

	local var_3_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ThreeItems", var_3_31)

	local function var_3_32()
		var_3_4:AnimateSequence("ThreeItems")
		var_3_6:AnimateSequence("ThreeItems")
		var_3_8:AnimateSequence("ThreeItems")
	end

	var_3_0._sequences.ThreeItems = var_3_32

	local var_3_33
	local var_3_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 195
		}
	}

	var_3_16:RegisterAnimationSequence("RightAligned", var_3_34)

	local function var_3_35()
		var_3_16:AnimateSequence("RightAligned")
	end

	var_3_0._sequences.RightAligned = var_3_35

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BattlePassUnlockItem", BattlePassUnlockItem)
LockTable(_M)
