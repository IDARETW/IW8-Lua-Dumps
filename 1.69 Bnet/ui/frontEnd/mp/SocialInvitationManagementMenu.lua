module(..., package.seeall)

local var_0_0 = {
	RECEIVED = "SocialInvitationReceivedButtons",
	SENT = "SocialInvitationsSentButtons"
}
local var_0_1 = {
	FRIEND = "SocialFriendDetails",
	CLANS2 = "SocialClanDetails"
}

local function var_0_2(arg_1_0, arg_1_1)
	return
end

local function var_0_3(arg_2_0, arg_2_1)
	return
end

local function var_0_4(arg_3_0, arg_3_1)
	return
end

local function var_0_5(arg_4_0, arg_4_1)
	return
end

local function var_0_6(arg_5_0, arg_5_1)
	return
end

local function var_0_7(arg_6_0, arg_6_1)
	CLANS.AcceptClanInvite(arg_6_0._invitationData, arg_6_0._controllerIndex)
end

local function var_0_8(arg_7_0, arg_7_1)
	CLANS.DenyClanInvite(arg_7_0._invitationData, arg_7_0._controllerIndex)
end

local function var_0_9(arg_8_0, arg_8_1)
	CLANS.RevokeClanInvite(arg_8_0._invitationData, arg_8_0._controllerIndex)
end

local function var_0_10(arg_9_0, arg_9_1)
	CLANS.AcceptInviteRequest(arg_9_0._invitationData, arg_9_0._controllerIndex)
end

local function var_0_11(arg_10_0, arg_10_1)
	CLANS.DeclineClanInviteRequest(arg_10_0._invitationData, arg_10_0._controllerIndex)
end

local function var_0_12(arg_11_0, arg_11_1)
	CLANS.RevokeClanInviteRequest(arg_11_0._invitationData, arg_11_0._controllerIndex)
end

local function var_0_13(arg_12_0, arg_12_1)
	local var_12_0 = Friends.HCAFBJBHC(arg_12_0._controllerIndex, arg_12_0._invitationData.xuid)
	local var_12_1 = FRIENDS.UnifyPlayerDataFormat(var_12_0)
	local var_12_2 = {
		isRegiments = false,
		controllerIndex = arg_12_0._controllerIndex,
		xuid = var_12_1.xuid or arg_12_0._invitationData.xuid,
		fullName = var_12_1.fullName,
		selectedTab = FRIENDS.TabIDs.INVITATION_MANAGEMENT,
		platformId = var_12_1.platformId,
		presencePlatform = var_12_1.presencePlatform
	}
	local var_12_3 = MenuBuilder.BuildRegisteredType("SocialPlayerPopup", var_12_2)

	FRIENDS.AddFriendActions(var_12_2, FRIENDS.GetFriendActions(var_12_2), var_12_3.PlayerActions)
	LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_12_0._controllerIndex, false, {
		widget = var_12_3
	})
end

local function var_0_14(arg_13_0, arg_13_1)
	arg_13_1.leaveMenuOnActionComplete = true

	return arg_13_1
end

local function var_0_15(arg_14_0, arg_14_1)
	arg_14_1.leaveMenuOnActionComplete = true

	return arg_14_1
end

local function var_0_16(arg_15_0, arg_15_1)
	arg_15_1.leaveMenuOnActionComplete = true

	return arg_15_1
end

local function var_0_17(arg_16_0, arg_16_1)
	arg_16_1.leaveMenuOnActionComplete = false

	return arg_16_1
end

local function var_0_18(arg_17_0, arg_17_1)
	local var_17_0 = {
		controllerIndex = arg_17_0._controllerIndex
	}

	if arg_17_1 == FRIENDS.INVITATIONS.BUTTONS.ACCEPT then
		return var_0_14(arg_17_0, var_17_0)
	elseif arg_17_1 == FRIENDS.INVITATIONS.BUTTONS.DENY then
		return var_0_15(arg_17_0, var_17_0)
	elseif arg_17_1 == FRIENDS.INVITATIONS.BUTTONS.REVOKE then
		return var_0_16(arg_17_0, var_17_0)
	elseif arg_17_1 == FRIENDS.INVITATIONS.BUTTONS.INSPECT then
		return var_0_17(arg_17_0, var_17_0)
	end

	return var_17_0
end

