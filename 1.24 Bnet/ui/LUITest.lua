module(..., package.seeall)

local function var_0_0()
	local var_1_0 = LUI.UIElement.new()

	var_1_0.id = "testMenu"

	local var_1_1 = MenuBuilder.BuildRegisteredType("generic_back_button")

	var_1_0:addElement(var_1_1)

	return var_1_0
end

MenuBuilder.registerType("test", var_0_0)
LockTable(_M)
