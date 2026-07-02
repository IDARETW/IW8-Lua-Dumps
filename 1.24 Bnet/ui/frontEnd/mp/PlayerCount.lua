module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0._controllerIndex

	if arg_1_0._partyCountSubscription then
		arg_1_0:UnsubscribeFromModel(arg_1_0._partyCountSubscription)
	end

	if arg_1_0._maxPartyCountSubscription then
		arg_1_0:UnsubscribeFromModel(arg_1_0._maxPartyCountSubscription)
	end

	local function var_1_1()
		local var_2_0 = arg_1_1:GetValue(var_1_0) or 0
		local var_2_1 = arg_1_2:GetValue(var_1_0) or 0
		local var_2_2 = Engine.CBBHFCGDIC("LUA_MENU/PARTY_COUNT_NUMBERS", var_2_0, var_2_1)

		arg_1_0.CountText:setText(var_2_2)
	end

	arg_1_0._partyCountSubscription = arg_1_0:SubscribeToModel(arg_1_1:GetModel(var_1_0), var_1_1)
	arg_1_0._maxPartyCountSubscription = arg_1_0:SubscribeToModel(arg_1_2:GetModel(var_1_0), var_1_1)
end

local function var_0_1(arg_3_0)
	local function var_3_0(arg_4_0)
		local var_4_0 = Friends.FBFFEFEGB(arg_4_0._controllerIndex, 0, 0, false, false)

		arg_4_0.TotalOnlineText:setText(var_4_0.onlineCount)
	end

	arg_3_0.onlineFriendsCountTimer = LUI.UITimer.new({
		interval = 15000,
		event = "update_online_friends_count"
	})
	arg_3_0.onlineFriendsCountTimer.id = "onlineFriendsCountTimer"

	arg_3_0:addElement(arg_3_0.onlineFriendsCountTimer)
	arg_3_0:registerAndCallEventHandler("update_online_friends_count", var_3_0)
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetDataSources = var_0_0
	arg_5_0._controllerIndex = arg_5_1

	var_0_1(arg_5_0)
end

function PlayerCount(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 298 * _1080p, 0, 28 * _1080p)

	var_6_0.id = "PlayerCount"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Icon"

	var_6_4:SetRGBFromTable(SWATCHES.Lobby.Header2, 0)
	var_6_4:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 10, _1080p * 32, _1080p * -11, _1080p * 11)
	var_6_0:addElement(var_6_4)

	var_6_0.Icon = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIStyledText.new()

	var_6_6.id = "CountText"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_6:SetShadowRGBFromInt(0, 0)
	var_6_6:SetOutlineRGBFromInt(0, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 36, _1080p * 106, _1080p * 3, _1080p * -3)
	var_6_0:addElement(var_6_6)

	var_6_0.CountText = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "TotalOnlineIcon"

	var_6_8:SetRGBFromTable(SWATCHES.Lobby.Header2, 0)
	var_6_8:setImage(RegisterMaterial("icon_playlist_players"), 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 122, _1080p * 144, _1080p * -11, _1080p * 11)
	var_6_0:addElement(var_6_8)

	var_6_0.TotalOnlineIcon = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIStyledText.new()

	var_6_10.id = "TotalOnlineText"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_10:setText("", 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Left)
	var_6_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_10:SetShadowRGBFromInt(0, 0)
	var_6_10:SetOutlineRGBFromInt(0, 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 146, _1080p * 198, _1080p * 3, _1080p * -3)
	var_6_0:addElement(var_6_10)

	var_6_0.TotalOnlineText = var_6_10

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("PlayerCount", PlayerCount)
LockTable(_M)
