module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0.activeTabID == FRIENDS.ManageFriendsTabIDs.SENT_INVITES then
		local var_1_0 = Social.CCJHHEBGB(arg_1_0._controllerIndex)

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
	arg_2_0:addEventHandler("fetch_friend_request_complete", var_0_0)
	arg_2_0:addEventHandler("request_fetch_data", function()
		arg_2_0._waitingForFetchCompleteOrTimeout = true

		arg_2_0.activeTabWidget:SetGridButtonEnabled(false)

		arg_2_0:Wait(3000).onComplete = function()
			if arg_2_0._waitingForFetchCompleteOrTimeout then
				var_0_0(arg_2_0)
			end
		end
	end)
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.MenuTitle)
	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/ADD_FRIENDS"))

	local var_5_0 = arg_5_2.platform

	arg_5_0._controllerIndex = arg_5_1

	local var_5_1 = {}

	var_5_1[#var_5_1 + 1] = {
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ADD_FRIENDS")),
		id = FRIENDS.ManageFriendsTabIDs.ADD_FRIENDS,
		hasDefaultFocus = arg_5_2.defaultTabFocus == FRIENDS.ManageFriendsTabIDs.ADD_FRIENDS
	}
	var_5_1[#var_5_1 + 1] = {
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SENT_INVITES")),
		id = FRIENDS.ManageFriendsTabIDs.SENT_INVITES,
		hasDefaultFocus = arg_5_2.defaultTabFocus == FRIENDS.ManageFriendsTabIDs.SENT_INVITES
	}
	arg_5_0.tabNamesAndIDs = var_5_1

	local var_5_2 = {}

	for iter_5_0, iter_5_1 in ipairs(var_5_1) do
		table.insert(var_5_2, {
			name = iter_5_1.name,
			hasDefaultFocus = iter_5_1.hasDefaultFocus,
			focusFunction = function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
				local var_6_0 = arg_5_0.tabNamesAndIDs[arg_6_2 + 1].id

				if arg_5_0.activeTabID ~= var_6_0 then
					arg_5_0.activeTabID = var_6_0

					if arg_5_0.activeTabWidget then
						arg_5_0.activeTabWidget:closeTree()

						arg_5_0.activeTabWidget = nil
					end

					if var_6_0 == FRIENDS.ManageFriendsTabIDs.ADD_FRIENDS then
						local var_6_1 = {
							isRegiments = false,
							controllerIndex = arg_6_1,
							platform = var_5_0
						}

						arg_5_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialAddFriends", var_6_1)
					elseif var_6_0 == FRIENDS.ManageFriendsTabIDs.SENT_INVITES then
						local var_6_2 = {
							controllerIndex = arg_6_1,
							tabID = FRIENDS.TabIDs.FRIENDS,
							subTabID = FRIENDS.ManageFriendsTabIDs.SENT_INVITES,
							noPlayerText = Engine.CBBHFCGDIC("LUA_MENU/NO_SENT_INVITES")
						}

						arg_5_0.activeTabWidget = MenuBuilder.BuildRegisteredType("SocialPopupLayout", var_6_2)

						var_0_0(arg_5_0)
					else
						assert(false)
					end

					arg_5_0:addElement(arg_5_0.activeTabWidget)

					if arg_6_3 ~= FocusType.MouseOver and arg_6_3 ~= FocusType.MenuFlow then
						arg_5_0.activeTabWidget:processEvent({
							name = "gain_focus"
						})
					end
				end

				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			end
		})
	end

	arg_5_0.Tabs:SetTabs(var_5_2)
	arg_5_0.Tabs:SizeTabsToFit()
	arg_5_0:addEventHandler("revoke_request_complete", var_0_0)
	var_0_1(arg_5_0)
end

function SocialAddFriendsPopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_7_0.id = "SocialAddFriendsPopup"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "MenuTitle"

	var_7_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIENDS")), 0)
	var_7_4.Line:SetLeft(0, 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_7_0:addElement(var_7_4)

	var_7_0.MenuTitle = var_7_4

	local var_7_5
	local var_7_6 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_7_1
			})
		end,
		controllerIndex = var_7_1
	}
	local var_7_7 = LUI.TabManager.new(var_7_6)

	var_7_7.id = "Tabs"

	var_7_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 104, _1080p * 677, _1080p * 108, _1080p * 160)
	var_7_0:addElement(var_7_7)

	var_7_0.Tabs = var_7_7

	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("SocialAddFriendsPopup", SocialAddFriendsPopup)
LockTable(_M)
