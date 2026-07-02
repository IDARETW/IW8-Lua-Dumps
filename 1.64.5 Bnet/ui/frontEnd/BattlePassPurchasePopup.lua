module(..., package.seeall)

local var_0_0 = 4

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.element
	local var_1_1 = arg_1_1.menu

	if var_1_1 ~= nil then
		local var_1_2 = arg_1_1.event
		local var_1_3

		Engine.BJDBIAGIDA(CoD.SFX.MouseClick)

		if var_1_0._focusedButton == var_1_0.BundlePurchaseButton then
			var_1_3 = var_1_0._isLateGrinder and BATTLEPASS.GetPurchaseRef() or BATTLEPASS.GetPurchaseBundleRef()
		elseif var_1_0._focusedButton == var_1_0.PurchaseButton then
			var_1_3 = var_1_0._isLateGrinder and BATTLEPASS.GetPurchaseBundleRef() or BATTLEPASS.GetPurchaseRef()
		end

		local function var_1_4()
			if var_1_0._focusedButton == var_1_0.BundlePurchaseButton then
				BATTLEPASS.RecordVIPGiftEvent(var_1_1._controllerIndex, "purchase_bp_bundle", var_1_0, -2, false)
			elseif var_1_0._focusedButton == var_1_0.PurchaseButton then
				BATTLEPASS.RecordVIPGiftEvent(var_1_1._controllerIndex, "purchase_bp", var_1_0, -2, false)
			end

			local var_2_0 = Engine.DEIDGHDBHD() - var_1_1._screenOpenedTime

			GIFT.LogGiftingScreenInteraction(var_1_1._controllerIndex, "BattlePassPurchasePopup", "BattlePassMenu", var_2_0, var_1_0._focusedButton.id)
		end

		if var_1_0._focusedButton then
			var_1_0._focusedButton._targetItemCost = tonumber(BATTLEPASS.GetItemCost(var_1_3))
			var_1_0._focusedButton._battlePassPurchaseRef = var_1_3

			if var_1_1.GetPurchaseAction then
				if BATTLEPASS.IsTierSkipGiftActive(var_1_1._controllerIndex) then
					var_1_1.shouldAwardFreeTierGift = true
					var_1_1.tierGiftBattlePassPurchaseRef = var_1_3
				end

				local var_1_5 = var_1_1:GetPurchaseAction(var_1_3)

				if var_1_1.IsGiftingToFriend and CONDITIONS.ShouldShowTFACodePopup(var_1_1._controllerIndex) then
					local var_1_6 = {
						isGiftingPopup = true,
						originMenu = "BattlePassPurchasePopup",
						controllerIndex = var_1_1._controllerIndex,
						onSuccess = function()
							var_1_4()
							var_1_5(var_1_0._focusedButton, arg_1_0)
						end,
						onCancel = function()
							return
						end,
						onError = function()
							return
						end
					}

					LUI.FlowManager.RequestPopupMenu(nil, "GiftingTFAPopup", true, var_1_1._controllerIndex, false, var_1_6, nil, true, true)
				else
					var_1_4()
					var_1_5(var_1_0._focusedButton, arg_1_0)
				end
			end
		end
	end
end

local function var_0_2(arg_6_0)
	local var_6_0 = BATTLEPASS.GetTierSkipGiftID()
	local var_6_1 = LOOT.GetItemsInBundle(var_6_0)
	local var_6_2 = BATTLEPASS.GetItemRef(var_6_1[1])
	local var_6_3 = tonumber(BATTLEPASS.GetItemSkips(var_6_2))

	ACTIONS.AnimateSequence(arg_6_0, "TierGiftPromo")
	ACTIONS.AnimateSequence(arg_6_0.PurchaseButton.Banner, "TabSizeSetup")
	ACTIONS.AnimateSequence(arg_6_0.BundlePurchaseButton.Banner, "TabSizeSetup")
	arg_6_0.PurchaseButton.Banner:SetAlpha(1)
	arg_6_0.BundlePurchaseButton.Banner:SetAlpha(1)
	arg_6_0.PurchaseButton.Banner:SetText(Engine.CBBHFCGDIC("BATTLEPASS/N_BONUS_TIER_SKIPS", var_6_3))
	arg_6_0.BundlePurchaseButton.Banner:SetText(Engine.CBBHFCGDIC("BATTLEPASS/N_BONUS_TIER_SKIPS", var_6_3))
	arg_6_0.PromoNote:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_GIFT_PROMO_NOTE", var_6_3))

	local var_6_4 = "update_promo_timer"
	local var_6_5 = BATTLEPASS.GetTierSkipGiftTimer()
	local var_6_6 = tonumber(var_6_5)

	arg_6_0._promoTimer = LUI.UITimer.new({
		interval = 1000,
		event = var_6_4
	})

	arg_6_0:addElement(arg_6_0._promoTimer)
	arg_6_0:registerAndCallEventHandler(var_6_4, function(arg_7_0, arg_7_1)
		local var_7_0 = Engine.DEIDGHDBHD()

		if var_6_6 - var_7_0 > 0 then
			ACTIONS.AnimateSequence(arg_6_0.PurchaseButton.Banner, "TierSaleVariant")
			ACTIONS.AnimateSequence(arg_6_0.BundlePurchaseButton.Banner, "TierSaleVariant")
			arg_6_0.PromoTimer:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_GIFT_PROMO_TIMER", STORE.ParseCountDownTime(var_6_5)))
		else
			arg_6_0.PurchaseButton.Banner:SetAlpha(0)
			arg_6_0.BundlePurchaseButton.Banner:SetAlpha(0)
			arg_6_0.PromoNote:SetAlpha(0)
			arg_6_0.PromoTimer:SetAlpha(0)
			arg_6_0._promoTimer:closeTree()

			arg_6_0._promoTimer = nil
		end
	end)
end

