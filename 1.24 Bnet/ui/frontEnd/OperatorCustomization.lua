module(..., package.seeall)

local var_0_0 = {
	[LOOT.itemTypes.OPERATOR_SKIN] = "LUA_MENU/SKIN_SELECTED",
	[LOOT.itemTypes.OPERATOR_EXECUTION] = "LUA_MENU/EXECUTION_SELECTED",
	[LOOT.itemTypes.OPERATOR_TAUNT] = "LUA_MENU/QUIP_SELECTED"
}
local var_0_1 = {
	[LOOT.itemTypes.OPERATOR_SKIN] = LUI.ToastManager.NotificationType.SkinEquipped,
	[LOOT.itemTypes.OPERATOR_EXECUTION] = LUI.ToastManager.NotificationType.ExecutionEquipped,
	[LOOT.itemTypes.OPERATOR_TAUNT] = LUI.ToastManager.NotificationType.TauntEquipped
}

local function var_0_2(arg_1_0)
	local var_1_0 = arg_1_0.OperatorlootGrid:GetFocusPositionIndex({
		relativePosition = false
	}) + 1

	return arg_1_0._lootData[var_1_0]
end

local function var_0_3(arg_2_0)
	return var_0_2(arg_2_0).isUnlocked
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = var_0_2(arg_3_0)

	return OPERATOR.GetEquippedItemForLootType(arg_3_1, arg_3_2, arg_3_0._currentLootType) ~= var_3_0.ref and var_3_0.isUnlocked
end

local function var_0_5(arg_4_0, arg_4_1)
	return PlayerData.BFFBGAJGD(arg_4_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[arg_4_0.currentState]:get() ~= arg_4_0.operatorRef
end

local function var_0_6(arg_5_0, arg_5_1)
	return var_0_2(arg_5_0).challengeData
end

local function var_0_7(arg_6_0)
	for iter_6_0 = 1, #arg_6_0._lootData do
		local var_6_0 = arg_6_0._lootData[iter_6_0]

		if var_6_0 and var_6_0.isUnlocked then
			return iter_6_0
		end
	end

	return -1
end

local function var_0_8(arg_7_0, arg_7_1)
	local var_7_0 = var_0_7(arg_7_0)

	if var_7_0 >= 0 and arg_7_0._lootData[var_7_0].ref ~= arg_7_1 then
		return true
	end

	return false
end

local function var_0_9(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5)
	local var_8_0 = var_0_4(arg_8_0, arg_8_3, arg_8_4)
	local var_8_1 = var_0_5(arg_8_0, arg_8_3)
	local var_8_2 = var_0_6(arg_8_0, arg_8_3)
	local var_8_3 = arg_8_0.HelperBar.ButtonHelperText

	arg_8_0.OperatorLootDetailsLayout.SelectPrompt:setText(Engine.CBBHFCGDIC(""))

	if var_8_0 or arg_8_5 then
		var_8_3:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})

		if var_8_1 and arg_8_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
			arg_8_0.OperatorLootDetailsLayout.SelectPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SELECT_SKIN_OPERATOR_PROMPT"))
		else
			arg_8_0.OperatorLootDetailsLayout.SelectPrompt:setText(Engine.CBBHFCGDIC(""))
		end
	else
		arg_8_0.OperatorLootDetailsLayout.SelectPrompt:setText("")

		if arg_8_2 and arg_8_2.isUnlocked then
			if var_0_8(arg_8_0, arg_8_2.ref) then
				var_8_3:PushButtonPrompt({
					side = "left",
					button_ref = "button_primary",
					priority = 1,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
				})

				return
			end
		elseif arg_8_2 and arg_8_2.challengeData then
			arg_8_0.OperatorLootDetailsLayout.SelectPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/VIEW_MISSION_DETAILS_PROMPT"))
		elseif var_8_0 and var_8_1 and arg_8_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
			arg_8_0.OperatorLootDetailsLayout.SelectPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SELECT_OPERATOR_PROMPT"))
		end

		var_8_3:PopButtonPrompt({
			button_ref = "button_primary"
		})
	end
end

