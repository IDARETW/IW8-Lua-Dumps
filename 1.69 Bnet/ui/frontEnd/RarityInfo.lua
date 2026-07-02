module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.RarityChance:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RULES_PERCENT", arg_1_1))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetPercentage = var_0_0
end

function RarityInfo(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 80 * _1080p, 0, 114 * _1080p)

	var_3_0.id = "RarityInfo"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Rarity"

	var_3_4:SetRGBFromTable(SWATCHES.itemRarity.quality0, 0)
	var_3_4:setImage(RegisterMaterial("icon_item_quality_1"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 80, 0, _1080p * 80)
	var_3_0:addElement(var_3_4)

	var_3_0.Rarity = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "RarityChance"

	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -40, _1080p * 40, _1080p * -24, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.RarityChance = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("RarityInfo", RarityInfo)
LockTable(_M)
