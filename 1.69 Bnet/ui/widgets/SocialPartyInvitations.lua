module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_2:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 530, 0, _1080p * 38)
	LUI.AddGridOptimizedExpanderLogic(arg_1_2, arg_1_1, {
		numRows = 0,
		headerHeight = 38 * _1080p,
		footerHeight = 6 * _1080p,
		rowHeight = 50 * _1080p,
		rowSpacing = 2 * _1080p,
		buildFunction = function(arg_2_0)
			if arg_2_0 >= 0 then
				local var_2_0 = MenuBuilder.BuildRegisteredType("SocialPartyInvitation", {
					controllerIndex = arg_1_1
				})

				var_2_0.id = arg_1_2.id .. "_invite" .. arg_2_0

				var_2_0.InviterName:setText(arg_1_2._invitationList[arg_2_0 + 1].inviterName)
				var_2_0.TimeSent:setText(arg_1_2._invitationList[arg_2_0 + 1].timeSent)

				var_2_0._invitationID = arg_1_2._invitationList[arg_2_0 + 1].invitationID

				var_2_0:registerEventHandler("button_action", function(arg_3_0, arg_3_1)
					Invitation.DHACFECHAG(arg_3_0._invitationID)
				end)

				return var_2_0
			end
		end,
		refreshFunction = function(arg_4_0, arg_4_1)
			return
		end,
		expandButton = arg_1_2.Header,
		replaceDummyChildrenContainer = arg_1_2.DummyChildrenContainer
	})
end

