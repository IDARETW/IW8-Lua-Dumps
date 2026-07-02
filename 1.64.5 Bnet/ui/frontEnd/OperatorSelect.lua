module(..., package.seeall)

local var_0_0 = 74
local var_0_1 = 3
local var_0_2 = 30
local var_0_3 = 1920

FrontEndScene.RegisterScene("OperatorSelect", "character_faction_select_l")

local function var_0_4(arg_1_0, arg_1_1)
	if not arg_1_0._updatedEditLine then
		local var_1_0 = ClientCharacter.DBDJAAEGDH(arg_1_1)

		arg_1_0.OperatorEdit:UpdateLine(var_1_0)
		arg_1_0.OperatorEdit:SetAlpha(1, 200, LUI.EASING.inSine)

		arg_1_0._updatedEditLine = true
	else
		arg_1_0.OperatorEdit:SetAlpha(1)
	end
end

local function var_0_5(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0

	local function var_2_1()
		local var_3_0 = OPERATOR.GetClientCharacterForSuperFaction(arg_2_2)
		local var_3_1 = arg_2_0:GetSelectedOperator()

		if not var_3_1 or not OPERATOR.IsOperatorSubMenuAvailable(arg_2_0, arg_2_1, "OperatorCustomization") then
			return
		end

		local var_3_2 = OPERATOR.IsUnlocked(arg_2_1, var_3_1)

		if arg_2_0:TransitionFinished() and FrontEndScene.IsSceneFadeComplete(arg_2_1) and FrontEndScene.IsCharacterFullyLoaded(var_3_0) and var_3_2 then
			var_0_4(arg_2_0, var_3_0)
		else
			arg_2_0.OperatorEdit:SetAlpha(0)

			arg_2_0:Wait(200, true).onComplete = var_2_1
		end
	end

	var_2_1()
end

local function var_0_6(arg_4_0, arg_4_1)
	local var_4_0
	local var_4_1

	arg_4_0.OperatorEdit:SetAlpha(0)

	arg_4_0._updatedEditLine = false

	if arg_4_0.currentState == OPERATOR.SuperFaction.EAST then
		local var_4_2 = "East"
		local var_4_3 = OPERATOR.SuperFaction.WEST

		arg_4_0.OperatorDetails.SuperFactionName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/THE_EAST")))
		ACTIONS.AnimateSequence(arg_4_0.EastTab, CONDITIONS.IsMagmaGameMode() and "WZFocused" or "Focused")
		ACTIONS.AnimateSequence(arg_4_0.WestTab, "UnFocused")

		arg_4_0.EastTab.focused = true
		arg_4_0.WestTab.focused = false

		Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabCoalition)
	else
		local var_4_4 = "West"
		local var_4_5 = OPERATOR.SuperFaction.EAST

		arg_4_0.OperatorDetails.SuperFactionName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/THE_WEST")))
		ACTIONS.AnimateSequence(arg_4_0.WestTab, CONDITIONS.IsMagmaGameMode() and "WZFocused" or "Focused")
		ACTIONS.AnimateSequence(arg_4_0.EastTab, "UnFocused")

		arg_4_0.EastTab.focused = false
		arg_4_0.WestTab.focused = true

		Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.tabAllegiance)
	end

	arg_4_0:UpdateGrid()
end