local function var_0_19(arg_18_0, arg_18_1)
	local var_18_0
	local var_18_1 = arg_18_0.MenuData[arg_18_0._id]

	if arg_18_1 == FRIENDS.INVITATIONS.BUTTONS.ACCEPT then
		var_18_0 = var_18_1.AcceptAction
	elseif arg_18_1 == FRIENDS.INVITATIONS.BUTTONS.DENY then
		var_18_0 = var_18_1.DenyAction
	elseif arg_18_1 == FRIENDS.INVITATIONS.BUTTONS.REVOKE then
		var_18_0 = var_18_1.RevokeAction
	elseif arg_18_1 == FRIENDS.INVITATIONS.BUTTONS.INSPECT then
		var_18_0 = var_18_1.InspectAction
	end

	if var_18_0 then
		local var_18_2 = var_0_18(arg_18_0, arg_18_1)

		var_18_0(arg_18_0, var_18_2)

		if var_18_2.leaveMenuOnActionComplete then
			ACTIONS.LeaveMenu(arg_18_0)
		end
	end
end

local function var_0_20(arg_19_0, arg_19_1)
	if arg_19_0.MenuData[arg_19_0._id].SocialDetailsWidget == var_0_1.CLANS2 then
		arg_19_0._clanData = arg_19_1.clanData

		arg_19_0.SocialDetails:RefreshClanData(arg_19_0._clanData)
	end
end

local function var_0_21(arg_20_0)
	local var_20_0 = arg_20_0._invitationData.clanId
	local var_20_1 = arg_20_0._invitationData.inviterXuid

	arg_20_0.ClanDataFetcher:FetchExternalClanData(var_20_0, var_20_1)
end

local function var_0_22(arg_21_0)
	local var_21_0 = arg_21_0.MenuData[arg_21_0._id].MenuTitle

	if var_21_0 == nil then
		var_21_0 = "INBOX/DEFAULT_INVITATION_MENU_TITLE"
	end

	arg_21_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC(var_21_0), false)
end

local function var_0_23(arg_22_0)
	local var_22_0 = arg_22_0.MenuData[arg_22_0._id].Description

	arg_22_0.SocialInvitationDetails:SetupInvitationDetails(arg_22_0._invitationData, var_22_0)
end

local function var_0_24(arg_23_0)
	local var_23_0 = arg_23_0.MenuData[arg_23_0._id].MenuButtonsWidget

	arg_23_0.SocialInvitationButtonsContainer:SetupInvitationButtons(var_23_0)
end

local function var_0_25(arg_24_0)
	local var_24_0
	local var_24_1 = MenuBuilder.BuildRegisteredType("ClanDataFetcher", {
		useTimer = true,
		controllerIndex = arg_24_0._controllerIndex
	})

	var_24_1.id = "ClanDataFetcher"

	arg_24_0:addElement(var_24_1)

	arg_24_0.ClanDataFetcher = var_24_1
end

local function var_0_26(arg_25_0)
	local var_25_0 = Friends.GetFriendDataForXUIDA(arg_25_0._invitationData.xuid)
	local var_25_1 = FRIENDS.UnifyPlayerDataFormat(var_25_0)

	if var_25_1 then
		arg_25_0.SocialDetails:SetupPlayerDetails(var_25_1, FRIENDS.TabIDs.INVITATION_MANAGEMENT)
	end
end

local function var_0_27(arg_26_0, arg_26_1, arg_26_2)
	if arg_26_1 == var_0_1.CLANS2 then
		arg_26_2:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1066, _1080p * -240, _1080p * 254, _1080p * 864)
	elseif arg_26_1 == var_0_1.FRIEND then
		arg_26_2:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -913, _1080p * -393, _1080p * 254, _1080p * 918)
	end
end

local function var_0_28(arg_27_0)
	local var_27_0
	local var_27_1 = arg_27_0.MenuData[arg_27_0._id].SocialDetailsWidget
	local var_27_2 = MenuBuilder.BuildRegisteredType(var_27_1, {
		controllerIndex = arg_27_0._controllerIndex
	})

	var_27_2.id = "SocialDetails"

	var_0_27(arg_27_0, var_27_1, var_27_2)
	arg_27_0:addElement(var_27_2)

	arg_27_0.SocialDetails = var_27_2

	if var_27_1 == var_0_1.CLANS2 then
		var_0_25(arg_27_0)
		var_0_21(arg_27_0)
	elseif var_27_1 == var_0_1.FRIEND then
		var_0_26(arg_27_0)
	end
end

