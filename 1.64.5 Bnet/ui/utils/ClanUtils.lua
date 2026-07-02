CLANS = CLANS or {}
CLANS.INVALID_CLAN_ID_STRING = "0"
CLANS.INVALID_CLAN_ID_NUMBER = 0
CLANS.MAX_CLAN_SEARCH_LABELS = 3
CLANS.MAX_TAG_LENGTH = 5
CLANS.MAX_NAME_LENGTH = 28
CLANS.MAX_DESCRIPTION_LENGTH = 255
CLANS.MIN_NUM_CLAN_MEMBERS = 1
CLANS.MAX_NUM_CLAN_MEMBERS = 100
CLANS.MAX_DIGITS_IN_CLAN_NAME = 6
CLANS.MAX_DESC_LENGTH = 255
CLANS.MAX_CLAN_LABELS = 3
CLANS.CLAN_EVENT_WAIT_TIME = 10000
CLANS.CLAN_CREATE_WAIT_TIME = 300
CLANS.CLAN_DEFAULT_NOTIFICATION_IMAGE = "icon_clan"
CLANS.CLAN_EQUIPPED_NOTIFICATION_IMAGE = "v_ui_ic_equipped_indicator"
CLANS.CLAN_SEARCH_LABEL_KEY = "labels"
CLANS.CLAN_EVENTS = {
	CLAN_DATA_RESOLVED = "clans2_data_fetch_resolved",
	CLAN_LEAVE_FROM_POPUP = "clans2_leave_from_popup",
	ACTIVE_CLAN_CHANGE = "clans2_active_clan_change",
	PROMOTED_TO_OFFICER = "clans2_promoted_to_officer",
	TAG_UPDATED = "clans2_tag_updated",
	CLAN_EXTERNAL_DATA_RESOLVED = "clans2_external_clan_data_resolved",
	MEMBER_REMOVED = "clans2_member_removed",
	INVITE_ACCEPTED = "clans2_invite_accepted",
	CLAN_MEMBERS_RESOLVED = "clans2_members_fetch_resolved",
	CLAN_SEARCH_TAGS = "clans2_fetch_clan_search_tags_resolved",
	CLAN_PROFILE_RESOLVED = "clans2_profile_fetch_resolved",
	ACTIVATED = "clans2_activated_clan",
	CLAN_DESCRIPTION_EDITED = "clans2_descripton_edited",
	INVITE_CANCELED = "clans2_invite_canceled",
	CLAN_NAME_EDITED = "clans2_name_edited",
	GETINFO_FAILURE = "clans2_getinfo_failure",
	CREATED = "clans2_created",
	CLAN_TAG_EDITED = "clan2_tag_edited",
	INVITES_UPDATED = "clans2_invites_updated",
	CLAN_DATA_SEARCH_RESOLVED = "clans2_search_resolved",
	HAPPY_HOUR = "clans2_happy_hour_updated",
	INITIALIZED = "clans2_initialized_clan",
	NOTIFICATION = "clans2_notification",
	LEFT_CLAN_ACTIVE = "clans2_left_clan_active",
	CLAN_DATA_LOADED = "clans2_clan_data_loaded",
	HAPPY_HOUR_START = "clans2_happy_hour_start",
	PROMOTED_TO_OWNER = "clans2_promoted_to_owner",
	NAME_UPDATED = "clans2_name_updated",
	GETINFO_SUCCESS = "clans2_getinfo_success",
	DEMOTED_TO_ADMIN = "clans2_demoted_to_admin",
	CHECK_TAG_AVAILABILITY = "clans2_check_tag_availability_resolved",
	CLAN_DISBAND_FROM_POPUP = "clans2_disband_from_popup",
	MEMBER_UNBANNED = "clans2_member_unbanned",
	CREATION_FAILED = "clans2_creation_failed",
	CLAN_OWNER_TRANSFERRED = "clans2_owner_transferred",
	INVITE_SENT = "clans2_invite_sent",
	DEMOTED_TO_MEMBER = "clans2_demoted_to_member",
	PROMOTED_TO_ADMIN = "clans2_promoted_to_admin",
	INVITE_RECEIVED = "clans2_invite_received",
	HAPPY_HOUR_END = "clans2_happy_hour_end",
	MEMBER_ADDED = "clans2_member_added",
	INFO_UPDATED = "clans2_info_updated",
	DELETED = "clans2_deleted",
	CLAN_TAG_FROM_POPUP = "clans2_tag_from_popup",
	KICKED = "clans2_kicked_from_clan",
	MAX_OWNED = "clans2_max_clans_owned",
	SEARCH_TAGS_UPDATE = "clans2_search_tags_update",
	LEFT_CLAN_INACTIVE = "clans2_left_clan_inactive",
	REQUESTS_UPDATED = "clans2_requests_updated",
	FETCH_SUGGESTED_CLAN_TAGS = "clans2_fetch_suggested_tags_resolved",
	DEMOTED_TO_OFFICER = "clans2_demoted_to_officer",
	MEMBER_BANNED = "clans2_member_banned"
}
CLANS.CLAN_ACTIONS = {
	EDIT_PRIVACY = "EditPrivacy",
	EDIT_NAME = "EditName",
	EDIT_DESCRIPTION = "EditDescription",
	TRANSFER_OWNERSHIP = "TransferOwnership",
	USE_CLAN_EMBLEM = "UseClanEmbem",
	DISBAND_OR_LEAVE = "DisbandClan",
	USE_CLAN_TAG = "UseClanTag",
	EDIT_SEARCH_LABELS = "EditSearchLabels",
	EDIT_EMBLEM = "EditEmblem",
	EDIT_TAG = "EditTag",
	NONE = "None"
}
CLANS.CLAN_FAILURE_REASON = {
	MAX_OUTGOING_PROPOSALS_FOR_USER_ERROR = 10,
	STRUCTURED_DATA_INVALID_SCHEMA_VERSION_ERROR = 19,
	TAG_IN_USE_ERROR = 16,
	MAX_OWNERSHIPS_FOR_USER_ERROR = 9,
	TAG_NOT_AVAILABLE_ERROR = 17,
	UNKNOWN_ERROR = 1,
	MAX_PROPOSALS_FOR_CLAN_ERROR = 7,
	MAX_MEMBERS_IN_CLAN_ERROR = 6,
	PROFANITY_ERROR = 15,
	NO_SUCH_CLAN_ERROR = 2,
	INVALID_PAGE_TOKEN_ERROR = 5,
	STRUCTURED_DATA_SCHEMA_IDENTIFIER_NOT_FOUND_ERROR = 18,
	MEMBER_PROPOSAL_REJECTED_ERROR = 11,
	TAG_IS_PROFANE_ERROR = 13,
	STRUCTURED_DATA_INVALID_CONTEXT_SCHEMA_ERROR = 21,
	STRUCTURED_DATA_MISSING_CONTEXT_CONFIG_ERROR = 20,
	STRUCTURED_DATA_FAILED_TO_UPDATE_ERROR = 23,
	STRUCTURED_DATA_MAX_OWNERS_EXCEEDED_ERROR = 24,
	INVALID_REQUEST_ERROR = 4,
	STRUCTURED_DATA_NOT_FOUND = 25,
	MAX_MEMBERSHIPS_FOR_USER_ERROR = 8,
	USER_IS_BANNED_ERROR = 12,
	STRUCTURED_DATA_INVALID_PAYLOAD_ERROR = 22,
	GENERIC_CLAN_ERROR = 0,
	NAME_IS_PROFANE_ERROR = 14,
	PERMISSION_DENIED_ERROR = 3
}
CLANS.CLAN_FAILURE_REASON_STRINGS = {
	[CLANS.CLAN_FAILURE_REASON.GENERIC_CLAN_ERROR] = "CLANS/GENERIC_CLAN_ERROR",
	[CLANS.CLAN_FAILURE_REASON.UNKNOWN_ERROR] = "CLANS/UNKNOWN_ERROR",
	[CLANS.CLAN_FAILURE_REASON.NO_SUCH_CLAN_ERROR] = "CLANS/NO_SUCH_CLAN_ERROR",
	[CLANS.CLAN_FAILURE_REASON.PERMISSION_DENIED_ERROR] = "CLANS/PERMISSION_DENIED_ERROR",
	[CLANS.CLAN_FAILURE_REASON.INVALID_REQUEST_ERROR] = "CLANS/INVALID_REQUEST_ERROR",
	[CLANS.CLAN_FAILURE_REASON.INVALID_PAGE_TOKEN_ERROR] = "CLANS/INVALID_PAGE_TOKEN_ERROR",
	[CLANS.CLAN_FAILURE_REASON.MAX_MEMBERS_IN_CLAN_ERROR] = "CLANS/MAX_MEMBERS_IN_CLAN_ERROR",
	[CLANS.CLAN_FAILURE_REASON.MAX_PROPOSALS_FOR_CLAN_ERROR] = "CLANS/MAX_PROPOSALS_FOR_CLAN_ERROR",
	[CLANS.CLAN_FAILURE_REASON.MAX_MEMBERSHIPS_FOR_USER_ERROR] = "CLANS/CLAN_MEMBERSHIP_LIMIT",
	[CLANS.CLAN_FAILURE_REASON.MAX_OWNERSHIPS_FOR_USER_ERROR] = "CLANS/CLAN_LIMIT",
	[CLANS.CLAN_FAILURE_REASON.MAX_OUTGOING_PROPOSALS_FOR_USER_ERROR] = "CLANS/MAX_OUTGOING_PROPOSALS_FOR_USER_ERROR",
	[CLANS.CLAN_FAILURE_REASON.USER_IS_BANNED_ERROR] = "CLANS/USER_IS_BANNED_ERROR",
	[CLANS.CLAN_FAILURE_REASON.NAME_IS_PROFANE_ERROR] = "CLANS/CLAN_NAME_VULGAR",
	[CLANS.CLAN_FAILURE_REASON.TAG_IN_USE_ERROR] = "CLANS/CLAN_TAG_TAKEN",
	[CLANS.CLAN_FAILURE_REASON.TAG_IS_PROFANE_ERROR] = "CLANS/CLAN_TAG_VULGAR"
}
CLANS.EMBLEM = {
	DEFAULT_DATA = {
		foregroundShapeId = 0,
		backgroundShapeId = 0,
		backgroundColorId = 0,
		foregroundColorId = 0
	}
}
CLANS.CLAN_DATA = {
	MAX_UPDATE_WAIT_TIME = 2
}
CLANS.CLAN_TAB_IDs = {
	OUTGOING_INVITES = "outgoing_invites",
	BANNED_PlAYERS = "banned_players",
	INCOMING_REQUESTS = "incoming_requests",
	MEMBERS = "members"
}
CLANS.CLAN_MEMBER_ROLE = {
	CLAN_OWNER = 4,
	CLAN_OFFICER = 2,
	INVLAID_ROLE = 0,
	CLAN_ADMIN = 3,
	CLAN_MEMBER = 1
}
CLANS.CLAN_MEMBER_ROLE_LOCALIZATION = {
	[CLANS.CLAN_MEMBER_ROLE.CLAN_MEMBER] = "CLANS/MEMBER",
	[CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER] = "CLANS/OFFICER",
	[CLANS.CLAN_MEMBER_ROLE.CLAN_ADMIN] = "CLANS/ADMIN",
	[CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER] = "CLANS/OWNER"
}
CLANS.CLANS_MEMBER_STATUS_CHANGED_NOTIFICATION = {
	[CLANS.CLAN_EVENTS.PROMOTED_TO_OWNER] = {
		header = Engine.CBBHFCGDIC("CLANS/PROMOTION"),
		description = Engine.CBBHFCGDIC("CLANS/PROMOTED_TO_OWNER")
	},
	[CLANS.CLAN_EVENTS.PROMOTED_TO_ADMIN] = {
		header = Engine.CBBHFCGDIC("CLANS/PROMOTION"),
		description = Engine.CBBHFCGDIC("CLANS/PROMOTED_TO_ADMIN")
	},
	[CLANS.CLAN_EVENTS.PROMOTED_TO_OFFICER] = {
		header = Engine.CBBHFCGDIC("CLANS/PROMOTION"),
		description = Engine.CBBHFCGDIC("CLANS/PROMOTED_TO_OFFICER")
	},
	[CLANS.CLAN_EVENTS.DEMOTED_TO_ADMIN] = {
		header = Engine.CBBHFCGDIC("CLANS/DEMOTION"),
		description = Engine.CBBHFCGDIC("CLANS/DEMOTED_TO_ADMIN")
	},
	[CLANS.CLAN_EVENTS.DEMOTED_TO_OFFICER] = {
		header = Engine.CBBHFCGDIC("CLANS/DEMOTION"),
		description = Engine.CBBHFCGDIC("CLANS/DEMOTED_TO_OFFICER")
	},
	[CLANS.CLAN_EVENTS.DEMOTED_TO_MEMBER] = {
		header = Engine.CBBHFCGDIC("CLANS/DEMOTION"),
		description = Engine.CBBHFCGDIC("CLANS/DEMOTED_TO_MEMBER")
	},
	[CLANS.CLAN_EVENTS.KICKED] = {
		description = "",
		header = Engine.CBBHFCGDIC("CLANS/KICKED_DESC")
	}
}
CLANS.CLAN_REMOVE_CLAN_COSMETICS_EVENTS = {
	CLANS.CLAN_EVENTS.KICKED,
	CLANS.CLAN_EVENTS.LEFT_CLAN_ACTIVE
}
CLANS.CLAN_MEMBER_ROLE_ICONS = {
	CLAN_OFFICER = "ui_sticker_002",
	CLAN_MEMBER = "ui_sticker_004",
	CLAN_ADMIN = "ui_sticker_003",
	CLAN_OWNER = "ui_sticker_001"
}
CLANS.CLAN_POPUP_INPUT = {
	CLAN_DISBAND_CLAN = "clan_disband_clan",
	CLAN_TAG = "clan_tag",
	CLAN_DESCRIPTION = "clan_description",
	CLAN_NAME = "clan_name",
	CLAN_LEAVE_CLAN = "clan_leave_clan",
	CLAN_TRANSFER_OWNERSHIP = "transfer_ownership"
}
CLANS.CLAN_LABEL_KEYS = {
	"label00",
	"label01",
	"label02",
	"label03",
	"label05",
	"label04",
	"label06",
	"label07",
	"label08",
	"label09",
	"label10"
}
CLANS.CLAN_LABEL_STRINGS = {
	label04 = "CLANS/LABEL04",
	label08 = "CLANS/LABEL08",
	label09 = "CLANS/LABEL09",
	label02 = "CLANS/LABEL02",
	label03 = "CLANS/LABEL03",
	label00 = "CLANS/LABEL00",
	label01 = "CLANS/LABEL01",
	label06 = "CLANS/LABEL06",
	label10 = "CLANS/LABEL10",
	label07 = "CLANS/LABEL07",
	label05 = "CLANS/LABEL05"
}
CLANS.CLAN_PRIVACY_LEVEL = {
	OPEN = 1,
	BY_REQUEST = 2,
	INVALID = 0,
	INVITE_ONLY = 3
}
CLANS.CLAN_STATUS = {
	ACTIVE = 1,
	INACTIVE = 0,
	UNKNOWN = -1
}
CLANS.CLAN_PRIVACY_LEVEL_STRINGS = {
	[CLANS.CLAN_PRIVACY_LEVEL.INVALID] = "",
	[CLANS.CLAN_PRIVACY_LEVEL.OPEN] = "CLANS/CLAN_PRIVACY_OPTION_OPEN",
	[CLANS.CLAN_PRIVACY_LEVEL.BY_REQUEST] = "CLANS/CLAN_PRIVACY_OPTION_REQUEST",
	[CLANS.CLAN_PRIVACY_LEVEL.INVITE_ONLY] = "CLANS/CLAN_PRIVACY_OPTION_INVITE"
}
CLANS.CLAN_MEMBERS_FILTER = {
	ALL = 0,
	OFFICERS_ONLY = 1,
	NO_OFFICERS = 2,
	EXCLUDE_OWNER = 3
}
CLANS.MOCK_CLAN_DATA = {
	numClanMembersMax = 100,
	clanStatus = 0,
	clanName = "RAVEN SOFTWARE",
	clanOwner = "",
	clanPrivacyLevel = 3,
	numClanMembersOnline = 69,
	clanAnnouncement = "",
	clanId = "0",
	numClanMembers = 80,
	clanTag = "ACTIV",
	clanXP = "",
	clanDescription = Engine.CBBHFCGDIC("LUA_MENU/CLAN_DESCRIPTION_DEBUG"),
	clanLabels = {
		1,
		2,
		3
	},
	emblemData = {
		foregroundShapeId = 1,
		foregroundColorId = 2,
		backgroundColorId = 4,
		backgroundShapeId = 3
	}
}
CLANS.CLAN_SOCIAL_INVITE_INPUT = {
	CLANS = 1,
	GROUPS = 0
}

