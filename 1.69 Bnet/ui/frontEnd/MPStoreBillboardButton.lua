module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.titleImage and #arg_1_1.titleImage > 0 then
		arg_1_0.ItemTitle:SetAlpha(1)
		arg_1_0.ItemTitle:setImage(RegisterMaterial(arg_1_1.titleImage))
	else
		arg_1_0.ItemTitle:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = Engine.DGAIDIEIAC()
	local var_2_1 = var_2_0 == 0 or var_2_0 == 1

	if arg_2_1.fetchingDataFailed then
		arg_2_0.ItemName:SetAlpha(1)
		arg_2_0.ItemName:setText(Engine.CBBHFCGDIC("MENU/FETCHING_STORE_DATA_FAILED"))
	elseif arg_2_1.name and not var_2_1 then
		if arg_2_1.emptyCategory then
			arg_2_0.ItemName:SetAlpha(0)
		else
			arg_2_0.ItemName:SetAlpha(1)
			arg_2_0.ItemName:setText(Engine.CBBHFCGDIC(arg_2_1.name))
		end
	else
		arg_2_0.ItemName:SetAlpha(0)
	end

	if not arg_2_0.isSnipeShowing then
		arg_2_0.ItemName:SetRight(arg_2_2)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_1.emptyCategory then
		if not arg_3_0.SoldOutMessage then
			local var_3_0
			local var_3_1 = LUI.UIStyledText.new()

			var_3_1.id = "SoldOutMessage"

			var_3_1:SetRGBFromTable(SWATCHES.Store.TextOver)
			var_3_1:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE_COMING_SOON"))
			var_3_1:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
			var_3_1:SetWordWrap(false)
			var_3_1:SetAlignment(LUI.Alignment.Left)
			var_3_1:SetOptOutRightToLeftAlignmentFlip(true)
			var_3_1:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
			var_3_1:SetStartupDelay(2000)
			var_3_1:SetLineHoldTime(400)
			var_3_1:SetAnimMoveTime(2000)
			var_3_1:SetAnimMoveSpeed(150)
			var_3_1:SetEndDelay(2000)
			var_3_1:SetCrossfadeTime(250)
			var_3_1:SetFadeInTime(300)
			var_3_1:SetFadeOutTime(300)
			var_3_1:SetMaxVisibleLines(1)
			var_3_1:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -38, _1080p * -10)
			arg_3_0:addElement(var_3_1)

			arg_3_0.SoldOutMessage = var_3_1
		end
	elseif arg_3_0.SoldOutMessage then
		arg_3_0.SoldOutMessage:closeTree()

		arg_3_0.SoldOutMessage = nil
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_1.asset and #arg_4_1.asset > 0 then
		arg_4_0.ItemImage:SetAlpha(1)
		arg_4_0.ItemImage:setImage(RegisterMaterial(arg_4_1.asset))
	else
		assert(false, "Missing Image Asset for item ID " .. arg_4_1.id)
		arg_4_0.ItemImage:SetAlpha(0)
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	if CONDITIONS.IsStoreSalesBannerEnabled() then
		return
	end

	local var_5_0 = tonumber(arg_5_1.purchaseEnd)

	if var_5_0 then
		if not arg_5_0.MPStoreBillboardLimitedTimeBanner then
			local var_5_1
			local var_5_2 = MenuBuilder.BuildRegisteredType("MPStoreBillboardLimitedTimeBanner", {
				controllerIndex = arg_5_0._controllerIndex
			})

			var_5_2.id = "MPStoreBillboardLimitedTimeBanner"

			var_5_2:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 160, _1080p * 8, _1080p * 33)
			arg_5_0:addElement(var_5_2)

			arg_5_0.MPStoreBillboardLimitedTimeBanner = var_5_2
		end

		local var_5_3 = Engine.DEIDGHDBHD()
		local var_5_4 = var_5_3 < var_5_0 and var_5_0 - var_5_3 or 0

		arg_5_0.MPStoreBillboardLimitedTimeBanner:SetTimer(var_5_0, {
			isExpired = var_5_4 <= 0
		})
	elseif arg_5_0.MPStoreBillboardLimitedTimeBanner then
		arg_5_0.MPStoreBillboardLimitedTimeBanner:closeTree()

		arg_5_0.MPStoreBillboardLimitedTimeBanner = nil
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	ACTIONS.AnimateSequence(arg_6_0, "NotFree")

	if arg_6_1.firstPartyBundleId and STORE.IsItemOnSale(arg_6_1.firstPartyBundleId, arg_6_0._controllerIndex) then
		arg_6_0.HotItemNotification:SetAlpha(1)
	elseif arg_6_1.id then
		local var_6_0, var_6_1 = STORE.GetBundleCost(arg_6_0._controllerIndex, arg_6_1.id)
		local var_6_2 = var_6_0

		if var_6_1 and var_6_1 < var_6_0 then
			if CONDITIONS.IsStoreSalesBannerEnabled() and arg_6_1.discountPercent then
				arg_6_0.LimitedTimeItem:SetupDiscountPercentage(arg_6_1.discountPercent)
				arg_6_0.LimitedTimeItem:SetAlpha(1)
			else
				arg_6_0.LimitedTimeItem:SetAlpha(0)
			end

			var_6_2 = var_6_1

			arg_6_0.HotItemNotification:SetAlpha(1)

			arg_6_2 = arg_6_2 - LAYOUT.GetElementWidth(arg_6_0.HotItemNotification)
		else
			arg_6_0.LimitedTimeItem:SetAlpha(0)
			arg_6_0.HotItemNotification:SetAlpha(0)
		end

		if var_6_2 <= 0 then
			ACTIONS.AnimateSequence(arg_6_0, "Free")
		else
			ACTIONS.AnimateSequence(arg_6_0, "NotFree")
		end
	else
		arg_6_0.LimitedTimeItem:SetAlpha(0)
		arg_6_0.HotItemNotification:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_6_0, "NotFree")
	end
