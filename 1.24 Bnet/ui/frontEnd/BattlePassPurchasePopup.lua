module(..., package.seeall)

local var_0_0 = 4

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._targetItemCost = tonumber(BATTLEPASS.GetItemCost(arg_1_3))
	arg_1_0._battlePassPurchaseRef = arg_1_3

	if arg_1_2.GetPurchaseAction then
		if BATTLEPASS.IsTierSkipGiftActive(arg_1_2._controllerIndex) then
			arg_1_2.shouldAwardFreeTierGift = true
			arg_1_2.tierGiftBattlePassPurchaseRef = arg_1_3
		end

		arg_1_2:GetPurchaseAction(arg_1_3)(arg_1_0, arg_1_1)
	end
end

local function var_0_2(arg_2_0)
	local var_2_0 = BATTLEPASS.GetTierSkipGiftID()
	local var_2_1 = LOOT.GetItemsInBundle(var_2_0)
	local var_2_2 = BATTLEPASS.GetItemRef(var_2_1[1])
	local var_2_3 = tonumber(BATTLEPASS.GetItemSkips(var_2_2))

	ACTIONS.AnimateSequence(arg_2_0, "TierGiftPromo")
	ACTIONS.AnimateSequence(arg_2_0.PurchaseButton.Banner, "TabSizeSetup")
	ACTIONS.AnimateSequence(arg_2_0.BundlePurchaseButton.Banner, "TabSizeSetup")
	arg_2_0.PurchaseButton.Banner:SetAlpha(1)
	arg_2_0.BundlePurchaseButton.Banner:SetAlpha(1)
	arg_2_0.PurchaseButton.Banner:SetText(Engine.CBBHFCGDIC("BATTLEPASS/N_BONUS_TIER_SKIPS", var_2_3))
	arg_2_0.BundlePurchaseButton.Banner:SetText(Engine.CBBHFCGDIC("BATTLEPASS/N_BONUS_TIER_SKIPS", var_2_3))
	arg_2_0.PromoNote:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_GIFT_PROMO_NOTE", var_2_3))

	local var_2_4 = "update_promo_timer"
	local var_2_5 = BATTLEPASS.GetTierSkipGiftTimer()
	local var_2_6 = tonumber(var_2_5)

	arg_2_0._promoTimer = LUI.UITimer.new({
		interval = 1000,
		event = var_2_4
	})

	arg_2_0:addElement(arg_2_0._promoTimer)
	arg_2_0:registerAndCallEventHandler(var_2_4, function(arg_3_0, arg_3_1)
		local var_3_0 = Engine.DEIDGHDBHD()

		if var_2_6 - var_3_0 > 0 then
			ACTIONS.AnimateSequence(arg_2_0.PurchaseButton.Banner, "TierSaleVariant")
			ACTIONS.AnimateSequence(arg_2_0.BundlePurchaseButton.Banner, "TierSaleVariant")
			arg_2_0.PromoTimer:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_GIFT_PROMO_TIMER", STORE.ParseCountDownTime(var_2_5)))
		else
			arg_2_0.PurchaseButton.Banner:SetAlpha(0)
			arg_2_0.BundlePurchaseButton.Banner:SetAlpha(0)
			arg_2_0.PromoNote:SetAlpha(0)
			arg_2_0.PromoTimer:SetAlpha(0)
			arg_2_0._promoTimer:closeTree()

			arg_2_0._promoTimer = nil
		end
	end)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.PurchaseButton)
	assert(arg_4_0.BundlePurchaseButton)
	assert(arg_4_0.BundleCards)

	arg_4_0._targetItemCost = -1
	arg_4_0._battlePassPurchaseRef = nil
	arg_4_0._cacheCODPoints = Commerce.CEDDCGHIGA(arg_4_1, LOOT.CurrencyIDs.COD_POINTS)
	arg_4_0.PurchaseBattlePass = var_0_1

	if not CONDITIONS.IsDevelopmentBuild(arg_4_0) or Dvar.IBEGCHEFE("NPOLQSQMNO") then
		Challenge.SetupSeasonEndsTimer(arg_4_0, arg_4_0.SeasonEndTimer, "LUA_MENU/ACCEPT_LOCALIZED")
	else
		arg_4_0.SeasonEndTimer:SetAlpha(0)
	end

	local var_4_0 = BATTLEPASS.GetCodPointsInPass()
	local var_4_1 = BATTLEPASS.GetMaxTier()
	local var_4_2 = BATTLEPASS.GetNumSkipsInBundle(BATTLEPASS.GetPurchaseBundleRef())
	local var_4_3 = BATTLEPASS.GetItemCost(BATTLEPASS.GetPurchaseRef())
	local var_4_4 = BATTLEPASS.GetItemCost(BATTLEPASS.GetPurchaseBundleRef())
	local var_4_5 = BATTLEPASS.GetItemValue(BATTLEPASS.GetPurchaseBundleRef())
	local var_4_6 = LUI.Round((var_4_5 - var_4_4) / var_4_5 * 100, 1)
	local var_4_7 = Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_DESC", var_4_1, var_4_0)
	local var_4_8
	local var_4_9

	if IsLanguageArabic() then
		var_4_8 = Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_EXTRA_DETAILS") .. " " .. var_4_7
		var_4_9 = Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_BUNDLE_EXTRA_DETAILS", var_4_2, var_4_6) .. " " .. var_4_7
	else
		var_4_8 = var_4_7 .. " " .. Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_EXTRA_DETAILS")
		var_4_9 = var_4_7 .. " " .. Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_BUNDLE_EXTRA_DETAILS", var_4_2, var_4_6)
	end

	local var_4_10 = BATTLEPASS.GetTier(arg_4_1)
	local var_4_11 = BATTLEPASS.GetNumSkipsInBundle(BATTLEPASS.GetPurchaseBundleRef())

	if CONDITIONS.IsLateGrindersEnabled() then
		local var_4_12 = BATTLEPASS.GetCurrentCPRewards(arg_4_1)

		if var_4_12.totalCP >= BATTLEPASS.START_TO_SHOW_COD_POINTS then
			arg_4_0.CodPointsCards:SetAlpha(1)

			local var_4_13 = {
				minVerticalOffset = -10,
				height = 200,
				maxVerticalOffset = 20,
				maxHorizontalOffset = 120,
				widget = "LootItemCardMini",
				finalRotation = -30,
				startRotation = 0,
				width = 150,
				numWidgets = #var_4_12.codTiers
			}

			arg_4_0.CodPointsCards:BuildWidgets(arg_4_1, var_4_13)

			local var_4_14 = BATTLEPASS.GetAllRewards()

			for iter_4_0, iter_4_1 in ipairs(var_4_12.codTiers) do
				local var_4_15 = arg_4_0.CodPointsCards.widgets[iter_4_0]
				local var_4_16 = var_4_14[iter_4_1 + BATTLEPASS.NumBonusItems]

				var_4_15:UpdateCardConfig(var_4_16)
				ACTIONS.AnimateSequence(var_4_15, "HideType")
			end

			ACTIONS.AnimateSequence(arg_4_0, "UnlockCodPoints")
			arg_4_0.CodPointsTitle:setText(Engine.CBBHFCGDIC("BATTLEPASS/ADD_X_CP", var_4_12.totalCP))

			local var_4_17 = SEASON.GetCurrentSeason()
			local var_4_18 = tonumber(BATTLEPASS.GetItemCost(BATTLEPASS.GetPurchaseRef()))

			if var_4_18 <= var_4_12.totalCP then
				arg_4_0.CodPointsDesc:setText(Engine.CBBHFCGDIC("BATTLEPASS/CP_FREE_DESC", var_4_17, var_4_17, var_4_17 + 1))
			else
				local var_4_19 = math.floor(var_4_12.totalCP / var_4_18 * 100)

				arg_4_0.CodPointsDesc:setText(Engine.CBBHFCGDIC("BATTLEPASS/CP_DISCOUNT_DESC", var_4_17, var_4_17, var_4_17 + 1, var_4_19))
			end
		end
	end

	assert(arg_4_2.sourceMenu)

	local var_4_20 = arg_4_2.sourceMenu

	if var_4_20.GetPurchaseAction then
		arg_4_0.PurchaseButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
			arg_4_0:PurchaseBattlePass(arg_5_1, var_4_20, BATTLEPASS.GetPurchaseRef())
		end)
		arg_4_0.BundlePurchaseButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			arg_4_0:PurchaseBattlePass(arg_6_1, var_4_20, BATTLEPASS.GetPurchaseBundleRef())
		end)
	end

	arg_4_0._closePopup = arg_4_2.backLeavesBPMenuPopup

	arg_4_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if var_4_20.AnimateXPEarned then
			var_4_20:AnimateXPEarned()
		end

		ACTIONS.LeaveMenu(arg_4_0)

		if arg_4_0._closePopup and CONDITIONS.IsMenuInStack("BattlePassMenuPopup") then
			LUI.FlowManager.RequestLeaveMenuByName("BattlePassMenuPopup", true)
		end
	end)
	arg_4_0:addEventHandler("restore_focus", function(arg_8_0, arg_8_1)
		local var_8_0 = Commerce.CEDDCGHIGA(arg_8_1.controller, LOOT.CurrencyIDs.COD_POINTS)

		if var_8_0 ~= arg_4_0._cacheCODPoints and var_8_0 >= arg_8_0._targetItemCost and arg_4_0._battlePassPurchaseRef then
			local var_8_1 = BATTLEPASS.GetItemLargeImage(arg_4_0._battlePassPurchaseRef)
			local var_8_2 = Engine.CBBHFCGDIC(BATTLEPASS.GetItemName(arg_4_0._battlePassPurchaseRef))
			local var_8_3 = {
				image = var_8_1,
				itemCost = arg_4_0._targetItemCost,
				itemName = var_8_2,
				confirmAction = function()
					var_0_1(arg_8_0, arg_8_1, var_4_20, arg_4_0._battlePassPurchaseRef)
					LUI.FlowManager.RequestLeaveMenuByName("BattlePassConfirmPurchasePopup")
				end,
				cancelAction = function()
					LUI.FlowManager.RequestLeaveMenuByName("BattlePassConfirmPurchasePopup")
				end
			}

			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassConfirmPurchasePopup", true, arg_4_1, false, var_8_3, nil, false, true)
		end

		arg_4_0._cacheCODPoints = var_8_0
	end)
	arg_4_0.PurchaseButton:SetupPremiumButton(var_4_3)
	arg_4_0.PurchaseButton:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		ACTIONS.AnimateSequence(arg_4_0, "Premium")
		arg_4_0.PurchaseTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM")))
		arg_4_0.SubTitle1:setText(Engine.CBBHFCGDIC("BATTLEPASS/WHY_BUY"))
		arg_4_0.Description:setText(var_4_8)
	end)
	arg_4_0.BundlePurchaseButton:SetupBundleButton(var_4_4, var_4_5, var_4_2)
	arg_4_0.BundlePurchaseButton:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		ACTIONS.AnimateSequence(arg_4_0, "PremiumBundle")
		arg_4_0.PurchaseTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM_BUNDLE")))
		arg_4_0.SubTitle1:setText(Engine.CBBHFCGDIC("BATTLEPASS/WHY_BUY_BUNDLE"))
		arg_4_0.Description:setText(var_4_9)

		if var_4_10 + var_4_11 > var_4_1 then
			arg_4_0.Disclaimer:SetAlpha(1, 150)
		end
	end)
	arg_4_0.BundleTiersBonus:setText(Engine.CBBHFCGDIC("BATTLEPASS/EXTRA_TIERS", var_4_2))

	local var_4_21 = {
		minVerticalOffset = -10,
		height = 200,
		maxVerticalOffset = 20,
		maxHorizontalOffset = 120,
		widget = "LootItemCardMini",
		finalRotation = -30,
		startRotation = 0,
		width = 150,
		numWidgets = var_4_2
	}

	arg_4_0.BundleCards:BuildWidgets(arg_4_1, var_4_21)
	arg_4_0.RewardsGrid:SetNumChildren(var_0_0)

	local var_4_22 = BATTLEPASS.GetAllRewards()

	arg_4_0.RewardsGrid:SetRefreshChild(function(arg_13_0, arg_13_1, arg_13_2)
		local var_13_0 = arg_4_0.RewardsGrid:GetContentIndex(arg_13_1, arg_13_2)

		arg_13_0:UpdateCardConfig(var_4_22[var_13_0 + 1])
	end)

	local var_4_23 = var_4_10 + var_4_2

	if var_4_23 > BATTLEPASS.GetMaxTier() then
		var_4_23 = BATTLEPASS.GetMaxTier()
	end

	local var_4_24 = var_4_23 + BATTLEPASS.NumBonusItems
	local var_4_25 = {}

	for iter_4_2 = 1 + BATTLEPASS.NumBonusItems, var_4_24 do
		local var_4_26 = var_4_22[iter_4_2]

		var_4_26.tier = iter_4_2

		table.insert(var_4_25, var_4_26)
	end

	table.sort(var_4_25, function(arg_14_0, arg_14_1)
		if arg_14_0.rarity ~= arg_14_1.rarity then
			return arg_14_0.rarity > arg_14_1.rarity
		end

		if arg_14_0.type ~= arg_14_1.type then
			return arg_14_0.type < arg_14_1.type
		end

		if arg_14_0.tier ~= arg_14_1.tier then
			return arg_14_0.tier > arg_14_1.tier
		end
	end)

	for iter_4_3 = 1, #arg_4_0.BundleCards.widgets do
		local var_4_27 = arg_4_0.BundleCards.widgets[#arg_4_0.BundleCards.widgets + 1 - iter_4_3]

		var_4_27:UpdateCardConfig(var_4_25[iter_4_3])
		ACTIONS.AnimateSequence(var_4_27, "HideType")
	end

	arg_4_0.isQuickAccessShortcutsDisabled = true

	if BATTLEPASS.IsTierSkipGiftActive(arg_4_1) then
		var_0_2(arg_4_0)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end

	Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseWindow)
	ACTIONS.ScaleFullscreen(arg_4_0.Background)
