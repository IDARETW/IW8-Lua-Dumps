module(..., package.seeall)

function BattlePassTierProgressionLoot(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 200 * _1080p)

	var_1_0.id = "BattlePassTierProgressionLoot"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Card"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Card = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Darkener"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_6:SetAlpha(0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Darkener = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "LockedIcon"

	var_1_8:SetAlpha(0, 0)
	var_1_8:setImage(RegisterMaterial("battlepass_lock"), 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -30, _1080p * -5, _1080p * 5, _1080p * 31)
	var_1_0:addElement(var_1_8)

	var_1_0.LockedIcon = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("BattlePassFlare", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "Flare"

	var_1_10:SetScale(-0.2, 0)
	var_1_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -25, _1080p * 25, _1080p * 66, _1080p * 104)
	var_1_0:addElement(var_1_10)

	var_1_0.Flare = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Locked", var_1_12)

	local var_1_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Locked", var_1_13)

	local function var_1_14()
		var_1_6:AnimateSequence("Locked")
		var_1_8:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_14

	local var_1_15 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("LockedSnap", var_1_15)

	local var_1_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("LockedSnap", var_1_16)

	local function var_1_17()
		var_1_6:AnimateSequence("LockedSnap")
		var_1_8:AnimateSequence("LockedSnap")
	end

	var_1_0._sequences.LockedSnap = var_1_17

	return var_1_0
end

MenuBuilder.registerType("BattlePassTierProgressionLoot", BattlePassTierProgressionLoot)
LockTable(_M)
