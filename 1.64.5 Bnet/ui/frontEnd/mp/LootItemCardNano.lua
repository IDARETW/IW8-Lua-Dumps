module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1.type and arg_1_1.ref and #arg_1_1.ref > 0 and arg_1_1.lootID, "Invalid reward data.")

	if not arg_1_1.image or #arg_1_1.image == 0 then
		arg_1_1.image = LOOT.GetItemImage(arg_1_1.type, arg_1_1.ref, arg_1_1.lootID)
	end

	if not arg_1_1.rarity and type(arg_1_1.type) == "number" then
		arg_1_1.rarity = tonumber(LOOT.GetItemQuality(arg_1_1.type, arg_1_1.ref))
	end

	if not arg_1_1.rarityImage then
		arg_1_1.rarityImage = LOOT.GetRarityImage(arg_1_1.rarity)
	end

	if not arg_1_1.rarityColor then
		arg_1_1.rarityColor = LOOT.GetRarityColor(arg_1_1.rarity)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.RarityIcon:setImage(RegisterMaterial(arg_2_1.rarityImage))
	LOOT.ApplyRarityIconColoring(arg_2_0.RarityIcon, arg_2_1.rarity)
	arg_2_0.RarityIconBackground:SetRGBFromTable(arg_2_1.rarityColor)
	arg_2_0.RarityBorder:SetRGBFromTable(arg_2_1.rarityColor)
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.ItemImage:setImage(RegisterMaterial(arg_3_1.image))
end

local function var_0_3(arg_4_0, arg_4_1)
	var_0_0(arg_4_0, arg_4_1)
	var_0_1(arg_4_0, arg_4_1)
	var_0_2(arg_4_0, arg_4_1)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetRewardData = var_0_3
end

function LootItemCardNano(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 75 * _1080p, 0, 100 * _1080p)

	var_6_0.id = "LootItemCardNano"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_5 = LUI.UIBorder.new(var_6_4)

	var_6_5.id = "RarityBorder"

	var_6_5:SetRGBFromTable(SWATCHES.itemRarity.quality2, 0)
	var_6_0:addElement(var_6_5)

	var_6_0.RarityBorder = var_6_5

	local var_6_6
	local var_6_7 = LUI.UIImage.new()

	var_6_7.id = "RarityIconBackground"

	var_6_7:SetRGBFromTable(SWATCHES.itemRarity.quality2, 0)
	var_6_7:setImage(RegisterMaterial("battlepass_center_in_gradient_small"), 0)
	var_6_7:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 1, _1080p * -1, _1080p * -19, _1080p * -1)
	var_6_0:addElement(var_6_7)

	var_6_0.RarityIconBackground = var_6_7

	local var_6_8
	local var_6_9 = LUI.UIImage.new()

	var_6_9.id = "RarityIcon"

	var_6_9:SetRGBFromTable(SWATCHES.itemRarity.quality2, 0)
	var_6_9:setImage(RegisterMaterial("icon_rarity_4"), 0)
	var_6_9:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 30, _1080p * -29, _1080p * -18, _1080p * -2)
	var_6_0:addElement(var_6_9)

	var_6_0.RarityIcon = var_6_9

	local var_6_10
	local var_6_11 = LUI.UIImage.new()

	var_6_11.id = "ItemImage"

	var_6_11:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_6_11:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -19)
	var_6_0:addElement(var_6_11)

	var_6_0.ItemImage = var_6_11

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("LootItemCardNano", LootItemCardNano)
LockTable(_M)
