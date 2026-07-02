module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.ButtonHelperText then
		arg_1_0.ButtonHelperText:PushButtonPrompt(arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0.ButtonHelperText then
		arg_2_0.ButtonHelperText:PopButtonPrompt(arg_2_1)
	end
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.PushButtonPrompt = var_0_0
	arg_3_0.PopButtonPrompt = var_0_1

	local var_3_0 = LUI.ButtonHelperText.new({
		controllerIndex = arg_3_1
	})

	var_3_0.id = "ButtonHelperText"

	local var_3_1 = arg_3_2.verticalOffset or 0

	var_3_0:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, -40 + var_3_1, var_3_1)

	arg_3_0.ButtonHelperText = var_3_0

	arg_3_0:addElement(var_3_0)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_3_0.Background)
end

function ButtonHelperBar(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 60 * _1080p)

	var_4_0.id = "ButtonHelperBar"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -70, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ButtonHelperBar", ButtonHelperBar)
LockTable(_M)
