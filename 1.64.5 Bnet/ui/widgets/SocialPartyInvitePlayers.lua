module(..., package.seeall)

local var_0_0

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0:Wait(1000).onComplete = function()
		return var_0_1(arg_1_0, arg_1_1)
	end

	if Engine.BAHIIBFDDG() or Engine.BEFACAIFDD() then
		Engine.DAGFFDGFII("friends_refresh", arg_1_1)
	end

	FRIENDS.RefreshData(FRIENDS.TabIDs.ONLINE_FRIENDS, arg_1_0.GridWrapper.FriendsListGrid, arg_1_1)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_0.GridWrapper.FriendsListGrid

	local function var_3_1(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_4_1 + math.floor((arg_4_2 - arg_4_1) / 2)
		local var_4_1 = math.floor(arg_4_0.cachedFriends / 2)
		local var_4_2 = var_4_0 + 1 - var_4_1
		local var_4_3 = var_4_0 + var_4_1

		arg_4_0.getFriendFrom = var_4_2 > 0 and var_4_2 or 0

		if arg_4_0.friendsCount == 0 then
			arg_4_0.getFriendTo = 0
		else
			arg_4_0.getFriendTo = var_4_3 < arg_4_0.friendsCount - 1 and var_4_3 or arg_4_0.friendsCount - 1
		end

		FRIENDS.RefreshData(FRIENDS.TabIDs.ONLINE_FRIENDS, var_3_0, arg_3_1)
	end

	FRIENDS.InitExpandersData(var_3_0, var_3_1)
	var_0_1(arg_3_0, arg_3_1)
	arg_3_0:addEventHandler("send_friend_request_complete", function(arg_5_0, arg_5_1)
		FRIENDS.RefreshData(FRIENDS.TabIDs.ONLINE_FRIENDS, var_3_0, arg_3_1)
	end)
	arg_3_0:addEventHandler("remove_friend_complete", function(arg_6_0, arg_6_1)
		FRIENDS.RefreshData(FRIENDS.TabIDs.ONLINE_FRIENDS, var_3_0, arg_3_1)
	end)
end

function SocialPartyInvitePlayers(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 825 * _1080p, 0, 1080 * _1080p)

	var_7_0.id = "SocialPartyInvitePlayers"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("SocialMenuFriendsGrid", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "GridWrapper"

	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 671, _1080p * 240, _1080p * 860)
	var_7_0:addElement(var_7_4)

	var_7_0.GridWrapper = var_7_4

	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("SocialPartyInvitePlayers", SocialPartyInvitePlayers)
LockTable(_M)
