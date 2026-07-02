module(..., package.seeall)

local var_0_0 = 2
local var_0_1 = "ClansSocialInvitePopup"

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1 = 1
	local var_1_2 = {
		{
			name = "LUA_MENU/MEMBERS",
			id = CLANS.CLAN_TAB_IDs.MEMBERS
		},
		{
			name = "LUA_MENU/INVITES_SENT",
			id = CLANS.CLAN_TAB_IDs.OUTGOING_INVITES
		},
		{
			name = "LUA_MENU/REQUESTS",
			id = CLANS.CLAN_TAB_IDs.INCOMING_REQUESTS
		}
	}

	for iter_1_0, iter_1_1 in ipairs(var_1_2) do
		arg_1_0.activeTabIDsToIndex[iter_1_1.id] = var_1_1
		arg_1_0.activeTabs[var_1_1] = iter_1_1

		table.insert(var_1_0, {
			name = ToUpperCase(Engine.CBBHFCGDIC(iter_1_1.name)),
			hasDefaultFocus = iter_1_1.id == CLANS.CLAN_TAB_IDs.MEMBERS,
			focusFunction = arg_1_1(arg_1_0, arg_1_2)
		})

		var_1_1 = var_1_1 + 1
	end

	arg_1_0.Tabs:SetTabs(var_1_0)
end

local function var_0_3(arg_2_0, arg_2_1)
	local var_2_0 = ""

	if arg_2_1 == CLANS.CLAN_TAB_IDs.MEMBERS then
		var_2_0 = "LUA_MENU/NO_FRIENDS"
	elseif arg_2_1 == CLANS.CLAN_TAB_IDs.OUTGOING_INVITES then
		var_2_0 = "LUA_MENU/NO_INVITES"
	elseif arg_2_1 == CLANS.CLAN_TAB_IDs.INCOMING_REQUESTS then
		var_2_0 = "LUA_MENU/NO_REQUESTS"
	end

	local var_2_1 = arg_2_0.activeTabWidget.ClanMembersScreenGrid:GetNumChildren() == 0

	arg_2_0.NoFriendsLabel:setText(Engine.CBBHFCGDIC(var_2_0))
	arg_2_0.NoFriendsLabel:SetAlpha(var_2_1 and 1 or 0)
	arg_2_0.NoFriendsBacker:SetAlpha(var_2_1 and 0.5 or 0)
end

local function var_0_4(arg_3_0, arg_3_1)
	if arg_3_1 == nil then
		return
	end

	if arg_3_0._activeTabID ~= arg_3_1 then
		CLANS.CLAN_DATA.ResetClanDataArray()
	end

	arg_3_0._activeTabID = arg_3_1

	local var_3_0 = 0

	if arg_3_1 == CLANS.CLAN_TAB_IDs.MEMBERS then
		local var_3_1 = Clans2.GIDGAGEAC(arg_3_0._controllerIndex, arg_3_0._clanId)

		arg_3_0._membersData = var_3_1
		var_3_0 = #var_3_1
	elseif arg_3_1 == CLANS.CLAN_TAB_IDs.OUTGOING_INVITES then
		local var_3_2 = Clans2.BJJADIBFB(arg_3_0._controllerIndex, arg_3_0._clanId)

		arg_3_0._clanInvites = var_3_2
		var_3_0 = #var_3_2
	elseif arg_3_1 == CLANS.CLAN_TAB_IDs.INCOMING_REQUESTS then
		local var_3_3 = Clans2.DGGAFGIEBJ(arg_3_0._controllerIndex, arg_3_0._clanId)

		arg_3_0._clanInvites = var_3_3
		var_3_0 = #var_3_3
	end

	if arg_3_0.activeTabWidget.ClanMembersScreenGrid._lastChildrenCount == nil or arg_3_0.activeTabWidget.ClanMembersScreenGrid._lastChildrenCount ~= var_3_0 then
		if LUI.IsLastInputMouseNavigation(arg_3_0._controllerIndex) then
			local var_3_4 = arg_3_0.activeTabWidget.ClanMembersScreenGrid._shouldFocus

			arg_3_0.activeTabWidget.ClanMembersScreenGrid._shouldFocus = false

			arg_3_0.activeTabWidget.ClanMembersScreenGrid:SetNumChildren(var_3_0)

			arg_3_0.activeTabWidget.ClanMembersScreenGrid._shouldFocus = var_3_4
		else
			arg_3_0.activeTabWidget.ClanMembersScreenGrid:SetNumChildren(var_3_0)
		end
	end

	arg_3_0.activeTabWidget.ClanMembersScreenGrid._lastChildrenCount = var_3_0

	var_0_3(arg_3_0, arg_3_1)
	arg_3_0.activeTabWidget.ClanMembersScreenGrid:RefreshContent()
