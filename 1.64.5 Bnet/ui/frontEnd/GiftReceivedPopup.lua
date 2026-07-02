module(..., package.seeall)

local function var_0_0(arg_1_0)
	Engine.CEJJDJJHIJ(arg_1_0._controllerIndex, "dlog_event_gifting_received", {
		comms_assignment_id = arg_1_0._giftData.gift_category,
		transaction_id = arg_1_0._giftData.transaction_id,
		button_pressed = arg_1_0._giftData.buttonPressed
	})
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1

	local var_2_0 = arg_2_2.giftData

	arg_2_0._giftData = var_2_0

	local var_2_1 = var_2_0.gift_title

	arg_2_0._isBattlepass = var_2_0.gift_category == GIFT.CATEGORY_BATTLEPASS

	local var_2_2 = SEASON.GetCurrentSeasonDisplayNum()
	local var_2_3 = Engine.CBBHFCGDIC("LUA_MENU_ZULU/GIFT_RECEIVED_FROM_X", Engine.JCBDICCAH(var_2_0.gifter_username))

	arg_2_0.GiftFrom:setText(var_2_3)

	local var_2_4 = var_2_0.gift_sku
	local var_2_5 = LOOT.GetTypeForID(var_2_4)
	local var_2_6 = LOOT.GetItemRef(var_2_5, var_2_4)
	local var_2_7 = LOOT.GetItemImage(var_2_5, var_2_6, var_2_4)
	local var_2_8 = "battlepass_season_emblem"

	if arg_2_0._isBattlepass then
		var_2_1 = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/SEASON_X_BATTLEPASS", var_2_2))
	else
		local var_2_9 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_2_4, CSV.bundleIDs.cols.name)

		var_2_8 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_2_4, CSV.bundleIDs.cols.titleImage)

		if var_2_9 and #var_2_9 > 0 then
			var_2_1 = Engine.CBBHFCGDIC(var_2_9)
		end

		ACTIONS.AnimateSequence(arg_2_0, "BundleGiftSetup")
	end

	if var_2_8 and var_2_8 == "" then
		assert(false, "GiftReceivedPopup - PostLoadFunc - Invalid gift image : " .. tostring(var_2_8))

		var_2_8 = "white"
	end

	arg_2_0.Description:setText(var_2_1)
	arg_2_0.Image:setImage(RegisterMaterial(var_2_8))
	Gifting.ECGIEJBHFC(arg_2_1, arg_2_0._giftData.gift_sku)
	arg_2_0.AcceptButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		local var_3_0 = LUI.FlowManager.GetScopedData("MainMenu")

		if arg_2_0._isBattlepass then
			GIFT.ProcessQueuedBattlepassGifts(arg_3_1.controller)

			var_3_0.ShouldHandleGiftBattlePass = true

			if GIFT.IsInBattlePassTab(arg_3_0, arg_3_1) then
				arg_2_0:dispatchEventToRoot({
					dispatchChildren = true,
					name = "claim_pending_bp_purchase_gift",
					immediate = true
				})
				GIFT.FocusBattlePassTab(arg_3_0, arg_3_1)
			end
		else
			GIFT.ProcessQueuedBundleGifts(arg_3_1.controller)

			var_3_0.ShouldHandleGiftBundle = true
		end

		arg_2_0._giftData.buttonPressed = arg_2_0.AcceptButton.id

		var_0_0(arg_2_0)
		ACTIONS.LeaveMenu(arg_2_0)
	end)
	arg_2_0.AcceptAndViewButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		local var_4_0 = LUI.FlowManager.GetScopedData("MainMenu")

		if arg_2_0._isBattlepass then
			var_4_0.ShouldHandleGiftBattlePass = true

			arg_2_0:dispatchEventToRoot({
				dispatchChildren = true,
				name = "claim_pending_bp_purchase_gift",
				immediate = true
			})
			GIFT.FocusBattlePassTab(arg_4_0, arg_4_1)
		else
			var_4_0.ShouldHandleGiftBundle = true

			local var_4_1 = {
				bundleID = var_2_0.gift_sku,
				currencyID = LOOT.CurrencyIDs.COD_POINTS
			}

			LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_2_1, false, var_4_1)
		end

		arg_2_0._giftData.buttonPressed = arg_2_0.AcceptAndViewButton.id

		var_0_0(arg_2_0)
		ACTIONS.LeaveMenu(arg_2_0)
	end)
end

function GiftReceivedPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalNavigator.new()

	var_5_0.id = "GiftReceivedPopup"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Darkener"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_4:SetAlpha(0.8, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "GenericPopupWindow"

	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -182, _1080p * 182)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericPopupWindow = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "ButtonHelperBar"

	var_5_8.Background:SetAlpha(0, 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 182, _1080p * 242)
	var_5_0:addElement(var_5_8)

	var_5_0.ButtonHelperBar = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIText.new()

	var_5_10.id = "Title"

	var_5_10:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_5_10:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_ZULU/GIFT_RECEIVED_TITLE")), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -144, _1080p * -84)
	var_5_0:addElement(var_5_10)

	var_5_0.Title = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Image"

	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 330, _1080p * 586, _1080p * 412, _1080p * 668)
	var_5_0:addElement(var_5_12)

	var_5_0.Image = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "AcceptAndViewButton"

	var_5_14:SetButtonDisabled(false)
	var_5_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_ZULU/ACCEPT_GIFT_AND_VIEW")), 0)
	var_5_14.Text:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 244, _1080p * 88, _1080p * 126)
	var_5_0:addElement(var_5_14)

	var_5_0.AcceptAndViewButton = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "AcceptButton"

	var_5_16:SetButtonDisabled(false)
	var_5_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_ZULU/ACCEPT_GIFT")), 0)
	var_5_16.Text:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 244, _1080p * 38, _1080p * 76)
	var_5_0:addElement(var_5_16)

	var_5_0.AcceptButton = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIStyledText.new()

	var_5_18.id = "Description"

	var_5_18:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_5_18:setText("", 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_18:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -72, _1080p * -36)
	var_5_0:addElement(var_5_18)

	var_5_0.Description = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIStyledText.new()

	var_5_20.id = "GiftFrom"

	var_5_20:SetRGBFromTable(SWATCHES.CH2.WZFenceMessage, 0)
	var_5_20:setText("", 0)
	var_5_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_20:SetAlignment(LUI.Alignment.Left)
	var_5_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -15, _1080p * 15)
	var_5_0:addElement(var_5_20)

	var_5_0.GiftFrom = var_5_20

	local function var_5_21()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_21

	local var_5_22
	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 679
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 167
		},
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_12:RegisterAnimationSequence("BundleGiftSetup", var_5_23)

	local var_5_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("BundleGiftSetup", var_5_24)

	local function var_5_25()
		var_5_12:AnimateSequence("BundleGiftSetup")
		var_5_16:AnimateSequence("BundleGiftSetup")
	end

	var_5_0._sequences.BundleGiftSetup = var_5_25

	function var_5_8.addButtonHelperFunction(arg_8_0, arg_8_1)
		arg_8_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	local var_5_26 = LUI.UIBindButton.new()

	var_5_26.id = "ButtonHelperBarBindButton"

	var_5_8:addElement(var_5_26)

	var_5_8.bindButton = var_5_26

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("GiftReceivedPopup", GiftReceivedPopup)
LockTable(_M)
