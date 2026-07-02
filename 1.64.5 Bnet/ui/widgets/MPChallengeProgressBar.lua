module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if arg_1_3 == nil then
		arg_1_3 = LUI.EASING.linear
	end

	arg_1_0.Fill:SetRightAnchor(1 - arg_1_1, arg_1_2, arg_1_3)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetProgress = var_0_0
end

function MPChallengeProgressBar(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 10 * _1080p)

	var_3_0.id = "MPChallengeProgressBar"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Overlay"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.progressBackground, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Overlay = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Fill"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.progressFill, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Fill = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MPChallengeProgressBar", MPChallengeProgressBar)
LockTable(_M)
