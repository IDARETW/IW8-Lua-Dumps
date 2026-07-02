LUI.ToastManager = LUI.Class(LUI.UIElement)
LUI.ToastManager.NotificationType = {
	InputLocked = 28,
	WeaponEquipped = 1,
	StreakEquipped = 18,
	WZSquadUpdated = 31,
	PlayerCardEquipped = 10,
	SprayEquipped = 19,
	FieldUpgradeMenu = 17,
	EquipmentEquipped = 6,
	CamoEquipped = 12,
	OperatorEquipped = 3,
	StickerEquipped = 15,
	WatchEquipped = 9,
	TauntEquipped = 24,
	AchievementUnlocked = 25,
	TitleEquipped = 35,
	DoubleXPNotifications = 27,
	FrameEquipped = 34,
	LookForParty = 32,
	MunitionEquipped = 4,
	AttachmentEquipped = 2,
	MissionChallenges = 29,
	Tournament = 22,
	None = 0,
	FavoriteSuperfactionEquipped = 20,
	CoDCasterPreset = 30,
	ReticleEquipped = 13,
	Clans = 33,
	LoadoutOptions = 26,
	QuickPlayFilterEquipped = 21,
	RoleEquipped = 5,
	GestureEquipped = 16,
	PerkEquipped = 7,
	EmblemEquipped = 11,
	ExecutionEquipped = 23,
	SkinEquipped = 8,
	CharmEquipped = 14
}

local var_0_0 = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	12,
	13,
	14,
	15,
	16,
	17,
	18,
	19,
	20,
	21,
	23,
	24,
	34,
	35
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

local function var_0_1(arg_3_0)
	local var_3_0 = Engine.BBHGAFFFGE(arg_3_0.controllerIndex, Friends.CAIJHBHGGC(arg_3_0.XUID))
	local var_3_1 = LUI.DEEP_LINK_GAME.COLD_WAR

	if var_3_0 == Title.VANGUARD then
		var_3_1 = LUI.DEEP_LINK_GAME.VANGUARD
	elseif var_3_0 == Title.PLATFORM_HQ then
		var_3_1 = LUI.DEEP_LINK_GAME.HQ
	end

	return var_3_1
end

local function var_0_2(arg_4_0, arg_4_1)
	local var_4_0 = var_0_1(arg_4_1)

	LUI.FlowManager.RequestPopupMenu(nil, "host_crosslaunching", true, arg_4_1.controllerIndex, false, {
		isPresenceJoin = false,
		XUID = arg_4_1.XUID,
		game = var_4_0
	})

	return true
end

local function var_0_3(arg_5_0, arg_5_1)
	local var_5_0 = var_0_1(arg_5_1)

	LUI.FlowManager.RequestPopupMenu(nil, "host_crosslaunching", true, arg_5_1.controllerIndex, false, {
		isPresenceJoin = true,
		XUID = arg_5_1.XUID,
		game = var_5_0
	})

	return true
end

