module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.confirmAction)

	if arg_1_2.isBattlepassTier then
		ACTIONS.AnimateSequence(arg_1_0, "BattlepassTier")
	end

	if arg_1_2.itemImage then
		arg_1_0.Image:setImage(RegisterMaterial(arg_1_2.itemImage))
	end

	if arg_1_2.itemName then
		local var_1_0 = ""

		if arg_1_2.itemCurrencyID then
			if arg_1_2.itemCurrencyID == LOOT.CurrencyIDs.COD_POINTS then
				var_1_0 = "LUA_MENU/STORE_PURCHASE_CODPOINTS_DETAILS"
			elseif arg_1_2.itemCurrencyID == LOOT.CurrencyIDs.KEYS then
				var_1_0 = "LUA_MENU/STORE_PURCHASE_CODKEY_DETAILS"
			end
		end

		arg_1_0.Message:setText(Engine.CBBHFCGDIC(var_1_0, arg_1_2.itemName, arg_1_2.itemCurrencyAmount))

		local var_1_1

		if arg_1_2.isItemNameLocalized then
			var_1_1 = arg_1_2.itemName
		else
			var_1_1 = Engine.CBBHFCGDIC(arg_1_2.itemName)
		end

		arg_1_0.Title:setText(var_1_1)
	end

	arg_1_0.ConfirmButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if arg_1_2.confirmAction and type(arg_1_2.confirmAction) == "function" then
			arg_1_2.confirmAction()
			LUI.FlowManager.RequestLeaveMenu(arg_2_0, false, false)
		end
	end)
	arg_1_0.CancelButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		LUI.FlowManager.RequestLeaveMenu(arg_3_0, false, false)
	end)
	arg_1_0.TermsButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		Engine.BHECIAHGC(arg_1_1, 0, STORE.KoreanTermsOfUseURL)
	end)
	arg_1_0.RefundPolicyButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		Engine.BHECIAHGC(arg_1_1, 0, STORE.KoreanRefundPolicyURL)
	end)

	function arg_1_0.AcceptPolicy.callbackFunc(arg_6_0)
		arg_1_0.ConfirmButton:SetButtonDisabled(not arg_6_0)
	end

	arg_1_0.AcceptPolicy:SetValue(false)
end