local function var_0_3(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0.PurchaseButton)
	assert(arg_8_0.BundlePurchaseButton)

	arg_8_0._targetItemCost = -1
	arg_8_0._battlePassPurchaseRef = nil
	arg_8_0._cacheCODPoints = Commerce.CEDDCGHIGA(arg_8_1, LOOT.CurrencyIDs.COD_POINTS)
	arg_8_0._isLateGrinder = false
	arg_8_0.PurchaseBattlePass = var_0_1
	arg_8_0._isKBM = false

	if LUI.IsLastInputKeyboardMouse(arg_8_1) then
		arg_8_0._focusedButton = nil
	else
		arg_8_0._focusedButton = arg_8_0.BundlePurchaseButton
	end

	if not CONDITIONS.IsDevelopmentBuild(arg_8_0) or Dvar.IBEGCHEFE("NPOLQSQMNO") then
		Challenge.SetupSeasonEndsTimer(arg_8_0, arg_8_0.SeasonEndTimer, "LUA_MENU/ACCEPT_LOCALIZED")
	else
		arg_8_0.SeasonEndTimer:SetAlpha(0)
	end

	local var_8_0 = BATTLEPASS.GetCodPointsInPass()
	local var_8_1 = BATTLEPASS.GetMaxTier()
	local var_8_2 = BATTLEPASS.GetNumSkipsInBundle(BATTLEPASS.GetPurchaseBundleRef())
	local var_8_3 = BATTLEPASS.GetItemCost(BATTLEPASS.GetPurchaseRef())
	local var_8_4 = BATTLEPASS.GetItemCost(BATTLEPASS.GetPurchaseBundleRef())
	local var_8_5 = BATTLEPASS.GetItemValue(BATTLEPASS.GetPurchaseBundleRef())
	local var_8_6 = LUI.Round((var_8_5 - var_8_4) / var_8_5 * 100, 1)
	local var_8_7
	local var_8_8
	local var_8_9
	local var_8_10 = Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_DESC", var_8_1, var_8_0)
	local var_8_11 = Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_EXTRA_DETAILS")
	local var_8_12 = "BATTLEPASS/PREMIUM_BUNDLE_EXTRA_DETAILS"

	if Engine.CIEGIACHAE() then
		var_8_12 = "BATTLEPASS/PREMIUM_BUNDLE_EXTRA_DETAILS_SONY"
	end

	local var_8_13 = Engine.CBBHFCGDIC(var_8_12, var_8_2, var_8_6)

	arg_8_0.Description:setText(var_8_10)

	local var_8_14 = BATTLEPASS.GetTier(arg_8_1)
	local var_8_15 = BATTLEPASS.GetNumSkipsInBundle(BATTLEPASS.GetPurchaseBundleRef())

	if CONDITIONS.IsLateGrindersEnabled() then
		local var_8_16 = BATTLEPASS.GetCurrentCPRewards(arg_8_1)

		if var_8_16.totalCP >= BATTLEPASS.START_TO_SHOW_COD_POINTS then
			arg_8_0._isLateGrinder = true

			ACTIONS.AnimateSequence(arg_8_0, "LateGrinder")
			arg_8_0.CodPointsCards:SetAlpha(1)

			local var_8_17 = {
				minVerticalOffset = -10,
				height = 200,
				maxVerticalOffset = 20,
				maxHorizontalOffset = 120,
				widget = "LootItemCardMini",
				finalRotation = -30,
				startRotation = 0,
				width = 150,
				numWidgets = #var_8_16.codTiers
			}

			arg_8_0.CodPointsCards:BuildWidgets(arg_8_1, var_8_17)

			local var_8_18 = BATTLEPASS.GetAllRewards(arg_8_1)

			for iter_8_0, iter_8_1 in ipairs(var_8_16.codTiers) do
				local var_8_19 = arg_8_0.CodPointsCards.widgets[iter_8_0]
				local var_8_20 = var_8_18[iter_8_1 + BATTLEPASS.NumBonusItems]

				var_8_19:SetMiniMode(false)
				var_8_19:UpdateCardConfig(var_8_20)
				ACTIONS.AnimateSequence(var_8_19, "HideType")
			end

			ACTIONS.AnimateSequence(arg_8_0, "UnlockCodPoints")
			arg_8_0.CodPointsTitle:setText(Engine.CBBHFCGDIC("BATTLEPASS/ADD_X_CP", var_8_16.totalCP))

			if BATTLEPASS.GetTier(arg_8_1) == BATTLEPASS.GetMaxTier() then
				arg_8_0.MaxTierTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/MAX_TIER")))
			else
				arg_8_0.MaxTierTitle:setText(Engine.CBBHFCGDIC("BATTLEPASS/COD_POINTS_EARNED_TITLE"))
			end

			local var_8_21 = SEASON.GetCurrentSeasonDataNum({
				isForBattlePass = true
			})
			local var_8_22 = {
				isForBattlePass = true,
				seasonDataNumToUse = var_8_21
			}
			local var_8_23 = {
				isForBattlePass = true,
				seasonDataNumToUse = var_8_21 + 1
			}
			local var_8_24 = tonumber(BATTLEPASS.GetItemCost(BATTLEPASS.GetPurchaseRef()))

			if var_8_24 <= var_8_16.totalCP then
				arg_8_0.CodPointsDesc:setText(Engine.CBBHFCGDIC("BATTLEPASS/CP_FREE_DESC", SEASON.GetLocalizedName(var_8_22), SEASON.GetLocalizedName(var_8_23)))
			else
				local var_8_25 = math.floor(var_8_16.totalCP / var_8_24 * 100)

				arg_8_0.CodPointsDesc:setText(Engine.CBBHFCGDIC("BATTLEPASS/CP_DISCOUNT_DESC", SEASON.GetLocalizedName(var_8_22), SEASON.GetLocalizedName(var_8_23), var_8_25))
			end
		end
	end

	arg_8_0.HoldRadial.Progress:SetProgress(0)
	assert(arg_8_2.sourceMenu)

	local var_8_26 = arg_8_2.sourceMenu

	if var_8_26.GetPurchaseAction then
		LUI.AddUIHoldButtonLogic(arg_8_0.HoldRadial, arg_8_1, {
			clickKeyboardAndMouse = true,
			requireFocus = false,
			duration = 1000,
			buttons = {
				primary = true
			},
			fill = arg_8_0.HoldRadial.Progress,
			onFill = arg_8_0.PurchaseBattlePass,
			animations = {
				onConfirm = "HoldComplete",
				onCancel = "StopHoldPulse",
				onProgress = "HoldPulseLoop",
				gamepadOnly = true,
				target = arg_8_0
			},
			soundFX = {
				gamepadOnly = true,
				onProgress = SOUND_SETS.storefront.selectionHoldProgess,
				onCancel = SOUND_SETS.default.deny
			},
			onFillParams = {
				element = arg_8_0,
				menu = var_8_26
			}
		})

		if CONDITIONS.IsConsoleGame() then
			ACTIONS.AnimateSequence(arg_8_0, "AdjustHoldPromptForConsole")
		end

		local function var_8_27(arg_9_0, arg_9_1)
			local var_9_0 = LUI.IsLastInputKeyboardMouse(arg_9_1.controllerIndex)
			local var_9_1 = arg_8_2.sourceMenu
			local var_9_2 = IsLanguageArabic() and "AR" or ""

			ACTIONS.AnimateSequence(arg_9_0, var_9_0 and "DisplayKBM" or "DisplayGamepad" .. var_9_2)
			arg_9_0.BundlePurchaseButton:SetHandleMouse(var_9_0)
			arg_9_0.PurchaseButton:SetHandleMouse(var_9_0)

			if var_9_0 then
				local function var_9_3(arg_10_0, arg_10_1)
					arg_10_0 = arg_10_0:getParent() and arg_10_0:getParent() or arg_10_0

					arg_10_0.PurchaseBattlePass(arg_10_1, {
						element = arg_10_0,
						menu = var_9_1
					})

					return true
				end

				arg_9_0.BundlePurchaseButton:registerEventHandler("leftmousedown", function(arg_11_0, arg_11_1)
					return true
				end)
				arg_9_0.BundlePurchaseButton:registerEventHandler("leftmouseup", var_9_3)
				arg_9_0.PurchaseButton:registerEventHandler("leftmousedown", function(arg_12_0, arg_12_1)
					return true
				end)
				arg_9_0.PurchaseButton:registerEventHandler("leftmouseup", var_9_3)
			end
		end

		arg_8_0:registerAndCallEventHandler("update_input_type", var_8_27, {
			controllerIndex = arg_8_1
		})
	end

	arg_8_0._closePopup = arg_8_2.backLeavesBPMenuPopup

	arg_8_0.bindButton:addEventHandler("button_secondary", function(arg_13_0, arg_13_1)
		if var_8_26.AnimateXPEarned then
			var_8_26:AnimateXPEarned()
		end

		var_8_26._recipentXuidString = nil

		ACTIONS.LeaveMenu(arg_8_0)

		if arg_8_0._closePopup and CONDITIONS.IsMenuInStack("BattlePassMenuPopup") then
			LUI.FlowManager.RequestLeaveMenuByName("BattlePassMenuPopup", true)
		end
	end)
	arg_8_0:addEventHandler("restore_focus", function(arg_14_0, arg_14_1)
		if arg_8_0.HoldRadial.ReleaseButton then
			arg_8_0.HoldRadial:ReleaseButton()
		end

		local var_14_0 = Commerce.CEDDCGHIGA(arg_14_1.controller, LOOT.CurrencyIDs.COD_POINTS)

		if var_14_0 ~= arg_8_0._cacheCODPoints and var_14_0 >= arg_14_0._targetItemCost and arg_8_0._battlePassPurchaseRef then
			local var_14_1 = BATTLEPASS.GetItemLargeImage(arg_8_0._battlePassPurchaseRef)
			local var_14_2 = Engine.CBBHFCGDIC(BATTLEPASS.GetItemName(arg_8_0._battlePassPurchaseRef))
			local var_14_3 = {
				image = var_14_1,
				itemCost = arg_8_0._targetItemCost,
				itemName = var_14_2,
				confirmAction = function()
					arg_14_0.PurchaseBattlePass(arg_14_1, {
						element = arg_14_0,
						menu = var_8_26
					})
					LUI.FlowManager.RequestLeaveMenuByName("BattlePassConfirmPurchasePopup")
				end,
				cancelAction = function()
					LUI.FlowManager.RequestLeaveMenuByName("BattlePassConfirmPurchasePopup")
				end
			}

			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassConfirmPurchasePopup", true, arg_8_1, false, var_14_3, nil, false, true)
		end

		arg_8_0._cacheCODPoints = var_14_0
	end)
	arg_8_0.PurchaseButton:SetupPremiumButton(var_8_3)

	local function var_8_28(arg_17_0, arg_17_1)
		ACTIONS.AnimateSequence(arg_8_0, "Premium")
		arg_8_0.PurchaseTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM")))

		local var_17_0 = Engine.CBBHFCGDIC("BATTLEPASS/WHY_BUY")

		if arg_8_0._giftingActionCallback then
			var_17_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_WHY_BUY")
		end

		arg_8_0.SubTitle1:setText(var_17_0)
		arg_8_0.ExtraDetails:setText(var_8_11)
	end

	local function var_8_29(arg_18_0, arg_18_1)
		ACTIONS.AnimateSequence(arg_8_0, "PremiumBundle")
		arg_8_0.PurchaseTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM_BUNDLE")))

		local var_18_0 = "BATTLEPASS/WHY_BUY_BUNDLE"

		if arg_8_0._giftingActionCallback then
			var_18_0 = "LUA_MENU_MP/GIFT_WHY_BUY_BUNDLE"
		end

		if Engine.CIEGIACHAE() then
			var_18_0 = "BATTLEPASS/WHY_BUY_BUNDLE_SONY"

			if arg_8_0._giftingActionCallback then
				var_18_0 = "LUA_MENU_MP/GIFT_WHY_BUY_BUNDLE_SONY"
			end
		end

		arg_8_0.SubTitle1:setText(Engine.CBBHFCGDIC(var_18_0))
		arg_8_0.ExtraDetails:setText(var_8_13)

		if var_8_14 + var_8_15 > var_8_1 then
			arg_8_0.Disclaimer:SetAlpha(1, 150)
		end
	end

	local function var_8_30(arg_19_0, arg_19_1)
		arg_8_0._focusedButton = arg_19_0
	end

	local var_8_31 = arg_8_0._isLateGrinder and var_8_29 or var_8_28
	local var_8_32 = arg_8_0._isLateGrinder and var_8_28 or var_8_29
	local var_8_33 = arg_8_0._isLateGrinder and arg_8_0.BundlePurchaseButton or arg_8_0.PurchaseButton
	local var_8_34 = arg_8_0._isLateGrinder and arg_8_0.PurchaseButton or arg_8_0.BundlePurchaseButton

	arg_8_0.PurchaseButton:addEventHandler("button_over", function(arg_20_0, arg_20_1)
		var_8_30(arg_20_0)
		ACTIONS.AnimateSequence(arg_8_0, "FocusPurchase")
		var_8_31(arg_20_0, arg_20_1)
	end)
	arg_8_0.BundlePurchaseButton:addEventHandler("button_over", function(arg_21_0, arg_21_1)
		var_8_30(arg_21_0)
		ACTIONS.AnimateSequence(arg_8_0, "FocusBundlePurchase")
		var_8_32(arg_21_0, arg_21_1)
	end)
	var_8_33:SetupLateGrinder()
	var_8_34:SetupBundleButton(var_8_4, var_8_5, var_8_2)
	arg_8_0.BundleTiersBonus:setText(Engine.CBBHFCGDIC("BATTLEPASS/EXTRA_TIERS", var_8_2))
	arg_8_0.RewardsGrid:SetNumChildren(var_0_0)

	local var_8_35 = BATTLEPASS.GetAllRewards(arg_8_1, true)

	arg_8_0.RewardsGrid:SetRefreshChild(function(arg_22_0, arg_22_1, arg_22_2)
		local var_22_0 = arg_8_0.RewardsGrid:GetContentIndex(arg_22_1, arg_22_2)

		arg_22_0:UpdateCardConfig(var_8_35[var_22_0 + 1])
		arg_22_0:SetFocusable(false)
	end)
	arg_8_0.WZSnipeIcon:UpdateSnipeIcon({
		selected = true,
		gameSourceExclusivityID = BATTLEPASS.GetCurrentSeasonGameExclusivity(),
		alignment = LUI.Alignment.Right
	})

	local var_8_36 = var_8_14 + var_8_2

	if var_8_36 > BATTLEPASS.GetMaxTier() then
		var_8_36 = BATTLEPASS.GetMaxTier()
	end

	local var_8_37 = var_8_36 + BATTLEPASS.NumBonusItems

	arg_8_0.isQuickAccessShortcutsDisabled = true

	if BATTLEPASS.IsTierSkipGiftActive(arg_8_1) then
		var_0_2(arg_8_0)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_8_0, "AR")
	end

	local var_8_38 = 15 * _1080p
	local var_8_39 = LAYOUT.GetTextHeightWithWrapping(arg_8_0.Description, var_8_10)
	local var_8_40 = arg_8_0.Description:GetCurrentAnchorsAndPositions().top + var_8_39 + var_8_38
	local var_8_41 = arg_8_0.Description:GetCurrentAnchorsAndPositions().top + var_8_39 + var_8_38
	local var_8_42 = LAYOUT.GetElementHeight(arg_8_0.ExtraDetails)

	arg_8_0.ExtraDetails:SetTop(var_8_40)
	arg_8_0.ExtraDetails:SetBottom(var_8_40 + var_8_42)
	Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseWindow)
	ACTIONS.ScaleFullscreen(arg_8_0.Darkener)

	arg_8_0.PurchaseButton.navigation = {}
	arg_8_0.PurchaseButton.navigation.down = arg_8_0.BundlePurchaseButton
	arg_8_0.BundlePurchaseButton.navigation = {}
	arg_8_0.BundlePurchaseButton.navigation.up = arg_8_0.PurchaseButton

	arg_8_0:addEventHandler("gamepad_button", function(arg_23_0, arg_23_1)
		if LUI.IsLastInputKeyboardMouse(arg_23_1.controller) and arg_8_0._focusedButton == nil and (arg_23_1.button == "up" or arg_23_1.button == "down") then
			arg_8_0.BundlePurchaseButton:processEvent({
				immediate = true,
				name = "gain_focus"
			})

			arg_8_0._focusedButton = arg_8_0.BundlePurchaseButton

			return true
		end
	end)

	local function var_8_43(arg_24_0)
		assert(var_8_26)
		assert(arg_24_0)
		arg_8_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_BATTLE_PASS_TO_TITLE")))

		local var_24_0 = Friends.HCAFBJBHC(arg_8_1, arg_24_0)

		arg_8_0.GifteeGamertag:setText(var_24_0.gamertag)
		arg_8_0.SubTitle2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/GIFT_INSTANT_REWARDS_FOR_X", Engine.JCBDICCAH(var_24_0.gamertag)))

		var_8_26.IsGiftingToFriend = true

		if arg_8_2 and arg_8_2.giftingActionCallback then
			arg_8_2.giftingActionCallback(var_8_26, arg_24_0)
		end
	end

	local var_8_44 = "HideGiftingBonus"

	arg_8_0._giftingActionCallback = arg_8_2.giftingActionCallback

	if arg_8_0._giftingActionCallback then
		var_8_44 = "ShowGifting"

		local var_8_45 = {
			controllerIndex = arg_8_1,
			battlePassSKU = arg_8_2.battlePassSKU,
			selectedGifteeCallback = var_8_43,
			backButtonOverride = function()
				ACTIONS.LeaveMenu(arg_8_0)
			end
		}
		local var_8_46 = MenuBuilder.BuildRegisteredType("GiftingFriendSelectPopup", var_8_45)

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_8_1, false, {
			flyInLeftNarrow = true,
			widget = var_8_46
		})
	end

	ACTIONS.AnimateSequence(arg_8_0, var_8_44)

	if not LUI.IsLastInputKeyboardMouse(arg_8_1) then
		arg_8_0.BundlePurchaseButton:processEvent({
			name = "gain_focus"
		})
	else
		ACTIONS.AnimateSequence(arg_8_0, "PremiumBundle")
	end

	if arg_8_0.BattlePassTopperGiftIcon and arg_8_0.BattlePassPopupTopperIcon then
		local var_8_47 = Engine.DEIDGHDBHD()
		local var_8_48 = Dvar.CFHDGABACF("LKOKTLQSPT")
		local var_8_49 = (var_8_47 < var_8_48 and var_8_48 - var_8_47 or 0) * 1000
		local var_8_50 = var_8_49 > BATTLEPASS.TOPPER_TIMER_MAX_THRESHOLD_MS and BATTLEPASS.TOPPER_TIMER_MAX_THRESHOLD_TIMER_TICK_MS or var_8_49

		arg_8_0._bpTimer = LUI.UITimer.new({
			event = "disable_bp_topper_timer",
			interval = var_8_50
		})
		arg_8_0._bpTimer.id = "bpTopperTimerPopup"

		arg_8_0:addElement(arg_8_0._bpTimer)
		arg_8_0:addAndCallEventHandler("disable_bp_topper_timer", function(arg_26_0, arg_26_1)
			local var_26_0 = Engine.DEIDGHDBHD()
			local var_26_1 = Dvar.CFHDGABACF("LKOKTLQSPT")

			if (var_26_0 < var_26_1 and var_26_1 - var_26_0 or 0) == 0 then
				arg_8_0._bpTimer:closeTree()

				arg_8_0._bpTimer = nil

				arg_8_0.BattlePassTopperGiftIcon:SetAlpha(0)
				arg_8_0.BattlePassTopperGiftBG:SetAlpha(0)
				ACTIONS.AnimateSequence(arg_8_0.BattlePassPopupTopperIcon, "DisabledTopperIcon")
			end
		end)
	end
