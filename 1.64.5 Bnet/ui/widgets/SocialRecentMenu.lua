module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.MenuLayout.PlayersGrid
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.GetPlayerGrid = var_0_0

	arg_2_0.MenuLayout:SetRefreshChildFuncByTab(FRIENDS.TabIDs.RECENT_PLAYERS)
	arg_2_0.MenuLayout:UpdateNoFriends(0)
	arg_2_0.MenuLayout.NoFriendsLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_RECENT_PLAYERS"))
	arg_2_0.MenuLayout:SetPlayerGridWrapping(nil, false)
end

function SocialRecentMenu(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "SocialRecentMenu"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("SocialMenuLayout", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "MenuLayout"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_3_0:addElement(var_3_4)

	var_3_0.MenuLayout = var_3_4

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SocialRecentMenu", SocialRecentMenu)
LockTable(_M)
