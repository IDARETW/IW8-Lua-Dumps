module(..., package.seeall)

function StoreItemPurchased(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p)

	var_1_0.id = "StoreItemPurchased"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_1_4:SetAlpha(0.5, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Overlay"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_6:SetAlpha(0.1, 0)
	var_1_6:SetPixelGridEnabled(true)
	var_1_6:SetPixelGridContrast(0.8, 0)
	var_1_6:SetPixelGridBlockWidth(2, 0)
	var_1_6:SetPixelGridBlockHeight(2, 0)
	var_1_6:SetPixelGridGutterWidth(1, 0)
	var_1_6:SetPixelGridGutterHeight(1, 0)
	var_1_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Overlay = var_1_6

	local var_1_7
	local var_1_8 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_1_9 = LUI.UIBorder.new(var_1_8)

	var_1_9.id = "Frame"

	var_1_9:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_9:SetBorderThicknessLeft(_1080p * 2, 0)
	var_1_9:SetBorderThicknessRight(_1080p * 2, 0)
	var_1_9:SetBorderThicknessTop(_1080p * 2, 0)
	var_1_9:SetBorderThicknessBottom(_1080p * 2, 0)
	var_1_0:addElement(var_1_9)

	var_1_0.Frame = var_1_9

	local var_1_10
	local var_1_11 = LUI.UIImage.new()

	var_1_11.id = "Icon"

	var_1_11:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_11:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_1_0:addElement(var_1_11)

	var_1_0.Icon = var_1_11

	return var_1_0
end

MenuBuilder.registerType("StoreItemPurchased", StoreItemPurchased)
LockTable(_M)
