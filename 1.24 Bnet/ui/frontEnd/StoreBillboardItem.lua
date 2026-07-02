module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = {
		LOOT.itemTypes.OPERATOR,
		LOOT.itemTypes.OPERATOR_SKIN,
		LOOT.itemTypes.WEAPON,
		LOOT.itemTypes.WATCH,
		LOOT.itemTypes.CHARM
	}
	local var_1_1 = (function(arg_2_0)
		local var_2_0 = {}

		for iter_2_0, iter_2_1 in pairs(arg_2_0) do
			var_2_0[iter_2_1] = iter_2_0
		end

		return var_2_0
	end)(var_1_0)
	local var_1_2 = LOOT.GetItemsInBundle(arg_1_1.id)
	local var_1_3 = {}

	for iter_1_0, iter_1_1 in pairs(var_1_2) do
		local var_1_4 = LOOT.GetTypeForID(iter_1_1)
		local var_1_5 = LOOT.GetItemRef(var_1_4, iter_1_1)

		if var_1_5 and #var_1_5 > 0 then
			local var_1_6 = LOOT.GetItemQuality(var_1_4, var_1_5, iter_1_1)

			table.insert(var_1_3, {
				itemID = iter_1_1,
				ref = var_1_5,
				type = var_1_4,
				rarity = var_1_6
			})
		end
	end

	table.sort(var_1_3, function(arg_3_0, arg_3_1)
		local var_3_0 = var_1_1[arg_3_0.type]
		local var_3_1 = var_1_1[arg_3_1.type]

		if not var_3_0 and var_3_1 then
			return false
		end

		if var_3_0 and not var_3_1 then
			return true
		end

		if not var_3_0 and not var_3_1 then
			return arg_3_0.rarity > arg_3_1.rarity
		end

		if var_3_0 == var_3_1 then
			return arg_3_0.rarity > arg_3_1.rarity
		else
			return var_3_0 < var_3_1
		end
	end)

	local var_1_7 = {}
	local var_1_8
	local var_1_9 = 0

	for iter_1_2 = 1, #var_1_3 do
		if var_1_8 ~= var_1_3[iter_1_2].type then
			var_1_8 = var_1_3[iter_1_2].type
			var_1_9 = var_1_9 + 1
			var_1_7[var_1_9] = {}
		end

		table.insert(var_1_7[var_1_9], var_1_3[iter_1_2])
	end

	for iter_1_3 = 1, #var_1_7 do
		var_1_7[iter_1_3][1].sameRarityCount = 1

		for iter_1_4 = 1, #var_1_7[iter_1_3] do
			if var_1_7[iter_1_3][iter_1_4 + 1] and var_1_7[iter_1_3][1].rarity == var_1_7[iter_1_3][iter_1_4 + 1].rarity then
				var_1_7[iter_1_3][1].sameRarityCount = var_1_7[iter_1_3][1].sameRarityCount + 1
			end
		end
	end

	local var_1_10 = _1080p * 130
	local var_1_11 = _1080p * 10
	local var_1_12 = 0
	local var_1_13 = 0

	if #var_1_7 > 0 then
		arg_1_0.BundleItemDesc1.RarityIcon:setImage(RegisterMaterial(LOOT.GetRarityImage(var_1_7[1][1].rarity)))
		arg_1_0.BundleItemDesc1.RarityIcon:SetRGBFromTable(LOOT.GetRarityColor(var_1_7[1][1].rarity))

		local var_1_14 = arg_1_0.BundleItemDesc1:SetText(Engine.CBBHFCGDIC(LOOT.typeNameStrings[var_1_7[1][1].type], var_1_7[1][1].sameRarityCount))

		arg_1_0.BundleItemDesc1:SetAlpha(1)

		local var_1_15 = false

		if #var_1_7 > 1 then
			arg_1_0.BundleItemDesc2.RarityIcon:setImage(RegisterMaterial(LOOT.GetRarityImage(var_1_7[2][1].rarity)))
			arg_1_0.BundleItemDesc2.RarityIcon:SetRGBFromTable(LOOT.GetRarityColor(var_1_7[2][1].rarity))

			var_1_13 = arg_1_0.BundleItemDesc2:SetText(Engine.CBBHFCGDIC(LOOT.typeNameStrings[var_1_7[2][1].type], var_1_7[2][1].sameRarityCount))

			arg_1_0.BundleItemDesc2:SetAlpha(1)

			var_1_15 = true
		elseif #var_1_7[1] > 1 then
			local var_1_16 = -1

			for iter_1_5 = 1, #var_1_7[1] do
				if var_1_7[1][iter_1_5 + 1] and var_1_7[1][1].rarity ~= var_1_7[1][iter_1_5 + 1].rarity then
					var_1_16 = iter_1_5 + 1
				end
			end

			if var_1_16 == -1 then
				arg_1_0.BundleItemDesc2:SetAlpha(0)
			else
				local var_1_17 = 1

				for iter_1_6 = var_1_16, #var_1_7[1] do
					if var_1_7[1][iter_1_6 + 1] and var_1_7[1][var_1_16].rarity == var_1_7[1][iter_1_6 + 1].rarity then
						var_1_17 = var_1_17 + 1
					end
				end

				arg_1_0.BundleItemDesc2.RarityIcon:setImage(RegisterMaterial(LOOT.GetRarityImage(var_1_7[1][var_1_16].rarity)))
				arg_1_0.BundleItemDesc2.RarityIcon:SetRGBFromTable(LOOT.GetRarityColor(var_1_7[1][var_1_16].rarity))

				var_1_13 = arg_1_0.BundleItemDesc2:SetText(Engine.CBBHFCGDIC(LOOT.typeNameStrings[var_1_7[1][var_1_16].type], var_1_17))

				arg_1_0.BundleItemDesc2:SetAlpha(1)

				var_1_15 = true
			end
		else
			arg_1_0.BundleItemDesc2:SetAlpha(0)
		end

		local var_1_18 = var_1_10 + var_1_14

		arg_1_0.BundleItemDesc1:SetLeft(var_1_10, 1)
		arg_1_0.BundleItemDesc1:SetRight(var_1_18, 1)

		if var_1_15 then
			local var_1_19 = var_1_18 + var_1_11
			local var_1_20 = var_1_19 + var_1_13

			arg_1_0.BundleItemDesc2:SetLeft(var_1_19, 1)
			arg_1_0.BundleItemDesc2:SetRight(var_1_20, 1)
		end
	else
		arg_1_0.BundleItemDesc1:SetAlpha(0)
		arg_1_0.BundleItemDesc2:SetAlpha(0)
	end
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_1)

	if arg_4_1.description and not arg_4_1.emptyCategory then
		arg_4_0.Description:setText(arg_4_1.description)
		arg_4_0.Description:SetAlpha(1)
	else
		arg_4_0.Description:SetAlpha(0)
	end

	if arg_4_1.asset and #arg_4_1.asset > 0 then
		local var_4_0 = RegisterMaterial(arg_4_1.asset)

		if var_4_0 then
			arg_4_0.Image:SetAlpha(1)
			arg_4_0.Image:setImage(var_4_0)
		end
	else
		assert(false, "Missing Image Asset for Item ID " .. arg_4_1.id)
		arg_4_0.Image:SetAlpha(0)
	end

	if arg_4_1.titleImage and #arg_4_1.titleImage > 0 then
		local var_4_1 = RegisterMaterial(arg_4_1.titleImage)

		if var_4_1 then
			arg_4_0.TitleImage:SetAlpha(1)
			arg_4_0.TitleImage:setImage(var_4_1)
		else
			arg_4_0.TitleImage:SetAlpha(0)
		end
	else
		arg_4_0.TitleImage:SetAlpha(0)
	end

	local var_4_2 = arg_4_1.name

	if var_4_2 then
		local var_4_3 = Engine.DGAIDIEIAC()

		if not (var_4_3 == 0 or var_4_3 == 1) and not arg_4_2 then
			if arg_4_1.usesFirstPartyStore or arg_4_1.emptyCategory then
				arg_4_0.LocalizedTitle:SetAlpha(0)
			else
				arg_4_0.LocalizedTitle:SetAlpha(1)
				arg_4_0.LocalizedTitle:setText(Engine.CBBHFCGDIC(var_4_2))
			end
		else
			arg_4_0.LocalizedTitle:SetAlpha(0)
		end
	end

	if CONDITIONS.IsStoreBundlePreviewListEnabled(arg_4_0) then
		if not arg_4_1.emptyCategory and not arg_4_2 then
			arg_4_0.BundlePreviewList:SetupBundlePreview(arg_4_1)
			ACTIONS.AnimateSequence(arg_4_0, "ShowBundlePreview")
		else
			arg_4_0.BundlePreviewList:RemoveTimers()
			ACTIONS.AnimateSequence(arg_4_0, "HideBundlePreview")
		end
	elseif not arg_4_1.emptyCategory and not arg_4_2 then
		var_0_0(arg_4_0, arg_4_1)
	else
		arg_4_0.BundleItemDesc1:SetAlpha(0)
		arg_4_0.BundleItemDesc2:SetAlpha(0)
	end

	arg_4_0.LimitedTimeItem:SetupTimeLimit(nil, nil, arg_4_1.purchaseEnd, nil, true)

	local var_4_4 = 0
	local var_4_5 = _1080p * 330

	if arg_4_1.usesFirstPartyStore or arg_4_1.firstPartyProductID or arg_4_1.emptyCategory or not arg_4_1.currencyID or not arg_4_1.currencyAmount or arg_4_2 then
		ACTIONS.AnimateSequence(arg_4_0, "HidePrice")
	else
		if arg_4_1.currencyID == LOOT.CurrencyIDs.COD_POINTS then
			arg_4_0.Price.Currency:setImage(RegisterMaterial("icon_currency_codpoints"))
		elseif arg_4_1.currencyID == LOOT.CurrencyIDs.KEYS then
			arg_4_0.Price.Currency:setImage(RegisterMaterial("icon_currency_key"))
		else
			assert(false, "Unsupported currency!")
		end

		local var_4_6, var_4_7 = STORE.GetBundleCost(arg_4_0._controllerIndex, arg_4_1.id)
		local var_4_8 = var_4_6

		if var_4_7 and var_4_7 < var_4_6 then
			var_4_8 = var_4_7
		end

		if var_4_8 > 0 then
			arg_4_0.Price.Amount:setText(var_4_8)

			var_4_4 = arg_4_0.Prompt:SetText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_WITH_PROMPT"))

			if var_4_7 then
				arg_4_0.Price.Discount:setText(var_4_6)

				var_4_5 = _1080p * 380

				arg_4_0.Price:SetRight(var_4_5, 1)
				ACTIONS.AnimateSequence(arg_4_0.Price, "PriceWithDiscount")
			else
				arg_4_0.Price:SetRight(var_4_5, 1)
				ACTIONS.AnimateSequence(arg_4_0.Price, "PriceAndIcon")
			end
		else
			arg_4_0.Price:SetRight(var_4_5, 1)
			ACTIONS.AnimateSequence(arg_4_0.Price, "Free")

			var_4_4 = arg_4_0.Prompt:SetText(Engine.CBBHFCGDIC("LUA_MENU/CLAIM_BUNDLE_WITH_PROMPT"))
		end

		ACTIONS.AnimateSequence(arg_4_0, "ShowPrice")
	end

	local var_4_9 = arg_4_0._promotedItems[tostring(arg_4_1.id)]

	if not arg_4_2 then
		arg_4_0.HotItem:SetAlpha(var_4_9 and 1 or 0)
	end

	local var_4_10 = false

	if arg_4_1.id and not STORE.HasSeenItem(arg_4_0._controllerIndex, arg_4_1.id) and not arg_4_1.emptyCategory and not arg_4_2 then
		arg_4_0.NewItemNotification:SetAlpha(1)

		var_4_10 = true
	else
		arg_4_0.NewItemNotification:SetAlpha(0)

		var_4_10 = false
	end

	if var_4_10 then
		local var_4_11 = arg_4_0.NewItemNotification.Backer:GetCurrentAnchorsAndPositions()
		local var_4_12 = var_4_11.right - var_4_11.left
		local var_4_13 = var_4_9 and _1080p * 210 or _1080p * 96
		local var_4_14 = var_4_13 + var_4_12

		arg_4_0.NewItemNotification:SetLeft(var_4_13, 1)
		arg_4_0.NewItemNotification:SetRight(var_4_14, 1)
		arg_4_0.NewItemNotification:SetupLeftAlignment()
	end

	local var_4_15 = _1080p * 10
	local var_4_16 = arg_4_0._bundlePreviewEnabled and _1080p * 130 or var_4_5 + var_4_15
	local var_4_17 = var_4_16 + var_4_4

	arg_4_0.Prompt:SetLeft(var_4_16, 1)
	arg_4_0.Prompt:SetRight(var_4_17, 1)
	ACTIONS.AnimateSequence(arg_4_0, "Fade")
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._bundlePreviewEnabled = CONDITIONS.IsStoreBundlePreviewListEnabled(arg_5_0)

	if arg_5_0._bundlePreviewEnabled then
		ACTIONS.AnimateSequence(arg_5_0, "ConfigBundlePreview")
		arg_5_0.Description:SetMaxVisibleLines(2)
	else
		ACTIONS.AnimateSequence(arg_5_0, "ConfigBundleItemDesc")
		arg_5_0.Description:SetMaxVisibleLines(3)
	end

	arg_5_0.UpdateBillboard = var_0_1
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0._promotedItems = STORE.ParsePromotedItems(arg_5_1)

	ACTIONS.AnimateSequence(arg_5_0, "HidePrice")

	if arg_5_0.NewItemNotification then
		arg_5_0.NewItemNotification.Highlight:SetRGBFromTable(SWATCHES.Store.NewItemTab)
		arg_5_0.NewItemNotification.Backer:SetRGBFromTable(SWATCHES.Store.NewItemBackground)
	end
