module(..., package.seeall)

function GenericFrameCornerNodes(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 20 * _1080p, 0, 20 * _1080p)

	var_1_0.id = "GenericFrameCornerNodes"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "CornerTopLeft"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 4, 0, _1080p * 4)
	var_1_0:addElement(var_1_4)

	var_1_0.CornerTopLeft = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "CornerTopRight"

	var_1_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -4, 0, 0, _1080p * 4)
	var_1_0:addElement(var_1_6)

	var_1_0.CornerTopRight = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "CornerBottomRight"

	var_1_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -4, 0, _1080p * -4, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.CornerBottomRight = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "CornerBottomLeft"

	var_1_10:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 4, _1080p * -4, 0)
	var_1_0:addElement(var_1_10)

	var_1_0.CornerBottomLeft = var_1_10

	return var_1_0
end

MenuBuilder.registerType("GenericFrameCornerNodes", GenericFrameCornerNodes)
LockTable(_M)
