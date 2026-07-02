module(..., package.seeall)

function MenuFrame(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "MenuFrame"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIBlur.new()

	var_1_4.id = "BlackBottom"

	var_1_4:SetRGBFromInt(3355443, 0)
	var_1_4:SetBlurStrength(5, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -60, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BlackBottom = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "ColorBottom"

	var_1_6:SetRGBFromTable(SWATCHES.Global.keyColorDark, 0)
	var_1_6:SetPixelGridEnabled(true)
	var_1_6:SetPixelGridContrast(0.5, 0)
	var_1_6:SetPixelGridBlockWidth(2, 0)
	var_1_6:SetPixelGridBlockHeight(2, 0)
	var_1_6:SetPixelGridGutterWidth(1, 0)
	var_1_6:SetPixelGridGutterHeight(1, 0)
	var_1_6:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -60, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.ColorBottom = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "LineBottom"

	var_1_8:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_1_8:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -60, _1080p * -58)
	var_1_0:addElement(var_1_8)

	var_1_0.LineBottom = var_1_8

	return var_1_0
end

MenuBuilder.registerType("MenuFrame", MenuFrame)
LockTable(_M)