local function var_0_29(arg_28_0)
	arg_28_0.HelperBar:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_28_0.HelperBar:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("MENU/SELECT")
	})
end

local function var_0_30(arg_29_0)
	local var_29_0 = LUI.UIBindButton.new()

	var_29_0.id = "BindButton"

	arg_29_0:addElement(var_29_0)

	arg_29_0.BindButton = var_29_0
end

local function var_0_31(arg_30_0)
	arg_30_0.BindButton:addEventHandler("button_secondary", function(arg_31_0, arg_31_1)
		ACTIONS.LeaveMenu(arg_30_0)
	end)

	local var_30_0 = arg_30_0.SocialInvitationButtonsContainer:GetInvitationButtons()

	for iter_30_0, iter_30_1 in pairs(var_30_0) do
		iter_30_1:addEventHandler("button_action", function(arg_32_0, arg_32_1)
			var_0_19(arg_30_0, iter_30_0)
		end)
	end

	if arg_30_0._id == FRIENDS.INVITATIONS.ID.CLANS2_INVITE_RECEIVED or arg_30_0._id == FRIENDS.INVITATIONS.ID.CLANS2_REQUEST_SENT then
		arg_30_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_EXTERNAL_DATA_RESOLVED, function(arg_33_0, arg_33_1)
			var_0_20(arg_30_0, arg_33_1)
		end)
	end
end

local function var_0_32(arg_34_0)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_34_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_34_0, arg_34_0._controllerIndex, {
		addScreenDarkener = true,
		addWorldBlur = true
	})
end

local function var_0_33(arg_35_0)
	arg_35_0.MenuData = {
		[FRIENDS.INVITATIONS.ID.PARTY_INVITE_RECEIVED] = {
			Description = "INBOX/PARTY_INVITE_RECEIVED_DESC",
			MenuTitle = "INBOX/PARTY_INVITE_RECEIVED_MENU_TITLE",
			MenuButtonsWidget = var_0_0.RECEIVED,
			SocialDetailsWidget = var_0_1.FRIEND,
			AcceptAction = var_0_2,
			DenyAction = var_0_3,
			InspectAction = var_0_13
		},
		[FRIENDS.INVITATIONS.ID.FRIEND_INVITE_RECEIVED] = {
			Description = "INBOX/FRIEND_INVITE_RECEIVED_DESC",
			MenuTitle = "INBOX/FRIEND_INVITE_RECEIVED_MENU_TITLE",
			MenuButtonsWidget = var_0_0.RECEIVED,
			SocialDetailsWidget = var_0_1.FRIEND,
			AcceptAction = var_0_4,
			DenyAction = var_0_5,
			InspectAction = var_0_13
		},
		[FRIENDS.INVITATIONS.ID.FRIEND_INVITE_SENT] = {
			Description = "INBOX/FRIEND_INVITE_SENT_DESC",
			MenuTitle = "INBOX/FRIEND_INVITE_SENT_MENU_TITLE",
			MenuButtonsWidget = var_0_0.SENT,
			SocialDetailsWidget = var_0_1.FRIEND,
			RevokeAction = var_0_6,
			InspectAction = var_0_13
		},
		[FRIENDS.INVITATIONS.ID.CLANS2_INVITE_RECEIVED] = {
			Description = "INBOX/CLANS2_INVITE_RECEIVED_DESC",
			MenuTitle = "INBOX/CLANS2_INVITE_RECEIVED_MENU_TITLE",
			MenuButtonsWidget = var_0_0.RECEIVED,
			SocialDetailsWidget = var_0_1.CLANS2,
			AcceptAction = var_0_7,
			DenyAction = var_0_8,
			InspectAction = var_0_13
		},
		[FRIENDS.INVITATIONS.ID.CLANS2_INVITE_SENT] = {
			Description = "INBOX/CLANS2_INVITE_SENT_DESC",
			MenuTitle = "INBOX/CLANS2_INVITE_SENT_MENU_TITLE",
			MenuButtonsWidget = var_0_0.SENT,
			SocialDetailsWidget = var_0_1.FRIEND,
			RevokeAction = var_0_9,
			InspectAction = var_0_13
		},
		[FRIENDS.INVITATIONS.ID.CLANS2_REQUEST_RECEIVED] = {
			Description = "INBOX/CLANS2_REQUEST_RECEIVED_DESC",
			MenuTitle = "INBOX/CLANS2_REQUEST_RECEIVED_MENU_TITLE",
			MenuButtonsWidget = var_0_0.RECEIVED,
			SocialDetailsWidget = var_0_1.FRIEND,
			AcceptAction = var_0_10,
			DenyAction = var_0_11,
			InspectAction = var_0_13
		},
		[FRIENDS.INVITATIONS.ID.CLANS2_REQUEST_SENT] = {
			Description = "INBOX/CLANS2_REQUEST_SENT_DESC",
			MenuTitle = "INBOX/CLANS2_REQUEST_SENT_MENU_TITLE",
			MenuButtonsWidget = var_0_0.SENT,
			SocialDetailsWidget = var_0_1.CLANS2,
			RevokeAction = var_0_12
		}
	}
