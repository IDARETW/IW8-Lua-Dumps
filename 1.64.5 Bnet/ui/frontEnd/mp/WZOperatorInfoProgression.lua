module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if not arg_1_2 or not arg_1_2.menuRef then
		assert(false, "Missing a reference to the main Operator Select Menu. The scoped menu data is accessed ensure consistency between menu features such as Equipping and Favoriting.")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupData = var_0_0
end

function WZOperatorInfoProgression(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "WZOperatorInfoProgression"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	return var_3_0
end

MenuBuilder.registerType("WZOperatorInfoProgression", WZOperatorInfoProgression)
LockTable(_M)
