module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LUI.ButtonHelperText.new({
		controllerIndex = arg_1_1
	})

	var_1_0.id = "ButtonHelperText"

	local var_1_1 = arg_1_2.verticalOffset or 0

	var_1_0:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, -40 + var_1_1, var_1_1)

	arg_1_0.ButtonHelperText = var_1_0

	arg_1_0:addElement(var_1_0)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.Background)
end

function ButtonHelperBar(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 60 * _1080p)

	var_2_0.id = "ButtonHelperBar"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Background"

	var_2_4:SetRGBFromInt(0, 0)
	var_2_4:SetAlpha(0.5, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -70, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ButtonHelperBar", ButtonHelperBar)
LockTable(_M)
