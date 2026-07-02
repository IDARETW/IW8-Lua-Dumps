CRM = CRM or {}
CRM.DebugMessageContent = {
	action_title = "Redeem!",
	message_index = 0,
	item = "400092",
	action = "redeem",
	content_long = "Your Free Reward Pack includes:\n\n-\tTHREE 1 hour 2XP Tokens\n-\tTHREE 1 hour 2WXP Tokens\n-\tTWO Battle Pass Tier Skips \n\n",
	image = "mw_featured_2xp_2wxp_2xtiers_generic",
	action_location = "store_item",
	popup_image = "mw_motd_2xp_2wxp_2xtiers_generic",
	title = "Claim Free Reward Pack",
	layout_type = 0,
	checksum = "134612161",
	content_short = "Tier Skips will activate instantly, and your 2XP Tokens will be ready to use!",
	location_id = 6,
	message_id = "941"
}
CRM.DebugNGLiveEvent = {
	image = "blade_live_event_2xp_backing_ng",
	content_long = "NG Debug - Long",
	content_short = "NG Debug - Short"
}
CRM.DebugCWLiveEvent = {
	image = "blade_live_event_2xp_backing",
	content_long = "CW Debug - Long",
	content_short = "CW Debug - Short"
}
CRM.DebugMWLiveEvent = {
	image = "blade_live_event_2xp_backing_mw",
	content_long = "MW Debug - Long",
	content_short = "MW Debug - Short"
}
CRM.DebugWZLiveEvent = {
	image = "blade_live_event_2xp_backing_wz",
	content_long = "WZ Debug - Long: This extra copy will force a scroll",
	content_short = "WZ Debug - Short: This extra copy will force a scroll"
}
CRM.DebugBPLiveEvent = {
	image = "blade_live_event_2xp_backing_bp",
	content_long = "MW Debug - Long",
	content_short = "MW Debug - Short"
}
CRM.DebugFreeTrialLiveEvent = {
	image = "blade_live_event_mp_free_trial_backing",
	content_long = "MW Debug - Long",
	content_short = "MW Debug - Short"
}
CRM.locations = {
	MP_MOTD = 1,
	CP_MOTD = 11,
	CS_NOTIFICATIONS = 10,
	MW_LIVE_EVENT = 22,
	BR_MOTD = 6,
	WZ_LIVE_EVENT = 23,
	CP_MSGS = 12,
	NG_LIVE_EVENT = 27,
	BR_MSGS = 7,
	CW_LIVE_EVENT = 24,
	MP_MSGS = 2,
	STORE = 12,
	UNUSABLE = 0,
	PATCH_NOTES = 8,
	ENFORCEMENT_NOTIFICATIONS = 9
}
CRM.keys = {
	LAYOUT_TYPE = "layout_type",
	ACTION_LOCATION = "action_location",
	STORE_ITEM = "item",
	LOCATION_ID = "location_id",
	OPTION_ITEM = "item",
	POPUP_IMAGE = "popup_image",
	IMAGE = "image",
	FORCE_VIEW_TIME = "force_view_time",
	CHECKSUM = "checksum",
	TITLE = "title",
	END_DATE = "end_date",
	CONTENT_LONG = "content_long",
	CONTENT_SHORT = "content_short",
	MESSAGE_ID = "message_id",
	START_DATE = "start_date",
	ACTION = "action",
	MESSAGE_INDEX = "message_index",
	ACTION_TITLE = "action_title"
}
CRM.viewTime = 10000
CRM.CSMessagesMax = 2
CRM.LayoutRegisteredTypes = {
	[0] = "CRMLayoutDefault",
	"CRMLayoutFullImage",
	"CRMLayoutBundle",
	"CRMLayoutDefault"
}
CRM.MessageQueue = {}

function CRM.QueueMessage(arg_1_0, arg_1_1)
	table.insert(CRM.MessageQueue, {
		message = arg_1_0,
		controllerIndex = arg_1_1
	})
end

function CRM.SendQueuedMessages()
	while #CRM.MessageQueue > 0 do
		local var_2_0 = table.remove(CRM.MessageQueue, 1)

		Engine.EBIDFIDHIE(var_2_0.message, var_2_0.controllerIndex)
	end
end

function CRM.IsLocationMOTD(arg_3_0)
	return arg_3_0 == CRM.locations.MP_MOTD or arg_3_0 == CRM.locations.CP_MOTD or arg_3_0 == CRM.locations.BR_MOTD
end

function CRM.GetCurrentModeMOTDLocation()
	if CONDITIONS.IsMagmaGameMode() then
		return CRM.locations.BR_MOTD
	elseif CONDITIONS.IsThirdGameMode() then
		return CRM.locations.CP_MOTD
	else
		return CRM.locations.MP_MOTD
	end
end

function CRM.GetCurrentModeMOTDChecksumData(arg_5_0)
	local var_5_0 = PlayerData.BFFBGAJGD(arg_5_0, CoD.StatsGroup.NonGame)

	if CONDITIONS.IsMagmaGameMode() then
		return var_5_0.brMotdChecksum
	elseif CONDITIONS.IsThirdGameMode() then
		return var_5_0.cpMotdChecksum
	else
		return var_5_0.mpMotdChecksum
	end
end

