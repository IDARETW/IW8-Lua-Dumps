module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0._isClanAdmin and "CLANS/BANNED_MEMBER_LIST_ADMIN_DESC" or "CLANS/BANNED_MEMBER_LIST_DESC"

	arg_1_0.Description:setText(Engine.CBBHFCGDIC(var_1_0))
end

local function var_0_1(arg_2_0)
	if arg_2_0.ButtonHelperBar then
		local var_2_0 = arg_2_0._isClanAdmin and "CLANS/MANAGE_BAN" or "LUA_MENU/SELECT"

		arg_2_0.ButtonHelperBar:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC(var_2_0)
		})
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0._bannedMembersData)

	arg_3_0._bannedMembersData = Clans2.BBCCCBDAGJ(arg_3_1, arg_3_0._clanId)

	local var_3_0 = #arg_3_0._bannedMembersData
	local var_3_1 = var_3_0 > 0 and "BannedMembers" or "NoBannedMembers"

	ACTIONS.AnimateSequence(arg_3_0, var_3_1)
	arg_3_0.BannedMemberGrid:SetNumChildren(var_3_0)
	arg_3_0.BannedMemberGrid:RefreshContent()
	var_0_1(arg_3_0)
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0._isClanAdmin = CLANS.CanLocalClientManageBans(arg_4_1)

	var_0_0(arg_4_0)
	var_0_1(arg_4_0)
end

local function var_0_4(arg_5_0)
	arg_5_0.BannedMemberGrid:SetNumChildren(0)
	arg_5_0.BannedMemberGrid:SetRefreshChild(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_5_0._bannedMembersData then
			local var_6_0 = arg_5_0._bannedMembersData[arg_6_2 + 1]

			arg_6_0:SetCurrentLocation(FRIENDS.TabIDs.CLANS, CLANS.CLAN_TAB_IDs.BANNED_PlAYERS)
			arg_6_0:SetupPlayerData(FRIENDS.UnifyPlayerDataFormat(var_6_0))
		end
	end)
end

local function var_0_5(arg_7_0, arg_7_1)
	arg_7_0.ButtonHelperBar = arg_7_1

	var_0_1(arg_7_0)
end

local function var_0_6(arg_8_0)
	arg_8_0:addEventHandler(CLANS.CLAN_EVENTS.NOTIFICATION, function(arg_9_0, arg_9_1)
		if arg_9_1.genEventName == CLANS.CLAN_EVENTS.DEMOTED_TO_OFFICER then
			var_0_3(arg_8_0, arg_9_1.controller)
		end

		local var_9_0 = arg_9_1.genEventName == CLANS.CLAN_EVENTS.MEMBER_BANNED
		local var_9_1 = arg_9_1.genEventName == CLANS.CLAN_EVENTS.MEMBER_UNBANNED
		local var_9_2 = arg_9_1.genEventName == CLANS.CLAN_EVENTS.MEMBER_ADDED
		local var_9_3 = arg_9_1.genEventName == CLANS.CLAN_EVENTS.MEMBER_REMOVED

		if var_9_0 or var_9_1 or var_9_2 or var_9_3 then
			var_0_0(arg_8_0)
			var_0_2(arg_8_0, arg_9_1.controller)
		end
	end)
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.SetupButtonHelperBar = var_0_5
	arg_10_0._bannedMembersData = {}
	arg_10_0._clanId = arg_10_2.clanId or CLANS.MOCK_CLAN_DATA.clanId
	arg_10_0._isClanAdmin = CLANS.CanLocalClientManageBans(arg_10_1, {
		clanId = arg_10_0._clanId
	})

	var_0_6(arg_10_0)
	var_0_4(arg_10_0)
	var_0_0(arg_10_0)
	var_0_2(arg_10_0, arg_10_1)
	arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CLANS/BANNED_PLAYERS"))
end