local function var_0_10(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0.CustomizationTabs:GetTabAtIndex(arg_9_1)
	local var_9_1 = arg_9_0._tabLootType[arg_9_1]
	local var_9_2 = OPERATOR.GetNewLootsByOperatorAndType(arg_9_0._controllerIndex, arg_9_0.operatorRef, var_9_1)

	if var_9_0.NewItemSmallIcon then
		var_9_0.NewItemSmallIcon:UpdateAlpha(#var_9_2 > 0 and 1 or 0, 0, true)
	end
end

local function var_0_11(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	local var_10_0 = {}
	local var_10_1 = {}
	local var_10_2 = arg_10_0.OperatorlootGrid:GetFocusableIndicesFromPosition({
		x = arg_10_1,
		y = arg_10_2
	})

	for iter_10_0 = 1, #var_10_2 do
		local var_10_3 = var_10_2[iter_10_0]
		local var_10_4 = arg_10_0._lootData[var_10_3]

		if arg_10_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
			local var_10_5 = OPERATOR.GetOperatorSkin(arg_10_3, var_10_4.lootIndex, arg_10_4)

			if var_10_5.bodyModel and #var_10_5.bodyModel > 0 then
				table.insert(var_10_0, var_10_5.bodyModel)
			end

			if var_10_5.headModel and #var_10_5.headModel > 0 then
				table.insert(var_10_1, var_10_5.headModel)
			end
		elseif arg_10_0._currentLootType == LOOT.itemTypes.OPERATOR_EXECUTION then
			local var_10_6 = OPERATOR.GetExecutionPet(var_10_4.lootIndex)

			if var_10_6 and #var_10_6 > 0 then
				table.insert(var_10_0, OPERATOR.GetPetModel(var_10_6))
			end
		end
	end

	local var_10_7 = OPERATOR.GetEquippedItemForLootType(arg_10_3, arg_10_4, LOOT.itemTypes.OPERATOR_SKIN)
	local var_10_8 = OPERATOR.GetOperatorSkin(arg_10_3, var_10_7, arg_10_4)

	if var_10_8.bodyModel and #var_10_8.bodyModel > 0 then
		table.insert(var_10_0, var_10_8.bodyModel)
	end

	if var_10_8.headModel and #var_10_8.headModel > 0 then
		table.insert(var_10_1, var_10_8.headModel)
	end

	local var_10_9 = OPERATOR.GetPetForOperator(arg_10_3, arg_10_4)

	if var_10_9 and #var_10_9 > 0 then
		table.insert(var_10_0, OPERATOR.GetPetModel(var_10_9))
	end

	if #var_10_0 > 0 and #var_10_1 > 0 then
		FrontEndScene.RequestBodyModels(var_10_0)
		FrontEndScene.RequestHeadModels(var_10_1)
	end
end

local function var_0_12(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.OperatorLootDetailsLayout.OperatorLootDetails:SetAlpha(1)

	local var_11_0 = arg_11_0.OperatorlootGrid:GetFocusPositionIndex({
		relativePosition = false
	})

	if not var_11_0 then
		return
	end

	local var_11_1 = var_11_0 + 1
	local var_11_2 = arg_11_0._lootData[var_11_1]

	assert(var_11_2)

	if arg_11_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
		local var_11_3 = arg_11_0.OperatorlootGrid:GetPositionForIndex(var_11_1, {
			relativePosition = false
		})

		arg_11_0:RequestStreamingModels(var_11_3.x, var_11_3.y, arg_11_1, arg_11_0.operatorRef)

		local var_11_4 = OPERATOR.GetClientCharacterForSuperFaction(arg_11_0.currentState)
		local var_11_5 = OPERATOR.GetOperatorSkin(arg_11_1, var_11_2.lootIndex, arg_11_0.operatorRef)
		local var_11_6, var_11_7 = OPERATOR.GetWeaponDataFromLoadout(arg_11_1)
		local var_11_8 = OPERATOR.GetWeaponAccessoryModelFromLoadout(arg_11_1)
		local var_11_9 = OPERATOR.ValidateAccessoryModel(var_11_8, var_11_5.bodyModel)
		local var_11_10 = WEAPON.GetWeaponDetailsFromModel(var_11_7)

		if not OPERATOR.IsStowedWeaponAllowedInPreviewScreens(var_11_10.weaponAsset) then
			var_11_7 = WEAPON.NoneValue
		end

		FrontEndScene.RequestWeaponWorldModels({
			var_11_6,
			var_11_7,
			var_11_9
		})
		OPERATOR.UpdateClientCharacter(var_11_4, arg_11_1, var_11_5.bodyModel, var_11_5.headModel, nil, arg_11_0, var_11_6, var_11_7, true, var_11_9, true)

		if arg_11_0.currentState == OPERATOR.SuperFaction.WEST then
			ClientCharacter.DDHJHDEHFG(var_11_4, 0, 10, 0)
		end
	elseif arg_11_0._currentLootType == LOOT.itemTypes.OPERATOR_EXECUTION then
		local var_11_11 = arg_11_0.OperatorlootGrid:GetPositionForIndex(var_11_1, {
			relativePosition = false
		})

		arg_11_0:RequestStreamingModels(var_11_11.x, var_11_11.y, arg_11_1, arg_11_0.operatorRef)

		local var_11_12 = OPERATOR.GetPetCharacterForSuperFaction(arg_11_0.currentState)

		OPERATOR.UpdatePet(arg_11_1, var_11_12, {
			idle = true,
			execution = var_11_2.lootIndex,
			element = arg_11_0
		})
	end

	var_0_9(arg_11_0, var_11_1, var_11_2, arg_11_1, arg_11_0.operatorRef)
	arg_11_0.OperatorLootDetailsLayout.OperatorLootDetails:SetEquipped(arg_11_2.isSelected)
	arg_11_0.OperatorLootDetailsLayout.OperatorLootDetails:SetInfo(arg_11_1, arg_11_0._currentLootType, var_11_2)

	if var_11_2.challengeData and not var_11_2.isUnlocked then
		arg_11_0.OperatorLootDetailsLayout.OperatorChallenges:SetAlpha(1)

		if #arg_11_0._outfitMissionQuests > 0 then
			arg_11_0.OperatorLootDetailsLayout.OperatorChallenges:SetupMissionChallenge(var_11_2.challengeData, arg_11_0._outfitMissionQuests)
		else
			arg_11_0.OperatorLootDetailsLayout.OperatorChallenges:SetupChallenge(LOOT.itemTypes.OPERATOR_SKIN, var_11_2.challengeData, not var_11_2.isUnlocked)
			arg_11_0.OperatorLootDetailsLayout.BundleUpsellButton:SetupUpsellButton(arg_11_1, arg_11_0._currentLootType, var_11_2.ref)
		end
	else
		arg_11_0.OperatorLootDetailsLayout.OperatorChallenges:SetAlpha(0)
		arg_11_0.OperatorLootDetailsLayout.BundleUpsellButton:HideButton()
	end

	arg_11_0.OperatorLootDetailsLayout:UpdateDividerVisibility()

	arg_11_0._currentFocusedButton = arg_11_2
end

local function var_0_13(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_2 and arg_12_2.isNew then
		arg_12_2:ClearNew(arg_12_1)

		local var_12_0 = arg_12_0.CustomizationTabs:GetCurrentTabIndex() + 1

		var_0_10(arg_12_0, var_12_0)

		if arg_12_0._lastTabIndex ~= var_12_0 then
			var_0_10(arg_12_0, arg_12_0._lastTabIndex)
		end
	end
end

local function var_0_14(arg_13_0, arg_13_1)
	local var_13_0 = var_0_2(arg_13_0)

	assert(var_13_0)

	if not var_13_0.isUnlocked then
		return
	end

	local var_13_1 = OPERATOR.GetEquippedItemForLootType(arg_13_1, arg_13_0.operatorRef, arg_13_0._currentLootType) ~= var_13_0.ref
	local var_13_2 = not var_13_1 and var_0_8(arg_13_0, var_13_0.ref)

	if var_13_1 then
		OPERATOR.SetEquippedItemForLootType(arg_13_1, arg_13_0.operatorRef, arg_13_0._currentLootType, var_13_0.lootIndex)
		arg_13_0.OperatorLootDetailsLayout.OperatorLootDetails:SetEquipped(true)
		arg_13_0.OperatorLootDetailsLayout.OperatorLootDetails:UpdateDetails(arg_13_1, arg_13_0._currentLootType, var_13_0.ref)

		if arg_13_0._currentLootType == LOOT.itemTypes.OPERATOR_TAUNT and arg_13_0.OperatorLootDetailsLayout.OperatorLootDetails.PreviewQuip then
			arg_13_0.OperatorLootDetailsLayout.OperatorLootDetails:PreviewQuip()
		end
	elseif var_13_2 then
		local var_13_3 = var_0_7(arg_13_0)

		var_13_0 = arg_13_0._lootData[var_13_3]

		OPERATOR.SetEquippedItemForLootType(arg_13_1, arg_13_0.operatorRef, arg_13_0._currentLootType, var_13_0.lootIndex)
		arg_13_0.OperatorLootDetailsLayout.OperatorLootDetails:SetEquipped(false)
	end

	if var_13_1 or var_13_2 then
		local var_13_4 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC(var_0_0[arg_13_0._currentLootType]),
			description = Engine.CBBHFCGDIC(var_13_0.name),
			type = var_0_1[arg_13_0._currentLootType],
			controllerIndex = arg_13_1
		}

		arg_13_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_13_4
		})

		if arg_13_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
			Lobby.PreloadViewHandsForLocalPlayer(arg_13_1)
		end
	end

	var_0_9(arg_13_0, index, var_13_0, arg_13_1, arg_13_0.operatorRef, var_13_2)
	arg_13_0.OperatorlootGrid:RefreshContent()
end

local function var_0_15(arg_14_0, arg_14_1)
	local var_14_0 = PlayerData.BFFBGAJGD(arg_14_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	if var_14_0.operators[arg_14_0.currentState]:get() ~= arg_14_0.operatorRef then
		var_14_0.operators[arg_14_0.currentState]:set(arg_14_0.operatorRef)

		local var_14_1 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECTED"),
			description = Engine.CBBHFCGDIC(OPERATOR.GetName(arg_14_0.operatorRef)),
			type = LUI.ToastManager.NotificationType.OperatorEquipped,
			controllerIndex = arg_14_1
		}

		arg_14_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_14_1
		})
	end
