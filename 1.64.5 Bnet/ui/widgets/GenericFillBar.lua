module(..., package.seeall)

function GenericFillBar(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "GenericFillBar"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Fill"

	var_1_4:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Fill = var_1_4

	local var_1_5
	local var_1_6 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_1_7 = LUI.UIBorder.new(var_1_6)

	var_1_7.id = "FillBorder"

	var_1_7:SetAlpha(0.5, 0)
	var_1_7:SetBorderThicknessLeft(_1080p * 2, 0)
	var_1_7:SetBorderThicknessRight(_1080p * 2, 0)
	var_1_7:SetBorderThicknessTop(_1080p * 2, 0)
	var_1_7:SetBorderThicknessBottom(_1080p * 2, 0)
	var_1_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -1, _1080p * 1, _1080p * -1, _1080p * 1)
	var_1_0:addElement(var_1_7)

	var_1_0.FillBorder = var_1_7

	return var_1_0
end

MenuBuilder.registerType("GenericFillBar", GenericFillBar)
LockTable(_M)
