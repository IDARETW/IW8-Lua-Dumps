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
	[PresencePlatform.STEAM] = "icon_platform_steam",
	[PresencePlatform.WEGAME] = "icon_social_friend_atvi",
	[PresencePlatform.CROSSPLAY_CONSOLE] = "icon_platform_console",
	[PresencePlatform.CROSSPLAY_PC] = "icon_platform_pc",
	[PresencePlatform.UBICONNECT] = "icon_platform_ubiconnect",
	[PresencePlatform.MSSTORE] = "icon_platform_msstore_pc"
}
FRIENDS.PlatformFriendText = {
	[PresencePlatform.NONE] = Engine.CBBHFCGDIC("LUA_MENU/ACTIVISION_FRIEND"),
	[PresencePlatform.XBOX_ONE] = Engine.CBBHFCGDIC("LUA_MENU/XBOX_FRIEND"),
	[PresencePlatform.PS4] = Engine.CBBHFCGDIC("LUA_MENU/PLAYSTATION_FRIEND"),
	[PresencePlatform.XB4] = Engine.CBBHFCGDIC("LUA_MENU/XBOX_FRIEND"),
	[PresencePlatform.PS5] = Engine.CBBHFCGDIC("LUA_MENU/PLAYSTATION_FRIEND"),
	[PresencePlatform.BNET] = Engine.CBBHFCGDIC("LUA_MENU/BNET_FRIEND"),
	[PresencePlatform.STEAM] = Engine.CBBHFCGDIC("LUA_MENU/LAZE_FRIEND"),
	[PresencePlatform.CROSSPLAY_CONSOLE] = Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_CONSOLE_FRIEND"),
	[PresencePlatform.CROSSPLAY_PC] = Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_PC_FRIEND"),
	[PresencePlatform.UBICONNECT] = Engine.CBBHFCGDIC("LUA_MENU/UBICONNECT_FRIEND"),
	[PresencePlatform.MSSTORE] = Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_XBOX_FRIEND")
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

	return Friends.BIAJAECICH(arg_2_0.controllerIndex, var_2_0) or Friends.DIIAFCGBDA(arg_2_0.controllerIndex, var_2_0, 0)
end

local function var_0_5(arg_3_0)
	local var_3_0 = arg_3_0.xuidString or arg_3_0.xuid
	local var_3_1 = arg_3_0.platformId or "0"

	if arg_3_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS then
		return Friends.BIAJAECICH(arg_3_0.controllerIndex, var_3_0)
	else
		return Friends.DIIAFCGBDA(arg_3_0.controllerIndex, var_3_0, var_3_1)
	end
end

local function var_0_6(arg_4_0)
	return type(arg_4_0.xuid) == "userdata" and arg_4_0.xuid or Friends.CAIJHBHGGC(arg_4_0.xuidString or arg_4_0.xuid)
end

local function var_0_7(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if not arg_5_2 then
		return true
	end

	local var_5_0 = Invitation.ECGAJEGAIC(arg_5_0, arg_5_1, arg_5_2, arg_5_3)

	if Dvar.IBEGCHEFE("enable_join_cross_launch_override") and var_5_0.disabled then
		var_5_0.disabled = var_5_0.disabled and Engine.BBHGAFFFGE(arg_5_0, arg_5_1) ~= 2
	end

	local var_5_1, var_5_2 = Engine.CFHECDBFGF(arg_5_0, false)

	if not var_5_1 then
		local var_5_3

		var_5_1, var_5_3 = Engine.EBAAEFCBJA(arg_5_0, false)
	end

	if not var_5_1 then
		var_5_0.disabled = true
		var_5_0.devErrorString = "MPNotAllowed"
		var_5_0.errorString = "ONLINE/CANT_JOIN_NO_MP_PRIVILEGE"
	end

	return var_5_0
end

local function var_0_8(arg_6_0)
	local var_6_0 = {
		label = Engine.CBBHFCGDIC(arg_6_0)
	}

	var_6_0.id = "header"

	return var_6_0
end

local function var_0_9(arg_7_0)
	local var_7_0 = arg_7_0.controllerIndex
	local var_7_1 = arg_7_0.invitationData
	local var_7_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_CLAN_INVITE")
	}

	var_7_2.id = "acceptInvite"

	function var_7_2.disabledFunc()
		return var_7_1 == nil
	end

	function var_7_2.action()
		return CLANS.AcceptClanInvite(var_7_1, var_7_0)
	end

	return var_7_2
end

local function var_0_10(arg_10_0)
	local var_10_0 = arg_10_0.controllerIndex
	local var_10_1 = arg_10_0.invitationData
	local var_10_2 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_CLAN_INVITE")
	}

	var_10_2.id = "declineInvite"

	function var_10_2.disabledFunc()
		return var_10_1 == nil
	end

	function var_10_2.action()
		return CLANS.DenyClanInvite(var_10_1, var_10_0)
	end

	return var_10_2
end

local function var_0_11(arg_13_0)
	local var_13_0 = arg_13_0.controllerIndex
	local var_13_1 = var_0_6(arg_13_0)
	local var_13_2 = arg_13_0.platformId
	local var_13_3 = arg_13_0.selectedTab
	local var_13_4 = {
		label = Engine.CBBHFCGDIC("MENU/JOIN_GAME")
	}

	var_13_4.id = "joinGame"
	var_13_4.refreshOnAction = true

	function var_13_4.disabledFunc()
		return not var_0_3(arg_13_0) or var_0_7(var_13_0, var_13_1, var_13_2, var_13_3)
	end

	function var_13_4.action()
		local function var_15_0()
			local var_16_0 = var_13_4.disabledFunc()

			if var_16_0 and not var_16_0.disabled then
				local var_16_1 = Engine.DCHCGDJCGB(var_13_0)
				local var_16_2 = Engine.DCCCGHJJCJ(var_13_0)

				if arg_13_0.gameTitle and arg_13_0.gameTitle ~= var_16_2 then
					if arg_13_0.gameTitle == Title.PLATFORM_HQ then
						Dvar.DFIJDJFIFD("NLTLMQTLK", CrossLaunchUtils.HQCrosslaunchTitles.CORTEZ)
					end

					Friends.CIJIDFCEHD(var_13_0, var_13_1)
				else
					Friends.DACCIAAAAB(var_13_0, var_13_1, var_13_2)
				end
			end
		end

		FRIENDS.TryJoinUserParty(var_15_0)
	end

	return var_13_4
end

local function var_0_12(arg_17_0)
	local var_17_0 = arg_17_0.controllerIndex
	local var_17_1 = var_0_6(arg_17_0)
	local var_17_2 = arg_17_0.platformId
	local var_17_3 = arg_17_0.selectedTab
	local var_17_4 = not Engine.DDJFBBJAIG()
	local var_17_5 = Engine.DAFGFCFHJI()
	local var_17_6 = {
		label = (var_17_4 or var_17_5) and Engine.CBBHFCGDIC("MENU/INVITE_TO_GAME") or Engine.CBBHFCGDIC("MENU/INVITE_TO_PARTY")
	}

	var_17_6.id = "sendInvite"
	var_17_6.refreshOnAction = true

	function var_17_6.disabledFunc()
		return not var_0_3(arg_17_0) or Invitation.DCDABCADAF(var_17_0, var_17_1, var_17_2, var_17_3)
	end

	function var_17_6.action()
		local var_19_0 = var_17_6.disabledFunc()

		if var_19_0 and not var_19_0.disabled then
			Invitation.DIDIHAJHGA(var_17_0, var_17_1, var_17_2)
		end
	end

	return var_17_6
end

local function var_0_13(arg_20_0)
	local var_20_0

	if arg_20_0.xuidString then
		var_20_0 = arg_20_0.xuidString
	else
		var_20_0 = arg_20_0.xuid
	end

	local var_20_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/INVITE_TO_REGIMENT", Engine.JCBDICCAH(arg_20_0.clanName))
	}

	var_20_1.id = "sendClanInvite"
	var_20_1.refreshOnAction = true

	function var_20_1.disabledFunc()
		local var_21_0 = {}
		local var_21_1 = Clans.CHEADIHHBJ(arg_20_0.controllerIndex, arg_20_0.clanID, var_20_0).memberFound
		local var_21_2 = FRIENDS.IsClanInvitePending(arg_20_0.controllerIndex, arg_20_0.clanID, var_20_0)

		var_21_0.disabled = not var_0_3(arg_20_0) or var_21_1 or var_21_2
		var_21_0.errorString = ""
		var_21_0.devErrorString = ""

		if var_21_1 then
			var_21_0.errorString = "LUA_MENU/REGIMENT_MEMBER_EXISTS"
			var_21_0.devErrorString = Engine.CBBHFCGDIC(var_21_0.errorString)
		end

		return var_21_0
	end

	function var_20_1.action()
		local var_22_0 = var_20_1.disabledFunc()

		if var_22_0 and not var_22_0.disabled then
			Clans.DIEAGEDBCC(arg_20_0.controllerIndex, arg_20_0.clanID, var_20_0)
		end
	end

	return var_20_1
end

