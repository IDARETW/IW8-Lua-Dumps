module(..., package.seeall)

function SocialPlayerActions(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalList.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "SocialPlayerActions"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(5 * _1080p)

	return var_1_0
end

MenuBuilder.registerType("SocialPlayerActions", SocialPlayerActions)
LockTable(_M)
