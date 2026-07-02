module(..., package.seeall)

function GenericPopupWindow(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1710 * _1080p, 0, 460 * _1080p)

	var_1_0.id = "GenericPopupWindow"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "PopupBackgroundDark"

	var_1_4:SetRGBFromTable(SWATCHES.Popups.backgroundPopup, 0)
	var_1_4:SetAlpha(0.7, 0)
	var_1_4:SetPixelGridEnabled(true)
	var_1_4:SetPixelGridContrast(0.5, 0)
	var_1_4:SetPixelGridBlockWidth(2, 0)
	var_1_4:SetPixelGridBlockHeight(2, 0)
	var_1_4:SetPixelGridGutterWidth(1, 0)
	var_1_4:SetPixelGridGutterHeight(1, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.PopupBackgroundDark = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "PopupBackground"

	var_1_6:SetRGBFromTable(SWATCHES.Popups.popupbggradient, 0)
	var_1_6:SetAlpha(0.7, 0)
	var_1_6:SetPixelGridEnabled(true)
	var_1_6:SetPixelGridContrast(0.5, 0)
	var_1_6:SetPixelGridBlockWidth(2, 0)
	var_1_6:SetPixelGridBlockHeight(2, 0)
	var_1_6:SetPixelGridGutterWidth(1, 0)
	var_1_6:SetPixelGridGutterHeight(1, 0)
	var_1_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_1_0:addElement(var_1_6)

	var_1_0.PopupBackground = var_1_6

	local var_1_7
	local var_1_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_1_9 = LUI.UIBorder.new(var_1_8)

	var_1_9.id = "CornerTopLeft"

	var_1_9:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_1_9:SetBorderThicknessRight(_1080p * 0, 0)
	var_1_9:SetBorderThicknessBottom(_1080p * 0, 0)
	var_1_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 30, 0, _1080p * 30)
	var_1_0:addElement(var_1_9)

	var_1_0.CornerTopLeft = var_1_9

	local var_1_10
	local var_1_11 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_1_12 = LUI.UIBorder.new(var_1_11)

	var_1_12.id = "CornerTopRight"

	var_1_12:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_1_12:SetBorderThicknessLeft(_1080p * 0, 0)
	var_1_12:SetBorderThicknessBottom(_1080p * 0, 0)
	var_1_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -30, 0, 0, _1080p * 30)
	var_1_0:addElement(var_1_12)

	var_1_0.CornerTopRight = var_1_12

	local var_1_13
	local var_1_14 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_15 = LUI.UIBorder.new(var_1_14)

	var_1_15.id = "CornerBotLeft"

	var_1_15:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_1_15:SetBorderThicknessRight(_1080p * 0, 0)
	var_1_15:SetBorderThicknessTop(_1080p * 0, 0)
	var_1_15:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 30, _1080p * -30, 0)
	var_1_0:addElement(var_1_15)

	var_1_0.CornerBotLeft = var_1_15

	local var_1_16
	local var_1_17 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_18 = LUI.UIBorder.new(var_1_17)

	var_1_18.id = "CornerBotRight"

	var_1_18:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_1_18:SetBorderThicknessLeft(_1080p * 0, 0)
	var_1_18:SetBorderThicknessTop(_1080p * 0, 0)
	var_1_18:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -30, 0, _1080p * -30, 0)
	var_1_0:addElement(var_1_18)

	var_1_0.CornerBotRight = var_1_18

	local var_1_19
	local var_1_20 = LUI.UIImage.new()

	var_1_20.id = "TopBorder"

	var_1_20:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_1_20:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_1_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_1_0:addElement(var_1_20)

	var_1_0.TopBorder = var_1_20

	local var_1_21
	local var_1_22 = LUI.UIImage.new()

	var_1_22.id = "BotBorder"

	var_1_22:SetRGBFromTable(SWATCHES.Popups.frame, 0)
	var_1_22:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_1_22:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_1_0:addElement(var_1_22)

	var_1_0.BotBorder = var_1_22

	return var_1_0
end

MenuBuilder.registerType("GenericPopupWindow", GenericPopupWindow)
LockTable(_M)
