FRIENDS = FRIENDS or {}
FRIENDS.maxMetFriends = 200
FRIENDS.maxNameLength = 36
FRIENDS.SOCIAL_MENU_CACHED_FAVORITE_FRIENDS = 16
FRIENDS.SOCIAL_MENU_CACHED_ONLINE_FRIENDS = 20
FRIENDS.SOCIAL_MENU_CACHED_RECENT_PLAYERS = 40
FRIENDS.SOCIAL_MENU_CACHED_FRIENDS = 40
FRIENDS.MAX_FAVORITE_FRIENDS = 16
FRIENDS.CLANS_MAX_JOINED_CLANS = 10
FRIENDS.CLANS_MAX_MEMBERS = 250
FRIENDS.CLANS_CLANTAG_LENGTH = 5
FRIENDS.CLANS_MAX_NAME_LENGTH = 28
FRIENDS.MAX_DIGITS_IN_CLAN_NAME = 6
FRIENDS.Constants = {
	FriendButtonHeight = 90,
	reportCheatingLobbyPlayer = 6,
	reportOffensiveUGC = 12,
	reportOffensiveClanTag = 14,
	reportOffensiveLobbyPlayer = 4,
	reportExploitingLobbyPlayer = 5,
	reportBoostingLobbyPlayer = 7,
	scrollbarWidth = 14,
	reportOffensiveUsername = 13
}
FRIENDS.TabIDs = {
	RECENT_PLAYERS = 3,
	ONLINE_FRIENDS = 0,
	CROSSPLAY_FRIENDS = 4,
	FAVORITE_FRIENDS = 5,
	FRIENDS = 6,
	PRIVATE_PARTY = 1,
	REGIMENTS = 2
}
FRIENDS.ExpanderIDs = {
	CLAN = 3,
	FAVORITE = 0,
	ACTIVISION = 1,
	FIRST_PARTY = 2
}
FRIENDS.FriendsListType = {
	FAVORITE = 0,
	ACTIVISION = 1,
	FIRST_PARTY = 2
}
FRIENDS.FriendTypeToTabIDs = {
	[FRIENDS.FriendsListType.FAVORITE] = FRIENDS.TabIDs.FAVORITE_FRIENDS,
	[FRIENDS.FriendsListType.ACTIVISION] = FRIENDS.TabIDs.CROSSPLAY_FRIENDS,
	[FRIENDS.FriendsListType.FIRST_PARTY] = FRIENDS.TabIDs.ONLINE_FRIENDS
}
FRIENDS.InvitationType = {
	INVITE_NONE = 0,
	INVITE_DEMONWARE = 2,
	INVITE_BATTLENET = 1,
	INVITE_ALL = 3
}
FRIENDS.ManagePartyTabIDs = {
	KICK_PLAYERS = 2,
	INVITE_PLAYERS = 0,
	PARTY_INVITATIONS = 1
}
FRIENDS.ManageRegimentInvitesTabIDs = {
	REGIMENT_INVITATIONS = 2,
	INVITE_PLAYERS = 0,
	SENT_INVITES = 1
}
FRIENDS.ManageFriendsTabIDs = {
	BLOCKED_PLAYERS = 3,
	FRIEND_REQUESTS = 2,
	ADD_FRIENDS = 0,
	SENT_INVITES = 1
}
FRIENDS.ManageRegimentMembersTabIDs = {
	ADD_OFFICERS = 0,
	REMOVE_OFFICERS = 1,
	KICK_MEMBERS = 2
}
FRIENDS.RegimentPopupActions = {
	TRANSFER = 3,
	TRANSFERRED = 4,
	DELETED = 1,
	LEAVE = 5,
	CANNOT_DELETE = 2,
	LEFT = 6,
	DELETE = 0
}
FRIENDS.RegimentMembersFilter = {
	ALL = 0,
	OFFICERS_ONLY = 1,
	NO_OFFICERS = 2,
	EXCLUDE_OWNER = 4
}
FRIENDS.BnetStatusToColorMap = {
	[BattleNetOnlineStatus.INVALID] = SWATCHES.BattleNetChat.onlineStatusAppearOffline,
	[BattleNetOnlineStatus.ONLINE] = SWATCHES.BattleNetChat.onlineStatusAvailable,
	[BattleNetOnlineStatus.AWAY] = SWATCHES.BattleNetChat.onlineStatusAway,
	[BattleNetOnlineStatus.BUSY] = SWATCHES.BattleNetChat.onlineStatusBusy,
	[BattleNetOnlineStatus.APPEAR_OFFLINE] = SWATCHES.BattleNetChat.onlineStatusAppearOffline
}
FRIENDS.BnetStatusToIconNameMap = {
	[BattleNetOnlineStatus.INVALID] = "icon_bnet_offline",
	[BattleNetOnlineStatus.ONLINE] = "icon_bnet_available",
	[BattleNetOnlineStatus.AWAY] = "icon_bnet_away",
	[BattleNetOnlineStatus.BUSY] = "icon_bnet_busy",
	[BattleNetOnlineStatus.APPEAR_OFFLINE] = "icon_bnet_offline"
}
FRIENDS.onlineStatusToString = {
	[BattleNetOnlineStatus.INVALID] = "LUA_MENU/OFFLINE",
	[BattleNetOnlineStatus.ONLINE] = "MENU/SOCIAL_ONLINE",
	[BattleNetOnlineStatus.AWAY] = "MENU/SOCIAL_AWAY",
	[BattleNetOnlineStatus.BUSY] = "MENU/SOCIAL_BUSY",
	[BattleNetOnlineStatus.APPEAR_OFFLINE] = "LUA_MENU/OFFLINE"
}
FRIENDS.BattleNetGameInfo = {
	WoW = {
		icon = "icon_battle_net_world_of_warcraft",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_WOW"
	},
	S2 = {
		icon = "icon_battle_net_starcraft2",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_STARCRAFT2"
	},
	D3 = {
		icon = "icon_battle_net_diablo3",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_DIABLO3"
	},
	BN = {
		icon = "icon_battle_net_bnet",
		name = ""
	},
	App = {
		icon = "icon_battle_net_bnet",
		name = ""
	},
	WTCG = {
		icon = "icon_battle_net_hearthstone",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_HEARTHSTONE"
	},
	Pro = {
		icon = "icon_battle_net_overwatch",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_OVERWATCH"
	},
	Hero = {
		icon = "icon_battle_net_heros_of_the_storm",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_HOTS"
	},
	DST2 = {
		icon = "icon_battle_net_destiny",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_DESTINY2"
	},
	BSAp = {
		icon = "icon_battle_net_bnet",
		name = ""
	},
	S1 = {
		icon = "icon_battle_net_starcraft",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_STARCRAFT"
	},
	VIPR = {
		icon = "icon_battle_net_bo4",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_BO4"
	},
	LAZR = {
		icon = "icon_battle_net_mw2r",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_MW2R"
	},
	ODIN = {
		icon = "icon_battle_net_modern_warfare",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_MW"
	},
	W3 = {
		icon = "icon_battle_net_warcraft3",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_WARCRAFT3"
	}
}
FRIENDS.PlatformIcon = {
	[PresencePlatform.NONE] = "icon_social_friend_atvi",
	[PresencePlatform.XBOX_ONE] = "icon_platform_xbox",
	[PresencePlatform.PS4] = "icon_platform_playstation",
	[PresencePlatform.BNET] = "icon_platform_pc",
	[PresencePlatform.STEAM] = "icon_social_friend_atvi",
	[PresencePlatform.WEGAME] = "icon_social_friend_atvi"
}
FRIENDS.PlatformFriendText = {
	[PresencePlatform.NONE] = Engine.CBBHFCGDIC(""),
	[PresencePlatform.XBOX_ONE] = Engine.CBBHFCGDIC("LUA_MENU/XBOX_FRIEND"),
	[PresencePlatform.PS4] = Engine.CBBHFCGDIC("LUA_MENU/PLAYSTATION_FRIEND"),
	[PresencePlatform.BNET] = Engine.CBBHFCGDIC("LUA_MENU/BNET_FRIEND")
}
FRIENDS.AddFriendErrorCode = {
	NO_ERROR = 0,
	PENDING = 5,
	NOT_FIND = 2,
	GENERAL = 1,
	FRIEND_MAX = 6,
	ALREADY_FRIENDS = 4,
	BLOCKED = 3
}
FRIENDS.AcceptClanInviteErrorCode = {
	DOES_NOT_EXIST = 19724,
	MEMBER_BAN_EXISTS = 19731,
	GROUP_FULL = 19729,
	MEMBERSHIPS_REACHED = 19722
}
FRIENDS.ErrorCodeToDesc = {
	[FRIENDS.AddFriendErrorCode.NO_ERROR] = "LUA_MENU/REQUEST_SENT_FAILED",
	[FRIENDS.AddFriendErrorCode.GENERAL] = "LUA_MENU/REQUEST_SENT_FAILED",
	[FRIENDS.AddFriendErrorCode.NOT_FIND] = "LUA_MENU/PLAYER_NOT_EXIST",
	[FRIENDS.AddFriendErrorCode.BLOCKED] = "LUA_MENU/PLAYER_BLOCKED",
	[FRIENDS.AddFriendErrorCode.ALREADY_FRIENDS] = "LUA_MENU/PLAYER_ALREADY_FRIEND",
	[FRIENDS.AddFriendErrorCode.PENDING] = "LUA_MENU/FRIEND_REQUEST_PENDING",
	[FRIENDS.AddFriendErrorCode.FRIEND_MAX] = "LUA_MENU/FRIEND_AMOUNT_MAX",
	[FRIENDS.AcceptClanInviteErrorCode.MEMBERSHIPS_REACHED] = "REGIMENTS/MEMBERSHIPS_REACHED",
	[FRIENDS.AcceptClanInviteErrorCode.DOES_NOT_EXIST] = "REGIMENTS/DOES_NOT_EXIST",
	[FRIENDS.AcceptClanInviteErrorCode.GROUP_FULL] = "REGIMENTS/GROUP_FULL",
	[FRIENDS.AcceptClanInviteErrorCode.MEMBER_BAN_EXISTS] = "REGIMENTS/MEMBER_BAN_EXISTS"
}

function FRIENDS.AreWeHost(arg_1_0)
	local var_1_0 = false

	for iter_1_0 = 1, #arg_1_0 do
		if arg_1_0[iter_1_0].isMyPlayer and arg_1_0[iter_1_0].isPartyHost then
			var_1_0 = true

			break
		end
	end

	return var_1_0
