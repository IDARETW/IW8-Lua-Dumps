module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1 = 1
	local var_1_2 = not Engine.CAADCDEEIA()
	local var_1_3 = {
		{
			name = "LUA_MENU/FRIENDS",
			menuId = "SocialFriendsMenu",
			isEnabled = true,
			id = FRIENDS.TabIDs.ONLINE_FRIENDS
		},
		{
			name = "LUA_MENU/PARTY",
			menuId = "SocialPartyMenu",
			id = FRIENDS.TabIDs.PRIVATE_PARTY,
			isEnabled = var_1_2
		},
		{
			name = "LUA_MENU/RECENT_SQUAD",
			menuId = "SocialSquadMenu",
			id = FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS,
			isEnabled = var_1_2 and not Dvar.IBEGCHEFE("online_recent_squad_ui_disabled")
		}
	}

	for iter_1_0, iter_1_1 in ipairs(var_1_3) do
		if iter_1_1.isEnabled then
			arg_1_0.activeTabIDsToIndex[iter_1_1.id] = var_1_1
			arg_1_0.activeTabs[var_1_1] = iter_1_1

			table.insert(var_1_0, {
				name = ToUpperCase(Engine.CBBHFCGDIC(iter_1_1.name)),
				hasDefaultFocus = iter_1_1.id == FRIENDS.TabIDs.ONLINE_FRIENDS,
				focusFunction = arg_1_1(arg_1_0, arg_1_2)
			})

			var_1_1 = var_1_1 + 1
		end
	end

	arg_1_0.Tabs:SetTabs(var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 and arg_2_1 < arg_2_2 then
		arg_2_0.NoFriendsLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_ONLINE_FRIENDS"))
	else
		arg_2_0.NoFriendsLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_FRIENDS"))
	end

	local var_2_0 = arg_2_1 == 0

	arg_2_0.NoFriendsLabel:SetAlpha(var_2_0 and 1 or 0)
	arg_2_0.NoFriendsBacker:SetAlpha(var_2_0 and 0.5 or 0)
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._activeTabID = arg_3_1

	if arg_3_1 == FRIENDS.TabIDs.ONLINE_FRIENDS then
		arg_3_0._friendsData = Friends.FBFFEFEGB(arg_3_0._controllerIndex, 0, FRIENDS.SOCIAL_MENU_CACHED_FRIENDS, 0, true, arg_3_0._showOfflineFriends)

		arg_3_0.PlayerGrid:SetNumChildren(arg_3_0._friendsData.count)
	elseif arg_3_1 == FRIENDS.TabIDs.PRIVATE_PARTY then
		local var_3_0 = Friends.BJDEIGDDCD()

		arg_3_0._friendsData = var_3_0

		arg_3_0.PlayerGrid:SetNumChildren(#var_3_0)
	elseif arg_3_1 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS then
		arg_3_0._friendsData = Friends.DAHGHDHFIA(arg_3_0._controllerIndex, FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS, 0, FRIENDS.SOCIAL_MENU_CACHED_FRIENDS, 0)

		arg_3_0.PlayerGrid:SetNumChildren(arg_3_0._friendsData.count)
	end

	var_0_1(arg_3_0, arg_3_0._friendsData.count, arg_3_0._friendsData.totalCount)
	arg_3_0.PlayerGrid:RefreshContent()
end

local function var_0_3(arg_4_0)
	arg_4_0._popupParent.ButtonHelperBar.ButtonHelperText:PopButtonPrompt({
		button_ref = "button_r3"
	})
end

local function var_0_4(arg_5_0)
	var_0_3(arg_5_0)

	local var_5_0 = arg_5_0._showOfflineFriends and "LUA_MENU/HIDE_OFFLINE_FRIENDS" or "LUA_MENU/SHOW_OFFLINE_FRIENDS"

	arg_5_0._popupParent.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_r3",
		priority = 3,
		helper_text = Engine.CBBHFCGDIC(var_5_0)
	})
end

local function var_0_5(arg_6_0, arg_6_1)
	return function(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
		local var_7_0 = LUI.FlowManager.GetScopedData(arg_6_0)
		local var_7_1 = arg_7_2 + 1

		if not (arg_6_0.activeTabWidget and var_7_0.activeTabIndex and var_7_0.activeTabIndex == var_7_1) then
			var_7_0.activeTabIndex = var_7_1
			arg_6_0.activeTab = arg_6_0.activeTabs[var_7_1]

			arg_6_0.PlayerGrid:SetNumChildren(0)
			arg_6_0.PlayerGrid:RefreshContent()
			var_0_2(arg_6_0, arg_6_0.activeTab.id)
			Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)

			if arg_6_0._popupParent then
				if arg_6_0.activeTab.id ~= FRIENDS.TabIDs.ONLINE_FRIENDS then
					var_0_3(arg_6_0)
				else
					var_0_4(arg_6_0)
				end
			end
		end
	end
