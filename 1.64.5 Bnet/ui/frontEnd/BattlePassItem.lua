module(..., package.seeall)

local var_0_0 = 150 * _1080p
local var_0_1 = 200 * _1080p
local var_0_2 = 150

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

local function var_0_3(arg_2_0, arg_2_1)
	arg_2_0._isOwned = arg_2_1
end

local function var_0_4(arg_3_0, arg_3_1)
	arg_3_0._isBundleBonus = arg_3_1
end

local function var_0_5(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._level = arg_4_1

	if arg_4_2 then
		arg_4_0.Level:setText(Engine.JCBDICCAH(arg_4_1))
		ACTIONS.AnimateSequence(arg_4_0, "ShowLevel")

		if arg_4_1 >= 100 then
			ACTIONS.AnimateSequence(arg_4_0, "LargeLevel")
		else
			ACTIONS.AnimateSequence(arg_4_0, "NormalLevel")
		end
	elseif arg_4_1 then
		arg_4_0.Level:setText(Engine.JCBDICCAH(arg_4_1))
		ACTIONS.AnimateSequence(arg_4_0, "MultiTier")
	else
		ACTIONS.AnimateSequence(arg_4_0, "HideLevel")
	end
end

local function var_0_6(arg_5_0)
	return arg_5_0 and 0 or var_0_2
end

local function var_0_7(arg_6_0)
	local var_6_0 = arg_6_0.ReactiveIconTarget:GetCurrentAnchorsAndPositions()
	local var_6_1 = LAYOUT.GetElementWidth(arg_6_0.MissionIcon) / _1080p
	local var_6_2 = math.ceil((var_6_0.right - var_6_0.left) / _1080p)
	local var_6_3 = var_6_0.left / _1080p + var_6_1
	local var_6_4 = var_6_3 + var_6_2

	arg_6_0.ReactiveIconTarget:SetLeft(var_6_3 * _1080p)
	arg_6_0.ReactiveIconTarget:SetRight(var_6_4 * _1080p)
end

local function var_0_8(arg_7_0, arg_7_1)
	if arg_7_0.MissionIcon:GetAlpha() ~= 0 then
		var_0_7(arg_7_0)
	end

	if LOOT.HasReactiveCamo(arg_7_0.lootData.itemID) then
		local var_7_0 = var_0_6(arg_7_1)
		local var_7_1 = arg_7_0.ReactiveIconTarget:GetCurrentAnchorsAndPositions()
		local var_7_2 = var_7_1.leftAnchor
		local var_7_3 = var_7_1.rightAnchor
		local var_7_4 = var_7_1.topAnchor
		local var_7_5 = var_7_1.bottomAnchor

		arg_7_0.ReactiveIcon:SetAnchorsAndPosition(var_7_2, var_7_3, var_7_4, var_7_5, var_7_1.left, var_7_1.right, var_7_1.top, var_7_1.bottom, var_7_0)
		arg_7_0.ReactiveIcon:SetAlpha(1)
	else
		arg_7_0.ReactiveIcon:SetAlpha(0)
	end
end

local function var_0_9(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_0._isAnimating then
		return
	end

	local function var_8_0()
		if arg_8_0._lootIndex ~= 1 then
			arg_8_0:CycleLootCards(1, true)
		end

		arg_8_0._cycleEnabled = arg_8_1
	end

	if arg_8_2 then
		var_8_0()
	else
		arg_8_0:Wait(var_0_2).onComplete = var_8_0
	end
end

local function var_0_10(arg_10_0, arg_10_1)
	if LUI.IsLastInputGamepad(arg_10_0._controllerIndex) and arg_10_0._isMultiItemGameSourceTier and arg_10_0._isExpanded then
		arg_10_0.TogglePromptText:SetAlpha(1)
	else
		arg_10_0.TogglePromptText:SetAlpha(0)
	end
end

local function var_0_11(arg_11_0, arg_11_1)
	if arg_11_0._isMultiItemGameSourceTier then
		RefreshAnimation(arg_11_0, "ToggleableButtonUp", arg_11_1)
		var_0_10(arg_11_0)
	else
		RefreshAnimation(arg_11_0, "ButtonUp", arg_11_1)
	end

	var_0_9(arg_11_0, false, arg_11_1)

	if arg_11_0._isLocked then
		arg_11_0.Darkener:SetAlpha(not arg_11_0._battlePassOwned and not arg_11_0._isFree and 0.6 or 0, var_0_6(arg_11_1))
	end

	var_0_8(arg_11_0, arg_11_1)
end

local function var_0_12(arg_12_0, arg_12_1)
	if arg_12_0._battlePassOwned == true then
		arg_12_0.ArrowSelector:SetRGBFromTable(SWATCHES.BattlePass.Purchased, var_0_6(arg_12_1))
	else
		arg_12_0.ArrowSelector:SetRGBFromInt(16777215, var_0_6(arg_12_1))
	end

	if arg_12_0._isMultiItemGameSourceTier then
		RefreshAnimation(arg_12_0, "ToggleableButtonOver", arg_12_1)
		var_0_10(arg_12_0)
	else
		RefreshAnimation(arg_12_0, "ButtonOver", arg_12_1)
	end

	var_0_9(arg_12_0, true, arg_12_1)

	if arg_12_0._isAnimating then
		arg_12_0.ArrowSelector:SetAlpha(0)
	end

	if arg_12_0._isLocked then
		ACTIONS.AnimateSequence(arg_12_0, "ButtonOverDisabled")
	end

	var_0_8(arg_12_0, arg_12_1)
end

local function var_0_13(arg_13_0, arg_13_1)
	if arg_13_0._column == nil or arg_13_0._isExpanded == true then
		return
	end

	arg_13_0._isExpanded = true
	LUI.FlowManager.GetScopedData("MainMenu").battlepassSelectedColumn = arg_13_0._column
	arg_13_0._isOver = true

	arg_13_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_1, 0, 0, var_0_6(arg_13_1))
	RefreshAnimation(arg_13_0._lootCards[1], "MiniButtonOver", arg_13_1)

	local var_13_0 = arg_13_0.lootData and arg_13_0.lootData.type

	if var_13_0 and (var_13_0 == LOOT.itemTypes.PLAYERCARD or var_13_0 == LOOT.itemTypes.EMBLEM or var_13_0 == LOOT.itemTypes.CHARM or var_13_0 == LOOT.itemTypes.STICKER or var_13_0 == LOOT.itemTypes.GESTURES or var_13_0 == LOOT.itemTypes.SPRAYS or var_13_0 == LOOT.itemTypes.FEATURE and not arg_13_0.lootData.isOperatorChallenge or var_13_0 == LOOT.itemTypes.CONSUMABLE or var_13_0 == "xp") then
		RefreshAnimation(arg_13_0._lootCards[1], "FocusGained", arg_13_1)
	end

	var_0_12(arg_13_0, arg_13_1)
end

local function var_0_14(arg_14_0, arg_14_1)
	if arg_14_0._isExpanded == false then
		return
	end

	arg_14_0._isExpanded = false
	arg_14_0._isOver = false

	arg_14_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_0, 0, 0, var_0_6(arg_14_1))
	RefreshAnimation(arg_14_0._lootCards[1], "FocusLost", arg_14_1)
	RefreshAnimation(arg_14_0._lootCards[1], "MiniButtonUp", arg_14_1)
	var_0_11(arg_14_0, arg_14_1)
end

