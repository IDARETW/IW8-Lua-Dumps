LUI.ToastManager = LUI.Class(LUI.UIElement)
LUI.ToastManager.NotificationType = {
	ReticleEquipped = 13,
	WeaponEquipped = 1,
	StreakEquipped = 18,
	PlayerCardEquipped = 10,
	OperatorEquipped = 3,
	SprayEquipped = 19,
	EquipmentEquipped = 6,
	FieldUpgradeMenu = 17,
	CamoEquipped = 12,
	WatchEquipped = 9,
	StickerEquipped = 15,
	FavoriteSuperfactionEquipped = 20,
	TauntEquipped = 24,
	AchievementUnlocked = 25,
	DoubleXPNotifications = 27,
	LoadoutOptions = 26,
	QuickPlayFilterEquipped = 21,
	InputLocked = 28,
	RoleEquipped = 5,
	MissionChallenges = 29,
	GestureEquipped = 16,
	MunitionEquipped = 4,
	CoDCasterPreset = 30,
	AttachmentEquipped = 2,
	PerkEquipped = 7,
	EmblemEquipped = 11,
	Tournament = 22,
	ExecutionEquipped = 23,
	SkinEquipped = 8,
	CharmEquipped = 14,
	None = 0
}
LUI.ToastManager.MaxQueuedNotifications = 10

function LUI.ToastManager.GetInstance()
	local var_1_0 = Engine.DBFFAEEFGJ()

	assert(var_1_0)

	local var_1_1 = var_1_0.toastManager

	assert(var_1_1)

	return var_1_1
end

function LUI.ToastManager.init(arg_2_0, arg_2_1)
	LUI.ToastManager.super.init(arg_2_0)

	arg_2_0.id = "ToastNotificationManager"

	assert(arg_2_1.controllerIndex)

	arg_2_0._controllerIndex = arg_2_1.controllerIndex
end

function LUI.ToastManager.InitLayer(arg_3_0)
	arg_3_0.notificationWidth = 500
	arg_3_0.notificationHeight = 115
	arg_3_0.resizeAnimationTime = 200
	arg_3_0.maxNotifications = 3
	arg_3_0.currentNotifications = 0
	arg_3_0.currentPendingNotifications = 0
	arg_3_0.notificationQueue = {}
	arg_3_0.pendingNotificationQueue = {}
	arg_3_0.currentNotificationOptions = nil
	arg_3_0.handleGamepadInputs = true

	local var_3_0 = 80

	arg_3_0.buttonLeftForCallback = "button_alt1"
	arg_3_0.buttonRightForCallback = "button_left_stick"

	local var_3_1 = LUI.UIVerticalList.new()

	var_3_1.id = "RightVerticalList"

	var_3_1:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -arg_3_0.notificationWidth, 0, _1080p * var_3_0, 0)
	arg_3_0:addElement(var_3_1)

	arg_3_0.feed = var_3_1

	arg_3_0:registerEventHandler("send_toast_notification", function(arg_4_0, arg_4_1)
		return arg_4_0:CreateToastNotification(arg_4_1.options)
	end)
	arg_3_0:registerEventHandler("gamepad_button", function(arg_5_0, arg_5_1)
		if arg_5_0.handleGamepadInputs then
			return arg_5_0:HandleButtonPressed(arg_5_1)
		end
	end)
	arg_3_0:addEventHandler("non_empty_menu_stack", function(arg_6_0, arg_6_1)
		if CONDITIONS.InGame() then
			local var_6_0 = arg_6_0.currentNotificationOptions

			if var_6_0 then
				var_6_0.ToOptionsPrompt = false

				if arg_6_0.callbackToast then
					arg_6_0.handleGamepadInputs = true

					arg_6_0.callbackToast:SetGraphics(var_6_0)

					if arg_6_0.callbackToast._isNotificationWithCallbackOnScreen then
						arg_6_0.callbackToast.ToastNotification.MenuButtonLeft:SetHandleMouse(true)
						arg_6_0.callbackToast.ToastNotification.MenuButtonRight:SetHandleMouse(true)

						arg_6_0.handleGamepadInputs = true
					end

					return
				end

				arg_6_0:ProcessPendingNotification()
			end
		end
	end)
	arg_3_0:addEventHandler("empty_menu_stack", function(arg_7_0, arg_7_1)
		if CONDITIONS.InGame() then
			local var_7_0 = arg_7_0.currentNotificationOptions

			if var_7_0 and arg_7_0.callbackToast then
				if Engine.BECCFCBIAA("gpadEnabled", arg_7_0._controllerIndex) then
					arg_7_0.callbackToast:HideNotification()

					arg_7_0.handleGamepadInputs = false
				else
					arg_7_0.callbackToast:SetGraphics(var_7_0)
				end
			end
		end
	end)
	arg_3_0:registerEventHandler("kbm_notification_prompt_answer", function(arg_8_0, arg_8_1)
		if LUI.IsLastInputKeyboardMouse(arg_8_0._controllerIndex) then
			local var_8_0 = arg_8_0.currentNotificationOptions

			if var_8_0 and arg_8_0.callbackToast then
				if arg_8_1.answer then
					var_8_0.callback()
				end

				arg_8_0:RemoveNotification(arg_8_0.callbackToast)
			end
		end
	end)
	arg_3_0:addEventHandler("exchanged_item", function(arg_9_0, arg_9_1)
		if Engine.DDJFBBJAIG() and not STORE.IsTitleID(arg_9_1.exchangeID) and (not Dvar.IBEGCHEFE("RNRNSRTNQ") or not CONDITIONS.IsMenuInStack("MagmaUpsellFullScreenPopup")) then
			local var_9_0 = StringTable.DIFCHIGDFB(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, arg_9_1.exchangeID, CSV.dlcIDs.cols.shouldShowPopup)

			if #var_9_0 > 0 and tonumber(var_9_0) == 1 then
				if CONDITIONS.IsMenuInStack("ItemExchangePopup") then
					local var_9_1 = LUI.FlowManager.GetScopedData("ItemExchangePopup")

					if not var_9_1.itemQueue then
						var_9_1.itemQueue = LUI.CreateQueue()
					end

					var_9_1.itemQueue:Push(arg_9_1.exchangeID)
				else
					LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangePopup", false, arg_9_0._controllerIndex, false, {
						itemID = arg_9_1.exchangeID
					})
				end
			end
		end
	end)
	arg_3_0:addEventHandler("exchanged_item_failed", function(arg_10_0, arg_10_1)
		if Engine.DDJFBBJAIG() and arg_10_1.fromSignIn == false then
			LUI.FlowManager.RequestLeaveMenuByName("ItemExchangeFencePopup")
			LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangeFailedPopup", false, arg_10_0._controllerIndex, false)
		end
	end)
	arg_3_0:addEventHandler("ingamestore_purchased_product", function(arg_11_0, arg_11_1)
		assert(arg_11_1.transactionResult)

		if Engine.DDJFBBJAIG() and arg_11_1.transactionResult == STORE.TransactionResult.TRANSACTION_CANCELLED then
			LUI.FlowManager.RequestLeaveMenuByName("ItemExchangeFencePopup")
		end
	end)
	arg_3_0:registerEventHandler("clans_notification", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.options

		if var_12_0.success then
			if var_12_0.genEventName == "clans_promoted_to_owner" or var_12_0.genEventName == "clans_promoted_to_officer" or var_12_0.genEventName == "clans_demoted_to_member" or var_12_0.genEventName == "clans_demoted_to_officer" or var_12_0.genEventName == "clans_kicked_from_clan" then
				FRIENDS.RegimentRoleChangedToast(arg_12_0, var_12_0.genEventName, var_12_0.clanName)
			else
				local var_12_1 = {
					description = "",
					icon = "hud_info_alert",
					displayTime = 3000,
					header = Engine.CBBHFCGDIC("MENU/NOTICE")
				}

				if var_12_0.genEventName == "clans_happy_hour_updated" then
					if var_12_0.clanId == Clans.CFGBBBHFHB(arg_12_0._controllerIndex) then
						var_12_1.description = FRIENDS.GetHappyHourSetTimeString(arg_12_0._controllerIndex, var_12_0.clanId)
					end
				elseif var_12_0.genEventName == "clans_happy_hour_start" then
					var_12_1.description = Engine.CBBHFCGDIC("REGIMENTS/HAPPY_HOUR_START")
				elseif var_12_0.genEventName == "clans_happy_hour_end" then
					var_12_1.description = Engine.CBBHFCGDIC("REGIMENTS/HAPPY_HOUR_END")
				end

				if var_12_1.description ~= "" then
					arg_12_0:processEvent({
						name = "send_toast_notification",
						immediate = true,
						options = var_12_1
					})
				end
			end
		end
	end)
