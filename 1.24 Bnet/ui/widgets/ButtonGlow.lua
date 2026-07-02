module(..., package.seeall)

function ButtonGlow(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 64 * _1080p)

	var_1_0.id = "ButtonGlow"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Glow"

	var_1_4:setImage(RegisterMaterial("button_glow_circle"), 0)
	var_1_4:Setup3SliceHorizontalImage(_1080p * 12, 0.1)
	var_1_0:addElement(var_1_4)

	var_1_0.Glow = var_1_4

	return var_1_0
end

MenuBuilder.registerType("ButtonGlow", ButtonGlow)
LockTable(_M)
