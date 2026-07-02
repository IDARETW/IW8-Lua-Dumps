module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = MenuBuilder.BuildRegisteredType("SocialPartyQuickInvitePopup", arg_1_1)
	local var_1_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		quickCloseEvent = "closing_quick_access_menu",
		controllerIndex = arg_1_1.controllerIndex,
		widget = var_1_0,
		disableQuickAccessShortcuts = arg_1_1.disableQuickAccessShortcuts
	})

	var_1_1.id = "PartyQuickInvitePopup"

	if var_1_1 and var_1_1.ButtonHelperBar then
		var_1_1.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/TOGGLE_OFFLINE_FRIENDS")
		})
	end

	return var_1_1
end

MenuBuilder.registerType("PartyQuickInvitePopup", var_0_0)

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = MenuBuilder.BuildRegisteredType("SocialPopupLayout", arg_2_1)
	local var_2_1 = Social.BDIGHHGJEH()

	var_2_0:SetupPlayerGrid(var_2_1)
	var_2_0:SetMenuLocation(FRIENDS.TabIDs.PRIVATE_PARTY, FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS)
	var_2_0:SetMenuTitle(Engine.CBBHFCGDIC("LUA_MENU/PARTY_INVITATIONS"))
	var_2_0.NoPlayersLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/ NO_INVITES_RECEIVED"))
	var_2_0:addEventHandler("refresh_party_invitations", function(arg_3_0, arg_3_1)
		local var_3_0 = Social.BDIGHHGJEH()

		arg_3_0:SetupPlayerGrid(var_3_0)
	end)

	if not CONDITIONS.InFrontend() then
		return var_2_0
	end

	local var_2_2 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		quickCloseEvent = "closing_quick_access_menu",
		controllerIndex = arg_2_1.controllerIndex,
		widget = var_2_0,
		disableQuickAccessShortcuts = arg_2_1.disableQuickAccessShortcuts
	})

	var_2_2.id = "PartyInvitationPopup"

	var_2_2:addEventHandler("closing_quick_access_menu", function(arg_4_0, arg_4_1)
		arg_4_0:exitAnimation(arg_4_0, arg_2_1)
	end)

	return var_2_2
end

MenuBuilder.registerType("PartyInvitationPopup", var_0_1)

local function var_0_2(arg_5_0, arg_5_1)
	local var_5_0 = MenuBuilder.BuildRegisteredType("SocialPartySettingsPopup", arg_5_1)
	local var_5_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		controllerIndex = arg_5_1.controllerIndex,
		widget = var_5_0
	})

	var_5_1.id = "PartyPrivacyPopup"

	return var_5_1
end

MenuBuilder.registerType("PartyPrivacyPopup", var_0_2)