end

local function var_0_6(arg_7_0, arg_7_1)
	if arg_7_1.owned then
		ACTIONS.AnimateSequence(arg_7_0, "Owned")
		LAYOUT.SetTextBoxSize(arg_7_0.OwnedText, arg_7_0.OwnedBackground, Engine.CBBHFCGDIC("MENU/OWNED_CAPS"), 5, nil, LUI.Alignment.Left, 0)
	else
		ACTIONS.AnimateSequence(arg_7_0, "Unowned")
	end
end

local function var_0_7(arg_8_0, arg_8_1)
	if arg_8_1 > 0 then
		arg_8_0.FreeText:SetRight(_1080p * -28)

		if not arg_8_0.NewItemNotification then
			local var_8_0
			local var_8_1 = LUI.UIImage.new()

			var_8_1.id = "NewItemNotification"

			var_8_1:SetAlpha(0, 0)
			var_8_1:SetPixelGridEnabled(true)
			var_8_1:SetPixelGridContrast(0.2, 0)
			var_8_1:SetPixelGridBlockWidth(1, 0)
			var_8_1:SetPixelGridBlockHeight(1, 0)
			var_8_1:SetPixelGridGutterWidth(1, 0)
			var_8_1:SetPixelGridGutterHeight(1, 0)
			var_8_1:setImage(RegisterMaterial("icon_new_store_pulse"), 0)
			var_8_1:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -28, 0, 0, _1080p * 28)
			arg_8_0:addElement(var_8_1)

			arg_8_0.NewItemNotification = var_8_1
		end

		arg_8_0.NewItemNotification:SetAlpha(arg_8_1)
	else
		arg_8_0.FreeText:SetRight(0)

		if arg_8_0.NewItemNotification then
			arg_8_0.NewItemNotification:closeTree()

			arg_8_0.NewItemNotification = nil
		end
	end
end

local function var_0_8(arg_9_0, arg_9_1)
	if arg_9_1.hasOperatorMissions then
		if not arg_9_0.OperatorMissionBorder then
			local var_9_0
			local var_9_1 = LUI.UIImage.new()

			var_9_1.id = "OperatorMissionBorder"

			var_9_1:setImage(RegisterMaterial("ui_icon_mtx_bundle_highlight"), 0)
			var_9_1:SetBlendMode(BLEND_MODE.addWithAlpha)
			var_9_1:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -2)
			arg_9_0:addElement(var_9_1)

			arg_9_0.OperatorMissionBorder = var_9_1
		end
	elseif arg_9_0.OperatorMissionBorder then
		arg_9_0.OperatorMissionBorder:closeTree()

		arg_9_0.OperatorMissionBorder = nil
	end
end

