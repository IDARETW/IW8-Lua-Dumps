module(..., package.seeall)

local var_0_0 = 150 * _1080p
local var_0_1 = 200 * _1080p
local var_0_2 = 150
local var_0_3 = 0
local var_0_4 = -18
local var_0_5 = 0
local var_0_6 = 3

function RefreshAnimation(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		if arg_1_2 == true then
			assert(arg_1_0._sequences and arg_1_0._sequences[arg_1_1 .. "Snap"])
			ACTIONS.AnimateSequence(arg_1_0, arg_1_1 .. "Snap")
		else
			ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
		end
	end
end

local function var_0_7(arg_2_0, arg_2_1)
	arg_2_0._isOwned = arg_2_1
end

local function var_0_8(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._level = arg_3_1

	if arg_3_2 then
		arg_3_0.Level:setText(Engine.JCBDICCAH(arg_3_1))
		ACTIONS.AnimateSequence(arg_3_0, "ShowLevel")

		if arg_3_1 >= 100 then
			ACTIONS.AnimateSequence(arg_3_0, "LargeLevel")
		else
			ACTIONS.AnimateSequence(arg_3_0, "NormalLevel")
		end
	elseif arg_3_1 then
		arg_3_0.Level:setText(Engine.JCBDICCAH(arg_3_1))
		ACTIONS.AnimateSequence(arg_3_0, "MultiTier")
	else
		ACTIONS.AnimateSequence(arg_3_0, "HideLevel")
	end
end

local function var_0_9(arg_4_0)
	return arg_4_0 and 0 or var_0_2
end

local function var_0_10(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0._isAnimating then
		return
	end

	local function var_5_0()
		arg_5_0:CycleLootCards(1, true)

		arg_5_0._cycleEnabled = arg_5_1
	end

	if arg_5_2 then
		var_5_0()
	else
		arg_5_0:Wait(var_0_2).onComplete = var_5_0
	end
end

local function var_0_11(arg_7_0, arg_7_1)
	RefreshAnimation(arg_7_0, "ButtonUp", arg_7_1)

	for iter_7_0, iter_7_1 in ipairs(arg_7_0._lootCards) do
		iter_7_1:AnimateSequence(arg_7_1 and "ButtonUpSnap" or "ButtonUp")
	end

	var_0_10(arg_7_0, false, arg_7_1)

	if arg_7_0._isLocked then
		arg_7_0.Darkener:SetAlpha(not arg_7_0._battlePassOwned and not arg_7_0._isFree and 0.6 or 0, var_0_9(arg_7_1))
	end
end

local function var_0_12(arg_8_0, arg_8_1)
	if arg_8_0._battlePassOwned == true then
		arg_8_0.ArrowSelector:SetRGBFromTable(SWATCHES.BattlePass.Purchased, var_0_9(arg_8_1))
	else
		arg_8_0.ArrowSelector:SetRGBFromInt(16777215, var_0_9(arg_8_1))
	end

	RefreshAnimation(arg_8_0, "ButtonOver", arg_8_1)

	for iter_8_0, iter_8_1 in ipairs(arg_8_0._lootCards) do
		iter_8_1:AnimateSequence(arg_8_1 and "ButtonOverSnap" or "ButtonOver")
	end

	var_0_10(arg_8_0, true, arg_8_1)

	if arg_8_0._isAnimating then
		arg_8_0.ArrowSelector:SetAlpha(0)
	end

	if arg_8_0._isLocked then
		ACTIONS.AnimateSequence(arg_8_0, "ButtonOverDisabled")
	end
end

local function var_0_13(arg_9_0, arg_9_1)
	if arg_9_0._column == nil then
		return
	end

	LUI.FlowManager.GetScopedData("MainMenu").battlepassSelectedColumn = arg_9_0._column
	arg_9_0._isOver = true

	arg_9_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_1, 0, 0, var_0_9(arg_9_1))
	RefreshAnimation(arg_9_0.LootItemCard, "MiniButtonOver", arg_9_1)

	local var_9_0 = arg_9_0.lootData and arg_9_0.lootData.type

	if var_9_0 and (var_9_0 == LOOT.itemTypes.PLAYERCARD or var_9_0 == LOOT.itemTypes.EMBLEM or var_9_0 == LOOT.itemTypes.CHARM or var_9_0 == LOOT.itemTypes.STICKER or var_9_0 == LOOT.itemTypes.GESTURES or var_9_0 == LOOT.itemTypes.SPRAYS or var_9_0 == LOOT.itemTypes.FEATURE and not arg_9_0.lootData.isOperatorChallenge or var_9_0 == LOOT.itemTypes.CONSUMABLE or var_9_0 == "xp") then
		RefreshAnimation(arg_9_0.LootItemCard, "FocusGained", arg_9_1)
	end

	var_0_12(arg_9_0, arg_9_1)
end

local function var_0_14(arg_10_0, arg_10_1)
	arg_10_0._isOver = false

	arg_10_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_0, 0, 0, var_0_9(arg_10_1))
	RefreshAnimation(arg_10_0.LootItemCard, "FocusLost", arg_10_1)
	RefreshAnimation(arg_10_0.LootItemCard, "MiniButtonUp", arg_10_1)
	var_0_11(arg_10_0, arg_10_1)
end

local function var_0_15(arg_11_0, arg_11_1)
	arg_11_0._isLocked = arg_11_1

	if arg_11_0._isOver then
		var_0_12(arg_11_0, true)
	else
		var_0_11(arg_11_0, true)
	end

	arg_11_0.LockedIcon:SetAlpha(arg_11_1 and 1 or 0)
	arg_11_0.Darkener:SetAlpha(not arg_11_0._battlePassOwned and not arg_11_0._isFree and 0.6 or 0, 150)

	local var_11_0

	if arg_11_1 then
		var_11_0 = true

		arg_11_0.Frame:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_11_0, "HideCheckbox")
	elseif arg_11_0._isFree and not arg_11_0._battlePassOwned then
		var_11_0 = true

		arg_11_0.Frame:SetAlpha(0)
	else
		var_11_0 = false

		arg_11_0.Frame:SetAlpha(1)
	end

	for iter_11_0, iter_11_1 in ipairs(arg_11_0._lootCards) do
		iter_11_1.Border:SetAlpha(1)

		local var_11_1 = iter_11_1.lootData
		local var_11_2 = var_11_0 or var_11_1 and var_11_1.isLocked

		iter_11_1.Border:SetRGBFromTable(var_11_2 and SWATCHES.BattlePass.Locked or SWATCHES.BattlePass.Purchased)
	end
