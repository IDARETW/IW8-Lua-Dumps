module(..., package.seeall)

local var_0_0 = 1

local function var_0_1(arg_1_0, arg_1_1)
	if arg_1_1 == CLANS.CLAN_PRIVACY_LEVEL.OPEN then
		return arg_1_0.ClanPrivacyOpen
	elseif arg_1_1 == CLANS.CLAN_PRIVACY_LEVEL.BY_REQUEST then
		return arg_1_0.ClanPrivacyRequest
	elseif arg_1_1 == CLANS.CLAN_PRIVACY_LEVEL.INVITE_ONLY then
		return arg_1_0.ClanPrivacyInvite
	end

	return nil
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._buttonStatus[arg_2_1] = {
		selected = arg_2_2
	}

	var_0_1(arg_2_0, arg_2_1).Selected:SetEquipped(arg_2_2)
end

local function var_0_3(arg_3_0, arg_3_1)
	local var_3_0 = Clans2.CDBCCIECGG(arg_3_0._controllerIndex, arg_3_0._clanId, arg_3_1)

	if var_3_0 then
		CLANS.DispatchClanNotification(arg_3_0, Engine.CBBHFCGDIC("CLANS/CLAN_PRIVACY_UPDATED"), Engine.CBBHFCGDIC(CLANS.CLAN_PRIVACY_LEVEL_STRINGS[arg_3_1]))
	else
		CLANS.DispatchClanNotification(arg_3_0, Engine.CBBHFCGDIC("CLANS/FAILED_TO_UPDATE_CLAN_PRVACY"), Engine.CBBHFCGDIC(CLANS.CLAN_PRIVACY_LEVEL_STRINGS[arg_3_1]))
	end

	return var_3_0
end

local function var_0_4(arg_4_0)
	local var_4_0 = arg_4_0._selectedPrivacy
	local var_4_1 = CLANS.CLAN_PRIVACY_LEVEL_STRINGS[var_4_0]

	arg_4_0.CurrentPrivacy:setText(Engine.CBBHFCGDIC(var_4_1))

	for iter_4_0, iter_4_1 in pairs(CLANS.CLAN_PRIVACY_LEVEL) do
		if iter_4_1 ~= CLANS.CLAN_PRIVACY_LEVEL.INVALID then
			var_0_2(arg_4_0, iter_4_1, iter_4_1 == var_4_0 and true or false)
		end
	end
end

local function var_0_5(arg_5_0)
	arg_5_0.ClanPrivacyOpen:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		if var_0_3(arg_5_0, CLANS.CLAN_PRIVACY_LEVEL.OPEN) then
			arg_5_0._selectedPrivacy = CLANS.CLAN_PRIVACY_LEVEL.OPEN
		end

		var_0_4(arg_5_0)
	end)
	arg_5_0.ClanPrivacyRequest:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		if var_0_3(arg_5_0, CLANS.CLAN_PRIVACY_LEVEL.BY_REQUEST) then
			arg_5_0._selectedPrivacy = CLANS.CLAN_PRIVACY_LEVEL.BY_REQUEST
		end

		var_0_4(arg_5_0)
	end)
	arg_5_0.ClanPrivacyInvite:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		if var_0_3(arg_5_0, CLANS.CLAN_PRIVACY_LEVEL.INVITE_ONLY) then
			arg_5_0._selectedPrivacy = CLANS.CLAN_PRIVACY_LEVEL.INVITE_ONLY
		end

		var_0_4(arg_5_0)
	end)
end

local function var_0_6(arg_9_0)
	if LUI.IsLastInputGamepad(arg_9_0._controllerIndex) then
		arg_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	else
		arg_9_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_primary"
		})
	end
end

local function var_0_7(arg_10_0)
	local var_10_0 = LUI.UIBindButton.new()

	var_10_0.id = "selfBindButton"

	arg_10_0:addElement(var_10_0)

	arg_10_0._bindButton = var_10_0

	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_10_0._bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
		ACTIONS.LeaveMenu(arg_10_0)
	end)
	arg_10_0:addAndCallEventHandler("update_input_type", arg_10_0.UpdateInputType, {
		controllerIndex = arg_10_0._controllerIndex
	})
end

local function var_0_8(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_2.clanPrivacy and arg_12_2.clanId)

	arg_12_0.UpdateInputType = var_0_6
	arg_12_0._controllerIndex = arg_12_1
	arg_12_0._clanId = arg_12_2.clanId
	arg_12_0._selectedPrivacy = arg_12_2.clanPrivacy
	arg_12_0._buttonStatus = {
		{
			selected = false
		},
		{
			selected = false
		},
		{
			selected = false
		}
	}

	arg_12_0.PrivacySelectionDesc:setText(Engine.CBBHFCGDIC("CLANS/CLANS_SELECT", Engine.JCBDICCAH(tostring(var_0_0))))
	var_0_7(arg_12_0)
	var_0_4(arg_12_0)
	var_0_5(arg_12_0)
	arg_12_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CLANS/CLAN_PRIVACY"))
	ACTIONS.ScaleStretchAnchorFullscreen(arg_12_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_12_0, arg_12_1, {
		addScreenDarkener = true,
		addWorldBlur = true
	})