end

local var_0_0 = {
	"joinGame",
	"sendInvite",
	"sendClanInvite",
	"kickClanMember",
	"whisper",
	"kickPlayer",
	"followPlayer",
	"moveUp",
	"moveDown",
	"assignAllies",
	"assignAxis",
	"separator",
	"mutePlayer",
	"viewProfile",
	"addToFavorites",
	"upgradeRealId",
	"removeFromFavorites",
	"friendRequest",
	"removeFriend",
	"reportPlayer",
	"blockPlayer",
	"acceptRequest",
	"declineRequest",
	"blockRequest"
}

local function var_0_1(arg_2_0)
	return Friends.CCBABDAGGJ(arg_2_0.controllerIndex, arg_2_0.xuidString or arg_2_0.xuid, arg_2_0.platformId or "0", arg_2_0.selectedTab).isValidEntry
end

local function var_0_2(arg_3_0)
	local var_3_0 = arg_3_0.xuidString or arg_3_0.xuid
	local var_3_1 = arg_3_0.platformId or "0"

	if arg_3_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS then
		return Friends.BIAJAECICH(arg_3_0.controllerIndex, var_3_0)
	else
		return Friends.DIIAFCGBDA(arg_3_0.controllerIndex, var_3_0, var_3_1)
	end
end

local function var_0_3(arg_4_0)
	return type(arg_4_0.xuid) == "userdata" and arg_4_0.xuid or Friends.CAIJHBHGGC(arg_4_0.xuidString or arg_4_0.xuid)
end

local function var_0_4(arg_5_0)
	local var_5_0 = arg_5_0.controllerIndex
	local var_5_1 = var_0_3(arg_5_0)
	local var_5_2 = arg_5_0.platformId
	local var_5_3 = arg_5_0.selectedTab
	local var_5_4 = {
		label = Engine.CBBHFCGDIC("MENU/JOIN_GAME")
	}

	var_5_4.id = "joinGame"
	var_5_4.refreshOnAction = true

	function var_5_4.disabledFunc()
		return not var_0_1(arg_5_0) or Invitation.ECGAJEGAIC(var_5_0, var_5_1, var_5_2, var_5_3)
	end

	function var_5_4.action()
		local function var_7_0()
			local var_8_0 = var_5_4.disabledFunc()

			if var_8_0 and not var_8_0.disabled then
				Friends.DACCIAAAAB(var_5_0, var_5_1, var_5_2)
			end
		end

		FRIENDS.TryJoinUserParty(var_7_0)
	end

	return var_5_4
end

local function var_0_5(arg_9_0)
	local var_9_0 = arg_9_0.controllerIndex
	local var_9_1 = var_0_3(arg_9_0)
	local var_9_2 = arg_9_0.platformId
	local var_9_3 = arg_9_0.selectedTab
	local var_9_4 = not Engine.DDJFBBJAIG()
	local var_9_5 = Engine.DAFGFCFHJI()
	local var_9_6 = {
		label = (var_9_4 or var_9_5) and Engine.CBBHFCGDIC("MENU/INVITE_TO_GAME") or Engine.CBBHFCGDIC("MENU/INVITE_TO_PARTY")
	}

	var_9_6.id = "sendInvite"
	var_9_6.refreshOnAction = true

	function var_9_6.disabledFunc()
		return not var_0_1(arg_9_0) or Invitation.DCDABCADAF(var_9_0, var_9_1, var_9_2, var_9_3)
	end

	function var_9_6.action()
		local var_11_0 = var_9_6.disabledFunc()

		if var_11_0 and not var_11_0.disabled then
			Invitation.DIDIHAJHGA(var_9_0, var_9_1, var_9_2)
		end
	end

	return var_9_6
end

function FRIENDS.IsClanInvitePending(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = Clans.BJJADIBFB(arg_12_0, arg_12_1)

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		if iter_12_1.xuid == arg_12_2 then
			return true
		end
	end

	return false
end

local function var_0_6(arg_13_0)
	local var_13_0

	if arg_13_0.xuidString then
		var_13_0 = arg_13_0.xuidString
	else
		var_13_0 = arg_13_0.xuid
	end

	local var_13_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/INVITE_TO_REGIMENT", Engine.JCBDICCAH(arg_13_0.clanName))
	}

	var_13_1.id = "sendClanInvite"
	var_13_1.refreshOnAction = true

	function var_13_1.disabledFunc()
		local var_14_0 = {}
		local var_14_1 = Clans.CHEADIHHBJ(arg_13_0.controllerIndex, arg_13_0.clanID, var_13_0).memberFound
		local var_14_2 = FRIENDS.IsClanInvitePending(arg_13_0.controllerIndex, arg_13_0.clanID, var_13_0)

		var_14_0.disabled = not var_0_1(arg_13_0) or var_14_1 or var_14_2
		var_14_0.errorString = ""
		var_14_0.devErrorString = ""

		if var_14_1 then
			var_14_0.errorString = "LUA_MENU/REGIMENT_MEMBER_EXISTS"
			var_14_0.devErrorString = Engine.CBBHFCGDIC(var_14_0.errorString)
		end

		return var_14_0
	end

	function var_13_1.action()
		local var_15_0 = var_13_1.disabledFunc()

		if var_15_0 and not var_15_0.disabled then
			Clans.DIEAGEDBCC(arg_13_0.controllerIndex, arg_13_0.clanID, var_13_0)
		end
	end

	return var_13_1
end