local function var_0_15(arg_15_0, arg_15_1)
	arg_15_0._isLocked = arg_15_1

	if arg_15_0._isOver then
		var_0_12(arg_15_0, true)
	else
		var_0_11(arg_15_0, true)
	end

	arg_15_0.LockedIcon:SetAlpha(arg_15_1 and 1 or 0)
	arg_15_0.Darkener:SetAlpha(not arg_15_0._battlePassOwned and not arg_15_0._isFree and 0.6 or 0, 150)

	local var_15_0

	if arg_15_1 then
		var_15_0 = true

		ACTIONS.AnimateSequence(arg_15_0, "HideCheckbox")
	else
		var_15_0 = arg_15_0._isFree and not arg_15_0._battlePassOwned and true or false
	end

	if arg_15_0._isMultiItemGameSourceTier then
		arg_15_0.LockedIcon:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_15_0, "HideCheckbox")
	end

	for iter_15_0, iter_15_1 in ipairs(arg_15_0._lootCards) do
		iter_15_1.Border:SetAlpha(1)

		local var_15_1 = iter_15_1.lootData
		local var_15_2 = var_15_0 or var_15_1 and var_15_1.isLocked

		iter_15_1.Border:SetRGBFromTable(var_15_2 and SWATCHES.BattlePass.Locked or SWATCHES.BattlePass.Purchased)

		if arg_15_0._isMultiItemGameSourceTier then
			if var_15_2 then
				ACTIONS.AnimateSequence(iter_15_1, "ShowLock")
			else
				ACTIONS.AnimateSequence(iter_15_1, arg_15_0._battlePassOwned and "ShowCheckboxCompletePurchased" or "ShowCheckboxCompleteFree")
			end
		else
			ACTIONS.AnimateSequence(iter_15_1, "HideCheckbox")
			ACTIONS.AnimateSequence(iter_15_1, "HideLock")
		end
	end
end

local function var_0_16(arg_16_0, arg_16_1)
	arg_16_0._battlePassOwned = arg_16_1
end

local function var_0_17(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	arg_17_0._isFree = arg_17_1
	arg_17_0._tierType = tonumber(arg_17_4)

	if arg_17_2 then
		arg_17_0.FreeBanner:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_17_0.FreeBanner, "BundleVariant")
		arg_17_0.FreeBanner:SetText(Engine.CBBHFCGDIC("BATTLEPASS/BONUS"))
	elseif arg_17_3 then
		arg_17_0.FreeBanner:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_17_0.FreeBanner, "BattlePassBundleBonusTopper")
		arg_17_0.FreeBanner:SetText(Engine.CBBHFCGDIC("BATTLEPASS/BUNDLE_BONUS_SKIN"))
	elseif arg_17_0._isFree or arg_17_0._tierType == BATTLEPASS.ItemTypes.CLAN then
		arg_17_0.FreeBanner:SetAlpha(1)

		for iter_17_0, iter_17_1 in ipairs(arg_17_0._lootCards) do
			iter_17_1.Border:SetRGBFromTable(arg_17_0._battlePassOwned and SWATCHES.BattlePass.Purchased or SWATCHES.BattlePass.Locked)
		end

		if arg_17_0._tierType ~= BATTLEPASS.ItemTypes.CLAN then
			ACTIONS.AnimateSequence(arg_17_0.FreeBanner, "FreeVariant")
			arg_17_0.FreeBanner:SetText(Engine.CBBHFCGDIC("MENU/FREE"))
		else
			ACTIONS.AnimateSequence(arg_17_0.FreeBanner, "ClanVariant")
			arg_17_0.FreeBanner:SetText(Engine.CBBHFCGDIC("CLANS/VIEW_CLAN_SEASON_1"))
		end
	else
		arg_17_0.FreeBanner:SetAlpha(0)
	end
end

local function var_0_18(arg_18_0, arg_18_1, arg_18_2)
	assert(arg_18_0.itemData)

	local function var_18_0()
		if arg_18_1 == 1 then
			if arg_18_0._battlePassOwned then
				ACTIONS.AnimateSequence(arg_18_0, "CompletePurchased")
			else
				ACTIONS.AnimateSequence(arg_18_0, "CompleteFree")

				if not arg_18_0._isFree then
					ACTIONS.AnimateSequence(arg_18_0, "HideCheckbox")
				end
			end
		elseif arg_18_0._battlePassOwned then
			ACTIONS.AnimateSequence(arg_18_0, "IncompletePurchased")
		else
			ACTIONS.AnimateSequence(arg_18_0, "IncompleteFree")
		end
	end

	ACTIONS.AnimateSequence(arg_18_0.ProgressBar, arg_18_0._battlePassOwned and "Purchased" or "Free")

	if arg_18_0.itemData.showProgress then
		arg_18_0.ProgressBar:SetProgress(arg_18_1, arg_18_2, LUI.EASING.inOutCubic)
	else
		arg_18_0.ProgressBar:SetProgress(0, 0, LUI.EASING.inOutCubic)
	end

	if arg_18_2 and arg_18_2 > 0 then
		arg_18_0:Wait(arg_18_2, true).onComplete = var_18_0
	else
		var_18_0()
	end
end