end

function LUI.ToastManager.CloseLists(arg_13_0)
	if arg_13_0.feed then
		arg_13_0.feed:closeTree()

		arg_13_0.feed = nil
	end
end

function LUI.ToastManager.ClearLayer(arg_14_0)
	arg_14_0:CloseLists()
	arg_14_0:closeChildren()
end

function LUI.ToastManager.CloseToastOfType(arg_15_0, arg_15_1)
	arg_15_0:RemoveQueuedNotificationsOfType(arg_15_1)

	if arg_15_0.feed then
		local var_15_0 = arg_15_0.feed:getFirstChild()

		while var_15_0 do
			local var_15_1 = var_15_0:getNextSibling()

			if var_15_0._notificationType == arg_15_1 then
				arg_15_0:RemoveNotification(var_15_0)
			end

			var_15_0 = var_15_1
		end
	end
end

function LUI.ToastManager.ProcessInputEvent(arg_16_0, arg_16_1)
	local var_16_0 = false
	local var_16_1 = arg_16_0.m_eventHandlers[arg_16_1.name]

	if var_16_1 then
		var_16_0 = var_16_1(arg_16_0, arg_16_1)
	end

	if arg_16_1.name == "mousemove" or arg_16_1.name == "mousedown" or arg_16_1.name == "mouseup" then
		return false
	end

	return var_16_0
end

function LUI.ToastManager.processEvent(arg_17_0, arg_17_1)
	if not arg_17_1.name == "non_empty_menu_stack" and not arg_17_0.activeCallbackFunc then
		return
	end

	if IsInputEvent(arg_17_1.name) then
		return arg_17_0:ProcessInputEvent(arg_17_1)
	else
		return LUI.ToastManager.super.processEvent(arg_17_0, arg_17_1)
	end
end

function LUI.ToastManager.ShouldBeVisible(arg_18_0)
	return true
end

local var_0_0 = 30000
local var_0_1 = 3000

local function var_0_2(arg_19_0)
	arg_19_0.icon = "hud_icon_player"
	arg_19_0.description = Engine.CBBHFCGDIC("MENU/INVITE_RECEIVED")
	arg_19_0.header = arg_19_0.senderName
	arg_19_0.displayTime = var_0_0
	arg_19_0.buttonPromptLeft = Engine.CBBHFCGDIC("PLATFORM/ACCEPT_INVITE")
	arg_19_0.persistent = true
	arg_19_0.useBnetFont = true

	function arg_19_0.callback()
		local function var_20_0()
			if CONDITIONS.IsInGameBattlesMatch() then
				Engine.DBFFAEEFGJ():dispatchEventToRoot({
					immediate = true,
					name = "gamebattles_social_leave_menu"
				})
			end

			Invitation.DHACFECHAG(arg_19_0.invitationID)
		end

		FRIENDS.TryJoinUserParty(var_20_0)
	end