function ClanBannedMemberListPopup(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 825 * _1080p, 0, 1080 * _1080p)

	var_11_0.id = "ClanBannedMemberListPopup"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIStyledText.new()

	var_11_4.id = "Description"

	var_11_4:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_11_4:setText(Engine.CBBHFCGDIC("CLANS/BANNED_MEMBER_LIST_DESC"), 0)
	var_11_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_4:SetAlignment(LUI.Alignment.Left)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 153, _1080p * 685, _1080p * 116, _1080p * 140)
	var_11_0:addElement(var_11_4)

	var_11_0.Description = var_11_4

	local var_11_5
	local var_11_6 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 9,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SocialFriendCard", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 510,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_7 = LUI.UIGrid.new(var_11_6)

	var_11_7.id = "BannedMemberGrid"

	var_11_7:setUseStencil(true)
	var_11_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 146, _1080p * 656, _1080p * 175, _1080p * 941)
	var_11_0:addElement(var_11_7)

	var_11_0.BannedMemberGrid = var_11_7

	local var_11_8
	local var_11_9 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_11_1
	})

	var_11_9.id = "VerticalScrollbar"

	var_11_9:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -169, _1080p * -147, _1080p * 178, _1080p * 940)
	var_11_0:addElement(var_11_9)

	var_11_0.VerticalScrollbar = var_11_9

	local var_11_10
	local var_11_11 = LUI.UIStyledText.new()

	var_11_11.id = "NoBannedMembersLabel"

	var_11_11:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_11_11:setText(Engine.CBBHFCGDIC("CLANS/BANNED_MEMBER_LIST_EMPTY"), 0)
	var_11_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_11:SetAlignment(LUI.Alignment.Left)
	var_11_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 146, _1080p * 678, _1080p * 525, _1080p * 555)
	var_11_0:addElement(var_11_11)

	var_11_0.NoBannedMembersLabel = var_11_11

	local var_11_12
	local var_11_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_13.id = "MenuTitle"

	var_11_13.MenuTitle:setText("", 0)
	var_11_13.Line:SetLeft(0, 0)
	var_11_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_11_0:addElement(var_11_13)

	var_11_0.MenuTitle = var_11_13

	local function var_11_14()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_14

	local var_11_15
	local var_11_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("NoBannedMembers", var_11_16)

	local var_11_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_9:RegisterAnimationSequence("NoBannedMembers", var_11_17)

	local var_11_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_11:RegisterAnimationSequence("NoBannedMembers", var_11_18)

	local function var_11_19()
		var_11_7:AnimateSequence("NoBannedMembers")
		var_11_9:AnimateSequence("NoBannedMembers")
		var_11_11:AnimateSequence("NoBannedMembers")
	end

	var_11_0._sequences.NoBannedMembers = var_11_19

	local var_11_20
	local var_11_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_7:RegisterAnimationSequence("BannedMembers", var_11_21)

	local var_11_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 656
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 678
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 940
		}
	}

	var_11_9:RegisterAnimationSequence("BannedMembers", var_11_22)

	local var_11_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_11:RegisterAnimationSequence("BannedMembers", var_11_23)

	local function var_11_24()
		var_11_7:AnimateSequence("BannedMembers")
		var_11_9:AnimateSequence("BannedMembers")
		var_11_11:AnimateSequence("BannedMembers")
	end

	var_11_0._sequences.BannedMembers = var_11_24

	local var_11_25 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_11_9,
		startCap = var_11_9.startCap,
		endCap = var_11_9.endCap,
		sliderArea = var_11_9.sliderArea,
		slider = var_11_9.sliderArea and var_11_9.sliderArea.slider,
		fixedSizeSlider = var_11_9.sliderArea and var_11_9.sliderArea.fixedSizeSlider
	})

	var_11_7:AddScrollbar(var_11_25)
	var_0_7(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("ClanBannedMemberListPopup", ClanBannedMemberListPopup)
LockTable(_M)
