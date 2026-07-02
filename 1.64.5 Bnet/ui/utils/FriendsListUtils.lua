FRIENDS = FRIENDS or {}
FRIENDS.maxMetFriends = 200
FRIENDS.maxRecentSquadPlayers = 100
FRIENDS.maxNameLength = 36
FRIENDS.SOCIAL_MENU_CACHED_FAVORITE_FRIENDS = 16
FRIENDS.SOCIAL_MENU_CACHED_ONLINE_FRIENDS = 20
FRIENDS.SOCIAL_MENU_CACHED_RECENT_PLAYERS = 40
FRIENDS.SOCIAL_MENU_CACHED_RECENT_SQUAD_PLAYERS = 40
FRIENDS.SOCIAL_MENU_CACHED_FRIENDS = 40
FRIENDS.MAX_FAVORITE_FRIENDS = 16
FRIENDS.CLANS_MAX_JOINED_CLANS = 10
FRIENDS.CLANS_MAX_MEMBERS = 250
FRIENDS.CLANS_CLANTAG_LENGTH = 5
FRIENDS.CLANS_MAX_NAME_LENGTH = 28
FRIENDS.CLAN_NAME_MAX_NUMERIC = 6
FRIENDS.MAX_DIGITS_IN_CLAN_NAME = 6
FRIENDS.Constants = {
	FriendButtonHeight = 90,
	reportOffensiveVoiceChat = 16,
	reportCheatingLobbyPlayer = 6,
	reportOffensiveUGC = 12,
	reportOffensiveClanTag = 14,
	reportOffensiveLobbyPlayer = 4,
	reportExploitingLobbyPlayer = 5,
	reportBoostingLobbyPlayer = 7,
	scrollbarWidth = 14,
	reportOffensiveUsername = 13,
	reportOffensiveTextChat = 15
}
FRIENDS.TabIDs = {
	RECENT_PLAYERS = 3,
	ONLINE_FRIENDS = 0,
	CROSSPLAY_FRIENDS = 4,
	INVITATION_MANAGEMENT = 10,
	FRIENDS = 6,
	INBOX = 9,
	FAVORITE_FRIENDS = 5,
	RECENT_SQUAD_PLAYERS = 7,
	PRIVATE_PARTY = 1,
	REGIMENTS = 2,
	CLANS = 8
}
FRIENDS.UserListTypes = {
	RECENT_PLAYERS = 0,
	BLOCKED_PLAYERS = 1,
	MUTED_PLAYERS = 2,
	RECENT_SQUAD_PLAYERS = 3
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
	},
	ZEUS = {
		icon = "icon_battle_net_bo5",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_BO5"
	},
	FORE = {
		icon = "icon_battle_net_vanguard",
		name = "LUA_MENU/TEXTCHAT_GAMENAME_VANGUARD"
	}
}
FRIENDS.PlatformIcon = {
	[PresencePlatform.NONE] = "icon_social_friend_atvi",
	[PresencePlatform.XBOX_ONE] = "icon_platform_xbox",
	[PresencePlatform.PS4] = "icon_platform_playstation",
	[PresencePlatform.XB4] = "icon_platform_xbox",
	[PresencePlatform.PS5] = "icon_platform_playstation",
	[PresencePlatform.BNET] = "icon_platform_bnet",
	[PresencePlatform.IOS] = "icon_platform_pc",
	[PresencePlatform.STEAM] = "icon_platform_laze",
	[PresencePlatform.WEGAME] = "icon_social_friend_atvi",
	[PresencePlatform.CROSSPLAY_CONSOLE] = "icon_platform_console",
	[PresencePlatform.CROSSPLAY_PC] = "icon_platform_pc"
}
FRIENDS.PlatformFriendText = {
	[PresencePlatform.NONE] = Engine.CBBHFCGDIC(""),
	[PresencePlatform.XBOX_ONE] = Engine.CBBHFCGDIC("LUA_MENU/XBOX_FRIEND"),
	[PresencePlatform.PS4] = Engine.CBBHFCGDIC("LUA_MENU/PLAYSTATION_FRIEND"),
	[PresencePlatform.XB4] = Engine.CBBHFCGDIC("LUA_MENU/XBOX_FRIEND"),
	[PresencePlatform.PS5] = Engine.CBBHFCGDIC("LUA_MENU/PLAYSTATION_FRIEND"),
	[PresencePlatform.BNET] = Engine.CBBHFCGDIC("LUA_MENU/BNET_FRIEND"),
	[PresencePlatform.STEAM] = Engine.CBBHFCGDIC("LUA_MENU/LAZE_FRIEND"),
	[PresencePlatform.CROSSPLAY_CONSOLE] = Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_CONSOLE_FRIEND"),
	[PresencePlatform.CROSSPLAY_PC] = Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_PC_FRIEND")
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
FRIENDS.INVITATIONS = {
	ID = {
		CLANS2_INVITE_SENT = "clans2_invite_sent",
		FRIEND_INVITE_RECEIVED = "friend_invite_received",
		CLANS2_INVITE_RECEIVED = "clans2_invite_received",
		PARTY_INVITE_RECEIVED = "party_invite_received",
		CLANS2_REQUEST_RECEIVED = "clans2_request_received",
		FRIEND_INVITE_SENT = "friend_invite_sent",
		CLANS2_REQUEST_SENT = "clans2_request_sent"
	},
	BUTTONS = {
		ACCEPT = "AcceptButton",
		DENY = "DenyButton",
		INSPECT = "InspectButton",
		REVOKE = "RevokeButton"
	}
}

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
	"revokeRegiment",
	"acceptRequest",
	"declineRequest",
	"blockRequest"
}
local var_0_1 = {
	"acceptInvite",
	"declineInvite"
}
local var_0_2 = {
	"acceptInviteRequest",
	"declineInviteRequest",
	"revokeInvite",
	"changeRole",
	"removeMember",
	"promoteToOwner",
	"promoteToOfficer",
	"promoteToAdmin",
	"demoteToOfficer",
	"demoteToMember",
	"inviteToClan",
	"viewClan",
	"revokeInviteToClan",
	"changeRank",
	"banFromClan",
	"undoBanFromClan",
	"requestToJoinClan",
	"joinClan"
}

local function var_0_3(arg_1_0)
	if not arg_1_0.platformId then
		return false
	end

	local var_1_0 = arg_1_0.xuidString or arg_1_0.xuid
	local var_1_1 = Friends.CCBABDAGGJ(arg_1_0.controllerIndex, var_1_0, arg_1_0.platformId or "0", arg_1_0.selectedTab)

	if type(var_1_0) ~= "userdata" then
		var_1_0 = Friends.CAIJHBHGGC(var_1_0)
	end

	return var_1_1.isValidEntry and (CONDITIONS.IsMagmaGameMode() ~= true or Lobby.CHBBHFHJEH(var_1_0) ~= true)
end

local function var_0_4(arg_2_0)
	local var_2_0 = arg_2_0.xuidString or arg_2_0.xuid
	local var_2_1 = arg_2_0.platformId or "0"

	if arg_2_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS then
		return Friends.BIAJAECICH(arg_2_0.controllerIndex, var_2_0)
	else
		return Friends.DIIAFCGBDA(arg_2_0.controllerIndex, var_2_0, var_2_1)
	end
end

local function var_0_5(arg_3_0)
	return type(arg_3_0.xuid) == "userdata" and arg_3_0.xuid or Friends.CAIJHBHGGC(arg_3_0.xuidString or arg_3_0.xuid)
end

local function var_0_6(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if not arg_4_2 then
		return true
	end

	local var_4_0 = Invitation.ECGAJEGAIC(arg_4_0, arg_4_1, arg_4_2, arg_4_3)

	if Dvar.IBEGCHEFE("enable_join_cross_launch_override") and var_4_0.disabled then
		var_4_0.disabled = var_4_0.disabled and Engine.BBHGAFFFGE(arg_4_0, arg_4_1) ~= 2
	end

	local var_4_1, var_4_2 = Engine.CFHECDBFGF(arg_4_0, false)

	if not var_4_1 then
		local var_4_3

		var_4_1, var_4_3 = Engine.EBAAEFCBJA(arg_4_0, false)
	end

	if not var_4_1 then
		var_4_0.disabled = true
		var_4_0.devErrorString = "MPNotAllowed"
		var_4_0.errorString = "ONLINE/CANT_JOIN_NO_MP_PRIVILEGE"
	end

	return var_4_0
end

local function var_0_7(arg_5_0)
	local var_5_0 = {
		label = Engine.CBBHFCGDIC(arg_5_0)
	}

	var_5_0.id = "header"

	return var_5_0
end

local function var_0_8(arg_6_0)
	local var_6_0 = arg_6_0.controllerIndex
	local var_6_1 = arg_6_0.invitationData
	local var_6_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_CLAN_INVITE")
	}

	var_6_2.id = "acceptInvite"

	function var_6_2.disabledFunc()
		return var_6_1 == nil
	end

	function var_6_2.action()
		return CLANS.AcceptClanInvite(var_6_1, var_6_0)
	end

	return var_6_2
end

local function var_0_9(arg_9_0)
	local var_9_0 = arg_9_0.controllerIndex
	local var_9_1 = arg_9_0.invitationData
	local var_9_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_CLAN_INVITE")
	}

	var_9_2.id = "declineInvite"

	function var_9_2.disabledFunc()
		return var_9_1 == nil
	end

	function var_9_2.action()
		return CLANS.DenyClanInvite(var_9_1, var_9_0)
	end

	return var_9_2
end

local function var_0_10(arg_12_0)
	local var_12_0 = arg_12_0.controllerIndex
	local var_12_1 = var_0_5(arg_12_0)
	local var_12_2 = arg_12_0.platformId
	local var_12_3 = arg_12_0.selectedTab
	local var_12_4 = {
		label = Engine.CBBHFCGDIC("MENU/JOIN_GAME")
	}

	var_12_4.id = "joinGame"
	var_12_4.refreshOnAction = true

	function var_12_4.disabledFunc()
		return not var_0_3(arg_12_0) or var_0_6(var_12_0, var_12_1, var_12_2, var_12_3)
	end

	function var_12_4.action()
		local function var_14_0()
			local var_15_0 = var_12_4.disabledFunc()

			if var_15_0 and not var_15_0.disabled then
				local var_15_1 = Engine.DCHCGDJCGB(var_12_0)
				local var_15_2 = Engine.DCCCGHJJCJ(var_12_0)

				if arg_12_0.gameTitle and arg_12_0.gameTitle ~= var_15_2 then
					Friends.CIJIDFCEHD(var_12_0, var_12_1)
				else
					Friends.DACCIAAAAB(var_12_0, var_12_1, var_12_2)
				end
			end
		end

		FRIENDS.TryJoinUserParty(var_14_0)
	end

	return var_12_4
end

local function var_0_11(arg_16_0)
	local var_16_0 = arg_16_0.controllerIndex
	local var_16_1 = var_0_5(arg_16_0)
	local var_16_2 = arg_16_0.platformId
	local var_16_3 = arg_16_0.selectedTab
	local var_16_4 = not Engine.DDJFBBJAIG()
	local var_16_5 = Engine.DAFGFCFHJI()
	local var_16_6 = {
		label = (var_16_4 or var_16_5) and Engine.CBBHFCGDIC("MENU/INVITE_TO_GAME") or Engine.CBBHFCGDIC("MENU/INVITE_TO_PARTY")
	}

	var_16_6.id = "sendInvite"
	var_16_6.refreshOnAction = true

	function var_16_6.disabledFunc()
		return not var_0_3(arg_16_0) or Invitation.DCDABCADAF(var_16_0, var_16_1, var_16_2, var_16_3)
	end

	function var_16_6.action()
		local var_18_0 = var_16_6.disabledFunc()

		if var_18_0 and not var_18_0.disabled then
			Invitation.DIDIHAJHGA(var_16_0, var_16_1, var_16_2)
		end
	end

	return var_16_6
end