local function var_0_19(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.ProgressBar:EnableGlow(arg_20_1, arg_20_0._battlePassOwned, arg_20_2)

	if arg_20_0._battlePassOwned then
		arg_20_0.LevelFlare:SetColorOp(COLOR_OP.none)
	else
		arg_20_0.LevelFlare:SetColorOp(COLOR_OP.saturation)
	end
end

local function var_0_20(arg_21_0, arg_21_1)
	arg_21_0._isAnimating = arg_21_1

	if arg_21_1 then
		arg_21_0.ArrowSelector:SetAlpha(0)
	end
end

local function var_0_21(arg_22_0, arg_22_1)
	arg_22_0:SetIsAnimating(arg_22_1)
	arg_22_0._lootCards[1]:SetMiniMode()
end

local function var_0_22(arg_23_0, arg_23_1)
	if arg_23_1 then
		ACTIONS.AnimateSequence(arg_23_0, "Glint")

		if arg_23_0.lootData and arg_23_0.lootData.rarityColor then
			arg_23_0.ShowcaseShine:SetRGBFromTable(arg_23_0.lootData.rarityColor)
		end
	else
		ACTIONS.AnimateSequence(arg_23_0, "StopGlint")
	end
end

local function var_0_23(arg_24_0, arg_24_1)
	arg_24_0._isShowcased = arg_24_1

	if arg_24_0._isShowcased then
		arg_24_0.BattlePassFlare:PlayBaseWeaponFlare()
	else
		arg_24_0.BattlePassFlare:ClearFlare()
	end
end

local function var_0_24(arg_25_0)
	local var_25_0 = LUI.FlowManager.GetScopedData("MainMenu")

	if var_25_0.battlepassSelectedColumn and arg_25_0._column and var_25_0.battlepassSelectedColumn == arg_25_0._column then
		var_0_13(arg_25_0, true)
	elseif arg_25_0._isExpanded then
		var_0_14(arg_25_0, true)
	end
end

local function var_0_25(arg_26_0, arg_26_1)
	assert(arg_26_1 >= 1, "BattlePassItem requires at least 1 loot card")

	if arg_26_1 < 1 then
		return
	elseif arg_26_1 > 1 then
		ACTIONS.AnimateSequence(arg_26_0.LootItemCardMiniDouble, "ShowBackCard")
	else
		ACTIONS.AnimateSequence(arg_26_0.LootItemCardMiniDouble, "HideBackCard")
	end

	ACTIONS.AnimateSequence(arg_26_0.LootItemCardMiniDouble, "SwitchToFrontCardSnap")

	arg_26_0._lootIndex = 1

	var_0_24(arg_26_0)
	var_0_9(arg_26_0, true, true)
end

local function var_0_26(arg_27_0, arg_27_1)
	if not arg_27_1 or not arg_27_1.lootTable then
		return
	end

	local var_27_0 = #split(arg_27_1.lootID, "|")
	local var_27_1 = #arg_27_1.lootTable

	var_0_25(arg_27_0, var_27_1)

	for iter_27_0, iter_27_1 in ipairs(arg_27_1.lootTable) do
		local var_27_2 = {}
		local var_27_3 = iter_27_1.lootID
		local var_27_4 = var_27_3 == LOOT.COD_POINTS_ITEM_ID
		local var_27_5 = LOOT.GetLootFileForID(var_27_3)
		local var_27_6

		if var_27_5 ~= nil then
			var_27_6 = StringTable.DIFCHIGDFB(var_27_5, 0, var_27_3, 1)
		end

		if var_27_6 and #var_27_6 > 0 then
			var_27_2.ref = var_27_6
			var_27_2.itemID = var_27_3
			var_27_2.type = LOOT.GetTypeForID(var_27_2.itemID)
			var_27_2.image = LOOT.GetBattlepassImage(var_27_2.type, var_27_2.ref, var_27_2.itemID)
			var_27_2.rarity = LOOT.GetItemQuality(var_27_2.type, var_27_2.ref, var_27_2.itemID)
			var_27_2.rarityColor = LOOT.GetRarityColor(var_27_2.rarity)
			var_27_2.rarityImage = LOOT.GetRarityImage(var_27_2.rarity)
			var_27_2.className = LOOT.GetItemClassName(var_27_2.type, var_27_2.ref)
			var_27_2.IsVariant = var_27_2.type == LOOT.itemTypes.WEAPON and WEAPON.IsVariant(arg_27_0._controllerIndex, var_27_2.itemID)
			var_27_2.isLocked = iter_27_1.isLocked
			var_27_2.isOperatorChallengeReward = iter_27_1.isOperatorChallengeReward
			var_27_2.operatorChallengeName = iter_27_1.operatorChallengeName
			var_27_2.name = LOOT.GetItemName(var_27_2.type, var_27_2.ref, var_27_2.itemID)

			local var_27_7 = tonumber(arg_27_1.codPoints) > 0

			if var_27_4 and var_27_7 then
				var_27_2.amount = Engine.CBBHFCGDIC("LUA_MENU/COD_POINT_AMOUNT", arg_27_1.codPoints)
			end

			if var_27_2.type == LOOT.itemTypes.CONSUMABLE then
				local var_27_8 = StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, var_27_2.itemID, CSV.consumablesIDs.cols.duration)

				if var_27_8 ~= nil and #var_27_8 > 0 then
					var_27_2.duration = Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, var_27_2.itemID, CSV.consumablesIDs.cols.duration))
				end
			elseif var_27_2.type == LOOT.itemTypes.FEATURE then
				var_27_2.isOperatorChallenge = LOOT.IsFeatureOperatorChallenge(var_27_2.ref)
			elseif var_27_2.type == LOOT.itemTypes.VEHICLE_TRACK then
				var_27_2.vehicleTrackCount = var_27_0
			elseif var_27_2.type == LOOT.itemTypes.S4_MISC then
				var_27_2.miscType = LOOT.GetMiscTypeForID(var_27_3)
			end
		end

		arg_27_0._lootCards[iter_27_0]:UpdateCardConfig(var_27_2)
		arg_27_0._lootCards[iter_27_0].Tracer:SetAlpha(0)

		if var_27_2.type == LOOT.itemTypes.WEAPON then
			arg_27_0._lootCards[iter_27_0]:SetupTracer(nil, var_27_3)
		end

		if arg_27_0._lootCards[iter_27_0].SnipeBanner then
			if iter_27_1._gameSourceId then
				if var_27_3 then
					local var_27_9 = LOOT.GetGameSourceExclusivityByItemID(var_27_3)

					if not var_27_4 and (arg_27_0._isMultiItemGameSourceTier or LOOT.itemSourceExclusivityTable[var_27_9].isExclusive) then
						local var_27_10 = var_27_9 == LOOT.itemSourceExclusivity.VG_EXCLUSIVE or var_27_9 == LOOT.itemSourceExclusivity.VG_WZ
						local var_27_11 = var_27_9 == LOOT.itemSourceExclusivity.VG_EXCLUSIVE
						local var_27_12 = {
							gameSourceExclusivityID = var_27_9,
							isExclusive = var_27_11,
							condensed = var_27_10
						}

						arg_27_0._lootCards[iter_27_0].SnipeBanner:SetGameSource(var_27_12)
					else
						ACTIONS.AnimateSequence(arg_27_0._lootCards[iter_27_0].SnipeBanner, "Hide")
					end
				else
					arg_27_0._lootCards[iter_27_0].SnipeBanner:SetGameSource({
						gameSourceID = iter_27_1._gameSourceId
					})
				end
			else
				ACTIONS.AnimateSequence(arg_27_0._lootCards[iter_27_0].SnipeBanner, "Hide")
			end
		end

		arg_27_0._lootCards[iter_27_0].lootData = var_27_2
	end

	arg_27_0.lootData = arg_27_0._lootCards[1].lootData
end

local function var_0_27(arg_28_0, arg_28_1, arg_28_2)
	if not arg_28_0._cycleEnabled and not arg_28_2 or arg_28_0._isAnimating then
		return
	end

	if arg_28_0.ProgressLine:getParent() == nil then
		assert(false, "progression line's parent is nil. lootIndex " .. arg_28_1 .. " self._isAnimating " .. (arg_28_0._isAnimating and "true" or "false"))

		return
	end

	local var_28_0 = {}

	for iter_28_0, iter_28_1 in ipairs(arg_28_0._lootCards) do
		local var_28_1 = arg_28_1 - (iter_28_0 - 1)

		if var_28_1 <= 0 then
			var_28_1 = iter_28_0
		end

		var_28_0[var_28_1] = iter_28_1
	end

	for iter_28_2, iter_28_3 in ipairs(var_28_0) do
		if iter_28_2 == 1 then
			arg_28_0.lootData = iter_28_3.lootData

			if arg_28_0._isOver then
				RefreshAnimation(iter_28_3, "MiniButtonOver", true)
			end

			local var_28_2 = iter_28_3.lootData and iter_28_3.lootData.type

			if var_28_2 and arg_28_0._isOver then
				if var_28_2 == LOOT.itemTypes.PLAYERCARD or var_28_2 == LOOT.itemTypes.EMBLEM or var_28_2 == LOOT.itemTypes.CHARM or var_28_2 == LOOT.itemTypes.STICKER or var_28_2 == LOOT.itemTypes.GESTURES or var_28_2 == LOOT.itemTypes.SPRAYS or var_28_2 == LOOT.itemTypes.FEATURE and not iter_28_3.lootData.isOperatorChallenge or var_28_2 == LOOT.itemTypes.CONSUMABLE or var_28_2 == "xp" then
					RefreshAnimation(iter_28_3, "FocusGained", true)
				else
					RefreshAnimation(iter_28_3, "FocusLost", true)
				end
			end

			if arg_28_0._isShowcased then
				local var_28_3 = var_28_0[1] == arg_28_0._lootCards[1]

				arg_28_0:SetShowcased(var_28_3 and arg_28_0._isShowcased)

				arg_28_0._isShowcased = true
			end
		else
			RefreshAnimation(iter_28_3, "MiniButtonUp", true)
			RefreshAnimation(iter_28_3, "FocusLost", true)
		end
	end

	if arg_28_2 then
		arg_28_0.LootItemCardMiniDouble:PlaySwapAnimation("SwitchToFrontCard")
	elseif arg_28_1 == 1 then
		arg_28_0.LootItemCardMiniDouble:PlaySwapAnimation("SwitchToFrontCard")
	else
		arg_28_0.LootItemCardMiniDouble:PlaySwapAnimation("SwitchToBackCard")
	end

	arg_28_0._lootIndex = arg_28_1
end

local function var_0_28(arg_29_0, arg_29_1)
	arg_29_0.MissionIcon:SetAlpha(arg_29_1 and 1 or 0)
end

local function var_0_29(arg_30_0)
	for iter_30_0, iter_30_1 in ipairs(arg_30_0._lootCards) do
		local var_30_0 = iter_30_1.lootData
		local var_30_1 = var_30_0 and var_30_0.itemID

		if var_30_1 and LOOT.IsItemIDEquippableByS4(var_30_1) then
			return true
		end
	end

	return false
end

