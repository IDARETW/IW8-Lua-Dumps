module(..., package.seeall)

function IconImage(arg_1_0, arg_1_1)
	arg_1_1 = arg_1_1 or {}

	local var_1_0 = LUI.UIElement.new()

	var_1_0.id = "IconImage"

	assert(arg_1_1.iconString)
	var_1_0:SetupIconImage(arg_1_1.iconString)

	return var_1_0
end

MenuBuilder.registerType("IconImage", IconImage)
LockTable(_M)