function LUI.ToastManager.InitLayer(arg_6_0)
	arg_6_0.notificationWidth = 500
	arg_6_0.notificationHeight = 115
	arg_6_0.resizeAnimationTime = 200
	arg_6_0.maxNotifications = 3
	arg_6_0.currentNotifications = 0
	arg_6_0.currentPendingNotifications = 0
	arg_6_0.notificationQueue = {}
	arg_6_0.pendingNotificationQueue = {}
	arg_6_0.currentNotificationOptions = nil
	arg_6_0.handleGamepadInputs = true

	local var_6_0 = 80

	arg_6_0.buttonLeftForCallback = "button_alt1"
	arg_6_0.buttonRightForCallback = "button_left_stick"

	local var_6_1 = LUI.UIVerticalList.new()

	var_6_1.id = "RightVerticalList"

	var_6_1:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -arg_6_0.notificationWidth, 0, _1080p * var_6_0, 0)
	arg_6_0:addElement(var_6_1)

	arg_6_0.feed = var_6_1

	arg_6_0:registerEventHandler("send_toast_notification", function(arg_7_0, arg_7_1)
		return arg_7_0:CreateToastNotification(arg_7_1.options)
	end)
	arg_6_0:registerEventHandler("gamepad_button", function(arg_8_0, arg_8_1)
		if arg_8_0.handleGamepadInputs then
			return arg_8_0:HandleButtonPressed(arg_8_1)
		end
	end)
	arg_6_0:addEventHandler("non_empty_menu_stack", function(arg_9_0, arg_9_1)
		if CONDITIONS.InGame() then
			local var_9_0 = arg_9_0.currentNotificationOptions

			if var_9_0 then
				var_9_0.ToOptionsPrompt = false

				if arg_9_0.callbackToast then
					arg_9_0.handleGamepadInputs = true

					arg_9_0.callbackToast:SetGraphics(var_9_0)

					if arg_9_0.callbackToast._isNotificationWithCallbackOnScreen then
						arg_9_0.callbackToast.ToastNotification.MenuButtonLeft:SetHandleMouse(true)
						arg_9_0.callbackToast.ToastNotification.MenuButtonRight:SetHandleMouse(true)

						arg_9_0.handleGamepadInputs = true
					end

					return
				end

				arg_9_0:ProcessPendingNotification()
			end
		end
	end)
	arg_6_0:addEventHandler("empty_menu_stack", function(arg_10_0, arg_10_1)
		if CONDITIONS.InGame() then
			local var_10_0 = arg_10_0.currentNotificationOptions

			if var_10_0 and arg_10_0.callbackToast then
				if Engine.BECCFCBIAA("gpadEnabled", arg_10_0._controllerIndex) then
					arg_10_0.callbackToast:HideNotification()

					arg_10_0.handleGamepadInputs = false
				else
					arg_10_0.callbackToast:SetGraphics(var_10_0)
				end
			end
		end
	end)
	arg_6_0:registerEventHandler("kbm_notification_prompt_answer", function(arg_11_0, arg_11_1)
		if LUI.IsLastInputKeyboardMouse(arg_11_0._controllerIndex) then
			local var_11_0 = arg_11_0.currentNotificationOptions

			if var_11_0 and arg_11_0.callbackToast then
				if arg_11_1.answer then
					var_11_0.callback()
				end

				arg_11_0:RemoveNotification(arg_11_0.callbackToast)
			end
		end
	end)
	arg_6_0:addEventHandler("exchanged_item", function(arg_12_0, arg_12_1)
		if Engine.DDJFBBJAIG() and not STORE.IsTitleID(arg_12_1.markerItemID) and (not Dvar.IBEGCHEFE("RNRNSRTNQ") or not CONDITIONS.IsMenuInStack("MagmaUpsellFullScreenPopup")) then
			local var_12_0 = StringTable.DIFCHIGDFB(CSV.dlcIDs.file, CSV.dlcIDs.cols.id, arg_12_1.markerItemID, CSV.dlcIDs.cols.shouldShowPopup)

			if #var_12_0 > 0 and tonumber(var_12_0) == 1 and STORE.IsExchangePopupAllowed(arg_12_0._controllerIndex, arg_12_1) then
				if CONDITIONS.IsMenuInStack("ItemExchangePopup") then
					local var_12_1 = LUI.FlowManager.GetScopedData("ItemExchangePopup")

					if not var_12_1.itemQueue then
						var_12_1.itemQueue = LUI.CreateQueue()
					end

					var_12_1.itemQueue:Push(arg_12_1.exchangeID)
				else
					LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangePopup", false, arg_12_0._controllerIndex, false, {
						markerItemID = arg_12_1.markerItemID,
						fromSignIn = arg_12_1.fromSignIn
					})
				end
			end
		end
	end)
	arg_6_0:addEventHandler("exchanged_item_failed", function(arg_13_0, arg_13_1)
		if Engine.DDJFBBJAIG() and arg_13_1.fromSignIn == false then
			LUI.FlowManager.RequestLeaveMenuByName("ItemExchangeFencePopup")
			LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangeFailedPopup", false, arg_13_0._controllerIndex, false)
		end
	end)
	arg_6_0:addEventHandler("ingamestore_purchased_product", function(arg_14_0, arg_14_1)
		assert(arg_14_1.transactionResult)

		if Engine.DDJFBBJAIG() and arg_14_1.transactionResult == STORE.TransactionResult.TRANSACTION_CANCELLED then
			LUI.FlowManager.RequestLeaveMenuByName("ItemExchangeFencePopup")
		end
	end)
	arg_6_0:registerEventHandler("cross_launch_accept_invite", var_0_2)
	arg_6_0:registerEventHandler("cross_launch_presence_join", var_0_3)
	arg_6_0:addEventHandler("stream_http_version_change", function(arg_15_0, arg_15_1)
		if Engine.DDJFBBJAIG() and not Dvar.IBEGCHEFE("MKKNSMLKPR") and not Dvar.IBEGCHEFE("NPMLNMNRMT") then
			LUI.FlowManager.RequestPopupMenu(nil, "TextureDownloadCacheVersionChange", false, arg_15_0._controllerIndex, false)
		end
	end)
	arg_6_0:addEventHandler("stream_http_alloc_error", function(arg_16_0, arg_16_1)
		if Engine.DDJFBBJAIG() and not Engine.FJCIBEDII() then
			LUI.FlowManager.RequestPopupMenu(nil, "TextureDownloadCacheAllocError", false, arg_16_0._controllerIndex, false)
		end
	end)
	arg_6_0:registerEventHandler("clans_notification", function(arg_17_0, arg_17_1)
		local var_17_0 = arg_17_1.options

		if var_17_0.success then
			if var_17_0.genEventName == "clans_promoted_to_owner" or var_17_0.genEventName == "clans_promoted_to_officer" or var_17_0.genEventName == "clans_demoted_to_member" or var_17_0.genEventName == "clans_demoted_to_officer" or var_17_0.genEventName == "clans_kicked_from_clan" then
				FRIENDS.RegimentRoleChangedToast(arg_17_0, var_17_0.genEventName, var_17_0.clanName)
			else
				local var_17_1 = {
					description = "",
					icon = "hud_info_alert",
					displayTime = 3000,
					header = Engine.CBBHFCGDIC("MENU/NOTICE")
				}

				if var_17_1.description ~= "" then
					arg_17_0:processEvent({
						name = "send_toast_notification",
						immediate = true,
						options = var_17_1
					})
				end
			end
		end
	end)
	arg_6_0:registerEventHandler("update_gift_data", function(arg_18_0, arg_18_1)
		local var_18_0 = Engine.DBFFAEEFGJ()

		LUI.UIRoot.ProcessEvent(var_18_0, {
			immediate = true,
			name = "gift_queue_process"
		})
	end)
	arg_6_0:registerEventHandler("gift_result", function(arg_19_0, arg_19_1)
		local var_19_0 = arg_19_0._giftRecipientQueue:Pop()

		if arg_19_1.success then
			local var_19_1 = var_19_0
			local var_19_2 = ""

			if var_19_1 then
				local var_19_3 = Friends.HCAFBJBHC(arg_19_0._controllerIndex, var_19_1)

				if var_19_3 then
					var_19_2 = Engine.CBBHFCGDIC("LUA_MENU/BUNDLE_GIFT_SENT_DESC", Engine.JCBDICCAH(var_19_3.fullName))
				end
			end

			local var_19_4 = {
				icon = "ui_icon_bundle_gift_small",
				displayTime = 3000,
				header = Engine.CBBHFCGDIC("LUA_MENU/BUNDLE_GIFT_SENT"),
				description = var_19_2
			}

			arg_19_0:processEvent({
				name = "send_toast_notification",
				immediate = true,
				options = var_19_4
			})
		else
			local var_19_5 = {
				recipientXuid = var_19_0
			}

			LUI.FlowManager.RequestPopupMenu(nil, "GiftingFailedTransaction", true, arg_19_0._controllerIndex, false, var_19_5)
		end

		Engine.CEJJDJJHIJ(arg_19_0._controllerIndex, "dlog_event_gifting_completed", {
			result = arg_19_1.success and "success" or "fail",
			transaction_id = arg_19_1.transaction_id,
			sku_id = tostring(arg_19_1.gift_sku),
			recipient_uno_id = var_19_0,
			error = arg_19_1.error
		})
	end)
	arg_6_0:addEventHandler("open_toast_check", function(arg_20_0, arg_20_1)
		if arg_20_0._activeToast then
			Engine.DBFFAEEFGJ():dispatchEventToRoot({
				dispatchChildren = true,
				name = "current_active_toast"
			})
		end
	end)
end