end

function BattlePassPurchasePopup(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIVerticalNavigator.new()

	var_15_0.id = "BattlePassPurchasePopup"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	var_15_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_15_1
	})
	var_15_0.HelperBar.id = "HelperBar"

	var_15_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_15_0.HelperBar:setPriority(10)
	var_15_0:addElement(var_15_0.HelperBar)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "Background"

	var_15_4:SetRGBFromInt(0, 0)
	var_15_4:SetAlpha(0.9, 0)
	var_15_0:addElement(var_15_4)

	var_15_0.Background = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("BattlePassPopupWindow", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "BattlePassPopupWindow"

	var_15_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 846, _1080p * -353, _1080p * 449)
	var_15_0:addElement(var_15_6)

	var_15_0.BattlePassPopupWindow = var_15_6

	local var_15_7
	local var_15_8 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 4,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_15_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("LootItemCardMini", {
				controllerIndex = var_15_1
			})
		end,
		refreshChild = function(arg_17_0, arg_17_1, arg_17_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 200,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Middle
	}
	local var_15_9 = LUI.UIGrid.new(var_15_8)

	var_15_9.id = "RewardsGrid"

	var_15_9:setUseStencil(false)
	var_15_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -163, _1080p * 497, _1080p * 154, _1080p * 354)
	var_15_0:addElement(var_15_9)

	var_15_0.RewardsGrid = var_15_9

	local var_15_10
	local var_15_11 = LUI.UIImage.new()

	var_15_11.id = "BundleTiersBonusBG"

	var_15_11:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_15_11:SetAlpha(0.5, 0)
	var_15_11:SetPixelGridEnabled(true)
	var_15_11:SetPixelGridContrast(0.5, 0)
	var_15_11:SetPixelGridBlockWidth(2, 0)
	var_15_11:SetPixelGridBlockHeight(2, 0)
	var_15_11:SetPixelGridGutterWidth(1, 0)
	var_15_11:SetPixelGridGutterHeight(1, 0)
	var_15_11:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_15_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 517, _1080p * 667, _1080p * 354, _1080p * 394)
	var_15_0:addElement(var_15_11)

	var_15_0.BundleTiersBonusBG = var_15_11

	local var_15_12
	local var_15_13 = LUI.UIStyledText.new()

	var_15_13.id = "BundleTiersBonus"

	var_15_13:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_15_13:setText(Engine.CBBHFCGDIC("BATTLEPASS/EXTRA_TIERS"), 0)
	var_15_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_13:SetAlignment(LUI.Alignment.Center)
	var_15_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 517, _1080p * 667, _1080p * 362, _1080p * 386)
	var_15_0:addElement(var_15_13)

	var_15_0.BundleTiersBonus = var_15_13

	local var_15_14
	local var_15_15 = MenuBuilder.BuildRegisteredType("FanDisplayWidget", {
		controllerIndex = var_15_1
	})

	var_15_15.id = "BundleCards"

	var_15_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 517, _1080p * 667, _1080p * 154, _1080p * 354)
	var_15_0:addElement(var_15_15)

	var_15_0.BundleCards = var_15_15

	local var_15_16
	local var_15_17 = LUI.UIStyledText.new()

	var_15_17.id = "UnlocksLabel"

	var_15_17:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_17:setText(Engine.CBBHFCGDIC("BATTLEPASS/UNLOCKS_DESC"), 0)
	var_15_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_17:SetAlignment(LUI.Alignment.Left)
	var_15_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -163, _1080p * 667, _1080p * 85, _1080p * 105)
	var_15_0:addElement(var_15_17)

	var_15_0.UnlocksLabel = var_15_17

	local var_15_18
	local var_15_19 = LUI.UIStyledText.new()

	var_15_19.id = "SubTitle2"

	var_15_19:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_15_19:setText(Engine.CBBHFCGDIC("BATTLEPASS/INSTANT_UNLOCKS"), 0)
	var_15_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_19:SetAlignment(LUI.Alignment.Left)
	var_15_19:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -163, _1080p * 667, _1080p * 40, _1080p * 76)
	var_15_0:addElement(var_15_19)

	var_15_0.SubTitle2 = var_15_19

	local var_15_20
	local var_15_21 = LUI.UIStyledText.new()

	var_15_21.id = "Description"

	var_15_21:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_21:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_DESC"), 0)
	var_15_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_21:SetAlignment(LUI.Alignment.Left)
	var_15_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_15_21:SetStartupDelay(1000)
	var_15_21:SetLineHoldTime(400)
	var_15_21:SetAnimMoveTime(1000)
	var_15_21:SetAnimMoveSpeed(150)
	var_15_21:SetEndDelay(1000)
	var_15_21:SetCrossfadeTime(1000)
	var_15_21:SetFadeInTime(300)
	var_15_21:SetFadeOutTime(300)
	var_15_21:SetMaxVisibleLines(5)
	var_15_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -163, _1080p * 667, _1080p * -74, _1080p * -54)
	var_15_0:addElement(var_15_21)

	var_15_0.Description = var_15_21

	local var_15_22
	local var_15_23 = LUI.UIStyledText.new()

	var_15_23.id = "SubTitle1"

	var_15_23:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_15_23:setText(Engine.CBBHFCGDIC("BATTLEPASS/WHY_BUY"), 0)
	var_15_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_23:SetAlignment(LUI.Alignment.Left)
	var_15_23:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -163, _1080p * 687, _1080p * -120, _1080p * -84)
	var_15_0:addElement(var_15_23)

	var_15_0.SubTitle1 = var_15_23

	local var_15_24
	local var_15_25 = LUI.UIText.new()

	var_15_25.id = "PurchaseTitle"

	var_15_25:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_15_25:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM")), 0)
	var_15_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_25:SetAlignment(LUI.Alignment.Left)
	var_15_25:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -163, _1080p * 687, _1080p * -185, _1080p * -135)
	var_15_0:addElement(var_15_25)

	var_15_0.PurchaseTitle = var_15_25

	local var_15_26
	local var_15_27 = LUI.UIStyledText.new()

	var_15_27.id = "OrText"

	var_15_27:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_15_27:setText(Engine.CBBHFCGDIC("BATTLEPASS/OR"), 0)
	var_15_27:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_27:SetAlignment(LUI.Alignment.Center)
	var_15_27:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_27:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -797, _1080p * -285, _1080p * 82, _1080p * 118)
	var_15_0:addElement(var_15_27)

	var_15_0.OrText = var_15_27

	local var_15_28
	local var_15_29 = LUI.UIImage.new()

	var_15_29.id = "PurchaseArrow"

	var_15_29:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_15_29:setImage(RegisterMaterial("wdg_selection_arrow_right_1"), 0)
	var_15_29:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -1225, _1080p * -1198, _1080p * -81, _1080p * -27)
	var_15_0:addElement(var_15_29)

	var_15_0.PurchaseArrow = var_15_29

	local var_15_30
	local var_15_31 = LUI.UIImage.new()

	var_15_31.id = "BundleArrow"

	var_15_31:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_15_31:setImage(RegisterMaterial("wdg_selection_arrow_right_1"), 0)
	var_15_31:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -1225, _1080p * -1198, _1080p * 227, _1080p * 281)
	var_15_0:addElement(var_15_31)

	var_15_0.BundleArrow = var_15_31

	local var_15_32
	local var_15_33 = MenuBuilder.BuildRegisteredType("BattlePassPurchasePopupButton", {
		controllerIndex = var_15_1
	})

	var_15_33.id = "BundlePurchaseButton"

	var_15_33.BackgroundImage:setImage(RegisterMaterial("battlepass_button_bundle"), 0)
	var_15_33.BundleDescription:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_BUNDLE_DESC"), 0)
	var_15_33.Title:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM_BUNDLE"), 0)
	var_15_33:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -797, _1080p * -285, _1080p * -182, _1080p * 74)
	var_15_0:addElement(var_15_33)

	var_15_0.BundlePurchaseButton = var_15_33

	local var_15_34
	local var_15_35 = MenuBuilder.BuildRegisteredType("BattlePassPurchasePopupButton", {
		controllerIndex = var_15_1
	})

	var_15_35.id = "PurchaseButton"

	var_15_35.BundleDescription:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREMIUM_DESC"), 0)
	var_15_35.Title:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLEPASS_PREMIUM"), 0)
	var_15_35:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -797, _1080p * -285, _1080p * 126, _1080p * 382)
	var_15_0:addElement(var_15_35)

	var_15_0.PurchaseButton = var_15_35

	local var_15_36
	local var_15_37 = MenuBuilder.BuildRegisteredType("CurrentTierLabel", {
		controllerIndex = var_15_1
	})

	var_15_37.id = "CurrentTierLabel"

	var_15_37.TierLabel:SetAlignment(LUI.Alignment.Left)
	var_15_37:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * -249, _1080p * -257, _1080p * -221)
	var_15_0:addElement(var_15_37)

	var_15_0.CurrentTierLabel = var_15_37

	local var_15_38
	local var_15_39 = LUI.UIText.new()

	var_15_39.id = "Title"

	var_15_39:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_15_39:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/UPGRADE")), 0)
	var_15_39:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_15_39:SetAlignment(LUI.Alignment.Left)
	var_15_39:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * 364, _1080p * -324, _1080p * -264)
	var_15_0:addElement(var_15_39)

	var_15_0.Title = var_15_39

	local var_15_40
	local var_15_41 = LUI.UIStyledText.new()

	var_15_41.id = "SeasonEndTimer"

	var_15_41:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_15_41:setText("6d 20h 54m", 0)
	var_15_41:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_41:SetAlignment(LUI.Alignment.Center)
	var_15_41:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 667, _1080p * 839, _1080p * -245, _1080p * -221)
	var_15_0:addElement(var_15_41)

	var_15_0.SeasonEndTimer = var_15_41

	local var_15_42

	if CONDITIONS.IsUserSignedInDemonware(var_15_1) then
		local var_15_43 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_15_1
		})

		var_15_43.id = "MPPlayerDetails"

		var_15_43:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_15_0:addElement(var_15_43)

		var_15_0.MPPlayerDetails = var_15_43
	end

	local var_15_44
	local var_15_45 = LUI.UIStyledText.new()

	var_15_45.id = "Disclaimer"

	var_15_45:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_15_45:SetAlpha(0, 0)
	var_15_45:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_DISCLAIMER"), 0)
	var_15_45:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_45:SetAlignment(LUI.Alignment.Left)
	var_15_45:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -163, _1080p * 806, _1080p * 402, _1080p * 420)
	var_15_0:addElement(var_15_45)

	var_15_0.Disclaimer = var_15_45

	local var_15_46
	local var_15_47 = LUI.UIStyledText.new()

	var_15_47.id = "PromoTimer"

	var_15_47:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_15_47:SetAlpha(0, 0)
	var_15_47:setText("", 0)
	var_15_47:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_47:SetAlignment(LUI.Alignment.Left)
	var_15_47:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * -285, _1080p * -260, _1080p * -230)
	var_15_0:addElement(var_15_47)

	var_15_0.PromoTimer = var_15_47

	local var_15_48
	local var_15_49 = LUI.UIStyledText.new()

	var_15_49.id = "PromoNote"

	var_15_49:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_15_49:SetAlpha(0, 0)
	var_15_49:setText("", 0)
	var_15_49:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_15_49:SetAlignment(LUI.Alignment.Left)
	var_15_49:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_49:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -797, _1080p * -285, _1080p * 410, _1080p * 432)
	var_15_0:addElement(var_15_49)

	var_15_0.PromoNote = var_15_49

	local var_15_50
	local var_15_51 = LUI.UIText.new()

	var_15_51.id = "CodPointsTitle"

	var_15_51:SetRGBFromTable(SWATCHES.BattlePass.PurchasedHighlight, 0)
	var_15_51:SetAlpha(0, 0)
	var_15_51:setText(Engine.CBBHFCGDIC("BATTLEPASS/ADD_X_CP"), 0)
	var_15_51:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_51:SetAlignment(LUI.Alignment.Left)
	var_15_51:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -163, _1080p * 1757, _1080p * -195, _1080p * -125)
	var_15_0:addElement(var_15_51)

	var_15_0.CodPointsTitle = var_15_51

	local var_15_52
	local var_15_53 = LUI.UIStyledText.new()

	var_15_53.id = "CodPointsDesc"

	var_15_53:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_53:SetAlpha(0, 0)
	var_15_53:setText(Engine.CBBHFCGDIC("BATTLEPASS/CP_DISCOUNT_DESC"), 0)
	var_15_53:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_53:SetAlignment(LUI.Alignment.Left)
	var_15_53:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_15_53:SetStartupDelay(1000)
	var_15_53:SetLineHoldTime(400)
	var_15_53:SetAnimMoveTime(1000)
	var_15_53:SetAnimMoveSpeed(150)
	var_15_53:SetEndDelay(1000)
	var_15_53:SetCrossfadeTime(1000)
	var_15_53:SetFadeInTime(300)
	var_15_53:SetFadeOutTime(300)
	var_15_53:SetMaxVisibleLines(5)
	var_15_53:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -163, _1080p * 439, _1080p * -74, _1080p * -54)
	var_15_0:addElement(var_15_53)

	var_15_0.CodPointsDesc = var_15_53

	local var_15_54
	local var_15_55 = MenuBuilder.BuildRegisteredType("FanDisplayWidget", {
		controllerIndex = var_15_1
	})

	var_15_55.id = "CodPointsCards"

	var_15_55:SetAlpha(0, 0)
	var_15_55:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 517, _1080p * 667, _1080p * -174, _1080p * 26)
	var_15_0:addElement(var_15_55)

	var_15_0.CodPointsCards = var_15_55

	local function var_15_56()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_56

	local var_15_57
	local var_15_58 = {
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

	var_15_11:RegisterAnimationSequence("PremiumBundle", var_15_58)

	local var_15_59 = {
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

	var_15_13:RegisterAnimationSequence("PremiumBundle", var_15_59)

	local var_15_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_15_15:RegisterAnimationSequence("PremiumBundle", var_15_60)

	local var_15_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/WHY_BUY_BUNDLE")
		}
	}

	var_15_23:RegisterAnimationSequence("PremiumBundle", var_15_61)

	local var_15_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_29:RegisterAnimationSequence("PremiumBundle", var_15_62)

	local var_15_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_31:RegisterAnimationSequence("PremiumBundle", var_15_63)

	local function var_15_64()
		var_15_11:AnimateSequence("PremiumBundle")
		var_15_13:AnimateSequence("PremiumBundle")
		var_15_15:AnimateSequence("PremiumBundle")
		var_15_23:AnimateSequence("PremiumBundle")
		var_15_29:AnimateSequence("PremiumBundle")
		var_15_31:AnimateSequence("PremiumBundle")
	end

	var_15_0._sequences.PremiumBundle = var_15_64

	local var_15_65
	local var_15_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_11:RegisterAnimationSequence("Premium", var_15_66)

	local var_15_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_13:RegisterAnimationSequence("Premium", var_15_67)

	local var_15_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_15:RegisterAnimationSequence("Premium", var_15_68)

	local var_15_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/WHY_BUY")
		}
	}

	var_15_23:RegisterAnimationSequence("Premium", var_15_69)

	local var_15_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_29:RegisterAnimationSequence("Premium", var_15_70)

	local var_15_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_31:RegisterAnimationSequence("Premium", var_15_71)

	local var_15_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_45:RegisterAnimationSequence("Premium", var_15_72)

	local function var_15_73()
		var_15_11:AnimateSequence("Premium")
		var_15_13:AnimateSequence("Premium")
		var_15_15:AnimateSequence("Premium")
		var_15_23:AnimateSequence("Premium")
		var_15_29:AnimateSequence("Premium")
		var_15_31:AnimateSequence("Premium")
		var_15_45:AnimateSequence("Premium")
	end

	var_15_0._sequences.Premium = var_15_73

	local var_15_74
	local var_15_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 115
		}
	}

	var_15_17:RegisterAnimationSequence("AR", var_15_75)

	local var_15_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 86
		}
	}

	var_15_19:RegisterAnimationSequence("AR", var_15_76)

	local var_15_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -44
		}
	}

	var_15_21:RegisterAnimationSequence("AR", var_15_77)

	local var_15_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -74
		}
	}

	var_15_23:RegisterAnimationSequence("AR", var_15_78)

	local var_15_79 = {
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

	var_15_49:RegisterAnimationSequence("AR", var_15_79)

	local function var_15_80()
		var_15_17:AnimateSequence("AR")
		var_15_19:AnimateSequence("AR")
		var_15_21:AnimateSequence("AR")
		var_15_23:AnimateSequence("AR")
		var_15_49:AnimateSequence("AR")
	end

	var_15_0._sequences.AR = var_15_80

	local var_15_81
	local var_15_82 = {
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
			child = var_15_0.CurrentTierLabel.TierLabel
		}
	}

	var_15_37:RegisterAnimationSequence("TierGiftPromo", var_15_82)

	local var_15_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_47:RegisterAnimationSequence("TierGiftPromo", var_15_83)

	local var_15_84 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_49:RegisterAnimationSequence("TierGiftPromo", var_15_84)

	local function var_15_85()
		var_15_37:AnimateSequence("TierGiftPromo")
		var_15_47:AnimateSequence("TierGiftPromo")
		var_15_49:AnimateSequence("TierGiftPromo")
	end

	var_15_0._sequences.TierGiftPromo = var_15_85

	local var_15_86
	local var_15_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_15:RegisterAnimationSequence("UnlockCodPoints", var_15_87)

	local var_15_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_17:RegisterAnimationSequence("UnlockCodPoints", var_15_88)

	local var_15_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_19:RegisterAnimationSequence("UnlockCodPoints", var_15_89)

	local var_15_90 = {
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

	var_15_21:RegisterAnimationSequence("UnlockCodPoints", var_15_90)

	local var_15_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_23:RegisterAnimationSequence("UnlockCodPoints", var_15_91)

	local var_15_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_25:RegisterAnimationSequence("UnlockCodPoints", var_15_92)

	local var_15_93 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_51:RegisterAnimationSequence("UnlockCodPoints", var_15_93)

	local var_15_94 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_53:RegisterAnimationSequence("UnlockCodPoints", var_15_94)

	local var_15_95 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_55:RegisterAnimationSequence("UnlockCodPoints", var_15_95)

	local function var_15_96()
		var_15_15:AnimateSequence("UnlockCodPoints")
		var_15_17:AnimateSequence("UnlockCodPoints")
		var_15_19:AnimateSequence("UnlockCodPoints")
		var_15_21:AnimateSequence("UnlockCodPoints")
		var_15_23:AnimateSequence("UnlockCodPoints")
		var_15_25:AnimateSequence("UnlockCodPoints")
		var_15_51:AnimateSequence("UnlockCodPoints")
		var_15_53:AnimateSequence("UnlockCodPoints")
		var_15_55:AnimateSequence("UnlockCodPoints")
	end

	var_15_0._sequences.UnlockCodPoints = var_15_96

	var_15_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_15_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_15_97 = LUI.UIBindButton.new()

	var_15_97.id = "selfBindButton"

	var_15_0:addElement(var_15_97)

	var_15_0.bindButton = var_15_97

	var_0_3(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("BattlePassPurchasePopup", BattlePassPurchasePopup)
LockTable(_M)