end

local function var_0_3(arg_22_0)
	if Engine.DBFCJBDJEC() then
		var_0_2(arg_22_0)
	end
end

local function var_0_4(arg_23_0)
	arg_23_0.icon = "hud_icon_player"
	arg_23_0.description = Engine.CBBHFCGDIC("MENU/POPUP_INVITE_SENT")
	arg_23_0.header = Engine.CBBHFCGDIC("MENU/POPUP_INVITE_SENT")
	arg_23_0.displayTime = var_0_1
end

local function var_0_5(arg_24_0)
	arg_24_0.icon = "hud_icon_player"
	arg_24_0.displayTime = var_0_1

	if arg_24_0.success then
		arg_24_0.description = Engine.CBBHFCGDIC("LUA_MENU/REQUEST_ACCEPT_SUCCESS")
	else
		arg_24_0.description = Engine.CBBHFCGDIC("LUA_MENU/REQUEST_ACCEPT_FAILED")
	end
end

local var_0_6 = {
	friendInviteSent = "pcPlayerInviteSent",
	playerInvite = "pcPlayerInvite",
	acceptFriendComplete = "pcAcceptFriendComplete"
}
local var_0_7 = {
	[var_0_6.playerInvite] = var_0_3,
	[var_0_6.friendInviteSent] = var_0_4,
	[var_0_6.acceptFriendComplete] = var_0_5
}

local function var_0_8(arg_25_0)
	arg_25_0.icon = "hud_icon_player"
	arg_25_0.description = Engine.CBBHFCGDIC("MENU/INVITE_RECEIVED")
	arg_25_0.header = arg_25_0.senderName
	arg_25_0.displayTime = var_0_0
	arg_25_0.buttonPromptLeft = Engine.CBBHFCGDIC("PLATFORM/ACCEPT_INVITE")
	arg_25_0.persistent = true
	arg_25_0.useBnetFont = true

	function arg_25_0.callback()
		if CONDITIONS.IsInGameBattlesMatch() then
			Engine.DBFFAEEFGJ():dispatchEventToRoot({
				immediate = true,
				name = "gamebattles_social_leave_menu"
			})
		end

		Invitation.DHACFECHAG(arg_25_0.invitationID)
	end
end

local var_0_9 = {
	playerInvite = "dwPlayerInvite"
}
local var_0_10 = {
	[var_0_9.playerInvite] = var_0_8
}

local function var_0_11(arg_27_0)
	arg_27_0.description = Engine.CBBHFCGDIC("LUA_MENU/KOREA_OVER_INDULGENCE_DESCRIPTION", arg_27_0.hours)
	arg_27_0.displayTime = 4000
end

local function var_0_12(arg_28_0)
	arg_28_0.icon = "hud_icon_player"
	arg_28_0.displayTime = var_0_1

	if arg_28_0.success then
		arg_28_0.description = Engine.CBBHFCGDIC("LUA_MENU/REQUEST_SENT_SUCCESS")
	else
		local var_28_0 = arg_28_0.errorCode or FRIENDS.AddFriendErrorCode.GENERAL

		arg_28_0.description = Engine.CBBHFCGDIC(FRIENDS.ErrorCodeToDesc[var_28_0])
	end
end

local function var_0_13(arg_29_0)
	arg_29_0.icon = "hud_icon_player"
	arg_29_0.description = Engine.CBBHFCGDIC("LUA_MENU/FRIEND_REQUEST_RECEIVED")
	arg_29_0.header = arg_29_0.friendName
	arg_29_0.displayTime = var_0_0
	arg_29_0.buttonPromptLeft = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST")
	arg_29_0.persistent = true
	arg_29_0.useBnetFont = true

	function arg_29_0.callback()
		if LUI.FlowManager.IsInStack("SocialMenu") then
			LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false
		end

		if arg_29_0.isCrossplay then
			Social.BIHDCJGFCI(arg_29_0.controllerIndex, arg_29_0.xuidString)
		else
			Social.IBEHACGBI(arg_29_0.controllerIndex, arg_29_0.xuidString)
		end

		Social.DAFDEJICJJ(arg_29_0.controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_29_0.xuidString, arg_29_0.friendName)
	end
end

local function var_0_14(arg_31_0)
	arg_31_0.icon = "hud_icon_player"
	arg_31_0.displayTime = var_0_1

	if arg_31_0.success then
		arg_31_0.description = Engine.CBBHFCGDIC("LUA_MENU/FRIEND_REQUEST_ACCEPTED")
	else
		arg_31_0.description = Engine.CBBHFCGDIC("LUA_MENU/FRIEND_REQUEST_ACCEPTING_FAILED")
	end
end

local function var_0_15(arg_32_0)
	arg_32_0.icon = "hud_icon_player"
	arg_32_0.displayTime = var_0_1

	if arg_32_0.success then
		arg_32_0.header = Engine.CBBHFCGDIC("LUA_MENU/JOIN_PARTY_ATTEMPT_TOAST_HEADER")

		if arg_32_0.partyId == PartyType.PRIVATE_PARTY_ID then
			arg_32_0.description = Engine.CBBHFCGDIC("LUA_MENU/JOIN_PARTY_ATTEMPT_SUCCESS_TOAST_DESC")
		else
			arg_32_0.description = Engine.CBBHFCGDIC("LUA_MENU/JOIN_GAME_ATTEMPT_SUCCESS_TOAST_DESC")
		end
	else
		arg_32_0.header = Engine.CBBHFCGDIC("LUA_MENU/JOIN_PARTY_ATTEMPT_TOAST_HEADER")
		arg_32_0.description = Engine.CBBHFCGDIC("LUA_MENU/JOIN_PARTY_ATTEMPT_FAILURE_TOAST_DESC")

		if Dvar.IBEGCHEFE("NQRONQMKPM") then
			arg_32_0.description = arg_32_0.description .. arg_32_0.inviteJoinErrorCode
		end
	end
