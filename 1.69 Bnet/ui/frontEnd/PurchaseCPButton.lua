module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1)

	arg_1_0._buttonData = arg_1_1

	if arg_1_1.title then
		arg_1_0.ItemName:setText(arg_1_1.title)
	end

	if arg_1_1.price then
		arg_1_0.ItemPrice:setText(arg_1_1.price)
	end

	if arg_1_1.productId then
		local var_1_0 = STORE.CODPointBonuses[arg_1_1.productId]

		if var_1_0 ~= 0 then
			if Dvar.IBEGCHEFE("NOMQKRNSKQ") then
				ACTIONS.AnimateSequence(arg_1_0, "BonusShow")
				arg_1_0.BonusCPAmount:setText(ToUpperCase(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/BONUS_COD_POINTS", var_1_0)))
			elseif Dvar.IBEGCHEFE("LKKMPTPLMP") then
				ACTIONS.AnimateSequence(arg_1_0, "BonusShow")

				local var_1_1 = STORE.CODPointBonusPercentage[arg_1_1.productId]

				arg_1_0.BonusCPAmount:setText(ToUpperCase(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/BONUS_COD_POINTS_PERCENTAGE", var_1_1)))
			else
				ACTIONS.AnimateSequence(arg_1_0, "BonusHide")
			end
		else
			ACTIONS.AnimateSequence(arg_1_0, "BonusHide")
		end
	else
		ACTIONS.AnimateSequence(arg_1_0, "BonusHide")
	end

	if arg_1_1.productId then
		local var_1_2 = STORE.CODPointBtnImages[arg_1_1.productId]

		if var_1_2 then
			arg_1_0.ItemImage:setImage(RegisterMaterial(var_1_2))
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetButtonData = var_0_0

	arg_2_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if not arg_2_0._buttonData or arg_2_0._buttonData.owned then
			return true
		end

		if arg_2_0._buttonData.isFirstParty then
			local function var_3_0()
				LUI.FlowManager.RequestPopupMenu(nil, "ItemExchangeFencePopup", true, arg_3_1.controller, false, {
					controllerIndex = arg_2_1,
					message = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASING_DLC")
				})
				InGameStore.SelectProduct(arg_2_1, arg_2_0._buttonData.productId, InGameStorePurchaseType.BROWSE)
			end

			if arg_2_0._buttonData.bundleID then
				local var_3_1 = {
					file = CSV.bundleIDs.file,
					cols = CSV.bundleIDs.cols
				}
				local var_3_2 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_2_0._buttonData.bundleID)
				local var_3_3 = CSV.ReadRow(var_3_1, var_3_2)
				local var_3_4 = {
					isFirstParty = true,
					bundleID = tonumber(var_3_3.id),
					price = arg_2_0._buttonData.price,
					owned = arg_2_0._buttonData.owned,
					firstPartyPurchase = var_3_0
				}

				LUI.FlowManager.GetScopedData(arg_3_0:GetCurrentMenu()).previewProductID = arg_2_0._buttonData.productId

				LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_2_1, false, var_3_4)
			else
				var_3_0()
			end
		else
			local var_3_5 = tonumber(arg_2_0._buttonData.price)
			local var_3_6 = Commerce.CEDDCGHIGA(arg_2_1, LOOT.CurrencyIDs.COD_POINTS)
			local var_3_7 = arg_2_0._buttonData.itemIndex

			if Loot.DEBEIFJEEG(arg_2_1, var_3_7) > 0 then
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "PopupOK", true, arg_2_1, false, {
					message = Engine.CBBHFCGDIC("LUA_MENU_MP/ALREADY_OWN_ITEM")
				})
			elseif var_3_6 < var_3_5 then
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "PopupOK", true, arg_2_1, false, {
					message = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_NOT_ENOUGH_CP")
				})
			else
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "DLCStoreYesNoPopup", true, arg_2_1, false, {
					controllerIndex = arg_2_1,
					cost = var_3_5,
					itemID = var_3_7
				})
			end
		end
	end)
	arg_2_0:addEventHandler("loot_item_transaction_complete", function(arg_5_0, arg_5_1)
		LUI.FlowManager.RequestLeaveMenuByName("live_dialog_text_box")
		LUI.FlowManager.RequestPopupMenu(arg_2_0, "PopupOK", true, arg_2_1, false, {
			message = Engine.CBBHFCGDIC("LUA_MENU_MP/DLC_PURCHASED")
		})

		return true
	end)
	arg_2_0:addEventHandler("loot_item_transaction_error", function(arg_6_0, arg_6_1)
		if arg_6_1.errorCode == STORE.ProductNoLongerAvailableError then
			LUI.FlowManager.RequestPopupMenu(nil, "ProductNoLongerAvailableErrorPopup", true, arg_2_1, false)
		end

		LUI.FlowManager.RequestLeaveMenuByName("live_dialog_text_box")
		LUI.FlowManager.RequestPopupMenu(arg_2_0, "PopupOK", true, arg_2_1, false, {
			message = Engine.CBBHFCGDIC("LUA_MENU_MP/DLC_PURCHASE_ERROR")
		})

		return true
	end)
	arg_2_0:addEventHandler("gain_focus", function(arg_7_0, arg_7_1)
		if arg_2_0._buttonData then
			Engine.DJEDHFJFCD(arg_2_1, arg_2_0._buttonData.itemIndex)
		end
	end)
	arg_2_0:addEventHandler("lose_focus", function(arg_8_0, arg_8_1)
		if arg_2_0._buttonData then
			Engine.BABEBICCIE(arg_2_1, arg_2_0._buttonData.itemIndex)
		end
	end)
	arg_2_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_9_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		ACTIONS.AnimateSequence(arg_10_0, "ButtonUp")
	end)
	ACTIONS.AnimateSequence(arg_2_0, "ButtonUp")