local function var_0_9(arg_10_0, arg_10_1)
	if arg_10_1.hasOperatorMissions then
		if not arg_10_0.BundleIncludesOperatorMissionIndicator then
			local var_10_0
			local var_10_1 = MenuBuilder.BuildRegisteredType("BundleIncludesOperatorMissionIndicator", {
				controllerIndex = arg_10_0._controllerIndex
			})

			var_10_1.id = "BundleIncludesOperatorMissionIndicator"

			if IsLanguageEnglish() then
				var_10_1:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 10, _1080p * 138, _1080p * -35, _1080p * -9)
			else
				var_10_1:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 10, _1080p * 138, _1080p * -62, _1080p * -36)
			end

			arg_10_0:addElement(var_10_1)

			arg_10_0.BundleIncludesOperatorMissionIndicator = var_10_1
		end

		local var_10_2 = LOOT.GetBundleOperatorMissionsCP(arg_10_0._controllerIndex, arg_10_1.id)

		arg_10_0.BundleIncludesOperatorMissionIndicator:SetAmount(var_10_2)
	elseif arg_10_0.BundleIncludesOperatorMissionIndicator then
		arg_10_0.BundleIncludesOperatorMissionIndicator:closeTree()

		arg_10_0.BundleIncludesOperatorMissionIndicator = nil
	end
end

local function var_0_10(arg_11_0, arg_11_1)
	if arg_11_0.PriceButton then
		arg_11_0.PriceButton:closeTree()

		arg_11_0.PriceButton = nil
	end

	if not STORE.IsCatalogReady(arg_11_0._controllerIndex) then
		return
	end

	if not arg_11_1.firstPartyProductID or not arg_11_1.id then
		return
	end

	local var_11_0 = STORE.GetFirstPartyBundleData(arg_11_0._controllerIndex, arg_11_1.id, arg_11_1.firstPartyProductID)

	if var_11_0 and var_11_0.price and (STORE.IsVanguardProduct(arg_11_1.firstPartyProductID) and arg_11_1.firstPartyProductID ~= STORE.VanguardTrialID or STORE.IsCortezProduct(arg_11_1.firstPartyProductID)) then
		local var_11_1
		local var_11_2 = LUI.UIText.new()

		var_11_2.id = "PriceButton"

		var_11_2:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_11_2:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_11_2:SetAlignment(LUI.Alignment.Right)
		var_11_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 182, _1080p * 316, _1080p * 5, _1080p * 29)
		arg_11_0:addElement(var_11_2)

		arg_11_0.PriceButton = var_11_2

		arg_11_0.PriceButton:setText(Engine.JCBDICCAH(var_11_0.price))
	end
end

local function var_0_11(arg_12_0, arg_12_1)
	local var_12_0 = -10 * _1080p

	var_0_0(arg_12_0, arg_12_1)
	var_0_1(arg_12_0, arg_12_1, var_12_0)
	var_0_2(arg_12_0, arg_12_1)
	var_0_3(arg_12_0, arg_12_1)
	var_0_4(arg_12_0, arg_12_1)
	var_0_5(arg_12_0, arg_12_1, var_12_0)
	var_0_8(arg_12_0, arg_12_1)
	var_0_9(arg_12_0, arg_12_1)

	if Dvar.IBEGCHEFE("LSNMMPRLQT") == true then
		var_0_10(arg_12_0, arg_12_1)
	end

	if CONDITIONS.IsPostSeasonAndMagma() then
		var_0_6(arg_12_0, arg_12_1)
	end
end