local function var_0_7(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = Engine.EAGGAEGHHA(arg_16_0)
	local var_16_1 = Clans.BFCDHGIGGC(arg_16_0, arg_16_1)
	local var_16_2 = Clans.CHEADIHHBJ(arg_16_0, arg_16_1, arg_16_2)
	local var_16_3 = false

	if var_16_2.memberFound then
		if var_16_0 == var_16_1 then
			var_16_3 = true
		elseif var_16_2.role == OnlineClanRole.MEMBER then
			var_16_3 = true
		end
	end

	return var_16_3
end

local function var_0_8(arg_17_0)
	local var_17_0

	if arg_17_0.xuidString then
		var_17_0 = arg_17_0.xuidString
	else
		var_17_0 = arg_17_0.xuid
	end

	local var_17_1 = {
		label = Engine.CBBHFCGDIC("REGIMENTS/KICK_FROM_REGIMENT", Engine.JCBDICCAH(arg_17_0.clanName))
	}

	var_17_1.id = "kickClanMember"
	var_17_1.refreshOnAction = true

	function var_17_1.disabledFunc()
		local var_18_0 = {}
		local var_18_1 = Clans.CHEADIHHBJ(arg_17_0.controllerIndex, arg_17_0.clanID, var_17_0).memberFound
		local var_18_2 = var_0_7(arg_17_0.controllerIndex, arg_17_0.clanID, var_17_0)

		var_18_0.disabled = not var_0_1(arg_17_0) or not var_18_1 or not var_18_2
		var_18_0.errorString = ""
		var_18_0.devErrorString = ""

		if not var_18_1 then
			var_18_0.errorString = "REGIMENTS/MEMBER_NOT_FOUND"
			var_18_0.devErrorString = Engine.CBBHFCGDIC(var_18_0.errorString)
		elseif not var_18_2 then
			var_18_0.errorString = "REGIMENTS/CANNOT_KICK_MEMBER"
			var_18_0.devErrorString = Engine.CBBHFCGDIC(var_18_0.errorString)
		end

		return var_18_0
	end

	function var_17_1.action()
		local var_19_0 = var_17_1.disabledFunc()

		if var_19_0 and not var_19_0.disabled then
			Clans.BJFFGACEBD(arg_17_0.controllerIndex, arg_17_0.clanID, var_17_0)
		end
	end

	return var_17_1
end

local function var_0_9(arg_20_0)
	local var_20_0 = arg_20_0.controllerIndex
	local var_20_1 = var_0_3(arg_20_0)
	local var_20_2 = arg_20_0.isBot and true or false
	local var_20_3 = {
		label = Engine.CBBHFCGDIC("XBOXLIVE/KICK")
	}

	var_20_3.id = "kickPlayer"

	function var_20_3.disabledFunc()
		local var_21_0 = Lobby.BBDICGHE()
		local var_21_1 = var_21_0 and Lobby.DFFFFJHCEH() and IsPrivateMatch() or not var_21_0 and Lobby.BGIADHIHAG()

		return var_20_2 or not Engine.DDJFBBJAIG() or not var_21_1 or Lobby.CHBBHFHJEH(var_20_1) or IsMlgGameBattlesMatch()
	end

	function var_20_3.action()
		if Lobby.DDADACHHAE(var_20_1) then
			LUI.FlowManager.RequestPopupMenu(nil, "LobbyMemberKick", true, var_20_0, false, {
				xuid = var_20_1
			})
		end
	end

	return var_20_3
end

local function var_0_10(arg_23_0)
	local var_23_0 = arg_23_0.controllerIndex
	local var_23_1 = var_0_3(arg_23_0)
	local var_23_2 = {
		label = Engine.CBBHFCGDIC("CODCASTER/FOLLOW")
	}

	var_23_2.id = "followPlayer"

	function var_23_2.disabledFunc()
		local var_24_0 = Lobby.GetLocalPlayerDataSource(var_23_0).followersCount:GetValue(var_23_0)

		return not Engine.DDJFBBJAIG() or Lobby.CHBBHFHJEH(var_23_1) or var_24_0 > 0 or arg_23_0.memberTeam == Teams.follower
	end

	function var_23_2.action()
		if Lobby.DDADACHHAE(var_23_1) then
			Lobby.BFBCBFEGFI(var_23_0, Teams.follower)
			LobbyMember.BABJJDBHCH(true, var_23_0)
			LobbyMember.CGEEIHHBAA(arg_23_0.memberIndex, var_23_0)
			LobbyMember.IFIJDJICI(true, var_23_0)
		end
	end

	return var_23_2
end

local function var_0_11(arg_26_0)
	local var_26_0 = {
		label = Engine.CBBHFCGDIC("CODCASTER/MOVE_UP")
	}

	var_26_0.id = "moveUp"

	function var_26_0.disabledFunc()
		local var_27_0 = Lobby.GetPreviousFollowablePlayerNum(arg_26_0.memberIndex)

		return not Engine.DDJFBBJAIG() or not var_27_0 or arg_26_0.memberTeam == Teams.follower
	end

	function var_26_0.action()
		local var_28_0 = Lobby.GetPreviousFollowablePlayerNum(arg_26_0.memberIndex)

		if var_28_0 then
			Lobby.HIJBFHIGF(arg_26_0.memberIndex, var_28_0)
		end
	end

	return var_26_0
end

local function var_0_12(arg_29_0)
	local var_29_0 = {
		label = Engine.CBBHFCGDIC("CODCASTER/MOVE_DOWN")
	}

	var_29_0.id = "moveDown"

	function var_29_0.disabledFunc()
		local var_30_0 = Lobby.GetNextFollowablePlayerNum(arg_29_0.memberIndex)

		return not Engine.DDJFBBJAIG() or not var_30_0 or arg_29_0.memberTeam == Teams.follower
	end

	function var_29_0.action()
		local var_31_0 = Lobby.GetNextFollowablePlayerNum(arg_29_0.memberIndex)

		if var_31_0 then
			Lobby.HIJBFHIGF(arg_29_0.memberIndex, var_31_0)
		end
	end

	return var_29_0
end

local function var_0_13(arg_32_0, arg_32_1, arg_32_2)
	return {
		label = LocalizeIntoString(MP.GetTeamInfo(arg_32_2).name, "CODCASTER/ASSIGN_TO_TEAM"),
		id = arg_32_1,
		disabledFunc = function()
			return not Engine.DDJFBBJAIG()
		end,
		action = function()
			Lobby.DCGHHFGDCE(arg_32_0.memberIndex, arg_32_2)
		end
	}
end

local function var_0_14(arg_35_0)
	local var_35_0 = LUI.ShallowCopy(arg_35_0)
	local var_35_1 = var_35_0.controllerIndex
	local var_35_2 = var_0_3(var_35_0)
	local var_35_3 = var_35_0.gamertag

	if var_35_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS or not Engine.DBFCJBDJEC() then
		var_35_0.selectedTab = FRIENDS.TabIDs.CROSSPLAY_FRIENDS
	end

	local var_35_4 = {
		label = Engine.CBBHFCGDIC("MENU/SOCIAL_WHISPER")
	}

	var_35_4.id = "whisper"

	function var_35_4.disabledFunc()
		local var_36_0 = LUI.TextChat.GetLayer()

		if not var_36_0 or not LUI.TextChat.ShouldBeVisible(var_36_0) then
			return true
		end

		if not var_0_2(var_35_0) then
			return true
		end

		local var_36_1 = var_35_0.selectedTab == FRIENDS.TabIDs.ONLINE_FRIENDS and var_35_0.platformId or Friends.BEJHAIFIAB(var_35_2)

		return not Social.BGEBDBIHFA(var_35_1, var_36_1)
	end

	function var_35_4.action()
		if not var_35_4.disabledFunc() then
			local var_37_0 = LUI.TextChat.GetLayer()
			local var_37_1 = var_35_0.selectedTab == FRIENDS.TabIDs.ONLINE_FRIENDS and var_35_0.platformId or Friends.BEJHAIFIAB(var_35_2)

			var_37_0:InitiateWhisperWithXUID(var_35_1, var_37_1, var_35_3)
			LUI.TextChat.StartEditing(var_37_0, var_35_1)
		end
	end

	return var_35_4
end

local function var_0_15(arg_38_0)
	local var_38_0 = arg_38_0.controllerIndex
	local var_38_1 = var_0_3(arg_38_0)
	local var_38_2 = arg_38_0.clientNum
	local var_38_3 = arg_38_0.isBot and true or false
	local var_38_4 = {
		label = Engine.CBBHFCGDIC("XBOXLIVE/PLAYER_MUTE")
	}

	var_38_4.id = "mutePlayer"

	function var_38_4.disabledFunc()
		return var_38_3 or Lobby.CHBBHFHJEH(var_38_1) or IsMlgGameBattlesMatch()
	end

	function var_38_4.action()
		if var_38_2 and not Engine.DDJFBBJAIG() then
			Game.CBEICJFEHB(var_38_2)
			LUI.UIRoot.GetRootForControllerIndex(var_38_0):dispatchEventToChildren({
				name = "kbm_button_mute_action",
				clientNum = var_38_2
			})
		else
			Lobby.CHICEBEEEI(var_38_0, var_38_1)
		end
	end

	return var_38_4
end

local function var_0_16(arg_41_0)
	local var_41_0 = LUI.ShallowCopy(arg_41_0)
	local var_41_1 = var_41_0.controllerIndex
	local var_41_2 = var_0_3(var_41_0)
	local var_41_3 = var_41_0.platformId

	if var_41_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS then
		var_41_0.selectedTab = FRIENDS.TabIDs.CROSSPLAY_FRIENDS
	end

	local var_41_4 = var_41_0.selectedTab
	local var_41_5 = var_41_0.isBot and true or false
	local var_41_6 = {
		label = var_41_0.isContextualMenu and Engine.CBBHFCGDIC("MENU/SEND_FRIEND_REQUEST") or Engine.CBBHFCGDIC("MENU/FRIEND_REQUEST")
	}

	var_41_6.id = "friendRequest"

	function var_41_6.disabledFunc()
		return var_41_5 or var_0_2(var_41_0) or Lobby.CHBBHFHJEH(var_41_2)
	end

	function var_41_6.action()
		if not var_41_6.disabledFunc() then
			if var_41_4 == FRIENDS.TabIDs.ONLINE_FRIENDS then
				Social.HJFBFFDD(var_41_1, var_41_3, false)
			else
				Social.DEIAGIIJDF(var_41_1, Friends.BEJHAIFIAB(var_41_2))
			end
		end
	end

	return var_41_6
end

local function var_0_17(arg_44_0)
	local var_44_0 = arg_44_0.controllerIndex
	local var_44_1 = arg_44_0.platformId
	local var_44_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/UPGRADE_REAL_ID")
	}

	var_44_2.id = "upgradeRealId"

	function var_44_2.disabledFunc()
		return not var_0_2(arg_44_0)
	end

	function var_44_2.action()
		Social.HJFBFFDD(var_44_0, var_44_1, true)
	end

	return var_44_2
end

local function var_0_18(arg_47_0)
	local var_47_0 = LUI.ShallowCopy(arg_47_0)
	local var_47_1 = var_47_0.controllerIndex
	local var_47_2 = var_0_3(var_47_0)
	local var_47_3 = var_47_0.platformId

	if var_47_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS then
		var_47_0.selectedTab = FRIENDS.TabIDs.CROSSPLAY_FRIENDS
	end

	local var_47_4 = var_47_0.selectedTab
	local var_47_5 = var_47_0.gamertag or var_47_0.fullName
	local var_47_6 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_FRIEND")
	}

	var_47_6.id = "removeFriend"

	function var_47_6.disabledFunc()
		return var_47_4 == FRIENDS.TabIDs.ONLINE_FRIENDS and not Engine.DBFCJBDJEC() or not var_0_2(var_47_0) or Lobby.CHBBHFHJEH(var_47_2)
	end

	function var_47_6.action()
		local var_49_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_FRIEND"),
			message = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_FRIEND_CONFIRMATION"),
			extraMessage = Engine.JCBDICCAH(tostring(var_47_5)),
			buttons = {
				{
					label = Engine.CBBHFCGDIC("LUA_MENU_MP/CONFIRM"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if var_47_4 == FRIENDS.TabIDs.ONLINE_FRIENDS then
							Social.EBJFEHBAID(var_47_1, var_47_3)
						else
							Social.CDFFGDDEHF(var_47_1, Friends.BEJHAIFIAB(var_47_2))
						end
					end
				},
				{
					label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
					action = function()
						return
					end
				}
			}
		}

		LUI.FlowManager.RequestPopupMenu(element, "GenericConfirmPopup", true, var_47_1, false, var_49_0, nil, true, true)
	end

	return var_47_6
end

local function var_0_19(arg_52_0)
	local var_52_0 = arg_52_0.controllerIndex
	local var_52_1 = var_0_3(arg_52_0)
	local var_52_2 = arg_52_0.platformId
	local var_52_3 = arg_52_0.selectedTab
	local var_52_4 = arg_52_0.isBot and true or false
	local var_52_5 = {
		label = Engine.CBBHFCGDIC("MENU/REPORT_PLAYER")
	}

	var_52_5.id = "reportPlayer"

	function var_52_5.disabledFunc()
		return var_52_4 or Lobby.CHBBHFHJEH(var_52_1)
	end

	function var_52_5.action()
		if not var_52_5.disabledFunc() then
			LUI.FlowManager.RequestPopupMenu(nil, "ReportPlayer", true, var_52_0, false, {
				xuid = var_52_1,
				platformId = var_52_2
			})
		end
	end

	return var_52_5
end

local function var_0_20(arg_55_0)
	local var_55_0 = var_0_3(arg_55_0)
	local var_55_1 = Friends.BEJHAIFIAB(var_55_0)
	local var_55_2 = arg_55_0.platformId
	local var_55_3 = arg_55_0.selectedTab
	local var_55_4 = arg_55_0.isBot and true or false
	local var_55_5 = (Engine.HDGDBCJFG() or Engine.DBFCJBDJEC()) and Friends.CIBEABFIJI(arg_55_0.controllerIndex, var_55_0)
	local var_55_6
	local var_55_7 = {
		label = var_55_5 and Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK_PLAYER") or Engine.CBBHFCGDIC("LUA_MENU/BLOCK_PLAYER")
	}

	var_55_7.id = "blockPlayer"

	function var_55_7.disabledFunc()
		return var_55_4 or Lobby.CHBBHFHJEH(var_55_0) or var_55_6
	end

	function var_55_7.action(arg_57_0, arg_57_1)
		local var_57_0 = var_55_3 == FRIENDS.TabIDs.ONLINE_FRIENDS and Engine.DBFCJBDJEC()
		local var_57_1 = var_55_1 ~= var_55_2

		if var_55_5 then
			if var_57_0 then
				Social.JGFDEBFAC(var_55_2)
			end

			if var_57_1 then
				Social.EIGAJHEGI(arg_55_0.controllerIndex, var_55_1)
			end
		else
			if var_57_0 then
				if var_0_2(arg_55_0) then
					local var_57_2 = var_57_1

					var_57_1 = false

					local function var_57_3()
						Social.BIFIFEECCJ(arg_55_0.controllerIndex, var_55_2)

						if var_57_2 then
							Social.DACDEGEDDD(arg_55_0.controllerIndex, var_55_1, arg_55_0.gamertag or arg_55_0.fullName)
						end

						var_55_6 = true
					end

					LUI.FlowManager.RequestPopupMenu(nil, "BlockPlayerAndRemoveFromFriendsPopup", true, arg_55_0.controllerIndex, false, {
						yesAction = var_57_3
					})
				else
					Social.BIFIFEECCJ(var_55_2)
				end
			end

			if var_57_1 then
				Social.DACDEGEDDD(arg_55_0.controllerIndex, var_55_1, arg_55_0.gamertag or arg_55_0.fullName)
			end
		end

		var_55_6 = var_57_1
	end

	return var_55_7
