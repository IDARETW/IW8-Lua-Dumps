module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._buttonData = arg_1_1

	arg_1_0.Title:setText(arg_1_1.title)
	arg_1_0.Image:setImage(RegisterMaterial(arg_1_1.image))
	arg_1_0.Purchased:SetAlpha(arg_1_1.owned and 1 or 0)

	if arg_1_1.price and not arg_1_1.owned then
		LAYOUT.SetTextBoxSize(arg_1_0.Price, arg_1_0.PriceBackground, arg_1_1.price, 5, nil, LUI.Alignment.Left, 0)
	elseif arg_1_1.owned then
		ACTIONS.AnimateSequence(arg_1_0, "Owned")
		LAYOUT.SetTextBoxSize(arg_1_0.Price, arg_1_0.PriceBackground, Engine.CBBHFCGDIC("MENU/OWNED_CAPS"), 5, nil, LUI.Alignment.Left, 0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetButtonData = var_0_0

	arg_2_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if not arg_2_0._buttonData or arg_2_0._buttonData.owned then
			return true
		end

		if arg_2_0._buttonData.isFirstParty then
			local var_3_0 = arg_2_0._buttonData.bundleID
			local var_3_1 = arg_2_0._buttonData.productId

			if STORE.IsGameUpsellProduct(var_3_1) then
				LUI.FlowManager.RequestPopupMenu(nil, "MagmaUpsellFullScreenPopup", true, arg_3_1.controller, false, {
					controllerIndex = arg_2_1
				})
				InGameStore.SelectProduct(arg_2_1, arg_2_0._buttonData.productId, InGameStorePurchaseType.BROWSE)
			elseif var_3_0 then
				local var_3_2 = STORE.GetFirstPartyBundleData(arg_2_1, var_3_0, var_3_1)

				LUI.FlowManager.GetScopedData(arg_3_0:GetCurrentMenu()).previewProductID = arg_2_0._buttonData.productId

				LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_2_1, false, var_3_2)
			else
				LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangeFencePopup", true, arg_3_1.controller, false, {
					controllerIndex = arg_2_1,
					message = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASING_DLC")
				})
				InGameStore.SelectProduct(arg_2_1, arg_2_0._buttonData.productId, InGameStorePurchaseType.BROWSE)
			end
		else
			local var_3_3 = tonumber(arg_2_0._buttonData.price)
			local var_3_4 = Commerce.CEDDCGHIGA(arg_2_1, LOOT.CurrencyIDs.COD_POINTS)
			local var_3_5 = arg_2_0._buttonData.itemIndex

			if Loot.DEBEIFJEEG(arg_2_1, var_3_5) > 0 then
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "PopupOK", true, arg_2_1, false, {
					message = Engine.CBBHFCGDIC("LUA_MENU_MP/ALREADY_OWN_ITEM")
				})
			elseif var_3_4 < var_3_3 then
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "PopupOK", true, arg_2_1, false, {
					message = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_NOT_ENOUGH_CP")
				})
			else
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "DLCStoreYesNoPopup", true, arg_2_1, false, {
					controllerIndex = arg_2_1,
					cost = var_3_3,
					itemID = var_3_5
				})
			end
		end
	end)
	arg_2_0:addEventHandler("loot_item_transaction_complete", function(arg_4_0, arg_4_1)
		LUI.FlowManager.RequestLeaveMenuByName("live_dialog_text_box")
		LUI.FlowManager.RequestPopupMenu(arg_2_0, "PopupOK", true, arg_2_1, false, {
			message = Engine.CBBHFCGDIC("LUA_MENU_MP/DLC_PURCHASED")
		})

		return true
	end)
	arg_2_0:addEventHandler("loot_item_transaction_error", function(arg_5_0, arg_5_1)
		if arg_5_1.errorCode == STORE.ProductNoLongerAvailableError then
			LUI.FlowManager.RequestPopupMenu(nil, "ProductNoLongerAvailableErrorPopup", true, arg_2_1, false)
		end

		LUI.FlowManager.RequestLeaveMenuByName("live_dialog_text_box")
		LUI.FlowManager.RequestPopupMenu(arg_2_0, "PopupOK", true, arg_2_1, false, {
			message = Engine.CBBHFCGDIC("LUA_MENU_MP/DLC_PURCHASE_ERROR")
		})

		return true
	end)
	arg_2_0:addEventHandler("gain_focus", function(arg_6_0, arg_6_1)
		if arg_2_0._buttonData then
			Engine.DJEDHFJFCD(arg_2_1, arg_2_0._buttonData.itemIndex)
		end
	end)
	arg_2_0:addEventHandler("lose_focus", function(arg_7_0, arg_7_1)
		if arg_2_0._buttonData then
			Engine.BABEBICCIE(arg_2_1, arg_2_0._buttonData.itemIndex)
		end
	end)
end

function StoreBasicItemButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 320 * _1080p, 0, 200 * _1080p)

	var_8_0.id = "StoreBasicItemButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0

	var_8_0:setUseStencil(true)

	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Image"

	var_8_0:addElement(var_8_4)

	var_8_0.Image = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "TitleBackground"

	var_8_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_6:SetPixelGridEnabled(true)
	var_8_6:SetPixelGridContrast(0.5, 0)
	var_8_6:SetPixelGridBlockWidth(2, 0)
	var_8_6:SetPixelGridBlockHeight(2, 0)
	var_8_6:SetPixelGridGutterWidth(1, 0)
	var_8_6:SetPixelGridGutterHeight(1, 0)
	var_8_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -50, 0)
	var_8_0:addElement(var_8_6)

	var_8_0.TitleBackground = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Darkener"

	var_8_8:SetRGBFromInt(0, 0)
	var_8_8:SetAlpha(0, 0)
	var_8_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_8_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 4, 0)
	var_8_0:addElement(var_8_8)

	var_8_0.Darkener = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "Gradient"

	var_8_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_8_10:SetAlpha(0, 0)
	var_8_10:SetPixelGridEnabled(true)
	var_8_10:SetPixelGridContrast(0.2, 0)
	var_8_10:SetPixelGridBlockWidth(2, 0)
	var_8_10:SetPixelGridBlockHeight(2, 0)
	var_8_10:SetPixelGridGutterWidth(1, 0)
	var_8_10:SetPixelGridGutterHeight(1, 0)
	var_8_10:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_8_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 60, 0)
	var_8_0:addElement(var_8_10)

	var_8_0.Gradient = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIStyledText.new()

	var_8_12.id = "Title"

	var_8_12:SetRGBFromTable(SWATCHES.Store.NoItemTitle, 0)
	var_8_12:setText("", 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetAlignment(LUI.Alignment.Center)
	var_8_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_8_12:SetStartupDelay(2000)
	var_8_12:SetLineHoldTime(400)
	var_8_12:SetAnimMoveTime(2000)
	var_8_12:SetAnimMoveSpeed(150)
	var_8_12:SetEndDelay(2000)
	var_8_12:SetCrossfadeTime(250)
	var_8_12:SetFadeInTime(300)
	var_8_12:SetFadeOutTime(300)
	var_8_12:SetMaxVisibleLines(1)
	var_8_12:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -39, _1080p * -11)
	var_8_0:addElement(var_8_12)

	var_8_0.Title = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIImage.new()

	var_8_14.id = "PriceBackground"

	var_8_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_14:SetPixelGridEnabled(true)
	var_8_14:SetPixelGridContrast(0.5, 0)
	var_8_14:SetPixelGridBlockWidth(2, 0)
	var_8_14:SetPixelGridBlockHeight(2, 0)
	var_8_14:SetPixelGridGutterWidth(1, 0)
	var_8_14:SetPixelGridGutterHeight(1, 0)
	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 115, _1080p * 5, _1080p * 35)
	var_8_0:addElement(var_8_14)

	var_8_0.PriceBackground = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIStyledText.new()

	var_8_16.id = "Price"

	var_8_16:SetRGBFromTable(SWATCHES.Store.Description, 0)
	var_8_16:setText("", 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_16:SetWordWrap(false)
	var_8_16:SetAlignment(LUI.Alignment.Left)
	var_8_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_16:SetStartupDelay(1000)
	var_8_16:SetLineHoldTime(500)
	var_8_16:SetAnimMoveTime(750)
	var_8_16:SetAnimMoveSpeed(50)
	var_8_16:SetEndDelay(1000)
	var_8_16:SetCrossfadeTime(400)
	var_8_16:SetFadeInTime(300)
	var_8_16:SetFadeOutTime(300)
	var_8_16:SetMaxVisibleLines(1)
	var_8_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 110, _1080p * 10, _1080p * 30)
	var_8_0:addElement(var_8_16)

	var_8_0.Price = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "HighlightBarTop"

	var_8_18:SetAlpha(0, 0)
	var_8_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_8_0:addElement(var_8_18)

	var_8_0.HighlightBarTop = var_8_18

	local var_8_19
	local var_8_20 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_8_1
	})

	var_8_20.id = "HighlightBarBottom"

	var_8_20:SetAlpha(0, 0)
	var_8_20:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_8_0:addElement(var_8_20)

	var_8_0.HighlightBarBottom = var_8_20

	local var_8_21
	local var_8_22 = MenuBuilder.BuildRegisteredType("StoreItemPurchased", {
		controllerIndex = var_8_1
	})

	var_8_22.id = "Purchased"

	var_8_22:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -36, _1080p * -4, _1080p * 6, _1080p * 38)
	var_8_0:addElement(var_8_22)

	var_8_0.Purchased = var_8_22

	local function var_8_23()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_23

	local var_8_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOver", var_8_24)

	local var_8_25 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonOver", var_8_25)

	local var_8_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.NoItemTimer
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonOver", var_8_26)

	local var_8_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("ButtonOver", var_8_27)

	local var_8_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("ButtonOver", var_8_28)

	local function var_8_29()
		var_8_8:AnimateSequence("ButtonOver")
		var_8_10:AnimateSequence("ButtonOver")
		var_8_12:AnimateSequence("ButtonOver")
		var_8_18:AnimateSequence("ButtonOver")
		var_8_20:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_29

	local var_8_30 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUp", var_8_30)

	local var_8_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUp", var_8_31)

	local var_8_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.NoItemTitle
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonUp", var_8_32)

	local var_8_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("ButtonUp", var_8_33)

	local var_8_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("ButtonUp", var_8_34)

	local function var_8_35()
		var_8_8:AnimateSequence("ButtonUp")
		var_8_10:AnimateSequence("ButtonUp")
		var_8_12:AnimateSequence("ButtonUp")
		var_8_18:AnimateSequence("ButtonUp")
		var_8_20:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_35

	local var_8_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_16:RegisterAnimationSequence("Owned", var_8_36)

	local function var_8_37()
		var_8_16:AnimateSequence("Owned")
	end

	var_8_0._sequences.Owned = var_8_37

	var_8_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonOver")
	end)
	var_8_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonUp")
	end)
	var_0_1(var_8_0, var_8_1, arg_8_1)
	ACTIONS.AnimateSequence(var_8_0, "ButtonUp")

	return var_8_0
end

MenuBuilder.registerType("StoreBasicItemButton", StoreBasicItemButton)
LockTable(_M)
