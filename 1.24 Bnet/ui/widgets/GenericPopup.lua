module(..., package.seeall)

function GenericPopup(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 431 * _1080p, 0, 253 * _1080p)

	var_1_0.id = "GenericPopup"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_1_4:SetAlpha(0.85, 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Box"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.background, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Box = var_1_6

	local var_1_7
	local var_1_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_9 = LUI.UIBorder.new(var_1_8)

	var_1_9.id = "Border"

	var_1_9:SetRGBFromTable(SWATCHES.genericMenu.border, 0)
	var_1_0:addElement(var_1_9)

	var_1_0.Border = var_1_9

	return var_1_0
end

MenuBuilder.registerType("GenericPopup", GenericPopup)
LockTable(_M)
