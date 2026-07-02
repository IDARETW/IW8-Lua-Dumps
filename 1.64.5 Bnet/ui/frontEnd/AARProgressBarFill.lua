module(..., package.seeall)

function AARProgressBarFill(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "AARProgressBarFill"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:setUseStencil(true)

	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Left"

	var_1_4:setImage(RegisterMaterial("aar_fill_grey_left"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 20, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Left = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Center"

	var_1_6:setImage(RegisterMaterial("aar_fill_grey_center"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 20, _1080p * -20, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Center = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Right"

	var_1_8:setImage(RegisterMaterial("aar_fill_grey_right"), 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -20, 0, 0, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.Right = var_1_8

	return var_1_0
end

MenuBuilder.registerType("AARProgressBarFill", AARProgressBarFill)
LockTable(_M)