local function var_0_12(arg_19_0)
	local var_19_0

	if arg_19_0.xuidString then
		var_19_0 = arg_19_0.xuidString
	else
		var_19_0 = arg_19_0.xuid
	end

	local var_19_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/INVITE_TO_REGIMENT", Engine.JCBDICCAH(arg_19_0.clanName))
	}

	var_19_1.id = "sendClanInvite"
	var_19_1.refreshOnAction = true

	function var_19_1.disabledFunc()
		local var_20_0 = {}
		local var_20_1 = Clans.CHEADIHHBJ(arg_19_0.controllerIndex, arg_19_0.clanID, var_19_0).memberFound
		local var_20_2 = FRIENDS.IsClanInvitePending(arg_19_0.controllerIndex, arg_19_0.clanID, var_19_0)

		var_20_0.disabled = not var_0_3(arg_19_0) or var_20_1 or var_20_2
		var_20_0.errorString = ""
		var_20_0.devErrorString = ""

		if var_20_1 then
			var_20_0.errorString = "LUA_MENU/REGIMENT_MEMBER_EXISTS"
			var_20_0.devErrorString = Engine.CBBHFCGDIC(var_20_0.errorString)
		end

		return var_20_0
	end

	function var_19_1.action()
		local var_21_0 = var_19_1.disabledFunc()

		if var_21_0 and not var_21_0.disabled then
			Clans.DIEAGEDBCC(arg_19_0.controllerIndex, arg_19_0.clanID, var_19_0)
		end
	end

	return var_19_1
end

local function var_0_13(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = Engine.EAGGAEGHHA(arg_22_0)
	local var_22_1 = Clans.BFCDHGIGGC(arg_22_0, arg_22_1)
	local var_22_2 = Clans.CHEADIHHBJ(arg_22_0, arg_22_1, arg_22_2)
	local var_22_3 = false

	if var_22_2.memberFound then
		if var_22_0 == var_22_1 then
			var_22_3 = true
		elseif var_22_2.role == OnlineClanRole.MEMBER then
			var_22_3 = true
		end
	end

	return var_22_3
end

local function var_0_14(arg_23_0)
	local var_23_0

	if arg_23_0.xuidString then
		var_23_0 = arg_23_0.xuidString
	else
		var_23_0 = arg_23_0.xuid
	end

	local var_23_1 = {
		label = Engine.CBBHFCGDIC("REGIMENTS/KICK_FROM_REGIMENT", Engine.JCBDICCAH(arg_23_0.clanName))
	}

	var_23_1.id = "kickClanMember"
	var_23_1.refreshOnAction = true

	function var_23_1.disabledFunc()
		local var_24_0 = {}
		local var_24_1 = Clans.CHEADIHHBJ(arg_23_0.controllerIndex, arg_23_0.clanID, var_23_0).memberFound
		local var_24_2 = var_0_13(arg_23_0.controllerIndex, arg_23_0.clanID, var_23_0)

		var_24_0.disabled = not var_0_3(arg_23_0) or not var_24_1 or not var_24_2
		var_24_0.errorString = ""
		var_24_0.devErrorString = ""

		if not var_24_1 then
			var_24_0.errorString = "REGIMENTS/MEMBER_NOT_FOUND"
			var_24_0.devErrorString = Engine.CBBHFCGDIC(var_24_0.errorString)
		elseif not var_24_2 then
			var_24_0.errorString = "REGIMENTS/CANNOT_KICK_MEMBER"
			var_24_0.devErrorString = Engine.CBBHFCGDIC(var_24_0.errorString)
		end

		return var_24_0
	end

	function var_23_1.action()
		local var_25_0 = var_23_1.disabledFunc()

		if var_25_0 and not var_25_0.disabled then
			Clans.BJFFGACEBD(arg_23_0.controllerIndex, arg_23_0.clanID, var_23_0)
		end
	end

	return var_23_1
end

local function var_0_15(arg_26_0)
	local var_26_0 = arg_26_0.controllerIndex
	local var_26_1 = var_0_5(arg_26_0)
	local var_26_2 = arg_26_0.isBot and true or false
	local var_26_3 = {
		label = Engine.CBBHFCGDIC("XBOXLIVE/KICK")
	}

	var_26_3.id = "kickPlayer"

	function var_26_3.disabledFunc()
		local var_27_0 = Lobby.BBDICGHE()
		local var_27_1 = var_27_0 and Lobby.DFFFFJHCEH() and IsPrivateMatch() or not var_27_0 and Lobby.BGIADHIHAG()

		return var_26_2 or not Engine.DDJFBBJAIG() or not var_27_1 or Lobby.CHBBHFHJEH(var_26_1) or IsMlgGameBattlesMatch()
	end

	function var_26_3.action()
		if Lobby.DDADACHHAE(var_26_1) then
			LUI.FlowManager.RequestPopupMenu(nil, "LobbyMemberKick", true, var_26_0, false, {
				xuid = var_26_1
			})
		end
	end

	return var_26_3
end

local function var_0_16(arg_29_0)
	local var_29_0 = arg_29_0.controllerIndex
	local var_29_1 = var_0_5(arg_29_0)
	local var_29_2 = {
		label = Engine.CBBHFCGDIC("CODCASTER/FOLLOW")
	}

	var_29_2.id = "followPlayer"

	function var_29_2.disabledFunc()
		local var_30_0 = Lobby.GetLocalPlayerDataSource(var_29_0).followersCount:GetValue(var_29_0)

		return not Engine.DDJFBBJAIG() or Lobby.CHBBHFHJEH(var_29_1) or var_30_0 > 0 or arg_29_0.memberTeam == Teams.follower
	end

	function var_29_2.action()
		if Lobby.DDADACHHAE(var_29_1) then
			Lobby.BFBCBFEGFI(var_29_0, Teams.follower)
			LobbyMember.BABJJDBHCH(true, var_29_0)
			LobbyMember.CGEEIHHBAA(arg_29_0.memberIndex, var_29_0)
			LobbyMember.IFIJDJICI(true, var_29_0)
		end
	end

	return var_29_2
end

local function var_0_17(arg_32_0)
	local var_32_0 = {
		label = Engine.CBBHFCGDIC("CODCASTER/MOVE_UP")
	}

	var_32_0.id = "moveUp"

	function var_32_0.disabledFunc()
		local var_33_0 = Lobby.GetPreviousFollowablePlayerNum(arg_32_0.memberIndex)

		return not Engine.DDJFBBJAIG() or not var_33_0 or arg_32_0.memberTeam == Teams.follower
	end

	function var_32_0.action()
		local var_34_0 = Lobby.GetPreviousFollowablePlayerNum(arg_32_0.memberIndex)

		if var_34_0 then
			Lobby.HIJBFHIGF(arg_32_0.memberIndex, var_34_0)
		end
	end

	return var_32_0
end

local function var_0_18(arg_35_0)
	local var_35_0 = {
		label = Engine.CBBHFCGDIC("CODCASTER/MOVE_DOWN")
	}

	var_35_0.id = "moveDown"

	function var_35_0.disabledFunc()
		local var_36_0 = Lobby.GetNextFollowablePlayerNum(arg_35_0.memberIndex)

		return not Engine.DDJFBBJAIG() or not var_36_0 or arg_35_0.memberTeam == Teams.follower
	end

	function var_35_0.action()
		local var_37_0 = Lobby.GetNextFollowablePlayerNum(arg_35_0.memberIndex)

		if var_37_0 then
			Lobby.HIJBFHIGF(arg_35_0.memberIndex, var_37_0)
		end
	end

	return var_35_0
end

local function var_0_19(arg_38_0, arg_38_1, arg_38_2)
	return {
		label = LocalizeIntoString(MP.GetTeamInfo(arg_38_2).name, "CODCASTER/ASSIGN_TO_TEAM"),
		id = arg_38_1,
		disabledFunc = function()
			return not Engine.DDJFBBJAIG()
		end,
		action = function()
			Lobby.DCGHHFGDCE(arg_38_0.memberIndex, arg_38_2)
		end
	}
end

local function var_0_20(arg_41_0)
	local var_41_0 = LUI.ShallowCopy(arg_41_0)
	local var_41_1 = var_41_0.controllerIndex
	local var_41_2 = var_0_5(var_41_0)
	local var_41_3 = var_41_0.gamertag

	if var_41_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS or not Engine.DBFCJBDJEC() then
		var_41_0.selectedTab = FRIENDS.TabIDs.CROSSPLAY_FRIENDS
	end

	local var_41_4 = {
		label = Engine.CBBHFCGDIC("MENU/SOCIAL_WHISPER")
	}

	var_41_4.id = "whisper"

	function var_41_4.disabledFunc()
		local var_42_0 = LUI.TextChat.GetLayer()

		if not var_42_0 or not LUI.TextChat.ShouldBeVisible(var_42_0) then
			return true
		end

		if not var_0_4(var_41_0) then
			return true
		end

		local var_42_1 = var_41_0.selectedTab == FRIENDS.TabIDs.ONLINE_FRIENDS and var_41_0.platformId or Friends.BEJHAIFIAB(var_41_2)

		return not Social.BGEBDBIHFA(var_41_1, var_42_1)
	end

	function var_41_4.action()
		if not var_41_4.disabledFunc() then
			local var_43_0 = LUI.TextChat.GetLayer()
			local var_43_1 = var_41_0.selectedTab == FRIENDS.TabIDs.ONLINE_FRIENDS and var_41_0.platformId or Friends.BEJHAIFIAB(var_41_2)

			var_43_0:InitiateWhisperWithXUID(var_41_1, var_43_1, var_41_3)
			LUI.TextChat.StartEditing(var_43_0, var_41_1)
		end
	end

	return var_41_4
end

local function var_0_21(arg_44_0)
	local var_44_0 = arg_44_0.controllerIndex
	local var_44_1 = var_0_5(arg_44_0)
	local var_44_2 = arg_44_0.clientNum
	local var_44_3 = arg_44_0.isBot and true or false
	local var_44_4 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/MUTE_UNMUTE")
	}

	var_44_4.id = "mutePlayer"

	function var_44_4.disabledFunc()
		return var_44_3 or Lobby.CHBBHFHJEH(var_44_1) or IsMlgGameBattlesMatch()
	end

	function var_44_4.action()
		if var_44_2 and not Engine.DDJFBBJAIG() then
			Game.CBEICJFEHB(var_44_2)
			LUI.UIRoot.GetRootForControllerIndex(var_44_0):dispatchEventToChildren({
				name = "kbm_button_mute_action",
				clientNum = var_44_2
			})
		else
			Lobby.CHICEBEEEI(var_44_0, var_44_1)
		end
	end

	return var_44_4
end

local function var_0_22(arg_47_0)
	local var_47_0 = LUI.ShallowCopy(arg_47_0)
	local var_47_1 = var_47_0.controllerIndex
	local var_47_2 = var_0_5(var_47_0)
	local var_47_3 = var_47_0.platformId

	if var_47_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS then
		var_47_0.selectedTab = FRIENDS.TabIDs.CROSSPLAY_FRIENDS
	end

	local var_47_4 = var_47_0.selectedTab
	local var_47_5 = var_47_0.isBot and true or false
	local var_47_6 = {
		label = var_47_0.isContextualMenu and Engine.CBBHFCGDIC("MENU/SEND_FRIEND_REQUEST") or Engine.CBBHFCGDIC("MENU/FRIEND_REQUEST")
	}

	var_47_6.id = "friendRequest"

	function var_47_6.disabledFunc()
		return var_47_5 or var_0_4(var_47_0) or Lobby.CHBBHFHJEH(var_47_2)
	end

	function var_47_6.action()
		if not var_47_6.disabledFunc() then
			if var_47_4 == FRIENDS.TabIDs.ONLINE_FRIENDS then
				Social.HJFBFFDD(var_47_1, var_47_3, false)
			else
				Social.DEIAGIIJDF(var_47_1, Friends.BEJHAIFIAB(var_47_2))
			end
		end
	end

	return var_47_6
end

local function var_0_23(arg_50_0)
	local var_50_0 = arg_50_0.controllerIndex
	local var_50_1 = arg_50_0.platformId
	local var_50_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/UPGRADE_REAL_ID")
	}

	var_50_2.id = "upgradeRealId"

	function var_50_2.disabledFunc()
		return not var_0_4(arg_50_0)
	end

	function var_50_2.action()
		Social.HJFBFFDD(var_50_0, var_50_1, true)
	end

	return var_50_2
