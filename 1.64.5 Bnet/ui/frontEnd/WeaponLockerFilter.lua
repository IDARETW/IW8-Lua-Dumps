module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/FILTER_CAPS"))
end

function WeaponLockerFilter(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 640 * _1080p, 0, 1080 * _1080p)

	var_2_0.id = "WeaponLockerFilter"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("WeaponLockerFilterLayout", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "WeaponLockerFilterLayout"

	var_2_4:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 97, _1080p * -179, _1080p * -948, _1080p * 146)
	var_2_0:addElement(var_2_4)

	var_2_0.WeaponLockerFilterLayout = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "MenuTitle"

	var_2_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/FILTER_CAPS"), 0)
	var_2_6.Line:SetLeft(0, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 105)
	var_2_0:addElement(var_2_6)

	var_2_0.MenuTitle = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("WeaponLockerFilter", WeaponLockerFilter)
LockTable(_M)
