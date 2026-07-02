module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.NoFriendsLabel:SetAlpha(arg_1_1 and 1 or 0)
	arg_1_0.NoFriendsBacker:SetAlpha(arg_1_1 and 0.5 or 0)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1 and "LUA_MENU/NO_ONLINE_FRIENDS" or "LUA_MENU/NO_FRIENDS"

	arg_2_0.NoFriendsLabel:setText(Engine.CBBHFCGDIC(var_2_0))
end

local function var_0_2(arg_3_0, arg_3_1)
	local function var_3_0()
		local var_4_0 = arg_3_1:GetValue(arg_3_0._controllerIndex) or 0

		arg_3_0.InviteButton:SetInvites(var_4_0)
	end

	if arg_3_1 then
		arg_3_0:SubscribeToModel(arg_3_1:GetModel(arg_3_0._controllerIndex), var_3_0)
	else
		arg_3_0.InviteButton:SetAlpha(0)
	end
end

local function var_0_3(arg_5_0, arg_5_1)
	arg_5_0._tabID = arg_5_1

	local var_5_0 = 2
	local var_5_1 = FRIENDS.GetRefreshPlayerChildFunc(arg_5_0, arg_5_1, var_5_0)

	arg_5_0.PlayersGrid:SetRefreshChild(var_5_1)

	local var_5_2 = FRIENDS.GetNotificationDataSourceByTab(arg_5_1)

	var_0_2(arg_5_0, var_5_2)
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.PlayersGrid:SetWraps(arg_6_1, arg_6_2)
end

