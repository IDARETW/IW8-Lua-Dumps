module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.BackgroundAngleTop:SetBlurStrength(arg_1_1)
	arg_1_0.BackgroundTop:SetBlurStrength(arg_1_1)
	arg_1_0.BackgroundMain:SetBlurStrength(arg_1_1)
	arg_1_0.BackgroundBottom:SetBlurStrength(arg_1_1)
	arg_1_0.BackgroundAngleBottom:SetBlurStrength(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetPanelBlur = var_0_0
end

function DoubleNotchedBacker(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_3_0.id = "DoubleNotchedBacker"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:setImage(RegisterMaterial("wdg_backer"), 0)
	var_3_4:Setup9SliceImage(_1080p * 25, _1080p * 25, 0.5, 0.5)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("DoubleNotchedBacker", DoubleNotchedBacker)
LockTable(_M)
