module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2.bundleGiftInfo

	arg_1_0._recipientXuidString = arg_1_2.recipientXuidString

	local var_1_1 = Friends.HCAFBJBHC(arg_1_1, arg_1_0._recipientXuidString)

	arg_1_0._bundleID = var_1_0.id

	local var_1_2, var_1_3 = STORE.GetBundleCost(arg_1_0._controllerIndex, arg_1_0._bundleID)

	if var_1_3 and var_1_3 < var_1_2 then
		arg_1_0._currencyAmount = var_1_3
	else
		arg_1_0._currencyAmount = var_1_0.currencyAmount
	end

	local var_1_4 = Engine.JCBDICCAH(Engine.CBBHFCGDIC(var_1_0.name))
	local var_1_5 = Engine.CBBHFCGDIC("LUA_MENU_ACTOR/CONFIRM_PURCHASE_BUNDLE_TO_FRIEND_DESC", var_1_4, Engine.JCBDICCAH(var_1_1.gamertag))

	arg_1_0.Description:setText(var_1_5)
	arg_1_0.BundleCost:setText(arg_1_0._currencyAmount)
	arg_1_0.Image:setImage(RegisterMaterial(var_1_0.titleImage))
	arg_1_0.CancelButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.BuyGiftButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		local var_3_0 = Commerce.CEDDCGHIGA(arg_3_1.controller, LOOT.CurrencyIDs.COD_POINTS)

		local function var_3_1(arg_4_0)
			LUI.ToastManager.GetInstance():QueueGiftRecipientXuid(arg_4_0._recipientXuidString)

			local var_4_0 = 1
			local var_4_1 = STORE.GetBundlePurchaseID(arg_1_1, arg_4_0._bundleID)

			Gifting.DAFDBDBEJC(arg_3_1.controller, var_4_1, var_4_0, arg_4_0._recipientXuidString)
		end

		if var_3_0 < arg_1_0._currencyAmount then
			local var_3_2 = {
				showBalance = true,
				controllerIndex = controller,
				currencyID = LOOT.CurrencyIDs.COD_POINTS,
				currencyAmount = arg_1_0._currencyAmount
			}

			STORE.EnterStore(arg_3_1.controller, arg_3_0:GetCurrentMenu().id, arg_3_0.id, var_3_2, "PurchaseCODPointsPopup", true)
		elseif CONDITIONS.ShouldShowTFACodePopup(arg_3_1.controller) then
			local var_3_3 = {
				isGiftingPopup = true,
				originMenu = "GiftBundlePurchaseConfirmationPopup",
				controllerIndex = arg_3_1.controller,
				onSuccess = function()
					var_3_1(arg_1_0)
				end,
				onCancel = function()
					return
				end,
				onError = function()
					return
				end
			}

			LUI.FlowManager.RequestPopupMenu(nil, "GiftingTFAPopup", true, arg_3_1.controller, false, var_3_3, nil, true, true)
		else
			var_3_1(arg_1_0)
		end

		ACTIONS.LeaveMenu(arg_1_0)
	end)
end

function GiftBundlePurchaseConfirmationPopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0.id = "GiftBundlePurchaseConfirmationPopup"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Darkener"

	var_8_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_4:SetAlpha(0.8, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Darkener = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "GenericPopupWindow"

	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -182, _1080p * 182)
	var_8_0:addElement(var_8_6)

	var_8_0.GenericPopupWindow = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "ButtonHelperBar"

	var_8_8.Background:SetAlpha(0, 0)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 182, _1080p * 242)
	var_8_0:addElement(var_8_8)

	var_8_0.ButtonHelperBar = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "Title"

	var_8_10:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_8_10:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/CONFIRM_GIFT_PURCHASE")), 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -144, _1080p * -84)
	var_8_0:addElement(var_8_10)

	var_8_0.Title = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIImage.new()

	var_8_12.id = "Image"

	var_8_12:SetScale(-0.2, 0)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -774, _1080p * -262, _1080p * -128, _1080p * 128)
	var_8_0:addElement(var_8_12)

	var_8_0.Image = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "BuyGiftButton"

	var_8_14:SetButtonDisabled(false)
	var_8_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BUY_GIFT_NOW")), 0)
	var_8_14.Text:SetAlignment(LUI.Alignment.Left)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 244, _1080p * 38, _1080p * 76)
	var_8_0:addElement(var_8_14)

	var_8_0.BuyGiftButton = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "CancelButton"

	var_8_16:SetButtonDisabled(false)
	var_8_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CANCEL")), 0)
	var_8_16.Text:SetAlignment(LUI.Alignment.Left)
	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 244, _1080p * 88, _1080p * 126)
	var_8_0:addElement(var_8_16)

	var_8_0.CancelButton = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIStyledText.new()

	var_8_18.id = "Description"

	var_8_18:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_8_18:setText("", 0)
	var_8_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_18:SetAlignment(LUI.Alignment.Left)
	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -84, _1080p * -54)
	var_8_0:addElement(var_8_18)

	var_8_0.Description = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIStyledText.new()

	var_8_20.id = "BundleCost"

	var_8_20:SetRGBFromTable(SWATCHES.CH2.WZFenceMessage, 0)
	var_8_20:setText("", 0)
	var_8_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_20:SetAlignment(LUI.Alignment.Left)
	var_8_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -190, _1080p * 855, _1080p * -10, _1080p * 20)
	var_8_0:addElement(var_8_20)

	var_8_0.BundleCost = var_8_20

	local var_8_21
	local var_8_22 = LUI.UIImage.new()

	var_8_22.id = "CurrencyImage"

	var_8_22:setImage(RegisterMaterial("icon_currency_codpoints_32x32"), 0)
	var_8_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -236, _1080p * -204, _1080p * -10, _1080p * 22)
	var_8_0:addElement(var_8_22)

	var_8_0.CurrencyImage = var_8_22

	local function var_8_23()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_23

	local var_8_24
	local var_8_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("BundleGiftSetup", var_8_25)

	local function var_8_26()
		var_8_14:AnimateSequence("BundleGiftSetup")
	end

	var_8_0._sequences.BundleGiftSetup = var_8_26

	function var_8_8.addButtonHelperFunction(arg_11_0, arg_11_1)
		arg_11_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	local var_8_27 = LUI.UIBindButton.new()

	var_8_27.id = "ButtonHelperBarBindButton"

	var_8_8:addElement(var_8_27)

	var_8_8.bindButton = var_8_27

	function var_8_0.addButtonHelperFunction(arg_12_0, arg_12_1)
		arg_12_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_8_0:addEventHandler("menu_create", var_8_0.addButtonHelperFunction)

	local var_8_28 = LUI.UIBindButton.new()

	var_8_28.id = "selfBindButton"

	var_8_0:addElement(var_8_28)

	var_8_0.bindButton = var_8_28

	var_8_0.bindButton:addEventHandler("button_secondary", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_8_1
		end

		ACTIONS.LeaveMenu(var_8_0)
	end)
	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("GiftBundlePurchaseConfirmationPopup", GiftBundlePurchaseConfirmationPopup)
LockTable(_M)
