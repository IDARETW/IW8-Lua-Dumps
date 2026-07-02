module(..., package.seeall)

function OptionsGraphicsSliderBarOverflow(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 15 * _1080p, 0, 9 * _1080p)

	var_1_0.id = "OptionsGraphicsSliderBarOverflow"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Overflow03"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.disabledBorder, 0)
	var_1_4:SetAlpha(0.15, 0)
	var_1_4:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -3, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Overflow03 = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Overflow02"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.disabledBorder, 0)
	var_1_6:SetAlpha(0.35, 0)
	var_1_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -8, _1080p * -5, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Overflow02 = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Overflow01"

	var_1_8:SetRGBFromTable(SWATCHES.genericButton.disabledBorder, 0)
	var_1_8:SetAlpha(0.65, 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -13, _1080p * -10, 0, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.Overflow01 = var_1_8

	return var_1_0
end

MenuBuilder.registerType("OptionsGraphicsSliderBarOverflow", OptionsGraphicsSliderBarOverflow)
LockTable(_M)
