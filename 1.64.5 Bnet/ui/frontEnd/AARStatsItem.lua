module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Icon:SetAlpha(0)
	arg_1_0.Value:SetAlpha(0)
	arg_1_0.Name:SetAlpha(0)
	arg_1_0.PBIcon:SetAlpha(0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Icon:SetAlpha(1)
	arg_2_0.Value:SetAlpha(1)
	arg_2_0.Name:SetAlpha(1)
	arg_2_0.Name:setText(Engine.CBBHFCGDIC(arg_2_2.Name))
	arg_2_0.Value:setText(arg_2_2.Value)
	arg_2_0.Icon:setImage(RegisterMaterial(arg_2_2.Icon))

	if arg_2_2.isPersonalBest then
		arg_2_0.PBIcon:SetAlpha(1)
	end
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.HideStatsInfo = var_0_0
	arg_3_0.DisplayStatsInfo = var_0_1
end

function AARStatsItem(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 120 * _1080p, 0, 120 * _1080p)

	var_4_0.id = "AARStatsItem"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Icon"

	var_4_4:SetScale(-0.2, 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -41, _1080p * 41, _1080p * -9, _1080p * 73)
	var_4_0:addElement(var_4_4)

	var_4_0.Icon = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "Name"

	var_4_6:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetWordWrap(false)
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -48, _1080p * -30)
	var_4_0:addElement(var_4_6)

	var_4_0.Name = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Value"

	var_4_8:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_4_8:setText("000000", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -30, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.Value = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "PBIcon"

	var_4_10:SetAlpha(0, 0)
	var_4_10:setImage(RegisterMaterial("mission_medal_gold"), 0)
	var_4_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -30, 0, 0, _1080p * 30)
	var_4_0:addElement(var_4_10)

	var_4_0.PBIcon = var_4_10

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("AARStatsItem", AARStatsItem)
LockTable(_M)
