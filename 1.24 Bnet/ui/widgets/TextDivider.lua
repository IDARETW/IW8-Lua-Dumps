module(..., package.seeall)

function TextDivider(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 315 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "TextDivider"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "LeftDivider"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_1_4:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 124, 0, _1080p * 1)
	var_1_0:addElement(var_1_4)

	var_1_0.LeftDivider = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "Label"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/AND"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -33.5, _1080p * 32.5, _1080p * -9, _1080p * 9)
	var_1_0:addElement(var_1_6)

	var_1_0.Label = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "RightDivider"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_1_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -125, _1080p * -1, 0, _1080p * 1)
	var_1_0:addElement(var_1_8)

	var_1_0.RightDivider = var_1_8

	return var_1_0
end

MenuBuilder.registerType("TextDivider", TextDivider)
LockTable(_M)