end

local function var_0_6(arg_8_0, arg_8_1)
	local var_8_0 = Clans2.CFGBBBHFHB(arg_8_0._controllerIndex)
	local var_8_1 = arg_8_1.xuidString or arg_8_1.xuid
	local var_8_2 = Engine.EAGGAEGHHA(arg_8_0._controllerIndex)

	if var_8_0 and var_8_1 and var_8_1 ~= var_8_2 then
		Clans2.DIEAGEDBCC(arg_8_0._controllerIndex, var_8_0, var_8_1)
	end
end

local function var_0_7(arg_9_0, arg_9_1)
	local var_9_0 = {}
	local var_9_1 = arg_9_0._additionalData.groupClanId
	local var_9_2 = arg_9_1.xuidString or arg_9_1.xuid
	local var_9_3 = Clans.CHEADIHHBJ(arg_9_0._controllerIndex, var_9_1, var_9_2).memberFound
	local var_9_4 = FRIENDS.IsClanInvitePending(arg_9_0._controllerIndex, var_9_1, var_9_2)

	var_9_0.disabled = var_9_3 or var_9_4
	var_9_0.errorString = ""
	var_9_0.devErrorString = ""

	if var_9_3 then
		var_9_0.errorString = "LUA_MENU/REGIMENT_MEMBER_EXISTS"
		var_9_0.devErrorString = Engine.CBBHFCGDIC(var_9_0.errorString)
	end

	if var_9_0 and not var_9_0.disabled then
		Clans.DIEAGEDBCC(arg_9_0._controllerIndex, var_9_1, var_9_2)
	end
end