function StoreConfirmPurchaseKoreaLegalPupup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalNavigator.new()

	var_7_0.id = "StoreConfirmPurchaseKoreaLegalPupup"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	var_7_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})
	var_7_0.HelperBar.id = "HelperBar"

	var_7_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_7_0.HelperBar:setPriority(10)
	var_7_0:addElement(var_7_0.HelperBar)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Darkener"

	var_7_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_4:SetAlpha(0.9, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Darkener = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "GenericPopupWindow"

	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -911, _1080p * 911, _1080p * -339, _1080p * 137)
	var_7_0:addElement(var_7_6)

	var_7_0.GenericPopupWindow = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIText.new()

	var_7_8.id = "Title"

	var_7_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_7_8:setText("", 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_7_8:SetAlignment(LUI.Alignment.Left)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -290, _1080p * -230)
	var_7_0:addElement(var_7_8)

	var_7_0.Title = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "Image"

	var_7_10:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_7_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 130, _1080p * 642, _1080p * -224, _1080p * 32)
	var_7_0:addElement(var_7_10)

	var_7_0.Image = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIStyledText.new()

	var_7_12.id = "Message"

	var_7_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_7_12:setText("", 0)
	var_7_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_7_12:SetAlignment(LUI.Alignment.Left)
	var_7_12:SetTintFontIcons(true)
	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 587, _1080p * -203, _1080p * -173)
	var_7_0:addElement(var_7_12)

	var_7_0.Message = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("GenericCheckBoxButton", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "AcceptPolicy"

	var_7_14.Fill:SetRGBFromInt(10201779, 0)
	var_7_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 720, _1080p * 749, _1080p * -51, _1080p * -23)
	var_7_0:addElement(var_7_14)

	var_7_0.AcceptPolicy = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "ConfirmButton"

	var_7_16.Text:SetLeft(_1080p * 20, 0)
	var_7_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW")), 0)
	var_7_16.Text:SetAlignment(LUI.Alignment.Center)
	var_7_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 720, _1080p * 886, _1080p * 47, _1080p * 85)
	var_7_0:addElement(var_7_16)

	var_7_0.ConfirmButton = var_7_16

	local var_7_17
	local var_7_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_18.id = "CancelButton"

	var_7_18.Text:SetLeft(_1080p * 20, 0)
	var_7_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CANCEL")), 0)
	var_7_18.Text:SetAlignment(LUI.Alignment.Center)
	var_7_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 914, _1080p * 1080, _1080p * 47, _1080p * 85)
	var_7_0:addElement(var_7_18)

	var_7_0.CancelButton = var_7_18

	local var_7_19
	local var_7_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_20.id = "TermsButton"

	var_7_20.Text:SetLeft(_1080p * 20, 0)
	var_7_20.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/STORE_TERMS_OF_USE")), 0)
	var_7_20.Text:SetAlignment(LUI.Alignment.Center)
	var_7_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 1192, _1080p * 1360, _1080p * 47, _1080p * 85)
	var_7_0:addElement(var_7_20)

	var_7_0.TermsButton = var_7_20

	local var_7_21
	local var_7_22 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_22.id = "RefundPolicyButton"

	var_7_22.Text:SetLeft(_1080p * 20, 0)
	var_7_22.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/STORE_REFUND_POLICY")), 0)
	var_7_22.Text:SetAlignment(LUI.Alignment.Center)
	var_7_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 1388, _1080p * 1554, _1080p * 47, _1080p * 85)
	var_7_0:addElement(var_7_22)

	var_7_0.RefundPolicyButton = var_7_22

	local var_7_23
	local var_7_24 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_7_1
	})

	var_7_24.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_7_0) then
		var_7_24.Label:setText("Back/Select", 0)
	end

	var_7_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 155, _1080p * 255, _1080p * 147, _1080p * 178)
	var_7_0:addElement(var_7_24)

	var_7_0.Prompts = var_7_24

	local var_7_25
	local var_7_26 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_7_1
	})

	var_7_26.id = "PlayerDetails"

	var_7_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
	var_7_0:addElement(var_7_26)

	var_7_0.PlayerDetails = var_7_26

	local var_7_27
	local var_7_28 = LUI.UIText.new()

	var_7_28.id = "ServiceDuration"

	var_7_28:SetRGBFromTable(SWATCHES.genericMenu.progressBackground, 0)
	var_7_28:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE_DURATION_OF_SERVICE"), 0)
	var_7_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_28:SetAlignment(LUI.Alignment.Left)
	var_7_28:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 720, _1080p * 1547, _1080p * -135, _1080p * -115)
	var_7_0:addElement(var_7_28)

	var_7_0.ServiceDuration = var_7_28

	local var_7_29
	local var_7_30 = LUI.UIText.new()

	var_7_30.id = "RefundPolicy"

	var_7_30:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_7_30:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE_KOREA_REFOUND_POLICY"), 0)
	var_7_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_30:SetAlignment(LUI.Alignment.Left)
	var_7_30:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 756, _1080p * 1547, _1080p * -52, _1080p * -34)
	var_7_0:addElement(var_7_30)

	var_7_0.RefundPolicy = var_7_30

	local function var_7_31()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_31

	local var_7_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 536
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 222
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -267
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		}
	}

	var_7_10:RegisterAnimationSequence("BattlepassTier", var_7_32)

	local function var_7_33()
		var_7_10:AnimateSequence("BattlepassTier")
	end

	var_7_0._sequences.BattlepassTier = var_7_33

	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK"),
		container = var_7_24
	})
	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 2,
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT"),
		container = var_7_24
	})

	local var_7_34 = LUI.UIBindButton.new()

	var_7_34.id = "selfBindButton"

	var_7_0:addElement(var_7_34)

	var_7_0.bindButton = var_7_34

	var_7_0.bindButton:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_7_1
		end

		ACTIONS.LeaveMenu(var_7_0)
	end)
	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("StoreConfirmPurchaseKoreaLegalPupup", StoreConfirmPurchaseKoreaLegalPupup)
LockTable(_M)
