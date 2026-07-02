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
	})

	if var_1_0 == nil then
		var_1_0 = 1

		DebugPrint("GetFocusPositionIndex on OperatorLootGrid in OperatorCustomization.lua has returned nil. This indicates we have some bad or missing data in the operator related data files.")
	else
		var_1_0 = var_1_0 + 1
	end

	return arg_1_0._lootData[var_1_0]
end

local function var_0_3(arg_2_0)
	return var_0_2(arg_2_0).isUnlocked
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = var_0_2(arg_3_0)
	local var_3_1 = OPERATOR.GetEquippedItemForLootType(arg_3_1, arg_3_2, arg_3_0._currentLootType)

	if arg_3_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
		local var_3_2 = {
			operatorRef = arg_3_2
		}

		if RANDOM.IsEnabled(arg_3_0._controllerIndex, arg_3_0._currentLootType, var_3_2) then
			if var_3_0.isRandom then
				return false
			else
				return true
			end
		end
	end

	return var_3_1 ~= var_3_0.ref and var_3_0.isUnlocked
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

		if var_6_0 and var_6_0.isUnlocked and not var_6_0.isRandom then
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

local function var_0_9(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1 and arg_8_1.cannotEquip

	arg_8_0:AddButtonHelperText({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_8_0:AddButtonHelperText({
		side = "left",
		button_ref = "button_alt2",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
	})
	arg_8_0:AddButtonHelperText({
		side = "left",
		priority = 2,
		gamepad_only = true,
		button_ref = "button_right_stick",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/ROTATE")
	})

	if arg_8_0._currentLootType == LOOT.itemTypes.OPERATOR_EXECUTION or var_8_0 then
		arg_8_0:RemoveButtonHelperText("button_alt2", "left")
	end
end

local function var_0_10(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_1 and arg_9_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
		local var_9_0 = LUI.IsLastInputGamepad(arg_9_2) and "LUA_MENU/SELECT_SKIN_OPERATOR_PROMPT" or "LUA_MENU/SELECT_SKIN_OPERATOR_PROMPT_KBM"

		arg_9_0.OperatorLootDetailsLayout.SelectPrompt:setText(Engine.CBBHFCGDIC(var_9_0))
		arg_9_0.OperatorLootDetailsLayout.SelectPrompt:SetAlpha(1)
	end
end

local function var_0_11(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
	local var_10_0 = var_0_4(arg_10_0, arg_10_3, arg_10_4)
	local var_10_1 = var_0_5(arg_10_0, arg_10_3)
	local var_10_2 = var_0_6(arg_10_0, arg_10_3)
	local var_10_3 = arg_10_0.HelperBar.ButtonHelperText

	arg_10_0.OperatorLootDetailsLayout.SelectPrompt:SetAlpha(0)
	arg_10_0.OperatorLootDetailsLayout.PreviewPrompt:SetAlpha(0)

	if arg_10_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
		arg_10_0.OperatorLootDetailsLayout.PreviewPrompt:SetAlpha(1)
	end

	var_0_9(arg_10_0, {
		cannotEquip = arg_10_2.isRandom
	})

	if var_10_0 or arg_10_5 then
		var_10_3:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
		var_0_10(arg_10_0, var_10_1, arg_10_3)
		arg_10_0:registerEventHandler("update_input_type", function(arg_11_0, arg_11_1)
			var_0_10(arg_11_0, var_0_5(arg_11_0, arg_11_1.controllerIndex), arg_11_1.controllerIndex)
		end)
	else
		arg_10_0.OperatorLootDetailsLayout.SelectPrompt:setText("")

		if arg_10_2 and arg_10_2.isUnlocked then
			if var_0_8(arg_10_0, arg_10_2.ref) then
				var_10_3:PushButtonPrompt({
					side = "left",
					button_ref = "button_primary",
					priority = 1,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
				})

				return
			end
		elseif arg_10_2 and arg_10_2.challengeData then
			arg_10_0.OperatorLootDetailsLayout.SelectPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/VIEW_MISSION_DETAILS_PROMPT"))
			arg_10_0.OperatorLootDetailsLayout.SelectPrompt:SetAlpha(1)
		elseif var_10_0 and var_10_1 and arg_10_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
			arg_10_0.OperatorLootDetailsLayout.SelectPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SELECT_OPERATOR_PROMPT"))
			arg_10_0.OperatorLootDetailsLayout.SelectPrompt:SetAlpha(1)
		end

		var_10_3:PopButtonPrompt({
			button_ref = "button_primary"
		})
	end
end

local function var_0_12(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.CustomizationTabs:GetTabAtIndex(arg_12_1)
	local var_12_1 = arg_12_0._tabLootType[arg_12_1]
	local var_12_2 = OPERATOR.GetNewLootsByOperatorAndType(arg_12_0._controllerIndex, arg_12_0.operatorRef, var_12_1)

	if var_12_0.NewItemSmallIcon then
		var_12_0.NewItemSmallIcon:UpdateAlpha(#var_12_2 > 0 and 1 or 0, 0, true)
	end
end

local function var_0_13(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	local var_13_0 = {}
	local var_13_1 = {}
	local var_13_2 = arg_13_0.OperatorlootGrid:GetFocusableIndicesFromPosition({
		x = arg_13_1,
		y = arg_13_2
	})

	for iter_13_0 = 1, #var_13_2 do
		local var_13_3 = var_13_2[iter_13_0]
		local var_13_4 = arg_13_0._lootData[var_13_3]

		if arg_13_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
			local var_13_5 = OPERATOR.GetOperatorSkin(arg_13_3, var_13_4.lootIndex, arg_13_4)

			if var_13_5.bodyModel and #var_13_5.bodyModel > 0 then
				table.insert(var_13_0, var_13_5.bodyModel)
			end

			if var_13_5.headModel and #var_13_5.headModel > 0 then
				table.insert(var_13_1, var_13_5.headModel)
			end
		elseif arg_13_0._currentLootType == LOOT.itemTypes.OPERATOR_EXECUTION and not var_13_4.isRandom then
			local var_13_6 = OPERATOR.GetExecutionPet(var_13_4.lootIndex)

			if var_13_6 and #var_13_6 > 0 then
				table.insert(var_13_0, OPERATOR.GetPetModel(var_13_6))
			end
		end
	end

	local var_13_7 = OPERATOR.GetEquippedItemForLootType(arg_13_3, arg_13_4, LOOT.itemTypes.OPERATOR_SKIN)
	local var_13_8 = OPERATOR.GetOperatorSkin(arg_13_3, var_13_7, arg_13_4)

	if var_13_8.bodyModel and #var_13_8.bodyModel > 0 then
		table.insert(var_13_0, var_13_8.bodyModel)
	end

	if var_13_8.headModel and #var_13_8.headModel > 0 then
		table.insert(var_13_1, var_13_8.headModel)
	end

	local var_13_9 = OPERATOR.GetPetForOperator(arg_13_3, arg_13_4)

	if var_13_9 and #var_13_9 > 0 then
		table.insert(var_13_0, OPERATOR.GetPetModel(var_13_9))
	end

	if #var_13_0 > 0 and #var_13_1 > 0 then
		FrontEndScene.RequestBodyModels(var_13_0)
		FrontEndScene.RequestHeadModels(var_13_1)
	end
end

local function var_0_14(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.OperatorlootGrid:GetFocusPositionIndex({
		relativePosition = false
	})

	if not var_14_0 then
		return
	end

	local var_14_1 = var_14_0 + 1
	local var_14_2 = arg_14_0._lootData[var_14_1]

	assert(var_14_2)

	if arg_14_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
		local var_14_3 = arg_14_0.OperatorlootGrid:GetPositionForIndex(var_14_1, {
			relativePosition = false
		})

		arg_14_0:RequestStreamingModels(var_14_3.x, var_14_3.y, arg_14_1, arg_14_0.operatorRef)

		local var_14_4 = OPERATOR.GetClientCharacterForSuperFaction(arg_14_0.currentState)
		local var_14_5 = OPERATOR.GetOperatorSkin(arg_14_1, var_14_2.lootIndex, arg_14_0.operatorRef)
		local var_14_6 = OPERATOR.GetOperatorSkinRef(var_14_5.bodyModel, var_14_5.headModel)

		arg_14_0.CharacterRotator:SetClientCharacterSkinRef(var_14_6)

		local var_14_7 = arg_14_0.CharacterRotator:GetClientCharacterTurnIdleAnim()
		local var_14_8 = var_14_7 ~= arg_14_0.idleAnimation

		arg_14_0.idleAnimation = var_14_7

		local var_14_9, var_14_10 = OPERATOR.GetWeaponDataFromLoadout(arg_14_1)
		local var_14_11 = OPERATOR.GetWeaponAccessoryModelFromLoadout(arg_14_1)
		local var_14_12 = OPERATOR.ValidateAccessoryModel(var_14_11, var_14_5.bodyModel)
		local var_14_13 = WEAPON.GetWeaponDetailsFromModel(var_14_10)

		if not OPERATOR.IsStowedWeaponAllowedInPreviewScreens(var_14_13.weaponAsset) then
			var_14_10 = WEAPON.NoneValue
		end

		FrontEndScene.RequestWeaponWorldModels({
			var_14_9,
			var_14_10,
			var_14_12
		})

		local var_14_14 = {
			showCharacter = true,
			defaultAnim = false,
			element = arg_14_0,
			weaponModel = var_14_9,
			secondaryModel = var_14_10,
			accessoryModel = var_14_12,
			operatorPose = var_14_8 and var_14_7 or nil
		}

		arg_14_0._skinUpdateOptions = var_14_14

		OPERATOR.UpdateClientCharacter(var_14_4, var_14_5.bodyModel, var_14_5.headModel, var_14_14)

		if arg_14_0.currentState == OPERATOR.SuperFaction.WEST then
			ClientCharacter.DDHJHDEHFG(var_14_4, 0, 10, 0)
		end

		var_14_2.skinInfo = var_14_5
	end

	return var_14_2, var_14_1
end

local function var_0_15(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.OperatorLootDetailsLayout.OperatorLootDetails:SetAlpha(1)

	local var_15_0, var_15_1 = var_0_14(arg_15_0, arg_15_1)

	if not var_15_0 or not var_15_1 then
		return
	end

	arg_15_0._preview_skin = false
	arg_15_0._preview_quip = false

	arg_15_0.OperatorLootDetailsLayout.OperatorLootDetails:SetAlpha(1)

	if arg_15_0._currentLootType == LOOT.itemTypes.OPERATOR_EXECUTION then
		local var_15_2 = arg_15_0.OperatorlootGrid:GetPositionForIndex(var_15_1, {
			relativePosition = false
		})

		arg_15_0:RequestStreamingModels(var_15_2.x, var_15_2.y, arg_15_1, arg_15_0.operatorRef)

		local var_15_3 = OPERATOR.GetPetCharacterForSuperFaction(arg_15_0.currentState)

		OPERATOR.UpdatePet(arg_15_1, var_15_3, {
			idle = true,
			execution = var_15_0.lootIndex,
			element = arg_15_0,
			hideAnim = arg_15_0._petHideAnim
		})
	elseif not var_15_0.isRandom and arg_15_0._currentLootType == LOOT.itemTypes.OPERATOR_TAUNT and arg_15_0._menuOptions.showTaunts then
		arg_15_0._preview_quip = true
	elseif not var_15_0.isRandom and arg_15_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN and arg_15_0._menuOptions.showSkins then
		arg_15_0._preview_skin = true
	end

	if not var_15_0.isRandom then
		local var_15_4 = OPERATOR.GetExecutionPet(var_15_0.lootIndex)

		if var_15_4 and #var_15_4 > 0 then
			arg_15_0._petHideAnim = OPERATOR.GetPetHideAnim(var_15_4)
		end
	end

	var_0_11(arg_15_0, var_15_1, var_15_0, arg_15_1, arg_15_0.operatorRef)
	arg_15_0.OperatorLootDetailsLayout.OperatorLootDetails:SetEquipped(arg_15_2.isSelected)
	arg_15_0.OperatorLootDetailsLayout.OperatorLootDetails:SetInfo(arg_15_1, arg_15_0._currentLootType, var_15_0)

	if var_15_0.challengeData and not var_15_0.isUnlocked then
		arg_15_0.OperatorLootDetailsLayout.OperatorChallenges:SetAlpha(1)

		if #arg_15_0._outfitMissionQuests > 0 then
			arg_15_0.OperatorLootDetailsLayout.OperatorChallenges:SetupMissionChallenge(var_15_0.challengeData, arg_15_0._outfitMissionQuests)
		else
			arg_15_0.OperatorLootDetailsLayout.OperatorChallenges:SetupChallenge(LOOT.itemTypes.OPERATOR_SKIN, var_15_0.challengeData, not var_15_0.isUnlocked)
			arg_15_0.OperatorLootDetailsLayout.BundleUpsellButton:SetupUpsellButton(arg_15_1, arg_15_0._currentLootType, var_15_0.ref)
		end
	else
		arg_15_0.OperatorLootDetailsLayout.OperatorChallenges:SetAlpha(0)

		if arg_15_0._currentLootType ~= LOOT.itemTypes.OPERATOR_SKIN then
			arg_15_0.OperatorLootDetailsLayout.BundleUpsellButton:HideButton()
		else
			local var_15_5 = arg_15_0.currentState == OPERATOR.SuperFaction.WEST and arg_15_0.westSelectedOperator or arg_15_0.eastSelectedOperator

			arg_15_0.OperatorLootDetailsLayout.BundleUpsellButton:SetupUpsellButton(arg_15_1, LOOT.itemTypes.OPERATOR, var_15_5)
		end
	end

	arg_15_0.OperatorLootDetailsLayout:UpdateDividerVisibility()

	arg_15_0._currentFocusedButton = arg_15_2
end

local function var_0_16(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_2 and arg_16_2.isNew then
		arg_16_2:ClearNew(arg_16_1)

		local var_16_0 = arg_16_0.CustomizationTabs:GetCurrentTabIndex() + 1

		var_0_12(arg_16_0, var_16_0)

		if arg_16_0._lastTabIndex ~= var_16_0 then
			var_0_12(arg_16_0, arg_16_0._lastTabIndex)
		end
	end
end

local function var_0_17(arg_17_0, arg_17_1)
	local var_17_0 = var_0_2(arg_17_0)

	assert(var_17_0)

	if not var_17_0.isUnlocked then
		return
	end

	local var_17_1 = OPERATOR.GetEquippedItemForLootType(arg_17_1, arg_17_0.operatorRef, arg_17_0._currentLootType)
	local var_17_2 = {
		operatorRef = arg_17_0.operatorRef
	}
	local var_17_3 = RANDOM.IsEnabled(arg_17_0._controllerIndex, arg_17_0._currentLootType, var_17_2)
	local var_17_4 = var_17_1 ~= var_17_0.ref or var_17_3 and not var_17_0.isRandom or not var_17_3 and var_17_0.isRandom
	local var_17_5 = not var_17_4 and var_0_8(arg_17_0, var_17_0.ref)

	if arg_17_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
		arg_17_0._clientChar = OPERATOR.GetClientCharacterForSuperFaction(arg_17_0.currentState)
		arg_17_0._equippedSkin = OPERATOR.GetOperatorSkin(arg_17_1, var_17_0.lootIndex, arg_17_0.operatorRef)
	end

	if var_17_4 then
		if var_17_0.isRandom then
			RANDOM.SetEnabled(arg_17_0._controllerIndex, arg_17_0._currentLootType, true, var_17_2)
		else
			OPERATOR.SetEquippedItemForLootType(arg_17_1, arg_17_0.operatorRef, arg_17_0._currentLootType, var_17_0.lootIndex)
			RANDOM.SetEnabled(arg_17_0._controllerIndex, arg_17_0._currentLootType, false, var_17_2)
		end

		arg_17_0.OperatorLootDetailsLayout.OperatorLootDetails:SetEquipped(true)
		arg_17_0.OperatorLootDetailsLayout.OperatorLootDetails:UpdateDetails(arg_17_1, arg_17_0._currentLootType, var_17_0)

		if arg_17_0._currentLootType == LOOT.itemTypes.OPERATOR_TAUNT and arg_17_0.OperatorLootDetailsLayout.OperatorLootDetails.PreviewQuip then
			arg_17_0.OperatorLootDetailsLayout.OperatorLootDetails:PreviewQuip()
		end
	elseif var_17_5 then
		if var_17_0.isRandom then
			RANDOM.SetEnabled(arg_17_0._controllerIndex, arg_17_0._currentLootType, false, var_17_2)
		end

		local var_17_6 = var_0_7(arg_17_0)

		var_17_0 = arg_17_0._lootData[var_17_6]

		OPERATOR.SetEquippedItemForLootType(arg_17_1, arg_17_0.operatorRef, arg_17_0._currentLootType, var_17_0.lootIndex)
		arg_17_0.OperatorLootDetailsLayout.OperatorLootDetails:SetEquipped(false)
	end

	if var_17_4 or var_17_5 then
		local var_17_7 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC(var_0_0[arg_17_0._currentLootType]),
			description = Engine.CBBHFCGDIC(var_17_0.name),
			type = var_0_1[arg_17_0._currentLootType],
			controllerIndex = arg_17_1
		}

		arg_17_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_17_7
		})

		if arg_17_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
			Lobby.PreloadViewHandsForLocalPlayer(arg_17_1)
		end
	end

	var_0_11(arg_17_0, index, var_17_0, arg_17_1, arg_17_0.operatorRef, var_17_5)
	arg_17_0.OperatorlootGrid:RefreshContent()
end

local function var_0_18(arg_18_0, arg_18_1)
	local var_18_0 = PlayerData.BFFBGAJGD(arg_18_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	if var_18_0.operators[arg_18_0.currentState]:get() ~= arg_18_0.operatorRef then
		var_18_0.operators[arg_18_0.currentState]:set(arg_18_0.operatorRef)

		local var_18_1 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECTED"),
			description = Engine.CBBHFCGDIC(OPERATOR.GetName(arg_18_0.operatorRef)),
			type = LUI.ToastManager.NotificationType.OperatorEquipped,
			controllerIndex = arg_18_1
		}

		arg_18_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_18_1
		})
	end
end

local function var_0_19(arg_19_0, arg_19_1, arg_19_2)
	for iter_19_0 = 1, #arg_19_1 do
		if arg_19_1[iter_19_0].ref == arg_19_2 then
			return iter_19_0
		end
	end

	return 1
end

local function var_0_20(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_1:GetBuiltChildren()

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		iter_20_1:SetHandleMouse(arg_20_2)
	end
end

local function var_0_21(arg_21_0, arg_21_1)
	local var_21_0 = PlayerData.BFFBGAJGD(arg_21_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	if arg_21_0.currentState == OPERATOR.SuperFaction.EAST then
		arg_21_0.operatorRef = arg_21_0.eastSelectedOperator or var_21_0.operators[arg_21_0.currentState]:get()
	else
		arg_21_0.operatorRef = arg_21_0.westSelectedOperator or var_21_0.operators[arg_21_0.currentState]:get()
	end
end

local function var_0_22(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	arg_22_2:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(arg_22_3.name)
	})

	local var_22_0 = {
		id = "equipLoot",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/SELECT_OPERATOR"),
		actionFunction = function()
			var_0_18(arg_22_0, arg_22_1)
			arg_22_0.OperatorLootDetailsLayout.SelectPrompt:setText("")
		end,
		conditionFunction = function()
			return var_0_5(arg_22_0, arg_22_1) and not var_0_4(arg_22_0, arg_22_1, arg_22_0.operatorRef) and var_0_3(arg_22_0)
		end
	}

	arg_22_2:AddContextualMenuAction(var_22_0)

	local var_22_1 = {
		id = "equipLoot",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/SELECT_OPERATOR"),
		actionFunction = function()
			var_0_17(arg_22_0, arg_22_1)
			var_0_18(arg_22_0, arg_22_1)
			arg_22_0.OperatorLootDetailsLayout.SelectPrompt:setText("")
		end,
		conditionFunction = function()
			return var_0_5(arg_22_0, arg_22_1) and not var_0_4(arg_22_0, arg_22_1, arg_22_0.operatorRef) and not var_0_3(arg_22_0)
		end
	}

	arg_22_2:AddContextualMenuAction(var_22_1)

	local var_22_2 = {
		id = "equipLoot",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/SELECT_SKIN_OPERATOR"),
		actionFunction = function()
			var_0_17(arg_22_0, arg_22_1)
			var_0_18(arg_22_0, arg_22_1)
			arg_22_0.OperatorLootDetailsLayout.SelectPrompt:setText("")
		end,
		conditionFunction = function()
			return var_0_5(arg_22_0, arg_22_1) and var_0_4(arg_22_0, arg_22_1, arg_22_0.operatorRef)
		end
	}

	arg_22_2:AddContextualMenuAction(var_22_2)
end

local function var_0_23(arg_29_0, arg_29_1)
	local var_29_0 = {
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
		controllerIndex = arg_29_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("OperatorLootButton", {
				controllerIndex = arg_29_1
			})
		end,
		refreshChild = function(arg_31_0, arg_31_1, arg_31_2)
			if arg_29_0.OperatorlootGrid and arg_31_0 then
				local var_31_0 = arg_31_1 + arg_31_2 * arg_29_0.OperatorlootGrid:GetNumColumns()

				if var_31_0 == nil then
					return
				end

				local var_31_1 = var_31_0 + 1
				local var_31_2 = arg_29_0._lootData[var_31_1]

				arg_31_0._index = var_31_1

				arg_31_0:UpdateLootButtonDetails(var_31_2, arg_29_1, arg_29_0.operatorRef, arg_29_0._currentLootType)

				if arg_29_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
					if OPERATOR.GetEquippedItemForLootType(arg_29_1, arg_29_0.operatorRef, LOOT.itemTypes.OPERATOR_SKIN) == var_31_2.ref then
						arg_29_0._equippedSkin = var_31_2.skinInfo or OPERATOR.GetOperatorSkin(arg_29_1, var_31_2.lootIndex, arg_29_0.operatorRef)

						if arg_29_0._equippedSkin and arg_29_0._skinUpdateOptions then
							OPERATOR.UpdateClientCharacter(arg_29_0._clientChar, arg_29_0._equippedSkin.bodyModel, arg_29_0._equippedSkin.headModel, arg_29_0._skinUpdateOptions)
						end
					end

					arg_29_0:SetupOperatorButtonContextualMenu(arg_29_1, arg_31_0, var_31_2)
				elseif arg_31_0._contextualMenuData then
					arg_31_0._contextualMenuData = nil
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
	local var_29_1 = LUI.UIGrid.new(var_29_0)

	var_29_1.id = "operatorLootGrid"

	var_29_1:setUseStencil(true)
	var_29_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 216, _1080p * 943)
	var_29_1:SetAlpha(1)
	var_29_1:setPriority(-100)
	arg_29_0:addElement(var_29_1)

	local var_29_2 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_29_0.VerticalMinimalScrollbar,
		startCap = arg_29_0.VerticalMinimalScrollbar.startCap,
		endCap = arg_29_0.VerticalMinimalScrollbar.endCap,
		sliderArea = arg_29_0.VerticalMinimalScrollbar.sliderArea,
		slider = arg_29_0.VerticalMinimalScrollbar.sliderArea and arg_29_0.VerticalMinimalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_29_0.VerticalMinimalScrollbar.sliderArea and arg_29_0.VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	})

	var_29_1:AddScrollbar(var_29_2)

	local function var_29_3()
		local var_32_0 = {
			operatorRef = arg_29_0.operatorRef
		}
		local var_32_1 = RANDOM.IsEnabled(arg_29_0._controllerIndex, arg_29_0._currentLootType, var_32_0)

		if arg_29_0._equippedSkin and arg_29_0._skinUpdateOptions then
			if arg_29_0._clientChar == nil then
				arg_29_0._clientChar = OPERATOR.GetClientCharacterForSuperFaction(arg_29_0.currentState)
			end

			OPERATOR.UpdateClientCharacter(arg_29_0._clientChar, arg_29_0._equippedSkin.bodyModel, arg_29_0._equippedSkin.headModel, arg_29_0._skinUpdateOptions)
		end

		if var_32_1 then
			return {
				x = 0,
				y = 0
			}
		else
			local var_32_2 = OPERATOR.GetEquippedItemForLootType(arg_29_1, arg_29_0.operatorRef, arg_29_0._currentLootType)
			local var_32_3 = arg_29_0:GetEquippedLootItemIndex(arg_29_0._lootData, var_32_2) - 1

			return var_29_1:GetPositionForIndex(var_32_3, {
				relativePosition = false
			})
		end
	end

	var_29_1:SetDefaultFocus(var_29_3)

	return var_29_1
end

local function var_0_24(arg_33_0, arg_33_1)
	if #arg_33_0._lootData <= 0 then
		arg_33_0.OperatorLootDetailsLayout.OperatorLootDetails:SetAlpha(0)

		return
	end

	table.sort(arg_33_0._lootData, function(arg_34_0, arg_34_1)
		if arg_34_0.isUnlocked ~= arg_34_1.isUnlocked then
			return arg_34_0.isUnlocked
		end

		if arg_34_0.rarity ~= arg_34_1.rarity then
			return arg_34_0.rarity < arg_34_1.rarity
		end

		if arg_34_0.uiPriority ~= arg_34_1.uiPriority then
			return tonumber(arg_34_0.uiPriority) < tonumber(arg_34_1.uiPriority)
		end

		if arg_34_0.lootIndex ~= arg_34_1.lootIndex then
			return arg_34_0.lootIndex < arg_34_1.lootIndex
		end

		local var_34_0 = Engine.CBBHFCGDIC(arg_34_0.name)
		local var_34_1 = Engine.CBBHFCGDIC(arg_34_1.name)

		if var_34_0 ~= var_34_1 then
			return var_34_0 < var_34_1
		end

		return false
	end)
	arg_33_0.OperatorlootGrid:processEvent({
		name = "lose_focus"
	})
	arg_33_0.OperatorlootGrid:SetNumChildren(#arg_33_0._lootData)
	arg_33_0.OperatorlootGrid:RefreshContent()
	arg_33_0.OperatorlootGrid:processEvent({
		name = "gain_focus"
	})

	local var_33_0 = 0

	for iter_33_0 = 1, #arg_33_0._lootData do
		if arg_33_0._lootData[iter_33_0].isUnlocked then
			var_33_0 = var_33_0 + 1
		end
	end

	arg_33_0.ItemsCollected:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y", var_33_0, #arg_33_0._lootData))
end

local function var_0_25(arg_35_0, arg_35_1, arg_35_2)
	arg_35_0:UpdateSuperfactionDisplay(arg_35_1)

	if not arg_35_2 then
		return
	end

	local var_35_0 = {}

	if arg_35_2.showSkins then
		local var_35_1 = OPERATOR.GetSkinsForOperator(arg_35_0.operatorRef, arg_35_1, true, true)

		var_35_0[#var_35_0 + 1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SKINS")),
			lootType = LOOT.itemTypes.OPERATOR_SKIN,
			lootData = var_35_1
		}
	end

	if arg_35_2.showTaunts then
		local var_35_2 = OPERATOR.GetTauntsForOperator(arg_35_0, arg_35_0.operatorRef, arg_35_1)

		var_35_0[#var_35_0 + 1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/QUIPS")),
			lootType = LOOT.itemTypes.OPERATOR_TAUNT,
			lootData = var_35_2
		}
	end

	if arg_35_2.showExecutions then
		local var_35_3 = OPERATOR.GetExecutionsForOperator(arg_35_0, arg_35_0.operatorRef, arg_35_1)

		var_35_0[#var_35_0 + 1] = {
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/EXECUTIONS")),
			lootType = LOOT.itemTypes.OPERATOR_EXECUTION,
			lootData = var_35_3
		}
	end

	if #var_35_0 <= 1 then
		arg_35_0.CustomizationTabs:SetAlpha(0)
	end

	arg_35_0._tabLootType = {}

	local var_35_4 = {}
	local var_35_5 = true

	for iter_35_0, iter_35_1 in ipairs(var_35_0) do
		local var_35_6 = #iter_35_1.lootData <= 0
		local var_35_7 = var_35_5 and not var_35_6

		var_35_5 = var_35_5 and not var_35_7

		if #iter_35_1.lootData > 0 and Dvar.IBEGCHEFE("TQRNTTMSL") then
			table.insert(iter_35_1.lootData, 1, RANDOM.GetItemData(arg_35_1))
		end

		table.insert(var_35_4, {
			name = iter_35_1.name,
			disabled = var_35_6,
			hasDefaultFocus = var_35_7,
			focusFunction = function(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
				arg_35_0._currentLootType = iter_35_1.lootType
				arg_35_0._lootData = iter_35_1.lootData
				arg_35_0._lastTabIndex = arg_35_0._currentTabIndex
				arg_35_0._currentTabIndex = arg_36_2 + 1

				if not arg_35_0._lastTabIndex then
					arg_35_0._lastTabIndex = arg_35_0._currentTabIndex
				end

				var_0_9(arg_35_0)
				var_0_16(arg_35_0, arg_36_1, arg_35_0._currentFocusedButton)
				arg_35_0:UpdateGrid(arg_36_1)
			end
		})

		arg_35_0._tabLootType[iter_35_0] = iter_35_1.lootType
	end

	arg_35_0.CustomizationTabs:SetTabs(var_35_4)

	for iter_35_2 = 1, #var_35_4 do
		var_0_12(arg_35_0, iter_35_2)
	end
end

local function var_0_26(arg_37_0, arg_37_1, arg_37_2)
	arg_37_0.UpdateGrid = var_0_24
	arg_37_0.RequestStreamingModels = var_0_13
	arg_37_0.GetEquippedLootItemIndex = var_0_19
	arg_37_0.UpdateSuperfactionDisplay = var_0_21
	arg_37_0.GridSetHandleMouse = var_0_20
	arg_37_0.SetupOperatorButtonContextualMenu = var_0_22
	arg_37_0._preview_skin = false
	arg_37_0._preview_quip = false
	arg_37_0._controllerIndex = arg_37_1
	arg_37_0.animationTime = 400
	arg_37_0.currentState = arg_37_2.operatorData.currentState
	arg_37_0.isCustomizationMenu = true
	arg_37_0._outfitMissionQuests = arg_37_2.operatorData.operatorInfo.outfitMissionQuests or {}

	arg_37_0.OperatorLootDetailsLayout.OperatorChallenges:SetAlpha(0)
	arg_37_0.OperatorLootDetailsLayout.OperatorLootDetails:SetAlpha(0)
	arg_37_0.OperatorLootDetailsLayout.OperatorLootDetails:InitializeDimensions(arg_37_0.OperatorLootDetailsLayout.OperatorLootDetails:GetCurrentAnchorsAndPositions())

	arg_37_0._menuOptions = arg_37_2.menuOptions
	arg_37_0.isQuickAccessShortcutsDisabled = true

	arg_37_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CUSTOMIZE_OPERATOR_WITH_NAME", arg_37_2.operatorData.operatorInfo.name)))

	local function var_37_0(arg_38_0, arg_38_1, arg_38_2)
		local var_38_0 = OPERATOR.GetTurnIdleAnimation(arg_38_1, arg_38_2)

		assert(var_38_0 and var_38_0 ~= "")

		arg_38_0.idleAnimation = var_38_0

		local var_38_1 = OPERATOR.GetClientCharacterForSuperFaction(arg_38_0.currentState)
		local var_38_2 = ClientCharacter.DCECEDGHEG(var_38_1)
		local var_38_3, var_38_4, var_38_5 = OPERATOR.GetTransitionInfoFromAnimation(var_38_2)

		ClientCharacter.BHJJGDDGFI(var_38_1, var_38_0, var_38_5, var_38_3, var_38_4)
		arg_38_0.CharacterRotator:SetClientCharacterInfo(var_38_1, arg_38_1, arg_38_2)
	end

	local var_37_1 = Engine.DCJHCAFIIA()
	local var_37_2

	if arg_37_0.currentState == OPERATOR.SuperFaction.WEST then
		arg_37_0.westSelectedOperator = arg_37_2.operatorData.westSelectedOperator

		local var_37_3 = OPERATOR.GetEquippedSkinForOperator(arg_37_1, arg_37_2.operatorData.westSelectedOperator)
		local var_37_4 = OPERATOR.GetOperatorSkinRef(var_37_3.bodyModel, var_37_3.headModel)

		var_37_0(arg_37_0, arg_37_0.westSelectedOperator, var_37_4)
		Engine.DHFCHIIJCA("character_faction_select_l_detail")

		var_37_2 = OPERATOR.GetCosmeticConfigString(arg_37_0.westSelectedOperator, arg_37_1)
	else
		arg_37_0.eastSelectedOperator = arg_37_2.operatorData.eastSelectedOperator

		local var_37_5 = OPERATOR.GetEquippedSkinForOperator(arg_37_1, arg_37_2.operatorData.eastSelectedOperator)
		local var_37_6 = OPERATOR.GetOperatorSkinRef(var_37_5.bodyModel, var_37_5.headModel)

		var_37_0(arg_37_0, arg_37_0.eastSelectedOperator, var_37_6)
		Engine.DHFCHIIJCA("character_faction_select_r_detail")

		var_37_2 = OPERATOR.GetCosmeticConfigString(arg_37_0.eastSelectedOperator, arg_37_1)
	end

	local var_37_7 = "ShowBattlePassInfo"

	if arg_37_0.westSelectedOperator and OPERATOR.IsS4Operator(arg_37_0.westSelectedOperator) then
		var_37_7 = "ShowProgressionInfo"

		arg_37_0.WZWipOperatorProgress:SetupProgression(arg_37_0.westSelectedOperator)
	elseif arg_37_0.eastSelectedOperator and OPERATOR.IsS4Operator(arg_37_0.eastSelectedOperator) then
		var_37_7 = "ShowProgressionInfo"

		arg_37_0.WZWipOperatorProgress:SetupProgression(arg_37_0.eastSelectedOperator)
	end

	ACTIONS.AnimateSequence(arg_37_0, var_37_7)

	arg_37_0._currentLootType = LOOT.itemTypes.OPERATOR_SKIN
	arg_37_0.OperatorlootGrid = var_0_23(arg_37_0, arg_37_1)

	arg_37_0:addEventHandler("menu_create", function()
		var_0_9(arg_37_0)
		var_0_25(arg_37_0, arg_37_1, arg_37_2.menuOptions)
	end)

	local var_37_8 = LUI.UIBindButton.new()

	var_37_8.id = "bindButton"

	arg_37_0:addElement(var_37_8)

	arg_37_0.bindButton = var_37_8

	local function var_37_9(arg_40_0, arg_40_1)
		Engine.DAGFFDGFII("uploadstats", arg_37_1)

		local var_40_0

		if arg_37_0.currentState == OPERATOR.SuperFaction.WEST then
			var_40_0 = OPERATOR.GetCosmeticConfigString(arg_37_0.westSelectedOperator, arg_37_1)
		else
			var_40_0 = OPERATOR.GetCosmeticConfigString(arg_37_0.eastSelectedOperator, arg_37_1)
		end

		METRICS.LootUsageSendDLogEvent(arg_37_0, {
			controllerIndex = arg_37_1,
			startTime = var_37_1,
			previousItemIDs = var_37_2,
			newItemIDs = var_40_0
		})
		LAYOUT.FadeInAspectRatioFadeFrame(arg_37_0, 300)

		if arg_37_0.currentState == OPERATOR.SuperFaction.WEST then
			arg_37_2.operatorData.westSelectedOperator = arg_37_0.operatorRef
		else
			arg_37_2.operatorData.eastSelectedOperator = arg_37_0.operatorRef
		end

		arg_37_2.operatorData.currentState = arg_37_0.currentState

		Engine.EBCGADABJ()

		arg_37_2.operatorData.skinInfo = nil

		ACTIONS.LeaveMenu(arg_37_0)
	end

	local function var_37_10(arg_41_0, arg_41_1)
		if arg_37_0._preview_skin then
			local var_41_0, var_41_1 = var_0_14(arg_37_0, arg_37_1)

			if var_41_0.skinInfo then
				arg_37_2.operatorData.skinInfo = var_41_0.skinInfo
			end

			LUI.FlowManager.RequestAddMenu("OperatorShowcase", false, arg_37_1, false, {
				operatorData = arg_37_2.operatorData
			})
		elseif arg_37_0._preview_quip then
			arg_37_0.OperatorLootDetailsLayout.OperatorLootDetails:PreviewQuip()
		end
	end

	arg_37_0.bindButton:addEventHandler("button_secondary", var_37_9)
	arg_37_0.bindButton:addEventHandler("button_alt2", var_37_10)

	local function var_37_11(arg_42_0, arg_42_1)
		local var_42_0 = arg_37_0.currentState == OPERATOR.SuperFaction.WEST and arg_37_0.westSelectedOperator or arg_37_0.eastSelectedOperator
		local var_42_1 = var_0_3(arg_37_0)
		local var_42_2 = var_0_5(arg_37_0, arg_37_1)
		local var_42_3 = var_0_6(arg_37_0, arg_37_1)
		local var_42_4 = var_0_4(arg_37_0, arg_37_1, var_42_0)

		if not var_42_1 and var_42_3 then
			LUI.FlowManager.RequestAddMenu("OperatorMissions", true, arg_37_0._controllerIndex, false, {
				challengeID = var_42_3.id,
				skinLootId = var_42_3.loot,
				outfitMissionQuests = arg_37_0._outfitMissionQuests
			})
		elseif var_42_4 and var_42_2 and arg_37_0._currentLootType == LOOT.itemTypes.OPERATOR_SKIN then
			var_0_17(arg_37_0, arg_37_1)
			var_0_18(arg_37_0, arg_37_1)
			arg_37_0.OperatorLootDetailsLayout.SelectPrompt:setText("")
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end

	local function var_37_12(arg_43_0, arg_43_1)
		if LUI.IsLastInputGamepad(arg_37_1) then
			var_37_11(arg_43_0, arg_43_1)
		end
	end

	local function var_37_13(arg_44_0, arg_44_1)
		if not LUI.IsLastInputGamepad(arg_37_1) then
			var_37_11(arg_44_0, arg_44_1)
		end
	end

	arg_37_0.bindButton:addEventHandler("button_left_trigger", var_37_12)
	arg_37_0.bindButton:addEventHandler("button_start", var_37_13)
	LAYOUT.AddAspectRatioFadeFrame(arg_37_0, arg_37_1)
	LAYOUT.FadeOutAspectRatioFadeFrame(arg_37_0, 500, 1.15)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_37_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_37_0.Vignette)

	local function var_37_14(arg_45_0, arg_45_1)
		local var_45_0 = CoD.GetAspectRatioScaleAdjust(0.45)

		arg_45_0.Darkener:SetScale(var_45_0)
	end

	arg_37_0:addAndCallEventHandler("onVideoChange", var_37_14)
	arg_37_0:registerEventHandler("operator_loot_button_up", function(arg_46_0, arg_46_1)
		var_0_16(arg_46_0, arg_37_1, arg_46_1.child)

		return true
	end)
	arg_37_0:registerEventHandler("operator_loot_button_focused", function(arg_47_0, arg_47_1)
		var_0_15(arg_47_0, arg_37_1, arg_47_1.child)

		return true
	end)
	arg_37_0:registerEventHandler("operator_loot_button_action", function(arg_48_0, arg_48_1)
		var_0_17(arg_48_0, arg_37_1)

		return true
	end)

	if arg_37_0.OperatorLootDetailsLayout.BundleUpsellButton then
		arg_37_0.OperatorLootDetailsLayout.BundleUpsellButton:SetUpsellMenu("OperatorCustomization")
	end

	if arg_37_0.westSelectedOperator and arg_37_0.currentState then
		arg_37_0._clientChar = OPERATOR.GetClientCharacterForSuperFaction(arg_37_0.currentState)
	end
end

function OperatorCustomization(arg_49_0, arg_49_1)
	local var_49_0 = LUI.UIElement.new()

	var_49_0.id = "OperatorCustomization"
	var_49_0._animationSets = var_49_0._animationSets or {}
	var_49_0._sequences = var_49_0._sequences or {}

	local var_49_1 = arg_49_1 and arg_49_1.controllerIndex

	if not var_49_1 and not Engine.DDJFBBJAIG() then
		var_49_1 = var_49_0:getRootController()
	end

	assert(var_49_1)

	local var_49_2 = var_49_0
	local var_49_3
	local var_49_4 = LUI.UIImage.new()

	var_49_4.id = "Vignette"

	var_49_4:setImage(RegisterMaterial("menu_vignette"), 0)
	var_49_4:SetBlendMode(BLEND_MODE.multiply)
	var_49_4:Setup9SliceImage(_1080p * 382, _1080p * 353, 0.21, 0.3)
	var_49_0:addElement(var_49_4)

	var_49_0.Vignette = var_49_4

	local var_49_5
	local var_49_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_49_1
	})

	var_49_6.id = "TabBacker"

	var_49_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_49_0:addElement(var_49_6)

	var_49_0.TabBacker = var_49_6

	local var_49_7
	local var_49_8 = LUI.UIImage.new()

	var_49_8.id = "Darkener"

	var_49_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_49_8:SetAlpha(0.4, 0)
	var_49_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_49_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 727, 0, 0)
	var_49_0:addElement(var_49_8)

	var_49_0.Darkener = var_49_8

	local var_49_9
	local var_49_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_49_1
	})

	var_49_10.id = "MenuTitle"

	var_49_10.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOMIZE_OPERATOR_CAPS"), 0)
	var_49_10.Line:SetLeft(0, 0)
	var_49_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_49_0:addElement(var_49_10)

	var_49_0.MenuTitle = var_49_10

	local var_49_11
	local var_49_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_49_1
	})

	var_49_12.id = "HelperBar"

	var_49_12.Background:SetAlpha(0.2, 0)
	var_49_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_49_0:addElement(var_49_12)

	var_49_0.HelperBar = var_49_12

	local var_49_13
	local var_49_14 = MenuBuilder.BuildRegisteredType("CharacterRotator", {
		controllerIndex = var_49_1
	})

	var_49_14.id = "CharacterRotator"

	var_49_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -440, _1080p * 500, _1080p * -540, _1080p * 540)
	var_49_0:addElement(var_49_14)

	var_49_0.CharacterRotator = var_49_14

	local var_49_15
	local var_49_16 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_49_1
			})
		end,
		controllerIndex = var_49_1
	}
	local var_49_17 = LUI.TabManager.new(var_49_16)

	var_49_17.id = "CustomizationTabs"

	var_49_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 997, _1080p * 108, _1080p * 160)
	var_49_0:addElement(var_49_17)

	var_49_0.CustomizationTabs = var_49_17

	local var_49_18
	local var_49_19 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_49_1
	})

	var_49_19.id = "LobbyMembersFooter"

	var_49_19:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_49_0:addElement(var_49_19)

	var_49_0.LobbyMembersFooter = var_49_19

	local var_49_20
	local var_49_21 = LUI.UIImage.new()

	var_49_21.id = "GridDivider"

	var_49_21:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_49_21:SetAlpha(0.6, 0)
	var_49_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 166, _1080p * 167)
	var_49_0:addElement(var_49_21)

	var_49_0.GridDivider = var_49_21

	local var_49_22
	local var_49_23 = LUI.UIStyledText.new()

	var_49_23.id = "ItemsCollected"

	var_49_23:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_49_23:SetAlpha(0, 0)
	var_49_23:setText(Engine.CBBHFCGDIC("LUA_MENU/COLLECTED_X_OF_Y"), 0)
	var_49_23:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_49_23:SetWordWrap(false)
	var_49_23:SetAlignment(LUI.Alignment.Left)
	var_49_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 315, _1080p * 178, _1080p * 200)
	var_49_0:addElement(var_49_23)

	var_49_0.ItemsCollected = var_49_23

	local var_49_24
	local var_49_25 = MenuBuilder.BuildRegisteredType("OperatorLootDetailsLayout", {
		controllerIndex = var_49_1
	})

	var_49_25.id = "OperatorLootDetailsLayout"

	var_49_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1140, _1080p * 216, _1080p * 351)
	var_49_0:addElement(var_49_25)

	var_49_0.OperatorLootDetailsLayout = var_49_25

	local var_49_26

	if CONDITIONS.IsBattlePassEnabled() then
		var_49_26 = MenuBuilder.BuildRegisteredType("BattlePassSeasonResetStatus", {
			controllerIndex = var_49_1
		})
		var_49_26.id = "BattlePassSeasonResetStatus"

		var_49_26.ResetText:SetLeft(_1080p * 83, 0)
		var_49_26.ResetText:SetRight(_1080p * 375, 0)
		var_49_26.ResetText:SetTop(_1080p * 24, 0)
		var_49_26.ResetText:SetBottom(_1080p * 52, 0)
		var_49_26.ResetText:SetAlignment(LUI.Alignment.Left)
		var_49_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1449, _1080p * 1824, _1080p * 52, _1080p * 132)
		var_49_0:addElement(var_49_26)

		var_49_0.BattlePassSeasonResetStatus = var_49_26
	end

	local var_49_27
	local var_49_28 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_49_1
	})

	var_49_28.id = "VerticalMinimalScrollbar"

	var_49_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 593, _1080p * 604, _1080p * 216, _1080p * 879)
	var_49_0:addElement(var_49_28)

	var_49_0.VerticalMinimalScrollbar = var_49_28

	local var_49_29

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_49_29 = MenuBuilder.BuildRegisteredType("WZOperatorProgress", {
			controllerIndex = var_49_1
		})
		var_49_29.id = "WZWipOperatorProgress"

		var_49_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1290, _1080p * 1790, _1080p * 30, _1080p * 154)
		var_49_0:addElement(var_49_29)

		var_49_0.WZWipOperatorProgress = var_49_29
	end

	local function var_49_30()
		return
	end

	var_49_0._sequences.DefaultSequence = var_49_30

	local var_49_31

	if CONDITIONS.IsBattlePassEnabled() then
		local var_49_32 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_49_26:RegisterAnimationSequence("ShowBattlePassInfo", var_49_32)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_49_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_49_29:RegisterAnimationSequence("ShowBattlePassInfo", var_49_33)
	end

	local function var_49_34()
		if CONDITIONS.IsBattlePassEnabled() then
			var_49_26:AnimateSequence("ShowBattlePassInfo")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_49_29:AnimateSequence("ShowBattlePassInfo")
		end
	end

	var_49_0._sequences.ShowBattlePassInfo = var_49_34

	local var_49_35

	if CONDITIONS.IsBattlePassEnabled() then
		local var_49_36 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_49_26:RegisterAnimationSequence("ShowProgressionInfo", var_49_36)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_49_37 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_49_29:RegisterAnimationSequence("ShowProgressionInfo", var_49_37)
	end

	local function var_49_38()
		if CONDITIONS.IsBattlePassEnabled() then
			var_49_26:AnimateSequence("ShowProgressionInfo")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_49_29:AnimateSequence("ShowProgressionInfo")
		end
	end

	var_49_0._sequences.ShowProgressionInfo = var_49_38

	var_0_26(var_49_0, var_49_1, arg_49_1)

	return var_49_0
end

MenuBuilder.registerType("OperatorCustomization", OperatorCustomization)
LockTable(_M)