local function var_0_3(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.MenuLayout.PlayersGrid

	var_6_0.playersData = Friends.BJDEIGDDCD()

	local var_6_1 = var_6_0:GetNumChildren()
	local var_6_2 = #var_6_0.playersData

	if var_6_1 ~= var_6_2 then
		var_6_0:SetNumChildren(var_6_2)
	end

	var_6_0:RefreshContent()

	local var_6_3 = Engine.JEDFGECDJ() > 1

	arg_6_0._shouldLeavePartyButtonBeEnabled = (var_6_2 > 2 or not var_6_3 and var_6_2 > 1) and Engine.IDHBHGDFE()

	if arg_6_0.UpdateLeavePartyButtonHelper then
		arg_6_0.UpdateLeavePartyButtonHelper(arg_6_0._shouldLeavePartyButtonBeEnabled)
	end
end

local function var_0_4(arg_7_0)
	return arg_7_0.MenuLayout.PlayersGrid
end

local function var_0_5()
	local var_8_0 = Lobby.BCBBBABFFB()
	local var_8_1 = Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY")
	local var_8_2 = ""

	if var_8_0 == CoD.PartyPrivacySetting.CLOSED then
		var_8_2 = Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_CLOSED")
	elseif var_8_0 == CoD.PartyPrivacySetting.JOINABLE_BY_FRIENDS then
		var_8_2 = Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_JOINABLE_BY_FRIENDS")
	elseif var_8_0 == CoD.PartyPrivacySetting.INVITE_ONLY then
		var_8_2 = Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_INVITE_ONLY")
	else
		var_8_2 = Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_PUBLIC")
	end

	return Engine.CBBHFCGDIC("LUA_MENU/X_COLON_Y", var_8_1, var_8_2)
end

local function var_0_6(arg_9_0, arg_9_1)
	local var_9_0 = Friends.BJDEIGDDCD()
	local var_9_1 = FRIENDS.AreWeHost(var_9_0)
	local var_9_2 = Lobby.DFCFDHBBHH()

	arg_9_0.HelperBar.ButtonHelperText:PopButtonPrompt({
		button_ref = "button_r3"
	})

	if var_9_1 and not var_9_2 then
		arg_9_0._menuHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			priority = 30,
			optOutOfAutomaticKBMIcon = true,
			button_ref = "button_r3",
			helper_text = var_0_5()
		})
	end

	if Lobby.BCBBBABFFB() ~= CoD.PartyPrivacySetting.CLOSED then
		arg_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			priority = 10,
			button_ref = "button_alt2",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUICK_INVITE"),
			container = arg_9_0.MenuLayout.FirstTopPromptContainer
		})
	else
		arg_9_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_alt2"
		})
	end
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.GetPlayerGrid = var_0_4
	arg_10_0._menuHelperBar = arg_10_2.helpbar
	arg_10_0._partyMaxCountDataSource = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.maxCount")

	arg_10_0.MenuLayout:SetRefreshChildFuncByTab(FRIENDS.TabIDs.PRIVATE_PARTY)

	local var_10_0 = LUI.UITimer.new({
		interval = 1000,
		event = "update_social_party"
	})

	var_10_0.id = "socialPartyTimer"

	arg_10_0:addElement(var_10_0)
	arg_10_0:addAndCallEventHandler("update_social_party", var_0_3)
	arg_10_0:registerEventHandler("update_input_type", function(arg_11_0, arg_11_1)
		if LUI.IsLastInputKeyboardMouse(arg_11_1.controllerIndex) then
			arg_11_0.MenuLayout.PlayersGrid:processEvent({
				name = "lose_focus"
			})
		end
	end)

	local var_10_1 = Friends.BJDEIGDDCD()
	local var_10_2 = FRIENDS.AreWeHost(var_10_1)
	local var_10_3 = Lobby.DFCFDHBBHH()

	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 10,
		button_ref = "button_alt2",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUICK_INVITE"),
		container = arg_10_0.MenuLayout.FirstTopPromptContainer
	})

	if Engine.CGABICJHAI() then
		arg_10_0.MenuLayout.InviteButton:SetPromptText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_INVITATIONS"))
	else
		arg_10_0.MenuLayout.InviteButton:SetPromptText(Engine.CBBHFCGDIC("LUA_MENU/ACTIVISION_INVITATIONS"))
	end

	if var_10_2 and not var_10_3 then
		arg_10_0._menuHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			priority = 30,
			optOutOfAutomaticKBMIcon = true,
			button_ref = "button_r3",
			helper_text = var_0_5()
		})
	end

	local var_10_4 = LUI.UIBindButton.new()

	var_10_4.id = "bindButton"

	arg_10_0:addElement(var_10_4)

	arg_10_0.bindButton = var_10_4

	local function var_10_5()
		if Lobby.BCBBBABFFB() ~= CoD.PartyPrivacySetting.CLOSED then
			LUI.FlowManager.RequestPopupMenu(nil, "PartyQuickInvitePopup", true, arg_10_1, false, {
				controllerIndex = arg_10_1
			})
		end
	end

	local function var_10_6()
		LUI.FlowManager.RequestPopupMenu(nil, "PartyInvitationPopup", true, arg_10_1, false, {
			controllerIndex = arg_10_1,
			tabID = FRIENDS.TabIDs.PRIVATE_PARTY,
			subTabID = FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS
		})
	end

	arg_10_0.bindButton:addEventHandler("button_alt2", var_10_5)
	arg_10_0.bindButton:addEventHandler("button_alt1", var_10_6)
	arg_10_0.MenuLayout.InviteButton:SetAction(var_10_6)
	arg_10_0.bindButton:addEventHandler("button_right_stick", function(arg_14_0, arg_14_1)
		if var_10_2 and not var_10_3 then
			local var_14_0 = {
				areWeHost = true,
				controllerIndex = arg_10_1
			}

			LUI.FlowManager.RequestPopupMenu(nil, "PartyPrivacyPopup", true, arg_10_1, false, var_14_0)
		end
	end)
	arg_10_0:addEventHandler("restore_focus", var_0_6)
	var_0_6(arg_10_0)
	arg_10_0.bindButton:addEventHandler("button_left_trigger", function(arg_15_0, arg_15_1)
		if arg_10_0._shouldLeavePartyButtonBeEnabled then
			LUI.FlowManager.RequestPopupMenu(arg_10_0, "LeavePrivatePartyConfirmPopup", true, arg_15_1.controller, false, {
				moveUI = false,
				menu = arg_10_0
			})
		end
	end)

	local var_10_7 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")
	local var_10_8 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.maxCount")

	local function var_10_9()
		local var_16_0 = var_10_7:GetValue(arg_10_1) or 0
		local var_16_1 = var_10_8:GetValue(arg_10_1) or 0

		arg_10_0.MenuLayout:SetHeader(Engine.CBBHFCGDIC("LUA_MENU/PARTY_COUNT_WITH_ICON", var_16_0, var_16_1), nil, true)
	end

	arg_10_0:SubscribeToModel(var_10_7:GetModel(arg_10_1), var_10_9)
	arg_10_0:SubscribeToModel(var_10_8:GetModel(arg_10_1), var_10_9)
end

function SocialPartyMenu(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0.id = "SocialPartyMenu"

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	var_17_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_17_1
	})
	var_17_0.HelperBar.id = "HelperBar"

	var_17_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_17_0.HelperBar:setPriority(10)
	var_17_0:addElement(var_17_0.HelperBar)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = MenuBuilder.BuildRegisteredType("SocialMenuLayout", {
		controllerIndex = var_17_1
	})

	var_17_4.id = "MenuLayout"

	var_17_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_17_0:addElement(var_17_4)

	var_17_0.MenuLayout = var_17_4

	var_0_7(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("SocialPartyMenu", SocialPartyMenu)
LockTable(_M)
