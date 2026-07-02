GIFT = GIFT or {}
GIFT.CATEGORY_BATTLEPASS = "battlepass"
GIFT.CATEGORY_BASICGIFT = "basicGift"
GIFT.GIFT_NOT_APPROVED_REASONS = {
	EXCEEDED_ITEM_MAX_QUANTITY = 1,
	EXCEEDED_MAX_USAGE_TIME = 0,
	ITEM_ALREADY_PERMANENTLY_OWNED = 2,
	UNKNOWN_ERROR_MESSAGE = -1,
	WEEKLY_GIFT_LIMIT_REACHED = 3
}

local function var_0_0(arg_1_0, arg_1_1)
	return (Gifting.BBJAHCGAFC(arg_1_0, arg_1_1))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = arg_2_1:Pop()

	if var_2_0 then
		local var_2_1 = var_2_0.gift_sku
		local var_2_2 = LOOT.GetTypeForID(var_2_1)

		arg_2_2:Push(var_2_0)

		if var_2_2 then
			local var_2_3 = MenuUtils.GetMainMenu()
			local var_2_4 = LUI.FlowManager.GetMenuByName(var_2_3).menu
			local var_2_5

			local function var_2_6(arg_3_0, arg_3_1)
				var_2_4:Wait(200).onComplete = function()
					if LUI.FlowManager.IsInStack("GiftReceivedPopup") then
						var_2_6(arg_3_0, arg_3_1)
					else
						LUI.FlowManager.RequestPopupMenu(nil, "GiftReceivedPopup", true, arg_3_0, false, {
							giftData = arg_3_1
						})
					end
				end
			end

			var_2_6(arg_2_0, var_2_0)
		else
			arg_2_3(arg_2_0)
		end
	else
		local var_2_7 = {}

		while true do
			local var_2_8 = arg_2_2:Pop()

			if not var_2_8 then
				break
			end

			table.insert(var_2_7, var_2_8.gift_index)
		end

		if #var_2_7 > 0 then
			GIFT.MarkGiftsSeen(arg_2_0, var_2_7)
		end
	end
end

function GIFT.GetBattlePassGiftingPossibleRecipients(arg_5_0, arg_5_1)
	return var_0_0(arg_5_0, arg_5_1)
end

function GIFT.GetBundleGiftingPossibleRecipients(arg_6_0, arg_6_1)
	return var_0_0(arg_6_0, arg_6_1)
end

function GIFT.FocusBattlePassTab(arg_7_0, arg_7_1)
	local var_7_0 = MenuUtils.GetMainMenu()
	local var_7_1 = LUI.FlowManager.GetMenuByName(var_7_0).menu

	if var_7_1 and var_7_1.MPTabsMenu and var_7_1.MPTabsMenu.Tabs then
		local var_7_2 = var_7_1.MPTabsMenu:GetTabIndexByWidgetName("BattlePassMenu") - 1

		if var_7_2 and var_7_2 >= 0 then
			local var_7_3 = LUI.IsLastInputGamepad(arg_7_1.controller) and FocusType.Gamepad or FocusType.MouseOver

			var_7_1.MPTabsMenu.Tabs:FocusTab(arg_7_1.controller, var_7_2, var_7_3)
		end
	end
end

function GIFT.IsInBattlePassTab(arg_8_0, arg_8_1)
	local var_8_0 = MenuUtils.GetMainMenu()
	local var_8_1 = LUI.FlowManager.GetMenuByName(var_8_0).menu

	if var_8_1 and var_8_1.MPTabsMenu and var_8_1.MPTabsMenu.Tabs then
		local var_8_2 = var_8_1.MPTabsMenu:GetTabIndexByWidgetName("BattlePassMenu") - 1
		local var_8_3 = var_8_1.MPTabsMenu.Tabs:GetCurrentTabIndex()

		if var_8_2 and var_8_3 and var_8_2 >= 0 and var_8_3 >= 0 and var_8_2 == var_8_3 then
			return true
		end
	end

	return false