function CRM.TryForceOpenCRMWindow(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = Engine.IJEBHJIJF()

	if Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG() then
		return false
	end

	if not Engine.CCGJCIECBJ(var_6_0) then
		return false
	end

	arg_6_2 = arg_6_2 or 0

	local var_6_1 = CRM.GetMessageData(var_6_0, arg_6_1, arg_6_2)

	if var_6_1 then
		if CRM.IsLocationMOTD(arg_6_1) then
			local var_6_2 = PlayerData.BFFBGAJGD(var_6_0, CoD.StatsGroup.NonGame)
			local var_6_3 = CRM.GetCurrentModeMOTDChecksumData(var_6_0)

			if not var_6_3 then
				return false
			end

			local var_6_4 = Dvar.IBEGCHEFE("STRONQSLO")
			local var_6_5 = tonumber(var_6_1[CRM.keys.CHECKSUM])

			if var_6_5 == tonumber(var_6_3:get()) and not var_6_4 then
				return false
			end

			if var_6_1[CRM.keys.ACTION] == "goto_ingame" and var_6_1[CRM.keys.ACTION_LOCATION] == "store_item" then
				local var_6_6 = var_6_1[CRM.keys.STORE_ITEM]
				local var_6_7, var_6_8 = STORE.GetIndexForBundle(var_6_6, var_6_0)

				if not (var_6_7 and var_6_8) then
					return false
				end
			end

			var_6_3:set(var_6_5)
			CRM.OpenCRMWindow(arg_6_0, true)

			return true
		elseif arg_6_1 == CRM.locations.ENFORCEMENT_NOTIFICATIONS or arg_6_1 == CRM.locations.CS_NOTIFICATIONS then
			if (CRM.GetMessageViewCountDatasource(var_6_1, var_6_0):GetValue(var_6_0) or 0) > 0 then
				return false
			end

			CRM.OpenCRMWindow(arg_6_0, true, var_6_1)

			return true
		end
	end
end

function CRM.OpenCRMWindow(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = Engine.IJEBHJIJF()

	LUI.FlowManager.RequestPopupMenu(self, "CRMContainer", true, var_7_0, false, {
		sourceMenu = arg_7_0,
		forceOpen = arg_7_1,
		messageData = arg_7_2
	})
end

function CRM.GetMessageViewCountDatasource(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0[CRM.keys.CHECKSUM] or "1"

	return (LUI.DataSourceInGlobalModel.new("alwaysLoaded.CRM.views." .. var_8_0))
end

function CRM.ViewMessage(arg_9_0, arg_9_1)
	local var_9_0 = CRM.GetMessageViewCountDatasource(arg_9_0, arg_9_1)
	local var_9_1 = var_9_0:GetValue(arg_9_1) or 0
	local var_9_2 = "markCRMMessageRead " .. arg_9_0.location_id .. " " .. arg_9_0.message_index

	CRM.QueueMessage(var_9_2, arg_9_1)
	var_9_0:SetValue(arg_9_1, var_9_1 + 1)
end

function CRM.GetPatchNoteMessageData()
	local function var_10_0(arg_11_0)
		local var_11_0 = {}

		for iter_11_0 in string.gmatch(arg_11_0, "{%*section%*}(.-){/%*section%*}") do
			var_11_0[#var_11_0 + 1] = iter_11_0
		end

		local var_11_1 = {}

		for iter_11_1 = 1, #var_11_0 do
			local var_11_2 = string.match(var_11_0[iter_11_1], "{%*title%*}(.-){/%*title%*}") or ""
			local var_11_3 = string.match(var_11_0[iter_11_1], "{%*body%*}(.-){/%*body%*}") or ""
			local var_11_4 = {
				title = var_11_2,
				body = var_11_3
			}

			table.insert(var_11_1, var_11_4)
		end

		return var_11_1
	end

	local var_10_1 = Engine.IJEBHJIJF()
	local var_10_2 = {}
	local var_10_3 = CRM.locations.PATCH_NOTES
	local var_10_4 = Dvar.CFHDGABACF("NNNSQLQO")

	for iter_10_0 = 0, Engine.CIJDCFGGHD(var_10_1, var_10_3) do
		if #var_10_2 == var_10_4 then
			break
		end

		local var_10_5 = CRM.GetMessageData(var_10_1, var_10_3, iter_10_0)

		if var_10_5 then
			var_10_5[CRM.keys.CONTENT_LONG] = var_10_0(var_10_5[CRM.keys.CONTENT_LONG])
			var_10_2[#var_10_2 + 1] = var_10_5
		end
	end

	return var_10_2
end

function CRM.GetMessageContent(arg_12_0, arg_12_1, arg_12_2)
	if Dvar.IBEGCHEFE("OMLPQNOPPL") then
		if CRM.IsLocationMOTD(arg_12_1) and arg_12_2 == 0 then
			return CRM.DebugMessageContent
		elseif arg_12_1 == CRM.locations.NG_LIVE_EVENT and arg_12_2 == 0 then
			return CRM.DebugNGLiveEvent
		elseif arg_12_1 == CRM.locations.CW_LIVE_EVENT and arg_12_2 == 0 then
			return CRM.DebugCWLiveEvent
		elseif arg_12_1 == CRM.locations.MW_LIVE_EVENT and arg_12_2 == 0 then
			return CRM.DebugMWLiveEvent
		elseif arg_12_1 == CRM.locations.WZ_LIVE_EVENT and arg_12_2 == 0 then
			return CRM.DebugWZLiveEvent
		else
			return false
		end
	end

	local var_12_0 = Engine.CEGFGEGBEH(arg_12_0, arg_12_1, arg_12_2)

	if var_12_0 then
		return var_12_0.message
	else
		return false
	end
end

function CRM.GetMenuMessageData()
	local var_13_0 = Engine.IJEBHJIJF()
	local var_13_1
	local var_13_2

	if Engine.ECHCFGDDDF() then
		if CONDITIONS.IsMagmaGameMode() then
			var_13_1 = CRM.locations.BR_MOTD
			var_13_2 = CRM.locations.BR_MSGS
		else
			var_13_1 = CRM.locations.MP_MOTD
			var_13_2 = CRM.locations.MP_MSGS
		end
	else
		var_13_1 = CRM.locations.CP_MOTD
		var_13_2 = CRM.locations.CP_MSGS
	end

	local var_13_3 = STORE.GetCategoryData(var_13_0)

	local function var_13_4(arg_14_0)
		if arg_14_0[CRM.keys.ACTION] == "goto_ingame" and arg_14_0[CRM.keys.ACTION_LOCATION] == "store_item" then
			local var_14_0 = arg_14_0[CRM.keys.STORE_ITEM]
			local var_14_1, var_14_2 = STORE.GetIndexForBundle(var_14_0, var_13_0, var_13_3)

			if not (var_14_1 and var_14_2) then
				return false
			end
		end

		return true
	end

	local var_13_5 = {}
	local var_13_6 = CRM.GetMessageData(var_13_0, var_13_1, 0)

	if var_13_6 and var_13_4(var_13_6) then
		var_13_6.index = #var_13_5

		table.insert(var_13_5, var_13_6)
	end

	local var_13_7 = Dvar.CFHDGABACF("NSKOMKOSLO")

	for iter_13_0 = 0, Engine.CIJDCFGGHD(var_13_0, var_13_2) do
		if #var_13_5 == var_13_7 then
			break
		end

		local var_13_8 = CRM.GetMessageData(var_13_0, var_13_2, iter_13_0)

		if var_13_8 and var_13_4(var_13_8) then
			var_13_8.index = #var_13_5

			table.insert(var_13_5, var_13_8)
		end
	end

	return var_13_5
end

function CRM.GetMessageData(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = CRM.GetMessageContent(arg_15_0, arg_15_1, arg_15_2)

	if not var_15_0 then
		return nil
	end

	var_15_0[CRM.keys.LOCATION_ID] = arg_15_1

	if not var_15_0[CRM.keys.LAYOUT_TYPE] then
		var_15_0[CRM.keys.LAYOUT_TYPE] = 0
	else
		var_15_0[CRM.keys.LAYOUT_TYPE] = tonumber(var_15_0[CRM.keys.LAYOUT_TYPE])
	end

	if not var_15_0[CRM.keys.TITLE] or var_15_0[CRM.keys.TITLE] == "" then
		var_15_0[CRM.keys.TITLE] = Engine.CBBHFCGDIC("LUA_MENU/MOTD_CAPS")
	else
		var_15_0[CRM.keys.TITLE] = var_15_0[CRM.keys.TITLE]
	end

	if not var_15_0[CRM.keys.CONTENT_SHORT] then
		var_15_0[CRM.keys.CONTENT_SHORT] = ""
	else
		var_15_0[CRM.keys.CONTENT_SHORT] = var_15_0[CRM.keys.CONTENT_SHORT]
	end

	if not var_15_0[CRM.keys.CONTENT_LONG] then
		var_15_0[CRM.keys.CONTENT_LONG] = ""
	else
		var_15_0[CRM.keys.CONTENT_LONG] = var_15_0[CRM.keys.CONTENT_LONG]
	end

	if not var_15_0[CRM.keys.POPUP_IMAGE] then
		var_15_0[CRM.keys.POPUP_IMAGE] = var_15_0[CRM.keys.POPUP_IMAGE] or "mw_keyart"
	end

	if not var_15_0[CRM.keys.IMAGE] then
		var_15_0[CRM.keys.IMAGE] = var_15_0[CRM.keys.IMAGE] or "mw_keyart_small"
	end

	if arg_15_1 == CRM.locations.ENFORCEMENT_NOTIFICATIONS or arg_15_1 == CRM.locations.CS_NOTIFICATIONS then
		if not var_15_0[CRM.keys.FORCE_VIEW_TIME] then
			var_15_0[CRM.keys.FORCE_VIEW_TIME] = 5
		end

		var_15_0[CRM.keys.ACTION_TITLE] = nil
		var_15_0[CRM.keys.ACTION] = nil
	end

	if var_15_0[CRM.keys.ACTION] and #var_15_0[CRM.keys.ACTION] > 0 then
		if not var_15_0[CRM.keys.ACTION_TITLE] or var_15_0[CRM.keys.ACTION_TITLE] == "" then
			var_15_0[CRM.keys.ACTION_TITLE] = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		end

		local var_15_1 = CRM.actionFunctions[var_15_0[CRM.keys.ACTION]]

		if var_15_1 ~= nil then
			var_15_0.actionFunction = var_15_1(arg_15_0, var_15_0)
		end
	end

	return var_15_0
end

function CRM.OpenCRMWindows(arg_16_0)
	arg_16_0:saveState()

	arg_16_0.nextLocation = CRM.locations.ENFORCEMENT_NOTIFICATIONS

	local var_16_0

	local function var_16_1()
		if arg_16_0.nextLocation then
			local var_17_0 = CRM.TryForceOpenCRMWindow(arg_16_0, arg_16_0.nextLocation, arg_16_0.nextMessageIndex)

			if arg_16_0.nextLocation == CRM.locations.ENFORCEMENT_NOTIFICATIONS then
				arg_16_0.nextLocation = CRM.locations.CS_NOTIFICATIONS
				arg_16_0.nextMessageIndex = 0
			elseif arg_16_0.nextLocation == CRM.locations.CS_NOTIFICATIONS then
				if arg_16_0.nextMessageIndex + 1 == CRM.CSMessagesMax then
					arg_16_0.nextLocation = CRM.GetCurrentModeMOTDLocation()
					arg_16_0.nextMessageIndex = 0
				else
					arg_16_0.nextMessageIndex = arg_16_0.nextMessageIndex + 1
				end
			elseif CRM.IsLocationMOTD(arg_16_0.nextLocation) then
				arg_16_0.nextLocation = nil
			end

			if not var_17_0 then
				var_16_1()
			end
		end
	end

	var_16_1()
	arg_16_0:addEventHandler("restore_focus", var_16_1)
end

function CRM.SetupBackButtonHandler(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	if not arg_18_0.bindButton then
		local var_18_0 = LUI.UIBindButton.new()

		var_18_0.id = "bindButton"

		arg_18_0:addElement(var_18_0)

		arg_18_0.bindButton = var_18_0
	end

	local function var_18_1()
		arg_18_0.bindButton:addEventHandler("button_secondary", function(arg_20_0, arg_20_1)
			arg_18_4._lastButtonPressed = "button_secondary"

			ACTIONS.LeaveMenu(arg_18_0)
		end)
	end

	if arg_18_2[CRM.keys.FORCE_VIEW_TIME] and arg_18_3 then
		local var_18_2 = tonumber(arg_18_2[CRM.keys.FORCE_VIEW_TIME]) * 1000
		local var_18_3 = MenuBuilder.BuildRegisteredType("UICountdown", {
			controllerIndex = arg_18_1
		})

		var_18_3.id = "CountdownElement"

		var_18_3:SetFont(FONTS.GetFont(FONTS.MainLight.File))
		var_18_3:SetAlignment(LUI.Alignment.Right)
		var_18_3:setEndTime(Engine.BFBIDEGDFB() + var_18_2)
		var_18_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 296, _1080p * 931, _1080p * 979)
		arg_18_0:addElement(var_18_3)

		arg_18_0:Wait(var_18_2).onComplete = function()
			var_18_3:closeTree()

			var_18_3 = nil

			arg_18_4:AddButtonHelperText({
				clickable = true,
				priority = -10,
				side = "left",
				button_ref = "button_secondary",
				helper_text = Engine.CBBHFCGDIC("MENU/BACK")
			})
			var_18_1()
		end
	else
		arg_18_0:addEventHandler("menu_create", function(arg_22_0, arg_22_1)
			arg_18_4:AddButtonHelperText({
				clickable = true,
				priority = -10,
				side = "left",
				button_ref = "button_secondary",
				helper_text = Engine.CBBHFCGDIC("MENU/CLOSE")
			})
		end)
		var_18_1()
	end
end

function CRM.UpdateCRMData(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	local var_23_0 = "markCRMMessageRead " .. arg_23_2 .. " " .. arg_23_3

	if arg_23_4 then
		CRM.QueueMessage(var_23_0, arg_23_1)
	else
		Engine.EBIDFIDHIE(var_23_0, arg_23_1)
	end

	arg_23_0:dispatchEventToRoot({
		name = "update_crm_data",
		controllerIndex = arg_23_1
	})
end

function CRM.QueueReadMessage(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = "markCRMMessageRead " .. arg_24_2 .. " " .. arg_24_3

	CRM.QueueMessage(var_24_0, arg_24_1)
end

local function var_0_0(arg_25_0, arg_25_1)
	return function(arg_26_0, arg_26_1)
		Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_25_1[CRM.keys.LOCATION_ID], arg_25_1[CRM.keys.MESSAGE_ID], "goto_franchise_store", storeItem), arg_25_0)
		CRM.QueueReadMessage(arg_26_0, arg_25_0, arg_25_1[CRM.keys.LOCATION_ID], arg_25_1[CRM.keys.MESSAGE_INDEX])

		local var_26_0 = arg_25_1[CRM.keys.STORE_ITEM]

		STORE.GoToStore(arg_25_0, arg_26_0:GetCurrentMenu().id, arg_26_0.id, var_26_0)
	end
end

local function var_0_1(arg_27_0, arg_27_1)
	return function(arg_28_0, arg_28_1)
		local var_28_0 = arg_27_1[CRM.keys.STORE_ITEM]

		Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_27_1[CRM.keys.LOCATION_ID], arg_27_1[CRM.keys.MESSAGE_ID], "goto_first_party_store", var_28_0), arg_27_0)
		CRM.QueueReadMessage(arg_28_0, arg_27_0, arg_27_1[CRM.keys.LOCATION_ID], arg_27_1[CRM.keys.MESSAGE_INDEX])

		if InGameStore.GetProduct(arg_27_0, var_28_0) ~= nil then
			InGameStore.SelectProduct(arg_27_0, var_28_0, InGameStorePurchaseType.BROWSE)
		end
	end
end

local function var_0_2(arg_29_0, arg_29_1)
	return function(arg_30_0, arg_30_1)
		local var_30_0 = arg_29_1[CRM.keys.STORE_ITEM]

		Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_29_1[CRM.keys.LOCATION_ID], arg_29_1[CRM.keys.MESSAGE_ID], "goto_upsell", var_30_0), arg_29_0)
		CRM.QueueReadMessage(arg_30_0, arg_29_0, arg_29_1[CRM.keys.LOCATION_ID], arg_29_1[CRM.keys.MESSAGE_INDEX])

		if STORE.IsGameUpsellProduct(var_30_0) then
			LUI.FlowManager.RequestPopupMenu(nil, "MagmaUpsellFullScreenPopup", true, arg_30_1.controller, false, {
				controllerIndex = arg_29_0
			})
			InGameStore.SelectProduct(arg_29_0, var_30_0, InGameStorePurchaseType.BROWSE)
		elseif STORE.IsZeusProduct(var_30_0) or STORE.IsZeusTrialProduct(var_30_0) then
			LUI.FlowManager.RequestAddMenu("StoreGameUpsellPopup", true, arg_29_0, false, {
				preFetched = true,
				isZeus = true,
				defaultProductId = var_30_0
			}, true)
		elseif STORE.IsVanguardProduct(var_30_0) then
			LUI.FlowManager.RequestPopupMenu(arg_30_0, "VGPreOrderPopup", true, arg_30_0._controllerIndex, false, {
				allowWeaponPreview = true,
				defaultProductId = var_30_0
			})
		end
	end
end

local function var_0_3(arg_31_0, arg_31_1)
	if PROGRESSION.AreCustomLoadoutsUnlocked(arg_31_0) then
		return function(arg_32_0, arg_32_1)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_31_1[CRM.keys.LOCATION_ID], arg_31_1[CRM.keys.MESSAGE_ID], "goto_ingame", "loadouts"), arg_31_0)
			CRM.QueueReadMessage(arg_32_0, arg_31_0, arg_31_1[CRM.keys.LOCATION_ID], arg_31_1[CRM.keys.MESSAGE_INDEX])

			return {
				tabToFocus = "MPWeaponMenu",
				buttonToFocus = "EditLoadoutButton",
				openMenuFunction = function()
					LUI.FlowManager.RequestAddMenu("LoadoutSelect", true, arg_31_0)
				end
			}
		end
	end