local function var_0_1(arg_5_0, arg_5_1, arg_5_2)
	if Engine.HDGDBCJFG() then
		arg_5_0.NoInvitationsLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_ACTIVISION_PARTY_INVITATIONS"))
	end

	local var_5_0 = CONDITIONS.IsBattleNet()
	local var_5_1 = {
		scrollingThresholdX = 1,
		maxVisibleColumns = 1,
		wrapY = true,
		maxVelocity = 5000,
		buildArrowsLabel = true,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		springCoefficient = 5000,
		maxVisibleRows = var_5_0 and 2 or 1,
		controllerIndex = arg_5_1,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		scrollingThresholdPixelY = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_5_2 = LUI.UIGrid.new(var_5_1)

	var_5_2.id = "InvitationsGrid"

	var_5_2:setUseStencil(true)
	var_5_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 765, _1080p * 240, _1080p * 950)
	arg_5_0:addElement(var_5_2)

	arg_5_0.InvitationsGrid = var_5_2

	local var_5_3 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_5_0.VerticalScrollbar,
		startCap = arg_5_0.VerticalScrollbar.startCap,
		endCap = arg_5_0.VerticalScrollbar.endCap,
		sliderArea = arg_5_0.VerticalScrollbar.sliderArea,
		slider = arg_5_0.VerticalScrollbar.sliderArea and arg_5_0.VerticalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_5_0.VerticalScrollbar.sliderArea and arg_5_0.VerticalScrollbar.sliderArea.fixedSizeSlider
	})

	var_5_2:AddScrollbar(var_5_3)

	arg_5_0.activisionPartyInvitations = {}

	local function var_5_4(arg_6_0)
		if Dvar.IBEGCHEFE("SMKRLSNRT") and not arg_6_0.activisionExpander then
			arg_6_0.activisionExpander = MenuBuilder.BuildRegisteredType("HeaderOnlyExpander", {
				controllerIndex = arg_5_1
			})
			arg_6_0.activisionExpander.id = "activisionExpander"

			local var_6_0 = Engine.ECAJCAJJGF() and "LUA_MENU/FRIENDS_INGAME" or "LUA_MENU/FRIENDS_ACTIVISION"

			arg_6_0.activisionExpander.Header.Title:setText(Engine.CBBHFCGDIC(var_6_0))
			var_0_0(arg_6_0, arg_5_1, arg_6_0.activisionExpander)
			arg_6_0.InvitationsGrid:AddElement(arg_6_0.activisionExpander)
		end
	end

	if var_5_0 then
		arg_5_0.battlenetInvitations = {}
	end

	local function var_5_5(arg_7_0)
		if var_5_0 and not arg_7_0.battlenetExpander then
			arg_7_0.battlenetExpander = MenuBuilder.BuildRegisteredType("HeaderOnlyExpander", {
				controllerIndex = arg_5_1
			})
			arg_7_0.battlenetExpander.id = "battlenetExpander"

			arg_7_0.battlenetExpander.Header.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/FRIENDS_BATTLENET"))
			var_0_0(arg_7_0, arg_5_1, arg_7_0.battlenetExpander)
			arg_7_0.InvitationsGrid:AddElement(arg_7_0.battlenetExpander)
		end
	end

	local function var_5_6()
		if Dvar.IBEGCHEFE("SMKRLSNRT") then
			arg_5_0.activisionPartyInvitations = Social.DJBGBJIIF(FRIENDS.InvitationType.INVITE_DEMONWARE)

			if #arg_5_0.activisionPartyInvitations > 0 then
				var_5_4(arg_5_0)
				arg_5_0.NoInvitationsLabel:SetAlpha(0)
			elseif arg_5_0.activisionExpander then
				arg_5_0.activisionExpander:closeTree()

				arg_5_0.activisionExpander = nil

				arg_5_0.NoInvitationsLabel:SetAlpha(1)
			end

			if arg_5_0.activisionExpander then
				arg_5_0.activisionExpander:SetNumRows(#arg_5_0.activisionPartyInvitations)

				arg_5_0.activisionExpander._invitationList = arg_5_0.activisionPartyInvitations

				arg_5_0.activisionExpander:RefreshContent()
			end
		end

		if var_5_0 then
			arg_5_0.battlenetInvitations = Social.DJBGBJIIF(FRIENDS.InvitationType.INVITE_BATTLENET)

			if #arg_5_0.battlenetInvitations > 0 then
				var_5_5(arg_5_0)
				arg_5_0.NoInvitationsLabel:SetAlpha(0)
			elseif arg_5_0.battlenetExpander then
				arg_5_0.battlenetExpander:closeTree()

				arg_5_0.battlenetExpander = nil

				arg_5_0.NoInvitationsLabel:SetAlpha(1)
			end

			if arg_5_0.battlenetExpander then
				arg_5_0.battlenetExpander:SetNumRows(#arg_5_0.battlenetInvitations)

				arg_5_0.battlenetExpander._invitationList = arg_5_0.battlenetInvitations

				arg_5_0.battlenetExpander:RefreshContent()
			end
		end
	end

	var_5_6()
	arg_5_0:addEventHandler("refresh_party_invitations", function(arg_9_0, arg_9_1)
		var_5_6()
	end)

	if arg_5_0.activisionPartyInvitations and #arg_5_0.activisionPartyInvitations == 0 and (not arg_5_0.battlenetInvitations or not (#arg_5_0.battlenetInvitations > 0)) then
		Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
	end
end

function SocialPartyInvitations(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 825 * _1080p, 0, 1080 * _1080p)

	var_10_0.id = "SocialPartyInvitations"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIText.new()

	var_10_4.id = "NoInvitationsLabel"

	var_10_4:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_10_4:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_PARTY_INVITATIONS"), 0)
	var_10_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_4:SetAlignment(LUI.Alignment.Center)
	var_10_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 478, _1080p * 510)
	var_10_0:addElement(var_10_4)

	var_10_0.NoInvitationsLabel = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "VerticalScrollbar"

	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 107, _1080p * 120, _1080p * 240, _1080p * 950)
	var_10_0:addElement(var_10_6)

	var_10_0.VerticalScrollbar = var_10_6

	var_0_1(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("SocialPartyInvitations", SocialPartyInvitations)
LockTable(_M)