local function var_0_7(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.OperatorGrid:GetBuiltChildren()

	for iter_5_0, iter_5_1 in ipairs(var_5_0) do
		iter_5_1:SetHandleMouse(arg_5_1)
	end
end

local function var_0_8(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.OperatorGrid:GetHorizontalAlignment()

	assert(var_6_0 == LUI.Alignment.Left, "SetupOperatorListPosition is based on the pre-condition that grid horizontal alignmenti is left. Please fix the alignment or update this function.")

	local var_6_1 = 0
	local var_6_2 = #arg_6_0._currentFactions

	for iter_6_0 = 1, var_6_2 do
		local var_6_3 = arg_6_0._currentFactions[iter_6_0]
		local var_6_4 = #arg_6_0._currentOperators[var_6_3]

		var_6_1 = var_6_1 + ((var_6_4 - 1) * var_0_1 + var_6_4 * var_0_0)
	end

	local var_6_5 = var_6_1 + (var_6_2 - 1) * var_0_2
	local var_6_6 = (var_0_3 - var_6_5) / 2
	local var_6_7 = var_0_3 / 2
	local var_6_8 = _1080p * (-var_6_7 + var_6_6)
	local var_6_9 = _1080p * (var_6_7 - var_6_6)
	local var_6_10 = _1080p * -232
	local var_6_11 = _1080p * -86

	arg_6_0.OperatorGrid:SetAnchorsAndPosition(0.5, 0.5, 1, 0, var_6_8, var_6_9, var_6_10, var_6_11)
end

local function var_0_9(arg_7_0, arg_7_1)
	assert(arg_7_0.operators)

	arg_7_0._needsUpdate = true

	if arg_7_0.currentState == OPERATOR.SuperFaction.WEST then
		arg_7_0._currentOperators = arg_7_0.operators.west
		arg_7_0._currentFactions = arg_7_0.factionOrdering.west
	else
		arg_7_0._currentOperators = arg_7_0.operators.east
		arg_7_0._currentFactions = arg_7_0.factionOrdering.east
	end

	arg_7_0.OperatorGrid:processEvent({
		name = "lose_focus"
	})
	arg_7_0.OperatorGrid:SetNumChildren(#arg_7_0._currentFactions)
	arg_7_0.OperatorGrid:RefreshContent()
	arg_7_0.OperatorGrid:processEvent({
		name = "gain_focus"
	})
	var_0_8(arg_7_0, arg_7_1)

	arg_7_0._needsUpdate = false
end

local function var_0_10(arg_8_0)
	local var_8_0 = arg_8_0:GetFocusedFactionListPosition()

	return arg_8_0.OperatorGrid:GetElementAtPosition(var_8_0.x, var_8_0.y)
end

local function var_0_11(arg_9_0)
	local var_9_0, var_9_1 = arg_9_0:GetOperatorFactionAndFocusIndex(arg_9_0:GetSelectedOperator())
	local var_9_2 = arg_9_0.OperatorGrid:GetPositionForIndex(var_9_0, {
		relativePosition = false
	})

	return {
		x = var_9_2.x,
		y = var_9_2.y
	}
end

local function var_0_12(arg_10_0)
	local var_10_0, var_10_1 = arg_10_0:GetOperatorFactionAndFocusIndex(arg_10_0:GetSelectedOperator())

	return var_10_1
end

local function var_0_13(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.OperatorGrid:GetPositionForIndex(arg_11_1, {
		relativePosition = false
	})

	return {
		x = var_11_0.x,
		y = var_11_0.y
	}
end

local function var_0_14(arg_12_0)
	return arg_12_0.OperatorGrid:GetNumColumns()
end

local function var_0_15(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.animationTime

	ACTIONS.AnimateSequence(arg_13_0, "FadeOut")
	arg_13_0.OperatorEdit:SetAlpha(0)
	arg_13_0.OperatorGrid:SetDirectionalInputEnabled(false)
	arg_13_0:GridSetHandleMouse(false)
	arg_13_0.OperatorGrid:SetAlpha(0, var_13_0, LUI.EASING.outSine)

	LUI.FlowManager.GetScopedData(arg_13_0).operatorData.useEquippedOperatorFocusIndex = true
	arg_13_0.OperatorGrid:Wait(var_13_0).onComplete = function()
		arg_13_0:UpdateSuperfactionDisplay(arg_13_1)
		ACTIONS.AnimateSequence(arg_13_0, "FadeIn")
		arg_13_0.OperatorGrid:SetAlpha(1, var_13_0, LUI.EASING.inSine)

		arg_13_0.OperatorGrid:Wait(var_13_0).onComplete = function()
			arg_13_0.OperatorGrid:SetDirectionalInputEnabled(true)
			arg_13_0:GridSetHandleMouse(true)

			arg_13_0.previousState = arg_13_0.currentState

			arg_13_0:SetPrompt(arg_13_1)
		end
	end
end

local function var_0_16(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = OPERATOR.GetEquippedSkinForOperator(arg_16_1, arg_16_2.ref)
	local var_16_1 = OPERATOR.GetOperatorSkinRef(var_16_0.bodyModel, var_16_0.headModel)
	local var_16_2 = arg_16_0.equipAnimationsTable[var_16_1]

	if not var_16_2 or #var_16_2 <= 0 then
		var_16_2 = arg_16_0.equipAnimationsTable[arg_16_2.ref]

		if var_16_2 == nil or var_16_2 == "" then
			return
		end
	end

	local var_16_3 = arg_16_0.idleAnimationsTable[var_16_1]

	if not var_16_3 or #var_16_3 <= 0 then
		var_16_3 = arg_16_0.idleAnimationsTable[arg_16_2.ref]

		if var_16_3 == nil or var_16_3 == "" then
			var_16_3 = arg_16_2.defaultPose
		end
	end

	local var_16_4
	local var_16_5
	local var_16_6
	local var_16_7 = OPERATOR.GetClientCharacterForSuperFaction(arg_16_0.currentState)
	local var_16_8 = ClientCharacter.DCECEDGHEG(var_16_7)
	local var_16_9, var_16_10 = OPERATOR.GetTransitionInfoFromAnimation(var_16_8)

	if not arg_16_3 then
		var_16_9 = 0
	end

	ClientCharacter.CAECDIHFCF(var_16_7, var_16_2, var_16_9, var_16_10)

	local var_16_11, var_16_12, var_16_13 = OPERATOR.GetTransitionInfoFromAnimation(var_16_2)

	ClientCharacter.BHJJGDDGFI(var_16_7, var_16_3, var_16_13, var_16_11, var_16_12)
end

local function var_0_17(arg_17_0, arg_17_1)
	local var_17_0, var_17_1 = arg_17_0:GetOperatorFactionAndFocusIndex(arg_17_1)
	local var_17_2 = arg_17_0.OperatorGrid:GetPositionForIndex(var_17_0, {
		relativePosition = false
	})

	arg_17_0.OperatorGrid:GetElementAtPosition(var_17_2.x, var_17_2.y).OperatorSelectButtonList:GetOperatorButtons()[var_17_1]:SetSelected(false)
end

local function var_0_18(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = PlayerData.BFFBGAJGD(arg_18_2, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_18_1 = var_18_0.operators[arg_18_0.currentState]:get()
	local var_18_2 = {
		operatorFaction = arg_18_0.currentState
	}
	local var_18_3 = RANDOM.IsEnabled(arg_18_2, LOOT.itemTypes.OPERATOR, var_18_2)

	if arg_18_1.isRandom then
		if not var_18_3 then
			RANDOM.SetEnabled(arg_18_2, LOOT.itemTypes.OPERATOR, true, var_18_2)
		end
	else
		RANDOM.SetEnabled(arg_18_2, LOOT.itemTypes.OPERATOR, false, var_18_2)
	end

	local var_18_4 = var_18_3 and not arg_18_1.isRandom
	local var_18_5 = var_18_1 ~= arg_18_1.ref

	if var_18_4 or var_18_5 then
		var_0_17(arg_18_0, var_18_1)

		if not arg_18_1.isRandom then
			var_0_17(arg_18_0, RANDOM.ref)
			var_18_0.operators[arg_18_0.currentState]:set(arg_18_1.ref)
			arg_18_0:PlayEquippedAnimAndQueueIdle(arg_18_2, arg_18_1, true)
		end

		arg_18_0.OperatorDetails:UpdateEquippedWidget(arg_18_1, arg_18_0.currentState, arg_18_2)

		arg_18_0._currentEquippedOperator = arg_18_1.ref

		local var_18_6 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECTED"),
			description = Engine.CBBHFCGDIC(arg_18_1.name),
			type = LUI.ToastManager.NotificationType.OperatorEquipped,
			controllerIndex = arg_18_2
		}

		arg_18_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_18_6
		})
		Lobby.PreloadViewHandsForLocalPlayer(arg_18_2)
	end
end

local function var_0_19(arg_19_0, arg_19_1)
	if not Engine.CFHBIHABCB(arg_19_1) and Dvar.IBEGCHEFE("OMPKROKQPL") then
		local var_19_0 = LUI.FlowManager.GetScopedData(arg_19_0)

		var_19_0.operatorData.currentState = arg_19_0.currentState
		var_19_0.operatorData.useSelectedOperatorIndexForFocus = true

		LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_19_1, false, nil)
	end
end

local function var_0_20(arg_20_0, arg_20_1)
	local var_20_0
	local var_20_1 = 1

	for iter_20_0, iter_20_1 in pairs(arg_20_0._currentOperators) do
		for iter_20_2 = 1, #iter_20_1 do
			if arg_20_0._currentOperators[iter_20_0][iter_20_2].ref == arg_20_1 then
				var_20_1 = iter_20_2
				var_20_0 = iter_20_0

				break
			end
		end

		if var_20_0 then
			break
		end
	end

	local var_20_2 = 0

	for iter_20_3 = 1, #arg_20_0._currentFactions do
		if var_20_0 and arg_20_0._currentFactions[iter_20_3] == var_20_0 then
			var_20_2 = iter_20_3 - 1

			break
		end
	end

	return var_20_2, var_20_1
end

local function var_0_21(arg_21_0, arg_21_1)
	local var_21_0 = PlayerData.BFFBGAJGD(arg_21_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[arg_21_0.currentState]:get()
	local var_21_1, var_21_2 = arg_21_0:GetOperatorFactionAndFocusIndex(var_21_0)

	return var_21_1, var_21_2
end

local function var_0_22(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_1 + arg_22_2 * arg_22_0.OperatorGrid:GetNumColumns() + 1
	local var_22_1 = LUI.clamp(var_22_0, 1, #arg_22_0._currentFactions)

	return arg_22_0._currentFactions[var_22_1]
end

local function var_0_23(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = var_0_22(arg_23_0, arg_23_1, arg_23_2)

	return #arg_23_0._currentOperators[var_23_0]
end

local function var_0_24(arg_24_0, arg_24_1)
	if arg_24_1.operatorIndex > 1 then
		return {
			row = arg_24_1.currentFactionRow,
			col = arg_24_1.currentFactionCol,
			index = arg_24_1.operatorIndex - 1
		}
	else
		local var_24_0 = arg_24_1.currentFactionCol - 1

		if var_24_0 < 0 then
			var_24_0 = arg_24_1.numColumns
		end

		return {
			row = arg_24_1.currentFactionRow,
			col = var_24_0,
			index = var_0_23(arg_24_0, var_24_0, arg_24_1.currentFactionRow)
		}
	end
end

local function var_0_25(arg_25_0, arg_25_1)
	if arg_25_1.operatorIndex < arg_25_1.numOperatorsInList then
		return {
			row = arg_25_1.currentFactionRow,
			col = arg_25_1.currentFactionCol,
			index = arg_25_1.operatorIndex + 1
		}
	else
		local var_25_0 = arg_25_1.currentFactionCol + 1

		if var_25_0 >= arg_25_1.numColumns then
			var_25_0 = 0
		end

		return {
			index = 1,
			row = arg_25_1.currentFactionRow,
			col = var_25_0
		}
	end
end

local function var_0_26(arg_26_0, arg_26_1)
	if arg_26_1.currentFactionRow >= 1 then
		return {
			row = arg_26_1.currentFactionRow - 1,
			col = arg_26_1.currentFactionCol,
			index = arg_26_1.operatorIndex
		}
	else
		return {
			row = arg_26_1.numRows - 1,
			col = arg_26_1.currentFactionCol,
			index = arg_26_1.operatorIndex
		}
	end
end

local function var_0_27(arg_27_0, arg_27_1)
	if arg_27_1.currentFactionRow < arg_27_1.numRows - 1 then
		return {
			row = arg_27_1.currentFactionRow + 1,
			col = arg_27_1.currentFactionCol,
			index = arg_27_1.operatorIndex
		}
	else
		return {
			row = 0,
			col = arg_27_1.currentFactionCol,
			index = arg_27_1.operatorIndex
		}
	end
end

local function var_0_28(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1._operatorIndex
	local var_28_1 = arg_28_1._factionIndex - 1
	local var_28_2 = arg_28_1._factionRef
	local var_28_3 = #arg_28_0._currentOperators[arg_28_1._factionRef]
	local var_28_4 = arg_28_0.OperatorGrid:GetNumChildren()
	local var_28_5 = arg_28_0.OperatorGrid:GetNumColumns()
	local var_28_6 = arg_28_0.OperatorGrid:GetNumRows()
	local var_28_7 = math.floor(var_28_1 / var_28_5)
	local var_28_8 = var_28_1 - var_28_7 * var_28_5
	local var_28_9 = {
		numColumns = var_28_5,
		numRows = var_28_6,
		numOperatorsInList = var_28_3,
		currentFactionRow = var_28_7,
		currentFactionCol = var_28_8,
		operatorIndex = var_28_0
	}
	local var_28_10 = var_0_24(arg_28_0, var_28_9)
	local var_28_11 = var_0_25(arg_28_0, var_28_9)
	local var_28_12 = var_0_26(arg_28_0, var_28_9)
	local var_28_13 = var_0_27(arg_28_0, var_28_9)

	return {
		left = var_28_10,
		right = var_28_11,
		up = var_28_12,
		down = var_28_13
	}
end

local function var_0_29(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0 = var_0_22(arg_29_0, arg_29_2, arg_29_1)

	return arg_29_0._currentOperators[var_29_0][arg_29_3].ref
end

local function var_0_30(arg_30_0, arg_30_1, arg_30_2)
	assert(#arg_30_1 == #arg_30_2)
	DebugPrint("")
	DebugPrint("Streaming Request Start...................................")

	for iter_30_0 = 1, #arg_30_1 do
		DebugPrint("Body: " .. arg_30_1[iter_30_0] .. ", " .. "Head: " .. arg_30_2[iter_30_0])
	end

	DebugPrint("Streaming Request End...................................")
	DebugPrint("")
end

local function var_0_31(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = {}
	local var_31_1 = {}
	local var_31_2 = var_0_28(arg_31_0, arg_31_1)
	local var_31_3 = {}

	for iter_31_0, iter_31_1 in pairs(var_31_2) do
		local var_31_4 = var_0_29(arg_31_0, iter_31_1.row, iter_31_1.col, iter_31_1.index)
		local var_31_5 = false

		for iter_31_2 = 1, #var_31_3 do
			if var_31_3[iter_31_2] == var_31_4 then
				var_31_5 = true

				break
			end
		end

		if not var_31_5 then
			table.insert(var_31_3, var_31_4)
		end
	end

	table.insert(var_31_3, arg_31_3)

	local var_31_6 = PlayerData.BFFBGAJGD(arg_31_2, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	for iter_31_3 = 1, #var_31_3 do
		local var_31_7 = var_31_3[iter_31_3]

		if OPERATOR.IsRandomOperator(var_31_7) then
			table.insert(var_31_0, OPERATOR.proxyBody)
			table.insert(var_31_1, OPERATOR.proxyHead)
		else
			local var_31_8 = var_31_6.operatorCustomization[var_31_7].skin:get()

			assert(var_31_8)

			local var_31_9 = OPERATOR.GetOperatorSkin(arg_31_2, var_31_8, var_31_7)

			if var_31_9.bodyModel and #var_31_9.bodyModel > 0 then
				table.insert(var_31_0, var_31_9.bodyModel)
			end

			if var_31_9.headModel and #var_31_9.headModel > 0 then
				table.insert(var_31_1, var_31_9.headModel)
			end

			local var_31_10 = var_31_6.operatorCustomization[var_31_7].execution:get()
			local var_31_11 = OPERATOR.GetExecutionPet(var_31_10)

			if #var_31_11 > 0 then
				local var_31_12 = OPERATOR.GetPetModel(var_31_11)

				table.insert(var_31_0, 1, var_31_11)
			end
		end
	end

	if #var_31_0 > 0 and #var_31_1 > 0 then
		if Dvar.IBEGCHEFE("lui_show_operator_streaming_requests") then
			var_0_30(arg_31_0, var_31_0, var_31_1)
		end

		FrontEndScene.RequestBodyModels(var_31_0)
		FrontEndScene.RequestHeadModels(var_31_1)
	end
end

local function var_0_32(arg_32_0, arg_32_1)
	local var_32_0 = LUI.FlowManager.GetScopedData(arg_32_0)

	if arg_32_0.currentState == OPERATOR.SuperFaction.WEST then
		var_32_0.operatorData.westSelectedOperator = arg_32_1.ref
		var_32_0.operatorData.westSelectedOperatorOutfitMissionQuests = arg_32_1.outfitMissionQuests
	else
		var_32_0.operatorData.eastSelectedOperator = arg_32_1.ref
		var_32_0.operatorData.eastSelectedOperatorOutfitMissionQuests = arg_32_1.outfitMissionQuests
	end

	if OPERATOR.IsDefaultOperator(arg_32_1.ref) or arg_32_1.isRandom or OPERATOR.IsCDLOperator(arg_32_1.ref) then
		arg_32_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_l3",
			helper_text = ""
		})
	else
		arg_32_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_l3",
			priority = 5,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_BIO")
		})
	end
end

local function var_0_33(arg_33_0)
	local var_33_0 = LUI.FlowManager.GetScopedData(arg_33_0)

	if arg_33_0.currentState == OPERATOR.SuperFaction.WEST then
		return var_33_0.operatorData.westSelectedOperator
	else
		return var_33_0.operatorData.eastSelectedOperator
	end
end

local function var_0_34(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	ACTIONS.AnimateSequence(arg_34_0, "OnOperatorUnlocked")
	arg_34_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 4,
		gamepad_only = true,
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	if not Engine.CJJAFGIFAC(arg_34_1) then
		arg_34_0.OperatorSelectChallengesLayout:SetAlpha(0)
	else
		if arg_34_3 and #arg_34_3 > 0 then
			ACTIONS.AnimateSequence(arg_34_0.OperatorSelectChallengesLayout, "OnOperatorUnlockedWithMissions")

			arg_34_0.OperatorSelectChallengesLayout._missionGridShown = true

			arg_34_0.OperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetMouseFocusBlocker(false)
		else
			ACTIONS.AnimateSequence(arg_34_0.OperatorSelectChallengesLayout, "OnOperatorUnlocked")

			arg_34_0.OperatorSelectChallengesLayout._missionGridShown = false

			arg_34_0.OperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetMouseFocusBlocker(true)
		end

		arg_34_0.OperatorSelectChallengesLayout:UpdateDividerVisibility()
	end

	arg_34_0.OperatorEdit.EditButton:SetButtonDisabled(false)

	if LUI.IsLastInputGamepad(arg_34_1) then
		arg_34_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			priority = 4,
			gamepad_only = true,
			button_ref = "button_r3",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_PREVIEW")
		})
	end
end

local function var_0_35(arg_35_0, arg_35_1, arg_35_2)
	if not Engine.CJJAFGIFAC(arg_35_1) then
		arg_35_0.OperatorSelectChallengesLayout:SetAlpha(0)
	else
		ACTIONS.AnimateSequence(arg_35_0.OperatorSelectChallengesLayout, "OnOperatorLocked")
	end

	ACTIONS.AnimateSequence(arg_35_0, "OnOperatorLocked")
	arg_35_0.OperatorEdit.EditButton:SetButtonDisabled(true)
	arg_35_0.HelperBar.ButtonHelperText:PopButtonPrompt({
		button_ref = "button_r3"
	})
	arg_35_0.HelperBar.ButtonHelperText:PopButtonPrompt({
		button_ref = "button_primary"
	})
	arg_35_0.PromptPreview:SetAlpha(0)
	arg_35_0.OperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetMouseFocusBlocker(true)
end

local function var_0_36(arg_36_0, arg_36_1)
	return function()
		FrontEndScene.SetCharacterVisible(OPERATOR.GetClientCharacterForSuperFaction(arg_36_0.currentState), true)
	end
end

local function var_0_37(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_1.outfitMissionQuests or {}

	arg_38_0.OperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetNumChildren(#var_38_0)
	arg_38_0.OperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetRefreshChild(function(arg_39_0, arg_39_1, arg_39_2)
		local var_39_0 = arg_39_2 + 1
		local var_39_1 = var_38_0[var_39_0]

		arg_39_0:Setup(var_39_1, var_39_0)
	end)
	arg_38_0.OperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid:UpdateDetails(var_38_0)
end

local function var_0_38(arg_40_0, arg_40_1, arg_40_2)
	arg_40_0._currentChild = arg_40_1

	local var_40_0 = arg_40_0._currentOperators[arg_40_1._factionRef][arg_40_1._operatorIndex]

	assert(var_40_0)
	arg_40_0:SetSelectedOperator(var_40_0)

	arg_40_0._currentEquippedOperator = PlayerData.BFFBGAJGD(arg_40_2, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[arg_40_0.currentState]:get()

	var_0_31(arg_40_0, arg_40_1, arg_40_2, var_40_0.ref)

	local var_40_1 = var_40_0.isRandom and var_40_0.operatorPose or arg_40_0.idleAnimationsTable[var_40_0.ref]
	local var_40_2 = LUI.FlowManager.GetScopedData(arg_40_0)
	local var_40_3 = OPERATOR.OperatorHasNewLoots(arg_40_2, var_40_0.ref)

	if LUI.IsLastInputGamepad(arg_40_2) then
		arg_40_0.NewItemNotification:SetAlpha(0)
		arg_40_0.OperatorEdit:UpdateNewItemNotification(var_40_3)
	else
		arg_40_0.OperatorEdit:UpdateNewItemNotification(0)
		arg_40_0.NewItemNotification:UpdateAlpha(var_40_3 and 1 or 0, 0, true)
	end

	if #Dvar.DHEEJCCJBH("NRLKQRRMKK") == 0 then
		arg_40_0.OperatorDetails:SetOperatorDetails(var_40_0, arg_40_2, var_40_1, true, var_40_2.menuName)
	else
		arg_40_0.OperatorDetails:SetOperatorDetails(var_40_0, arg_40_2, var_40_1, false, var_40_2.menuName)
	end

	arg_40_0.OperatorDetails:UpdateEquippedWidget(var_40_0, arg_40_0.currentState, arg_40_2)

	local var_40_4 = OPERATOR.IsDefaultOperator(var_40_0.ref)
	local var_40_5 = OPERATOR.IsUnlocked(arg_40_2, var_40_0.ref)

	arg_40_0._isFocusedOperatorUnlocked = var_40_5

	if var_40_5 then
		var_0_34(arg_40_0, arg_40_2, var_40_0.ref, var_40_0.outfitMissionQuests)
	else
		var_0_35(arg_40_0, arg_40_2, var_40_0.ref)
	end

	if not var_40_0.isRandom then
		local var_40_6 = OPERATOR.GetOperatorChallenges(arg_40_2, var_40_0.ref)

		if var_40_6 then
			local var_40_7 = Challenge.GetFileTableByType(Challenge.Type.OPERATOR_UNLOCK)
			local var_40_8 = StringTable.BJJBBCJGEJ(var_40_7.file, var_40_7.cols.id, var_40_6.Challenges.UnlockID)
			local var_40_9 = CSV.ReadRowWithColumns(var_40_7, var_40_8, {
				desc = var_40_7.cols.desc,
				amount = var_40_7.cols.amount
			})

			var_40_9.progress = var_40_6.Challenges.UnlockProgress
			var_40_9.operatorRef = var_40_0.ref
			var_40_9.isLaunchOperator = false

			if var_40_0.isLaunchOperator and #var_40_0.isLaunchOperator > 0 then
				var_40_9.isLaunchOperator = var_40_0.isLaunchOperator == "1"
			end

			if var_40_0.challengeUnlockDescOverride and var_40_0.challengeUnlockDescOverride ~= "" then
				var_40_9.desc = var_40_0.challengeUnlockDescOverride
			end

			arg_40_0.OperatorSelectChallengesLayout.OperatorChallenges:SetupChallenge(LOOT.itemTypes.OPERATOR, var_40_9, not var_40_5)
		end
	end

	if var_40_5 or not Dvar.IBEGCHEFE("LTSNLQNRKO") then
		arg_40_0.OperatorSelectChallengesLayout.BundleUpsellButton:HideButton()
	else
		arg_40_0.OperatorSelectChallengesLayout.BundleUpsellButton:SetupUpsellButton(arg_40_2, LOOT.itemTypes.OPERATOR, var_40_0.ref)
	end

	arg_40_0.operatorInfo = var_40_0

	var_0_37(arg_40_0, var_40_0)
	arg_40_0.OperatorSelectChallengesLayout:UpdateDividerVisibility()

	if var_40_2.menuName == "OperatorShowcase" then
		var_40_2.menuName = nil
	else
		local var_40_10, var_40_11 = var_0_21(arg_40_0, arg_40_2)

		if var_40_10 == arg_40_1._factionIndex - 1 and var_40_11 == arg_40_1._operatorIndex and OPERATOR.IsUnlocked(arg_40_2, var_40_0.ref) and not var_40_0.isRandom and not var_40_0.isRandomFavorite then
			arg_40_0:PlayEquippedAnimAndQueueIdle(arg_40_2, var_40_0, false)
		end
	end

	arg_40_0:SetPrompt(arg_40_2)
end

local function var_0_39(arg_41_0, arg_41_1)
	arg_41_0:SetAlpha(0)
	arg_41_0:SetAlpha(1, 500)
	arg_41_0.OperatorGrid:SetRefreshChild(function(arg_42_0, arg_42_1, arg_42_2)
		if arg_41_0._needsUpdate then
			local var_42_0 = arg_42_1 + arg_42_2 * arg_41_0.OperatorGrid:GetNumColumns()

			if var_42_0 == nil then
				return
			end

			if not arg_41_0._currentFactions or not arg_41_0._currentOperators then
				return
			end

			local var_42_1 = var_42_0 + 1

			arg_42_0._factionRef = arg_41_0._currentFactions[var_42_1]

			local var_42_2 = arg_41_0._currentOperators[arg_42_0._factionRef]

			arg_42_0:SetupButtonContainer(arg_41_1, arg_42_0._factionRef, var_42_1, var_42_2, arg_41_0)
		end
	end)

	local function var_41_0()
		local var_43_0 = LUI.FlowManager.GetScopedData(arg_41_0)
		local var_43_1, var_43_2 = arg_41_0:GetEquippedOperatorFocusIndex(arg_41_1)
		local var_43_3 = {
			operatorFaction = arg_41_0.currentState
		}

		if RANDOM.IsEnabled(arg_41_1, LOOT.itemTypes.OPERATOR, var_43_3) then
			local var_43_4

			var_43_1, var_43_4 = arg_41_0:GetOperatorFactionAndFocusIndex(RANDOM.ref)
		end

		if not var_43_0.operatorData.useEquippedOperatorFocusIndex and var_43_0.operatorData.useSelectedOperatorIndexForFocus then
			if var_43_0.operatorData.useDefaultOperatorForFocus then
				var_43_1 = OPERATOR.DEFAULT_FACTION_INDEX
			elseif arg_41_0.currentState == OPERATOR.SuperFaction.WEST and var_43_0.operatorData.westSelectedOperator then
				local var_43_5, var_43_6 = arg_41_0:GetOperatorFactionAndFocusIndex(var_43_0.operatorData.westSelectedOperator)

				var_43_1 = var_43_5
			elseif arg_41_0.currentState == OPERATOR.SuperFaction.EAST and var_43_0.operatorData.eastSelectedOperator then
				local var_43_7, var_43_8 = arg_41_0:GetOperatorFactionAndFocusIndex(var_43_0.operatorData.eastSelectedOperator)

				var_43_1 = var_43_7
			end
		end

		return arg_41_0.OperatorGrid:GetPositionForIndex(var_43_1, {
			relativePosition = false
		})
	end

	arg_41_0.OperatorGrid:SetDefaultFocus(var_41_0)
	arg_41_0.OperatorGrid:SetMeasureColumnFunction(LUI.ExpanderUtils.GenerateMeasureColumnFunction(234 * _1080p))
end

local function var_0_40(arg_44_0)
	arg_44_0.idleAnimationsTable = {}
	arg_44_0.equipAnimationsTable = {}

	for iter_44_0 = 0, StringTable.BFHCAIIDA(CSV.operatorSelectAnimations.file) - 1 do
		local var_44_0 = OPERATOR.GetIdleAnimations(iter_44_0)
		local var_44_1 = OPERATOR.GetEquipAnimations(iter_44_0)
		local var_44_2 = StringTable.CBGJCDIHCE(CSV.operatorSelectAnimations.file, iter_44_0, CSV.operatorSelectAnimations.cols.ref)

		arg_44_0.idleAnimationsTable[var_44_2] = var_44_0[math.random(1, #var_44_0)]
		arg_44_0.equipAnimationsTable[var_44_2] = var_44_1[math.random(1, #var_44_1)]
	end
end

local function var_0_41(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_0:GetSelectedOperator()
	local var_45_1 = OPERATOR.GetSkinsForOperator(var_45_0, arg_45_1, true, true)
	local var_45_2 = OPERATOR.GetTauntsForOperator(arg_45_0, var_45_0, arg_45_1)
	local var_45_3 = OPERATOR.GetExecutionsForOperator(arg_45_0, var_45_0, arg_45_1)

	return #var_45_1 > 0 or #var_45_2 > 0 or #var_45_3 > 0
end

local function var_0_42(arg_46_0, arg_46_1)
	arg_46_0.OperatorEdit:SetAlpha(0)
	arg_46_0.PromptKBM:SetAlpha(0)
	arg_46_0.NewItemNotification:SetAlpha(0)
	arg_46_0.PromptPreview:SetAlpha(0)

	local var_46_0 = OPERATOR.IsUnlocked(arg_46_1, arg_46_0._currentChild._operatorRef)

	if OPERATOR.IsOperatorSubMenuAvailable(arg_46_0, arg_46_1, "OperatorCustomization") then
		local var_46_1 = arg_46_0:GetSelectedOperator()
		local var_46_2

		var_46_2 = var_46_1 and OPERATOR.IsDefaultOperator(var_46_1)

		arg_46_0.OperatorEdit.EditText:setText(Engine.CBBHFCGDIC("OPERATIONS/EDIT_SKIN"))
		arg_46_0.PromptKBM:setText(Engine.CBBHFCGDIC("OPERATIONS/EDIT_SKIN"))
		arg_46_0.OperatorEdit:processEvent({
			name = "update_input_type",
			controllerIndex = arg_46_1
		})

		if LUI.IsLastInputGamepad(arg_46_1) then
			if not Engine.GEHBEDCEC() or var_0_41(arg_46_0, arg_46_1) then
				var_0_5(arg_46_0, arg_46_1, arg_46_0.currentState)
			end
		else
			arg_46_0.OperatorEdit:SetAlpha(0)

			if var_46_0 and (not Engine.GEHBEDCEC() or var_0_41(arg_46_0, arg_46_1)) then
				arg_46_0.PromptKBM:SetAlpha(1)
			end

			if not var_46_0 and OPERATOR.IsOperatorPreviewAvailable(arg_46_0, arg_46_1, "OperatorCustomization") then
				arg_46_0.PromptPreview:SetAlpha(1)
			end
		end
	end
end

local function var_0_43(arg_47_0)
	return arg_47_0.previousState == arg_47_0.currentState
end

local function var_0_44(arg_48_0, arg_48_1, arg_48_2)
	arg_48_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECT_CAPS"))
	arg_48_0:addEventHandler("menu_create", function(arg_49_0, arg_49_1)
		arg_49_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_49_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end)

	local var_48_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_48_1
	})

	var_48_0:SetLimits(-2, 2, -2, 2)
	var_48_0:SetSwayValues(2000, 0.06, 0.1)
	arg_48_0:addElement(var_48_0)
	Streaming.BDDBGGIC(true)

	arg_48_0.UpdateGrid = var_0_9
	arg_48_0.OnChildFocused = var_0_38
	arg_48_0.GridSetHandleMouse = var_0_7
	arg_48_0.EquipOperator = var_0_18
	arg_48_0.GetOperatorFactionAndFocusIndex = var_0_20
	arg_48_0.GetEquippedOperatorFocusIndex = var_0_21
	arg_48_0.HandleButtonPressed = HandleButtonPressed
	arg_48_0.UpdateSuperfactionDisplay = var_0_6
	arg_48_0.SwitchSuperFactions = var_0_15
	arg_48_0.PlayEquippedAnimAndQueueIdle = var_0_16
	arg_48_0.SetSelectedOperator = var_0_32
	arg_48_0.GetSelectedOperator = var_0_33
	arg_48_0.GetFocusedOperatorIndex = var_0_12
	arg_48_0.GetFocusedFactionElement = var_0_10
	arg_48_0.GetFocusedFactionListPosition = var_0_11
	arg_48_0.GetFactionPositionFromIndex = var_0_13
	arg_48_0.GetNumFactionColumns = var_0_14
	arg_48_0.SetPrompt = var_0_42
	arg_48_0.TransitionFinished = var_0_43
	arg_48_0.ShowMWUpsellPopup = var_0_19
	arg_48_0.RefreshFocus = RefreshFocus

	local var_48_1 = LUI.FlowManager.GetScopedData(arg_48_0)

	if not var_48_1.operatorData then
		var_48_1.operatorData = var_48_1.operatorData or {}
		var_48_1.operatorData.useEquippedOperatorFocusIndex = true
	end

	arg_48_0.currentState = var_48_1.operatorData.currentState or arg_48_2.faction
	arg_48_0.previousState = var_48_1.operatorData.currentState or arg_48_2.faction
	arg_48_0.operators, arg_48_0.factionOrdering = OPERATOR.GetAllOperators(arg_48_1)

	if arg_48_0.currentState == OPERATOR.SuperFaction.WEST then
		Engine.DHFCHIIJCA("character_faction_select_l")
	else
		Engine.DHFCHIIJCA("character_faction_select_r")
	end

	if #Dvar.DHEEJCCJBH("NRLKQRRMKK") == 0 then
		FrontEndScene.SetCharacterVisible(OPERATOR.GetClientCharacterForSuperFaction(arg_48_0.currentState), true)
	end

	MenuUtils.SetupSceneChangeCallback(arg_48_0, var_0_36(arg_48_0, arg_48_1))

	if OPERATOR.GetSelectedOperatorIndex(arg_48_1) == OPERATOR.SuperFaction.WEST then
		ACTIONS.AnimateSequence(arg_48_0, "WestFavorite")
	else
		ACTIONS.AnimateSequence(arg_48_0, "EastFavorite")
	end

	arg_48_0.animationTime = 400
	arg_48_0._needsUpdate = true

	var_0_39(arg_48_0, arg_48_1)
	var_0_40(arg_48_0)
	arg_48_0.OperatorEdit:CreateDynamicLineToClientCharacter()
	arg_48_0:UpdateSuperfactionDisplay(arg_48_1)

	local var_48_2 = ButtonMap.button_shoulderl.string
	local var_48_3 = ButtonMap.button_shoulderr.string

	if arg_48_2.useTriggers then
		var_48_2 = ButtonMap.button_left_trigger.string
		var_48_3 = ButtonMap.button_right_trigger.string
	end

	local var_48_4
	local var_48_5 = {
		iconString = var_48_2
	}
	local var_48_6 = MenuBuilder.BuildRegisteredType("IconImage", var_48_5)

	var_48_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 126, _1080p * 116, _1080p * 152)
	var_48_6:SetRGBFromTable(SWATCHES.tabManager.tabText)

	var_48_6.id = "leftShoulderButton"

	arg_48_0:addElement(var_48_6)

	arg_48_0.leftShoulderButton = var_48_6

	local var_48_7
	local var_48_8 = {
		iconString = var_48_3
	}
	local var_48_9 = MenuBuilder.BuildRegisteredType("IconImage", var_48_8)

	var_48_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 484, _1080p * 520, _1080p * 116, _1080p * 152)
	var_48_9:SetRGBFromTable(SWATCHES.tabManager.tabText)

	var_48_9.id = "rightShoulderButton"

	arg_48_0:addElement(var_48_9)

	arg_48_0.rightShoulderButton = var_48_9

	local var_48_10 = LUI.UIBindButton.new()

	var_48_10.id = "bindButton"

	arg_48_0:addElement(var_48_10)

	arg_48_0.bindButton = var_48_10

	local function var_48_11(arg_50_0, arg_50_1)
		if OPERATOR.SwitchFactionEast(arg_48_0) then
			ACTIONS.AnimateSequence(arg_48_0.EastTab, CONDITIONS.IsMagmaGameMode() and "WZFocused" or "Focused")
			ACTIONS.AnimateSequence(arg_48_0.WestTab, "UnFocused")

			arg_48_0.EastTab.focused = true
			arg_48_0.WestTab.focused = false

			arg_48_0:SwitchSuperFactions(arg_48_1)
		end
	end

	local function var_48_12(arg_51_0, arg_51_1)
		if OPERATOR.SwitchFactionWest(arg_48_0) then
			ACTIONS.AnimateSequence(arg_48_0.WestTab, CONDITIONS.IsMagmaGameMode() and "WZFocused" or "Focused")
			ACTIONS.AnimateSequence(arg_48_0.EastTab, "UnFocused")

			arg_48_0.EastTab.focused = false
			arg_48_0.WestTab.focused = true

			arg_48_0:SwitchSuperFactions(arg_48_1)
		end
	end

	local function var_48_13(arg_52_0, arg_52_1)
		if OPERATOR.SwitchFaction(arg_48_0) then
			arg_48_0:SwitchSuperFactions(arg_48_1)
			arg_48_0:SetPrompt(arg_48_1)
		end
	end

	local function var_48_14(arg_53_0)
		return function(arg_54_0, arg_54_1)
			local var_54_0 = OPERATOR.IsUnlocked(arg_48_1, arg_48_0._currentChild._operatorRef)

			if var_0_43(arg_48_0) then
				if not var_54_0 then
					arg_53_0 = "OperatorShowcase"
				end

				if OPERATOR.IsOperatorSubMenuAvailable(arg_48_0, arg_48_1, arg_53_0) then
					if var_54_0 and arg_53_0 == "OperatorCustomization" and Engine.GEHBEDCEC() and not var_0_41(arg_48_0, arg_48_1) then
						return
					end

					if arg_53_0 == "OperatorShowcase" and not OPERATOR.IsOperatorPreviewAvailable(arg_48_0, arg_48_1, arg_53_0) then
						return
					end

					OPERATOR.OpenOperatorSubMenu(arg_48_0, arg_48_1, {
						subMenuName = arg_53_0
					})
				end
			end
		end
	end

	local function var_48_15(arg_55_0, arg_55_1)
		if var_0_43(arg_48_0) and arg_48_0._isFocusedOperatorUnlocked and OPERATOR.IsOperatorMissionsAvailable(arg_48_0, arg_48_1) and Engine.CJJAFGIFAC(arg_48_1) then
			OPERATOR.OpenOperatorMissions(arg_48_0, arg_48_1, arg_48_0._currentEquippedOperator)
		end
	end

	local function var_48_16(arg_56_0, arg_56_1)
		if var_0_43(arg_48_0) and OPERATOR.IsOperatorBioAvailable(arg_48_0, arg_48_1) then
			OPERATOR.OpenOperatorBio(arg_48_0, arg_48_1)
		end
	end

	local var_48_17 = Engine.DCJHCAFIIA()
	local var_48_18 = OPERATOR.GetConfigString(arg_48_1)

	local function var_48_19(arg_57_0, arg_57_1)
		Engine.DAGFFDGFII("uploadstats", arg_48_1)

		local var_57_0 = OPERATOR.GetConfigString(arg_48_1)

		METRICS.LootUsageSendDLogEvent(arg_48_0, {
			controllerIndex = arg_48_1,
			startTime = var_48_17,
			previousItemIDs = var_48_18,
			newItemIDs = var_57_0
		})
		Engine.EBCGADABJ()
		ClientCharacter.DDHJHDEHFG(FrontEndScene.ClientCharacters.OperatorWest, 0, 0, 0)
		ClientCharacter.DDHJHDEHFG(FrontEndScene.ClientCharacters.OperatorEast, 0, 0, 0)
		ACTIONS.LeaveMenu(arg_48_0)
	end

	arg_48_0.bindButton:addEventHandler("button_secondary", var_48_19)
	arg_48_0.bindButton:addEventHandler("button_alt1", var_48_15)
	arg_48_0.bindButton:addEventHandler("button_left_stick", var_48_16)
	arg_48_0.bindButton:addEventHandler("button_alt2", var_48_14("OperatorCustomization"))
	arg_48_0.bindButton:addEventHandler("button_shoulderr", var_48_11)
	arg_48_0.bindButton:addEventHandler("button_shoulderl", var_48_12)
	arg_48_0.WestTab:addEventHandler("leftmouseup", var_48_12)
	arg_48_0.EastTab:addEventHandler("leftmouseup", var_48_11)
	arg_48_0.OperatorEdit.EditButton:addEventHandler("button_action", var_48_14("OperatorCustomization"))
	arg_48_0.WestTab.TabText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/THE_WEST")))
	arg_48_0.EastTab.TabText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/THE_EAST")))

	local var_48_20 = OPERATOR.FactionHasNewLoots(arg_48_1, OPERATOR.SuperFaction.WEST)

	arg_48_0.WestTab.NewItemSmallIcon:UpdateAlpha(var_48_20 and 1 or 0, 0, true)

	local var_48_21 = OPERATOR.FactionHasNewLoots(arg_48_1, OPERATOR.SuperFaction.EAST)

	arg_48_0.EastTab.NewItemSmallIcon:UpdateAlpha(var_48_21 and 1 or 0, 0, true)
	arg_48_0:registerEventHandler("clear_new_operator", function(arg_58_0, arg_58_1)
		local var_58_0 = OPERATOR.FactionHasNewLoots(arg_48_1, arg_48_0.currentState)

		if arg_48_0.currentState == OPERATOR.SuperFaction.WEST then
			arg_48_0.WestTab.NewItemSmallIcon:UpdateAlpha(var_58_0 and 1 or 0, 0, true)
		else
			arg_48_0.EastTab.NewItemSmallIcon:UpdateAlpha(var_58_0 and 1 or 0, 0, true)
		end
	end)

	local function var_48_22(arg_59_0, arg_59_1)
		local var_59_0 = LUI.FlowManager.GetScopedData(arg_59_0)

		if LUI.IsLastInputGamepad(arg_59_1.controllerIndex) then
			arg_59_0.rightShoulderButton:SetAlpha(1)
			arg_59_0.leftShoulderButton:SetAlpha(1)
		else
			arg_59_0.rightShoulderButton:SetAlpha(0)
			arg_59_0.leftShoulderButton:SetAlpha(0)
		end

		var_0_38(arg_59_0, arg_59_0._currentChild, arg_48_1)
		arg_59_0:SetPrompt(arg_59_1.controllerIndex)
	end

	arg_48_0:addEventHandler("update_input_type", var_48_22, {
		controllerIndex = arg_48_1
	})
	arg_48_0:addEventHandler("menu_close", function(arg_60_0, arg_60_1)
		ClientCharacter.DDHJHDEHFG(OPERATOR.GetClientCharacterForSuperFaction(arg_60_0.currentState), 0, 0, 0)
	end)
	arg_48_0:addEventHandler("restore_focus", function(arg_61_0, arg_61_1)
		local var_61_0 = LUI.FlowManager.GetScopedData(arg_48_0)

		if var_61_0.operatorData.useDefaultOperatorForFocus then
			var_61_0.operatorData.useDefaultOperatorForFocus = false

			return true
		end
	end)

	if CoD.AspectRatioCompare() == LUI.COMPARE.higher then
		arg_48_0.DarkenerRight:SetAlpha(1)
		LAYOUT.AdjustElementToFadeFrameLeft(arg_48_0.DarkenerLeft)
		LAYOUT.AdjustElementToFadeFrameRight(arg_48_0.DarkenerRight)
	end

	ACTIONS.ScaleFullscreen(arg_48_0.Vignette)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_48_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_48_0, arg_48_1)
	LUI.TextChat.SetupMenuForNoLine(arg_48_0)
	arg_48_0.OperatorSelectChallengesLayout.BundleUpsellButton:SetPreOpenStoreBundlePreviewFunc(function(arg_62_0)
		local var_62_0 = LUI.FlowManager.GetScopedData(arg_48_0)

		var_62_0.operatorData.currentState = arg_48_0.currentState
		var_62_0.operatorData.useSelectedOperatorIndexForFocus = true
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_48_0, "AR")
	end

	local var_48_23 = Onboarding.OperatorMissions.WasCompleted(arg_48_0, arg_48_1)

	local function var_48_24(arg_63_0, arg_63_1)
		if not Onboarding.MilSimOperators.WasCompleted(arg_63_0, arg_63_1) then
			LUI.FlowManager.RequestPopupMenu(arg_63_0, "onboardingfeaturepopup", true, arg_63_1, false, ONBOARDING_DATA.GetOnboardingMilSimOperatorsData())
			Onboarding.MilSimOperators.MarkCompleted(arg_63_0, arg_63_1)
		end
	end

	if not var_48_23 then
		local var_48_25 = ONBOARDING_DATA.GetOnboardingOperatorMissionsData()

		local function var_48_26(arg_64_0, arg_64_1)
			ACTIONS.LeaveMenu(arg_64_0)
			var_48_24(arg_48_0, arg_64_1)
		end

		var_48_25.confirmButton.action = var_48_26

		LUI.FlowManager.RequestPopupMenu(arg_48_0, "onboardingpopup", true, arg_48_1, false, var_48_25)
		Onboarding.OperatorMissions.MarkCompleted(arg_48_0, arg_48_1)
	else
		var_48_24(arg_48_0, arg_48_1)
	end

	if arg_48_0.OperatorSelectChallengesLayout.BundleUpsellButton then
		arg_48_0.OperatorSelectChallengesLayout.BundleUpsellButton:SetUpsellMenu("OperatorSelect")
	end
end

function OperatorSelect(arg_65_0, arg_65_1)
	local var_65_0 = LUI.UIElement.new()

	var_65_0.id = "OperatorSelect"
	var_65_0._animationSets = var_65_0._animationSets or {}
	var_65_0._sequences = var_65_0._sequences or {}

	local var_65_1 = arg_65_1 and arg_65_1.controllerIndex

	if not var_65_1 and not Engine.DDJFBBJAIG() then
		var_65_1 = var_65_0:getRootController()
	end

	assert(var_65_1)

	var_65_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_65_1
	})
	var_65_0.HelperBar.id = "HelperBar"

	var_65_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_65_0.HelperBar:setPriority(10)
	var_65_0:addElement(var_65_0.HelperBar)

	local var_65_2 = var_65_0
	local var_65_3
	local var_65_4 = LUI.UIImage.new()

	var_65_4.id = "Vignette"

	var_65_4:setImage(RegisterMaterial("menu_vignette"), 0)
	var_65_4:Setup9SliceImage(_1080p * 382, _1080p * 353, 0.21, 0.3)
	var_65_0:addElement(var_65_4)

	var_65_0.Vignette = var_65_4

	local var_65_5
	local var_65_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_65_1
	})

	var_65_6.id = "TabBacker"

	var_65_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_65_0:addElement(var_65_6)

	var_65_0.TabBacker = var_65_6

	local var_65_7
	local var_65_8 = LUI.UIImage.new()

	var_65_8.id = "DarkenerLeft"

	var_65_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_65_8:SetAlpha(0.4, 0)
	var_65_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_65_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -1320, 0, 0)
	var_65_0:addElement(var_65_8)

	var_65_0.DarkenerLeft = var_65_8

	local var_65_9
	local var_65_10 = LUI.UIImage.new()

	var_65_10.id = "DarkenerRight"

	var_65_10:SetRGBFromTable(SWATCHES.CAC.evenStripe, 0)
	var_65_10:SetAlpha(0, 0)
	var_65_10:setImage(RegisterMaterial("widg_gradient_right_to_left_strong"), 0)
	var_65_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1320, 0, 0, 0)
	var_65_0:addElement(var_65_10)

	var_65_0.DarkenerRight = var_65_10

	local var_65_11
	local var_65_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_65_1
	})

	var_65_12.id = "MenuTitle"

	var_65_12.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECT_CAPS"), 0)
	var_65_12.Line:SetLeft(0, 0)
	var_65_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_65_0:addElement(var_65_12)

	var_65_0.MenuTitle = var_65_12

	local var_65_13
	local var_65_14 = MenuBuilder.BuildRegisteredType("OperatorDetails", {
		controllerIndex = var_65_1
	})

	var_65_14.id = "OperatorDetails"

	var_65_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 200, _1080p * 700)
	var_65_0:addElement(var_65_14)

	var_65_0.OperatorDetails = var_65_14

	local var_65_15
	local var_65_16 = MenuBuilder.BuildRegisteredType("SubMenuTab", {
		controllerIndex = var_65_1
	})

	var_65_16.id = "WestTab"

	var_65_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 132, _1080p * 302, _1080p * 108, _1080p * 160)
	var_65_0:addElement(var_65_16)

	var_65_0.WestTab = var_65_16

	local var_65_17
	local var_65_18 = MenuBuilder.BuildRegisteredType("SubMenuTab", {
		controllerIndex = var_65_1
	})

	var_65_18.id = "EastTab"

	var_65_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 308, _1080p * 478, _1080p * 108, _1080p * 160)
	var_65_0:addElement(var_65_18)

	var_65_0.EastTab = var_65_18

	local var_65_19
	local var_65_20 = {
		scrollingThresholdX = 0,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 6,
		wrapY = false,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_65_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("OperatorSelectButtonContainer", {
				controllerIndex = var_65_1
			})
		end,
		refreshChild = function(arg_67_0, arg_67_1, arg_67_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 30,
		spacingY = _1080p * 30,
		columnWidth = _1080p * 234,
		rowHeight = _1080p * 146,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_65_21 = LUI.UIGrid.new(var_65_20)

	var_65_21.id = "OperatorGrid"

	var_65_21:setUseStencil(false)
	var_65_21:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -960, _1080p * 960, _1080p * -231, _1080p * -85)
	var_65_0:addElement(var_65_21)

	var_65_0.OperatorGrid = var_65_21

	local var_65_22
	local var_65_23 = MenuBuilder.BuildRegisteredType("OperatorSelectChallengesLayout", {
		controllerIndex = var_65_1
	})

	var_65_23.id = "OperatorSelectChallengesLayout"

	var_65_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1374, _1080p * 1824, _1080p * 216, _1080p * 666)
	var_65_0:addElement(var_65_23)

	var_65_0.OperatorSelectChallengesLayout = var_65_23

	local var_65_24
	local var_65_25 = MenuBuilder.BuildRegisteredType("OperatorEdit", {
		controllerIndex = var_65_1
	})

	var_65_25.id = "OperatorEdit"

	var_65_25:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_65_25:SetAlpha(0, 0)
	var_65_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1069, _1080p * 1269, _1080p * 251, _1080p * 289)
	var_65_0:addElement(var_65_25)

	var_65_0.OperatorEdit = var_65_25

	local var_65_26
	local var_65_27 = LUI.UIImage.new()

	var_65_27.id = "WestStar"

	var_65_27:SetAlpha(0, 0)
	var_65_27:setImage(RegisterMaterial("favorite"), 0)
	var_65_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 132, _1080p * 181, _1080p * 108, _1080p * 157)
	var_65_0:addElement(var_65_27)

	var_65_0.WestStar = var_65_27

	local var_65_28
	local var_65_29 = LUI.UIImage.new()

	var_65_29.id = "EastStar"

	var_65_29:SetAlpha(0, 0)
	var_65_29:setImage(RegisterMaterial("favorite"), 0)
	var_65_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 308, _1080p * 356, _1080p * 108, _1080p * 157)
	var_65_0:addElement(var_65_29)

	var_65_0.EastStar = var_65_29

	local var_65_30
	local var_65_31 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_65_1
	})

	var_65_31.id = "LobbyMembersFooter"

	var_65_31:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_65_0:addElement(var_65_31)

	var_65_0.LobbyMembersFooter = var_65_31

	local var_65_32
	local var_65_33 = LUI.UIText.new()

	var_65_33.id = "PromptKBM"

	var_65_33:setText(Engine.CBBHFCGDIC("OPERATIONS/EDIT_SKIN"), 0)
	var_65_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_65_33:SetAlignment(LUI.Alignment.Left)
	var_65_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 235, _1080p * 504, _1080p * 750, _1080p * 770)
	var_65_0:addElement(var_65_33)

	var_65_0.PromptKBM = var_65_33

	local var_65_34
	local var_65_35 = LUI.UIText.new()

	var_65_35.id = "PromptPreview"

	var_65_35:setText(Engine.CBBHFCGDIC("OPERATIONS/OPERATOR_PREVIEW"), 0)
	var_65_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_65_35:SetAlignment(LUI.Alignment.Left)
	var_65_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 235, _1080p * 504, _1080p * 750, _1080p * 770)
	var_65_0:addElement(var_65_35)

	var_65_0.PromptPreview = var_65_35

	local var_65_36

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		local var_65_37 = MenuBuilder.BuildRegisteredType("IGROperatorUnlockTip", {
			controllerIndex = var_65_1
		})

		var_65_37.id = "IGROperatorUnlockTip"

		var_65_37:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -182, _1080p * 618, _1080p * -70, 0)
		var_65_0:addElement(var_65_37)

		var_65_0.IGROperatorUnlockTip = var_65_37
	end

	local var_65_38

	if CONDITIONS.IsKoreanIGR() then
		local var_65_39 = MenuBuilder.BuildRegisteredType("IGROperatorUnlockTip", {
			controllerIndex = var_65_1
		})

		var_65_39.id = "IGROperatorUnlockTipCopy0"

		var_65_39:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -182, _1080p * 618, _1080p * -70, 0)
		var_65_0:addElement(var_65_39)

		var_65_0.IGROperatorUnlockTipCopy0 = var_65_39
	end

	local var_65_40

	if CONDITIONS.IsBattlePassEnabled() then
		local var_65_41 = MenuBuilder.BuildRegisteredType("BattlePassSeasonResetStatus", {
			controllerIndex = var_65_1
		})

		var_65_41.id = "BattlePassSeasonResetStatus"

		var_65_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1449, _1080p * 1824, _1080p * 52, _1080p * 132)
		var_65_0:addElement(var_65_41)

		var_65_0.BattlePassSeasonResetStatus = var_65_41
	end

	local var_65_42
	local var_65_43 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_65_1
	})

	var_65_43.id = "NewItemNotification"

	var_65_43:SetAlpha(0, 0)
	var_65_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 348, _1080p * 356, _1080p * 741, _1080p * 749)
	var_65_0:addElement(var_65_43)

	var_65_0.NewItemNotification = var_65_43

	local function var_65_44()
		return
	end

	var_65_0._sequences.DefaultSequence = var_65_44

	local var_65_45
	local var_65_46 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		}
	}

	var_65_14:RegisterAnimationSequence("FadeOut", var_65_46)

	local var_65_47 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_65_23:RegisterAnimationSequence("FadeOut", var_65_47)

	local var_65_48 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_65_25:RegisterAnimationSequence("FadeOut", var_65_48)

	local var_65_49 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_65_33:RegisterAnimationSequence("FadeOut", var_65_49)

	local var_65_50 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_65_35:RegisterAnimationSequence("FadeOut", var_65_50)

	local function var_65_51()
		var_65_14:AnimateSequence("FadeOut")
		var_65_23:AnimateSequence("FadeOut")
		var_65_25:AnimateSequence("FadeOut")
		var_65_33:AnimateSequence("FadeOut")
		var_65_35:AnimateSequence("FadeOut")
	end

	var_65_0._sequences.FadeOut = var_65_51

	local var_65_52
	local var_65_53 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		}
	}

	var_65_14:RegisterAnimationSequence("FadeIn", var_65_53)

	local var_65_54 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_65_23:RegisterAnimationSequence("FadeIn", var_65_54)

	local function var_65_55()
		var_65_14:AnimateSequence("FadeIn")
		var_65_23:AnimateSequence("FadeIn")
	end

	var_65_0._sequences.FadeIn = var_65_55

	local var_65_56
	local var_65_57 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_65_27:RegisterAnimationSequence("WestFavorite", var_65_57)

	local var_65_58 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_65_29:RegisterAnimationSequence("WestFavorite", var_65_58)

	local function var_65_59()
		var_65_27:AnimateSequence("WestFavorite")
		var_65_29:AnimateSequence("WestFavorite")
	end

	var_65_0._sequences.WestFavorite = var_65_59

	local var_65_60
	local var_65_61 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_65_27:RegisterAnimationSequence("EastFavorite", var_65_61)

	local var_65_62 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_65_29:RegisterAnimationSequence("EastFavorite", var_65_62)

	local function var_65_63()
		var_65_27:AnimateSequence("EastFavorite")
		var_65_29:AnimateSequence("EastFavorite")
	end

	var_65_0._sequences.EastFavorite = var_65_63

	local function var_65_64()
		return
	end

	var_65_0._sequences.OnOperatorUnlocked = var_65_64

	local var_65_65
	local var_65_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_65_33:RegisterAnimationSequence("OnOperatorLocked", var_65_66)

	local function var_65_67()
		var_65_33:AnimateSequence("OnOperatorLocked")
	end

	var_65_0._sequences.OnOperatorLocked = var_65_67

	local var_65_68
	local var_65_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 154
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 423
		}
	}

	var_65_33:RegisterAnimationSequence("AR", var_65_69)

	local var_65_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 154
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 423
		}
	}

	var_65_35:RegisterAnimationSequence("AR", var_65_70)

	local function var_65_71()
		var_65_33:AnimateSequence("AR")
		var_65_35:AnimateSequence("AR")
	end

	var_65_0._sequences.AR = var_65_71

	var_0_44(var_65_0, var_65_1, arg_65_1)

	return var_65_0
end

MenuBuilder.registerType("OperatorSelect", OperatorSelect)
LockTable(_M)
