module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:dispatchEventToParent({
		name = "open_tab",
		controllerIndex = arg_1_1,
		tabID = FRIENDS.TabIDs.INBOX
	})
end

local function var_0_1(arg_2_0)
	return
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.JoinClanTileButton:UpdateClanInvites(arg_3_1)
end

local function var_0_3(arg_4_0, arg_4_1)
	if CONDITIONS.IsClanSearchDisabled() then
		var_0_0(arg_4_0, arg_4_1)
	else
		var_0_1(arg_4_0)
	end
end

local function var_0_4(arg_5_0)
	local var_5_0 = {}

	LUI.FlowManager.RequestAddMenu("CreateClanP_1", true, arg_5_0, false, var_5_0, true)
end

local function var_0_5(arg_6_0)
	if arg_6_0.JoinClanTileButton:IsDisabled() then
		arg_6_0.JoinClanTileButton:HandleButtonDisabled()
	else
		arg_6_0.JoinClanTileButton:HandleButtonEnabled()
	end
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.JoinClanTileButton:SetButtonDisabled(not arg_7_2.isInboxTabEnabled)
	arg_7_0.JoinClanTileButton:SetInviteLabelDisabled(false)
	arg_7_0.JoinClanTileButton:UpdateClanInvites(arg_7_1)
end

local function var_0_7(arg_8_0, arg_8_1)
	arg_8_0:addEventHandler(CLANS.CLAN_EVENTS.NOTIFICATION, function(arg_9_0, arg_9_1)
		if (arg_9_1.options and arg_9_1.options.genEventName or "") == CLANS.CLAN_EVENTS.INVITE_RECEIVED then
			var_0_2(arg_8_0, arg_8_1)
		end
	end)
	arg_8_0.JoinClanTileButton:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		var_0_3(arg_8_0, arg_8_1)
	end)
	arg_8_0.JoinClanTileButton:addEventHandler("lose_focus", function(arg_11_0, arg_11_1)
		var_0_5(arg_8_0)
	end)
	arg_8_0.CreateClanTileButton:addEventHandler("button_action", function(arg_12_0, arg_12_1)
		var_0_4(arg_8_1)
	end)
end

local function var_0_8(arg_13_0)
	(arg_13_0.JoinClanTileButton:IsDisabled() and arg_13_0.CreateClanTileButton or arg_13_0.JoinClanTileButton):processEvent({
		name = "gain_focus"
	})
end

local function var_0_9(arg_14_0, arg_14_1, arg_14_2)
	var_0_6(arg_14_0, arg_14_1, arg_14_2)
	var_0_7(arg_14_0, arg_14_1)
	var_0_8(arg_14_0)
end

function ClanEnlist(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIHorizontalNavigator.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_15_0.id = "ClanEnlist"

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = MenuBuilder.BuildRegisteredType("ClanTileButton", {
		controllerIndex = var_15_1
	})

	var_15_4.id = "JoinClanTileButton"

	var_15_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/JOIN_A_CLAN_DESC"), 0)
	var_15_4.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/JOIN_A_CLAN"), 0)
	var_15_4:SetAnchorsAndPosition(0, 0.5, 0, 0, 0, 0, _1080p * 160, _1080p * -69)
	var_15_0:addElement(var_15_4)

	var_15_0.JoinClanTileButton = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("ClanTileButton", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "CreateClanTileButton"

	var_15_6.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/CREATE_A_CLAN_DESC"), 0)
	var_15_6.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/CREATE_A_CLAN"), 0)
	var_15_6:SetAnchorsAndPosition(0.5, 0, 0, 0, 0, 0, _1080p * 160, _1080p * -69)
	var_15_0:addElement(var_15_6)

	var_15_0.CreateClanTileButton = var_15_6

	var_0_9(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("ClanEnlist", ClanEnlist)
LockTable(_M)
