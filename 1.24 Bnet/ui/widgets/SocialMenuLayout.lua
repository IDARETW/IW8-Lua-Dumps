module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2 and arg_1_2.xuid

	ACTIONS.AnimateSequence(arg_1_0, var_1_0 and "ShowDetails" or "HideDetails")
	arg_1_0.PlayerDetails:SetupPlayerDetails(arg_1_2)

	arg_1_0.PlayerDetails.detailsOwner = arg_1_1

	local var_1_1 = arg_1_0._controllerIndex
	local var_1_2 = arg_1_0._tabID

	if var_1_2 == FRIENDS.TabIDs.FRIENDS or var_1_2 == FRIENDS.TabIDs.RECENT_PLAYERS then
		local var_1_3 = Engine.CBBHFCGDIC("LUA_MENU/OFFLINE")

		if arg_1_2.presence ~= nil and #arg_1_2.presence > 0 and arg_1_2.onlineStatus ~= BattleNetOnlineStatus.APPEAR_OFFLINE then
			var_1_3 = Engine.JCBDICCAH(arg_1_2.presence)
		end

		local var_1_4 = Engine.CBBHFCGDIC("MENU/NOT_JOINABLE")

		if arg_1_2.joinable then
			var_1_4 = Engine.CBBHFCGDIC("MENU/JOINABLE")
		end

		arg_1_0.StatusText:SetAlpha(1)
		arg_1_0.StatusText:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_1_3, var_1_4))
	else
		arg_1_0.StatusText:SetAlpha(0)
	end

	if arg_1_2.usingGamepad ~= nil then
		arg_1_0.InputImage:SetAlpha(1)
		arg_1_0.InputImage:setImage(RegisterMaterial(arg_1_2.usingGamepad and "icon_platform_controller" or "icon_platform_mousekeyboard"))
		arg_1_0.InputText:SetAlpha(1)
		arg_1_0.InputText:setText(Engine.CBBHFCGDIC(arg_1_2.usingGamepad and "PLATFORM_UI/PLAYING_WITH_CONTROLLER" or "MPUI/PLAY_WITH_KBM"))
	else
		arg_1_0.InputImage:SetAlpha(0)
		arg_1_0.InputText:SetAlpha(0)
	end

	arg_1_0.LeaderImage:SetRGBFromTable(SWATCHES.genericMenu.bodycopy)

	if arg_1_2.isPartyHost then
		arg_1_0.LeaderImage:SetAlpha(1)
		arg_1_0.LeaderImage:setImage(RegisterMaterial("icon_party_leader_crown"))
		arg_1_0.LeaderText:SetAlpha(1)
		arg_1_0.LeaderText:setText(Engine.CBBHFCGDIC("MPUI/PARTY_LEADER"))
	elseif arg_1_2.role == OnlineClanRole.OWNER then
		arg_1_0.LeaderImage:SetAlpha(1)
		arg_1_0.LeaderImage:setImage(RegisterMaterial("icon_regiments_leader"))
		arg_1_0.LeaderText:SetAlpha(1)
		arg_1_0.LeaderText:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEADER"))
	elseif arg_1_2.role == OnlineClanRole.OFFICER then
		arg_1_0.LeaderImage:SetAlpha(1)
		arg_1_0.LeaderImage:setImage(RegisterMaterial("icon_regiments_officer"))
		arg_1_0.LeaderText:SetAlpha(1)
		arg_1_0.LeaderText:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_OFFICER"))
	elseif arg_1_2.showPlatformIcon then
		arg_1_0.LeaderImage:SetAlpha(1)

		if arg_1_2.isAtviFriend then
			arg_1_0.LeaderImage:setImage(RegisterMaterial("icon_social_friend_atvi"))
			arg_1_0.LeaderText:SetAlpha(1)
			arg_1_0.LeaderText:setText(Engine.CBBHFCGDIC("LUA_MENU/ACTIVISION_FRIEND"))
		else
			local var_1_5 = Engine.CBBFHGEDGJ()
			local var_1_6 = FRIENDS.PlatformIcon[var_1_5]

			arg_1_0.LeaderImage:setImage(RegisterMaterial(var_1_6))
			arg_1_0.LeaderImage:SetRGBFromInt(16777215)
			arg_1_0.LeaderText:SetAlpha(1)

			local var_1_7 = FRIENDS.PlatformFriendText[var_1_5]

			arg_1_0.LeaderText:setText(var_1_7 and FRIENDS.PlatformFriendText[var_1_5] or "")
		end
	else
		arg_1_0.LeaderImage:SetAlpha(0)
		arg_1_0.LeaderText:SetAlpha(0)
	end

	if arg_1_2.onlineStatus then
		arg_1_0.OnlineStatusText:SetAlpha(1)
		arg_1_0.OnlineStatusText:setText(Engine.CBBHFCGDIC(FRIENDS.onlineStatusToString[arg_1_2.onlineStatus]))
		arg_1_0.PlayerStatus:SetOnlineStatus(arg_1_2.onlineStatus)

		local var_1_8 = 8 * _1080p
		local var_1_9 = LAYOUT.GetTextWidth(arg_1_0.OnlineStatusText)
		local var_1_10 = arg_1_0.OnlineStatusText:GetCurrentAnchorsAndPositions().right
		local var_1_11 = LAYOUT.GetElementWidth(arg_1_0.PlayerStatus)

		arg_1_0.PlayerStatus:SetRight(var_1_10 - var_1_9 - var_1_8)
		arg_1_0.PlayerStatus:SetLeft(var_1_10 - var_1_9 - var_1_8 - var_1_11)
	end

	local function var_1_12(arg_2_0)
		if arg_2_0._ableToInviteToRegiment then
			function arg_2_0.InvitePlayerToRegiment()
				Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
				Clans.DIEAGEDBCC(arg_2_0._controllerIndex, arg_2_0._activeClanID, arg_2_0._currentFriendXuid)
			end

			arg_2_0.FirstSidePrompt:SetAlpha(1)
		else
			arg_2_0.InvitePlayerToRegiment = nil

			arg_2_0.FirstSidePrompt:SetAlpha(0)
		end
	end

	if not Engine.CGABICJHAI() and var_1_2 ~= FRIENDS.TabIDs.REGIMENTS then
		local var_1_13 = false

		arg_1_0._activeClanID = Clans.CFGBBBHFHB(var_1_1)

		if arg_1_0._activeClanID and arg_1_0._activeClanID ~= -1 then
			local var_1_14 = Clans.BFCDHGIGGC(var_1_1, arg_1_0._activeClanID) == Engine.EAGGAEGHHA(var_1_1)
			local var_1_15 = Clans.CHEADIHHBJ(var_1_1, arg_1_0._activeClanID, arg_1_2.xuid).memberFound
			local var_1_16 = FRIENDS.IsClanInvitePending(var_1_1, arg_1_0._activeClanID, arg_1_2.xuid)

			if var_1_14 and not var_1_15 and not var_1_16 then
				var_1_13 = true
				arg_1_0._currentFriendXuid = arg_1_2.xuid
			end
		end

		if arg_1_0._ableToInviteToRegiment ~= var_1_13 then
			arg_1_0._ableToInviteToRegiment = var_1_13

			var_1_12(arg_1_0)
		end
	end
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_2 and arg_4_1 < arg_4_2 then
		arg_4_0.NoFriendsLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_ONLINE_FRIENDS"))
	else
		arg_4_0.NoFriendsLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_FRIENDS"))
	end

	arg_4_0.NoFriendsLabel:SetAlpha(arg_4_1 == 0 and 1 or 0)
	arg_4_0.NoFriendsBacker:SetAlpha(arg_4_1 == 0 and 0.5 or 0)

	if arg_4_1 == 0 then
		ACTIONS.AnimateSequence(arg_4_0, "HideDetails")
	end