local function var_0_0(arg_1_0, arg_1_1)
	for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
		if iter_1_1 == arg_1_1 then
			return true
		end
	end

	return false
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_1.memberXUID)
	assert(arg_2_1.clanId)

	local var_2_0 = {
		title = Engine.CBBHFCGDIC("CLANS/BAN"),
		message = Engine.CBBHFCGDIC("CLANS/BAN_DESC"),
		controllerIndex = arg_2_1.controllerIndex,
		yesAction = function(arg_3_0, arg_3_1)
			CLANS.BanMemberFromClan(arg_3_0, arg_3_1, arg_2_1)
		end,
		noAction = function()
			return
		end
	}
	local var_2_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_2_0)

	var_2_1.id = "BanClanMemberPopup"

	return var_2_1
end

MenuBuilder.registerType("BanClanMemberPopup", var_0_1)

local function var_0_2(arg_5_0, arg_5_1)
	assert(arg_5_1.memberXUID)

	local var_5_0 = {
		title = Engine.CBBHFCGDIC("CLANS/UNBAN"),
		message = Engine.CBBHFCGDIC("CLANS/UNBAN_DESC"),
		controllerIndex = arg_5_1.controllerIndex,
		yesAction = function(arg_6_0, arg_6_1)
			local var_6_0 = arg_5_1.gamertag or arg_5_1.fullName

			CLANS.UnbanMemberFromClan(arg_6_0, arg_5_1.controllerIndex, arg_5_1.memberXUID, var_6_0)
		end,
		noAction = function()
			return
		end
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_5_0)

	var_5_1.id = "UnbanClanMemberPopup"

	return var_5_1