end

local function var_0_4(arg_34_0, arg_34_1)
	if #WEAPON.GetModifications(arg_34_0) > 0 or LUI.WebViewManager.MotdEnabled() then
		return function(arg_35_0, arg_35_1)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_34_1[CRM.keys.LOCATION_ID], arg_34_1[CRM.keys.MESSAGE_ID], "goto_ingame", "armory"), arg_34_0)
			CRM.QueueReadMessage(arg_35_0, arg_34_0, arg_34_1[CRM.keys.LOCATION_ID], arg_34_1[CRM.keys.MESSAGE_INDEX])

			return {
				tabToFocus = "MPWeaponMenu",
				buttonToFocus = "WeaponLockerButton",
				openMenuFunction = function()
					LUI.FlowManager.RequestAddMenu("WeaponLocker", true, arg_34_0)
				end
			}
		end
	end
end

local function var_0_5(arg_37_0, arg_37_1)
	if DataSources.frontEnd.lobby.isSolo:GetValue(arg_37_0) then
		return function(arg_38_0, arg_38_1)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_37_1[CRM.keys.LOCATION_ID], arg_37_1[CRM.keys.MESSAGE_ID], "goto_ingame", "trials"), arg_37_0)
			CRM.QueueReadMessage(arg_38_0, arg_37_0, arg_37_1[CRM.keys.LOCATION_ID], arg_37_1[CRM.keys.MESSAGE_INDEX])

			return {
				tabToFocus = "MPPlayMenu",
				buttonToFocus = "TrialsButton",
				openMenuFunction = function()
					TRIALS.OpenTrialsMenu(arg_38_0, arg_37_0)
				end
			}
		end
	end
