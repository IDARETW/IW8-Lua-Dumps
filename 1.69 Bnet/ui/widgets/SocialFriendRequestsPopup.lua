module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0.activeTabID == FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS then
		local var_1_0 = Social.CJABAFIDIG(arg_1_0._controllerIndex)

		if var_1_0 then
			arg_1_0.activeTabWidget:SetupPlayerGrid(var_1_0)
		end

		arg_1_0.activeTabWidget:SetGridButtonEnabled(true)

		if arg_1_0._waitingForFetchCompleteOrTimeout then
			arg_1_0._waitingForFetchCompleteOrTimeout = false
		end
	end
end

local function var_0_1(arg_2_0)
	if arg_2_0.activeTabID == FRIENDS.ManageFriendsTabIDs.BLOCKED_PLAYERS then
		local var_2_0 = Social.EBCDCJGEJD(arg_2_0._controllerIndex)

		if var_2_0 then
			arg_2_0.activeTabWidget:SetupPlayerGrid(var_2_0)
		end

		arg_2_0.activeTabWidget:SetGridButtonEnabled(true)
	end
end

local function var_0_2(arg_3_0)
	arg_3_0:addEventHandler("fetch_friend_request_complete", var_0_0)
	arg_3_0:addEventHandler("request_fetch_data", function()
		arg_3_0._waitingForFetchCompleteOrTimeout = true

		arg_3_0.activeTabWidget:SetGridButtonEnabled(false)

		arg_3_0:Wait(3000).onComplete = function()
			if arg_3_0._waitingForFetchCompleteOrTimeout then
				var_0_0(arg_3_0)
			end
		end
	end)
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.MenuTitle)
	arg_6_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/FRIEND_REQUESTS"))

	arg_6_0._controllerIndex = arg_6_1

	local var_6_0 = arg_6_2.platform
	local var_6_1 = {}

	var_6_1[#var_6_1 + 1] = {
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FRIEND_REQUESTS")),
		id = FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS,
		hasDefaultFocus = arg_6_2.defaultTabFocus == FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS
	}
	var_6_1[#var_6_1 + 1] = {
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BLOCKED_PLAYERS")),
		id = FRIENDS.ManageFriendsTabIDs.BLOCKED_PLAYERS,
		hasDefaultFocus = arg_6_2.defaultTabFocus == FRIENDS.ManageFriendsTabIDs.BLOCKED_PLAYERS
	}
	arg_6_0.tabNamesAndIDs = var_6_1

	local var_6_2 = {}

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		table.insert(var_6_2, {
			name = iter_6_1.name,
			hasDefaultFocus = iter_6_1.hasDefaultFocus,
			focusFunction = function(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
				local var_7_0 = arg_6_0.tabNamesAndIDs[arg_7_2 + 1].id

				if arg_6_0.activeTabID ~= var_7_0 then
					arg_6_0.activeTabID = var_7_0

					if arg_6_0.activeTabWidget then
						arg_6_0.activeTabWidget:closeTree()

						arg_6_0.activeTabWidget = nil
					end

					if var_7_0 == FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS then
						local var_7_1 = {
							controllerIndex = arg_7_1,
							tabID = FRIENDS.TabIDs.FRIENDS,
							subTabID = FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS,
							noPlayerText = Engine.CBBHFCGDIC("LUA_MENU/NO_RECEIVED_REQUESTS")
						}

						arg_6_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialPopupLayout", var_7_1)

						var_0_0(arg_6_0)
					elseif var_7_0 == FRIENDS.ManageFriendsTabIDs.BLOCKED_PLAYERS then
						local var_7_2 = {
							controllerIndex = arg_7_1,
							tabID = FRIENDS.TabIDs.FRIENDS,
							subTabID = FRIENDS.ManageFriendsTabIDs.BLOCKED_PLAYERS,
							noPlayerText = Engine.CBBHFCGDIC("LUA_MENU/NO_BLOCKED_PLAYERS")
						}

						arg_6_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialPopupLayout", var_7_2)

						var_0_1(arg_6_0)
					else
						assert(false)
					end

					arg_6_0:addElement(arg_6_0.activeTabWidget)

					if arg_7_3 ~= FocusType.MouseOver and arg_7_3 ~= FocusType.MenuFlow then
						arg_6_0.activeTabWidget:processEvent({
							name = "gain_focus"
						})
					end
				end

				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end
		})
	end

	arg_6_0.Tabs:SetTabs(var_6_2)
	arg_6_0.Tabs:SizeTabsToFit()
	arg_6_0:addEventHandler("bnetFriendRequestReceived", var_0_0)
	arg_6_0:addEventHandler("ignore_request_complete", var_0_0)
	var_0_2(arg_6_0)
	arg_6_0:addEventHandler("NotifyBattlenetPlayerUnblocked", var_0_1)
	arg_6_0:addEventHandler("NotifyBlocklistUpdated", var_0_1)
end

function SocialFriendRequestsPopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_8_0.id = "SocialFriendRequestsPopup"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "MenuTitle"

	var_8_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIENDS")), 0)
	var_8_4.Line:SetLeft(0, 0)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_8_0:addElement(var_8_4)

	var_8_0.MenuTitle = var_8_4

	local var_8_5
	local var_8_6 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_8_1
			})
		end,
		controllerIndex = var_8_1
	}
	local var_8_7 = LUI.TabManager.new(var_8_6)

	var_8_7.id = "Tabs"

	var_8_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 104, _1080p * 677, _1080p * 108, _1080p * 160)
	var_8_0:addElement(var_8_7)

	var_8_0.Tabs = var_8_7

	var_0_3(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("SocialFriendRequestsPopup", SocialFriendRequestsPopup)
LockTable(_M)
