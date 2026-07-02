module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0._lockState
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._lockState = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_2 > PRIVATE_MATCH.WarzoneButtonType.NONE and arg_3_2 <= PRIVATE_MATCH.WarzoneButtonType.LAST)

	arg_3_0._buttonType = arg_3_2

	arg_3_0:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		PRIVATE_MATCH.WarzoneButtonActionTable[arg_4_0._buttonType].action(arg_4_0, arg_3_1 or arg_4_1.controller)
	end)
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._locked = false
	arg_5_0.GetLockState = var_0_0
	arg_5_0.SetLockState = var_0_1
	arg_5_0.SetupButtonAction = var_0_2
end

function WarzonePrivateMatchButton(arg_6_0, arg_6_1)
	local var_6_0 = MenuBuilder.BuildRegisteredType("PlayMenuButton", arg_6_1)

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_6_0.id = "WarzonePrivateMatchButton"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_0_3(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WarzonePrivateMatchButton", WarzonePrivateMatchButton)
LockTable(_M)
