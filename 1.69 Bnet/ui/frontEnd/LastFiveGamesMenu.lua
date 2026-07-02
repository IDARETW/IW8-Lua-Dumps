module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuTitle)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/LAST_5_GAMES"))
end

function LastFiveGamesMenu(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalNavigator.new()

	var_2_0.id = "LastFiveGamesMenu"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	var_2_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_2_1
	})
	var_2_0.HelperBar.id = "HelperBar"

	var_2_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_2_0.HelperBar:setPriority(10)
	var_2_0:addElement(var_2_0.HelperBar)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "MenuTitle"

	var_2_4.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/LAST_5_GAMES"), 0)
	var_2_4.Line:SetLeft(0, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_2_0:addElement(var_2_4)

	var_2_0.MenuTitle = var_2_4

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("LastFiveGamesMenu", LastFiveGamesMenu)
LockTable(_M)
