module(..., package.seeall)

function OperationDetails(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 80 * _1080p)

	var_1_0.id = "OperationDetails"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("Operation", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Operation"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 56)
	var_1_0:addElement(var_1_4)

	var_1_0.Operation = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("OperationProgress", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "OperationProgress"

	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 50, _1080p * 80)
	var_1_0:addElement(var_1_6)

	var_1_0.OperationProgress = var_1_6

	return var_1_0
end

MenuBuilder.registerType("OperationDetails", OperationDetails)
LockTable(_M)