end

local function var_0_5(arg_4_0, arg_4_1)
	arg_4_0.LeaderImage:SetRGBFromTable(SWATCHES.genericMenu.bodycopy)
	arg_4_0.LeaderImage:SetAlpha(1)
	arg_4_0.LeaderText:SetAlpha(1)

	local var_4_0 = ""
	local var_4_1 = ""

	if arg_4_1.isPartyHost then
		var_4_0 = "icon_party_leader_crown"
		var_4_1 = Engine.CBBHFCGDIC("MPUI/PARTY_LEADER")
	elseif arg_4_1.role == OnlineClanRole.OWNER then
		var_4_0 = "icon_regiments_leader"
		var_4_1 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEADER")
	elseif arg_4_1.role == OnlineClanRole.OFFICER then
		var_4_0 = "icon_regiments_officer"
		var_4_1 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_OFFICER")
	elseif arg_4_1.showPlatformIcon then
		if arg_4_1.isAtviFriend then
			var_4_0 = "icon_social_friend_atvi"
			var_4_1 = Engine.CBBHFCGDIC("LUA_MENU/ACTIVISION_FRIEND")
		else
			local var_4_2 = Engine.CBBFHGEDGJ()
			local var_4_3

			var_4_0, var_4_3 = FRIENDS.PlatformIcon[var_4_2], FRIENDS.PlatformFriendText[var_4_2]
			var_4_1 = var_4_3 and FRIENDS.PlatformFriendText[var_4_2] or ""

			arg_4_0.LeaderImage:SetRGBFromTable(SWATCHES.text.offwhite)
		end
	else
		arg_4_0.LeaderImage:SetAlpha(0)
		arg_4_0.LeaderText:SetAlpha(0)
	end

	if var_4_0 and var_4_0 ~= "" then
		arg_4_0.LeaderImage:setImage(RegisterMaterial(var_4_0))
	end

	arg_4_0.LeaderText:setText(var_4_1)
end

local function var_0_6(arg_5_0, arg_5_1)
	local var_5_0 = Friends.HCAFBJBHC(arg_5_0._controllerIndex, arg_5_1)

	if not var_5_0 or var_5_0.valid == false then
		ACTIONS.AnimateSequence(arg_5_0, "HideDetails")

		return
	end

	var_5_0.xuid = arg_5_1
	var_5_0.clanDetails = arg_5_0._clanDetails

	local var_5_1 = var_5_0 and var_5_0.xuid

	ACTIONS.AnimateSequence(arg_5_0, var_5_1 and "ShowDetails" or "HideDetails")

	if CONDITIONS.IsFifthWheelActive() then
		ACTIONS.AnimateSequence(arg_5_0, var_5_0.isOnline and "OnlinePlayer" or "OfflinePlayer")
	else
		ACTIONS.AnimateSequence(arg_5_0, "CompactDetailsPane")
	end

	arg_5_0.PlayerDetails:SetupPlayerDetails(var_5_0, arg_5_0._activeTabID)

	if var_5_0.usingGamepad ~= nil then
		arg_5_0.InputImage:SetAlpha(1)
		arg_5_0.InputImage:setImage(RegisterMaterial(var_5_0.usingGamepad and "icon_platform_controller" or "icon_platform_mousekeyboard"))
		arg_5_0.InputText:SetAlpha(1)
		arg_5_0.InputText:setText(Engine.CBBHFCGDIC(var_5_0.usingGamepad and "PLATFORM_UI/PLAYING_WITH_CONTROLLER" or "MPUI/PLAY_WITH_KBM"))
	else
		arg_5_0.InputImage:SetAlpha(0)
		arg_5_0.InputText:SetAlpha(0)
	end

	var_0_5(arg_5_0, var_5_0)

	if var_5_0.onlineStatus then
		arg_5_0.OnlineStatusText:SetAlpha(1)
		arg_5_0.OnlineStatusText:setText(Engine.CBBHFCGDIC(FRIENDS.onlineStatusToString[var_5_0.onlineStatus]))
		arg_5_0.PlayerStatus:SetOnlineStatus(var_5_0.onlineStatus)

		local var_5_2 = 8 * _1080p
		local var_5_3 = LAYOUT.GetTextWidth(arg_5_0.OnlineStatusText)
		local var_5_4 = arg_5_0.OnlineStatusText:GetCurrentAnchorsAndPositions().right
		local var_5_5 = LAYOUT.GetElementWidth(arg_5_0.PlayerStatus)

		arg_5_0.PlayerStatus:SetRight(var_5_4 - var_5_3 - var_5_2)
		arg_5_0.PlayerStatus:SetLeft(var_5_4 - var_5_3 - var_5_2 - var_5_5)
	end