end

function FRIENDS.OpenFriendsList(arg_59_0, arg_59_1)
	if IsOnlineMatch() and Engine.BACCCIHGDG() and Engine.BICHEEFHEC(arg_59_0) then
		if not Engine.DBAEJAHFGJ(arg_59_0) then
			local var_59_0 = {
				hasUsedShortcut = arg_59_1
			}

			LUI.FlowManager.RequestAddMenu("SocialMenu", true, arg_59_0, false, var_59_0, true)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_59_0, false, {}, nil, true, true)
		end
	end
end

function FRIENDS.SetupLobbyMemberContextualMenu(arg_60_0, arg_60_1, arg_60_2)
	local function var_60_0()
		assert(arg_60_2)

		local var_61_0 = arg_60_1:GetDataSource()
		local var_61_1 = var_61_0.memberIndex:GetValue(arg_60_2)

		if var_61_1 then
			local var_61_2
			local var_61_3

			if CONDITIONS.IsInGameBattlesMatch() then
				var_61_3 = var_61_0.xuid:GetValue(arg_60_2)
				var_61_2 = Friends.CAIJHBHGGC(var_61_3)

				if Engine.EBCDCFCBE(var_61_3) then
					return nil
				end
			else
				var_61_2 = Lobby.CCHEBJJJEB(var_61_1)
				var_61_3 = Friends.BEJHAIFIAB(var_61_2)
			end

			assert(var_61_2)

			if not Lobby.CHBBHFHJEH(var_61_2) then
				return {
					isContextualMenu = true,
					xuid = var_61_2,
					xuidString = var_61_3,
					memberIndex = var_61_1,
					memberTeam = var_61_0.team:GetValue(arg_60_2),
					platformId = var_61_0.platformId:GetValue(arg_60_2),
					selectedTab = Social.ECHBFGEHFI(arg_60_2, var_61_3),
					controllerIndex = arg_60_2,
					presencePlatform = var_61_0.presencePlatform,
					gamertag = var_61_0.gamertag:GetValue(arg_60_2),
					getButtonsCallback = function(arg_62_0)
						local var_62_0 = FRIENDS.GetFriendActions(arg_62_0)
						local var_62_1 = FRIENDS.GetLobbyMemberActions(arg_62_0)

						LUI.ConcatenateToTable(var_62_0, var_62_1)

						return var_62_0
					end
				}
			end
		end

		return nil
	end

	arg_60_1:SubscribeToDataSourceThroughElement(arg_60_1, nil, function()
		(function()
			if not arg_60_0._contextualMenuIsAdded then
				FRIENDS.SetupPlayerContextualMenuOptions(arg_60_0, arg_60_2, var_60_0)

				arg_60_1._contextualMenuIsAdded = true
			end
		end)()
	end)
end

local function var_0_21(arg_65_0, arg_65_1)
	if LUI.IsLastInputKeyboardMouse(arg_65_1.controller) then
		local var_65_0 = arg_65_1.callback(arg_65_0)

		if var_65_0 then
			FRIENDS.UpdatePlayerContextualMenuOptions(arg_65_0, arg_65_1.controller, var_65_0)
		end
	end
end

function FRIENDS.SetupPlayerContextualMenuOptions(arg_66_0, arg_66_1, arg_66_2)
	if not arg_66_0._contextualMenuHandlerAdded then
		arg_66_0:addEventHandler("mouseenter", function(arg_67_0, arg_67_1)
			var_0_21(arg_67_0, {
				controller = arg_66_1,
				callback = arg_66_2
			})
		end)

		arg_66_0._contextualMenuHandlerAdded = true
	end

	local var_66_0 = arg_66_0:GetCurrentMenu()

	FRIENDS.RegisterPlatformIdForViewProfileEventOnMenu(var_66_0, arg_66_1)
end

function FRIENDS.UpdatePlayerContextualMenuOptions(arg_68_0, arg_68_1, arg_68_2)
	if arg_68_2.gamertag and arg_68_2.gamertag ~= "" then
		local var_68_0 = arg_68_2.gamertag
		local var_68_1

		if Engine.DBFCJBDJEC() and arg_68_2.selectedTab == FRIENDS.TabIDs.ONLINE_FRIENDS and arg_68_2.showBattlenetData then
			local var_68_2 = Social.CFEIHAADEI(arg_68_2.platformId)

			if var_68_2 and var_68_2.battleTag and var_68_2.battleTag ~= "" then
				local var_68_3 = Engine.BECCFCBIAA("displayRealID") == 1 and var_68_2.fullName and var_68_2.fullName ~= "" and var_68_2.fullName or nil

				var_68_1 = {
					title = var_68_2.battleTag,
					subtitle = var_68_3
				}
			else
				var_68_1 = {
					title = arg_68_2.gamertag
				}
			end

			var_68_0 = arg_68_2.crossplayGamertag ~= "" and arg_68_2.crossplayGamertag or nil
		end

		arg_68_0:SetupContextualMenu({
			title = var_68_0,
			battlenetData = var_68_1
		})
	else
		arg_68_0:SetupContextualMenu()
	end

	local var_68_4 = arg_68_2.getButtonsCallback and arg_68_2.getButtonsCallback(arg_68_2)

	for iter_68_0, iter_68_1 in ipairs(var_0_0) do
		if iter_68_1 ~= "separator" then
			for iter_68_2, iter_68_3 in pairs(var_68_4) do
				if iter_68_3.id == iter_68_1 then
					local var_68_5 = iter_68_3.action
					local var_68_6 = CONDITIONS.AlwaysTrue

					if iter_68_3.disabledFunc then
						function var_68_6()
							local var_69_0 = iter_68_3.disabledFunc()

							if var_69_0 and type(var_69_0) == "table" then
								return not var_69_0.disabled
							else
								return not var_69_0
							end
						end
					end

					local var_68_7 = iter_68_3.id
					local var_68_8 = iter_68_3.label
					local var_68_9 = {
						actionName = var_68_8,
						actionFunction = var_68_5,
						actionParams = arg_68_2,
						conditionFunction = var_68_6,
						id = var_68_7,
						conditionParams = arg_68_2
					}

					arg_68_0:AddContextualMenuAction(var_68_9)

					break
				end
			end
		else
			arg_68_0:AddContextualMenuAction({
				isSeparator = true
			})
		end
	end
end

function FRIENDS.GetScoreboardActions(arg_70_0)
	local var_70_0 = arg_70_0.clientNum

	assert(var_70_0)

	local var_70_1 = arg_70_0.xuid

	assert(var_70_1)

	local var_70_2 = arg_70_0.xuidString

	assert(var_70_2)

	local var_70_3 = arg_70_0.isBot and true or false
	local var_70_4 = arg_70_0.controllerIndex

	assert(var_70_4)

	local var_70_5 = arg_70_0.isAAR
	local var_70_6 = {}

	table.insert(var_70_6, var_0_9(arg_70_0))
	table.insert(var_70_6, var_0_14(arg_70_0))
	table.insert(var_70_6, var_0_15(arg_70_0))

	local var_70_7 = {
		label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
		disabledFunc = function()
			return not Engine.HDGDBCJFG() or not not CONDITIONS.IsSystemLink(self) or var_70_3
		end
	}

	function var_70_7.action()
		if not var_70_7.disabledFunc() then
			if not var_70_5 and (not Game.BFEEGCHICA(var_70_4, "ui_scoreboard_freeze") or arg_70_0.isCP) then
				Engine.BJBCAJFECC(var_70_4, var_70_0)
			elseif var_70_5 and var_70_1 then
				Lobby.GICFBJBBJ(var_70_4, var_70_2)
			end
		end
	end

	var_70_7.id = "viewProfile"

	table.insert(var_70_6, var_70_7)
	table.insert(var_70_6, var_0_16(arg_70_0))
	table.insert(var_70_6, var_0_18(arg_70_0))
	table.insert(var_70_6, var_0_19(arg_70_0))
	table.insert(var_70_6, var_0_20(arg_70_0))

	return var_70_6
end