end

local function var_0_24(arg_53_0)
	local var_53_0 = LUI.ShallowCopy(arg_53_0)
	local var_53_1 = var_53_0.controllerIndex
	local var_53_2 = var_0_5(var_53_0)
	local var_53_3 = var_53_0.platformId

	if var_53_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS then
		var_53_0.selectedTab = FRIENDS.TabIDs.CROSSPLAY_FRIENDS
	end

	local var_53_4 = var_53_0.selectedTab
	local var_53_5 = var_53_0.gamertag or var_53_0.fullName
	local var_53_6 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_FRIEND")
	}

	var_53_6.id = "removeFriend"

	function var_53_6.disabledFunc()
		return var_53_4 == FRIENDS.TabIDs.ONLINE_FRIENDS and not Engine.DBFCJBDJEC() or not var_0_4(var_53_0) or Lobby.CHBBHFHJEH(var_53_2)
	end

	function var_53_6.action(arg_55_0, arg_55_1)
		local var_55_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_FRIEND"),
			message = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_FRIEND_CONFIRMATION"),
			extraMessage = Engine.JCBDICCAH(tostring(var_53_5)),
			buttons = {
				{
					label = Engine.CBBHFCGDIC("LUA_MENU_MP/CONFIRM"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if var_53_4 == FRIENDS.TabIDs.ONLINE_FRIENDS then
							Social.EBJFEHBAID(var_53_1, var_53_3)
						else
							Social.CDFFGDDEHF(var_53_1, Friends.BEJHAIFIAB(var_53_2))
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

		LUI.FlowManager.RequestPopupMenu(arg_55_0, "GenericConfirmPopup", true, var_53_1, false, var_55_0, nil, true, true)
	end

	return var_53_6
end

local function var_0_25(arg_58_0)
	local var_58_0 = arg_58_0.controllerIndex
	local var_58_1 = var_0_5(arg_58_0)
	local var_58_2 = arg_58_0.platformId
	local var_58_3 = arg_58_0.selectedTab
	local var_58_4 = arg_58_0.isBot and true or false
	local var_58_5 = {
		label = Engine.CBBHFCGDIC("MENU/REPORT_PLAYER")
	}

	var_58_5.id = "reportPlayer"

	function var_58_5.disabledFunc()
		return var_58_4 or Lobby.CHBBHFHJEH(var_58_1)
	end

	function var_58_5.action()
		if not var_58_5.disabledFunc() then
			LUI.FlowManager.RequestPopupMenu(nil, "ReportPlayer", true, var_58_0, false, {
				xuid = var_58_1,
				platformId = var_58_2
			})
		end
	end

	return var_58_5
end

local function var_0_26(arg_61_0)
	local var_61_0 = arg_61_0.controllerIndex
	local var_61_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU_MP/CHOOSE_YOUR_OWN")
	}

	var_61_1.id = "selectSquad"

	function var_61_1.disabledFunc()
		return false
	end

	function var_61_1.action()
		if not var_61_1.disabledFunc() then
			if LUI.FlowManager.IsMenuOnTop("LobbySquadActions") then
				LUI.FlowManager.RequestLeaveMenuByName("LobbySquadActions")
			end

			LUI.FlowManager.RequestAddMenu("WarzonePrivateMatchSquadMenu", true, var_61_0, false, nil, true)
		end
	end

	return var_61_1
end

local function var_0_27(arg_64_0)
	local var_64_0 = arg_64_0.controllerIndex
	local var_64_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU_MP/ASSIGN_RANDOM_SQUAD")
	}

	var_64_1.id = "selectRandomSquad"

	function var_64_1.disabledFunc()
		return false
	end

	function var_64_1.action()
		if not var_64_1.disabledFunc() then
			if LUI.FlowManager.IsMenuOnTop("LobbySquadActions") then
				LUI.FlowManager.RequestLeaveMenuByName("LobbySquadActions")
			end

			LUI.FlowManager.RequestAddMenu("WarzonePrivateMatchSquadMenu", true, var_64_0, false, {
				requestRandomSquadNow = true
			}, true)
		end
	end

	return var_64_1
end

local function var_0_28(arg_67_0)
	local var_67_0 = arg_67_0.controllerIndex
	local var_67_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU_MP/NOT_NOW")
	}

	var_67_1.id = "selectNoSquad"

	function var_67_1.disabledFunc()
		return false
	end

	function var_67_1.action()
		if not var_67_1.disabledFunc() and LUI.FlowManager.IsMenuOnTop("LobbySquadActions") then
			LUI.FlowManager.RequestLeaveMenuByName("LobbySquadActions")
		end
	end

	return var_67_1
end

local function var_0_29(arg_70_0)
	local var_70_0 = var_0_5(arg_70_0)
	local var_70_1 = Friends.BEJHAIFIAB(var_70_0)
	local var_70_2 = arg_70_0.platformId
	local var_70_3 = arg_70_0.selectedTab
	local var_70_4 = arg_70_0.isBot and true or false
	local var_70_5 = (Engine.HDGDBCJFG() or Engine.DBFCJBDJEC() or Engine.CHDGBEFDHB()) and Friends.CIBEABFIJI(arg_70_0.controllerIndex, var_70_0)
	local var_70_6
	local var_70_7 = {
		label = var_70_5 and Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK_PLAYER") or Engine.CBBHFCGDIC("LUA_MENU/BLOCK_PLAYER")
	}

	var_70_7.id = "blockPlayer"

	function var_70_7.disabledFunc()
		return var_70_4 or Lobby.CHBBHFHJEH(var_70_0) or var_70_6
	end

	function var_70_7.action(arg_72_0, arg_72_1)
		local var_72_0 = var_70_3 == FRIENDS.TabIDs.ONLINE_FRIENDS and Engine.DBFCJBDJEC()
		local var_72_1 = var_70_3 == FRIENDS.TabIDs.ONLINE_FRIENDS and Engine.CHDGBEFDHB()
		local var_72_2 = var_70_1 ~= var_70_2

		if var_70_5 then
			if var_72_0 or var_72_1 then
				Social.JGFDEBFAC(var_70_2)
			end

			if var_72_2 then
				Social.EIGAJHEGI(arg_70_0.controllerIndex, var_70_1)
			end
		else
			if var_72_0 or var_72_1 then
				if var_0_4(arg_70_0) then
					local var_72_3 = var_72_2

					var_72_2 = false

					local function var_72_4()
						Social.BIFIFEECCJ(arg_70_0.controllerIndex, var_70_2)

						if var_72_3 then
							Social.DACDEGEDDD(arg_70_0.controllerIndex, var_70_1, arg_70_0.gamertag or arg_70_0.fullName)
						end

						var_70_6 = true
					end

					LUI.FlowManager.RequestPopupMenu(nil, "BlockPlayerAndRemoveFromFriendsPopup", true, arg_70_0.controllerIndex, false, {
						yesAction = var_72_4
					})
				else
					Social.BIFIFEECCJ(var_70_2)
				end
			end

			if var_72_2 then
				Social.DACDEGEDDD(arg_70_0.controllerIndex, var_70_1, arg_70_0.gamertag or arg_70_0.fullName)
			end
		end

		var_70_6 = var_72_2
	end

	return var_70_7
end