end

MenuBuilder.registerType("UnbanClanMemberPopup", var_0_2)

local function var_0_3(arg_8_0, arg_8_1)
	for iter_8_0 = 1, #arg_8_0 do
		if arg_8_0[iter_8_0].xuid == arg_8_1 then
			return iter_8_0
		end
	end

	return -1
end

local function var_0_4(arg_9_0, arg_9_1)
	for iter_9_0 = 1, #arg_9_0 do
		if arg_9_0[iter_9_0].lastUpdateRequestTime == 0 then
			if arg_9_1 <= 0 then
				return iter_9_0
			end

			arg_9_1 = arg_9_1 - 1
		end
	end

	return -1
end

local function var_0_5(arg_10_0, arg_10_1)
	for iter_10_0 = 1, #arg_10_0 do
		if arg_10_0[iter_10_0].lastUpdateTime == 0 then
			if arg_10_1 <= 0 then
				return iter_10_0
			end

			arg_10_1 = arg_10_1 - 1
		end
	end

	return -1
end

local function var_0_6(arg_11_0)
	table.sort(arg_11_0, function(arg_12_0, arg_12_1)
		return arg_12_0.lastUpdateTime < arg_12_1.lastUpdateTime
	end)

	return arg_11_0
end

local function var_0_7(arg_13_0, arg_13_1)
	assert(arg_13_1 >= 1 and arg_13_1 <= #arg_13_0)

	return var_0_6(arg_13_0)[arg_13_1]
end

local function var_0_8()
	local var_14_0 = LUI.FlowManager.GetScopedData(MenuUtils.GetMainMenu())

	if var_14_0 and not var_14_0.clanXuidData.fired then
		local var_14_1 = var_14_0.clanXuidData.array
		local var_14_2 = false
		local var_14_3 = 0
		local var_14_4 = 0

		repeat
			local var_14_5 = var_0_4(var_14_1, var_14_4)

			if var_14_5 ~= -1 then
				local var_14_6 = var_14_1[var_14_5]

				if Clans2.IBJFIGED(var_14_6.controllerIndex, var_14_6.xuid) then
					local var_14_7 = tonumber(Engine.DEIDGHDBHD())

					var_14_2 = true
					var_14_1[var_14_5].lastUpdateRequestTime = var_14_7
					var_14_0.clanXuidData.fired = true
					var_14_0.clanXuidData.lastFiredTime = var_14_7
					var_14_0.clanXuidData.firedXuid = var_14_1[var_14_5].xuid

					DebugPrint("WARNING: " .. "Clan Data Request Was Fired")

					break
				else
					var_14_4 = var_14_4 + 1

					DebugPrint("WARNING: " .. "Clan Data Request Failed")
				end
			else
				DebugPrint("WARNING: " .. "Did Not Find Any Clan Data Not Requested")

				break
			end
		until var_14_4 < #var_14_1

		if not var_14_2 then
			local var_14_8 = 0

			repeat
				local var_14_9 = var_0_5(var_14_1, var_14_8)

				if var_14_9 ~= -1 then
					local var_14_10 = var_14_1[var_14_9]

					if Clans2.IBJFIGED(var_14_10.controllerIndex, var_14_10.xuid) then
						local var_14_11 = tonumber(Engine.DEIDGHDBHD())

						var_14_2 = true
						var_14_1[var_14_9].lastUpdateRequestTime = var_14_11
						var_14_0.clanXuidData.fired = true
						var_14_0.clanXuidData.lastFiredTime = var_14_11
						var_14_0.clanXuidData.firedXuid = var_14_1[var_14_9].xuid

						DebugPrint("WARNING: " .. "Clan Data Request Was Fired")

						break
					else
						var_14_8 = var_14_8 + 1

						DebugPrint("WARNING: " .. "Clan Data Request Failed")
					end
				else
					DebugPrint("WARNING: " .. "Did Not Find Any Clan Data Not Updated")

					break
				end
			until var_14_8 < #var_14_1
		end

		if not var_14_2 then
			table.sort(var_14_1, function(arg_15_0, arg_15_1)
				return arg_15_0.lastUpdateTime < arg_15_1.lastUpdateTime
			end)

			for iter_14_0 = 1, #var_14_1 do
				local var_14_12 = var_14_1[iter_14_0]

				if Clans2.IBJFIGED(var_14_12.controllerIndex, var_14_12.xuid) then
					local var_14_13 = tonumber(Engine.DEIDGHDBHD())
					local var_14_14 = true

					var_14_1[iter_14_0].lastUpdateRequestTime = var_14_13
					var_14_0.clanXuidData.fired = true
					var_14_0.clanXuidData.lastFiredTime = var_14_13
					var_14_0.clanXuidData.lastFiredTime = var_14_1[iter_14_0].xuid

					DebugPrint("WARNING: " .. "Clan Data Request Was Fired")

					break
				else
					DebugPrint("WARNING: " .. "Clan Data Request Failed")
				end
			end
		end

		var_14_0.clanXuidData.array = var_14_1
	end
end

local function var_0_9(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = LUI.FlowManager.GetScopedData(MenuUtils.GetMainMenu())

	if var_16_0 then
		local var_16_1 = var_16_0.clanXuidData.array

		if var_0_3(var_16_1, arg_16_1) == -1 then
			table.insert(var_16_1, {
				lastUpdateRequestTime = 0,
				lastUpdateTime = 0,
				xuid = arg_16_1,
				controllerIndex = arg_16_0,
				element = arg_16_2
			})

			var_16_0.clanXuidData.array = var_16_1
		end

		var_0_8()
	end
end

local function var_0_10(arg_17_0)
	local var_17_0 = arg_17_0.controllerIndex
	local var_17_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_INCOMING_REQUEST")
	}

	var_17_1.id = "acceptInviteRequest"
	var_17_1.refreshOnAction = true

	function var_17_1.disabledFunc()
		return arg_17_0 == nil
	end

	function var_17_1.action()
		Clans2.CCEDAFJIJB(var_17_0, arg_17_0.clanId, arg_17_0.xuid)
	end

	return var_17_1
end

local function var_0_11(arg_20_0)
	local var_20_0 = arg_20_0.controllerIndex
	local var_20_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/DECLINE_INCOMING_REQUEST")
	}

	var_20_1.id = "declineInviteRequest"
	var_20_1.refreshOnAction = true

	function var_20_1.disabledFunc()
		return arg_20_0 == nil
	end

	function var_20_1.action()
		Clans2.HCIEFIFAH(var_20_0, arg_20_0.clanId, arg_20_0.xuid)
	end

	return var_20_1