end

local function var_0_16(arg_15_0, arg_15_1, arg_15_2)
	for iter_15_0 = 1, #arg_15_1 do
		if arg_15_1[iter_15_0].ref == arg_15_2 then
			return iter_15_0
		end
	end

	return 1
end

local function var_0_17(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_1:GetBuiltChildren()

	for iter_16_0, iter_16_1 in ipairs(var_16_0) do
		iter_16_1:SetHandleMouse(arg_16_2)
	end
end

local function var_0_18(arg_17_0, arg_17_1)
	local var_17_0 = PlayerData.BFFBGAJGD(arg_17_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	if arg_17_0.currentState == OPERATOR.SuperFaction.EAST then
		arg_17_0.operatorRef = arg_17_0.eastSelectedOperator or var_17_0.operators[arg_17_0.currentState]:get()
	else
		arg_17_0.operatorRef = arg_17_0.westSelectedOperator or var_17_0.operators[arg_17_0.currentState]:get()
	end
end

local function var_0_19(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	arg_18_2:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(arg_18_3.name)
	})

	local var_18_0 = {
		id = "equipLoot",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/SELECT_OPERATOR"),
		actionFunction = function()
			var_0_14(arg_18_0, arg_18_1)
			var_0_15(arg_18_0, arg_18_1)
			arg_18_0.OperatorLootDetailsLayout.SelectPrompt:setText("")
		end,
		conditionFunction = function()
			return var_0_5(arg_18_0, arg_18_1) and not var_0_4(arg_18_0, arg_18_1, arg_18_0.operatorRef)
		end
	}

	arg_18_2:AddContextualMenuAction(var_18_0)

	local var_18_1 = {
		id = "equipLoot",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/SELECT_SKIN_OPERATOR"),
		actionFunction = function()
			var_0_14(arg_18_0, arg_18_1)
			var_0_15(arg_18_0, arg_18_1)
			arg_18_0.OperatorLootDetailsLayout.SelectPrompt:setText("")
		end,
		conditionFunction = function()
			return var_0_5(arg_18_0, arg_18_1) and var_0_4(arg_18_0, arg_18_1, arg_18_0.operatorRef)
		end
	}

	arg_18_2:AddContextualMenuAction(var_18_1)
end

local function var_0_20(arg_23_0, arg_23_1)
	local var_23_0 = {
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		wrapX = false,
		adjustSizeToContent = true,
		buildArrowsLabel = true,
		scrollingThresholdY = 1,
		maxVisibleColumns = 1,
		maxVisibleRows = 12,
		wrapY = true,
		springCoefficient = 400,
		controllerIndex = arg_23_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("OperatorLootButton", {
				controllerIndex = arg_23_1
			})
		end,
		refreshChild = function(arg_25_0, arg_25_1, arg_25_2)
			if arg_23_0.OperatorlootGrid and arg_25_0 then
				local var_25_0 = arg_25_1 + arg_25_2 * arg_23_0.OperatorlootGrid:GetNumColumns()

				if var_25_0 == nil then
					return
				end

				local var_25_1 = var_25_0 + 1
				local var_25_2 = arg_23_0._lootData[var_25_1]

				arg_25_0._index = var_25_1

				arg_25_0:UpdateLootButtonDetails(var_25_2, arg_23_1, arg_23_0.operatorRef, arg_23_0._currentLootType)

				if arg_23_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
					arg_23_0:SetupOperatorButtonContextualMenu(arg_23_1, arg_25_0, var_25_2)
				elseif arg_25_0._contextualMenuData then
					arg_25_0._contextualMenuData = nil
				end
			end
		end,
		spacingX = _1080p * 6,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 460,
		rowHeight = _1080p * 48,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		primaryAxis = LUI.DIRECTION.horizontal
	}
	local var_23_1 = LUI.UIGrid.new(var_23_0)

	var_23_1.id = "operatorLootGrid"

	var_23_1:setUseStencil(true)
	var_23_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 216, _1080p * 943)
	var_23_1:SetAlpha(1)
	arg_23_0:addElement(var_23_1)

	local var_23_2 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_23_0.VerticalMinimalScrollbar,
		startCap = arg_23_0.VerticalMinimalScrollbar.startCap,
		endCap = arg_23_0.VerticalMinimalScrollbar.endCap,
		sliderArea = arg_23_0.VerticalMinimalScrollbar.sliderArea,
		slider = arg_23_0.VerticalMinimalScrollbar.sliderArea and arg_23_0.VerticalMinimalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_23_0.VerticalMinimalScrollbar.sliderArea and arg_23_0.VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	})

	var_23_1:AddScrollbar(var_23_2)

	local function var_23_3()
		local var_26_0 = OPERATOR.GetEquippedItemForLootType(arg_23_1, arg_23_0.operatorRef, arg_23_0._currentLootType)
		local var_26_1 = arg_23_0:GetEquippedLootItemIndex(arg_23_0._lootData, var_26_0) - 1

		return var_23_1:GetPositionForIndex(var_26_1, {
			relativePosition = false
		})
	end

	var_23_1:SetDefaultFocus(var_23_3)

	return var_23_1
