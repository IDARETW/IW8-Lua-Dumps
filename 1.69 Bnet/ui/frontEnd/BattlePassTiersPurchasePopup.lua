module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = Dvar.DHEEJCCJBH("MQTOPKPMRS")
	local var_1_1 = Engine.CBBHFCGDIC("BATTLEPASS/TIER_SKIP_SALE")
	local var_1_2

	if var_1_0 and #var_1_0 > 0 then
		var_1_2 = STORE.ParseCountDownTime(var_1_0)
	end

	if var_1_2 then
		if IsLanguageArabic() then
			var_1_1 = var_1_2 .. " :" .. var_1_1
		else
			var_1_1 = Engine.CBBHFCGDIC("LUA_MENU/X_COLON_Y", var_1_1, var_1_2)
		end
	end

	arg_1_0.TierSaleBanner:SetText(var_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._currentLevel = BATTLEPASS.GetTier(arg_2_1)
	arg_2_0._tierCount = arg_2_2.tierSkips
	arg_2_0._tiersTable = BATTLEPASS.GetTierUnlocksByTier(arg_2_1, arg_2_0._currentLevel, arg_2_0._currentLevel + arg_2_0._tierCount)
	arg_2_0._cacheCODPoints = Commerce.CEDDCGHIGA(arg_2_1, LOOT.CurrencyIDs.COD_POINTS)
	arg_2_0._targetItemCost = nil

	local var_2_0 = LUI.FlowManager.GetScopedData(arg_2_2.sourceMenu)

	arg_2_0.TiersGrid = arg_2_0.GridContainer.Grid
	arg_2_0.HorizontalScrollbar = arg_2_0.GridContainer.HorizontalScrollbar

	local function var_2_1(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_3_1 + 1

		arg_3_0.lootData = arg_2_0._tiersTable[var_3_0]
		arg_3_0.index = var_3_0

		arg_3_0:SetCardData(arg_3_0.lootData)

		if not arg_3_0._buttonHandlerAdded then
			arg_3_0._buttonHandlerAdded = true

			arg_3_0:addEventHandler("button_action", function(arg_4_0, arg_4_1)
				if LOOT.CanPreview(arg_4_0.lootData.type, arg_4_0.lootData.ID) then
					var_2_0.restoreTiersPopup = true
					var_2_0.restoreTierFocusIndex = arg_4_0.index

					local var_4_0 = LOOT.GetItemID(arg_4_0.lootData.type, arg_4_0.lootData.ref)

					STORE.PreviewItem(arg_2_1, arg_4_0.lootData.type, arg_4_0.lootData.ID, nil, nil, true, true)
				end
			end)
		end
	end

	arg_2_0.TiersGrid:SetRefreshChild(var_2_1)
	arg_2_0.TiersGrid:SetNumChildren(#arg_2_0._tiersTable)
	arg_2_0.TiersGrid:SetMeasureColumnFunction(LUI.ExpanderUtils.GenerateMeasureColumnFunction(150 * _1080p))
	arg_2_0.TiersGrid:RefreshContent()

	local var_2_2 = StringTable.DIFCHIGDFB(CSV.battlePassIDs.file, CSV.battlePassIDs.cols.id, BATTLEPASS.SINGLE_TIER_SKIP_ID, CSV.battlePassIDs.cols.currencyAmount) * arg_2_0._tierCount

	if CONDITIONS.IsTierSaleEnabled() then
		arg_2_0.TierSaleBanner:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_2_0.TierSaleBanner, "TierSaleVariant")
		arg_2_0.TierSaleBanner:PlayGlint(true)

		local var_2_3 = Dvar.CFHDGABACF("MOKSKKQRLK") * arg_2_0._tierCount

		arg_2_0.PurchaseButton:SetPrice(var_2_2, var_2_3)

		arg_2_0._targetItemCost = var_2_3

		local var_2_4 = LUI.UITimer.new({
			interval = 1000,
			event = "update_sale_timer"
		})

		var_2_4.id = "tierSaleTimer"

		arg_2_0:addElement(var_2_4)
		arg_2_0:registerEventHandler("update_sale_timer", function(arg_5_0, arg_5_1)
			var_0_0(arg_5_0)
		end)
		var_0_0(arg_2_0)

		if not IsLanguageEnglish() then
			ACTIONS.AnimateSequence(arg_2_0, "WideSaleBanner")
		end
	else
		arg_2_0.TierSaleBanner:SetAlpha(0)
		arg_2_0.PurchaseButton:SetPrice(var_2_2)

		arg_2_0._targetItemCost = var_2_2
	end

	local var_2_5 = #arg_2_0._tiersTable == 1 and "BATTLEPASS/UNLOCK_X_REWARD" or "BATTLEPASS/UNLOCK_X_REWARDS"

	arg_2_0.UnlockLabel:setText(Engine.CBBHFCGDIC(var_2_5, #arg_2_0._tiersTable))
	arg_2_0.PurchaseButton:SetPurchaseTitleText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BUY_WITH_COD_POINTS")))
	arg_2_0.PurchaseButton:dispatchEventToChildren({
		name = "button_over"
	})
	ACTIONS.AnimateSequence(arg_2_0.PurchaseButton, "GlintAnime")

	local function var_2_6(arg_6_0, arg_6_1)
		assert(arg_6_1.menu)
		arg_6_1.menu:GetPurchaseAction()(arg_6_1.element, arg_6_0)
		Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseSelect)
	end

	arg_2_0:addEventHandler("restore_focus", function(arg_7_0, arg_7_1)
		if arg_2_0.PurchaseButton.HoldRadial.ReleaseButton then
			arg_2_0.PurchaseButton.HoldRadial:ReleaseButton()
		end

		local var_7_0 = Commerce.CEDDCGHIGA(arg_7_1.controller, LOOT.CurrencyIDs.COD_POINTS)

		if var_7_0 ~= arg_2_0._cacheCODPoints and var_7_0 >= arg_7_0._targetItemCost then
			local var_7_1 = {
				image = "battlepass_purchase_image",
				itemCost = arg_2_0._targetItemCost,
				itemName = Engine.CBBHFCGDIC(var_2_5, arg_2_0._tierCount),
				confirmAction = function()
					var_2_6(arg_7_1, {
						element = arg_7_0,
						menu = arg_2_2.sourceMenu
					})
					LUI.FlowManager.RequestLeaveMenuByName("BattlePassConfirmPurchasePopup")
				end,
				cancelAction = function()
					LUI.FlowManager.RequestLeaveMenuByName("BattlePassConfirmPurchasePopup")
				end
			}

			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassConfirmPurchasePopup", true, arg_2_1, false, var_7_1, nil, false, true)
		end

		arg_2_0._cacheCODPoints = var_7_0
	end)
	LUI.AddUIHoldButtonLogic(arg_2_0.PurchaseButton.HoldRadial, arg_2_1, {
		clickKeyboardAndMouse = false,
		requireFocus = false,
		duration = 1000,
		buttons = {
			alt1 = true
		},
		fill = arg_2_0.PurchaseButton.HoldRadial.Progress,
		onFill = var_2_6,
		animations = {
			onConfirm = "HoldComplete",
			onCancel = "StopHoldPulse",
			onProgress = "HoldPulseLoop",
			gamepadOnly = true,
			target = arg_2_0.PurchaseButton
		},
		soundFX = {
			gamepadOnly = true,
			onProgress = SOUND_SETS.storefront.selectionHoldProgess,
			onCancel = SOUND_SETS.default.deny
		},
		onFillParams = {
			element = arg_2_0,
			menu = arg_2_2.sourceMenu
		}
	})

	local function var_2_7(arg_10_0, arg_10_1)
		local var_10_0 = LUI.IsLastInputKeyboardMouse(arg_10_1.controllerIndex)
		local var_10_1 = arg_10_1.menu

		ACTIONS.AnimateSequence(arg_10_0.PurchaseButton, var_10_0 and "DisplayKBM" or "DisplayGamepad")
		arg_10_0.PurchaseButton:SetHandleMouse(var_10_0)

		if not var_10_0 then
			arg_10_0.PurchaseButton.HoldRadial.Progress:SetProgress(0)
		else
			local function var_10_2(arg_11_0, arg_11_1)
				arg_11_0 = arg_11_0:getParent() and arg_11_0:getParent() or arg_11_0

				var_2_6(arg_11_1, {
					element = arg_11_0,
					menu = arg_2_2.sourceMenu
				})

				return true
			end

			arg_10_0.PurchaseButton:registerEventHandler("leftmousedown", function(arg_12_0, arg_12_1)
				return true
			end)
			arg_10_0.PurchaseButton:registerEventHandler("leftmouseup", var_10_2)
		end
	end

	arg_2_0:registerAndCallEventHandler("update_input_type", var_2_7, {
		controllerIndex = arg_2_1,
		menu = menu
	})
	arg_2_0.bindButton:addEventHandler("button_start", function(arg_13_0, arg_13_1)
		if LUI.IsLastInputKeyboardMouse(arg_13_1.controller) then
			var_2_6(arg_13_1, {
				element = arg_13_0,
				menu = arg_2_2.sourceMenu
			})
		end
	end)
	Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpPurchaseWindow)

	if var_2_0.restoreTierFocusIndex then
		arg_2_0:addEventHandler("menu_create", function()
			arg_2_0.TiersGrid:SetFocusedPosition({
				y = 0,
				x = var_2_0.restoreTierFocusIndex - 1
			}, true)

			var_2_0.restoreTierFocusIndex = nil
		end)
	end

	arg_2_0.isQuickAccessShortcutsDisabled = true

	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleFullscreen(arg_2_0.Background)
end

function BattlePassTiersPurchasePopup(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0.id = "BattlePassTiersPurchasePopup"
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

	var_15_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 846, _1080p * -228, _1080p * 284)
	var_15_0:addElement(var_15_6)

	var_15_0.BattlePassPopupWindow = var_15_6

	local var_15_7
	local var_15_8 = MenuBuilder.BuildRegisteredType("TiersPurchasePopupGridContainer", {
		controllerIndex = var_15_1
	})

	var_15_8.id = "GridContainer"

	var_15_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -262, _1080p * 690, _1080p * -95, _1080p * 262)
	var_15_0:addElement(var_15_8)

	var_15_0.GridContainer = var_15_8

	local var_15_9
	local var_15_10 = LUI.UIText.new()

	var_15_10.id = "Title"

	var_15_10:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_15_10:SetAlpha(0.9, 0)
	var_15_10:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BUY_TIERS")), 0)
	var_15_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_15_10:SetWordWrap(false)
	var_15_10:SetAlignment(LUI.Alignment.Left)
	var_15_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -803, _1080p * -431, _1080p * -193, _1080p * -133)
	var_15_0:addElement(var_15_10)

	var_15_0.Title = var_15_10

	local var_15_11
	local var_15_12 = LUI.UIStyledText.new()

	var_15_12.id = "Message"

	var_15_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_12:setText("", 0)
	var_15_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_15_12:SetAlignment(LUI.Alignment.Left)
	var_15_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -803, _1080p * -344, _1080p * -121, _1080p * -99)
	var_15_0:addElement(var_15_12)

	var_15_0.Message = var_15_12

	local var_15_13
	local var_15_14 = LUI.UIText.new()

	var_15_14.id = "UnlockLabel"

	var_15_14:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_15_14:SetAlpha(0.9, 0)
	var_15_14:setText(Engine.CBBHFCGDIC("BATTLEPASS/UNLOCK_X_REWARDS"), 0)
	var_15_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_14:SetWordWrap(false)
	var_15_14:SetAlignment(LUI.Alignment.Left)
	var_15_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -262, _1080p * -30, _1080p * -136, _1080p * -106)
	var_15_0:addElement(var_15_14)

	var_15_0.UnlockLabel = var_15_14

	local var_15_15
	local var_15_16 = MenuBuilder.BuildRegisteredType("PurchaseBundleButton", {
		controllerIndex = var_15_1
	})

	var_15_16.id = "PurchaseButton"

	var_15_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -803, _1080p * -403, _1080p * -32, _1080p * 88)
	var_15_0:addElement(var_15_16)

	var_15_0.PurchaseButton = var_15_16

	local var_15_17
	local var_15_18 = MenuBuilder.BuildRegisteredType("Wallet", {
		controllerIndex = var_15_1
	})

	var_15_18.id = "Wallet"

	var_15_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 629, _1080p * 799, _1080p * -193, _1080p * -153)
	var_15_0:addElement(var_15_18)

	var_15_0.Wallet = var_15_18

	local var_15_19
	local var_15_20 = LUI.UIImage.new()

	var_15_20.id = "Line"

	var_15_20:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_15_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -262, _1080p * 690, _1080p * -106, _1080p * -105)
	var_15_0:addElement(var_15_20)

	var_15_0.Line = var_15_20

	local var_15_21
	local var_15_22 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_15_1
	})

	var_15_22.id = "TierSaleBanner"

	var_15_22:SetAlpha(0, 0)
	var_15_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -803, _1080p * -403, _1080p * -56, _1080p * -32)
	var_15_0:addElement(var_15_22)

	var_15_0.TierSaleBanner = var_15_22

	local function var_15_23()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_23

	local var_15_24
	local var_15_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -294
		}
	}

	var_15_16:RegisterAnimationSequence("WideSaleBanner", var_15_25)

	local var_15_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -294
		}
	}

	var_15_22:RegisterAnimationSequence("WideSaleBanner", var_15_26)

	local function var_15_27()
		var_15_16:AnimateSequence("WideSaleBanner")
		var_15_22:AnimateSequence("WideSaleBanner")
	end

	var_15_0._sequences.WideSaleBanner = var_15_27

	var_15_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_15_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
	})

	local var_15_28 = LUI.UIBindButton.new()

	var_15_28.id = "selfBindButton"

	var_15_0:addElement(var_15_28)

	var_15_0.bindButton = var_15_28

	var_15_0.bindButton:addEventHandler("button_secondary", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_15_1
		end

		ACTIONS.LeaveMenu(var_15_0)
	end)
	var_0_1(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("BattlePassTiersPurchasePopup", BattlePassTiersPurchasePopup)
LockTable(_M)