local function var_0_30(arg_74_0)
	return function(arg_75_0, arg_75_1)
		local var_75_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_SENT_INVITE"),
			message = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_INVITE_MESSAGE"),
			extraMessage = Engine.JCBDICCAH(arg_74_0.fullName)
		}

		var_75_0.itemImage = "icon_warning_large"
		var_75_0.buttons = {
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_REQUEST"),
				action = function()
					LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

					if arg_74_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
						Social.BHCIIHHAAC(arg_75_1.controller, arg_74_0.xuid)
					elseif arg_74_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
						Social.DHHEFJGEJC(arg_75_1.controller, arg_74_0.invitationId)
					end

					arg_75_0:dispatchEventToRoot({
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

		LUI.FlowManager.RequestPopupMenu(arg_75_0, "GenericConfirmPopup", true, arg_75_1.controller, false, var_75_0, nil, true, true)
	end
end

local function var_0_31(arg_78_0)
	return function(arg_79_0, arg_79_1)
		local var_79_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIEND_REQUEST"),
			message = Engine.CBBHFCGDIC("LUA_MENU/REQUEST_MESSAGE"),
			extraMessage = Engine.JCBDICCAH(arg_78_0.fullName)
		}

		var_79_0.itemImage = "mm_element_logo_white"
		var_79_0.buttons = {
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
				action = function()
					LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

					if arg_78_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
						Social.BIHDCJGFCI(arg_79_1.controller, arg_78_0.xuid)
						Social.DAFDEJICJJ(arg_79_1.controller, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_78_0.xuid, arg_78_0.fullName)
					elseif arg_78_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
						Social.IBEHACGBI(arg_79_1.controller, arg_78_0.platformId)
						Social.DAFDEJICJJ(arg_79_1.controller, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_78_0.platformId, arg_78_0.fullName)
					end

					arg_79_0:dispatchEventToRoot({
						name = "request_fetch_data"
					})
				end
			},
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
				action = function()
					LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

					if arg_78_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
						Social.CGIDFEJECG(arg_79_1.controller, arg_78_0.xuid)
					elseif arg_78_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
						Social.JHHJICGHG(arg_79_1.controller, arg_78_0.platformId)
					end

					arg_79_0:dispatchEventToRoot({
						name = "request_fetch_data"
					})
				end
			},
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_REQUEST"),
				action = function()
					LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

					if arg_78_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
						Social.CGIDFEJECG(arg_79_1.controller, arg_78_0.xuid)
						Social.DACDEGEDDD(arg_79_1.controller, arg_78_0.xuid, arg_78_0.fullName)
					elseif arg_78_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
						Social.JHHJICGHG(arg_79_1.controller, arg_78_0.platformId)
						Social.BIFIFEECCJ(arg_79_1.controller, arg_78_0.platformId)
					end

					arg_79_0:dispatchEventToRoot({
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

		LUI.FlowManager.RequestPopupMenu(arg_79_0, "GenericConfirmPopup", false, arg_79_1.controller, false, var_79_0, nil, true, true)
	end
end

local function var_0_32(arg_84_0)
	return function(arg_85_0, arg_85_1)
		local var_85_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_BLOCK"),
			message = Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK_MESSAGE"),
			extraMessage = Engine.JCBDICCAH(arg_84_0.fullName)
		}

		var_85_0.itemImage = "icon_warning_large"
		var_85_0.buttons = {
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK"),
				action = function()
					if arg_84_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
						Social.EIGAJHEGI(arg_85_1.controller, arg_84_0.xuid)
					elseif arg_84_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
						Social.JGFDEBFAC(arg_84_0.platformId)
					end

					arg_85_0:dispatchEventToRoot({
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

		LUI.FlowManager.RequestPopupMenu(arg_85_0, "GenericConfirmPopup", false, arg_85_1.controller, false, var_85_0, nil, true, true)
	end
end

local function var_0_33(arg_88_0)
	return function(arg_89_0, arg_89_1)
		local var_89_0 = Friends.CAIJHBHGGC(arg_88_0.xuid)
		local var_89_1 = FRIENDS.FriendTypeToTabIDs[arg_88_0.friendsListType]

		Invitation.DIDIHAJHGA(arg_89_1.controller, var_89_0, arg_88_0.platformId)
	end
end

local function var_0_34(arg_90_0)
	return function(arg_91_0, arg_91_1)
		if CONDITIONS.IsInGameBattlesMatch() then
			Engine.DBFFAEEFGJ():dispatchEventToRoot({
				name = "gamebattles_social_leave_menu"
			})
		end

		Invitation.DHACFECHAG(arg_90_0.invitationID)
	end
end

local function var_0_35(arg_92_0)
	return function(arg_93_0, arg_93_1)
		Clans.CFJCAAHHGE(arg_93_1.controller, arg_92_0.clanId, arg_92_0.xuid)

		local var_93_0 = {
			icon = "hud_info_alert",
			displayTime = 3000,
			description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_REVOKED")
		}

		arg_93_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_93_0
		})
	end
end

local function var_0_36(arg_94_0)
	return function(arg_95_0, arg_95_1)
		local var_95_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITATION")
		}

		var_95_0.itemImage = "mm_element_logo_white"
		var_95_0.message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITATION_MESSAGE", Engine.JCBDICCAH(arg_94_0.clanName))
		var_95_0.buttons = {
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
				action = function()
					Clans.IEHDGEGJC(arg_95_1.controller, arg_94_0.clanId)
				end
			},
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
				action = function()
					Clans.DJIFJAAFAI(arg_95_1.controller, arg_94_0.clanId)

					local var_97_0 = {
						icon = "hud_info_alert",
						displayTime = 3000,
						description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_DECLINED")
					}

					arg_95_0:dispatchEventToRoot({
						name = "send_toast_notification",
						immediate = true,
						options = var_97_0
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

		LUI.FlowManager.RequestPopupMenu(arg_95_0, "GenericConfirmPopup", false, arg_95_1.controller, false, var_95_0, nil, true, true)
	end
end

local function var_0_37(arg_99_0)
	return function(arg_100_0, arg_100_1)
		local var_100_0 = {
			controllerIndex = arg_100_1.controller,
			memberXUID = arg_99_0.xuid,
			gamertag = arg_99_0.gamertag,
			fullName = arg_99_0.fullName
		}

		LUI.FlowManager.RequestPopupMenu(arg_100_0, "UnbanClanMemberPopup", false, arg_100_1.controller, false, var_100_0, nil, true, true)
	end
end

function FRIENDS.IsValidEntry(arg_101_0)
	return var_0_3(arg_101_0)
end

function FRIENDS.AreWeHost(arg_102_0)
	local var_102_0 = false

	for iter_102_0 = 1, #arg_102_0 do
		if arg_102_0[iter_102_0].isMyPlayer and arg_102_0[iter_102_0].isPartyHost then
			var_102_0 = true

			break
		end
	end

	return var_102_0
end

function FRIENDS.IsClanInvitePending(arg_103_0, arg_103_1, arg_103_2)
	local var_103_0 = Clans.BJJADIBFB(arg_103_0, arg_103_1)

	for iter_103_0, iter_103_1 in ipairs(var_103_0) do
		if iter_103_1.xuid == arg_103_2 then
			return true
		end
	end

	return false
end

local function var_0_38(arg_104_0)
	local var_104_0 = #arg_104_0

	if arg_104_0[0] then
		var_104_0 = var_104_0 + 1
	end

	arg_104_0 = FRIENDS.UnifyInvitationsFormat(arg_104_0, FRIENDS.INVITATIONS.ID.CLANS2_INVITE_RECEIVED)

	return {
		onlineCount = 0,
		count = var_104_0,
		friends = arg_104_0
	}
end

function FRIENDS.OpenFriendsList(arg_105_0, arg_105_1)
	if IsOnlineMatch() and Engine.BACCCIHGDG() and Engine.BICHEEFHEC(arg_105_0) then
		if not Engine.DBAEJAHFGJ(arg_105_0) then
			local var_105_0 = {
				hasUsedShortcut = arg_105_1
			}

			LUI.FlowManager.RequestAddMenu("SocialMenu", true, arg_105_0, false, var_105_0, true)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_105_0, false, {}, nil, true, true)
		end
	end
end

function FRIENDS.SetupLobbyMemberContextualMenu(arg_106_0, arg_106_1, arg_106_2)
	local function var_106_0()
		assert(arg_106_2)

		local var_107_0 = arg_106_1:GetDataSource()
		local var_107_1 = var_107_0.memberIndex:GetValue(arg_106_2)

		if var_107_1 then
			local var_107_2
			local var_107_3

			if CONDITIONS.IsInGameBattlesMatch() then
				var_107_3 = var_107_0.xuid:GetValue(arg_106_2)
				var_107_2 = Friends.CAIJHBHGGC(var_107_3)

				if Engine.EBCDCFCBE(var_107_3) then
					return nil
				end
			else
				var_107_2 = Lobby.CCHEBJJJEB(var_107_1)
				var_107_3 = Friends.BEJHAIFIAB(var_107_2)
			end

			assert(var_107_2)

			if not Lobby.CHBBHFHJEH(var_107_2) then
				return {
					isContextualMenu = true,
					xuid = var_107_2,
					xuidString = var_107_3,
					memberIndex = var_107_1,
					memberTeam = var_107_0.team:GetValue(arg_106_2),
					platformId = var_107_0.platformId:GetValue(arg_106_2),
					selectedTab = Social.ECHBFGEHFI(arg_106_2, var_107_3),
					controllerIndex = arg_106_2,
					presencePlatform = var_107_0.presencePlatform,
					gamertag = var_107_0.gamertag:GetValue(arg_106_2),
					getButtonsCallback = function(arg_108_0)
						local var_108_0 = FRIENDS.GetFriendActions(arg_108_0)
						local var_108_1 = FRIENDS.GetLobbyMemberActions(arg_108_0)

						LUI.ConcatenateToTable(var_108_0, var_108_1)

						return var_108_0
					end
				}
			end
		end

		return nil
	end

	arg_106_1:SubscribeToDataSourceThroughElement(arg_106_1, nil, function()
		(function()
			if not arg_106_0._contextualMenuIsAdded then
				FRIENDS.SetupPlayerContextualMenuOptions(arg_106_0, arg_106_2, var_106_0)

				arg_106_1._contextualMenuIsAdded = true
			end
		end)()
	end)
end

local function var_0_39(arg_111_0, arg_111_1)
	if LUI.IsLastInputKeyboardMouse(arg_111_1.controller) then
		local var_111_0 = arg_111_1.callback(arg_111_0)

		if var_111_0 then
			if arg_111_0._tabID == FRIENDS.TabIDs.INBOX then
				FRIENDS.UpdateInboxContextualMenuOptions(arg_111_0, arg_111_1.controller, var_111_0)
			else
				FRIENDS.UpdatePlayerContextualMenuOptions(arg_111_0, arg_111_1.controller, var_111_0, arg_111_1.additionalOptions)
			end
		end
	end
end

function FRIENDS.SetupPlayerContextualMenuOptions(arg_112_0, arg_112_1, arg_112_2, arg_112_3)
	if not arg_112_0._contextualMenuHandlerAdded then
		arg_112_0:addEventHandler("mouseenter", function(arg_113_0, arg_113_1)
			var_0_39(arg_113_0, {
				controller = arg_112_1,
				callback = arg_112_2,
				additionalOptions = arg_112_3 or {}
			})
		end)

		arg_112_0._contextualMenuHandlerAdded = true
	end

	local var_112_0 = arg_112_0:GetCurrentMenu()

	FRIENDS.RegisterPlatformIdForViewProfileEventOnMenu(var_112_0, arg_112_1)
end

local function var_0_40(arg_114_0)
	return function()
		local var_115_0 = arg_114_0.disabledFunc()

		if var_115_0 and type(var_115_0) == "table" then
			return not var_115_0.disabled
		else
			return not var_115_0
		end
	end
end

local function var_0_41(arg_116_0, arg_116_1, arg_116_2, arg_116_3)
	for iter_116_0, iter_116_1 in pairs(arg_116_0) do
		if iter_116_1.id == arg_116_1 then
			local var_116_0 = iter_116_1.action
			local var_116_1 = CONDITIONS.AlwaysTrue

			if iter_116_1.disabledFunc then
				var_116_1 = var_0_40(iter_116_1)
			end

			local var_116_2 = iter_116_1.id
			local var_116_3 = iter_116_1.label
			local var_116_4 = {
				actionName = var_116_3,
				actionFunction = var_116_0,
				actionParams = arg_116_2,
				conditionFunction = var_116_1,
				id = var_116_2,
				conditionParams = arg_116_2
			}

			arg_116_3:AddContextualMenuAction(var_116_4)

			break
		end
	end
end

function FRIENDS.UpdateInboxContextualMenuOptions(arg_117_0, arg_117_1, arg_117_2)
	arg_117_0:SetupContextualMenu()

	local var_117_0 = arg_117_2.getButtonsCallback and arg_117_2.getButtonsCallback(arg_117_2)

	for iter_117_0, iter_117_1 in ipairs(var_0_1) do
		if iter_117_1 ~= "separator" then
			var_0_41(var_117_0, iter_117_1, arg_117_2, arg_117_0)
		else
			arg_117_0:AddContextualMenuAction({
				isSeparator = true
			})
		end
	end
end

function FRIENDS.UpdatePlayerContextualMenuOptions(arg_118_0, arg_118_1, arg_118_2, arg_118_3)
	if arg_118_2.gamertag and arg_118_2.gamertag ~= "" then
		local var_118_0 = arg_118_2.gamertag
		local var_118_1

		if Engine.CGABICJHAI() and arg_118_2.selectedTab == FRIENDS.TabIDs.ONLINE_FRIENDS and arg_118_2.showBattlenetData then
			local var_118_2 = Social.CFEIHAADEI(arg_118_2.platformId)

			if var_118_2 and var_118_2.battleTag and var_118_2.battleTag ~= "" then
				local var_118_3 = Engine.BECCFCBIAA("displayRealID") == 1 and var_118_2.fullName and var_118_2.fullName ~= "" and var_118_2.fullName or nil

				var_118_1 = {
					title = var_118_2.battleTag,
					subtitle = var_118_3
				}
			else
				var_118_1 = {
					title = arg_118_2.gamertag
				}
			end

			var_118_0 = arg_118_2.crossplayGamertag ~= "" and arg_118_2.crossplayGamertag or nil
		end

		arg_118_0:SetupContextualMenu({
			title = var_118_0,
			battlenetData = var_118_1
		})
	else
		arg_118_0:SetupContextualMenu()
	end

	local var_118_4 = arg_118_2.getButtonsCallback and arg_118_2.getButtonsCallback(arg_118_2)

	for iter_118_0, iter_118_1 in ipairs(var_0_0) do
		if iter_118_1 ~= "separator" then
			for iter_118_2, iter_118_3 in pairs(var_118_4) do
				if iter_118_3.id == iter_118_1 then
					local var_118_5 = iter_118_3.action
					local var_118_6 = CONDITIONS.AlwaysTrue

					if iter_118_3.disabledFunc then
						function var_118_6()
							local var_119_0 = iter_118_3.disabledFunc()

							if var_119_0 and type(var_119_0) == "table" then
								return not var_119_0.disabled
							else
								return not var_119_0
							end
						end
					end

					local var_118_7 = iter_118_3.id
					local var_118_8 = iter_118_3.label
					local var_118_9 = {
						actionName = var_118_8,
						actionFunction = var_118_5,
						actionParams = arg_118_2,
						conditionFunction = var_118_6,
						id = var_118_7,
						conditionParams = arg_118_2
					}

					arg_118_0:AddContextualMenuAction(var_118_9)

					break
				end
			end
		else
			arg_118_0:AddContextualMenuAction({
				isSeparator = true
			})
		end
	end

	if arg_118_3._hasClanActions then
		arg_118_0:AddContextualMenuAction({
			isSeparator = true
		})

		for iter_118_4, iter_118_5 in ipairs(var_0_2) do
			if iter_118_5 ~= "separator" then
				var_0_41(var_118_4, iter_118_5, arg_118_2, arg_118_0)
			else
				arg_118_0:AddContextualMenuAction({
					isSeparator = true
				})
			end
		end
	end
end

function FRIENDS.GetScoreboardActions(arg_120_0)
	local var_120_0 = arg_120_0.clientNum

	assert(var_120_0)

	local var_120_1 = arg_120_0.xuid

	assert(var_120_1)

	local var_120_2 = arg_120_0.xuidString

	assert(var_120_2)

	local var_120_3 = arg_120_0.isBot and true or false
	local var_120_4 = arg_120_0.controllerIndex

	assert(var_120_4)

	local var_120_5 = arg_120_0.isAAR
	local var_120_6 = {}

	table.insert(var_120_6, var_0_15(arg_120_0))
	table.insert(var_120_6, var_0_20(arg_120_0))
	table.insert(var_120_6, var_0_21(arg_120_0))

	local var_120_7 = {
		label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
		disabledFunc = function()
			return not Engine.HDGDBCJFG() or not not CONDITIONS.IsSystemLink(self) or var_120_3
		end
	}

	function var_120_7.action()
		if not var_120_7.disabledFunc() then
			if not var_120_5 and (not Game.BFEEGCHICA(var_120_4, "ui_scoreboard_freeze") or arg_120_0.isCP) then
				Engine.BJBCAJFECC(var_120_4, var_120_0)
			elseif var_120_5 and var_120_1 then
				Lobby.GICFBJBBJ(var_120_4, var_120_2)
			end
		end
	end

	var_120_7.id = "viewProfile"

	table.insert(var_120_6, var_120_7)
	table.insert(var_120_6, var_0_22(arg_120_0))
	table.insert(var_120_6, var_0_24(arg_120_0))
	table.insert(var_120_6, var_0_25(arg_120_0))
	table.insert(var_120_6, var_0_29(arg_120_0))

	return var_120_6
end

function FRIENDS.AddFriendActions(arg_123_0, arg_123_1, arg_123_2)
	local var_123_0 = arg_123_0.controllerIndex
	local var_123_1
	local var_123_2 = {}

	for iter_123_0, iter_123_1 in ipairs(arg_123_1) do
		local var_123_3 = {}

		if iter_123_1.id == "header" then
			var_123_3 = MenuBuilder.BuildRegisteredType("SocialFlyoutHeader", {
				controllerIndex = var_123_0
			})

			var_123_3.Title:setText(iter_123_1.label)
		else
			assert(iter_123_1.label)
			assert(iter_123_1.action)

			var_123_3 = MenuBuilder.BuildRegisteredType("MenuButton", {
				controllerIndex = var_123_0
			})

			var_123_3.Text:setText(iter_123_1.label)

			local var_123_4 = iter_123_1.disabledFunc and iter_123_1.disabledFunc() or false

			var_123_3.disabledFunc = iter_123_1.disabledFunc

			var_123_3:SetButtonDisabled(var_123_4)

			var_123_3.previousDisabledStatus = var_123_4

			var_123_3:addEventHandler("button_action", function(arg_124_0, arg_124_1)
				if iter_123_1.refreshOnAction then
					var_123_1(false)
				end

				iter_123_1.action()
			end)
		end

		arg_123_2:addElement(var_123_3)
		table.insert(var_123_2, var_123_3)
	end

	local var_123_5 = LUI.UIImage.new()

	var_123_5.id = "Spacer"

	var_123_5:SetAlpha(0)
	var_123_5:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 10)
	arg_123_2:addElement(var_123_5)

	arg_123_2.Spacer = var_123_5

	local var_123_6 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_123_0
	})

	var_123_6.id = "ButtonDescriptionText"

	var_123_6.Description:SetRight(_1080p * 500)
	var_123_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 32)
	arg_123_2:addElement(var_123_6)

	arg_123_2.ButtonDescriptionText = var_123_6

	function var_123_1(arg_125_0)
		local var_125_0 = ""
		local var_125_1
		local var_125_2 = true

		for iter_125_0 = 1, #var_123_2 do
			local var_125_3 = var_123_2[iter_125_0]

			var_125_1 = var_125_1 or var_125_3:GetCurrentMenu()

			if var_125_3.disabledFunc then
				local var_125_4 = var_125_3.disabledFunc()
				local var_125_5 = false

				if type(var_125_4) == "table" then
					var_125_5 = var_125_4.disabled

					local var_125_6 = var_125_4.errorString

					if var_125_3:isInFocus() and #var_125_6 > 0 and var_125_5 then
						var_125_0 = Engine.CBBHFCGDIC(var_125_6)

						if Engine.BHICADFIHA() then
							local var_125_7 = var_125_4.devErrorString

							if #var_125_7 > 0 then
								var_125_0 = var_125_0 .. " Dev : " .. var_125_7
							end
						end
					end
				else
					var_125_5 = var_125_4
				end

				if var_125_3.previousDisabledStatus ~= var_125_5 then
					var_125_3:SetButtonDisabled(var_125_5)
				end

				var_125_3.previousDisabledStatus = var_125_5
			end
		end

		if var_125_1 then
			if var_125_1.descriptionText and var_125_1.descriptionText == var_125_0 then
				var_125_2 = false
			end

			if var_125_2 then
				var_125_1.descriptionText = var_125_0

				var_125_1:dispatchEventToCurrentMenu({
					name = "update_button_description",
					text = var_125_0
				})
			end
		end

		if arg_125_0 then
			arg_123_2:Wait(1000).onComplete = function()
				return var_123_1(arg_125_0)
			end
		end
	end

	var_123_1(true)
