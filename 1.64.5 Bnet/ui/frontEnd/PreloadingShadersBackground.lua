module(..., package.seeall)

function PreloadingShadersBackground(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 40 * _1080p)

	var_1_0.id = "PreloadingShadersBackground"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromTable(SWATCHES.Scoreboard.background, 0)
	var_1_4:SetAlpha(0.5, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Texture"

	var_1_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_6:SetAlpha(0.4, 0)
	var_1_6:SetPixelGridEnabled(true)
	var_1_6:SetPixelGridContrast(0.5, 0)
	var_1_6:SetPixelGridBlockWidth(2, 0)
	var_1_6:SetPixelGridBlockHeight(2, 0)
	var_1_6:SetPixelGridGutterWidth(1, 0)
	var_1_6:SetPixelGridGutterHeight(1, 0)
	var_1_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Texture = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "BottomBorder"

	var_1_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_8:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.BottomBorder = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "TopBorder"

	var_1_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_10:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_1_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_1_0:addElement(var_1_10)

	var_1_0.TopBorder = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "Corners"

	var_1_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_12:setImage(RegisterMaterial("corners"), 0)
	var_1_12:Setup9SliceImage(_1080p * 16, _1080p * 16, 0.3, 0.3)
	var_1_0:addElement(var_1_12)

	var_1_0.Corners = var_1_12

	return var_1_0
end

MenuBuilder.registerType("PreloadingShadersBackground", PreloadingShadersBackground)
LockTable(_M)