end

local function var_0_16(arg_33_0)
	arg_33_0.icon = "hud_icon_player"
	arg_33_0.displayTime = var_0_1

	if arg_33_0.crossplaySetting then
		arg_33_0.header = Engine.CBBHFCGDIC("LUA_MENU/PARTY_SETTING_CHANGED")
		arg_33_0.description = Engine.CBBHFCGDIC("LUA_MENU/HOST_ENABLED_CROSSPLAY")
	else
		arg_33_0.header = Engine.CBBHFCGDIC("LUA_MENU/PARTY_SETTING_CHANGED")
		arg_33_0.description = Engine.CBBHFCGDIC("LUA_MENU/HOST_DISABLED_CROSSPLAY")
	end
end

local function var_0_17(arg_34_0)
	arg_34_0.icon = "hud_icon_player"
	arg_34_0.displayTime = var_0_1
	arg_34_0.header = Engine.CBBHFCGDIC("MENU/WARNING")
	arg_34_0.description = Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_USER_IN_PARTY")
end

local function var_0_18(arg_35_0)
	arg_35_0.icon = "hud_icon_player"
	arg_35_0.description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_RECEIVED")
	arg_35_0.displayTime = var_0_0
	arg_35_0.buttonPromptLeft = Engine.CBBHFCGDIC("REGIMENTS/RECEIVED_INVITE_PROMPT")

	function arg_35_0.callback()
		LUI.FlowManager.RequestLeaveMenuByName("SocialMenu", true, true)
		LUI.FlowManager.RequestAddMenu("SocialMenu", true, arg_35_0.controllerIndex, false, {
			setRegimentsDefault = true
		}, true)
	end

	function arg_35_0.disabled()
		return not Engine.DDJFBBJAIG()
	end
end

local function var_0_19(arg_38_0)
	arg_38_0.icon = "hud_icon_player"
	arg_38_0.description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_SENT")
	arg_38_0.displayTime = 3000
end

local function var_0_20(arg_39_0)
	arg_39_0.icon = "hud_icon_player"

	local var_39_0 = ""

	if arg_39_0.success then
		var_39_0 = "REGIMENTS/INVITE_ACCEPTED"
	elseif arg_39_0.error and FRIENDS.ErrorCodeToDesc[arg_39_0.error] then
		var_39_0 = FRIENDS.ErrorCodeToDesc[arg_39_0.error]
	else
		var_39_0 = "REGIMENTS/ACCEPT_INVITE_FAIL"
	end

	arg_39_0.description = Engine.CBBHFCGDIC(var_39_0)
	arg_39_0.displayTime = 3000
end

local function var_0_21(arg_40_0)
	arg_40_0.icon = "hud_icon_player"
	arg_40_0.displayTime = var_0_1
	arg_40_0.useBnetFont = true
	arg_40_0.header = Engine.JCBDICCAH(arg_40_0.joinerName)

	if arg_40_0.partyId == PartyType.PRIVATE_PARTY_ID then
		arg_40_0.description = Engine.CBBHFCGDIC("LUA_MENU/PLAYER_HAS_JOINED_PARTY")
	else
		arg_40_0.description = Engine.CBBHFCGDIC("LUA_MENU/PLAYER_HAS_JOINED_GAME")
	end
end

local function var_0_22(arg_41_0)
	arg_41_0.icon = "hud_icon_player"
	arg_41_0.displayTime = var_0_1
	arg_41_0.useBnetFont = true
	arg_41_0.header = Engine.JCBDICCAH(arg_41_0.leaverName)
	arg_41_0.description = Engine.CBBHFCGDIC("LUA_MENU/PLAYER_HAS_LEFT_PARTY")
end

local function var_0_23(arg_42_0)
	arg_42_0.icon = "hud_icon_player"
	arg_42_0.displayTime = var_0_1
	arg_42_0.description = Engine.CBBHFCGDIC("MENU/POPUP_INVITE_SENT")
end

local function var_0_24(arg_43_0)
	arg_43_0.icon = "hud_icon_player"
	arg_43_0.displayTime = var_0_1
	arg_43_0.description = Engine.CBBHFCGDIC("LUA_MENU/PLAYER_BLOCKED")
end

local function var_0_25(arg_44_0)
	arg_44_0.icon = "hud_icon_player"
	arg_44_0.displayTime = var_0_1
	arg_44_0.description = Engine.CBBHFCGDIC("LUA_MENU/PLAYER_UNBLOCKED")
end

local function var_0_26(arg_45_0)
	arg_45_0.icon = "hud_info_alert"
	arg_45_0.header = Engine.CBBHFCGDIC("TOURNAMENT/REMINDER_HEADER")
	arg_45_0.displayTime = 8000
	arg_45_0.type = LUI.ToastManager.NotificationType.Tournament

	function arg_45_0.disabled()
		return Tournament.BEAIBEGFFB() or LUI.FlowManager.IsInStack(TOURNAMENT.GetMenuName("loading"))
	end
end

