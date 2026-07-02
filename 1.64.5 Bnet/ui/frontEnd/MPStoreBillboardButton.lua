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
	if arg_7_1 > 0 then
		arg_7_0.FreeText:SetRight(_1080p * -28)

		if not arg_7_0.NewItemNotification then
			local var_7_0
			local var_7_1 = LUI.UIImage.new()

			var_7_1.id = "NewItemNotification"

			var_7_1:SetAlpha(0, 0)
			var_7_1:SetPixelGridEnabled(true)
			var_7_1:SetPixelGridContrast(0.2, 0)
			var_7_1:SetPixelGridBlockWidth(1, 0)
			var_7_1:SetPixelGridBlockHeight(1, 0)
			var_7_1:SetPixelGridGutterWidth(1, 0)
			var_7_1:SetPixelGridGutterHeight(1, 0)
			var_7_1:setImage(RegisterMaterial("icon_new_store_pulse"), 0)
			var_7_1:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -28, 0, 0, _1080p * 28)
			arg_7_0:addElement(var_7_1)

			arg_7_0.NewItemNotification = var_7_1
		end

		arg_7_0.NewItemNotification:SetAlpha(arg_7_1)
	else
		arg_7_0.FreeText:SetRight(0)

		if arg_7_0.NewItemNotification then
			arg_7_0.NewItemNotification:closeTree()

			arg_7_0.NewItemNotification = nil
		end
	end
end

local function var_0_7(arg_8_0, arg_8_1)
	if arg_8_1.hasOperatorMissions then
		if not arg_8_0.OperatorMissionBorder then
			local var_8_0
			local var_8_1 = LUI.UIImage.new()

			var_8_1.id = "OperatorMissionBorder"

			var_8_1:setImage(RegisterMaterial("ui_icon_mtx_bundle_highlight"), 0)
			var_8_1:SetBlendMode(BLEND_MODE.addWithAlpha)
			var_8_1:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -2)
			arg_8_0:addElement(var_8_1)

			arg_8_0.OperatorMissionBorder = var_8_1
		end
	elseif arg_8_0.OperatorMissionBorder then
		arg_8_0.OperatorMissionBorder:closeTree()

		arg_8_0.OperatorMissionBorder = nil
	end
end

local function var_0_8(arg_9_0, arg_9_1)
	if arg_9_1.hasOperatorMissions then
		if not arg_9_0.BundleIncludesOperatorMissionIndicator then
			local var_9_0
			local var_9_1 = MenuBuilder.BuildRegisteredType("BundleIncludesOperatorMissionIndicator", {
				controllerIndex = arg_9_0._controllerIndex
			})

			var_9_1.id = "BundleIncludesOperatorMissionIndicator"

			if IsLanguageEnglish() then
				var_9_1:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 10, _1080p * 138, _1080p * -35, _1080p * -9)
			else
				var_9_1:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 10, _1080p * 138, _1080p * -62, _1080p * -36)
			end

			arg_9_0:addElement(var_9_1)

			arg_9_0.BundleIncludesOperatorMissionIndicator = var_9_1
		end

		local var_9_2 = LOOT.GetBundleOperatorMissionsCP(arg_9_0._controllerIndex, arg_9_1.id)

		arg_9_0.BundleIncludesOperatorMissionIndicator:SetAmount(var_9_2)
	elseif arg_9_0.BundleIncludesOperatorMissionIndicator then
		arg_9_0.BundleIncludesOperatorMissionIndicator:closeTree()

		arg_9_0.BundleIncludesOperatorMissionIndicator = nil
	end
end