local function var_0_14(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = Engine.EAGGAEGHHA(arg_23_0)
	local var_23_1 = Clans.BFCDHGIGGC(arg_23_0, arg_23_1)
	local var_23_2 = Clans.CHEADIHHBJ(arg_23_0, arg_23_1, arg_23_2)
	local var_23_3 = false

	if var_23_2.memberFound then
		if var_23_0 == var_23_1 then
			var_23_3 = true
		elseif var_23_2.role == OnlineClanRole.MEMBER then
			var_23_3 = true
		end
	end

	return var_23_3
end

local function var_0_15(arg_24_0)
	local var_24_0

	if arg_24_0.xuidString then
		var_24_0 = arg_24_0.xuidString
	else
		var_24_0 = arg_24_0.xuid
	end

	local var_24_1 = {
		label = Engine.CBBHFCGDIC("REGIMENTS/KICK_FROM_REGIMENT", Engine.JCBDICCAH(arg_24_0.clanName))
	}

	var_24_1.id = "kickClanMember"
	var_24_1.refreshOnAction = true

	function var_24_1.disabledFunc()
		local var_25_0 = {}
		local var_25_1 = Clans.CHEADIHHBJ(arg_24_0.controllerIndex, arg_24_0.clanID, var_24_0).memberFound
		local var_25_2 = var_0_14(arg_24_0.controllerIndex, arg_24_0.clanID, var_24_0)

		var_25_0.disabled = not var_0_3(arg_24_0) or not var_25_1 or not var_25_2
		var_25_0.errorString = ""
		var_25_0.devErrorString = ""

		if not var_25_1 then
			var_25_0.errorString = "REGIMENTS/MEMBER_NOT_FOUND"
			var_25_0.devErrorString = Engine.CBBHFCGDIC(var_25_0.errorString)
		elseif not var_25_2 then
			var_25_0.errorString = "REGIMENTS/CANNOT_KICK_MEMBER"
			var_25_0.devErrorString = Engine.CBBHFCGDIC(var_25_0.errorString)
		end

		return var_25_0
	end

	function var_24_1.action()
		local var_26_0 = var_24_1.disabledFunc()

		if var_26_0 and not var_26_0.disabled then
			Clans.BJFFGACEBD(arg_24_0.controllerIndex, arg_24_0.clanID, var_24_0)
		end
	end

	return var_24_1
end

local function var_0_16(arg_27_0)
	local var_27_0 = arg_27_0.controllerIndex
	local var_27_1 = var_0_6(arg_27_0)
	local var_27_2 = arg_27_0.isBot and true or false
	local var_27_3 = {
		label = Engine.CBBHFCGDIC("XBOXLIVE/KICK")
	}

	var_27_3.id = "kickPlayer"

	function var_27_3.disabledFunc()
		local var_28_0 = Lobby.BBDICGHE()
		local var_28_1 = var_28_0 and Lobby.DFFFFJHCEH() and IsPrivateMatch() or not var_28_0 and Lobby.BGIADHIHAG()

		return var_27_2 or not Engine.DDJFBBJAIG() or not var_28_1 or Lobby.CHBBHFHJEH(var_27_1) or IsMlgGameBattlesMatch()
	end

	function var_27_3.action()
		if Lobby.DDADACHHAE(var_27_1) then
			LUI.FlowManager.RequestPopupMenu(nil, "LobbyMemberKick", true, var_27_0, false, {
				xuid = var_27_1
			})
		end
	end

	return var_27_3
end

local function var_0_17(arg_30_0)
	local var_30_0 = arg_30_0.controllerIndex
	local var_30_1 = var_0_6(arg_30_0)
	local var_30_2 = {
		label = Engine.CBBHFCGDIC("CODCASTER/FOLLOW")
	}

	var_30_2.id = "followPlayer"

	function var_30_2.disabledFunc()
		local var_31_0 = Lobby.GetLocalPlayerDataSource(var_30_0).followersCount:GetValue(var_30_0)

		return not Engine.DDJFBBJAIG() or Lobby.CHBBHFHJEH(var_30_1) or var_31_0 > 0 or arg_30_0.memberTeam == Teams.follower
	end

	function var_30_2.action()
		if Lobby.DDADACHHAE(var_30_1) then
			Lobby.BFBCBFEGFI(var_30_0, Teams.follower)
			LobbyMember.BABJJDBHCH(true, var_30_0)
			LobbyMember.CGEEIHHBAA(arg_30_0.memberIndex, var_30_0)
			LobbyMember.IFIJDJICI(true, var_30_0)
		end
	end

	return var_30_2
end

local function var_0_18(arg_33_0)
	local var_33_0 = {
		label = Engine.CBBHFCGDIC("CODCASTER/MOVE_UP")
	}

	var_33_0.id = "moveUp"

	function var_33_0.disabledFunc()
		local var_34_0 = Lobby.GetPreviousFollowablePlayerNum(arg_33_0.memberIndex)

		return not Engine.DDJFBBJAIG() or not var_34_0 or arg_33_0.memberTeam == Teams.follower
	end

	function var_33_0.action()
		local var_35_0 = Lobby.GetPreviousFollowablePlayerNum(arg_33_0.memberIndex)

		if var_35_0 then
			Lobby.HIJBFHIGF(arg_33_0.memberIndex, var_35_0)
		end
	end

	return var_33_0
end

local function var_0_19(arg_36_0)
	local var_36_0 = {
		label = Engine.CBBHFCGDIC("CODCASTER/MOVE_DOWN")
	}

	var_36_0.id = "moveDown"

	function var_36_0.disabledFunc()
		local var_37_0 = Lobby.GetNextFollowablePlayerNum(arg_36_0.memberIndex)

		return not Engine.DDJFBBJAIG() or not var_37_0 or arg_36_0.memberTeam == Teams.follower
	end

	function var_36_0.action()
		local var_38_0 = Lobby.GetNextFollowablePlayerNum(arg_36_0.memberIndex)

		if var_38_0 then
			Lobby.HIJBFHIGF(arg_36_0.memberIndex, var_38_0)
		end
	end

	return var_36_0
end

local function var_0_20(arg_39_0, arg_39_1, arg_39_2)
	return {
		label = LocalizeIntoString(MP.GetTeamInfo(arg_39_2).name, "CODCASTER/ASSIGN_TO_TEAM"),
		id = arg_39_1,
		disabledFunc = function()
			return not Engine.DDJFBBJAIG()
		end,
		action = function()
			Lobby.DCGHHFGDCE(arg_39_0.memberIndex, arg_39_2)
		end
	}
end

local function var_0_21(arg_42_0)
	local var_42_0 = LUI.ShallowCopy(arg_42_0)
	local var_42_1 = var_42_0.controllerIndex
	local var_42_2 = var_0_6(var_42_0)
	local var_42_3 = var_42_0.gamertag

	if var_42_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS or not Engine.DBFCJBDJEC() then
		var_42_0.selectedTab = FRIENDS.TabIDs.CROSSPLAY_FRIENDS
	end

	local var_42_4 = {
		label = Engine.CBBHFCGDIC("MENU/SOCIAL_WHISPER")
	}

	var_42_4.id = "whisper"

	function var_42_4.disabledFunc()
		local var_43_0 = LUI.TextChat.GetLayer()

		if not var_43_0 or not LUI.TextChat.ShouldBeVisible(var_43_0) then
			return true
		end

		if Engine.EAABDHIDFJ() then
			if not var_0_4(var_42_0) then
				return true
			end
		elseif not var_0_5(var_42_0) then
			return true
		end

		local var_43_1 = var_42_0.selectedTab == FRIENDS.TabIDs.ONLINE_FRIENDS and var_42_0.platformId or Friends.BEJHAIFIAB(var_42_2)

		return not Social.BGEBDBIHFA(var_42_1, var_43_1)
	end

	function var_42_4.action()
		if not var_42_4.disabledFunc() then
			local var_44_0 = LUI.TextChat.GetLayer()
			local var_44_1 = var_42_0.selectedTab == FRIENDS.TabIDs.ONLINE_FRIENDS and var_42_0.platformId or Friends.BEJHAIFIAB(var_42_2)

			var_44_0:InitiateWhisperWithXUID(var_42_1, var_44_1, var_42_3)
			LUI.TextChat.StartEditing(var_44_0, var_42_1)
		end
	end

	return var_42_4
end

local function var_0_22(arg_45_0)
	local var_45_0 = arg_45_0.controllerIndex
	local var_45_1 = var_0_6(arg_45_0)
	local var_45_2 = arg_45_0.clientNum
	local var_45_3 = arg_45_0.isBot and true or false
	local var_45_4 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/MUTE_UNMUTE")
	}

	var_45_4.id = "mutePlayer"

	function var_45_4.disabledFunc()
		return var_45_3 or Lobby.CHBBHFHJEH(var_45_1) or IsMlgGameBattlesMatch()
	end

	function var_45_4.action()
		if var_45_2 and not Engine.DDJFBBJAIG() then
			Game.CBEICJFEHB(var_45_2)
			LUI.UIRoot.GetRootForControllerIndex(var_45_0):dispatchEventToChildren({
				name = "kbm_button_mute_action",
				clientNum = var_45_2
			})
		else
			Lobby.CHICEBEEEI(var_45_0, var_45_1)
		end
	end

	return var_45_4
end

local function var_0_23(arg_48_0)
	local var_48_0 = LUI.ShallowCopy(arg_48_0)
	local var_48_1 = var_48_0.controllerIndex
	local var_48_2 = var_0_6(var_48_0)
	local var_48_3 = var_48_0.platformId

	if var_48_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS then
		var_48_0.selectedTab = FRIENDS.TabIDs.CROSSPLAY_FRIENDS
	end

	local var_48_4 = var_48_0.selectedTab
	local var_48_5 = var_48_0.isBot and true or false
	local var_48_6 = {
		label = var_48_0.isContextualMenu and Engine.CBBHFCGDIC("MENU/SEND_FRIEND_REQUEST") or Engine.CBBHFCGDIC("MENU/FRIEND_REQUEST")
	}

	var_48_6.id = "friendRequest"

	function var_48_6.disabledFunc()
		return var_48_5 or var_0_5(var_48_0) or Lobby.CHBBHFHJEH(var_48_2)
	end

	function var_48_6.action()
		if not var_48_6.disabledFunc() then
			if var_48_4 == FRIENDS.TabIDs.ONLINE_FRIENDS then
				Social.HJFBFFDD(var_48_1, var_48_3, false)
			else
				Social.DEIAGIIJDF(var_48_1, Friends.BEJHAIFIAB(var_48_2))
			end
		end
	end

	return var_48_6
end

local function var_0_24(arg_51_0)
	local var_51_0 = arg_51_0.controllerIndex
	local var_51_1 = arg_51_0.platformId
	local var_51_2 = var_0_6(arg_51_0)
	local var_51_3 = {}

	if Engine.CHDGBEFDHB() or Engine.EAABDHIDFJ() then
		var_51_3.label = Engine.CBBHFCGDIC("MENU/SEND_ATVI_FRIEND_REQUEST")
	else
		var_51_3.label = Engine.CBBHFCGDIC("LUA_MENU/UPGRADE_REAL_ID")
	end

	var_51_3.id = "upgradeRealId"

	function var_51_3.disabledFunc()
		return not var_0_5(arg_51_0)
	end

	function var_51_3.action()
		if Engine.CHDGBEFDHB() or Engine.EAABDHIDFJ() then
			Social.DEIAGIIJDF(var_51_0, Friends.BEJHAIFIAB(var_51_2))
		else
			Social.HJFBFFDD(var_51_0, var_51_1, true)
		end
	end

	return var_51_3
end

local function var_0_25(arg_54_0)
	local var_54_0 = LUI.ShallowCopy(arg_54_0)
	local var_54_1 = var_54_0.controllerIndex
	local var_54_2 = var_0_6(var_54_0)
	local var_54_3 = var_54_0.platformId

	if var_54_0.selectedTab ~= FRIENDS.TabIDs.ONLINE_FRIENDS then
		var_54_0.selectedTab = FRIENDS.TabIDs.CROSSPLAY_FRIENDS
	end

	local var_54_4 = var_54_0.selectedTab
	local var_54_5 = var_54_0.gamertag or var_54_0.fullName
	local var_54_6 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_FRIEND")
	}

	var_54_6.id = "removeFriend"

	function var_54_6.disabledFunc()
		if Engine.CHDGBEFDHB() or Engine.EAABDHIDFJ() then
			return var_54_4 == FRIENDS.TabIDs.ONLINE_FRIENDS and not Friends.BIAJAECICH(var_54_1, Friends.BEJHAIFIAB(var_54_2)) or Lobby.CHBBHFHJEH(var_54_2)
		end

		return var_54_4 == FRIENDS.TabIDs.ONLINE_FRIENDS and Engine.DBFCJBDJEC() or not var_0_5(var_54_0) or Lobby.CHBBHFHJEH(var_54_2)
	end

	function var_54_6.action(arg_56_0, arg_56_1)
		local var_56_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_FRIEND"),
			message = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_FRIEND_CONFIRMATION"),
			extraMessage = Engine.JCBDICCAH(tostring(var_54_5)),
			buttons = {
				{
					label = Engine.CBBHFCGDIC("LUA_MENU_MP/CONFIRM"),
					action = function()
						if LUI.FlowManager.IsInStack("SocialMenu") then
							LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false
						end

						if var_54_4 == FRIENDS.TabIDs.ONLINE_FRIENDS and not Engine.CHDGBEFDHB() and not Engine.EAABDHIDFJ() then
							Social.EBJFEHBAID(var_54_1, var_54_3)
						else
							Social.CDFFGDDEHF(var_54_1, Friends.BEJHAIFIAB(var_54_2))
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

		LUI.FlowManager.RequestPopupMenu(arg_56_0, "GenericConfirmPopup", true, var_54_1, false, var_56_0, nil, true, true)
	end

	return var_54_6
end

local function var_0_26(arg_59_0)
	local var_59_0 = arg_59_0.controllerIndex
	local var_59_1 = var_0_6(arg_59_0)
	local var_59_2 = arg_59_0.platformId
	local var_59_3 = arg_59_0.selectedTab
	local var_59_4 = arg_59_0.isBot and true or false
	local var_59_5 = {
		label = Engine.CBBHFCGDIC("MENU/REPORT_PLAYER")
	}

	var_59_5.id = "reportPlayer"

	function var_59_5.disabledFunc()
		return var_59_4 or Lobby.CHBBHFHJEH(var_59_1)
	end

	function var_59_5.action()
		if not var_59_5.disabledFunc() then
			LUI.FlowManager.RequestPopupMenu(nil, "ReportPlayer", true, var_59_0, false, {
				xuid = var_59_1,
				platformId = var_59_2
			})
		end
	end

	return var_59_5
end

local function var_0_27(arg_62_0)
	local var_62_0 = arg_62_0.controllerIndex
	local var_62_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU_MP/CHOOSE_YOUR_OWN")
	}

	var_62_1.id = "selectSquad"

	function var_62_1.disabledFunc()
		return false
	end

	function var_62_1.action()
		if not var_62_1.disabledFunc() then
			if LUI.FlowManager.IsMenuOnTop("LobbySquadActions") then
				LUI.FlowManager.RequestLeaveMenuByName("LobbySquadActions")
			end

			LUI.FlowManager.RequestAddMenu("WarzonePrivateMatchSquadMenu", true, var_62_0, false, nil, true)
		end
	end

	return var_62_1
end

local function var_0_28(arg_65_0)
	local var_65_0 = arg_65_0.controllerIndex
	local var_65_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU_MP/ASSIGN_RANDOM_SQUAD")
	}

	var_65_1.id = "selectRandomSquad"

	function var_65_1.disabledFunc()
		return false
	end

	function var_65_1.action()
		if not var_65_1.disabledFunc() then
			if LUI.FlowManager.IsMenuOnTop("LobbySquadActions") then
				LUI.FlowManager.RequestLeaveMenuByName("LobbySquadActions")
			end

			LUI.FlowManager.RequestAddMenu("WarzonePrivateMatchSquadMenu", true, var_65_0, false, {
				requestRandomSquadNow = true
			}, true)
		end
	end

	return var_65_1
