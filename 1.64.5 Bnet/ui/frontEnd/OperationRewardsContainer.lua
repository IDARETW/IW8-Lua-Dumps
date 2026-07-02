module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SetAlignment(LUI.Alignment.Center)
end

function OperationRewardsContainer(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIHorizontalStackedLayout.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 120 * _1080p, 0, 120 * _1080p)

	var_2_0.id = "OperationRewardsContainer"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(48 * _1080p)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("OperationRewardsContainer", OperationRewardsContainer)
LockTable(_M)
