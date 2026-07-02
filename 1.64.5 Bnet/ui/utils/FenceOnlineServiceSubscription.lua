module(..., package.seeall)

FenceOnlineServiceSubscription = LUI.Class(LUI.Fence)
FenceOnlineServiceSubscription.UPSELL_STATE = {
	done = 3,
	selling = 2,
	inactive = 1
}

function FenceOnlineServiceSubscription.init(arg_1_0)
	LUI.Fence.init(arg_1_0)

	arg_1_0._perController = {}

	for iter_1_0 = 0, Engine.DCJGJDDEHE() - 1 do
		arg_1_0._perController[iter_1_0] = {
			onlineUpsell = FenceOnlineServiceSubscription.UPSELL_STATE.inactive
		}
	end

	arg_1_0._isShowingBlockingPopup = false
end

function FenceOnlineServiceSubscription.Start(arg_2_0)
	DebugPrint("FenceOnlineServiceSubscription.Start")

	if arg_2_0._isShowingBlockingPopup then
		LUI.FlowManager.RequestLeaveMenuByName("popup_waiting_for_online_subscription_info", true)

		arg_2_0._isShowingBlockingPopup = false
	end

	arg_2_0._hasOnlineServiceSub = {}

	for iter_2_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_2_0) and Engine.BHCCFDDEHE(iter_2_0) then
			arg_2_0._hasOnlineServiceSub[iter_2_0] = Engine.CGJEJFBEAG(iter_2_0)
		end
	end
end

function FenceOnlineServiceSubscription.Stop(arg_3_0)
	DebugPrint("FenceOnlineServiceSubscription.Stop")

	if arg_3_0._isShowingBlockingPopup then
		LUI.FlowManager.RequestLeaveMenuByName("popup_waiting_for_online_subscription_info", true)

		arg_3_0._isShowingBlockingPopup = false
	end
end

function FenceOnlineServiceSubscription.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail then
		local var_4_0 = Engine.IJEBHJIJF()
		local var_4_1 = {
			controllerIndex = var_4_0
		}

		LUI.FlowManager.RequestPopupMenu(nil, "PopupNoOnlineServiceSubscriptionError", false, var_4_0, false, var_4_1, nil, false, true)
	end
end

function FenceOnlineServiceSubscription.OnBackOut(arg_5_0)
	DebugPrint("FenceOnlineServiceSubscription.OnBackOut")

	local var_5_0 = Engine.IJEBHJIJF()

	Engine.EBIDFIDHIE("xcancelinvitejoin", var_5_0)

	if Engine.DAFGFCFHJI and not Lobby.DFFFFJHCEH() then
		Engine.DAGFFDGFII("xstopparty")
	end

	if Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG() then
		Engine.DAGFFDGFII("xstopprivateparty")
		Engine.DAGFFDGFII("xstartprivateparty")
	end
end

function FenceOnlineServiceSubscription.UpdateState(arg_6_0)
	assert(arg_6_0._state ~= LUI.Fence.STATE.fail)

	arg_6_0._state = LUI.Fence.STATE.pass

	for iter_6_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_6_0) then
			if Engine.BHCCFDDEHE(iter_6_0) then
				if not arg_6_0._hasOnlineServiceSub[iter_6_0] then
					if arg_6_0._perController[iter_6_0].onlineUpsell == FenceOnlineServiceSubscription.UPSELL_STATE.inactive then
						arg_6_0._perController[iter_6_0].onlineUpsell = FenceOnlineServiceSubscription.UPSELL_STATE.selling
						arg_6_0._state = LUI.Fence.STATE.block

						Engine.DBHBIHJDEC(iter_6_0)

						break
					else
						local var_6_0 = arg_6_0._perController[iter_6_0].onlineUpsell == FenceOnlineServiceSubscription.UPSELL_STATE.selling

						if Engine.EBCDFHECAC() then
							arg_6_0._state = LUI.Fence.STATE.block

							break
						elseif var_6_0 then
							arg_6_0._perController[iter_6_0].onlineUpsell = FenceOnlineServiceSubscription.UPSELL_STATE.done
							arg_6_0._state = LUI.Fence.STATE.fail
						end
					end
				else
					arg_6_0._perController[iter_6_0].onlineUpsell = FenceOnlineServiceSubscription.UPSELL_STATE.inactive
				end
			else
				arg_6_0._state = LUI.Fence.STATE.block

				if not arg_6_0._isShowingBlockingPopup then
					arg_6_0:OpenPopupWaitingForOnlineSubsciptionInfo()
				end
			end
		else
			arg_6_0._perController[iter_6_0].onlineUpsell = FenceOnlineServiceSubscription.UPSELL_STATE.inactive
		end
	end