end

function FRIENDS.AddInboxActions(arg_127_0, arg_127_1, arg_127_2)
	local var_127_0 = arg_127_0.controllerIndex
	local var_127_1 = {}

	for iter_127_0, iter_127_1 in ipairs(arg_127_1) do
		assert(iter_127_1.label)
		assert(iter_127_1.action)

		local var_127_2 = MenuBuilder.BuildRegisteredType("MenuButton", {
			controllerIndex = var_127_0
		})

		ACTIONS.AnimateSequence(var_127_2, "CenterText")
		var_127_2.Text:setText(iter_127_1.label)

		local var_127_3 = iter_127_1.disabledFunc and iter_127_1.disabledFunc() or false

		var_127_2.disabledFunc = iter_127_1.disabledFunc

		var_127_2:SetButtonDisabled(var_127_3)

		var_127_2.previousDisabledStatus = var_127_3

		var_127_2:addEventHandler("button_action", function(arg_128_0, arg_128_1)
			if iter_127_1.action() then
				LUI.FlowManager.RequestLeaveMenuByName("FlyInPopup", true, true)
			end
		end)
		arg_127_2:addElement(var_127_2)
		table.insert(var_127_1, var_127_2)
	end
end

function FRIENDS.IsClanMemberEquivalent(arg_129_0, arg_129_1, arg_129_2)
	if arg_129_0 == FRIENDS.TabIDs.CLANS then
		if (arg_129_2.isCrossPlayFriend or arg_129_2.isPlatformFriend) and arg_129_2.isOnline then
			return arg_129_1 == FRIENDS.TabIDs.ONLINE_FRIENDS
		elseif arg_129_2.isCrossPlayFriend then
			return arg_129_1 == FRIENDS.TabIDs.CROSSPLAY_FRIENDS
		elseif arg_129_2.isPlatformFriend then
			return arg_129_1 == FRIENDS.TabIDs.FRIENDS
		else
			return arg_129_1 == FRIENDS.TabIDs.RECENT_PLAYERS
		end
	end

	return false
end

