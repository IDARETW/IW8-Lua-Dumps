module(..., package.seeall)

local var_0_0 = 8

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_1.controllerIndex = arg_1_0._controllerIndex
	arg_1_1.memberRole = Clans2.CFDHGBFICH(arg_1_0._controllerIndex, arg_1_0._clanId, arg_1_1.xuid)
	arg_1_1.viewerMemberRole = arg_1_0._memberRole
	arg_1_1.clanId = arg_1_0._clanId
	arg_1_1.clanDetails = arg_1_0._clanData

	return arg_1_1
end

local function var_0_2(arg_2_0)
	local var_2_0 = arg_2_0._clanData and arg_2_0._clanData.numClanMembersOnline or 0
	local var_2_1 = arg_2_0._clanData and arg_2_0._clanData.numClanMembers or 1

	arg_2_0.ClanMemberListOnlineWidget:SetMembersOnlineCount(var_2_0, var_2_1)
end

local function var_0_3(arg_3_0)
	arg_3_0._clanMembers = Clans2.GIDGAGEAC(arg_3_0._controllerIndex, arg_3_0._clanId, CLANS.CLAN_MEMBERS_FILTER.ALL)

	local var_3_0 = #arg_3_0._clanMembers < var_0_0 and #arg_3_0._clanMembers or var_0_0

	arg_3_0.PlayerGrid:SetNumChildren(var_3_0)
	arg_3_0.PlayerGrid:RefreshContent()
end

local function var_0_4(arg_4_0, arg_4_1)
	arg_4_0._clanData = arg_4_1

	var_0_2(arg_4_0)
	var_0_3(arg_4_0)
	arg_4_0.ClanProgressionWidget:SetClanProgression(arg_4_0._controllerIndex)
end

local function var_0_5(arg_5_0)
	arg_5_0.PlayerGrid:SetNumChildren(0)
	arg_5_0.PlayerGrid:SetRefreshChild(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_5_0._clanMembers then
			local var_6_0 = var_0_1(arg_5_0, arg_5_0._clanMembers[arg_6_2 + 1])

			arg_6_0:SetCurrentLocation(FRIENDS.TabIDs.CLANS, CLANS.CLAN_TAB_IDs.MEMBERS)
			arg_6_0:SetupPlayerData(FRIENDS.UnifyPlayerDataFormat(var_6_0))
		end
	end)
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0._controllerIndex = arg_7_1
	arg_7_0._clanId = arg_7_2.clanID
	arg_7_0._clanMembers = {}
	arg_7_0._mouseFocusRefcount = 0
	arg_7_0.RefreshClanData = var_0_4

	var_0_5(arg_7_0)
end

function ClanMembersDetails(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_8_0.id = "ClanMembersDetails"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3

	if CONDITIONS.AlwaysFalse() then
		local var_8_4 = LUI.UIImage.new()

		var_8_4.id = "DebugBackground"

		var_8_4:SetRGBFromInt(16711896, 0)
		var_8_4:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -1364, _1080p * -96, _1080p * 160, _1080p * -69)
		var_8_0:addElement(var_8_4)

		var_8_0.DebugBackground = var_8_4
	end

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("ClanProgressionWidget", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "ClanProgressionWidget"

	var_8_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -616, _1080p * -96, _1080p * 170, _1080p * 270)
	var_8_0:addElement(var_8_6)

	var_8_0.ClanProgressionWidget = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("ClanMemberListOnlineWidget", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "ClanMemberListOnlineWidget"

	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 590, _1080p * 1110, _1080p * 270, _1080p * 320)
	var_8_0:addElement(var_8_8)

	var_8_0.ClanMemberListOnlineWidget = var_8_8

	local var_8_9
	local var_8_10 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 8,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		controllerIndex = var_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SocialFriendCard", {
				controllerIndex = var_8_1
			})
		end,
		refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 510,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_11 = LUI.UIGrid.new(var_8_10)

	var_8_11.id = "PlayerGrid"

	var_8_11:setUseStencil(true)
	var_8_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 590, _1080p * 1110, _1080p * 325, _1080p * 981)
	var_8_0:addElement(var_8_11)

	var_8_0.PlayerGrid = var_8_11

	local var_8_12
	local var_8_13 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_8_1
	})

	var_8_13.id = "VerticalScrollbar"

	var_8_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1110, _1080p * 1122, _1080p * 328, _1080p * 990)
	var_8_0:addElement(var_8_13)

	var_8_0.VerticalScrollbar = var_8_13

	local var_8_14 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_8_13,
		startCap = var_8_13.startCap,
		endCap = var_8_13.endCap,
		sliderArea = var_8_13.sliderArea,
		slider = var_8_13.sliderArea and var_8_13.sliderArea.slider,
		fixedSizeSlider = var_8_13.sliderArea and var_8_13.sliderArea.fixedSizeSlider
	})

	var_8_11:AddScrollbar(var_8_14)
	var_0_6(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("ClanMembersDetails", ClanMembersDetails)
LockTable(_M)
