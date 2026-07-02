module(..., package.seeall)

function GenericBorderWithNodes(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "GenericBorderWithNodes"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_5 = LUI.UIBorder.new(var_1_4)

	var_1_5.id = "Border"

	var_1_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -1)
	var_1_0:addElement(var_1_5)

	var_1_0.Border = var_1_5

	local var_1_6
	local var_1_7 = MenuBuilder.BuildRegisteredType("GenericFrameCornerNodes", {
		controllerIndex = var_1_1
	})

	var_1_7.id = "CornerNodes"

	var_1_7:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_7)

	var_1_0.CornerNodes = var_1_7

	return var_1_0
end

MenuBuilder.registerType("GenericBorderWithNodes", GenericBorderWithNodes)
LockTable(_M)