end

function GetErrorMessageButtons(arg_7_0)
	local var_7_0 = {
		label = Engine.CBBHFCGDIC("MENU/OK"),
		action = function(arg_8_0, arg_8_1)
			LUI.FlowManager.RequestLeaveMenu(arg_8_0:GetCurrentMenu(), true)
		end
	}
	local var_7_1 = {
		label = Engine.CBBHFCGDIC("MENU/GO_OFFLINE"),
		action = function(arg_9_0, arg_9_1)
			Dvar.DHEGHJJJHI("splitscreen", false)
			Engine.CDGCBCBAJ("Going Offline", arg_7_0)
			Engine.DAGFFDGFII("xstopprivateparty")
			Engine.DAGFFDGFII("xstartprivateparty")
			LUI.FlowManager.RequestLeaveMenu(arg_9_0:GetCurrentMenu(), true)
			LUI.FlowManager.RequestAddMenu("MainMenuOffline", false, arg_7_0)
		end
	}

	return {
		var_7_0,
		var_7_1
	}
end

function PopupNoOnlineServiceSubscriptionError(arg_10_0, arg_10_1)
	assert(arg_10_1)

	local var_10_0
	local var_10_1 = Engine.CIEGIACHAE() and "PLATFORM/PSPLUS_REQUIRED" or "XBOXLIVE/MPNOTALLOWED"

	assert(var_10_1)

	local var_10_2 = {
		controllerIndex = arg_10_1.controllerIndex,
		title = Engine.CBBHFCGDIC("MENU/CONNECTION_FAILED"),
		message = Engine.CBBHFCGDIC(var_10_1)
	}
	local var_10_3 = not Engine.BFDACIJIAD(arg_10_1.controllerIndex)

	if var_10_3 then
		var_10_2.message = Engine.CBBHFCGDIC("LUA_MENU/N_NEWLINE_M", Engine.JCBDICCAH(Engine.DHCFHGIABE(arg_10_1.controllerIndex)), var_10_2.message)
	end

	if var_10_3 then
		var_10_2.buttons = BOOT.GetOkayPopupButtons()
	else
		var_10_2.buttons = GetErrorMessageButtons(arg_10_1.controllerIndex)
	end

	local var_10_4 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_10_2)

	var_10_4.id = "PopupNoOnlineServiceSubscriptionError"

	return var_10_4
end

function FenceOnlineServiceSubscription.OpenPopupWaitingForOnlineSubsciptionInfo(arg_11_0)
	LUI.FlowManager.RequestPopupMenu(nil, "popup_waiting_for_online_subscription_info", false, nil, false, args, nil, true, true)

	arg_11_0._isShowingBlockingPopup = true
end

function OpenPopupWaitingForOnlineSubsciptionInfo(arg_12_0, arg_12_1)
	local var_12_0 = {
		message = Engine.CBBHFCGDIC("MENU/WAITING_FOR_ONLINE_SUBSCRIPTION_INFO")
	}
	local var_12_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_12_0)

	var_12_1.id = "popup_waiting_for_online_subscription_info"

	return var_12_1
end

MenuBuilder.registerType("popup_waiting_for_online_subscription_info", OpenPopupWaitingForOnlineSubsciptionInfo)
MenuBuilder.registerType("PopupNoOnlineServiceSubscriptionError", PopupNoOnlineServiceSubscriptionError)
LUI.Fence.Register("onlineServiceSubscription", FenceOnlineServiceSubscription)
LockTable(_M)