local function var_0_27(arg_47_0)
	arg_47_0.icon = "hud_info_alert"
	arg_47_0.header = Engine.CBBHFCGDIC("TOURNAMENT/CALLBACK_HEADER")
	arg_47_0.persistent = true
	arg_47_0.useHoldButton = true
	arg_47_0.buttonPromptLeft = Engine.CBBHFCGDIC("TOURNAMENT/JOIN_TOURNAMENT")
	arg_47_0.displayTime = 30000
	arg_47_0.type = LUI.ToastManager.NotificationType.Tournament

	function arg_47_0.callback()
		if TOURNAMENT.DoEntranceCheck(arg_47_0.controllerIndex, true) then
			Tournament.DCBJHBBJHF(arg_47_0.controllerIndex)

			return true
		end
	end

	function arg_47_0.disabled()
		return Tournament.BEAIBEGFFB() or LUI.FlowManager.IsInStack(TOURNAMENT.GetMenuName("loading"))
	end
end

local function var_0_28(arg_50_0)
	arg_50_0.icon = "hud_info_alert"
	arg_50_0.header = Engine.CBBHFCGDIC("TOURNAMENT/REJOIN_TOURNAMENT_HEADER")
	arg_50_0.persistent = true
	arg_50_0.useHoldButton = true
	arg_50_0.buttonPromptLeft = Engine.CBBHFCGDIC("TOURNAMENT/REJOIN_TOURNAMENT")
	arg_50_0.displayTime = 60000
	arg_50_0.type = LUI.ToastManager.NotificationType.Tournament

	function arg_50_0.callback()
		if TOURNAMENT.DoEntranceCheck(arg_50_0.controllerIndex) then
			Tournament.GBBIEEGE(arg_50_0.controllerIndex)

			return true
		end
	end

	function arg_50_0.disabled()
		return Tournament.BEAIBEGFFB() or LUI.FlowManager.IsInStack(TOURNAMENT.GetMenuName("loading"))
	end
end

local var_0_29 = {
	rejoinTournamentCallback = "genRejoinTournamentCallback",
	overIndulgenceNotice = "genOverIndulgenceNotice",
	crossplaySettingChanged = "genCrossplaySettingChanged",
	clansInviteSent = "clans_invite_sent",
	playerUnblocked = "genPlayerUnblocked",
	friendRequestReceived = "genFriendRequestReceived",
	crossplaySettingDisabledOtherPlatformUserInPartyWarning = "genCrossplaySettingDisabledOtherPlatformUserInPartyWarning",
	clansInviteAccepted = "clans_invite_accepted",
	receivePartyJoin = "genReceivePartyJoin",
	playerBlocked = "genPlayerBlocked",
	clansInviteReceived = "clans_invite_received",
	tournamentReminder = "genTournamentReminder",
	joinTournamentCallback = "genJoinTournamentCallback",
	joinPartyAttempt = "genJoinPartyAttempt",
	partyInviteSent = "genPartyInviteSent",
	friendRequestAccepted = "genFriendRequestAccepted",
	receivePartyLeave = "genReceivePartyLeave",
	friendRequestSend = "genFriendRequestSent"
}
local var_0_30 = {
	[var_0_29.friendRequestSend] = var_0_12,
	[var_0_29.friendRequestReceived] = var_0_13,
	[var_0_29.friendRequestAccepted] = var_0_14,
	[var_0_29.joinPartyAttempt] = var_0_15,
	[var_0_29.receivePartyJoin] = var_0_21,
	[var_0_29.receivePartyLeave] = var_0_22,
	[var_0_29.partyInviteSent] = var_0_23,
	[var_0_29.playerBlocked] = var_0_24,
	[var_0_29.playerUnblocked] = var_0_25,
	[var_0_29.tournamentReminder] = var_0_26,
	[var_0_29.joinTournamentCallback] = var_0_27,
	[var_0_29.rejoinTournamentCallback] = var_0_28,
	[var_0_29.overIndulgenceNotice] = var_0_11,
	[var_0_29.crossplaySettingChanged] = var_0_16,
	[var_0_29.crossplaySettingDisabledOtherPlatformUserInPartyWarning] = var_0_17,
	[var_0_29.clansInviteReceived] = var_0_18,
	[var_0_29.clansInviteSent] = var_0_19,
	[var_0_29.clansInviteAccepted] = var_0_20
}
local var_0_31 = {
	PC = "pc",
	DemonWare = "dw",
	General = "gen"
}
local var_0_32 = {
	[var_0_31.General] = {
		[var_0_29.friendRequestReceived] = var_0_29.friendRequestReceived
	},
	[var_0_31.PC] = {
		[var_0_6.playerInvite] = var_0_6.playerInvite
	},
	[var_0_31.DemonWare] = {
		[var_0_9.playerInvite] = var_0_9.playerInvite
	}
}

local function var_0_33(arg_53_0)
	if arg_53_0.genEventName and var_0_32[var_0_31.General][arg_53_0.genEventName] then
		return true
	elseif arg_53_0.pcEventName and var_0_32[var_0_31.PC][arg_53_0.pcEventName] then
		return true
	elseif arg_53_0.dwEventName and var_0_32[var_0_31.DemonWare][arg_53_0.dwEventName] then
		return true
	end

	return false
end