end

local function var_0_6(arg_40_0, arg_40_1)
	local var_40_0 = DataSources.frontEnd.lobby.isSolo:GetValue(arg_40_0)

	local function var_40_1(arg_41_0)
		Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_40_1[CRM.keys.LOCATION_ID], arg_40_1[CRM.keys.MESSAGE_ID], "goto_ingame", "tournaments"), arg_40_0)
		CRM.QueueReadMessage(self, arg_40_0, arg_40_1[CRM.keys.LOCATION_ID], arg_40_1[CRM.keys.MESSAGE_INDEX])

		return {
			buttonToFocus = "TournamentButton",
			tabToFocus = arg_41_0,
			openMenuFunction = function()
				TOURNAMENT.OpenTournamentSignUp(arg_40_0)
			end
		}
	end

	if Engine.HEEFCICJE() then
		if TOURNAMENT.IsF2PTournamentAllowed(self) and var_40_0 then
			return function(arg_43_0, arg_43_1)
				return var_40_1("BRPlayMenu")
			end
		end
	elseif CONDITIONS.IsTournamentModeAllowed(self) and var_40_0 then
		return function(arg_44_0, arg_44_1)
			return var_40_1("MPPlayMenu")
		end
	end
end

local function var_0_7(arg_45_0, arg_45_1)
	if not CONDITIONS.IsWeGameGovBanned() then
		return function(arg_46_0, arg_46_1)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_45_1[CRM.keys.LOCATION_ID], arg_45_1[CRM.keys.MESSAGE_ID], "goto_ingame", "barracks"), arg_45_0)
			CRM.QueueReadMessage(arg_46_0, arg_45_0, arg_45_1[CRM.keys.LOCATION_ID], arg_45_1[CRM.keys.MESSAGE_INDEX])

			return {
				tabToFocus = "MPBarracksMenu"
			}
		end
	end