end

local function var_0_16(arg_12_0, arg_12_1)
	arg_12_0._battlePassOwned = arg_12_1
end

local function var_0_17(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0._isFree = arg_13_1

	if arg_13_2 then
		arg_13_0.FreeBanner:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_13_0.FreeBanner, "BundleVariant")
		arg_13_0.FreeBanner:SetText(Engine.CBBHFCGDIC("BATTLEPASS/BONUS"))
	elseif arg_13_1 then
		arg_13_0.FreeBanner:SetAlpha(1)

		if arg_13_0._battlePassOwned then
			arg_13_0.Frame:SetAlpha(1)
		else
			arg_13_0.Frame:SetAlpha(0)
		end

		for iter_13_0, iter_13_1 in ipairs(arg_13_0._lootCards) do
			iter_13_1.Border:SetRGBFromTable(arg_13_0._battlePassOwned and SWATCHES.BattlePass.Purchased or SWATCHES.BattlePass.Locked)
		end

		ACTIONS.AnimateSequence(arg_13_0.FreeBanner, "FreeVariant")

		if arg_13_0.lootData and arg_13_0.lootData.type == LOOT.itemTypes.WEAPON and not arg_13_0.lootData.IsVariant then
			arg_13_0.FreeBanner:SetText(Engine.CBBHFCGDIC("BATTLEPASS/FREE_GUN"))
		else
			arg_13_0.FreeBanner:SetText(Engine.CBBHFCGDIC("MENU/FREE"))
		end
	else
		arg_13_0.FreeBanner:SetAlpha(0)
	end
end

local function var_0_18(arg_14_0, arg_14_1, arg_14_2)
	assert(arg_14_0.itemData)

	local function var_14_0()
		if arg_14_1 == 1 then
			if arg_14_0._battlePassOwned then
				ACTIONS.AnimateSequence(arg_14_0, "CompletePurchased")
			else
				ACTIONS.AnimateSequence(arg_14_0, "CompleteFree")

				if not arg_14_0._isFree then
					ACTIONS.AnimateSequence(arg_14_0, "HideCheckbox")
				end
			end
		elseif arg_14_0._battlePassOwned then
			ACTIONS.AnimateSequence(arg_14_0, "IncompletePurchased")
		else
			ACTIONS.AnimateSequence(arg_14_0, "IncompleteFree")
		end
	end

	ACTIONS.AnimateSequence(arg_14_0.ProgressBar, arg_14_0._battlePassOwned and "Purchased" or "Free")

	if arg_14_0.itemData.showProgress then
		arg_14_0.ProgressBar:SetProgress(arg_14_1, arg_14_2, LUI.EASING.inOutCubic)
	else
		arg_14_0.ProgressBar:SetProgress(0, 0, LUI.EASING.inOutCubic)
	end

	if arg_14_2 and arg_14_2 > 0 then
		arg_14_0:Wait(arg_14_2, true).onComplete = var_14_0
	else
		var_14_0()
	end
end

local function var_0_19(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.ProgressBar:EnableGlow(arg_16_1, arg_16_0._battlePassOwned, arg_16_2)

	if arg_16_0._battlePassOwned then
		arg_16_0.LevelFlare:SetColorOp(COLOR_OP.none)
	else
		arg_16_0.LevelFlare:SetColorOp(COLOR_OP.saturation)
	end
end

local function var_0_20(arg_17_0, arg_17_1)
	arg_17_0._isAnimating = arg_17_1

	if arg_17_1 then
		arg_17_0.ArrowSelector:SetAlpha(0)
	end
end

local function var_0_21(arg_18_0, arg_18_1)
	arg_18_0:SetIsAnimating(arg_18_1)
	arg_18_0.LootItemCard:SetMiniMode()
end

local function var_0_22(arg_19_0, arg_19_1)
	if arg_19_1 then
		ACTIONS.AnimateSequence(arg_19_0, "Glint")
		arg_19_0.ShowcaseShine:SetRGBFromTable(arg_19_0.lootData and arg_19_0.lootData.rarityColor)
	else
		ACTIONS.AnimateSequence(arg_19_0, "StopGlint")
	end
end

local function var_0_23(arg_20_0, arg_20_1)
	arg_20_0._isShowcased = arg_20_1

	if arg_20_0._isShowcased then
		arg_20_0.BattlePassFlare:PlayBaseWeaponFlare()
	else
		arg_20_0.BattlePassFlare:ClearFlare()
	end
end

local function var_0_24(arg_21_0)
	if LUI.FlowManager.GetScopedData("MainMenu").battlepassSelectedColumn == arg_21_0._column then
		var_0_13(arg_21_0, true)
	else
		var_0_14(arg_21_0, true)
	end
end

local function var_0_25(arg_22_0)
	arg_22_0:RegisterAnimationSequence("ButtonOver", {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -95 + arg_22_0.horzOffset * var_0_5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95 + arg_22_0.horzOffset * var_0_5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297 + arg_22_0.vertOffset * var_0_6
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45 + arg_22_0.vertOffset * var_0_6
		}
	})
	arg_22_0:RegisterAnimationSequence("ButtonOverSnap", {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -95 + arg_22_0.horzOffset * var_0_5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95 + arg_22_0.horzOffset * var_0_5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297 + arg_22_0.vertOffset * var_0_6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45 + arg_22_0.vertOffset * var_0_6
		}
	})
	arg_22_0:RegisterAnimationSequence("ButtonUp", {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70 + arg_22_0.horzOffset
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70 + arg_22_0.horzOffset
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231 + arg_22_0.vertOffset
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45 + arg_22_0.vertOffset
		}
	})
	arg_22_0:RegisterAnimationSequence("ButtonUpSnap", {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70 + arg_22_0.horzOffset
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70 + arg_22_0.horzOffset
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231 + arg_22_0.vertOffset
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45 + arg_22_0.vertOffset
		}
	})
end

