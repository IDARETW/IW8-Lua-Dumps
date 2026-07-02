module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Fill:SetRightAnchor(1 - arg_1_1, arg_1_2 or 0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Fill)

	arg_2_0.SetPercent = var_0_0
end

function BorderlessFillBar(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 270 * _1080p, 0, 8 * _1080p)

	var_3_0.id = "BorderlessFillBar"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_3_4:SetAlpha(0.6, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Overlay"

	var_3_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_6:SetAlpha(0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Overlay = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Fill"

	var_3_8:SetRGBFromInt(15198438, 0)
	var_3_8:SetAlpha(0.8, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.Fill = var_3_8

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BorderlessFillBar", BorderlessFillBar)
LockTable(_M)
