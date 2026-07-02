module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = BATTLEPASS.IsOwned(arg_1_0._controllerIndex) and "BATTLEPASS/OWNERS_GIFT" or "BATTLEPASS/THANK_YOU_GIFT"
	local var_1_1 = {
		title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message = Engine.CBBHFCGDIC("BATTLEPASS/VIP_ERROR_COLLECTING", var_1_0)
	}

	LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_1_0._controllerIndex, false, var_1_1, nil, false, true)
end

local function var_0_1(arg_2_0)
	arg_2_0.ButtonCollect:SetButtonDisabled(true)
	arg_2_0.ButtonUpsell:SetButtonDisabled(true)
	arg_2_0.Spinner:SetAlpha(1)

	local var_2_0 = Dvar.CFHDGABACF("LTOQKNQLNP")

	if var_2_0 and var_2_0 > 0 then
		arg_2_0:addEventHandler("loot_item_transaction_complete", function(arg_3_0, arg_3_1)
			LUI.FlowManager.RequestLeaveMenu(arg_3_0, true)
			LUI.FlowManager.RequestAddMenu("StoreFullScreenCinematic", true, arg_2_0._controllerIndex, false, {
				isVIP = true,
				isPremium = false
			}, true)
		end)
		arg_2_0:addEventHandler("loot_item_transaction_error", function(arg_4_0, arg_4_1)
			if arg_4_1.errorCode == STORE.ProductNoLongerAvailableError then
				LUI.FlowManager.RequestPopupMenu(nil, "ProductNoLongerAvailableErrorPopup", true, arg_2_0._controllerIndex, true)
			else
				DebugPrint("Error during transaction with free gift id: " .. var_2_0)
				LUI.FlowManager.RequestLeaveMenu(arg_4_0, true)
				var_0_0(arg_2_0)
			end
		end)
		DebugPrint("Attempting to purchase free gift with controller:" .. tostring(arg_2_0._controllerIndex))
		DebugPrint("Attempting to purchase free gift with id:" .. tostring(var_2_0))
		Loot.HAJHHFGJJ(arg_2_0._controllerIndex, var_2_0)
	else
		assert(false, "Missing gift id while attempting to collect free gift")
		LUI.FlowManager.RequestLeaveMenu(arg_2_0, true)
		var_0_0(arg_2_0)
	end
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0._currentSeason = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	if arg_5_0._currentSeason then
		ACTIONS.AnimateSequence(arg_5_0, "S5")
	end

	local var_5_0 = BATTLEPASS.GetVIPFreeGifts(arg_5_1)

	if var_5_0 and var_5_0[1] then
		arg_5_0.LootFree:UpdateCardConfig(var_5_0[1])
	end

	local var_5_1 = BATTLEPASS.GetVIPOwnerGifts(arg_5_1)

	if var_5_1 then
		if var_5_1[1] then
			arg_5_0.LootOwner1:UpdateCardConfig(var_5_1[1])
		end

		if var_5_1[2] then
			arg_5_0.LootOwner2:UpdateCardConfig(var_5_1[2])
		end
	end

	ACTIONS.AnimateSequence(arg_5_0.LootItemCardFlare, "SpecialItemHighlight")
	ACTIONS.AnimateSequence(arg_5_0.BattlePassPopupWindow, "VIP")
	ACTIONS.AnimateSequence(arg_5_0.ButtonCollect, "LowGlow")
	ACTIONS.AnimateSequence(arg_5_0.ButtonUpsell, "ButtonUpGlint")
	ACTIONS.AnimateSequence(arg_5_0.ButtonUpsell, "LowGlow")
	ACTIONS.AnimateSequence(arg_5_0.ButtonUpsell, "Glint")
	ACTIONS.AnimateSequence(arg_5_0.ButtonUpsell, "VIPButton")

	local var_5_2 = BATTLEPASS.GetEmblemSilver()

	if var_5_2 and #var_5_2 > 0 then
		arg_5_0.SeasonImageFree:setImage(RegisterMaterial(var_5_2))
	else
		arg_5_0.SeasonImageFree:SetAlpha(0)
	end

	local var_5_3 = BATTLEPASS.GetEmblemGold()

	if var_5_3 and #var_5_3 > 0 then
		arg_5_0.SeasonImageOwner:setImage(RegisterMaterial(var_5_3))
	else
		arg_5_0.SeasonImageOwner:SetAlpha(0)
	end

	local var_5_4 = Engine.JCBDICCAH(tostring(BATTLEPASS.GetMaxTier()))
	local var_5_5 = Engine.JCBDICCAH(tostring(BATTLEPASS.GetCodPointsInPass()))
	local var_5_6 = {
		{
			text = "BATTLEPASS/VIP_REWARD_1",
			extra = var_5_4
		},
		{
			text = "BATTLEPASS/VIP_REWARD_2",
			extra = var_5_5
		}
	}

	arg_5_0.GiftList:SetupBullets(arg_5_1, var_5_6, false)
	arg_5_0.ButtonUpsell:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_5_0.ButtonUpsell, "ButtonUpGlint")
	end)
	arg_5_0.ButtonUpsell:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_5_0.ButtonUpsell, "ButtonOverGlint")
	end)
	arg_5_0.ButtonCollect:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		BATTLEPASS.RecordVIPGiftEvent(arg_5_1, "collect_free_gift", arg_5_0, -1, false)
		var_0_1(arg_5_0)
	end)
	arg_5_0.ButtonUpsell:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		BATTLEPASS.RecordVIPGiftEvent(arg_5_1, "become_bp_owner", arg_5_0, -1, false)
		LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_9_1.controller, false, {
			purchaseBattlePassInVIPGift = true
		}, true)
	end)
	arg_5_0.bindButton:registerEventHandler("button_alt2", function(arg_10_0, arg_10_1)
		LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_10_1.controller, false, {
			purchaseBattlePassInVIPGift = true,
			useOnboarding = true
		}, true)
	end)

	if BATTLEPASS.IsOwned(arg_5_1) then
		arg_5_0:addEventHandler("menu_create", function(arg_11_0, arg_11_1)
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassRewardPopup", true, arg_5_1, true, {
				purchasedBattlePassVIPGift = true,
				isBPVIPGift = true
			}, nil, false, false)
		end)
	end

	arg_5_0:addElement(LOOT.GetLootFlareMaterialStreamer())
	arg_5_0.LootOwner1:SetFocusable(false)
	arg_5_0.LootOwner2:SetFocusable(false)
	arg_5_0.LootFree:SetFocusable(false)
	ACTIONS.ScaleFullscreen(arg_5_0.Background)