end

local function var_0_8(arg_47_0, arg_47_1)
	if not CONDITIONS.IsWeGameGovBanned() and not Engine.DBAEJAHFGJ(arg_47_0) then
		return function(arg_48_0, arg_48_1)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_47_1[CRM.keys.LOCATION_ID], arg_47_1[CRM.keys.MESSAGE_ID], "goto_ingame", "missions"), arg_47_0)
			CRM.QueueReadMessage(arg_48_0, arg_47_0, arg_47_1[CRM.keys.LOCATION_ID], arg_47_1[CRM.keys.MESSAGE_INDEX])

			if CONDITIONS.IsChallengeTabEnabled() then
				return {
					tabToFocus = "ChallengeMenu",
					buttonToFocus = "MissionsButton",
					openMenuFunction = function()
						LUI.FlowManager.RequestAddMenu("ChallengeMenuMissions", true, arg_47_0)
					end
				}
			else
				return {
					tabToFocus = "MPBarracksMenu",
					buttonToFocus = "ChallengesButton",
					openMenuFunction = function()
						LUI.FlowManager.RequestAddMenu("BarracksChallenges", true, arg_47_0)
					end
				}
			end
		end
	end
end

local function var_0_9(arg_51_0, arg_51_1)
	return function(arg_52_0, arg_52_1)
		if CONDITIONS.IsChallengeTabEnabled() then
			return {
				tabToFocus = "ChallengeMenu"
			}
		end
	end
end

local function var_0_10(arg_53_0, arg_53_1)
	return function(arg_54_0, arg_54_1)
		Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_53_1[CRM.keys.LOCATION_ID], arg_53_1[CRM.keys.MESSAGE_ID], "goto_ingame", "social"), arg_53_0)
		CRM.QueueReadMessage(arg_54_0, arg_53_0, arg_53_1[CRM.keys.LOCATION_ID], arg_53_1[CRM.keys.MESSAGE_INDEX])

		if LUI.WebViewManager.MotdEnabled() then
			LUI.WebViewManager.Instance():RequestCloseFullScreen(true)
		else
			ACTIONS.LeaveMenu(arg_54_0)
		end

		FRIENDS.OpenFriendsList(arg_53_0)
	end
