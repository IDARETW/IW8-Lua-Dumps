module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = arg_1_3 + arg_1_2
	local var_1_1 = FRIENDS.UnifyPlayerDataFormat(arg_1_0._membersData[var_1_0 + 1])
	local var_1_2 = var_1_1.xuid

	if not var_1_1.name or var_1_1.name == "" then
		local var_1_3 = Friends.HCAFBJBHC(arg_1_0._controllerIndex, var_1_2)

		if var_1_3.valid == true then
			var_1_1 = var_1_3
		end

		var_1_1.xuid = var_1_2
	end

	var_1_1.controllerIndex = arg_1_0._controllerIndex
	var_1_1.memberRole = Clans2.CFDHGBFICH(arg_1_0._controllerIndex, arg_1_0._clanId, var_1_2)
	var_1_1.viewerMemberRole = arg_1_0._memberRole
	var_1_1.clanId = arg_1_0._clanId
	var_1_1.clanDetails = arg_1_0._clanDetails

	arg_1_1:SetupPlayerData(var_1_1)

	if var_1_2 ~= arg_1_0._xuid then
		arg_1_1:registerEventHandler("button_action", function(arg_2_0, arg_2_1)
			LUI.FlowManager.RequestPopupMenu(arg_1_0, "ClanConfirmActionPopup", true, arg_2_1.controller, false, {
				controllerIndex = arg_1_0._controllerIndex,
				clanId = arg_1_0._clanId,
				usage = CLANS.CLAN_POPUP_INPUT.CLAN_TRANSFER_OWNERSHIP,
				clanDetails = arg_1_0._clanDetails,
				memberName = var_1_1.name,
				xuid = var_1_2
			})
		end)
	else
		arg_1_1:registerEventHandler("button_action", function(arg_3_0, arg_3_1)
			return
		end)
	end
end

local function var_0_1(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1 == 0

	arg_4_0.NoMembersLabel:setText(Engine.CBBHFCGDIC("CLANS/NO_MEMBERS"))
	arg_4_0.NoMembersLabel:SetAlpha(var_4_0 and 1 or 0)
	arg_4_0.NoMembersBacker:SetAlpha(var_4_0 and 0.5 or 0)
end

local function var_0_2(arg_5_0)
	arg_5_0.MemberGrid:SetNumChildren(0)
	arg_5_0.MemberGrid:RefreshContent()

	local var_5_0 = Clans2.GIDGAGEAC(arg_5_0._controllerIndex, arg_5_0._clanId)
	local var_5_1 = -1

	for iter_5_0 = 1, #var_5_0 do
		if var_5_0[iter_5_0].xuid == arg_5_0._xuid then
			var_5_1 = iter_5_0

			break
		end
	end

	if var_5_1 ~= -1 then
		table.remove(var_5_0, var_5_1)
	end

	arg_5_0._membersData = var_5_0

	var_0_1(arg_5_0, #arg_5_0._membersData)
	arg_5_0.MemberGrid:SetNumChildren(#arg_5_0._membersData)
	arg_5_0.MemberGrid:RefreshContent()
end

local function var_0_3(arg_6_0)
	if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_6_0._controllerIndex) then
		arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	else
		arg_6_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_primary"
		})
	end
end

local function var_0_4(arg_7_0)
	local var_7_0 = LUI.UIBindButton.new()

	var_7_0.id = "selfBindButton"

	arg_7_0:addElement(var_7_0)

	arg_7_0._bindButton = var_7_0

	arg_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_7_0._bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		ACTIONS.LeaveMenu(arg_7_0)
	end)
	arg_7_0:addAndCallEventHandler("update_input_type", arg_7_0.UpdateInputType, {
		controllerIndex = arg_7_0._controllerIndex
	})
end

local function var_0_5(arg_9_0, arg_9_1, arg_9_2)
	assert(arg_9_2.clanId and arg_9_2.viewerMemberRole)

	arg_9_0.UpdateInputType = var_0_3
	arg_9_0._controllerIndex = arg_9_1
	arg_9_0._clanId = arg_9_2.clanId
	arg_9_0._clanDetails = Clans2.GFFJCJFIJ(arg_9_1, arg_9_2.clanId)
	arg_9_0._memberRole = arg_9_2.viewerMemberRole
	arg_9_0._membersData = {}
	arg_9_0._xuid = Engine.EAGGAEGHHA(arg_9_1)

	arg_9_0.MemberGrid:SetSnapOnWrapEnabled(true)
	arg_9_0.MemberGrid:SetNumChildren(0)
	arg_9_0.MemberGrid:SetRefreshChild(function(arg_10_0, arg_10_1, arg_10_2)
		var_0_0(arg_9_0, arg_10_0, arg_10_1, arg_10_2)
	end)
	var_0_2(arg_9_0)
	var_0_4(arg_9_0)
	arg_9_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_OWNER_TRANSFERRED, function(arg_11_0, arg_11_1)
		ACTIONS.LeaveMenu(arg_9_0)
	end)
	arg_9_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CLANS/TRANSFER_OWNERSHIP"))
	ACTIONS.ScaleStretchAnchorFullscreen(arg_9_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_9_0, arg_9_1, {
		addScreenDarkener = true,
		addWorldBlur = true
	})
end

