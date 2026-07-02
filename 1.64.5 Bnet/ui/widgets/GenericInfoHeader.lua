module(..., package.seeall)

function GenericInfoHeader(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 35 * _1080p)

	var_1_0.id = "GenericInfoHeader"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Divider"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.headerBoarder, 0)
	var_1_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Divider = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "Text"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_1_6:setText("", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, 0, 0, _1080p * 24)
	var_1_0:addElement(var_1_6)

	var_1_0.Text = var_1_6

	return var_1_0
end

MenuBuilder.registerType("GenericInfoHeader", GenericInfoHeader)
LockTable(_M)
