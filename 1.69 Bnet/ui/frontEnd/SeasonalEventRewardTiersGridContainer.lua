module(..., package.seeall)

local var_0_0 = {
	CYCLE = 300,
	END = 1600,
	FLARE = 800,
	END_DOUBLE = 2400,
	PROGRESS = 500
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 then
		local var_1_0 = {
			promptsData = {
				{
					button_ref = "button_primary",
					keyprompt_text = Engine.CBBHFCGDIC("KEY/MOUSE1"),
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
				}
			}
		}

		arg_1_1:AddTooltipData(arg_1_0, var_1_0)
	else
		arg_1_1:RemoveToolTipData()
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0 = #arg_2_0._rewardsData - 1

	for iter_2_0, iter_2_1 in ipairs(arg_2_0._rewardsData) do
		if iter_2_1 then
			local var_2_1 = tonumber(iter_2_1.level)

			if tonumber(iter_2_1.cost) > arg_2_0.maxPoints then
				var_2_0 = iter_2_0 - 1
				arg_2_0._currentLevel = var_2_1 - 1

				break
			end
		end
	end

	arg_2_0.Grid:SetFocusedPosition({
		y = 0,
		x = var_2_0
	}, true)
end

local function var_0_3(arg_3_0)
	if arg_3_0._isAnimating then
		return
	end

	local var_3_0 = 0
	local var_3_1 = 0

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.Grid:GetBuiltChildren()) do
		local var_3_2 = var_0_0.END

		if iter_3_1.isMultiItemTier and #iter_3_1.newUnlocks > 1 then
			var_3_2 = var_0_0.END_DOUBLE
		end

		if iter_3_1.newUnlocks and #iter_3_1.newUnlocks < #arg_3_0._totalPoints and (iter_3_0 == 1 and #iter_3_1.newUnlocks > 0 or var_3_0 > 0) then
			for iter_3_2, iter_3_3 in ipairs(arg_3_0._totalPoints) do
				local var_3_3 = iter_3_1:GetProgress(iter_3_2)

				if var_3_3 > 0 then
					iter_3_1:SetProgress(0, 0, iter_3_2)

					arg_3_0:Wait(iter_3_0 == 1 and 1 or var_3_1).onComplete = function()
						iter_3_1:EnableGlow(true, iter_3_2)
						iter_3_1:SetProgress(var_3_3, var_0_0.PROGRESS, iter_3_2)

						arg_3_0:Wait(var_0_0.FLARE).onComplete = function()
							iter_3_1:EnableGlow(false, iter_3_2)
						end
					end
				end
			end
		end

		if iter_3_1.newUnlocks and #iter_3_1.newUnlocks > 0 then
			if var_3_0 < 1 then
				arg_3_0.Grid:SetDirectionalInputEnabled(false)
				arg_3_0.Grid:SetMouseFocusBlocker(true)
				arg_3_0.Grid:SetHandleMouse(false)
			end

			arg_3_0:Wait(math.max(var_3_1, 1)).onComplete = function()
				arg_3_0.Grid:SetFocusedPosition({
					y = 0,
					x = iter_3_0 - 1
				}, true)

				arg_3_0._isAnimating = true

				iter_3_1:SetIsAnimating(true)

				local var_6_0 = var_0_0.FLARE

				for iter_6_0, iter_6_1 in ipairs(iter_3_1.newUnlocks) do
					iter_3_1:EnableGlow(true, iter_6_1)
					iter_3_1:SetProgress(1, var_0_0.PROGRESS, iter_6_1)

					arg_3_0:Wait(var_0_0.PROGRESS).onComplete = function()
						iter_3_1:EnableGlow(false, iter_6_1)
						ACTIONS.AnimateSequence(iter_3_1, "TierCompleteFlare")

						if iter_3_1.isMultiItemTier and arg_3_0._lootIndex ~= iter_6_1 then
							arg_3_0:Wait(#iter_3_1.newUnlocks > 1 and var_0_0.FLARE or 1).onComplete = function()
								arg_3_0:CycleLootCards({
									button = "down"
								}, true)

								arg_3_0:Wait(var_0_0.CYCLE).onComplete = function()
									iter_3_1:PlayRarityFlare(iter_3_1.lootData.rarity)
									iter_3_1:SetLocked(false, iter_6_1)
								end
							end
						elseif iter_6_0 == 1 then
							iter_3_1:PlayRarityFlare(iter_3_1.lootData.rarity)
							iter_3_1:SetLocked(false, iter_6_1)
						end
					end
					arg_3_0:Wait(var_3_2).onComplete = function()
						iter_3_1:MarkCompleteAnimSeen(iter_6_1)

						if iter_6_0 == #iter_3_1.newUnlocks then
							iter_3_1:SetIsAnimating(false)
						end
					end
				end
			end
			var_3_0 = var_3_0 + 1
			var_3_1 = var_3_1 + var_3_2
		end
	end

	if var_3_1 > 0 then
		arg_3_0:Wait(var_3_1).onComplete = function()
			arg_3_0._isAnimating = false

			arg_3_0.Grid:SetDirectionalInputEnabled(true)
			arg_3_0.Grid:SetMouseFocusBlocker(false)
			arg_3_0.Grid:SetHandleMouse(true)
		end
	else
		arg_3_0._isAnimating = false

		arg_3_0.Grid:SetDirectionalInputEnabled(true)
		arg_3_0.Grid:SetMouseFocusBlocker(false)
		arg_3_0.Grid:SetHandleMouse(true)
	end

	return var_3_0 > 0
end

local function var_0_4(arg_12_0, arg_12_1)
	assert(arg_12_1 and arg_12_1.rewardsData and arg_12_1.totalPoints)
	assert(type(arg_12_1.totalPoints) == "table" and #arg_12_1.totalPoints == 2)

	arg_12_0._rewardsData = arg_12_1.rewardsData
	arg_12_0.finalTierCost = arg_12_0._rewardsData[#arg_12_0._rewardsData].cost
	arg_12_0._totalPoints = arg_12_1.totalPoints
	arg_12_0.maxPoints = math.max(arg_12_1.totalPoints[1], arg_12_1.totalPoints[2])

	arg_12_0.Grid:SetNumChildren(#arg_12_0._rewardsData)
	arg_12_0.Grid:RefreshContent()

	if not var_0_3(arg_12_0) then
		var_0_2(arg_12_0, true)
	end
end

local function var_0_5(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0._currentChild and arg_13_0._currentChild.itemData or nil
	local var_13_1 = var_13_0 and #var_13_0.lootTable or 0

	if var_13_1 > 1 then
		if arg_13_1.button == "up" then
			if var_13_1 > arg_13_0._lootIndex then
				arg_13_0._lootIndex = arg_13_0._lootIndex + 1
			else
				arg_13_0._lootIndex = 1
			end
		elseif arg_13_1.button == "down" then
			if arg_13_0._lootIndex > 1 then
				arg_13_0._lootIndex = arg_13_0._lootIndex - 1
			else
				arg_13_0._lootIndex = var_13_1
			end
		end

		arg_13_0._currentChild:CycleLootCards(arg_13_0._lootIndex, nil, arg_13_2)
	end
end

local function var_0_6(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0._controllerIndex = arg_14_1
	arg_14_0.SetupData = var_0_4
	arg_14_0.CycleLootCards = var_0_5

	local function var_14_0(arg_15_0, arg_15_1, arg_15_2)
		local var_15_0 = arg_15_1 + 1

		if not arg_14_0._rewardsData or var_15_0 > #arg_14_0._rewardsData then
			return
		end

		local var_15_1 = arg_14_0._rewardsData[var_15_0]
		local var_15_2 = var_15_1 and var_15_1.level or 0

		arg_15_0:SetLevel(var_15_2)

		local var_15_3 = var_15_1 and var_15_1.lootTable[1]

		arg_15_0.isMultiItemTier = var_15_1 and #var_15_1.lootTable > 1 and var_15_3 and tonumber(var_15_3.tierGroup)

		if arg_15_0.isMultiItemTier and arg_15_0.LootItemCardMiniDouble.FlipFocusable then
			local var_15_4 = {
				promptsData = {
					{
						button_ref = "button_right_stick",
						keyprompt_text = Engine.CBBHFCGDIC("KEY/MOUSE1"),
						helper_text = Engine.CBBHFCGDIC("BATTLEPASS/FLIP")
					}
				}
			}

			arg_15_0.LootItemCardMiniDouble.FlipFocusable:AddTooltipData(arg_14_0._controllerIndex, var_15_4)
		end

		arg_15_0.itemData = var_15_1

		arg_15_0:SetupLootData(var_15_1)

		local var_15_5 = arg_15_0.lootData

		arg_15_0:SetIsAnimating(arg_14_0._isAnimating)

		local var_15_6 = var_15_1 and var_15_1.cost or 0

		arg_15_0:SetCost(var_15_6, {
			costString = "SEASONAL_EVENT_TU_WZ350/TIER_COST"
		})

		local var_15_7 = 0

		if var_15_0 > 1 then
			var_15_7 = arg_14_0._rewardsData[var_15_0 - 1].cost
		end

		arg_15_0.unlockIds = {}
		arg_15_0.newUnlocks = {}

		for iter_15_0, iter_15_1 in ipairs(arg_14_0._totalPoints) do
			table.insert(arg_15_0.unlockIds, #arg_14_0._totalPoints * arg_15_1 + iter_15_0)
			arg_15_0:EnableGlow(false, iter_15_0)

			local var_15_8 = 0

			if var_15_6 <= iter_15_1 then
				var_15_8 = 1
			elseif var_15_7 < iter_15_1 then
				local var_15_9 = var_15_6 - var_15_7

				var_15_8 = (iter_15_1 - var_15_7) / var_15_9
			end

			if var_15_8 < 1 then
				ACTIONS.AnimateSequence(arg_15_0, "HideCheckbox")
			end

			local var_15_10 = arg_15_0.isMultiItemTier and iter_15_0 or 1
			local var_15_11 = arg_15_0._ownedLoot[var_15_10] or var_15_8 >= 1
			local var_15_12 = SEASONAL_EVENT.GetSeenUnlockID(arg_14_0._controllerIndex, arg_15_0.unlockIds[iter_15_0])

			arg_15_0:SetOwned(var_15_11, var_15_10)

			if arg_15_0:GetProgress(iter_15_0) < 1 and var_15_8 >= 1 and (Dvar.IBEGCHEFE("test_ignore_rewards_unlock_seen") or not var_15_12) then
				table.insert(arg_15_0.newUnlocks, iter_15_0)
				arg_15_0:SetLocked(true, iter_15_0)
			else
				arg_15_0:SetProgress(var_15_8, 0, iter_15_0)
				arg_15_0:SetLocked(not arg_15_0.isMultiItemTier and #arg_15_0.newUnlocks > 0 or not var_15_11, iter_15_0)
			end

			arg_15_0._initialized = true
		end

		arg_15_0._column = arg_15_1

		arg_15_0:UpdateExpandedState()
		arg_15_0:SetDirectionalInputEnabled(not arg_14_0._isAnimating)

		if not arg_15_0._buttonHandlerAdded then
			arg_15_0._buttonHandlerAdded = true

			arg_15_0:addEventHandler("button_over", function(arg_16_0, arg_16_1)
				if arg_14_0._focusItem == nil or arg_14_0._focusItem ~= arg_16_0 then
					if arg_14_0._focusItem ~= nil then
						var_0_1(arg_14_1, arg_14_0._focusItem, false)
						arg_14_0._focusItem:processEvent({
							name = "lose_active"
						})
					end

					arg_14_0._focusItem = arg_16_0
					arg_14_0._currentChild = arg_15_0
					arg_14_0._lootIndex = 1
				end
			end)
			arg_15_0.LootItemCardMiniDouble.FlipFocusable:addEventHandler("button_action", function(arg_17_0, arg_17_1)
				if arg_15_0._backCardPulledUp then
					arg_14_0:CycleLootCards({
						button = "down"
					})
				end
			end)
			arg_15_0.LootItemCardMiniDouble:addEventHandler("button_action", function(arg_18_0, arg_18_1)
				arg_18_0 = arg_18_0:getParent()

				local var_18_0 = arg_18_1.controller == arg_14_0._controllerIndex

				if not arg_14_0._isAnimating and var_18_0 and LOOT.CanPreview(arg_18_0.lootData.type, arg_18_0.lootData.itemID) then
					STORE.PreviewItem(arg_14_0._controllerIndex, arg_18_0.lootData.type, arg_18_0.lootData.itemID)
				end

				return true
			end)
		end
	end

	arg_14_0.Grid:SetSnapOnWrapEnabled(true)
	arg_14_0.Grid:SetRefreshChild(var_14_0)
	arg_14_0.Grid:SetMeasureColumnFunction(LUI.ExpanderUtils.GenerateMeasureColumnFunction(150 * _1080p))
	arg_14_0:addEventHandler("gamepad_button", function(arg_19_0, arg_19_1)
		if arg_19_1.down and not arg_14_0._isAnimating and (arg_19_1.button == "up" or arg_19_1.button == "down") then
			var_0_5(arg_14_0, arg_19_1)
		end
	end)
end

function SeasonalEventRewardTiersGridContainer(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIElement.new()

	var_20_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 900 * _1080p, 0, 350 * _1080p)

	var_20_0.id = "SeasonalEventRewardTiersGridContainer"

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)

	local var_20_2 = var_20_0
	local var_20_3
	local var_20_4 = {
		scrollingThresholdX = 0,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 5,
		wrapY = false,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_20_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SeasonalEventRewardTier", {
				controllerIndex = var_20_1
			})
		end,
		refreshChild = function(arg_22_0, arg_22_1, arg_22_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 250,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_20_5 = LUI.UIGrid.new(var_20_4)

	var_20_5.id = "Grid"

	var_20_5:setUseStencil(false)
	var_20_5:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -450, _1080p * 450, _1080p * -272, _1080p * -34)
	var_20_0:addElement(var_20_5)

	var_20_0.Grid = var_20_5

	var_0_6(var_20_0, var_20_1, arg_20_1)

	return var_20_0
end

MenuBuilder.registerType("SeasonalEventRewardTiersGridContainer", SeasonalEventRewardTiersGridContainer)
LockTable(_M)
