module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.MenuLayout.PlayersGrid
end

local function var_0_1(arg_2_0)
	local var_2_0 = Clans2.CFDIIEAGHB(arg_2_0._controllerIndex)

	return Engine.CBBHFCGDIC("INBOX/CLAN_INVITES_HEADER", var_2_0)
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1.options

	if var_3_0.success then
		local var_3_1 = var_3_0.genEventName
		local var_3_2 = var_3_1 == CLANS.CLAN_EVENTS.INVITE_RECEIVED
		local var_3_3 = var_3_1 == CLANS.CLAN_EVENTS.INVITE_ACCEPTED
		local var_3_4 = var_3_1 == CLANS.CLAN_EVENTS.INVITE_CANCELED

		if var_3_2 or var_3_3 or var_3_4 then
			FRIENDS.SetPlayerGridHeader(arg_3_0.MenuLayout, var_0_1(arg_3_0), nil, true)
		end
	end
end

local function var_0_3(arg_4_0)
	arg_4_0.MenuLayout.InviteButton:SetAlpha(0)
	arg_4_0.MenuLayout:SetRefreshChildFuncByTab(FRIENDS.TabIDs.INBOX)
	arg_4_0.MenuLayout:UpdateNoFriends(0, 0, FRIENDS.TabIDs.INBOX)
	arg_4_0.MenuLayout.NoFriendsLabel:setText(Engine.CBBHFCGDIC("INBOX/INBOX_EMPTY"))
	arg_4_0.MenuLayout:SetPlayerGridWrapping(nil, false)
	FRIENDS.SetPlayerGridHeader(arg_4_0.MenuLayout, var_0_1(arg_4_0), nil, true)
end

local function var_0_4(arg_5_0)
	arg_5_0:addEventHandler(CLANS.CLAN_EVENTS.NOTIFICATION, function(arg_6_0, arg_6_1)
		var_0_2(arg_5_0, arg_6_1)
	end)
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0._controllerIndex = arg_7_1
	arg_7_0.GetPlayerGrid = var_0_0

	var_0_3(arg_7_0)
	var_0_4(arg_7_0)
end

function SocialInboxMenu(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0.id = "SocialInboxMenu"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("SocialMenuLayout", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "MenuLayout"

	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_8_0:addElement(var_8_4)

	var_8_0.MenuLayout = var_8_4

	var_0_5(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("SocialInboxMenu", SocialInboxMenu)
LockTable(_M)