local function var_0_5(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_1.usingGamepad ~= nil

	if var_7_0 then
		local var_7_1 = arg_7_1.usingGamepad and "icon_platform_controller" or "icon_platform_mousekeyboard"
		local var_7_2 = arg_7_1.usingGamepad and "PLATFORM_UI/PLAYING_WITH_CONTROLLER" or "MPUI/PLAY_WITH_KBM"

		arg_7_0.InputImage:setImage(RegisterMaterial(var_7_1))
		arg_7_0.InputText:setText(Engine.CBBHFCGDIC(var_7_2))
	end

	local var_7_3 = var_7_0 and 1 or 0

	arg_7_0.InputImage:SetAlpha(var_7_3)
	arg_7_0.InputText:SetAlpha(var_7_3)
end

local function var_0_6(arg_8_0)
	arg_8_0.InvitePlayerToRegiment = nil

	if arg_8_0._ableToInviteToRegiment then
		function arg_8_0.InvitePlayerToRegiment()
			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
			Clans.DIEAGEDBCC(arg_8_0._controllerIndex, arg_8_0._activeClanID, arg_8_0._currentFriendXuid)
		end
	end

	arg_8_0.FirstSidePrompt:SetAlpha(arg_8_0._ableToInviteToRegiment and 1 or 0)
end

local function var_0_7(arg_10_0, arg_10_1)
	local var_10_0 = false

	arg_10_0._activeClanID = Clans.CFGBBBHFHB(arg_10_0._controllerIndex)

	if arg_10_0._activeClanID and arg_10_0._activeClanID ~= -1 then
		local var_10_1 = Clans.BFCDHGIGGC(arg_10_0._controllerIndex, arg_10_0._activeClanID) == Engine.EAGGAEGHHA(arg_10_0._controllerIndex)
		local var_10_2 = Clans.CHEADIHHBJ(arg_10_0._controllerIndex, arg_10_0._activeClanID, arg_10_1.xuid).memberFound
		local var_10_3 = FRIENDS.IsClanInvitePending(arg_10_0._controllerIndex, arg_10_0._activeClanID, arg_10_1.xuid)

		if var_10_1 and not var_10_2 and not var_10_3 then
			var_10_0 = true
			arg_10_0._currentFriendXuid = arg_10_1.xuid
		end
	end

	if arg_10_0._ableToInviteToRegiment ~= var_10_0 then
		arg_10_0._ableToInviteToRegiment = var_10_0

		var_0_6(arg_10_0)
	end
end

local function var_0_8(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0._tabID
	local var_11_1 = arg_11_2 and arg_11_2.xuid

	ACTIONS.AnimateSequence(arg_11_0, var_11_1 and "ShowDetails" or "HideDetails")

	if CONDITIONS.IsFifthWheelActive() then
		ACTIONS.AnimateSequence(arg_11_0, arg_11_2.isOnline and "OnlinePlayer" or "OfflinePlayer")
	else
		ACTIONS.AnimateSequence(arg_11_0, "CompactDetailsPane")
	end

	arg_11_0.PlayerDetails:SetupPlayerDetails(arg_11_2, var_11_0)
	var_0_5(arg_11_0, arg_11_2)
	arg_11_0.PlayerDetails:UpdateLeaderIconAndText(arg_11_2)

	if arg_11_2.onlineStatus then
		arg_11_0.PlayerDetails:UpdateOnlineStatus(arg_11_2)
	end

	if not Engine.CGABICJHAI() and var_11_0 ~= FRIENDS.TabIDs.REGIMENTS then
		var_0_7(arg_11_0, arg_11_2)
	end
end

local function var_0_9(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	if arg_12_3 == FRIENDS.TabIDs.INBOX then
		var_0_0(arg_12_0, arg_12_1 <= 0)
	else
		local var_12_0 = arg_12_1 == 0

		var_0_1(arg_12_0, arg_12_2 and arg_12_1 < arg_12_2)
		var_0_0(arg_12_0, var_12_0)

		if var_12_0 then
			ACTIONS.AnimateSequence(arg_12_0, "HideDetails")
		end
	end
end

local function var_0_10(arg_13_0, arg_13_1)
	if not LUI.IsLastInputKeyboardMouse(arg_13_1.controllerIndex) then
		ACTIONS.LoseFocus(arg_13_0, "InviteButton", arg_13_1.controllerIndex)
		ACTIONS.GainFocus(arg_13_0, "PlayersGrid", arg_13_1.controllerIndex)
	end
end

local function var_0_11(arg_14_0)
	arg_14_0.InviteButton.navigation = {}
	arg_14_0.InviteButton.navigation.up = arg_14_0.PlayersGrid
	arg_14_0.InviteButton.navigation.down = arg_14_0.PlayersGrid
end

local function var_0_12(arg_15_0)
	arg_15_0:registerEventHandler("friend_card_gain_focus", function()
		local var_16_0 = LUI.IsLastInputMouseNavigation(arg_15_0._controllerIndex)

		arg_15_0._mouseFocusRefcount = var_16_0 and arg_15_0._mouseFocusRefcount + 1 or 1

		if arg_15_0._tabID ~= FRIENDS.TabIDs.INBOX then
			ACTIONS.AnimateSequence(arg_15_0, "ShowDetails")
		end
	end)
	arg_15_0:registerEventHandler("friend_card_lose_focus", function()
		local var_17_0 = LUI.IsLastInputMouseNavigation(arg_15_0._controllerIndex)

		if var_17_0 and arg_15_0._mouseFocusRefcount > 0 then
			arg_15_0._mouseFocusRefcount = arg_15_0._mouseFocusRefcount - 1
		end

		if var_17_0 and arg_15_0._mouseFocusRefcount == 0 then
			ACTIONS.AnimateSequence(arg_15_0, "HideDetails")
		end
	end)
	arg_15_0:registerEventHandler("update_input_type", var_0_10, {
		controllerIndex = arg_15_0._controllerIndex
	})
end

local function var_0_13(arg_18_0)
	local var_18_0 = LUI.UIBindButton.new()

	var_18_0.id = "bindButton"

	arg_18_0:addElement(var_18_0)

	arg_18_0.bindButton = var_18_0

	arg_18_0.bindButton:addEventHandler("button_right_trigger", function(arg_19_0, arg_19_1)
		if not Engine.CGABICJHAI() and arg_18_0.InvitePlayerToRegiment then
			arg_18_0.InvitePlayerToRegiment()
		end
	end)
end

function PostLoadFunc(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0._controllerIndex = arg_20_1
	arg_20_0._activeClanID = Clans.CFGBBBHFHB(arg_20_1)
	arg_20_0._ableToInviteToRegiment = false
	arg_20_0._mouseFocusRefcount = 0
	arg_20_0.UpdateNoFriends = var_0_9
	arg_20_0.SetRefreshChildFuncByTab = var_0_3
	arg_20_0.UpdatePlayerDetails = var_0_8
	arg_20_0.SetPlayerGridWrapping = var_0_4

	arg_20_0.PlayersGrid:SetNumChildren(0)
	var_0_11(arg_20_0)
	var_0_12(arg_20_0)
	var_0_13(arg_20_0)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_20_0, "AR")
	end
end

function SocialMenuLayout(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIElement.new()

	var_21_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_21_0.id = "SocialMenuLayout"
	var_21_0._animationSets = var_21_0._animationSets or {}
	var_21_0._sequences = var_21_0._sequences or {}

	local var_21_1 = arg_21_1 and arg_21_1.controllerIndex

	if not var_21_1 and not Engine.DDJFBBJAIG() then
		var_21_1 = var_21_0:getRootController()
	end

	assert(var_21_1)

	local var_21_2 = var_21_0
	local var_21_3
	local var_21_4 = {
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
		controllerIndex = var_21_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SocialFriendCard", {
				controllerIndex = var_21_1
			})
		end,
		refreshChild = function(arg_23_0, arg_23_1, arg_23_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 510,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_21_5 = LUI.UIGrid.new(var_21_4)

	var_21_5.id = "PlayersGrid"

	var_21_5:setUseStencil(true)
	var_21_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1126, _1080p * 257, _1080p * 925)
	var_21_0:addElement(var_21_5)

	var_21_0.PlayersGrid = var_21_5

	local var_21_6
	local var_21_7 = LUI.UIImage.new()

	var_21_7.id = "NoFriendsBacker"

	var_21_7:SetRGBFromInt(2697513, 0)
	var_21_7:SetAlpha(0, 0)
	var_21_7:setImage(RegisterMaterial("ui_mp_wz_bkg_button_3"), 0)
	var_21_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 444, _1080p * 1476, _1080p * 525, _1080p * 597)
	var_21_0:addElement(var_21_7)

	var_21_0.NoFriendsBacker = var_21_7

	local var_21_8
	local var_21_9 = LUI.UIText.new()

	var_21_9.id = "NoFriendsLabel"

	var_21_9:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_21_9:SetAlpha(0, 0)
	var_21_9:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_RECENT_PLAYERS"), 0)
	var_21_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_9:SetAlignment(LUI.Alignment.Center)
	var_21_9:SetVerticalAlignment(LUI.Alignment.Center)
	var_21_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -460, _1080p * 460, _1080p * 5, _1080p * 37)
	var_21_0:addElement(var_21_9)

	var_21_0.NoFriendsLabel = var_21_9

	local var_21_10
	local var_21_11 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_21_1
	})

	var_21_11.id = "VerticalScrollbar"

	var_21_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1126, _1080p * 1138, _1080p * 260, _1080p * 925)
	var_21_0:addElement(var_21_11)

	var_21_0.VerticalScrollbar = var_21_11

	local var_21_12
	local var_21_13 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_21_1
	})

	var_21_13.id = "DoubleNotchedBacker"

	var_21_13:SetAlpha(0, 0)
	var_21_13.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_21_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1166, _1080p * 1696, _1080p * 260, _1080p * 925)
	var_21_0:addElement(var_21_13)

	var_21_0.DoubleNotchedBacker = var_21_13

	local var_21_14
	local var_21_15 = MenuBuilder.BuildRegisteredType("SocialFriendDetails", {
		controllerIndex = var_21_1
	})

	var_21_15.id = "PlayerDetails"

	var_21_15:SetAlpha(0, 0)
	var_21_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1176, _1080p * 1696, _1080p * 260, _1080p * 925)
	var_21_0:addElement(var_21_15)

	var_21_0.PlayerDetails = var_21_15

	local var_21_16
	local var_21_17 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_21_1
	})

	var_21_17.id = "FirstTopPromptContainer"

	if CONDITIONS.AlwaysFalse() then
		var_21_17.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIENDS"), 0)
	end

	var_21_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 266, _1080p * 174, _1080p * 204)
	var_21_0:addElement(var_21_17)

	var_21_0.FirstTopPromptContainer = var_21_17

	local var_21_18
	local var_21_19 = MenuBuilder.BuildRegisteredType("RegimentsInviteButton", {
		controllerIndex = var_21_1
	})

	var_21_19.id = "InviteButton"

	var_21_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 316, _1080p * 531, _1080p * 174, _1080p * 204)
	var_21_0:addElement(var_21_19)

	var_21_0.InviteButton = var_21_19

	local var_21_20
	local var_21_21 = LUI.UIStyledText.new()

	var_21_21.id = "HeadText"

	var_21_21:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_21_21:SetAlpha(0, 0)
	var_21_21:setText(Engine.CBBHFCGDIC("LUA_MENU/RECEIVED_REQUESTS"), 0)
	var_21_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_21:SetWordWrap(false)
	var_21_21:SetAlignment(LUI.Alignment.Left)
	var_21_21:SetOptOutRightToLeftAlignmentFlip(true)
	var_21_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_21_21:SetStartupDelay(2000)
	var_21_21:SetLineHoldTime(400)
	var_21_21:SetAnimMoveTime(2000)
	var_21_21:SetAnimMoveSpeed(150)
	var_21_21:SetEndDelay(2000)
	var_21_21:SetCrossfadeTime(400)
	var_21_21:SetFadeInTime(300)
	var_21_21:SetFadeOutTime(300)
	var_21_21:SetMaxVisibleLines(2)
	var_21_21:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -803, _1080p * 225, _1080p * 249)
	var_21_0:addElement(var_21_21)

	var_21_0.HeadText = var_21_21

	local var_21_22
	local var_21_23 = LUI.UIImage.new()

	var_21_23.id = "HeadLine"

	var_21_23:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_21_23:SetAlpha(0, 0)
	var_21_23:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_21_23:Setup3SliceHorizontalImage(_1080p * 10, 0.3)
	var_21_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 92, _1080p * 1123, _1080p * 250, _1080p * 251)
	var_21_0:addElement(var_21_23)

	var_21_0.HeadLine = var_21_23

	local var_21_24
	local var_21_25 = LUI.UIText.new()

	var_21_25.id = "PlayerNumText"

	var_21_25:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_21_25:SetAlpha(0, 0)
	var_21_25:setText(Engine.CBBHFCGDIC("LUA_MENU/RECEIVED_REQUESTS"), 0)
	var_21_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_25:SetAlignment(LUI.Alignment.Right)
	var_21_25:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 932, _1080p * -803, _1080p * 225, _1080p * 249)
	var_21_0:addElement(var_21_25)

	var_21_0.PlayerNumText = var_21_25

	local var_21_26
	local var_21_27 = LUI.UIImage.new()

	var_21_27.id = "InputImage"

	var_21_27:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_21_27:SetAlpha(0, 0)
	var_21_27:setImage(RegisterMaterial("icon_platform_controller"), 0)
	var_21_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1188, _1080p * 1220, _1080p * 867, _1080p * 899)
	var_21_0:addElement(var_21_27)

	var_21_0.InputImage = var_21_27

	local var_21_28
	local var_21_29 = LUI.UIStyledText.new()

	var_21_29.id = "InputText"

	var_21_29:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_21_29:SetAlpha(0, 0)
	var_21_29:setText(Engine.CBBHFCGDIC("PLATFORM_UI/PLAYING_WITH_CONTROLLER"), 0)
	var_21_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_21_29:SetAlignment(LUI.Alignment.Left)
	var_21_29:SetVerticalAlignment(LUI.Alignment.Center)
	var_21_29:SetOptOutRightToLeftAlignmentFlip(true)
	var_21_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1226, _1080p * 1672, _1080p * 871, _1080p * 895)
	var_21_0:addElement(var_21_29)

	var_21_0.InputText = var_21_29

	local var_21_30
	local var_21_31 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_21_1
	})

	var_21_31.id = "SecondSidePromptContainer"

	var_21_31:SetAlpha(0, 0)

	if CONDITIONS.AlwaysFalse() then
		var_21_31.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIENDS"), 0)
	end

	var_21_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1346, _1080p * 1526, _1080p * 934, _1080p * 964)
	var_21_0:addElement(var_21_31)

	var_21_0.SecondSidePromptContainer = var_21_31

	local var_21_32
	local var_21_33 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_21_1
	})

	var_21_33.id = "ThirdTopPromptContainer"

	if CONDITIONS.AlwaysFalse() then
		var_21_33.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/FRIEND_REQUESTS"), 0)
	end

	var_21_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 591, _1080p * 782, _1080p * 174, _1080p * 204)
	var_21_0:addElement(var_21_33)

	var_21_0.ThirdTopPromptContainer = var_21_33

	local var_21_34
	local var_21_35 = LUI.UIText.new()

	var_21_35.id = "FirstSidePrompt"

	var_21_35:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_21_35:SetAlpha(0, 0)
	var_21_35:setText(Engine.CBBHFCGDIC("REGIMENTS/INVITE_PROMPT"), 0)
	var_21_35:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_21_35:SetAlignment(LUI.Alignment.Left)
	var_21_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1166, _1080p * 1345, _1080p * 934, _1080p * 956)
	var_21_0:addElement(var_21_35)

	var_21_0.FirstSidePrompt = var_21_35

	local var_21_36
	local var_21_37 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_21_1
	})

	var_21_37.id = "FourthTopPromptContainer"

	var_21_37:SetAlpha(0, 0)

	if CONDITIONS.AlwaysFalse() then
		var_21_37.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/SWITCH_REGIMENT"), 0)
	end

	var_21_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 960, _1080p * 1151, _1080p * 174, _1080p * 204)
	var_21_0:addElement(var_21_37)

	var_21_0.FourthTopPromptContainer = var_21_37

	local function var_21_38()
		return
	end

	var_21_0._sequences.DefaultSequence = var_21_38

	local var_21_39
	local var_21_40 = {
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

	var_21_13:RegisterAnimationSequence("ShowDetails", var_21_40)

	local var_21_41 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("ShowDetails", var_21_41)

	local function var_21_42()
		var_21_13:AnimateSequence("ShowDetails")
		var_21_15:AnimateSequence("ShowDetails")
	end

	var_21_0._sequences.ShowDetails = var_21_42

	local var_21_43
	local var_21_44 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("HideDetails", var_21_44)

	local var_21_45 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("HideDetails", var_21_45)

	local var_21_46 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_27:RegisterAnimationSequence("HideDetails", var_21_46)

	local var_21_47 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_29:RegisterAnimationSequence("HideDetails", var_21_47)

	local var_21_48 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_31:RegisterAnimationSequence("HideDetails", var_21_48)

	local var_21_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_35:RegisterAnimationSequence("HideDetails", var_21_49)

	local function var_21_50()
		var_21_13:AnimateSequence("HideDetails")
		var_21_15:AnimateSequence("HideDetails")
		var_21_27:AnimateSequence("HideDetails")
		var_21_29:AnimateSequence("HideDetails")
		var_21_31:AnimateSequence("HideDetails")
		var_21_35:AnimateSequence("HideDetails")
	end

	var_21_0._sequences.HideDetails = var_21_50

	local var_21_51
	local var_21_52 = {
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

	var_21_29:RegisterAnimationSequence("AR", var_21_52)

	local function var_21_53()
		var_21_29:AnimateSequence("AR")
	end

	var_21_0._sequences.AR = var_21_53

	local var_21_54
	local var_21_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_17:RegisterAnimationSequence("HideFirstPrompt", var_21_55)

	local var_21_56 = {
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

	var_21_19:RegisterAnimationSequence("HideFirstPrompt", var_21_56)

	local var_21_57 = {
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

	var_21_33:RegisterAnimationSequence("HideFirstPrompt", var_21_57)

	local function var_21_58()
		var_21_17:AnimateSequence("HideFirstPrompt")
		var_21_19:AnimateSequence("HideFirstPrompt")
		var_21_33:AnimateSequence("HideFirstPrompt")
	end

	var_21_0._sequences.HideFirstPrompt = var_21_58

	local var_21_59
	local var_21_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_17:RegisterAnimationSequence("ShowFirstPrompt", var_21_60)

	local var_21_61 = {
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

	var_21_19:RegisterAnimationSequence("ShowFirstPrompt", var_21_61)

	local var_21_62 = {
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

	var_21_33:RegisterAnimationSequence("ShowFirstPrompt", var_21_62)

	local function var_21_63()
		var_21_17:AnimateSequence("ShowFirstPrompt")
		var_21_19:AnimateSequence("ShowFirstPrompt")
		var_21_33:AnimateSequence("ShowFirstPrompt")
	end

	var_21_0._sequences.ShowFirstPrompt = var_21_63

	local var_21_64
	local var_21_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 693
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("OfflinePlayer", var_21_65)

	local var_21_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 491
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 523
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

	var_21_27:RegisterAnimationSequence("OfflinePlayer", var_21_66)

	local var_21_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 491
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 515
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1224
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1670
		}
	}

	var_21_29:RegisterAnimationSequence("OfflinePlayer", var_21_67)

	local function var_21_68()
		var_21_13:AnimateSequence("OfflinePlayer")
		var_21_27:AnimateSequence("OfflinePlayer")
		var_21_29:AnimateSequence("OfflinePlayer")
	end

	var_21_0._sequences.OfflinePlayer = var_21_68

	local var_21_69
	local var_21_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 915
		}
	}

	var_21_13:RegisterAnimationSequence("OnlinePlayer", var_21_70)

	local var_21_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_27:RegisterAnimationSequence("OnlinePlayer", var_21_71)

	local var_21_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_29:RegisterAnimationSequence("OnlinePlayer", var_21_72)

	local function var_21_73()
		var_21_13:AnimateSequence("OnlinePlayer")
		var_21_27:AnimateSequence("OnlinePlayer")
		var_21_29:AnimateSequence("OnlinePlayer")
	end

	var_21_0._sequences.OnlinePlayer = var_21_73

	local var_21_74
	local var_21_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 570
		}
	}

	var_21_13:RegisterAnimationSequence("CompactDetailsPane", var_21_75)

	local var_21_76 = {
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

	var_21_27:RegisterAnimationSequence("CompactDetailsPane", var_21_76)

	local var_21_77 = {
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

	var_21_29:RegisterAnimationSequence("CompactDetailsPane", var_21_77)

	local var_21_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 568
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 598
		}
	}

	var_21_31:RegisterAnimationSequence("CompactDetailsPane", var_21_78)

	local var_21_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 568
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 590
		}
	}

	var_21_35:RegisterAnimationSequence("CompactDetailsPane", var_21_79)

	local function var_21_80()
		var_21_13:AnimateSequence("CompactDetailsPane")
		var_21_27:AnimateSequence("CompactDetailsPane")
		var_21_29:AnimateSequence("CompactDetailsPane")
		var_21_31:AnimateSequence("CompactDetailsPane")
		var_21_35:AnimateSequence("CompactDetailsPane")
	end

	var_21_0._sequences.CompactDetailsPane = var_21_80

	local var_21_81
	local var_21_82 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_37:RegisterAnimationSequence("ShowFourthContainer", var_21_82)

	local function var_21_83()
		var_21_37:AnimateSequence("ShowFourthContainer")
	end

	var_21_0._sequences.ShowFourthContainer = var_21_83

	local var_21_84 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_21_11,
		startCap = var_21_11.startCap,
		endCap = var_21_11.endCap,
		sliderArea = var_21_11.sliderArea,
		slider = var_21_11.sliderArea and var_21_11.sliderArea.slider,
		fixedSizeSlider = var_21_11.sliderArea and var_21_11.sliderArea.fixedSizeSlider
	})

	var_21_5:AddScrollbar(var_21_84)
	PostLoadFunc(var_21_0, var_21_1, arg_21_1)

	return var_21_0
end

MenuBuilder.registerType("SocialMenuLayout", SocialMenuLayout)
LockTable(_M)
