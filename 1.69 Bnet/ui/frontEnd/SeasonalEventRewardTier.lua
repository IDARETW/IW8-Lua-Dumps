module(..., package.seeall)

local var_0_0 = 150 * _1080p
local var_0_1 = 180 * _1080p
local var_0_2 = 150
local var_0_3 = 150
local var_0_4 = SWATCHES.BattlePass.Free

local function var_0_5(arg_1_0, arg_1_1, arg_1_2)
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

local function var_0_6(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._ownedLoot[arg_2_2] = arg_2_1
end

local function var_0_7(arg_3_0, arg_3_1)
	arg_3_0._level = arg_3_1

	arg_3_0.Level:setText(Engine.JCBDICCAH(arg_3_1))
end

local function var_0_8(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._cost = arg_4_1

	if arg_4_2 and arg_4_2.costString then
		arg_4_0.LevelCost:setText(Engine.CBBHFCGDIC(arg_4_2.costString, Engine.JCBDICCAH(LUI.FormatLargeNumber(arg_4_1))))
	else
		arg_4_0.LevelCost:setText(Engine.JCBDICCAH(LUI.FormatLargeNumber(arg_4_1)))
	end
end

local function var_0_9(arg_5_0)
	return arg_5_0 and 0 or var_0_2
end

local function var_0_10(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0._isAnimating then
		return
	end

	local function var_6_0()
		if arg_6_0._lootIndex ~= 1 then
			arg_6_0:CycleLootCards(1, true)
		end

		arg_6_0._cycleEnabled = arg_6_1
	end

	if arg_6_2 then
		var_6_0()
	else
		arg_6_0:Wait(var_0_2).onComplete = var_6_0
	end
end

local function var_0_11(arg_8_0, arg_8_1)
	if LUI.IsLastInputGamepad(arg_8_0._controllerIndex) and arg_8_0.isMultiItemTier and arg_8_0._isExpanded then
		arg_8_0.TogglePromptText:SetAlpha(1)
	else
		arg_8_0.TogglePromptText:SetAlpha(0)
	end
end

local function var_0_12(arg_9_0, arg_9_1)
	if arg_9_0.isMultiItemTier then
		var_0_5(arg_9_0, "ToggleableButtonUp", arg_9_1)
		var_0_11(arg_9_0)
	else
		var_0_5(arg_9_0, "ButtonUp", arg_9_1)
	end

	var_0_10(arg_9_0, false, arg_9_1)
end

local function var_0_13(arg_10_0, arg_10_1)
	if arg_10_0.isMultiItemTier then
		var_0_5(arg_10_0, "ToggleableButtonOver", arg_10_1)
		var_0_11(arg_10_0)
	else
		var_0_5(arg_10_0, "ButtonOver", arg_10_1)
	end

	var_0_10(arg_10_0, true, arg_10_1)

	if arg_10_0._lockedIds[arg_10_0._lootIndex] then
		ACTIONS.AnimateSequence(arg_10_0, "ButtonOverDisabled")
	end
end

local function var_0_14(arg_11_0)
	return arg_11_0 == LOOT.itemTypes.PLAYERCARD or arg_11_0 == LOOT.itemTypes.EMBLEM or arg_11_0 == LOOT.itemTypes.CHARM or arg_11_0 == LOOT.itemTypes.STICKER or arg_11_0 == LOOT.itemTypes.GESTURES or arg_11_0 == LOOT.itemTypes.SPRAYS or arg_11_0 == LOOT.itemTypes.FEATURE and not lootCard.lootData.isOperatorChallenge or arg_11_0 == LOOT.itemTypes.CONSUMABLE or arg_11_0 == "xp"
end

local function var_0_15(arg_12_0, arg_12_1)
	if arg_12_0._column == nil or arg_12_0._isExpanded == true then
		return
	end

	arg_12_0._isExpanded = true
	arg_12_0._isOver = true

	arg_12_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_1, 0, 0, var_0_9(arg_12_1))
	var_0_5(arg_12_0._lootCards[arg_12_0._lootIndex], "MiniButtonOver", arg_12_1)

	local var_12_0 = arg_12_0.lootData and arg_12_0.lootData.type

	if var_12_0 and var_0_14(var_12_0) then
		var_0_5(arg_12_0._lootCards[1], "FocusGained", arg_12_1)
	end

	var_0_13(arg_12_0, arg_12_1)
end

local function var_0_16(arg_13_0, arg_13_1)
	if arg_13_0._isExpanded == false then
		return
	end

	arg_13_0._isExpanded = false
	arg_13_0._isOver = false

	arg_13_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_0, 0, 0, var_0_9(arg_13_1))
	var_0_5(arg_13_0._lootCards[1], "FocusLost", arg_13_1)
	var_0_5(arg_13_0._lootCards[1], "MiniButtonUp", arg_13_1)
	var_0_12(arg_13_0, arg_13_1)
end

local function var_0_17(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.isMultiItemTier and arg_14_2 or 1
	local var_14_1 = arg_14_0._lootCards[var_14_0]

	if not var_14_1 then
		return
	end

	arg_14_0._lockedIds[var_14_0] = arg_14_1

	if arg_14_0._isOver then
		var_0_13(arg_14_0, true)
	else
		var_0_12(arg_14_0, true)
	end

	var_14_1.Border:SetAlpha(1)

	local var_14_2 = var_14_1.lootData
	local var_14_3 = arg_14_1 or var_14_2 and var_14_2.isLocked

	if #arg_14_0.itemData.lootTable > 1 then
		var_14_3 = var_14_3 or arg_14_0._progressBars[arg_14_2]:GetProgress() < 1
	end

	if var_14_3 then
		ACTIONS.AnimateSequence(var_14_1, "ShowLock")
	else
		ACTIONS.AnimateSequence(var_14_1, "ShowCheckboxCompletePurchased")
	end
end

local function var_0_18(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	assert(arg_15_0.itemData)
	assert(arg_15_3 and arg_15_3 > 0 and arg_15_3 <= #arg_15_0._progressBars)

	arg_15_1 = LUI.clamp(arg_15_1, 0, 1)
	arg_15_0._completedBars[arg_15_3] = arg_15_1 == 1 and true or nil

	local var_15_0 = 0

	for iter_15_0 in pairs(arg_15_0._completedBars) do
		var_15_0 = var_15_0 + 1
	end

	local function var_15_1()
		if var_15_0 > 1 then
			ACTIONS.AnimateSequence(arg_15_0, "AllComplete")
		elseif arg_15_0._completedBars[arg_15_3] then
			ACTIONS.AnimateSequence(arg_15_0, "Complete")
			arg_15_0.LevelFill:SetRGBFromInt(arg_15_0._barColors[arg_15_3])
		elseif var_15_0 < 1 then
			ACTIONS.AnimateSequence(arg_15_0, "Incomplete")
		end
	end

	arg_15_0._progressBars[arg_15_3]:SetProgress(arg_15_1, arg_15_2, LUI.EASING.inOutCubic)

	if arg_15_2 and arg_15_2 > 0 then
		arg_15_0:Wait(arg_15_2, true).onComplete = var_15_1
	else
		var_15_1()
	end
end

local function var_0_19(arg_17_0, arg_17_1)
	return arg_17_0._progressBars[arg_17_1]:GetProgress()
end

local function var_0_20(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	arg_18_0._progressBars[arg_18_2]:EnableGlow(arg_18_1, arg_18_3)
	arg_18_0.LevelFlare:SetColorOp(COLOR_OP.none)
end

local function var_0_21(arg_19_0, arg_19_1)
	arg_19_0._isAnimating = arg_19_1
end

local function var_0_22(arg_20_0)
	if arg_20_0._isOver then
		var_0_15(arg_20_0, true)
	elseif arg_20_0._isExpanded then
		var_0_16(arg_20_0, true)
	end
end

local function var_0_23(arg_21_0, arg_21_1)
	assert(arg_21_1 >= 1, "SeasonalEventRewardTier requires at least 1 loot card")

	if arg_21_1 < 1 then
		return
	elseif arg_21_1 > 1 then
		ACTIONS.AnimateSequence(arg_21_0.LootItemCardMiniDouble, "ShowBackCard")
	else
		ACTIONS.AnimateSequence(arg_21_0.LootItemCardMiniDouble, "HideBackCard")
	end

	ACTIONS.AnimateSequence(arg_21_0.LootItemCardMiniDouble, "SwitchToFrontCardSnap")

	arg_21_0._lootIndex = 1

	var_0_22(arg_21_0)
	var_0_10(arg_21_0, true, true)
end

local function var_0_24(arg_22_0, arg_22_1)
	if not arg_22_1 or not arg_22_1.lootTable then
		return
	end

	local var_22_0 = #arg_22_1.lootTable

	var_0_23(arg_22_0, var_22_0)

	for iter_22_0, iter_22_1 in ipairs(arg_22_1.lootTable) do
		local var_22_1 = {}
		local var_22_2 = iter_22_1.lootID
		local var_22_3 = LOOT.GetLootFileForID(var_22_2)
		local var_22_4

		if var_22_3 ~= nil then
			var_22_4 = StringTable.DIFCHIGDFB(var_22_3, 0, var_22_2, 1)
		end

		if var_22_4 and #var_22_4 > 0 then
			var_22_1.ref = var_22_4
			var_22_1.itemID = var_22_2
			var_22_1.type = LOOT.GetTypeForID(var_22_1.itemID)
			var_22_1.image = LOOT.GetItemImage(var_22_1.type, var_22_1.ref, var_22_1.itemID)
			var_22_1.rarity = LOOT.GetItemQuality(var_22_1.type, var_22_1.ref, var_22_1.itemID)
			var_22_1.rarityColor = LOOT.GetRarityColor(var_22_1.rarity)
			var_22_1.rarityImage = LOOT.GetRarityImage(var_22_1.rarity)
			var_22_1.className = LOOT.GetItemClassName(var_22_1.type, var_22_1.ref)
			var_22_1.IsVariant = var_22_1.type == LOOT.itemTypes.WEAPON and WEAPON.IsVariant(arg_22_0._controllerIndex, var_22_1.itemID)
			var_22_1.isLocked = iter_22_1.isLocked
			var_22_1.isOperatorChallengeReward = iter_22_1.isOperatorChallengeReward
			var_22_1.operatorChallengeName = iter_22_1.operatorChallengeName
			var_22_1.name = LOOT.GetItemName(var_22_1.type, var_22_1.ref, var_22_1.itemID)

			if var_22_1.type == LOOT.itemTypes.CONSUMABLE then
				local var_22_5 = StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, var_22_1.itemID, CSV.consumablesIDs.cols.duration)

				if var_22_5 ~= nil and #var_22_5 > 0 then
					var_22_1.duration = Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.consumablesIDs.file, CSV.consumablesIDs.cols.id, var_22_1.itemID, CSV.consumablesIDs.cols.duration))
				end
			elseif var_22_1.type == LOOT.itemTypes.FEATURE then
				var_22_1.isOperatorChallenge = LOOT.IsFeatureOperatorChallenge(var_22_1.ref)
			elseif var_22_1.type == LOOT.itemTypes.VEHICLE_TRACK then
				var_22_1.vehicleTrackCount = var_22_0
			elseif var_22_1.type == LOOT.itemTypes.S4_MISC then
				var_22_1.miscType = LOOT.GetMiscTypeForID(var_22_2)
			end
		end

		arg_22_0._lootCards[iter_22_0]:UpdateCardConfig(var_22_1)
		arg_22_0._lootCards[iter_22_0].Tracer:SetAlpha(0)

		if var_22_1.type == LOOT.itemTypes.WEAPON then
			arg_22_0._lootCards[iter_22_0]:SetupTracer(nil, var_22_2)
		end

		if arg_22_0._lootCards[iter_22_0].SnipeBanner then
			if iter_22_1._gameSourceId then
				if var_22_2 then
					local var_22_6 = LOOT.GetGameSourceExclusivityByItemID(var_22_2)

					if arg_22_0.isMultiItemTier or LOOT.itemSourceExclusivityTable[var_22_6].isExclusive then
						local var_22_7 = var_22_6 == LOOT.itemSourceExclusivity.VG_EXCLUSIVE or var_22_6 == LOOT.itemSourceExclusivity.VG_WZ
						local var_22_8 = var_22_6 == LOOT.itemSourceExclusivity.VG_EXCLUSIVE
						local var_22_9 = {
							gameSourceExclusivityID = var_22_6,
							isExclusive = var_22_8,
							condensed = var_22_7
						}

						arg_22_0._lootCards[iter_22_0].SnipeBanner:SetGameSource(var_22_9)
					else
						ACTIONS.AnimateSequence(arg_22_0._lootCards[iter_22_0].SnipeBanner, "Hide")
					end
				else
					arg_22_0._lootCards[iter_22_0].SnipeBanner:SetGameSource({
						gameSourceID = iter_22_1._gameSourceId
					})
				end
			else
				ACTIONS.AnimateSequence(arg_22_0._lootCards[iter_22_0].SnipeBanner, "Hide")
			end
		end

		if #arg_22_0.itemData.lootTable > 1 then
			arg_22_0._lootCards[iter_22_0].Border:SetRGBFromInt(arg_22_0._barColors[iter_22_0])
		else
			arg_22_0._lootCards[iter_22_0].Border:SetRGBFromTable(var_0_4)
		end

		arg_22_0._lootCards[iter_22_0].lootData = var_22_1
	end

	arg_22_0.lootData = arg_22_0._lootCards[1].lootData
end

local function var_0_25(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	if not arg_23_3 and not arg_23_0._cycleEnabled and not arg_23_2 then
		return
	end

	for iter_23_0, iter_23_1 in ipairs(arg_23_0._lootCards) do
		if iter_23_0 == arg_23_1 then
			if arg_23_0._isOver then
				var_0_5(iter_23_1, "MiniButtonOver", true)
			end

			local var_23_0 = iter_23_1.lootData and iter_23_1.lootData.type

			if var_23_0 and arg_23_0._isOver then
				if var_0_14(var_23_0) then
					var_0_5(iter_23_1, "FocusGained", true)
				else
					var_0_5(iter_23_1, "FocusLost", true)
				end
			end
		else
			var_0_5(iter_23_1, "MiniButtonUp", true)
			var_0_5(iter_23_1, "FocusLost", true)
		end
	end

	if arg_23_2 or arg_23_1 == 1 then
		arg_23_0.LootItemCardMiniDouble:PlaySwapAnimation("SwitchToFrontCard")
	else
		arg_23_0.LootItemCardMiniDouble:PlaySwapAnimation("SwitchToBackCard")
	end

	arg_23_0._lootIndex = arg_23_1
	arg_23_0.lootData = arg_23_0._lootCards[arg_23_1].lootData
	arg_23_0._isCycling = true
	arg_23_0:Wait(var_0_3).onComplete = function()
		arg_23_0._isCycling = false

		if arg_23_0._delayScaleDownAnim then
			arg_23_0.LootItemCardMiniDouble:PlayScaleDownBackAnimation()

			arg_23_0._backCardPulledUp = false
			arg_23_0._delayScaleDownAnim = false
		end
	end
end

local function var_0_26(arg_25_0, arg_25_1)
	local var_25_0 = LOOT.RarityEffects[arg_25_1] and LOOT.RarityEffects[arg_25_1].sfx or SOUND_SETS.battlePass.bpBase

	Engine.BJDBIAGIDA(var_25_0)

	local var_25_1 = LOOT.RarityEffects[arg_25_1] and LOOT.RarityEffects[arg_25_1].flareRef or "Base"

	arg_25_0.LootItemCardFlare:PlayFlareSprite(var_25_1)
end

local function var_0_27(arg_26_0, arg_26_1)
	SEASONAL_EVENT.SetSeenUnlockID(arg_26_0._controllerIndex, arg_26_0.unlockIds[arg_26_1])

	arg_26_0.shouldShowComplete = false
end

local function var_0_28(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0.SetProgress = var_0_18
	arg_27_0.SetLocked = var_0_17
	arg_27_0.SetLevel = var_0_7
	arg_27_0.SetCost = var_0_8
	arg_27_0.EnableGlow = var_0_20
	arg_27_0.SetIsAnimating = var_0_21
	arg_27_0.UpdateExpandedState = var_0_22
	arg_27_0.SetOwned = var_0_6
	arg_27_0.SetupLootData = var_0_24
	arg_27_0.CycleLootCards = var_0_25
	arg_27_0.GetProgress = var_0_19
	arg_27_0.PlayRarityFlare = var_0_26
	arg_27_0.MarkCompleteAnimSeen = var_0_27
	arg_27_0._controllerIndex = arg_27_1
	arg_27_0._lockedIds = {}
	arg_27_0._isOver = false
	arg_27_0._isAnimating = false
	arg_27_0._ownedLoot = {}
	arg_27_0._level = 0
	arg_27_0._cycleEnabled = false
	arg_27_0._isExpanded = false
	arg_27_0._completedBars = {}
	arg_27_0._lootCards = {
		arg_27_0.LootItemCardMiniDouble.FrontLootItemCard,
		arg_27_0.LootItemCardMiniDouble.BackLootItemCard
	}
	arg_27_0._progressBars = {
		arg_27_0.TopProgressBar,
		arg_27_0.BottomProgressBar
	}
	arg_27_0._barColors = {}

	local var_27_0
	local var_27_1
	local var_27_2
	local var_27_3

	for iter_27_0, iter_27_1 in ipairs(arg_27_0._progressBars) do
		local var_27_4, var_27_5, var_27_6, var_27_7 = iter_27_1.Fill:getCurrentRGBA()

		table.insert(arg_27_0._barColors, GetIntForColor({
			r = var_27_4,
			g = var_27_5,
			b = var_27_6
		}))
	end

	arg_27_0:addEventHandler("button_over", function(arg_28_0, arg_28_1)
		var_0_15(arg_28_0, false)
	end)
	arg_27_0:addEventHandler("lose_active", function(arg_29_0, arg_29_1)
		var_0_16(arg_29_0, false)
	end)
	arg_27_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_0_0, 0, 0)
	arg_27_0:SetGridChildDynamicSize(true, LUI.DIRECTION.horizontal)
	arg_27_0.LootItemCardMiniDouble.FlipFocusable:addEventHandler("gain_focus", function(arg_30_0, arg_30_1)
		if arg_27_0.isMultiItemTier then
			arg_27_0.LootItemCardMiniDouble:PlayScaleUpBackAnimation()

			arg_27_0._backCardPulledUp = true

			if not arg_27_0._isExpanded then
				arg_27_0:processEvent({
					name = "button_over"
				})
			end
		end
	end)
	arg_27_0.LootItemCardMiniDouble.FlipFocusable:addEventHandler("lose_focus", function(arg_31_0, arg_31_1)
		if arg_27_0._backCardPulledUp then
			if arg_27_0._isCycling then
				arg_27_0._delayScaleDownAnim = true
			else
				arg_27_0.LootItemCardMiniDouble:PlayScaleDownBackAnimation()

				arg_27_0._backCardPulledUp = false
			end
		end
	end)
	arg_27_0:registerAndCallEventHandler("update_input_type", var_0_11)
end

function SeasonalEventRewardTier(arg_32_0, arg_32_1)
	local var_32_0 = LUI.UIButton.new()

	var_32_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 250 * _1080p)

	var_32_0.id = "SeasonalEventRewardTier"
	var_32_0._animationSets = var_32_0._animationSets or {}
	var_32_0._sequences = var_32_0._sequences or {}

	local var_32_1 = arg_32_1 and arg_32_1.controllerIndex

	if not var_32_1 and not Engine.DDJFBBJAIG() then
		var_32_1 = var_32_0:getRootController()
	end

	assert(var_32_1)

	local var_32_2 = var_32_0
	local var_32_3
	local var_32_4 = MenuBuilder.BuildRegisteredType("LootItemCardMiniDouble", {
		controllerIndex = var_32_1
	})

	var_32_4.id = "LootItemCardMiniDouble"

	var_32_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -246, _1080p * -60)
	var_32_0:addElement(var_32_4)

	var_32_0.LootItemCardMiniDouble = var_32_4

	local var_32_5
	local var_32_6 = LUI.UIText.new()

	var_32_6.id = "TogglePromptText"

	var_32_6:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_32_6:SetAlpha(0, 0)
	var_32_6:setText(Engine.CBBHFCGDIC("BATTLEPASS/TOGGLE_ITEM"), 0)
	var_32_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_32_6:SetAlignment(LUI.Alignment.Center)
	var_32_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -53, _1080p * 53, _1080p * -24, 0)
	var_32_0:addElement(var_32_6)

	var_32_0.TogglePromptText = var_32_6

	local var_32_7
	local var_32_8 = MenuBuilder.BuildRegisteredType("SeasonalEventRewardProgressBar", {
		controllerIndex = var_32_1
	})

	var_32_8.id = "BottomProgressBar"

	var_32_8.ProgressLine:SetRGBFromInt(7637402, 0)
	var_32_8.Fill:SetRGBFromTable(SWATCHES.EventPromos.HvVBlue, 0)
	var_32_8.Cap:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_32_8.Cap:SetAlpha(1, 0)
	var_32_8.Glint:SetAlpha(0, 0)
	var_32_8.Glint:SetColorOp(COLOR_OP.saturation, 0)
	var_32_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, _1080p * -22, _1080p * -32, _1080p * -26)
	var_32_0:addElement(var_32_8)

	var_32_0.BottomProgressBar = var_32_8

	local var_32_9
	local var_32_10 = MenuBuilder.BuildRegisteredType("SeasonalEventRewardProgressBar", {
		controllerIndex = var_32_1
	})

	var_32_10.id = "TopProgressBar"

	var_32_10.ProgressLine:SetRGBFromInt(9465713, 0)
	var_32_10.Fill:SetRGBFromTable(SWATCHES.EventPromos.HvVRed, 0)
	var_32_10.Cap:SetRGBFromInt(11976384, 0)
	var_32_10.Cap:SetAlpha(1, 0)
	var_32_10.Glint:SetAlpha(0, 0)
	var_32_10.Glint:SetColorOp(COLOR_OP.saturation, 0)
	var_32_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, _1080p * -22, _1080p * -40, _1080p * -34)
	var_32_0:addElement(var_32_10)

	var_32_0.TopProgressBar = var_32_10

	local var_32_11
	local var_32_12 = LUI.UIImage.new()

	var_32_12.id = "LevelFill"

	var_32_12:SetRGBFromTable(SWATCHES.BattlePass.Locked, 0)
	var_32_12:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -21, _1080p * -1, _1080p * -43, _1080p * -23)
	var_32_0:addElement(var_32_12)

	var_32_0.LevelFill = var_32_12

	local var_32_13
	local var_32_14 = LUI.UIImage.new()

	var_32_14.id = "LevelFillComplete"

	var_32_14:SetRGBFromTable(SWATCHES.EventPromos.HvVBlue, 0)
	var_32_14:SetAlpha(0, 0)
	var_32_14:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_32_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -17, _1080p * -1, _1080p * -43, _1080p * -23)
	var_32_0:addElement(var_32_14)

	var_32_0.LevelFillComplete = var_32_14

	local var_32_15
	local var_32_16 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_32_17 = LUI.UIBorder.new(var_32_16)

	var_32_17.id = "LevelBorder"

	var_32_17:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_32_17:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -22, 0, _1080p * -44, _1080p * -22)
	var_32_0:addElement(var_32_17)

	var_32_0.LevelBorder = var_32_17

	local var_32_18
	local var_32_19 = LUI.UIImage.new()

	var_32_19.id = "LevelFlare"

	var_32_19:SetAlpha(0, 0)
	var_32_19:setImage(RegisterMaterial("battlepass_progressbar_square"), 0)
	var_32_19:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_32_19:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -36, _1080p * 14, _1080p * -60, _1080p * -6)
	var_32_0:addElement(var_32_19)

	var_32_0.LevelFlare = var_32_19

	local var_32_20
	local var_32_21 = LUI.UIText.new()

	var_32_21.id = "LevelCost"

	var_32_21:setText("100 P", 0)
	var_32_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_32_21:SetWordWrap(false)
	var_32_21:SetAlignment(LUI.Alignment.Center)
	var_32_21:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -66, _1080p * 44, _1080p * -18, _1080p * -2)
	var_32_0:addElement(var_32_21)

	var_32_0.LevelCost = var_32_21

	local var_32_22
	local var_32_23 = LUI.UIText.new()

	var_32_23.id = "Level"

	var_32_23:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_32_23:setText("1", 0)
	var_32_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_32_23:SetWordWrap(false)
	var_32_23:SetTracking(-1 * _1080p, 0)
	var_32_23:SetAlignment(LUI.Alignment.Center)
	var_32_23:SetVerticalAlignment(LUI.Alignment.Center)
	var_32_23:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -21, _1080p * -1, _1080p * -42, _1080p * -24)
	var_32_0:addElement(var_32_23)

	var_32_0.Level = var_32_23

	local var_32_24
	local var_32_25 = MenuBuilder.BuildRegisteredType("LootItemCardFlare", {
		controllerIndex = var_32_1
	})

	var_32_25.id = "LootItemCardFlare"

	var_32_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -99, _1080p * 281, _1080p * -114, _1080p * 256)
	var_32_0:addElement(var_32_25)

	var_32_0.LootItemCardFlare = var_32_25

	local function var_32_26()
		return
	end

	var_32_0._sequences.DefaultSequence = var_32_26

	local var_32_27
	local var_32_28 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -85
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 85
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -285
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -60
		}
	}

	var_32_4:RegisterAnimationSequence("ButtonOver", var_32_28)

	local var_32_29 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -114
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 281
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -99
		}
	}

	var_32_25:RegisterAnimationSequence("ButtonOver", var_32_29)

	local function var_32_30()
		var_32_4:AnimateLoop("ButtonOver")
		var_32_25:AnimateLoop("ButtonOver")
	end

	var_32_0._sequences.ButtonOver = var_32_30

	local var_32_31
	local var_32_32 = {
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
			value = _1080p * -246
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -60
		}
	}

	var_32_4:RegisterAnimationSequence("ButtonUp", var_32_32)

	local var_32_33 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -115
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -97
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 265
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 273
		},
		{
			value = -0.18,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_32_25:RegisterAnimationSequence("ButtonUp", var_32_33)

	local function var_32_34()
		var_32_4:AnimateSequence("ButtonUp")
		var_32_25:AnimateSequence("ButtonUp")
	end

	var_32_0._sequences.ButtonUp = var_32_34

	local var_32_35
	local var_32_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Locked
		}
	}

	var_32_12:RegisterAnimationSequence("Incomplete", var_32_36)

	local function var_32_37()
		var_32_12:AnimateSequence("Incomplete")
	end

	var_32_0._sequences.Incomplete = var_32_37

	local function var_32_38()
		return
	end

	var_32_0._sequences.Complete = var_32_38

	local var_32_39
	local var_32_40 = {
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

	var_32_19:RegisterAnimationSequence("TierCompleteFlare", var_32_40)

	local function var_32_41()
		var_32_19:AnimateSequence("TierCompleteFlare")
	end

	var_32_0._sequences.TierCompleteFlare = var_32_41

	local var_32_42
	local var_32_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -285
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -60
		}
	}

	var_32_4:RegisterAnimationSequence("ButtonOverSnap", var_32_43)

	local var_32_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 281
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -99
		}
	}

	var_32_25:RegisterAnimationSequence("ButtonOverSnap", var_32_44)

	local function var_32_45()
		var_32_4:AnimateSequence("ButtonOverSnap")
		var_32_25:AnimateSequence("ButtonOverSnap")
	end

	var_32_0._sequences.ButtonOverSnap = var_32_45

	local var_32_46
	local var_32_47 = {
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
			value = _1080p * -246
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -60
		}
	}

	var_32_4:RegisterAnimationSequence("ButtonUpSnap", var_32_47)

	local var_32_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -97
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 273
		},
		{
			value = -0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_32_25:RegisterAnimationSequence("ButtonUpSnap", var_32_48)

	local function var_32_49()
		var_32_4:AnimateSequence("ButtonUpSnap")
		var_32_25:AnimateSequence("ButtonUpSnap")
	end

	var_32_0._sequences.ButtonUpSnap = var_32_49

	local var_32_50
	local var_32_51 = {
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
			value = _1080p * -246
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -60
		}
	}

	var_32_4:RegisterAnimationSequence("ToggleableButtonUp", var_32_51)

	local var_32_52 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -115
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -97
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 265
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 273
		},
		{
			value = -0.18,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_32_25:RegisterAnimationSequence("ToggleableButtonUp", var_32_52)

	local function var_32_53()
		var_32_4:AnimateSequence("ToggleableButtonUp")
		var_32_25:AnimateSequence("ToggleableButtonUp")
	end

	var_32_0._sequences.ToggleableButtonUp = var_32_53

	local var_32_54
	local var_32_55 = {
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
			value = _1080p * -246
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -60
		}
	}

	var_32_4:RegisterAnimationSequence("ToggleableButtonUpSnap", var_32_55)

	local var_32_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -97
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 273
		},
		{
			value = -0.18,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_32_25:RegisterAnimationSequence("ToggleableButtonUpSnap", var_32_56)

	local function var_32_57()
		var_32_4:AnimateSequence("ToggleableButtonUpSnap")
		var_32_25:AnimateSequence("ToggleableButtonUpSnap")
	end

	var_32_0._sequences.ToggleableButtonUpSnap = var_32_57

	local var_32_58
	local var_32_59 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -85
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 85
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -285
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -60
		}
	}

	var_32_4:RegisterAnimationSequence("ToggleableButtonOver", var_32_59)

	local var_32_60 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -114
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 281
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -99
		}
	}

	var_32_25:RegisterAnimationSequence("ToggleableButtonOver", var_32_60)

	local function var_32_61()
		var_32_4:AnimateSequence("ToggleableButtonOver")
		var_32_25:AnimateSequence("ToggleableButtonOver")
	end

	var_32_0._sequences.ToggleableButtonOver = var_32_61

	local var_32_62
	local var_32_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -285
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -60
		}
	}

	var_32_4:RegisterAnimationSequence("ToggleableButtonOverSnap", var_32_63)

	local var_32_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 281
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -99
		}
	}

	var_32_25:RegisterAnimationSequence("ToggleableButtonOverSnap", var_32_64)

	local function var_32_65()
		var_32_4:AnimateSequence("ToggleableButtonOverSnap")
		var_32_25:AnimateSequence("ToggleableButtonOverSnap")
	end

	var_32_0._sequences.ToggleableButtonOverSnap = var_32_65

	local var_32_66
	local var_32_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.HvVRed
		}
	}

	var_32_12:RegisterAnimationSequence("AllComplete", var_32_67)

	local var_32_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_32_14:RegisterAnimationSequence("AllComplete", var_32_68)

	local function var_32_69()
		var_32_12:AnimateSequence("AllComplete")
		var_32_14:AnimateSequence("AllComplete")
	end

	var_32_0._sequences.AllComplete = var_32_69

	var_0_28(var_32_0, var_32_1, arg_32_1)

	return var_32_0
end

MenuBuilder.registerType("SeasonalEventRewardTier", SeasonalEventRewardTier)
LockTable(_M)
