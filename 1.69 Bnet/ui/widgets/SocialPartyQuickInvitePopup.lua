module(..., package.seeall)

local function var_0_0(arg_1_0)
	if Engine.BAHIIBFDDG() or Engine.BEFACAIFDD() then
		Engine.DAGFFDGFII("friends_refresh", arg_1_0._controllerIndex)
	end

	arg_1_0._playerGrid._friendsData = Friends.FBFFEFEGB(arg_1_0._controllerIndex, arg_1_0._playerGrid.getFriendFrom, arg_1_0._playerGrid.getFriendTo, arg_1_0._playerGrid.friendsCount, true, arg_1_0._showOfflineFriends)

	if arg_1_0._playerGrid._friendsData.friends then
		for iter_1_0, iter_1_1 in pairs(arg_1_0._playerGrid._friendsData.friends) do
			local var_1_0 = FRIENDS.FriendTypeToTabIDs[iter_1_1.friendsListType]
			local var_1_1 = Friends.CAIJHBHGGC(iter_1_1.xuid)
			local var_1_2 = Invitation.DCDABCADAF(arg_1_0._controllerIndex, var_1_1, iter_1_1.platformId, var_1_0)

			iter_1_1.locked = var_1_2 and var_1_2.disabled
		end
	end

	FRIENDS.UpdatePlayerRequestData(arg_1_0._playerGrid, false, FRIENDS.TabIDs.FRIENDS, arg_1_0._controllerIndex)

	local var_1_3 = arg_1_0._playerGrid.getFriendFrom

	arg_1_0.SocialPopupLayout:SetupPlayerGrid(arg_1_0._playerGrid._friendsData.friends or {}, var_1_3)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SocialPopupLayout:SetMenuLocation(FRIENDS.TabIDs.PRIVATE_PARTY, FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS)
	arg_2_0.SocialPopupLayout:SetMenuTitle(Engine.CBBHFCGDIC("LUA_MENU/QUICK_INVITE"))
	arg_2_0.SocialPopupLayout.NoPlayersLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/ EMPTY"))

	arg_2_0._controllerIndex = arg_2_1
	arg_2_0._playerGrid = arg_2_0.SocialPopupLayout.PlayersGrid

	FRIENDS.InitPlayerRequestData(arg_2_0.SocialPopupLayout.PlayersGrid, FRIENDS.SOCIAL_MENU_CACHED_FRIENDS)

	local function var_2_0()
		local var_3_0 = math.floor(FRIENDS.SOCIAL_MENU_CACHED_FRIENDS / 2)
		local var_3_1 = arg_2_0._playerGrid:GetFocusPositionIndex({
			clampContentIndexToDatasetLength = true
		})

		if not var_3_1 then
			return
		end

		arg_2_0._friendFrom = var_3_1 - 1 - var_3_0
		arg_2_0._friendTo = var_3_1 + var_3_0

		var_0_0(arg_2_0)
	end

	local var_2_1 = {
		_customScrolling = true,
		SetLinkedGridDataSource = function()
			return
		end,
		UpdateScrolling = var_2_0,
		LinkTo = function()
			return
		end
	}

	arg_2_0.SocialPopupLayout.PlayersGrid:AddScrollbar(var_2_1)

	local var_2_2 = LUI.UIBindButton.new()

	var_2_2.id = "bindButton"

	arg_2_0:addElement(var_2_2)

	arg_2_0.bindButton = var_2_2
	arg_2_0._showOfflineFriends = false

	arg_2_0.bindButton:addEventHandler("button_right_stick", function(arg_6_0, arg_6_1)
		arg_2_0._showOfflineFriends = not arg_2_0._showOfflineFriends

		Engine.BJDBIAGIDA(SOUND_SETS.default.action)
		var_0_0(arg_2_0)
	end)

	local var_2_3 = LUI.UITimer.new({
		interval = 1000,
		event = "update_quick_invite_friends"
	})

	var_2_3.id = "refreshFriendsTimer"

	arg_2_0:addElement(var_2_3)
	arg_2_0:addAndCallEventHandler("update_quick_invite_friends", var_0_0)
	arg_2_0:addEventHandler("send_friend_request_complete", var_0_0)
	arg_2_0:addEventHandler("remove_friend_complete", var_0_0)
end

function SocialPartyQuickInvitePopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_7_0.id = "SocialPartyQuickInvitePopup"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("SocialPopupLayout", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "SocialPopupLayout"

	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 825, 0, _1080p * 1080)
	var_7_0:addElement(var_7_4)

	var_7_0.SocialPopupLayout = var_7_4

	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("SocialPartyQuickInvitePopup", SocialPartyQuickInvitePopup)
LockTable(_M)
