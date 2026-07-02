module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = COLOR_BLIND.GetFilteredColor(arg_1_1, arg_1_0._swatchTable, arg_1_0._swatch)

	assert(var_1_0)
	arg_1_0.Swatch:SetRGBFromTable(var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0._swatchTable = arg_2_2
	arg_2_0._swatch = arg_2_3

	arg_2_0:UpdateSwatch(arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Swatch)

	arg_3_0.Setup = var_0_1
	arg_3_0.UpdateSwatch = var_0_0
end

function ColorblindSwatch(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 30 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "ColorblindSwatch"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Swatch"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 30, 0, _1080p * 30)
	var_4_0:addElement(var_4_4)

	var_4_0.Swatch = var_4_4

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ColorblindSwatch", ColorblindSwatch)
LockTable(_M)
