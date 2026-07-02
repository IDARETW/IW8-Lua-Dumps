module(..., package.seeall)

local var_0_0 = {
	complete = 5,
	owned = 3,
	pending = 4,
	purchasePass = 1,
	purchaseTier = 2
}
local var_0_1 = 150

local function var_0_2(arg_1_0)
	if IsLanguageRussian() then
		var_0_1 = 250
	elseif IsLanguageChinese() then
		var_0_1 = 200
	end

	var_0_1 = var_0_1 * _1080p
end

local function var_0_3(arg_2_0, arg_2_1)
	local function var_2_0()
		if LUI.IsLastInputKeyboardMouse(arg_2_0._controllerIndex) == true then
			ACTIONS.AnimateSequence(arg_2_0, "TierKBM")
		else
			ACTIONS.AnimateSequence(arg_2_0, "Tier")
		end

		if arg_2_0._displaySeasonTimer then
			ACTIONS.AnimateSequence(arg_2_0, "ResetTier")
		end
	end

	if arg_2_0._curState == var_0_0.purchasePass then
		local var_2_1 = "Season" .. SEASON.GetCurrentSeasonDisplayNum({
			isForBattlePass = true
		})

		if arg_2_0._sequences and arg_2_0._sequences[var_2_1] then
			ACTIONS.AnimateSequence(arg_2_0, var_2_1)
		else
			ACTIONS.AnimateSequence(arg_2_0, "Purchase")
		end

		arg_2_0.PurchaseText:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/UPGRADE_TO_PREMIUM")))
		arg_2_0:ResizeButton(false)
	elseif arg_2_0._curState == var_0_0.purchaseTier then
		if arg_2_1 then
			ACTIONS.AnimateSequence(arg_2_0, "InitialTier")
			arg_2_0:ResizeButton(false)
		else
			var_2_0()

			arg_2_0:Wait(100).onComplete = function()
				arg_2_0:ResizeButton(false, 80)
			end
		end
	elseif arg_2_0._curState == var_0_0.owned then
		ACTIONS.AnimateSequence(arg_2_0, "Owned")
		arg_2_0.PurchaseText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PURCHASED_CAPS")))

		if arg_2_0._displaySeasonTimer then
			ACTIONS.AnimateSequence(arg_2_0, "ResetOwned")

			arg_2_0:Wait(120).onComplete = function()
				arg_2_0:ResizeButton(true, 80, LUI.EASING.inCubic)
			end
		end
	elseif arg_2_0._curState == var_0_0.complete then
		ACTIONS.AnimateSequence(arg_2_0, "Complete")
		arg_2_0.PurchaseText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/COMPLETE_BATTLEPASS")))
		arg_2_0:ResizeButton(false, 80, LUI.EASING.inCubic)
	elseif arg_2_0._curState == var_0_0.pending then
		var_2_0()

		arg_2_0:Wait(100).onComplete = function()
			arg_2_0:ResizeButton(false, 80)
		end

		arg_2_0.PurchaseText:setText(Engine.CBBHFCGDIC("BATTLEPASS/CLAIM_X", "BATTLEPASS/BATTLE_PASS_TOKENS"))
	end

	if arg_2_0._saleTimer then
		if arg_2_0._curState == var_0_0.owned or arg_2_0._curState == var_0_0.complete then
			arg_2_0.TierSaleBanner:SetAlpha(0)
		else
			arg_2_0.TierSaleBanner:SetAlpha(1)
		end
	elseif arg_2_0._promoTimer then
		arg_2_0.TierSaleBanner:SetAlpha(arg_2_0._curState == var_0_0.purchasePass and 1 or 0)
	elseif CONDITIONS.IsLateGrindersEnabled() and arg_2_0._currentCPRewards.totalCP >= BATTLEPASS.START_TO_SHOW_COD_POINTS and not arg_2_0._battlePassOwned then
		arg_2_0.TierSaleBanner:SetAlpha(1)
	else
		arg_2_0.TierSaleBanner:SetAlpha(0)
	end
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = Engine.CBBHFCGDIC(arg_7_2)
	local var_7_1

	if arg_7_1 and #arg_7_1 > 0 then
		var_7_1 = STORE.ParseCountDownTime(arg_7_1)
	end

	if var_7_1 then
		if IsLanguageArabic() then
			var_7_0 = var_7_1 .. " :" .. var_7_0
		else
			var_7_0 = Engine.CBBHFCGDIC("LUA_MENU/X_COLON_Y", var_7_0, var_7_1)
		end
	end

	arg_7_0.TierSaleBanner:SetText(var_7_0)
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_0._timer then
		arg_8_0._timer:closeTree()
	end

	arg_8_0.TierSaleBanner:PlayGlint(true)

	local var_8_0 = "battlepass_purchase_button_timer_event"

	arg_8_0._timer = LUI.UITimer.new({
		interval = 1000,
		event = var_8_0
	})
	arg_8_0._timer.id = "battlepass_purchase_button_timer"

	arg_8_0:addElement(arg_8_0._timer)
	arg_8_0:registerAndCallEventHandler(var_8_0, arg_8_2)
