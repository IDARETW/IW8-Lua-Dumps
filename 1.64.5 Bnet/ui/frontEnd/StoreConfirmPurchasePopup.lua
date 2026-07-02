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

	local var_1_1 = true

	if arg_1_2.consumablesCount and arg_1_2.alreadyOwnedCount <= arg_1_2.consumablesCount then
		var_1_1 = false
	end

	if (arg_1_2.showDisclaimer or arg_1_2.alreadyOwnedCount > 0) and var_1_1 then
		ACTIONS.AnimateSequence(arg_1_0, "TierDisclaimer")

		if arg_1_2.showDisclaimer and arg_1_2.alreadyOwnedCount > 0 then
			arg_1_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_OWNED_DISCLAIMER", arg_1_2.alreadyOwnedCount))
		elseif arg_1_2.showDisclaimer then
			arg_1_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_DISCLAIMER"))
		elseif arg_1_2.alreadyOwnedCount > 0 then
			arg_1_0.Disclaimer:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_OWNED_DISCLAIMER", arg_1_2.alreadyOwnedCount))
		end
	end

	local var_1_2 = Engine.CBBHFCGDIC("WZ_TU_TANGO/GAME_ITEM_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")))
	local var_1_3 = Engine.CBBHFCGDIC("WZ_TU_TANGO/GAME_ITEM_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")))
	local var_1_4 = Engine.CBBHFCGDIC("WZ_TU_TANGO/GAME_ITEM_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
	local var_1_5 = Engine.CBBHFCGDIC("WZ_TU_TANGO/GAME_BUNDLE_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")))
	local var_1_6 = Engine.CBBHFCGDIC("WZ_TU_TANGO/GAME_BUNDLE_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")))
	local var_1_7 = Engine.CBBHFCGDIC("WZ_TU_TANGO/GAME_BUNDLE_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
	local var_1_8 = Engine.CBBHFCGDIC("WZ_TU_TANGO/ONE_GAME_EXCLUSIVE_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")))
	local var_1_9 = Engine.CBBHFCGDIC("WZ_TU_TANGO/ONE_GAME_EXCLUSIVE_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")))
	local var_1_10 = Engine.CBBHFCGDIC("WZ_TU_TANGO/ONE_GAME_EXCLUSIVE_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
	local var_1_11 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_W_EXCLUSIVE_ITEM_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")))
	local var_1_12 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_W_EXCLUSIVE_ITEM_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")))
	local var_1_13 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_W_EXCLUSIVE_ITEM_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")))
	local var_1_14 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_W_EXCLUSIVE_ITEM_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")))
	local var_1_15 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_W_EXCLUSIVE_ITEM_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
	local var_1_16 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_W_EXCLUSIVE_ITEM_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
	local var_1_17 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_ITEM_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")))
	local var_1_18 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_ITEM_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
	local var_1_19 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_ITEM_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
	local var_1_20 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")))
	local var_1_21 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
	local var_1_22 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_EXCLUSIVE_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
	local var_1_23 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")))
	local var_1_24 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")))
	local var_1_25 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_GAME_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")))
	local var_1_26 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_OF_FOUR_GAME_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
	local var_1_27 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_OF_FOUR_GAME_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2"))) or var_1_24
	local var_1_28 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_OF_FOUR_GAME_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")))
	local var_1_29 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_OF_FOUR_GAME_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")))
	local var_1_30 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_OF_FOUR_GAME_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")))
	local var_1_31 = Engine.CBBHFCGDIC("WZ_TU_TANGO/TWO_OF_FOUR_GAME_BUNDLE_DETAIL_TEXT", Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("MENU/STORE_CAT_X2")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("LUA_MENU_MP/WARZONE")), Engine.JCBDICCAH(Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")))
	local var_1_32 = Dvar.IBEGCHEFE("lui_store_four_game_loc_killswitch")
	local var_1_33 = {
		[LOOT.itemSourceExclusivity.MW_WZ] = {
			exclusivityAnim = "MWExclusive",
			exclusivityDescText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_2 or var_1_5,
			exclusivityBundleDetailText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_11 or var_1_32 and var_1_23 or var_1_26
		},
		[LOOT.itemSourceExclusivity.MW_EXCLUSIVE] = {
			exclusivityAnim = "MWExclusive",
			exclusivityDescText = var_1_5,
			exclusivityBundleDetailText = var_1_8
		},
		[LOOT.itemSourceExclusivity.CW_WZ] = {
			exclusivityAnim = "BOExclusive",
			exclusivityDescText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_3 or var_1_6,
			exclusivityBundleDetailText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_12 or var_1_32 and var_1_24 or var_1_27
		},
		[LOOT.itemSourceExclusivity.CW_EXCLUSIVE] = {
			exclusivityAnim = "BOExclusive",
			exclusivityDescText = var_1_6,
			exclusivityBundleDetailText = var_1_9
		},
		[LOOT.itemSourceExclusivity.CW_ZOMBIES_EXCLUSIVE] = {
			exclusivityAnim = "BOExclusive",
			exclusivityDescText = var_1_6,
			exclusivityBundleDetailText = var_1_9
		},
		[LOOT.itemSourceExclusivity.VG_WZ] = {
			exclusivityAnim = "VGExclusive",
			exclusivityDescText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_4 or var_1_7,
			exclusivityBundleDetailText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_13 or var_1_28
		},
		[LOOT.itemSourceExclusivity.VG_EXCLUSIVE] = {
			exclusivityAnim = "VGExclusive",
			exclusivityDescText = var_1_7,
			exclusivityBundleDetailText = var_1_10
		},
		[LOOT.itemSourceExclusivity.CW_MW_EXCLUSIVE] = {
			exclusivityAnim = "BOandMWExclusive",
			exclusivityDescText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_17 or var_1_20,
			exclusivityBundleDetailText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_14 or var_1_32 and var_1_25 or var_1_29
		},
		[LOOT.itemSourceExclusivity.CW_VG_EXCLUSIVE] = {
			exclusivityAnim = "BOandVGExclusive",
			exclusivityDescText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_18 or var_1_21,
			exclusivityBundleDetailText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_15 or var_1_30
		},
		[LOOT.itemSourceExclusivity.MW_VG_EXCLUSIVE] = {
			exclusivityAnim = "MWandVGExclusive",
			exclusivityDescText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_22 or var_1_22,
			exclusivityBundleDetailText = arg_1_2.doesBundleHave1ExclusiveItem and var_1_16 or var_1_31
		}
	}

	arg_1_0.SnipeIcon:UpdateSnipeIcon({
		selected = true,
		gameSourceExclusivityID = arg_1_2.bundleExclusivity,
		alignment = LUI.Alignment.Left
	})

	local var_1_34 = var_1_33[arg_1_2.bundleExclusivity]

	if var_1_34 then
		ACTIONS.AnimateSequence(arg_1_0, var_1_34.exclusivityAnim)
		arg_1_0.ExclusivityDescription:setText(var_1_34.exclusivityDescText)
		arg_1_0.BundleExclusivityDetail:setText(var_1_34.exclusivityBundleDetailText)
	end

	arg_1_0.ConfirmButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if arg_1_2.confirmAction and type(arg_1_2.confirmAction) == "function" then
			arg_1_2.confirmAction()
			LUI.FlowManager.RequestLeaveMenu(arg_2_0, false, false)
		end
	end)

	local function var_1_35(arg_3_0, arg_3_1)
		if arg_1_2.startPurchaseImmediately then
			LUI.FlowManager.RequestLeaveMenuByName("StoreBundlePreview", false, false)
		end

		LUI.FlowManager.RequestLeaveMenu(arg_3_0, false, false)
	end

	arg_1_0.CancelButton:addEventHandler("button_action", var_1_35)
	arg_1_0.bindButton:addEventHandler("button_secondary", var_1_35)

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

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_1_0, "WZSetup")
	end

	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_1_0, arg_1_1, {
		addScreenDarkener = true,
		darkenerOpacity = 0.97
	})
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
	local var_5_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "GenericPopupWindow"

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_5_4.BotBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_5_4.TopBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -911, _1080p * 911, _1080p * -340, _1080p * 222)
	var_5_0:addElement(var_5_4)

	var_5_0.GenericPopupWindow = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIText.new()

	var_5_6.id = "Title"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/STORE_CONFIRM_PURCHASE_TITLE")), 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -290, _1080p * -230)
	var_5_0:addElement(var_5_6)

	var_5_0.Title = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Image"

	var_5_8:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 96, _1080p * 608, _1080p * -300, _1080p * -44)
	var_5_0:addElement(var_5_8)

	var_5_0.Image = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "BundleExclusivityDetail"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_10:setText("", 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 714, _1080p * -105, _1080p * -83)
	var_5_0:addElement(var_5_10)

	var_5_0.BundleExclusivityDetail = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "ExclusivityDescription"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_12:setText("", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -204, _1080p * 714, _1080p * -140, _1080p * -110)
	var_5_0:addElement(var_5_12)

	var_5_0.ExclusivityDescription = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "ExclusivityImage"

	var_5_14:SetYRotation(180, 0)
	var_5_14:setImage(RegisterMaterial("exclusive_snipe"), 0)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -244, _1080p * -204, _1080p * -144, _1080p * -104)
	var_5_0:addElement(var_5_14)

	var_5_0.ExclusivityImage = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIStyledText.new()

	var_5_16.id = "Message"

	var_5_16:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_16:setText("", 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -225, _1080p * -203)
	var_5_0:addElement(var_5_16)

	var_5_0.Message = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "ConfirmButton"

	var_5_18.Text:SetLeft(_1080p * 20, 0)
	var_5_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW"), 0)
	var_5_18.Text:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 720, _1080p * 1204, _1080p * 84, _1080p * 122)
	var_5_0:addElement(var_5_18)

	var_5_0.ConfirmButton = var_5_18

	local var_5_19
	local var_5_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_20.id = "CancelButton"

	var_5_20.Text:SetLeft(_1080p * 20, 0)
	var_5_20.Text:setText(Engine.CBBHFCGDIC("MENU/CANCEL"), 0)
	var_5_20.Text:SetAlignment(LUI.Alignment.Left)
	var_5_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 720, _1080p * 1204, _1080p * 128, _1080p * 166)
	var_5_0:addElement(var_5_20)

	var_5_0.CancelButton = var_5_20

	local var_5_21
	local var_5_22 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_5_1
	})

	var_5_22.id = "Prompts"

	if CONDITIONS.AlwaysFalse() then
		var_5_22.Label:setText("Back/Select", 0)
	end

	var_5_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 155, _1080p * 255, _1080p * 237, _1080p * 268)
	var_5_0:addElement(var_5_22)

	var_5_0.Prompts = var_5_22

	local var_5_23
	local var_5_24 = MenuBuilder.BuildRegisteredType("PriceButtonSmall", {
		controllerIndex = var_5_1
	})

	var_5_24.id = "Price"

	var_5_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * -40, _1080p * 6, _1080p * 56)
	var_5_0:addElement(var_5_24)

	var_5_0.Price = var_5_24

	local var_5_25
	local var_5_26 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_5_1
	})

	var_5_26.id = "PlayerDetails"

	var_5_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
	var_5_0:addElement(var_5_26)

	var_5_0.PlayerDetails = var_5_26

	local var_5_27
	local var_5_28 = LUI.UIStyledText.new()

	var_5_28.id = "Disclaimer"

	var_5_28:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_28:SetAlpha(0, 0)
	var_5_28:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TIER_DISCLAIMER"), 0)
	var_5_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_28:SetAlignment(LUI.Alignment.Left)
	var_5_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 608, _1080p * 615, _1080p * 633)
	var_5_0:addElement(var_5_28)

	var_5_0.Disclaimer = var_5_28

	local var_5_29
	local var_5_30 = LUI.UIImage.new()

	var_5_30.id = "Lock"

	var_5_30:SetAlpha(0, 0)
	var_5_30:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_5_30:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 96, _1080p * 128, _1080p * 6, _1080p * 38)
	var_5_0:addElement(var_5_30)

	var_5_0.Lock = var_5_30

	local var_5_31
	local var_5_32 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_5_1
	})

	var_5_32.id = "SnipeIcon"

	var_5_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 496, _1080p * 550, _1080p * 605)
	var_5_0:addElement(var_5_32)

	var_5_0.SnipeIcon = var_5_32

	local function var_5_33()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_33

	local var_5_34
	local var_5_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_28:RegisterAnimationSequence("TierDisclaimer", var_5_35)

	local var_5_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 102
		}
	}

	var_5_30:RegisterAnimationSequence("TierDisclaimer", var_5_36)

	local function var_5_37()
		var_5_28:AnimateSequence("TierDisclaimer")
		var_5_30:AnimateSequence("TierDisclaimer")
	end

	var_5_0._sequences.TierDisclaimer = var_5_37

	local var_5_38
	local var_5_39 = {
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

	var_5_16:RegisterAnimationSequence("AR", var_5_39)

	local function var_5_40()
		var_5_16:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_40

	local var_5_41
	local var_5_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_5_12:RegisterAnimationSequence("BOExclusive", var_5_42)

	local var_5_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_5_14:RegisterAnimationSequence("BOExclusive", var_5_43)

	local function var_5_44()
		var_5_12:AnimateSequence("BOExclusive")
		var_5_14:AnimateSequence("BOExclusive")
	end

	var_5_0._sequences.BOExclusive = var_5_44

	local var_5_45
	local var_5_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_5_12:RegisterAnimationSequence("MWExclusive", var_5_46)

	local var_5_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_5_14:RegisterAnimationSequence("MWExclusive", var_5_47)

	local function var_5_48()
		var_5_12:AnimateSequence("MWExclusive")
		var_5_14:AnimateSequence("MWExclusive")
	end

	var_5_0._sequences.MWExclusive = var_5_48

	local var_5_49
	local var_5_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_5_12:RegisterAnimationSequence("VGExclusive", var_5_50)

	local var_5_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_5_14:RegisterAnimationSequence("VGExclusive", var_5_51)

	local function var_5_52()
		var_5_12:AnimateSequence("VGExclusive")
		var_5_14:AnimateSequence("VGExclusive")
	end

	var_5_0._sequences.VGExclusive = var_5_52

	local var_5_53
	local var_5_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_5_12:RegisterAnimationSequence("BOandMWExclusive", var_5_54)

	local var_5_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_5_14:RegisterAnimationSequence("BOandMWExclusive", var_5_55)

	local function var_5_56()
		var_5_12:AnimateSequence("BOandMWExclusive")
		var_5_14:AnimateSequence("BOandMWExclusive")
	end

	var_5_0._sequences.BOandMWExclusive = var_5_56

	local var_5_57
	local var_5_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_5_12:RegisterAnimationSequence("BOandVGExclusive", var_5_58)

	local var_5_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_5_14:RegisterAnimationSequence("BOandVGExclusive", var_5_59)

	local function var_5_60()
		var_5_12:AnimateSequence("BOandVGExclusive")
		var_5_14:AnimateSequence("BOandVGExclusive")
	end

	var_5_0._sequences.BOandVGExclusive = var_5_60

	local var_5_61
	local var_5_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_5_12:RegisterAnimationSequence("MWandVGExclusive", var_5_62)

	local var_5_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_5_14:RegisterAnimationSequence("MWandVGExclusive", var_5_63)

	local function var_5_64()
		var_5_12:AnimateSequence("MWandVGExclusive")
		var_5_14:AnimateSequence("MWandVGExclusive")
	end

	var_5_0._sequences.MWandVGExclusive = var_5_64

	local var_5_65
	local var_5_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZTitle
		}
	}

	var_5_6:RegisterAnimationSequence("WZSetup", var_5_66)

	local var_5_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_5_10:RegisterAnimationSequence("WZSetup", var_5_67)

	local var_5_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_5_12:RegisterAnimationSequence("WZSetup", var_5_68)

	local var_5_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_5_14:RegisterAnimationSequence("WZSetup", var_5_69)

	local var_5_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_16:RegisterAnimationSequence("WZSetup", var_5_70)

	local var_5_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_5_28:RegisterAnimationSequence("WZSetup", var_5_71)

	local function var_5_72()
		var_5_6:AnimateSequence("WZSetup")
		var_5_10:AnimateSequence("WZSetup")
		var_5_12:AnimateSequence("WZSetup")
		var_5_14:AnimateSequence("WZSetup")
		var_5_16:AnimateSequence("WZSetup")
		var_5_28:AnimateSequence("WZSetup")
	end

	var_5_0._sequences.WZSetup = var_5_72

	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK"),
		container = var_5_22
	})
	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 2,
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT"),
		container = var_5_22
	})

	local var_5_73 = LUI.UIBindButton.new()

	var_5_73.id = "selfBindButton"

	var_5_0:addElement(var_5_73)

	var_5_0.bindButton = var_5_73

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("StoreConfirmPurchasePopup", StoreConfirmPurchasePopup)
LockTable(_M)
