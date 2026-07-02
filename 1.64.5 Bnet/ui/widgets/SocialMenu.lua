module(..., package.seeall)

local var_0_0 = 1000
local var_0_1 = {
	SELECT = {
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	},
	SWITCH_REGIMENT = {
		side = "left",
		button_ref = "button_left_trigger",
		priority = 20,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SWITCH_REGIMENT")
	},
	USE_REGIMENT_TAG = {
		side = "left",
		button_ref = "button_right_trigger",
		priority = 30,
		helper_text = Engine.CBBHFCGDIC("REGIMENTS/USE_REGIMENT_TAG")
	}
}

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.activeTabIDsToIndex[arg_1_1]

	return var_1_0 ~= nil and var_1_0 or -1
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 and arg_2_2.forceFriendListRefresh then
		LUI.FlowManager.GetScopedData(arg_2_0).enableRefreshFriendsList = true
	end

	if arg_2_2 and arg_2_2.forceImmediateRefresh then
		arg_2_0.HandleTimerCompleted(arg_2_0, arg_2_1)
	else
		arg_2_0:Wait(var_0_0).onComplete = function()
			return arg_2_0.HandleTimerCompleted(arg_2_0, arg_2_1)
		end
	end
end

local function var_0_4(arg_4_0, arg_4_1)
	if arg_4_1 ~= arg_4_0.activeTab.id then
		return arg_4_0.activeTabIDsToIndex[arg_4_1] ~= nil or false
	end

	return false
end

local function var_0_5(arg_5_0, arg_5_1)
	local var_5_0 = LUI.FlowManager.GetScopedData(arg_5_0)

	if arg_5_0.activeTab.usesPlayerGrid and var_5_0.enableRefreshFriendsList then
		if Engine.BAHIIBFDDG() or Engine.BEFACAIFDD() then
			Engine.DAGFFDGFII("friends_refresh", arg_5_1)
		end

		FRIENDS.RefreshData(arg_5_0.activeTab.id, arg_5_0.activeTabWidget:GetPlayerGrid(), arg_5_1)
	end

	if arg_5_0.activeTab.id == FRIENDS.TabIDs.CLANS then
		arg_5_0:dispatchEventToChildren({
			name = "refresh_clan_data",
			controllerIndex = arg_5_1
		})
	end

	var_0_3(arg_5_0, arg_5_1)
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = var_0_2(arg_6_0, arg_6_2)
	local var_6_1 = var_6_0 ~= -1 and arg_6_0.Tabs:GetTabAtIndex(var_6_0) or nil

	if var_6_1 then
		local var_6_2 = FRIENDS.GetNotificationDataSourceByTab(arg_6_2):GetValue(arg_6_1)
		local var_6_3 = var_6_2 and var_6_2 > 0

		var_6_1:SetBreadcrumb(var_6_3)
	end
end

local function var_0_7(arg_7_0, arg_7_1)
	return function(arg_8_0, arg_8_1, arg_8_2)
		local var_8_0
		local var_8_1
		local var_8_2

		if arg_7_0.activeTab.usesPlayerGrid then
			local var_8_3 = arg_7_0.activeTabWidget:GetPlayerGrid()

			var_8_2 = var_8_3

			local var_8_4 = var_8_3.cachedFriends or FRIENDS.SOCIAL_MENU_CACHED_FRIENDS
			local var_8_5 = math.floor(var_8_4 / 2)
			local var_8_6 = var_8_3:GetFocusPositionIndex({
				clampContentIndexToDatasetLength = true
			})

			if not var_8_6 then
				return
			end

			var_8_0 = var_8_6 - var_8_5
			var_8_1 = var_8_6 + var_8_5
		else
			var_8_2 = arg_8_0

			if arg_8_1 == -1 and arg_8_2 == -1 then
				var_8_0 = 0
				var_8_1 = 0
			else
				local var_8_7 = math.floor(arg_8_0.cachedFriends / 2)
				local var_8_8 = arg_8_1 + math.floor((arg_8_2 - arg_8_1) / 2)

				var_8_0 = var_8_8 + 1 - var_8_7
				var_8_1 = var_8_8 + var_8_7
			end
		end

		var_8_2.getFriendFrom = var_8_0 > 0 and var_8_0 or 0

		if var_8_2.friendsCount == 0 then
			var_8_2.getFriendTo = 0
		else
			var_8_2.getFriendTo = var_8_1 < var_8_2.friendsCount - 1 and var_8_1 or var_8_2.friendsCount - 1
		end

		FRIENDS.RefreshData(arg_7_0.activeTab.id, var_8_2, arg_7_1)
	end
