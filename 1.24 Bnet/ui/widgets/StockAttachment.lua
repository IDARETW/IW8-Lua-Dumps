module(..., package.seeall)

function StockAttachment(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_1_0.id = "StockAttachment"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Icon"

	var_1_4:SetScale(-0.95, 0)
	var_1_4:setImage(RegisterMaterial("ui_default_white"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, 0, _1080p * -64, _1080p * 64)
	var_1_0:addElement(var_1_4)

	var_1_0.Icon = var_1_4

	return var_1_0
end

MenuBuilder.registerType("StockAttachment", StockAttachment)
LockTable(_M)
