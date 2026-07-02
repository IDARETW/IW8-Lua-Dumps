module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0._shouldLeavePartyButtonBeEnabled then
		arg_1_0._helperBar:PushButtonPrompt({
			side = "left",
			button_ref = "button_left_trigger",
			priority = 3,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/LEAVE_PARTY")
		})
	else
		arg_1_0._helperBar:PopButtonPrompt({
			button_ref = "button_left_trigger"
		})
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = MenuBuilder.BuildRegisteredType("SocialPartyQuickInvitePopup", arg_2_1)
	local var_2_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		quickCloseEvent = "closing_quick_access_menu",
		controllerIndex = arg_2_1.controllerIndex,
		widget = var_2_0,
		disableQuickAccessShortcuts = arg_2_1.disableQuickAccessShortcuts
	})

	var_2_1.id = "PartyQuickInvitePopup"

	if var_2_1 and var_2_1.ButtonHelperBar then
		var_2_1.ButtonHelperBar:PushButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/TOGGLE_OFFLINE_FRIENDS")
		})
	end

	return var_2_1
end

MenuBuilder.registerType("PartyQuickInvitePopup", var_0_1)

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = MenuBuilder.BuildRegisteredType("SocialPopupLayout", arg_3_1)
	local var_3_1 = Social.BDIGHHGJEH()

	var_3_0:SetupPlayerGrid(var_3_1)
	var_3_0:SetMenuLocation(FRIENDS.TabIDs.PRIVATE_PARTY, FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS)
	var_3_0:SetMenuTitle(Engine.CBBHFCGDIC("LUA_MENU/PARTY_INVITATIONS"))
	var_3_0.NoPlayersLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/ NO_INVITES_RECEIVED"))
	var_3_0:addEventHandler("refresh_party_invitations", function(arg_4_0, arg_4_1)
		local var_4_0 = Social.BDIGHHGJEH()

		arg_4_0:SetupPlayerGrid(var_4_0)
	end)

	if not CONDITIONS.InFrontend() then
		return var_3_0
	end

	local var_3_2 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		quickCloseEvent = "closing_quick_access_menu",
		controllerIndex = arg_3_1.controllerIndex,
		widget = var_3_0,
		disableQuickAccessShortcuts = arg_3_1.disableQuickAccessShortcuts
	})

	var_3_2.id = "PartyInvitationPopup"

	var_3_2:addEventHandler("closing_quick_access_menu", function(arg_5_0, arg_5_1)
		arg_5_0:exitAnimation(arg_5_0, arg_3_1)
	end)

	return var_3_2
end

MenuBuilder.registerType("PartyInvitationPopup", var_0_2)

local function var_0_3(arg_6_0, arg_6_1)
	local var_6_0 = MenuBuilder.BuildRegisteredType("SocialPartySettingsPopup", arg_6_1)
	local var_6_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		controllerIndex = arg_6_1.controllerIndex,
		widget = var_6_0
	})

	var_6_1.id = "PartyPrivacyPopup"

	return var_6_1
end

MenuBuilder.registerType("PartyPrivacyPopup", var_0_3)