function FRIENDS.AddFriendActions(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = arg_73_0.controllerIndex
	local var_73_1
	local var_73_2 = {}

	for iter_73_0, iter_73_1 in ipairs(arg_73_1) do
		assert(iter_73_1.label)
		assert(iter_73_1.action)

		local var_73_3 = MenuBuilder.BuildRegisteredType("MenuButton", {
			controllerIndex = var_73_0
		})

		var_73_3.Text:setText(iter_73_1.label)

		local var_73_4 = iter_73_1.disabledFunc and iter_73_1.disabledFunc() or false

		var_73_3.disabledFunc = iter_73_1.disabledFunc

		var_73_3:SetButtonDisabled(var_73_4)

		var_73_3.previousDisabledStatus = var_73_4

		var_73_3:addEventHandler("button_action", function(arg_74_0, arg_74_1)
			if iter_73_1.refreshOnAction then
				var_73_1(false)
			end

			iter_73_1.action()
		end)
		arg_73_2:addElement(var_73_3)
		table.insert(var_73_2, var_73_3)
	end

	local var_73_5 = LUI.UIImage.new()

	var_73_5.id = "Spacer"

	var_73_5:SetAlpha(0)
	var_73_5:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 10)
	arg_73_2:addElement(var_73_5)

	arg_73_2.Spacer = var_73_5

	local var_73_6 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_73_0
	})

	var_73_6.id = "ButtonDescriptionText"

	var_73_6.Description:SetRight(_1080p * 500)
	var_73_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 32)
	arg_73_2:addElement(var_73_6)

	arg_73_2.ButtonDescriptionText = var_73_6

	function var_73_1(arg_75_0)
		local var_75_0 = ""
		local var_75_1
		local var_75_2 = true

		for iter_75_0 = 1, #var_73_2 do
			local var_75_3 = var_73_2[iter_75_0]

			var_75_1 = var_75_1 or var_75_3:GetCurrentMenu()

			if var_75_3.disabledFunc then
				local var_75_4 = var_75_3.disabledFunc()
				local var_75_5 = false

				if type(var_75_4) == "table" then
					var_75_5 = var_75_4.disabled

					local var_75_6 = var_75_4.errorString

					if var_75_3:isInFocus() and #var_75_6 > 0 and var_75_5 then
						var_75_0 = Engine.CBBHFCGDIC(var_75_6)

						if Engine.BHICADFIHA() then
							local var_75_7 = var_75_4.devErrorString

							if #var_75_7 > 0 then
								var_75_0 = var_75_0 .. " Dev : " .. var_75_7
							end
						end
					end
				else
					var_75_5 = var_75_4
				end

				if var_75_3.previousDisabledStatus ~= var_75_5 then
					var_75_3:SetButtonDisabled(var_75_5)
				end

				var_75_3.previousDisabledStatus = var_75_5
			end
		end

		if var_75_1 then
			if var_75_1.descriptionText and var_75_1.descriptionText == var_75_0 then
				var_75_2 = false
			end

			if var_75_2 then
				var_75_1.descriptionText = var_75_0

				var_75_1:dispatchEventToCurrentMenu({
					name = "update_button_description",
					text = var_75_0
				})
			end
		end

		if arg_75_0 then
			arg_73_2:Wait(1000).onComplete = function()
				return var_73_1(arg_75_0)
			end
		end
	end

	var_73_1(true)
end

function FRIENDS.GetFriendActions(arg_77_0)
	local var_77_0 = arg_77_0.xuidString or arg_77_0.xuid
	local var_77_1 = Friends.CAIJHBHGGC(var_77_0)
	local var_77_2 = arg_77_0.platformId
	local var_77_3 = arg_77_0.selectedTab

	assert(var_77_3)

	local var_77_4 = arg_77_0.controllerIndex

	assert(var_77_4)

	local var_77_5 = arg_77_0.presencePlatform

	if type(var_77_5) == "userdata" then
		var_77_5 = var_77_5:GetValue(var_77_4)
	end

	local var_77_6 = Engine.CBBFHGEDGJ()
	local var_77_7 = {}

	if var_77_3 == FRIENDS.TabIDs.RECENT_PLAYERS then
		if not Engine.BEFACAIFDD() then
			local var_77_8 = {
				label = Engine.CBBHFCGDIC("MENU/JOIN_GAME"),
				disabledFunc = function()
					return not var_0_1(arg_77_0) or Invitation.ECGAJEGAIC(var_77_4, var_77_1, var_77_2, var_77_3)
				end
			}
			local var_77_9 = (Engine.BAHIIBFDDG() or Engine.BEFACAIFDD()) and Friends.CIBEABFIJI(var_77_4, var_77_1)

			function var_77_8.action()
				local var_79_0 = var_77_8.disabledFunc()

				if var_79_0 and not var_79_0.disabled then
					var_77_9 = (Engine.BAHIIBFDDG() or Engine.BEFACAIFDD()) and Friends.CIBEABFIJI(var_77_4, var_77_1)

					if var_77_9 then
						local var_79_1 = {
							xuid = var_77_1,
							controllerIndex = var_77_4
						}

						LUI.FlowManager.RequestPopupMenu(nil, "ConfirmJoinBlockedUser", true, var_77_4, false, var_79_1)
					else
						local function var_79_2()
							local var_80_0 = var_77_8.disabledFunc()

							if var_80_0 and not var_80_0.disabled then
								if CONDITIONS.IsInGameBattlesMatch() then
									Engine.DBFFAEEFGJ():dispatchEventToRoot({
										immediate = true,
										name = "gamebattles_social_leave_menu"
									})
								end

								Friends.DACCIAAAAB(var_77_4, var_77_1, var_77_2)

								local var_80_1, var_80_2 = Engine.CBBGBGBFJF(var_77_4)

								if not var_80_1 and var_80_2 == FenceOnlineServices.ERROR_CODES.PSPlusRequired then
									Engine.DBHBIHJDEC(var_77_4)
								end
							end
						end

						FRIENDS.TryJoinUserParty(var_79_2)
					end
				end
			end

			if not var_77_9 then
				var_77_8.refreshOnAction = true
			end

			var_77_8.id = "joinGame"

			table.insert(var_77_7, var_77_8)
		end
	else
		local var_77_10 = var_0_4(arg_77_0)

		table.insert(var_77_7, var_77_10)
	end

	local var_77_11 = Engine.EAAHGICFBD()

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		var_77_11 = true
	end

	if var_77_11 then
		table.insert(var_77_7, var_0_5(arg_77_0))
	end

	local var_77_12 = Clans.CFGBBBHFHB(var_77_4)

	if var_77_12 and var_77_12 ~= -1 then
		local var_77_13 = Engine.EAGGAEGHHA(var_77_4)
		local var_77_14 = false
		local var_77_15 = Clans.GIDGAGEAC(var_77_4, var_77_12, FRIENDS.RegimentMembersFilter.OFFICERS_ONLY)

		for iter_77_0 = 1, #var_77_15 do
			if var_77_13 == var_77_15[iter_77_0].xuid then
				var_77_14 = true

				break
			end
		end

		if var_77_14 then
			local var_77_16

			if arg_77_0.xuidString then
				var_77_16 = arg_77_0.xuidString
			else
				var_77_16 = arg_77_0.xuid
			end

			if var_77_3 ~= FRIENDS.TabIDs.REGIMENTS and not Clans.CHEADIHHBJ(var_77_4, var_77_12, var_77_16).memberFound then
				local var_77_17 = Clans.GFFJCJFIJ(var_77_4, var_77_12)

				arg_77_0.clanID = var_77_12
				arg_77_0.clanName = var_77_17.name

				table.insert(var_77_7, var_0_6(arg_77_0))
			end

			if var_0_7(var_77_4, var_77_12, var_77_16) then
				local var_77_18 = Clans.GFFJCJFIJ(var_77_4, var_77_12)

				arg_77_0.clanID = var_77_12
				arg_77_0.clanName = var_77_18.name

				table.insert(var_77_7, var_0_8(arg_77_0))
			end
		end
	end

	table.insert(var_77_7, var_0_14(arg_77_0))

	if var_77_3 == FRIENDS.TabIDs.ONLINE_FRIENDS then
		if Engine.HDGDBCJFG() or Engine.BEFACAIFDD() then
			local var_77_19 = {
				label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
				disabledFunc = function()
					return not var_0_1(arg_77_0) or not Friends.GGDCJJGBI(var_77_4)
				end
			}

			function var_77_19.action()
				if not var_77_19.disabledFunc() then
					Friends.CFBFGBECEB(var_77_4, var_77_2)
				end
			end

			var_77_19.id = "viewProfile"

			table.insert(var_77_7, var_77_19)
		end
	elseif var_77_3 == FRIENDS.TabIDs.RECENT_PLAYERS then
		assert(var_77_1)

		if Engine.HDGDBCJFG() or Engine.BEFACAIFDD() then
			local var_77_20 = {
				label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")
			}

			if Engine.BAHIIBFDDG() then
				function var_77_20.disabledFunc()
					return not var_0_1(arg_77_0) or not Social.CDFEICCEFJ(var_77_4, var_77_0) or var_77_2 == "0"
				end
			else
				function var_77_20.disabledFunc()
					return not var_0_1(arg_77_0) or not Social.CDFEICCEFJ(var_77_4, var_77_0) or var_77_6 ~= var_77_5
				end
			end

			function var_77_20.action()
				if not var_77_20.disabledFunc() then
					Friends.CCDGAGCFGE(var_77_4, var_77_1)
				end
			end

			var_77_20.id = "viewProfile"

			table.insert(var_77_7, var_77_20)
		end
	elseif var_77_3 == FRIENDS.TabIDs.CROSSPLAY_FRIENDS or var_77_3 == FRIENDS.TabIDs.REGIMENTS or var_77_3 == FRIENDS.TabIDs.PRIVATE_PARTY then
		assert(var_77_1)

		if Engine.HDGDBCJFG() and var_77_6 == var_77_5 then
			local var_77_21 = {
				label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
				disabledFunc = function()
					return var_77_3 == FRIENDS.TabIDs.CROSSPLAY_FRIENDS and not var_0_1(arg_77_0) or not Friends.GGDCJJGBI(var_77_4)
				end
			}

			function var_77_21.action()
				if not var_77_21.disabledFunc() then
					if arg_77_0.platformId and arg_77_0.platformId ~= "0" then
						Friends.CFBFGBECEB(var_77_4, var_77_2)
					elseif not Social.BFEBABDDDE(var_77_4, var_77_0, "PlatformIdForViewProfile") then
						local var_87_0 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE")

						LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, var_77_4, false, {
							message = var_87_0
						})
					end
				end
			end

			var_77_21.id = "viewProfile"

			table.insert(var_77_7, var_77_21)
		end
	elseif var_77_3 == FRIENDS.TabIDs.FAVORITE_FRIENDS then
		assert(var_77_1)

		if Engine.HDGDBCJFG() or Engine.BEFACAIFDD() then
			local var_77_22 = {
				label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
				disabledFunc = function()
					return not var_0_1(arg_77_0) or var_77_6 ~= var_77_5 or Friends.FDBGHIFEE(var_77_4, var_77_1)
				end
			}

			function var_77_22.action()
				if not var_77_22.disabledFunc() then
					if arg_77_0.platformId and arg_77_0.platformId ~= "0" then
						Friends.CFBFGBECEB(var_77_4, var_77_2)
					elseif not Social.BFEBABDDDE(var_77_4, var_77_0, "PlatformIdForViewProfile") then
						local var_89_0 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE")

						LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, var_77_4, false, {
							message = var_89_0
						})
					end
				end
			end

			var_77_22.id = "viewProfile"

			table.insert(var_77_7, var_77_22)
		end
	end

	if (var_77_3 == FRIENDS.TabIDs.ONLINE_FRIENDS or var_77_3 == FRIENDS.TabIDs.CROSSPLAY_FRIENDS) and Friends.IJHFCGEBD() and Dvar.IBEGCHEFE("RRTRNQOLS") then
		local var_77_23 = {
			label = Engine.CBBHFCGDIC("MENU/ADD_TO_FAVORITES"),
			disabledFunc = function()
				return not var_0_1(arg_77_0) or Friends.ECIAEDEBCF(var_77_4, var_77_1)
			end
		}

		function var_77_23.action()
			local var_91_0 = var_77_23.disabledFunc()

			if var_91_0 and not var_91_0.disabled then
				Friends.DGICIJGBGB(var_77_4, var_77_1)
			end
		end

		var_77_23.refreshOnAction = true
		var_77_23.id = "addToFavorites"

		table.insert(var_77_7, var_77_23)
	end

	if var_77_3 == FRIENDS.TabIDs.FAVORITE_FRIENDS then
		local var_77_24 = {
			label = Engine.CBBHFCGDIC("MENU/REMOVE_FROM_FAVORITES"),
			disabledFunc = function()
				return not var_0_1(arg_77_0) or Friends.GFHEFICGF(var_77_4, var_77_1)
			end
		}

		function var_77_24.action()
			local var_93_0 = var_77_24.disabledFunc()

			if var_93_0 and not var_93_0.disabled then
				Friends.DIIFJGIIBA(var_77_4, var_77_1)
			end
		end

		var_77_24.refreshOnAction = true
		var_77_24.id = "removeFromFavorites"

		table.insert(var_77_7, var_77_24)
	end

	if Engine.DBFCJBDJEC() and var_77_3 == FRIENDS.TabIDs.ONLINE_FRIENDS then
		local var_77_25 = Social.CFEIHAADEI(arg_77_0.platformId)

		if var_77_25 and var_77_25.fullName and var_77_25.fullName == "" then
			table.insert(var_77_7, var_0_17(arg_77_0))
		end
	end

	if arg_77_0.isContextualMenu or var_77_3 ~= FRIENDS.TabIDs.ONLINE_FRIENDS and var_77_3 ~= FRIENDS.TabIDs.CROSSPLAY_FRIENDS and var_77_3 ~= FRIENDS.TabIDs.FAVORITE_FRIENDS then
		table.insert(var_77_7, var_0_16(arg_77_0))
	end

	if var_77_3 ~= FRIENDS.TabIDs.FAVORITE_FRIENDS then
		table.insert(var_77_7, var_0_18(arg_77_0))
		table.insert(var_77_7, var_0_19(arg_77_0))
		table.insert(var_77_7, var_0_20(arg_77_0))
	end

	if var_77_3 == FRIENDS.TabIDs.PRIVATE_PARTY then
		table.insert(var_77_7, var_0_9(arg_77_0))
	end

	return var_77_7