function LUI.ToastManager.CreateToastNotification(arg_54_0, arg_54_1)
	if #arg_54_0.notificationQueue > LUI.ToastManager.MaxQueuedNotifications then
		return
	end

	if #arg_54_0.pendingNotificationQueue > LUI.ToastManager.MaxQueuedNotifications then
		return
	end

	assert(arg_54_1)

	arg_54_1.controllerIndex = arg_54_1.controllerIndex or arg_54_0._controllerIndex

	if Engine.BECCFCBIAA("displayInviteNotification", arg_54_1.controllerIndex) == 0 and var_0_33(arg_54_1) then
		return
	end

	if arg_54_1.type ~= LUI.ToastManager.NotificationType.CoDCasterPreset and (CODCASTER_CONDITIONS.IsMPCODCaster() or MLG.DBIBHEAEGD()) then
		return
	end

	if arg_54_1.genEventName and var_0_30[arg_54_1.genEventName] then
		var_0_30[arg_54_1.genEventName](arg_54_1)

		if arg_54_1.disabled and arg_54_1.disabled() then
			return
		end
	elseif CONDITIONS.IsPCDesktop(arg_54_0) and arg_54_1.pcEventName and var_0_7[arg_54_1.pcEventName] then
		var_0_7[arg_54_1.pcEventName](arg_54_1)
	elseif arg_54_1.dwEventName and var_0_10[arg_54_1.dwEventName] then
		var_0_10[arg_54_1.dwEventName](arg_54_1)
	end

	arg_54_1.priority = arg_54_1.priority or 1
	arg_54_1.priority = LUI.clamp(arg_54_1.priority, 1, 100)
	arg_54_1.persistent = arg_54_1.persistent or false
	arg_54_1.displayTime = arg_54_1.displayTime or 10000
	arg_54_1.type = arg_54_1.type or LUI.ToastManager.NotificationType.None

	arg_54_0:RemoveQueuedNotificationsOfType(arg_54_1.type)

	if not CONDITIONS.InGame() or Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() or not arg_54_1.callback then
		arg_54_0:PushNotificationOptions(arg_54_1)
		arg_54_0:ProcessNotifications()
	else
		arg_54_0:PushPendingNotificationOptions(arg_54_1)
		arg_54_0:ProcessPendingNotification()
	end

	return true
end

function LUI.ToastManager.IsInGameNotificationWithCallback(arg_55_0, arg_55_1)
	if CONDITIONS.InGame() and arg_55_1.callback then
		return true
	end

	return false
end

function LUI.ToastManager.RemoveQueuedNotificationsOfType(arg_56_0, arg_56_1)
	if not arg_56_0.notificationQueue then
		return
	end

	local var_56_0 = #arg_56_0.notificationQueue

	if var_56_0 <= 0 or arg_56_1 == LUI.ToastManager.NotificationType.None then
		return
	end

	for iter_56_0 = 1, var_56_0 do
		if arg_56_0.notificationQueue[iter_56_0].type == arg_56_1 then
			arg_56_0.notificationQueue[iter_56_0] = nil
		end
	end

	local var_56_1 = 0

	for iter_56_1 = 1, var_56_0 do
		if arg_56_0.notificationQueue[iter_56_1] ~= nil then
			var_56_1 = var_56_1 + 1
			arg_56_0.notificationQueue[var_56_1] = arg_56_0.notificationQueue[iter_56_1]
		end
	end

	for iter_56_2 = var_56_1 + 1, var_56_0 do
		arg_56_0.notificationQueue[iter_56_2] = nil
	end
end

function LUI.ToastManager.ProcessNotifications(arg_57_0)
	if not arg_57_0:CanDisplayNotification() then
		return
	end

	local var_57_0 = arg_57_0:PopNotificationOptions()

	if var_57_0 then
		if arg_57_0:IsInGameNotificationWithCallback(var_57_0) then
			if Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() and LUI.IsLastInputGamepad(arg_57_0._controllerIndex) then
				arg_57_0:PushPendingNotificationOptions(var_57_0)

				var_57_0.ToOptionsPrompt = true
				var_57_0.displayTime = var_0_0
			end
		else
			arg_57_0.currentNotifications = arg_57_0.currentNotifications + 1
		end

		arg_57_0.currentNotificationOptions = var_57_0

		arg_57_0:DisplayNewNotification(var_57_0)
		arg_57_0:ProcessNotifications()
	end
end

function LUI.ToastManager.ProcessPendingNotification(arg_58_0)
	if not arg_58_0:CanDisplayPendingNotification() then
		return
	end

	local var_58_0 = arg_58_0:PopPendingNotificationOptions()

	if var_58_0 then
		var_58_0.ToOptionsPrompt = false
		var_58_0.displayTime = var_58_0.callback and var_0_0 or var_0_1
		arg_58_0.currentPendingNotifications = arg_58_0.currentPendingNotifications + 1
		arg_58_0.currentNotificationOptions = var_58_0

		arg_58_0:DisplayNewNotification(var_58_0)
		arg_58_0:ProcessPendingNotification()
	end
end

function LUI.ToastManager.CanDisplayNotification(arg_59_0)
	if #arg_59_0.notificationQueue <= 0 then
		return false
	end

	if arg_59_0.currentNotifications >= arg_59_0.maxNotifications then
		return false
	end

	if not arg_59_0.activeCallbackFunc then
		return true
	else
		local var_59_0 = #arg_59_0.notificationQueue

		for iter_59_0 = 1, #arg_59_0.notificationQueue do
			if not arg_59_0.notificationQueue[iter_59_0].callback then
				return true
			end
		end
	end

	return false
end

function LUI.ToastManager.CanDisplayPendingNotification(arg_60_0)
	if #arg_60_0.pendingNotificationQueue <= 0 then
		return false
	end

	if arg_60_0.currentPendingNotifications >= arg_60_0.maxNotifications then
		return false
	end

	if not arg_60_0.activeCallbackFunc then
		return true
	else
		local var_60_0 = #arg_60_0.pendingNotificationQueue

		for iter_60_0 = 1, #arg_60_0.notificationQueue do
			if not arg_60_0.pendingNotificationQueue[iter_60_0].callback then
				return true
			end
		end
	end

	return false
end

function LUI.ToastManager.PopNotificationOptions(arg_61_0)
	for iter_61_0 = 1, #arg_61_0.notificationQueue do
		if arg_61_0.notificationQueue[iter_61_0].callback then
			if not arg_61_0.activeCallbackFunc then
				return table.remove(arg_61_0.notificationQueue, iter_61_0)
			end
		else
			return table.remove(arg_61_0.notificationQueue, iter_61_0)
		end
	end