function LUI.ToastManager.CloseLists(arg_21_0)
	if arg_21_0.feed then
		arg_21_0.feed:closeTree()

		arg_21_0.feed = nil
	end
end

function LUI.ToastManager.ClearLayer(arg_22_0)
	arg_22_0:CloseLists()
	arg_22_0:closeChildren()
end

function LUI.ToastManager.CloseToastOfType(arg_23_0, arg_23_1)
	arg_23_0:RemoveQueuedNotificationsOfType(arg_23_1)

	if arg_23_0.feed then
		local var_23_0 = arg_23_0.feed:getFirstChild()

		while var_23_0 do
			local var_23_1 = var_23_0:getNextSibling()

			if var_23_0._notificationType == arg_23_1 then
				arg_23_0:RemoveNotification(var_23_0)
			end

			var_23_0 = var_23_1
		end
	end
end

function LUI.ToastManager.ProcessInputEvent(arg_24_0, arg_24_1)
	local var_24_0 = false
	local var_24_1 = arg_24_0.m_eventHandlers[arg_24_1.name]

	if var_24_1 then
		var_24_0 = var_24_1(arg_24_0, arg_24_1)
	end

	if arg_24_1.name == "mousemove" or arg_24_1.name == "mousedown" or arg_24_1.name == "mouseup" then
		return false
	end

	return var_24_0
end

function LUI.ToastManager.processEvent(arg_25_0, arg_25_1)
	if not arg_25_1.name == "non_empty_menu_stack" and not arg_25_0.activeCallbackFunc then
		return
	end

	if IsInputEvent(arg_25_1.name) then
		return arg_25_0:ProcessInputEvent(arg_25_1)
	else
		return LUI.ToastManager.super.processEvent(arg_25_0, arg_25_1)
	end
end

function LUI.ToastManager.ShouldBeVisible(arg_26_0)
	return true
end

local var_0_4 = 30000
local var_0_5 = 3000

local function var_0_6(arg_27_0)
	arg_27_0.icon = "hud_icon_player"
	arg_27_0.description = Engine.CBBHFCGDIC("MENU/INVITE_RECEIVED")
	arg_27_0.header = arg_27_0.senderName
	arg_27_0.displayTime = var_0_4
	arg_27_0.buttonPromptLeft = Engine.CBBHFCGDIC("PLATFORM/ACCEPT_INVITE")
	arg_27_0.persistent = true
	arg_27_0.useBnetFont = true

	function arg_27_0.callback()
		local function var_28_0()
			if CONDITIONS.IsInGameBattlesMatch() then
				Engine.DBFFAEEFGJ():dispatchEventToRoot({
					immediate = true,
					name = "gamebattles_social_leave_menu"
				})
			end

			Invitation.DHACFECHAG(arg_27_0.invitationID)
		end

		FRIENDS.TryJoinUserParty(var_28_0)
	end
end

local function var_0_7(arg_30_0)
	if Engine.DBFCJBDJEC() then
		var_0_6(arg_30_0)
	end
end

local function var_0_8(arg_31_0)
	arg_31_0.icon = "hud_icon_player"
	arg_31_0.description = Engine.CBBHFCGDIC("MENU/POPUP_INVITE_SENT")
	arg_31_0.header = Engine.CBBHFCGDIC("MENU/POPUP_INVITE_SENT")
	arg_31_0.displayTime = var_0_5
end

local function var_0_9(arg_32_0)
	arg_32_0.icon = "hud_icon_player"
	arg_32_0.displayTime = var_0_5

	if arg_32_0.success then
		arg_32_0.description = Engine.CBBHFCGDIC("LUA_MENU/REQUEST_ACCEPT_SUCCESS")
	else
		arg_32_0.description = Engine.CBBHFCGDIC("LUA_MENU/REQUEST_ACCEPT_FAILED")
	end
end

local var_0_10 = {
	friendInviteSent = "pcPlayerInviteSent",
	playerInvite = "pcPlayerInvite",
	acceptFriendComplete = "pcAcceptFriendComplete"
}
local var_0_11 = {
	[var_0_10.playerInvite] = var_0_7,
	[var_0_10.friendInviteSent] = var_0_8,
	[var_0_10.acceptFriendComplete] = var_0_9
}

local function var_0_12(arg_33_0)
	arg_33_0.icon = "hud_icon_player"
	arg_33_0.description = Engine.CBBHFCGDIC("MENU/INVITE_RECEIVED")
	arg_33_0.header = arg_33_0.senderName
	arg_33_0.displayTime = var_0_4
	arg_33_0.buttonPromptLeft = Engine.CBBHFCGDIC("PLATFORM/ACCEPT_INVITE")
	arg_33_0.persistent = true
	arg_33_0.useBnetFont = true

	function arg_33_0.callback()
		if CONDITIONS.IsInGameBattlesMatch() then
			Engine.DBFFAEEFGJ():dispatchEventToRoot({
				immediate = true,
				name = "gamebattles_social_leave_menu"
			})
		end

		Invitation.DHACFECHAG(arg_33_0.invitationID)
	end
end

local var_0_13 = {
	playerInvite = "dwPlayerInvite"
}
local var_0_14 = {
	[var_0_13.playerInvite] = var_0_12
}

local function var_0_15(arg_35_0)
	arg_35_0.description = Engine.CBBHFCGDIC("LUA_MENU/KOREA_OVER_INDULGENCE_DESCRIPTION", arg_35_0.hours)
	arg_35_0.displayTime = 4000
end

local function var_0_16(arg_36_0)
	arg_36_0.icon = "hud_icon_player"
	arg_36_0.displayTime = var_0_5

	if arg_36_0.success then
		arg_36_0.description = Engine.CBBHFCGDIC("LUA_MENU/REQUEST_SENT_SUCCESS")
	else
		local var_36_0 = arg_36_0.errorCode or FRIENDS.AddFriendErrorCode.GENERAL

		arg_36_0.description = Engine.CBBHFCGDIC(FRIENDS.ErrorCodeToDesc[var_36_0])
	end
end