end

function BattlePassVIPGiftUpsell(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIVerticalNavigator.new()

	var_12_0.id = "BattlePassVIPGiftUpsell"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	var_12_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_12_1
	})
	var_12_0.HelperBar.id = "HelperBar"

	var_12_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_12_0.HelperBar:setPriority(10)
	var_12_0:addElement(var_12_0.HelperBar)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "Background"

	var_12_4:SetRGBFromInt(0, 0)
	var_12_4:SetAlpha(0.9, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.Background = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("BattlePassPopupWindow", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "BattlePassPopupWindow"

	var_12_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 846, _1080p * -353, _1080p * 449)
	var_12_0:addElement(var_12_6)

	var_12_0.BattlePassPopupWindow = var_12_6

	local var_12_7

	if CONDITIONS.IsUserSignedInDemonware(var_12_1) then
		local var_12_8 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_12_1
		})

		var_12_8.id = "MPPlayerDetails"

		var_12_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_12_0:addElement(var_12_8)

		var_12_0.MPPlayerDetails = var_12_8
	end

	local var_12_9
	local var_12_10 = LUI.UIText.new()

	var_12_10.id = "Title"

	var_12_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_12_10:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/THANKS_FOR_PLAYING")), 0)
	var_12_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_12_10:SetWordWrap(false)
	var_12_10:SetAlignment(LUI.Alignment.Left)
	var_12_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * -195, _1080p * -324, _1080p * -264)
	var_12_0:addElement(var_12_10)

	var_12_0.Title = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIImage.new()

	var_12_12.id = "Sparks"

	var_12_12:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_12_12:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_12_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -132, _1080p * 352, _1080p * 78, _1080p * 398)
	var_12_0:addElement(var_12_12)

	var_12_0.Sparks = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIStyledText.new()

	var_12_14.id = "Description"

	var_12_14:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_12_14:setText(Engine.CBBHFCGDIC("BATTLEPASS/VIP_GIFT_DESCRIPTION"), 0)
	var_12_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_14:SetAlignment(LUI.Alignment.Left)
	var_12_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_12_14:SetStartupDelay(1000)
	var_12_14:SetLineHoldTime(400)
	var_12_14:SetAnimMoveTime(1000)
	var_12_14:SetAnimMoveSpeed(150)
	var_12_14:SetEndDelay(1000)
	var_12_14:SetCrossfadeTime(1000)
	var_12_14:SetFadeInTime(300)
	var_12_14:SetFadeOutTime(300)
	var_12_14:SetMaxVisibleLines(10)
	var_12_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * -195, _1080p * -216, _1080p * -192)
	var_12_0:addElement(var_12_14)

	var_12_0.Description = var_12_14

	local var_12_15
	local var_12_16 = {
		fontSize = "24",
		numericSeparator = "",
		spacing = 4,
		textColor = "SWATCHES.genericMenu.bodycopy",
		separation = 2,
		listType = 1,
		bulletColor = "SWATCHES.BattlePass.BRVIPGold",
		bulletScale = 0.5,
		controllerIndex = var_12_1
	}
	local var_12_17 = MenuBuilder.BuildRegisteredType("BulletList", var_12_16)

	var_12_17.id = "GiftList"

	var_12_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * -195, _1080p * -49, _1080p * -31)
	var_12_0:addElement(var_12_17)

	var_12_0.GiftList = var_12_17

	local var_12_18
	local var_12_19 = LUI.UIStyledText.new()

	var_12_19.id = "GiftListTitle"

	var_12_19:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_12_19:SetAlpha(0.8, 0)
	var_12_19:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLE_PASS_OWNER_PERKS"), 0)
	var_12_19:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_19:SetAlignment(LUI.Alignment.Left)
	var_12_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_12_19:SetStartupDelay(1000)
	var_12_19:SetLineHoldTime(400)
	var_12_19:SetAnimMoveTime(1000)
	var_12_19:SetAnimMoveSpeed(150)
	var_12_19:SetEndDelay(1000)
	var_12_19:SetCrossfadeTime(1000)
	var_12_19:SetFadeInTime(300)
	var_12_19:SetFadeOutTime(300)
	var_12_19:SetMaxVisibleLines(10)
	var_12_19:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * -195, _1080p * -82, _1080p * -58)
	var_12_0:addElement(var_12_19)

	var_12_0.GiftListTitle = var_12_19

	local var_12_20
	local var_12_21 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_12_1
	})

	var_12_21.id = "ButtonUpsell"

	var_12_21.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/BECOME_BP_OWNER"), 0)
	var_12_21.Text:SetAlignment(LUI.Alignment.Center)
	var_12_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * -195, _1080p * 203, _1080p * 303)
	var_12_0:addElement(var_12_21)

	var_12_0.ButtonUpsell = var_12_21

	local var_12_22
	local var_12_23 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_12_1
	})

	var_12_23.id = "ButtonCollect"

	var_12_23.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/COLLECT_GIFT"), 0)
	var_12_23.Text:SetAlignment(LUI.Alignment.Center)
	var_12_23:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * -195, _1080p * 318, _1080p * 366)
	var_12_0:addElement(var_12_23)

	var_12_0.ButtonCollect = var_12_23

	local var_12_24
	local var_12_25 = LUI.UIImage.new()

	var_12_25.id = "BackerOwner"

	var_12_25:SetRGBFromTable(SWATCHES.CH2.CH2SeasonFreeBanner, 0)
	var_12_25:SetAlpha(0.3, 0)
	var_12_25:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_12_25:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -132, _1080p * 778, _1080p * 76, _1080p * 398)
	var_12_0:addElement(var_12_25)

	var_12_0.BackerOwner = var_12_25

	local var_12_26
	local var_12_27 = LUI.UIImage.new()

	var_12_27.id = "OwnerLine"

	var_12_27:SetRGBFromTable(SWATCHES.CH2.CH2SeasonFreeBanner, 0)
	var_12_27:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_12_27:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -132, _1080p * 778, _1080p * 76, _1080p * 78)
	var_12_0:addElement(var_12_27)

	var_12_0.OwnerLine = var_12_27

	local var_12_28
	local var_12_29 = LUI.UIImage.new()

	var_12_29.id = "BackerFree"

	var_12_29:SetRGBFromTable(SWATCHES.BattlePass.BRVIPDarkGray, 0)
	var_12_29:SetAlpha(0.65, 0)
	var_12_29:SetPixelGridEnabled(true)
	var_12_29:SetPixelGridContrast(0.5, 0)
	var_12_29:SetPixelGridBlockWidth(2, 0)
	var_12_29:SetPixelGridBlockHeight(2, 0)
	var_12_29:SetPixelGridGutterWidth(1, 0)
	var_12_29:SetPixelGridGutterHeight(1, 0)
	var_12_29:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_12_29:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -132, _1080p * 778, _1080p * -264, _1080p * 57)
	var_12_0:addElement(var_12_29)

	var_12_0.BackerFree = var_12_29

	local var_12_30
	local var_12_31 = LUI.UIImage.new()

	var_12_31.id = "FreeLine"

	var_12_31:SetRGBFromTable(SWATCHES.CH2.CH2SeasonFreeBanner, 0)
	var_12_31:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_12_31:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -132, _1080p * 778, _1080p * -264, _1080p * -262)
	var_12_0:addElement(var_12_31)

	var_12_0.FreeLine = var_12_31

	local var_12_32
	local var_12_33 = LUI.UIImage.new()

	var_12_33.id = "SeasonImageFree"

	var_12_33:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 160, _1080p * -231, _1080p * -31)
	var_12_0:addElement(var_12_33)

	var_12_0.SeasonImageFree = var_12_33

	local var_12_34
	local var_12_35 = LUI.UIImage.new()

	var_12_35.id = "SeasonImageOwner"

	var_12_35:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 160, _1080p * 103, _1080p * 303)
	var_12_0:addElement(var_12_35)

	var_12_0.SeasonImageOwner = var_12_35

	local var_12_36
	local var_12_37 = LUI.UIText.new()

	var_12_37.id = "LabelNonBP"

	var_12_37:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_12_37:SetAlpha(0.5, 0)
	var_12_37:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/NON_BATTLE_PASS")), 0)
	var_12_37:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_37:SetWordWrap(false)
	var_12_37:SetAlignment(LUI.Alignment.Center)
	var_12_37:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -96, _1080p * 216, _1080p * -14, _1080p * 10)
	var_12_0:addElement(var_12_37)

	var_12_0.LabelNonBP = var_12_37

	local var_12_38
	local var_12_39 = LUI.UIText.new()

	var_12_39.id = "LabelBP"

	var_12_39:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_12_39:SetAlpha(0.5, 0)
	var_12_39:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BATTLE_PASS")), 0)
	var_12_39:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_39:SetWordWrap(false)
	var_12_39:SetAlignment(LUI.Alignment.Center)
	var_12_39:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -98, _1080p * 218, _1080p * 323, _1080p * 347)
	var_12_0:addElement(var_12_39)

	var_12_0.LabelBP = var_12_39

	local var_12_40
	local var_12_41 = LUI.UIImage.new()

	var_12_41.id = "ItemTextBackerFree"

	var_12_41:SetRGBFromTable(SWATCHES.text.overText, 0)
	var_12_41:SetAlpha(0.4, 0)
	var_12_41:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 252, _1080p * 452, _1080p * 20, _1080p * 47)
	var_12_0:addElement(var_12_41)

	var_12_0.ItemTextBackerFree = var_12_41

	local var_12_42
	local var_12_43 = LUI.UIImage.new()

	var_12_43.id = "ItemTextBacker1"

	var_12_43:SetRGBFromTable(SWATCHES.text.overText, 0)
	var_12_43:SetAlpha(0.4, 0)
	var_12_43:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 252, _1080p * 452, _1080p * 357, _1080p * 384)
	var_12_0:addElement(var_12_43)

	var_12_0.ItemTextBacker1 = var_12_43

	local var_12_44
	local var_12_45 = LUI.UIImage.new()

	var_12_45.id = "ItemTextBacker2"

	var_12_45:SetRGBFromTable(SWATCHES.text.overText, 0)
	var_12_45:SetAlpha(0.4, 0)
	var_12_45:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 555, _1080p * 755, _1080p * 356, _1080p * 384)
	var_12_0:addElement(var_12_45)

	var_12_0.ItemTextBacker2 = var_12_45

	local var_12_46
	local var_12_47 = LUI.UIText.new()

	var_12_47.id = "LabelOwnersFree"

	var_12_47:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_12_47:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/OWNERS")), 0)
	var_12_47:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_47:SetAlignment(LUI.Alignment.Center)
	var_12_47:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 160, _1080p * 9, _1080p * 39)
	var_12_0:addElement(var_12_47)

	var_12_0.LabelOwnersFree = var_12_47

	local var_12_48
	local var_12_49 = LUI.UIText.new()

	var_12_49.id = "LabelOwnersOwner"

	var_12_49:SetRGBFromTable(SWATCHES.CH2.CH2SeasonFreeBanner, 0)
	var_12_49:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/OWNERS")), 0)
	var_12_49:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_49:SetAlignment(LUI.Alignment.Center)
	var_12_49:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 160, _1080p * 345, _1080p * 375)
	var_12_0:addElement(var_12_49)

	var_12_0.LabelOwnersOwner = var_12_49

	local var_12_50
	local var_12_51 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_12_1
	})

	var_12_51.id = "LootOwner1"

	var_12_51:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 555, _1080p * 755, _1080p * 88, _1080p * 357)
	var_12_0:addElement(var_12_51)

	var_12_0.LootOwner1 = var_12_51

	local var_12_52
	local var_12_53 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_12_1
	})

	var_12_53.id = "LootOwner2"

	var_12_53:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 252, _1080p * 452, _1080p * 88, _1080p * 357)
	var_12_0:addElement(var_12_53)

	var_12_0.LootOwner2 = var_12_53

	local var_12_54
	local var_12_55 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_12_1
	})

	var_12_55.id = "LootFree"

	var_12_55:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 252, _1080p * 452, _1080p * -248, _1080p * 20)
	var_12_0:addElement(var_12_55)

	var_12_0.LootFree = var_12_55

	local var_12_56
	local var_12_57 = LUI.UIText.new()

	var_12_57.id = "Plus"

	var_12_57:SetRGBFromTable(SWATCHES.BattlePass.BRVIPGold, 0)
	var_12_57:setText("+", 0)
	var_12_57:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_57:SetAlignment(LUI.Alignment.Center)
	var_12_57:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 474, _1080p * 532, _1080p * 200, _1080p * 250)
	var_12_0:addElement(var_12_57)

	var_12_0.Plus = var_12_57

	local var_12_58
	local var_12_59 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_12_1
	})

	var_12_59.id = "Spinner"

	var_12_59:SetAlpha(0, 0)
	var_12_59:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -669, _1080p * -328, _1080p * 375, _1080p * 385)
	var_12_0:addElement(var_12_59)

	var_12_0.Spinner = var_12_59

	local var_12_60
	local var_12_61 = LUI.UIImage.new()

	var_12_61.id = "OwnerWreath"

	var_12_61:SetAlpha(0.65, 0)
	var_12_61:SetScale(2, 0)
	var_12_61:setImage(RegisterMaterial("bp_vip_wreath"), 0)
	var_12_61:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_12_61:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 124, _1080p * 139, _1080p * 267)
	var_12_0:addElement(var_12_61)

	var_12_0.OwnerWreath = var_12_61

	local var_12_62
	local var_12_63 = MenuBuilder.BuildRegisteredType("LootItemCardFlare", {
		controllerIndex = var_12_1
	})

	var_12_63.id = "LootItemCardFlare"

	var_12_63:SetScale(-0.07, 0)
	var_12_63:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 399, _1080p * 911, _1080p * -8, _1080p * 453)
	var_12_0:addElement(var_12_63)

	var_12_0.LootItemCardFlare = var_12_63

	local function var_12_64()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_64

	local var_12_65
	local var_12_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_sparks")
		}
	}

	var_12_12:RegisterAnimationSequence("S5", var_12_66)

	local function var_12_67()
		var_12_12:AnimateSequence("S5")
	end

	var_12_0._sequences.S5 = var_12_67

	var_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt2",
		helper_text = Engine.CBBHFCGDIC("BATTLEPASS/WHAT_IS_IT")
	})

	local var_12_68 = LUI.UIBindButton.new()

	var_12_68.id = "selfBindButton"

	var_12_0:addElement(var_12_68)

	var_12_0.bindButton = var_12_68

	var_0_2(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("BattlePassVIPGiftUpsell", BattlePassVIPGiftUpsell)
LockTable(_M)
