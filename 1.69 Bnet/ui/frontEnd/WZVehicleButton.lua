module(..., package.seeall)

function SetupVehicleInfo(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.VehicleButton.SetupVehicleInfo(arg_1_0.VehicleButton, arg_1_1, arg_1_2)
end

local function var_0_0(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0.SetupVehicleInfo = SetupVehicleInfo
end

function WZVehicleButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 340 * _1080p, 0, 90 * _1080p)

	var_3_0.id = "WZVehicleButton"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("VehicleButton", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "VehicleButton"

	var_3_4.VehicleName:setText("", 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 340, 0, _1080p * 90)
	var_3_0:addElement(var_3_4)

	var_3_0.VehicleButton = var_3_4

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZVehicleButton", WZVehicleButton)
LockTable(_M)