end

function BattlePassPurchasePopup(arg_27_0, arg_27_1)
	local var_27_0 = LUI.UIVerticalNavigator.new()

	var_27_0.id = "BattlePassPurchasePopup"
	var_27_0._animationSets = var_27_0._animationSets or {}
	var_27_0._sequences = var_27_0._sequences or {}

	local var_27_1 = arg_27_1 and arg_27_1.controllerIndex

	if not var_27_1 and not Engine.DDJFBBJAIG() then
		var_27_1 = var_27_0:getRootController()
	end

	assert(var_27_1)

	var_27_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_27_1
	})
	var_27_0.HelperBar.id = "HelperBar"

	var_27_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_27_0.HelperBar:setPriority(10)
	var_27_0:addElement(var_27_0.HelperBar)

	local var_27_2 = var_27_0
	local var_27_3
	local var_27_4 = LUI.UIImage.new()

	var_27_4.id = "Darkener"

	var_27_4:SetRGBFromInt(0, 0)
	var_27_4:SetAlpha(0.7, 0)
	var_27_0:addElement(var_27_4)

	var_27_0.Darkener = var_27_4

	local var_27_5
	local var_27_6 = LUI.UIImage.new()

	var_27_6.id = "Background"

	var_27_6:SetRGBFromInt(0, 0)
	var_27_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -355, _1080p * 447)
	var_27_0:addElement(var_27_6)

	var_27_0.Background = var_27_6

	local var_27_7
	local var_27_8 = MenuBuilder.BuildRegisteredType("BattlePassPopupWindow", {
		controllerIndex = var_27_1
	})

	var_27_8.id = "BattlePassPopupWindow"

	var_27_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -355, _1080p * 447)
	var_27_0:addElement(var_27_8)

	var_27_0.BattlePassPopupWindow = var_27_8

	local var_27_9
	local var_27_10 = LUI.UIImage.new()

	var_27_10.id = "Gradient"

	var_27_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_27_10:SetAlpha(0.1, 0)
	var_27_10:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_27_10:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 973, _1080p * 185, _1080p * -93)
	var_27_0:addElement(var_27_10)

	var_27_0.Gradient = var_27_10

	local var_27_11
	local var_27_12 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = false,
		maxVisibleColumns = 4,
		maxVisibleRows = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_27_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("LootItemCardMini", {
				controllerIndex = var_27_1
			})
		end,
		refreshChild = function(arg_29_0, arg_29_1, arg_29_2)
			return
		end,
		spacingX = _1080p * 15,
		spacingY = _1080p * 15,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 200,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Middle
	}
	local var_27_13 = LUI.UIGrid.new(var_27_12)

	var_27_13.id = "RewardsGrid"

	var_27_13:SetScale(-0.15, 0)
	var_27_13:setUseStencil(false)
	var_27_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -357, _1080p * 287, _1080p * 180, _1080p * 380)
	var_27_0:addElement(var_27_13)

	var_27_0.RewardsGrid = var_27_13

	local var_27_14

	if CONDITIONS.IsBattlePassBundleTopperActive(var_27_1) then
		var_27_14 = MenuBuilder.BuildRegisteredType("BattlePassPopupTopperIcon", {
			controllerIndex = var_27_1
		})
		var_27_14.id = "BattlePassPopupTopperIcon"

		var_27_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 1416, _1080p * 1824, _1080p * -275, _1080p * 445)
		var_27_0:addElement(var_27_14)

		var_27_0.BattlePassPopupTopperIcon = var_27_14
	end

	local var_27_15
	local var_27_16 = LUI.UIImage.new()

	var_27_16.id = "BundleTiersBonusBG"

	var_27_16:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_27_16:SetAlpha(0.5, 0)
	var_27_16:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_27_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 238, _1080p * 388, _1080p * 380, _1080p * 420)
	var_27_0:addElement(var_27_16)

	var_27_0.BundleTiersBonusBG = var_27_16

	local var_27_17
	local var_27_18 = LUI.UIStyledText.new()

	var_27_18.id = "BundleTiersBonus"

	var_27_18:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_27_18:setText(Engine.CBBHFCGDIC("BATTLEPASS/EXTRA_TIERS"), 0)
	var_27_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_18:SetAlignment(LUI.Alignment.Center)
	var_27_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 238, _1080p * 388, _1080p * 388, _1080p * 412)
	var_27_0:addElement(var_27_18)

	var_27_0.BundleTiersBonus = var_27_18

	local var_27_19
	local var_27_20 = LUI.UIStyledText.new()

	var_27_20.id = "UnlocksLabel"

	var_27_20:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_27_20:setText(Engine.CBBHFCGDIC("BATTLEPASS/UNLOCKS_DESC"), 0)
	var_27_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_20:SetAlignment(LUI.Alignment.Left)
	var_27_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -310, _1080p * 470, _1080p * 157, _1080p * 177)
	var_27_0:addElement(var_27_20)

	var_27_0.UnlocksLabel = var_27_20

	local var_27_21
	local var_27_22 = LUI.UIStyledText.new()

	var_27_22.id = "SubTitle2"

	var_27_22:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_27_22:setText(Engine.CBBHFCGDIC("BATTLEPASS/INSTANT_UNLOCKS"), 0)
	var_27_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_22:SetAlignment(LUI.Alignment.Left)
	var_27_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -310, _1080p * 470, _1080p * 121, _1080p * 157)
	var_27_0:addElement(var_27_22)

	var_27_0.SubTitle2 = var_27_22

	local var_27_23
	local var_27_24 = LUI.UIStyledText.new()

	var_27_24.id = "Description"

	var_27_24:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_27_24:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_DESC"), 0)
	var_27_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_24:SetAlignment(LUI.Alignment.Left)
	var_27_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -310, _1080p * 470, _1080p * -83, _1080p * -63)
	var_27_0:addElement(var_27_24)

	var_27_0.Description = var_27_24

	local var_27_25
	local var_27_26 = LUI.UIStyledText.new()

	var_27_26.id = "ExtraDetails"

	var_27_26:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_27_26:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_EXTRA_DETAILS"), 0)
	var_27_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_26:SetAlignment(LUI.Alignment.Left)
	var_27_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -310, _1080p * 470, 0, _1080p * 20)
	var_27_0:addElement(var_27_26)

	var_27_0.ExtraDetails = var_27_26

	local var_27_27
	local var_27_28 = LUI.UIStyledText.new()

	var_27_28.id = "SubTitle1"

	var_27_28:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_27_28:setText(Engine.CBBHFCGDIC("BATTLEPASS/WHY_BUY"), 0)
	var_27_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_28:SetAlignment(LUI.Alignment.Left)
	var_27_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -310, _1080p * 420, _1080p * -131, _1080p * -103)
	var_27_0:addElement(var_27_28)

	var_27_0.SubTitle1 = var_27_28

	local var_27_29
	local var_27_30 = LUI.UIText.new()

	var_27_30.id = "PurchaseTitle"

	var_27_30:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_27_30:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM")), 0)
	var_27_30:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_27_30:SetAlignment(LUI.Alignment.Left)
	var_27_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -310, _1080p * 470, _1080p * -181, _1080p * -131)
	var_27_0:addElement(var_27_30)

	var_27_0.PurchaseTitle = var_27_30

	local var_27_31
	local var_27_32 = MenuBuilder.BuildRegisteredType("BattlePassPurchasePopupButton", {
		controllerIndex = var_27_1
	})

	var_27_32.id = "BundlePurchaseButton"

	var_27_32.BackgroundImage:setImage(RegisterMaterial("battlepass_button_bundle"), 0)
	var_27_32.CurrencyIcon:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_27_32.BundleDescription:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_BUNDLE_DESC"), 0)
	var_27_32.Title:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM_BUNDLE"), 0)
	var_27_32:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 98, _1080p * 610, _1080p * -198, _1080p * 58)
	var_27_0:addElement(var_27_32)

	var_27_0.BundlePurchaseButton = var_27_32

	local var_27_33
	local var_27_34 = MenuBuilder.BuildRegisteredType("BattlePassPurchasePopupButton", {
		controllerIndex = var_27_1
	})

	var_27_34.id = "PurchaseButton"

	var_27_34.BackgroundImage:setImage(RegisterMaterial("battlepass_button_premium"), 0)
	var_27_34.CurrencyIcon:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_27_34.BundleDescription:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_DESC"), 0)
	var_27_34.Title:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM"), 0)
	var_27_34:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 98, _1080p * 610, _1080p * 126, _1080p * 382)
	var_27_0:addElement(var_27_34)

	var_27_0.PurchaseButton = var_27_34

	local var_27_35
	local var_27_36 = MenuBuilder.BuildRegisteredType("CurrentTierLabel", {
		controllerIndex = var_27_1
	})

	var_27_36.id = "CurrentTierLabel"

	var_27_36.TierLabel:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_27_36.TierLabel:SetAlignment(LUI.Alignment.Left)
	var_27_36:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 98, _1080p * 651, _1080p * -261, _1080p * -225)
	var_27_0:addElement(var_27_36)

	var_27_0.CurrentTierLabel = var_27_36

	local var_27_37
	local var_27_38 = LUI.UIText.new()

	var_27_38.id = "Title"

	var_27_38:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZTitle, 0)
	var_27_38:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/UPGRADE")), 0)
	var_27_38:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_27_38:SetAlignment(LUI.Alignment.Left)
	var_27_38:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 96, _1080p * 1262, _1080p * -324, _1080p * -264)
	var_27_0:addElement(var_27_38)

	var_27_0.Title = var_27_38

	local var_27_39
	local var_27_40 = LUI.UIStyledText.new()

	var_27_40.id = "SeasonEndTimer"

	var_27_40:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_27_40:setText("6d 20h 54m", 0)
	var_27_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_40:SetAlignment(LUI.Alignment.Left)
	var_27_40:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 98, _1080p * 484, _1080p * -228, _1080p * -204)
	var_27_0:addElement(var_27_40)

	var_27_0.SeasonEndTimer = var_27_40

	local var_27_41

	if CONDITIONS.IsUserSignedInDemonware(var_27_1) then
		local var_27_42 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_27_1
		})

		var_27_42.id = "MPPlayerDetails"

		var_27_42:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_27_0:addElement(var_27_42)

		var_27_0.MPPlayerDetails = var_27_42
	end

	local var_27_43
	local var_27_44 = LUI.UIStyledText.new()

	var_27_44.id = "Disclaimer"

	var_27_44:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_27_44:SetAlpha(0, 0)
	var_27_44:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_DISCLAIMER"), 0)
	var_27_44:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_44:SetAlignment(LUI.Alignment.Left)
	var_27_44:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -243, _1080p * 726, _1080p * 423, _1080p * 439)
	var_27_0:addElement(var_27_44)

	var_27_0.Disclaimer = var_27_44

	local var_27_45
	local var_27_46 = LUI.UIStyledText.new()

	var_27_46.id = "PromoTimer"

	var_27_46:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_27_46:SetAlpha(0, 0)
	var_27_46:setText("", 0)
	var_27_46:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_46:SetAlignment(LUI.Alignment.Left)
	var_27_46:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 93, _1080p * 610, _1080p * -260, _1080p * -230)
	var_27_0:addElement(var_27_46)

	var_27_0.PromoTimer = var_27_46

	local var_27_47
	local var_27_48 = LUI.UIStyledText.new()

	var_27_48.id = "PromoNote"

	var_27_48:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_27_48:SetAlpha(0, 0)
	var_27_48:setText("", 0)
	var_27_48:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_27_48:SetAlignment(LUI.Alignment.Left)
	var_27_48:SetVerticalAlignment(LUI.Alignment.Center)
	var_27_48:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -243, _1080p * 269, _1080p * 395, _1080p * 417)
	var_27_0:addElement(var_27_48)

	var_27_0.PromoNote = var_27_48

	local var_27_49
	local var_27_50 = LUI.UIStyledText.new()

	var_27_50.id = "CodPointsTitle"

	var_27_50:SetRGBFromTable(SWATCHES.CH2.CH2Season2BattlePassHilite, 0)
	var_27_50:SetAlpha(0, 0)
	var_27_50:setText(Engine.CBBHFCGDIC("BATTLEPASS/ADD_X_CP"), 0)
	var_27_50:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_27_50:SetWordWrap(false)
	var_27_50:SetAlignment(LUI.Alignment.Left)
	var_27_50:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_27_50:SetStartupDelay(2000)
	var_27_50:SetLineHoldTime(400)
	var_27_50:SetAnimMoveTime(2000)
	var_27_50:SetAnimMoveSpeed(150)
	var_27_50:SetEndDelay(2000)
	var_27_50:SetCrossfadeTime(250)
	var_27_50:SetFadeInTime(300)
	var_27_50:SetFadeOutTime(300)
	var_27_50:SetMaxVisibleLines(1)
	var_27_50:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -310, _1080p * 470, _1080p * -156, _1080p * -86)
	var_27_0:addElement(var_27_50)

	var_27_0.CodPointsTitle = var_27_50

	local var_27_51
	local var_27_52 = LUI.UIStyledText.new()

	var_27_52.id = "CodPointsDesc"

	var_27_52:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_27_52:SetAlpha(0, 0)
	var_27_52:setText(Engine.CBBHFCGDIC("BATTLEPASS/CP_DISCOUNT_DESC"), 0)
	var_27_52:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_52:SetAlignment(LUI.Alignment.Left)
	var_27_52:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_27_52:SetStartupDelay(1000)
	var_27_52:SetLineHoldTime(400)
	var_27_52:SetAnimMoveTime(1000)
	var_27_52:SetAnimMoveSpeed(150)
	var_27_52:SetEndDelay(1000)
	var_27_52:SetCrossfadeTime(1000)
	var_27_52:SetFadeInTime(300)
	var_27_52:SetFadeOutTime(300)
	var_27_52:SetMaxVisibleLines(5)
	var_27_52:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -310, _1080p * 470, _1080p * -79.5, _1080p * -59.5)
	var_27_0:addElement(var_27_52)

	var_27_0.CodPointsDesc = var_27_52

	local var_27_53
	local var_27_54 = LUI.UIStyledText.new()

	var_27_54.id = "MaxTierTitle"

	var_27_54:SetRGBFromTable(SWATCHES.CH2.CH2SeasonFreeBanner, 0)
	var_27_54:SetAlpha(0, 0)
	var_27_54:setText(Engine.CBBHFCGDIC("BATTLEPASS/MAX_TIER"), 0)
	var_27_54:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_54:SetWordWrap(false)
	var_27_54:SetAlignment(LUI.Alignment.Left)
	var_27_54:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_27_54:SetStartupDelay(2000)
	var_27_54:SetLineHoldTime(400)
	var_27_54:SetAnimMoveTime(2000)
	var_27_54:SetAnimMoveSpeed(150)
	var_27_54:SetEndDelay(2000)
	var_27_54:SetCrossfadeTime(250)
	var_27_54:SetFadeInTime(300)
	var_27_54:SetFadeOutTime(300)
	var_27_54:SetMaxVisibleLines(1)
	var_27_54:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -310, _1080p * 470, _1080p * -207, _1080p * -171)
	var_27_0:addElement(var_27_54)

	var_27_0.MaxTierTitle = var_27_54

	local var_27_55
	local var_27_56 = MenuBuilder.BuildRegisteredType("FanDisplayWidget", {
		controllerIndex = var_27_1
	})

	var_27_56.id = "CodPointsCards"

	var_27_56:SetAlpha(0, 0)
	var_27_56:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 599, _1080p * 749, _1080p * -176, _1080p * 24)
	var_27_0:addElement(var_27_56)

	var_27_0.CodPointsCards = var_27_56

	local var_27_57
	local var_27_58 = LUI.UIText.new()

	var_27_58.id = "ExclusiveText"

	var_27_58:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_27_58:setText(Engine.CBBHFCGDIC("BATTLEPASS/EXCLUSIVELY_USABLE_IN"), 0)
	var_27_58:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_58:SetAlignment(LUI.Alignment.Right)
	var_27_58:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -699, _1080p * -328, _1080p * -319, _1080p * -295)
	var_27_0:addElement(var_27_58)

	var_27_0.ExclusiveText = var_27_58

	local var_27_59
	local var_27_60 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_27_1
	})

	var_27_60.id = "WZSnipeIcon"

	var_27_60:SetScale(-0.63, 0)
	var_27_60:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -384, _1080p * 16, _1080p * -356, _1080p * -256)
	var_27_0:addElement(var_27_60)

	var_27_0.WZSnipeIcon = var_27_60

	local var_27_61
	local var_27_62 = MenuBuilder.BuildRegisteredType("GenericRadialProgressBar", {
		controllerIndex = var_27_1
	})

	var_27_62.id = "HoldRadial"

	var_27_62.Backer:setImage(RegisterMaterial("dpad_circle_whole"), 0)
	var_27_62.Progress:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_27_62.Progress:setImage(RegisterMaterial("dpad_circle_segment"), 0)
	var_27_62.Percent:SetAlpha(0, 0)
	var_27_62:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 98, _1080p * 138, _1080p * 68, _1080p * 108)
	var_27_0:addElement(var_27_62)

	var_27_0.HoldRadial = var_27_62

	local var_27_63
	local var_27_64 = LUI.UIStyledText.new()

	var_27_64.id = "ConfirmPurchase"

	var_27_64:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_27_64:setText(Engine.CBBHFCGDIC("BATTLEPASS/CONFIRM_PURCHASE"), 0)
	var_27_64:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_64:SetWordWrap(false)
	var_27_64:SetAlignment(LUI.Alignment.Left)
	var_27_64:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 103, _1080p * 603, _1080p * 74, _1080p * 102)
	var_27_0:addElement(var_27_64)

	var_27_0.ConfirmPurchase = var_27_64

	local var_27_65
	local var_27_66 = LUI.UIImage.new()

	var_27_66.id = "HoldPulse"

	var_27_66:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_27_66:SetAlpha(0, 0)
	var_27_66:setImage(RegisterMaterial("dpad_circle_whole"), 0)
	var_27_66:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 98, _1080p * 138, _1080p * 68, _1080p * 108)
	var_27_0:addElement(var_27_66)

	var_27_0.HoldPulse = var_27_66

	local var_27_67
	local var_27_68 = LUI.UIStyledText.new()

	var_27_68.id = "GiftingBonus"

	var_27_68:SetAlpha(0, 0)
	var_27_68:setText("GiftingBonus", 0)
	var_27_68:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_68:SetAlignment(LUI.Alignment.Left)
	var_27_68:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1588, _1080p * 1782, _1080p * 349, _1080p * 367)
	var_27_0:addElement(var_27_68)

	var_27_0.GiftingBonus = var_27_68

	local var_27_69
	local var_27_70 = LUI.UIStyledText.new()

	var_27_70.id = "GifteeGamertag"

	var_27_70:SetAlpha(0, 0)
	var_27_70:setText("", 0)
	var_27_70:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_27_70:SetAlignment(LUI.Alignment.Left)
	var_27_70:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 98, _1080p * 598, _1080p * 273, _1080p * 309)
	var_27_0:addElement(var_27_70)

	var_27_0.GifteeGamertag = var_27_70

	local var_27_71

	if CONDITIONS.IsBattlePassBundleTopperActive(var_27_1) then
		local var_27_72 = LUI.UIImage.new()

		var_27_72.id = "BattlePassTopperGiftBG"

		var_27_72:SetRGBFromTable(SWATCHES.CH2.CH2BattlePassTopper, 0)
		var_27_72:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
		var_27_72:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 554, _1080p * 611, _1080p * -184, _1080p * -142)
		var_27_0:addElement(var_27_72)

		var_27_0.BattlePassTopperGiftBG = var_27_72
	end

	local var_27_73

	if CONDITIONS.IsBattlePassBundleTopperActive(var_27_1) then
		local var_27_74 = MenuBuilder.BuildRegisteredType("BattlePassTopperSingleImage", {
			controllerIndex = var_27_1
		})

		var_27_74.id = "BattlePassTopperGiftIcon"

		var_27_74.SingleImage:setImage(RegisterMaterial("ui_icon_battlepass_bundle_topper"), 0)
		var_27_74:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 555, _1080p * 610, _1080p * -191, _1080p * -136)
		var_27_0:addElement(var_27_74)

		var_27_0.BattlePassTopperGiftIcon = var_27_74
	end

	local var_27_75
	local var_27_76 = LUI.UIImage.new()

	var_27_76.id = "BundleCards"

	var_27_76:setImage(RegisterMaterial("ui_preview_battlepass_bundle_cards"), 0)
	var_27_76:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1201, _1080p * 1443, _1080p * 702, _1080p * 945)
	var_27_0:addElement(var_27_76)

	var_27_0.BundleCards = var_27_76

	local function var_27_77()
		return
	end

	var_27_0._sequences.DefaultSequence = var_27_77

	local var_27_78

	if CONDITIONS.IsBattlePassBundleTopperActive(var_27_1) then
		local var_27_79 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_27_14:RegisterAnimationSequence("PremiumBundle", var_27_79)
	end

	local var_27_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_27_16:RegisterAnimationSequence("PremiumBundle", var_27_80)

	local var_27_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_27_18:RegisterAnimationSequence("PremiumBundle", var_27_81)

	local var_27_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/WHY_BUY_BUNDLE")
		}
	}

	var_27_28:RegisterAnimationSequence("PremiumBundle", var_27_82)

	local var_27_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_76:RegisterAnimationSequence("PremiumBundle", var_27_83)

	local function var_27_84()
		if CONDITIONS.IsBattlePassBundleTopperActive(var_27_1) then
			var_27_14:AnimateSequence("PremiumBundle")
		end

		var_27_16:AnimateSequence("PremiumBundle")
		var_27_18:AnimateSequence("PremiumBundle")
		var_27_28:AnimateSequence("PremiumBundle")
		var_27_76:AnimateSequence("PremiumBundle")
	end

	var_27_0._sequences.PremiumBundle = var_27_84

	local var_27_85

	if CONDITIONS.IsBattlePassBundleTopperActive(var_27_1) then
		local var_27_86 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_27_14:RegisterAnimationSequence("Premium", var_27_86)
	end

	local var_27_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_16:RegisterAnimationSequence("Premium", var_27_87)

	local var_27_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_18:RegisterAnimationSequence("Premium", var_27_88)

	local var_27_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/WHY_BUY")
		}
	}

	var_27_28:RegisterAnimationSequence("Premium", var_27_89)

	local var_27_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_44:RegisterAnimationSequence("Premium", var_27_90)

	local var_27_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_76:RegisterAnimationSequence("Premium", var_27_91)

	local function var_27_92()
		if CONDITIONS.IsBattlePassBundleTopperActive(var_27_1) then
			var_27_14:AnimateSequence("Premium")
		end

		var_27_16:AnimateSequence("Premium")
		var_27_18:AnimateSequence("Premium")
		var_27_28:AnimateSequence("Premium")
		var_27_44:AnimateSequence("Premium")
		var_27_76:AnimateSequence("Premium")
	end

	var_27_0._sequences.Premium = var_27_92

	local var_27_93
	local var_27_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 115
		}
	}

	var_27_20:RegisterAnimationSequence("AR", var_27_94)

	local var_27_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 86
		}
	}

	var_27_22:RegisterAnimationSequence("AR", var_27_95)

	local var_27_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -309
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 521
		}
	}

	var_27_24:RegisterAnimationSequence("AR", var_27_96)

	local var_27_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 680
		}
	}

	var_27_26:RegisterAnimationSequence("AR", var_27_97)

	local var_27_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -93
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 543
		}
	}

	var_27_28:RegisterAnimationSequence("AR", var_27_98)

	local var_27_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -285
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -689
		}
	}

	var_27_36:RegisterAnimationSequence("AR", var_27_99)

	local var_27_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -285
		}
	}

	var_27_38:RegisterAnimationSequence("AR", var_27_100)

	local var_27_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 806
		}
	}

	var_27_40:RegisterAnimationSequence("AR", var_27_101)

	local var_27_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 402
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 438
		}
	}

	var_27_48:RegisterAnimationSequence("AR", var_27_102)

	local var_27_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 406
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 806
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_27_58:RegisterAnimationSequence("AR", var_27_103)

	local var_27_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1241
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1641
		}
	}

	var_27_60:RegisterAnimationSequence("AR", var_27_104)

	local function var_27_105()
		var_27_20:AnimateSequence("AR")
		var_27_22:AnimateSequence("AR")
		var_27_24:AnimateSequence("AR")
		var_27_26:AnimateSequence("AR")
		var_27_28:AnimateSequence("AR")
		var_27_36:AnimateSequence("AR")
		var_27_38:AnimateSequence("AR")
		var_27_40:AnimateSequence("AR")
		var_27_48:AnimateSequence("AR")
		var_27_58:AnimateSequence("AR")
		var_27_60:AnimateSequence("AR")
	end

	var_27_0._sequences.AR = var_27_105

	local var_27_106
	local var_27_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 420
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -281
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 830
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -245
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right,
			child = var_27_0.CurrentTierLabel.TierLabel
		}
	}

	var_27_36:RegisterAnimationSequence("TierGiftPromo", var_27_107)

	local var_27_108 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_46:RegisterAnimationSequence("TierGiftPromo", var_27_108)

	local var_27_109 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_48:RegisterAnimationSequence("TierGiftPromo", var_27_109)

	local function var_27_110()
		var_27_36:AnimateSequence("TierGiftPromo")
		var_27_46:AnimateSequence("TierGiftPromo")
		var_27_48:AnimateSequence("TierGiftPromo")
	end

	var_27_0._sequences.TierGiftPromo = var_27_110

	local var_27_111
	local var_27_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_20:RegisterAnimationSequence("UnlockCodPoints", var_27_112)

	local var_27_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_22:RegisterAnimationSequence("UnlockCodPoints", var_27_113)

	local var_27_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 84
		}
	}

	var_27_24:RegisterAnimationSequence("UnlockCodPoints", var_27_114)

	local var_27_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_28:RegisterAnimationSequence("UnlockCodPoints", var_27_115)

	local var_27_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_30:RegisterAnimationSequence("UnlockCodPoints", var_27_116)

	local var_27_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_50:RegisterAnimationSequence("UnlockCodPoints", var_27_117)

	local var_27_118 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_52:RegisterAnimationSequence("UnlockCodPoints", var_27_118)

	local var_27_119 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_27_54:RegisterAnimationSequence("UnlockCodPoints", var_27_119)

	local var_27_120 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_56:RegisterAnimationSequence("UnlockCodPoints", var_27_120)

	local var_27_121 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_76:RegisterAnimationSequence("UnlockCodPoints", var_27_121)

	local function var_27_122()
		var_27_20:AnimateSequence("UnlockCodPoints")
		var_27_22:AnimateSequence("UnlockCodPoints")
		var_27_24:AnimateSequence("UnlockCodPoints")
		var_27_28:AnimateSequence("UnlockCodPoints")
		var_27_30:AnimateSequence("UnlockCodPoints")
		var_27_50:AnimateSequence("UnlockCodPoints")
		var_27_52:AnimateSequence("UnlockCodPoints")
		var_27_54:AnimateSequence("UnlockCodPoints")
		var_27_56:AnimateSequence("UnlockCodPoints")
		var_27_76:AnimateSequence("UnlockCodPoints")
	end

	var_27_0._sequences.UnlockCodPoints = var_27_122

	local var_27_123
	local var_27_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_button_premium"),
			child = var_27_0.BundlePurchaseButton.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_DESC"),
			child = var_27_0.BundlePurchaseButton.BundleDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM"),
			child = var_27_0.BundlePurchaseButton.Title
		}
	}

	var_27_32:RegisterAnimationSequence("LateGrinder", var_27_124)

	local var_27_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_button_bundle"),
			child = var_27_0.PurchaseButton.BackgroundImage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_BUNDLE_DESC"),
			child = var_27_0.PurchaseButton.BundleDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM_BUNDLE"),
			child = var_27_0.PurchaseButton.Title
		}
	}

	var_27_34:RegisterAnimationSequence("LateGrinder", var_27_125)

	local function var_27_126()
		var_27_32:AnimateSequence("LateGrinder")
		var_27_34:AnimateSequence("LateGrinder")
	end

	var_27_0._sequences.LateGrinder = var_27_126

	local var_27_127
	local var_27_128 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_62:RegisterAnimationSequence("DisplayGamepad", var_27_128)

	local var_27_129 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_64:RegisterAnimationSequence("DisplayGamepad", var_27_129)

	local var_27_130 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_66:RegisterAnimationSequence("DisplayGamepad", var_27_130)

	local function var_27_131()
		var_27_62:AnimateSequence("DisplayGamepad")
		var_27_64:AnimateSequence("DisplayGamepad")
		var_27_66:AnimateSequence("DisplayGamepad")
	end

	var_27_0._sequences.DisplayGamepad = var_27_131

	local var_27_132
	local var_27_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_62:RegisterAnimationSequence("DisplayKBM", var_27_133)

	local var_27_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_64:RegisterAnimationSequence("DisplayKBM", var_27_134)

	local var_27_135 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_66:RegisterAnimationSequence("DisplayKBM", var_27_135)

	local function var_27_136()
		var_27_62:AnimateSequence("DisplayKBM")
		var_27_64:AnimateSequence("DisplayKBM")
		var_27_66:AnimateSequence("DisplayKBM")
	end

	var_27_0._sequences.DisplayKBM = var_27_136

	local var_27_137
	local var_27_138 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108
		}
	}

	var_27_62:RegisterAnimationSequence("FocusBundlePurchase", var_27_138)

	local var_27_139 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 102
		}
	}

	var_27_64:RegisterAnimationSequence("FocusBundlePurchase", var_27_139)

	local var_27_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108
		}
	}

	var_27_66:RegisterAnimationSequence("FocusBundlePurchase", var_27_140)

	local function var_27_141()
		var_27_62:AnimateSequence("FocusBundlePurchase")
		var_27_64:AnimateSequence("FocusBundlePurchase")
		var_27_66:AnimateSequence("FocusBundlePurchase")
	end

	var_27_0._sequences.FocusBundlePurchase = var_27_141

	local var_27_142
	local var_27_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 393
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 433
		}
	}

	var_27_62:RegisterAnimationSequence("FocusPurchase", var_27_143)

	local var_27_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 399
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 427
		}
	}

	var_27_64:RegisterAnimationSequence("FocusPurchase", var_27_144)

	local var_27_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 393
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 433
		}
	}

	var_27_66:RegisterAnimationSequence("FocusPurchase", var_27_145)

	local function var_27_146()
		var_27_62:AnimateSequence("FocusPurchase")
		var_27_64:AnimateSequence("FocusPurchase")
		var_27_66:AnimateSequence("FocusPurchase")
	end

	var_27_0._sequences.FocusPurchase = var_27_146

	local var_27_147
	local var_27_148 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 260,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.99,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_64:RegisterAnimationSequence("HoldPulseLoop", var_27_148)

	local var_27_149 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.5,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 240,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 250,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.01,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 240,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_27_66:RegisterAnimationSequence("HoldPulseLoop", var_27_149)

	local function var_27_150()
		var_27_64:AnimateLoop("HoldPulseLoop")
		var_27_66:AnimateLoop("HoldPulseLoop")
	end

	var_27_0._sequences.HoldPulseLoop = var_27_150

	local var_27_151
	local var_27_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_66:RegisterAnimationSequence("StopHoldPulse", var_27_152)

	local function var_27_153()
		var_27_66:AnimateSequence("StopHoldPulse")
	end

	var_27_0._sequences.StopHoldPulse = var_27_153

	local var_27_154
	local var_27_155 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 125,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_64:RegisterAnimationSequence("HoldComplete", var_27_155)

	local var_27_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.5,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 125,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.01,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_66:RegisterAnimationSequence("HoldComplete", var_27_156)

	local function var_27_157()
		var_27_64:AnimateSequence("HoldComplete")
		var_27_66:AnimateSequence("HoldComplete")
	end

	var_27_0._sequences.HoldComplete = var_27_157

	local var_27_158
	local var_27_159 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_62:RegisterAnimationSequence("DisplayGamepadAR", var_27_159)

	local var_27_160 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_64:RegisterAnimationSequence("DisplayGamepadAR", var_27_160)

	local function var_27_161()
		var_27_62:AnimateSequence("DisplayGamepadAR")
		var_27_64:AnimateSequence("DisplayGamepadAR")
	end

	var_27_0._sequences.DisplayGamepadAR = var_27_161

	local var_27_162
	local var_27_163 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_68:RegisterAnimationSequence("HideGiftingBonus", var_27_163)

	local function var_27_164()
		var_27_68:AnimateSequence("HideGiftingBonus")
	end

	var_27_0._sequences.HideGiftingBonus = var_27_164

	local var_27_165
	local var_27_166 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_36:RegisterAnimationSequence("ShowGifting", var_27_166)

	local var_27_167 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_68:RegisterAnimationSequence("ShowGifting", var_27_167)

	local var_27_168 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_70:RegisterAnimationSequence("ShowGifting", var_27_168)

	local function var_27_169()
		var_27_36:AnimateSequence("ShowGifting")
		var_27_68:AnimateSequence("ShowGifting")
		var_27_70:AnimateSequence("ShowGifting")
	end

	var_27_0._sequences.ShowGifting = var_27_169

	local var_27_170

	if CONDITIONS.IsBattlePassBundleTopperActive(var_27_1) then
		local var_27_171 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_27_14:RegisterAnimationSequence("BattlePassTopperActive", var_27_171)
	end

	local function var_27_172()
		if CONDITIONS.IsBattlePassBundleTopperActive(var_27_1) then
			var_27_14:AnimateSequence("BattlePassTopperActive")
		end
	end

	var_27_0._sequences.BattlePassTopperActive = var_27_172

	local var_27_173

	if CONDITIONS.IsBattlePassBundleTopperActive(var_27_1) then
		local var_27_174 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_27_14:RegisterAnimationSequence("BattlePassTopperDisabled", var_27_174)
	end

	local function var_27_175()
		if CONDITIONS.IsBattlePassBundleTopperActive(var_27_1) then
			var_27_14:AnimateSequence("BattlePassTopperDisabled")
		end
	end

	var_27_0._sequences.BattlePassTopperDisabled = var_27_175

	local var_27_176
	local var_27_177 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 107
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 607
		}
	}

	var_27_64:RegisterAnimationSequence("AdjustHoldPromptForConsole", var_27_177)

	local function var_27_178()
		var_27_64:AnimateSequence("AdjustHoldPromptForConsole")
	end

	var_27_0._sequences.AdjustHoldPromptForConsole = var_27_178

	var_27_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_27_179 = LUI.UIBindButton.new()

	var_27_179.id = "selfBindButton"

	var_27_0:addElement(var_27_179)

	var_27_0.bindButton = var_27_179

	var_0_3(var_27_0, var_27_1, arg_27_1)

	return var_27_0
end

MenuBuilder.registerType("BattlePassPurchasePopup", BattlePassPurchasePopup)
LockTable(_M)