end

local function var_0_11(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_1[CRM.keys.STORE_ITEM]
	local var_55_1 = STORE.GetCategoryIndex(arg_55_0, var_55_0)

	if CONDITIONS.IsStoreAllowed() and var_55_1 ~= nil then
		return function(arg_56_0, arg_56_1)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_55_1[CRM.keys.LOCATION_ID], arg_55_1[CRM.keys.MESSAGE_ID], "goto_ingame", "store"), arg_55_0)
			CRM.QueueReadMessage(arg_56_0, arg_55_0, arg_55_1[CRM.keys.LOCATION_ID], arg_55_1[CRM.keys.MESSAGE_INDEX])

			return {
				tabToFocus = "MPStoreMenu",
				buttonToFocus = var_55_0
			}
		end
	end
end

local function var_0_12(arg_57_0, arg_57_1)
	if CONDITIONS.IsStoreAllowed() then
		return function(arg_58_0, arg_58_1)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_57_1[CRM.keys.LOCATION_ID], arg_57_1[CRM.keys.MESSAGE_INDEX], "goto_ingame", "Store"), arg_57_0)
			CRM.QueueReadMessage(arg_58_0, arg_57_0, arg_57_1[CRM.keys.LOCATION_ID], arg_57_1[CRM.keys.MESSAGE_INDEX])

			local var_58_0 = arg_57_1[CRM.keys.STORE_ITEM]

			return {
				triggerButtonAction = true,
				tabToFocus = "MPStoreMenu",
				bundleToFocus = var_58_0
			}
		end
	end
end

local function var_0_13(arg_59_0, arg_59_1)
	if CONDITIONS.IsGiftingEnabled() then
		return function(arg_60_0, arg_60_1)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_59_1[CRM.keys.LOCATION_ID], arg_59_1[CRM.keys.MESSAGE_INDEX], "goto_ingame", "BundleGifting"), arg_59_0)
			CRM.QueueReadMessage(arg_60_0, arg_59_0, arg_59_1[CRM.keys.LOCATION_ID], arg_59_1[CRM.keys.MESSAGE_INDEX])

			local var_60_0 = arg_59_1[CRM.keys.STORE_ITEM]

			return {
				openGiftingPopupType = "bundle",
				bundleIDToGift = var_60_0
			}
		end
	end
end

local function var_0_14(arg_61_0, arg_61_1)
	if CONDITIONS.IsBattlePassEnabled() then
		return function(arg_62_0, arg_62_1)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_61_1[CRM.keys.LOCATION_ID], arg_61_1[CRM.keys.MESSAGE_ID], "goto_ingame", "battlepass"), arg_61_0)
			CRM.QueueReadMessage(arg_62_0, arg_61_0, arg_61_1[CRM.keys.LOCATION_ID], arg_61_1[CRM.keys.MESSAGE_INDEX])

			return {
				tabToFocus = "BattlePassMenu"
			}
		end
	end
end

local function var_0_15(arg_63_0, arg_63_1)
	return function(arg_64_0, arg_64_1)
		Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_63_1[CRM.keys.LOCATION_ID], arg_63_1[CRM.keys.MESSAGE_ID], "goto_ingame", "operators"), arg_63_0)
		CRM.QueueReadMessage(arg_64_0, arg_63_0, arg_63_1[CRM.keys.LOCATION_ID], arg_63_1[CRM.keys.MESSAGE_INDEX])

		local var_64_0 = "MPOperatorMenu"

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_64_0 = "WZOperatorSelect"
		end

		return {
			tabToFocus = var_64_0
		}
	end
end

local function var_0_16(arg_65_0, arg_65_1)
	return function(arg_66_0, arg_66_1)
		Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_65_1[CRM.keys.LOCATION_ID], arg_65_1[CRM.keys.MESSAGE_ID], "goto_ingame", "options"), arg_65_0)
		CRM.QueueReadMessage(arg_66_0, arg_65_0, arg_65_1[CRM.keys.LOCATION_ID], arg_65_1[CRM.keys.MESSAGE_INDEX])

		if Dvar.IBEGCHEFE("LSQNRLMKST") then
			local var_66_0 = arg_65_1[CRM.keys.OPTION_ITEM]
			local var_66_1 = {}

			if var_66_0 then
				var_66_1 = split(var_66_0, "#")
			end

			local var_66_2 = {
				activeTabId = var_66_1[1],
				focusedOptionId = var_66_1[2]
			}

			LUI.FlowManager.RequestAddMenu("OptionsMenuNewLayout", true, arg_65_0, nil, var_66_2, true)
		else
			ACTIONS.OpenMenu("OptionsMenu", true, arg_65_0)
		end
	end
end

local function var_0_17(arg_67_0, arg_67_1)
	return function(arg_68_0, arg_68_1)
		LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_67_0, false)
	end
end

local function var_0_18(arg_69_0, arg_69_1)
	if BATTLEPASS.IsOwned(arg_69_0) then
		LUI.FlowManager.GetScopedData("MainMenu").returnToMainMenu = true

		return var_0_12(arg_69_0, arg_69_1)
	else
		local var_69_0 = var_0_14(arg_69_0, arg_69_1)

		return function(arg_70_0, arg_70_1)
			LUI.FlowManager.GetScopedData("MainMenu").crmPurchaseBattlePass = true

			return var_69_0(arg_70_0, arg_70_1)
		end
	end
end

