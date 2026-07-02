module(..., package.seeall)

local function var_0_0(arg_1_0)
	ACTIONS.LeaveMenu(arg_1_0)
	LUI.FlowManager.RequestAddMenu("CreateClanP_1", true, arg_1_0._controllerIndex, false, nil, false)
end

local function var_0_1(arg_2_0)
	if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_2_0._controllerIndex) then
		arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	else
		arg_2_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_primary"
		})
	end
end

local function var_0_2(arg_3_0)
	local var_3_0 = LUI.UIBindButton.new()

	var_3_0.id = "selfBindButton"

	arg_3_0:addElement(var_3_0)

	arg_3_0._bindButton = var_3_0

	arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_3_0._bindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		var_0_0(arg_3_0)
	end)
	arg_3_0:addAndCallEventHandler("update_input_type", arg_3_0.UpdateInputType, {
		controllerIndex = arg_3_0._controllerIndex
	})
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0.UpdateInputType = var_0_1

	local var_5_0 = arg_5_2.clanName or "Invalid Name"
	local var_5_1 = arg_5_2.clanTag or "INVT"

	arg_5_0.ClanTagAndName:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(var_5_1), Engine.JCBDICCAH(var_5_0)))
	arg_5_0.MemberCountLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", "01", "100"))

	local var_5_2 = PROGRESSION.GetPlayerProgressionData({
		_controllerIndex = arg_5_1
	})
	local var_5_3 = {
		_rank = var_5_2._rankDisplay,
		_rankIcon = var_5_2._rankIcon,
		_gamerTag = Engine.BAGAFBABEE(arg_5_1),
		_clanTag = var_5_1,
		_prestigeMasterColor = var_5_2._prestigeMasterColor
	}

	arg_5_0.ClanGamerTag:SetupPlayerData(var_5_3)
	arg_5_0.ClanEmblemWidget:SetEmblem({
		foregroundShapeId = 0,
		foregroundColorId = 0,
		backgroundColorId = 0,
		backgroundShapeId = 0
	}, true)
	arg_5_0.CreateClanButton:registerEventHandler("button_action", function(arg_6_0, arg_6_1)
		if Clans2.DGAGIABGFJ(arg_5_1, var_5_0, var_5_1) then
			ACTIONS.LeaveMenu(arg_5_0)
		else
			CLANS.DispatchClanNotification(arg_5_0, Engine.CBBHFCGDIC("CLANS/FAILED_TO_CREATE_CLAN"), Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(var_5_1), Engine.JCBDICCAH(var_5_0)))
		end
	end)
	ACTIONS.AnimateSequence(arg_5_0.CreateClanButton, "CenterText")
	arg_5_0.CancelButton:registerEventHandler("button_action", function(arg_7_0, arg_7_1)
		var_0_0(arg_5_0)
	end)
	ACTIONS.AnimateSequence(arg_5_0.CancelButton, "CenterText")
	var_0_2(arg_5_0)
	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CLANS/CREATE_A_CLAN"))
	ACTIONS.ScaleStretchAnchorFullscreen(arg_5_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_5_0, arg_5_1, {
		addScreenDarkener = true,
		addWorldBlur = true
	})
end