end

local function var_0_29(arg_68_0)
	local var_68_0 = arg_68_0.controllerIndex
	local var_68_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU_MP/NOT_NOW")
	}

	var_68_1.id = "selectNoSquad"

	function var_68_1.disabledFunc()
		return false
	end

	function var_68_1.action()
		if not var_68_1.disabledFunc() and LUI.FlowManager.IsMenuOnTop("LobbySquadActions") then
			LUI.FlowManager.RequestLeaveMenuByName("LobbySquadActions")
		end
	end

	return var_68_1
end

local function var_0_30(arg_71_0)
	local var_71_0 = var_0_6(arg_71_0)
	local var_71_1 = Friends.BEJHAIFIAB(var_71_0)
	local var_71_2 = arg_71_0.platformId
	local var_71_3 = arg_71_0.selectedTab
	local var_71_4 = arg_71_0.isBot and true or false
	local var_71_5 = (Engine.HDGDBCJFG() or Engine.DBFCJBDJEC() or Engine.CHDGBEFDHB()) and Friends.CIBEABFIJI(arg_71_0.controllerIndex, var_71_0)
	local var_71_6
	local var_71_7 = {
		label = var_71_5 and Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK_PLAYER") or Engine.CBBHFCGDIC("LUA_MENU/BLOCK_PLAYER")
	}

	var_71_7.id = "blockPlayer"

	function var_71_7.disabledFunc()
		return var_71_4 or Lobby.CHBBHFHJEH(var_71_0) or var_71_6
	end

	function var_71_7.action(arg_73_0, arg_73_1)
		local var_73_0 = var_71_3 == FRIENDS.TabIDs.ONLINE_FRIENDS and Engine.DBFCJBDJEC()
		local var_73_1 = var_71_1 ~= var_71_2

		if var_71_5 then
			if var_73_0 then
				Social.JGFDEBFAC(var_71_2)
			end

			if var_73_1 then
				Social.EIGAJHEGI(arg_71_0.controllerIndex, var_71_1)
			end
		else
			if var_73_0 then
				if var_0_5(arg_71_0) then
					local var_73_2 = var_73_1

					var_73_1 = false

					local function var_73_3()
						Social.BIFIFEECCJ(arg_71_0.controllerIndex, var_71_2)

						if var_73_2 then
							Social.DACDEGEDDD(arg_71_0.controllerIndex, var_71_1, arg_71_0.gamertag or arg_71_0.fullName)
						end

						var_71_6 = true
					end

					LUI.FlowManager.RequestPopupMenu(nil, "BlockPlayerAndRemoveFromFriendsPopup", true, arg_71_0.controllerIndex, false, {
						yesAction = var_73_3
					})
				else
					Social.BIFIFEECCJ(var_71_2)
				end
			end

			if var_73_1 then
				Social.DACDEGEDDD(arg_71_0.controllerIndex, var_71_1, arg_71_0.gamertag or arg_71_0.fullName)
			end
		end

		var_71_6 = var_73_1
	end

	return var_71_7
end