end

local function var_0_12(arg_23_0)
	local var_23_0 = arg_23_0.controllerIndex
	local var_23_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/REVOKE_OUTGOING_INVITE")
	}

	var_23_1.id = "revokeInvite"
	var_23_1.refreshOnAction = true

	function var_23_1.disabledFunc()
		return arg_23_0 == nil
	end

	function var_23_1.action()
		Clans2.CFJCAAHHGE(var_23_0, arg_23_0.clanId, arg_23_0.xuid)
	end

	return var_23_1
end

local function var_0_13(arg_26_0)
	local var_26_0 = arg_26_0.controllerIndex
	local var_26_1 = Clans2.GFFJCJFIJ(var_26_0, arg_26_0.currentClientClanId)
	local var_26_2 = Engine.JCBDICCAH(var_26_1.clanTag)
	local var_26_3 = Engine.JCBDICCAH(var_26_1.clanName)
	local var_26_4 = {
		label = Engine.CBBHFCGDIC("CLANS/INVITE_TO_CLAN_BUTTON", var_26_2, var_26_3)
	}

	var_26_4.id = "inviteToClan"
	var_26_4.refreshOnAction = true

	function var_26_4.disabledFunc()
		return arg_26_0 == nil
	end

	function var_26_4.action()
		Clans2.DIEAGEDBCC(var_26_0, arg_26_0.currentClientClanId, arg_26_0.xuid)
	end

	return var_26_4
end

local function var_0_14(arg_29_0)
	local var_29_0 = arg_29_0.controllerIndex
	local var_29_1 = arg_29_0.clanDetails
	local var_29_2 = Engine.JCBDICCAH(var_29_1.clanTag)
	local var_29_3 = Engine.JCBDICCAH(var_29_1.clanName)
	local var_29_4 = {
		label = Engine.CBBHFCGDIC("CLANS/VIEW_CLAN_BUTTON", var_29_2, var_29_3)
	}

	var_29_4.id = "viewClan"
	var_29_4.refreshOnAction = true

	function var_29_4.disabledFunc()
		return arg_29_0 == nil
	end

	function var_29_4.action()
		LUI.FlowManager.RequestAddMenu("ClanPreviewScreen", true, var_29_0, false, {
			clanDetails = arg_29_0.clanDetails
		}, true)
	end

	return var_29_4
end

local function var_0_15(arg_32_0)
	local var_32_0 = arg_32_0.controllerIndex
	local var_32_1 = Clans2.GFFJCJFIJ(var_32_0, arg_32_0.currentClientClanId)
	local var_32_2 = Engine.JCBDICCAH(var_32_1.clanTag)
	local var_32_3 = Engine.JCBDICCAH(var_32_1.clanName)
	local var_32_4 = {
		label = Engine.CBBHFCGDIC("CLANS/REVOKE_INVITE_TO_CLAN_BUTTON", var_32_2, var_32_3)
	}

	var_32_4.id = "revokeInviteToClan"
	var_32_4.refreshOnAction = true

	function var_32_4.disabledFunc()
		return arg_32_0 == nil
	end

	function var_32_4.action()
		Clans2.CFJCAAHHGE(var_32_0, arg_32_0.currentClientClanId, arg_32_0.xuid)
	end

	return var_32_4
end

local function var_0_16(arg_35_0)
	local var_35_0 = arg_35_0.controllerIndex
	local var_35_1 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CHANGE_RANK")
	}

	var_35_1.id = "changeRank"
	var_35_1.refreshOnAction = true

	function var_35_1.disabledFunc()
		return arg_35_0 == nil
	end

	function var_35_1.action()
		local var_37_0 = arg_35_0.playerData

		var_37_0.xuid = arg_35_0.xuid
		var_37_0.clanId = arg_35_0.clanDetails.clanId
		var_37_0.clanDetails = arg_35_0.clanDetails
		var_37_0.controllerIndex = var_35_0

		CLANS.HandleOpenChangeRoleFlyout(var_37_0)
		DebugPrint(var_37_0)
	end

	return var_35_1
end

local function var_0_17(arg_38_0)
	local var_38_0 = arg_38_0.controllerIndex
	local var_38_1 = Clans2.GFFJCJFIJ(var_38_0, arg_38_0.currentClientClanId)
	local var_38_2 = Engine.JCBDICCAH(var_38_1.clanTag)
	local var_38_3 = Engine.JCBDICCAH(var_38_1.clanName)
	local var_38_4 = {
		label = Engine.CBBHFCGDIC("CLANS/BAN_FROM_CLAN_BUTTON", var_38_2, var_38_3)
	}

	var_38_4.id = "banFromClan"
	var_38_4.refreshOnAction = true

	function var_38_4.disabledFunc()
		return arg_38_0 == nil
	end

	function var_38_4.action()
		local var_40_0 = {
			controllerIndex = var_38_0,
			memberXUID = arg_38_0.xuid,
			clanId = arg_38_0.currentClientClanId,
			gamertag = arg_38_0.playerData.gamerTag or arg_38_0.playerData.name
		}

		LUI.FlowManager.RequestPopupMenu(nil, "BanClanMemberPopup", true, var_38_0, false, var_40_0)
	end

	return var_38_4
end

local function var_0_18(arg_41_0)
	local var_41_0 = arg_41_0.controllerIndex
	local var_41_1 = Clans2.GFFJCJFIJ(var_41_0, arg_41_0.currentClientClanId)
	local var_41_2 = Engine.JCBDICCAH(var_41_1.clanTag)
	local var_41_3 = Engine.JCBDICCAH(var_41_1.clanName)
	local var_41_4 = {
		label = Engine.CBBHFCGDIC("CLANS/UNDO_BAN_BUTTON", var_41_2, var_41_3)
	}

	var_41_4.id = "undoBanFromClan"
	var_41_4.refreshOnAction = true

	function var_41_4.disabledFunc()
		return arg_41_0 == nil
	end

	function var_41_4.action()
		local var_43_0 = {
			controllerIndex = var_41_0,
			memberXUID = arg_41_0.xuid,
			gamertag = arg_41_0.playerData.gamerTag or arg_41_0.playerData.name,
			fullName = arg_41_0.playerData.name
		}

		LUI.FlowManager.RequestPopupMenu(nil, "UnbanClanMemberPopup", false, var_41_0, false, var_43_0, nil, true, true)
	end

	return var_41_4
end

local function var_0_19(arg_44_0)
	local var_44_0 = arg_44_0.controllerIndex
	local var_44_1 = arg_44_0.clanDetails
	local var_44_2 = Engine.JCBDICCAH(var_44_1.clanTag)
	local var_44_3 = Engine.JCBDICCAH(var_44_1.clanName)
	local var_44_4 = {
		label = Engine.CBBHFCGDIC("CLANS/REQUEST_TO_JOIN_CLAN_BUTTON", var_44_2, var_44_3)
	}

	var_44_4.id = "requestToJoinClan"
	var_44_4.refreshOnAction = true

	function var_44_4.disabledFunc()
		return arg_44_0 == nil
	end

	function var_44_4.action()
		Clans2.BCDHJBCEGJ(var_44_0, arg_44_0.clanDetails.clanId)
	end

	return var_44_4
end

local function var_0_20(arg_47_0)
	local var_47_0 = arg_47_0.controllerIndex
	local var_47_1 = arg_47_0.clanDetails
	local var_47_2 = Engine.JCBDICCAH(var_47_1.clanTag)
	local var_47_3 = Engine.JCBDICCAH(var_47_1.clanName)
	local var_47_4 = {
		label = Engine.CBBHFCGDIC("CLANS/JOIN_CLAN_BUTTON", var_47_2, var_47_3)
	}

	var_47_4.id = "joinClan"
	var_47_4.refreshOnAction = true

	function var_47_4.disabledFunc()
		return arg_47_0 == nil
	end

	function var_47_4.action()
		Clans2.BCDHJBCEGJ(var_47_0, arg_47_0.clanDetails.clanId)
	end

	return var_47_4
end