end

function LUI.ToastManager.PopPendingNotificationOptions(arg_62_0)
	for iter_62_0 = 1, #arg_62_0.pendingNotificationQueue do
		if arg_62_0.pendingNotificationQueue[iter_62_0].callback then
			if not arg_62_0.activeCallbackFunc then
				return table.remove(arg_62_0.pendingNotificationQueue, iter_62_0)
			end
		else
			return table.remove(arg_62_0.pendingNotificationQueue, iter_62_0)
		end
	end
end

function LUI.ToastManager.PushNotificationOptions(arg_63_0, arg_63_1)
	for iter_63_0 = 1, #arg_63_0.notificationQueue do
		if arg_63_0.notificationQueue[iter_63_0].priority < arg_63_1.priority then
			return table.insert(arg_63_0.notificationQueue, iter_63_0, arg_63_1)
		end
	end

	return table.insert(arg_63_0.notificationQueue, arg_63_1)
end

function LUI.ToastManager.PushPendingNotificationOptions(arg_64_0, arg_64_1)
	for iter_64_0 = 1, #arg_64_0.pendingNotificationQueue do
		if arg_64_0.pendingNotificationQueue[iter_64_0].priority < arg_64_1.priority then
			return table.insert(arg_64_0.pendingNotificationQueue, iter_64_0, arg_64_1)
		end
	end

	return table.insert(arg_64_0.pendingNotificationQueue, arg_64_1)
end

function LUI.ToastManager.AddToFeed(arg_65_0, arg_65_1)
	local var_65_0 = arg_65_0.feed

	assert(var_65_0)

	local var_65_1 = var_65_0:getFirstChild()
	local var_65_2

	if not var_65_1 then
		var_65_0:addElement(arg_65_1)

		return
	else
		while var_65_1 do
			if var_65_1.persistent then
				var_65_2 = var_65_1
				var_65_1 = var_65_1:getNextSibling()
			else
				arg_65_1:addElementBefore(var_65_1)

				return
			end
		end
	end

	arg_65_1:addElementAfter(var_65_2)
end

function LUI.ToastManager.HandleButtonPressed(arg_66_0, arg_66_1)
	if not LUI.IsLastInputGamepad(arg_66_0._controllerIndex) then
		return false
	end

	local var_66_0 = arg_66_1.button
	local var_66_1 = "button_" .. var_66_0

	if var_66_1 == arg_66_0.buttonLeftForCallback and arg_66_0.activeCallbackFunc and arg_66_0.callbackToast then
		if arg_66_0.useHoldButton then
			arg_66_0.callbackToast.ToastNotification.HoldButton:processEvent(arg_66_1)

			return true
		elseif arg_66_1.down then
			arg_66_0.activeCallbackFunc()
			arg_66_0:RemoveNotification(arg_66_0.callbackToast)

			arg_66_0.activeCallbackFunc = nil

			return true
		end
	elseif var_66_1 == arg_66_0.buttonRightForCallback and arg_66_0.activeCallbackFunc and arg_66_0.callbackToast then
		if arg_66_1.down then
			arg_66_0:RemoveNotification(arg_66_0.callbackToast)

			arg_66_0.activeCallbackFunc = nil

			return true
		end
	else
		return false
	end
end

function LUI.ToastManager.AssignCallbackToNotification(arg_67_0, arg_67_1, arg_67_2)
	if not LUI.IsLastInputGamepad(arg_67_0._controllerIndex) then
		arg_67_2.ToastNotification.MenuButtonLeft:registerEventHandler("button_action", function(arg_68_0, arg_68_1)
			if arg_67_0.callbackToast then
				arg_67_1.callback()
				arg_67_0:RemoveNotification(arg_67_0.callbackToast)

				return true
			else
				return false
			end
		end)
		arg_67_2.ToastNotification.MenuButtonRight:registerEventHandler("button_action", function(arg_69_0, arg_69_1)
			if arg_67_0.callbackToast then
				arg_67_0:RemoveNotification(arg_67_0.callbackToast)

				return true
			else
				return false
			end
		end)
	else
		arg_67_1.button = CoD.GetButtonForCurrentInput(arg_67_0._controllerIndex, arg_67_0.buttonLeftForCallback)
	end
end

function LUI.ToastManager.AssignHoldButtonCallbackToNotification(arg_70_0, arg_70_1, arg_70_2)
	local var_70_0 = arg_70_2.ToastNotification.HoldButton

	LUI.AddUIHoldButtonLogic(var_70_0, arg_70_1.controllerIndex, {
		requireFocus = false,
		duration = 2000,
		buttons = {
			alt1 = true
		},
		fill = var_70_0.GenericProgressBar,
		onFill = function()
			if arg_70_0.callbackToast._isNotificationWithCallbackOnScreen and arg_70_0.activeCallbackFunc then
				arg_70_1.callback()
				arg_70_0:RemoveNotification(arg_70_0.callbackToast)
			end
		end
	})
end