local function var_0_30(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.SetBattlePassOwned = var_0_16
	arg_31_0.SetProgress = var_0_18
	arg_31_0.SetLocked = var_0_15
	arg_31_0.SetLevel = var_0_5
	arg_31_0.SetTopBanner = var_0_17
	arg_31_0.EnableGlow = var_0_19
	arg_31_0.ShowMission = var_0_28
	arg_31_0.SetIsAnimating = var_0_20
	arg_31_0.SetPromoted = var_0_22
	arg_31_0.SetShowcased = var_0_23
	arg_31_0.UpdateExpandedState = var_0_24
	arg_31_0.SetOwned = var_0_3
	arg_31_0.SetIsBundleBonus = var_0_4
	arg_31_0.SetupLootData = var_0_26
	arg_31_0.CycleLootCards = var_0_27
	arg_31_0.HasVanguardItem = var_0_29
	arg_31_0._controllerIndex = arg_31_1
	arg_31_0._isLocked = false
	arg_31_0._isFree = false
	arg_31_0._tierType = BATTLEPASS.ItemTypes.PREMIUM
	arg_31_0._isOver = false
	arg_31_0._isAnimating = false
	arg_31_0._battlePassOwned = false
	arg_31_0._isOwned = false
	arg_31_0._isBundleBonus = false
	arg_31_0._level = 0
	arg_31_0._cycleEnabled = false
	arg_31_0._isExpanded = false
	arg_31_0._lootCards = {
		arg_31_0.LootItemCardMiniDouble.FrontLootItemCard,
		arg_31_0.LootItemCardMiniDouble.BackLootItemCard
	}

	arg_31_0.ShowcaseShine:SetMask(arg_31_0.Mask)
	arg_31_0.Mask:SetAlpha(1)
	arg_31_0:addEventHandler("button_over", function(arg_32_0, arg_32_1)
		var_0_13(arg_32_0, false)
	end)
	arg_31_0:addEventHandler("lose_active", function(arg_33_0, arg_33_1)
		var_0_14(arg_33_0, false)
	end)
	arg_31_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_0, 0, 0)
	arg_31_0:SetGridChildDynamicSize(true, LUI.DIRECTION.horizontal)
	arg_31_0:setGainFocusAllSFX(SOUND_SETS.battlePass.bpCardHighlight, {
		clearChildrenSFX = true
	})
	arg_31_0.LootItemCardMiniDouble.FlipFocusable:addEventHandler("gain_focus", function(arg_34_0, arg_34_1)
		if arg_31_0._isMultiItemGameSourceTier then
			ACTIONS.AnimateSequence(arg_31_0, "ScaleUpFreeBanner")
			arg_31_0.LootItemCardMiniDouble:PlayScaleUpBackAnimation()

			arg_31_0._backCardPulledUp = true

			if not arg_31_0._isExpanded then
				arg_31_0:processEvent({
					name = "button_over"
				})
			end
		end
	end)
	arg_31_0.LootItemCardMiniDouble.FlipFocusable:addEventHandler("lose_focus", function(arg_35_0, arg_35_1)
		if arg_31_0._backCardPulledUp then
			ACTIONS.AnimateSequence(arg_31_0, "ScaleDownFreeBanner")
			arg_31_0.LootItemCardMiniDouble:PlayScaleDownBackAnimation()

			arg_31_0._backCardPulledUp = false
		end
	end)
	arg_31_0:registerAndCallEventHandler("update_input_type", var_0_10)
end

