module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.RarityInfo1:SetPercentage(arg_1_1.rarityPercent1)
	arg_1_0.RarityInfo2:SetPercentage(arg_1_1.rarityPercent2)
	arg_1_0.RarityInfo3:SetPercentage(arg_1_1.rarityPercent3)
	arg_1_0.RarityInfo4:SetPercentage(arg_1_1.rarityPercent4)

	local var_1_0 = tonumber(arg_1_1.numSlots)
	local var_1_1 = {
		arg_1_1.slotTypeID1,
		arg_1_1.slotTypeID2,
		arg_1_1.slotTypeID3
	}
	local var_1_2 = {
		arg_1_0.Item1Label,
		arg_1_0.Item2Label,
		arg_1_0.Item3Label
	}
	local var_1_3 = {
		arg_1_0.Item1Desc,
		arg_1_0.Item2Desc,
		arg_1_0.Item3Desc
	}

	for iter_1_0 = 1, var_1_0 do
		local var_1_4 = LOOT.GetItemClassName(tonumber(var_1_1[iter_1_0]))
		local var_1_5 = LOOT.GetItemClassDesc(tonumber(var_1_1[iter_1_0]))

		var_1_2[iter_1_0]:setText(var_1_4)
		var_1_3[iter_1_0]:setText(var_1_5)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupData = var_0_0
end

function RarityOdds(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 545 * _1080p)

	var_3_0.id = "RarityOdds"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "RarityLabel"

	var_3_4:setText("Rarity Odds:", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 543, _1080p * 30, _1080p * 48)
	var_3_0:addElement(var_3_4)

	var_3_0.RarityLabel = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Item1Label"

	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 179, _1080p * 189, _1080p * 207)
	var_3_0:addElement(var_3_6)

	var_3_0.Item1Label = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Item2Label"

	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 180, _1080p * 297, _1080p * 315)
	var_3_0:addElement(var_3_8)

	var_3_0.Item2Label = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Item3Label"

	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 216, _1080p * 414, _1080p * 432)
	var_3_0:addElement(var_3_10)

	var_3_0.Item3Label = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "Item1Desc"

	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 530, _1080p * 215, _1080p * 233)
	var_3_0:addElement(var_3_12)

	var_3_0.Item1Desc = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "Item2Desc"

	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 530, _1080p * 322, _1080p * 340)
	var_3_0:addElement(var_3_14)

	var_3_0.Item2Desc = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "Item3Desc"

	var_3_16:setText("", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 530, _1080p * 442, _1080p * 460)
	var_3_0:addElement(var_3_16)

	var_3_0.Item3Desc = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("RarityInfo", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "RarityInfo1"

	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 430, _1080p * 510, _1080p * 63, _1080p * 177)
	var_3_0:addElement(var_3_18)

	var_3_0.RarityInfo1 = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("RarityInfo", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "RarityInfo2"

	var_3_20.Rarity:SetRGBFromTable(SWATCHES.itemRarity.quality1, 0)
	var_3_20.Rarity:setImage(RegisterMaterial("icon_item_quality_2"), 0)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 298, _1080p * 378, _1080p * 63, _1080p * 177)
	var_3_0:addElement(var_3_20)

	var_3_0.RarityInfo2 = var_3_20

	local var_3_21
	local var_3_22 = MenuBuilder.BuildRegisteredType("RarityInfo", {
		controllerIndex = var_3_1
	})

	var_3_22.id = "RarityInfo3"

	var_3_22.Rarity:SetRGBFromTable(SWATCHES.itemRarity.quality2, 0)
	var_3_22.Rarity:setImage(RegisterMaterial("icon_item_quality_3"), 0)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 168, _1080p * 248, _1080p * 63, _1080p * 177)
	var_3_0:addElement(var_3_22)

	var_3_0.RarityInfo3 = var_3_22

	local var_3_23
	local var_3_24 = MenuBuilder.BuildRegisteredType("RarityInfo", {
		controllerIndex = var_3_1
	})

	var_3_24.id = "RarityInfo4"

	var_3_24.Rarity:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_3_24.Rarity:setImage(RegisterMaterial("icon_item_quality_4"), 0)
	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 110, _1080p * 63, _1080p * 177)
	var_3_0:addElement(var_3_24)

	var_3_0.RarityInfo4 = var_3_24

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("RarityOdds", RarityOdds)
LockTable(_M)