end

function GIFT.QueueGiftReceived(arg_9_0)
	local var_9_0 = Gifting.DBCIFGGCEG(arg_9_0)

	if not var_9_0 or #var_9_0 == 0 then
		return
	end

	local var_9_1 = LUI.FlowManager.GetScopedData("MainMenu")

	var_9_1.SeenGifts = var_9_1.SeenGifts or {}
	var_9_1.bundleGiftQueue = var_9_1.bundleGiftQueue or LUI.CreateQueue()
	var_9_1.battlepassGiftQueue = var_9_1.battlepassGiftQueue or LUI.CreateQueue()
	var_9_1.markGiftQueue = var_9_1.markGiftQueue or LUI.CreateQueue()

	for iter_9_0 = 1, #var_9_0 do
		local var_9_2 = var_9_0[iter_9_0]

		if not var_9_1.SeenGifts[var_9_2.gift_index] then
			var_9_1.SeenGifts[var_9_2.gift_index] = var_9_2.gift_index

			if var_9_2.gift_category == GIFT.CATEGORY_BATTLEPASS then
				var_9_1.battlepassGiftQueue:Push(var_9_2)
			else
				var_9_1.bundleGiftQueue:Push(var_9_2)
			end
		end
	end
end

function GIFT.ProcessQueuedBundleGifts(arg_10_0)
	local var_10_0 = LUI.FlowManager.GetScopedData("MainMenu")

	if var_10_0 and var_10_0.bundleGiftQueue then
		var_0_1(arg_10_0, var_10_0.bundleGiftQueue, var_10_0.markGiftQueue, GIFT.ProcessQueuedBundleGifts)
	end
end

function GIFT.ProcessQueuedBattlepassGifts(arg_11_0)
	local var_11_0 = LUI.FlowManager.GetScopedData("MainMenu")

	if var_11_0 and var_11_0.battlepassGiftQueue then
		var_0_1(arg_11_0, var_11_0.battlepassGiftQueue, var_11_0.markGiftQueue, GIFT.ProcessQueuedBattlepassGifts)
	end
end

function GIFT.MarkGiftsSeen(arg_12_0, arg_12_1)
	Gifting.EFBECJEAI(arg_12_0, arg_12_1)

	if LUI.FlowManager.IsInStack("MainMenu") then
		local var_12_0 = LUI.FlowManager.GetScopedData("MainMenu")

		for iter_12_0 = 1, #arg_12_1 do
			local var_12_1 = arg_12_1[iter_12_0]

			var_12_0.SeenGifts[var_12_1] = nil
		end
	end
end

