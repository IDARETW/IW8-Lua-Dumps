module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0.LootCard and arg_1_0.LootCard.Card then
		arg_1_0:SetAlpha(1)
		arg_1_0.LootCard.Card:UpdateCardConfig(arg_1_2)
	else
		arg_1_0:SetAlpha(0)
	end

	arg_1_0.Name:SetAlpha(0)
	arg_1_0.Type:SetAlpha(0)
	arg_1_0.Image:SetAlpha(0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 and #arg_2_2 > 0 then
		local var_2_0 = RegisterMaterial(arg_2_2)
		local var_2_1 = Engine.DFEIGFBEH(var_2_0)

		arg_2_0.Image:setImage(var_2_0)

		if var_2_1 == 4 then
			ACTIONS.AnimateSequence(arg_2_0, "Update4x1")
		elseif var_2_1 > 1 and var_2_1 < 4 then
			ACTIONS.AnimateSequence(arg_2_0, "Update2x1")
		else
			ACTIONS.AnimateSequence(arg_2_0, "Update1x1")
		end

		arg_2_0.Image:SetAlpha(1)
	else
		arg_2_0.Image:SetAlpha(0)
	end

	arg_2_0.LootCard:SetAlpha(0)
	arg_2_0.Name:SetAlpha(1)
	arg_2_0.Type:SetAlpha(1)
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupImage = var_0_1
	arg_3_0.SetupLootReward = var_0_0

	arg_3_0:SetAlpha(0)
end

function AARUnlockItem(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 250 * _1080p)

	var_4_0.id = "AARUnlockItem"
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

	var_4_4.id = "Image"

	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -165, _1080p * 165, _1080p * 40, _1080p * 190)
	var_4_0:addElement(var_4_4)

	var_4_0.Image = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "Type"

	var_4_6:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -60, _1080p * -36)
	var_4_0:addElement(var_4_6)

	var_4_0.Type = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Name"

	var_4_8:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -30, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.Name = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("BattlePassTierProgressionLoot", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "LootCard"

	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -75, _1080p * 75, _1080p * 40, _1080p * 240)
	var_4_0:addElement(var_4_10)

	var_4_0.LootCard = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 75
		}
	}

	var_4_4:RegisterAnimationSequence("Update1x1", var_4_12)

	local function var_4_13()
		var_4_4:AnimateSequence("Update1x1")
	end

	var_4_0._sequences.Update1x1 = var_4_13

	local var_4_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 190
		}
	}

	var_4_4:RegisterAnimationSequence("Update2x1", var_4_14)

	local function var_4_15()
		var_4_4:AnimateSequence("Update2x1")
	end

	var_4_0._sequences.Update2x1 = var_4_15

	local var_4_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_16)

	local var_4_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOver", var_4_17)

	local function var_4_18()
		var_4_6:AnimateSequence("ButtonOver")
		var_4_8:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_18

	local var_4_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.mostWantedCards.headerBackground
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_19)

	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUp", var_4_20)

	local function var_4_21()
		var_4_6:AnimateSequence("ButtonUp")
		var_4_8:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_21

	local var_4_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -166
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 166
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 150
		}
	}

	var_4_4:RegisterAnimationSequence("Update4x1", var_4_22)

	local function var_4_23()
		var_4_4:AnimateSequence("Update4x1")
	end

	var_4_0._sequences.Update4x1 = var_4_23

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("AARUnlockItem", AARUnlockItem)
LockTable(_M)