local function var_0_9(arg_10_0, arg_10_1)
	if arg_10_0.PriceButton then
		arg_10_0.PriceButton:closeTree()

		arg_10_0.PriceButton = nil
	end

	if not STORE.IsCatalogReady(arg_10_0._controllerIndex) then
		return
	end

	if not arg_10_1.firstPartyProductID or not arg_10_1.id then
		return
	end

	local var_10_0 = STORE.GetFirstPartyBundleData(arg_10_0._controllerIndex, arg_10_1.id, arg_10_1.firstPartyProductID)

	if var_10_0 and var_10_0.price and (STORE.IsVanguardProduct(arg_10_1.firstPartyProductID) and arg_10_1.firstPartyProductID ~= STORE.VanguardTrialID or STORE.IsCortezProduct(arg_10_1.firstPartyProductID)) then
		local var_10_1
		local var_10_2 = LUI.UIText.new()

		var_10_2.id = "PriceButton"

		var_10_2:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_10_2:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_10_2:SetAlignment(LUI.Alignment.Right)
		var_10_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 182, _1080p * 316, _1080p * 5, _1080p * 29)
		arg_10_0:addElement(var_10_2)

		arg_10_0.PriceButton = var_10_2

		arg_10_0.PriceButton:setText(Engine.JCBDICCAH(var_10_0.price))
	end
end

local function var_0_10(arg_11_0, arg_11_1)
	local var_11_0 = -10 * _1080p

	var_0_0(arg_11_0, arg_11_1)
	var_0_1(arg_11_0, arg_11_1, var_11_0)
	var_0_2(arg_11_0, arg_11_1)
	var_0_3(arg_11_0, arg_11_1)
	var_0_4(arg_11_0, arg_11_1)
	var_0_5(arg_11_0, arg_11_1, var_11_0)
	var_0_7(arg_11_0, arg_11_1)
	var_0_8(arg_11_0, arg_11_1)

	if Dvar.IBEGCHEFE("LSNMMPRLQT") == true then
		var_0_9(arg_11_0, arg_11_1)
	end
end

local function var_0_11(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = arg_12_2[tostring(arg_12_1.id)] and not arg_12_3

	arg_12_0.Frame:SetAlpha(var_12_0 and 1 or 0)

	arg_12_0.HighlightBarBottom._silverTheme = var_12_0
end

local function var_0_12(arg_13_0, arg_13_1)
	if arg_13_1 == LUI.GAME_SOURCE_ID.MODERN_WARFARE or arg_13_1 == LUI.GAME_SOURCE_ID.COLD_WAR or arg_13_1 == LUI.GAME_SOURCE_ID.VANGUARD then
		ACTIONS.AnimateSequence(arg_13_0, "ShowWZSnipeBar")
		arg_13_0.SnipeIcon:UpdateSnipeIcon({
			selected = true,
			gameSourceID = arg_13_1
		})
		arg_13_0.SnipeOverlay:UpdateSnipeOverlay({
			useStoreButtonSetup = true,
			gameSourceID = arg_13_1
		})

		arg_13_0.isSnipeShowing = true
	else
		ACTIONS.AnimateSequence(arg_13_0, "HideWZSnipeBar")

		arg_13_0.isSnipeShowing = false
	end
end

local function var_0_13(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.UpdateButton = var_0_10
	arg_14_0.UpdateNewIndicator = var_0_6
	arg_14_0.UpdateChaseItem = var_0_11
	arg_14_0.UpdateWZSnipeBar = var_0_12
	arg_14_0._controllerIndex = arg_14_1

	arg_14_0:addEventHandler("gain_focus", function(arg_15_0, arg_15_1)
		ACTIONS.AnimateSequence(arg_14_0, "ButtonOver")
		arg_14_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 145, 200, LUI.EASING.outQuadratic)
		arg_14_0.ItemTitle:SetScale(-0.73, 200, LUI.EASING.outQuadratic)
		arg_14_0.ItemImage:SetScale(-0.75, 200, LUI.EASING.outQuadratic)
	end)
	arg_14_0:addEventHandler("lose_focus", function(arg_16_0, arg_16_1)
		ACTIONS.AnimateSequence(arg_14_0, "ButtonUp")

		if Dvar.IBEGCHEFE("MLTTQSTKQS") then
			ACTIONS.AnimateSequence(arg_14_0, "ButtonUpDark")
		end

		arg_14_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 120, 100, LUI.EASING.outQuadratic)
		arg_14_0.ItemTitle:SetScale(-0.75, 100)
		arg_14_0.ItemImage:SetScale(-0.78, 100)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_14_0, "AR")
	end
end