end

local function var_0_7(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = arg_6_0._activeTabID
	local var_6_1 = arg_6_3 * var_0_0 + arg_6_2

	if var_6_0 == CLANS.CLAN_TAB_IDs.MEMBERS then
		local var_6_2 = FRIENDS.UnifyPlayerDataFormat(arg_6_0._membersData[var_6_1 + 1])
		local var_6_3 = var_6_2.xuid

		if not var_6_2.name or var_6_2.name == "" then
			local var_6_4 = Friends.HCAFBJBHC(arg_6_0._controllerIndex, var_6_3)

			if var_6_4.valid == true then
				var_6_2 = var_6_4
			end

			var_6_2.xuid = var_6_3
		end

		var_6_2.controllerIndex = arg_6_0._controllerIndex
		var_6_2.memberRole = Clans2.CFDHGBFICH(arg_6_0._controllerIndex, arg_6_0._clanId, var_6_3)
		var_6_2.viewerMemberRole = arg_6_0._memberRole
		var_6_2.clanId = arg_6_0._clanId
		var_6_2.clanDetails = arg_6_0._clanDetails

		arg_6_1:SetCurrentLocation(FRIENDS.TabIDs.CLANS, CLANS.CLAN_TAB_IDs.MEMBERS)
		arg_6_1:SetupPlayerData(var_6_2)
	elseif var_6_0 == CLANS.CLAN_TAB_IDs.OUTGOING_INVITES then
		local var_6_5 = arg_6_0._clanInvites[var_6_1 + 1]
		local var_6_6 = var_6_5.xuid

		if not var_6_5.name or var_6_5.name == "" then
			local var_6_7 = Friends.HCAFBJBHC(arg_6_0._controllerIndex, var_6_6)

			if var_6_7.valid == true then
				var_6_5 = var_6_7
			end

			var_6_5.xuid = var_6_6
			var_6_5 = FRIENDS.UnifyPlayerDataFormat(var_6_5)
		end

		var_6_5.controllerIndex = arg_6_0._controllerIndex
		var_6_5.viewerMemberRole = arg_6_0._memberRole
		var_6_5.clanId = arg_6_0._clanId
		var_6_5.clanDetails = arg_6_0._clanDetails

		arg_6_1:SetCurrentLocation(FRIENDS.TabIDs.CLANS, CLANS.CLAN_TAB_IDs.OUTGOING_INVITES)
		arg_6_1:SetupPlayerData(var_6_5)
	elseif var_6_0 == CLANS.CLAN_TAB_IDs.INCOMING_REQUESTS then
		local var_6_8 = arg_6_0._clanInvites[var_6_1 + 1]
		local var_6_9 = var_6_8.xuid

		if not var_6_8.name or var_6_8.name == "" then
			local var_6_10 = Friends.HCAFBJBHC(arg_6_0._controllerIndex, var_6_9)

			if var_6_10.valid == true then
				var_6_8 = var_6_10
			end

			var_6_8.xuid = var_6_9
			var_6_8 = FRIENDS.UnifyPlayerDataFormat(var_6_8)
		end

		var_6_8.controllerIndex = arg_6_0._controllerIndex
		var_6_8.viewerMemberRole = arg_6_0._memberRole
		var_6_8.clanId = arg_6_0._clanId
		var_6_8.clanDetails = arg_6_0._clanDetails

		arg_6_1:SetCurrentLocation(FRIENDS.TabIDs.CLANS, CLANS.CLAN_TAB_IDs.INCOMING_REQUESTS)
		arg_6_1:SetupPlayerData(var_6_8)
	end

	function arg_6_1.UpdatePlayerDetailsContent(arg_7_0, arg_7_1)
		arg_6_0._selectedPlayerData = {
			clanId = arg_7_1.clanId,
			xuid = arg_7_1.xuid,
			name = arg_7_1.name or arg_7_1.fullNameWithHash
		}

		local var_7_0 = arg_7_1.xuid

		var_0_6(arg_6_0, var_7_0)
	end
end

local function var_0_8(arg_8_0, arg_8_1)
	arg_8_0.activeTabWidget = MenuBuilder.BuildRegisteredType("ClansMemberScreenGridWidget", {
		controllerIndex = arg_8_1
	})

	arg_8_0.activeTabWidget:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1123, _1080p * 294, _1080p * 925)
	arg_8_0:addElement(arg_8_0.activeTabWidget)
	arg_8_0.activeTabWidget.ClanMembersScreenGrid:SetSnapOnWrapEnabled(true)
	arg_8_0.activeTabWidget.ClanMembersScreenGrid:SetNumChildren(0)
	arg_8_0.activeTabWidget.ClanMembersScreenGrid:SetRefreshChild(function(arg_9_0, arg_9_1, arg_9_2)
		var_0_7(arg_8_0, arg_9_0, arg_9_1, arg_9_2)
	end)
