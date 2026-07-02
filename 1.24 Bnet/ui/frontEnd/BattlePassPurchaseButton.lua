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
		ACTIONS.AnimateSequence(arg_2_0, "GlowPulse")
		ACTIONS.AnimateSequence(arg_2_0, "Shine")
		ACTIONS.AnimateSequence(arg_2_0, "Purchase")
		arg_2_0.PurchaseText:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/UPGRADE_TO_PREMIUM")))
		arg_2_0:ResizeButton(false)
	elseif arg_2_0._curState == var_0_0.purchaseTier then
		if arg_2_1 then
			ACTIONS.AnimateSequence(arg_2_0, "InitialTier")
			ACTIONS.AnimateSequence(arg_2_0, "GlowPulse")
			arg_2_0:ResizeButton(false)
		else
			var_2_0()

			arg_2_0:Wait(100).onComplete = function()
				arg_2_0:ResizeButton(false, 80)
				ACTIONS.AnimateSequence(arg_2_0, "GlowPulse")
			end
		end
	elseif arg_2_0._curState == var_0_0.owned then
		ACTIONS.AnimateSequence(arg_2_0, "Owned")

		if arg_2_0._displaySeasonTimer then
			ACTIONS.AnimateSequence(arg_2_0, "ResetOwned")

			arg_2_0:Wait(120).onComplete = function()
				arg_2_0:ResizeButton(true, 80, LUI.EASING.inCubic)
			end
		end
	elseif arg_2_0._curState == var_0_0.complete then
		ACTIONS.AnimateSequence(arg_2_0, "Complete")
		ACTIONS.AnimateSequence(arg_2_0, "GlowPulse")
		arg_2_0:ResizeButton(false, 80, LUI.EASING.inCubic)
	elseif arg_2_0._curState == var_0_0.pending then
		var_2_0()

		arg_2_0:Wait(100).onComplete = function()
			arg_2_0:ResizeButton(false, 80)
			ACTIONS.AnimateSequence(arg_2_0, "GlowPulse")
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
	elseif CONDITIONS.IsLateGrindersEnabled() and arg_2_0._currentCPRewards.totalCP >= BATTLEPASS.START_TO_SHOW_COD_POINTS then
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
		var_7_0 = Engine.CBBHFCGDIC("LUA_MENU/X_COLON_Y", var_7_0, var_7_1)
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