local function var_0_26(arg_23_0, arg_23_1)
	assert(arg_23_1 >= 1, "BattlePassItem requires at least 1 loot card")

	if arg_23_1 < 1 then
		return
	end

	arg_23_0._lootIndex = 1

	for iter_23_0, iter_23_1 in ipairs(arg_23_0._lootCards) do
		if arg_23_1 < iter_23_0 then
			arg_23_0._lootCards[iter_23_0]:closeTree()

			arg_23_0._lootCards[iter_23_0] = nil
		end
	end

	local var_23_0 = arg_23_0._lootCards[1]:GetCurrentAnchorsAndPositions()

	for iter_23_2 = 1, arg_23_1 do
		local var_23_1 = 0
		local var_23_2 = 0

		if iter_23_2 > 1 then
			var_23_1 = math.floor(var_0_3 / arg_23_1 * (iter_23_2 - 1))
			var_23_2 = math.floor(var_0_4 / arg_23_1 * (iter_23_2 - 1))
		end

		if iter_23_2 > 1 and not arg_23_0._lootCards[iter_23_2] then
			local var_23_3
			local var_23_4 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
				controllerIndex = arg_23_0._controllerIndex
			})

			var_23_4.id = "LootItemCard_" .. iter_23_2

			var_23_4:SetAnchorsAndPosition(var_23_0.leftAnchor, var_23_0.rightAnchor, var_23_0.topAnchor, var_23_0.bottomAnchor, var_23_0.left + var_23_1, var_23_0.right + var_23_1, var_23_0.top + var_23_2, var_23_0.bottom + var_23_2)
			var_23_4:SetMiniMode()
			var_23_4:addElementBefore(arg_23_0._lootCards[iter_23_2 - 1])

			arg_23_0._lootCards[iter_23_2] = var_23_4
		end

		arg_23_0._lootCards[iter_23_2].horzOffset = var_23_1
		arg_23_0._lootCards[iter_23_2].vertOffset = var_23_2

		var_0_25(arg_23_0._lootCards[iter_23_2])
	end

	var_0_24(arg_23_0)
	var_0_10(arg_23_0, true, true)
end

local function var_0_27(arg_24_0, arg_24_1)
	if not arg_24_1 or not arg_24_1.lootTable then
		return
	end

	local var_24_0 = #arg_24_1.lootTable

	var_0_26(arg_24_0, var_24_0)

	for iter_24_0, iter_24_1 in ipairs(arg_24_1.lootTable) do
		local var_24_1 = {}
		local var_24_2 = tonumber(iter_24_1.lootID)
		local var_24_3 = StringTable.DIFCHIGDFB(LOOT.GetLootFileForID(var_24_2), 0, var_24_2, 1)

		if var_24_3 and #var_24_3 > 0 then
			var_24_1.ref = var_24_3
			var_24_1.itemID = var_24_2
			var_24_1.type = LOOT.GetTypeForID(var_24_1.itemID)
			var_24_1.image = LOOT.GetItemImage(var_24_1.type, var_24_1.ref, var_24_1.itemID)
			var_24_1.rarity = LOOT.GetItemQuality(var_24_1.type, var_24_1.ref, var_24_1.itemID)
			var_24_1.rarityColor = LOOT.GetRarityColor(var_24_1.rarity)
			var_24_1.rarityImage = LOOT.GetRarityImage(var_24_1.rarity)
			var_24_1.className = LOOT.GetItemClassName(var_24_1.type, var_24_1.ref)
			var_24_1.IsVariant = var_24_1.type == LOOT.itemTypes.WEAPON and WEAPON.IsVariant(arg_24_0._controllerIndex, var_24_1.itemID)
			var_24_1.isLocked = iter_24_1.isLocked
			var_24_1.isOperatorChallengeReward = iter_24_1.isOperatorChallengeReward
			var_24_1.operatorChallengeName = iter_24_1.operatorChallengeName
			var_24_1.name = LOOT.GetItemName(var_24_1.type, var_24_1.ref, var_24_1.itemID)

			if tonumber(arg_24_1.codPoints) > 0 then
				var_24_1.amount = Engine.CBBHFCGDIC("LUA_MENU/COD_POINT_AMOUNT", arg_24_1.codPoints)
			end

			if var_24_1.type == LOOT.itemTypes.CONSUMABLE then
				local var_24_4 = StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, var_24_1.itemID, CSV.consumablesIDs.cols.duration)

				if var_24_4 ~= nil and #var_24_4 > 0 then
					var_24_1.duration = Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, var_24_1.itemID, CSV.consumablesIDs.cols.duration))
				end
			elseif var_24_1.type == LOOT.itemTypes.FEATURE then
				var_24_1.isOperatorChallenge = LOOT.IsFeatureOperatorChallenge(var_24_1.ref)
			end
		end

		arg_24_0._lootCards[iter_24_0]:UpdateCardConfig(var_24_1)
		arg_24_0._lootCards[iter_24_0].Tracer:SetAlpha(0)

		if var_24_1.type == LOOT.itemTypes.WEAPON then
			arg_24_0._lootCards[iter_24_0]:SetupTracer(nil, var_24_2)
		end

		arg_24_0._lootCards[iter_24_0].lootData = var_24_1
	end

	arg_24_0.lootData = arg_24_0._lootCards[1].lootData
end