end

function PurchaseCPButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 640 * _1080p, 0, 80 * _1080p)

	var_11_0.id = "PurchaseCPButton"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0

	var_11_0:setUseStencil(true)

	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "ItemImage"

	var_11_4:SetScale(0, 0)
	var_11_4:setImage(RegisterMaterial("purchase_cod_points_button_bg"), 0)
	var_11_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -320, _1080p * 320, _1080p * -40, _1080p * 40)
	var_11_0:addElement(var_11_4)

	var_11_0.ItemImage = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Vignette"

	var_11_6:SetAlpha(0.6, 0)
	var_11_6:setImage(RegisterMaterial("menu_vignette_corner"), 0)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 600, 0, _1080p * 50)
	var_11_0:addElement(var_11_6)

	var_11_0.Vignette = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "HighlightGradient"

	var_11_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_11_8:SetAlpha(0, 0)
	var_11_8:SetPixelGridEnabled(true)
	var_11_8:SetPixelGridContrast(0.2, 0)
	var_11_8:SetPixelGridBlockWidth(2, 0)
	var_11_8:SetPixelGridBlockHeight(2, 0)
	var_11_8:SetPixelGridGutterWidth(1, 0)
	var_11_8:SetPixelGridGutterHeight(1, 0)
	var_11_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_11_0:addElement(var_11_8)

	var_11_0.HighlightGradient = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIStyledText.new()

	var_11_10.id = "ItemName"

	var_11_10:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_11_10:setText("", 0)
	var_11_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_10:SetWordWrap(false)
	var_11_10:SetAlignment(LUI.Alignment.Left)
	var_11_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_11_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_10:SetStartupDelay(2000)
	var_11_10:SetLineHoldTime(400)
	var_11_10:SetAnimMoveTime(2000)
	var_11_10:SetAnimMoveSpeed(150)
	var_11_10:SetEndDelay(2000)
	var_11_10:SetCrossfadeTime(250)
	var_11_10:SetFadeInTime(300)
	var_11_10:SetFadeOutTime(300)
	var_11_10:SetMaxVisibleLines(1)
	var_11_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 5, _1080p * 33)
	var_11_0:addElement(var_11_10)

	var_11_0.ItemName = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIStyledText.new()

	var_11_12.id = "ItemPrice"

	var_11_12:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_11_12:setText("", 0)
	var_11_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_12:SetWordWrap(false)
	var_11_12:SetAlignment(LUI.Alignment.Left)
	var_11_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_11_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_12:SetStartupDelay(2000)
	var_11_12:SetLineHoldTime(400)
	var_11_12:SetAnimMoveTime(2000)
	var_11_12:SetAnimMoveSpeed(150)
	var_11_12:SetEndDelay(2000)
	var_11_12:SetCrossfadeTime(250)
	var_11_12:SetFadeInTime(300)
	var_11_12:SetFadeOutTime(300)
	var_11_12:SetMaxVisibleLines(1)
	var_11_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 10, _1080p * 210, _1080p * -29, _1080p * -5)
	var_11_0:addElement(var_11_12)

	var_11_0.ItemPrice = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "HighlightBarTop"

	var_11_14:SetAlpha(0, 0)
	var_11_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_11_0:addElement(var_11_14)

	var_11_0.HighlightBarTop = var_11_14

	local var_11_15
	local var_11_16 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_11_1
	})

	var_11_16.id = "HighlightBarBottom"

	var_11_16:SetAlpha(0, 0)
	var_11_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_11_0:addElement(var_11_16)

	var_11_0.HighlightBarBottom = var_11_16

	local var_11_17
	local var_11_18 = LUI.UIImage.new()

	var_11_18.id = "BonusCPBG"

	var_11_18:SetRGBFromTable(SWATCHES.Store.NoItemBGAlt, 0)
	var_11_18:SetAlpha(0, 0)
	var_11_18:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -145, 0, _1080p * -32, 0)
	var_11_0:addElement(var_11_18)

	var_11_0.BonusCPBG = var_11_18

	local var_11_19
	local var_11_20 = LUI.UIImage.new()

	var_11_20.id = "BonusCPIcon"

	var_11_20:SetAlpha(0, 0)
	var_11_20:setImage(RegisterMaterial("currency_cod_points_icon"), 0)
	var_11_20:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -139, _1080p * -115, _1080p * -28, _1080p * -4)
	var_11_0:addElement(var_11_20)

	var_11_0.BonusCPIcon = var_11_20

	local var_11_21
	local var_11_22 = LUI.UIStyledText.new()

	var_11_22.id = "BonusCPAmount"

	var_11_22:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_11_22:SetAlpha(0, 0)
	var_11_22:setText("3000 BONUS!", 0)
	var_11_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_22:SetWordWrap(false)
	var_11_22:SetAlignment(LUI.Alignment.Left)
	var_11_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_11_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_22:SetStartupDelay(2000)
	var_11_22:SetLineHoldTime(400)
	var_11_22:SetAnimMoveTime(2000)
	var_11_22:SetAnimMoveSpeed(150)
	var_11_22:SetEndDelay(2000)
	var_11_22:SetCrossfadeTime(250)
	var_11_22:SetFadeInTime(300)
	var_11_22:SetFadeOutTime(300)
	var_11_22:SetMaxVisibleLines(1)
	var_11_22:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -110, 0, _1080p * -26, _1080p * -6)
	var_11_0:addElement(var_11_22)

	var_11_0.BonusCPAmount = var_11_22

	local var_11_23
	local var_11_24 = LUI.UIImage.new()

	var_11_24.id = "Overlay"

	var_11_24:SetRGBFromInt(0, 0)
	var_11_24:SetAlpha(0, 0)
	var_11_0:addElement(var_11_24)

	var_11_0.Overlay = var_11_24

	local function var_11_25()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_25

	local var_11_26 = {
		{
			value = 0.1,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonOver", var_11_26)

	local var_11_27 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOver", var_11_27)

	local var_11_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonOver", var_11_28)

	local var_11_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonOver", var_11_29)

	local var_11_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("ButtonOver", var_11_30)

	local function var_11_31()
		var_11_4:AnimateSequence("ButtonOver")
		var_11_8:AnimateSequence("ButtonOver")
		var_11_14:AnimateSequence("ButtonOver")
		var_11_16:AnimateSequence("ButtonOver")
		var_11_24:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_31

	local var_11_32 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonUp", var_11_32)

	local var_11_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUp", var_11_33)

	local var_11_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonUp", var_11_34)

	local var_11_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonUp", var_11_35)

	local var_11_36 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("ButtonUp", var_11_36)

	local function var_11_37()
		var_11_4:AnimateSequence("ButtonUp")
		var_11_8:AnimateSequence("ButtonUp")
		var_11_14:AnimateSequence("ButtonUp")
		var_11_16:AnimateSequence("ButtonUp")
		var_11_24:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_37

	local var_11_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("BonusShow", var_11_38)

	local var_11_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("BonusShow", var_11_39)

	local var_11_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_22:RegisterAnimationSequence("BonusShow", var_11_40)

	local function var_11_41()
		var_11_18:AnimateSequence("BonusShow")
		var_11_20:AnimateSequence("BonusShow")
		var_11_22:AnimateSequence("BonusShow")
	end

	var_11_0._sequences.BonusShow = var_11_41

	local var_11_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("BonusHide", var_11_42)

	local var_11_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("BonusHide", var_11_43)

	local var_11_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_22:RegisterAnimationSequence("BonusHide", var_11_44)

	local function var_11_45()
		var_11_18:AnimateSequence("BonusHide")
		var_11_20:AnimateSequence("BonusHide")
		var_11_22:AnimateSequence("BonusHide")
	end

	var_11_0._sequences.BonusHide = var_11_45

	var_0_1(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("PurchaseCPButton", PurchaseCPButton)
LockTable(_M)