function FRIENDS.GetFriendActions(arg_130_0)
	local var_130_0 = {}
	local var_130_1 = arg_130_0.controllerIndex

	assert(var_130_1)

	local var_130_2 = arg_130_0.selectedTab

	assert(var_130_2)

	if var_130_2 == FRIENDS.TabIDs.INBOX then
		table.insert(var_130_0, var_0_8(arg_130_0))
		table.insert(var_130_0, var_0_9(arg_130_0))
	else
		local var_130_3 = arg_130_0.xuidString or arg_130_0.xuid
		local var_130_4 = Friends.CAIJHBHGGC(var_130_3)

		arg_130_0.gameTitle = Engine.BBHGAFFFGE(var_130_1, var_130_4)

		local var_130_5 = arg_130_0.platformId
		local var_130_6 = Engine.CBBFHGEDGJ()
		local var_130_7 = arg_130_0.presencePlatform

		if type(var_130_7) == "userdata" then
			var_130_7 = var_130_7:GetValue(var_130_1)
		end

		local var_130_8 = {
			isCrossPlayFriend = Friends.BIAJAECICH(var_130_1, var_130_3),
			isPlatformFriend = Friends.DIIAFCGBDA(var_130_1, var_130_3, var_130_5 or "0"),
			isOnline = arg_130_0.isOnline or false
		}
		local var_130_9 = var_130_2 == FRIENDS.TabIDs.RECENT_PLAYERS or var_130_2 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS

		if var_130_9 or FRIENDS.IsClanMemberEquivalent(var_130_2, FRIENDS.TabIDs.RECENT_PLAYERS, var_130_8) then
			if not Engine.BEFACAIFDD() then
				local var_130_10 = {
					label = Engine.CBBHFCGDIC("MENU/JOIN_GAME"),
					disabledFunc = function()
						return not var_0_3(arg_130_0) or Invitation.ECGAJEGAIC(var_130_1, var_130_4, var_130_5, var_130_2)
					end
				}
				local var_130_11 = (Engine.BAHIIBFDDG() or Engine.BEFACAIFDD()) and Friends.CIBEABFIJI(var_130_1, var_130_4)

				function var_130_10.action()
					local var_132_0 = var_130_10.disabledFunc()

					if var_132_0 and not var_132_0.disabled then
						var_130_11 = (Engine.BAHIIBFDDG() or Engine.BEFACAIFDD()) and Friends.CIBEABFIJI(var_130_1, var_130_4)

						if var_130_11 then
							local var_132_1 = {
								xuid = var_130_4,
								controllerIndex = var_130_1
							}

							LUI.FlowManager.RequestPopupMenu(nil, "ConfirmJoinBlockedUser", true, var_130_1, false, var_132_1)
						else
							local function var_132_2()
								local var_133_0 = var_130_10.disabledFunc()

								if var_133_0 and not var_133_0.disabled then
									if CONDITIONS.IsInGameBattlesMatch() then
										Engine.DBFFAEEFGJ():dispatchEventToRoot({
											immediate = true,
											name = "gamebattles_social_leave_menu"
										})
									end

									Friends.DACCIAAAAB(var_130_1, var_130_4, var_130_5)

									local var_133_1, var_133_2 = Engine.CBBGBGBFJF(var_130_1)

									if not var_133_1 and var_133_2 == FenceOnlineServices.ERROR_CODES.PSPlusRequired then
										Engine.DBHBIHJDEC(var_130_1)
									end
								end
							end

							FRIENDS.TryJoinUserParty(var_132_2)
						end
					end
				end

				if not var_130_11 then
					var_130_10.refreshOnAction = true
				end

				var_130_10.id = "joinGame"

				table.insert(var_130_0, var_130_10)
			end
		else
			local var_130_12 = var_0_10(arg_130_0)

			table.insert(var_130_0, var_130_12)
		end

		if CONDITIONS.ArePartiesEnabledInMainMenu() or Engine.EAAHGICFBD() then
			table.insert(var_130_0, var_0_11(arg_130_0))
		end

		if var_130_2 == FRIENDS.TabIDs.PRIVATE_PARTY then
			table.insert(var_130_0, var_0_21(arg_130_0))
		end

		table.insert(var_130_0, var_0_20(arg_130_0))

		if var_130_2 == FRIENDS.TabIDs.ONLINE_FRIENDS or FRIENDS.IsClanMemberEquivalent(var_130_2, FRIENDS.TabIDs.ONLINE_FRIENDS, var_130_8) then
			if Engine.HDGDBCJFG() or Engine.BEFACAIFDD() or Engine.CHDGBEFDHB() then
				local var_130_13 = {}

				if Engine.CHDGBEFDHB() and var_130_8.isPlatformFriend then
					var_130_13.label = Engine.CBBHFCGDIC("LUA_MENU/VIEW_LAZE_PROFILE")
				else
					var_130_13.label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")
				end

				function var_130_13.disabledFunc()
					return not var_0_3(arg_130_0) or not Friends.GGDCJJGBI(var_130_1)
				end

				function var_130_13.action()
					if not var_130_13.disabledFunc() then
						Friends.CFBFGBECEB(var_130_1, var_130_5)
					end
				end

				var_130_13.id = "viewProfile"

				table.insert(var_130_0, var_130_13)
			end
		elseif var_130_9 or FRIENDS.IsClanMemberEquivalent(var_130_2, FRIENDS.TabIDs.RECENT_PLAYERS, var_130_8) then
			assert(var_130_4)

			if Engine.HDGDBCJFG() or Engine.BEFACAIFDD() then
				local var_130_14 = {
					label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")
				}

				if Engine.BAHIIBFDDG() then
					function var_130_14.disabledFunc()
						return not var_0_3(arg_130_0) or not Social.CDFEICCEFJ(var_130_1, var_130_3) or var_130_5 == "0"
					end
				else
					function var_130_14.disabledFunc()
						return not var_0_3(arg_130_0) or not Social.CDFEICCEFJ(var_130_1, var_130_3) or var_130_6 ~= var_130_7
					end
				end

				function var_130_14.action()
					if not var_130_14.disabledFunc() then
						Friends.CCDGAGCFGE(var_130_1, var_130_4)
					end
				end

				var_130_14.id = "viewProfile"

				table.insert(var_130_0, var_130_14)
			end
		elseif var_130_2 == FRIENDS.TabIDs.CROSSPLAY_FRIENDS or var_130_2 == FRIENDS.TabIDs.REGIMENTS or var_130_2 == FRIENDS.TabIDs.PRIVATE_PARTY or FRIENDS.IsClanMemberEquivalent(var_130_2, FRIENDS.TabIDs.CROSSPLAY_FRIENDS, var_130_8) then
			assert(var_130_4)

			if Engine.HDGDBCJFG() and var_130_8.isPlatformFriend then
				local var_130_15 = {
					label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
					disabledFunc = function()
						return var_130_2 == FRIENDS.TabIDs.CROSSPLAY_FRIENDS and not var_0_3(arg_130_0) or not Friends.GGDCJJGBI(var_130_1)
					end
				}

				function var_130_15.action()
					if not var_130_15.disabledFunc() then
						if arg_130_0.platformId and arg_130_0.platformId ~= "0" then
							Friends.CFBFGBECEB(var_130_1, var_130_5)
						elseif not Social.BFEBABDDDE(var_130_1, var_130_3, "PlatformIdForViewProfile") then
							local var_140_0 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE")

							LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, var_130_1, false, {
								message = var_140_0
							})
						end
					end
				end

				var_130_15.id = "viewProfile"

				table.insert(var_130_0, var_130_15)
			end
		elseif var_130_2 == FRIENDS.TabIDs.FAVORITE_FRIENDS then
			assert(var_130_4)

			if Engine.HDGDBCJFG() or Engine.BEFACAIFDD() then
				local var_130_16 = {
					label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
					disabledFunc = function()
						return not var_0_3(arg_130_0) or var_130_6 ~= var_130_7 or Friends.FDBGHIFEE(var_130_1, var_130_4)
					end
				}

				function var_130_16.action()
					if not var_130_16.disabledFunc() then
						if arg_130_0.platformId and arg_130_0.platformId ~= "0" then
							Friends.CFBFGBECEB(var_130_1, var_130_5)
						elseif not Social.BFEBABDDDE(var_130_1, var_130_3, "PlatformIdForViewProfile") then
							local var_142_0 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE")

							LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, var_130_1, false, {
								message = var_142_0
							})
						end
					end
				end

				var_130_16.id = "viewProfile"

				table.insert(var_130_0, var_130_16)
			end
		end

		if (var_130_2 == FRIENDS.TabIDs.ONLINE_FRIENDS or var_130_2 == FRIENDS.TabIDs.CROSSPLAY_FRIENDS) and Friends.IJHFCGEBD() and Dvar.IBEGCHEFE("RRTRNQOLS") then
			local var_130_17 = {
				label = Engine.CBBHFCGDIC("MENU/ADD_TO_FAVORITES"),
				disabledFunc = function()
					return not var_0_3(arg_130_0) or Friends.ECIAEDEBCF(var_130_1, var_130_4)
				end
			}

			function var_130_17.action()
				local var_144_0 = var_130_17.disabledFunc()

				if var_144_0 and not var_144_0.disabled then
					Friends.DGICIJGBGB(var_130_1, var_130_4)
				end
			end

			var_130_17.refreshOnAction = true
			var_130_17.id = "addToFavorites"

			table.insert(var_130_0, var_130_17)
		end

		if var_130_2 == FRIENDS.TabIDs.FAVORITE_FRIENDS then
			local var_130_18 = {
				label = Engine.CBBHFCGDIC("MENU/REMOVE_FROM_FAVORITES"),
				disabledFunc = function()
					return not var_0_3(arg_130_0) or Friends.GFHEFICGF(var_130_1, var_130_4)
				end
			}

			function var_130_18.action()
				local var_146_0 = var_130_18.disabledFunc()

				if var_146_0 and not var_146_0.disabled then
					Friends.DIIFJGIIBA(var_130_1, var_130_4)
				end
			end

			var_130_18.refreshOnAction = true
			var_130_18.id = "removeFromFavorites"

			table.insert(var_130_0, var_130_18)
		end

		if Engine.DBFCJBDJEC() and var_130_2 == FRIENDS.TabIDs.ONLINE_FRIENDS and arg_130_0.platformId then
			local var_130_19 = Social.CFEIHAADEI(arg_130_0.platformId)

			if var_130_19 and var_130_19.fullName and var_130_19.fullName == "" then
				table.insert(var_130_0, var_0_23(arg_130_0))
			end
		end

		if not Friends.BIAJAECICH(var_130_1, var_130_3) then
			table.insert(var_130_0, var_0_22(arg_130_0))
		end

		if var_130_2 ~= FRIENDS.TabIDs.FAVORITE_FRIENDS then
			table.insert(var_130_0, var_0_24(arg_130_0))
			table.insert(var_130_0, var_0_25(arg_130_0))
			table.insert(var_130_0, var_0_29(arg_130_0))
		end

		if var_130_2 == FRIENDS.TabIDs.PRIVATE_PARTY then
			table.insert(var_130_0, var_0_15(arg_130_0))
		end

		local var_130_20 = Clans.CFGBBBHFHB(var_130_1)

		if var_130_20 and var_130_20 ~= -1 then
			local var_130_21 = #var_130_0
			local var_130_22 = Engine.EAGGAEGHHA(var_130_1)
			local var_130_23 = false
			local var_130_24 = FRIENDS.GetGroupMembers(var_130_1, var_130_20, FRIENDS.RegimentMembersFilter.OFFICERS_ONLY)

			for iter_130_0 = 1, #var_130_24 do
				if var_130_22 == var_130_24[iter_130_0].xuid then
					var_130_23 = true

					break
				end
			end

			if var_130_23 then
				if var_130_2 ~= FRIENDS.TabIDs.REGIMENTS and not Clans.CHEADIHHBJ(var_130_1, var_130_20, var_130_3).memberFound then
					local var_130_25 = Clans.GFFJCJFIJ(var_130_1, var_130_20)

					arg_130_0.clanID = var_130_20
					arg_130_0.clanName = var_130_25.name

					table.insert(var_130_0, var_0_12(arg_130_0))
				end

				if var_0_13(var_130_1, var_130_20, var_130_3) then
					local var_130_26 = Clans.GFFJCJFIJ(var_130_1, var_130_20)

					arg_130_0.clanID = var_130_20
					arg_130_0.clanName = var_130_26.name

					table.insert(var_130_0, var_0_14(arg_130_0))
				end

				if #var_130_0 ~= var_130_21 then
					table.insert(var_130_0, var_130_21 + 1, var_0_7("LUA_MENU/GROUPS"))
				end
			end
		end
	end

	return var_130_0
end

function FRIENDS.GetWZPrivateMatchLobbyMemberActions(arg_147_0)
	local var_147_0 = arg_147_0.xuid
	local var_147_1 = arg_147_0.controllerIndex

	assert(var_147_0)
	assert(var_147_1)

	local var_147_2 = {}

	if Engine.HDGDBCJFG() or Engine.BEFACAIFDD() then
		local var_147_3 = {
			label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
			action = function()
				if CONDITIONS.IsInGameBattlesMatch() then
					local var_148_0 = arg_147_0.platformId

					if var_148_0 then
						Lobby.BEDFEBGCHG(var_147_1, var_148_0)
					end
				else
					Lobby.BJBCAJFECC(var_147_1, var_147_0)
				end
			end,
			disabledFunc = function()
				if arg_147_0.isCrossplayPlayer ~= nil then
					return arg_147_0.isCrossplayPlayer
				end
			end
		}

		var_147_3.id = "viewProfile"

		table.insert(var_147_2, var_147_3)
	end

	table.insert(var_147_2, var_0_21(arg_147_0))
	table.insert(var_147_2, var_0_25(arg_147_0))

	if Lobby.DFFFFJHCEH() then
		table.insert(var_147_2, var_0_15(arg_147_0))
	end

	return var_147_2
end

FRIENDS.SQUAD_BUTTONS = {
	NO_SQUAD = 3,
	SELECT_SQUAD = 1,
	RANDOM_SQUAD = 2
}

function FRIENDS.GetWZPrivateMatchLobbySquadActions(arg_150_0)
	local var_150_0 = arg_150_0.controllerIndex

	assert(var_150_0)

	return {
		[FRIENDS.SQUAD_BUTTONS.SELECT_SQUAD] = var_0_26(arg_150_0),
		[FRIENDS.SQUAD_BUTTONS.RANDOM_SQUAD] = var_0_27(arg_150_0),
		[FRIENDS.SQUAD_BUTTONS.NO_SQUAD] = var_0_28(arg_150_0)
	}
end

function FRIENDS.GetLobbyMemberActions(arg_151_0)
	local var_151_0 = arg_151_0.xuid
	local var_151_1 = arg_151_0.controllerIndex

	assert(var_151_0)
	assert(var_151_1)

	local var_151_2 = {}

	if Engine.HDGDBCJFG() or Engine.BEFACAIFDD() then
		local var_151_3 = {
			label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
			action = function()
				if CONDITIONS.IsInGameBattlesMatch() then
					local var_152_0 = arg_151_0.platformId

					if var_152_0 then
						Lobby.BEDFEBGCHG(var_151_1, var_152_0)
					end
				else
					Lobby.BJBCAJFECC(var_151_1, var_151_0)
				end
			end,
			disabledFunc = function()
				if arg_151_0.isCrossplayPlayer ~= nil then
					return arg_151_0.isCrossplayPlayer
				end
			end
		}

		var_151_3.id = "viewProfile"

		table.insert(var_151_2, var_151_3)
	end

	table.insert(var_151_2, var_0_21(arg_151_0))
	table.insert(var_151_2, var_0_25(arg_151_0))

	if MLG.DBIBHEAEGD() then
		local var_151_4 = Lobby.BGIADHIHAG()

		if arg_151_0.memberIndex and Dvar.IBEGCHEFE("LQNKRLQTLM") and not var_151_4 then
			table.insert(var_151_2, var_0_16(arg_151_0))
		end

		if var_151_4 then
			table.insert(var_151_2, var_0_17(arg_151_0))
			table.insert(var_151_2, var_0_18(arg_151_0))
			table.insert(var_151_2, var_0_19(arg_151_0, "assignAllies", Teams.allies))
			table.insert(var_151_2, var_0_19(arg_151_0, "assignAxis", Teams.axis))
		end
	end

	return var_151_2
end

function FRIENDS.TryJoinUserParty(arg_154_0)
	if not Engine.CGABICJHAI() or not ShaderUpload.DDBFFCFJJJ() or not ShaderUpload.CEIBACCEAF() or Engine.DIEEIEFCFF() and Dvar.IBEGCHEFE("MRTNMPRLKR") then
		arg_154_0()
	else
		LUI.FlowManager.RequestPopupMenu(nil, "CancelShaderUploadDialog", false, nil, false, {
			onCancelUpload = arg_154_0
		}, nil, true, true)
	end
end

function FRIENDS.ValidatePlayerRequestData(arg_155_0)
	assert(arg_155_0.getFriendFrom)
	assert(arg_155_0.getFriendTo)
	assert(arg_155_0.getFriendFrom >= 0)

	if arg_155_0.friendsCount > 0 then
		assert(arg_155_0.getFriendTo < arg_155_0.friendsCount)
	end

	assert(arg_155_0.getFriendFrom <= arg_155_0.getFriendTo)