function CreateClanP_2(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0.id = "CreateClanP_2"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	var_8_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})
	var_8_0.HelperBar.id = "HelperBar"

	var_8_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_8_0.HelperBar:setPriority(10)
	var_8_0:addElement(var_8_0.HelperBar)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIText.new()

	var_8_4.id = "ClanInfo"

	var_8_4:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_INFO_1")), 0)
	var_8_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_4:SetAlignment(LUI.Alignment.Center)
	var_8_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 700, _1080p * 281, _1080p * 329)
	var_8_0:addElement(var_8_4)

	var_8_0.ClanInfo = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIText.new()

	var_8_6.id = "ClanTagAndName"

	var_8_6:setText("", 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_6:SetAlignment(LUI.Alignment.Left)
	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * 490, _1080p * 459, _1080p * 509)
	var_8_0:addElement(var_8_6)

	var_8_0.ClanTagAndName = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIText.new()

	var_8_8.id = "ClanLeaderHeader"

	var_8_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_LEADER_HEADER")), 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_8:SetAlignment(LUI.Alignment.Left)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, 0, _1080p * 540, _1080p * 576)
	var_8_0:addElement(var_8_8)

	var_8_0.ClanLeaderHeader = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "ClanMembers"

	var_8_10:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_MEMBERS_COLON")), 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * -88, _1080p * 592, _1080p * 628)
	var_8_0:addElement(var_8_10)

	var_8_0.ClanMembers = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIText.new()

	var_8_12.id = "MemberCountLabel"

	var_8_12:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y"), 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetAlignment(LUI.Alignment.Left)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -88, _1080p * 49, _1080p * 592, _1080p * 628)
	var_8_0:addElement(var_8_12)

	var_8_0.MemberCountLabel = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIText.new()

	var_8_14.id = "ClanPrivacy"

	var_8_14:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY")), 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_14:SetAlignment(LUI.Alignment.Left)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 62, _1080p * 296, _1080p * 592, _1080p * 628)
	var_8_0:addElement(var_8_14)

	var_8_0.ClanPrivacy = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIText.new()

	var_8_16.id = "ClanPrivacyStatus"

	var_8_16:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_PRIVACY_OPEN")), 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_16:SetAlignment(LUI.Alignment.Left)
	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 283, _1080p * 758, _1080p * 592, _1080p * 628)
	var_8_0:addElement(var_8_16)

	var_8_0.ClanPrivacyStatus = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("ClanGamerTagWidget", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "ClanGamerTag"

	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -55, _1080p * 490, _1080p * 538, _1080p * 578)
	var_8_0:addElement(var_8_18)

	var_8_0.ClanGamerTag = var_8_18

	local var_8_19
	local var_8_20 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_8_1
	})

	var_8_20.id = "CreateClanButton"

	var_8_20.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CREATE_CLAN")), 0)
	var_8_20.Description:setText(ToUpperCase(""), 0)
	var_8_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -182, _1080p * 218, _1080p * 684, _1080p * 724)
	var_8_0:addElement(var_8_20)

	var_8_0.CreateClanButton = var_8_20

	local var_8_21
	local var_8_22 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_8_1
	})

	var_8_22.id = "CancelButton"

	var_8_22.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CANCEL")), 0)
	var_8_22.Description:setText(ToUpperCase(""), 0)
	var_8_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -182, _1080p * 218, _1080p * 738, _1080p * 778)
	var_8_0:addElement(var_8_22)

	var_8_0.CancelButton = var_8_22

	local var_8_23
	local var_8_24 = MenuBuilder.BuildRegisteredType("ClanEmblemWidget", {
		controllerIndex = var_8_1
	})

	var_8_24.id = "ClanEmblemWidget"

	var_8_24:SetScale(0.2, 0)
	var_8_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 533, _1080p * 661, _1080p * 494, _1080p * 622)
	var_8_0:addElement(var_8_24)

	var_8_0.ClanEmblemWidget = var_8_24

	local var_8_25
	local var_8_26 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_8_1
	})

	var_8_26.id = "TabBacker"

	var_8_26:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_8_0:addElement(var_8_26)

	var_8_0.TabBacker = var_8_26

	local var_8_27
	local var_8_28 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_8_1
	})

	var_8_28.id = "MenuTitle"

	var_8_28.MenuTitle:setText("PRIMARY WEAPON SELECT", 0)
	var_8_28.Line:SetLeft(0, 0)
	var_8_28:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_8_0:addElement(var_8_28)

	var_8_0.MenuTitle = var_8_28

	local var_8_29

	if CONDITIONS.InFrontend() then
		local var_8_30 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_8_1
		})

		var_8_30.id = "LobbyMembersFooter"

		var_8_30:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_8_0:addElement(var_8_30)

		var_8_0.LobbyMembersFooter = var_8_30
	end

	local var_8_31

	if CONDITIONS.IsUserSignedInDemonware(var_8_1) then
		local var_8_32 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_8_1
		})

		var_8_32.id = "MPPlayerDetails"

		var_8_32:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_8_0:addElement(var_8_32)

		var_8_0.MPPlayerDetails = var_8_32
	end

	var_0_3(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("CreateClanP_2", CreateClanP_2)
LockTable(_M)