function GIFT.StartFTUEFlow(arg_13_0, arg_13_1)
	assert(arg_13_0._controllerIndex, "[GiftingUtils] Invalid controllerIndex")

	local function var_13_0()
		local var_14_0
		local var_14_1 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
			controllerIndex = arg_13_0._controllerIndex
		})

		var_14_1.id = "Spinner"

		var_14_1:SetAlpha(1)
		var_14_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 720, _1080p * 1060, _1080p * 552, _1080p * 562)
		arg_13_0:addElement(var_14_1)

		arg_13_0._spinner = var_14_1
	end

	local function var_13_1()
		if Onboarding.Gifting2FA.WasCompleted(arg_13_0, arg_13_0._controllerIndex) then
			arg_13_1()

			return
		end

		Onboarding.Gifting2FA.MarkCompleted(arg_13_0, arg_13_0._controllerIndex)

		local var_15_0 = ONBOARDING_DATA.GetGiftingFTUEData2FAEnrolled()

		local function var_15_1(arg_16_0, arg_16_1)
			ACTIONS.LeaveMenu(arg_16_0)
			arg_13_1()
		end

		var_15_0.isEnrolledIn2FA = true
		var_15_0.confirmButton.action = var_15_1
		var_15_0.showBackButton = false

		LUI.FlowManager.RequestPopupMenu(arg_13_0, "onboardingpopup", true, arg_13_0._controllerIndex, false, var_15_0)
	end

	local function var_13_2()
		local var_17_0 = ONBOARDING_DATA.GetGiftingFTUEData2FANotEnrolled()

		var_17_0.isGiftingPopup = true

		function var_17_0.continueSetupAction(arg_18_0, arg_18_1)
			Engine.BHECIAHGC(arg_18_1, WebBrowserType.FULLSCREEN, var_17_0.setup2FA_URL)
		end

		function var_17_0.alreadySetUp2FAAction(arg_19_0, arg_19_1)
			ACTIONS.LeaveMenu(arg_19_0)
			TwoFactorAuth.DEACFDICFJ(arg_19_1, true)
			var_13_0()

			arg_19_0.forceUnloadSpinnerTimer = LUI.UITimer.new({
				interval = 5000,
				event = "force_unload_spinner"
			})
			arg_19_0.forceUnloadSpinnerTimer.id = "forceUnloadSpinnerTimer"

			arg_19_0:addElement(arg_19_0.forceUnloadSpinnerTimer)
		end

		var_17_0.isEnrolledIn2FA = false
		var_17_0.showBackButton = true

		LUI.FlowManager.RequestPopupMenu(arg_13_0, "onboardingpopup", true, arg_13_0._controllerIndex, false, var_17_0)
	end

	arg_13_0:registerEventHandler("two_factor_auth_status", function(arg_20_0, arg_20_1)
		if arg_13_0._spinner then
			arg_13_0:RemoveElement(arg_13_0._spinner)
		end

		if arg_13_0.forceUnloadSpinnerTimer then
			arg_13_0:RemoveElement(arg_13_0.forceUnloadSpinnerTimer)
		end

		if arg_20_1.enrolled then
			var_13_1()
		else
			local var_20_0 = {
				title = Engine.CBBHFCGDIC("MENU/ERROR"),
				message = Engine.CBBHFCGDIC("ONBOARDING/GIFTING_ERROR_2FA_NOT_ENROLLED"),
				action = function()
					var_13_2()
				end
			}

			LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_13_0._controllerIndex, false, var_20_0, nil, false, true)
		end
	end)
	arg_13_0:addEventHandler("force_unload_spinner", function(arg_22_0, arg_22_1)
		if arg_13_0._spinner then
			arg_13_0:RemoveElement(arg_13_0._spinner)
		end
	end)

	if TwoFactorAuth.BDAFCCAEDG(arg_13_0._controllerIndex) then
		var_13_1()
	else
		var_13_2()
	end
end

function GIFT.IsItemGiftable(arg_23_0)
	assert(arg_23_0)

	local var_23_0 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_23_0, CSV.bundleIDs.cols.giftable)

	if var_23_0 and #var_23_0 > 0 then
		return var_23_0 == "1"
	end

	return false
end

function GIFT.WaitForTransitionAndProcessGift(arg_24_0, arg_24_1, arg_24_2)
	if not LUI.FlowManager.IsMenuOnTop(arg_24_2) then
		if not arg_24_0._waitingForTransition then
			arg_24_0._waitingForTransition = true
			arg_24_0:Wait(200).onComplete = function()
				arg_24_0._waitingForTransition = false

				GIFT.WaitForTransitionAndProcessGift(arg_24_0, arg_24_1, arg_24_2)
			end
		end
	else
		arg_24_0._waitingForTransition = false

		GIFT.QueueGiftReceived(arg_24_1)

		local var_24_0 = Engine.DBFFAEEFGJ()

		LUI.UIRoot.ProcessEvent(var_24_0, {
			name = "gift_queued_in"
		})
	end
end

function GIFT.LogGiftingScreenInteraction(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	Engine.CEJJDJJHIJ(arg_26_0, "dlog_event_gifting_interaction", {
		screen_id = arg_26_1,
		screen_duration_ms = arg_26_3,
		previous_screen_id = arg_26_2,
		button_pressed = arg_26_4
	})
end
