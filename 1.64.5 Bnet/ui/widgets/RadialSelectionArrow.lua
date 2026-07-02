module(..., package.seeall)

function RadialSelectionArrow(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_1_0.id = "RadialSelectionArrow"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Arrow"

	var_1_4:SetRGBFromInt(7985663, 0)
	var_1_4:setImage(RegisterMaterial("radial_select_arrow"), 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Arrow = var_1_4

	return var_1_0
end

MenuBuilder.registerType("RadialSelectionArrow", RadialSelectionArrow)
LockTable(_M)