local function var_0_19(arg_71_0, arg_71_1)
	if CONDITIONS.IsGiftingEnabled() then
		return function(arg_72_0, arg_72_1)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_71_1[CRM.keys.LOCATION_ID], arg_71_1[CRM.keys.MESSAGE_INDEX], "goto_ingame", "BattlePassGifting"), arg_71_0)
			CRM.QueueReadMessage(arg_72_0, arg_71_0, arg_71_1[CRM.keys.LOCATION_ID], arg_71_1[CRM.keys.MESSAGE_INDEX])

			return {
				openGiftingPopupType = "battlepass"
			}
		end
	end
end

local function var_0_20(arg_73_0, arg_73_1)
	if CONDITIONS.IsMagmaGameMode() then
		return function(arg_74_0, arg_74_1)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_73_1[CRM.keys.LOCATION_ID], arg_73_1[CRM.keys.MESSAGE_INDEX], "goto_ingame", "BundleLocker"), arg_73_0)
			CRM.QueueReadMessage(arg_74_0, arg_73_0, arg_73_1[CRM.keys.LOCATION_ID], arg_73_1[CRM.keys.MESSAGE_INDEX])

			return {
				tabToFocus = "MPWeaponMenu",
				buttonToFocus = "BundleLockerButton",
				openMenuFunction = function()
					LUI.FlowManager.RequestAddMenu("BundleLockerMenu", true, arg_73_0)
				end
			}
		end
	end
end

local function var_0_21(arg_76_0, arg_76_1)
	assert(arg_76_1[CRM.keys.ACTION_LOCATION])

	local var_76_0 = CRM.LocationFunctions[arg_76_1[CRM.keys.ACTION_LOCATION]]

	if arg_76_1[CRM.keys.ACTION_LOCATION] == "franchise_store" and arg_76_1[CRM.keys.STORE_ITEM] then
		var_76_0 = CRM.LocationFunctions.franchise_store_item
	end

	if var_76_0 ~= nil then
		return var_76_0(arg_76_0, arg_76_1)
	end
end

local function var_0_22(arg_77_0, arg_77_1)
	assert(arg_77_1[CRM.keys.ACTION_LOCATION])

	local var_77_0 = arg_77_1[CRM.keys.ACTION_LOCATION]

	if var_77_0 and #var_77_0 > 0 then
		return function(arg_78_0, arg_78_1)
			Engine.BHECIAHGC(arg_78_1.controller, WebBrowserType.FULLSCREEN, var_77_0)
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_77_1[CRM.keys.LOCATION_ID], arg_77_1[CRM.keys.MESSAGE_ID], "goto_url", var_77_0), arg_78_1.controller)
			CRM.QueueReadMessage(arg_78_0, arg_78_1.controller, arg_77_1[CRM.keys.LOCATION_ID], arg_77_1[CRM.keys.MESSAGE_INDEX])
			CRM.UpdateCRMData(arg_78_0, arg_78_1.controller, arg_77_1[CRM.keys.LOCATION_ID], arg_77_1[CRM.keys.MESSAGE_ID])
		end
	end
end

local function var_0_23()
	local var_79_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/REGISTRATION_FAILED")
	}
	local var_79_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_79_0)

	var_79_1.id = "RegistrationFailedPopup"

	return var_79_1
end

MenuBuilder.registerType("RegistrationFailedPopup", var_0_23)

local function var_0_24(arg_80_0, arg_80_1)
	local var_80_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/REGISTERING_EMAIL"),
		controllerIndex = arg_80_1.controllerIndex
	}
	local var_80_1 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_80_0)

	var_80_1.id = "RegisteringEmailPopup"

	var_80_1:addEventHandler("registration_success", function(arg_81_0, arg_81_1)
		Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_80_1.locationIndex, arg_80_1.messageID, "register", "registration_success"), arg_80_1.controllerIndex)

		local var_81_0 = false

		CRM.UpdateCRMData(arg_81_0, arg_80_1.controllerIndex, arg_80_1.locationIndex, arg_80_1.messageIndex, var_81_0)
		LUI.FlowManager.RequestLeaveMenu(arg_81_0)
	end)
	var_80_1:addEventHandler("registration_error", function(arg_82_0, arg_82_1)
		Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_80_1.locationIndex, arg_80_1.messageID, "register", "registration_error"), arg_80_1.controllerIndex)
		LUI.FlowManager.RequestLeaveMenu(arg_82_0)
		LUI.FlowManager.RequestPopupMenu(arg_82_0, "RegistrationFailedPopup", true, arg_80_1.controllerIndex, false)
	end)

	return var_80_1
end

MenuBuilder.registerType("RegisteringEmailPopup", var_0_24)

local function var_0_25(arg_83_0, arg_83_1)
	return function(arg_84_0, arg_84_1)
		OSK.CBJGJDGFC(arg_83_0, Engine.CBBHFCGDIC("LUA_MENU_MP/REGISTER_EMAIL"), "", 128, false, false, false, function(arg_85_0, arg_85_1, arg_85_2)
			if arg_85_1 then
				LUI.FlowManager.RequestPopupMenu(arg_84_0, "RegisteringEmailPopup", true, arg_85_0, false, {
					messageID = arg_83_1[CRM.keys.MESSAGE_ID],
					messageIndex = arg_83_1[CRM.keys.MESSAGE_INDEX],
					locationIndex = arg_83_1[CRM.keys.LOCATION_ID]
				})
				Engine.CHDJJHJGHH(arg_85_0, arg_85_1)
			end
		end)
	end
end

local function var_0_26(arg_86_0, arg_86_1)
	local var_86_0 = LUI.UIElement.new()

	var_86_0:addEventHandler("menu_create", function(arg_87_0, arg_87_1)
		var_0_25(arg_86_1.controllerIndex, {
			content_long = "KentRocks"
		})(arg_87_0)
		LUI.FlowManager.RequestLeaveMenu(arg_87_0)
	end)

	return var_86_0
end

if Engine.BHICADFIHA() then
	MenuBuilder.registerType("RegisterTestPopup", var_0_26)
end