end

function FRIENDS.GetLobbyMemberActions(arg_94_0)
	local var_94_0 = arg_94_0.xuid
	local var_94_1 = arg_94_0.controllerIndex

	assert(var_94_0)
	assert(var_94_1)

	local var_94_2 = {}

	if Engine.HDGDBCJFG() or Engine.BEFACAIFDD() then
		local var_94_3 = {
			label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
			action = function()
				if CONDITIONS.IsInGameBattlesMatch() then
					local var_95_0 = arg_94_0.platformId

					if var_95_0 then
						Lobby.BEDFEBGCHG(var_94_1, var_95_0)
					end
				else
					Lobby.BJBCAJFECC(var_94_1, var_94_0)
				end
			end,
			disabledFunc = function()
				if arg_94_0.isCrossplayPlayer ~= nil then
					return arg_94_0.isCrossplayPlayer
				end
			end
		}

		var_94_3.id = "viewProfile"

		table.insert(var_94_2, var_94_3)
	end

	table.insert(var_94_2, var_0_15(arg_94_0))
	table.insert(var_94_2, var_0_19(arg_94_0))

	if MLG.DBIBHEAEGD() then
		local var_94_4 = Lobby.BGIADHIHAG()

		if arg_94_0.memberIndex and Dvar.IBEGCHEFE("LQNKRLQTLM") and not var_94_4 then
			table.insert(var_94_2, var_0_10(arg_94_0))
		end

		if var_94_4 then
			table.insert(var_94_2, var_0_11(arg_94_0))
			table.insert(var_94_2, var_0_12(arg_94_0))
			table.insert(var_94_2, var_0_13(arg_94_0, "assignAllies", Teams.allies))
			table.insert(var_94_2, var_0_13(arg_94_0, "assignAxis", Teams.axis))
		end
	end

	return var_94_2
end

function FRIENDS.TryJoinUserParty(arg_97_0)
	if not Engine.CGABICJHAI() or not ShaderUpload.DDBFFCFJJJ() or not ShaderUpload.CEIBACCEAF() or Engine.DIEEIEFCFF() and Dvar.IBEGCHEFE("MRTNMPRLKR") then
		arg_97_0()
	else
		LUI.FlowManager.RequestPopupMenu(nil, "CancelShaderUploadDialog", false, nil, false, {
			onCancelUpload = arg_97_0
		}, nil, true, true)
	end
end

function FRIENDS.ValidatePlayerRequestData(arg_98_0)
	assert(arg_98_0.getFriendFrom)
	assert(arg_98_0.getFriendTo)
	assert(arg_98_0.getFriendFrom >= 0)

	if arg_98_0.friendsCount > 0 then
		assert(arg_98_0.getFriendTo < arg_98_0.friendsCount)
	end

	assert(arg_98_0.getFriendFrom <= arg_98_0.getFriendTo)
end

function FRIENDS.InitPlayerRequestData(arg_99_0, arg_99_1)
	arg_99_0.cachedFriends = arg_99_1
	arg_99_0.getFriendFrom = 0
	arg_99_0.getFriendTo = arg_99_1
	arg_99_0.friendsCount = 0
end

function FRIENDS.UpdatePlayerRequestData(arg_100_0, arg_100_1, arg_100_2, arg_100_3)
	local var_100_0 = arg_100_0.friendsCount

	arg_100_0.friendsCount = arg_100_0._friendsData.count

	if arg_100_0.getFriendTo >= arg_100_0.friendsCount then
		if arg_100_0.friendsCount == 0 then
			arg_100_0.getFriendTo = 0
		else
			arg_100_0.getFriendTo = arg_100_0.friendsCount - 1
		end
	end

	if arg_100_0.friendsCount > 0 then
		arg_100_0.getFriendFrom = LUI.clamp(arg_100_0.getFriendFrom, 0, arg_100_0.friendsCount - 1)

		if var_100_0 < arg_100_0.friendsCount then
			local var_100_1 = math.floor(arg_100_0.cachedFriends / 2)
			local var_100_2 = arg_100_0.friendsCount - var_100_0

			var_100_2 = var_100_1 < var_100_2 and var_100_1 or var_100_2
			arg_100_0.getFriendTo = arg_100_0.getFriendTo + var_100_2
		end

		arg_100_0.getFriendTo = LUI.clamp(arg_100_0.getFriendTo, arg_100_0.getFriendFrom, arg_100_0.friendsCount - 1)
	else
		arg_100_0.getFriendFrom = 0
		arg_100_0.getFriendTo = math.floor(arg_100_0.cachedFriends / 2)
	end

	if var_100_0 ~= arg_100_0.friendsCount then
		arg_100_0:SetNumChildren(arg_100_0.friendsCount)
	end

	local var_100_3 = arg_100_0:getParent()

	if var_100_3 then
		if var_100_3.UpdateNoFriends then
			var_100_3:UpdateNoFriends(arg_100_0.friendsCount, arg_100_0._friendsData.totalCount)
		end

		if var_100_3._tabID == FRIENDS.TabIDs.FRIENDS and var_100_3.SetHeader then
			local var_100_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_ONLINE_MEMBERS", arg_100_0._friendsData.onlineCount, arg_100_0._friendsData.totalCount)

			var_100_3:SetHeader(var_100_4, nil, true)
		end
	end
end

function FRIENDS.RefreshData(arg_101_0, arg_101_1, arg_101_2)
	FRIENDS.ValidatePlayerRequestData(arg_101_1)

	if arg_101_0 == FRIENDS.TabIDs.RECENT_PLAYERS then
		arg_101_1._friendsData = Friends.DAHGHDHFIA(arg_101_2, FRIENDS.TabIDs.RECENT_PLAYERS, arg_101_1.getFriendFrom, arg_101_1.getFriendTo, arg_101_1.friendsCount)

		local var_101_0 = arg_101_1._friendsData.friends and #arg_101_1._friendsData.friends or 0

		if arg_101_1._friendsData.count ~= var_101_0 then
			DebugPrint("RECENT PLAYERS DEBUG:")
			DebugPrint("count: " .. arg_101_1._friendsData.count .. " numFriends: " .. #arg_101_1._friendsData.friends)
			DebugPrint("from: " .. arg_101_1.getFriendFrom .. " to: " .. arg_101_1.getFriendTo)

			arg_101_1._friendsData.count = var_101_0
		end

		FRIENDS.UpdatePlayerRequestData(arg_101_1, false, FRIENDS.TabIDs.RECENT_PLAYERS, arg_101_2)
	elseif arg_101_0 == FRIENDS.TabIDs.FRIENDS then
		local var_101_1 = Friends.FBFFEFEGB(arg_101_2, arg_101_1.getFriendFrom, arg_101_1.getFriendTo, true, arg_101_1.showOfflineFriends)

		if var_101_1 then
			arg_101_1._friendsData = var_101_1

			FRIENDS.UpdatePlayerRequestData(arg_101_1, false, FRIENDS.TabIDs.FRIENDS, arg_101_2)
		end
	end

	arg_101_1:RefreshContent()
end

function FRIENDS.RegisterPlatformIdForViewProfileEventOnMenu(arg_102_0, arg_102_1)
	if arg_102_0 and not arg_102_0.platformIdViewProfileEventIsRegistered then
		arg_102_0:registerEventHandler("PlatformIdForViewProfile", function(arg_103_0, arg_103_1)
			if LUI.FlowManager.IsMenuOnTop("PopupOK") then
				LUI.FlowManager.RequestLeaveMenuByName("PopupOK", true, true)
			end

			if arg_103_1.results and arg_103_1.results.success and arg_103_1.results.platformID ~= "0" then
				Friends.CFBFGBECEB(arg_102_1, arg_103_1.results.platformID)
			else
				local var_103_0 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE_FAILED")

				LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_102_1, false, {
					message = var_103_0
				})
			end
		end)

		arg_102_0.platformIdViewProfileEventIsRegistered = true
	end