end

local function var_0_2(arg_5_0, arg_5_1)
	local function var_5_0()
		local var_6_0 = arg_5_1:GetValue(arg_5_0._controllerIndex) or 0

		arg_5_0.InviteButton:SetInvites(var_6_0)
	end

	if arg_5_1 then
		arg_5_0:SubscribeToModel(arg_5_1:GetModel(arg_5_0._controllerIndex), var_5_0)
	else
		arg_5_0.InviteButton:SetAlpha(0)
	end
end

local function var_0_3(arg_7_0, arg_7_1)
	arg_7_0._tabID = arg_7_1

	local var_7_0 = FRIENDS.GetRefreshPlayerChildFunc(arg_7_0, arg_7_1)

	arg_7_0.PlayersGrid:SetRefreshChild(var_7_0)

	local var_7_1 = FRIENDS.GetNotificationDataSourceByTab(arg_7_1)

	var_0_2(arg_7_0, var_7_1)
end

local function var_0_4(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	arg_8_0.HeadLine:SetAlpha(arg_8_3 and 1 or 0)

	if arg_8_1 and #arg_8_1 > 0 then
		arg_8_0.HeadText:SetAlpha(1)
		arg_8_0.HeadText:setText(arg_8_1)
		arg_8_0.HeadLine:SetAlpha(1)
	end

	if arg_8_2 and #arg_8_2 > 0 then
		arg_8_0.PlayerNumText:SetAlpha(1)
		arg_8_0.PlayerNumText:setText(arg_8_2)
	end
end

local function var_0_5(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.PlayersGrid:SetWraps(arg_9_1, arg_9_2)
end

function PostLoadFunc(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._controllerIndex = arg_10_1
	arg_10_0._activeClanID = Clans.CFGBBBHFHB(arg_10_1)
	arg_10_0._ableToInviteToRegiment = false
	arg_10_0.UpdateNoFriends = var_0_1
	arg_10_0.SetRefreshChildFuncByTab = var_0_3
	arg_10_0.SetHeader = var_0_4
	arg_10_0.UpdatePlayerDetails = var_0_0
	arg_10_0.SetPlayerGridWrapping = var_0_5

	arg_10_0.PlayersGrid:SetNumChildren(0)
	arg_10_0:registerEventHandler("friend_card_gain_focus", function()
		ACTIONS.AnimateSequence(arg_10_0, "ShowDetails")
	end)
	arg_10_0:registerEventHandler("friend_card_lose_focus", function()
		if not LUI.IsLastInputGamepad(arg_10_1) then
			ACTIONS.AnimateSequence(arg_10_0, "HideDetails")
		end
	end)

	arg_10_0.InviteButton.navigation = {}
	arg_10_0.InviteButton.navigation.up = arg_10_0.PlayersGrid
	arg_10_0.InviteButton.navigation.down = arg_10_0.PlayersGrid

	local function var_10_0(arg_13_0, arg_13_1)
		if not LUI.IsLastInputKeyboardMouse(arg_13_1.controllerIndex) then
			ACTIONS.LoseFocus(arg_13_0, "InviteButton", arg_13_1.controllerIndex)
			ACTIONS.GainFocus(arg_13_0, "PlayersGrid", arg_13_1.controllerIndex)
		end
	end

	arg_10_0:registerEventHandler("update_input_type", var_10_0, {
		controllerIndex = arg_10_1
	})

	local var_10_1 = LUI.UIBindButton.new()

	var_10_1.id = "bindButton"

	arg_10_0:addElement(var_10_1)

	arg_10_0.bindButton = var_10_1

	arg_10_0.bindButton:addEventHandler("button_right_trigger", function(arg_14_0, arg_14_1)
		if not Engine.CGABICJHAI() and arg_10_0.InvitePlayerToRegiment then
			arg_10_0.InvitePlayerToRegiment()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_10_0, "AR")
	end
end

function SocialMenuLayout(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_15_0.id = "SocialMenuLayout"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 2,
		wrapY = true,
		arrowsVerticalOffset = 5,
		springCoefficient = 400,
		maxVisibleRows = SubtractForSplitscreen(8, 6),
		controllerIndex = var_15_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SocialFriendCard", {
				controllerIndex = var_15_1
			})
		end,
		refreshChild = function(arg_17_0, arg_17_1, arg_17_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 510,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_15_5 = LUI.UIGrid.new(var_15_4)

	var_15_5.id = "PlayersGrid"

	var_15_5:setUseStencil(true)
	var_15_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1126, _1080p * 257, _1080p * 925)
	var_15_0:addElement(var_15_5)

	var_15_0.PlayersGrid = var_15_5

	local var_15_6
	local var_15_7 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_15_1
	})

	var_15_7.id = "NoFriendsBacker"

	var_15_7:SetAlpha(0, 0)
	var_15_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 444, _1080p * 1476, _1080p * 525, _1080p * 597)
	var_15_0:addElement(var_15_7)

	var_15_0.NoFriendsBacker = var_15_7

	local var_15_8
	local var_15_9 = LUI.UIText.new()

	var_15_9.id = "NoFriendsLabel"

	var_15_9:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_15_9:SetAlpha(0, 0)
	var_15_9:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_RECENT_PLAYERS"), 0)
	var_15_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_9:SetAlignment(LUI.Alignment.Center)
	var_15_9:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -460, _1080p * 460, _1080p * 5, _1080p * 37)
	var_15_0:addElement(var_15_9)

	var_15_0.NoFriendsLabel = var_15_9

	local var_15_10
	local var_15_11 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_15_1
	})

	var_15_11.id = "VerticalScrollbar"

	var_15_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1126, _1080p * 1138, _1080p * 260, _1080p * 925)
	var_15_0:addElement(var_15_11)

	var_15_0.VerticalScrollbar = var_15_11

	local var_15_12
	local var_15_13 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_15_1
	})

	var_15_13.id = "DoubleNotchedBacker"

	var_15_13:SetAlpha(0, 0)
	var_15_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1166, _1080p * 1696, _1080p * 260, _1080p * 545)
	var_15_0:addElement(var_15_13)

	var_15_0.DoubleNotchedBacker = var_15_13

	local var_15_14
	local var_15_15 = LUI.UIStyledText.new()

	var_15_15.id = "StatusText"

	var_15_15:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_15:SetAlpha(0, 0)
	var_15_15:setText("", 0)
	var_15_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_15:SetAlignment(LUI.Alignment.Left)
	var_15_15:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1188, _1080p * 1672, _1080p * 461, _1080p * 485)
	var_15_0:addElement(var_15_15)

	var_15_0.StatusText = var_15_15

	local var_15_16
	local var_15_17 = LUI.UIStyledText.new()

	var_15_17.id = "OnlineStatusText"

	var_15_17:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_17:SetAlpha(0, 0)
	var_15_17:setText(Engine.CBBHFCGDIC("LUA_MENU/OFFLINE"), 0)
	var_15_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_17:SetWordWrap(false)
	var_15_17:SetAlignment(LUI.Alignment.Right)
	var_15_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1607, _1080p * 1672, _1080p * 503, _1080p * 527)
	var_15_0:addElement(var_15_17)

	var_15_0.OnlineStatusText = var_15_17

	local var_15_18
	local var_15_19 = MenuBuilder.BuildRegisteredType("SocialFriendDetails", {
		controllerIndex = var_15_1
	})

	var_15_19.id = "PlayerDetails"

	var_15_19:SetAlpha(0, 0)
	var_15_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1176, _1080p * 1696, _1080p * 260, _1080p * 452)
	var_15_0:addElement(var_15_19)

	var_15_0.PlayerDetails = var_15_19

	local var_15_20
	local var_15_21 = MenuBuilder.BuildRegisteredType("SocialPlayerStatus", {
		controllerIndex = var_15_1
	})

	var_15_21.id = "PlayerStatus"

	var_15_21:SetAlpha(0, 0)
	var_15_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1578, _1080p * 1602, _1080p * 503, _1080p * 527)
	var_15_0:addElement(var_15_21)

	var_15_0.PlayerStatus = var_15_21

	local var_15_22
	local var_15_23 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_15_1
	})

	var_15_23.id = "FirstTopPromptContainer"

	if CONDITIONS.AlwaysFalse(var_15_0) then
		var_15_23.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIENDS"), 0)
	end

	var_15_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 266, _1080p * 174, _1080p * 204)
	var_15_0:addElement(var_15_23)

	var_15_0.FirstTopPromptContainer = var_15_23

	local var_15_24
	local var_15_25 = MenuBuilder.BuildRegisteredType("RegimentsInviteButton", {
		controllerIndex = var_15_1
	})

	var_15_25.id = "InviteButton"

	var_15_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 316, _1080p * 531, _1080p * 174, _1080p * 204)
	var_15_0:addElement(var_15_25)

	var_15_0.InviteButton = var_15_25

	local var_15_26
	local var_15_27 = LUI.UIStyledText.new()

	var_15_27.id = "HeadText"

	var_15_27:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_15_27:SetAlpha(0, 0)
	var_15_27:setText(Engine.CBBHFCGDIC("LUA_MENU/RECEIVED_REQUESTS"), 0)
	var_15_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_27:SetWordWrap(false)
	var_15_27:SetAlignment(LUI.Alignment.Left)
	var_15_27:SetOptOutRightToLeftAlignmentFlip(true)
	var_15_27:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_27:SetStartupDelay(2000)
	var_15_27:SetLineHoldTime(400)
	var_15_27:SetAnimMoveTime(2000)
	var_15_27:SetAnimMoveSpeed(150)
	var_15_27:SetEndDelay(2000)
	var_15_27:SetCrossfadeTime(400)
	var_15_27:SetFadeInTime(300)
	var_15_27:SetFadeOutTime(300)
	var_15_27:SetMaxVisibleLines(2)
	var_15_27:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -803, _1080p * 225, _1080p * 249)
	var_15_0:addElement(var_15_27)

	var_15_0.HeadText = var_15_27

	local var_15_28
	local var_15_29 = LUI.UIImage.new()

	var_15_29.id = "HeadLine"

	var_15_29:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_15_29:SetAlpha(0, 0)
	var_15_29:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_15_29:Setup3SliceHorizontalImage(_1080p * 10, 0.3)
	var_15_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 92, _1080p * 1123, _1080p * 250, _1080p * 251)
	var_15_0:addElement(var_15_29)

	var_15_0.HeadLine = var_15_29

	local var_15_30
	local var_15_31 = LUI.UIText.new()

	var_15_31.id = "PlayerNumText"

	var_15_31:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_15_31:SetAlpha(0, 0)
	var_15_31:setText(Engine.CBBHFCGDIC("LUA_MENU/RECEIVED_REQUESTS"), 0)
	var_15_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_31:SetAlignment(LUI.Alignment.Right)
	var_15_31:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 932, _1080p * -803, _1080p * 225, _1080p * 249)
	var_15_0:addElement(var_15_31)

	var_15_0.PlayerNumText = var_15_31

	local var_15_32
	local var_15_33 = LUI.UIImage.new()

	var_15_33.id = "InputImage"

	var_15_33:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_33:SetAlpha(0, 0)
	var_15_33:setImage(RegisterMaterial("icon_platform_controller"), 0)
	var_15_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1188, _1080p * 1220, _1080p * 461, _1080p * 493)
	var_15_0:addElement(var_15_33)

	var_15_0.InputImage = var_15_33

	local var_15_34
	local var_15_35 = LUI.UIStyledText.new()

	var_15_35.id = "InputText"

	var_15_35:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_35:SetAlpha(0, 0)
	var_15_35:setText(Engine.CBBHFCGDIC("PLATFORM_UI/PLAYING_WITH_CONTROLLER"), 0)
	var_15_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_35:SetAlignment(LUI.Alignment.Left)
	var_15_35:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_35:SetOptOutRightToLeftAlignmentFlip(true)
	var_15_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1226, _1080p * 1672, _1080p * 465, _1080p * 489)
	var_15_0:addElement(var_15_35)

	var_15_0.InputText = var_15_35

	local var_15_36
	local var_15_37 = LUI.UIStyledText.new()

	var_15_37.id = "LeaderText"

	var_15_37:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_37:SetAlpha(0, 0)
	var_15_37:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEADER"), 0)
	var_15_37:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_37:SetAlignment(LUI.Alignment.Left)
	var_15_37:SetOptOutRightToLeftAlignmentFlip(true)
	var_15_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1562, _1080p * 505, _1080p * 525)
	var_15_0:addElement(var_15_37)

	var_15_0.LeaderText = var_15_37

	local var_15_38
	local var_15_39 = LUI.UIImage.new()

	var_15_39.id = "LeaderImage"

	var_15_39:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_39:SetAlpha(0, 0)
	var_15_39:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_15_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1192, _1080p * 1216, _1080p * 501, _1080p * 525)
	var_15_0:addElement(var_15_39)

	var_15_0.LeaderImage = var_15_39

	local var_15_40
	local var_15_41 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_15_1
	})

	var_15_41.id = "SecondSidePromptContainer"

	var_15_41:SetAlpha(0, 0)

	if CONDITIONS.AlwaysFalse(var_15_0) then
		var_15_41.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIENDS"), 0)
	end

	var_15_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1351, _1080p * 1530, _1080p * 568, _1080p * 598)
	var_15_0:addElement(var_15_41)

	var_15_0.SecondSidePromptContainer = var_15_41

	local var_15_42
	local var_15_43 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_15_1
	})

	var_15_43.id = "ThirdTopPromptContainer"

	if CONDITIONS.AlwaysFalse(var_15_0) then
		var_15_43.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/FRIEND_REQUESTS"), 0)
	end

	var_15_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 591, _1080p * 782, _1080p * 174, _1080p * 204)
	var_15_0:addElement(var_15_43)

	var_15_0.ThirdTopPromptContainer = var_15_43

	local var_15_44
	local var_15_45 = LUI.UIText.new()

	var_15_45.id = "FirstSidePrompt"

	var_15_45:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_15_45:SetAlpha(0, 0)
	var_15_45:setText(Engine.CBBHFCGDIC("REGIMENTS/INVITE_PROMPT"), 0)
	var_15_45:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_15_45:SetAlignment(LUI.Alignment.Left)
	var_15_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1166, _1080p * 1345, _1080p * 568, _1080p * 590)
	var_15_0:addElement(var_15_45)

	var_15_0.FirstSidePrompt = var_15_45

	local function var_15_46()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_46

	local var_15_47
	local var_15_48 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_13:RegisterAnimationSequence("ShowDetails", var_15_48)

	local var_15_49 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_19:RegisterAnimationSequence("ShowDetails", var_15_49)

	local function var_15_50()
		var_15_13:AnimateSequence("ShowDetails")
		var_15_19:AnimateSequence("ShowDetails")
	end

	var_15_0._sequences.ShowDetails = var_15_50

	local var_15_51
	local var_15_52 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_13:RegisterAnimationSequence("HideDetails", var_15_52)

	local var_15_53 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_15:RegisterAnimationSequence("HideDetails", var_15_53)

	local var_15_54 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_17:RegisterAnimationSequence("HideDetails", var_15_54)

	local var_15_55 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_19:RegisterAnimationSequence("HideDetails", var_15_55)

	local var_15_56 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_21:RegisterAnimationSequence("HideDetails", var_15_56)

	local var_15_57 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_33:RegisterAnimationSequence("HideDetails", var_15_57)

	local var_15_58 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_35:RegisterAnimationSequence("HideDetails", var_15_58)

	local var_15_59 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_37:RegisterAnimationSequence("HideDetails", var_15_59)

	local var_15_60 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_39:RegisterAnimationSequence("HideDetails", var_15_60)

	local var_15_61 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_41:RegisterAnimationSequence("HideDetails", var_15_61)

	local var_15_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_45:RegisterAnimationSequence("HideDetails", var_15_62)

	local function var_15_63()
		var_15_13:AnimateSequence("HideDetails")
		var_15_15:AnimateSequence("HideDetails")
		var_15_17:AnimateSequence("HideDetails")
		var_15_19:AnimateSequence("HideDetails")
		var_15_21:AnimateSequence("HideDetails")
		var_15_33:AnimateSequence("HideDetails")
		var_15_35:AnimateSequence("HideDetails")
		var_15_37:AnimateSequence("HideDetails")
		var_15_39:AnimateSequence("HideDetails")
		var_15_41:AnimateSequence("HideDetails")
		var_15_45:AnimateSequence("HideDetails")
	end

	var_15_0._sequences.HideDetails = var_15_63

	local var_15_64
	local var_15_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 458
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 488
		}
	}

	var_15_15:RegisterAnimationSequence("AR", var_15_65)

	local var_15_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 501
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 529
		}
	}

	var_15_17:RegisterAnimationSequence("AR", var_15_66)

	local var_15_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 461
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 493
		}
	}

	var_15_35:RegisterAnimationSequence("AR", var_15_67)

	local var_15_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 501
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 529
		}
	}

	var_15_37:RegisterAnimationSequence("AR", var_15_68)

	local function var_15_69()
		var_15_15:AnimateSequence("AR")
		var_15_17:AnimateSequence("AR")
		var_15_35:AnimateSequence("AR")
		var_15_37:AnimateSequence("AR")
	end

	var_15_0._sequences.AR = var_15_69

	local var_15_70
	local var_15_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_23:RegisterAnimationSequence("HideFirstPrompt", var_15_71)

	local var_15_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 311
		}
	}

	var_15_25:RegisterAnimationSequence("HideFirstPrompt", var_15_72)

	local var_15_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 371
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 562
		}
	}

	var_15_43:RegisterAnimationSequence("HideFirstPrompt", var_15_73)

	local function var_15_74()
		var_15_23:AnimateSequence("HideFirstPrompt")
		var_15_25:AnimateSequence("HideFirstPrompt")
		var_15_43:AnimateSequence("HideFirstPrompt")
	end

	var_15_0._sequences.HideFirstPrompt = var_15_74

	local var_15_75
	local var_15_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_23:RegisterAnimationSequence("ShowFirstPrompt", var_15_76)

	local var_15_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 316
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 531
		}
	}

	var_15_25:RegisterAnimationSequence("ShowFirstPrompt", var_15_77)

	local var_15_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 591
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 782
		}
	}

	var_15_43:RegisterAnimationSequence("ShowFirstPrompt", var_15_78)

	local function var_15_79()
		var_15_23:AnimateSequence("ShowFirstPrompt")
		var_15_25:AnimateSequence("ShowFirstPrompt")
		var_15_43:AnimateSequence("ShowFirstPrompt")
	end

	var_15_0._sequences.ShowFirstPrompt = var_15_79

	local var_15_80 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_15_11,
		startCap = var_15_11.startCap,
		endCap = var_15_11.endCap,
		sliderArea = var_15_11.sliderArea,
		slider = var_15_11.sliderArea and var_15_11.sliderArea.slider,
		fixedSizeSlider = var_15_11.sliderArea and var_15_11.sliderArea.fixedSizeSlider
	})

	var_15_5:AddScrollbar(var_15_80)
	PostLoadFunc(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("SocialMenuLayout", SocialMenuLayout)
LockTable(_M)
