module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:registerEventHandler("update_item_description", function(arg_2_0, arg_2_1)
		arg_2_0.EditionTitle:setText(arg_2_1.editionTitle, 0)
		arg_2_0.Description:setText(arg_2_1.editionDescription, 0)
	end)
end

function BattlenetStoreItemDescription(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 620 * _1080p, 0, 213 * _1080p)

	var_3_0.id = "BattlenetStoreItemDescription"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(10 * _1080p)

	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "EditionTitle"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_4:setText(ToUpperCase(""), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 28)
	var_3_0:addElement(var_3_4)

	var_3_0.EditionTitle = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Description"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 38, _1080p * 62)
	var_3_0:addElement(var_3_6)

	var_3_0.Description = var_3_6

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BattlenetStoreItemDescription", BattlenetStoreItemDescription)
LockTable(_M)
