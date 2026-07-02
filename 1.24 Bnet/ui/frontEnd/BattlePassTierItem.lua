module(..., package.seeall)

local var_0_0 = 150 * _1080p
local var_0_1 = 200 * _1080p
local var_0_2 = 150

local function var_0_3(arg_1_0)
	arg_1_0._isOver = true

	arg_1_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_1, 0, 0, var_0_2)

	local var_1_0 = arg_1_0.lootData.type

	if var_1_0 and (var_1_0 == LOOT.itemTypes.PLAYERCARD or var_1_0 == LOOT.itemTypes.EMBLEM or var_1_0 == LOOT.itemTypes.CHARM or var_1_0 == LOOT.itemTypes.STICKER or var_1_0 == LOOT.itemTypes.GESTURES or var_1_0 == LOOT.itemTypes.SPRAYS or var_1_0 == LOOT.itemTypes.FEATURE and not arg_1_0.lootData.isOperatorChallenge or var_1_0 == LOOT.itemTypes.CONSUMABLE or var_1_0 == "xp") then
		ACTIONS.AnimateSequence(arg_1_0.LootItemCard, "FocusGained")
	end

	ACTIONS.AnimateSequence(arg_1_0, "ButtonOver")
	arg_1_0.LootItemCard.ItemType:SetRGBFromTable(arg_1_0.lootData.rarityColor, 150)
end

local function var_0_4(arg_2_0)
	arg_2_0._isOver = false

	arg_2_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_0, 0, 0, var_0_2)
	ACTIONS.AnimateSequence(arg_2_0.LootItemCard, "FocusLost")
	ACTIONS.AnimateSequence(arg_2_0, "ButtonUp")
	arg_2_0.LootItemCard.ItemType:SetRGBFromTable(SWATCHES.AAR.AARdescription, 150)
end

local function var_0_5(arg_3_0, arg_3_1)
	arg_3_0.LootItemCard:UpdateCardConfig(arg_3_1)
end

local function var_0_6(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetCardData = var_0_5

	arg_4_0:addEventHandler("button_over", var_0_3)
	arg_4_0:addEventHandler("button_up", var_0_4)
	arg_4_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_0, 0, 0)
	arg_4_0:SetGridChildDynamicSize(true, LUI.DIRECTION.horizontal)
	arg_4_0:setGainFocusAllSFX(SOUND_SETS.battlePass.bpCardHighlight, {
		clearChildrenSFX = true
	})
end

function BattlePassTierItem(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 160 * _1080p, 0, 238 * _1080p)

	var_5_0.id = "BattlePassTierItem"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "LootItemCard"

	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -231, _1080p * -45)
	var_5_0:addElement(var_5_4)

	var_5_0.LootItemCard = var_5_4

	local function var_5_5()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_5

	local var_5_6 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -95
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_6)

	local function var_5_7()
		var_5_4:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_7

	local var_5_8 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_8)

	local function var_5_9()
		var_5_4:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_9

	var_0_6(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BattlePassTierItem", BattlePassTierItem)
LockTable(_M)
