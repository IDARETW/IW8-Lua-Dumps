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
				isCollect = true
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
		Loot.HAJHHFGJJ(arg_2_0._controllerIndex, var_2_0, false)
	else
		assert(false, "Missing gift id while attempting to collect free gift")
		LUI.FlowManager.RequestLeaveMenu(arg_2_0, true)
		var_0_0(arg_2_0)
	end
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._controllerIndex = arg_5_1

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

	arg_5_0.Description:setText(Engine.CBBHFCGDIC("BATTLEPASS/VIP_GIFT_DESCRIPTION", var_5_4, var_5_5))
	arg_5_0.ButtonCollect:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		var_0_1(arg_5_0)
	end)
	arg_5_0.ButtonUpsell:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_7_1.controller, false, {
			purchaseBattlePassInVIPGift = true
		}, true)
	end)
	arg_5_0.bindButton:registerEventHandler("button_alt2", function(arg_8_0, arg_8_1)
		LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_8_1.controller, false, {
			purchaseBattlePassInVIPGift = true,
			useOnboarding = true
		}, true)
	end)

	if BATTLEPASS.IsOwned(arg_5_1) then
		arg_5_0:addEventHandler("menu_create", function(arg_9_0, arg_9_1)
			LUI.FlowManager.RequestPopupMenu(nil, "BattlePassRewardPopup", true, arg_5_1, true, {
				purchasedBattlePassVIPGift = true,
				isBPVIPGift = true
			}, nil, false, false)
		end)
	end

	ACTIONS.ScaleFullscreen(arg_5_0.Background)
end