local function var_0_21(arg_50_0)
	local var_50_0 = {
		label = Engine.CBBHFCGDIC("LUA_MENU/CLAN_CHANGE_ROLE")
	}

	var_50_0.id = "changeRole"
	var_50_0.refreshOnAction = true

	function var_50_0.disabledFunc()
		return arg_50_0 == nil
	end

	function var_50_0.action()
		CLANS.HandleOpenChangeRoleFlyout(arg_50_0)
	end

	return var_50_0
end

function CLANS.CLAN_DATA.GetXUIDClanData(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = LUI.FlowManager.GetScopedData(MenuUtils.GetMainMenu())

	if var_53_0 then
		local var_53_1 = var_53_0.clanXuidData
		local var_53_2 = var_53_1 and var_53_1.array or nil

		if not var_53_1 then
			CLANS.CLAN_DATA.ResetClanDataArray()

			var_53_2 = var_53_0.clanXuidData.array
		end

		local var_53_3 = var_0_3(var_53_2, arg_53_1)

		if var_53_3 ~= -1 and var_53_2[var_53_3].lastUpdateTime ~= 0 then
			return var_53_2[var_53_3].clanData
		else
			var_0_9(arg_53_0, arg_53_1, arg_53_2)
		end
	end

	return nil
end

function CLANS.CLAN_DATA.SetAndUpdateElementData(arg_54_0, arg_54_1)
	local var_54_0 = LUI.FlowManager.GetScopedData(MenuUtils.GetMainMenu())

	if var_54_0 then
		local var_54_1 = var_54_0.clanXuidData.array

		if var_54_1 then
			local var_54_2 = arg_54_0 and arg_54_0.memberXuid or var_54_0.clanXuidData.firedXuid
			local var_54_3 = var_0_3(var_54_1, var_54_2)

			if var_54_3 ~= -1 then
				local var_54_4 = var_54_1[var_54_3]

				var_54_4.clanData = arg_54_0
				var_54_4.lastUpdateTime = tonumber(Engine.DEIDGHDBHD())
				var_54_1[var_54_3] = var_54_4
				var_54_0.clanXuidData.array = var_54_1

				if arg_54_0 then
					var_54_4.element:SetClanMemberStatus(arg_54_0)
					Clans2.BJAACDECGE(arg_54_1, arg_54_0.clanId)
				else
					var_54_4.element:ClearClanMemberStatus()
				end
			end

			var_54_0.clanXuidData.fired = false
			var_54_0.clanXuidData.lastFiredTime = 0
			var_54_0.clanXuidData.firedXuid = ""

			var_0_8()
		end
	end
end

function CLANS.CLAN_DATA.AddClanProfile(arg_55_0, arg_55_1)
	local var_55_0 = LUI.FlowManager.GetScopedData(MenuUtils.GetMainMenu())

	if var_55_0 then
		local var_55_1 = var_55_0.clanXuidData.array

		if var_55_1 then
			for iter_55_0, iter_55_1 in pairs(var_55_1) do
				if iter_55_1.clanData and iter_55_1.clanData.clanId == arg_55_1 then
					iter_55_1.clanData.clanProfile = arg_55_0

					break
				end
			end
		end
	end
end

function CLANS.CLAN_DATA.ResetClanDataArray()
	local var_56_0 = LUI.FlowManager.GetScopedData(MenuUtils.GetMainMenu())

	if var_56_0 then
		var_56_0.clanXuidData = {
			fired = false,
			lastFiredTime = 0,
			firedXuid = "",
			array = {}
		}
	end
end

function CLANS.CLAN_DATA.CheckAndRefireProcessArray()
	local var_57_0 = LUI.FlowManager.GetScopedData(MenuUtils.GetMainMenu())

	if var_57_0 and var_57_0.clanXuidData and tonumber(Engine.DEIDGHDBHD()) - var_57_0.clanXuidData.lastFiredTime > CLANS.CLAN_DATA.MAX_UPDATE_WAIT_TIME then
		var_57_0.clanXuidData.fired = false
		var_57_0.clanXuidData.lastFiredTime = 0
		var_57_0.clanXuidData.firedXuid = ""

		if #var_57_0.clanXuidData.array > 0 then
			var_0_8()
		end
	end
end

function CLANS.GetSocialMenuClanButtons(arg_58_0, arg_58_1)
	local var_58_0 = {}

	if arg_58_0.clanDetails then
		table.insert(var_58_0, var_0_14(arg_58_0))
	end

	local var_58_1 = arg_58_1._viewerMemberRole
	local var_58_2 = arg_58_1._targetMemberRole
	local var_58_3 = arg_58_1._isSameClan

	if var_58_1 >= CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER then
		if var_58_3 then
			if not arg_58_1._isBannedFromClan then
				table.insert(var_58_0, var_0_16(arg_58_0))
			end
		elseif not arg_58_1._inviteSent then
			table.insert(var_58_0, var_0_13(arg_58_0))
		else
			table.insert(var_58_0, var_0_15(arg_58_0))
		end
	end

	local var_58_4 = arg_58_0.controllerIndex
	local var_58_5 = Engine.EAGGAEGHHA(var_58_4)

	if CLANS.CanLocalClientManageBans(var_58_4, {
		clanId = arg_58_0.currentClientClanId,
		clientXuid = var_58_5
	}) then
		local var_58_6 = var_58_1 ~= CLANS.CLAN_MEMBER_ROLE.INVLAID_ROLE
		local var_58_7 = var_58_2 ~= CLANS.CLAN_MEMBER_ROLE.INVLAID_ROLE
		local var_58_8 = arg_58_1._isBannedFromClan

		if var_58_8 and var_58_6 then
			table.insert(var_58_0, var_0_18(arg_58_0))
		elseif var_58_3 and not var_58_8 and var_58_2 < var_58_1 and var_58_7 and var_58_6 then
			table.insert(var_58_0, var_0_17(arg_58_0))
		end
	end

	if not var_58_3 and arg_58_0 and arg_58_0.clanDetails then
		local var_58_9 = arg_58_0.clanDetails.clanPrivacyLevel

		if var_58_9 == CLANS.CLAN_PRIVACY_LEVEL.BY_REQUEST then
			table.insert(var_58_0, var_0_19(arg_58_0))
		elseif var_58_9 == CLANS.CLAN_PRIVACY_LEVEL.OPEN then
			table.insert(var_58_0, var_0_20(arg_58_0))
		end
	end

	return var_58_0
end

function CLANS.EMBLEM.GetEmblemForClan(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = CSV.clanEmblemForegroundTable
	local var_59_1 = CSV.clanEmblemBackgroundTable
	local var_59_2 = var_59_0.file
	local var_59_3 = var_59_1.file
	local var_59_4 = arg_59_2 and var_59_0.cols.largeImage or var_59_0.cols.smallImage
	local var_59_5 = StringTable.DIFCHIGDFB(var_59_2, var_59_0.cols.id, arg_59_0, var_59_4)
	local var_59_6 = arg_59_2 and var_59_1.cols.largeImage or var_59_1.cols.smallImage
	local var_59_7 = StringTable.DIFCHIGDFB(var_59_3, var_59_1.cols.id, arg_59_1, var_59_6)

	return {
		_foreground = var_59_5,
		_background = var_59_7
	}
end

function CLANS.EMBLEM.GetEmblemColorForClan(arg_60_0, arg_60_1)
	local var_60_0 = CSV.clanEmblemColors
	local var_60_1 = var_60_0.file
	local var_60_2 = StringTable.DIFCHIGDFB(var_60_1, var_60_0.cols.id, arg_60_0, var_60_0.cols.color)
	local var_60_3 = StringTable.DIFCHIGDFB(var_60_1, var_60_0.cols.id, arg_60_1, var_60_0.cols.color)

	return {
		_foreground = COLORS[var_60_2],
		_background = COLORS[var_60_3]
	}
end

function CLANS.GetIndexForSearchLabel(arg_61_0)
	for iter_61_0 = 1, #CLANS.CLAN_LABEL_KEYS do
		if arg_61_0 == CLANS.CLAN_LABEL_KEYS[iter_61_0] then
			return iter_61_0
		end
	end

	return -1
end

function CLANS.ClanEventHasKey(arg_62_0, arg_62_1)
	for iter_62_0, iter_62_1 in ipairs(arg_62_0) do
		if iter_62_1.key == arg_62_1 then
			return iter_62_0
		end
	end

	return -1
end

function CLANS.GetLabelsFromEvent(arg_63_0)
	local var_63_0 = {}
	local var_63_1 = arg_63_0.keys
	local var_63_2 = CLANS.ClanEventHasKey(var_63_1, CLANS.CLAN_SEARCH_LABEL_KEY)

	if var_63_2 ~= -1 then
		local var_63_3 = var_63_1[var_63_2].values

		for iter_63_0 = 0, #var_63_3 do
			table.insert(var_63_0, var_63_3[iter_63_0])
		end
	end

	return var_63_0
end

function CLANS.ClanRoleChangedToast(arg_64_0, arg_64_1, arg_64_2)
	arg_64_2 = arg_64_2 or ""

	local var_64_0 = {
		[CLANS.CLAN_EVENTS.PROMOTED_TO_OWNER] = {
			displayTime = 3000,
			header = Engine.CBBHFCGDIC("CLANS/PROMOTION"),
			description = Engine.CBBHFCGDIC("CLANS/PROMOTED_TO_OWNER"),
			icon = CLANS.CLAN_DEFAULT_NOTIFICATION_IMAGE
		},
		[CLANS.CLAN_EVENTS.PROMOTED_TO_ADMIN] = {
			displayTime = 3000,
			header = Engine.CBBHFCGDIC("CLANS/PROMOTION"),
			description = Engine.CBBHFCGDIC("CLANS/PROMOTED_TO_ADMIN"),
			icon = CLANS.CLAN_DEFAULT_NOTIFICATION_IMAGE
		},
		[CLANS.CLAN_EVENTS.PROMOTED_TO_OFFICER] = {
			displayTime = 3000,
			header = Engine.CBBHFCGDIC("CLANS/PROMOTION"),
			description = Engine.CBBHFCGDIC("CLANS/PROMOTED_TO_OFFICER"),
			icon = CLANS.CLAN_DEFAULT_NOTIFICATION_IMAGE
		},
		[CLANS.CLAN_EVENTS.DEMOTED_TO_ADMIN] = {
			displayTime = 3000,
			header = Engine.CBBHFCGDIC("CLANS/DEMOTION"),
			description = Engine.CBBHFCGDIC("CLANS/DEMOTED_TO_ADMIN"),
			icon = CLANS.CLAN_DEFAULT_NOTIFICATION_IMAGE
		},
		[CLANS.CLAN_EVENTS.DEMOTED_TO_OFFICER] = {
			displayTime = 3000,
			header = Engine.CBBHFCGDIC("CLANS/DEMOTION"),
			description = Engine.CBBHFCGDIC("CLANS/DEMOTED_TO_OFFICER"),
			icon = CLANS.CLAN_DEFAULT_NOTIFICATION_IMAGE
		},
		[CLANS.CLAN_EVENTS.DEMOTED_TO_MEMBER] = {
			displayTime = 3000,
			header = Engine.CBBHFCGDIC("CLANS/DEMOTION"),
			description = Engine.CBBHFCGDIC("CLANS/DEMOTED_TO_MEMBER"),
			icon = CLANS.CLAN_DEFAULT_NOTIFICATION_IMAGE
		},
		[CLANS.CLAN_EVENTS.KICKED] = {
			displayTime = 3000,
			description = Engine.CBBHFCGDIC("CLANS/KICKED_DESC", Engine.JCBDICCAH(arg_64_2)),
			icon = CLANS.CLAN_DEFAULT_NOTIFICATION_IMAGE
		}
	}

	arg_64_0:processEvent({
		name = "send_toast_notification",
		immediate = true,
		options = var_64_0[arg_64_1]
	})
end

function CLANS.ClanInvitationToast(arg_65_0)
	local var_65_0 = Engine.DBFFAEEFGJ()

	CLANS.DispatchClanNotification(var_65_0, arg_65_0, "")
end

function CLANS.DisplayClanMemberStatus(arg_66_0, arg_66_1, arg_66_2, arg_66_3)
	if arg_66_3 == nil then
		if arg_66_0 then
			arg_66_0:SetAlpha(0)
		end

		if arg_66_1 then
			arg_66_1:SetAlpha(0)
		end

		return
	end

	local var_66_0 = arg_66_3.clanId
	local var_66_1 = arg_66_3.clanTag
	local var_66_2 = arg_66_3.memberXuid
	local var_66_3 = Clans2.CFDHGBFICH(arg_66_2, var_66_0, var_66_2)
	local var_66_4 = CLANS.GetClanMemberRoleIconByRole(var_66_3)

	if var_66_4 then
		if arg_66_0 then
			arg_66_0:setText(Engine.CBBHFCGDIC(var_66_4.roleText, Engine.JCBDICCAH("[" .. var_66_1 .. "]")))
			arg_66_0:SetAlpha(1)
		end

		if arg_66_1 then
			arg_66_1:setImage(RegisterMaterial(var_66_4.icon))
			arg_66_1:SetAlpha(1)
		end
	else
		if arg_66_0 then
			arg_66_0:SetAlpha(0)
		end

		if arg_66_1 then
			arg_66_1:SetAlpha(0)
		end
	end
end

function CLANS.HandleOpenChangeRoleFlyout(arg_67_0)
	local var_67_0 = arg_67_0.controllerIndex

	if Engine.EAGGAEGHHA(var_67_0) == arg_67_0.xuid then
		return
	end

	local var_67_1 = MenuBuilder.BuildRegisteredType("ClanChangeRankFlyout", {
		controllerIndex = var_67_0,
		playerData = arg_67_0
	})

	LUI.FlowManager.RequestLeaveMenuByName("FlyInPopup", true, true)
	LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, var_67_0, false, {
		widget = var_67_1
	})
end

function CLANS.GetClanErrorMessageRaw(arg_68_0)
	return CLANS.ClanFailureReasonLocalizationKey[arg_68_0] or "CLANS/CLAN_GENERIC_ERROR"
end

function CLANS.GetClanErrorMessage(arg_69_0)
	return Engine.CBBHFCGDIC(CLANS.GetClanErrorMessageRaw(arg_69_0))
end

function CLANS.GetClanData(arg_70_0, arg_70_1, arg_70_2)
	local var_70_0

	arg_70_1 = arg_70_1 or Clans2.CFGBBBHFHB(arg_70_0)

	if arg_70_1 and arg_70_1 ~= CLANS.INVALID_CLAN_ID_STRING then
		var_70_0 = Clans2.GFFJCJFIJ(arg_70_0, arg_70_1)
	end

	local var_70_1 = arg_70_2 and arg_70_2.labels or nil

	if var_70_0 then
		var_70_0.labels = var_70_1
	end

	return var_70_0
end

function CLANS.GetClanName(arg_71_0)
	local var_71_0 = CLANS.GetClanDetails(arg_71_0)

	if var_71_0 then
		return var_71_0.clanName
	end

	return ""
end

function CLANS.GetClan2Name(arg_72_0)
	local var_72_0 = Clans2.CFGBBBHFHB(arg_72_0)

	if var_72_0 then
		local var_72_1 = Clans2.GFFJCJFIJ(arg_72_0, var_72_0)

		if var_72_1 then
			return var_72_1.clanName
		end
	end

	return ""
end

function CLANS.GetClanOwnerPlayerData(arg_73_0, arg_73_1)
	local var_73_0

	if Engine.EAGGAEGHHA(arg_73_0) == arg_73_1.clanOwner then
		local var_73_1 = PROGRESSION.GetPlayerProgressionData({
			_controllerIndex = arg_73_0
		})

		var_73_0 = {
			_rank = var_73_1._rankDisplay,
			_rankIcon = var_73_1._rankIcon,
			_gamerTag = Engine.BAGAFBABEE(arg_73_0),
			_clanTag = arg_73_1.clanTag,
			_prestigeMasterColor = var_73_1._prestigeMasterColor
		}
	else
		local var_73_2 = Friends.HCAFBJBHC(arg_73_0, arg_73_1.clanOwner)

		if var_73_2 then
			var_73_0 = {
				_rank = var_73_2.rank,
				_rankIcon = PROGRESSION.GetMilitaryRankIcon(var_73_2.rank),
				_gamerTag = var_73_2.fullNameWithHash,
				_clanTag = arg_73_1.clanTag,
				_prestigeMasterColor = PROGRESSION.SEASONAL_PROGRESSION_COLOR
			}
		end
	end

	return var_73_0
end

function CLANS.GetClanMemberRoleIconByRole(arg_74_0)
	if arg_74_0 == CLANS.CLAN_MEMBER_ROLE.CLAN_MEMBER then
		return {
			roleText = "LUA_MENU/CLAN_MEMBER",
			icon = CLANS.CLAN_MEMBER_ROLE_ICONS.CLAN_MEMBER
		}
	elseif arg_74_0 == CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER then
		return {
			roleText = "LUA_MENU/CLAN_OFFICER",
			icon = CLANS.CLAN_MEMBER_ROLE_ICONS.CLAN_OFFICER
		}
	elseif arg_74_0 == CLANS.CLAN_MEMBER_ROLE.CLAN_ADMIN then
		return {
			roleText = "LUA_MENU/CLAN_ADMIN",
			icon = CLANS.CLAN_MEMBER_ROLE_ICONS.CLAN_ADMIN
		}
	elseif arg_74_0 == CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER then
		return {
			roleText = "LUA_MENU/CLAN_OWNER",
			icon = CLANS.CLAN_MEMBER_ROLE_ICONS.CLAN_OWNER
		}
	end

	return nil
end

function CLANS.GetClanMembersScreenActions(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = {}

	if arg_75_1 ~= CLANS.CLAN_MEMBER_ROLE.CLAN_MEMBER then
		if arg_75_0 == CLANS.CLAN_TAB_IDs.MEMBERS then
			table.insert(var_75_0, var_0_21(arg_75_2))
		elseif arg_75_0 == CLANS.CLAN_TAB_IDs.OUTGOING_INVITES then
			table.insert(var_75_0, var_0_12(arg_75_2))
		elseif arg_75_0 == CLANS.CLAN_TAB_IDs.INCOMING_REQUESTS then
			table.insert(var_75_0, var_0_10(arg_75_2))
			table.insert(var_75_0, var_0_11(arg_75_2))
		end
	end

	return var_75_0
end

function CLANS.GetSocialMenuScreenActions(arg_76_0)
	local var_76_0 = arg_76_0.controllerIndex
	local var_76_1 = arg_76_0.clanDetails
	local var_76_2 = arg_76_0.xuid
	local var_76_3 = arg_76_0.playerData
	local var_76_4 = Clans2.CFGBBBHFHB(var_76_0)

	arg_76_0.currentClientClanId = var_76_4

	local var_76_5 = Engine.EAGGAEGHHA(var_76_0)
	local var_76_6 = CLANS.IsValidId(var_76_4) and Clans2.CFDHGBFICH(var_76_0, var_76_4, var_76_5) or CLANS.CLAN_MEMBER_ROLE.INVLAID_ROLE
	local var_76_7 = CLANS.IsValidId(var_76_4) and Clans2.CFDHGBFICH(var_76_0, var_76_4, var_76_2) or CLANS.CLAN_MEMBER_ROLE.INVLAID_ROLE
	local var_76_8 = CLANS.IsValidId(var_76_4) and var_76_1 and var_76_4 == var_76_1.clanId or false
	local var_76_9 = false
	local var_76_10 = false

	if CLANS.IsValidId(var_76_4) then
		local var_76_11 = Clans2.BJJADIBFB(var_76_0, var_76_4) or {}

		for iter_76_0 = 1, #var_76_11 do
			if var_76_11[iter_76_0].xuid == var_76_2 then
				var_76_9 = true

				break
			end
		end

		local var_76_12 = Clans2.BBCCCBDAGJ(var_76_0, var_76_4) or {}

		for iter_76_1 = 1, #var_76_12 do
			if var_76_12[iter_76_1].xuid == var_76_2 then
				var_76_10 = true

				break
			end
		end
	end

	local var_76_13 = {
		_viewerMemberRole = var_76_6,
		_targetMemberRole = var_76_7,
		_isSameClan = var_76_8,
		_inviteSent = var_76_9,
		_isBannedFromClan = var_76_10
	}

	return CLANS.GetSocialMenuClanButtons(arg_76_0, var_76_13)
end

function CLANS.IsRemoveCosmeticsEvent(arg_77_0)
	if var_0_0(CLANS.CLAN_REMOVE_CLAN_COSMETICS_EVENTS, arg_77_0) then
		return true
	end

	return false
end

function CLANS.GetRoleChangeEventData(arg_78_0)
	return CLANS.CLANS_MEMBER_STATUS_CHANGED_NOTIFICATION[arg_78_0]
end

function CLANS.IsInClan(arg_79_0)
	local var_79_0 = Clans2.CFGBBBHFHB(arg_79_0)

	return CLANS.IsValidId(var_79_0)
end

function CLANS.IsClanInvitePending(arg_80_0, arg_80_1, arg_80_2)
	local var_80_0 = Clans2.BJJADIBFB(arg_80_0, arg_80_1)

	for iter_80_0, iter_80_1 in ipairs(var_80_0) do
		if iter_80_1.xuid == arg_80_2 then
			return true
		end
	end

	return false
end

function CLANS.IsPlayerBannedFromMyClan(arg_81_0, arg_81_1)
	local var_81_0 = Clans2.BBCCCBDAGJ(arg_81_0)

	if var_81_0 then
		for iter_81_0, iter_81_1 in ipairs(var_81_0) do
			if iter_81_1.xuid == arg_81_1 then
				return true
			end
		end
	end

	return false
end

function CLANS.IsClanInactive(arg_82_0)
	return arg_82_0.numClanMembers <= CLANS.MIN_NUM_CLAN_MEMBERS
end

function CLANS.IsClanDescriptionEnabled()
	return Dvar.IBEGCHEFE("NPTNPQTMOL") ~= true
end

function CLANS.IsValidId(arg_84_0)
	return arg_84_0 ~= nil and arg_84_0 ~= CLANS.INVALID_CLAN_ID_STRING and arg_84_0 ~= CLANS.INVALID_CLAN_ID_NUMBER
end

local function var_0_22(arg_85_0)
	local var_85_0 = #arg_85_0

	while var_85_0 > 0 and arg_85_0:find("^%s", var_85_0) do
		var_85_0 = var_85_0 - 1
	end

	return arg_85_0:sub(1, var_85_0)
end

function CLANS.IsValidClanName(arg_86_0, arg_86_1)
	local var_86_0 = true
	local var_86_1 = ""

	if not arg_86_1 or #arg_86_1 == 0 or #arg_86_1 > CLANS.MAX_NAME_LENGTH then
		var_86_0 = false
	end

	if not Engine.HEIIHIEH(arg_86_1) then
		var_86_1 = Engine.CBBHFCGDIC("CLANS/DIGITS_RESTRICTION_ERROR", FRIENDS.MAX_DIGITS_IN_CLAN_NAME)
		var_86_0 = false
	end

	local var_86_2 = OSK.CJAFGACAFH(arg_86_0, arg_86_1)

	if var_86_2 and #var_86_2 > 0 then
		var_86_1 = Engine.CBBHFCGDIC(var_86_2)
		var_86_0 = false
	end

	if #var_0_22(arg_86_1) <= 0 then
		var_86_1 = Engine.CBBHFCGDIC("CLANS/CLAN_NAME_ERROR")
		var_86_0 = false
	end

	return {
		valid = var_86_0,
		error = var_86_1
	}
end

function CLANS.IsValidClanTag(arg_87_0, arg_87_1)
	local var_87_0 = true
	local var_87_1 = ""

	if not arg_87_1 or #arg_87_1 == 0 or #arg_87_1 > CLANS.MAX_TAG_LENGTH then
		var_87_0 = false
	end

	local var_87_2 = OSK.ECFHGIGFCI(arg_87_0, arg_87_1)

	if var_87_2 and #var_87_2 > 0 then
		var_87_1 = Engine.CBBHFCGDIC(var_87_2)
		var_87_0 = false
	end

	return {
		valid = var_87_0,
		error = var_87_1
	}
end

function CLANS.IsValidClanNameAndTag(arg_88_0, arg_88_1, arg_88_2)
	local var_88_0 = arg_88_2 .. arg_88_1
	local var_88_1 = arg_88_1 .. arg_88_2
	local var_88_2 = OSK.CJAFGACAFH(arg_88_0, var_88_0)
	local var_88_3 = OSK.CJAFGACAFH(arg_88_0, var_88_1)

	return #var_88_2 <= 0 and #var_88_3 <= 0
end

function CLANS.IsValidClanDescription(arg_89_0, arg_89_1)
	local var_89_0 = true
	local var_89_1 = ""

	if not arg_89_1 or #arg_89_1 == 0 then
		var_89_0 = false
	end

	if not Engine.HEIIHIEH(arg_89_1) then
		var_89_1 = Engine.CBBHFCGDIC("CLANS/DIGITS_RESTRICTION_ERROR", FRIENDS.MAX_DIGITS_IN_CLAN_NAME)
		var_89_0 = false
	end

	local var_89_2 = OSK.CJAFGACAFH(arg_89_0, arg_89_1)

	if var_89_2 and #var_89_2 > 0 then
		var_89_1 = Engine.CBBHFCGDIC(var_89_2)
		var_89_0 = false
	end

	if #var_0_22(arg_89_1) <= 0 then
		var_89_1 = Engine.CBBHFCGDIC("CLANS/CLAN_DESC_ERROR")
		var_89_0 = false
	end

	return {
		valid = var_89_0,
		error = var_89_1
	}
end

function CLANS.CanLocalClientManageBans(arg_90_0, arg_90_1)
	local var_90_0 = arg_90_1 and arg_90_1.clanId
	local var_90_1 = arg_90_1 and arg_90_1.clientXuid
	local var_90_2 = var_90_0 and arg_90_1.clanId or Clans2.CFGBBBHFHB(arg_90_0)
	local var_90_3 = var_90_1 and arg_90_1.clientXuid or Engine.EAGGAEGHHA(arg_90_0)

	if CLANS.IsValidId(var_90_2) then
		local var_90_4 = Clans2.CFDHGBFICH(arg_90_0, var_90_2, var_90_3)

		return var_90_4 and var_90_4 >= CLANS.CLAN_MEMBER_ROLE.CLAN_ADMIN or false
	end

	return false
end

function CLANS.BanMemberFromClan(arg_91_0, arg_91_1, arg_91_2)
	assert(arg_91_2)
	assert(arg_91_2.clanId)
	assert(arg_91_2.memberXUID)
	Clans2.BBGIFFJJC(arg_91_1, arg_91_2.clanId, arg_91_2.memberXUID)
	CLANS.DispatchClanNotification(arg_91_0, Engine.CBBHFCGDIC("CLANS/USER_IS_BANNED_ERROR"), arg_91_2.gamertag and Engine.JCBDICCAH(arg_91_2.gamertag))

	if arg_91_2.leaveMenu and #arg_91_2.leaveMenu > 0 then
		LUI.FlowManager.RequestLeaveMenuByName(arg_91_2.leaveMenu, true, true)
	end
end

function CLANS.UnbanMemberFromClan(arg_92_0, arg_92_1, arg_92_2, arg_92_3)
	if Clans2.BCBCAGDBAC(arg_92_1, arg_92_2) then
		CLANS.DispatchClanNotification(arg_92_0, Engine.CBBHFCGDIC("CLANS/USER_IS_UNBANNED"), arg_92_3 and Engine.JCBDICCAH(arg_92_3))
	else
		CLANS.DispatchClanNotification(arg_92_0, Engine.CBBHFCGDIC("CLANS/FAILED_BAN"), "")
	end
end

function CLANS.AcceptClanInvite(arg_93_0, arg_93_1)
	if Clans2.CFGBBBHFHB(arg_93_1) then
		LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_93_1, false, {
			message = Engine.CBBHFCGDIC("CLANS/ALREADY_IN_CLAN_POPUP")
		})

		return false
	else
		local var_93_0 = Clans2.IEHDGEGJC(arg_93_1, arg_93_0.clanId)

		if var_93_0 then
			local var_93_1 = Engine.CBBHFCGDIC("CLANS/INVITE_ACCEPTED")

			CLANS.ClanInvitationToast(var_93_1)
		else
			LUI.FlowManager.RequestErrorPopup("CLANS/ERROR_HEADER", "CLANS/ACCEPT_INVITE_FAIL")
		end

		return var_93_0
	end
end

function CLANS.DenyClanInvite(arg_94_0, arg_94_1)
	local var_94_0 = Clans2.DJIFJAAFAI(arg_94_1, arg_94_0.clanId)

	if var_94_0 then
		local var_94_1 = Engine.CBBHFCGDIC("CLANS/INVITE_DECLINED")

		CLANS.ClanInvitationToast(var_94_1)
	else
		LUI.FlowManager.RequestErrorPopup("CLANS/ERROR_HEADER", "CLANS/FAILED_TO_DECLINE_INVITE")
	end

	return var_94_0
end

function CLANS.RevokeClanInvite(arg_95_0, arg_95_1)
	local var_95_0 = Clans2.CFJCAAHHGE(arg_95_1, arg_95_0.clanId)

	if var_95_0 then
		local var_95_1 = Engine.CBBHFCGDIC("CLANS/INVITE_REVOKED")

		CLANS.ClanInvitationToast(var_95_1)
	else
		LUI.FlowManager.RequestErrorPopup("CLANS/ERROR_HEADER", "CLANS/FAILED_TO_REVOKE_INVITE")
	end

	return var_95_0
end

function CLANS.AcceptInviteRequest(arg_96_0, arg_96_1)
	local var_96_0 = Clans2.CCEDAFJIJB(arg_96_1, arg_96_0.clanId, arg_96_0.xuid)

	if var_96_0 then
		local var_96_1 = Engine.CBBHFCGDIC("CLANS/REQUEST_APPROVED")

		CLANS.ClanInvitationToast(var_96_1)
	else
		LUI.FlowManager.RequestErrorPopup("CLANS/ERROR_HEADER", "CLANS/FAILED_TO_ACCEPT_REQUEST")
	end

	return var_96_0
end

function CLANS.DeclineClanInviteRequest(arg_97_0, arg_97_1)
	local var_97_0 = Clans2.HCIEFIFAH(arg_97_1, arg_97_0.clanId, arg_97_0.xuidString)

	if var_97_0 then
		local var_97_1 = Engine.CBBHFCGDIC("CLANS/REQUEST_DENIED")

		CLANS.ClanInvitationToast(var_97_1)
	else
		LUI.FlowManager.RequestErrorPopup("CLANS/ERROR_HEADER", "CLANS/FAILED_TO_DECLINE_REQUEST")
	end

	return var_97_0
end

function CLANS.RevokeClanInviteRequest(arg_98_0, arg_98_1)
	local var_98_0 = Clans2.BAIFHIBCJH(arg_98_1, arg_98_0.clanId)

	if var_98_0 then
		local var_98_1 = Engine.CBBHFCGDIC("CLANS/REQUEST_REVOKED")

		CLANS.ClanInvitationToast(var_98_1)
	else
		LUI.FlowManager.RequestErrorPopup("CLANS/ERROR_HEADER", "CLANS/FAILED_TO_REVOKE_REQUEST")
	end

	return var_98_0
end

function CLANS.FetchExternalClanData(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_1.clanId or nil
	local var_99_1 = arg_99_1.memberXuid or nil
	local var_99_2 = Clans2.BJAACDECGE(arg_99_0, var_99_0)

	if var_99_2 and var_99_1 then
		var_99_2 = Clans2.IBJFIGED(arg_99_0, var_99_1)
	end

	var_99_2 = var_99_2 and Clans2.BJFEDEICAC(arg_99_0, var_99_0)

	return var_99_2
end

function CLANS.DispatchClanNotification(arg_100_0, arg_100_1, arg_100_2, arg_100_3)
	local var_100_0 = {
		displayTime = 3000,
		icon = arg_100_3 or CLANS.CLAN_DEFAULT_NOTIFICATION_IMAGE,
		header = arg_100_1,
		description = arg_100_2,
		type = LUI.ToastManager.NotificationType.Clans
	}

	arg_100_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_100_0
	})
end

function CLANS.RemoveClanCosmetics(arg_101_0)
	Engine.BJHHJHIEHF(arg_101_0, LOOT.EmblemType.CUSTOM)
	Engine.GGIHFEAGD(arg_101_0, ClanTagType.CUSTOM)
	Playercard.DAHDCGCDEC(arg_101_0)
	Playercard.DAIIIAHAHH(arg_101_0, PlayerTitleUtils.DefaultTitleID)
	Playercard.BCEECAFBBG(arg_101_0, CallingCardFramesUtils.DefaultCardID)
	Playercard.FCBJJBFBJ(arg_101_0)
end