end

local function var_0_6(arg_9_0)
	if arg_9_0.BattlePassBundleTopperTimer then
		if CONDITIONS.IsBattlePassBundleTopperActive() and not BATTLEPASS.IsOwned(arg_9_0._controllerIndex) then
			ACTIONS.AnimateSequence(arg_9_0, "BattlePassBundleVisible")
			ACTIONS.AnimateSequence(arg_9_0.BattlePassBundleTopperTimer, "BattlePassBundleVisible")

			local var_9_0 = Dvar.CFHDGABACF("LKOKTLQSPT")

			arg_9_0.BattlePassBundleTopperTimer:SetBattlePassTopperTimer(var_9_0)
		else
			arg_9_0.BattlePassBundleTopperTimer:HideBattlePassTopperTimer()
			ACTIONS.AnimateSequence(arg_9_0, "BattlePassBundleHidden")
		end
	end
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	if arg_10_0._battlePassOwned ~= arg_10_1 then
		arg_10_0:UpdateBattlePassEmblem(arg_10_1)
		var_0_6(arg_10_0)
	end

	arg_10_0._battlePassOwned = arg_10_1
	arg_10_0._showTooltip = true

	local var_10_0

	if arg_10_4 then
		var_10_0 = var_0_0.pending
	elseif arg_10_1 then
		if arg_10_2 then
			if arg_10_3 == BATTLEPASS.GetMaxTier() then
				var_10_0 = var_0_0.complete
			else
				var_10_0 = var_0_0.owned
			end

			arg_10_0._showTooltip = false
		else
			var_10_0 = var_0_0.purchaseTier
		end
	else
		var_10_0 = var_0_0.purchasePass
	end

	arg_10_0:UpdateTooltip()

	local function var_10_1(arg_11_0)
		ACTIONS.AnimateSequence(arg_10_0.TierSaleBanner, "ButtonSizeSetup")

		local var_11_0 = 86400
		local var_11_1 = Engine.DEIDGHDBHD()
		local var_11_2 = tonumber(arg_11_0) - var_11_1

		if var_11_0 < var_11_2 then
			ACTIONS.AnimateSequence(arg_10_0.TierSaleBanner, "TierSaleVariant")
			ACTIONS.AnimateSequence(arg_10_0.TierSaleBanner, "GlowPulse")
		elseif var_11_2 > 0 then
			ACTIONS.AnimateSequence(arg_10_0.TierSaleBanner, "TierSaleVariantEndSoon")
			ACTIONS.AnimateSequence(arg_10_0.TierSaleBanner, "GlowPulse")
		else
			arg_10_0.TierSaleBanner:SetAlpha(0)
			arg_10_0._timer:closeTree()

			arg_10_0._saleTimer = false
			arg_10_0._promoTimer = false
		end
	end

	if arg_10_0._battlePassOwned and CONDITIONS.IsTierSaleEnabled() then
		if not arg_10_0._saleTimer then
			local var_10_2 = Dvar.DHEEJCCJBH("MQTOPKPMRS")

			if var_10_2 and var_10_2 ~= "" and Engine.CCEJJCCDEG(var_10_2) > 0 then
				var_0_5(arg_10_0, var_10_2, function(arg_12_0, arg_12_1)
					var_10_1(var_10_2)
					var_0_4(arg_12_0, var_10_2, "LUA_MENU/SALE_CAPS")
				end)

				arg_10_0._saleTimer = true
			end
		end

		if arg_10_0.CodPointCards then
			arg_10_0.CodPointCards:SetAlpha(0)
		end
	elseif not arg_10_0._battlePassOwned then
		if BATTLEPASS.IsTierSkipGiftActive(arg_10_0._controllerIndex) and not arg_10_0._promoTimer then
			local var_10_3 = BATTLEPASS.GetTierSkipGiftTimer()

			var_0_5(arg_10_0, var_10_3, function(arg_13_0, arg_13_1)
				var_10_1(var_10_3)
				var_0_4(arg_13_0, var_10_3, "MENU/PROMO")
			end)

			arg_10_0._promoTimer = true
		elseif CONDITIONS.IsLateGrindersEnabled() and arg_10_0._currentCPRewards.totalCP >= BATTLEPASS.START_TO_SHOW_COD_POINTS then
			arg_10_0.TierSaleBanner:SetAlpha(1)
			ACTIONS.AnimateSequence(arg_10_0.TierSaleBanner, "LateGrindersVariant")
			arg_10_0.TierSaleBanner:SetText(Engine.CBBHFCGDIC("BATTLEPASS/UNLOCK_COD_POINTS", arg_10_0._currentCPRewards.totalCP))
			arg_10_0.CodPointCards:SetAlpha(1)
		end
	else
		arg_10_0.TierSaleBanner:SetAlpha(0)

		if arg_10_0.CodPointCards then
			arg_10_0.CodPointCards:SetAlpha(0)
		end
	end

	if var_10_0 ~= arg_10_0._curState then
		local var_10_4 = arg_10_0._curState == nil

		arg_10_0._curState = var_10_0

		arg_10_0:AnimateCurrentState(var_10_4)
	elseif var_10_0 ~= var_0_0.owned then
		arg_10_0:ResizeButton(false, 100)
	end
