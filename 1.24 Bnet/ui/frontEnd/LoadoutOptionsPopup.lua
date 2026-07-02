module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/LOADOUT_OPTIONS"))
	assert(arg_1_2.loadoutIndex)
	arg_1_0.LoadoutOptionsButtons:SetupButtons(arg_1_1, arg_1_2.loadoutIndex)
end

function LoadoutOptionsPopup(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalNavigator.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 1080 * _1080p)

	var_2_0.id = "LoadoutOptionsPopup"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "MenuTitle"

	var_2_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LOADOUT_OPTIONS")), 0)
	var_2_4.Line:SetLeft(0, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_2_0:addElement(var_2_4)

	var_2_0.MenuTitle = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("LoadoutOptionsButtons", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "LoadoutOptionsButtons"

	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 97, _1080p * 527, _1080p * 216, _1080p * 408)
	var_2_0:addElement(var_2_6)

	var_2_0.LoadoutOptionsButtons = var_2_6

	function var_2_0.addButtonHelperFunction(arg_3_0, arg_3_1)
		arg_3_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_2_0:addEventHandler("menu_create", var_2_0.addButtonHelperFunction)

	local var_2_7 = LUI.UIBindButton.new()

	var_2_7.id = "selfBindButton"

	var_2_0:addElement(var_2_7)

	var_2_0.bindButton = var_2_7

	var_2_0.bindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("LoadoutOptionsPopup", LoadoutOptionsPopup)
LockTable(_M)