end

local function var_0_9(arg_10_0)
	arg_10_0.activeTabWidget:closeTree()

	arg_10_0.activeTabWidget = nil
end

local function var_0_10(arg_11_0, arg_11_1)
	return function(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
		local var_12_0 = LUI.FlowManager.GetScopedData(arg_11_0)
		local var_12_1 = arg_12_2 + 1

		if not (arg_11_0.activeTabWidget and var_12_0.activeTabIndex and var_12_0.activeTabIndex == var_12_1) then
			var_12_0.activeTabIndex = var_12_1
			arg_11_0.activeTab = arg_11_0.activeTabs[var_12_1]

			if arg_11_0.activeTabWidget then
				var_0_9(arg_11_0)
			end

			var_0_8(arg_11_0, arg_11_0._controllerIndex)
			var_0_4(arg_11_0, arg_11_0.activeTab.id)
			Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
		end
	end
end

local function var_0_11(arg_13_0)
	ACTIONS.LeaveMenu(arg_13_0)
end

local function var_0_12(arg_14_0)
	local var_14_0 = arg_14_0._controllerIndex

	if not MenuBuilder.IsTypeRegistered(var_0_1) then
		local function var_14_1()
			local var_15_0 = MenuBuilder.BuildRegisteredType("ClansSocialInvite", {
				controllerIndex = var_14_0,
				usage = CLANS.CLAN_SOCIAL_INVITE_INPUT.CLANS
			})
			local var_15_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
				controllerIndex = var_14_0,
				widget = var_15_0
			})

			var_15_1.id = var_0_1

			var_15_0:SetParent(var_15_1)

			return var_15_1
		end

		MenuBuilder.registerType(var_0_1, var_14_1)
	end

	LUI.FlowManager.RequestPopupMenu(nil, var_0_1, true, var_14_0, false, nil)
end

local function var_0_13(arg_16_0)
	local var_16_0 = MenuBuilder.BuildRegisteredType("ClanBannedMemberListPopup", {
		controllerIndex = arg_16_0._controllerIndex,
		clanId = arg_16_0._clanId
	})

	LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_16_0._controllerIndex, false, {
		widget = var_16_0
	})
end

local function var_0_14(arg_17_0)
	arg_17_0.InviteSocialHelper.Background:SetAlpha(0)
	arg_17_0.RankChangeHelper.Background:SetAlpha(0)
	arg_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	if arg_17_0._memberRole ~= CLANS.CLAN_MEMBER_ROLE.CLAN_MEMBER then
		arg_17_0.InviteSocialHelper.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt2",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/INVITE_SOCIAL")
		})
		arg_17_0:addAndCallEventHandler("update_input_type", arg_17_0.UpdateInputType, {
			controllerIndex = arg_17_0._controllerIndex
		})
	end

	local var_17_0 = LUI.UIBindButton.new()

	var_17_0.id = "selfBindButton"

	arg_17_0:addElement(var_17_0)

	arg_17_0._bindButton = var_17_0

	arg_17_0._bindButton:addEventHandler("button_secondary", function(arg_18_0, arg_18_1)
		var_0_11(arg_17_0)
	end)

	if arg_17_0._memberRole ~= CLANS.CLAN_MEMBER_ROLE.CLAN_MEMBER then
		arg_17_0._bindButton:addEventHandler("button_alt2", function(arg_19_0, arg_19_1)
			var_0_12(arg_17_0)
		end)
		arg_17_0._bindButton:addEventHandler("button_alt1", function(arg_20_0, arg_20_1)
			arg_17_0._selectedPlayerData.controllerIndex = arg_17_0._controllerIndex

			CLANS.HandleOpenChangeRoleFlyout(arg_17_0._selectedPlayerData)
		end)
	end

	if arg_17_0._memberRole >= CLANS.CLAN_MEMBER_ROLE.CLAN_ADMIN then
		arg_17_0.HelperBar:PushButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 5,
			helper_text = Engine.CBBHFCGDIC("CLANS/VIEW_BANNED_PLAYERS")
		})
		arg_17_0._bindButton:addEventHandler("button_right_stick", function(arg_21_0, arg_21_1)
			var_0_13(arg_17_0)
		end)
	end