end

local function var_0_8(arg_9_0)
	arg_9_0.HelperBar:PopButtonPrompt({
		button_ref = "button_left_trigger"
	})
	arg_9_0.HelperBar:PopButtonPrompt({
		button_ref = "button_r3"
	})
	arg_9_0.HelperBar:PopButtonPrompt({
		button_ref = "button_right_trigger"
	})
	arg_9_0.HelperBar:PopButtonPrompt({
		button_ref = "button_primary"
	})
	arg_9_0.HelperBar:PopButtonPrompt({
		button_ref = "button_left_stick"
	})
end

local function var_0_9(arg_10_0)
	arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/SOCIAL_TITLE"))
end

local function var_0_10(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = {}
	local var_11_1 = 1
	local var_11_2 = not Engine.CAADCDEEIA()
	local var_11_3 = LUI.FlowManager.GetScopedData(arg_11_0)
	local var_11_4 = {
		{
			name = "LUA_MENU/CLANS",
			menuId = "SocialClanMenu",
			usesPlayerGrid = false,
			id = FRIENDS.TabIDs.CLANS,
			isEnabled = CONDITIONS.IsClanUIEnabled()
		},
		{
			name = "LUA_MENU/FRIENDS",
			menuId = "SocialFriendsMenu",
			usesPlayerGrid = true,
			isEnabled = true,
			id = FRIENDS.TabIDs.FRIENDS
		},
		{
			name = "LUA_MENU/PARTY",
			menuId = "SocialPartyMenu",
			usesPlayerGrid = false,
			id = FRIENDS.TabIDs.PRIVATE_PARTY,
			isEnabled = var_11_2
		},
		{
			name = "LUA_MENU/REGIMENTS",
			menuId = "SocialRegimentsMenu",
			usesPlayerGrid = false,
			id = FRIENDS.TabIDs.REGIMENTS,
			isEnabled = var_11_2 and Dvar.IBEGCHEFE("NOPQSROMKK")
		},
		{
			name = "LUA_MENU/RECENT_SQUAD",
			menuId = "SocialSquadMenu",
			usesPlayerGrid = true,
			id = FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS,
			isEnabled = var_11_2 and not Dvar.IBEGCHEFE("online_recent_squad_ui_disabled")
		},
		{
			name = "LUA_MENU/RECENT_LOBBY",
			menuId = "SocialRecentMenu",
			usesPlayerGrid = true,
			id = FRIENDS.TabIDs.RECENT_PLAYERS,
			isEnabled = var_11_2 and Dvar.IBEGCHEFE("NORTQRPRPM")
		},
		{
			name = "LUA_MENU/INBOX",
			menuId = "SocialInboxMenu",
			usesPlayerGrid = true,
			id = FRIENDS.TabIDs.INBOX,
			isEnabled = CONDITIONS.IsClanInboxUIEnabled()
		}
	}

	for iter_11_0, iter_11_1 in ipairs(var_11_4) do
		if iter_11_1.isEnabled then
			arg_11_0.activeTabIDsToIndex[iter_11_1.id] = var_11_1
			arg_11_0.activeTabs[var_11_1] = iter_11_1

			table.insert(var_11_0, {
				name = ToUpperCase(Engine.CBBHFCGDIC(iter_11_1.name)),
				hasDefaultFocus = arg_11_2.setRegimentsDefault and iter_11_1.id == FRIENDS.TabIDs.REGIMENTS or var_11_3.activeTabIndex == var_11_1,
				focusFunction = arg_11_1(arg_11_0, arg_11_2)
			})

			var_11_1 = var_11_1 + 1
		end
	end

	arg_11_0.Tabs:SetTabs(var_11_0)
end

local function var_0_11(arg_12_0)
	local var_12_0 = arg_12_0._controllerIndex
	local var_12_1 = Engine.EAGGAEGHHA(var_12_0)
	local var_12_2 = Clans2.CFGBBBHFHB(var_12_0)
	local var_12_3 = false

	if CLANS.IsValidId(var_12_2) and Clans2.CFDHGBFICH(var_12_0, var_12_2, var_12_1) >= CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER then
		local var_12_4 = Clans2.BJJADIBFB(arg_12_0._controllerIndex, var_12_2)
		local var_12_5 = Clans2.DGGAFGIEBJ(arg_12_0._controllerIndex, var_12_2)

		if #var_12_4 > 0 or #var_12_5 > 0 then
			var_12_3 = true
		end
	end

	local var_12_6 = var_0_2(arg_12_0, FRIENDS.TabIDs.CLANS)
	local var_12_7 = var_12_6 ~= -1 and arg_12_0.Tabs:GetTabAtIndex(var_12_6) or nil

	if var_12_7 then
		var_12_7:SetBreadcrumb(var_12_3)
	end
end

local function var_0_12(arg_13_0, arg_13_1)
	arg_13_0:addEventHandler("send_friend_request_complete", function(arg_14_0, arg_14_1)
		if arg_13_0.activeTab.usesPlayerGrid then
			FRIENDS.RefreshData(arg_13_0.activeTab.id, arg_13_0.activeTabWidget:GetPlayerGrid(), arg_13_1)
		end
	end)
	arg_13_0:addEventHandler("fetch_friend_data_complete", function(arg_15_0, arg_15_1)
		if arg_13_0.activeTab.usesPlayerGrid then
			LUI.FlowManager.GetScopedData(arg_13_0).enableRefreshFriendsList = true
		end
	end)
	arg_13_0.bindButton:addEventHandler("button_alt2", function(arg_16_0, arg_16_1)
		if arg_13_0.activeTabWidget.ManageFriendsFunc then
			arg_13_0.activeTabWidget:ManageFriendsFunc(arg_13_1)
		end
	end)
	arg_13_0.bindButton:registerEventHandler("button_secondary", function(arg_17_0, arg_17_1)
		ACTIONS.LeaveMenu(arg_13_0)

		local var_17_0 = LUI.FlowManager.GetVisibleMenu()

		if var_17_0 then
			var_17_0:processEvent({
				name = "closing_quick_access_menu",
				controllerIndex = arg_17_1.controller or arg_13_1
			})
		end
	end)

	if CONDITIONS.IsUserSignedInBnet(arg_13_1) then
		arg_13_0.PlayerDetailsAvailability.m_requireFocusType = FocusType.MouseOver

		arg_13_0.PlayerDetailsAvailability:setPriority(100)
		arg_13_0:RemoveElement(arg_13_0.PlayerDetailsAvailability)
		arg_13_0:addElement(arg_13_0.PlayerDetailsAvailability)
		arg_13_0.bindButton:addEventHandler("button_left_stick", function(arg_18_0, arg_18_1)
			arg_13_0.PlayerDetailsAvailability:ChangeDropdownState(arg_13_1)

			if arg_13_0.PlayerDetailsAvailability._dropdownState then
				ACTIONS.LoseFocus(arg_13_0, "SocialMenuLayout", arg_13_1)
				ACTIONS.GainFocus(arg_13_0, "PlayerDetailsAvailability", arg_13_1)
			else
				ACTIONS.LoseFocus(arg_13_0, "PlayerDetailsAvailability", arg_13_1)
				arg_13_0.activeTabWidget:processEvent({
					name = "gain_focus"
				})
			end
		end)
	end

	arg_13_0:addEventHandler("open_tab", function(arg_19_0, arg_19_1)
		if var_0_4(arg_13_0, arg_19_1.tabID) then
			local var_19_0 = arg_13_0.activeTabIDsToIndex[arg_19_1.tabID]

			arg_13_0.Tabs:FocusTab(arg_19_1.controllerIndex, var_19_0)
		end
	end)

	if CONDITIONS.IsClanUIEnabled() then
		CLANS.CLAN_DATA.ResetClanDataArray()
		arg_13_0:registerEventHandler(CLANS.CLAN_EVENTS.CLAN_DATA_RESOLVED, function(arg_20_0, arg_20_1)
			CLANS.CLAN_DATA.SetAndUpdateElementData(arg_20_1 and arg_20_1.clanDetails and arg_20_1.clanDetails[1], arg_13_0._controllerIndex)
		end)
		arg_13_0:registerEventHandler(CLANS.CLAN_EVENTS.CLAN_PROFILE_RESOLVED, function(arg_21_0, arg_21_1)
			for iter_21_0 = 1, #arg_21_1.clanProfiles do
				local var_21_0 = arg_21_1.clanProfiles[iter_21_0]

				CLANS.CLAN_DATA.AddClanProfile(var_21_0, var_21_0.clanId)
			end
		end)
		arg_13_0:addAndCallEventHandler(CLANS.CLAN_EVENTS.NOTIFICATION, function(arg_22_0, arg_22_1)
			var_0_11(arg_13_0)
		end)
	end
end

local function var_0_13(arg_23_0, arg_23_1)
	local var_23_0 = {
		FRIENDS.TabIDs.FRIENDS,
		FRIENDS.TabIDs.PRIVATE_PARTY,
		FRIENDS.TabIDs.REGIMENTS
	}

	for iter_23_0, iter_23_1 in ipairs(var_23_0) do
		if iter_23_1 ~= FRIENDS.TabIDs.REGIMENTS or Dvar.IBEGCHEFE("NOPQSROMKK") then
			local var_23_1 = FRIENDS.GetNotificationDataSourceByTab(iter_23_1)

			arg_23_0:SubscribeToModel(var_23_1:GetModel(arg_23_1), function()
				var_0_6(arg_23_0, arg_23_1, iter_23_1)
			end)
		end
	end
end

local function var_0_14(arg_25_0, arg_25_1)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_25_0, arg_25_1, {
		addScreenDarkener = true,
		addWorldBlur = true
	})
	ACTIONS.ScaleStretchAnchorFullscreen(arg_25_0.TabBacker)

	if not CONDITIONS.InGameSPOrFrontendMP() then
		ACTIONS.ScaleStretchAnchorFullscreen(arg_25_0.BackgroundImage)
	end