end

local function var_0_34(arg_36_0, arg_36_1, arg_36_2)
	arg_36_0._controllerIndex = arg_36_1
	arg_36_0._invitationData = arg_36_2.invitationData
	arg_36_0._id = arg_36_0._invitationData and arg_36_0._invitationData.invitationId or nil

	assert(arg_36_0._invitationData, "Invalid invitation data!")
	var_0_33(arg_36_0)
	var_0_22(arg_36_0)
	var_0_29(arg_36_0)
	var_0_23(arg_36_0)
	var_0_24(arg_36_0)
	var_0_30(arg_36_0)
	var_0_31(arg_36_0)
	var_0_28(arg_36_0)
	var_0_32(arg_36_0)
end

function SocialInvitationManagementMenu(arg_37_0, arg_37_1)
	local var_37_0 = LUI.UIElement.new()

	var_37_0.id = "SocialInvitationManagementMenu"

	local var_37_1 = arg_37_1 and arg_37_1.controllerIndex

	if not var_37_1 and not Engine.DDJFBBJAIG() then
		var_37_1 = var_37_0:getRootController()
	end

	assert(var_37_1)

	var_37_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_37_1
	})
	var_37_0.HelperBar.id = "HelperBar"

	var_37_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_37_0.HelperBar:setPriority(10)
	var_37_0:addElement(var_37_0.HelperBar)

	local var_37_2 = var_37_0
	local var_37_3
	local var_37_4 = LUI.UIImage.new()

	var_37_4.id = "BackgroundImage"

	var_37_4:setImage(RegisterMaterial("frontend_option_bg"), 0)
	var_37_0:addElement(var_37_4)

	var_37_0.BackgroundImage = var_37_4

	local var_37_5
	local var_37_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_37_1
	})

	var_37_6.id = "TabBacker"

	var_37_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_37_0:addElement(var_37_6)

	var_37_0.TabBacker = var_37_6

	local var_37_7
	local var_37_8 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_37_1
	})

	var_37_8.id = "PlayerDetailsMP"

	var_37_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
	var_37_0:addElement(var_37_8)

	var_37_0.PlayerDetailsMP = var_37_8

	local var_37_9
	local var_37_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_37_1
	})

	var_37_10.id = "MenuTitle"

	var_37_10.MenuTitle:setText("PRIMARY WEAPON SELECT", 0)
	var_37_10.Line:SetLeft(0, 0)
	var_37_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_37_0:addElement(var_37_10)

	var_37_0.MenuTitle = var_37_10

	local var_37_11
	local var_37_12 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_37_1
	})

	var_37_12.id = "LobbyMembersFooter"

	var_37_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_37_0:addElement(var_37_12)

	var_37_0.LobbyMembersFooter = var_37_12

	local var_37_13
	local var_37_14 = MenuBuilder.BuildRegisteredType("SocialInvitationDetails", {
		controllerIndex = var_37_1
	})

	var_37_14.id = "SocialInvitationDetails"

	var_37_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 240, _1080p * 700, _1080p * 254, _1080p * 614)
	var_37_0:addElement(var_37_14)

	var_37_0.SocialInvitationDetails = var_37_14

	local var_37_15
	local var_37_16 = MenuBuilder.BuildRegisteredType("SocialInvitationButtonsContainer", {
		controllerIndex = var_37_1
	})

	var_37_16.id = "SocialInvitationButtonsContainer"

	var_37_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 240, _1080p * 700, _1080p * 614, _1080p * 832)
	var_37_0:addElement(var_37_16)

	var_37_0.SocialInvitationButtonsContainer = var_37_16

	var_0_34(var_37_0, var_37_1, arg_37_1)

	return var_37_0
end

MenuBuilder.registerType("SocialInvitationManagementMenu", SocialInvitationManagementMenu)
LockTable(_M)