local function var_0_28(arg_25_0, arg_25_1, arg_25_2)
	if not arg_25_0._cycleEnabled and not arg_25_2 or arg_25_0._isAnimating then
		return
	end

	if arg_25_0.ProgressLine:getParent() == nil then
		assert(false, "progression line's parent is nil. lootIndex " .. arg_25_1 .. " self._isAnimating " .. (arg_25_0._isAnimating and "true" or "false"))

		return
	end

	local var_25_0 = {}
	local var_25_1 = arg_25_0._lootCards[1]:GetCurrentAnchorsAndPositions()

	for iter_25_0, iter_25_1 in ipairs(arg_25_0._lootCards) do
		local var_25_2 = arg_25_1 - (iter_25_0 - 1)

		if var_25_2 <= 0 then
			var_25_2 = iter_25_0
		end

		var_25_0[var_25_2] = iter_25_1

		iter_25_1:RemoveFromParent()
	end

	for iter_25_2, iter_25_3 in ipairs(var_25_0) do
		if iter_25_2 == 1 then
			iter_25_3:addElementBefore(arg_25_0.ProgressLine)

			arg_25_0.lootData = iter_25_3.lootData

			local var_25_3 = iter_25_3:GetCurrentAnchorsAndPositions()
			local var_25_4 = var_25_0[#var_25_0]:GetCurrentAnchorsAndPositions()
			local var_25_5 = math.abs(var_25_3.right - var_25_3.left)

			arg_25_0.Frame:SetAnchorsAndPosition(var_25_3.leftAnchor, var_25_3.rightAnchor, var_25_3.topAnchor, var_25_3.bottomAnchor, var_25_3.left, var_25_3.right, var_25_3.top, var_25_3.bottom)
			arg_25_0.Mask:SetAnchorsAndPosition(var_25_3.leftAnchor, var_25_3.rightAnchor, var_25_3.topAnchor, var_25_3.bottomAnchor, var_25_3.left, var_25_3.right, var_25_3.top, var_25_3.bottom)

			local var_25_6 = arg_25_0.Checkbox:GetCurrentAnchorsAndPositions()
			local var_25_7 = math.abs(var_25_6.right - var_25_6.left)
			local var_25_8 = math.abs(var_25_6.bottom - var_25_6.top)

			arg_25_0.Checkbox:SetAnchorsAndPosition(var_25_6.leftAnchor, var_25_6.rightAnchor, var_25_6.topAnchor, var_25_6.bottomAnchor, var_25_3.right - var_25_7, var_25_3.right, var_25_3.top, var_25_3.top + var_25_8)
			arg_25_0.CheckboxFrame:SetAnchorsAndPosition(var_25_6.leftAnchor, var_25_6.rightAnchor, var_25_6.topAnchor, var_25_6.bottomAnchor, var_25_3.right - var_25_7, var_25_3.right, var_25_3.top, var_25_3.top + var_25_8)

			local var_25_9 = arg_25_0.LockedIcon:GetCurrentAnchorsAndPositions()
			local var_25_10 = var_25_9.bottom - var_25_9.top
			local var_25_11 = var_25_9.right - var_25_9.left
			local var_25_12 = 4
			local var_25_13 = 4

			arg_25_0.LockedIcon:SetAnchorsAndPosition(var_25_9.leftAnchor, var_25_9.rightAnchor, var_25_9.topAnchor, var_25_9.bottomAnchor, var_25_3.right - var_25_11 - var_25_13, var_25_3.right - var_25_13, var_25_3.top + var_25_12, var_25_3.top + var_25_10 + var_25_12)

			local var_25_14 = arg_25_0.MissionIcon:GetCurrentAnchorsAndPositions()
			local var_25_15 = var_25_14.bottom - var_25_14.top
			local var_25_16 = var_25_14.right - var_25_14.left
			local var_25_17 = 6
			local var_25_18 = 4

			arg_25_0.MissionIcon:SetAnchorsAndPosition(var_25_14.leftAnchor, var_25_14.rightAnchor, var_25_14.topAnchor, var_25_14.bottomAnchor, var_25_3.left + var_25_18, var_25_3.left + var_25_18 + var_25_16, var_25_3.top + var_25_17, var_25_3.top + var_25_15 + var_25_17)

			local var_25_19 = arg_25_0.ArrowSelector:GetCurrentAnchorsAndPositions()
			local var_25_20 = math.abs(var_25_19.right - var_25_19.left)
			local var_25_21 = math.abs(var_25_19.bottom - var_25_19.top)

			arg_25_0.ArrowSelector:SetAnchorsAndPosition(var_25_19.leftAnchor, var_25_19.rightAnchor, var_25_19.topAnchor, var_25_19.bottomAnchor, var_25_3.left + var_25_5 / 2 - var_25_20 / 2, var_25_3.right - var_25_5 / 2 + var_25_20 / 2, var_25_3.top, var_25_3.top - var_25_21)

			local var_25_22 = arg_25_0.FreeBanner:GetCurrentAnchorsAndPositions()
			local var_25_23 = math.abs(var_25_22.bottom - var_25_22.top)
			local var_25_24 = arg_25_0._isOver and var_25_3 or var_25_4

			arg_25_0.FreeBanner:SetAnchorsAndPosition(var_25_22.leftAnchor, var_25_22.rightAnchor, var_25_22.topAnchor, var_25_22.bottomAnchor, var_25_24.left, var_25_24.right, var_25_24.top - var_25_23, var_25_24.top)

			if iter_25_3.lootData and iter_25_3.lootData.isLocked or arg_25_0._isLocked then
				arg_25_0.Checkbox:SetAlpha(0)
				arg_25_0.CheckboxFrame:SetAlpha(0)
				arg_25_0.Frame:SetAlpha(0)
				arg_25_0.LockedIcon:SetAlpha(1)
			elseif not arg_25_0._isLocked then
				arg_25_0.Checkbox:SetAlpha(1)
				arg_25_0.CheckboxFrame:SetAlpha(1)
				arg_25_0.Frame:SetAlpha(1)
				arg_25_0.LockedIcon:SetAlpha(0)
			end

			if arg_25_0._isOver then
				RefreshAnimation(iter_25_3, "MiniButtonOver", true)
			end

			local var_25_25 = iter_25_3.lootData and iter_25_3.lootData.type

			if var_25_25 and arg_25_0._isOver then
				if var_25_25 == LOOT.itemTypes.PLAYERCARD or var_25_25 == LOOT.itemTypes.EMBLEM or var_25_25 == LOOT.itemTypes.CHARM or var_25_25 == LOOT.itemTypes.STICKER or var_25_25 == LOOT.itemTypes.GESTURES or var_25_25 == LOOT.itemTypes.SPRAYS or var_25_25 == LOOT.itemTypes.FEATURE and not iter_25_3.lootData.isOperatorChallenge or var_25_25 == LOOT.itemTypes.CONSUMABLE or var_25_25 == "xp" then
					RefreshAnimation(iter_25_3, "FocusGained", true)
				else
					RefreshAnimation(iter_25_3, "FocusLost", true)
				end
			end

			if arg_25_0._isShowcased then
				local var_25_26 = var_25_0[1] == arg_25_0._lootCards[1]

				arg_25_0:SetShowcased(var_25_26 and arg_25_0._isShowcased)

				arg_25_0._isShowcased = true
			end
		else
			iter_25_3:addElementBefore(var_25_0[iter_25_2 - 1])
			RefreshAnimation(iter_25_3, "MiniButtonUp", true)
			RefreshAnimation(iter_25_3, "FocusLost", true)
		end
	end

	for iter_25_4 = 1, #var_25_0 do
		if iter_25_4 == 1 then
			var_25_0[iter_25_4]:SetRGBFromTable(SWATCHES.BattlePass.White)
		else
			var_25_0[iter_25_4]:SetRGBFromTable(SWATCHES.BattlePass.DarkGrey)
		end
	end
end

local function var_0_29(arg_26_0, arg_26_1)
	arg_26_0.MissionIcon:SetAlpha(arg_26_1 and 1 or 0)
end

local function var_0_30(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0.SetBattlePassOwned = var_0_16
	arg_27_0.SetProgress = var_0_18
	arg_27_0.SetLocked = var_0_15
	arg_27_0.SetLevel = var_0_8
	arg_27_0.SetTopBanner = var_0_17
	arg_27_0.EnableGlow = var_0_19
	arg_27_0.ShowMission = var_0_29
	arg_27_0.SetIsAnimating = var_0_20
	arg_27_0.SetPromoted = var_0_22
	arg_27_0.SetShowcased = var_0_23
	arg_27_0.UpdateExpandedState = var_0_24
	arg_27_0.SetOwned = var_0_7
	arg_27_0.SetupLootData = var_0_27
	arg_27_0.CycleLootCards = var_0_28
	arg_27_0._controllerIndex = arg_27_1
	arg_27_0._isLocked = false
	arg_27_0._isFree = false
	arg_27_0._isOver = false
	arg_27_0._isAnimating = false
	arg_27_0._battlePassOwned = false
	arg_27_0._isOwned = false
	arg_27_0._level = 0
	arg_27_0._cycleEnabled = false
	arg_27_0._lootCards = {
		arg_27_0.LootItemCard
	}

	arg_27_0.LootItemCard:SetMiniMode()
	arg_27_0.ShowcaseShine:SetMask(arg_27_0.Mask)
	arg_27_0.Mask:SetAlpha(1)
	arg_27_0:addEventHandler("button_over", function(arg_28_0, arg_28_1)
		var_0_13(arg_28_0, false)
	end)
	arg_27_0:addEventHandler("lose_active", function(arg_29_0, arg_29_1)
		var_0_14(arg_29_0, false)
	end)
	arg_27_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_0, 0, 0)
	arg_27_0:SetGridChildDynamicSize(true, LUI.DIRECTION.horizontal)
	arg_27_0:setGainFocusAllSFX(SOUND_SETS.battlePass.bpCardHighlight, {
		clearChildrenSFX = true
	})
end

function BattlePassItem(arg_30_0, arg_30_1)
	local var_30_0 = LUI.UIButton.new()

	var_30_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 160 * _1080p, 0, 238 * _1080p)

	var_30_0.id = "BattlePassItem"
	var_30_0._animationSets = var_30_0._animationSets or {}
	var_30_0._sequences = var_30_0._sequences or {}

	local var_30_1 = arg_30_1 and arg_30_1.controllerIndex

	if not var_30_1 and not Engine.DDJFBBJAIG() then
		var_30_1 = var_30_0:getRootController()
	end

	assert(var_30_1)

	local var_30_2 = var_30_0
	local var_30_3
	local var_30_4 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_30_1
	})

	var_30_4.id = "LootItemCard"

	var_30_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -231, _1080p * -45)
	var_30_0:addElement(var_30_4)

	var_30_0.LootItemCard = var_30_4

	local var_30_5
	local var_30_6 = LUI.UIImage.new()

	var_30_6.id = "ProgressLine"

	var_30_6:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_30_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -5, _1080p * -5, _1080p * -17, _1080p * -18)
	var_30_0:addElement(var_30_6)

	var_30_0.ProgressLine = var_30_6

	local var_30_7
	local var_30_8 = LUI.UIImage.new()

	var_30_8.id = "Fill"

	var_30_8:SetRGBFromTable(SWATCHES.BattlePass.Locked, 0)
	var_30_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -27, _1080p * -5, _1080p * -28, _1080p * -8)
	var_30_0:addElement(var_30_8)

	var_30_0.Fill = var_30_8

	local var_30_9
	local var_30_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_30_11 = LUI.UIBorder.new(var_30_10)

	var_30_11.id = "LevelBorder"

	var_30_11:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_30_11:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -27, _1080p * -5, _1080p * -28, _1080p * -8)
	var_30_0:addElement(var_30_11)

	var_30_0.LevelBorder = var_30_11

	local var_30_12
	local var_30_13 = LUI.UIText.new()

	var_30_13.id = "Level"

	var_30_13:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_30_13:setText("99", 0)
	var_30_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_30_13:SetWordWrap(false)
	var_30_13:SetTracking(-1 * _1080p, 0)
	var_30_13:SetAlignment(LUI.Alignment.Center)
	var_30_13:SetVerticalAlignment(LUI.Alignment.Center)
	var_30_13:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -26, _1080p * -6, _1080p * -28, _1080p * -10)
	var_30_0:addElement(var_30_13)

	var_30_0.Level = var_30_13

	local var_30_14
	local var_30_15 = MenuBuilder.BuildRegisteredType("BattlePassProgressBar", {
		controllerIndex = var_30_1
	})

	var_30_15.id = "ProgressBar"

	var_30_15.Fill:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_30_15.Cap:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_30_15.Cap:SetAlpha(0, 0)
	var_30_15.Glint:SetAlpha(0, 0)
	var_30_15:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -5, _1080p * -27, _1080p * -21, _1080p * -15)
	var_30_0:addElement(var_30_15)

	var_30_0.ProgressBar = var_30_15

	local var_30_16
	local var_30_17 = LUI.UIImage.new()

	var_30_17.id = "LevelFlare"

	var_30_17:SetAlpha(0, 0)
	var_30_17:setImage(RegisterMaterial("battlepass_progressbar_square"), 0)
	var_30_17:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_30_17:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -41, _1080p * 9, _1080p * -45, _1080p * 9)
	var_30_0:addElement(var_30_17)

	var_30_0.LevelFlare = var_30_17

	local var_30_18
	local var_30_19 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_30_20 = LUI.UIBorder.new(var_30_19)

	var_30_20.id = "CheckboxFrame"

	var_30_20:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_30_20:SetAlpha(0, 0)
	var_30_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 51, _1080p * 69, _1080p * -230, _1080p * -212)
	var_30_0:addElement(var_30_20)

	var_30_0.CheckboxFrame = var_30_20

	local var_30_21
	local var_30_22 = LUI.UIImage.new()

	var_30_22.id = "Frame"

	var_30_22:setImage(RegisterMaterial("battlepass_lootcard_trim_gold_9slice"), 0)
	var_30_22:Setup9SliceImage(_1080p * 70, _1080p * 70, 0.5, 0.5)
	var_30_22:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -231, _1080p * -45)
	var_30_0:addElement(var_30_22)

	var_30_0.Frame = var_30_22

	local var_30_23
	local var_30_24 = LUI.UIImage.new()

	var_30_24.id = "ArrowSelector"

	var_30_24:SetAlpha(0, 0)
	var_30_24:setImage(RegisterMaterial("battlepass_arrow_atlas"), 0)
	var_30_24:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -241, _1080p * -281)
	var_30_0:addElement(var_30_24)

	var_30_0.ArrowSelector = var_30_24

	local var_30_25
	local var_30_26 = LUI.UIImage.new()

	var_30_26.id = "Darkener"

	var_30_26:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_30_26:SetAlpha(0.6, 0)
	var_30_26:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -231, _1080p * -45)
	var_30_0:addElement(var_30_26)

	var_30_0.Darkener = var_30_26

	local var_30_27
	local var_30_28 = LUI.UIImage.new()

	var_30_28.id = "Checkbox"

	var_30_28:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_30_28:SetAlpha(0, 0)
	var_30_28:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_30_28:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 51, _1080p * 69, _1080p * -230, _1080p * -212)
	var_30_0:addElement(var_30_28)

	var_30_0.Checkbox = var_30_28

	local var_30_29
	local var_30_30 = LUI.UIImage.new()

	var_30_30.id = "LockedIcon"

	var_30_30:SetAlpha(0, 0)
	var_30_30:setImage(RegisterMaterial("battlepass_lock"), 0)
	var_30_30:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 40, _1080p * 65, _1080p * -226, _1080p * -200)
	var_30_0:addElement(var_30_30)

	var_30_0.LockedIcon = var_30_30

	local var_30_31
	local var_30_32 = LUI.UIImage.new()

	var_30_32.id = "MissionIcon"

	var_30_32:setImage(RegisterMaterial("battlepass_operator_challenge_icon"), 0)
	var_30_32:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -63, _1080p * -35, _1080p * -223, _1080p * -195)
	var_30_0:addElement(var_30_32)

	var_30_0.MissionIcon = var_30_32

	local var_30_33
	local var_30_34 = LUI.UIImage.new()

	var_30_34.id = "ShowcaseShine"

	var_30_34:SetAlpha(0, 0)
	var_30_34:SetZRotation(-45, 0)
	var_30_34:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_30_34:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_30_34:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -268, _1080p * -148, _1080p * -607, 0)
	var_30_0:addElement(var_30_34)

	var_30_0.ShowcaseShine = var_30_34

	local var_30_35
	local var_30_36 = LUI.UIImage.new()

	var_30_36.id = "Mask"

	var_30_36:SetAlpha(0, 0)
	var_30_36:setImage(RegisterMaterial("stencil_mask"), 0)
	var_30_36:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -231, _1080p * -45)
	var_30_0:addElement(var_30_36)

	var_30_0.Mask = var_30_36

	local var_30_37
	local var_30_38 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_30_1
	})

	var_30_38.id = "FreeBanner"

	var_30_38:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -253, _1080p * -229)
	var_30_0:addElement(var_30_38)

	var_30_0.FreeBanner = var_30_38

	local var_30_39
	local var_30_40 = MenuBuilder.BuildRegisteredType("BattlePassFlare", {
		controllerIndex = var_30_1
	})

	var_30_40.id = "BattlePassFlare"

	var_30_40:SetScale(-0.25, 0)
	var_30_40:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -100, _1080p * 100, _1080p * -177, _1080p * 61)
	var_30_0:addElement(var_30_40)

	var_30_0.BattlePassFlare = var_30_40

	local function var_30_41()
		return
	end

	var_30_0._sequences.DefaultSequence = var_30_41

	local var_30_42
	local var_30_43 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -296
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -271
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 69
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_30_20:RegisterAnimationSequence("ButtonOver", var_30_43)

	local var_30_44 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -95
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		}
	}

	var_30_22:RegisterAnimationSequence("ButtonOver", var_30_44)

	local var_30_45 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -308
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -348
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_24:RegisterAnimationSequence("ButtonOver", var_30_45)

	local var_30_46 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -95
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_26:RegisterAnimationSequence("ButtonOver", var_30_46)

	local var_30_47 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -296
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -271
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 69
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_30_28:RegisterAnimationSequence("ButtonOver", var_30_47)

	local var_30_48 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 64
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -291
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 89
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -265
		}
	}

	var_30_30:RegisterAnimationSequence("ButtonOver", var_30_48)

	local var_30_49 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -89
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -289
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -61
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -261
		}
	}

	var_30_32:RegisterAnimationSequence("ButtonOver", var_30_49)

	local var_30_50 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -95
		}
	}

	var_30_36:RegisterAnimationSequence("ButtonOver", var_30_50)

	local var_30_51 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -319
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -95
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -295
		}
	}

	var_30_38:RegisterAnimationSequence("ButtonOver", var_30_51)

	local var_30_52 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -185
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 53
		}
	}

	var_30_40:RegisterAnimationSequence("ButtonOver", var_30_52)

	local function var_30_53()
		var_30_20:AnimateSequence("ButtonOver")
		var_30_22:AnimateSequence("ButtonOver")
		var_30_24:AnimateSequence("ButtonOver")
		var_30_26:AnimateSequence("ButtonOver")
		var_30_28:AnimateSequence("ButtonOver")
		var_30_30:AnimateSequence("ButtonOver")
		var_30_32:AnimateSequence("ButtonOver")
		var_30_36:AnimateSequence("ButtonOver")
		var_30_38:AnimateSequence("ButtonOver")
		var_30_40:AnimateSequence("ButtonOver")
	end

	var_30_0._sequences.ButtonOver = var_30_53

	local var_30_54
	local var_30_55 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 51
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -230
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -212
		}
	}

	var_30_20:RegisterAnimationSequence("ButtonUp", var_30_55)

	local var_30_56 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		}
	}

	var_30_22:RegisterAnimationSequence("ButtonUp", var_30_56)

	local var_30_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -241
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -281
		}
	}

	var_30_24:RegisterAnimationSequence("ButtonUp", var_30_57)

	local var_30_58 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_30_26:RegisterAnimationSequence("ButtonUp", var_30_58)

	local var_30_59 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 51
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -230
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -212
		}
	}

	var_30_28:RegisterAnimationSequence("ButtonUp", var_30_59)

	local var_30_60 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 65
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -226
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -200
		}
	}

	var_30_30:RegisterAnimationSequence("ButtonUp", var_30_60)

	local var_30_61 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -223
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -195
		}
	}

	var_30_32:RegisterAnimationSequence("ButtonUp", var_30_61)

	local var_30_62 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		}
	}

	var_30_36:RegisterAnimationSequence("ButtonUp", var_30_62)

	local var_30_63 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -253
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -229
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		}
	}

	var_30_38:RegisterAnimationSequence("ButtonUp", var_30_63)

	local var_30_64 = {
		{
			value = -0.26,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -178
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		}
	}

	var_30_40:RegisterAnimationSequence("ButtonUp", var_30_64)

	local function var_30_65()
		var_30_20:AnimateSequence("ButtonUp")
		var_30_22:AnimateSequence("ButtonUp")
		var_30_24:AnimateSequence("ButtonUp")
		var_30_26:AnimateSequence("ButtonUp")
		var_30_28:AnimateSequence("ButtonUp")
		var_30_30:AnimateSequence("ButtonUp")
		var_30_32:AnimateSequence("ButtonUp")
		var_30_36:AnimateSequence("ButtonUp")
		var_30_38:AnimateSequence("ButtonUp")
		var_30_40:AnimateSequence("ButtonUp")
	end

	var_30_0._sequences.ButtonUp = var_30_65

	local var_30_66
	local var_30_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Locked
		}
	}

	var_30_8:RegisterAnimationSequence("IncompleteFree", var_30_67)

	local var_30_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		}
	}

	var_30_13:RegisterAnimationSequence("IncompleteFree", var_30_68)

	local function var_30_69()
		var_30_8:AnimateSequence("IncompleteFree")
		var_30_13:AnimateSequence("IncompleteFree")
	end

	var_30_0._sequences.IncompleteFree = var_30_69

	local var_30_70
	local var_30_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		}
	}

	var_30_8:RegisterAnimationSequence("CompleteFree", var_30_71)

	local var_30_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Locked
		}
	}

	var_30_13:RegisterAnimationSequence("CompleteFree", var_30_72)

	local var_30_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_20:RegisterAnimationSequence("CompleteFree", var_30_73)

	local var_30_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_28:RegisterAnimationSequence("CompleteFree", var_30_74)

	local function var_30_75()
		var_30_8:AnimateSequence("CompleteFree")
		var_30_13:AnimateSequence("CompleteFree")
		var_30_20:AnimateSequence("CompleteFree")
		var_30_28:AnimateSequence("CompleteFree")
	end

	var_30_0._sequences.CompleteFree = var_30_75

	local var_30_76
	local var_30_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_30_8:RegisterAnimationSequence("IncompletePurchased", var_30_77)

	local var_30_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		}
	}

	var_30_11:RegisterAnimationSequence("IncompletePurchased", var_30_78)

	local var_30_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		}
	}

	var_30_13:RegisterAnimationSequence("IncompletePurchased", var_30_79)

	local function var_30_80()
		var_30_8:AnimateSequence("IncompletePurchased")
		var_30_11:AnimateSequence("IncompletePurchased")
		var_30_13:AnimateSequence("IncompletePurchased")
	end

	var_30_0._sequences.IncompletePurchased = var_30_80

	local var_30_81
	local var_30_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_30_8:RegisterAnimationSequence("CompletePurchased", var_30_82)

	local var_30_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_11:RegisterAnimationSequence("CompletePurchased", var_30_83)

	local var_30_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_30_13:RegisterAnimationSequence("CompletePurchased", var_30_84)

	local var_30_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_20:RegisterAnimationSequence("CompletePurchased", var_30_85)

	local var_30_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_28:RegisterAnimationSequence("CompletePurchased", var_30_86)

	local function var_30_87()
		var_30_8:AnimateSequence("CompletePurchased")
		var_30_11:AnimateSequence("CompletePurchased")
		var_30_13:AnimateSequence("CompletePurchased")
		var_30_20:AnimateSequence("CompletePurchased")
		var_30_28:AnimateSequence("CompletePurchased")
	end

	var_30_0._sequences.CompletePurchased = var_30_87

	local var_30_88
	local var_30_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_6:RegisterAnimationSequence("HideLevel", var_30_89)

	local var_30_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_8:RegisterAnimationSequence("HideLevel", var_30_90)

	local var_30_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_11:RegisterAnimationSequence("HideLevel", var_30_91)

	local var_30_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_13:RegisterAnimationSequence("HideLevel", var_30_92)

	local var_30_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_15:RegisterAnimationSequence("HideLevel", var_30_93)

	local function var_30_94()
		var_30_6:AnimateSequence("HideLevel")
		var_30_8:AnimateSequence("HideLevel")
		var_30_11:AnimateSequence("HideLevel")
		var_30_13:AnimateSequence("HideLevel")
		var_30_15:AnimateSequence("HideLevel")
	end

	var_30_0._sequences.HideLevel = var_30_94

	local var_30_95
	local var_30_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_20:RegisterAnimationSequence("HideCheckbox", var_30_96)

	local var_30_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_28:RegisterAnimationSequence("HideCheckbox", var_30_97)

	local function var_30_98()
		var_30_20:AnimateSequence("HideCheckbox")
		var_30_28:AnimateSequence("HideCheckbox")
	end

	var_30_0._sequences.HideCheckbox = var_30_98

	local var_30_99
	local var_30_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -31
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_30_8:RegisterAnimationSequence("LargeLevel", var_30_100)

	local var_30_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -31
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_30_11:RegisterAnimationSequence("LargeLevel", var_30_101)

	local var_30_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -31
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_30_13:RegisterAnimationSequence("LargeLevel", var_30_102)

	local var_30_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		}
	}

	var_30_15:RegisterAnimationSequence("LargeLevel", var_30_103)

	local var_30_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 44
		}
	}

	var_30_20:RegisterAnimationSequence("LargeLevel", var_30_104)

	local function var_30_105()
		var_30_8:AnimateSequence("LargeLevel")
		var_30_11:AnimateSequence("LargeLevel")
		var_30_13:AnimateSequence("LargeLevel")
		var_30_15:AnimateSequence("LargeLevel")
		var_30_20:AnimateSequence("LargeLevel")
	end

	var_30_0._sequences.LargeLevel = var_30_105

	local var_30_106
	local var_30_107 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		}
	}

	var_30_8:RegisterAnimationSequence("NormalLevel", var_30_107)

	local var_30_108 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		}
	}

	var_30_11:RegisterAnimationSequence("NormalLevel", var_30_108)

	local var_30_109 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -6
		}
	}

	var_30_13:RegisterAnimationSequence("NormalLevel", var_30_109)

	local var_30_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -27
		}
	}

	var_30_15:RegisterAnimationSequence("NormalLevel", var_30_110)

	local function var_30_111()
		var_30_8:AnimateSequence("NormalLevel")
		var_30_11:AnimateSequence("NormalLevel")
		var_30_13:AnimateSequence("NormalLevel")
		var_30_15:AnimateSequence("NormalLevel")
	end

	var_30_0._sequences.NormalLevel = var_30_111

	local var_30_112
	local var_30_113 = {
		{
			value = -1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_17:RegisterAnimationSequence("TierCompleteFlare", var_30_113)

	local function var_30_114()
		var_30_17:AnimateSequence("TierCompleteFlare")
	end

	var_30_0._sequences.TierCompleteFlare = var_30_114

	local var_30_115
	local var_30_116 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_6:RegisterAnimationSequence("ShowLevel", var_30_116)

	local var_30_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_8:RegisterAnimationSequence("ShowLevel", var_30_117)

	local var_30_118 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_11:RegisterAnimationSequence("ShowLevel", var_30_118)

	local var_30_119 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_13:RegisterAnimationSequence("ShowLevel", var_30_119)

	local function var_30_120()
		var_30_6:AnimateSequence("ShowLevel")
		var_30_8:AnimateSequence("ShowLevel")
		var_30_11:AnimateSequence("ShowLevel")
		var_30_13:AnimateSequence("ShowLevel")
	end

	var_30_0._sequences.ShowLevel = var_30_120

	local var_30_121
	local var_30_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -268
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -607
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 144,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -376,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 264,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 231,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_34:RegisterAnimationSequence("Glint", var_30_122)

	local function var_30_123()
		var_30_34:AnimateLoop("Glint")
	end

	var_30_0._sequences.Glint = var_30_123

	local var_30_124
	local var_30_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -109
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -369
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 238
		}
	}

	var_30_34:RegisterAnimationSequence("StopGlint", var_30_125)

	local function var_30_126()
		var_30_34:AnimateSequence("StopGlint")
	end

	var_30_0._sequences.StopGlint = var_30_126

	local var_30_127
	local var_30_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -296
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -271
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_30_20:RegisterAnimationSequence("ButtonOverSnap", var_30_128)

	local var_30_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		}
	}

	var_30_22:RegisterAnimationSequence("ButtonOverSnap", var_30_129)

	local var_30_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -348
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_24:RegisterAnimationSequence("ButtonOverSnap", var_30_130)

	local var_30_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_26:RegisterAnimationSequence("ButtonOverSnap", var_30_131)

	local var_30_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -296
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -271
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_30_28:RegisterAnimationSequence("ButtonOverSnap", var_30_132)

	local var_30_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -291
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -265
		}
	}

	var_30_30:RegisterAnimationSequence("ButtonOverSnap", var_30_133)

	local var_30_134 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -289
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -261
		}
	}

	var_30_32:RegisterAnimationSequence("ButtonOverSnap", var_30_134)

	local var_30_135 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -95
		}
	}

	var_30_36:RegisterAnimationSequence("ButtonOverSnap", var_30_135)

	local var_30_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -319
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -295
		}
	}

	var_30_38:RegisterAnimationSequence("ButtonOverSnap", var_30_136)

	local var_30_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -185
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 53
		}
	}

	var_30_40:RegisterAnimationSequence("ButtonOverSnap", var_30_137)

	local function var_30_138()
		var_30_20:AnimateSequence("ButtonOverSnap")
		var_30_22:AnimateSequence("ButtonOverSnap")
		var_30_24:AnimateSequence("ButtonOverSnap")
		var_30_26:AnimateSequence("ButtonOverSnap")
		var_30_28:AnimateSequence("ButtonOverSnap")
		var_30_30:AnimateSequence("ButtonOverSnap")
		var_30_32:AnimateSequence("ButtonOverSnap")
		var_30_36:AnimateSequence("ButtonOverSnap")
		var_30_38:AnimateSequence("ButtonOverSnap")
		var_30_40:AnimateSequence("ButtonOverSnap")
	end

	var_30_0._sequences.ButtonOverSnap = var_30_138

	local var_30_139
	local var_30_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -212
		}
	}

	var_30_20:RegisterAnimationSequence("ButtonUpSnap", var_30_140)

	local var_30_141 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		}
	}

	var_30_22:RegisterAnimationSequence("ButtonUpSnap", var_30_141)

	local var_30_142 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -241
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -281
		}
	}

	var_30_24:RegisterAnimationSequence("ButtonUpSnap", var_30_142)

	local var_30_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_30_26:RegisterAnimationSequence("ButtonUpSnap", var_30_143)

	local var_30_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -212
		}
	}

	var_30_28:RegisterAnimationSequence("ButtonUpSnap", var_30_144)

	local var_30_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -226
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -200
		}
	}

	var_30_30:RegisterAnimationSequence("ButtonUpSnap", var_30_145)

	local var_30_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -223
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -195
		}
	}

	var_30_32:RegisterAnimationSequence("ButtonUpSnap", var_30_146)

	local var_30_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		}
	}

	var_30_36:RegisterAnimationSequence("ButtonUpSnap", var_30_147)

	local var_30_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -253
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -229
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		}
	}

	var_30_38:RegisterAnimationSequence("ButtonUpSnap", var_30_148)

	local var_30_149 = {
		{
			value = -0.26,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		}
	}

	var_30_40:RegisterAnimationSequence("ButtonUpSnap", var_30_149)

	local function var_30_150()
		var_30_20:AnimateSequence("ButtonUpSnap")
		var_30_22:AnimateSequence("ButtonUpSnap")
		var_30_24:AnimateSequence("ButtonUpSnap")
		var_30_26:AnimateSequence("ButtonUpSnap")
		var_30_28:AnimateSequence("ButtonUpSnap")
		var_30_30:AnimateSequence("ButtonUpSnap")
		var_30_32:AnimateSequence("ButtonUpSnap")
		var_30_36:AnimateSequence("ButtonUpSnap")
		var_30_38:AnimateSequence("ButtonUpSnap")
		var_30_40:AnimateSequence("ButtonUpSnap")
	end

	var_30_0._sequences.ButtonUpSnap = var_30_150

	local var_30_151
	local var_30_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_6:RegisterAnimationSequence("MultiTier", var_30_152)

	local var_30_153 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_30_8:RegisterAnimationSequence("MultiTier", var_30_153)

	local var_30_154 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Left,
			value = _1080p * 1
		}
	}

	var_30_11:RegisterAnimationSequence("MultiTier", var_30_154)

	local var_30_155 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_30_13:RegisterAnimationSequence("MultiTier", var_30_155)

	local var_30_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_30_15:RegisterAnimationSequence("MultiTier", var_30_156)

	local function var_30_157()
		var_30_6:AnimateSequence("MultiTier")
		var_30_8:AnimateSequence("MultiTier")
		var_30_11:AnimateSequence("MultiTier")
		var_30_13:AnimateSequence("MultiTier")
		var_30_15:AnimateSequence("MultiTier")
	end

	var_30_0._sequences.MultiTier = var_30_157

	var_0_30(var_30_0, var_30_1, arg_30_1)

	return var_30_0
end

MenuBuilder.registerType("BattlePassItem", BattlePassItem)
LockTable(_M)