end

function FRIENDS.RegimentRoleChangedToast(arg_104_0, arg_104_1, arg_104_2)
	arg_104_2 = arg_104_2 or ""

	local var_104_0 = {
		clans_promoted_to_owner = {
			icon = "hud_info_alert",
			displayTime = 3000,
			header = Engine.CBBHFCGDIC("REGIMENTS/PROMOTION"),
			description = Engine.CBBHFCGDIC("REGIMENTS/PROMOTED_TO_OWNER")
		},
		clans_promoted_to_officer = {
			icon = "hud_info_alert",
			displayTime = 3000,
			header = Engine.CBBHFCGDIC("REGIMENTS/PROMOTION"),
			description = Engine.CBBHFCGDIC("REGIMENTS/PROMOTED_TO_OFFICER")
		},
		clans_demoted_to_officer = {
			icon = "hud_info_alert",
			displayTime = 3000,
			header = Engine.CBBHFCGDIC("REGIMENTS/DEMOTION"),
			description = Engine.CBBHFCGDIC("REGIMENTS/DEMOTED_TO_OFFICER")
		},
		clans_demoted_to_member = {
			icon = "hud_info_alert",
			displayTime = 3000,
			header = Engine.CBBHFCGDIC("REGIMENTS/DEMOTION"),
			description = Engine.CBBHFCGDIC("REGIMENTS/DEMOTED_TO_MEMBER")
		},
		clans_kicked_from_clan = {
			icon = "hud_info_alert",
			displayTime = 3000,
			description = Engine.CBBHFCGDIC("REGIMENTS/KICKED_DESC", Engine.JCBDICCAH(arg_104_2))
		}
	}

	arg_104_0:processEvent({
		name = "send_toast_notification",
		immediate = true,
		options = var_104_0[arg_104_1]
	})
end

function FRIENDS.GetOpenPlayerActionPopupFunc(arg_105_0, arg_105_1)
	return function(arg_106_0, arg_106_1)
		if arg_105_1.isMyPlayer then
			return
		end

		arg_105_1.selectedTab = arg_105_1.selectedTab or arg_105_0
		arg_105_1.controllerIndex = arg_106_1.controller
		arg_105_1.isRegiments = arg_105_0 == FRIENDS.TabIDs.REGIMENTS
		arg_105_1.isPartyMember = arg_105_0 == FRIENDS.TabIDs.PRIVATE_PARTY

		local var_106_0 = MenuBuilder.BuildRegisteredType("SocialPlayerPopup", arg_105_1)
		local var_106_1 = FRIENDS.GetFriendActions(arg_105_1)

		FRIENDS.AddFriendActions(arg_105_1, var_106_1, var_106_0.PlayerActions)
		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_106_1.controller, false, {
			widget = var_106_0
		})
	end
end

function FRIENDS.GetPlayerButtonAction(arg_107_0, arg_107_1, arg_107_2)
	assert(arg_107_1)

	if not arg_107_0 then
		return
	end

	local var_107_0

	if arg_107_1 == FRIENDS.TabIDs.FRIENDS then
		if arg_107_2 == FRIENDS.ManageFriendsTabIDs.SENT_INVITES then
			function var_107_0(arg_108_0, arg_108_1)
				local var_108_0 = {
					title = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_SENT_INVITE"),
					message = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_INVITE_MESSAGE"),
					extraMessage = Engine.JCBDICCAH(arg_107_0.fullName)
				}

				var_108_0.itemImage = "icon_warning_large"
				var_108_0.buttons = {
					{
						label = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_REQUEST"),
						action = function()
							LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

							if arg_107_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
								Social.BHCIIHHAAC(arg_108_1.controller, arg_107_0.xuid)
							elseif arg_107_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
								Social.DHHEFJGEJC(arg_108_1.controller, arg_107_0.invitationId)
							end

							arg_108_0:dispatchEventToRoot({
								name = "request_fetch_data"
							})
						end
					},
					{
						label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
						action = function()
							return
						end
					}
				}

				LUI.FlowManager.RequestPopupMenu(arg_108_0, "GenericConfirmPopup", true, arg_108_1.controller, false, var_108_0, nil, true, true)
			end
		elseif arg_107_2 == FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS then
			function var_107_0(arg_111_0, arg_111_1)
				local var_111_0 = {
					title = Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIEND_REQUEST"),
					message = Engine.CBBHFCGDIC("LUA_MENU/REQUEST_MESSAGE"),
					extraMessage = Engine.JCBDICCAH(arg_107_0.fullName)
				}

				var_111_0.itemImage = "mm_element_logo_white"
				var_111_0.buttons = {
					{
						label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
						action = function()
							LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

							if arg_107_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
								Social.BIHDCJGFCI(arg_111_1.controller, arg_107_0.xuid)
								Social.DAFDEJICJJ(arg_111_1.controller, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_107_0.xuid, arg_107_0.fullName)
							elseif arg_107_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
								Social.IBEHACGBI(arg_111_1.controller, arg_107_0.platformId)
								Social.DAFDEJICJJ(arg_111_1.controller, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_107_0.platformId, arg_107_0.fullName)
							end

							arg_111_0:dispatchEventToRoot({
								name = "request_fetch_data"
							})
						end
					},
					{
						label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
						action = function()
							LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

							if arg_107_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
								Social.CGIDFEJECG(arg_111_1.controller, arg_107_0.xuid)
							elseif arg_107_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
								Social.JHHJICGHG(arg_111_1.controller, arg_107_0.platformId)
							end

							arg_111_0:dispatchEventToRoot({
								name = "request_fetch_data"
							})
						end
					},
					{
						label = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_REQUEST"),
						action = function()
							LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

							if arg_107_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
								Social.CGIDFEJECG(arg_111_1.controller, arg_107_0.xuid)
								Social.DACDEGEDDD(arg_111_1.controller, arg_107_0.xuid, arg_107_0.fullName)
							elseif arg_107_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
								Social.JHHJICGHG(arg_111_1.controller, arg_107_0.platformId)
								Social.BIFIFEECCJ(arg_111_1.controller, arg_107_0.platformId)
							end

							arg_111_0:dispatchEventToRoot({
								name = "request_fetch_data"
							})
						end
					},
					{
						label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
						action = function()
							return
						end
					}
				}

				LUI.FlowManager.RequestPopupMenu(arg_111_0, "GenericConfirmPopup", false, arg_111_1.controller, false, var_111_0, nil, true, true)
			end
		elseif arg_107_2 == FRIENDS.ManageFriendsTabIDs.BLOCKED_PLAYERS then
			function var_107_0(arg_116_0, arg_116_1)
				local var_116_0 = {
					title = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_BLOCK"),
					message = Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK_MESSAGE"),
					extraMessage = Engine.JCBDICCAH(arg_107_0.fullName)
				}

				var_116_0.itemImage = "icon_warning_large"
				var_116_0.buttons = {
					{
						label = Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK"),
						action = function()
							if arg_107_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
								Social.EIGAJHEGI(arg_116_1.controller, arg_107_0.xuid)
							elseif arg_107_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
								Social.JGFDEBFAC(arg_107_0.platformId)
							end

							arg_116_0:dispatchEventToRoot({
								name = "request_fetch_data"
							})
						end
					},
					{
						label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
						action = function()
							return
						end
					}
				}

				LUI.FlowManager.RequestPopupMenu(arg_116_0, "GenericConfirmPopup", false, arg_116_1.controller, false, var_116_0, nil, true, true)
			end
		else
			arg_107_0.selectedTab = FRIENDS.FriendTypeToTabIDs[arg_107_0.friendsListType]
			var_107_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_107_1, arg_107_0)
		end
	elseif arg_107_1 == FRIENDS.TabIDs.RECENT_PLAYERS then
		var_107_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_107_1, arg_107_0)
	elseif arg_107_1 == FRIENDS.TabIDs.PRIVATE_PARTY then
		if arg_107_2 == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS then
			function var_107_0(arg_119_0, arg_119_1)
				local var_119_0 = Friends.CAIJHBHGGC(arg_107_0.xuid)
				local var_119_1 = FRIENDS.FriendTypeToTabIDs[arg_107_0.friendsListType]

				Invitation.DIDIHAJHGA(arg_119_1.controller, var_119_0, arg_107_0.platformId)
			end
		elseif arg_107_2 == FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS then
			function var_107_0(arg_120_0, arg_120_1)
				if CONDITIONS.IsInGameBattlesMatch() then
					Engine.DBFFAEEFGJ():dispatchEventToRoot({
						name = "gamebattles_social_leave_menu"
					})
				end

				Invitation.DHACFECHAG(arg_107_0.invitationID)
			end
		else
			var_107_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_107_1, arg_107_0)
		end
	elseif arg_107_1 == FRIENDS.TabIDs.REGIMENTS then
		if arg_107_2 == FRIENDS.ManageRegimentInvitesTabIDs.SENT_INVITES then
			function var_107_0(arg_121_0, arg_121_1)
				Clans.CFJCAAHHGE(arg_121_1.controller, arg_107_0.clanId, arg_107_0.xuid)

				local var_121_0 = {
					icon = "hud_info_alert",
					displayTime = 3000,
					description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_REVOKED")
				}

				arg_121_0:dispatchEventToRoot({
					name = "send_toast_notification",
					immediate = true,
					options = var_121_0
				})
			end
		elseif arg_107_2 == FRIENDS.ManageRegimentInvitesTabIDs.REGIMENT_INVITATIONS then
			function var_107_0(arg_122_0, arg_122_1)
				local var_122_0 = {
					title = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITATION")
				}

				var_122_0.itemImage = "mm_element_logo_white"
				var_122_0.message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITATION_MESSAGE", Engine.JCBDICCAH(arg_107_0.clanName))
				var_122_0.buttons = {
					{
						label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
						action = function()
							Clans.IEHDGEGJC(arg_122_1.controller, arg_107_0.clanId)
						end
					},
					{
						label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
						action = function()
							Clans.DJIFJAAFAI(arg_122_1.controller, arg_107_0.clanId)

							local var_124_0 = {
								icon = "hud_info_alert",
								displayTime = 3000,
								description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_DECLINED")
							}

							arg_122_0:dispatchEventToRoot({
								name = "send_toast_notification",
								immediate = true,
								options = var_124_0
							})
						end
					},
					{
						label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
						action = function()
							return
						end
					}
				}

				LUI.FlowManager.RequestPopupMenu(arg_122_0, "GenericConfirmPopup", false, arg_122_1.controller, false, var_122_0, nil, true, true)
			end
		else
			var_107_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_107_1, arg_107_0)
		end
	end

	return var_107_0