end

local function var_0_8(arg_14_0, arg_14_1)
	local var_14_0 = LAYOUT.GetTextWidth(arg_14_0.PurchaseText)
	local var_14_1 = LAYOUT.GetTextWidth(arg_14_0.ResetText)
	local var_14_2

	if arg_14_1 and not arg_14_0._battlePassOwned then
		var_14_2 = var_14_1 * 1.25
	else
		var_14_2 = var_14_1 < var_14_0 and var_14_0 or var_14_1
	end

	if arg_14_0._saleTimer then
		if arg_14_0._curState == var_0_0.owned or arg_14_0._curState == var_0_0.complete then
			arg_14_0.TierSaleBanner:SetAlpha(0)
		else
			arg_14_0.TierSaleBanner:SetAlpha(1)

			if var_14_2 < var_0_1 then
				var_14_2 = var_0_1
			end
		end
	elseif arg_14_0._promoTimer then
		if arg_14_0._curState == var_0_0.purchasePass then
			arg_14_0.TierSaleBanner:SetAlpha(1)

			if var_14_2 < var_0_1 then
				var_14_2 = var_0_1
			end
		else
			arg_14_0.TierSaleBanner:SetAlpha(0)
		end
	end

	local var_14_3 = var_14_2 + arg_14_0.PurchaseText:GetCurrentAnchorsAndPositions().left
	local var_14_4 = 25 * _1080p
	local var_14_5 = duration ~= nil and duration or 0
	local var_14_6 = easing ~= nil and easing or LUI.EASING.Linear

	for iter_14_0 = 1, #arg_14_0._resizableElements do
		local var_14_7 = arg_14_0._resizableElements[iter_14_0]

		if not arg_14_1 or not var_14_7.isSaleBanner then
			var_14_7.widget:SetRight(var_14_3 + var_14_4, var_14_5, var_14_6)
		end
	end

	if arg_14_0.CodPointCards and CONDITIONS.IsLateGrindersEnabled() then
		local var_14_8 = LAYOUT.GetElementWidth(arg_14_0.CodPointCards)
		local var_14_9 = -8 * _1080p

		arg_14_0.CodPointCards:SetLeft(var_14_3 + var_14_9)
		arg_14_0.CodPointCards:SetRight(var_14_3 + var_14_9 + var_14_8)
	end
end

local function var_0_9(arg_15_0)
	arg_15_0:RemoveToolTipData()
end

local function var_0_10(arg_16_0)
	if arg_16_0._useKBMControls then
		arg_16_0:SetFocusable(arg_16_0._showTooltip)
		arg_16_0:SetHandleMouse(arg_16_0._showTooltip)
	else
		arg_16_0:SetFocusable(false)
		arg_16_0:SetHandleMouse(false)
	end
end

local function var_0_11(arg_17_0, arg_17_1)
	local var_17_0

	if arg_17_1 then
		var_17_0 = BATTLEPASS.GetEmblemGold()
	else
		var_17_0 = BATTLEPASS.GetEmblemSilver()
	end

	if var_17_0 and #var_17_0 > 0 then
		arg_17_0.SeasonImg:setImage(RegisterMaterial(var_17_0))
		arg_17_0.BattlePass:setImage(RegisterMaterial(var_17_0))
	end
end

