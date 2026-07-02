module(..., package.seeall)

function VGPreOrderWeaponPackStandard(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 480 * _1080p, 0, 250 * _1080p)

	var_1_0.id = "VGPreOrderWeaponPackStandard"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Babkground"

	var_1_4:SetAlpha(0.5, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Babkground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "WidgetName"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_6:setText("VGPreOrderWeaponPackStandard", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 480, 0, _1080p * 30)
	var_1_0:addElement(var_1_6)

	var_1_0.WidgetName = var_1_6

	return var_1_0
end

MenuBuilder.registerType("VGPreOrderWeaponPackStandard", VGPreOrderWeaponPackStandard)
LockTable(_M)