end

function FRIENDS.GetPlayerSubTabContextualMenu(arg_126_0, arg_126_1, arg_126_2, arg_126_3)
	assert(arg_126_2)

	if not arg_126_0 then
		return
	end

	local var_126_0 = {}

	if arg_126_2 == FRIENDS.TabIDs.FRIENDS then
		if arg_126_3 == FRIENDS.ManageFriendsTabIDs.SENT_INVITES then
			LUI.ConcatenateToTable(var_126_0, {
				{
					id = "declineRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_126_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.BHCIIHHAAC(arg_126_1, arg_126_0.xuid)
						elseif arg_126_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.DHHEFJGEJC(arg_126_1, arg_126_0.invitationId)
						end

						local var_127_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_127_0, {
							name = "request_fetch_data"
						})
					end
				}
			})
		elseif arg_126_3 == FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS then
			LUI.ConcatenateToTable(var_126_0, {
				{
					id = "acceptRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_126_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.BIHDCJGFCI(arg_126_1, arg_126_0.xuid)
							Social.DAFDEJICJJ(arg_126_1, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_126_0.xuid, arg_126_0.fullName)
						elseif arg_126_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.IBEHACGBI(arg_126_1, arg_126_0.platformId)
							Social.DAFDEJICJJ(arg_126_1, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_126_0.platformId, arg_126_0.fullName)
						end

						local var_128_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_128_0, {
							name = "request_fetch_data"
						})
					end
				},
				{
					id = "declineRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_126_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.CGIDFEJECG(arg_126_1, arg_126_0.xuid)
						elseif arg_126_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.JHHJICGHG(arg_126_1, arg_126_0.platformId)
						end

						local var_129_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_129_0, {
							name = "request_fetch_data"
						})
					end
				},
				{
					id = "blockRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_126_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.CGIDFEJECG(arg_126_1, arg_126_0.xuid)
							Social.DACDEGEDDD(arg_126_1, arg_126_0.xuid, arg_126_0.fullName)
						elseif arg_126_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.JHHJICGHG(arg_126_1, arg_126_0.platformId)
							Social.BIFIFEECCJ(arg_126_1, arg_126_0.platformId)
						end

						local var_130_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_130_0, {
							name = "request_fetch_data"
						})
					end
				}
			})
		elseif arg_126_3 == FRIENDS.ManageFriendsTabIDs.BLOCKED_PLAYERS then
			LUI.ConcatenateToTable(var_126_0, {
				{
					id = "acceptRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_126_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.EIGAJHEGI(arg_126_1, arg_126_0.xuid)
						elseif arg_126_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.JGFDEBFAC(arg_126_0.platformId)
						end

						local var_131_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_131_0, {
							name = "request_fetch_data"
						})
					end
				}
			})
		end
	elseif arg_126_2 == FRIENDS.TabIDs.REGIMENTS and arg_126_3 == FRIENDS.ManageRegimentInvitesTabIDs.REGIMENT_INVITATIONS then
		LUI.ConcatenateToTable(var_126_0, {
			{
				id = "acceptRequest",
				label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
				action = function()
					Clans.IEHDGEGJC(arg_126_1, arg_126_0.clanId)

					local var_132_0 = {
						icon = "hud_info_alert",
						displayTime = 3000,
						description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_ACCEPTED")
					}
					local var_132_1 = Engine.DBFFAEEFGJ()

					LUI.UIRoot.ProcessEvent(var_132_1, {
						name = "send_toast_notification",
						immediate = true,
						options = var_132_0
					})
				end
			},
			{
				id = "declineRequest",
				label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
				action = function()
					Clans.DJIFJAAFAI(arg_126_1, arg_126_0.clanId)

					local var_133_0 = {
						icon = "hud_info_alert",
						displayTime = 3000,
						description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_DECLINED")
					}
					local var_133_1 = Engine.DBFFAEEFGJ()

					LUI.UIRoot.ProcessEvent(var_133_1, {
						name = "send_toast_notification",
						immediate = true,
						options = var_133_0
					})
				end
			}
		})
	end

	return var_126_0
end

function FRIENDS.GetRefreshPlayerChildFunc(arg_134_0, arg_134_1)
	return function(arg_135_0, arg_135_1, arg_135_2)
		function arg_135_0.UpdatePlayerDetailsContent(arg_136_0, arg_136_1)
			arg_134_0:UpdatePlayerDetails(arg_136_0, arg_136_1)
		end

		local var_135_0 = arg_135_1 + arg_135_2 * 2

		arg_135_0:SetCurrentLocation(arg_134_1)

		if arg_134_1 == FRIENDS.TabIDs.FRIENDS or arg_134_1 == FRIENDS.TabIDs.RECENT_PLAYERS then
			arg_135_0:SetupPlayerData(arg_134_0.PlayersGrid._friendsData.friends[var_135_0 + 1 - arg_134_0.PlayersGrid.getFriendFrom])
		elseif arg_134_1 == FRIENDS.TabIDs.PRIVATE_PARTY or arg_134_1 == FRIENDS.TabIDs.REGIMENTS then
			local var_135_1 = FRIENDS.UnifyPlayerDataFormat(arg_134_0.PlayersGrid.playersData[var_135_0 + 1])

			arg_135_0:SetupPlayerData(var_135_1)
		end
	end
end

function FRIENDS.UnifyPlayerDataFormat(arg_137_0)
	local var_137_0 = arg_137_0

	if arg_137_0.xuidString and not arg_137_0.xuid then
		var_137_0.xuid = arg_137_0.xuidString
	end

	if arg_137_0.gamertag and not arg_137_0.fullName then
		var_137_0.fullName = arg_137_0.gamertag
	end

	if arg_137_0.name and not arg_137_0.fullName then
		var_137_0.fullName = arg_137_0.name
	end

	if arg_137_0.clientPlatform and not arg_137_0.presencePlatform then
		var_137_0.presencePlatform = ClientPlatformToPresencePlatform[arg_137_0.clientPlatform]
	end

	if arg_137_0.platform and not arg_137_0.presencePlatform then
		var_137_0.presencePlatform = arg_137_0.platform
	end

	if arg_137_0.clanName and not arg_137_0.fullName then
		var_137_0.fullName = arg_137_0.clanName
	end

	if arg_137_0.isMyPlayer then
		if CONDITIONS.IsBattleNet() then
			local var_137_1 = 0
			local var_137_2 = Engine.EAGGAEGHHA(var_137_1)

			var_137_0.onlineStatus = Social.ECDAFHBHGC(var_137_1, var_137_2, true)
		else
			var_137_0.onlineStatus = BattleNetOnlineStatus.ONLINE
		end
	end

	return var_137_0
end

function FRIENDS.GetNotificationDataSourceByTab(arg_138_0)
	local var_138_0

	if arg_138_0 == FRIENDS.TabIDs.FRIENDS then
		var_138_0 = DataSources.frontEnd.social.friendRequestCount
	elseif arg_138_0 == FRIENDS.TabIDs.PRIVATE_PARTY then
		var_138_0 = DataSources.frontEnd.social.partyInvitationCount
	elseif arg_138_0 == FRIENDS.TabIDs.REGIMENTS then
		var_138_0 = DataSources.frontEnd.social.regimentInvitationCount
	end

	return var_138_0
end

function FRIENDS.IsHappyHourActive(arg_139_0)
	if #(Clans.CEACCICGB(arg_139_0) or {}) > 0 then
		local var_139_0 = Clans.CFGBBBHFHB(arg_139_0)

		assert(var_139_0, "clanId is nil even though we've joined a clan.")

		local var_139_1 = var_139_0 and Clans.CBJDIGCAED(arg_139_0, var_139_0) or nil

		if var_139_1 and var_139_1.secondsInHappyHour then
			return var_139_1.secondsInHappyHour > 0
		end
	end

	return false
end

function FRIENDS.GetCurrentClanTagType(arg_140_0)
	local var_140_0 = ClanTagType.CUSTOM

	if Engine.BAHCIEEBFD(arg_140_0) then
		var_140_0 = LUI.DataSourceFromPlayerData.new(CoD.StatsGroup.Common, CoD.PlayMode.Core).clanTagType:GetValue(arg_140_0)
	end

	return var_140_0 or ClanTagType.CUSTOM
end

function FRIENDS.GetHappyHourSetTimeString(arg_141_0, arg_141_1)
	local var_141_0 = Clans.CBJDIGCAED(arg_141_0, arg_141_1)

	if var_141_0 then
		if IsLanguageEnglish() then
			local var_141_1, var_141_2 = Engine.CBBHFCGDIC("LUA_MENU/TIME_PERIOD_AM"), Engine.CBBHFCGDIC("LUA_MENU/TIME_PERIOD_PM")
			local var_141_3 = var_141_0.happyHour

			if var_141_3 == 0 then
				var_141_3 = 12
			elseif var_141_3 >= 12 then
				var_141_1 = var_141_2

				if var_141_3 > 12 then
					var_141_3 = var_141_3 - 12
				end
			end

			return Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_SET", var_141_3, string.format("%02d", var_141_0.happyMinutes), var_141_1)
		else
			return Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_SET", string.format("%02d", var_141_0.happyHour), string.format("%02d", var_141_0.happyMinutes))
		end
	else
		return ""
	end
end

function FRIENDS.TryAppendRealIdToBattleTag(arg_142_0, arg_142_1)
	local var_142_0 = Social.CFEIHAADEI(arg_142_0)
	local var_142_1 = Engine.BECCFCBIAA("displayRealID")

	if var_142_0 and var_142_1 == 1 then
		local var_142_2 = var_142_0.fullName

		if var_142_2 ~= nil and #var_142_2 > 0 then
			return Engine.CBBHFCGDIC("LUA_MENU/BATTLETAG_WITH_READ_ID_NAME", Engine.JCBDICCAH(arg_142_1), Engine.JCBDICCAH(var_142_2))
		else
			return arg_142_1
		end
	end

	return arg_142_1
end