end

function FRIENDS.InitPlayerRequestData(arg_156_0, arg_156_1)
	arg_156_0.cachedFriends = arg_156_1
	arg_156_0.getFriendFrom = 0
	arg_156_0.getFriendTo = arg_156_1
	arg_156_0.friendsCount = 0
end

function FRIENDS.UpdatePlayerRequestData(arg_157_0, arg_157_1, arg_157_2, arg_157_3)
	local var_157_0 = arg_157_0.friendsCount

	arg_157_0.friendsCount = arg_157_0._friendsData.count

	if arg_157_0.getFriendTo >= arg_157_0.friendsCount then
		if arg_157_0.friendsCount == 0 then
			arg_157_0.getFriendTo = 0
		else
			arg_157_0.getFriendTo = arg_157_0.friendsCount - 1
		end
	end

	if arg_157_0.friendsCount > 0 then
		arg_157_0.getFriendFrom = LUI.clamp(arg_157_0.getFriendFrom, 0, arg_157_0.friendsCount - 1)

		if var_157_0 < arg_157_0.friendsCount then
			local var_157_1 = math.floor(arg_157_0.cachedFriends / 2)
			local var_157_2 = arg_157_0.friendsCount - var_157_0

			var_157_2 = var_157_1 < var_157_2 and var_157_1 or var_157_2
			arg_157_0.getFriendTo = arg_157_0.getFriendTo + var_157_2
		end

		arg_157_0.getFriendTo = LUI.clamp(arg_157_0.getFriendTo, arg_157_0.getFriendFrom, arg_157_0.friendsCount - 1)
	else
		arg_157_0.getFriendFrom = 0
		arg_157_0.getFriendTo = math.floor(arg_157_0.cachedFriends / 2)
	end

	if var_157_0 ~= arg_157_0.friendsCount then
		arg_157_0:SetNumChildren(arg_157_0.friendsCount)
	end

	local var_157_3 = arg_157_0:getParent()

	if var_157_3 then
		if var_157_3.UpdateNoFriends then
			var_157_3:UpdateNoFriends(arg_157_0.friendsCount, arg_157_0._friendsData.totalCount, arg_157_2)
		end

		if var_157_3._tabID == FRIENDS.TabIDs.FRIENDS then
			local var_157_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_ONLINE_MEMBERS", arg_157_0._friendsData.onlineCount, arg_157_0._friendsData.totalCount)

			FRIENDS.SetPlayerGridHeader(var_157_3, var_157_4, nil, true)
		end
	end
end

function FRIENDS.RefreshData(arg_158_0, arg_158_1, arg_158_2)
	FRIENDS.ValidatePlayerRequestData(arg_158_1)

	if arg_158_0 == FRIENDS.TabIDs.RECENT_PLAYERS then
		arg_158_1._friendsData = Friends.DAHGHDHFIA(arg_158_2, FRIENDS.TabIDs.RECENT_PLAYERS, arg_158_1.getFriendFrom, arg_158_1.getFriendTo, arg_158_1.friendsCount)

		FRIENDS.UpdatePlayerRequestData(arg_158_1, false, FRIENDS.TabIDs.RECENT_PLAYERS, arg_158_2)
	elseif arg_158_0 == FRIENDS.TabIDs.FRIENDS then
		local var_158_0 = Friends.FBFFEFEGB(arg_158_2, arg_158_1.getFriendFrom, arg_158_1.getFriendTo, arg_158_1.friendsCount, true, arg_158_1.showOfflineFriends)

		if var_158_0 then
			arg_158_1._friendsData = var_158_0

			FRIENDS.UpdatePlayerRequestData(arg_158_1, false, FRIENDS.TabIDs.FRIENDS, arg_158_2)
		end
	elseif arg_158_0 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS then
		arg_158_1._friendsData = Friends.DAHGHDHFIA(arg_158_2, FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS, arg_158_1.getFriendFrom, arg_158_1.getFriendTo, arg_158_1.friendsCount)

		FRIENDS.UpdatePlayerRequestData(arg_158_1, false, FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS, arg_158_2)
	elseif arg_158_0 == FRIENDS.TabIDs.INBOX then
		local var_158_1 = Clans2.EBDFICHCEJ(arg_158_2)

		arg_158_1._friendsData = var_0_38(var_158_1)

		FRIENDS.UpdatePlayerRequestData(arg_158_1, false, FRIENDS.TabIDs.INBOX, arg_158_2)
	end

	arg_158_1:RefreshContent()
end

function FRIENDS.GetGroupMembers(arg_159_0, arg_159_1, arg_159_2)
	local var_159_0

	if arg_159_2 then
		var_159_0 = Clans.GIDGAGEAC(arg_159_0, arg_159_1, arg_159_2)
	else
		var_159_0 = Clans.GIDGAGEAC(arg_159_0, arg_159_1)
	end

	local var_159_1 = {}

	for iter_159_0, iter_159_1 in ipairs(var_159_0) do
		local var_159_2 = Friends.HCAFBJBHC(arg_159_0, iter_159_1.xuid)

		if var_159_2.valid == true then
			local var_159_3 = FRIENDS.UnifyPlayerDataFormat(var_159_2)

			for iter_159_2, iter_159_3 in pairs(iter_159_1) do
				if iter_159_1[iter_159_2] ~= nil and not var_159_3[iter_159_2] then
					var_159_3[iter_159_2] = iter_159_3
				end
			end

			table.insert(var_159_1, var_159_3)
		end
	end

	return var_159_1
end

function FRIENDS.RegisterPlatformIdForViewProfileEventOnMenu(arg_160_0, arg_160_1)
	if arg_160_0 and not arg_160_0.platformIdViewProfileEventIsRegistered then
		arg_160_0:registerEventHandler("PlatformIdForViewProfile", function(arg_161_0, arg_161_1)
			if LUI.FlowManager.IsMenuOnTop("PopupOK") then
				LUI.FlowManager.RequestLeaveMenuByName("PopupOK", true, true)
			end

			if arg_161_1.results and arg_161_1.results.success and arg_161_1.results.platformID ~= "0" then
				Friends.CFBFGBECEB(arg_160_1, arg_161_1.results.platformID)
			else
				local var_161_0 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE_FAILED")

				LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_160_1, false, {
					message = var_161_0
				})
			end
		end)

		arg_160_0.platformIdViewProfileEventIsRegistered = true
	end
end

function FRIENDS.RegimentRoleChangedToast(arg_162_0, arg_162_1, arg_162_2)
	arg_162_2 = arg_162_2 or ""

	local var_162_0 = {
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
			description = Engine.CBBHFCGDIC("REGIMENTS/KICKED_DESC", Engine.JCBDICCAH(arg_162_2))
		}
	}

	arg_162_0:processEvent({
		name = "send_toast_notification",
		immediate = true,
		options = var_162_0[arg_162_1]
	})
end

function FRIENDS.GetOpenPlayerActionPopupFunc(arg_163_0, arg_163_1, arg_163_2)
	return function(arg_164_0, arg_164_1)
		if arg_163_1.isMyPlayer then
			return
		end

		arg_163_1.selectedTab = arg_163_1.selectedTab or arg_163_0
		arg_163_1.controllerIndex = arg_164_1.controller
		arg_163_1.isRegiments = arg_163_0 == FRIENDS.TabIDs.REGIMENTS
		arg_163_1.isPartyMember = arg_163_0 == FRIENDS.TabIDs.PRIVATE_PARTY

		local var_164_0 = MenuBuilder.BuildRegisteredType("SocialPlayerPopup", arg_163_1)
		local var_164_1 = FRIENDS.GetFriendActions(arg_163_1)

		if arg_163_0 == FRIENDS.TabIDs.CLANS and arg_163_2 then
			local var_164_2 = CLANS.GetClanMembersScreenActions(arg_163_2, arg_163_1.viewerMemberRole, arg_163_1)

			for iter_164_0, iter_164_1 in ipairs(var_164_2) do
				table.insert(var_164_1, iter_164_1)
			end
		elseif arg_163_0 ~= FRIENDS.TabIDs.CLANS and arg_163_0 ~= FRIENDS.TabIDs.INBOX then
			local var_164_3 = CLANS.GetSocialMenuScreenActions({
				controllerIndex = arg_164_0._controllerIndex,
				clanDetails = arg_164_0._clanDetails,
				xuid = arg_163_1.xuid,
				playerData = arg_163_1
			})

			arg_164_0._contextualMenuIsAdded = false
			arg_164_0._contextualMenuHandlerAdded = false

			for iter_164_2, iter_164_3 in ipairs(var_164_3) do
				table.insert(var_164_1, iter_164_3)
			end
		end

		FRIENDS.AddFriendActions(arg_163_1, var_164_1, var_164_0.PlayerActions)
		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_164_1.controller, false, {
			widget = var_164_0
		})
	end
end

function FRIENDS.GetOpenInboxActionPopupFunc(arg_165_0)
	return function(arg_166_0, arg_166_1)
		local var_166_0 = arg_166_1.controller or 0
		local var_166_1 = {
			controllerIndex = var_166_0,
			invitationData = arg_165_0
		}

		LUI.FlowManager.RequestAddMenu("SocialInvitationManagementMenu", true, var_166_0, false, var_166_1, true)
	end
end

function FRIENDS.GetPlayerButtonAction(arg_167_0, arg_167_1, arg_167_2)
	assert(arg_167_1)

	if not arg_167_0 then
		return
	end

	local var_167_0

	if arg_167_1 == FRIENDS.TabIDs.FRIENDS then
		if arg_167_2 == FRIENDS.ManageFriendsTabIDs.SENT_INVITES then
			var_167_0 = var_0_30(arg_167_0)
		elseif arg_167_2 == FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS then
			var_167_0 = var_0_31(arg_167_0)
		elseif arg_167_2 == FRIENDS.ManageFriendsTabIDs.BLOCKED_PLAYERS then
			var_167_0 = var_0_32(arg_167_0)
		else
			arg_167_0.selectedTab = FRIENDS.FriendTypeToTabIDs[arg_167_0.friendsListType]
			var_167_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_167_1, arg_167_0)
		end
	elseif arg_167_1 == FRIENDS.TabIDs.RECENT_PLAYERS or arg_167_1 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS then
		var_167_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_167_1, arg_167_0)
	elseif arg_167_1 == FRIENDS.TabIDs.PRIVATE_PARTY then
		if arg_167_2 == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS then
			var_167_0 = var_0_33(arg_167_0)
		elseif arg_167_2 == FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS then
			var_167_0 = var_0_34(arg_167_0)
		else
			var_167_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_167_1, arg_167_0)
		end
	elseif arg_167_1 == FRIENDS.TabIDs.REGIMENTS then
		if arg_167_2 == FRIENDS.ManageRegimentInvitesTabIDs.SENT_INVITES then
			var_167_0 = var_0_35(arg_167_0)
		elseif arg_167_2 == FRIENDS.ManageRegimentInvitesTabIDs.REGIMENT_INVITATIONS then
			var_167_0 = var_0_36(arg_167_0)
		else
			var_167_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_167_1, arg_167_0)
		end
	elseif arg_167_1 == FRIENDS.TabIDs.CLANS then
		if arg_167_2 == CLANS.CLAN_TAB_IDs.BANNED_PlAYERS then
			var_167_0 = var_0_37(arg_167_0)
		else
			var_167_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_167_1, arg_167_0, arg_167_2)
		end
	end

	return var_167_0
end