local function var_0_27(arg_88_0, arg_88_1)
	local var_88_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/REDEEM_CRM_CODE"),
		controllerIndex = arg_88_1.controllerIndex
	}
	local var_88_1 = false
	local var_88_2 = MenuBuilder.BuildRegisteredType("FenceDialogPopup", var_88_0)

	var_88_2.id = "RedeemCRMMessagePopup"

	var_88_2:addEventHandler("redemption_success", function(arg_89_0, arg_89_1)
		LUI.FlowManager.RequestLeaveMenu(arg_89_0)
		Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_88_1.locationIndex, arg_88_1.messageID, "redeem", "redemption_success"), arg_88_1.controllerIndex)
		CRM.UpdateCRMData(arg_89_0, arg_88_1.controllerIndex, arg_88_1.locationIndex, arg_88_1.messageIndex, var_88_1)
		LUI.FlowManager.RequestPopupMenu(arg_89_0, "code_redemption_success", true, arg_88_1.controllerIndex)
	end)
	var_88_2:addEventHandler("redemption_failed", function(arg_90_0, arg_90_1)
		LUI.FlowManager.RequestLeaveMenu(arg_90_0)

		if arg_90_1.errorAlreadyRedeemed then
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_88_1.locationIndex, arg_88_1.messageID, "redeem", "redemption_failed_already_redeemed"), arg_88_1.controllerIndex)
			CRM.UpdateCRMData(arg_90_0, arg_88_1.controllerIndex, arg_88_1.locationIndex, arg_88_1.messageIndex, var_88_1)
			LUI.FlowManager.RequestPopupMenu(arg_90_0, "code_already_redeemed_popup", true, arg_88_1.controllerIndex)
		elseif arg_90_1.errorCodeExpired then
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_88_1.locationIndex, arg_88_1.messageID, "redeem", "redemption_failed_code_expired"), arg_88_1.controllerIndex)
			CRM.UpdateCRMData(arg_90_0, arg_88_1.controllerIndex, arg_88_1.locationIndex, arg_88_1.messageIndex, var_88_1)
			LUI.FlowManager.RequestPopupMenu(arg_90_0, "code_expired_popup", true, arg_88_1.controllerIndex)
		else
			Engine.EBIDFIDHIE(string.format("clickCRMMessageAction %d %d %s %s", arg_88_1.locationIndex, arg_88_1.messageID, "redeem", "redemption_failed"), arg_88_1.controllerIndex)
			LUI.FlowManager.RequestPopupMenu(arg_90_0, "code_redemption_failed_popup", true, arg_88_1.controllerIndex)
		end
	end)

	return var_88_2
end

MenuBuilder.registerType("RedeemCRMMessagePopup", var_0_27)

local function var_0_28(arg_91_0, arg_91_1)
	return function(arg_92_0, arg_92_1)
		if LUI.WebViewManager.MotdEnabled() then
			LUI.WebViewManager.Instance():RequestCloseFullScreen(true)
		else
			LUI.FlowManager.RequestLeaveMenu(arg_92_0)
		end

		LUI.FlowManager.RequestPopupMenu(arg_92_0, "RedeemCRMMessagePopup", true, arg_91_0, false, {
			messageID = arg_91_1[CRM.keys.MESSAGE_ID],
			messageIndex = arg_91_1[CRM.keys.MESSAGE_INDEX],
			locationIndex = arg_91_1[CRM.keys.LOCATION_ID]
		})
		Engine.BCEHEAHAHI(arg_91_0, arg_91_1[CRM.keys.LOCATION_ID], arg_91_1[CRM.keys.MESSAGE_INDEX])
	end
end

function CRM.InitPopupWindow(arg_93_0, arg_93_1, arg_93_2)
	assert(arg_93_1)
	assert(arg_93_2.locationIndex)
	assert(arg_93_2.messageIndex)
	assert(arg_93_2.layoutType)

	local var_93_0 = Engine.IJEBHJIJF()
	local var_93_1 = MenuBuilder.BuildRegisteredType(CRM.LayoutRegisteredTypes[arg_93_2.layoutType], {
		controllerIndex = var_93_0
	})

	if arg_93_2 then
		var_93_1.CRMLastMessageIndex = arg_93_2.messageIndex
		var_93_1.CRMLastLocationIndex = arg_93_2.locationIndex
		var_93_1.CRMForceOpen = arg_93_2.forceOpen
	end

	if not arg_93_1.action or arg_93_1.action ~= "redeem" or not arg_93_2.forceOpen then
		CRM.SetupBackButtonHandler(var_93_1, var_93_0, arg_93_1, arg_93_2.forceOpen, arg_93_0)
	end

	var_93_1:SetupContent(var_93_0, arg_93_1)
	var_93_1:addEventHandler("menu_close", function(arg_94_0, arg_94_1)
		if not arg_93_1.action or arg_93_1.action ~= "redeem" then
			local var_94_0 = true

			CRM.UpdateCRMData(arg_94_0, var_93_0, var_93_1.CRMLastLocationIndex, var_93_1.CRMLastMessageIndex, var_94_0)
		end
	end)

	return var_93_1
end

CRM.actionFunctions = {
	goto_ingame = var_0_21,
	goto_franchise_store = var_0_0,
	goto_first_party_store = var_0_1,
	goto_upsell = var_0_2,
	goto_url = var_0_22,
	register = var_0_25,
	redeem = var_0_28,
	battlepass_tier_gift = var_0_18,
	store_item_gifting = var_0_13,
	battlepass_gifting = var_0_19,
	goto_bundle_locker = var_0_20
}
CRM.LocationFunctions = {
	store = var_0_11,
	store_item = var_0_12,
	social = var_0_10,
	loadouts = var_0_3,
	armory = var_0_4,
	trials = var_0_5,
	tournaments = var_0_6,
	barracks = var_0_7,
	challenges = var_0_9,
	missions = var_0_8,
	battlepass = var_0_14,
	operators = var_0_15,
	options = var_0_16,
	game_install = var_0_17
}