local function var_0_17(arg_37_0)
	arg_37_0.icon = "hud_icon_player"
	arg_37_0.description = Engine.CBBHFCGDIC("LUA_MENU/FRIEND_REQUEST_RECEIVED")
	arg_37_0.header = arg_37_0.friendName
	arg_37_0.displayTime = var_0_4
	arg_37_0.buttonPromptLeft = Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST")
	arg_37_0.persistent = true
	arg_37_0.useBnetFont = true

	function arg_37_0.callback()
		if LUI.FlowManager.IsInStack("SocialMenu") then
			LUI.FlowManager.GetScopedData("SocialMenu").enableRefreshFriendsList = false
		end

		if arg_37_0.isCrossplay then
			Social.BIHDCJGFCI(arg_37_0.controllerIndex, arg_37_0.xuidString)
		else
			Social.IBEHACGBI(arg_37_0.controllerIndex, arg_37_0.xuidString)
		end

		Social.DAFDEJICJJ(arg_37_0.controllerIndex, Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_IS_FRIEND"), arg_37_0.xuidString, arg_37_0.friendName)
	end
end

local function var_0_18(arg_39_0)
	arg_39_0.icon = "hud_icon_player"
	arg_39_0.displayTime = var_0_5

	if arg_39_0.success then
		arg_39_0.description = Engine.CBBHFCGDIC("LUA_MENU/FRIEND_REQUEST_ACCEPTED")
	else
		arg_39_0.description = Engine.CBBHFCGDIC("LUA_MENU/FRIEND_REQUEST_ACCEPTING_FAILED")
	end
end

local function var_0_19(arg_40_0)
	arg_40_0.icon = "hud_icon_player"
	arg_40_0.displayTime = var_0_5

	if arg_40_0.success then
		arg_40_0.header = Engine.CBBHFCGDIC("LUA_MENU/JOIN_PARTY_ATTEMPT_TOAST_HEADER")

		if arg_40_0.partyId == PartyType.PRIVATE_PARTY_ID then
			arg_40_0.description = Engine.CBBHFCGDIC("LUA_MENU/JOIN_PARTY_ATTEMPT_SUCCESS_TOAST_DESC")
		else
			arg_40_0.description = Engine.CBBHFCGDIC("LUA_MENU/JOIN_GAME_ATTEMPT_SUCCESS_TOAST_DESC")
		end
	else
		arg_40_0.header = Engine.CBBHFCGDIC("LUA_MENU/JOIN_PARTY_ATTEMPT_TOAST_HEADER")
		arg_40_0.description = Engine.CBBHFCGDIC("LUA_MENU/JOIN_PARTY_ATTEMPT_FAILURE_TOAST_DESC")

		if Dvar.IBEGCHEFE("NQRONQMKPM") then
			arg_40_0.description = arg_40_0.description .. arg_40_0.inviteJoinErrorCode
		end
	end
end

local function var_0_20(arg_41_0)
	arg_41_0.icon = "hud_icon_player"
	arg_41_0.displayTime = var_0_5

	if arg_41_0.success then
		arg_41_0.header = Engine.CBBHFCGDIC("LUA_MENU/CROSSLAUNCH_ATTEMPT_TOAST_HEADER")
		arg_41_0.description = Engine.CBBHFCGDIC("LUA_MENU/CROSSLAUNCH_ATTEMPT_SUCCESS_TOAST_DESC")
	else
		arg_41_0.header = Engine.CBBHFCGDIC("LUA_MENU/CROSSLAUNCH_ATTEMPT_TOAST_HEADER")
		arg_41_0.description = Engine.CBBHFCGDIC("LUA_MENU/CROSSLAUNCH_ATTEMPT_FAILURE_TOAST_DESC")
	end
end

local function var_0_21(arg_42_0)
	arg_42_0.icon = "hud_icon_player"
	arg_42_0.displayTime = var_0_5

	if arg_42_0.crossplaySetting then
		arg_42_0.header = Engine.CBBHFCGDIC("LUA_MENU/PARTY_SETTING_CHANGED")
		arg_42_0.description = Engine.CBBHFCGDIC("LUA_MENU/HOST_ENABLED_CROSSPLAY")
	else
		arg_42_0.header = Engine.CBBHFCGDIC("LUA_MENU/PARTY_SETTING_CHANGED")
		arg_42_0.description = Engine.CBBHFCGDIC("LUA_MENU/HOST_DISABLED_CROSSPLAY")
	end
end

local function var_0_22(arg_43_0)
	arg_43_0.icon = "hud_icon_player"
	arg_43_0.displayTime = var_0_5
	arg_43_0.header = Engine.CBBHFCGDIC("MENU/WARNING")
	arg_43_0.description = Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_USER_IN_PARTY")
end

local function var_0_23(arg_44_0)
	arg_44_0.icon = "hud_icon_player"
	arg_44_0.description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_RECEIVED")
	arg_44_0.displayTime = var_0_4
	arg_44_0.buttonPromptLeft = Engine.CBBHFCGDIC("REGIMENTS/RECEIVED_INVITE_PROMPT")
	arg_44_0.leftTooltip = "REGIMENTS/RECEIVED_INVITE_PROMPT"

	function arg_44_0.callback()
		LUI.FlowManager.RequestLeaveMenuByName("SocialMenu", true, true)
		LUI.FlowManager.RequestLeaveMenuByName("RegimentInvitePopup", true, true)
		LUI.FlowManager.RequestLeaveMenuByName("RegimentInvitationPopup", true, true)
		LUI.FlowManager.RequestAddMenu("SocialMenu", true, arg_44_0.controllerIndex, false, {
			setRegimentsDefault = true
		}, false)
	end

	function arg_44_0.disabled()
		return not Engine.DDJFBBJAIG()
	end
end

local function var_0_24(arg_47_0)
	arg_47_0.icon = "hud_icon_player"
	arg_47_0.description = Engine.CBBHFCGDIC("REGIMENTS/INVITE_SENT")
	arg_47_0.displayTime = 3000
end

local function var_0_25(arg_48_0)
	arg_48_0.icon = "hud_icon_player"

	local var_48_0 = ""

	if arg_48_0.success then
		var_48_0 = "REGIMENTS/INVITE_ACCEPTED"
	elseif arg_48_0.error and FRIENDS.ErrorCodeToDesc[arg_48_0.error] then
		var_48_0 = FRIENDS.ErrorCodeToDesc[arg_48_0.error]
	else
		var_48_0 = "REGIMENTS/ACCEPT_INVITE_FAIL"
	end

	arg_48_0.description = Engine.CBBHFCGDIC(var_48_0)
	arg_48_0.displayTime = 3000
end

local function var_0_26(arg_49_0)
	arg_49_0.icon = "hud_icon_player"
	arg_49_0.displayTime = var_0_5
	arg_49_0.useBnetFont = true
	arg_49_0.header = Engine.JCBDICCAH(arg_49_0.joinerName)

	if arg_49_0.partyId == PartyType.PRIVATE_PARTY_ID then
		arg_49_0.description = Engine.CBBHFCGDIC("LUA_MENU/PLAYER_HAS_JOINED_PARTY")
	else
		arg_49_0.description = Engine.CBBHFCGDIC("LUA_MENU/PLAYER_HAS_JOINED_GAME")
	end
end

local function var_0_27(arg_50_0)
	arg_50_0.icon = "hud_icon_player"
	arg_50_0.displayTime = var_0_5
	arg_50_0.useBnetFont = true
	arg_50_0.header = Engine.JCBDICCAH(arg_50_0.leaverName)
	arg_50_0.description = Engine.CBBHFCGDIC("LUA_MENU/PLAYER_HAS_LEFT_PARTY")
end

local function var_0_28(arg_51_0)
	arg_51_0.icon = "hud_icon_player"
	arg_51_0.displayTime = var_0_5
	arg_51_0.description = Engine.CBBHFCGDIC("MENU/POPUP_INVITE_SENT")
end

local function var_0_29(arg_52_0)
	arg_52_0.icon = "hud_icon_player"
	arg_52_0.displayTime = var_0_5
	arg_52_0.description = Engine.CBBHFCGDIC("LUA_MENU/PLAYER_BLOCKED")
end

local function var_0_30(arg_53_0)
	arg_53_0.icon = "hud_icon_player"
	arg_53_0.displayTime = var_0_5
	arg_53_0.description = Engine.CBBHFCGDIC("LUA_MENU/PLAYER_UNBLOCKED")
end

local function var_0_31(arg_54_0)
	arg_54_0.icon = "hud_info_alert"
	arg_54_0.header = Engine.CBBHFCGDIC("TOURNAMENT/REMINDER_HEADER")
	arg_54_0.displayTime = 8000
	arg_54_0.type = LUI.ToastManager.NotificationType.Tournament

	function arg_54_0.disabled()
		return Tournament.BEAIBEGFFB() or LUI.FlowManager.IsInStack(TOURNAMENT.GetMenuName("loading"))
	end
end

local function var_0_32(arg_56_0)
	arg_56_0.icon = "hud_info_alert"
	arg_56_0.header = Engine.CBBHFCGDIC("TOURNAMENT/CALLBACK_HEADER")
	arg_56_0.persistent = true
	arg_56_0.useHoldButton = true
	arg_56_0.buttonPromptLeft = Engine.CBBHFCGDIC("TOURNAMENT/JOIN_TOURNAMENT")
	arg_56_0.displayTime = 30000
	arg_56_0.type = LUI.ToastManager.NotificationType.Tournament

	function arg_56_0.callback()
		if TOURNAMENT.DoEntranceCheck(arg_56_0.controllerIndex, true) then
			Tournament.DCBJHBBJHF(arg_56_0.controllerIndex)

			return true
		end
	end

	function arg_56_0.disabled()
		return Tournament.BEAIBEGFFB() or LUI.FlowManager.IsInStack(TOURNAMENT.GetMenuName("loading"))
	end
end

local function var_0_33(arg_59_0)
	arg_59_0.icon = "hud_info_alert"
	arg_59_0.header = Engine.CBBHFCGDIC("TOURNAMENT/REJOIN_TOURNAMENT_HEADER")
	arg_59_0.persistent = true
	arg_59_0.useHoldButton = true
	arg_59_0.buttonPromptLeft = Engine.CBBHFCGDIC("TOURNAMENT/REJOIN_TOURNAMENT")
	arg_59_0.displayTime = 60000
	arg_59_0.type = LUI.ToastManager.NotificationType.Tournament

	function arg_59_0.callback()
		if TOURNAMENT.DoEntranceCheck(arg_59_0.controllerIndex) then
			Tournament.GBBIEEGE(arg_59_0.controllerIndex)

			return true
		end
	end

	function arg_59_0.disabled()
		return Tournament.BEAIBEGFFB() or LUI.FlowManager.IsInStack(TOURNAMENT.GetMenuName("loading"))
	end
end

local var_0_34 = {
	rejoinTournamentCallback = "genRejoinTournamentCallback",
	overIndulgenceNotice = "genOverIndulgenceNotice",
	crossplaySettingChanged = "genCrossplaySettingChanged",
	clansInviteSent = "clans_invite_sent",
	playerUnblocked = "genPlayerUnblocked",
	friendRequestReceived = "genFriendRequestReceived",
	crossplaySettingDisabledOtherPlatformUserInPartyWarning = "genCrossplaySettingDisabledOtherPlatformUserInPartyWarning",
	clansInviteAccepted = "clans_invite_accepted",
	crosslaunchAttempt = "genCrosslaunchAttempt",
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
local var_0_35 = {
	[var_0_34.friendRequestSend] = var_0_16,
	[var_0_34.friendRequestReceived] = var_0_17,
	[var_0_34.friendRequestAccepted] = var_0_18,
	[var_0_34.joinPartyAttempt] = var_0_19,
	[var_0_34.receivePartyJoin] = var_0_26,
	[var_0_34.receivePartyLeave] = var_0_27,
	[var_0_34.partyInviteSent] = var_0_28,
	[var_0_34.playerBlocked] = var_0_29,
	[var_0_34.playerUnblocked] = var_0_30,
	[var_0_34.tournamentReminder] = var_0_31,
	[var_0_34.joinTournamentCallback] = var_0_32,
	[var_0_34.rejoinTournamentCallback] = var_0_33,
	[var_0_34.overIndulgenceNotice] = var_0_15,
	[var_0_34.crossplaySettingChanged] = var_0_21,
	[var_0_34.crossplaySettingDisabledOtherPlatformUserInPartyWarning] = var_0_22,
	[var_0_34.clansInviteReceived] = var_0_23,
	[var_0_34.clansInviteSent] = var_0_24,
	[var_0_34.clansInviteAccepted] = var_0_25,
	[var_0_34.crosslaunchAttempt] = var_0_20
}
local var_0_36 = {
	PC = "pc",
	DemonWare = "dw",
	General = "gen"
}
local var_0_37 = {
	[var_0_36.General] = {
		[var_0_34.friendRequestReceived] = var_0_34.friendRequestReceived
	},
	[var_0_36.PC] = {
		[var_0_10.playerInvite] = var_0_10.playerInvite
	},
	[var_0_36.DemonWare] = {
		[var_0_13.playerInvite] = var_0_13.playerInvite
	}
}

local function var_0_38(arg_62_0)
	if arg_62_0.genEventName and var_0_37[var_0_36.General][arg_62_0.genEventName] then
		return true
	elseif arg_62_0.pcEventName and var_0_37[var_0_36.PC][arg_62_0.pcEventName] then
		return true
	elseif arg_62_0.dwEventName and var_0_37[var_0_36.DemonWare][arg_62_0.dwEventName] then
		return true
	end

	return false
end

function LUI.ToastManager.CreateToastNotification(arg_63_0, arg_63_1)
	if #arg_63_0.notificationQueue > LUI.ToastManager.MaxQueuedNotifications then
		return
	end

	if #arg_63_0.pendingNotificationQueue > LUI.ToastManager.MaxQueuedNotifications then
		return
	end

	assert(arg_63_1)

	arg_63_1.controllerIndex = arg_63_1.controllerIndex or arg_63_0._controllerIndex

	if Engine.BECCFCBIAA("displayInviteNotification", arg_63_1.controllerIndex) == 0 and var_0_38(arg_63_1) then
		return
	end

	if arg_63_1.type ~= LUI.ToastManager.NotificationType.CoDCasterPreset and (CODCASTER_CONDITIONS.IsMPCODCaster() or MLG.DBIBHEAEGD()) then
		return
	end

	if arg_63_1.genEventName and var_0_35[arg_63_1.genEventName] then
		var_0_35[arg_63_1.genEventName](arg_63_1)

		if arg_63_1.disabled and arg_63_1.disabled() then
			return
		end
	elseif CONDITIONS.IsPCDesktop(arg_63_0) and arg_63_1.pcEventName and var_0_11[arg_63_1.pcEventName] then
		var_0_11[arg_63_1.pcEventName](arg_63_1)
	elseif arg_63_1.dwEventName and var_0_14[arg_63_1.dwEventName] then
		var_0_14[arg_63_1.dwEventName](arg_63_1)
	end

	arg_63_1.priority = arg_63_1.priority or 1
	arg_63_1.priority = LUI.clamp(arg_63_1.priority, 1, 100)
	arg_63_1.persistent = arg_63_1.persistent or false
	arg_63_1.displayTime = arg_63_1.displayTime or 10000
	arg_63_1.type = arg_63_1.type or LUI.ToastManager.NotificationType.None

	arg_63_0:RemoveQueuedNotificationsOfType(arg_63_1.type)

	if not CONDITIONS.InGame() or Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() or not arg_63_1.callback then
		arg_63_0:PushNotificationOptions(arg_63_1)
		arg_63_0:ProcessNotifications()
	else
		arg_63_0:PushPendingNotificationOptions(arg_63_1)
		arg_63_0:ProcessPendingNotification()
	end

	return true
end

function LUI.ToastManager.IsInGameNotificationWithCallback(arg_64_0, arg_64_1)
	if CONDITIONS.InGame() and arg_64_1.callback then
		return true
	end

	return false
end

function LUI.ToastManager.RemoveQueuedNotificationsOfType(arg_65_0, arg_65_1)
	if not arg_65_0.notificationQueue then
		return
	end

	local var_65_0 = #arg_65_0.notificationQueue

	if var_65_0 <= 0 or arg_65_1 == LUI.ToastManager.NotificationType.None then
		return
	end

	for iter_65_0 = 1, var_65_0 do
		if arg_65_0.notificationQueue[iter_65_0].type == arg_65_1 then
			arg_65_0.notificationQueue[iter_65_0] = nil
		end
	end

	local var_65_1 = 0

	for iter_65_1 = 1, var_65_0 do
		if arg_65_0.notificationQueue[iter_65_1] ~= nil then
			var_65_1 = var_65_1 + 1
			arg_65_0.notificationQueue[var_65_1] = arg_65_0.notificationQueue[iter_65_1]
		end
	end

	for iter_65_2 = var_65_1 + 1, var_65_0 do
		arg_65_0.notificationQueue[iter_65_2] = nil
	end
end

function LUI.ToastManager.ProcessNotifications(arg_66_0)
	if not arg_66_0:CanDisplayNotification() then
		return
	end

	local var_66_0 = arg_66_0:PopNotificationOptions()

	if var_66_0 then
		if arg_66_0:IsInGameNotificationWithCallback(var_66_0) then
			if Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() and LUI.IsLastInputGamepad(arg_66_0._controllerIndex) then
				arg_66_0:PushPendingNotificationOptions(var_66_0)

				var_66_0.ToOptionsPrompt = true
				var_66_0.displayTime = var_0_4
			end
		else
			arg_66_0.currentNotifications = arg_66_0.currentNotifications + 1
		end

		arg_66_0.currentNotificationOptions = var_66_0

		arg_66_0:DisplayNewNotification(var_66_0)
		arg_66_0:ProcessNotifications()
	end
end

function LUI.ToastManager.ProcessPendingNotification(arg_67_0)
	if not arg_67_0:CanDisplayPendingNotification() then
		return
	end

	local var_67_0 = arg_67_0:PopPendingNotificationOptions()

	if var_67_0 then
		var_67_0.ToOptionsPrompt = false
		var_67_0.displayTime = var_67_0.callback and var_0_4 or var_0_5
		arg_67_0.currentPendingNotifications = arg_67_0.currentPendingNotifications + 1
		arg_67_0.currentNotificationOptions = var_67_0

		arg_67_0:DisplayNewNotification(var_67_0)
		arg_67_0:ProcessPendingNotification()
	end
end

function LUI.ToastManager.CanDisplayNotification(arg_68_0)
	if #arg_68_0.notificationQueue <= 0 then
		return false
	end

	if arg_68_0.currentNotifications >= arg_68_0.maxNotifications then
		return false
	end

	if not arg_68_0.activeCallbackFunc then
		return true
	else
		local var_68_0 = #arg_68_0.notificationQueue

		for iter_68_0 = 1, #arg_68_0.notificationQueue do
			if not arg_68_0.notificationQueue[iter_68_0].callback then
				return true
			end
		end
	end

	return false
end

function LUI.ToastManager.CanDisplayPendingNotification(arg_69_0)
	if #arg_69_0.pendingNotificationQueue <= 0 then
		return false
	end

	if arg_69_0.currentPendingNotifications >= arg_69_0.maxNotifications then
		return false
	end

	if not arg_69_0.activeCallbackFunc then
		return true
	else
		local var_69_0 = #arg_69_0.pendingNotificationQueue

		for iter_69_0 = 1, #arg_69_0.notificationQueue do
			if not arg_69_0.pendingNotificationQueue[iter_69_0].callback then
				return true
			end
		end
	end

	return false
end

function LUI.ToastManager.PopNotificationOptions(arg_70_0)
	for iter_70_0 = 1, #arg_70_0.notificationQueue do
		if arg_70_0.notificationQueue[iter_70_0].callback then
			if not arg_70_0.activeCallbackFunc then
				return table.remove(arg_70_0.notificationQueue, iter_70_0)
			end
		else
			return table.remove(arg_70_0.notificationQueue, iter_70_0)
		end
	end
end

function LUI.ToastManager.PopPendingNotificationOptions(arg_71_0)
	for iter_71_0 = 1, #arg_71_0.pendingNotificationQueue do
		if arg_71_0.pendingNotificationQueue[iter_71_0].callback then
			if not arg_71_0.activeCallbackFunc then
				return table.remove(arg_71_0.pendingNotificationQueue, iter_71_0)
			end
		else
			return table.remove(arg_71_0.pendingNotificationQueue, iter_71_0)
		end
	end
end

function LUI.ToastManager.PushNotificationOptions(arg_72_0, arg_72_1)
	for iter_72_0 = 1, #arg_72_0.notificationQueue do
		if arg_72_0.notificationQueue[iter_72_0].priority < arg_72_1.priority then
			return table.insert(arg_72_0.notificationQueue, iter_72_0, arg_72_1)
		end
	end

	return table.insert(arg_72_0.notificationQueue, arg_72_1)
end

function LUI.ToastManager.PushPendingNotificationOptions(arg_73_0, arg_73_1)
	for iter_73_0 = 1, #arg_73_0.pendingNotificationQueue do
		if arg_73_0.pendingNotificationQueue[iter_73_0].priority < arg_73_1.priority then
			return table.insert(arg_73_0.pendingNotificationQueue, iter_73_0, arg_73_1)
		end
	end

	return table.insert(arg_73_0.pendingNotificationQueue, arg_73_1)
end

function LUI.ToastManager.AddToFeed(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_0.feed

	assert(var_74_0)

	local var_74_1 = var_74_0:getFirstChild()
	local var_74_2

	if not var_74_1 then
		var_74_0:addElement(arg_74_1)

		return
	else
		while var_74_1 do
			if var_74_1.persistent then
				var_74_2 = var_74_1
				var_74_1 = var_74_1:getNextSibling()
			else
				arg_74_1:addElementBefore(var_74_1)

				return
			end
		end
	end

	arg_74_1:addElementAfter(var_74_2)
end

function LUI.ToastManager.HandleButtonPressed(arg_75_0, arg_75_1)
	if not LUI.IsLastInputGamepad(arg_75_0._controllerIndex) then
		return false
	end

	local var_75_0 = arg_75_1.button
	local var_75_1 = "button_" .. var_75_0

	if var_75_1 == arg_75_0.buttonLeftForCallback and arg_75_0.activeCallbackFunc and arg_75_0.callbackToast then
		if arg_75_0.useHoldButton then
			arg_75_0.callbackToast.ToastNotification.HoldButton:processEvent(arg_75_1)

			return true
		elseif arg_75_1.down then
			arg_75_0.activeCallbackFunc()
			arg_75_0:RemoveNotification(arg_75_0.callbackToast)

			arg_75_0.activeCallbackFunc = nil

			return true
		end
	elseif var_75_1 == arg_75_0.buttonRightForCallback and arg_75_0.activeCallbackFunc and arg_75_0.callbackToast then
		if arg_75_1.down then
			arg_75_0:RemoveNotification(arg_75_0.callbackToast)

			arg_75_0.activeCallbackFunc = nil

			return true
		end
	else
		return false
	end
end

function LUI.ToastManager.AssignCallbackToNotification(arg_76_0, arg_76_1, arg_76_2)
	if not LUI.IsLastInputGamepad(arg_76_0._controllerIndex) then
		arg_76_2.ToastNotification.MenuButtonLeft:registerEventHandler("button_action", function(arg_77_0, arg_77_1)
			if arg_76_0.callbackToast then
				arg_76_1.callback()
				arg_76_0:RemoveNotification(arg_76_0.callbackToast)

				return true
			else
				return false
			end
		end)
		arg_76_2.ToastNotification.MenuButtonRight:registerEventHandler("button_action", function(arg_78_0, arg_78_1)
			if arg_76_0.callbackToast then
				arg_76_0:RemoveNotification(arg_76_0.callbackToast)

				return true
			else
				return false
			end
		end)
	else
		arg_76_1.button = CoD.GetButtonForCurrentInput(arg_76_0._controllerIndex, arg_76_0.buttonLeftForCallback)
	end
end

function LUI.ToastManager.AssignHoldButtonCallbackToNotification(arg_79_0, arg_79_1, arg_79_2)
	local var_79_0 = arg_79_2.ToastNotification.HoldButton

	LUI.AddUIHoldButtonLogic(var_79_0, arg_79_1.controllerIndex, {
		requireFocus = false,
		duration = 2000,
		buttons = {
			alt1 = true
		},
		fill = var_79_0.GenericProgressBar,
		onFill = function()
			if arg_79_0.callbackToast._isNotificationWithCallbackOnScreen and arg_79_0.activeCallbackFunc then
				arg_79_1.callback()
				arg_79_0:RemoveNotification(arg_79_0.callbackToast)
			end
		end
	})
end

function LUI.ToastManager.RemoveNotification(arg_81_0, arg_81_1)
	if not arg_81_1 then
		return
	end

	arg_81_1._markForRemoval = true

	if arg_81_1 == arg_81_0.callbackToast then
		if not arg_81_0.useHoldButton then
			arg_81_1.ToastNotification.MenuButtonLeft:processEvent({
				name = "button_up"
			})
		end

		arg_81_1.ToastNotification.MenuButtonLeft:SetHandleMouse(false)
		arg_81_1.ToastNotification.MenuButtonRight:SetHandleMouse(false)

		arg_81_0.activeCallbackFunc = nil
		arg_81_1._isNotificationWithCallbackOnScreen = false
	end

	ACTIONS.AnimateSequence(arg_81_1, "HideAll")

	arg_81_1:Wait(300).onComplete = function()
		local var_82_0 = arg_81_1:SetTop(0, arg_81_0.resizeAnimationTime, LUI.EASING.outQuadratic)

		arg_81_1:SetBottom(0, arg_81_0.resizeAnimationTime, LUI.EASING.outQuadratic).onComplete = function()
			ACTIONS.AnimateSequence(arg_81_1, "Reset")

			if arg_81_1 == arg_81_0.callbackToast then
				arg_81_0.callbackToast = nil
			end

			arg_81_0.feed:RemoveElement(arg_81_1)
			arg_81_1.ToastNotification:closeTree()

			arg_81_1.options.ToOptionsPrompt = false

			if arg_81_0:IsInGameNotificationWithCallback(arg_81_1.options) and not Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() then
				arg_81_0.currentPendingNotifications = arg_81_0.currentPendingNotifications > 0 and arg_81_0.currentPendingNotifications - 1 or 0

				arg_81_0:ProcessPendingNotification()
			else
				arg_81_0.currentNotifications = arg_81_0.currentNotifications > 0 and arg_81_0.currentNotifications - 1 or 0

				arg_81_0:ProcessNotifications()
			end
		end
	end
	arg_81_0._activeToast = false

	Engine.DBFFAEEFGJ():dispatchEventToRoot({
		dispatchChildren = true,
		name = "br_pause_menu_show_open_scoreboard_prompt",
		immediate = true
	})
end

function LUI.ToastManager.DisplayNewNotification(arg_84_0, arg_84_1)
	assert(arg_84_1)

	local var_84_0 = MenuBuilder.BuildRegisteredType("ToastNotificationContainer", {
		controllerIndex = arg_84_1.controllerIndex
	})

	var_84_0._notificationType = arg_84_1.type
	arg_84_0._activeToast = true

	if arg_84_1.callback then
		arg_84_0.callbackToast = var_84_0
		arg_84_0.activeCallbackFunc = arg_84_1.callback
	end

	local function var_84_1(arg_85_0, arg_85_1, arg_85_2)
		if arg_85_2.callback then
			assert(type(arg_85_2.callback) == "function")

			arg_85_1.useHoldButton = arg_85_2.useHoldButton and LUI.IsLastInputGamepad(arg_85_1._controllerIndex)

			if arg_85_1.useHoldButton then
				if arg_85_0._isNotificationWithCallbackOnScreen then
					arg_85_0.ToastNotification.HoldButton:SetHandleMouse(true)
				end

				arg_85_0.ToastNotification.HoldButton:processEvent({
					name = "button_over"
				})
				arg_85_1:AssignHoldButtonCallbackToNotification(arg_85_2, arg_85_0)
			else
				if arg_85_0._isNotificationWithCallbackOnScreen then
					arg_85_0.ToastNotification.MenuButtonLeft:SetHandleMouse(true)
					arg_85_0.ToastNotification.MenuButtonRight:SetHandleMouse(true)
				end

				arg_85_1:AssignCallbackToNotification(arg_85_2, arg_85_0)
			end
		end
	end

	var_84_0:SetData(arg_84_1)
	var_84_0:SetAlpha(0)

	if arg_84_1.wordWrap then
		var_84_0.ToastNotification.CenterDescription:SetVerticalAlignment(LUI.Alignment.Center)
		var_84_0.ToastNotification.CenterDescription:SetWordWrap(true)
	end

	var_84_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * -arg_84_0.notificationWidth, 0, 0)
	arg_84_0:AddToFeed(var_84_0)

	var_84_0.manager = arg_84_0
	var_84_0.options = arg_84_1

	var_84_0:addAndCallEventHandler("update_input_type", function(arg_86_0, arg_86_1)
		arg_86_0:SetGraphics(arg_86_0.options)
		var_84_1(arg_86_0, arg_86_0.manager, arg_86_0.options)
	end)

	local var_84_2 = var_84_0:SetTop(0, arg_84_0.resizeAnimationTime, LUI.EASING.outQuadratic)

	var_84_0:SetBottom(_1080p * arg_84_0.notificationHeight, arg_84_0.resizeAnimationTime, LUI.EASING.outQuadratic).onComplete = function()
		var_84_0:SetAlpha(1)

		if arg_84_1.callback then
			var_84_0._isNotificationWithCallbackOnScreen = true

			if arg_84_0.useHoldButton then
				var_84_0.ToastNotification.HoldButton:SetHandleMouse(true)
			else
				var_84_0.ToastNotification.MenuButtonLeft:SetHandleMouse(true)
				var_84_0.ToastNotification.MenuButtonRight:SetHandleMouse(true)
			end
		end

		ACTIONS.AnimateSequence(var_84_0, "SlideInFromRight")
	end

	local function var_84_3(arg_88_0, arg_88_1)
		arg_84_0:RemoveNotification(arg_88_0)

		arg_88_1.ToOptionsPrompt = false
		arg_88_1.displayTime = var_0_4
	end

	local var_84_4

	local function var_84_5(arg_89_0)
		if var_84_0 and not var_84_0._markForRemoval then
			if arg_84_0.useHoldButton and var_84_0.ToastNotification.HoldButton.GenericProgressBar:GetProgress() > 0 then
				var_84_0.ToastNotification:Wait(100, true).onComplete = function()
					var_84_5(true)
				end
			elseif arg_89_0 then
				var_84_0.ToastNotification:Wait(3000, true).onComplete = function()
					if var_84_0.ToastNotification.HoldButton.GenericProgressBar:GetProgress() > 0 then
						var_84_5(true)
					else
						var_84_3(var_84_0, arg_84_1)
					end
				end
			else
				var_84_3(var_84_0, arg_84_1)
			end
		end
	end

	var_84_0:Wait(arg_84_1.displayTime).onComplete = function()
		var_84_5(false)
	end
end

function LUI.ToastManager.QueueGiftRecipientXuid(arg_93_0, arg_93_1)
	arg_93_0._giftRecipientQueue = arg_93_0._giftRecipientQueue or LUI.CreateQueue()

	arg_93_0._giftRecipientQueue:Push(arg_93_1)
end