local function var_0_31(arg_75_0)
	return function(arg_76_0, arg_76_1)
		local var_76_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_SENT_INVITE"),
			message = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_INVITE_MESSAGE"),
			extraMessage = Engine.JCBDICCAH(arg_75_0.fullName)
		}

		var_76_0.itemImage = "icon_warning_large"
		var_76_0.buttons = {
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_REQUEST"),
				action = function()
					LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

					if arg_75_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
						Social.BHCIIHHAAC(arg_76_1.controller, arg_75_0.xuid)
					elseif arg_75_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
						Social.DHHEFJGEJC(arg_76_1.controller, arg_75_0.invitationId)
					end

					arg_76_0:dispatchEventToRoot({
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

		LUI.FlowManager.RequestPopupMenu(arg_76_0, "GenericConfirmPopup", true, arg_76_1.controller, false, var_76_0, nil, true, true)
	end
end

local function var_0_32(arg_79_0)
	return function(arg_80_0, arg_80_1)
		local var_80_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIEND_REQUEST"),
			message = Engine.CBBHFCGDIC("LUA_MENU/REQUEST_MESSAGE"),
			extraMessage = Engine.JCBDICCAH(arg_79_0.fullName)
		}

		var_80_0.itemImage = "mm_element_logo_white"
		var_80_0.buttons = {
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
				action = function()
					LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

					if arg_79_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
						Social.BIHDCJGFCI(arg_80_1.controller, arg_79_0.xuid)
						Social.DAFDEJICJJ(arg_80_1.controller, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_79_0.xuid, arg_79_0.fullName)
					elseif arg_79_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
						Social.IBEHACGBI(arg_80_1.controller, arg_79_0.platformId)
						Social.DAFDEJICJJ(arg_80_1.controller, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_79_0.platformId, arg_79_0.fullName)
					end

					arg_80_0:dispatchEventToRoot({
						name = "request_fetch_data"
					})
				end
			},
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
				action = function()
					LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

					if arg_79_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
						Social.CGIDFEJECG(arg_80_1.controller, arg_79_0.xuid)
					elseif arg_79_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
						Social.JHHJICGHG(arg_80_1.controller, arg_79_0.platformId)
					end

					arg_80_0:dispatchEventToRoot({
						name = "request_fetch_data"
					})
				end
			},
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_REQUEST"),
				action = function()
					LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

					if arg_79_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
						Social.CGIDFEJECG(arg_80_1.controller, arg_79_0.xuid)
						Social.DACDEGEDDD(arg_80_1.controller, arg_79_0.xuid, arg_79_0.fullName)
					elseif arg_79_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
						Social.JHHJICGHG(arg_80_1.controller, arg_79_0.platformId)
						Social.BIFIFEECCJ(arg_80_1.controller, arg_79_0.platformId)
					end

					arg_80_0:dispatchEventToRoot({
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

		LUI.FlowManager.RequestPopupMenu(arg_80_0, "GenericConfirmPopup", false, arg_80_1.controller, false, var_80_0, nil, true, true)
	end
end

local function var_0_33(arg_85_0)
	return function(arg_86_0, arg_86_1)
		local var_86_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_BLOCK"),
			message = Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK_MESSAGE"),
			extraMessage = Engine.JCBDICCAH(arg_85_0.fullName)
		}

		var_86_0.itemImage = "icon_warning_large"
		var_86_0.buttons = {
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK"),
				action = function()
					if arg_85_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
						Social.EIGAJHEGI(arg_86_1.controller, arg_85_0.xuid)
					elseif arg_85_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
						Social.JGFDEBFAC(arg_85_0.platformId)
					end

					arg_86_0:dispatchEventToRoot({
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

		LUI.FlowManager.RequestPopupMenu(arg_86_0, "GenericConfirmPopup", false, arg_86_1.controller, false, var_86_0, nil, true, true)
	end
end

local function var_0_34(arg_89_0)
	return function(arg_90_0, arg_90_1)
		local var_90_0 = Friends.CAIJHBHGGC(arg_89_0.xuid)
		local var_90_1 = FRIENDS.FriendTypeToTabIDs[arg_89_0.friendsListType]

		Invitation.DIDIHAJHGA(arg_90_1.controller, var_90_0, arg_89_0.platformId)
	end
end

local function var_0_35(arg_91_0)
	return function(arg_92_0, arg_92_1)
		if CONDITIONS.IsInGameBattlesMatch() then
			Engine.DBFFAEEFGJ():dispatchEventToRoot({
				name = "gamebattles_social_leave_menu"
			})
		end

		Invitation.DHACFECHAG(arg_91_0.invitationID)
	end
end

local function var_0_36(arg_93_0)
	return function(arg_94_0, arg_94_1)
		Clans.CFJCAAHHGE(arg_94_1.controller, arg_93_0.clanId, arg_93_0.xuid)

		local var_94_0 = {
			icon = "hud_info_alert",
			displayTime = 3000,
			description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_REVOKED")
		}

		arg_94_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_94_0
		})
	end
end

local function var_0_37(arg_95_0)
	return function(arg_96_0, arg_96_1)
		local var_96_0 = {
			title = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITATION")
		}

		var_96_0.itemImage = "mm_element_logo_white"
		var_96_0.message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITATION_MESSAGE", Engine.JCBDICCAH(arg_95_0.clanName))
		var_96_0.buttons = {
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
				action = function()
					FRIENDS.TryAndAcceptClanInvite(arg_96_1.controller, arg_95_0.clanId)
				end
			},
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
				action = function()
					Clans.DJIFJAAFAI(arg_96_1.controller, arg_95_0.clanId)

					local var_98_0 = {
						icon = "hud_info_alert",
						displayTime = 3000,
						description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_DECLINED")
					}

					arg_96_0:dispatchEventToRoot({
						name = "send_toast_notification",
						immediate = true,
						options = var_98_0
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

		LUI.FlowManager.RequestPopupMenu(arg_96_0, "GenericConfirmPopup", false, arg_96_1.controller, false, var_96_0, nil, true, true)
	end
end

local function var_0_38(arg_100_0)
	return function(arg_101_0, arg_101_1)
		local var_101_0 = {
			controllerIndex = arg_101_1.controller,
			memberXUID = arg_100_0.xuid,
			gamertag = arg_100_0.gamertag,
			fullName = arg_100_0.fullName
		}

		LUI.FlowManager.RequestPopupMenu(arg_101_0, "UnbanClanMemberPopup", false, arg_101_1.controller, false, var_101_0, nil, true, true)
	end
end

function FRIENDS.IsValidEntry(arg_102_0)
	return var_0_3(arg_102_0)
end

function FRIENDS.AreWeHost(arg_103_0)
	local var_103_0 = false

	for iter_103_0 = 1, #arg_103_0 do
		if arg_103_0[iter_103_0].isMyPlayer and arg_103_0[iter_103_0].isPartyHost then
			var_103_0 = true

			break
		end
	end

	return var_103_0
end

function FRIENDS.IsClanInvitePending(arg_104_0, arg_104_1, arg_104_2)
	local var_104_0 = Clans.BJJADIBFB(arg_104_0, arg_104_1)

	for iter_104_0, iter_104_1 in ipairs(var_104_0) do
		if iter_104_1.xuid == arg_104_2 then
			return true
		end
	end

	return false
end

local function var_0_39(arg_105_0)
	local var_105_0 = #arg_105_0

	if arg_105_0[0] then
		var_105_0 = var_105_0 + 1
	end

	arg_105_0 = FRIENDS.UnifyInvitationsFormat(arg_105_0, FRIENDS.INVITATIONS.ID.CLANS2_INVITE_RECEIVED)

	return {
		onlineCount = 0,
		count = var_105_0,
		friends = arg_105_0
	}
end

function FRIENDS.OpenFriendsList(arg_106_0, arg_106_1)
	if IsOnlineMatch() and Engine.BACCCIHGDG() and Engine.BICHEEFHEC(arg_106_0) then
		if not Engine.DBAEJAHFGJ(arg_106_0) then
			local var_106_0 = {
				hasUsedShortcut = arg_106_1
			}

			LUI.FlowManager.RequestAddMenu("SocialMenu", true, arg_106_0, false, var_106_0, true)
		else
			LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_106_0, false, {}, nil, true, true)
		end
	end
end

function FRIENDS.SetupLobbyMemberContextualMenu(arg_107_0, arg_107_1, arg_107_2)
	local function var_107_0()
		assert(arg_107_2)

		local var_108_0 = arg_107_1:GetDataSource()
		local var_108_1 = var_108_0.memberIndex:GetValue(arg_107_2)

		if var_108_1 then
			local var_108_2
			local var_108_3

			if CONDITIONS.IsInGameBattlesMatch() then
				var_108_3 = var_108_0.xuid:GetValue(arg_107_2)
				var_108_2 = Friends.CAIJHBHGGC(var_108_3)

				if Engine.EBCDCFCBE(var_108_3) then
					return nil
				end
			else
				var_108_2 = Lobby.CCHEBJJJEB(var_108_1)
				var_108_3 = Friends.BEJHAIFIAB(var_108_2)
			end

			assert(var_108_2)

			if not Lobby.CHBBHFHJEH(var_108_2) then
				return {
					isContextualMenu = true,
					xuid = var_108_2,
					xuidString = var_108_3,
					memberIndex = var_108_1,
					memberTeam = var_108_0.team:GetValue(arg_107_2),
					platformId = var_108_0.platformId:GetValue(arg_107_2),
					selectedTab = Social.ECHBFGEHFI(arg_107_2, var_108_3),
					controllerIndex = arg_107_2,
					presencePlatform = var_108_0.presencePlatform,
					gamertag = var_108_0.gamertag:GetValue(arg_107_2),
					isCrossplayPlayer = var_108_0.isCrossplayPlayer:GetValue(arg_107_2),
					getButtonsCallback = function(arg_109_0)
						local var_109_0 = FRIENDS.GetFriendActions(arg_109_0)
						local var_109_1 = FRIENDS.GetLobbyMemberActions(arg_109_0)

						LUI.ConcatenateToTable(var_109_0, var_109_1)

						return var_109_0
					end
				}
			end
		end

		return nil
	end

	arg_107_1:SubscribeToDataSourceThroughElement(arg_107_1, nil, function()
		(function()
			if not arg_107_0._contextualMenuIsAdded then
				FRIENDS.SetupPlayerContextualMenuOptions(arg_107_0, arg_107_2, var_107_0)

				arg_107_1._contextualMenuIsAdded = true
			end
		end)()
	end)
end

local function var_0_40(arg_112_0, arg_112_1)
	if LUI.IsLastInputKeyboardMouse(arg_112_1.controller) then
		local var_112_0 = arg_112_1.callback(arg_112_0)

		if var_112_0 then
			if arg_112_0._tabID == FRIENDS.TabIDs.INBOX then
				FRIENDS.UpdateInboxContextualMenuOptions(arg_112_0, arg_112_1.controller, var_112_0)
			else
				FRIENDS.UpdatePlayerContextualMenuOptions(arg_112_0, arg_112_1.controller, var_112_0, arg_112_1.additionalOptions)
			end
		end
	end
end

function FRIENDS.SetupPlayerContextualMenuOptions(arg_113_0, arg_113_1, arg_113_2, arg_113_3)
	if not arg_113_0._contextualMenuHandlerAdded then
		arg_113_0:addEventHandler("mouseenter", function(arg_114_0, arg_114_1)
			var_0_40(arg_114_0, {
				controller = arg_113_1,
				callback = arg_113_2,
				additionalOptions = arg_113_3 or {}
			})
		end)

		arg_113_0._contextualMenuHandlerAdded = true
	end

	local var_113_0 = arg_113_0:GetCurrentMenu()

	FRIENDS.RegisterPlatformIdForViewProfileEventOnMenu(var_113_0, arg_113_1)
end

local function var_0_41(arg_115_0)
	return function()
		local var_116_0 = arg_115_0.disabledFunc()

		if var_116_0 and type(var_116_0) == "table" then
			return not var_116_0.disabled
		else
			return not var_116_0
		end
	end
end

local function var_0_42(arg_117_0, arg_117_1, arg_117_2, arg_117_3)
	for iter_117_0, iter_117_1 in pairs(arg_117_0) do
		if iter_117_1.id == arg_117_1 then
			local var_117_0 = iter_117_1.action
			local var_117_1 = CONDITIONS.AlwaysTrue

			if iter_117_1.disabledFunc then
				var_117_1 = var_0_41(iter_117_1)
			end

			local var_117_2 = iter_117_1.id
			local var_117_3 = iter_117_1.label
			local var_117_4 = {
				actionName = var_117_3,
				actionFunction = var_117_0,
				actionParams = arg_117_2,
				conditionFunction = var_117_1,
				id = var_117_2,
				conditionParams = arg_117_2
			}

			arg_117_3:AddContextualMenuAction(var_117_4)

			break
		end
	end
end

function FRIENDS.UpdateInboxContextualMenuOptions(arg_118_0, arg_118_1, arg_118_2)
	arg_118_0:SetupContextualMenu()

	local var_118_0 = arg_118_2.getButtonsCallback and arg_118_2.getButtonsCallback(arg_118_2)

	for iter_118_0, iter_118_1 in ipairs(var_0_1) do
		if iter_118_1 ~= "separator" then
			var_0_42(var_118_0, iter_118_1, arg_118_2, arg_118_0)
		else
			arg_118_0:AddContextualMenuAction({
				isSeparator = true
			})
		end
	end
end

function FRIENDS.UpdatePlayerContextualMenuOptions(arg_119_0, arg_119_1, arg_119_2, arg_119_3)
	if arg_119_2.gamertag and arg_119_2.gamertag ~= "" then
		local var_119_0 = arg_119_2.gamertag
		local var_119_1

		if Engine.CGABICJHAI() and arg_119_2.selectedTab == FRIENDS.TabIDs.ONLINE_FRIENDS and arg_119_2.showBattlenetData then
			local var_119_2 = Social.CFEIHAADEI(arg_119_2.platformId)

			if var_119_2 and var_119_2.battleTag and var_119_2.battleTag ~= "" then
				local var_119_3 = Engine.BECCFCBIAA("displayRealID") == 1 and var_119_2.fullName and var_119_2.fullName ~= "" and var_119_2.fullName or nil

				var_119_1 = {
					title = var_119_2.battleTag,
					subtitle = var_119_3
				}
			else
				var_119_1 = {
					title = arg_119_2.gamertag
				}
			end

			var_119_0 = arg_119_2.crossplayGamertag ~= "" and arg_119_2.crossplayGamertag or nil
		end

		arg_119_0:SetupContextualMenu({
			title = var_119_0,
			battlenetData = var_119_1
		})
	else
		arg_119_0:SetupContextualMenu()
	end

	local var_119_4 = arg_119_2.getButtonsCallback and arg_119_2.getButtonsCallback(arg_119_2)

	for iter_119_0, iter_119_1 in ipairs(var_0_0) do
		if iter_119_1 ~= "separator" then
			for iter_119_2, iter_119_3 in pairs(var_119_4) do
				if iter_119_3.id == iter_119_1 then
					local var_119_5 = iter_119_3.action
					local var_119_6 = CONDITIONS.AlwaysTrue

					if iter_119_3.disabledFunc then
						function var_119_6()
							local var_120_0 = iter_119_3.disabledFunc()

							if var_120_0 and type(var_120_0) == "table" then
								return not var_120_0.disabled
							else
								return not var_120_0
							end
						end
					end

					local var_119_7 = iter_119_3.id
					local var_119_8 = iter_119_3.label
					local var_119_9 = {
						actionName = var_119_8,
						actionFunction = var_119_5,
						actionParams = arg_119_2,
						conditionFunction = var_119_6,
						id = var_119_7,
						conditionParams = arg_119_2
					}

					arg_119_0:AddContextualMenuAction(var_119_9)

					break
				end
			end
		else
			arg_119_0:AddContextualMenuAction({
				isSeparator = true
			})
		end
	end

	if arg_119_3._hasClanActions then
		arg_119_0:AddContextualMenuAction({
			isSeparator = true
		})

		for iter_119_4, iter_119_5 in ipairs(var_0_2) do
			if iter_119_5 ~= "separator" then
				var_0_42(var_119_4, iter_119_5, arg_119_2, arg_119_0)
			else
				arg_119_0:AddContextualMenuAction({
					isSeparator = true
				})
			end
		end
	end
end

function FRIENDS.GetScoreboardActions(arg_121_0)
	local var_121_0 = arg_121_0.clientNum

	assert(var_121_0)

	local var_121_1 = arg_121_0.xuid

	assert(var_121_1)

	local var_121_2 = arg_121_0.xuidString

	assert(var_121_2)

	local var_121_3 = arg_121_0.isBot and true or false
	local var_121_4 = arg_121_0.controllerIndex

	assert(var_121_4)

	local var_121_5 = arg_121_0.isAAR
	local var_121_6 = {}

	table.insert(var_121_6, var_0_16(arg_121_0))
	table.insert(var_121_6, var_0_21(arg_121_0))
	table.insert(var_121_6, var_0_22(arg_121_0))

	local var_121_7 = {
		label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
		disabledFunc = function()
			return not Engine.HDGDBCJFG() and not Engine.EAABDHIDFJ() or not not CONDITIONS.IsSystemLink(self) or not not arg_121_0.isCrossplayPlayer or var_121_3
		end
	}

	function var_121_7.action()
		if not var_121_7.disabledFunc() then
			if not var_121_5 and (not Game.BFEEGCHICA(var_121_4, "ui_scoreboard_freeze") or arg_121_0.isCP) then
				Engine.BJBCAJFECC(var_121_4, var_121_0)
			elseif var_121_5 and var_121_1 then
				Lobby.GICFBJBBJ(var_121_4, var_121_2)
			end
		end
	end

	var_121_7.id = "viewProfile"

	table.insert(var_121_6, var_121_7)
	table.insert(var_121_6, var_0_23(arg_121_0))
	table.insert(var_121_6, var_0_25(arg_121_0))
	table.insert(var_121_6, var_0_26(arg_121_0))
	table.insert(var_121_6, var_0_30(arg_121_0))

	return var_121_6
end

function FRIENDS.AddFriendActions(arg_124_0, arg_124_1, arg_124_2)
	local var_124_0 = arg_124_0.controllerIndex
	local var_124_1
	local var_124_2 = {}

	for iter_124_0, iter_124_1 in ipairs(arg_124_1) do
		local var_124_3 = {}

		if iter_124_1.id == "header" then
			var_124_3 = MenuBuilder.BuildRegisteredType("SocialFlyoutHeader", {
				controllerIndex = var_124_0
			})

			var_124_3.Title:setText(iter_124_1.label)
		else
			assert(iter_124_1.label)
			assert(iter_124_1.action)

			var_124_3 = MenuBuilder.BuildRegisteredType("MenuButton", {
				controllerIndex = var_124_0
			})

			var_124_3.Text:setText(iter_124_1.label)

			local var_124_4 = iter_124_1.disabledFunc and iter_124_1.disabledFunc() or false

			var_124_3.disabledFunc = iter_124_1.disabledFunc

			var_124_3:SetButtonDisabled(var_124_4)

			var_124_3.previousDisabledStatus = var_124_4

			var_124_3:addEventHandler("button_action", function(arg_125_0, arg_125_1)
				if iter_124_1.refreshOnAction then
					var_124_1(false)
				end

				iter_124_1.action()
			end)
		end

		arg_124_2:addElement(var_124_3)
		table.insert(var_124_2, var_124_3)
	end

	local var_124_5 = LUI.UIImage.new()

	var_124_5.id = "Spacer"

	var_124_5:SetAlpha(0)
	var_124_5:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 10)
	arg_124_2:addElement(var_124_5)

	arg_124_2.Spacer = var_124_5

	local var_124_6 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_124_0
	})

	var_124_6.id = "ButtonDescriptionText"

	var_124_6.Description:SetRight(_1080p * 500)
	var_124_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 32)
	arg_124_2:addElement(var_124_6)

	arg_124_2.ButtonDescriptionText = var_124_6

	function var_124_1(arg_126_0)
		local var_126_0 = ""
		local var_126_1
		local var_126_2 = true

		for iter_126_0 = 1, #var_124_2 do
			local var_126_3 = var_124_2[iter_126_0]

			var_126_1 = var_126_1 or var_126_3:GetCurrentMenu()

			if var_126_3.disabledFunc then
				local var_126_4 = var_126_3.disabledFunc()
				local var_126_5 = false

				if type(var_126_4) == "table" then
					var_126_5 = var_126_4.disabled

					local var_126_6 = var_126_4.errorString

					if var_126_3:isInFocus() and #var_126_6 > 0 and var_126_5 then
						var_126_0 = Engine.CBBHFCGDIC(var_126_6)

						if Engine.BHICADFIHA() then
							local var_126_7 = var_126_4.devErrorString

							if #var_126_7 > 0 then
								var_126_0 = var_126_0 .. " Dev : " .. var_126_7
							end
						end
					end
				else
					var_126_5 = var_126_4
				end

				if var_126_3.previousDisabledStatus ~= var_126_5 then
					var_126_3:SetButtonDisabled(var_126_5)
				end

				var_126_3.previousDisabledStatus = var_126_5
			end
		end

		if var_126_1 then
			if var_126_1.descriptionText and var_126_1.descriptionText == var_126_0 then
				var_126_2 = false
			end

			if var_126_2 then
				var_126_1.descriptionText = var_126_0

				var_126_1:dispatchEventToCurrentMenu({
					name = "update_button_description",
					text = var_126_0
				})
			end
		end

		if arg_126_0 then
			arg_124_2:Wait(1000).onComplete = function()
				return var_124_1(arg_126_0)
			end
		end
	end

	var_124_1(true)
