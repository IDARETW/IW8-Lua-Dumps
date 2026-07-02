module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(type(arg_1_1) == "number")
	assert(type(arg_1_2) == "number")

	arg_1_1 = LUI.clamp(arg_1_1, 0, 1)

	if arg_1_3 == nil then
		arg_1_3 = LUI.EASING.linear
	end

	return arg_1_0.Fill:SetAnchors(0, 1 - arg_1_1, 0, 0, arg_1_2, arg_1_3)
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetProgress = var_0_0
end

function InstallProgressBar(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 10 * _1080p)

	var_3_0.id = "InstallProgressBar"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.4, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Fill"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Fill = var_3_6

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("InstallProgressBar", InstallProgressBar)
LockTable(_M)