function LUI.ToastManager.RemoveNotification(arg_72_0, arg_72_1)
	if not arg_72_1 then
		return
	end

	arg_72_1._markForRemoval = true

	if arg_72_1 == arg_72_0.callbackToast then
		if not arg_72_0.useHoldButton then
			arg_72_1.ToastNotification.MenuButtonLeft:processEvent({
				name = "button_up"
			})
		end

		arg_72_1.ToastNotification.MenuButtonLeft:SetHandleMouse(false)
		arg_72_1.ToastNotification.MenuButtonRight:SetHandleMouse(false)

		arg_72_0.activeCallbackFunc = nil
		arg_72_1._isNotificationWithCallbackOnScreen = false
	end

	ACTIONS.AnimateSequence(arg_72_1, "HideAll")

	arg_72_1:Wait(300).onComplete = function()
		local var_73_0 = arg_72_1:SetTop(0, arg_72_0.resizeAnimationTime, LUI.EASING.outQuadratic)

		arg_72_1:SetBottom(0, arg_72_0.resizeAnimationTime, LUI.EASING.outQuadratic).onComplete = function()
			ACTIONS.AnimateSequence(arg_72_1, "Reset")

			if arg_72_1 == arg_72_0.callbackToast then
				arg_72_0.callbackToast = nil
			end

			arg_72_0.feed:RemoveElement(arg_72_1)
			arg_72_1.ToastNotification:closeTree()

			arg_72_1.options.ToOptionsPrompt = false

			if arg_72_0:IsInGameNotificationWithCallback(arg_72_1.options) and not Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() then
				arg_72_0.currentPendingNotifications = arg_72_0.currentPendingNotifications > 0 and arg_72_0.currentPendingNotifications - 1 or 0

				arg_72_0:ProcessPendingNotification()
			else
				arg_72_0.currentNotifications = arg_72_0.currentNotifications > 0 and arg_72_0.currentNotifications - 1 or 0

				arg_72_0:ProcessNotifications()
			end
		end
	end
end

function LUI.ToastManager.DisplayNewNotification(arg_75_0, arg_75_1)
	assert(arg_75_1)

	local var_75_0 = MenuBuilder.BuildRegisteredType("ToastNotificationContainer", {
		controllerIndex = arg_75_1.controllerIndex
	})

	var_75_0._notificationType = arg_75_1.type

	if arg_75_1.callback then
		arg_75_0.callbackToast = var_75_0
		arg_75_0.activeCallbackFunc = arg_75_1.callback
	end

	local function var_75_1(arg_76_0, arg_76_1, arg_76_2)
		if arg_76_2.callback then
			assert(type(arg_76_2.callback) == "function")

			arg_76_1.useHoldButton = arg_76_2.useHoldButton and LUI.IsLastInputGamepad(arg_76_1._controllerIndex)

			if arg_76_1.useHoldButton then
				if arg_76_0._isNotificationWithCallbackOnScreen then
					arg_76_0.ToastNotification.HoldButton:SetHandleMouse(true)
				end

				arg_76_0.ToastNotification.HoldButton:processEvent({
					name = "button_over"
				})
				arg_76_1:AssignHoldButtonCallbackToNotification(arg_76_2, arg_76_0)
			else
				if arg_76_0._isNotificationWithCallbackOnScreen then
					arg_76_0.ToastNotification.MenuButtonLeft:SetHandleMouse(true)
					arg_76_0.ToastNotification.MenuButtonRight:SetHandleMouse(true)
				end

				arg_76_1:AssignCallbackToNotification(arg_76_2, arg_76_0)
			end
		end
	end

	var_75_0:SetData(arg_75_1)
	var_75_0:SetAlpha(0)

	if arg_75_1.wordWrap then
		var_75_0.ToastNotification.CenterDescription:SetVerticalAlignment(LUI.Alignment.Center)
		var_75_0.ToastNotification.CenterDescription:SetWordWrap(true)
	end

	var_75_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * -arg_75_0.notificationWidth, 0, 0)
	arg_75_0:AddToFeed(var_75_0)

	var_75_0.manager = arg_75_0
	var_75_0.options = arg_75_1

	var_75_0:addAndCallEventHandler("update_input_type", function(arg_77_0, arg_77_1)
		arg_77_0:SetGraphics(arg_77_0.options)
		var_75_1(arg_77_0, arg_77_0.manager, arg_77_0.options)
	end)

	local var_75_2 = var_75_0:SetTop(0, arg_75_0.resizeAnimationTime, LUI.EASING.outQuadratic)

	var_75_0:SetBottom(_1080p * arg_75_0.notificationHeight, arg_75_0.resizeAnimationTime, LUI.EASING.outQuadratic).onComplete = function()
		var_75_0:SetAlpha(1)

		if arg_75_1.callback then
			var_75_0._isNotificationWithCallbackOnScreen = true

			if arg_75_0.useHoldButton then
				var_75_0.ToastNotification.HoldButton:SetHandleMouse(true)
			else
				var_75_0.ToastNotification.MenuButtonLeft:SetHandleMouse(true)
				var_75_0.ToastNotification.MenuButtonRight:SetHandleMouse(true)
			end
		end

		ACTIONS.AnimateSequence(var_75_0, "SlideInFromRight")
	end

	local function var_75_3(arg_79_0, arg_79_1)
		arg_75_0:RemoveNotification(arg_79_0)

		arg_79_1.ToOptionsPrompt = false
		arg_79_1.displayTime = var_0_0
	end

	local var_75_4

	local function var_75_5(arg_80_0)
		if var_75_0 and not var_75_0._markForRemoval then
			if arg_75_0.useHoldButton and var_75_0.ToastNotification.HoldButton.GenericProgressBar:GetProgress() > 0 then
				var_75_0.ToastNotification:Wait(100, true).onComplete = function()
					var_75_5(true)
				end
			elseif arg_80_0 then
				var_75_0.ToastNotification:Wait(3000, true).onComplete = function()
					if var_75_0.ToastNotification.HoldButton.GenericProgressBar:GetProgress() > 0 then
						var_75_5(true)
					else
						var_75_3(var_75_0, arg_75_1)
					end
				end
			else
				var_75_3(var_75_0, arg_75_1)
			end
		end
	end

	var_75_0:Wait(arg_75_1.displayTime).onComplete = function()
		var_75_5(false)
	end
end