end

local function var_0_21(arg_27_0, arg_27_1)
	if #arg_27_0._lootData <= 0 then
		arg_27_0.OperatorLootDetailsLayout.OperatorLootDetails:SetAlpha(0)

		return
	end

	table.sort(arg_27_0._lootData, function(arg_28_0, arg_28_1)
		if arg_28_0.isUnlocked ~= arg_28_1.isUnlocked then
			return arg_28_0.isUnlocked
		end

		if arg_28_0.rarity ~= arg_28_1.rarity then
			return arg_28_0.rarity < arg_28_1.rarity
		end

		if arg_28_0.uiPriority ~= arg_28_1.uiPriority then
			return tonumber(arg_28_0.uiPriority) < tonumber(arg_28_1.uiPriority)
		end

		local var_28_0 = Engine.CBBHFCGDIC(arg_28_0.name)
		local var_28_1 = Engine.CBBHFCGDIC(arg_28_1.name)

		if var_28_0 ~= var_28_1 then
			return var_28_0 < var_28_1
		end

		return false
	end)
	arg_27_0.OperatorlootGrid:processEvent({
		name = "lose_focus"
	})
	arg_27_0.OperatorlootGrid:SetNumChildren(#arg_27_0._lootData)
	arg_27_0.OperatorlootGrid:RefreshContent()
	arg_27_0.OperatorlootGrid:processEvent({
		name = "gain_focus"
	})

	local var_27_0 = 0

	for iter_27_0 = 1, #arg_27_0._lootData do
		if arg_27_0._lootData[iter_27_0].isUnlocked then
			var_27_0 = var_27_0 + 1
		end
	end

	arg_27_0.ItemsCollected:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y", var_27_0, #arg_27_0._lootData))
end

local function var_0_22(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0:UpdateSuperfactionDisplay(arg_29_1)

	if not arg_29_2 then
		return
	end

	local var_29_0 = {}

	if arg_29_2.showSkins then
		local var_29_1 = OPERATOR.GetSkinsForOperator(arg_29_0.operatorRef, arg_29_1, true, true)

		var_29_0[#var_29_0 + 1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SKINS")),
			lootType = LOOT.itemTypes.OPERATOR_SKIN,
			lootData = var_29_1
		}
	end

	if arg_29_2.showTaunts then
		local var_29_2 = OPERATOR.GetTauntsForOperator(arg_29_0, arg_29_0.operatorRef, arg_29_1)

		var_29_0[#var_29_0 + 1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/QUIPS")),
			lootType = LOOT.itemTypes.OPERATOR_TAUNT,
			lootData = var_29_2
		}
	end

	if arg_29_2.showExecutions then
		local var_29_3 = OPERATOR.GetExecutionsForOperator(arg_29_0, arg_29_0.operatorRef, arg_29_1)

		var_29_0[#var_29_0 + 1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/EXECUTIONS")),
			lootType = LOOT.itemTypes.OPERATOR_EXECUTION,
			lootData = var_29_3
		}
	end

	if #var_29_0 <= 1 then
		arg_29_0.CustomizationTabs:SetAlpha(0)
	end

	arg_29_0._tabLootType = {}

	local var_29_4 = {}
	local var_29_5 = true

	for iter_29_0, iter_29_1 in ipairs(var_29_0) do
		local var_29_6 = #iter_29_1.lootData <= 0
		local var_29_7 = var_29_5 and not var_29_6

		var_29_5 = var_29_5 and not var_29_7

		table.insert(var_29_4, {
			name = iter_29_1.name,
			disabled = var_29_6,
			hasDefaultFocus = var_29_7,
			focusFunction = function(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
				arg_29_0._currentLootType = iter_29_1.lootType
				arg_29_0._lootData = iter_29_1.lootData
				arg_29_0._lastTabIndex = arg_29_0._currentTabIndex
				arg_29_0._currentTabIndex = arg_30_2 + 1

				if not arg_29_0._lastTabIndex then
					arg_29_0._lastTabIndex = arg_29_0._currentTabIndex
				end

				var_0_13(arg_29_0, arg_30_1, arg_29_0._currentFocusedButton)
				arg_29_0:UpdateGrid(arg_30_1)
			end
		})

		arg_29_0._tabLootType[iter_29_0] = iter_29_1.lootType
	end

	arg_29_0.CustomizationTabs:SetTabs(var_29_4)

	for iter_29_2 = 1, #var_29_4 do
		var_0_10(arg_29_0, iter_29_2)
	end
end

local function var_0_23(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.UpdateGrid = var_0_21
	arg_31_0.RequestStreamingModels = var_0_11
	arg_31_0.GetEquippedLootItemIndex = var_0_16
	arg_31_0.UpdateSuperfactionDisplay = var_0_18
	arg_31_0.GridSetHandleMouse = var_0_17
	arg_31_0.SetupOperatorButtonContextualMenu = var_0_19
	arg_31_0._controllerIndex = arg_31_1
	arg_31_0.animationTime = 400
	arg_31_0.currentState = arg_31_2.operatorData.currentState
	arg_31_0.isCustomizationMenu = true
	arg_31_0._outfitMissionQuests = arg_31_2.operatorData.operatorInfo.outfitMissionQuests or {}

	arg_31_0.OperatorLootDetailsLayout.OperatorChallenges:SetAlpha(0)
	arg_31_0.OperatorLootDetailsLayout.OperatorLootDetails:SetAlpha(0)
	arg_31_0.OperatorLootDetailsLayout.OperatorLootDetails:InitializeDimensions(arg_31_0.OperatorLootDetailsLayout.OperatorLootDetails:GetCurrentAnchorsAndPositions())
	arg_31_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CUSTOMIZE_OPERATOR_CAPS"))

	local function var_31_0(arg_32_0)
		local var_32_0 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_32_0, CSV.operators.cols.gender)
		local var_32_1 = StringTable.DIFCHIGDFB(CSV.operatorTurnAnimations.file, CSV.operatorTurnAnimations.cols.gender, var_32_0, CSV.operatorTurnAnimations.cols.idleFront)

		assert(var_32_1 and var_32_1 ~= "")

		local var_32_2 = OPERATOR.GetClientCharacterForSuperFaction(arg_31_0.currentState)
		local var_32_3 = ClientCharacter.DCECEDGHEG(var_32_2)
		local var_32_4, var_32_5, var_32_6 = OPERATOR.GetTransitionInfoFromAnimation(var_32_3)

		ClientCharacter.BHJJGDDGFI(var_32_2, var_32_1, var_32_6, var_32_4, var_32_5)
		arg_31_0.CharacterRotator:SetClientCharacterInfo(var_32_2, arg_32_0)
	end

	local var_31_1 = Engine.DCJHCAFIIA()
	local var_31_2

	if arg_31_0.currentState == OPERATOR.SuperFaction.WEST then
		arg_31_0.westSelectedOperator = arg_31_2.operatorData.westSelectedOperator

		var_31_0(arg_31_0.westSelectedOperator)
		Engine.DHFCHIIJCA("character_faction_select_l_detail")

		var_31_2 = OPERATOR.GetCosmeticConfigString(arg_31_0.westSelectedOperator, arg_31_1)
	else
		arg_31_0.eastSelectedOperator = arg_31_2.operatorData.eastSelectedOperator

		var_31_0(arg_31_0.eastSelectedOperator)
		Engine.DHFCHIIJCA("character_faction_select_r_detail")

		var_31_2 = OPERATOR.GetCosmeticConfigString(arg_31_0.eastSelectedOperator, arg_31_1)
	end

	arg_31_0._currentLootType = LOOT.itemTypes.OPERATOR_SKIN
	arg_31_0.OperatorlootGrid = var_0_20(arg_31_0, arg_31_1)

	var_0_22(arg_31_0, arg_31_1, arg_31_2.menuOptions)

	function arg_31_0.addButtonHelperFunction(arg_33_0, arg_33_1)
		arg_33_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 0,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_33_0:AddButtonHelperText({
			side = "left",
			priority = 1,
			gamepad_only = true,
			button_ref = "button_right_stick",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/ROTATE")
		})
	end

	arg_31_0:addEventHandler("menu_create", arg_31_0.addButtonHelperFunction)

	local var_31_3 = LUI.UIBindButton.new()

	var_31_3.id = "bindButton"

	arg_31_0:addElement(var_31_3)

	arg_31_0.bindButton = var_31_3

	local function var_31_4(arg_34_0, arg_34_1)
		Engine.DAGFFDGFII("uploadstats", arg_31_1)

		local var_34_0

		if arg_31_0.currentState == OPERATOR.SuperFaction.WEST then
			var_34_0 = OPERATOR.GetCosmeticConfigString(arg_31_0.westSelectedOperator, arg_31_1)
		else
			var_34_0 = OPERATOR.GetCosmeticConfigString(arg_31_0.eastSelectedOperator, arg_31_1)
		end

		METRICS.OperatorUsageSendDLogEvent(arg_31_0, arg_31_1, var_31_1, var_31_2, var_34_0)
		LAYOUT.FadeInAspectRatioFadeFrame(arg_31_0, 300)

		if arg_31_0.currentState == OPERATOR.SuperFaction.WEST then
			arg_31_2.operatorData.westSelectedOperator = arg_31_0.operatorRef
		else
			arg_31_2.operatorData.eastSelectedOperator = arg_31_0.operatorRef
		end

		arg_31_2.operatorData.currentState = arg_31_0.currentState

		Engine.EBCGADABJ()
		ACTIONS.LeaveMenu(arg_31_0)
	end

	arg_31_0.bindButton:addEventHandler("button_secondary", var_31_4)

	local function var_31_5(arg_35_0, arg_35_1)
		local var_35_0 = arg_31_0.currentState == OPERATOR.SuperFaction.WEST and arg_31_0.westSelectedOperator or arg_31_0.eastSelectedOperator
		local var_35_1 = var_0_3(arg_31_0)
		local var_35_2 = var_0_5(arg_31_0, arg_31_1)
		local var_35_3 = var_0_6(arg_31_0, arg_31_1)
		local var_35_4 = var_0_4(arg_31_0, arg_31_1, var_35_0)

		if not var_35_1 and var_35_3 then
			LUI.FlowManager.RequestAddMenu("OperatorMissions", true, arg_31_0._controllerIndex, false, {
				challengeID = var_35_3.id,
				skinLootId = var_35_3.loot,
				outfitMissionQuests = arg_31_0._outfitMissionQuests
			})
		elseif var_35_4 and var_35_2 and arg_31_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
			var_0_14(arg_31_0, arg_31_1)
			var_0_15(arg_31_0, arg_31_1)
			arg_31_0.OperatorLootDetailsLayout.SelectPrompt:setText("")
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end

	arg_31_0.bindButton:addEventHandler("button_alt1", var_31_5)
	LAYOUT.AddAspectRatioFadeFrame(arg_31_0, arg_31_1)
	LAYOUT.FadeOutAspectRatioFadeFrame(arg_31_0, 500, 1.15)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_31_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_31_0.Vignette)

	local function var_31_6(arg_36_0, arg_36_1)
		local var_36_0 = CoD.GetAspectRatioScaleAdjust(0.45)

		arg_36_0.Darkener:SetScale(var_36_0)
	end

	arg_31_0:addAndCallEventHandler("onVideoChange", var_31_6)
	arg_31_0:registerEventHandler("operator_loot_button_up", function(arg_37_0, arg_37_1)
		var_0_13(arg_37_0, arg_31_1, arg_37_1.child)

		return true
	end)
	arg_31_0:registerEventHandler("operator_loot_button_focused", function(arg_38_0, arg_38_1)
		var_0_12(arg_38_0, arg_31_1, arg_38_1.child)

		return true
	end)
	arg_31_0:registerEventHandler("operator_loot_button_action", function(arg_39_0, arg_39_1)
		var_0_14(arg_39_0, arg_31_1)

		return true
	end)

	if arg_31_0.OperatorLootDetailsLayout.BundleUpsellButton then
		arg_31_0.OperatorLootDetailsLayout.BundleUpsellButton:SetUpsellMenu("OperatorCustomization")
	end
end

function OperatorCustomization(arg_40_0, arg_40_1)
	local var_40_0 = LUI.UIElement.new()

	var_40_0.id = "OperatorCustomization"

	local var_40_1 = arg_40_1 and arg_40_1.controllerIndex

	if not var_40_1 and not Engine.DDJFBBJAIG() then
		var_40_1 = var_40_0:getRootController()
	end

	assert(var_40_1)

	local var_40_2 = var_40_0
	local var_40_3
	local var_40_4 = LUI.UIImage.new()

	var_40_4.id = "Vignette"

	var_40_4:setImage(RegisterMaterial("menu_vignette"), 0)
	var_40_4:SetBlendMode(BLEND_MODE.multiply)
	var_40_4:Setup9SliceImage(_1080p * 382, _1080p * 353, 0.21, 0.3)
	var_40_0:addElement(var_40_4)

	var_40_0.Vignette = var_40_4

	local var_40_5
	local var_40_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_40_1
	})

	var_40_6.id = "TabBacker"

	var_40_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_40_0:addElement(var_40_6)

	var_40_0.TabBacker = var_40_6

	local var_40_7
	local var_40_8 = LUI.UIImage.new()

	var_40_8.id = "Darkener"

	var_40_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_40_8:SetAlpha(0.4, 0)
	var_40_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_40_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 727, 0, 0)
	var_40_0:addElement(var_40_8)

	var_40_0.Darkener = var_40_8

	local var_40_9
	local var_40_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_40_1
	})

	var_40_10.id = "MenuTitle"

	var_40_10.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOMIZE_OPERATOR_CAPS"), 0)
	var_40_10.Line:SetLeft(0, 0)
	var_40_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_40_0:addElement(var_40_10)

	var_40_0.MenuTitle = var_40_10

	local var_40_11
	local var_40_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_40_1
	})

	var_40_12.id = "HelperBar"

	var_40_12.Background:SetAlpha(0.2, 0)
	var_40_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_40_0:addElement(var_40_12)

	var_40_0.HelperBar = var_40_12

	local var_40_13
	local var_40_14 = MenuBuilder.BuildRegisteredType("CharacterRotator", {
		controllerIndex = var_40_1
	})

	var_40_14.id = "CharacterRotator"

	var_40_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -440, _1080p * 500, _1080p * -540, _1080p * 540)
	var_40_0:addElement(var_40_14)

	var_40_0.CharacterRotator = var_40_14

	local var_40_15
	local var_40_16 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_40_1
			})
		end,
		controllerIndex = var_40_1
	}
	local var_40_17 = LUI.TabManager.new(var_40_16)

	var_40_17.id = "CustomizationTabs"

	var_40_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 997, _1080p * 108, _1080p * 160)
	var_40_0:addElement(var_40_17)

	var_40_0.CustomizationTabs = var_40_17

	local var_40_18
	local var_40_19 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_40_1
	})

	var_40_19.id = "LobbyMembersFooter"

	var_40_19:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_40_0:addElement(var_40_19)

	var_40_0.LobbyMembersFooter = var_40_19

	local var_40_20
	local var_40_21 = LUI.UIImage.new()

	var_40_21.id = "GridDivider"

	var_40_21:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_40_21:SetAlpha(0.6, 0)
	var_40_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 207, _1080p * 208)
	var_40_0:addElement(var_40_21)

	var_40_0.GridDivider = var_40_21

	local var_40_22
	local var_40_23 = LUI.UIStyledText.new()

	var_40_23.id = "ItemsCollected"

	var_40_23:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_40_23:SetAlpha(0, 0)
	var_40_23:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y"), 0)
	var_40_23:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_40_23:SetWordWrap(false)
	var_40_23:SetAlignment(LUI.Alignment.Left)
	var_40_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 315, _1080p * 178, _1080p * 200)
	var_40_0:addElement(var_40_23)

	var_40_0.ItemsCollected = var_40_23

	local var_40_24
	local var_40_25 = MenuBuilder.BuildRegisteredType("OperatorLootDetailsLayout", {
		controllerIndex = var_40_1
	})

	var_40_25.id = "OperatorLootDetailsLayout"

	var_40_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1140, _1080p * 216, _1080p * 351)
	var_40_0:addElement(var_40_25)

	var_40_0.OperatorLootDetailsLayout = var_40_25

	local var_40_26
	local var_40_27 = MenuBuilder.BuildRegisteredType("BattlePassSeasonResetStatus", {
		controllerIndex = var_40_1
	})

	var_40_27.id = "BattlePassSeasonResetStatus"

	var_40_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1449, _1080p * 1824, _1080p * 52, _1080p * 132)
	var_40_0:addElement(var_40_27)

	var_40_0.BattlePassSeasonResetStatus = var_40_27

	local var_40_28
	local var_40_29 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_40_1
	})

	var_40_29.id = "VerticalMinimalScrollbar"

	var_40_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 593, _1080p * 604, _1080p * 216, _1080p * 879)
	var_40_0:addElement(var_40_29)

	var_40_0.VerticalMinimalScrollbar = var_40_29

	var_0_23(var_40_0, var_40_1, arg_40_1)

	return var_40_0
end

MenuBuilder.registerType("OperatorCustomization", OperatorCustomization)
LockTable(_M)
