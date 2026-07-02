module(..., package.seeall)

local var_0_0 = 3000
local var_0_1 = 150
local var_0_2 = 5

local function var_0_3(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	for iter_1_0, iter_1_1 in pairs(arg_1_1) do
		local var_1_0 = true

		if arg_1_2 then
			if iter_1_0 <= var_0_2 then
				var_1_0 = false
			end
		elseif iter_1_0 > var_0_2 then
			var_1_0 = false
		end

		if var_1_0 then
			local var_1_1 = LOOT.GetTypeForID(iter_1_1)
			local var_1_2 = LOOT.GetItemRef(var_1_1, iter_1_1)
			local var_1_3 = LOOT.GetItemQuality(var_1_1, var_1_2, iter_1_1)
			local var_1_4 = {
				type = var_1_1,
				image = LOOT.GetItemImage(var_1_1, var_1_2, iter_1_1),
				rarityImage = LOOT.GetRarityImage(var_1_3),
				rarityColor = LOOT.GetRarityColor(var_1_3)
			}

			if iter_1_0 > var_0_2 then
				iter_1_0 = iter_1_0 - var_0_2
			end

			local var_1_5 = arg_1_0["Card" .. iter_1_0]

			var_1_5:ResetCardConfig()
			var_1_5:UpdateCardConfig(var_1_4)
			var_1_5:SetAlpha(1, arg_1_3)

			if var_1_1 == LOOT.itemTypes.WEAPON then
				var_1_5:SetupTracer(var_1_5._controllerIndex, iter_1_1)
			end
		end
	end
end

local var_0_4

local function var_0_5(arg_2_0)
	arg_2_0.cardsFlipTimerHolder:Wait(var_0_0, true).onComplete = function()
		for iter_3_0 = 1, var_0_2 do
			arg_2_0["Card" .. iter_3_0]:SetAlpha(0, var_0_1)
		end

		arg_2_0.cardsFadeTimerHolder:Wait(var_0_1, true).onComplete = function()
			var_0_3(arg_2_0, arg_2_0._bundleItems, arg_2_0._isSecondGroup, var_0_1)

			arg_2_0._isSecondGroup = not arg_2_0._isSecondGroup
		end

		var_0_5(arg_2_0)
	end
end

local function var_0_6(arg_5_0)
	arg_5_0.cardsFlipTimerHolder:Wait(1, true)
	arg_5_0.cardsFadeTimerHolder:Wait(1, true)
end

local function var_0_7(arg_6_0, arg_6_1)
	for iter_6_0 = 1, var_0_2 do
		arg_6_0["Card" .. iter_6_0]:SetAlpha(0)
	end

	var_0_6(arg_6_0)

	local var_6_0 = LOOT.GetItemsInBundle(arg_6_1.id)

	var_0_3(arg_6_0, var_6_0, false, 0)

	arg_6_0._bundleItems = var_6_0

	if #var_6_0 > var_0_2 then
		var_0_5(arg_6_0)

		arg_6_0._isSecondGroup = true
	end
end

local function var_0_8(arg_7_0, arg_7_1, arg_7_2)
	for iter_7_0 = 1, var_0_2 do
		arg_7_0["Card" .. iter_7_0]:SetMiniMode(true)
		arg_7_0["Card" .. iter_7_0]:SetAlpha(0)
	end

	arg_7_0.SetupBundlePreview = var_0_7
	arg_7_0.RemoveTimers = var_0_6
	arg_7_0.cardsFlipTimerHolder = LUI.UIElement.new()

	arg_7_0:addElement(arg_7_0.cardsFlipTimerHolder)

	arg_7_0.cardsFadeTimerHolder = LUI.UIElement.new()

	arg_7_0:addElement(arg_7_0.cardsFadeTimerHolder)
end

function StoreBundlePreviewList(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIHorizontalStackedLayout.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 150 * _1080p)

	var_8_0.id = "StoreBundlePreviewList"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0

	var_8_0:SetSpacing(10 * _1080p)

	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "Card1"

	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 82, 0, _1080p * 110)
	var_8_0:addElement(var_8_4)

	var_8_0.Card1 = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "Card2"

	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 92, _1080p * 174, 0, _1080p * 110)
	var_8_0:addElement(var_8_6)

	var_8_0.Card2 = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "Card3"

	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 184, _1080p * 266, 0, _1080p * 110)
	var_8_0:addElement(var_8_8)

	var_8_0.Card3 = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "Card4"

	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 276, _1080p * 358, 0, _1080p * 110)
	var_8_0:addElement(var_8_10)

	var_8_0.Card4 = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "Card5"

	var_8_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 368, _1080p * 450, 0, _1080p * 110)
	var_8_0:addElement(var_8_12)

	var_8_0.Card5 = var_8_12

	var_0_8(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("StoreBundlePreviewList", StoreBundlePreviewList)
LockTable(_M)
