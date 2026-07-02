module(..., package.seeall)

function WorldBlur(arg_1_0, arg_1_1)
	arg_1_1 = arg_1_1 or {}

	local var_1_0 = LUI.UIElement.new()

	var_1_0.id = "WorldBlur"

	var_1_0:SetBlurStrength(arg_1_1.worldBlur)
	var_1_0:setupWorldBlur(arg_1_1)

	return var_1_0
end

MenuBuilder.registerType("WorldBlur", WorldBlur)
LockTable(_M)