function FRIENDS.GetPlayerSubTabContextualMenu(arg_168_0, arg_168_1, arg_168_2, arg_168_3)
	assert(arg_168_2)

	if not arg_168_0 then
		return
	end

	local var_168_0 = {}

	if arg_168_2 == FRIENDS.TabIDs.FRIENDS then
		if arg_168_3 == FRIENDS.ManageFriendsTabIDs.SENT_INVITES then
			LUI.ConcatenateToTable(var_168_0, {
				{
					id = "declineRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_168_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.BHCIIHHAAC(arg_168_1, arg_168_0.xuid)
						elseif arg_168_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.DHHEFJGEJC(arg_168_1, arg_168_0.invitationId)
						end

						local var_169_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_169_0, {
							name = "request_fetch_data"
						})
					end
				}
			})
		elseif arg_168_3 == FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS then
			LUI.ConcatenateToTable(var_168_0, {
				{
					id = "acceptRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_168_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.BIHDCJGFCI(arg_168_1, arg_168_0.xuid)
							Social.DAFDEJICJJ(arg_168_1, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_168_0.xuid, arg_168_0.fullName)
						elseif arg_168_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.IBEHACGBI(arg_168_1, arg_168_0.platformId)
							Social.DAFDEJICJJ(arg_168_1, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_168_0.platformId, arg_168_0.fullName)
						end

						local var_170_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_170_0, {
							name = "request_fetch_data"
						})
					end
				},
				{
					id = "declineRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_168_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.CGIDFEJECG(arg_168_1, arg_168_0.xuid)
						elseif arg_168_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.JHHJICGHG(arg_168_1, arg_168_0.platformId)
						end

						local var_171_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_171_0, {
							name = "request_fetch_data"
						})
					end
				},
				{
					id = "blockRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_168_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.CGIDFEJECG(arg_168_1, arg_168_0.xuid)
							Social.DACDEGEDDD(arg_168_1, arg_168_0.xuid, arg_168_0.fullName)
						elseif arg_168_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.JHHJICGHG(arg_168_1, arg_168_0.platformId)
							Social.BIFIFEECCJ(arg_168_1, arg_168_0.platformId)
						end

						local var_172_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_172_0, {
							name = "request_fetch_data"
						})
					end
				}
			})
		elseif arg_168_3 == FRIENDS.ManageFriendsTabIDs.BLOCKED_PLAYERS then
			LUI.ConcatenateToTable(var_168_0, {
				{
					id = "acceptRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_168_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.EIGAJHEGI(arg_168_1, arg_168_0.xuid)
						elseif arg_168_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.JGFDEBFAC(arg_168_0.platformId)
						end

						local var_173_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_173_0, {
							name = "request_fetch_data"
						})
					end
				}
			})
		end
	elseif arg_168_2 == FRIENDS.TabIDs.REGIMENTS then
		if arg_168_3 == FRIENDS.ManageRegimentInvitesTabIDs.REGIMENT_INVITATIONS then
			LUI.ConcatenateToTable(var_168_0, {
				{
					id = "acceptRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
					action = function()
						Clans.IEHDGEGJC(arg_168_1, arg_168_0.clanId)

						local var_174_0 = {
							icon = "hud_info_alert",
							displayTime = 3000,
							description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_ACCEPTED")
						}
						local var_174_1 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_174_1, {
							name = "send_toast_notification",
							immediate = true,
							options = var_174_0
						})
					end
				},
				{
					id = "declineRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
					action = function()
						Clans.DJIFJAAFAI(arg_168_1, arg_168_0.clanId)

						local var_175_0 = {
							icon = "hud_info_alert",
							displayTime = 3000,
							description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_DECLINED")
						}
						local var_175_1 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_175_1, {
							name = "send_toast_notification",
							immediate = true,
							options = var_175_0
						})
					end
				}
			})
		elseif arg_168_3 == FRIENDS.ManageRegimentInvitesTabIDs.SENT_INVITES then
			LUI.ConcatenateToTable(var_168_0, {
				{
					id = "revokeRegiment",
					label = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_REQUEST"),
					action = function()
						Clans.CFJCAAHHGE(arg_168_1, arg_168_0.clanId, arg_168_0.xuid)

						local var_176_0 = {
							icon = "hud_info_alert",
							displayTime = 3000,
							description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_REVOKED")
						}
						local var_176_1 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_176_1, {
							name = "send_toast_notification",
							immediate = true,
							options = var_176_0
						})
					end
				}
			})
		end
	end

	return var_168_0
end

function FRIENDS.GetRefreshPlayerChildFunc(arg_177_0, arg_177_1, arg_177_2)
	local function var_177_0(arg_178_0, arg_178_1)
		if arg_177_0.UpdatePlayerDetails then
			arg_177_0:UpdatePlayerDetails(arg_178_0, arg_178_1)
		end
	end

	return function(arg_179_0, arg_179_1, arg_179_2)
		if arg_177_1 ~= FRIENDS.TabIDs.INBOX then
			arg_179_0.UpdatePlayerDetailsContent = var_177_0
		end

		local var_179_0 = arg_177_2 > 1 and arg_179_1 + arg_179_2 * arg_177_2 or arg_179_2

		arg_179_0:SetCurrentLocation(arg_177_1)

		if arg_177_1 == FRIENDS.TabIDs.FRIENDS or arg_177_1 == FRIENDS.TabIDs.RECENT_PLAYERS or arg_177_1 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS then
			arg_179_0:SetupPlayerData(arg_177_0.PlayersGrid._friendsData.friends[var_179_0 + 1 - arg_177_0.PlayersGrid.getFriendFrom])
		elseif arg_177_1 == FRIENDS.TabIDs.PRIVATE_PARTY or arg_177_1 == FRIENDS.TabIDs.REGIMENTS then
			local var_179_1 = FRIENDS.UnifyPlayerDataFormat(arg_177_0.PlayersGrid.playersData[var_179_0 + 1])

			arg_179_0:SetupPlayerData(var_179_1)
		elseif arg_177_1 == FRIENDS.TabIDs.INBOX then
			local var_179_2 = arg_177_0.PlayersGrid._friendsData.friends[var_179_0 + 1 - arg_177_0.PlayersGrid.getFriendFrom]

			arg_179_0:SetupInvitationData(var_179_2)
		end
	end
end

function FRIENDS.UnifyPlayerDataFormat(arg_180_0)
	local var_180_0 = arg_180_0

	if arg_180_0.xuidString and not arg_180_0.xuid then
		var_180_0.xuid = arg_180_0.xuidString
	end

	if arg_180_0.gamertag and not arg_180_0.fullName then
		var_180_0.fullName = arg_180_0.gamertag
	end

	if arg_180_0.name and not arg_180_0.fullName then
		var_180_0.fullName = arg_180_0.name
	end

	if arg_180_0.clientPlatform and not arg_180_0.presencePlatform then
		var_180_0.presencePlatform = ClientPlatformToPresencePlatform[arg_180_0.clientPlatform]
	end

	if arg_180_0.platform and not arg_180_0.presencePlatform then
		var_180_0.presencePlatform = arg_180_0.platform
	end

	if arg_180_0.clanName and not arg_180_0.fullName then
		var_180_0.fullName = arg_180_0.clanName
	end

	if arg_180_0.isMyPlayer then
		if CONDITIONS.IsBattleNet() then
			local var_180_1 = 0
			local var_180_2 = Engine.EAGGAEGHHA(var_180_1)

			var_180_0.onlineStatus = Social.ECDAFHBHGC(var_180_1, var_180_2, true)
		else
			var_180_0.onlineStatus = BattleNetOnlineStatus.ONLINE
		end
	end

	return var_180_0
end

function FRIENDS.UnifyInvitationsFormat(arg_181_0, arg_181_1)
	for iter_181_0, iter_181_1 in ipairs(arg_181_0) do
		iter_181_1.invitationId = arg_181_1

		if iter_181_1.timeInfo and not iter_181_1.timestamp then
			iter_181_1.timestamp = iter_181_1.timeInfo
		end

		if iter_181_1.inviterXuid then
			iter_181_1.xuid = iter_181_1.inviterXuid
		end
	end

	return arg_181_0
end

function FRIENDS.GetNotificationDataSourceByTab(arg_182_0)
	local var_182_0

	if arg_182_0 == FRIENDS.TabIDs.FRIENDS then
		var_182_0 = DataSources.frontEnd.social.friendRequestCount
	elseif arg_182_0 == FRIENDS.TabIDs.PRIVATE_PARTY then
		var_182_0 = DataSources.frontEnd.social.partyInvitationCount
	elseif arg_182_0 == FRIENDS.TabIDs.REGIMENTS then
		var_182_0 = DataSources.frontEnd.social.regimentInvitationCount
	end

	return var_182_0
end

function FRIENDS.GetCurrentClanTagType(arg_183_0)
	local var_183_0 = ClanTagType.CUSTOM

	if Engine.BAHCIEEBFD(arg_183_0) then
		var_183_0 = LUI.DataSourceFromPlayerData.new(CoD.StatsGroup.Common, CoD.PlayMode.Core).clanTagType:GetValue(arg_183_0)
	end

	return var_183_0 or ClanTagType.CUSTOM
end

function FRIENDS.GetHappyHourSetTimeString(arg_184_0, arg_184_1)
	local var_184_0 = Clans.CBJDIGCAED(arg_184_0, arg_184_1)

	if var_184_0 then
		if IsLanguageEnglish() then
			local var_184_1, var_184_2 = Engine.CBBHFCGDIC("LUA_MENU/TIME_PERIOD_AM"), Engine.CBBHFCGDIC("LUA_MENU/TIME_PERIOD_PM")
			local var_184_3 = var_184_0.happyHour

			if var_184_3 == 0 then
				var_184_3 = 12
			elseif var_184_3 >= 12 then
				var_184_1 = var_184_2

				if var_184_3 > 12 then
					var_184_3 = var_184_3 - 12
				end
			end

			return Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_SET", var_184_3, string.format("%02d", var_184_0.happyMinutes), var_184_1)
		else
			return Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_SET", string.format("%02d", var_184_0.happyHour), string.format("%02d", var_184_0.happyMinutes))
		end
	else
		return ""
	end
end

function FRIENDS.SetPlayerGridHeader(arg_185_0, arg_185_1, arg_185_2, arg_185_3)
	arg_185_0.HeadLine:SetAlpha(arg_185_3 and 1 or 0)

	if arg_185_1 and #arg_185_1 > 0 then
		arg_185_0.HeadText:SetAlpha(1)
		arg_185_0.HeadText:setText(arg_185_1)
		arg_185_0.HeadLine:SetAlpha(1)
	end

	if arg_185_2 and #arg_185_2 > 0 then
		arg_185_0.PlayerNumText:SetAlpha(1)
		arg_185_0.PlayerNumText:setText(arg_185_2)
	end
end

function FRIENDS.TryAppendRealIdToBattleTag(arg_186_0, arg_186_1)
	local var_186_0 = Social.CFEIHAADEI(arg_186_0)
	local var_186_1 = Engine.BECCFCBIAA("displayRealID")

	if var_186_0 and var_186_1 == 1 then
		local var_186_2 = var_186_0.fullName

		if var_186_2 ~= nil and #var_186_2 > 0 then
			return Engine.CBBHFCGDIC("LUA_MENU/BATTLETAG_WITH_READ_ID_NAME", Engine.JCBDICCAH(arg_186_1), Engine.JCBDICCAH(var_186_2))
		else
			return arg_186_1
		end
	end

	return arg_186_1
end

function FRIENDS.GetFriendPlatformId(arg_187_0)
	local var_187_0 = Engine.CBBFHGEDGJ()
	local var_187_1 = arg_187_0.presencePlatform
	local var_187_2 = 0

	if var_187_1 <= 0 then
		-- block empty
	elseif var_187_0 == var_187_1 then
		var_187_2 = var_187_1
	elseif var_187_0 == PresencePlatform.BNET then
		if var_187_1 == PresencePlatform.STEAM then
			var_187_2 = PresencePlatform.NONE
		else
			var_187_2 = var_187_1
		end
	elseif var_187_0 == PresencePlatform.STEAM then
		var_187_2 = PresencePlatform.NONE
	elseif var_187_1 == PresencePlatform.BNET then
		var_187_2 = PresencePlatform.CROSSPLAY_PC
	elseif var_187_1 == PresencePlatform.STEAM then
		var_187_2 = PresencePlatform.NONE
	else
		var_187_2 = PresencePlatform.CROSSPLAY_CONSOLE
	end

	return var_187_2
end