function BattlePassItem(arg_36_0, arg_36_1)
	local var_36_0 = LUI.UIButton.new()

	var_36_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 160 * _1080p, 0, 238 * _1080p)

	var_36_0.id = "BattlePassItem"
	var_36_0._animationSets = var_36_0._animationSets or {}
	var_36_0._sequences = var_36_0._sequences or {}

	local var_36_1 = arg_36_1 and arg_36_1.controllerIndex

	if not var_36_1 and not Engine.DDJFBBJAIG() then
		var_36_1 = var_36_0:getRootController()
	end

	assert(var_36_1)

	local var_36_2 = var_36_0
	local var_36_3
	local var_36_4 = MenuBuilder.BuildRegisteredType("LootItemCardMiniDouble", {
		controllerIndex = var_36_1
	})

	var_36_4.id = "LootItemCardMiniDouble"

	var_36_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -231, _1080p * -45)
	var_36_0:addElement(var_36_4)

	var_36_0.LootItemCardMiniDouble = var_36_4

	local var_36_5
	local var_36_6 = LUI.UIText.new()

	var_36_6.id = "TogglePromptText"

	var_36_6:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_36_6:SetAlpha(0, 0)
	var_36_6:setText(Engine.CBBHFCGDIC("BATTLEPASS/TOGGLE_ITEM"), 0)
	var_36_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_36_6:SetAlignment(LUI.Alignment.Center)
	var_36_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -53, _1080p * 53, _1080p * -9, _1080p * 15)
	var_36_0:addElement(var_36_6)

	var_36_0.TogglePromptText = var_36_6

	local var_36_7
	local var_36_8 = LUI.UIImage.new()

	var_36_8.id = "ProgressLine"

	var_36_8:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_36_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -5, _1080p * -5, _1080p * -17, _1080p * -18)
	var_36_0:addElement(var_36_8)

	var_36_0.ProgressLine = var_36_8

	local var_36_9
	local var_36_10 = LUI.UIImage.new()

	var_36_10.id = "Fill"

	var_36_10:SetRGBFromTable(SWATCHES.BattlePass.Locked, 0)
	var_36_10:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -27, _1080p * -5, _1080p * -28, _1080p * -8)
	var_36_0:addElement(var_36_10)

	var_36_0.Fill = var_36_10

	local var_36_11
	local var_36_12 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_36_13 = LUI.UIBorder.new(var_36_12)

	var_36_13.id = "LevelBorder"

	var_36_13:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_36_13:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -27, _1080p * -5, _1080p * -28, _1080p * -8)
	var_36_0:addElement(var_36_13)

	var_36_0.LevelBorder = var_36_13

	local var_36_14
	local var_36_15 = LUI.UIText.new()

	var_36_15.id = "Level"

	var_36_15:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_36_15:setText("99", 0)
	var_36_15:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_36_15:SetWordWrap(false)
	var_36_15:SetTracking(-1 * _1080p, 0)
	var_36_15:SetAlignment(LUI.Alignment.Center)
	var_36_15:SetVerticalAlignment(LUI.Alignment.Center)
	var_36_15:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -26, _1080p * -6, _1080p * -28, _1080p * -10)
	var_36_0:addElement(var_36_15)

	var_36_0.Level = var_36_15

	local var_36_16
	local var_36_17 = MenuBuilder.BuildRegisteredType("BattlePassProgressBar", {
		controllerIndex = var_36_1
	})

	var_36_17.id = "ProgressBar"

	var_36_17.Fill:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_36_17.Cap:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_36_17.Cap:SetAlpha(0, 0)
	var_36_17.Glint:SetAlpha(0, 0)
	var_36_17:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -5, _1080p * -27, _1080p * -21, _1080p * -15)
	var_36_0:addElement(var_36_17)

	var_36_0.ProgressBar = var_36_17

	local var_36_18
	local var_36_19 = LUI.UIImage.new()

	var_36_19.id = "LevelFlare"

	var_36_19:SetAlpha(0, 0)
	var_36_19:setImage(RegisterMaterial("battlepass_progressbar_square"), 0)
	var_36_19:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_36_19:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -41, _1080p * 9, _1080p * -45, _1080p * 9)
	var_36_0:addElement(var_36_19)

	var_36_0.LevelFlare = var_36_19

	local var_36_20
	local var_36_21 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_36_22 = LUI.UIBorder.new(var_36_21)

	var_36_22.id = "CheckboxFrame"

	var_36_22:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_36_22:SetAlpha(0, 0)
	var_36_22:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 51, _1080p * 69, _1080p * -230, _1080p * -212)
	var_36_0:addElement(var_36_22)

	var_36_0.CheckboxFrame = var_36_22

	local var_36_23
	local var_36_24 = LUI.UIImage.new()

	var_36_24.id = "ArrowSelector"

	var_36_24:SetAlpha(0, 0)
	var_36_24:setImage(RegisterMaterial("battlepass_arrow_atlas"), 0)
	var_36_24:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -241, _1080p * -281)
	var_36_0:addElement(var_36_24)

	var_36_0.ArrowSelector = var_36_24

	local var_36_25
	local var_36_26 = LUI.UIImage.new()

	var_36_26.id = "Darkener"

	var_36_26:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_36_26:SetAlpha(0.6, 0)
	var_36_26:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -231, _1080p * -45)
	var_36_0:addElement(var_36_26)

	var_36_0.Darkener = var_36_26

	local var_36_27
	local var_36_28 = LUI.UIImage.new()

	var_36_28.id = "Checkbox"

	var_36_28:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_36_28:SetAlpha(0, 0)
	var_36_28:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_36_28:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 51, _1080p * 69, _1080p * -230, _1080p * -212)
	var_36_0:addElement(var_36_28)

	var_36_0.Checkbox = var_36_28

	local var_36_29
	local var_36_30 = LUI.UIImage.new()

	var_36_30.id = "LockedIcon"

	var_36_30:SetAlpha(0, 0)
	var_36_30:setImage(RegisterMaterial("battlepass_lock"), 0)
	var_36_30:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 40, _1080p * 60, _1080p * -226, _1080p * -205)
	var_36_0:addElement(var_36_30)

	var_36_0.LockedIcon = var_36_30

	local var_36_31
	local var_36_32 = LUI.UIImage.new()

	var_36_32.id = "MissionIcon"

	var_36_32:setImage(RegisterMaterial("battlepass_operator_challenge_icon"), 0)
	var_36_32:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -63, _1080p * -35, _1080p * -223, _1080p * -195)
	var_36_0:addElement(var_36_32)

	var_36_0.MissionIcon = var_36_32

	local var_36_33
	local var_36_34 = LUI.UIImage.new()

	var_36_34.id = "ShowcaseShine"

	var_36_34:SetAlpha(0, 0)
	var_36_34:SetZRotation(-45, 0)
	var_36_34:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_36_34:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_36_34:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -268, _1080p * -148, _1080p * -607, 0)
	var_36_0:addElement(var_36_34)

	var_36_0.ShowcaseShine = var_36_34

	local var_36_35
	local var_36_36 = LUI.UIImage.new()

	var_36_36.id = "Mask"

	var_36_36:SetAlpha(0, 0)
	var_36_36:setImage(RegisterMaterial("stencil_mask"), 0)
	var_36_36:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -231, _1080p * -45)
	var_36_0:addElement(var_36_36)

	var_36_0.Mask = var_36_36

	local var_36_37
	local var_36_38 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_36_1
	})

	var_36_38.id = "FreeBanner"

	var_36_38:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -253, _1080p * -229)
	var_36_0:addElement(var_36_38)

	var_36_0.FreeBanner = var_36_38

	local var_36_39
	local var_36_40 = MenuBuilder.BuildRegisteredType("BattlePassFlare", {
		controllerIndex = var_36_1
	})

	var_36_40.id = "BattlePassFlare"

	var_36_40:SetScale(-0.25, 0)
	var_36_40:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -100, _1080p * 100, _1080p * -177, _1080p * 61)
	var_36_0:addElement(var_36_40)

	var_36_0.BattlePassFlare = var_36_40

	local var_36_41
	local var_36_42 = LUI.UIImage.new()

	var_36_42.id = "ReactiveIcon"

	var_36_42:setImage(RegisterMaterial("ui_icon_blueprint_reactive_camo_flipbook"), 0)
	var_36_42:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -63, 0, _1080p * -226, _1080p * -198)
	var_36_0:addElement(var_36_42)

	var_36_0.ReactiveIcon = var_36_42

	local var_36_43
	local var_36_44 = LUI.UIImage.new()

	var_36_44.id = "ReactiveIconTarget"

	var_36_44:SetAlpha(0, 0)
	var_36_44:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -63, 0, _1080p * -226, _1080p * -198)
	var_36_0:addElement(var_36_44)

	var_36_0.ReactiveIconTarget = var_36_44

	local function var_36_45()
		return
	end

	var_36_0._sequences.DefaultSequence = var_36_45

	local var_36_46
	local var_36_47 = {
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
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_36_4:RegisterAnimationSequence("ButtonOver", var_36_47)

	local var_36_48 = {
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

	var_36_22:RegisterAnimationSequence("ButtonOver", var_36_48)

	local var_36_49 = {
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

	var_36_24:RegisterAnimationSequence("ButtonOver", var_36_49)

	local var_36_50 = {
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

	var_36_26:RegisterAnimationSequence("ButtonOver", var_36_50)

	local var_36_51 = {
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

	var_36_28:RegisterAnimationSequence("ButtonOver", var_36_51)

	local var_36_52 = {
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
			value = _1080p * 86
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -268
		}
	}

	var_36_30:RegisterAnimationSequence("ButtonOver", var_36_52)

	local var_36_53 = {
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

	var_36_32:RegisterAnimationSequence("ButtonOver", var_36_53)

	local var_36_54 = {
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

	var_36_36:RegisterAnimationSequence("ButtonOver", var_36_54)

	local var_36_55 = {
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

	var_36_38:RegisterAnimationSequence("ButtonOver", var_36_55)

	local var_36_56 = {
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

	var_36_40:RegisterAnimationSequence("ButtonOver", var_36_56)

	local var_36_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -264
		}
	}

	var_36_44:RegisterAnimationSequence("ButtonOver", var_36_57)

	local function var_36_58()
		var_36_4:AnimateSequence("ButtonOver")
		var_36_22:AnimateSequence("ButtonOver")
		var_36_24:AnimateSequence("ButtonOver")
		var_36_26:AnimateSequence("ButtonOver")
		var_36_28:AnimateSequence("ButtonOver")
		var_36_30:AnimateSequence("ButtonOver")
		var_36_32:AnimateSequence("ButtonOver")
		var_36_36:AnimateSequence("ButtonOver")
		var_36_38:AnimateSequence("ButtonOver")
		var_36_40:AnimateSequence("ButtonOver")
		var_36_44:AnimateSequence("ButtonOver")
	end

	var_36_0._sequences.ButtonOver = var_36_58

	local var_36_59
	local var_36_60 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_36_4:RegisterAnimationSequence("ButtonUp", var_36_60)

	local var_36_61 = {
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

	var_36_22:RegisterAnimationSequence("ButtonUp", var_36_61)

	local var_36_62 = {
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

	var_36_24:RegisterAnimationSequence("ButtonUp", var_36_62)

	local var_36_63 = {
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

	var_36_26:RegisterAnimationSequence("ButtonUp", var_36_63)

	local var_36_64 = {
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

	var_36_28:RegisterAnimationSequence("ButtonUp", var_36_64)

	local var_36_65 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 62
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -226
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -203
		}
	}

	var_36_30:RegisterAnimationSequence("ButtonUp", var_36_65)

	local var_36_66 = {
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

	var_36_32:RegisterAnimationSequence("ButtonUp", var_36_66)

	local var_36_67 = {
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

	var_36_36:RegisterAnimationSequence("ButtonUp", var_36_67)

	local var_36_68 = {
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

	var_36_38:RegisterAnimationSequence("ButtonUp", var_36_68)

	local var_36_69 = {
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

	var_36_40:RegisterAnimationSequence("ButtonUp", var_36_69)

	local var_36_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -226
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -198
		}
	}

	var_36_44:RegisterAnimationSequence("ButtonUp", var_36_70)

	local function var_36_71()
		var_36_4:AnimateSequence("ButtonUp")
		var_36_22:AnimateSequence("ButtonUp")
		var_36_24:AnimateSequence("ButtonUp")
		var_36_26:AnimateSequence("ButtonUp")
		var_36_28:AnimateSequence("ButtonUp")
		var_36_30:AnimateSequence("ButtonUp")
		var_36_32:AnimateSequence("ButtonUp")
		var_36_36:AnimateSequence("ButtonUp")
		var_36_38:AnimateSequence("ButtonUp")
		var_36_40:AnimateSequence("ButtonUp")
		var_36_44:AnimateSequence("ButtonUp")
	end

	var_36_0._sequences.ButtonUp = var_36_71

	local var_36_72
	local var_36_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Locked
		}
	}

	var_36_10:RegisterAnimationSequence("IncompleteFree", var_36_73)

	local var_36_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		}
	}

	var_36_15:RegisterAnimationSequence("IncompleteFree", var_36_74)

	local function var_36_75()
		var_36_10:AnimateSequence("IncompleteFree")
		var_36_15:AnimateSequence("IncompleteFree")
	end

	var_36_0._sequences.IncompleteFree = var_36_75

	local var_36_76
	local var_36_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		}
	}

	var_36_10:RegisterAnimationSequence("CompleteFree", var_36_77)

	local var_36_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Locked
		}
	}

	var_36_15:RegisterAnimationSequence("CompleteFree", var_36_78)

	local var_36_79 = {
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

	var_36_22:RegisterAnimationSequence("CompleteFree", var_36_79)

	local var_36_80 = {
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

	var_36_28:RegisterAnimationSequence("CompleteFree", var_36_80)

	local function var_36_81()
		var_36_10:AnimateSequence("CompleteFree")
		var_36_15:AnimateSequence("CompleteFree")
		var_36_22:AnimateSequence("CompleteFree")
		var_36_28:AnimateSequence("CompleteFree")
	end

	var_36_0._sequences.CompleteFree = var_36_81

	local var_36_82
	local var_36_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_36_10:RegisterAnimationSequence("IncompletePurchased", var_36_83)

	local var_36_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		}
	}

	var_36_13:RegisterAnimationSequence("IncompletePurchased", var_36_84)

	local var_36_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		}
	}

	var_36_15:RegisterAnimationSequence("IncompletePurchased", var_36_85)

	local function var_36_86()
		var_36_10:AnimateSequence("IncompletePurchased")
		var_36_13:AnimateSequence("IncompletePurchased")
		var_36_15:AnimateSequence("IncompletePurchased")
	end

	var_36_0._sequences.IncompletePurchased = var_36_86

	local var_36_87
	local var_36_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_36_10:RegisterAnimationSequence("CompletePurchased", var_36_88)

	local var_36_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_13:RegisterAnimationSequence("CompletePurchased", var_36_89)

	local var_36_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_36_15:RegisterAnimationSequence("CompletePurchased", var_36_90)

	local var_36_91 = {
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

	var_36_22:RegisterAnimationSequence("CompletePurchased", var_36_91)

	local var_36_92 = {
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

	var_36_28:RegisterAnimationSequence("CompletePurchased", var_36_92)

	local function var_36_93()
		var_36_10:AnimateSequence("CompletePurchased")
		var_36_13:AnimateSequence("CompletePurchased")
		var_36_15:AnimateSequence("CompletePurchased")
		var_36_22:AnimateSequence("CompletePurchased")
		var_36_28:AnimateSequence("CompletePurchased")
	end

	var_36_0._sequences.CompletePurchased = var_36_93

	local var_36_94
	local var_36_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_8:RegisterAnimationSequence("HideLevel", var_36_95)

	local var_36_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_10:RegisterAnimationSequence("HideLevel", var_36_96)

	local var_36_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_13:RegisterAnimationSequence("HideLevel", var_36_97)

	local var_36_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_15:RegisterAnimationSequence("HideLevel", var_36_98)

	local var_36_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_17:RegisterAnimationSequence("HideLevel", var_36_99)

	local function var_36_100()
		var_36_8:AnimateSequence("HideLevel")
		var_36_10:AnimateSequence("HideLevel")
		var_36_13:AnimateSequence("HideLevel")
		var_36_15:AnimateSequence("HideLevel")
		var_36_17:AnimateSequence("HideLevel")
	end

	var_36_0._sequences.HideLevel = var_36_100

	local var_36_101
	local var_36_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_22:RegisterAnimationSequence("HideCheckbox", var_36_102)

	local var_36_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_28:RegisterAnimationSequence("HideCheckbox", var_36_103)

	local function var_36_104()
		var_36_22:AnimateSequence("HideCheckbox")
		var_36_28:AnimateSequence("HideCheckbox")
	end

	var_36_0._sequences.HideCheckbox = var_36_104

	local var_36_105
	local var_36_106 = {
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

	var_36_10:RegisterAnimationSequence("LargeLevel", var_36_106)

	local var_36_107 = {
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

	var_36_13:RegisterAnimationSequence("LargeLevel", var_36_107)

	local var_36_108 = {
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

	var_36_15:RegisterAnimationSequence("LargeLevel", var_36_108)

	local var_36_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		}
	}

	var_36_17:RegisterAnimationSequence("LargeLevel", var_36_109)

	local var_36_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 44
		}
	}

	var_36_22:RegisterAnimationSequence("LargeLevel", var_36_110)

	local function var_36_111()
		var_36_10:AnimateSequence("LargeLevel")
		var_36_13:AnimateSequence("LargeLevel")
		var_36_15:AnimateSequence("LargeLevel")
		var_36_17:AnimateSequence("LargeLevel")
		var_36_22:AnimateSequence("LargeLevel")
	end

	var_36_0._sequences.LargeLevel = var_36_111

	local var_36_112
	local var_36_113 = {
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

	var_36_10:RegisterAnimationSequence("NormalLevel", var_36_113)

	local var_36_114 = {
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

	var_36_13:RegisterAnimationSequence("NormalLevel", var_36_114)

	local var_36_115 = {
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

	var_36_15:RegisterAnimationSequence("NormalLevel", var_36_115)

	local var_36_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -27
		}
	}

	var_36_17:RegisterAnimationSequence("NormalLevel", var_36_116)

	local function var_36_117()
		var_36_10:AnimateSequence("NormalLevel")
		var_36_13:AnimateSequence("NormalLevel")
		var_36_15:AnimateSequence("NormalLevel")
		var_36_17:AnimateSequence("NormalLevel")
	end

	var_36_0._sequences.NormalLevel = var_36_117

	local var_36_118
	local var_36_119 = {
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

	var_36_19:RegisterAnimationSequence("TierCompleteFlare", var_36_119)

	local function var_36_120()
		var_36_19:AnimateSequence("TierCompleteFlare")
	end

	var_36_0._sequences.TierCompleteFlare = var_36_120

	local var_36_121
	local var_36_122 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_8:RegisterAnimationSequence("ShowLevel", var_36_122)

	local var_36_123 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_10:RegisterAnimationSequence("ShowLevel", var_36_123)

	local var_36_124 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_13:RegisterAnimationSequence("ShowLevel", var_36_124)

	local var_36_125 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_15:RegisterAnimationSequence("ShowLevel", var_36_125)

	local function var_36_126()
		var_36_8:AnimateSequence("ShowLevel")
		var_36_10:AnimateSequence("ShowLevel")
		var_36_13:AnimateSequence("ShowLevel")
		var_36_15:AnimateSequence("ShowLevel")
	end

	var_36_0._sequences.ShowLevel = var_36_126

	local var_36_127
	local var_36_128 = {
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

	var_36_34:RegisterAnimationSequence("Glint", var_36_128)

	local function var_36_129()
		var_36_34:AnimateLoop("Glint")
	end

	var_36_0._sequences.Glint = var_36_129

	local var_36_130
	local var_36_131 = {
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

	var_36_34:RegisterAnimationSequence("StopGlint", var_36_131)

	local function var_36_132()
		var_36_34:AnimateSequence("StopGlint")
	end

	var_36_0._sequences.StopGlint = var_36_132

	local var_36_133
	local var_36_134 = {
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
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_36_4:RegisterAnimationSequence("ButtonOverSnap", var_36_134)

	local var_36_135 = {
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

	var_36_22:RegisterAnimationSequence("ButtonOverSnap", var_36_135)

	local var_36_136 = {
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

	var_36_24:RegisterAnimationSequence("ButtonOverSnap", var_36_136)

	local var_36_137 = {
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

	var_36_26:RegisterAnimationSequence("ButtonOverSnap", var_36_137)

	local var_36_138 = {
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

	var_36_28:RegisterAnimationSequence("ButtonOverSnap", var_36_138)

	local var_36_139 = {
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
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -268
		}
	}

	var_36_30:RegisterAnimationSequence("ButtonOverSnap", var_36_139)

	local var_36_140 = {
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

	var_36_32:RegisterAnimationSequence("ButtonOverSnap", var_36_140)

	local var_36_141 = {
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

	var_36_36:RegisterAnimationSequence("ButtonOverSnap", var_36_141)

	local var_36_142 = {
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

	var_36_38:RegisterAnimationSequence("ButtonOverSnap", var_36_142)

	local var_36_143 = {
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

	var_36_40:RegisterAnimationSequence("ButtonOverSnap", var_36_143)

	local var_36_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -264
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -89
		}
	}

	var_36_44:RegisterAnimationSequence("ButtonOverSnap", var_36_144)

	local function var_36_145()
		var_36_4:AnimateSequence("ButtonOverSnap")
		var_36_22:AnimateSequence("ButtonOverSnap")
		var_36_24:AnimateSequence("ButtonOverSnap")
		var_36_26:AnimateSequence("ButtonOverSnap")
		var_36_28:AnimateSequence("ButtonOverSnap")
		var_36_30:AnimateSequence("ButtonOverSnap")
		var_36_32:AnimateSequence("ButtonOverSnap")
		var_36_36:AnimateSequence("ButtonOverSnap")
		var_36_38:AnimateSequence("ButtonOverSnap")
		var_36_40:AnimateSequence("ButtonOverSnap")
		var_36_44:AnimateSequence("ButtonOverSnap")
	end

	var_36_0._sequences.ButtonOverSnap = var_36_145

	local var_36_146
	local var_36_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_36_4:RegisterAnimationSequence("ButtonUpSnap", var_36_147)

	local var_36_148 = {
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

	var_36_22:RegisterAnimationSequence("ButtonUpSnap", var_36_148)

	local var_36_149 = {
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

	var_36_24:RegisterAnimationSequence("ButtonUpSnap", var_36_149)

	local var_36_150 = {
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

	var_36_26:RegisterAnimationSequence("ButtonUpSnap", var_36_150)

	local var_36_151 = {
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

	var_36_28:RegisterAnimationSequence("ButtonUpSnap", var_36_151)

	local var_36_152 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -226
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -203
		}
	}

	var_36_30:RegisterAnimationSequence("ButtonUpSnap", var_36_152)

	local var_36_153 = {
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

	var_36_32:RegisterAnimationSequence("ButtonUpSnap", var_36_153)

	local var_36_154 = {
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

	var_36_36:RegisterAnimationSequence("ButtonUpSnap", var_36_154)

	local var_36_155 = {
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

	var_36_38:RegisterAnimationSequence("ButtonUpSnap", var_36_155)

	local var_36_156 = {
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

	var_36_40:RegisterAnimationSequence("ButtonUpSnap", var_36_156)

	local var_36_157 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -226
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		}
	}

	var_36_44:RegisterAnimationSequence("ButtonUpSnap", var_36_157)

	local function var_36_158()
		var_36_4:AnimateSequence("ButtonUpSnap")
		var_36_22:AnimateSequence("ButtonUpSnap")
		var_36_24:AnimateSequence("ButtonUpSnap")
		var_36_26:AnimateSequence("ButtonUpSnap")
		var_36_28:AnimateSequence("ButtonUpSnap")
		var_36_30:AnimateSequence("ButtonUpSnap")
		var_36_32:AnimateSequence("ButtonUpSnap")
		var_36_36:AnimateSequence("ButtonUpSnap")
		var_36_38:AnimateSequence("ButtonUpSnap")
		var_36_40:AnimateSequence("ButtonUpSnap")
		var_36_44:AnimateSequence("ButtonUpSnap")
	end

	var_36_0._sequences.ButtonUpSnap = var_36_158

	local var_36_159
	local var_36_160 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_8:RegisterAnimationSequence("MultiTier", var_36_160)

	local var_36_161 = {
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

	var_36_10:RegisterAnimationSequence("MultiTier", var_36_161)

	local var_36_162 = {
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

	var_36_13:RegisterAnimationSequence("MultiTier", var_36_162)

	local var_36_163 = {
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

	var_36_15:RegisterAnimationSequence("MultiTier", var_36_163)

	local var_36_164 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_17:RegisterAnimationSequence("MultiTier", var_36_164)

	local function var_36_165()
		var_36_8:AnimateSequence("MultiTier")
		var_36_10:AnimateSequence("MultiTier")
		var_36_13:AnimateSequence("MultiTier")
		var_36_15:AnimateSequence("MultiTier")
		var_36_17:AnimateSequence("MultiTier")
	end

	var_36_0._sequences.MultiTier = var_36_165

	local var_36_166
	local var_36_167 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_8:RegisterAnimationSequence("VIPPopUp", var_36_167)

	local var_36_168 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_10:RegisterAnimationSequence("VIPPopUp", var_36_168)

	local var_36_169 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_13:RegisterAnimationSequence("VIPPopUp", var_36_169)

	local var_36_170 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 6
		}
	}

	var_36_15:RegisterAnimationSequence("VIPPopUp", var_36_170)

	local var_36_171 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_36_0.ProgressBar.Fill
		}
	}

	var_36_17:RegisterAnimationSequence("VIPPopUp", var_36_171)

	local var_36_172 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_32:RegisterAnimationSequence("VIPPopUp", var_36_172)

	local var_36_173 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_38:RegisterAnimationSequence("VIPPopUp", var_36_173)

	local function var_36_174()
		var_36_8:AnimateSequence("VIPPopUp")
		var_36_10:AnimateSequence("VIPPopUp")
		var_36_13:AnimateSequence("VIPPopUp")
		var_36_15:AnimateSequence("VIPPopUp")
		var_36_17:AnimateSequence("VIPPopUp")
		var_36_32:AnimateSequence("VIPPopUp")
		var_36_38:AnimateSequence("VIPPopUp")
	end

	var_36_0._sequences.VIPPopUp = var_36_174

	local var_36_175
	local var_36_176 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_36_4:RegisterAnimationSequence("ToggleableButtonUp", var_36_176)

	local var_36_177 = {
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

	var_36_22:RegisterAnimationSequence("ToggleableButtonUp", var_36_177)

	local var_36_178 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -285
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -325
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_24:RegisterAnimationSequence("ToggleableButtonUp", var_36_178)

	local var_36_179 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -205
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

	var_36_26:RegisterAnimationSequence("ToggleableButtonUp", var_36_179)

	local var_36_180 = {
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

	var_36_28:RegisterAnimationSequence("ToggleableButtonUp", var_36_180)

	local var_36_181 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -226
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -205
		}
	}

	var_36_30:RegisterAnimationSequence("ToggleableButtonUp", var_36_181)

	local var_36_182 = {
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

	var_36_32:RegisterAnimationSequence("ToggleableButtonUp", var_36_182)

	local var_36_183 = {
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

	var_36_36:RegisterAnimationSequence("ToggleableButtonUp", var_36_183)

	local var_36_184 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -280
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -256
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 63
		}
	}

	var_36_38:RegisterAnimationSequence("ToggleableButtonUp", var_36_184)

	local var_36_185 = {
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

	var_36_40:RegisterAnimationSequence("ToggleableButtonUp", var_36_185)

	local var_36_186 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_36_44:RegisterAnimationSequence("ToggleableButtonUp", var_36_186)

	local function var_36_187()
		var_36_4:AnimateSequence("ToggleableButtonUp")
		var_36_22:AnimateSequence("ToggleableButtonUp")
		var_36_24:AnimateSequence("ToggleableButtonUp")
		var_36_26:AnimateSequence("ToggleableButtonUp")
		var_36_28:AnimateSequence("ToggleableButtonUp")
		var_36_30:AnimateSequence("ToggleableButtonUp")
		var_36_32:AnimateSequence("ToggleableButtonUp")
		var_36_36:AnimateSequence("ToggleableButtonUp")
		var_36_38:AnimateSequence("ToggleableButtonUp")
		var_36_40:AnimateSequence("ToggleableButtonUp")
		var_36_44:AnimateSequence("ToggleableButtonUp")
	end

	var_36_0._sequences.ToggleableButtonUp = var_36_187

	local var_36_188
	local var_36_189 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_36_4:RegisterAnimationSequence("ToggleableButtonUpSnap", var_36_189)

	local var_36_190 = {
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

	var_36_22:RegisterAnimationSequence("ToggleableButtonUpSnap", var_36_190)

	local var_36_191 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -285
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -325
		}
	}

	var_36_24:RegisterAnimationSequence("ToggleableButtonUpSnap", var_36_191)

	local var_36_192 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -205
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

	var_36_26:RegisterAnimationSequence("ToggleableButtonUpSnap", var_36_192)

	local var_36_193 = {
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

	var_36_28:RegisterAnimationSequence("ToggleableButtonUpSnap", var_36_193)

	local var_36_194 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -226
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -205
		}
	}

	var_36_30:RegisterAnimationSequence("ToggleableButtonUpSnap", var_36_194)

	local var_36_195 = {
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

	var_36_32:RegisterAnimationSequence("ToggleableButtonUpSnap", var_36_195)

	local var_36_196 = {
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

	var_36_36:RegisterAnimationSequence("ToggleableButtonUpSnap", var_36_196)

	local var_36_197 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -280
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 63
		}
	}

	var_36_38:RegisterAnimationSequence("ToggleableButtonUpSnap", var_36_197)

	local var_36_198 = {
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

	var_36_40:RegisterAnimationSequence("ToggleableButtonUpSnap", var_36_198)

	local var_36_199 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -195
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		}
	}

	var_36_44:RegisterAnimationSequence("ToggleableButtonUpSnap", var_36_199)

	local function var_36_200()
		var_36_4:AnimateSequence("ToggleableButtonUpSnap")
		var_36_22:AnimateSequence("ToggleableButtonUpSnap")
		var_36_24:AnimateSequence("ToggleableButtonUpSnap")
		var_36_26:AnimateSequence("ToggleableButtonUpSnap")
		var_36_28:AnimateSequence("ToggleableButtonUpSnap")
		var_36_30:AnimateSequence("ToggleableButtonUpSnap")
		var_36_32:AnimateSequence("ToggleableButtonUpSnap")
		var_36_36:AnimateSequence("ToggleableButtonUpSnap")
		var_36_38:AnimateSequence("ToggleableButtonUpSnap")
		var_36_40:AnimateSequence("ToggleableButtonUpSnap")
		var_36_44:AnimateSequence("ToggleableButtonUpSnap")
	end

	var_36_0._sequences.ToggleableButtonUpSnap = var_36_200

	local var_36_201
	local var_36_202 = {
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
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_36_4:RegisterAnimationSequence("ToggleableButtonOver", var_36_202)

	local var_36_203 = {
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

	var_36_22:RegisterAnimationSequence("ToggleableButtonOver", var_36_203)

	local var_36_204 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -353
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -393
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_24:RegisterAnimationSequence("ToggleableButtonOver", var_36_204)

	local var_36_205 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -258
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

	var_36_26:RegisterAnimationSequence("ToggleableButtonOver", var_36_205)

	local var_36_206 = {
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

	var_36_28:RegisterAnimationSequence("ToggleableButtonOver", var_36_206)

	local var_36_207 = {
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
			value = _1080p * 84
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -270
		}
	}

	var_36_30:RegisterAnimationSequence("ToggleableButtonOver", var_36_207)

	local var_36_208 = {
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

	var_36_32:RegisterAnimationSequence("ToggleableButtonOver", var_36_208)

	local var_36_209 = {
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

	var_36_36:RegisterAnimationSequence("ToggleableButtonOver", var_36_209)

	local var_36_210 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -346
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -88
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 88
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -322
		}
	}

	var_36_38:RegisterAnimationSequence("ToggleableButtonOver", var_36_210)

	local var_36_211 = {
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

	var_36_40:RegisterAnimationSequence("ToggleableButtonOver", var_36_211)

	local var_36_212 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -261
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -233
		}
	}

	var_36_44:RegisterAnimationSequence("ToggleableButtonOver", var_36_212)

	local function var_36_213()
		var_36_4:AnimateSequence("ToggleableButtonOver")
		var_36_22:AnimateSequence("ToggleableButtonOver")
		var_36_24:AnimateSequence("ToggleableButtonOver")
		var_36_26:AnimateSequence("ToggleableButtonOver")
		var_36_28:AnimateSequence("ToggleableButtonOver")
		var_36_30:AnimateSequence("ToggleableButtonOver")
		var_36_32:AnimateSequence("ToggleableButtonOver")
		var_36_36:AnimateSequence("ToggleableButtonOver")
		var_36_38:AnimateSequence("ToggleableButtonOver")
		var_36_40:AnimateSequence("ToggleableButtonOver")
		var_36_44:AnimateSequence("ToggleableButtonOver")
	end

	var_36_0._sequences.ToggleableButtonOver = var_36_213

	local var_36_214
	local var_36_215 = {
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
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_36_4:RegisterAnimationSequence("ToggleableButtonOverSnap", var_36_215)

	local var_36_216 = {
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

	var_36_22:RegisterAnimationSequence("ToggleableButtonOverSnap", var_36_216)

	local var_36_217 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -353
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -393
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_36_24:RegisterAnimationSequence("ToggleableButtonOverSnap", var_36_217)

	local var_36_218 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -258
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

	var_36_26:RegisterAnimationSequence("ToggleableButtonOverSnap", var_36_218)

	local var_36_219 = {
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

	var_36_28:RegisterAnimationSequence("ToggleableButtonOverSnap", var_36_219)

	local var_36_220 = {
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
			value = _1080p * 84
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -270
		}
	}

	var_36_30:RegisterAnimationSequence("ToggleableButtonOverSnap", var_36_220)

	local var_36_221 = {
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

	var_36_32:RegisterAnimationSequence("ToggleableButtonOverSnap", var_36_221)

	local var_36_222 = {
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

	var_36_36:RegisterAnimationSequence("ToggleableButtonOverSnap", var_36_222)

	local var_36_223 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -346
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -322
		}
	}

	var_36_38:RegisterAnimationSequence("ToggleableButtonOverSnap", var_36_223)

	local var_36_224 = {
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

	var_36_40:RegisterAnimationSequence("ToggleableButtonOverSnap", var_36_224)

	local var_36_225 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -233
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -261
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -89
		}
	}

	var_36_44:RegisterAnimationSequence("ToggleableButtonOverSnap", var_36_225)

	local function var_36_226()
		var_36_4:AnimateSequence("ToggleableButtonOverSnap")
		var_36_22:AnimateSequence("ToggleableButtonOverSnap")
		var_36_24:AnimateSequence("ToggleableButtonOverSnap")
		var_36_26:AnimateSequence("ToggleableButtonOverSnap")
		var_36_28:AnimateSequence("ToggleableButtonOverSnap")
		var_36_30:AnimateSequence("ToggleableButtonOverSnap")
		var_36_32:AnimateSequence("ToggleableButtonOverSnap")
		var_36_36:AnimateSequence("ToggleableButtonOverSnap")
		var_36_38:AnimateSequence("ToggleableButtonOverSnap")
		var_36_40:AnimateSequence("ToggleableButtonOverSnap")
		var_36_44:AnimateSequence("ToggleableButtonOverSnap")
	end

	var_36_0._sequences.ToggleableButtonOverSnap = var_36_226

	local var_36_227
	local var_36_228 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -386
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
			value = _1080p * -362
		}
	}

	var_36_38:RegisterAnimationSequence("ScaleUpFreeBanner", var_36_228)

	local function var_36_229()
		var_36_38:AnimateSequence("ScaleUpFreeBanner")
	end

	var_36_0._sequences.ScaleUpFreeBanner = var_36_229

	local var_36_230
	local var_36_231 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -346
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -88
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 88
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -322
		}
	}

	var_36_38:RegisterAnimationSequence("ScaleDownFreeBanner", var_36_231)

	local function var_36_232()
		var_36_38:AnimateSequence("ScaleDownFreeBanner")
	end

	var_36_0._sequences.ScaleDownFreeBanner = var_36_232

	var_0_30(var_36_0, var_36_1, arg_36_1)

	return var_36_0
end

MenuBuilder.registerType("BattlePassItem", BattlePassItem)
LockTable(_M)