end

function ClanEditPrivacyMenu(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIVerticalNavigator.new()

	var_13_0.id = "ClanEditPrivacyMenu"

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	var_13_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_13_1
	})
	var_13_0.HelperBar.id = "HelperBar"

	var_13_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_13_0.HelperBar:setPriority(10)
	var_13_0:addElement(var_13_0.HelperBar)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIText.new()

	var_13_4.id = "PrivacySelectionDesc"

	var_13_4:setText(Engine.CBBHFCGDIC("CLANS/CLANS_SELECT"), 0)
	var_13_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_4:SetAlignment(LUI.Alignment.Left)
	var_13_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -754, _1080p * -130, _1080p * 228, _1080p * 264)
	var_13_0:addElement(var_13_4)

	var_13_0.PrivacySelectionDesc = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIText.new()

	var_13_6.id = "CurrentPrivacyHeader"

	var_13_6:setText(Engine.CBBHFCGDIC("CLANS/CURRENT_CLAN_PRIVACY"), 0)
	var_13_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_13_6:SetAlignment(LUI.Alignment.Left)
	var_13_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 923, _1080p * 1423, _1080p * 739, _1080p * 769)
	var_13_0:addElement(var_13_6)

	var_13_0.CurrentPrivacyHeader = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIText.new()

	var_13_8.id = "CurrentPrivacy"

	var_13_8:setText("", 0)
	var_13_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_8:SetAlignment(LUI.Alignment.Left)
	var_13_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 923, _1080p * 1790, _1080p * 788, _1080p * 818)
	var_13_0:addElement(var_13_8)

	var_13_0.CurrentPrivacy = var_13_8

	local var_13_9
	local var_13_10 = MenuBuilder.BuildRegisteredType("ClanPrivacyDescWidget", {
		controllerIndex = var_13_1
	})

	var_13_10.id = "ClanPrivacyDesc"

	var_13_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 923, _1080p * 1824, _1080p * 246, _1080p * 672)
	var_13_0:addElement(var_13_10)

	var_13_0.ClanPrivacyDesc = var_13_10

	local var_13_11
	local var_13_12 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_13_1
	})

	var_13_12.id = "ClanPrivacyOpen"

	var_13_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_OPEN")), 0)
	var_13_12.Text:SetAlignment(LUI.Alignment.Left)
	var_13_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 752, _1080p * 301, _1080p * 363)
	var_13_0:addElement(var_13_12)

	var_13_0.ClanPrivacyOpen = var_13_12

	local var_13_13
	local var_13_14 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_13_1
	})

	var_13_14.id = "ClanPrivacyRequest"

	var_13_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_REQUEST_TO_JOIN")), 0)
	var_13_14.Text:SetAlignment(LUI.Alignment.Left)
	var_13_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 752, _1080p * 380, _1080p * 442)
	var_13_0:addElement(var_13_14)

	var_13_0.ClanPrivacyRequest = var_13_14

	local var_13_15
	local var_13_16 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_13_1
	})

	var_13_16.id = "ClanPrivacyInvite"

	var_13_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_INVITE_ONLY")), 0)
	var_13_16.Text:SetAlignment(LUI.Alignment.Left)
	var_13_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 752, _1080p * 459, _1080p * 521)
	var_13_0:addElement(var_13_16)

	var_13_0.ClanPrivacyInvite = var_13_16

	local var_13_17
	local var_13_18 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_13_1
	})

	var_13_18.id = "TabBacker"

	var_13_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_13_0:addElement(var_13_18)

	var_13_0.TabBacker = var_13_18

	local var_13_19
	local var_13_20 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_13_1
	})

	var_13_20.id = "MenuTitle"

	var_13_20.MenuTitle:setText(ToUpperCase(""), 0)
	var_13_20.Line:SetLeft(0, 0)
	var_13_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_13_0:addElement(var_13_20)

	var_13_0.MenuTitle = var_13_20

	local var_13_21

	if CONDITIONS.InFrontend() then
		local var_13_22 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_13_1
		})

		var_13_22.id = "LobbyMembersFooter"

		var_13_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_13_0:addElement(var_13_22)

		var_13_0.LobbyMembersFooter = var_13_22
	end

	local var_13_23

	if CONDITIONS.IsUserSignedInDemonware(var_13_1) then
		local var_13_24 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_13_1
		})

		var_13_24.id = "PlayerDetailsMP"

		var_13_24:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_13_0:addElement(var_13_24)

		var_13_0.PlayerDetailsMP = var_13_24
	end

	var_0_8(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("ClanEditPrivacyMenu", ClanEditPrivacyMenu)
LockTable(_M)
