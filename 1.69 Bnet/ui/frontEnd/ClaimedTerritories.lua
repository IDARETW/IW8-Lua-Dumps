module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = WORLD_MAP.GetClaimedTerritories()
	local var_1_1 = "Claimed" .. var_1_0

	assert(arg_1_0._sequences[var_1_1])
	ACTIONS.AnimateSequence(arg_1_0, var_1_1)
end

function ClaimedTerritories(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 70 * _1080p)

	var_2_0.id = "ClaimedTerritories"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIStyledText.new()

	var_2_4.id = "NumClaimedTerritories"

	var_2_4:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_2_4:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAIMED_TERRITORIES"), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 268, _1080p * 7, _1080p * 35)
	var_2_0:addElement(var_2_4)

	var_2_0.NumClaimedTerritories = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "ClaimedTerritories"

	var_2_6:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_2_6:setText("0/3", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 166, _1080p * 41, _1080p * 69)
	var_2_0:addElement(var_2_6)

	var_2_0.ClaimedTerritories = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "claimedSlot1"

	var_2_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_2_8:setImage(RegisterMaterial("cac_equip_ring"), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 273, _1080p * 297, _1080p * 22, _1080p * 48)
	var_2_0:addElement(var_2_8)

	var_2_0.claimedSlot1 = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIImage.new()

	var_2_10.id = "claimedSlot2"

	var_2_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_2_10:setImage(RegisterMaterial("cac_equip_ring"), 0)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 302, _1080p * 326, _1080p * 22, _1080p * 48)
	var_2_0:addElement(var_2_10)

	var_2_0.claimedSlot2 = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIImage.new()

	var_2_12.id = "claimedSlot3"

	var_2_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_2_12:setImage(RegisterMaterial("cac_equip_ring"), 0)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 331, _1080p * 355, _1080p * 22, _1080p * 48)
	var_2_0:addElement(var_2_12)

	var_2_0.claimedSlot3 = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIImage.new()

	var_2_14.id = "Present"

	var_2_14:setImage(RegisterMaterial("placeholder_x"), 0)
	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 366, _1080p * 408, _1080p * 12, _1080p * 54)
	var_2_0:addElement(var_2_14)

	var_2_0.Present = var_2_14

	local function var_2_15()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_15

	local var_2_16 = {
		{
			value = "1/3",
			duration = 0,
			property = TWEEN_PROPERTY.Text
		}
	}

	var_2_6:RegisterAnimationSequence("Claimed1", var_2_16)

	local var_2_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		}
	}

	var_2_8:RegisterAnimationSequence("Claimed1", var_2_17)

	local var_2_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		}
	}

	var_2_10:RegisterAnimationSequence("Claimed1", var_2_18)

	local var_2_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		}
	}

	var_2_12:RegisterAnimationSequence("Claimed1", var_2_19)

	local function var_2_20()
		var_2_6:AnimateSequence("Claimed1")
		var_2_8:AnimateSequence("Claimed1")
		var_2_10:AnimateSequence("Claimed1")
		var_2_12:AnimateSequence("Claimed1")
	end

	var_2_0._sequences.Claimed1 = var_2_20

	local var_2_21 = {
		{
			value = "2/3",
			duration = 0,
			property = TWEEN_PROPERTY.Text
		}
	}

	var_2_6:RegisterAnimationSequence("Claimed2", var_2_21)

	local var_2_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		}
	}

	var_2_8:RegisterAnimationSequence("Claimed2", var_2_22)

	local var_2_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		}
	}

	var_2_10:RegisterAnimationSequence("Claimed2", var_2_23)

	local var_2_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		}
	}

	var_2_12:RegisterAnimationSequence("Claimed2", var_2_24)

	local function var_2_25()
		var_2_6:AnimateSequence("Claimed2")
		var_2_8:AnimateSequence("Claimed2")
		var_2_10:AnimateSequence("Claimed2")
		var_2_12:AnimateSequence("Claimed2")
	end

	var_2_0._sequences.Claimed2 = var_2_25

	local var_2_26 = {
		{
			value = "3/3",
			duration = 0,
			property = TWEEN_PROPERTY.Text
		}
	}

	var_2_6:RegisterAnimationSequence("Claimed3", var_2_26)

	local var_2_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		}
	}

	var_2_8:RegisterAnimationSequence("Claimed3", var_2_27)

	local var_2_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		}
	}

	var_2_10:RegisterAnimationSequence("Claimed3", var_2_28)

	local var_2_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		}
	}

	var_2_12:RegisterAnimationSequence("Claimed3", var_2_29)

	local function var_2_30()
		var_2_6:AnimateSequence("Claimed3")
		var_2_8:AnimateSequence("Claimed3")
		var_2_10:AnimateSequence("Claimed3")
		var_2_12:AnimateSequence("Claimed3")
	end

	var_2_0._sequences.Claimed3 = var_2_30

	local var_2_31 = {
		{
			value = "0/3",
			duration = 0,
			property = TWEEN_PROPERTY.Text
		}
	}

	var_2_6:RegisterAnimationSequence("Claimed0", var_2_31)

	local var_2_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		}
	}

	var_2_8:RegisterAnimationSequence("Claimed0", var_2_32)

	local var_2_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		}
	}

	var_2_10:RegisterAnimationSequence("Claimed0", var_2_33)

	local var_2_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		}
	}

	var_2_12:RegisterAnimationSequence("Claimed0", var_2_34)

	local function var_2_35()
		var_2_6:AnimateSequence("Claimed0")
		var_2_8:AnimateSequence("Claimed0")
		var_2_10:AnimateSequence("Claimed0")
		var_2_12:AnimateSequence("Claimed0")
	end

	var_2_0._sequences.Claimed0 = var_2_35

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ClaimedTerritories", ClaimedTerritories)
LockTable(_M)