end

function FRIENDS.AddInboxActions(arg_128_0, arg_128_1, arg_128_2)
	local var_128_0 = arg_128_0.controllerIndex
	local var_128_1 = {}

	for iter_128_0, iter_128_1 in ipairs(arg_128_1) do
		assert(iter_128_1.label)
		assert(iter_128_1.action)

		local var_128_2 = MenuBuilder.BuildRegisteredType("MenuButton", {
			controllerIndex = var_128_0
		})

		ACTIONS.AnimateSequence(var_128_2, "CenterText")
		var_128_2.Text:setText(iter_128_1.label)

		local var_128_3 = iter_128_1.disabledFunc and iter_128_1.disabledFunc() or false

		var_128_2.disabledFunc = iter_128_1.disabledFunc

		var_128_2:SetButtonDisabled(var_128_3)

		var_128_2.previousDisabledStatus = var_128_3

		var_128_2:addEventHandler("button_action", function(arg_129_0, arg_129_1)
			if iter_128_1.action() then
				LUI.FlowManager.RequestLeaveMenuByName("FlyInPopup", true, true)
			end
		end)
		arg_128_2:addElement(var_128_2)
		table.insert(var_128_1, var_128_2)
	end
end

function FRIENDS.IsClanMemberEquivalent(arg_130_0, arg_130_1, arg_130_2)
	if arg_130_0 == FRIENDS.TabIDs.CLANS then
		if (arg_130_2.isCrossPlayFriend or arg_130_2.isPlatformFriend) and arg_130_2.isOnline then
			return arg_130_1 == FRIENDS.TabIDs.ONLINE_FRIENDS
		elseif arg_130_2.isCrossPlayFriend then
			return arg_130_1 == FRIENDS.TabIDs.CROSSPLAY_FRIENDS
		elseif arg_130_2.isPlatformFriend then
			return arg_130_1 == FRIENDS.TabIDs.FRIENDS
		else
			return arg_130_1 == FRIENDS.TabIDs.RECENT_PLAYERS
		end
	end

	return false
end

function FRIENDS.GetFriendActions(arg_131_0)
	local var_131_0 = {}
	local var_131_1 = arg_131_0.controllerIndex

	assert(var_131_1)

	local var_131_2 = arg_131_0.selectedTab

	assert(var_131_2)

	if var_131_2 == FRIENDS.TabIDs.INBOX then
		table.insert(var_131_0, var_0_9(arg_131_0))
		table.insert(var_131_0, var_0_10(arg_131_0))
	else
		local var_131_3 = arg_131_0.xuidString or arg_131_0.xuid
		local var_131_4 = Friends.CAIJHBHGGC(var_131_3)

		arg_131_0.gameTitle = Engine.BBHGAFFFGE(var_131_1, var_131_4)

		local var_131_5 = arg_131_0.platformId
		local var_131_6 = Engine.CBBFHGEDGJ()
		local var_131_7 = arg_131_0.presencePlatform

		if type(var_131_7) == "userdata" or type(var_131_7) == "table" then
			var_131_7 = var_131_7:GetValue(var_131_1)
		end

		local var_131_8 = {
			isCrossPlayFriend = Friends.BIAJAECICH(var_131_1, var_131_3),
			isPlatformFriend = Friends.DIIAFCGBDA(var_131_1, var_131_3, var_131_5 or "0"),
			isOnline = arg_131_0.isOnline or false
		}
		local var_131_9 = var_131_2 == FRIENDS.TabIDs.RECENT_PLAYERS or var_131_2 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS

		if var_131_9 or FRIENDS.IsClanMemberEquivalent(var_131_2, FRIENDS.TabIDs.RECENT_PLAYERS, var_131_8) then
			if not Engine.BEFACAIFDD() then
				local var_131_10 = {
					label = Engine.CBBHFCGDIC("MENU/JOIN_GAME"),
					disabledFunc = function()
						return not var_0_3(arg_131_0) or Invitation.ECGAJEGAIC(var_131_1, var_131_4, var_131_5, var_131_2)
					end
				}
				local var_131_11 = (Engine.BAHIIBFDDG() or Engine.BEFACAIFDD()) and Friends.CIBEABFIJI(var_131_1, var_131_4)

				function var_131_10.action()
					local var_133_0 = var_131_10.disabledFunc()

					if var_133_0 and not var_133_0.disabled then
						var_131_11 = (Engine.BAHIIBFDDG() or Engine.BEFACAIFDD()) and Friends.CIBEABFIJI(var_131_1, var_131_4)

						if var_131_11 then
							local var_133_1 = {
								xuid = var_131_4,
								controllerIndex = var_131_1
							}

							LUI.FlowManager.RequestPopupMenu(nil, "ConfirmJoinBlockedUser", true, var_131_1, false, var_133_1)
						else
							local function var_133_2()
								local var_134_0 = var_131_10.disabledFunc()

								if var_134_0 and not var_134_0.disabled then
									if CONDITIONS.IsInGameBattlesMatch() then
										Engine.DBFFAEEFGJ():dispatchEventToRoot({
											immediate = true,
											name = "gamebattles_social_leave_menu"
										})
									end

									Friends.DACCIAAAAB(var_131_1, var_131_4, var_131_5)

									local var_134_1, var_134_2 = Engine.CBBGBGBFJF(var_131_1)

									if not var_134_1 and var_134_2 == FenceOnlineServices.ERROR_CODES.PSPlusRequired then
										Engine.DBHBIHJDEC(var_131_1)
									end
								end
							end

							FRIENDS.TryJoinUserParty(var_133_2)
						end
					end
				end

				if not var_131_11 then
					var_131_10.refreshOnAction = true
				end

				var_131_10.id = "joinGame"

				table.insert(var_131_0, var_131_10)
			end
		else
			local var_131_12 = var_0_11(arg_131_0)

			table.insert(var_131_0, var_131_12)
		end

		if CONDITIONS.ArePartiesEnabledInMainMenu() or Engine.EAAHGICFBD() then
			table.insert(var_131_0, var_0_12(arg_131_0))
		end

		if var_131_2 == FRIENDS.TabIDs.PRIVATE_PARTY then
			table.insert(var_131_0, var_0_22(arg_131_0))
		end

		table.insert(var_131_0, var_0_21(arg_131_0))

		local var_131_13 = Friends.DJGEFEAJCI(PresencePlatformToClientPlatform[var_131_7], PresencePlatformToClientPlatform[var_131_6])
		local var_131_14 = var_131_7 == var_131_6 or var_131_13 or var_131_8.isPlatformFriend
		local var_131_15 = Engine.CHDGBEFDHB() and var_131_14
		local var_131_16 = Engine.EAABDHIDFJ() and var_131_14
		local var_131_17 = (Engine.HDGDBCJFG() or Engine.BEFACAIFDD() or Engine.CHDGBEFDHB() or Engine.EAABDHIDFJ()) and var_131_14

		if var_131_2 == FRIENDS.TabIDs.ONLINE_FRIENDS or FRIENDS.IsClanMemberEquivalent(var_131_2, FRIENDS.TabIDs.ONLINE_FRIENDS, var_131_8) then
			if var_131_17 then
				local var_131_18 = {}

				if var_131_15 then
					var_131_18.label = Engine.CBBHFCGDIC("LUA_MENU/VIEW_LAZE_PROFILE")
				else
					var_131_18.label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")
				end

				function var_131_18.disabledFunc()
					return not var_0_3(arg_131_0) or not Friends.GGDCJJGBI(var_131_1)
				end

				function var_131_18.action()
					if not var_131_18.disabledFunc() then
						Friends.CFBFGBECEB(var_131_1, var_131_5)
					end
				end

				var_131_18.id = "viewProfile"

				table.insert(var_131_0, var_131_18)
			end
		elseif var_131_9 or FRIENDS.IsClanMemberEquivalent(var_131_2, FRIENDS.TabIDs.RECENT_PLAYERS, var_131_8) then
			assert(var_131_4)

			if var_131_17 then
				local var_131_19 = {}

				if var_131_15 then
					var_131_19.label = Engine.CBBHFCGDIC("LUA_MENU/VIEW_LAZE_PROFILE")
				else
					var_131_19.label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")
				end

				if Engine.EAABDHIDFJ() or Engine.FJCIBEDII() then
					function var_131_19.disabledFunc()
						return not var_0_3(arg_131_0) or not Social.CDFEICCEFJ(var_131_1, var_131_3) or not var_131_14
					end
				else
					function var_131_19.disabledFunc()
						return not var_0_3(arg_131_0) or not Social.CDFEICCEFJ(var_131_1, var_131_3) or var_131_6 ~= var_131_7
					end
				end

				function var_131_19.action()
					if not var_131_19.disabledFunc() then
						Friends.CCDGAGCFGE(var_131_1, var_131_4)
					end
				end

				var_131_19.id = "viewProfile"

				table.insert(var_131_0, var_131_19)
			end
		elseif var_131_2 == FRIENDS.TabIDs.CROSSPLAY_FRIENDS or var_131_2 == FRIENDS.TabIDs.REGIMENTS or var_131_2 == FRIENDS.TabIDs.PRIVATE_PARTY or FRIENDS.IsClanMemberEquivalent(var_131_2, FRIENDS.TabIDs.CROSSPLAY_FRIENDS, var_131_8) then
			assert(var_131_4)

			if var_131_17 and not Engine.BEFACAIFDD() and (var_131_8.isPlatformFriend or var_131_13 and (Engine.EAABDHIDFJ() or Engine.FJCIBEDII())) then
				local var_131_20 = {}

				if var_131_15 then
					var_131_20.label = Engine.CBBHFCGDIC("LUA_MENU/VIEW_LAZE_PROFILE")
				else
					var_131_20.label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")
				end

				function var_131_20.disabledFunc()
					return var_131_2 == FRIENDS.TabIDs.CROSSPLAY_FRIENDS and not var_0_3(arg_131_0) or not Friends.GGDCJJGBI(var_131_1)
				end

				function var_131_20.action()
					if not var_131_20.disabledFunc() then
						if arg_131_0.platformId and arg_131_0.platformId ~= "0" then
							Friends.CFBFGBECEB(var_131_1, var_131_5)
						elseif not Social.BFEBABDDDE(var_131_1, var_131_3, "PlatformIdForViewProfile") then
							local var_141_0 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE")

							LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, var_131_1, false, {
								message = var_141_0
							})
						end
					end
				end

				var_131_20.id = "viewProfile"

				table.insert(var_131_0, var_131_20)
			end
		elseif var_131_2 == FRIENDS.TabIDs.FAVORITE_FRIENDS then
			assert(var_131_4)

			if var_131_17 then
				local var_131_21 = {}

				if var_131_15 then
					var_131_21.label = Engine.CBBHFCGDIC("LUA_MENU/VIEW_LAZE_PROFILE")
				else
					var_131_21.label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")
				end

				function var_131_21.disabledFunc()
					return not var_0_3(arg_131_0) or var_131_6 ~= var_131_7 or Friends.FDBGHIFEE(var_131_1, var_131_4)
				end

				function var_131_21.action()
					if not var_131_21.disabledFunc() then
						if arg_131_0.platformId and arg_131_0.platformId ~= "0" then
							Friends.CFBFGBECEB(var_131_1, var_131_5)
						elseif not Social.BFEBABDDDE(var_131_1, var_131_3, "PlatformIdForViewProfile") then
							local var_143_0 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE")

							LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, var_131_1, false, {
								message = var_143_0
							})
						end
					end
				end

				var_131_21.id = "viewProfile"

				table.insert(var_131_0, var_131_21)
			end
		end

		if (var_131_2 == FRIENDS.TabIDs.ONLINE_FRIENDS or var_131_2 == FRIENDS.TabIDs.CROSSPLAY_FRIENDS) and Friends.IJHFCGEBD() and Dvar.IBEGCHEFE("RRTRNQOLS") then
			local var_131_22 = {
				label = Engine.CBBHFCGDIC("MENU/ADD_TO_FAVORITES"),
				disabledFunc = function()
					return not var_0_3(arg_131_0) or Friends.ECIAEDEBCF(var_131_1, var_131_4)
				end
			}

			function var_131_22.action()
				local var_145_0 = var_131_22.disabledFunc()

				if var_145_0 and not var_145_0.disabled then
					Friends.DGICIJGBGB(var_131_1, var_131_4)
				end
			end

			var_131_22.refreshOnAction = true
			var_131_22.id = "addToFavorites"

			table.insert(var_131_0, var_131_22)
		end

		if var_131_2 == FRIENDS.TabIDs.FAVORITE_FRIENDS then
			local var_131_23 = {
				label = Engine.CBBHFCGDIC("MENU/REMOVE_FROM_FAVORITES"),
				disabledFunc = function()
					return not var_0_3(arg_131_0) or Friends.GFHEFICGF(var_131_1, var_131_4)
				end
			}

			function var_131_23.action()
				local var_147_0 = var_131_23.disabledFunc()

				if var_147_0 and not var_147_0.disabled then
					Friends.DIIFJGIIBA(var_131_1, var_131_4)
				end
			end

			var_131_23.refreshOnAction = true
			var_131_23.id = "removeFromFavorites"

			table.insert(var_131_0, var_131_23)
		end

		local var_131_24 = Social.CFEIHAADEI(arg_131_0.platformId)
		local var_131_25 = var_131_24 and var_131_24.fullName and var_131_24.fullName == ""

		if Engine.DBFCJBDJEC() and var_131_2 == FRIENDS.TabIDs.ONLINE_FRIENDS and arg_131_0.platformId and var_131_25 then
			table.insert(var_131_0, var_0_24(arg_131_0))
		end

		local var_131_26 = not Engine.CHDGBEFDHB() and not Engine.EAABDHIDFJ()

		if Engine.CHDGBEFDHB() or Engine.EAABDHIDFJ() then
			local var_131_27 = var_131_15 and var_131_25
			local var_131_28 = var_131_16 and var_131_25

			if Friends.BIAJAECICH(var_131_1, var_131_3) then
				var_131_26 = true
			elseif not var_131_27 and not var_131_28 then
				table.insert(var_131_0, var_0_24(arg_131_0))
			end
		end

		if not Friends.BIAJAECICH(var_131_1, var_131_3) then
			table.insert(var_131_0, var_0_23(arg_131_0))
		end

		if var_131_2 ~= FRIENDS.TabIDs.FAVORITE_FRIENDS and var_131_26 then
			table.insert(var_131_0, var_0_25(arg_131_0))
			table.insert(var_131_0, var_0_26(arg_131_0))
			table.insert(var_131_0, var_0_30(arg_131_0))
		end

		if var_131_2 == FRIENDS.TabIDs.PRIVATE_PARTY then
			table.insert(var_131_0, var_0_16(arg_131_0))
		end

		local var_131_29 = Clans.CFGBBBHFHB(var_131_1)

		if var_131_29 and var_131_29 ~= -1 then
			local var_131_30 = #var_131_0
			local var_131_31 = Engine.EAGGAEGHHA(var_131_1)
			local var_131_32 = false
			local var_131_33 = FRIENDS.GetGroupMembers(var_131_1, var_131_29, FRIENDS.RegimentMembersFilter.OFFICERS_ONLY)

			for iter_131_0 = 1, #var_131_33 do
				if var_131_31 == var_131_33[iter_131_0].xuid then
					var_131_32 = true

					break
				end
			end

			if var_131_32 then
				if var_131_2 ~= FRIENDS.TabIDs.REGIMENTS and not Clans.CHEADIHHBJ(var_131_1, var_131_29, var_131_3).memberFound then
					local var_131_34 = Clans.GFFJCJFIJ(var_131_1, var_131_29)

					arg_131_0.clanID = var_131_29
					arg_131_0.clanName = var_131_34.name

					table.insert(var_131_0, var_0_13(arg_131_0))
				end

				if var_0_14(var_131_1, var_131_29, var_131_3) then
					local var_131_35 = Clans.GFFJCJFIJ(var_131_1, var_131_29)

					arg_131_0.clanID = var_131_29
					arg_131_0.clanName = var_131_35.name

					table.insert(var_131_0, var_0_15(arg_131_0))
				end

				if #var_131_0 ~= var_131_30 then
					table.insert(var_131_0, var_131_30 + 1, var_0_8("LUA_MENU/GROUPS"))
				end
			end
		end
	end

	return var_131_0