function ClanTransferOwnerMenu(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIVerticalNavigator.new()

	var_12_0.id = "ClanTransferOwnerMenu"

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	var_12_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_12_1
	})
	var_12_0.HelperBar.id = "HelperBar"

	var_12_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_12_0.HelperBar:setPriority(10)
	var_12_0:addElement(var_12_0.HelperBar)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "NoMembersBacker"

	var_12_4:SetAlpha(0, 0)
	var_12_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 722, _1080p * 584, _1080p * 684)
	var_12_0:addElement(var_12_4)

	var_12_0.NoMembersBacker = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIText.new()

	var_12_6.id = "NoMembersLabel"

	var_12_6:SetAlpha(0, 0)
	var_12_6:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_FRIENDS"), 0)
	var_12_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_6:SetAlignment(LUI.Alignment.Center)
	var_12_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_12_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 216, _1080p * 716, _1080p * 616, _1080p * 652)
	var_12_0:addElement(var_12_6)

	var_12_0.NoMembersLabel = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIText.new()

	var_12_8.id = "MemberListHeader"

	var_12_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_FLYOUT_MEMBER_LIST")), 0)
	var_12_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_8:SetAlignment(LUI.Alignment.Left)
	var_12_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -754, _1080p * -254, _1080p * 185, _1080p * 235)
	var_12_0:addElement(var_12_8)

	var_12_0.MemberListHeader = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIText.new()

	var_12_10.id = "MemberListDesc"

	var_12_10:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TRANSFER_LEADER_INFO"), 0)
	var_12_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_10:SetAlignment(LUI.Alignment.Left)
	var_12_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -754, _1080p * -130, _1080p * 242, _1080p * 266)
	var_12_0:addElement(var_12_10)

	var_12_0.MemberListDesc = var_12_10

	local var_12_11
	local var_12_12 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 9,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_12_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SocialFriendCard", {
				controllerIndex = var_12_1
			})
		end,
		refreshChild = function(arg_14_0, arg_14_1, arg_14_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 510,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_12_13 = LUI.UIGrid.new(var_12_12)

	var_12_13.id = "MemberGrid"

	var_12_13:setUseStencil(true)
	var_12_13:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -754, _1080p * -164, _1080p * 272, _1080p * 995)
	var_12_0:addElement(var_12_13)

	var_12_0.MemberGrid = var_12_13

	local var_12_14
	local var_12_15 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_12_1
	})

	var_12_15.id = "VerticalScrollbar"

	var_12_15:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -244, _1080p * -233, _1080p * 272, _1080p * 995)
	var_12_0:addElement(var_12_15)

	var_12_0.VerticalScrollbar = var_12_15

	local var_12_16
	local var_12_17 = LUI.UIText.new()

	var_12_17.id = "TransferOwnerDescHeader"

	var_12_17:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TRANSFER_OWNERSHIP")), 0)
	var_12_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_17:SetAlignment(LUI.Alignment.Left)
	var_12_17:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -56, _1080p * 444, _1080p * 247, _1080p * 297)
	var_12_0:addElement(var_12_17)

	var_12_0.TransferOwnerDescHeader = var_12_17

	local var_12_18
	local var_12_19 = MenuBuilder.BuildRegisteredType("ClanTransferOwnershipDescWidget", {
		controllerIndex = var_12_1
	})

	var_12_19.id = "ClanTransferOwnershipDesc"

	var_12_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 904, _1080p * 1807, _1080p * 328, _1080p * 752)
	var_12_0:addElement(var_12_19)

	var_12_0.ClanTransferOwnershipDesc = var_12_19

	local var_12_20
	local var_12_21 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_12_1
	})

	var_12_21.id = "TabBacker"

	var_12_21:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_12_0:addElement(var_12_21)

	var_12_0.TabBacker = var_12_21

	local var_12_22
	local var_12_23 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_12_1
	})

	var_12_23.id = "MenuTitle"

	var_12_23.MenuTitle:setText(ToUpperCase(""), 0)
	var_12_23.Line:SetLeft(0, 0)
	var_12_23:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_12_0:addElement(var_12_23)

	var_12_0.MenuTitle = var_12_23

	local var_12_24

	if CONDITIONS.InFrontend() then
		local var_12_25 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_12_1
		})

		var_12_25.id = "LobbyMembersFooter"

		var_12_25:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_12_0:addElement(var_12_25)

		var_12_0.LobbyMembersFooter = var_12_25
	end

	local var_12_26

	if CONDITIONS.IsUserSignedInDemonware(var_12_1) then
		local var_12_27 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_12_1
		})

		var_12_27.id = "PlayerDetailsMP"

		var_12_27:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_12_0:addElement(var_12_27)

		var_12_0.PlayerDetailsMP = var_12_27
	end

	local var_12_28 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_12_15,
		startCap = var_12_15.startCap,
		endCap = var_12_15.endCap,
		sliderArea = var_12_15.sliderArea,
		slider = var_12_15.sliderArea and var_12_15.sliderArea.slider,
		fixedSizeSlider = var_12_15.sliderArea and var_12_15.sliderArea.fixedSizeSlider
	})

	var_12_13:AddScrollbar(var_12_28)
	var_0_5(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("ClanTransferOwnerMenu", ClanTransferOwnerMenu)
LockTable(_M)
