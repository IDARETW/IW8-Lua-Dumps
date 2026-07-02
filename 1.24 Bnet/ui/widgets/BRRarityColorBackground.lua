module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0, "ShowColor")

	if arg_1_1 < BRLOOT.itemRarities.COMMON or arg_1_1 > BRLOOT.itemRarities.MISSION then
		arg_1_1 = BRLOOT.itemRarities.COMMON
	end

	local var_1_0 = BRLOOT.itemRarityData[arg_1_1].swatch

	if var_1_0 then
		arg_1_0.RarityHighlight:SetRGBFromTable(var_1_0)
		arg_1_0.RarityBackground:SetRGBFromTable(var_1_0)
	end
end

local function var_0_1(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, "DefaultSequence")
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.ShowRarityColor = var_0_0
	arg_3_0.HideRarityColor = var_0_1
end

function BRRarityColorBackground(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p)

	var_4_0.id = "BRRarityColorBackground"
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

	var_4_4.id = "RarityBackground"

	var_4_4:SetAlpha(0, 0)
	var_4_4:SetPixelGridEnabled(true)
	var_4_4:SetPixelGridContrast(0.1, 0)
	var_4_4:SetPixelGridBlockWidth(2, 0)
	var_4_4:SetPixelGridBlockHeight(2, 0)
	var_4_4:SetPixelGridGutterWidth(1, 0)
	var_4_4:SetPixelGridGutterHeight(1, 0)
	var_4_4:setImage(RegisterMaterial("ui_mp_br_loot_card_rarity_bkg"), 0)
	var_4_0:addElement(var_4_4)

	var_4_0.RarityBackground = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "RarityHighlight"

	var_4_6:SetAlpha(0, 0)
	var_4_6:setImage(RegisterMaterial("ui_mp_br_loot_card_rarity_edge"), 0)
	var_4_6:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_4_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -13, _1080p * 12)
	var_4_0:addElement(var_4_6)

	var_4_0.RarityHighlight = var_4_6

	local var_4_7 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("DefaultSequence", var_4_7)

	local var_4_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("DefaultSequence", var_4_8)

	local function var_4_9()
		var_4_4:AnimateSequence("DefaultSequence")
		var_4_6:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ShowColor", var_4_10)

	local var_4_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ShowColor", var_4_11)

	local function var_4_12()
		var_4_4:AnimateSequence("ShowColor")
		var_4_6:AnimateSequence("ShowColor")
	end

	var_4_0._sequences.ShowColor = var_4_12

	var_0_2(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("BRRarityColorBackground", BRRarityColorBackground)
LockTable(_M)