end

function FRIENDS.GetWZPrivateMatchLobbyMemberActions(arg_148_0)
	local var_148_0 = arg_148_0.xuid
	local var_148_1 = arg_148_0.controllerIndex

	assert(var_148_0)
	assert(var_148_1)

	local var_148_2 = {}

	if Engine.HDGDBCJFG() or Engine.BEFACAIFDD() then
		local var_148_3 = {
			label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
			action = function()
				if CONDITIONS.IsInGameBattlesMatch() then
					local var_149_0 = arg_148_0.platformId

					if var_149_0 then
						Lobby.BEDFEBGCHG(var_148_1, var_149_0)
					end
				else
					Lobby.BJBCAJFECC(var_148_1, var_148_0)
				end
			end,
			disabledFunc = function()
				if arg_148_0.isCrossplayPlayer ~= nil then
					return arg_148_0.isCrossplayPlayer
				end
			end
		}

		var_148_3.id = "viewProfile"

		table.insert(var_148_2, var_148_3)
	end

	table.insert(var_148_2, var_0_22(arg_148_0))
	table.insert(var_148_2, var_0_26(arg_148_0))

	if Lobby.DFFFFJHCEH() then
		table.insert(var_148_2, var_0_16(arg_148_0))
	end

	return var_148_2
end

FRIENDS.SQUAD_BUTTONS = {
	NO_SQUAD = 3,
	SELECT_SQUAD = 1,
	RANDOM_SQUAD = 2
}

function FRIENDS.GetWZPrivateMatchLobbySquadActions(arg_151_0)
	local var_151_0 = arg_151_0.controllerIndex

	assert(var_151_0)

	return {
		[FRIENDS.SQUAD_BUTTONS.SELECT_SQUAD] = var_0_27(arg_151_0),
		[FRIENDS.SQUAD_BUTTONS.RANDOM_SQUAD] = var_0_28(arg_151_0),
		[FRIENDS.SQUAD_BUTTONS.NO_SQUAD] = var_0_29(arg_151_0)
	}
end

function FRIENDS.GetLobbyMemberActions(arg_152_0)
	local var_152_0 = arg_152_0.xuid
	local var_152_1 = arg_152_0.controllerIndex

	assert(var_152_0)
	assert(var_152_1)

	local var_152_2 = {}

	if Engine.HDGDBCJFG() or Engine.BEFACAIFDD() or Engine.EAABDHIDFJ() then
		local var_152_3 = {
			label = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
			action = function()
				if CONDITIONS.IsInGameBattlesMatch() then
					local var_153_0 = arg_152_0.platformId

					if var_153_0 then
						Lobby.BEDFEBGCHG(var_152_1, var_153_0)
					end
				else
					Lobby.BJBCAJFECC(var_152_1, var_152_0)
				end
			end,
			disabledFunc = function()
				if arg_152_0.isCrossplayPlayer ~= nil then
					return arg_152_0.isCrossplayPlayer
				end
			end
		}

		var_152_3.id = "viewProfile"

		table.insert(var_152_2, var_152_3)
	end

	table.insert(var_152_2, var_0_22(arg_152_0))
	table.insert(var_152_2, var_0_26(arg_152_0))

	if MLG.DBIBHEAEGD() then
		local var_152_4 = Lobby.BGIADHIHAG()

		if arg_152_0.memberIndex and Dvar.IBEGCHEFE("LQNKRLQTLM") and not var_152_4 then
			table.insert(var_152_2, var_0_17(arg_152_0))
		end

		if var_152_4 then
			table.insert(var_152_2, var_0_18(arg_152_0))
			table.insert(var_152_2, var_0_19(arg_152_0))
			table.insert(var_152_2, var_0_20(arg_152_0, "assignAllies", Teams.allies))
			table.insert(var_152_2, var_0_20(arg_152_0, "assignAxis", Teams.axis))
		end
	end

	return var_152_2
end

function FRIENDS.TryJoinUserParty(arg_155_0)
	if not Engine.CGABICJHAI() or not ShaderUpload.DDBFFCFJJJ() or not ShaderUpload.CEIBACCEAF() or Engine.DIEEIEFCFF() and Dvar.IBEGCHEFE("MRTNMPRLKR") then
		arg_155_0()
	else
		LUI.FlowManager.RequestPopupMenu(nil, "CancelShaderUploadDialog", false, nil, false, {
			onCancelUpload = arg_155_0
		}, nil, true, true)
	end
end

function FRIENDS.ValidatePlayerRequestData(arg_156_0)
	assert(arg_156_0.getFriendFrom)
	assert(arg_156_0.getFriendTo)
	assert(arg_156_0.getFriendFrom >= 0)

	if arg_156_0.friendsCount > 0 then
		assert(arg_156_0.getFriendTo < arg_156_0.friendsCount)
	end

	assert(arg_156_0.getFriendFrom <= arg_156_0.getFriendTo)
end

function FRIENDS.InitPlayerRequestData(arg_157_0, arg_157_1)
	arg_157_0.cachedFriends = arg_157_1
	arg_157_0.getFriendFrom = 0
	arg_157_0.getFriendTo = arg_157_1
	arg_157_0.friendsCount = 0
end

function FRIENDS.UpdatePlayerRequestData(arg_158_0, arg_158_1, arg_158_2, arg_158_3)
	local var_158_0 = arg_158_0.friendsCount

	arg_158_0.friendsCount = arg_158_0._friendsData.count

	if arg_158_0.getFriendTo >= arg_158_0.friendsCount then
		if arg_158_0.friendsCount == 0 then
			arg_158_0.getFriendTo = 0
		else
			arg_158_0.getFriendTo = arg_158_0.friendsCount - 1
		end
	end

	if arg_158_0.friendsCount > 0 then
		arg_158_0.getFriendFrom = LUI.clamp(arg_158_0.getFriendFrom, 0, arg_158_0.friendsCount - 1)

		if var_158_0 < arg_158_0.friendsCount then
			local var_158_1 = math.floor(arg_158_0.cachedFriends / 2)
			local var_158_2 = arg_158_0.friendsCount - var_158_0

			var_158_2 = var_158_1 < var_158_2 and var_158_1 or var_158_2
			arg_158_0.getFriendTo = arg_158_0.getFriendTo + var_158_2
		end

		arg_158_0.getFriendTo = LUI.clamp(arg_158_0.getFriendTo, arg_158_0.getFriendFrom, arg_158_0.friendsCount - 1)
	else
		arg_158_0.getFriendFrom = 0
		arg_158_0.getFriendTo = math.floor(arg_158_0.cachedFriends / 2)
	end

	if var_158_0 ~= arg_158_0.friendsCount then
		arg_158_0:SetNumChildren(arg_158_0.friendsCount)
	end

	local var_158_3 = arg_158_0:getParent()

	if var_158_3 then
		if var_158_3.UpdateNoFriends then
			var_158_3:UpdateNoFriends(arg_158_0.friendsCount, arg_158_0._friendsData.totalCount, arg_158_2)
		end

		if var_158_3._tabID == FRIENDS.TabIDs.FRIENDS then
			local var_158_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_ONLINE_MEMBERS", arg_158_0._friendsData.onlineCount, arg_158_0._friendsData.totalCount)

			FRIENDS.SetPlayerGridHeader(var_158_3, var_158_4, nil, true)
		end
	end
end