function MPStoreBillboardButton(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIButton.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 320 * _1080p, 0, 120 * _1080p)

	var_17_0.id = "MPStoreBillboardButton"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0

	var_17_0:setUseStencil(true)

	local var_17_3
	local var_17_4 = LUI.UIImage.new()

	var_17_4.id = "ItemImage"

	var_17_4:SetRGBFromTable(SWATCHES.BattlePass.DarkGrey, 0)
	var_17_4:SetScale(-0.78, 0)
	var_17_4:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_17_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -290, _1080p * 290)
	var_17_0:addElement(var_17_4)

	var_17_0.ItemImage = var_17_4

	local var_17_5
	local var_17_6 = LUI.UIImage.new()

	var_17_6.id = "FreeBanner"

	var_17_6:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_17_6:SetAlpha(0, 0)
	var_17_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top_opaque_dark"), 0)
	var_17_6:SetVMin(0.25, 0)
	var_17_6:SetVMax(0.75, 0)
	var_17_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 200, 0, 0, _1080p * 28)
	var_17_0:addElement(var_17_6)

	var_17_0.FreeBanner = var_17_6

	local var_17_7
	local var_17_8 = LUI.UIStyledText.new()

	var_17_8.id = "FreeText"

	var_17_8:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_17_8:SetAlpha(0, 0)
	var_17_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COST_FREE")), 0)
	var_17_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_17_8:SetWordWrap(false)
	var_17_8:SetTracking(2 * _1080p, 0)
	var_17_8:SetAlignment(LUI.Alignment.Center)
	var_17_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_17_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_17_8:SetStartupDelay(2000)
	var_17_8:SetLineHoldTime(400)
	var_17_8:SetAnimMoveTime(2000)
	var_17_8:SetAnimMoveSpeed(150)
	var_17_8:SetEndDelay(2000)
	var_17_8:SetCrossfadeTime(250)
	var_17_8:SetFadeInTime(300)
	var_17_8:SetFadeOutTime(300)
	var_17_8:SetMaxVisibleLines(1)
	var_17_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 200, _1080p * -30, _1080p * 5, _1080p * 23)
	var_17_0:addElement(var_17_8)

	var_17_0.FreeText = var_17_8

	local var_17_9
	local var_17_10 = LUI.UIImage.new()

	var_17_10.id = "ItemTitle"

	var_17_10:SetScale(-0.75, 0)
	var_17_10:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_17_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -177, _1080p * 335, _1080p * -86, _1080p * 170)
	var_17_0:addElement(var_17_10)

	var_17_0.ItemTitle = var_17_10

	local var_17_11
	local var_17_12 = LUI.UIImage.new()

	var_17_12.id = "Gradient"

	var_17_12:SetRGBFromInt(0, 0)
	var_17_12:SetAlpha(0.4, 0)
	var_17_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_17_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -75, 0)
	var_17_0:addElement(var_17_12)

	var_17_0.Gradient = var_17_12

	local var_17_13
	local var_17_14 = LUI.UIStyledText.new()

	var_17_14.id = "ItemName"

	var_17_14:SetRGBFromTable(SWATCHES.Store.TextIdle, 0)
	var_17_14:setText("", 0)
	var_17_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_14:SetWordWrap(false)
	var_17_14:SetAlignment(LUI.Alignment.Left)
	var_17_14:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_17_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_17_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_17_14:SetStartupDelay(2000)
	var_17_14:SetLineHoldTime(400)
	var_17_14:SetAnimMoveTime(2000)
	var_17_14:SetAnimMoveSpeed(150)
	var_17_14:SetEndDelay(2000)
	var_17_14:SetCrossfadeTime(250)
	var_17_14:SetFadeInTime(300)
	var_17_14:SetFadeOutTime(300)
	var_17_14:SetMaxVisibleLines(2)
	var_17_14:SetShadowRGBFromInt(0, 0)
	var_17_14:SetOutlineRGBFromInt(0, 0)
	var_17_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -27, _1080p * -3)
	var_17_0:addElement(var_17_14)

	var_17_0.ItemName = var_17_14

	local var_17_15
	local var_17_16 = LUI.UIImage.new()

	var_17_16.id = "Frame"

	var_17_16:SetAlpha(0, 0)
	var_17_16:SetColorOp(COLOR_OP.saturation, 0)
	var_17_16:setImage(RegisterMaterial("battlepass_lootcard_trim_gold_9slice"), 0)
	var_17_16:Setup9SliceImage(_1080p * 40, _1080p * 40, 0.2, 0.2)
	var_17_0:addElement(var_17_16)

	var_17_0.Frame = var_17_16

	local var_17_17
	local var_17_18 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_17_1
	})

	var_17_18.id = "HighlightBarBottom"

	var_17_18:SetAlpha(0, 0)
	var_17_18:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_17_0:addElement(var_17_18)

	var_17_0.HighlightBarBottom = var_17_18

	local var_17_19
	local var_17_20 = LUI.UIImage.new()

	var_17_20.id = "HotItemNotification"

	var_17_20:SetAlpha(0, 0)
	var_17_20:setImage(RegisterMaterial("hot_item_fireball_atlas"), 0)
	var_17_20:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -73, _1080p * -3, _1080p * -100, _1080p * -30)
	var_17_0:addElement(var_17_20)

	var_17_0.HotItemNotification = var_17_20

	local var_17_21
	local var_17_22 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_17_1
	})

	var_17_22.id = "LimitedTimeItem"

	var_17_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 220, _1080p * 320, _1080p * 42, _1080p * 72)
	var_17_0:addElement(var_17_22)

	var_17_0.LimitedTimeItem = var_17_22

	local var_17_23
	local var_17_24 = MenuBuilder.BuildRegisteredType("WZSnipeBackgroundSceneOverlay", {
		controllerIndex = var_17_1
	})

	var_17_24.id = "SnipeOverlay"

	var_17_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 320, _1080p * 90, _1080p * 120)
	var_17_0:addElement(var_17_24)

	var_17_0.SnipeOverlay = var_17_24

	local var_17_25
	local var_17_26 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_17_1
	})

	var_17_26.id = "SnipeIcon"

	var_17_26:SetScale(-0.1, 0)
	var_17_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 220, _1080p * 340, _1080p * 86, _1080p * 116)
	var_17_0:addElement(var_17_26)

	var_17_0.SnipeIcon = var_17_26

	local function var_17_27()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_27

	local var_17_28
	local var_17_29 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_17_4:RegisterAnimationSequence("ButtonOver", var_17_29)

	local var_17_30 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_12:RegisterAnimationSequence("ButtonOver", var_17_30)

	local var_17_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_17_14:RegisterAnimationSequence("ButtonOver", var_17_31)

	local var_17_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ButtonOver", var_17_32)

	local var_17_33 = {
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

	var_17_24:RegisterAnimationSequence("ButtonOver", var_17_33)

	local var_17_34 = {
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

	var_17_26:RegisterAnimationSequence("ButtonOver", var_17_34)

	local function var_17_35()
		var_17_4:AnimateSequence("ButtonOver")
		var_17_12:AnimateSequence("ButtonOver")
		var_17_14:AnimateSequence("ButtonOver")
		var_17_18:AnimateSequence("ButtonOver")
		var_17_24:AnimateSequence("ButtonOver")
		var_17_26:AnimateSequence("ButtonOver")
	end

	var_17_0._sequences.ButtonOver = var_17_35

	local var_17_36
	local var_17_37 = {
		{
			value = 5000268,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_17_4:RegisterAnimationSequence("ButtonUp", var_17_37)

	local var_17_38 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_12:RegisterAnimationSequence("ButtonUp", var_17_38)

	local var_17_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.TextIdle
		}
	}

	var_17_14:RegisterAnimationSequence("ButtonUp", var_17_39)

	local var_17_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ButtonUp", var_17_40)

	local var_17_41 = {
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

	var_17_24:RegisterAnimationSequence("ButtonUp", var_17_41)

	local var_17_42 = {
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

	var_17_26:RegisterAnimationSequence("ButtonUp", var_17_42)

	local function var_17_43()
		var_17_4:AnimateSequence("ButtonUp")
		var_17_12:AnimateSequence("ButtonUp")
		var_17_14:AnimateSequence("ButtonUp")
		var_17_18:AnimateSequence("ButtonUp")
		var_17_24:AnimateSequence("ButtonUp")
		var_17_26:AnimateSequence("ButtonUp")
	end

	var_17_0._sequences.ButtonUp = var_17_43

	local function var_17_44()
		return
	end

	var_17_0._sequences.Locked = var_17_44

	local var_17_45
	local var_17_46 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_12:RegisterAnimationSequence("ButtonOverDisabled", var_17_46)

	local function var_17_47()
		var_17_12:AnimateSequence("ButtonOverDisabled")
	end

	var_17_0._sequences.ButtonOverDisabled = var_17_47

	local var_17_48
	local var_17_49 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_12:RegisterAnimationSequence("ButtonUpDisabled", var_17_49)

	local function var_17_50()
		var_17_12:AnimateSequence("ButtonUpDisabled")
	end

	var_17_0._sequences.ButtonUpDisabled = var_17_50

	local var_17_51
	local var_17_52 = {
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

	var_17_14:RegisterAnimationSequence("AR", var_17_52)

	local function var_17_53()
		var_17_14:AnimateSequence("AR")
	end

	var_17_0._sequences.AR = var_17_53

	local var_17_54
	local var_17_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_17_4:RegisterAnimationSequence("CategoryEmpty", var_17_55)

	local function var_17_56()
		var_17_4:AnimateSequence("CategoryEmpty")
	end

	var_17_0._sequences.CategoryEmpty = var_17_56

	local var_17_57
	local var_17_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_17_4:RegisterAnimationSequence("CategoryNotEmpty", var_17_58)

	local function var_17_59()
		var_17_4:AnimateSequence("CategoryNotEmpty")
	end

	var_17_0._sequences.CategoryNotEmpty = var_17_59

	local var_17_60
	local var_17_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_6:RegisterAnimationSequence("Free", var_17_61)

	local var_17_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_8:RegisterAnimationSequence("Free", var_17_62)

	local function var_17_63()
		var_17_6:AnimateSequence("Free")
		var_17_8:AnimateSequence("Free")
	end

	var_17_0._sequences.Free = var_17_63

	local var_17_64
	local var_17_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_6:RegisterAnimationSequence("NotFree", var_17_65)

	local var_17_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_8:RegisterAnimationSequence("NotFree", var_17_66)

	local function var_17_67()
		var_17_6:AnimateSequence("NotFree")
		var_17_8:AnimateSequence("NotFree")
	end

	var_17_0._sequences.NotFree = var_17_67

	local var_17_68
	local var_17_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.DarkGrey
		}
	}

	var_17_4:RegisterAnimationSequence("ButtonUpDark", var_17_69)

	local function var_17_70()
		var_17_4:AnimateSequence("ButtonUpDark")
	end

	var_17_0._sequences.ButtonUpDark = var_17_70

	local var_17_71
	local var_17_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -90
		}
	}

	var_17_14:RegisterAnimationSequence("ShowWZSnipeBar", var_17_72)

	local var_17_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_24:RegisterAnimationSequence("ShowWZSnipeBar", var_17_73)

	local var_17_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_26:RegisterAnimationSequence("ShowWZSnipeBar", var_17_74)

	local function var_17_75()
		var_17_14:AnimateSequence("ShowWZSnipeBar")
		var_17_24:AnimateSequence("ShowWZSnipeBar")
		var_17_26:AnimateSequence("ShowWZSnipeBar")
	end

	var_17_0._sequences.ShowWZSnipeBar = var_17_75

	local var_17_76
	local var_17_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_17_14:RegisterAnimationSequence("HideWZSnipeBar", var_17_77)

	local var_17_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_24:RegisterAnimationSequence("HideWZSnipeBar", var_17_78)

	local var_17_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_26:RegisterAnimationSequence("HideWZSnipeBar", var_17_79)

	local function var_17_80()
		var_17_14:AnimateSequence("HideWZSnipeBar")
		var_17_24:AnimateSequence("HideWZSnipeBar")
		var_17_26:AnimateSequence("HideWZSnipeBar")
	end

	var_17_0._sequences.HideWZSnipeBar = var_17_80

	var_0_13(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("MPStoreBillboardButton", MPStoreBillboardButton)
LockTable(_M)