local function var_0_12(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = arg_13_2[tostring(arg_13_1.id)] and not arg_13_3

	arg_13_0.Frame:SetAlpha(var_13_0 and 1 or 0)

	arg_13_0.HighlightBarBottom._silverTheme = var_13_0
end

local function var_0_13(arg_14_0, arg_14_1)
	if arg_14_1 == LUI.GAME_SOURCE_ID.MODERN_WARFARE or arg_14_1 == LUI.GAME_SOURCE_ID.COLD_WAR or arg_14_1 == LUI.GAME_SOURCE_ID.VANGUARD then
		ACTIONS.AnimateSequence(arg_14_0, "ShowWZSnipeBar")
		arg_14_0.SnipeIcon:UpdateSnipeIcon({
			selected = true,
			gameSourceID = arg_14_1
		})
		arg_14_0.SnipeOverlay:UpdateSnipeOverlay({
			useStoreButtonSetup = true,
			gameSourceID = arg_14_1
		})

		arg_14_0.isSnipeShowing = true
	else
		ACTIONS.AnimateSequence(arg_14_0, "HideWZSnipeBar")

		arg_14_0.isSnipeShowing = false
	end
end

local function var_0_14(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.UpdateButton = var_0_11
	arg_15_0.UpdateNewIndicator = var_0_7
	arg_15_0.UpdateChaseItem = var_0_12
	arg_15_0.UpdateWZSnipeBar = var_0_13
	arg_15_0._controllerIndex = arg_15_1

	arg_15_0:addEventHandler("gain_focus", function(arg_16_0, arg_16_1)
		ACTIONS.AnimateSequence(arg_15_0, "ButtonOver")
		arg_15_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 145, 200, LUI.EASING.outQuadratic)
		arg_15_0.ItemTitle:SetScale(-0.73, 200, LUI.EASING.outQuadratic)
		arg_15_0.ItemImage:SetScale(-0.75, 200, LUI.EASING.outQuadratic)
	end)
	arg_15_0:addEventHandler("lose_focus", function(arg_17_0, arg_17_1)
		ACTIONS.AnimateSequence(arg_15_0, "ButtonUp")

		if Dvar.IBEGCHEFE("MLTTQSTKQS") then
			ACTIONS.AnimateSequence(arg_15_0, "ButtonUpDark")
		end

		arg_15_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 120, 100, LUI.EASING.outQuadratic)
		arg_15_0.ItemTitle:SetScale(-0.75, 100)
		arg_15_0.ItemImage:SetScale(-0.78, 100)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_15_0, "AR")
	end
end