function FRIENDS.RefreshData(arg_159_0, arg_159_1, arg_159_2)
	FRIENDS.ValidatePlayerRequestData(arg_159_1)

	if arg_159_0 == FRIENDS.TabIDs.RECENT_PLAYERS then
		arg_159_1._friendsData = Friends.DAHGHDHFIA(arg_159_2, FRIENDS.TabIDs.RECENT_PLAYERS, arg_159_1.getFriendFrom, arg_159_1.getFriendTo, arg_159_1.friendsCount)

		FRIENDS.UpdatePlayerRequestData(arg_159_1, false, FRIENDS.TabIDs.RECENT_PLAYERS, arg_159_2)
	elseif arg_159_0 == FRIENDS.TabIDs.FRIENDS then
		local var_159_0 = Friends.FBFFEFEGB(arg_159_2, arg_159_1.getFriendFrom, arg_159_1.getFriendTo, arg_159_1.friendsCount, true, arg_159_1.showOfflineFriends)

		if var_159_0 then
			arg_159_1._friendsData = var_159_0

			FRIENDS.UpdatePlayerRequestData(arg_159_1, false, FRIENDS.TabIDs.FRIENDS, arg_159_2)
		end
	elseif arg_159_0 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS then
		arg_159_1._friendsData = Friends.DAHGHDHFIA(arg_159_2, FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS, arg_159_1.getFriendFrom, arg_159_1.getFriendTo, arg_159_1.friendsCount)

		FRIENDS.UpdatePlayerRequestData(arg_159_1, false, FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS, arg_159_2)
	elseif arg_159_0 == FRIENDS.TabIDs.INBOX then
		local var_159_1 = Clans2.EBDFICHCEJ(arg_159_2)

		arg_159_1._friendsData = var_0_39(var_159_1)

		FRIENDS.UpdatePlayerRequestData(arg_159_1, false, FRIENDS.TabIDs.INBOX, arg_159_2)
	end

	arg_159_1:RefreshContent()
end

function FRIENDS.GetGroupMembers(arg_160_0, arg_160_1, arg_160_2)
	local var_160_0

	if arg_160_2 then
		var_160_0 = Clans.GIDGAGEAC(arg_160_0, arg_160_1, arg_160_2)
	else
		var_160_0 = Clans.GIDGAGEAC(arg_160_0, arg_160_1)
	end

	local var_160_1 = {}

	for iter_160_0, iter_160_1 in ipairs(var_160_0) do
		local var_160_2 = Friends.HCAFBJBHC(arg_160_0, iter_160_1.xuid)

		if var_160_2.valid == true then
			local var_160_3 = FRIENDS.UnifyPlayerDataFormat(var_160_2)

			for iter_160_2, iter_160_3 in pairs(iter_160_1) do
				if iter_160_1[iter_160_2] ~= nil and not var_160_3[iter_160_2] then
					var_160_3[iter_160_2] = iter_160_3
				end
			end

			table.insert(var_160_1, var_160_3)
		end
	end

	return var_160_1
end

function FRIENDS.RegisterPlatformIdForViewProfileEventOnMenu(arg_161_0, arg_161_1)
	if arg_161_0 and not arg_161_0.platformIdViewProfileEventIsRegistered then
		arg_161_0:registerEventHandler("PlatformIdForViewProfile", function(arg_162_0, arg_162_1)
			if LUI.FlowManager.IsMenuOnTop("PopupOK") then
				LUI.FlowManager.RequestLeaveMenuByName("PopupOK", true, true)
			end

			if arg_162_1.results and arg_162_1.results.success and arg_162_1.results.platformID ~= "0" then
				Friends.CFBFGBECEB(arg_161_1, arg_162_1.results.platformID)
			else
				local var_162_0 = Engine.CBBHFCGDIC("LUA_MENU/FETCHING_PLAYER_PROFILE_FAILED")

				LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_161_1, false, {
					message = var_162_0
				})
			end
		end)

		arg_161_0.platformIdViewProfileEventIsRegistered = true
	end
end

function FRIENDS.RegimentRoleChangedToast(arg_163_0, arg_163_1, arg_163_2)
	arg_163_2 = arg_163_2 or ""

	local var_163_0 = {
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
			description = Engine.CBBHFCGDIC("REGIMENTS/KICKED_DESC", Engine.JCBDICCAH(arg_163_2))
		}
	}

	arg_163_0:processEvent({
		name = "send_toast_notification",
		immediate = true,
		options = var_163_0[arg_163_1]
	})
end

function FRIENDS.TryAndAcceptClanInvite(arg_164_0, arg_164_1)
	if #(Clans.CEACCICGB(arg_164_0) or {}) >= FRIENDS.CLANS_MAX_JOINED_CLANS then
		local var_164_0 = {
			icon = "hud_info_alert",
			displayTime = 3000,
			description = Engine.CBBHFCGDIC("REGIMENTS/GROUPS_LIMIT_REACHED", Engine.JCBDICCAH(FRIENDS.CLANS_MAX_JOINED_CLANS), Engine.JCBDICCAH(FRIENDS.CLANS_MAX_JOINED_CLANS))
		}

		LUI.UIRoot.ProcessEvent(Engine.DBFFAEEFGJ(), {
			name = "send_toast_notification",
			immediate = true,
			options = var_164_0
		})
	else
		Clans.IEHDGEGJC(arg_164_0, arg_164_1)
	end
end

function FRIENDS.GetOpenPlayerActionPopupFunc(arg_165_0, arg_165_1, arg_165_2)
	return function(arg_166_0, arg_166_1)
		if arg_165_1.isMyPlayer then
			return
		end

		arg_165_1.selectedTab = arg_165_1.selectedTab or arg_165_0
		arg_165_1.controllerIndex = arg_166_1.controller
		arg_165_1.isRegiments = arg_165_0 == FRIENDS.TabIDs.REGIMENTS
		arg_165_1.isPartyMember = arg_165_0 == FRIENDS.TabIDs.PRIVATE_PARTY

		local var_166_0 = MenuBuilder.BuildRegisteredType("SocialPlayerPopup", arg_165_1)
		local var_166_1 = FRIENDS.GetFriendActions(arg_165_1)

		if arg_165_0 == FRIENDS.TabIDs.CLANS and arg_165_2 then
			local var_166_2 = CLANS.GetClanMembersScreenActions(arg_165_2, arg_165_1.viewerMemberRole, arg_165_1)

			for iter_166_0, iter_166_1 in ipairs(var_166_2) do
				table.insert(var_166_1, iter_166_1)
			end
		elseif arg_165_0 ~= FRIENDS.TabIDs.CLANS and arg_165_0 ~= FRIENDS.TabIDs.INBOX then
			local var_166_3 = CLANS.GetSocialMenuScreenActions({
				controllerIndex = arg_166_0._controllerIndex,
				clanDetails = arg_166_0._clanDetails,
				xuid = arg_165_1.xuid,
				playerData = arg_165_1
			})

			arg_166_0._contextualMenuIsAdded = false
			arg_166_0._contextualMenuHandlerAdded = false

			for iter_166_2, iter_166_3 in ipairs(var_166_3) do
				table.insert(var_166_1, iter_166_3)
			end
		end

		FRIENDS.AddFriendActions(arg_165_1, var_166_1, var_166_0.PlayerActions)
		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_166_1.controller, false, {
			widget = var_166_0
		})
	end
end

function FRIENDS.GetOpenInboxActionPopupFunc(arg_167_0)
	return function(arg_168_0, arg_168_1)
		local var_168_0 = arg_168_1.controller or 0
		local var_168_1 = {
			controllerIndex = var_168_0,
			invitationData = arg_167_0
		}

		LUI.FlowManager.RequestAddMenu("SocialInvitationManagementMenu", true, var_168_0, false, var_168_1, true)
	end
end

function FRIENDS.GetPlayerButtonAction(arg_169_0, arg_169_1, arg_169_2)
	assert(arg_169_1)

	if not arg_169_0 then
		return
	end

	local var_169_0

	if arg_169_1 == FRIENDS.TabIDs.FRIENDS then
		if arg_169_2 == FRIENDS.ManageFriendsTabIDs.SENT_INVITES then
			var_169_0 = var_0_31(arg_169_0)
		elseif arg_169_2 == FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS then
			var_169_0 = var_0_32(arg_169_0)
		elseif arg_169_2 == FRIENDS.ManageFriendsTabIDs.BLOCKED_PLAYERS then
			var_169_0 = var_0_33(arg_169_0)
		else
			arg_169_0.selectedTab = FRIENDS.FriendTypeToTabIDs[arg_169_0.friendsListType]
			var_169_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_169_1, arg_169_0)
		end
	elseif arg_169_1 == FRIENDS.TabIDs.RECENT_PLAYERS or arg_169_1 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS then
		var_169_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_169_1, arg_169_0)
	elseif arg_169_1 == FRIENDS.TabIDs.PRIVATE_PARTY then
		if arg_169_2 == FRIENDS.ManagePartyTabIDs.INVITE_PLAYERS then
			var_169_0 = var_0_34(arg_169_0)
		elseif arg_169_2 == FRIENDS.ManagePartyTabIDs.PARTY_INVITATIONS then
			var_169_0 = var_0_35(arg_169_0)
		else
			var_169_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_169_1, arg_169_0)
		end
	elseif arg_169_1 == FRIENDS.TabIDs.REGIMENTS then
		if arg_169_2 == FRIENDS.ManageRegimentInvitesTabIDs.SENT_INVITES then
			var_169_0 = var_0_36(arg_169_0)
		elseif arg_169_2 == FRIENDS.ManageRegimentInvitesTabIDs.REGIMENT_INVITATIONS then
			var_169_0 = var_0_37(arg_169_0)
		else
			var_169_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_169_1, arg_169_0)
		end
	elseif arg_169_1 == FRIENDS.TabIDs.CLANS then
		if arg_169_2 == CLANS.CLAN_TAB_IDs.BANNED_PlAYERS then
			var_169_0 = var_0_38(arg_169_0)
		else
			var_169_0 = FRIENDS.GetOpenPlayerActionPopupFunc(arg_169_1, arg_169_0, arg_169_2)
		end
	end

	return var_169_0
end

function FRIENDS.GetPlayerSubTabContextualMenu(arg_170_0, arg_170_1, arg_170_2, arg_170_3)
	assert(arg_170_2)

	if not arg_170_0 then
		return
	end

	local var_170_0 = {}

	if arg_170_2 == FRIENDS.TabIDs.FRIENDS then
		if arg_170_3 == FRIENDS.ManageFriendsTabIDs.SENT_INVITES then
			LUI.ConcatenateToTable(var_170_0, {
				{
					id = "declineRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_170_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.BHCIIHHAAC(arg_170_1, arg_170_0.xuid)
						elseif arg_170_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.DHHEFJGEJC(arg_170_1, arg_170_0.invitationId)
						end

						local var_171_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_171_0, {
							name = "request_fetch_data"
						})
					end
				}
			})
		elseif arg_170_3 == FRIENDS.ManageFriendsTabIDs.FRIEND_REQUESTS then
			LUI.ConcatenateToTable(var_170_0, {
				{
					id = "acceptRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_170_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.BIHDCJGFCI(arg_170_1, arg_170_0.xuid)
							Social.DAFDEJICJJ(arg_170_1, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_170_0.xuid, arg_170_0.fullName)
						elseif arg_170_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.IBEHACGBI(arg_170_1, arg_170_0.platformId)
							Social.DAFDEJICJJ(arg_170_1, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_170_0.platformId, arg_170_0.fullName)
						end

						local var_172_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_172_0, {
							name = "request_fetch_data"
						})
					end
				},
				{
					id = "declineRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_170_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.CGIDFEJECG(arg_170_1, arg_170_0.xuid)
						elseif arg_170_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.JHHJICGHG(arg_170_1, arg_170_0.platformId)
						end

						local var_173_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_173_0, {
							name = "request_fetch_data"
						})
					end
				},
				{
					id = "blockRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/BLOCK_REQUEST"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_170_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.CGIDFEJECG(arg_170_1, arg_170_0.xuid)
							Social.DACDEGEDDD(arg_170_1, arg_170_0.xuid, arg_170_0.fullName)
						elseif arg_170_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.JHHJICGHG(arg_170_1, arg_170_0.platformId)
							Social.BIFIFEECCJ(arg_170_1, arg_170_0.platformId)
						end

						local var_174_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_174_0, {
							name = "request_fetch_data"
						})
					end
				}
			})
		elseif arg_170_3 == FRIENDS.ManageFriendsTabIDs.BLOCKED_PLAYERS then
			LUI.ConcatenateToTable(var_170_0, {
				{
					id = "acceptRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/UNBLOCK"),
					action = function()
						LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false

						if arg_170_0.playerDataType == FRIENDS.FriendsListType.ACTIVISION then
							Social.EIGAJHEGI(arg_170_1, arg_170_0.xuid)
						elseif arg_170_0.playerDataType == FRIENDS.FriendsListType.FIRST_PARTY then
							Social.JGFDEBFAC(arg_170_0.platformId)
						end

						local var_175_0 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_175_0, {
							name = "request_fetch_data"
						})
					end
				}
			})
		end
	elseif arg_170_2 == FRIENDS.TabIDs.REGIMENTS then
		if arg_170_3 == FRIENDS.ManageRegimentInvitesTabIDs.REGIMENT_INVITATIONS then
			LUI.ConcatenateToTable(var_170_0, {
				{
					id = "acceptRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"),
					action = function()
						FRIENDS.TryAndAcceptClanInvite(arg_170_1, arg_170_0.clanId)
					end
				},
				{
					id = "declineRequest",
					label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_REQUEST"),
					action = function()
						Clans.DJIFJAAFAI(arg_170_1, arg_170_0.clanId)

						local var_177_0 = {
							icon = "hud_info_alert",
							displayTime = 3000,
							description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_DECLINED")
						}
						local var_177_1 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_177_1, {
							name = "send_toast_notification",
							immediate = true,
							options = var_177_0
						})
					end
				}
			})
		elseif arg_170_3 == FRIENDS.ManageRegimentInvitesTabIDs.SENT_INVITES then
			LUI.ConcatenateToTable(var_170_0, {
				{
					id = "revokeRegiment",
					label = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_REQUEST"),
					action = function()
						Clans.CFJCAAHHGE(arg_170_1, arg_170_0.clanId, arg_170_0.xuid)

						local var_178_0 = {
							icon = "hud_info_alert",
							displayTime = 3000,
							description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_REVOKED")
						}
						local var_178_1 = Engine.DBFFAEEFGJ()

						LUI.UIRoot.ProcessEvent(var_178_1, {
							name = "send_toast_notification",
							immediate = true,
							options = var_178_0
						})
					end
				}
			})
		end
	end

	return var_170_0
