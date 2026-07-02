module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = MenuBuilder.BuildRegisteredType("SocialAddFriendsPopup", arg_1_1)
	local var_1_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		controllerIndex = arg_1_1.controllerIndex,
		widget = var_1_0
	})

	var_1_1.id = "AddFriendsPopup"

	return var_1_1
end

MenuBuilder.registerType("AddFriendsPopup", var_0_0)

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = MenuBuilder.BuildRegisteredType("SocialFriendRequestsPopup", arg_2_1)
	local var_2_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		controllerIndex = arg_2_1.controllerIndex,
		widget = var_2_0
	})

	var_2_1.id = "FriendRequestsPopup"

	return var_2_1
end

MenuBuilder.registerType("FriendRequestsPopup", var_0_1)

local function var_0_2(arg_3_0)
	return arg_3_0.MenuLayout.PlayersGrid
end

local function var_0_3(arg_4_0, arg_4_1)
	if not arg_4_0._helperBar then
		return
	end

	local var_4_0 = arg_4_1 and "LUA_MENU/HIDE_OFFLINE_FRIENDS" or "LUA_MENU/SHOW_OFFLINE_FRIENDS"

	arg_4_0._helperBar:PushButtonPrompt({
		side = "left",
		priority = 5,
		replaceTop = true,
		button_ref = "button_r3",
		helper_text = Engine.CBBHFCGDIC(var_4_0)
	})
end

function PostLoadFunc(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.GetPlayerGrid = var_0_2
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0._helperBar = arg_5_2.helperBar and arg_5_2.helperBar or nil
	arg_5_0._platform = CoD.GetActiveSocialFriendsPlatform()
	arg_5_0._toggleOfflineFriendsData = PlayerData.BFFBGAJGD(arg_5_1, CoD.StatsGroup.NonGame).toggleOfflineFriends
	arg_5_0.MenuLayout.PlayersGrid.showOfflineFriends = arg_5_0._toggleOfflineFriendsData:get() == 1

	arg_5_0.MenuLayout:SetPlayerGridWrapping(nil, false)
	arg_5_0.MenuLayout:SetRefreshChildFuncByTab(FRIENDS.TabIDs.FRIENDS)
	arg_5_0.MenuLayout:UpdateNoFriends(0)
	arg_5_0.MenuLayout.NoFriendsLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_FRIENDS"))
	arg_5_0.MenuLayout.InviteButton:SetPromptText(Engine.CBBHFCGDIC("LUA_MENU/FRIEND_REQUESTS"))
	arg_5_0._helperBar:PushButtonPrompt({
		side = "left",
		priority = 20,
		replaceTop = true,
		button_ref = "button_alt2",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIENDS"),
		container = arg_5_0.MenuLayout.FirstTopPromptContainer
	})
	var_0_3(arg_5_0, arg_5_0.MenuLayout.PlayersGrid.showOfflineFriends)

	local function var_5_0()
		local var_6_0 = {
			controllerIndex = arg_5_0._controllerIndex,
			platform = arg_5_0._platform,
			defaultTabFocus = FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS
		}

		LUI.FlowManager.RequestPopupMenu(nil, "FriendRequestsPopup", true, arg_5_1, false, var_6_0)
	end

	local function var_5_1()
		local var_7_0 = {
			controllerIndex = arg_5_0._controllerIndex,
			platform = arg_5_0._platform,
			defaultTabFocus = FRIENDS.ManageFriendsTabIDs.ADD_FRIENDS
		}

		LUI.FlowManager.RequestPopupMenu(nil, "AddFriendsPopup", true, arg_5_1, false, var_7_0)
	end

	local var_5_2 = LUI.UIBindButton.new()

	var_5_2.id = "bindButton"

	arg_5_0:addElement(var_5_2)

	arg_5_0.bindButton = var_5_2

	arg_5_0.bindButton:addEventHandler("button_alt1", function(arg_8_0, arg_8_1)
		var_5_0()
	end)
	arg_5_0.MenuLayout.InviteButton:SetAction(var_5_0)
	arg_5_0.bindButton:addEventHandler("button_alt2", function(arg_9_0, arg_9_1)
		var_5_1()
	end)
	arg_5_0.bindButton:addEventHandler("button_right_stick", function(arg_10_0, arg_10_1)
		Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

		local var_10_0 = not arg_5_0.MenuLayout.PlayersGrid.showOfflineFriends

		arg_5_0._toggleOfflineFriendsData:set(var_10_0 and 1 or 0)

		arg_5_0.MenuLayout.PlayersGrid.showOfflineFriends = var_10_0

		var_0_3(arg_5_0, var_10_0)
		FRIENDS.RefreshData(FRIENDS.TabIDs.FRIENDS, arg_5_0.MenuLayout.PlayersGrid, arg_5_1)
	end)
end

function SocialFriendsMenu(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0.id = "SocialFriendsMenu"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("SocialMenuLayout", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "MenuLayout"

	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_11_0:addElement(var_11_4)

	var_11_0.MenuLayout = var_11_4

	PostLoadFunc(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("SocialFriendsMenu", SocialFriendsMenu)
LockTable(_M)