local function var_0_4(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.MenuLayout.PlayersGrid

	var_7_0.playersData = Friends.BJDEIGDDCD()

	local var_7_1 = var_7_0:GetNumChildren()
	local var_7_2 = #var_7_0.playersData

	if var_7_1 ~= var_7_2 then
		var_7_0:SetNumChildren(var_7_2)
	end

	var_7_0:RefreshContent()

	local var_7_3 = Engine.JEDFGECDJ() > 1

	arg_7_0._shouldLeavePartyButtonBeEnabled = (var_7_2 > 2 or not var_7_3 and var_7_2 > 1) and Engine.IDHBHGDFE()

	if arg_7_0.UpdateLeavePartyPrompt then
		var_0_0(arg_7_0)
	end
end

local function var_0_5(arg_8_0)
	return arg_8_0.MenuLayout.PlayersGrid
end

local function var_0_6()
	local var_9_0 = Lobby.BCBBBABFFB()
	local var_9_1 = Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY")
	local var_9_2 = ""

	if var_9_0 == CoD.PartyPrivacySetting.CLOSED then
		var_9_2 = Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_CLOSED")
	elseif var_9_0 == CoD.PartyPrivacySetting.JOINABLE_BY_FRIENDS then
		var_9_2 = Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_JOINABLE_BY_FRIENDS")
	elseif var_9_0 == CoD.PartyPrivacySetting.INVITE_ONLY then
		var_9_2 = Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_INVITE_ONLY")
	else
		var_9_2 = Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_PUBLIC")
	end

	return Engine.CBBHFCGDIC("LUA_MENU/X_COLON_Y", var_9_1, var_9_2)
end

local function var_0_7(arg_10_0)
	arg_10_0._helperBar:PushButtonPrompt({
		side = "left",
		priority = 20,
		replaceTop = true,
		button_ref = "button_alt2",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUICK_INVITE"),
		container = arg_10_0.MenuLayout.FirstTopPromptContainer
	})
end

local function var_0_8(arg_11_0, arg_11_1)
	local var_11_0 = Friends.BJDEIGDDCD()
	local var_11_1 = FRIENDS.AreWeHost(var_11_0)
	local var_11_2 = Lobby.DFCFDHBBHH()

	arg_11_0._helperBar:PopButtonPrompt({
		button_ref = "button_r3"
	})

	if var_11_1 and not var_11_2 then
		arg_11_0._helperBar:PushButtonPrompt({
			side = "left",
			priority = 30,
			optOutOfAutomaticKBMIcon = true,
			button_ref = "button_r3",
			helper_text = var_0_6()
		})
	end

	if Lobby.BCBBBABFFB() ~= CoD.PartyPrivacySetting.CLOSED then
		var_0_7(arg_11_0)
	else
		arg_11_0._helperBar:PopButtonPrompt({
			button_ref = "button_alt2"
		})
	end
end

local function var_0_9(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.GetPlayerGrid = var_0_5
	arg_12_0.UpdateLeavePartyPrompt = var_0_0
	arg_12_0._helperBar = arg_12_2.helperBar
	arg_12_0._partyMaxCountDataSource = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.maxCount")

	arg_12_0.MenuLayout:SetRefreshChildFuncByTab(FRIENDS.TabIDs.PRIVATE_PARTY)

	local var_12_0 = LUI.UITimer.new({
		interval = 1000,
		event = "update_social_party"
	})

	var_12_0.id = "socialPartyTimer"

	arg_12_0:addElement(var_12_0)
	arg_12_0:addAndCallEventHandler("update_social_party", var_0_4)
	arg_12_0:registerEventHandler("update_input_type", function(arg_13_0, arg_13_1)
		if LUI.IsLastInputKeyboardMouse(arg_13_1.controllerIndex) then
			arg_13_0.MenuLayout.PlayersGrid:processEvent({
				name = "lose_focus"
			})
		end
	end)

	local var_12_1 = Friends.BJDEIGDDCD()
	local var_12_2 = FRIENDS.AreWeHost(var_12_1)
	local var_12_3 = Lobby.DFCFDHBBHH()

	var_0_7(arg_12_0)

	if Engine.CGABICJHAI() then
		arg_12_0.MenuLayout.InviteButton:SetPromptText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_INVITATIONS"))
	else
		arg_12_0.MenuLayout.InviteButton:SetPromptText(Engine.CBBHFCGDIC("LUA_MENU/ACTIVISION_INVITATIONS"))
	end

	if var_12_2 and not var_12_3 then
		arg_12_0._helperBar:PushButtonPrompt({
			side = "left",
			priority = 30,
			optOutOfAutomaticKBMIcon = true,
			button_ref = "button_r3",
			helper_text = var_0_6()
		})
	end

	local var_12_4 = LUI.UIBindButton.new()

	var_12_4.id = "bindButton"

	arg_12_0:addElement(var_12_4)

	arg_12_0.bindButton = var_12_4

	local function var_12_5()
		if Lobby.BCBBBABFFB() ~= CoD.PartyPrivacySetting.CLOSED then
			LUI.FlowManager.RequestPopupMenu(nil, "PartyQuickInvitePopup", true, arg_12_1, false, {
				controllerIndex = arg_12_1
			})
		end
	end

	local function var_12_6()
		LUI.FlowManager.RequestPopupMenu(nil, "PartyInvitationPopup", true, arg_12_1, false, {
			controllerIndex = arg_12_1,
			tabID = FRIENDS.TabIDs.PRIVATE_PARTY,
			subTabID = FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS
		})
	end

	arg_12_0.bindButton:addEventHandler("button_alt2", var_12_5)
	arg_12_0.bindButton:addEventHandler("button_alt1", var_12_6)
	arg_12_0.MenuLayout.InviteButton:SetAction(var_12_6)
	arg_12_0.bindButton:addEventHandler("button_right_stick", function(arg_16_0, arg_16_1)
		if var_12_2 and not var_12_3 then
			local var_16_0 = {
				areWeHost = true,
				controllerIndex = arg_12_1
			}

			LUI.FlowManager.RequestPopupMenu(nil, "PartyPrivacyPopup", true, arg_12_1, false, var_16_0)
		end
	end)
	arg_12_0:addEventHandler("restore_focus", var_0_8)
	var_0_8(arg_12_0)
	arg_12_0.bindButton:addEventHandler("button_left_trigger", function(arg_17_0, arg_17_1)
		if arg_12_0._shouldLeavePartyButtonBeEnabled then
			LUI.FlowManager.RequestPopupMenu(arg_12_0, "LeavePrivatePartyConfirmPopup", true, arg_17_1.controller, false, {
				moveUI = false,
				menu = arg_12_0
			})
		end
	end)

	local var_12_7 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")
	local var_12_8 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.maxCount")

	local function var_12_9()
		local var_18_0 = var_12_7:GetValue(arg_12_1) or 0
		local var_18_1 = var_12_8:GetValue(arg_12_1) or 0

		FRIENDS.SetPlayerGridHeader(arg_12_0.MenuLayout, Engine.CBBHFCGDIC("LUA_MENU/PARTY_COUNT_WITH_ICON", var_18_0, var_18_1), nil, true)
	end

	arg_12_0:SubscribeToModel(var_12_7:GetModel(arg_12_1), var_12_9)
	arg_12_0:SubscribeToModel(var_12_8:GetModel(arg_12_1), var_12_9)
	arg_12_0:processEvent({
		name = "update_social_party"
	})
end

function SocialPartyMenu(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0.id = "SocialPartyMenu"

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("SocialMenuLayout", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "MenuLayout"

	var_19_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_19_0:addElement(var_19_4)

	var_19_0.MenuLayout = var_19_4

	var_0_9(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("SocialPartyMenu", SocialPartyMenu)
LockTable(_M)