end

function FRIENDS.GetRefreshPlayerChildFunc(arg_179_0, arg_179_1, arg_179_2)
	local function var_179_0(arg_180_0, arg_180_1)
		if arg_179_0.UpdatePlayerDetails then
			arg_179_0:UpdatePlayerDetails(arg_180_0, arg_180_1)
		end
	end

	return function(arg_181_0, arg_181_1, arg_181_2)
		if arg_179_1 ~= FRIENDS.TabIDs.INBOX then
			arg_181_0.UpdatePlayerDetailsContent = var_179_0
		end

		local var_181_0 = arg_179_2 > 1 and arg_181_1 + arg_181_2 * arg_179_2 or arg_181_2

		arg_181_0:SetCurrentLocation(arg_179_1)

		if arg_179_1 == FRIENDS.TabIDs.FRIENDS or arg_179_1 == FRIENDS.TabIDs.RECENT_PLAYERS or arg_179_1 == FRIENDS.TabIDs.RECENT_SQUAD_PLAYERS then
			arg_181_0:SetupPlayerData(arg_179_0.PlayersGrid._friendsData.friends[var_181_0 + 1 - arg_179_0.PlayersGrid.getFriendFrom])
		elseif arg_179_1 == FRIENDS.TabIDs.PRIVATE_PARTY or arg_179_1 == FRIENDS.TabIDs.REGIMENTS then
			local var_181_1 = FRIENDS.UnifyPlayerDataFormat(arg_179_0.PlayersGrid.playersData[var_181_0 + 1])

			arg_181_0:SetupPlayerData(var_181_1)
		elseif arg_179_1 == FRIENDS.TabIDs.INBOX then
			local var_181_2 = arg_179_0.PlayersGrid._friendsData.friends[var_181_0 + 1 - arg_179_0.PlayersGrid.getFriendFrom]

			arg_181_0:SetupInvitationData(var_181_2)
		end
	end
end

function FRIENDS.UnifyPlayerDataFormat(arg_182_0)
	local var_182_0 = arg_182_0

	if arg_182_0.xuidString and not arg_182_0.xuid then
		var_182_0.xuid = arg_182_0.xuidString
	end

	if arg_182_0.gamertag and not arg_182_0.fullName then
		var_182_0.fullName = arg_182_0.gamertag
	end

	if arg_182_0.name and not arg_182_0.fullName then
		var_182_0.fullName = arg_182_0.name
	end

	if arg_182_0.clientPlatform and not arg_182_0.presencePlatform then
		var_182_0.presencePlatform = ClientPlatformToPresencePlatform[arg_182_0.clientPlatform]
	end

	if arg_182_0.platform and not arg_182_0.presencePlatform then
		var_182_0.presencePlatform = arg_182_0.platform
	end

	if arg_182_0.clanName and not arg_182_0.fullName then
		var_182_0.fullName = arg_182_0.clanName
	end

	if arg_182_0.isMyPlayer then
		if CONDITIONS.IsBattleNet() then
			local var_182_1 = 0
			local var_182_2 = Engine.EAGGAEGHHA(var_182_1)

			var_182_0.onlineStatus = Social.ECDAFHBHGC(var_182_1, var_182_2, true)
		else
			var_182_0.onlineStatus = BattleNetOnlineStatus.ONLINE
		end
	end

	return var_182_0
end

function FRIENDS.UnifyInvitationsFormat(arg_183_0, arg_183_1)
	for iter_183_0, iter_183_1 in ipairs(arg_183_0) do
		iter_183_1.invitationId = arg_183_1

		if iter_183_1.timeInfo and not iter_183_1.timestamp then
			iter_183_1.timestamp = iter_183_1.timeInfo
		end

		if iter_183_1.inviterXuid then
			iter_183_1.xuid = iter_183_1.inviterXuid
		end
	end

	return arg_183_0
end

function FRIENDS.GetNotificationDataSourceByTab(arg_184_0)
	local var_184_0

	if arg_184_0 == FRIENDS.TabIDs.FRIENDS then
		var_184_0 = DataSources.frontEnd.social.friendRequestCount
	elseif arg_184_0 == FRIENDS.TabIDs.PRIVATE_PARTY then
		var_184_0 = DataSources.frontEnd.social.partyInvitationCount
	elseif arg_184_0 == FRIENDS.TabIDs.REGIMENTS then
		var_184_0 = DataSources.frontEnd.social.regimentInvitationCount
	end

	return var_184_0
end

function FRIENDS.GetCurrentClanTagType(arg_185_0)
	local var_185_0 = ClanTagType.CUSTOM

	if Engine.BAHCIEEBFD(arg_185_0) then
		var_185_0 = LUI.DataSourceFromPlayerData.new(CoD.StatsGroup.Common, CoD.PlayMode.Core).clanTagType:GetValue(arg_185_0)
	end

	return var_185_0 or ClanTagType.CUSTOM
end

function FRIENDS.GetHappyHourSetTimeString(arg_186_0, arg_186_1)
	local var_186_0 = Clans.CBJDIGCAED(arg_186_0, arg_186_1)

	if var_186_0 then
		if IsLanguageEnglish() then
			local var_186_1, var_186_2 = Engine.CBBHFCGDIC("LUA_MENU/TIME_PERIOD_AM"), Engine.CBBHFCGDIC("LUA_MENU/TIME_PERIOD_PM")
			local var_186_3 = var_186_0.happyHour

			if var_186_3 == 0 then
				var_186_3 = 12
			elseif var_186_3 >= 12 then
				var_186_1 = var_186_2

				if var_186_3 > 12 then
					var_186_3 = var_186_3 - 12
				end
			end

			return Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_SET", var_186_3, string.format("%02d", var_186_0.happyMinutes), var_186_1)
		else
			return Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_SET", string.format("%02d", var_186_0.happyHour), string.format("%02d", var_186_0.happyMinutes))
		end
	else
		return ""
	end
end

function FRIENDS.SetPlayerGridHeader(arg_187_0, arg_187_1, arg_187_2, arg_187_3)
	arg_187_0.HeadLine:SetAlpha(arg_187_3 and 1 or 0)

	if arg_187_1 and #arg_187_1 > 0 then
		arg_187_0.HeadText:SetAlpha(1)
		arg_187_0.HeadText:setText(arg_187_1)
		arg_187_0.HeadLine:SetAlpha(1)
	end

	if arg_187_2 and #arg_187_2 > 0 then
		arg_187_0.PlayerNumText:SetAlpha(1)
		arg_187_0.PlayerNumText:setText(arg_187_2)
	end
end

function FRIENDS.TryAppendRealIdToBattleTag(arg_188_0, arg_188_1)
	local var_188_0 = Social.CFEIHAADEI(arg_188_0)
	local var_188_1 = Engine.BECCFCBIAA("displayRealID")

	if var_188_0 and var_188_1 == 1 then
		local var_188_2 = var_188_0.fullName

		if var_188_2 ~= nil and #var_188_2 > 0 then
			return Engine.CBBHFCGDIC("LUA_MENU/BATTLETAG_WITH_READ_ID_NAME", Engine.JCBDICCAH(arg_188_1), Engine.JCBDICCAH(var_188_2))
		else
			return arg_188_1
		end
	end

	return arg_188_1
end

function FRIENDS.GetFriendPlatformId(arg_189_0)
	local var_189_0 = Engine.CBBFHGEDGJ()
	local var_189_1 = arg_189_0.presencePlatform
	local var_189_2 = 0

	if not CONDITIONS.IsPCMSStore() and not CONDITIONS.IsXbox() and arg_189_0.isPlatformFriend and var_189_1 == 0 then
		var_189_1 = var_189_0
	end

	if var_189_1 == nil or var_189_1 <= 0 then
		-- block empty
	elseif var_189_0 == var_189_1 then
		var_189_2 = var_189_1
	elseif var_189_0 == PresencePlatform.BNET then
		if var_189_1 == PresencePlatform.STEAM or var_189_1 == PresencePlatform.UBICONNECT then
			var_189_2 = PresencePlatform.CROSSPLAY_PC
		else
			var_189_2 = var_189_1
		end
	elseif var_189_0 == PresencePlatform.MSSTORE then
		if var_189_1 == PresencePlatform.BNET or var_189_1 == PresencePlatform.STEAM or var_189_1 == PresencePlatform.UBICONNECT then
			var_189_2 = PresencePlatform.CROSSPLAY_PC
		elseif var_189_1 == PresencePlatform.XBOX_ONE or var_189_1 == PresencePlatform.XB4 then
			var_189_2 = var_189_1
		else
			var_189_2 = PresencePlatform.CROSSPLAY_CONSOLE
		end
	elseif var_189_0 == PresencePlatform.STEAM then
		if var_189_1 == PresencePlatform.BNET or var_189_1 == PresencePlatform.UBICONNECT then
			var_189_2 = PresencePlatform.CROSSPLAY_PC
		else
			var_189_2 = var_189_1
		end
	elseif var_189_0 == PresencePlatform.UBICONNECT then
		var_189_2 = var_189_1
	elseif var_189_1 == PresencePlatform.BNET or var_189_1 == PresencePlatform.STEAM or var_189_1 == PresencePlatform.UBICONNECT then
		var_189_2 = PresencePlatform.CROSSPLAY_PC
	elseif var_189_1 == PresencePlatform.MSSTORE then
		if var_189_0 == PresencePlatform.XBOX_ONE or var_189_0 == PresencePlatform.XB4 then
			var_189_2 = var_189_1
		else
			var_189_2 = PresencePlatform.CROSSPLAY_PC
		end
	elseif var_189_1 == PresencePlatform.XBOX_ONE or var_189_1 == PresencePlatform.XB4 then
		if var_189_0 == PresencePlatform.PS4 or var_189_0 == PresencePlatform.PS5 then
			var_189_2 = PresencePlatform.CROSSPLAY_CONSOLE
		else
			var_189_2 = var_189_1
		end
	elseif var_189_1 == PresencePlatform.PS4 or var_189_1 == PresencePlatform.PS5 then
		if var_189_0 == PresencePlatform.XBOX_ONE or var_189_0 == PresencePlatform.XB4 then
			var_189_2 = PresencePlatform.CROSSPLAY_CONSOLE
		else
			var_189_2 = var_189_1
		end
	else
		var_189_2 = PresencePlatform.CROSSPLAY_CONSOLE
	end

	return var_189_2
end
