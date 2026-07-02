module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1)
	assert(arg_1_0.Icon)
end

function LaserAttachment(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_2_0.id = "LaserAttachment"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Icon"

	var_2_4:SetScale(-0.95, 0)
	var_2_4:setImage(RegisterMaterial("ui_default_white"), 0)
	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, 0, _1080p * 128)
	var_2_0:addElement(var_2_4)

	var_2_0.Icon = var_2_4

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("LaserAttachment", LaserAttachment)
LockTable(_M)