local function var_0_8(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = arg_10_0._activeTabID
	local var_10_1 = arg_10_2 + arg_10_3
	local var_10_2

	if var_10_0 == FRIENDS.TabIDs.ONLINE_FRIENDS then
		var_10_2 = arg_10_0._friendsData.friends[var_10_1 + 1]
	elseif var_10_0 == FRIENDS.TabIDs.PRIVATE_PARTY then
		var_10_2 = FRIENDS.UnifyPlayerDataFormat(arg_10_0._friendsData[var_10_1 + 1])
	elseif var_10_0 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS then
		var_10_2 = arg_10_0._friendsData.friends[var_10_1 + 1]
	end

	arg_10_1:SetupPlayerData(var_10_2)
	arg_10_1:registerEventHandler("button_action", function(arg_11_0, arg_11_1)
		if arg_10_0._usage == CLANS.CLAN_SOCIAL_INVITE_INPUT.CLANS then
			var_0_6(arg_10_0, var_10_2)
		elseif arg_10_0._usage == CLANS.CLAN_SOCIAL_INVITE_INPUT.GROUPS then
			var_0_7(arg_10_0, var_10_2)
		end
	end)
end

local function var_0_9(arg_12_0)
	local var_12_0 = LUI.UIBindButton.new()

	var_12_0.id = "selfBindButton"

	arg_12_0:addElement(var_12_0)

	arg_12_0._bindButton = var_12_0

	var_0_4(arg_12_0)
	arg_12_0._bindButton:addEventHandler("button_right_stick", function(arg_13_0, arg_13_1)
		if arg_12_0._activeTabID ~= FRIENDS.TabIDs.ONLINE_FRIENDS then
			return
		end

		arg_12_0._showOfflineFriends = not arg_12_0._showOfflineFriends

		var_0_4(arg_12_0)
		var_0_2(arg_12_0, arg_12_0._activeTabID)
	end)
end

local function var_0_10(arg_14_0, arg_14_1)
	arg_14_0._popupParent = arg_14_1

	var_0_9(arg_14_0)
end

local function var_0_11(arg_15_0, arg_15_1, arg_15_2)
	assert(arg_15_2.usage ~= nil, "Usage cannot be NIL in ClanSocialInvite")

	arg_15_0._controllerIndex = arg_15_1
	arg_15_0._showOfflineFriends = false
	arg_15_0.activeTabs = {}
	arg_15_0.activeTabIDsToIndex = {}
	arg_15_0._usage = arg_15_2.usage
	arg_15_0._additionalData = arg_15_2.data
	arg_15_0.SetParent = var_0_10

	arg_15_0.PlayerGrid:SetSnapOnWrapEnabled(true)
	arg_15_0.PlayerGrid:SetNumChildren(0)
	arg_15_0.PlayerGrid:SetRefreshChild(function(arg_16_0, arg_16_1, arg_16_2)
		var_0_8(arg_15_0, arg_16_0, arg_16_1, arg_16_2)
	end)
	var_0_0(arg_15_0, var_0_5, arg_15_2)
	arg_15_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CLANS/INVITE_TO_CLAN"))
end

function ClansSocialInvite(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIVerticalNavigator.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 825 * _1080p, 0, 1080 * _1080p)

	var_17_0.id = "ClansSocialInvite"

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = {
		spacing = 3,
		wrap = false,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_17_1
			})
		end,
		controllerIndex = var_17_1
	}
	local var_17_5 = LUI.TabManager.new(var_17_4)

	var_17_5.id = "Tabs"

	var_17_5:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -326.5, _1080p * 329.5, _1080p * 162, _1080p * 248)
	var_17_0:addElement(var_17_5)

	var_17_0.Tabs = var_17_5

	local var_17_6
	local var_17_7 = LUI.UIText.new()

	var_17_7.id = "ClanInviteDescription"

	var_17_7:setText(Engine.CBBHFCGDIC("LUA_MENU/INVITE_TO_CLAN_DESC"), 0)
	var_17_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_7:SetAlignment(LUI.Alignment.Left)
	var_17_7:SetVerticalAlignment(LUI.Alignment.Center)
	var_17_7:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 93, 0, _1080p * 120, _1080p * 144)
	var_17_0:addElement(var_17_7)

	var_17_0.ClanInviteDescription = var_17_7

	local var_17_8
	local var_17_9 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 8,
		wrapY = true,
		arrowsVerticalOffset = 5,
		springCoefficient = 400,
		controllerIndex = var_17_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SocialFriendCard", {
				controllerIndex = var_17_1
			})
		end,
		refreshChild = function(arg_20_0, arg_20_1, arg_20_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 510,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_17_10 = LUI.UIGrid.new(var_17_9)

	var_17_10.id = "PlayerGrid"

	var_17_10:setUseStencil(true)
	var_17_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -327, _1080p * 330, _1080p * 280, _1080p * 984)
	var_17_0:addElement(var_17_10)

	var_17_0.PlayerGrid = var_17_10

	local var_17_11
	local var_17_12 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_17_1
	})

	var_17_12.id = "VerticalScrollbar"

	var_17_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 319, _1080p * 330, _1080p * 280, _1080p * 984)
	var_17_0:addElement(var_17_12)

	var_17_0.VerticalScrollbar = var_17_12

	local var_17_13
	local var_17_14 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_17_1
	})

	var_17_14.id = "NoFriendsBacker"

	var_17_14:SetAlpha(0, 0)
	var_17_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -326.5, _1080p * 329.5, _1080p * 490, _1080p * 590)
	var_17_0:addElement(var_17_14)

	var_17_0.NoFriendsBacker = var_17_14

	local var_17_15
	local var_17_16 = LUI.UIText.new()

	var_17_16.id = "NoFriendsLabel"

	var_17_16:SetAlpha(0, 0)
	var_17_16:setText("", 0)
	var_17_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_16:SetAlignment(LUI.Alignment.Center)
	var_17_16:SetVerticalAlignment(LUI.Alignment.Center)
	var_17_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250.5, _1080p * 249.5, _1080p * 522, _1080p * 558)
	var_17_0:addElement(var_17_16)

	var_17_0.NoFriendsLabel = var_17_16

	local var_17_17
	local var_17_18 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_17_1
	})

	var_17_18.id = "MenuTitle"

	var_17_18.MenuTitle:setText("", 0)
	var_17_18.Line:SetLeft(0, 0)
	var_17_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_17_0:addElement(var_17_18)

	var_17_0.MenuTitle = var_17_18

	local var_17_19 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_17_12,
		startCap = var_17_12.startCap,
		endCap = var_17_12.endCap,
		sliderArea = var_17_12.sliderArea,
		slider = var_17_12.sliderArea and var_17_12.sliderArea.slider,
		fixedSizeSlider = var_17_12.sliderArea and var_17_12.sliderArea.fixedSizeSlider
	})

	var_17_10:AddScrollbar(var_17_19)
	var_0_11(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("ClansSocialInvite", ClansSocialInvite)
LockTable(_M)
