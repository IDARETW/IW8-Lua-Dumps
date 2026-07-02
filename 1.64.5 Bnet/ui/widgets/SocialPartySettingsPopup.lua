module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.areWeHost)
	assert(arg_1_0.MenuTitle)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/PARTY_SETTINGS"))

	arg_1_0._currentSetting = Lobby.BCBBBABFFB()

	if arg_1_0._currentSetting == CoD.PartyPrivacySetting.CLOSED then
		arg_1_0.Buttons.ClosedButton:SetValue(true)
		arg_1_0.Buttons.InviteOnlyButton:SetValue(false)
		arg_1_0.Buttons.FriendsOnlyButton:SetValue(false)
		arg_1_0.Buttons.PublicButton:SetValue(false)
	elseif arg_1_0._currentSetting == CoD.PartyPrivacySetting.INVITE_ONLY then
		arg_1_0.Buttons.ClosedButton:SetValue(false)
		arg_1_0.Buttons.InviteOnlyButton:SetValue(true)
		arg_1_0.Buttons.FriendsOnlyButton:SetValue(false)
		arg_1_0.Buttons.PublicButton:SetValue(false)
	elseif arg_1_0._currentSetting == CoD.PartyPrivacySetting.JOINABLE_BY_FRIENDS then
		arg_1_0.Buttons.ClosedButton:SetValue(false)
		arg_1_0.Buttons.InviteOnlyButton:SetValue(false)
		arg_1_0.Buttons.FriendsOnlyButton:SetValue(true)
		arg_1_0.Buttons.PublicButton:SetValue(false)
	else
		arg_1_0.Buttons.ClosedButton:SetValue(false)
		arg_1_0.Buttons.InviteOnlyButton:SetValue(false)
		arg_1_0.Buttons.FriendsOnlyButton:SetValue(false)
		arg_1_0.Buttons.PublicButton:SetValue(true)
	end

	arg_1_0.Buttons.PublicButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if arg_1_0._currentSetting ~= CoD.PartyPrivacySetting.PUBLIC then
			Lobby.DDEDGGBHJ(arg_2_1.controller, CoD.PartyPrivacySetting.PUBLIC)
			ACTIONS.PlaySoundSetSound(arg_1_0, "selectAlt", false)
			arg_1_0.Buttons.ClosedButton:SetValue(false)
			arg_1_0.Buttons.InviteOnlyButton:SetValue(false)
			arg_1_0.Buttons.FriendsOnlyButton:SetValue(false)
			arg_1_0.Buttons.PublicButton:SetValue(true)

			arg_1_0._currentSetting = CoD.PartyPrivacySetting.Public
		end
	end)
	arg_1_0.Buttons.InviteOnlyButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if arg_1_0._currentSetting ~= CoD.PartyPrivacySetting.INVITE_ONLY then
			Lobby.DDEDGGBHJ(arg_3_1.controller, CoD.PartyPrivacySetting.INVITE_ONLY)
			ACTIONS.PlaySoundSetSound(arg_1_0, "selectAlt", false)
			arg_1_0.Buttons.ClosedButton:SetValue(false)
			arg_1_0.Buttons.InviteOnlyButton:SetValue(true)
			arg_1_0.Buttons.FriendsOnlyButton:SetValue(false)
			arg_1_0.Buttons.PublicButton:SetValue(false)

			arg_1_0._currentSetting = CoD.PartyPrivacySetting.INVITE_ONLY
		end
	end)
	arg_1_0.Buttons.FriendsOnlyButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		if arg_1_0._currentSetting ~= CoD.PartyPrivacySetting.JOINABLE_BY_FRIENDS then
			Lobby.DDEDGGBHJ(arg_4_1.controller, CoD.PartyPrivacySetting.JOINABLE_BY_FRIENDS)
			ACTIONS.PlaySoundSetSound(arg_1_0, "selectAlt", false)
			arg_1_0.Buttons.ClosedButton:SetValue(false)
			arg_1_0.Buttons.InviteOnlyButton:SetValue(false)
			arg_1_0.Buttons.FriendsOnlyButton:SetValue(true)
			arg_1_0.Buttons.PublicButton:SetValue(false)

			arg_1_0._currentSetting = CoD.PartyPrivacySetting.JOINABLE_BY_FRIENDS
		end
	end)
	arg_1_0.Buttons.ClosedButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		if arg_1_0._currentSetting ~= CoD.PartyPrivacySetting.CLOSED then
			Lobby.DDEDGGBHJ(arg_5_1.controller, CoD.PartyPrivacySetting.CLOSED)
			ACTIONS.PlaySoundSetSound(arg_1_0, "selectAlt", false)
			arg_1_0.Buttons.ClosedButton:SetValue(true)
			arg_1_0.Buttons.InviteOnlyButton:SetValue(false)
			arg_1_0.Buttons.FriendsOnlyButton:SetValue(false)
			arg_1_0.Buttons.PublicButton:SetValue(false)

			arg_1_0._currentSetting = CoD.PartyPrivacySetting.Closed
		end
	end)

	if CONDITIONS.InGame(arg_1_0) then
		if CONDITIONS.IsPublicMatch(arg_1_0) then
			arg_1_0.Buttons.PublicButton:SetButtonDisabled(true)
			arg_1_0.Buttons.InviteOnlyButton:SetButtonDisabled(true)
			arg_1_0.Buttons.FriendsOnlyButton:SetButtonDisabled(true)
			arg_1_0.Buttons.ClosedButton:SetButtonDisabled(true)
		end
	elseif LUI.FlowManager.IsInStack("MPPublicLobby") then
		arg_1_0.Buttons.PublicButton:SetButtonDisabled(true)
		arg_1_0.Buttons.InviteOnlyButton:SetButtonDisabled(true)
		arg_1_0.Buttons.FriendsOnlyButton:SetButtonDisabled(true)
		arg_1_0.Buttons.ClosedButton:SetButtonDisabled(true)
	end
end

function SocialPartySettingsPopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIVerticalNavigator.new()

	var_6_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_6_0.id = "SocialPartySettingsPopup"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("SocialPartySettingsPopupButtons", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "Buttons"

	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 561)
	var_6_0:addElement(var_6_4)

	var_6_0.Buttons = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "MenuTitle"

	var_6_6.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PARTY_SETTINGS")), 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_6_0:addElement(var_6_6)

	var_6_0.MenuTitle = var_6_6

	local var_6_7 = LUI.UIBindButton.new()

	var_6_7.id = "selfBindButton"

	var_6_0:addElement(var_6_7)

	var_6_0.bindButton = var_6_7

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_6_1
		end

		if CONDITIONS.IsGamepadEnabled(var_6_0) then
			ACTIONS.LeaveMenu(var_6_0)
		end
	end)
	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("SocialPartySettingsPopup", SocialPartySettingsPopup)
LockTable(_M)
