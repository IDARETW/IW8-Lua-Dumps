module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.confirmAction)
	assert(arg_1_0.bindButton)

	arg_1_0.isQuickAccessShortcutsDisabled = true

	Engine.BJDBIAGIDA(SOUND_SETS.storefront.openConfirmationPopup)

	if arg_1_2.itemCurrencyID then
		if arg_1_2.itemCurrencyID == LOOT.CurrencyIDs.COD_POINTS then
			arg_1_0.Price.Currency:setImage(RegisterMaterial("icon_currency_codpoints"))
		elseif arg_1_2.itemCurrencyID == LOOT.CurrencyIDs.KEYS then
			arg_1_0.Price.Currency:setImage(RegisterMaterial("icon_currency_key"))
		else
			assert(false, "Unsupported currency!")
		end

		local var_1_0 = arg_1_2.itemCurrencyAmount

		if var_1_0 > 0 then
			arg_1_0.Price.Amount:setText(var_1_0)
			ACTIONS.AnimateSequence(arg_1_0.Price, "PriceAndIcon")
		else
			ACTIONS.AnimateSequence(arg_1_0.Price, "Free")
			arg_1_0.ConfirmButton.Text:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_CLAIM"))
		end
	end

	if arg_1_2.itemImage then
		arg_1_0.Image:setImage(RegisterMaterial(arg_1_2.itemImage))
	end

	if arg_1_2.itemName then
		arg_1_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE_CONFIRM_PURCHASE_MESSAGE", arg_1_2.itemName))
	end

	assert(arg_1_2.alreadyOwnedCount)

	if arg_1_2.showDisclaimer or arg_1_2.alreadyOwnedCount > 0 then
		ACTIONS.AnimateSequence(arg_1_0, "TierDisclaimer")

		if arg_1_0._showDisclaimer and arg_1_2.alreadyOwnedCount > 0 then
			arg_1_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_OWNED_DISCLAIMER", arg_1_2.alreadyOwnedCount))
		elseif arg_1_0._showDisclaimer then
			arg_1_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_DISCLAIMER"))
		elseif arg_1_2.alreadyOwnedCount > 0 then
			arg_1_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_OWNED_DISCLAIMER", arg_1_2.alreadyOwnedCount))
		end
	end

	arg_1_0.ConfirmButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if arg_1_2.confirmAction and type(arg_1_2.confirmAction) == "function" then
			arg_1_2.confirmAction()
			LUI.FlowManager.RequestLeaveMenu(arg_2_0, false, false)
		end
	end)

	local function var_1_1(arg_3_0, arg_3_1)
		if arg_1_2.startPurchaseImmediately then
			LUI.FlowManager.RequestLeaveMenuByName("StoreBundlePreview", false, false)
		end

		LUI.FlowManager.RequestLeaveMenu(arg_3_0, false, false)
	end

	arg_1_0.CancelButton:addEventHandler("button_action", var_1_1)
	arg_1_0.bindButton:addEventHandler("button_secondary", var_1_1)

	if arg_1_2.startPurchaseImmediately then
		arg_1_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			priority = 3,
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/INSPECT"),
			container = arg_1_0.Prompts
		})
		arg_1_0.bindButton:addEventHandler("button_alt1", function(arg_4_0, arg_4_1)
			LUI.FlowManager.RequestLeaveMenu(arg_4_0, false, false)
		end)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function StoreConfirmPurchasePopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalNavigator.new()

	var_5_0.id = "StoreConfirmPurchasePopup"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	var_5_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})
	var_5_0.HelperBar.id = "HelperBar"

	var_5_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0.HelperBar:setPriority(10)
	var_5_0:addElement(var_5_0.HelperBar)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Darkener"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_4:SetAlpha(0.97, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "GenericPopupWindow"

	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -911, _1080p * 911, _1080p * -340, _1080p * 222)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericPopupWindow = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "Title"

	var_5_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/STORE_CONFIRM_PURCHASE_TITLE")), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -290, _1080p * -230)
	var_5_0:addElement(var_5_8)

	var_5_0.Title = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Image"

	var_5_10:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 96, _1080p * 608, _1080p * -300, _1080p * -44)
	var_5_0:addElement(var_5_10)

	var_5_0.Image = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "Message"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_12:setText("", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -225, _1080p * -203)
	var_5_0:addElement(var_5_12)

	var_5_0.Message = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "ConfirmButton"

	var_5_14.Text:SetLeft(_1080p * 20, 0)
	var_5_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW"), 0)
	var_5_14.Text:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 720, _1080p * 1204, _1080p * 84, _1080p * 122)
	var_5_0:addElement(var_5_14)

	var_5_0.ConfirmButton = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "CancelButton"

	var_5_16.Text:SetLeft(_1080p * 20, 0)
	var_5_16.Text:setText(Engine.CBBHFCGDIC("MENU/CANCEL"), 0)
	var_5_16.Text:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 720, _1080p * 1204, _1080p * 128, _1080p * 166)
	var_5_0:addElement(var_5_16)

	var_5_0.CancelButton = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_5_0) then
		var_5_18.Label:setText("Back/Select", 0)
	end

	var_5_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 155, _1080p * 255, _1080p * 237, _1080p * 268)
	var_5_0:addElement(var_5_18)

	var_5_0.Prompts = var_5_18

	local var_5_19
	local var_5_20 = MenuBuilder.BuildRegisteredType("PriceButtonSmall", {
		controllerIndex = var_5_1
	})

	var_5_20.id = "Price"

	var_5_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * -40, _1080p * 6, _1080p * 56)
	var_5_0:addElement(var_5_20)

	var_5_0.Price = var_5_20

	local var_5_21
	local var_5_22 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_5_1
	})

	var_5_22.id = "PlayerDetails"

	var_5_22:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
	var_5_0:addElement(var_5_22)

	var_5_0.PlayerDetails = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIStyledText.new()

	var_5_24.id = "Disclaimer"

	var_5_24:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_24:SetAlpha(0, 0)
	var_5_24:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_DISCLAIMER"), 0)
	var_5_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_24:SetAlignment(LUI.Alignment.Left)
	var_5_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 608, _1080p * 553, _1080p * 571)
	var_5_0:addElement(var_5_24)

	var_5_0.Disclaimer = var_5_24

	local var_5_25
	local var_5_26 = LUI.UIImage.new()

	var_5_26.id = "Lock"

	var_5_26:SetAlpha(0, 0)
	var_5_26:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_5_26:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 96, _1080p * 128, _1080p * 6, _1080p * 38)
	var_5_0:addElement(var_5_26)

	var_5_0.Lock = var_5_26

	local function var_5_27()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_27

	local var_5_28
	local var_5_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("TierDisclaimer", var_5_29)

	local var_5_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_26:RegisterAnimationSequence("TierDisclaimer", var_5_30)

	local function var_5_31()
		var_5_24:AnimateSequence("TierDisclaimer")
		var_5_26:AnimateSequence("TierDisclaimer")
	end

	var_5_0._sequences.TierDisclaimer = var_5_31

	local var_5_32
	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -229
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -199
		}
	}

	var_5_12:RegisterAnimationSequence("AR", var_5_33)

	local function var_5_34()
		var_5_12:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_34

	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK"),
		container = var_5_18
	})
	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 2,
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT"),
		container = var_5_18
	})

	local var_5_35 = LUI.UIBindButton.new()

	var_5_35.id = "selfBindButton"

	var_5_0:addElement(var_5_35)

	var_5_0.bindButton = var_5_35

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("StoreConfirmPurchasePopup", StoreConfirmPurchasePopup)
LockTable(_M)
