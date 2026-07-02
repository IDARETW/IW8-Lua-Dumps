module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1)
	arg_1_0.Status:setText(arg_1_1.status)
	arg_1_0.RewardName:setText(arg_1_1.name)
	arg_1_0.ItemType:setText(arg_1_1.type)
	arg_1_0.TerritoryName:setText(arg_1_1.territory)
	arg_1_0.RewardImage:setImage(RegisterMaterial(arg_1_1.image))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.RewardImage)
	assert(arg_2_0.TerritoryName)
	assert(arg_2_0.ItemType)
	assert(arg_2_0.RewardName)
	assert(arg_2_0.Status)

	arg_2_0.SetRewardData = var_0_0
end

function TerritoryOperationReward(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 332 * _1080p, 0, 300 * _1080p)

	var_3_0.id = "TerritoryOperationReward"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "RewardImage"

	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -166, _1080p * 166, _1080p * 67, _1080p * 229)
	var_3_0:addElement(var_3_4)

	var_3_0.RewardImage = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "TerritoryName"

	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -165, _1080p * 166, 0, _1080p * 22)
	var_3_0:addElement(var_3_6)

	var_3_0.TerritoryName = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Status"

	var_3_8:SetRGBFromTable(SWATCHES.Global.keyColorNormal, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -165, _1080p * 166, _1080p * 22, _1080p * 44)
	var_3_0:addElement(var_3_8)

	var_3_0.Status = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "ItemType"

	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -165, _1080p * 166, _1080p * 233, _1080p * 255)
	var_3_0:addElement(var_3_10)

	var_3_0.ItemType = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "RewardName"

	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -165, _1080p * 166, _1080p * 263, _1080p * 287)
	var_3_0:addElement(var_3_12)

	var_3_0.RewardName = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TerritoryOperationReward", TerritoryOperationReward)
LockTable(_M)