end

local function var_0_15(arg_22_0)
	if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_22_0._controllerIndex) then
		arg_22_0.RankChangeHelper.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/CHANGE_RANK")
		})
	else
		arg_22_0.RankChangeHelper.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_alt1"
		})
	end
end

local function var_0_16(arg_23_0)
	arg_23_0._clanQueueTimer = LUI.UITimer.new({
		interval = 1100,
		event = "clan_queue_refresh_timer"
	})
	arg_23_0._clanQueueTimer.id = "ClanQueueRefreshTimer"

	arg_23_0:addElement(arg_23_0._clanQueueTimer)
	arg_23_0:addAndCallEventHandler("clan_queue_refresh_timer", function(arg_24_0, arg_24_1)
		CLANS.CLAN_DATA.CheckAndRefireProcessArray()
	end)
end

local function var_0_17(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0._controllerIndex = arg_25_1
	arg_25_0._mouseFocusRefcount = 0
	arg_25_0.activeTabs = {}
	arg_25_0.activeTabIDsToIndex = {}
	arg_25_0._clanId = nil
	arg_25_0._memberRole = nil
	arg_25_0._selectedPlayerData = nil
	arg_25_0.UpdateInputType = var_0_15

	CLANS.CLAN_DATA.ResetClanDataArray()
	arg_25_0:registerEventHandler(CLANS.CLAN_EVENTS.CLAN_DATA_RESOLVED, function(arg_26_0, arg_26_1)
		CLANS.CLAN_DATA.SetAndUpdateElementData(arg_26_1 and arg_26_1.clanDetails and arg_26_1.clanDetails[1], arg_25_0._controllerIndex)
	end)
	arg_25_0:addAndCallEventHandler(CLANS.CLAN_EVENTS.NOTIFICATION, function(arg_27_0, arg_27_1)
		var_0_4(arg_25_0, arg_25_0._activeTabID)
	end)

	local var_25_0 = Clans2.CFGBBBHFHB(arg_25_0._controllerIndex)

	if var_25_0 then
		local var_25_1 = Clans2.GFFJCJFIJ(arg_25_0._controllerIndex, var_25_0)
		local var_25_2 = Engine.EAGGAEGHHA(arg_25_0._controllerIndex)
		local var_25_3 = Clans2.CFDHGBFICH(arg_25_0._controllerIndex, var_25_0, var_25_2)

		arg_25_0._clanDetails = var_25_1
		arg_25_0._clanId = var_25_0
		arg_25_0._memberRole = var_25_3

		if var_25_3 ~= CLANS.CLAN_MEMBER_ROLE.CLAN_MEMBER then
			var_0_2(arg_25_0, var_0_10, arg_25_2)
		else
			arg_25_0._activeTabID = CLANS.CLAN_TAB_IDs.MEMBERS

			var_0_8(arg_25_0, arg_25_1)
			var_0_4(arg_25_0, CLANS.CLAN_TAB_IDs.MEMBERS)
		end
	end

	arg_25_0:registerEventHandler("friend_card_gain_focus", function()
		if LUI.IsLastInputMouseNavigation(arg_25_1) then
			arg_25_0._mouseFocusRefcount = arg_25_0._mouseFocusRefcount + 1
		else
			arg_25_0._mouseFocusRefcount = 1
		end
	end)
	arg_25_0:registerEventHandler("friend_card_lose_focus", function()
		if LUI.IsLastInputMouseNavigation(arg_25_1) and arg_25_0._mouseFocusRefcount > 0 then
			arg_25_0._mouseFocusRefcount = arg_25_0._mouseFocusRefcount - 1
		end

		if LUI.IsLastInputMouseNavigation(arg_25_1) and arg_25_0._mouseFocusRefcount == 0 then
			ACTIONS.AnimateSequence(arg_25_0, "HideDetails")
		end
	end)
	var_0_14(arg_25_0)
	var_0_16(arg_25_0)
	arg_25_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CLANS/CLAN_MEMBERS"))
	ACTIONS.ScaleStretchAnchorFullscreen(arg_25_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_25_0, arg_25_1, {
		addScreenDarkener = true,
		addWorldBlur = true
	})
end

function ClanMembersScreen(arg_30_0, arg_30_1)
	local var_30_0 = LUI.UIElement.new()

	var_30_0.id = "ClanMembersScreen"
	var_30_0._animationSets = var_30_0._animationSets or {}
	var_30_0._sequences = var_30_0._sequences or {}

	local var_30_1 = arg_30_1 and arg_30_1.controllerIndex

	if not var_30_1 and not Engine.DDJFBBJAIG() then
		var_30_1 = var_30_0:getRootController()
	end

	assert(var_30_1)

	var_30_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_30_1
	})
	var_30_0.HelperBar.id = "HelperBar"

	var_30_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_30_0.HelperBar:setPriority(10)
	var_30_0:addElement(var_30_0.HelperBar)

	local var_30_2 = var_30_0
	local var_30_3
	local var_30_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_30_1
	})

	var_30_4.id = "NoFriendsBacker"

	var_30_4:SetAlpha(0, 0)
	var_30_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -516, _1080p * 516, _1080p * -15, _1080p * 57)
	var_30_0:addElement(var_30_4)

	var_30_0.NoFriendsBacker = var_30_4

	local var_30_5
	local var_30_6 = LUI.UIText.new()

	var_30_6.id = "NoFriendsLabel"

	var_30_6:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_30_6:SetAlpha(0, 0)
	var_30_6:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_RECENT_PLAYERS"), 0)
	var_30_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_30_6:SetAlignment(LUI.Alignment.Center)
	var_30_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_30_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -460, _1080p * 460, _1080p * 5, _1080p * 37)
	var_30_0:addElement(var_30_6)

	var_30_0.NoFriendsLabel = var_30_6

	local var_30_7
	local var_30_8 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_30_1
	})

	var_30_8.id = "DoubleNotchedBacker"

	var_30_8:SetAlpha(0, 0)
	var_30_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1166, _1080p * 1696, _1080p * 260, _1080p * 925)
	var_30_0:addElement(var_30_8)

	var_30_0.DoubleNotchedBacker = var_30_8

	local var_30_9
	local var_30_10 = LUI.UIStyledText.new()

	var_30_10.id = "OnlineStatusText"

	var_30_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_30_10:SetAlpha(0, 0)
	var_30_10:setText(Engine.CBBHFCGDIC("LUA_MENU/OFFLINE"), 0)
	var_30_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_30_10:SetWordWrap(false)
	var_30_10:SetAlignment(LUI.Alignment.Right)
	var_30_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1607, _1080p * 1672, _1080p * 457, _1080p * 481)
	var_30_0:addElement(var_30_10)

	var_30_0.OnlineStatusText = var_30_10

	local var_30_11
	local var_30_12 = MenuBuilder.BuildRegisteredType("SocialFriendDetails", {
		controllerIndex = var_30_1
	})

	var_30_12.id = "PlayerDetails"

	var_30_12:SetAlpha(0, 0)
	var_30_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1176, _1080p * 1696, _1080p * 260, _1080p * 925)
	var_30_0:addElement(var_30_12)

	var_30_0.PlayerDetails = var_30_12

	local var_30_13
	local var_30_14 = MenuBuilder.BuildRegisteredType("SocialPlayerStatus", {
		controllerIndex = var_30_1
	})

	var_30_14.id = "PlayerStatus"

	var_30_14:SetAlpha(0, 0)
	var_30_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1578, _1080p * 1602, _1080p * 457, _1080p * 481)
	var_30_0:addElement(var_30_14)

	var_30_0.PlayerStatus = var_30_14

	local var_30_15
	local var_30_16 = LUI.UIImage.new()

	var_30_16.id = "HeadLine"

	var_30_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_30_16:SetAlpha(0, 0)
	var_30_16:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_30_16:Setup3SliceHorizontalImage(_1080p * 10, 0.3)
	var_30_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 92, _1080p * 1123, _1080p * 250, _1080p * 251)
	var_30_0:addElement(var_30_16)

	var_30_0.HeadLine = var_30_16

	local var_30_17
	local var_30_18 = LUI.UIText.new()

	var_30_18.id = "PlayerNumText"

	var_30_18:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_30_18:SetAlpha(0, 0)
	var_30_18:setText(Engine.CBBHFCGDIC("LUA_MENU/RECEIVED_REQUESTS"), 0)
	var_30_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_30_18:SetAlignment(LUI.Alignment.Right)
	var_30_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 932, _1080p * -803, _1080p * 225, _1080p * 249)
	var_30_0:addElement(var_30_18)

	var_30_0.PlayerNumText = var_30_18

	local var_30_19
	local var_30_20 = LUI.UIImage.new()

	var_30_20.id = "InputImage"

	var_30_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_30_20:SetAlpha(0, 0)
	var_30_20:setImage(RegisterMaterial("icon_platform_controller"), 0)
	var_30_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1188, _1080p * 1220, _1080p * 867, _1080p * 899)
	var_30_0:addElement(var_30_20)

	var_30_0.InputImage = var_30_20

	local var_30_21
	local var_30_22 = LUI.UIStyledText.new()

	var_30_22.id = "InputText"

	var_30_22:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_30_22:SetAlpha(0, 0)
	var_30_22:setText(Engine.CBBHFCGDIC("PLATFORM_UI/PLAYING_WITH_CONTROLLER"), 0)
	var_30_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_30_22:SetAlignment(LUI.Alignment.Left)
	var_30_22:SetVerticalAlignment(LUI.Alignment.Center)
	var_30_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_30_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1226, _1080p * 1672, _1080p * 871, _1080p * 895)
	var_30_0:addElement(var_30_22)

	var_30_0.InputText = var_30_22

	local var_30_23
	local var_30_24 = LUI.UIStyledText.new()

	var_30_24.id = "LeaderText"

	var_30_24:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_30_24:SetAlpha(0, 0)
	var_30_24:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEADER"), 0)
	var_30_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_30_24:SetAlignment(LUI.Alignment.Left)
	var_30_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_30_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1562, _1080p * 459, _1080p * 479)
	var_30_0:addElement(var_30_24)

	var_30_0.LeaderText = var_30_24

	local var_30_25
	local var_30_26 = LUI.UIImage.new()

	var_30_26.id = "LeaderImage"

	var_30_26:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_30_26:SetAlpha(0, 0)
	var_30_26:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_30_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1192, _1080p * 1216, _1080p * 455, _1080p * 479)
	var_30_0:addElement(var_30_26)

	var_30_0.LeaderImage = var_30_26

	local var_30_27
	local var_30_28 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_30_1
	})

	var_30_28.id = "RankChangeHelper"

	var_30_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1172, _1080p * 1696, _1080p * 189, _1080p * 249)
	var_30_0:addElement(var_30_28)

	var_30_0.RankChangeHelper = var_30_28

	local var_30_29
	local var_30_30 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_30_1
	})

	var_30_30.id = "InviteSocialHelper"

	var_30_30:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 319, _1080p * 216, _1080p * 276)
	var_30_0:addElement(var_30_30)

	var_30_0.InviteSocialHelper = var_30_30

	local var_30_31

	if CONDITIONS.AlwaysFalse() then
		local var_30_32 = LUI.UIImage.new()

		var_30_32.id = "GridBackgroundImage"

		var_30_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1123, _1080p * 294, _1080p * 925)
		var_30_0:addElement(var_30_32)

		var_30_0.GridBackgroundImage = var_30_32
	end

	local var_30_33
	local var_30_34 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_30_1
	})

	var_30_34.id = "TabBacker"

	var_30_34:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_30_0:addElement(var_30_34)

	var_30_0.TabBacker = var_30_34

	local var_30_35
	local var_30_36 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_30_1
	})

	var_30_36.id = "MenuTitle"

	var_30_36.MenuTitle:setText(ToUpperCase(""), 0)
	var_30_36.Line:SetLeft(0, 0)
	var_30_36:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_30_0:addElement(var_30_36)

	var_30_0.MenuTitle = var_30_36

	local var_30_37

	if CONDITIONS.InFrontend() then
		local var_30_38 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_30_1
		})

		var_30_38.id = "LobbyMembersFooter"

		var_30_38:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_30_0:addElement(var_30_38)

		var_30_0.LobbyMembersFooter = var_30_38
	end

	local var_30_39
	local var_30_40 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_30_1
			})
		end,
		controllerIndex = var_30_1
	}
	local var_30_41 = LUI.TabManager.new(var_30_40)

	var_30_41.id = "Tabs"

	var_30_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 986, _1080p * 108, _1080p * 160)
	var_30_0:addElement(var_30_41)

	var_30_0.Tabs = var_30_41

	local var_30_42

	if CONDITIONS.IsUserSignedInDemonware(var_30_1) then
		local var_30_43 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_30_1
		})

		var_30_43.id = "PlayerDetailsMP"

		var_30_43:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_30_0:addElement(var_30_43)

		var_30_0.PlayerDetailsMP = var_30_43
	end

	local function var_30_44()
		return
	end

	var_30_0._sequences.DefaultSequence = var_30_44

	local var_30_45
	local var_30_46 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_8:RegisterAnimationSequence("ShowDetails", var_30_46)

	local var_30_47 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("ShowDetails", var_30_47)

	local function var_30_48()
		var_30_8:AnimateSequence("ShowDetails")
		var_30_12:AnimateSequence("ShowDetails")
	end

	var_30_0._sequences.ShowDetails = var_30_48

	local var_30_49
	local var_30_50 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_8:RegisterAnimationSequence("HideDetails", var_30_50)

	local var_30_51 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_10:RegisterAnimationSequence("HideDetails", var_30_51)

	local var_30_52 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_12:RegisterAnimationSequence("HideDetails", var_30_52)

	local var_30_53 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_14:RegisterAnimationSequence("HideDetails", var_30_53)

	local var_30_54 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_20:RegisterAnimationSequence("HideDetails", var_30_54)

	local var_30_55 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_22:RegisterAnimationSequence("HideDetails", var_30_55)

	local var_30_56 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_24:RegisterAnimationSequence("HideDetails", var_30_56)

	local var_30_57 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_26:RegisterAnimationSequence("HideDetails", var_30_57)

	local function var_30_58()
		var_30_8:AnimateSequence("HideDetails")
		var_30_10:AnimateSequence("HideDetails")
		var_30_12:AnimateSequence("HideDetails")
		var_30_14:AnimateSequence("HideDetails")
		var_30_20:AnimateSequence("HideDetails")
		var_30_22:AnimateSequence("HideDetails")
		var_30_24:AnimateSequence("HideDetails")
		var_30_26:AnimateSequence("HideDetails")
	end

	var_30_0._sequences.HideDetails = var_30_58

	local var_30_59
	local var_30_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 700
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_8:RegisterAnimationSequence("OfflinePlayer", var_30_60)

	local var_30_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 630
		}
	}

	var_30_20:RegisterAnimationSequence("OfflinePlayer", var_30_61)

	local var_30_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 602
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 626
		}
	}

	var_30_22:RegisterAnimationSequence("OfflinePlayer", var_30_62)

	local function var_30_63()
		var_30_8:AnimateSequence("OfflinePlayer")
		var_30_20:AnimateSequence("OfflinePlayer")
		var_30_22:AnimateSequence("OfflinePlayer")
	end

	var_30_0._sequences.OfflinePlayer = var_30_63

	local var_30_64
	local var_30_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 915
		}
	}

	var_30_8:RegisterAnimationSequence("OnlinePlayer", var_30_65)

	local var_30_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_20:RegisterAnimationSequence("OnlinePlayer", var_30_66)

	local var_30_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_22:RegisterAnimationSequence("OnlinePlayer", var_30_67)

	local function var_30_68()
		var_30_8:AnimateSequence("OnlinePlayer")
		var_30_20:AnimateSequence("OnlinePlayer")
		var_30_22:AnimateSequence("OnlinePlayer")
	end

	var_30_0._sequences.OnlinePlayer = var_30_68

	local var_30_69
	local var_30_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 570
		}
	}

	var_30_8:RegisterAnimationSequence("CompactDetailsPane", var_30_70)

	local var_30_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 503
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 527
		}
	}

	var_30_10:RegisterAnimationSequence("CompactDetailsPane", var_30_71)

	local var_30_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 503
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 527
		}
	}

	var_30_14:RegisterAnimationSequence("CompactDetailsPane", var_30_72)

	local var_30_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 495
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 527
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1184
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1216
		}
	}

	var_30_20:RegisterAnimationSequence("CompactDetailsPane", var_30_73)

	local var_30_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 501
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 525
		}
	}

	var_30_22:RegisterAnimationSequence("CompactDetailsPane", var_30_74)

	local var_30_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 535
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 555
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1220
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1558
		}
	}

	var_30_24:RegisterAnimationSequence("CompactDetailsPane", var_30_75)

	local var_30_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1188
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 531
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1212
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 555
		}
	}

	var_30_26:RegisterAnimationSequence("CompactDetailsPane", var_30_76)

	local function var_30_77()
		var_30_8:AnimateSequence("CompactDetailsPane")
		var_30_10:AnimateSequence("CompactDetailsPane")
		var_30_14:AnimateSequence("CompactDetailsPane")
		var_30_20:AnimateSequence("CompactDetailsPane")
		var_30_22:AnimateSequence("CompactDetailsPane")
		var_30_24:AnimateSequence("CompactDetailsPane")
		var_30_26:AnimateSequence("CompactDetailsPane")
	end

	var_30_0._sequences.CompactDetailsPane = var_30_77

	var_0_17(var_30_0, var_30_1, arg_30_1)

	return var_30_0
end

MenuBuilder.registerType("ClanMembersScreen", ClanMembersScreen)
LockTable(_M)
