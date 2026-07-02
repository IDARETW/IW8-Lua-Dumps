module(..., package.seeall)

function MPDepotMenuHorizontalButtons(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalList.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1578 * _1080p, 0, 270 * _1080p)

	var_1_0.id = "MPDepotMenuHorizontalButtons"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(20 * _1080p)

	return var_1_0
end

MenuBuilder.registerType("MPDepotMenuHorizontalButtons", MPDepotMenuHorizontalButtons)
LockTable(_M)
