module(..., package.seeall)

function EmblemBoxLine(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 69 * _1080p, 0, 1 * _1080p)

	var_1_0.id = "EmblemBoxLine"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "TicBRCopy2"

	var_1_4:SetAlpha(0.25, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_1_0:addElement(var_1_4)

	var_1_0.TicBRCopy2 = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "TicBRCopy1"

	var_1_6:SetAlpha(0.8, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 8, 0, _1080p * 1)
	var_1_0:addElement(var_1_6)

	var_1_0.TicBRCopy1 = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "TicBR"

	var_1_8:SetAlpha(0.8, 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -8, 0, 0, _1080p * 1)
	var_1_0:addElement(var_1_8)

	var_1_0.TicBR = var_1_8

	return var_1_0
end

MenuBuilder.registerType("EmblemBoxLine", EmblemBoxLine)
LockTable(_M)