end

function StoreBillboardItem(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 580 * _1080p)

	var_6_0.id = "StoreBillboardItem"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Image"

	var_6_4:SetAlpha(0, 0)
	var_6_4:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Image = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIStyledText.new()

	var_6_6.id = "LocalizedTitle"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetWordWrap(false)
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_6:SetStartupDelay(2000)
	var_6_6:SetLineHoldTime(400)
	var_6_6:SetAnimMoveTime(2000)
	var_6_6:SetAnimMoveSpeed(150)
	var_6_6:SetEndDelay(2000)
	var_6_6:SetCrossfadeTime(250)
	var_6_6:SetFadeInTime(300)
	var_6_6:SetFadeOutTime(300)
	var_6_6:SetMaxVisibleLines(1)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 642, _1080p * 296, _1080p * 326)
	var_6_0:addElement(var_6_6)

	var_6_0.LocalizedTitle = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "TitleImage"

	var_6_8:SetAlpha(0, 0)
	var_6_8:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 608, _1080p * 40, _1080p * 296)
	var_6_0:addElement(var_6_8)

	var_6_0.TitleImage = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIStyledText.new()

	var_6_10.id = "Description"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_10:setText("", 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Left)
	var_6_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_6_10:SetStartupDelay(2000)
	var_6_10:SetLineHoldTime(400)
	var_6_10:SetAnimMoveTime(2000)
	var_6_10:SetAnimMoveSpeed(150)
	var_6_10:SetEndDelay(2000)
	var_6_10:SetCrossfadeTime(250)
	var_6_10:SetFadeInTime(300)
	var_6_10:SetFadeOutTime(300)
	var_6_10:SetMaxVisibleLines(2)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 821, _1080p * 330, _1080p * 354)
	var_6_0:addElement(var_6_10)

	var_6_0.Description = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("PriceButtonSmall", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Price"

	var_6_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 330, _1080p * -160, _1080p * -120)
	var_6_0:addElement(var_6_12)

	var_6_0.Price = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("PromptButton", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "Prompt"

	var_6_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 330, _1080p * -115, _1080p * -75)
	var_6_0:addElement(var_6_14)

	var_6_0.Prompt = var_6_14

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "NewItemNotification"

	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 210, _1080p * 288, _1080p * 5, _1080p * 37)
	var_6_0:addElement(var_6_16)

	var_6_0.NewItemNotification = var_6_16

	local var_6_17
	local var_6_18 = MenuBuilder.BuildRegisteredType("HotItem", {
		controllerIndex = var_6_1
	})

	var_6_18.id = "HotItem"

	var_6_18:SetAlpha(0, 0)
	var_6_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 196, _1080p * -45, _1080p * 55)
	var_6_0:addElement(var_6_18)

	var_6_0.HotItem = var_6_18

	local var_6_19

	if not CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
		var_6_19 = MenuBuilder.BuildRegisteredType("StoreBillboardDescItem", {
			controllerIndex = var_6_1
		})
		var_6_19.id = "BundleItemDesc1"

		var_6_19:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 330, _1080p * -164, _1080p * -140)
		var_6_0:addElement(var_6_19)

		var_6_0.BundleItemDesc1 = var_6_19
	end

	local var_6_20

	if not CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
		var_6_20 = MenuBuilder.BuildRegisteredType("StoreBillboardDescItem", {
			controllerIndex = var_6_1
		})
		var_6_20.id = "BundleItemDesc2"

		var_6_20:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 340, _1080p * 540, _1080p * -164, _1080p * -140)
		var_6_0:addElement(var_6_20)

		var_6_0.BundleItemDesc2 = var_6_20
	end

	local var_6_21
	local var_6_22 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_6_1
	})

	var_6_22.id = "LimitedTimeItem"

	var_6_22:SetAlpha(0, 0)
	var_6_22:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -396, _1080p * -96, _1080p * 15, _1080p * 45)
	var_6_0:addElement(var_6_22)

	var_6_0.LimitedTimeItem = var_6_22

	local var_6_23
	local var_6_24 = LUI.UIStyledText.new()

	var_6_24.id = "BundleIncludesText"

	var_6_24:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_6_24:setText(ToUpperCase(Engine.CBBHFCGDIC("INGAMESTORE/BUNDLE_INCLUDES")), 0)
	var_6_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_24:SetWordWrap(false)
	var_6_24:SetAlignment(LUI.Alignment.Left)
	var_6_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_24:SetStartupDelay(2000)
	var_6_24:SetLineHoldTime(400)
	var_6_24:SetAnimMoveTime(2000)
	var_6_24:SetAnimMoveSpeed(150)
	var_6_24:SetEndDelay(2000)
	var_6_24:SetCrossfadeTime(250)
	var_6_24:SetFadeInTime(300)
	var_6_24:SetFadeOutTime(300)
	var_6_24:SetMaxVisibleLines(1)
	var_6_24:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 358, _1080p * -195, _1080p * -171)
	var_6_0:addElement(var_6_24)

	var_6_0.BundleIncludesText = var_6_24

	local var_6_25
	local var_6_26 = LUI.UIImage.new()

	var_6_26.id = "BundleIncludesDivider"

	var_6_26:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_6_26:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_6_26:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 430, _1080p * -170, _1080p * -169)
	var_6_0:addElement(var_6_26)

	var_6_0.BundleIncludesDivider = var_6_26

	local var_6_27

	if CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
		var_6_27 = MenuBuilder.BuildRegisteredType("StoreBundlePreviewList", {
			controllerIndex = var_6_1
		})
		var_6_27.id = "BundlePreviewList"

		var_6_27:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 360, _1080p * 810, _1080p * -190, _1080p * -40)
		var_6_0:addElement(var_6_27)

		var_6_0.BundlePreviewList = var_6_27
	end

	local var_6_28
	local var_6_29 = LUI.UIImage.new()

	var_6_29.id = "Overlay"

	var_6_29:SetRGBFromInt(0, 0)
	var_6_29:SetAlpha(0, 0)
	var_6_0:addElement(var_6_29)

	var_6_0.Overlay = var_6_29

	local function var_6_30()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_30

	local var_6_31
	local var_6_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ShowPrice", var_6_32)

	local var_6_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("ShowPrice", var_6_33)

	local function var_6_34()
		var_6_12:AnimateSequence("ShowPrice")
		var_6_14:AnimateSequence("ShowPrice")
	end

	var_6_0._sequences.ShowPrice = var_6_34

	local var_6_35
	local var_6_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("HidePrice", var_6_36)

	local var_6_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("HidePrice", var_6_37)

	local function var_6_38()
		var_6_12:AnimateSequence("HidePrice")
		var_6_14:AnimateSequence("HidePrice")
	end

	var_6_0._sequences.HidePrice = var_6_38

	local var_6_39
	local var_6_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_6_29:RegisterAnimationSequence("Fade", var_6_40)

	local function var_6_41()
		var_6_29:AnimateSequence("Fade")
	end

	var_6_0._sequences.Fade = var_6_41

	local var_6_42
	local var_6_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_24:RegisterAnimationSequence("ShowBundlePreview", var_6_43)

	local var_6_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_26:RegisterAnimationSequence("ShowBundlePreview", var_6_44)

	if CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
		local var_6_45 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_27:RegisterAnimationSequence("ShowBundlePreview", var_6_45)
	end

	local function var_6_46()
		var_6_24:AnimateSequence("ShowBundlePreview")
		var_6_26:AnimateSequence("ShowBundlePreview")

		if CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
			var_6_27:AnimateSequence("ShowBundlePreview")
		end
	end

	var_6_0._sequences.ShowBundlePreview = var_6_46

	local var_6_47
	local var_6_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_24:RegisterAnimationSequence("HideBundlePreview", var_6_48)

	local var_6_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_26:RegisterAnimationSequence("HideBundlePreview", var_6_49)

	if CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
		local var_6_50 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_27:RegisterAnimationSequence("HideBundlePreview", var_6_50)
	end

	local function var_6_51()
		var_6_24:AnimateSequence("HideBundlePreview")
		var_6_26:AnimateSequence("HideBundlePreview")

		if CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
			var_6_27:AnimateSequence("HideBundlePreview")
		end
	end

	var_6_0._sequences.HideBundlePreview = var_6_51

	local var_6_52
	local var_6_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 821
		}
	}

	var_6_10:RegisterAnimationSequence("ConfigBundlePreview", var_6_53)

	local var_6_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -160
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -120
		}
	}

	var_6_12:RegisterAnimationSequence("ConfigBundlePreview", var_6_54)

	local var_6_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 330
		}
	}

	var_6_14:RegisterAnimationSequence("ConfigBundlePreview", var_6_55)

	if not CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
		local var_6_56 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_19:RegisterAnimationSequence("ConfigBundlePreview", var_6_56)
	end

	if not CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
		local var_6_57 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_20:RegisterAnimationSequence("ConfigBundlePreview", var_6_57)
	end

	local function var_6_58()
		var_6_10:AnimateSequence("ConfigBundlePreview")
		var_6_12:AnimateSequence("ConfigBundlePreview")
		var_6_14:AnimateSequence("ConfigBundlePreview")

		if not CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
			var_6_19:AnimateSequence("ConfigBundlePreview")
		end

		if not CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
			var_6_20:AnimateSequence("ConfigBundlePreview")
		end
	end

	var_6_0._sequences.ConfigBundlePreview = var_6_58

	local var_6_59
	local var_6_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 624
		}
	}

	var_6_10:RegisterAnimationSequence("ConfigBundleItemDesc", var_6_60)

	local var_6_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 330
		}
	}

	var_6_12:RegisterAnimationSequence("ConfigBundleItemDesc", var_6_61)

	local var_6_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 540
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -80
		}
	}

	var_6_14:RegisterAnimationSequence("ConfigBundleItemDesc", var_6_62)

	local var_6_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_24:RegisterAnimationSequence("ConfigBundleItemDesc", var_6_63)

	local var_6_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_26:RegisterAnimationSequence("ConfigBundleItemDesc", var_6_64)

	if CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
		local var_6_65 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_27:RegisterAnimationSequence("ConfigBundleItemDesc", var_6_65)
	end

	local function var_6_66()
		var_6_10:AnimateSequence("ConfigBundleItemDesc")
		var_6_12:AnimateSequence("ConfigBundleItemDesc")
		var_6_14:AnimateSequence("ConfigBundleItemDesc")
		var_6_24:AnimateSequence("ConfigBundleItemDesc")
		var_6_26:AnimateSequence("ConfigBundleItemDesc")

		if CONDITIONS.IsStoreBundlePreviewListEnabled(var_6_0) then
			var_6_27:AnimateSequence("ConfigBundleItemDesc")
		end
	end

	var_6_0._sequences.ConfigBundleItemDesc = var_6_66

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("StoreBillboardItem", StoreBillboardItem)
LockTable(_M)