function MPStoreBillboardButton(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIButton.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 320 * _1080p, 0, 120 * _1080p)

	var_18_0.id = "MPStoreBillboardButton"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0

	var_18_0:setUseStencil(true)

	local var_18_3
	local var_18_4 = LUI.UIImage.new()

	var_18_4.id = "ItemImage"

	var_18_4:SetRGBFromTable(SWATCHES.BattlePass.DarkGrey, 0)
	var_18_4:SetScale(-0.78, 0)
	var_18_4:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_18_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -290, _1080p * 290)
	var_18_0:addElement(var_18_4)

	var_18_0.ItemImage = var_18_4

	local var_18_5
	local var_18_6 = LUI.UIImage.new()

	var_18_6.id = "FreeBanner"

	var_18_6:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_18_6:SetAlpha(0, 0)
	var_18_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top_opaque_dark"), 0)
	var_18_6:SetVMin(0.25, 0)
	var_18_6:SetVMax(0.75, 0)
	var_18_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 200, 0, 0, _1080p * 28)
	var_18_0:addElement(var_18_6)

	var_18_0.FreeBanner = var_18_6

	local var_18_7
	local var_18_8 = LUI.UIStyledText.new()

	var_18_8.id = "FreeText"

	var_18_8:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_18_8:SetAlpha(0, 0)
	var_18_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COST_FREE")), 0)
	var_18_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_8:SetWordWrap(false)
	var_18_8:SetTracking(2 * _1080p, 0)
	var_18_8:SetAlignment(LUI.Alignment.Center)
	var_18_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_8:SetStartupDelay(2000)
	var_18_8:SetLineHoldTime(400)
	var_18_8:SetAnimMoveTime(2000)
	var_18_8:SetAnimMoveSpeed(150)
	var_18_8:SetEndDelay(2000)
	var_18_8:SetCrossfadeTime(250)
	var_18_8:SetFadeInTime(300)
	var_18_8:SetFadeOutTime(300)
	var_18_8:SetMaxVisibleLines(1)
	var_18_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 200, _1080p * -30, _1080p * 5, _1080p * 23)
	var_18_0:addElement(var_18_8)

	var_18_0.FreeText = var_18_8

	local var_18_9
	local var_18_10 = LUI.UIImage.new()

	var_18_10.id = "ItemTitle"

	var_18_10:SetScale(-0.75, 0)
	var_18_10:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_18_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -177, _1080p * 335, _1080p * -86, _1080p * 170)
	var_18_0:addElement(var_18_10)

	var_18_0.ItemTitle = var_18_10

	local var_18_11
	local var_18_12 = LUI.UIImage.new()

	var_18_12.id = "Gradient"

	var_18_12:SetRGBFromInt(0, 0)
	var_18_12:SetAlpha(0.4, 0)
	var_18_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_18_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -75, 0)
	var_18_0:addElement(var_18_12)

	var_18_0.Gradient = var_18_12

	local var_18_13
	local var_18_14 = LUI.UIStyledText.new()

	var_18_14.id = "ItemName"

	var_18_14:SetRGBFromTable(SWATCHES.Store.TextIdle, 0)
	var_18_14:setText("", 0)
	var_18_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_14:SetWordWrap(false)
	var_18_14:SetAlignment(LUI.Alignment.Left)
	var_18_14:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_18_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_14:SetStartupDelay(2000)
	var_18_14:SetLineHoldTime(400)
	var_18_14:SetAnimMoveTime(2000)
	var_18_14:SetAnimMoveSpeed(150)
	var_18_14:SetEndDelay(2000)
	var_18_14:SetCrossfadeTime(250)
	var_18_14:SetFadeInTime(300)
	var_18_14:SetFadeOutTime(300)
	var_18_14:SetMaxVisibleLines(2)
	var_18_14:SetShadowRGBFromInt(0, 0)
	var_18_14:SetOutlineRGBFromInt(0, 0)
	var_18_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -27, _1080p * -3)
	var_18_0:addElement(var_18_14)

	var_18_0.ItemName = var_18_14

	local var_18_15
	local var_18_16 = LUI.UIImage.new()

	var_18_16.id = "Frame"

	var_18_16:SetAlpha(0, 0)
	var_18_16:SetColorOp(COLOR_OP.saturation, 0)
	var_18_16:setImage(RegisterMaterial("battlepass_lootcard_trim_gold_9slice"), 0)
	var_18_16:Setup9SliceImage(_1080p * 40, _1080p * 40, 0.2, 0.2)
	var_18_0:addElement(var_18_16)

	var_18_0.Frame = var_18_16

	local var_18_17
	local var_18_18 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_18_1
	})

	var_18_18.id = "HighlightBarBottom"

	var_18_18:SetAlpha(0, 0)
	var_18_18:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_18_0:addElement(var_18_18)

	var_18_0.HighlightBarBottom = var_18_18

	local var_18_19
	local var_18_20 = LUI.UIImage.new()

	var_18_20.id = "HotItemNotification"

	var_18_20:SetAlpha(0, 0)
	var_18_20:setImage(RegisterMaterial("hot_item_fireball_atlas"), 0)
	var_18_20:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -73, _1080p * -3, _1080p * -100, _1080p * -30)
	var_18_0:addElement(var_18_20)

	var_18_0.HotItemNotification = var_18_20

	local var_18_21
	local var_18_22 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_18_1
	})

	var_18_22.id = "LimitedTimeItem"

	var_18_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 220, _1080p * 320, _1080p * 42, _1080p * 72)
	var_18_0:addElement(var_18_22)

	var_18_0.LimitedTimeItem = var_18_22

	local var_18_23
	local var_18_24 = MenuBuilder.BuildRegisteredType("WZSnipeBackgroundSceneOverlay", {
		controllerIndex = var_18_1
	})

	var_18_24.id = "SnipeOverlay"

	var_18_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 320, _1080p * 90, _1080p * 120)
	var_18_0:addElement(var_18_24)

	var_18_0.SnipeOverlay = var_18_24

	local var_18_25
	local var_18_26 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_18_1
	})

	var_18_26.id = "SnipeIcon"

	var_18_26:SetScale(-0.1, 0)
	var_18_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 220, _1080p * 340, _1080p * 86, _1080p * 116)
	var_18_0:addElement(var_18_26)

	var_18_0.SnipeIcon = var_18_26

	local var_18_27

	if CONDITIONS.IsPostSeasonAndMagma() then
		var_18_27 = LUI.UIImage.new()
		var_18_27.id = "OwnedBackground"

		var_18_27:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
		var_18_27:SetPixelGridEnabled(true)
		var_18_27:SetPixelGridContrast(0.5, 0)
		var_18_27:SetPixelGridBlockWidth(2, 0)
		var_18_27:SetPixelGridBlockHeight(2, 0)
		var_18_27:SetPixelGridGutterWidth(1, 0)
		var_18_27:SetPixelGridGutterHeight(1, 0)
		var_18_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 133, _1080p * 97, _1080p * 127)
		var_18_0:addElement(var_18_27)

		var_18_0.OwnedBackground = var_18_27
	end

	local var_18_28

	if CONDITIONS.IsPostSeasonAndMagma() then
		var_18_28 = LUI.UIStyledText.new()
		var_18_28.id = "OwnedText"

		var_18_28:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
		var_18_28:setText("", 0)
		var_18_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_18_28:SetWordWrap(false)
		var_18_28:SetAlignment(LUI.Alignment.Left)
		var_18_28:SetOptOutRightToLeftAlignmentFlip(true)
		var_18_28:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_18_28:SetStartupDelay(1000)
		var_18_28:SetLineHoldTime(500)
		var_18_28:SetAnimMoveTime(750)
		var_18_28:SetAnimMoveSpeed(50)
		var_18_28:SetEndDelay(1000)
		var_18_28:SetCrossfadeTime(400)
		var_18_28:SetFadeInTime(300)
		var_18_28:SetFadeOutTime(300)
		var_18_28:SetMaxVisibleLines(1)
		var_18_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 128, _1080p * 102, _1080p * 122)
		var_18_0:addElement(var_18_28)

		var_18_0.OwnedText = var_18_28
	end

	local function var_18_29()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_29

	local var_18_30
	local var_18_31 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_18_4:RegisterAnimationSequence("ButtonOver", var_18_31)

	local var_18_32 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonOver", var_18_32)

	local var_18_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_18_14:RegisterAnimationSequence("ButtonOver", var_18_33)

	local var_18_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_18:RegisterAnimationSequence("ButtonOver", var_18_34)

	local var_18_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 145,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_18_24:RegisterAnimationSequence("ButtonOver", var_18_35)

	local var_18_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 118
		}
	}

	var_18_26:RegisterAnimationSequence("ButtonOver", var_18_36)

	local function var_18_37()
		var_18_4:AnimateSequence("ButtonOver")
		var_18_12:AnimateSequence("ButtonOver")
		var_18_14:AnimateSequence("ButtonOver")
		var_18_18:AnimateSequence("ButtonOver")
		var_18_24:AnimateSequence("ButtonOver")
		var_18_26:AnimateSequence("ButtonOver")
	end

	var_18_0._sequences.ButtonOver = var_18_37

	local var_18_38
	local var_18_39 = {
		{
			value = 5000268,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_18_4:RegisterAnimationSequence("ButtonUp", var_18_39)

	local var_18_40 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonUp", var_18_40)

	local var_18_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.TextIdle
		}
	}

	var_18_14:RegisterAnimationSequence("ButtonUp", var_18_41)

	local var_18_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_18:RegisterAnimationSequence("ButtonUp", var_18_42)

	local var_18_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 145
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_18_24:RegisterAnimationSequence("ButtonUp", var_18_43)

	local var_18_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_18_26:RegisterAnimationSequence("ButtonUp", var_18_44)

	local function var_18_45()
		var_18_4:AnimateSequence("ButtonUp")
		var_18_12:AnimateSequence("ButtonUp")
		var_18_14:AnimateSequence("ButtonUp")
		var_18_18:AnimateSequence("ButtonUp")
		var_18_24:AnimateSequence("ButtonUp")
		var_18_26:AnimateSequence("ButtonUp")
	end

	var_18_0._sequences.ButtonUp = var_18_45

	local function var_18_46()
		return
	end

	var_18_0._sequences.Locked = var_18_46

	local var_18_47
	local var_18_48 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonOverDisabled", var_18_48)

	local function var_18_49()
		var_18_12:AnimateSequence("ButtonOverDisabled")
	end

	var_18_0._sequences.ButtonOverDisabled = var_18_49

	local var_18_50
	local var_18_51 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_12:RegisterAnimationSequence("ButtonUpDisabled", var_18_51)

	local function var_18_52()
		var_18_12:AnimateSequence("ButtonUpDisabled")
	end

	var_18_0._sequences.ButtonUpDisabled = var_18_52

	local var_18_53
	local var_18_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		}
	}

	var_18_14:RegisterAnimationSequence("AR", var_18_54)

	local function var_18_55()
		var_18_14:AnimateSequence("AR")
	end

	var_18_0._sequences.AR = var_18_55

	local var_18_56
	local var_18_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_18_4:RegisterAnimationSequence("CategoryEmpty", var_18_57)

	local function var_18_58()
		var_18_4:AnimateSequence("CategoryEmpty")
	end

	var_18_0._sequences.CategoryEmpty = var_18_58

	local var_18_59
	local var_18_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_18_4:RegisterAnimationSequence("CategoryNotEmpty", var_18_60)

	local function var_18_61()
		var_18_4:AnimateSequence("CategoryNotEmpty")
	end

	var_18_0._sequences.CategoryNotEmpty = var_18_61

	local var_18_62
	local var_18_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_6:RegisterAnimationSequence("Free", var_18_63)

	local var_18_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("Free", var_18_64)

	local function var_18_65()
		var_18_6:AnimateSequence("Free")
		var_18_8:AnimateSequence("Free")
	end

	var_18_0._sequences.Free = var_18_65

	local var_18_66
	local var_18_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_6:RegisterAnimationSequence("NotFree", var_18_67)

	local var_18_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("NotFree", var_18_68)

	local function var_18_69()
		var_18_6:AnimateSequence("NotFree")
		var_18_8:AnimateSequence("NotFree")
	end

	var_18_0._sequences.NotFree = var_18_69

	local var_18_70
	local var_18_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.DarkGrey
		}
	}

	var_18_4:RegisterAnimationSequence("ButtonUpDark", var_18_71)

	local function var_18_72()
		var_18_4:AnimateSequence("ButtonUpDark")
	end

	var_18_0._sequences.ButtonUpDark = var_18_72

	local var_18_73
	local var_18_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -90
		}
	}

	var_18_14:RegisterAnimationSequence("ShowWZSnipeBar", var_18_74)

	local var_18_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_24:RegisterAnimationSequence("ShowWZSnipeBar", var_18_75)

	local var_18_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_26:RegisterAnimationSequence("ShowWZSnipeBar", var_18_76)

	local function var_18_77()
		var_18_14:AnimateSequence("ShowWZSnipeBar")
		var_18_24:AnimateSequence("ShowWZSnipeBar")
		var_18_26:AnimateSequence("ShowWZSnipeBar")
	end

	var_18_0._sequences.ShowWZSnipeBar = var_18_77

	local var_18_78
	local var_18_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_18_14:RegisterAnimationSequence("HideWZSnipeBar", var_18_79)

	local var_18_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_24:RegisterAnimationSequence("HideWZSnipeBar", var_18_80)

	local var_18_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_26:RegisterAnimationSequence("HideWZSnipeBar", var_18_81)

	local function var_18_82()
		var_18_14:AnimateSequence("HideWZSnipeBar")
		var_18_24:AnimateSequence("HideWZSnipeBar")
		var_18_26:AnimateSequence("HideWZSnipeBar")
	end

	var_18_0._sequences.HideWZSnipeBar = var_18_82

	local var_18_83

	if CONDITIONS.IsPostSeasonAndMagma() then
		local var_18_84 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_18_27:RegisterAnimationSequence("Owned", var_18_84)
	end

	if CONDITIONS.IsPostSeasonAndMagma() then
		local var_18_85 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Text,
				value = Engine.CBBHFCGDIC("MENU/OWNED_CAPS")
			}
		}

		var_18_28:RegisterAnimationSequence("Owned", var_18_85)
	end

	local function var_18_86()
		if CONDITIONS.IsPostSeasonAndMagma() then
			var_18_27:AnimateSequence("Owned")
		end

		if CONDITIONS.IsPostSeasonAndMagma() then
			var_18_28:AnimateSequence("Owned")
		end
	end

	var_18_0._sequences.Owned = var_18_86

	local var_18_87

	if CONDITIONS.IsPostSeasonAndMagma() then
		local var_18_88 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_18_27:RegisterAnimationSequence("Unowned", var_18_88)
	end

	if CONDITIONS.IsPostSeasonAndMagma() then
		local var_18_89 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_18_28:RegisterAnimationSequence("Unowned", var_18_89)
	end

	local function var_18_90()
		if CONDITIONS.IsPostSeasonAndMagma() then
			var_18_27:AnimateSequence("Unowned")
		end

		if CONDITIONS.IsPostSeasonAndMagma() then
			var_18_28:AnimateSequence("Unowned")
		end
	end

	var_18_0._sequences.Unowned = var_18_90

	var_0_14(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("MPStoreBillboardButton", MPStoreBillboardButton)
LockTable(_M)