end

local function var_0_15()
	if Engine.DDJFBBJAIG() then
		FrontEndScene.HideAllCharacters()
		Engine.DHFCHIIJCA("squad_lobby")
	end
end

local function var_0_16(arg_27_0, arg_27_1)
	if arg_27_0.activeTab.id ~= FRIENDS.TabIDs.PRIVATE_PARTY then
		arg_27_0.HelperBar:PushButtonPrompt(var_0_1.SELECT)
	end
end

local function var_0_17(arg_28_0, arg_28_1)
	local var_28_0 = {
		controllerIndex = arg_28_1,
		helperBar = arg_28_0.HelperBar
	}

	if arg_28_0.activeTab.id == FRIENDS.TabIDs.CLANS then
		var_28_0.isInboxTabEnabled = var_0_2(arg_28_0, FRIENDS.TabIDs.INBOX) ~= -1
	end

	return var_28_0
end

local function var_0_18(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0.activeTabWidget = MenuBuilder.BuildRegisteredType(arg_29_0.activeTab.menuId, var_0_17(arg_29_0, arg_29_1))

	if arg_29_0.activeTab.id == FRIENDS.TabIDs.REGIMENTS then
		arg_29_2.setRegimentsDefault = nil
	end

	arg_29_0:addElement(arg_29_0.activeTabWidget)
end

local function var_0_19(arg_30_0, arg_30_1)
	local var_30_0 = {
		_customScrolling = true,
		SetLinkedGridDataSource = function()
			return
		end,
		UpdateScrolling = var_0_7(arg_30_0, arg_30_1),
		LinkTo = function()
			return
		end
	}

	local function var_30_1(arg_33_0)
		if arg_33_0 == FRIENDS.TabIDs.RECENT_PLAYERS then
			return FRIENDS.SOCIAL_MENU_CACHED_RECENT_PLAYERS
		elseif arg_33_0 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS then
			return FRIENDS.SOCIAL_MENU_CACHED_RECENT_SQUAD_PLAYERS
		else
			return FRIENDS.SOCIAL_MENU_CACHED_FRIENDS / 2
		end
	end

	local var_30_2 = arg_30_0.activeTabWidget:GetPlayerGrid()

	var_30_2:AddScrollbar(var_30_0)

	local var_30_3 = var_30_1(arg_30_0.activeTab.id)

	FRIENDS.InitPlayerRequestData(var_30_2, var_30_3)
	FRIENDS.RefreshData(arg_30_0.activeTab.id, var_30_2, arg_30_1)
end

local function var_0_20(arg_34_0)
	arg_34_0.activeTabWidget:closeTree()

	arg_34_0.activeTabWidget = nil
end

local function var_0_21(arg_35_0, arg_35_1)
	return function(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
		local var_36_0 = LUI.FlowManager.GetScopedData(arg_35_0)
		local var_36_1 = arg_36_2 + 1

		if not (arg_35_0.activeTabWidget and var_36_0.activeTabIndex and var_36_0.activeTabIndex == var_36_1) then
			if CONDITIONS.IsClanUIEnabled() then
				CLANS.CLAN_DATA.ResetClanDataArray()
			end

			var_36_0.activeTabIndex = var_36_1
			arg_35_0.activeTab = arg_35_0.activeTabs[var_36_1]

			if arg_35_0.activeTabWidget then
				var_0_20(arg_35_0)
			end

			var_0_8(arg_35_0)
			var_0_18(arg_35_0, arg_36_1, arg_35_1)
			var_0_16(arg_35_0, arg_36_1)

			if arg_35_0.activeTab.usesPlayerGrid then
				var_0_19(arg_35_0, arg_36_1)
			end

			if arg_36_3 ~= FocusType.MouseOver and arg_36_3 ~= FocusType.MenuFlow then
				arg_35_0.activeTabWidget:processEvent({
					name = "gain_focus"
				})
			end

			Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
		end
	end
end

local function var_0_22(arg_37_0)
	arg_37_0._clanQueueTimer = LUI.UITimer.new({
		interval = 1100,
		event = "clan_queue_refresh_timer"
	})
	arg_37_0._clanQueueTimer.id = "ClanQueueRefreshTimer"

	arg_37_0:addElement(arg_37_0._clanQueueTimer)
	arg_37_0:addAndCallEventHandler("clan_queue_refresh_timer", function(arg_38_0, arg_38_1)
		CLANS.CLAN_DATA.CheckAndRefireProcessArray()
	end)
end

local function var_0_23(arg_39_0, arg_39_1, arg_39_2)
	arg_39_0._controllerIndex = arg_39_1
	arg_39_0.activeTabs = {}
	arg_39_0.activeTabIDsToIndex = {}
	arg_39_0.HandleTimerCompleted = var_0_5

	var_0_15()
	var_0_9(arg_39_0)
	var_0_10(arg_39_0, var_0_21, arg_39_2)
	var_0_12(arg_39_0, arg_39_1)
	var_0_13(arg_39_0, arg_39_1)
	var_0_14(arg_39_0, arg_39_1)
	var_0_3(arg_39_0, arg_39_1, {
		forceImmediateRefresh = true,
		forceFriendListRefresh = true
	})

	if CONDITIONS.IsClanUIEnabled() then
		var_0_22(arg_39_0)
	end

	METRICS.RecordSocialMenuOpeningFlow(arg_39_1, arg_39_2.hasUsedShortcut == true)
end

function SocialMenu(arg_40_0, arg_40_1)
	local var_40_0 = LUI.UIElement.new()

	var_40_0.id = "SocialMenu"

	local var_40_1 = arg_40_1 and arg_40_1.controllerIndex

	if not var_40_1 and not Engine.DDJFBBJAIG() then
		var_40_1 = var_40_0:getRootController()
	end

	assert(var_40_1)

	var_40_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_40_1
	})
	var_40_0.HelperBar.id = "HelperBar"

	var_40_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_40_0.HelperBar:setPriority(10)
	var_40_0:addElement(var_40_0.HelperBar)

	local var_40_2 = var_40_0
	local var_40_3

	if not CONDITIONS.InGameSPOrFrontendMP() then
		local var_40_4 = LUI.UIImage.new()

		var_40_4.id = "BackgroundImage"

		var_40_4:setImage(RegisterMaterial("frontend_option_bg"), 0)
		var_40_0:addElement(var_40_4)

		var_40_0.BackgroundImage = var_40_4
	end

	local var_40_5
	local var_40_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_40_1
	})

	var_40_6.id = "TabBacker"

	var_40_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_40_0:addElement(var_40_6)

	var_40_0.TabBacker = var_40_6

	local var_40_7
	local var_40_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_40_1
	})

	var_40_8.id = "MenuTitle"

	var_40_8.MenuTitle:setText(ToUpperCase(""), 0)
	var_40_8.Line:SetLeft(0, 0)
	var_40_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_40_0:addElement(var_40_8)

	var_40_0.MenuTitle = var_40_8

	local var_40_9

	if CONDITIONS.IsUserSignedInDemonware(var_40_1) then
		local var_40_10 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_40_1
		})

		var_40_10.id = "PlayerDetails"

		var_40_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_40_0:addElement(var_40_10)

		var_40_0.PlayerDetails = var_40_10
	end

	local var_40_11

	if CONDITIONS.IsUserSignedInBnet(var_40_1) then
		local var_40_12 = MenuBuilder.BuildRegisteredType("PlayerDetailsAvailability", {
			controllerIndex = var_40_1
		})

		var_40_12.id = "PlayerDetailsAvailability"

		var_40_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1624, _1080p * 1824, _1080p * 131, _1080p * 271)
		var_40_0:addElement(var_40_12)

		var_40_0.PlayerDetailsAvailability = var_40_12
	end

	local var_40_13

	if CONDITIONS.InFrontend() then
		local var_40_14 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_40_1
		})

		var_40_14.id = "LobbyMembersFooter"

		var_40_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_40_0:addElement(var_40_14)

		var_40_0.LobbyMembersFooter = var_40_14
	end

	local var_40_15
	local var_40_16 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_40_1
			})
		end,
		controllerIndex = var_40_1
	}
	local var_40_17 = LUI.TabManager.new(var_40_16)

	var_40_17.id = "Tabs"

	var_40_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 986, _1080p * 108, _1080p * 160)
	var_40_0:addElement(var_40_17)

	var_40_0.Tabs = var_40_17

	var_40_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_40_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_40_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_40_18 = LUI.UIBindButton.new()

	var_40_18.id = "selfBindButton"

	var_40_0:addElement(var_40_18)

	var_40_0.bindButton = var_40_18

	var_40_0.bindButton:addEventHandler("button_secondary", function(arg_42_0, arg_42_1)
		if not arg_42_1.controller then
			local var_42_0 = var_40_1
		end

		ACTIONS.LeaveMenu(var_40_0)
	end)
	var_40_0.bindButton:addEventHandler("button_start", function(arg_43_0, arg_43_1)
		local var_43_0 = arg_43_1.controller or var_40_1

		ACTIONS.OpenOptionsMenu(var_43_0, "", "", "")
	end)
	var_0_23(var_40_0, var_40_1, arg_40_1)

	return var_40_0
end

MenuBuilder.registerType("SocialMenu", SocialMenu)
LockTable(_M)