function BattlePassVIPGiftUpsell(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIVerticalNavigator.new()

	var_10_0.id = "BattlePassVIPGiftUpsell"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Background"

	var_10_4:SetRGBFromInt(0, 0)
	var_10_4:SetAlpha(0.9, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Background = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("BattlePassPopupWindow", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "BattlePassPopupWindow"

	var_10_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 846, _1080p * -353, _1080p * 449)
	var_10_0:addElement(var_10_6)

	var_10_0.BattlePassPopupWindow = var_10_6

	local var_10_7

	if CONDITIONS.IsUserSignedInDemonware(var_10_1) then
		local var_10_8 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_10_1
		})

		var_10_8.id = "MPPlayerDetails"

		var_10_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_10_0:addElement(var_10_8)

		var_10_0.MPPlayerDetails = var_10_8
	end

	local var_10_9
	local var_10_10 = LUI.UIText.new()

	var_10_10.id = "Title"

	var_10_10:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_10_10:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/THANKS_FOR_PLAYING")), 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_10_10:SetAlignment(LUI.Alignment.Left)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * 364, _1080p * -324, _1080p * -264)
	var_10_0:addElement(var_10_10)

	var_10_0.Title = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIStyledText.new()

	var_10_12.id = "Description"

	var_10_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_12:setText(Engine.CBBHFCGDIC("BATTLEPASS/VIP_GIFT_DESCRIPTION"), 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_12:SetAlignment(LUI.Alignment.Left)
	var_10_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_10_12:SetStartupDelay(1000)
	var_10_12:SetLineHoldTime(400)
	var_10_12:SetAnimMoveTime(1000)
	var_10_12:SetAnimMoveSpeed(150)
	var_10_12:SetEndDelay(1000)
	var_10_12:SetCrossfadeTime(1000)
	var_10_12:SetFadeInTime(300)
	var_10_12:SetFadeOutTime(300)
	var_10_12:SetMaxVisibleLines(10)
	var_10_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * -195, _1080p * -233, _1080p * -203)
	var_10_0:addElement(var_10_12)

	var_10_0.Description = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "ButtonUpsell"

	var_10_14.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/BECOME_BP_OWNER"), 0)
	var_10_14.Text:SetAlignment(LUI.Alignment.Center)
	var_10_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * -195, _1080p * 167, _1080p * 303)
	var_10_0:addElement(var_10_14)

	var_10_0.ButtonUpsell = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "ButtonCollect"

	var_10_16.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/COLLECT_GIFT"), 0)
	var_10_16.Text:SetAlignment(LUI.Alignment.Center)
	var_10_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * -195, _1080p * 320, _1080p * 358)
	var_10_0:addElement(var_10_16)

	var_10_0.ButtonCollect = var_10_16

	local var_10_17
	local var_10_18 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_18.id = "BackerFree"

	var_10_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -132, _1080p * 780, _1080p * -332, 0)
	var_10_0:addElement(var_10_18)

	var_10_0.BackerFree = var_10_18

	local var_10_19
	local var_10_20 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_20.id = "BackerOwner"

	var_10_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -132, _1080p * 780, _1080p * 26, _1080p * 358)
	var_10_0:addElement(var_10_20)

	var_10_0.BackerOwner = var_10_20

	local var_10_21
	local var_10_22 = LUI.UIImage.new()

	var_10_22.id = "SeasonImageFree"

	var_10_22:setImage(RegisterMaterial("battlepass_s04_emblem_silver"), 0)
	var_10_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -81, _1080p * 119, _1080p * -303, _1080p * -103)
	var_10_0:addElement(var_10_22)

	var_10_0.SeasonImageFree = var_10_22

	local var_10_23
	local var_10_24 = LUI.UIImage.new()

	var_10_24.id = "SeasonImageOwner"

	var_10_24:setImage(RegisterMaterial("battlepass_s04_emblem_gold"), 0)
	var_10_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -81, _1080p * 119, _1080p * 58, _1080p * 258)
	var_10_0:addElement(var_10_24)

	var_10_0.SeasonImageOwner = var_10_24

	local var_10_25
	local var_10_26 = LUI.UIText.new()

	var_10_26.id = "LabelNonBP"

	var_10_26:setText(Engine.CBBHFCGDIC("BATTLEPASS/NON_BATTLE_PASS"), 0)
	var_10_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_26:SetAlignment(LUI.Alignment.Center)
	var_10_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -81, _1080p * 119, _1080p * -91, _1080p * -67)
	var_10_0:addElement(var_10_26)

	var_10_0.LabelNonBP = var_10_26

	local var_10_27
	local var_10_28 = LUI.UIText.new()

	var_10_28.id = "LabelBP"

	var_10_28:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLE_PASS"), 0)
	var_10_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_28:SetAlignment(LUI.Alignment.Center)
	var_10_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -81, _1080p * 119, _1080p * 270, _1080p * 294)
	var_10_0:addElement(var_10_28)

	var_10_0.LabelBP = var_10_28

	local var_10_29
	local var_10_30 = LUI.UIText.new()

	var_10_30.id = "LabelOwnersFree"

	var_10_30:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_10_30:setText(Engine.CBBHFCGDIC("BATTLEPASS/OWNERS"), 0)
	var_10_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_30:SetAlignment(LUI.Alignment.Center)
	var_10_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -81, _1080p * 119, _1080p * -67, _1080p * -31)
	var_10_0:addElement(var_10_30)

	var_10_0.LabelOwnersFree = var_10_30

	local var_10_31
	local var_10_32 = LUI.UIText.new()

	var_10_32.id = "LabelOwnersOwner"

	var_10_32:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_10_32:setText(Engine.CBBHFCGDIC("BATTLEPASS/OWNERS"), 0)
	var_10_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_32:SetAlignment(LUI.Alignment.Center)
	var_10_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -81, _1080p * 119, _1080p * 294, _1080p * 330)
	var_10_0:addElement(var_10_32)

	var_10_0.LabelOwnersOwner = var_10_32

	local var_10_33
	local var_10_34 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_10_1
	})

	var_10_34.id = "LootFree"

	var_10_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 168, _1080p * 368, _1080p * -303, _1080p * -36)
	var_10_0:addElement(var_10_34)

	var_10_0.LootFree = var_10_34

	local var_10_35
	local var_10_36 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_10_1
	})

	var_10_36.id = "LootOwner1"

	var_10_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 168, _1080p * 368, _1080p * 58, _1080p * 322)
	var_10_0:addElement(var_10_36)

	var_10_0.LootOwner1 = var_10_36

	local var_10_37
	local var_10_38 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_10_1
	})

	var_10_38.id = "LootOwner2"

	var_10_38:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 514, _1080p * 714, _1080p * 58, _1080p * 326)
	var_10_0:addElement(var_10_38)

	var_10_0.LootOwner2 = var_10_38

	local var_10_39
	local var_10_40 = LUI.UIImage.new()

	var_10_40.id = "IconPlus"

	var_10_40:setImage(RegisterMaterial("icon_plus"), 0)
	var_10_40:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 424, _1080p * 452, _1080p * 188, _1080p * 216)
	var_10_0:addElement(var_10_40)

	var_10_0.IconPlus = var_10_40

	local var_10_41
	local var_10_42 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_10_1
	})

	var_10_42.id = "Spinner"

	var_10_42:SetAlpha(0, 0)
	var_10_42:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -669, _1080p * -328, _1080p * 375, _1080p * 385)
	var_10_0:addElement(var_10_42)

	var_10_0.Spinner = var_10_42

	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt2",
		helper_text = Engine.CBBHFCGDIC("BATTLEPASS/WHAT_IS_IT")
	})

	local var_10_43 = LUI.UIBindButton.new()

	var_10_43.id = "selfBindButton"

	var_10_0:addElement(var_10_43)

	var_10_0.bindButton = var_10_43

	var_0_2(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("BattlePassVIPGiftUpsell", BattlePassVIPGiftUpsell)
LockTable(_M)