local function var_0_6(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	if arg_9_0._battlePassOwned ~= arg_9_1 then
		arg_9_0:UpdateBattlePassEmblem(arg_9_1)
	end

	arg_9_0._battlePassOwned = arg_9_1
	arg_9_0._showTooltip = true

	local var_9_0

	if arg_9_4 then
		var_9_0 = var_0_0.pending
	elseif arg_9_1 then
		if arg_9_2 then
			if arg_9_3 == BATTLEPASS.GetMaxTier() then
				var_9_0 = var_0_0.complete
			else
				var_9_0 = var_0_0.owned
			end

			arg_9_0._showTooltip = false
		else
			var_9_0 = var_0_0.purchaseTier
		end
	else
		var_9_0 = var_0_0.purchasePass
	end

	arg_9_0:UpdateTooltip()

	local function var_9_1(arg_10_0)
		ACTIONS.AnimateSequence(arg_9_0.TierSaleBanner, "ButtonSizeSetup")

		local var_10_0 = 86400
		local var_10_1 = Engine.DEIDGHDBHD()
		local var_10_2 = tonumber(arg_10_0) - var_10_1

		if var_10_0 < var_10_2 then
			ACTIONS.AnimateSequence(arg_9_0.TierSaleBanner, "TierSaleVariant")
		elseif var_10_2 > 0 then
			ACTIONS.AnimateSequence(arg_9_0.TierSaleBanner, "TierSaleVariantEndSoon")
		else
			arg_9_0.TierSaleBanner:SetAlpha(0)
			arg_9_0._timer:closeTree()

			arg_9_0._saleTimer = false
			arg_9_0._promoTimer = false
		end
	end

	if arg_9_0._battlePassOwned and CONDITIONS.IsTierSaleEnabled() then
		if not arg_9_0._saleTimer then
			local var_9_2 = Dvar.DHEEJCCJBH("MQTOPKPMRS")

			var_0_5(arg_9_0, var_9_2, function(arg_11_0, arg_11_1)
				var_9_1(var_9_2)
				var_0_4(arg_11_0, var_9_2, "LUA_MENU/SALE_CAPS")
			end)

			arg_9_0._saleTimer = true
		end
	elseif not arg_9_0._battlePassOwned then
		if BATTLEPASS.IsTierSkipGiftActive(arg_9_0._controllerIndex) and not arg_9_0._promoTimer then
			local var_9_3 = BATTLEPASS.GetTierSkipGiftTimer()

			var_0_5(arg_9_0, var_9_3, function(arg_12_0, arg_12_1)
				var_9_1(var_9_3)
				var_0_4(arg_12_0, var_9_3, "MENU/PROMO")
			end)

			arg_9_0._promoTimer = true
		elseif CONDITIONS.IsLateGrindersEnabled() and arg_9_0._currentCPRewards.totalCP >= BATTLEPASS.START_TO_SHOW_COD_POINTS then
			arg_9_0.TierSaleBanner:SetAlpha(1)
			ACTIONS.AnimateSequence(arg_9_0.TierSaleBanner, "TierSaleVariant")
			arg_9_0.TierSaleBanner:SetText(Engine.CBBHFCGDIC("BATTLEPASS/UNLOCK_COD_POINTS", arg_9_0._currentCPRewards.totalCP))
			arg_9_0.CodPointCards:SetAlpha(1)
		end
	else
		arg_9_0.TierSaleBanner:SetAlpha(0)

		if arg_9_0.CodPointCards then
			arg_9_0.CodPointCards:SetAlpha(0)
		end
	end

	if var_9_0 ~= arg_9_0._curState then
		local var_9_4 = arg_9_0._curState == nil

		arg_9_0._curState = var_9_0

		arg_9_0:AnimateCurrentState(var_9_4)
	elseif var_9_0 ~= var_0_0.owned then
		arg_9_0:ResizeButton(false, 100)
	end
end

local function var_0_7(arg_13_0, arg_13_1)
	local var_13_0 = LAYOUT.GetTextWidth(arg_13_0.PurchaseText)
	local var_13_1 = LAYOUT.GetTextWidth(arg_13_0.ResetText)
	local var_13_2

	if arg_13_1 and not arg_13_0._battlePassOwned then
		var_13_2 = var_13_1 * 1.25
	else
		var_13_2 = var_13_1 < var_13_0 and var_13_0 or var_13_1
	end

	if arg_13_0._saleTimer then
		if arg_13_0._curState == var_0_0.owned or arg_13_0._curState == var_0_0.complete then
			arg_13_0.TierSaleBanner:SetAlpha(0)
		else
			arg_13_0.TierSaleBanner:SetAlpha(1)

			if var_13_2 < var_0_1 then
				var_13_2 = var_0_1
			end
		end
	elseif arg_13_0._promoTimer then
		if arg_13_0._curState == var_0_0.purchasePass then
			arg_13_0.TierSaleBanner:SetAlpha(1)

			if var_13_2 < var_0_1 then
				var_13_2 = var_0_1
			end
		else
			arg_13_0.TierSaleBanner:SetAlpha(0)
		end
	end

	local var_13_3 = var_13_2 + arg_13_0.PurchaseText:GetCurrentAnchorsAndPositions().left
	local var_13_4 = 25 * _1080p
	local var_13_5 = duration ~= nil and duration or 0
	local var_13_6 = easing ~= nil and easing or LUI.EASING.Linear

	for iter_13_0 = 1, #arg_13_0._resizableElements do
		local var_13_7 = arg_13_0._resizableElements[iter_13_0]

		if not arg_13_1 or not var_13_7.isSaleBanner then
			var_13_7.widget:SetRight(var_13_3 + var_13_4, var_13_5, var_13_6)
		end
	end
end

local function var_0_8(arg_14_0)
	arg_14_0:RemoveToolTipData()
end

local function var_0_9(arg_15_0)
	if arg_15_0._useKBMControls then
		arg_15_0:SetFocusable(arg_15_0._showTooltip)
		arg_15_0:SetHandleMouse(arg_15_0._showTooltip)
	else
		arg_15_0:SetFocusable(false)
		arg_15_0:SetHandleMouse(false)
	end
end

local function var_0_10(arg_16_0, arg_16_1)
	local var_16_0

	if arg_16_1 then
		var_16_0 = BATTLEPASS.GetEmblemGold()
	else
		var_16_0 = BATTLEPASS.GetEmblemSilver()
	end

	if var_16_0 and #var_16_0 > 0 then
		arg_16_0.SeasonImg:setImage(RegisterMaterial(var_16_0))
		arg_16_0.BattlePass:setImage(RegisterMaterial(var_16_0))
	end
end

local function var_0_11(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0.ResizeButton = var_0_7
	arg_17_0.UpdateButtonState = var_0_6
	arg_17_0.AnimateCurrentState = var_0_3
	arg_17_0.UpdateTooltip = var_0_9
	arg_17_0.UpdateBattlePassEmblem = var_0_10
	arg_17_0._controllerIndex = arg_17_1
	arg_17_0._curState = nil
	arg_17_0._battlePassOwned = BATTLEPASS.IsOwned(arg_17_1)
	arg_17_0._showTooltip = arg_17_0._curState == var_0_0.complete or arg_17_0._curState == var_0_0.owned
	arg_17_0._useKBMControls = LUI.IsLastInputKeyboardMouse(arg_17_1)
	arg_17_0._displaySeasonTimer = Dvar.IBEGCHEFE("NPOLQSQMNO")

	arg_17_0.Mask:SetAlpha(1)
	arg_17_0.Glint:SetMask(arg_17_0.Mask)
	var_0_2(arg_17_0)

	arg_17_0._resizableElements = {
		{
			widget = arg_17_0.Backer
		},
		{
			widget = arg_17_0.TextureLayer
		},
		{
			widget = arg_17_0.Highlight
		},
		{
			widget = arg_17_0.ButtonGlow
		},
		{
			widget = arg_17_0.Line
		},
		{
			widget = arg_17_0.Mask
		},
		{
			isSaleBanner = true,
			widget = arg_17_0.TierSaleBanner
		}
	}
	arg_17_0._currentSeason = SEASON.GetCurrentSeason()

	if arg_17_0._currentSeason and arg_17_0._currentSeason == 5 then
		ACTIONS.AnimateSequence(arg_17_0, "S5")
	end

	if arg_17_0._displaySeasonTimer then
		Challenge.SetupSeasonEndsTimer(arg_17_0, arg_17_0.ResetText, "MENU/PASS_RESET")
	else
		arg_17_0.ResetText:SetAlpha(0)
	end

	if CONDITIONS.IsLateGrindersEnabled() then
		arg_17_0._currentCPRewards = BATTLEPASS.GetCurrentCPRewards(arg_17_0._controllerIndex)

		if arg_17_0._currentCPRewards.totalCP >= BATTLEPASS.START_TO_SHOW_COD_POINTS then
			arg_17_0.CodPointCards:SetAlpha(1)

			local var_17_0 = {
				minVerticalOffset = -10,
				height = 200,
				maxVerticalOffset = 20,
				maxHorizontalOffset = 120,
				widget = "LootItemCardMini",
				finalRotation = -30,
				startRotation = 0,
				width = 150,
				numWidgets = #arg_17_0._currentCPRewards.codTiers
			}

			arg_17_0.CodPointCards:BuildWidgets(arg_17_1, var_17_0)

			local var_17_1 = BATTLEPASS.GetAllRewards()

			for iter_17_0, iter_17_1 in ipairs(arg_17_0._currentCPRewards.codTiers) do
				local var_17_2 = arg_17_0.CodPointCards.widgets[iter_17_0]
				local var_17_3 = var_17_1[iter_17_1 + BATTLEPASS.NumBonusItems]

				var_17_2:UpdateCardConfig(var_17_3)
				ACTIONS.AnimateSequence(var_17_2, "HideType")
			end
		end
	end

	arg_17_0:ResizeButton()
	arg_17_0:UpdateBattlePassEmblem(arg_17_0._battlePassOwned)
	arg_17_0:addEventHandler("button_over", function(arg_18_0, arg_18_1)
		if arg_18_0._curState ~= var_0_0.complete and arg_18_0._curState ~= var_0_0.owned then
			ACTIONS.AnimateSequence(arg_17_0, "ButtonOver")
		end
	end)
	arg_17_0:addEventHandler("button_up", function(arg_19_0, arg_19_1)
		if arg_19_0._curState ~= var_0_0.complete and arg_19_0._curState ~= var_0_0.owned then
			ACTIONS.AnimateSequence(arg_17_0, "ButtonUp")
		end
	end)

	local function var_17_4(arg_20_0, arg_20_1)
		arg_20_0._useKBMControls = LUI.IsLastInputKeyboardMouse(arg_20_1.controllerIndex)

		if arg_20_0._curState ~= var_0_0.complete and arg_20_0._curState ~= var_0_0.owned then
			ACTIONS.AnimateSequence(arg_20_0, "ButtonUp")
		end

		if not arg_20_0._useKBMControls and arg_20_0._curState ~= var_0_0.owned then
			arg_20_0.Button:SetAlpha(1)
		else
			arg_20_0.Button:SetAlpha(0)
		end
	end

	local var_17_5 = {
		promptsData = {
			{
				kbmTooltipPromptOverload = "button_primary",
				button_ref = "button_primary",
				helper_text = ""
			}
		}
	}

	arg_17_0:AddTooltipData(arg_17_1, var_17_5)
	arg_17_0:addEventHandler("ClearTooltip", var_0_8)
	arg_17_0:registerAndCallEventHandler("update_input_type", var_17_4, {
		controllerIndex = arg_17_1
	})
end

function BattlePassPurchaseButton(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIButton.new()

	var_21_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 200 * _1080p)

	var_21_0.id = "BattlePassPurchaseButton"
	var_21_0._animationSets = var_21_0._animationSets or {}
	var_21_0._sequences = var_21_0._sequences or {}

	local var_21_1 = arg_21_1 and arg_21_1.controllerIndex

	if not var_21_1 and not Engine.DDJFBBJAIG() then
		var_21_1 = var_21_0:getRootController()
	end

	assert(var_21_1)

	local var_21_2 = var_21_0
	local var_21_3
	local var_21_4 = LUI.UIImage.new()

	var_21_4.id = "Sparks"

	var_21_4:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_21_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -73, _1080p * 181, 0, _1080p * 252)
	var_21_0:addElement(var_21_4)

	var_21_0.Sparks = var_21_4

	local var_21_5
	local var_21_6 = LUI.UIImage.new()

	var_21_6.id = "SeasonImg"

	var_21_6:SetAlpha(0.05, 0)
	var_21_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -102, _1080p * 286, _1080p * -130, _1080p * 258)
	var_21_0:addElement(var_21_6)

	var_21_0.SeasonImg = var_21_6

	local var_21_7
	local var_21_8 = LUI.UIImage.new()

	var_21_8.id = "Backer"

	var_21_8:SetRGBFromTable(SWATCHES.AAR.EnemyDarkRed, 0)
	var_21_8:SetAlpha(0.9, 0)
	var_21_8:setImage(RegisterMaterial("ui_default_white"), 0)
	var_21_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 500, _1080p * 57, _1080p * 142)
	var_21_0:addElement(var_21_8)

	var_21_0.Backer = var_21_8

	local var_21_9
	local var_21_10 = LUI.UIImage.new()

	var_21_10.id = "TextureLayer"

	var_21_10:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_21_10:SetAlpha(0.1, 0)
	var_21_10:SetPixelGridEnabled(true)
	var_21_10:SetPixelGridContrast(0.8, 0)
	var_21_10:SetPixelGridBlockWidth(2, 0)
	var_21_10:SetPixelGridBlockHeight(2, 0)
	var_21_10:SetPixelGridGutterWidth(1, 0)
	var_21_10:SetPixelGridGutterHeight(1, 0)
	var_21_10:setImage(RegisterMaterial("ui_default_white"), 0)
	var_21_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 500, _1080p * 57, _1080p * 142)
	var_21_0:addElement(var_21_10)

	var_21_0.TextureLayer = var_21_10

	local var_21_11
	local var_21_12 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_21_13 = LUI.UIBorder.new(var_21_12)

	var_21_13.id = "Line"

	var_21_13:SetRGBFromTable(SWATCHES.genericMenu.notificationHighlight, 0)
	var_21_13:SetBorderThicknessLeft(_1080p * 0, 0)
	var_21_13:SetBorderThicknessRight(_1080p * 0, 0)
	var_21_13:SetBorderThicknessTop(_1080p * 0, 0)
	var_21_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 500, _1080p * 119, _1080p * 142)
	var_21_0:addElement(var_21_13)

	var_21_0.Line = var_21_13

	local var_21_14
	local var_21_15 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_21_1
	})

	var_21_15.id = "ButtonGlow"

	var_21_15:SetAlpha(0.5, 0)
	var_21_15.Glow:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_21_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 500, _1080p * 134, _1080p * 150)
	var_21_0:addElement(var_21_15)

	var_21_0.ButtonGlow = var_21_15

	local var_21_16
	local var_21_17 = LUI.UIImage.new()

	var_21_17.id = "Highlight"

	var_21_17:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_21_17:SetAlpha(0.5, 0)
	var_21_17:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_21_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 128, _1080p * 500, _1080p * 122, _1080p * 142)
	var_21_0:addElement(var_21_17)

	var_21_0.Highlight = var_21_17

	local var_21_18
	local var_21_19 = LUI.UIStyledText.new()

	var_21_19.id = "PurchaseText"

	var_21_19:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_21_19:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/UPGRADE_TO_PREMIUM")), 0)
	var_21_19:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_21_19:SetWordWrap(false)
	var_21_19:SetAlignment(LUI.Alignment.Left)
	var_21_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 215, _1080p * 490, _1080p * 69, _1080p * 99)
	var_21_0:addElement(var_21_19)

	var_21_0.PurchaseText = var_21_19

	local var_21_20
	local var_21_21 = LUI.UIStyledText.new()

	var_21_21.id = "ResetText"

	var_21_21:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_21_21:setText(Engine.CBBHFCGDIC("MENU/PASS_RESET"), 0)
	var_21_21:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_21_21:SetWordWrap(false)
	var_21_21:SetAlignment(LUI.Alignment.Left)
	var_21_21:SetTintFontIcons(true)
	var_21_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 215, _1080p * 490, _1080p * 101, _1080p * 123)
	var_21_0:addElement(var_21_21)

	var_21_0.ResetText = var_21_21

	local var_21_22
	local var_21_23 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_21_1
	})

	var_21_23.id = "TierSaleBanner"

	var_21_23:SetAlpha(0, 0)
	var_21_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 119, _1080p * 500, _1080p * 32, _1080p * 57)
	var_21_0:addElement(var_21_23)

	var_21_0.TierSaleBanner = var_21_23

	local var_21_24
	local var_21_25 = {
		iconString = "LUA_MENU/PAD_ALT1_BUTTON",
		controllerIndex = var_21_1
	}
	local var_21_26 = MenuBuilder.BuildRegisteredType("IconImage", var_21_25)

	var_21_26.id = "Button"

	var_21_26:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_21_26:setImage(RegisterMaterial("button_alt1"), 0)
	var_21_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 186, _1080p * 211, _1080p * 71, _1080p * 97)
	var_21_0:addElement(var_21_26)

	var_21_0.Button = var_21_26

	local var_21_27
	local var_21_28 = LUI.UIImage.new()

	var_21_28.id = "Glint"

	var_21_28:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_21_28:SetAlpha(0, 0)
	var_21_28:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_21_28:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_21_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 92, _1080p * 128, _1080p * 57, _1080p * 142)
	var_21_0:addElement(var_21_28)

	var_21_0.Glint = var_21_28

	local var_21_29
	local var_21_30 = LUI.UIImage.new()

	var_21_30.id = "Mask"

	var_21_30:SetAlpha(0, 0)
	var_21_30:setImage(RegisterMaterial("stencil_mask"), 0)
	var_21_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 92, _1080p * 500, _1080p * 57, _1080p * 143)
	var_21_0:addElement(var_21_30)

	var_21_0.Mask = var_21_30

	local var_21_31
	local var_21_32 = LUI.UIImage.new()

	var_21_32.id = "BattlePass"

	var_21_32:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 184, 0, _1080p * 184)
	var_21_0:addElement(var_21_32)

	var_21_0.BattlePass = var_21_32

	local var_21_33
	local var_21_34 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_21_1
	})

	var_21_34.id = "LimitedTime"

	var_21_34:SetAlpha(0, 0)
	var_21_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 314, _1080p * 222, _1080p * 252)
	var_21_0:addElement(var_21_34)

	var_21_0.LimitedTime = var_21_34

	local var_21_35
	local var_21_36 = MenuBuilder.BuildRegisteredType("FanDisplayWidget", {
		controllerIndex = var_21_1
	})

	var_21_36.id = "CodPointCards"

	var_21_36:SetAlpha(0, 0)
	var_21_36:SetScale(-0.4, 0)
	var_21_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 160, _1080p * 310, _1080p * -116, _1080p * 84)
	var_21_0:addElement(var_21_36)

	var_21_0.CodPointCards = var_21_36

	local function var_21_37()
		return
	end

	var_21_0._sequences.DefaultSequence = var_21_37

	local var_21_38
	local var_21_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1417,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 66,
			easing = LUI.EASING.outCubic
		},
		{
			value = 0.5,
			duration = 1667,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1417,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			value = 0.2,
			duration = 1167,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_17:RegisterAnimationSequence("GlowPulse", var_21_39)

	local function var_21_40()
		var_21_17:AnimateLoop("GlowPulse")
	end

	var_21_0._sequences.GlowPulse = var_21_40

	local var_21_41
	local var_21_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_21_4:RegisterAnimationSequence("Owned", var_21_42)

	local var_21_43 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 95,
			easing = LUI.EASING.snap
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 128,
			easing = LUI.EASING.snap
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased,
			easing = LUI.EASING.snap
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_left_to_right"),
			easing = LUI.EASING.snap
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 95,
			easing = LUI.EASING.snap
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 128,
			easing = LUI.EASING.snap
		},
		{
			value = 0.3,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_8:RegisterAnimationSequence("Owned", var_21_43)

	local var_21_44 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 104
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 135
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("Owned", var_21_44)

	local var_21_45 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("Owned", var_21_45)

	local var_21_46 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("Owned", var_21_46)

	local var_21_47 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_17:RegisterAnimationSequence("Owned", var_21_47)

	local var_21_48 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_19:RegisterAnimationSequence("Owned", var_21_48)

	local var_21_49 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 123,
			easing = LUI.EASING.snap
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101,
			easing = LUI.EASING.snap
		}
	}

	var_21_21:RegisterAnimationSequence("Owned", var_21_49)

	local var_21_50 = {
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

	var_21_23:RegisterAnimationSequence("Owned", var_21_50)

	local var_21_51 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_26:RegisterAnimationSequence("Owned", var_21_51)

	local function var_21_52()
		var_21_4:AnimateSequence("Owned")
		var_21_8:AnimateSequence("Owned")
		var_21_10:AnimateSequence("Owned")
		var_21_13:AnimateSequence("Owned")
		var_21_15:AnimateSequence("Owned")
		var_21_17:AnimateSequence("Owned")
		var_21_19:AnimateSequence("Owned")
		var_21_21:AnimateSequence("Owned")
		var_21_23:AnimateSequence("Owned")
		var_21_26:AnimateSequence("Owned")
	end

	var_21_0._sequences.Owned = var_21_52

	local var_21_53
	local var_21_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_21_4:RegisterAnimationSequence("Tier", var_21_54)

	local var_21_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142,
			easing = LUI.EASING.snap
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.EnemyDarkRed,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57,
			easing = LUI.EASING.snap
		},
		{
			value = 0.9,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_8:RegisterAnimationSequence("Tier", var_21_55)

	local var_21_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142,
			easing = LUI.EASING.snap
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("Tier", var_21_56)

	local var_21_57 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("Tier", var_21_57)

	local var_21_58 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("Tier", var_21_58)

	local var_21_59 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_17:RegisterAnimationSequence("Tier", var_21_59)

	local var_21_60 = {
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

	var_21_19:RegisterAnimationSequence("Tier", var_21_60)

	local var_21_61 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 123
		}
	}

	var_21_21:RegisterAnimationSequence("Tier", var_21_61)

	local var_21_62 = {
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

	var_21_23:RegisterAnimationSequence("Tier", var_21_62)

	local var_21_63 = {
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

	var_21_26:RegisterAnimationSequence("Tier", var_21_63)

	local var_21_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_28:RegisterAnimationSequence("Tier", var_21_64)

	local function var_21_65()
		var_21_4:AnimateSequence("Tier")
		var_21_8:AnimateSequence("Tier")
		var_21_10:AnimateSequence("Tier")
		var_21_13:AnimateSequence("Tier")
		var_21_15:AnimateSequence("Tier")
		var_21_17:AnimateSequence("Tier")
		var_21_19:AnimateSequence("Tier")
		var_21_21:AnimateSequence("Tier")
		var_21_23:AnimateSequence("Tier")
		var_21_26:AnimateSequence("Tier")
		var_21_28:AnimateSequence("Tier")
	end

	var_21_0._sequences.Tier = var_21_65

	local var_21_66
	local var_21_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_21_4:RegisterAnimationSequence("Purchase", var_21_67)

	local var_21_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.EnemyDarkRed
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_21_8:RegisterAnimationSequence("Purchase", var_21_68)

	local var_21_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("Purchase", var_21_69)

	local var_21_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("Purchase", var_21_70)

	local var_21_71 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("Purchase", var_21_71)

	local var_21_72 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_17:RegisterAnimationSequence("Purchase", var_21_72)

	local var_21_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_19:RegisterAnimationSequence("Purchase", var_21_73)

	local var_21_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 123
		}
	}

	var_21_21:RegisterAnimationSequence("Purchase", var_21_74)

	local function var_21_75()
		var_21_4:AnimateSequence("Purchase")
		var_21_8:AnimateSequence("Purchase")
		var_21_10:AnimateSequence("Purchase")
		var_21_13:AnimateSequence("Purchase")
		var_21_15:AnimateSequence("Purchase")
		var_21_17:AnimateSequence("Purchase")
		var_21_19:AnimateSequence("Purchase")
		var_21_21:AnimateSequence("Purchase")
	end

	var_21_0._sequences.Purchase = var_21_75

	local var_21_76
	local var_21_77 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 92
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			value = 0,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 908,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 500,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 4200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_28:RegisterAnimationSequence("Shine", var_21_77)

	local function var_21_78()
		var_21_28:AnimateLoop("Shine")
	end

	var_21_0._sequences.Shine = var_21_78

	local var_21_79
	local var_21_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_21_4:RegisterAnimationSequence("InitialTier", var_21_80)

	local var_21_81 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_8:RegisterAnimationSequence("InitialTier", var_21_81)

	local var_21_82 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("InitialTier", var_21_82)

	local var_21_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("InitialTier", var_21_83)

	local var_21_84 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("InitialTier", var_21_84)

	local var_21_85 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_17:RegisterAnimationSequence("InitialTier", var_21_85)

	local var_21_86 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_19:RegisterAnimationSequence("InitialTier", var_21_86)

	local var_21_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 123
		}
	}

	var_21_21:RegisterAnimationSequence("InitialTier", var_21_87)

	local var_21_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_23:RegisterAnimationSequence("InitialTier", var_21_88)

	local var_21_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_28:RegisterAnimationSequence("InitialTier", var_21_89)

	local function var_21_90()
		var_21_4:AnimateSequence("InitialTier")
		var_21_8:AnimateSequence("InitialTier")
		var_21_10:AnimateSequence("InitialTier")
		var_21_13:AnimateSequence("InitialTier")
		var_21_15:AnimateSequence("InitialTier")
		var_21_17:AnimateSequence("InitialTier")
		var_21_19:AnimateSequence("InitialTier")
		var_21_21:AnimateSequence("InitialTier")
		var_21_23:AnimateSequence("InitialTier")
		var_21_28:AnimateSequence("InitialTier")
	end

	var_21_0._sequences.InitialTier = var_21_90

	local var_21_91
	local var_21_92 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 52
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 147
		}
	}

	var_21_8:RegisterAnimationSequence("ButtonOver", var_21_92)

	local var_21_93 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 52
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 147
		},
		{
			value = 0.15,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("ButtonOver", var_21_93)

	local var_21_94 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 124
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 147
		}
	}

	var_21_13:RegisterAnimationSequence("ButtonOver", var_21_94)

	local var_21_95 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 136
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 158
		}
	}

	var_21_15:RegisterAnimationSequence("ButtonOver", var_21_95)

	local var_21_96 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 147
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 89
		}
	}

	var_21_17:RegisterAnimationSequence("ButtonOver", var_21_96)

	local var_21_97 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 27
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 52
		}
	}

	var_21_23:RegisterAnimationSequence("ButtonOver", var_21_97)

	local var_21_98 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 45
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 154
		}
	}

	var_21_28:RegisterAnimationSequence("ButtonOver", var_21_98)

	local var_21_99 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 50
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 147
		}
	}

	var_21_30:RegisterAnimationSequence("ButtonOver", var_21_99)

	local var_21_100 = {
		{
			value = 0.1,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_21_32:RegisterAnimationSequence("ButtonOver", var_21_100)

	local function var_21_101()
		var_21_8:AnimateSequence("ButtonOver")
		var_21_10:AnimateSequence("ButtonOver")
		var_21_13:AnimateSequence("ButtonOver")
		var_21_15:AnimateSequence("ButtonOver")
		var_21_17:AnimateSequence("ButtonOver")
		var_21_23:AnimateSequence("ButtonOver")
		var_21_28:AnimateSequence("ButtonOver")
		var_21_30:AnimateSequence("ButtonOver")
		var_21_32:AnimateSequence("ButtonOver")
	end

	var_21_0._sequences.ButtonOver = var_21_101

	local var_21_102
	local var_21_103 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_21_4:RegisterAnimationSequence("ButtonUp", var_21_103)

	local var_21_104 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		}
	}

	var_21_8:RegisterAnimationSequence("ButtonUp", var_21_104)

	local var_21_105 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("ButtonUp", var_21_105)

	local var_21_106 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 119
		}
	}

	var_21_13:RegisterAnimationSequence("ButtonUp", var_21_106)

	local var_21_107 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 150
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 134
		}
	}

	var_21_15:RegisterAnimationSequence("ButtonUp", var_21_107)

	local var_21_108 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142
		}
	}

	var_21_17:RegisterAnimationSequence("ButtonUp", var_21_108)

	local var_21_109 = {
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

	var_21_23:RegisterAnimationSequence("ButtonUp", var_21_109)

	local var_21_110 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142
		}
	}

	var_21_28:RegisterAnimationSequence("ButtonUp", var_21_110)

	local var_21_111 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142
		}
	}

	var_21_30:RegisterAnimationSequence("ButtonUp", var_21_111)

	local var_21_112 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_21_32:RegisterAnimationSequence("ButtonUp", var_21_112)

	local function var_21_113()
		var_21_4:AnimateSequence("ButtonUp")
		var_21_8:AnimateSequence("ButtonUp")
		var_21_10:AnimateSequence("ButtonUp")
		var_21_13:AnimateSequence("ButtonUp")
		var_21_15:AnimateSequence("ButtonUp")
		var_21_17:AnimateSequence("ButtonUp")
		var_21_23:AnimateSequence("ButtonUp")
		var_21_28:AnimateSequence("ButtonUp")
		var_21_30:AnimateSequence("ButtonUp")
		var_21_32:AnimateSequence("ButtonUp")
	end

	var_21_0._sequences.ButtonUp = var_21_113

	local var_21_114
	local var_21_115 = {
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

	var_21_4:RegisterAnimationSequence("Complete", var_21_115)

	local var_21_116 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocusDark
		}
	}

	var_21_8:RegisterAnimationSequence("Complete", var_21_116)

	local var_21_117 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_21_10:RegisterAnimationSequence("Complete", var_21_117)

	local var_21_118 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_21_13:RegisterAnimationSequence("Complete", var_21_118)

	local var_21_119 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_21_0.ButtonGlow.Glow
		}
	}

	var_21_15:RegisterAnimationSequence("Complete", var_21_119)

	local var_21_120 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_21_17:RegisterAnimationSequence("Complete", var_21_120)

	local var_21_121 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/COMPLETE"))
		}
	}

	var_21_19:RegisterAnimationSequence("Complete", var_21_121)

	local var_21_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 123
		}
	}

	var_21_21:RegisterAnimationSequence("Complete", var_21_122)

	local var_21_123 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_26:RegisterAnimationSequence("Complete", var_21_123)

	local var_21_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_28:RegisterAnimationSequence("Complete", var_21_124)

	local function var_21_125()
		var_21_4:AnimateSequence("Complete")
		var_21_8:AnimateSequence("Complete")
		var_21_10:AnimateSequence("Complete")
		var_21_13:AnimateSequence("Complete")
		var_21_15:AnimateSequence("Complete")
		var_21_17:AnimateSequence("Complete")
		var_21_19:AnimateSequence("Complete")
		var_21_21:AnimateSequence("Complete")
		var_21_26:AnimateSequence("Complete")
		var_21_28:AnimateSequence("Complete")
	end

	var_21_0._sequences.Complete = var_21_125

	local var_21_126
	local var_21_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_21_4:RegisterAnimationSequence("TierKBM", var_21_127)

	local var_21_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142,
			easing = LUI.EASING.snap
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.EnemyDarkRed,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57,
			easing = LUI.EASING.snap
		},
		{
			value = 0.9,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_8:RegisterAnimationSequence("TierKBM", var_21_128)

	local var_21_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 142,
			easing = LUI.EASING.snap
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("TierKBM", var_21_129)

	local var_21_130 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_13:RegisterAnimationSequence("TierKBM", var_21_130)

	local var_21_131 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_15:RegisterAnimationSequence("TierKBM", var_21_131)

	local var_21_132 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_17:RegisterAnimationSequence("TierKBM", var_21_132)

	local var_21_133 = {
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

	var_21_19:RegisterAnimationSequence("TierKBM", var_21_133)

	local var_21_134 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 123
		}
	}

	var_21_21:RegisterAnimationSequence("TierKBM", var_21_134)

	local var_21_135 = {
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

	var_21_23:RegisterAnimationSequence("TierKBM", var_21_135)

	local var_21_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_26:RegisterAnimationSequence("TierKBM", var_21_136)

	local var_21_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_28:RegisterAnimationSequence("TierKBM", var_21_137)

	local function var_21_138()
		var_21_4:AnimateSequence("TierKBM")
		var_21_8:AnimateSequence("TierKBM")
		var_21_10:AnimateSequence("TierKBM")
		var_21_13:AnimateSequence("TierKBM")
		var_21_15:AnimateSequence("TierKBM")
		var_21_17:AnimateSequence("TierKBM")
		var_21_19:AnimateSequence("TierKBM")
		var_21_21:AnimateSequence("TierKBM")
		var_21_23:AnimateSequence("TierKBM")
		var_21_26:AnimateSequence("TierKBM")
		var_21_28:AnimateSequence("TierKBM")
	end

	var_21_0._sequences.TierKBM = var_21_138

	local var_21_139
	local var_21_140 = {
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

	var_21_21:RegisterAnimationSequence("ResetOwned", var_21_140)

	local function var_21_141()
		var_21_21:AnimateSequence("ResetOwned")
	end

	var_21_0._sequences.ResetOwned = var_21_141

	local var_21_142
	local var_21_143 = {
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

	var_21_21:RegisterAnimationSequence("ResetTier", var_21_143)

	local function var_21_144()
		var_21_21:AnimateSequence("ResetTier")
	end

	var_21_0._sequences.ResetTier = var_21_144

	local var_21_145
	local var_21_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_sparks_s5")
		}
	}

	var_21_4:RegisterAnimationSequence("S5", var_21_146)

	local function var_21_147()
		var_21_4:AnimateSequence("S5")
	end

	var_21_0._sequences.S5 = var_21_147

	var_0_11(var_21_0, var_21_1, arg_21_1)

	return var_21_0
end

MenuBuilder.registerType("BattlePassPurchaseButton", BattlePassPurchaseButton)
LockTable(_M)