local function var_0_12(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.ResizeButton = var_0_8
	arg_18_0.UpdateButtonState = var_0_7
	arg_18_0.AnimateCurrentState = var_0_3
	arg_18_0.UpdateTooltip = var_0_10
	arg_18_0.UpdateBattlePassEmblem = var_0_11
	arg_18_0._controllerIndex = arg_18_1
	arg_18_0._curState = nil
	arg_18_0._battlePassOwned = BATTLEPASS.IsOwned(arg_18_1)
	arg_18_0._showTooltip = arg_18_0._curState == var_0_0.complete or arg_18_0._curState == var_0_0.owned
	arg_18_0._useKBMControls = LUI.IsLastInputKeyboardMouse(arg_18_1)
	arg_18_0._displaySeasonTimer = Dvar.IBEGCHEFE("NPOLQSQMNO")

	arg_18_0.Mask:SetAlpha(1)
	arg_18_0.Glint:SetMask(arg_18_0.Mask)
	var_0_2(arg_18_0)

	if arg_18_0._curState ~= var_0_0.complete then
		ACTIONS.AnimateSequence(arg_18_0, "GlowPulse")
	end

	arg_18_0._resizableElements = {
		{
			isSaleBanner = true,
			widget = arg_18_0.TierSaleBanner
		}
	}
	arg_18_0._currentSeason = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	if arg_18_0._currentSeason then
		ACTIONS.AnimateSequence(arg_18_0, "S5")
	end

	if arg_18_0._displaySeasonTimer then
		Challenge.SetupSeasonEndsTimer(arg_18_0, arg_18_0.ResetText, "MENU/PASS_RESET")
	else
		arg_18_0.ResetText:SetAlpha(0)
	end

	if CONDITIONS.IsLateGrindersEnabled() then
		arg_18_0._currentCPRewards = BATTLEPASS.GetCurrentCPRewards(arg_18_0._controllerIndex)

		if arg_18_0._currentCPRewards.totalCP >= BATTLEPASS.START_TO_SHOW_COD_POINTS then
			arg_18_0.CodPointCards:SetAlpha(1)

			local var_18_0 = {
				minVerticalOffset = -10,
				height = 200,
				maxVerticalOffset = 20,
				maxHorizontalOffset = 120,
				widget = "LootItemCardMini",
				finalRotation = -30,
				startRotation = 0,
				width = 150,
				numWidgets = #arg_18_0._currentCPRewards.codTiers
			}

			arg_18_0.CodPointCards:BuildWidgets(arg_18_1, var_18_0)

			local var_18_1 = BATTLEPASS.GetAllRewards(arg_18_0._controllerIndex)

			for iter_18_0, iter_18_1 in ipairs(arg_18_0._currentCPRewards.codTiers) do
				local var_18_2 = arg_18_0.CodPointCards.widgets[iter_18_0]
				local var_18_3 = var_18_1[iter_18_1 + BATTLEPASS.NumBonusItems]

				var_18_2:UpdateCardConfig(var_18_3)
				ACTIONS.AnimateSequence(var_18_2, "HideType")
			end
		end
	end

	arg_18_0:ResizeButton()
	arg_18_0:UpdateBattlePassEmblem(arg_18_0._battlePassOwned)
	arg_18_0:addEventHandler("button_over", function(arg_19_0, arg_19_1)
		if arg_19_0._curState ~= var_0_0.complete and arg_19_0._curState ~= var_0_0.owned then
			ACTIONS.AnimateSequence(arg_18_0, "ButtonOver")
		end
	end)
	arg_18_0:addEventHandler("button_up", function(arg_20_0, arg_20_1)
		if arg_20_0._curState ~= var_0_0.complete and arg_20_0._curState ~= var_0_0.owned then
			ACTIONS.AnimateSequence(arg_18_0, "ButtonUp")
		end
	end)

	local function var_18_4(arg_21_0, arg_21_1)
		arg_21_0._useKBMControls = LUI.IsLastInputKeyboardMouse(arg_21_1.controllerIndex)

		if arg_21_0._curState ~= var_0_0.complete and arg_21_0._curState ~= var_0_0.owned then
			ACTIONS.AnimateSequence(arg_21_0, "ButtonUp")
		end

		if not arg_21_0._useKBMControls and arg_21_0._curState ~= var_0_0.owned then
			arg_21_0.Button:SetAlpha(1)
		else
			arg_21_0.Button:SetAlpha(0)
		end

		if LUI.IsLastInputKeyboardMouse(arg_21_1.controllerIndex) then
			ACTIONS.AnimateSequence(arg_21_0, IsLanguageArabic() and "ShiftLayoutForNoButtonPromptAR" or "ShiftLayoutForNoButtonPrompt")
		else
			ACTIONS.AnimateSequence(arg_21_0, IsLanguageArabic() and "ShiftLayoutForButtonPromptAR" or "ShiftLayoutForButtonPrompt")
		end
	end

	local var_18_5 = {
		promptsData = {
			{
				kbmTooltipPromptOverload = "button_alt1",
				button_ref = "button_alt1",
				helper_text = ""
			}
		}
	}

	arg_18_0:AddTooltipData(arg_18_1, var_18_5)
	arg_18_0:addEventHandler("ClearTooltip", var_0_9)
	arg_18_0:registerAndCallEventHandler("update_input_type", var_18_4, {
		controllerIndex = arg_18_1
	})
	var_0_6(arg_18_0)
end

function BattlePassPurchaseButton(arg_22_0, arg_22_1)
	local var_22_0 = LUI.UIButton.new()

	var_22_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 200 * _1080p)

	var_22_0.id = "BattlePassPurchaseButton"
	var_22_0._animationSets = var_22_0._animationSets or {}
	var_22_0._sequences = var_22_0._sequences or {}

	local var_22_1 = arg_22_1 and arg_22_1.controllerIndex

	if not var_22_1 and not Engine.DDJFBBJAIG() then
		var_22_1 = var_22_0:getRootController()
	end

	assert(var_22_1)

	local var_22_2 = var_22_0
	local var_22_3
	local var_22_4 = LUI.UIImage.new()

	var_22_4.id = "Sparks"

	var_22_4:SetAlpha(0.5, 0)
	var_22_4:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_22_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -13, _1080p * 259, _1080p * -20, _1080p * 252)
	var_22_0:addElement(var_22_4)

	var_22_0.Sparks = var_22_4

	local var_22_5
	local var_22_6 = LUI.UIImage.new()

	var_22_6.id = "SeasonImg"

	var_22_6:SetAlpha(0, 0)
	var_22_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -102, _1080p * 286, _1080p * -130, _1080p * 258)
	var_22_0:addElement(var_22_6)

	var_22_0.SeasonImg = var_22_6

	local var_22_7
	local var_22_8 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_22_1
	})

	var_22_8.id = "TierSaleBanner"

	var_22_8:SetAlpha(0, 0)
	var_22_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 80, _1080p * 494, _1080p * 37, _1080p * 62)
	var_22_0:addElement(var_22_8)

	var_22_0.TierSaleBanner = var_22_8

	local var_22_9
	local var_22_10 = LUI.UIImage.new()

	var_22_10.id = "SeasonBacker"

	var_22_10:setImage(RegisterMaterial("ui_battlepass_paintpanel"), 0)
	var_22_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 505, _1080p * 57, _1080p * 143)
	var_22_0:addElement(var_22_10)

	var_22_0.SeasonBacker = var_22_10

	local var_22_11
	local var_22_12 = LUI.UIImage.new()

	var_22_12.id = "SeasonBackerGlint"

	var_22_12:SetAlpha(0, 0)
	var_22_12:setImage(RegisterMaterial("ui_battlepass_paintpanel_glint"), 0)
	var_22_12:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_22_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 500, _1080p * 57, _1080p * 142)
	var_22_0:addElement(var_22_12)

	var_22_0.SeasonBackerGlint = var_22_12

	local var_22_13
	local var_22_14 = LUI.UIImage.new()

	var_22_14.id = "SeasonBackerDecoration"

	var_22_14:SetAlpha(0, 0)
	var_22_14:setImage(RegisterMaterial("ui_battlepass_paintpanel_decoration"), 0)
	var_22_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 126, _1080p * 506, _1080p * 21, _1080p * 170)
	var_22_0:addElement(var_22_14)

	var_22_0.SeasonBackerDecoration = var_22_14

	local var_22_15

	if CONDITIONS.IsBattlePassBundleTopperActive(var_22_1) then
		var_22_15 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
			controllerIndex = var_22_1
		})
		var_22_15.id = "BattlePassBundleTopperTimer"

		var_22_15:SetAlpha(0, 0)
		var_22_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 80, _1080p * 494, _1080p * 34, _1080p * 58)
		var_22_0:addElement(var_22_15)

		var_22_0.BattlePassBundleTopperTimer = var_22_15
	end

	local var_22_16
	local var_22_17 = LUI.UIStyledText.new()

	var_22_17.id = "PurchaseText"

	var_22_17:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_22_17:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/UPGRADE_TO_PREMIUM")), 0)
	var_22_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_22_17:SetWordWrap(false)
	var_22_17:SetAlignment(LUI.Alignment.Left)
	var_22_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_22_17:SetStartupDelay(1000)
	var_22_17:SetLineHoldTime(400)
	var_22_17:SetAnimMoveTime(1500)
	var_22_17:SetAnimMoveSpeed(50)
	var_22_17:SetEndDelay(1000)
	var_22_17:SetCrossfadeTime(400)
	var_22_17:SetFadeInTime(300)
	var_22_17:SetFadeOutTime(300)
	var_22_17:SetMaxVisibleLines(1)
	var_22_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 215, _1080p * 574, _1080p * 74, _1080p * 104)
	var_22_0:addElement(var_22_17)

	var_22_0.PurchaseText = var_22_17

	local var_22_18
	local var_22_19 = LUI.UIStyledText.new()

	var_22_19.id = "ResetText"

	var_22_19:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_22_19:setText(Engine.CBBHFCGDIC("MENU/PASS_RESET"), 0)
	var_22_19:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_22_19:SetWordWrap(false)
	var_22_19:SetAlignment(LUI.Alignment.Left)
	var_22_19:SetTintFontIcons(true)
	var_22_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 215, _1080p * 574, _1080p * 103, _1080p * 125)
	var_22_0:addElement(var_22_19)

	var_22_0.ResetText = var_22_19

	local var_22_20
	local var_22_21 = {
		iconString = "LUA_MENU/PAD_ALT1_BUTTON",
		controllerIndex = var_22_1
	}
	local var_22_22 = MenuBuilder.BuildRegisteredType("IconImage", var_22_21)

	var_22_22.id = "Button"

	var_22_22:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_22_22:setImage(RegisterMaterial("button_alt1"), 0)
	var_22_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 186, _1080p * 211, _1080p * 77, _1080p * 103)
	var_22_0:addElement(var_22_22)

	var_22_0.Button = var_22_22

	local var_22_23
	local var_22_24 = LUI.UIImage.new()

	var_22_24.id = "Mask"

	var_22_24:SetAlpha(0, 0)
	var_22_24:setImage(RegisterMaterial("ui_battlepass_paintpanel_mask"), 0)
	var_22_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 500, _1080p * 57, _1080p * 142)
	var_22_0:addElement(var_22_24)

	var_22_0.Mask = var_22_24

	local var_22_25
	local var_22_26 = LUI.UIImage.new()

	var_22_26.id = "Glint"

	var_22_26:SetRGBFromTable(SWATCHES.CH2.CH2SeasonFreeBanner, 0)
	var_22_26:SetAlpha(0, 0)
	var_22_26:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_22_26:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_22_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 123, _1080p * 59, _1080p * 144)
	var_22_0:addElement(var_22_26)

	var_22_0.Glint = var_22_26

	local var_22_27
	local var_22_28 = LUI.UIImage.new()

	var_22_28.id = "BattlePass"

	var_22_28:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 184, 0, _1080p * 184)
	var_22_0:addElement(var_22_28)

	var_22_0.BattlePass = var_22_28

	local var_22_29
	local var_22_30 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_22_1
	})

	var_22_30.id = "LimitedTime"

	var_22_30:SetAlpha(0, 0)
	var_22_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 314, _1080p * 222, _1080p * 252)
	var_22_0:addElement(var_22_30)

	var_22_0.LimitedTime = var_22_30

	local var_22_31
	local var_22_32 = MenuBuilder.BuildRegisteredType("FanDisplayWidget", {
		controllerIndex = var_22_1
	})

	var_22_32.id = "CodPointCards"

	var_22_32:SetAlpha(0, 0)
	var_22_32:SetScale(-0.4, 0)
	var_22_32:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 460, _1080p * 610, _1080p * -116, _1080p * 84)
	var_22_0:addElement(var_22_32)

	var_22_0.CodPointCards = var_22_32

	local function var_22_33()
		return
	end

	var_22_0._sequences.DefaultSequence = var_22_33

	local var_22_34
	local var_22_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_22_4:RegisterAnimationSequence("Owned", var_22_35)

	local var_22_36 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 104
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 101
		}
	}

	var_22_8:RegisterAnimationSequence("Owned", var_22_36)

	local var_22_37 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_22:RegisterAnimationSequence("Owned", var_22_37)

	local function var_22_38()
		var_22_4:AnimateSequence("Owned")
		var_22_8:AnimateSequence("Owned")
		var_22_22:AnimateSequence("Owned")
	end

	var_22_0._sequences.Owned = var_22_38

	local var_22_39
	local var_22_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_22_4:RegisterAnimationSequence("Tier", var_22_40)

	local var_22_41 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 121
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 119
		}
	}

	var_22_8:RegisterAnimationSequence("Tier", var_22_41)

	local var_22_42 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_17:RegisterAnimationSequence("Tier", var_22_42)

	local var_22_43 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_19:RegisterAnimationSequence("Tier", var_22_43)

	local var_22_44 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_22:RegisterAnimationSequence("Tier", var_22_44)

	local var_22_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_26:RegisterAnimationSequence("Tier", var_22_45)

	local function var_22_46()
		var_22_4:AnimateSequence("Tier")
		var_22_8:AnimateSequence("Tier")
		var_22_17:AnimateSequence("Tier")
		var_22_19:AnimateSequence("Tier")
		var_22_22:AnimateSequence("Tier")
		var_22_26:AnimateSequence("Tier")
	end

	var_22_0._sequences.Tier = var_22_46

	local var_22_47
	local var_22_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_22_4:RegisterAnimationSequence("Purchase", var_22_48)

	local function var_22_49()
		var_22_4:AnimateSequence("Purchase")
	end

	var_22_0._sequences.Purchase = var_22_49

	local var_22_50
	local var_22_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_8:RegisterAnimationSequence("InitialTier", var_22_51)

	local var_22_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_26:RegisterAnimationSequence("InitialTier", var_22_52)

	local function var_22_53()
		var_22_8:AnimateSequence("InitialTier")
		var_22_26:AnimateSequence("InitialTier")
	end

	var_22_0._sequences.InitialTier = var_22_53

	local var_22_54
	local var_22_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_22_4:RegisterAnimationSequence("Complete", var_22_55)

	local var_22_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_battlepass_paintpanel_completed")
		}
	}

	var_22_10:RegisterAnimationSequence("Complete", var_22_56)

	local var_22_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_battlepass_paintpanel_completed_glint")
		}
	}

	var_22_12:RegisterAnimationSequence("Complete", var_22_57)

	local var_22_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_22_17:RegisterAnimationSequence("Complete", var_22_58)

	local var_22_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Season3CompleteColor
		}
	}

	var_22_19:RegisterAnimationSequence("Complete", var_22_59)

	local var_22_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_22:RegisterAnimationSequence("Complete", var_22_60)

	local function var_22_61()
		var_22_4:AnimateSequence("Complete")
		var_22_10:AnimateSequence("Complete")
		var_22_12:AnimateSequence("Complete")
		var_22_17:AnimateSequence("Complete")
		var_22_19:AnimateSequence("Complete")
		var_22_22:AnimateSequence("Complete")
	end

	var_22_0._sequences.Complete = var_22_61

	local var_22_62
	local var_22_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_22_4:RegisterAnimationSequence("TierKBM", var_22_63)

	local var_22_64 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 119
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 57
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 121
		}
	}

	var_22_8:RegisterAnimationSequence("TierKBM", var_22_64)

	local var_22_65 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_17:RegisterAnimationSequence("TierKBM", var_22_65)

	local var_22_66 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_19:RegisterAnimationSequence("TierKBM", var_22_66)

	local var_22_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_22:RegisterAnimationSequence("TierKBM", var_22_67)

	local var_22_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_26:RegisterAnimationSequence("TierKBM", var_22_68)

	local function var_22_69()
		var_22_4:AnimateSequence("TierKBM")
		var_22_8:AnimateSequence("TierKBM")
		var_22_17:AnimateSequence("TierKBM")
		var_22_19:AnimateSequence("TierKBM")
		var_22_22:AnimateSequence("TierKBM")
		var_22_26:AnimateSequence("TierKBM")
	end

	var_22_0._sequences.TierKBM = var_22_69

	local var_22_70
	local var_22_71 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_19:RegisterAnimationSequence("ResetOwned", var_22_71)

	local function var_22_72()
		var_22_19:AnimateSequence("ResetOwned")
	end

	var_22_0._sequences.ResetOwned = var_22_72

	local var_22_73
	local var_22_74 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_19:RegisterAnimationSequence("ResetTier", var_22_74)

	local function var_22_75()
		var_22_19:AnimateSequence("ResetTier")
	end

	var_22_0._sequences.ResetTier = var_22_75

	local var_22_76
	local var_22_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_sparks")
		}
	}

	var_22_4:RegisterAnimationSequence("S5", var_22_77)

	local function var_22_78()
		var_22_4:AnimateSequence("S5")
	end

	var_22_0._sequences.S5 = var_22_78

	local var_22_79
	local var_22_80 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 57
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonUp", var_22_80)

	local var_22_81 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_22_10:RegisterAnimationSequence("ButtonUp", var_22_81)

	local var_22_82 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_22_12:RegisterAnimationSequence("ButtonUp", var_22_82)

	local var_22_83 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_22_14:RegisterAnimationSequence("ButtonUp", var_22_83)

	local var_22_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		}
	}

	var_22_24:RegisterAnimationSequence("ButtonUp", var_22_84)

	local var_22_85 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_22_28:RegisterAnimationSequence("ButtonUp", var_22_85)

	local var_22_86 = {
		{
			value = -0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_22_32:RegisterAnimationSequence("ButtonUp", var_22_86)

	local function var_22_87()
		var_22_8:AnimateSequence("ButtonUp")
		var_22_10:AnimateSequence("ButtonUp")
		var_22_12:AnimateSequence("ButtonUp")
		var_22_14:AnimateSequence("ButtonUp")
		var_22_24:AnimateSequence("ButtonUp")
		var_22_28:AnimateSequence("ButtonUp")
		var_22_32:AnimateSequence("ButtonUp")
	end

	var_22_0._sequences.ButtonUp = var_22_87

	local var_22_88
	local var_22_89 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 27
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 52
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonOver", var_22_89)

	local var_22_90 = {
		{
			value = 0.05,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_22_10:RegisterAnimationSequence("ButtonOver", var_22_90)

	local var_22_91 = {
		{
			value = 0.05,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_22_12:RegisterAnimationSequence("ButtonOver", var_22_91)

	local var_22_92 = {
		{
			value = 0.05,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_22_14:RegisterAnimationSequence("ButtonOver", var_22_92)

	local var_22_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 51
		}
	}

	var_22_24:RegisterAnimationSequence("ButtonOver", var_22_93)

	local var_22_94 = {
		{
			value = 0.05,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_22_28:RegisterAnimationSequence("ButtonOver", var_22_94)

	local var_22_95 = {
		{
			value = -0.35,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_22_32:RegisterAnimationSequence("ButtonOver", var_22_95)

	local function var_22_96()
		var_22_8:AnimateSequence("ButtonOver")
		var_22_10:AnimateSequence("ButtonOver")
		var_22_12:AnimateSequence("ButtonOver")
		var_22_14:AnimateSequence("ButtonOver")
		var_22_24:AnimateSequence("ButtonOver")
		var_22_28:AnimateSequence("ButtonOver")
		var_22_32:AnimateSequence("ButtonOver")
	end

	var_22_0._sequences.ButtonOver = var_22_96

	local var_22_97
	local var_22_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 494
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_22_17:RegisterAnimationSequence("ShiftLayoutForButtonPrompt", var_22_98)

	local var_22_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 490
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_22_19:RegisterAnimationSequence("ShiftLayoutForButtonPrompt", var_22_99)

	local var_22_100 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 186
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 211
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_22_22:RegisterAnimationSequence("ShiftLayoutForButtonPrompt", var_22_100)

	local function var_22_101()
		var_22_17:AnimateSequence("ShiftLayoutForButtonPrompt")
		var_22_19:AnimateSequence("ShiftLayoutForButtonPrompt")
		var_22_22:AnimateSequence("ShiftLayoutForButtonPrompt")
	end

	var_22_0._sequences.ShiftLayoutForButtonPrompt = var_22_101

	local var_22_102
	local var_22_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 187
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 494
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_22_17:RegisterAnimationSequence("ShiftLayoutForNoButtonPrompt", var_22_103)

	local var_22_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 187
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 462
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_22_19:RegisterAnimationSequence("ShiftLayoutForNoButtonPrompt", var_22_104)

	local var_22_105 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_22:RegisterAnimationSequence("ShiftLayoutForNoButtonPrompt", var_22_105)

	local function var_22_106()
		var_22_17:AnimateSequence("ShiftLayoutForNoButtonPrompt")
		var_22_19:AnimateSequence("ShiftLayoutForNoButtonPrompt")
		var_22_22:AnimateSequence("ShiftLayoutForNoButtonPrompt")
	end

	var_22_0._sequences.ShiftLayoutForNoButtonPrompt = var_22_106

	local var_22_107
	local var_22_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 355,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 764,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1064,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_12:RegisterAnimationSequence("GlowPulse", var_22_108)

	local function var_22_109()
		var_22_12:AnimateLoop("GlowPulse")
	end

	var_22_0._sequences.GlowPulse = var_22_109

	local var_22_110
	local var_22_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 369
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 61
		}
	}

	var_22_17:RegisterAnimationSequence("ShiftLayoutForButtonPromptAR", var_22_111)

	local var_22_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 220
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 495
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 92
		}
	}

	var_22_19:RegisterAnimationSequence("ShiftLayoutForButtonPromptAR", var_22_112)

	local var_22_113 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 96
		}
	}

	var_22_22:RegisterAnimationSequence("ShiftLayoutForButtonPromptAR", var_22_113)

	local function var_22_114()
		var_22_17:AnimateSequence("ShiftLayoutForButtonPromptAR")
		var_22_19:AnimateSequence("ShiftLayoutForButtonPromptAR")
		var_22_22:AnimateSequence("ShiftLayoutForButtonPromptAR")
	end

	var_22_0._sequences.ShiftLayoutForButtonPromptAR = var_22_114

	local var_22_115
	local var_22_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 369
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 61
		}
	}

	var_22_17:RegisterAnimationSequence("ShiftLayoutForNoButtonPromptAR", var_22_116)

	local var_22_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 220
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 495
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 92
		}
	}

	var_22_19:RegisterAnimationSequence("ShiftLayoutForNoButtonPromptAR", var_22_117)

	local var_22_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 97
		}
	}

	var_22_22:RegisterAnimationSequence("ShiftLayoutForNoButtonPromptAR", var_22_118)

	local function var_22_119()
		var_22_17:AnimateSequence("ShiftLayoutForNoButtonPromptAR")
		var_22_19:AnimateSequence("ShiftLayoutForNoButtonPromptAR")
		var_22_22:AnimateSequence("ShiftLayoutForNoButtonPromptAR")
	end

	var_22_0._sequences.ShiftLayoutForNoButtonPromptAR = var_22_119

	local function var_22_120()
		return
	end

	var_22_0._sequences.BattlePassBundleVisible = var_22_120

	local var_22_121

	if CONDITIONS.IsBattlePassBundleTopperActive(var_22_1) then
		local var_22_122 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_22_15:RegisterAnimationSequence("BattlePassBundleHidden", var_22_122)
	end

	local function var_22_123()
		if CONDITIONS.IsBattlePassBundleTopperActive(var_22_1) then
			var_22_15:AnimateSequence("BattlePassBundleHidden")
		end
	end

	var_22_0._sequences.BattlePassBundleHidden = var_22_123

	var_0_12(var_22_0, var_22_1, arg_22_1)

	return var_22_0
end

MenuBuilder.registerType("BattlePassPurchaseButton", BattlePassPurchaseButton)
LockTable(_M)
