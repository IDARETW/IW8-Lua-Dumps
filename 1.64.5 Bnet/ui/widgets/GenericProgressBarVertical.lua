module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0._progress
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	assert(type(arg_2_1) == "number")
	assert(type(arg_2_2) == "number")

	arg_2_0._progress = LUI.clamp(arg_2_1, 0, 1)

	if arg_2_3 == nil then
		arg_2_3 = LUI.EASING.linear
	end

	arg_2_0.Fill:SetAnchors(0, 0, 1 - arg_2_0._progress, 0, arg_2_2, arg_2_3)
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._progress = 0
	arg_3_0.SetProgress = var_0_1
	arg_3_0.GetProgress = var_0_0
end

function GenericProgressBarVertical(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 10 * _1080p, 0, 100 * _1080p)

	var_4_0.id = "GenericProgressBarVertical"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Fill"

	var_4_4:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Fill = var_4_4

	local var_4_5
	local var_4_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_7 = LUI.UIBorder.new(var_4_6)

	var_4_7.id = "Frame"

	var_4_0:addElement(var_4_7)

	var_4_0.Frame = var_4_7

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("GenericProgressBarVertical", GenericProgressBarVertical)
LockTable(_M)
