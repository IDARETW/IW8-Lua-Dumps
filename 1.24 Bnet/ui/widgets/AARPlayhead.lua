module(..., package.seeall)

function AARPlayhead(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 12 * _1080p, 0, 57 * _1080p)

	var_1_0.id = "AARPlayhead"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Arrow"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_4:setImage(RegisterMaterial("aar_arrow"), 0)
	var_1_4:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -9, _1080p * 7, _1080p * -8, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Arrow = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "TopNode"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -7, _1080p * 5, 0, _1080p * 3)
	var_1_0:addElement(var_1_6)

	var_1_0.TopNode = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "VertLine"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_8:SetAlpha(0.6, 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -1, 0, _1080p * 13, _1080p * -16)
	var_1_0:addElement(var_1_8)

	var_1_0.VertLine = var_1_8

	return var_1_0
end

MenuBuilder.registerType("AARPlayhead", AARPlayhead)
LockTable(_M)
