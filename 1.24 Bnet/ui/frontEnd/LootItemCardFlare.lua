module(..., package.seeall)

function LootItemCardFlare(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_1_0.id = "LootItemCardFlare"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Flare"

	var_1_4:SetAlpha(0, 0)
	var_1_4:setImage(RegisterMaterial("loot_card_border_flare_rare_20"), 0)
	var_1_4:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256)
	var_1_0:addElement(var_1_4)

	var_1_0.Flare = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6
	local var_1_7 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_00")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.addWithAlpha
		},
		{
			value = 1,
			duration = 700,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_01")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_02")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_03")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_04")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_05")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_06")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_07")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_08")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_09")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_10")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_11")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_12")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_13")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_14")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_15")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_16")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_17")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_18")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_19")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_20")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_21")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_22")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_23")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_24")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_25")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_26")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_27")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_rare_28")
		},
		{
			value = 0,
			duration = 25,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Rare", var_1_7)

	local function var_1_8()
		var_1_4:AnimateSequence("Rare")
	end

	var_1_0._sequences.Rare = var_1_8

	local var_1_9
	local var_1_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_00")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -206
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 306
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.addWithAlpha
		},
		{
			value = 1,
			duration = 1450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_01")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_02")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_03")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_04")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_05")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_06")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_07")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_08")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_09")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_10")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_11")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_12")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_13")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_14")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_15")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_16")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_17")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_18")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_19")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_20")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_21")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_22")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_23")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_24")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_25")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_26")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_27")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_28")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_legendary_29")
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Legendary", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("Legendary")
	end

	var_1_0._sequences.Legendary = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_00")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.addWithAlpha
		},
		{
			value = 1,
			duration = 1300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_01")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_02")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_03")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_04")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_05")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_06")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_07")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_08")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_09")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_10")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_11")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_12")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_13")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_14")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_15")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_16")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_17")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_18")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_19")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_20")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_21")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_22")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_23")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_24")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_25")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_epic_26")
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Epic", var_1_13)

	local function var_1_14()
		var_1_4:AnimateSequence("Epic")
	end

	var_1_0._sequences.Epic = var_1_14

	local var_1_15
	local var_1_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_00")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.addWithAlpha
		},
		{
			value = 1,
			duration = 1450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_01")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_02")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_03")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_04")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_05")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_06")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_07")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_08")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_09")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_10")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_11")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_12")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_13")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_14")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_15")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_16")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_17")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_18")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_19")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_20")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_21")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_22")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_23")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_24")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_25")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_26")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_27")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_28")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_common_29")
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Common", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("Common")
	end

	var_1_0._sequences.Common = var_1_17

	local var_1_18
	local var_1_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("StopEffect", var_1_19)

	local function var_1_20()
		var_1_4:AnimateSequence("StopEffect")
	end

	var_1_0._sequences.StopEffect = var_1_20

	local var_1_21
	local var_1_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_00")
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.blend
		},
		{
			value = 1,
			duration = 1450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_01")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_02")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_03")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_04")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_05")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_06")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_07")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_08")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_09")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_10")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_11")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_12")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_13")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_14")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_15")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_16")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_17")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_18")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_19")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_20")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_21")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_22")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_23")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_24")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_25")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_26")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_27")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_28")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_29")
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("BattlePassPurchased", var_1_22)

	local function var_1_23()
		var_1_4:AnimateSequence("BattlePassPurchased")
	end

	var_1_0._sequences.BattlePassPurchased = var_1_23

	local var_1_24
	local var_1_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_00")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.addWithAlpha
		},
		{
			value = 1,
			duration = 1450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_01")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_02")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_03")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_04")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_05")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_06")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_07")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_08")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_09")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_10")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_11")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_12")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_13")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_14")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_15")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_16")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_17")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_18")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_19")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_20")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_21")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_22")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_23")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_24")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_25")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_26")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_27")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_28")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_base_29")
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Base", var_1_25)

	local function var_1_26()
		var_1_4:AnimateSequence("Base")
	end

	var_1_0._sequences.Base = var_1_26

	local var_1_27
	local var_1_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_00")
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.blend
		},
		{
			value = 1,
			duration = 725,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_01")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_02")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_03")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_04")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_05")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_06")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_07")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_08")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_09")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_10")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_11")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_12")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_13")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_14")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_15")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_16")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_17")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_18")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_19")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_20")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_21")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_22")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_23")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_24")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_25")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_26")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_27")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_28")
		},
		{
			duration = 25,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_flare_battlepass_29")
		},
		{
			value = 0,
			duration = 25,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("BattlePassPurchasedFast", var_1_28)

	local function var_1_29()
		var_1_4:AnimateSequence("BattlePassPurchasedFast")
	end

	var_1_0._sequences.BattlePassPurchasedFast = var_1_29

	local var_1_30
	local var_1_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_00")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.blend
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_01")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_02")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_03")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_04")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_05")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_06")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_07")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_08")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_09")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_10")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_11")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_12")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_13")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_14")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_15")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_16")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_17")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_18")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_19")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_20")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_21")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_22")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_23")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_24")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_25")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_26")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_27")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_28")
		}
	}

	var_1_4:RegisterAnimationSequence("BattlePassIntroduction", var_1_31)

	local function var_1_32()
		var_1_4:AnimateLoop("BattlePassIntroduction")
	end

	var_1_0._sequences.BattlePassIntroduction = var_1_32

	local var_1_33
	local var_1_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_00")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.addWithAlpha
		},
		{
			value = 1,
			duration = 1400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_01")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_02")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_03")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_04")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_05")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_06")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_07")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_08")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_09")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_10")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_11")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_12")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_13")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_14")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_15")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_16")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_17")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_18")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_19")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_20")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_21")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_22")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_23")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_24")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_25")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_26")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_27")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_overlay_smoke_28")
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("Smoke", var_1_34)

	local function var_1_35()
		var_1_4:AnimateSequence("Smoke")
	end

	var_1_0._sequences.Smoke = var_1_35

	local var_1_36
	local var_1_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_00")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.blend
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_01")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_02")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_03")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_04")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_05")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_06")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_07")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_08")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_09")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_10")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_11")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_12")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_13")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_14")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_15")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_16")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_17")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_18")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_19")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_20")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_21")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_22")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_23")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_24")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_25")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_26")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_27")
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("loot_card_border_introduction_28")
		}
	}

	var_1_4:RegisterAnimationSequence("SpecialItemHighlight", var_1_37)

	local function var_1_38()
		var_1_4:AnimateLoop("SpecialItemHighlight")
	end

	var_1_0._sequences.SpecialItemHighlight = var_1_38

	return var_1_0
end

MenuBuilder.registerType("LootItemCardFlare", LootItemCardFlare)
LockTable(_M)
