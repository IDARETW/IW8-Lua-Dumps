module(..., package.seeall)

function AARXPType(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 60 * _1080p)

	var_1_0.id = "AARXPType"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "RightCross"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_4:SetAlpha(0.6, 0)
	var_1_4:SetScale(-0.25, 0)
	var_1_4:setImage(RegisterMaterial("aar_cross"), 0)
	var_1_4:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -30, 0, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_4)

	var_1_0.RightCross = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "LeftCross"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_6:SetAlpha(0.6, 0)
	var_1_6:SetScale(-0.25, 0)
	var_1_6:setImage(RegisterMaterial("aar_cross"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 30, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_6)

	var_1_0.LeftCross = var_1_6

	return var_1_0
end

MenuBuilder.registerType("AARXPType", AARXPType)
LockTable(_M)
