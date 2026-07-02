module(..., package.seeall)

local var_0_0 = 74
local var_0_1 = 6
local var_0_2 = 60
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

		if not var_3_1 then
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

	arg_6_0.OperatorGrid:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * (-960 + var_6_6), _1080p * (960 - var_6_6), _1080p * -232, _1080p * -86)
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
	arg_8_0.OperatorGrid:SetDefaultFocus(DefaultFocusFunction)
	arg_8_0.OperatorGrid:processEvent({
		name = "lose_focus"
	})
	arg_8_0.OperatorGrid:SetNumChildren(#arg_8_0._currentFactions)
	arg_8_0.OperatorGrid:RefreshContent()
	arg_8_0.OperatorGrid:processEvent({
		name = "gain_focus"
	})
end

local function var_0_11(arg_9_0)
	local var_9_0 = arg_9_0:GetFocusedFactionListPosition()

	return arg_9_0.OperatorGrid:GetElementAtPosition(var_9_0.x, var_9_0.y)
end

local function var_0_12(arg_10_0)
	local var_10_0, var_10_1 = arg_10_0:GetOperatorFactionAndFocusIndex(arg_10_0:GetSelectedOperator())
	local var_10_2 = arg_10_0.OperatorGrid:GetPositionForIndex(var_10_0, {
		relativePosition = false
	})

	return {
		x = var_10_2.x,
		y = var_10_2.y
	}
end

local function var_0_13(arg_11_0)
	local var_11_0, var_11_1 = arg_11_0:GetOperatorFactionAndFocusIndex(arg_11_0:GetSelectedOperator())

	return var_11_1
end

local function var_0_14(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.OperatorGrid:GetPositionForIndex(arg_12_1, {
		relativePosition = false
	})

	return {
		x = var_12_0.x,
		y = var_12_0.y
	}
end

local function var_0_15(arg_13_0)
	return arg_13_0.OperatorGrid:GetNumColumns()
end

local function var_0_16(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.animationTime

	ACTIONS.AnimateSequence(arg_14_0, "FadeOut")
	arg_14_0.OperatorEdit:SetAlpha(0)
	arg_14_0.OperatorGrid:SetDirectionalInputEnabled(false)
	arg_14_0:GridSetHandleMouse(false)
	arg_14_0.OperatorGrid:SetAlpha(0, var_14_0, LUI.EASING.outSine)

	LUI.FlowManager.GetScopedData(arg_14_0).operatorData.useEquippedOperatorFocusIndex = true
	arg_14_0.OperatorGrid:Wait(var_14_0).onComplete = function()
		arg_14_0:UpdateSuperfactionDisplay(arg_14_1)
		ACTIONS.AnimateSequence(arg_14_0, "FadeIn")
		arg_14_0.OperatorGrid:SetAlpha(1, var_14_0, LUI.EASING.inSine)

		arg_14_0.OperatorGrid:Wait(var_14_0).onComplete = function()
			arg_14_0.OperatorGrid:SetDirectionalInputEnabled(true)
			arg_14_0:GridSetHandleMouse(true)

			arg_14_0.previousState = arg_14_0.currentState

			arg_14_0:SetPrompt(arg_14_1)
		end
	end
end

local function var_0_17(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = OPERATOR.GetEquippedSkinForOperator(arg_17_1, arg_17_2.ref)
	local var_17_1 = OPERATOR.GetOperatorSkinRef(var_17_0.bodyModel, var_17_0.headModel)
	local var_17_2 = arg_17_0.equipAnimationsTable[var_17_1]

	if not var_17_2 or #var_17_2 <= 0 then
		var_17_2 = arg_17_0.equipAnimationsTable[arg_17_2.ref]
	end

	local var_17_3 = arg_17_0.idleAnimationsTable[arg_17_2.ref]

	if var_17_2 == nil or var_17_2 == "" then
		return
	end

	if var_17_3 == nil or var_17_3 == "" then
		var_17_3 = arg_17_2.defaultPose
	end

	local var_17_4
	local var_17_5
	local var_17_6
	local var_17_7 = OPERATOR.GetClientCharacterForSuperFaction(arg_17_0.currentState)
	local var_17_8 = ClientCharacter.DCECEDGHEG(var_17_7)
	local var_17_9, var_17_10 = OPERATOR.GetTransitionInfoFromAnimation(var_17_8)

	if not arg_17_3 then
		var_17_9 = 0
	end

	ClientCharacter.CAECDIHFCF(var_17_7, var_17_2, var_17_9, var_17_10)

	local var_17_11, var_17_12, var_17_13 = OPERATOR.GetTransitionInfoFromAnimation(var_17_2)

	ClientCharacter.BHJJGDDGFI(var_17_7, var_17_3, var_17_13, var_17_11, var_17_12)
end

local function var_0_18(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = PlayerData.BFFBGAJGD(arg_18_2, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_18_1 = var_18_0.operators[arg_18_0.currentState]:get()

	if var_18_1 ~= arg_18_1.ref then
		local var_18_2, var_18_3 = arg_18_0:GetOperatorFactionAndFocusIndex(var_18_1)
		local var_18_4 = arg_18_0.OperatorGrid:GetPositionForIndex(var_18_2, {
			relativePosition = false
		})

		arg_18_0.OperatorGrid:GetElementAtPosition(var_18_4.x, var_18_4.y).OperatorSelectButtonList:GetOperatorButtons()[var_18_3]:SetSelected(false)
		var_18_0.operators[arg_18_0.currentState]:set(arg_18_1.ref)
		arg_18_0.OperatorDetails:UpdateEquippedWidget(arg_18_1, arg_18_0.currentState, arg_18_2)
		arg_18_0:PlayEquippedAnimAndQueueIdle(arg_18_2, arg_18_1, true)

		arg_18_0._currentEquippedOperator = arg_18_1.ref

		local var_18_5 = {
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
			options = var_18_5
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

	if OPERATOR.IsDefaultOperator(arg_32_1.ref) then
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

	local var_34_0 = OPERATOR.GetLootIDFromRef(arg_34_2)

	assert(var_34_0)

	if Loot.HDJCADADF(arg_34_1, var_34_0) then
		local var_34_1 = OPERATOR.GetIntroVideo(arg_34_2)

		if not LOOT.HideLootBreadcrumbsCondition(true) then
			local var_34_2 = LUI.FlowManager.GetScopedData(arg_34_0)

			var_34_2.operatorData.currentState = arg_34_0.currentState
			var_34_2.operatorData.useSelectedOperatorIndexForFocus = true

			OPERATOR.PlayFullscreenIntroVideo(arg_34_0, var_34_1, arg_34_1)
		end
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

	local var_40_1 = arg_40_0.idleAnimationsTable[var_40_0.ref]
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

		arg_40_0.OperatorSelectChallengesLayout.OperatorChallenges:SetupChallenge(LOOT.itemTypes.OPERATOR, var_40_9, not var_40_5)
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

		if var_40_10 == arg_40_1._factionIndex - 1 and var_40_11 == arg_40_1._operatorIndex and OPERATOR.IsUnlocked(arg_40_2, var_40_0.ref) then
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

		if not var_43_0.operatorData.useEquippedOperatorFocusIndex and var_43_0.operatorData.useSelectedOperatorIndexForFocus then
			if var_43_0.operatorData.useDefaultOperatorForFocus then
				var_43_1 = OPERATOR.DEFAULT_FACTION_INDEX
				var_43_0.operatorData.useDefaultOperatorForFocus = false
			elseif arg_41_0.currentState == OPERATOR.SuperFaction.WEST and var_43_0.operatorData.westSelectedOperator then
				local var_43_3, var_43_4 = arg_41_0:GetOperatorFactionAndFocusIndex(var_43_0.operatorData.westSelectedOperator)

				var_43_1 = var_43_3
			elseif arg_41_0.currentState == OPERATOR.SuperFaction.EAST and var_43_0.operatorData.eastSelectedOperator then
				local var_43_5, var_43_6 = arg_41_0:GetOperatorFactionAndFocusIndex(var_43_0.operatorData.eastSelectedOperator)

				var_43_1 = var_43_5
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
	arg_45_0.OperatorEdit:SetAlpha(0)
	arg_45_0.PromptKBM:SetAlpha(0)
	arg_45_0.NewItemNotification:SetAlpha(0)
	arg_45_0.PromptPreview:SetAlpha(0)

	if OPERATOR.IsOperatorSubMenuAvailable(arg_45_0, arg_45_1, "OperatorCustomization") then
		local var_45_0 = arg_45_0:GetSelectedOperator()
		local var_45_1

		var_45_1 = var_45_0 and OPERATOR.IsDefaultOperator(var_45_0)

		arg_45_0.OperatorEdit.EditText:setText(Engine.CBBHFCGDIC("OPERATIONS/EDIT_SKIN"))
		arg_45_0.PromptKBM:setText(Engine.CBBHFCGDIC("OPERATIONS/EDIT_SKIN"))
		arg_45_0.OperatorEdit:processEvent({
			name = "update_input_type",
			controllerIndex = arg_45_1
		})

		if LUI.IsLastInputGamepad(arg_45_1) then
			var_0_5(arg_45_0, arg_45_1, arg_45_0.currentState)
		else
			arg_45_0.OperatorEdit:SetAlpha(0)
			arg_45_0.PromptKBM:SetAlpha(1)
			arg_45_0.PromptPreview:SetAlpha(1)
		end
	end
end

local function var_0_42(arg_46_0)
	return arg_46_0.previousState == arg_46_0.currentState
end

local function var_0_43(arg_47_0, arg_47_1, arg_47_2)
	arg_47_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECT_CAPS"))
	arg_47_0:addEventHandler("menu_create", function(arg_48_0, arg_48_1)
		arg_48_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_48_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end)

	local var_47_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_47_1
	})

	var_47_0:SetLimits(-2, 2, -2, 2)
	var_47_0:SetSwayValues(2000, 0.06, 0.1)
	arg_47_0:addElement(var_47_0)
	Streaming.BDDBGGIC(true)

	arg_47_0.UpdateGrid = var_0_9
	arg_47_0.OnChildFocused = var_0_38
	arg_47_0.GridSetHandleMouse = var_0_7
	arg_47_0.EquipOperator = var_0_18
	arg_47_0.GetOperatorFactionAndFocusIndex = var_0_20
	arg_47_0.GetEquippedOperatorFocusIndex = var_0_21
	arg_47_0.HandleButtonPressed = HandleButtonPressed
	arg_47_0.UpdateSuperfactionDisplay = var_0_6
	arg_47_0.SwitchSuperFactions = var_0_16
	arg_47_0.PlayEquippedAnimAndQueueIdle = var_0_17
	arg_47_0.SetSelectedOperator = var_0_32
	arg_47_0.GetSelectedOperator = var_0_33
	arg_47_0.GetFocusedOperatorIndex = var_0_13
	arg_47_0.GetFocusedFactionElement = var_0_11
	arg_47_0.GetFocusedFactionListPosition = var_0_12
	arg_47_0.GetFactionPositionFromIndex = var_0_14
	arg_47_0.GetNumFactionColumns = var_0_15
	arg_47_0.SetPrompt = var_0_41
	arg_47_0.TransitionFinished = var_0_42
	arg_47_0.ShowMWUpsellPopup = var_0_19
	arg_47_0.RefreshFocus = var_0_10

	local var_47_1 = LUI.FlowManager.GetScopedData(arg_47_0)

	if not var_47_1.operatorData then
		var_47_1.operatorData = var_47_1.operatorData or {}
		var_47_1.operatorData.useEquippedOperatorFocusIndex = true
	end

	arg_47_0.currentState = var_47_1.operatorData.currentState or arg_47_2.faction
	arg_47_0.previousState = var_47_1.operatorData.currentState or arg_47_2.faction
	arg_47_0.operators, arg_47_0.factionOrdering = OPERATOR.GetAllOperators(arg_47_1)

	if arg_47_0.currentState == OPERATOR.SuperFaction.WEST then
		Engine.DHFCHIIJCA("character_faction_select_l")
	else
		Engine.DHFCHIIJCA("character_faction_select_r")
	end

	if #Dvar.DHEEJCCJBH("NRLKQRRMKK") == 0 then
		FrontEndScene.SetCharacterVisible(OPERATOR.GetClientCharacterForSuperFaction(arg_47_0.currentState), true)
	end

	MenuUtils.SetupSceneChangeCallback(arg_47_0, var_0_36(arg_47_0, arg_47_1))

	if OPERATOR.GetSelectedOperatorIndex(arg_47_1) == OPERATOR.SuperFaction.WEST then
		ACTIONS.AnimateSequence(arg_47_0, "WestFavorite")
	else
		ACTIONS.AnimateSequence(arg_47_0, "EastFavorite")
	end

	arg_47_0.animationTime = 400
	arg_47_0._needsUpdate = true

	var_0_39(arg_47_0, arg_47_1)
	var_0_40(arg_47_0)
	arg_47_0.OperatorEdit:CreateDynamicLineToClientCharacter()
	arg_47_0:UpdateSuperfactionDisplay(arg_47_1)

	local var_47_2 = ButtonMap.button_shoulderl.string
	local var_47_3 = ButtonMap.button_shoulderr.string

	if arg_47_2.useTriggers then
		var_47_2 = ButtonMap.button_left_trigger.string
		var_47_3 = ButtonMap.button_right_trigger.string
	end

	local var_47_4
	local var_47_5 = {
		iconString = var_47_2
	}
	local var_47_6 = MenuBuilder.BuildRegisteredType("IconImage", var_47_5)

	var_47_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 126, _1080p * 116, _1080p * 152)
	var_47_6:SetRGBFromTable(SWATCHES.tabManager.tabText)

	var_47_6.id = "leftShoulderButton"

	arg_47_0:addElement(var_47_6)

	arg_47_0.leftShoulderButton = var_47_6

	local var_47_7
	local var_47_8 = {
		iconString = var_47_3
	}
	local var_47_9 = MenuBuilder.BuildRegisteredType("IconImage", var_47_8)

	var_47_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 484, _1080p * 520, _1080p * 116, _1080p * 152)
	var_47_9:SetRGBFromTable(SWATCHES.tabManager.tabText)

	var_47_9.id = "rightShoulderButton"

	arg_47_0:addElement(var_47_9)

	arg_47_0.rightShoulderButton = var_47_9

	local var_47_10 = LUI.UIBindButton.new()

	var_47_10.id = "bindButton"

	arg_47_0:addElement(var_47_10)

	arg_47_0.bindButton = var_47_10

	local function var_47_11(arg_49_0, arg_49_1)
		if OPERATOR.SwitchFactionEast(arg_47_0) then
			ACTIONS.AnimateSequence(arg_47_0.EastTab, CONDITIONS.IsMagmaGameMode() and "WZFocused" or "Focused")
			ACTIONS.AnimateSequence(arg_47_0.WestTab, "UnFocused")

			arg_47_0.EastTab.focused = true
			arg_47_0.WestTab.focused = false

			arg_47_0:SwitchSuperFactions(arg_47_1)
		end
	end

	local function var_47_12(arg_50_0, arg_50_1)
		if OPERATOR.SwitchFactionWest(arg_47_0) then
			ACTIONS.AnimateSequence(arg_47_0.WestTab, CONDITIONS.IsMagmaGameMode() and "WZFocused" or "Focused")
			ACTIONS.AnimateSequence(arg_47_0.EastTab, "UnFocused")

			arg_47_0.EastTab.focused = false
			arg_47_0.WestTab.focused = true

			arg_47_0:SwitchSuperFactions(arg_47_1)
		end
	end

	local function var_47_13(arg_51_0, arg_51_1)
		if OPERATOR.SwitchFaction(arg_47_0) then
			arg_47_0:SwitchSuperFactions(arg_47_1)
			arg_47_0:SetPrompt(arg_47_1)
		end
	end

	local function var_47_14(arg_52_0)
		return function(arg_53_0, arg_53_1)
			if var_0_42(arg_47_0) and OPERATOR.IsOperatorSubMenuAvailable(arg_47_0, arg_47_1, arg_52_0) then
				OPERATOR.OpenOperatorSubMenu(arg_47_0, arg_47_1, arg_52_0)
			end
		end
	end

	local function var_47_15(arg_54_0, arg_54_1)
		if var_0_42(arg_47_0) and arg_47_0._isFocusedOperatorUnlocked and OPERATOR.IsOperatorMissionsAvailable(arg_47_0, arg_47_1) and Engine.CJJAFGIFAC(arg_47_1) then
			OPERATOR.OpenOperatorMissions(arg_47_0, arg_47_1, arg_47_0._currentEquippedOperator)
		end
	end

	local function var_47_16(arg_55_0, arg_55_1)
		if var_0_42(arg_47_0) and OPERATOR.IsOperatorBioAvailable(arg_47_0, arg_47_1) then
			OPERATOR.OpenOperatorBio(arg_47_0, arg_47_1)
		end
	end

	local var_47_17 = Engine.DCJHCAFIIA()
	local var_47_18 = OPERATOR.GetConfigString(arg_47_1)

	local function var_47_19(arg_56_0, arg_56_1)
		Engine.DAGFFDGFII("uploadstats", arg_47_1)

		local var_56_0 = OPERATOR.GetConfigString(arg_47_1)

		METRICS.IdentityUsageSendDLogEvent(arg_47_0, arg_47_1, var_47_17, LOOT.itemTypes.OPERATOR, var_47_18, var_56_0)
		Engine.EBCGADABJ()
		ClientCharacter.DDHJHDEHFG(FrontEndScene.ClientCharacters.OperatorWest, 0, 0, 0)
		ClientCharacter.DDHJHDEHFG(FrontEndScene.ClientCharacters.OperatorEast, 0, 0, 0)
		ACTIONS.LeaveMenu(arg_47_0)
	end

	arg_47_0.bindButton:addEventHandler("button_secondary", var_47_19)
	arg_47_0.bindButton:addEventHandler("button_alt1", var_47_15)
	arg_47_0.bindButton:addEventHandler("button_left_stick", var_47_16)
	arg_47_0.bindButton:addEventHandler("button_alt2", var_47_14("OperatorCustomization"))
	arg_47_0.bindButton:addEventHandler("button_right_stick", var_47_14("OperatorShowcase"))
	arg_47_0.bindButton:addEventHandler("button_shoulderr", var_47_11)
	arg_47_0.bindButton:addEventHandler("button_shoulderl", var_47_12)
	arg_47_0.WestTab:addEventHandler("leftmouseup", var_47_12)
	arg_47_0.EastTab:addEventHandler("leftmouseup", var_47_11)
	arg_47_0.OperatorEdit.EditButton:addEventHandler("button_action", var_47_14("OperatorCustomization"))
	arg_47_0.WestTab.TabText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/THE_WEST")))
	arg_47_0.EastTab.TabText:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/THE_EAST")))

	local var_47_20 = OPERATOR.FactionHasNewLoots(arg_47_1, OPERATOR.SuperFaction.WEST)

	arg_47_0.WestTab.NewItemSmallIcon:UpdateAlpha(var_47_20 and 1 or 0, 0, true)

	local var_47_21 = OPERATOR.FactionHasNewLoots(arg_47_1, OPERATOR.SuperFaction.EAST)

	arg_47_0.EastTab.NewItemSmallIcon:UpdateAlpha(var_47_21 and 1 or 0, 0, true)
	arg_47_0:registerEventHandler("clear_new_operator", function(arg_57_0, arg_57_1)
		local var_57_0 = OPERATOR.FactionHasNewLoots(arg_47_1, arg_47_0.currentState)

		if arg_47_0.currentState == OPERATOR.SuperFaction.WEST then
			arg_47_0.WestTab.NewItemSmallIcon:UpdateAlpha(var_57_0 and 1 or 0, 0, true)
		else
			arg_47_0.EastTab.NewItemSmallIcon:UpdateAlpha(var_57_0 and 1 or 0, 0, true)
		end
	end)

	local function var_47_22(arg_58_0, arg_58_1)
		local var_58_0 = LUI.FlowManager.GetScopedData(arg_58_0)

		if LUI.IsLastInputGamepad(arg_58_1.controllerIndex) then
			arg_58_0.rightShoulderButton:SetAlpha(1)
			arg_58_0.leftShoulderButton:SetAlpha(1)
		else
			arg_58_0.rightShoulderButton:SetAlpha(0)
			arg_58_0.leftShoulderButton:SetAlpha(0)
		end

		var_0_38(arg_58_0, arg_58_0._currentChild, arg_47_1)
		arg_58_0:SetPrompt(arg_58_1.controllerIndex)
	end

	arg_47_0:addEventHandler("update_input_type", var_47_22, {
		controllerIndex = arg_47_1
	})
	arg_47_0:addEventHandler("menu_close", function(arg_59_0, arg_59_1)
		ClientCharacter.DDHJHDEHFG(OPERATOR.GetClientCharacterForSuperFaction(arg_59_0.currentState), 0, 0, 0)
	end)
	arg_47_0:addEventHandler("restore_focus", function(arg_60_0, arg_60_1)
		return true
	end)

	if CoD.AspectRatioCompare() == LUI.COMPARE.higher then
		arg_47_0.DarkenerRight:SetAlpha(1)
		LAYOUT.AdjustElementToFadeFrameLeft(arg_47_0.DarkenerLeft)
		LAYOUT.AdjustElementToFadeFrameRight(arg_47_0.DarkenerRight)
	end

	ACTIONS.ScaleFullscreen(arg_47_0.Vignette)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_47_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_47_0, arg_47_1)
	LUI.TextChat.SetupMenuForNoLine(arg_47_0)
	arg_47_0.OperatorSelectChallengesLayout.BundleUpsellButton:SetPreOpenStoreBundlePreviewFunc(function(arg_61_0)
		local var_61_0 = LUI.FlowManager.GetScopedData(arg_47_0)

		var_61_0.operatorData.currentState = arg_47_0.currentState
		var_61_0.operatorData.useSelectedOperatorIndexForFocus = true
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_47_0, "AR")
	end

	local var_47_23 = Onboarding.OperatorMissions.WasCompleted(arg_47_0, arg_47_1)

	local function var_47_24(arg_62_0, arg_62_1)
		if not Onboarding.MilSimOperators.WasCompleted(arg_62_0, arg_62_1) then
			LUI.FlowManager.RequestPopupMenu(arg_62_0, "onboardingfeaturepopup", true, arg_62_1, false, ONBOARDING_DATA.GetOnboardingMilSimOperatorsData())
			Onboarding.MilSimOperators.MarkCompleted(arg_62_0, arg_62_1)
		end
	end

	if not var_47_23 then
		local var_47_25 = ONBOARDING_DATA.GetOnboardingOperatorMissionsData()

		local function var_47_26(arg_63_0, arg_63_1)
			ACTIONS.LeaveMenu(arg_63_0)
			var_47_24(arg_47_0, arg_63_1)
		end

		var_47_25.confirmButton.action = var_47_26

		LUI.FlowManager.RequestPopupMenu(arg_47_0, "onboardingpopup", true, arg_47_1, false, var_47_25)
		Onboarding.OperatorMissions.MarkCompleted(arg_47_0, arg_47_1)
	else
		var_47_24(arg_47_0, arg_47_1)
	end

	if arg_47_0.OperatorSelectChallengesLayout.BundleUpsellButton then
		arg_47_0.OperatorSelectChallengesLayout.BundleUpsellButton:SetUpsellMenu("OperatorSelect")
	end
end

function OperatorSelect(arg_64_0, arg_64_1)
	local var_64_0 = LUI.UIElement.new()

	var_64_0.id = "OperatorSelect"
	var_64_0._animationSets = var_64_0._animationSets or {}
	var_64_0._sequences = var_64_0._sequences or {}

	local var_64_1 = arg_64_1 and arg_64_1.controllerIndex

	if not var_64_1 and not Engine.DDJFBBJAIG() then
		var_64_1 = var_64_0:getRootController()
	end

	assert(var_64_1)

	var_64_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_64_1
	})
	var_64_0.HelperBar.id = "HelperBar"

	var_64_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_64_0.HelperBar:setPriority(10)
	var_64_0:addElement(var_64_0.HelperBar)

	local var_64_2 = var_64_0
	local var_64_3
	local var_64_4 = LUI.UIImage.new()

	var_64_4.id = "Vignette"

	var_64_4:setImage(RegisterMaterial("menu_vignette"), 0)
	var_64_4:Setup9SliceImage(_1080p * 382, _1080p * 353, 0.21, 0.3)
	var_64_0:addElement(var_64_4)

	var_64_0.Vignette = var_64_4

	local var_64_5
	local var_64_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_64_1
	})

	var_64_6.id = "TabBacker"

	var_64_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_64_0:addElement(var_64_6)

	var_64_0.TabBacker = var_64_6

	local var_64_7
	local var_64_8 = LUI.UIImage.new()

	var_64_8.id = "DarkenerLeft"

	var_64_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_64_8:SetAlpha(0.4, 0)
	var_64_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_64_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -1320, 0, 0)
	var_64_0:addElement(var_64_8)

	var_64_0.DarkenerLeft = var_64_8

	local var_64_9
	local var_64_10 = LUI.UIImage.new()

	var_64_10.id = "DarkenerRight"

	var_64_10:SetRGBFromTable(SWATCHES.CAC.evenStripe, 0)
	var_64_10:SetAlpha(0, 0)
	var_64_10:setImage(RegisterMaterial("widg_gradient_right_to_left_strong"), 0)
	var_64_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1320, 0, 0, 0)
	var_64_0:addElement(var_64_10)

	var_64_0.DarkenerRight = var_64_10

	local var_64_11
	local var_64_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_64_1
	})

	var_64_12.id = "MenuTitle"

	var_64_12.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECT_CAPS"), 0)
	var_64_12.Line:SetLeft(0, 0)
	var_64_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_64_0:addElement(var_64_12)

	var_64_0.MenuTitle = var_64_12

	local var_64_13
	local var_64_14 = MenuBuilder.BuildRegisteredType("OperatorDetails", {
		controllerIndex = var_64_1
	})

	var_64_14.id = "OperatorDetails"

	var_64_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 200, _1080p * 700)
	var_64_0:addElement(var_64_14)

	var_64_0.OperatorDetails = var_64_14

	local var_64_15
	local var_64_16 = MenuBuilder.BuildRegisteredType("SubMenuTab", {
		controllerIndex = var_64_1
	})

	var_64_16.id = "WestTab"

	var_64_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 132, _1080p * 302, _1080p * 108, _1080p * 160)
	var_64_0:addElement(var_64_16)

	var_64_0.WestTab = var_64_16

	local var_64_17
	local var_64_18 = MenuBuilder.BuildRegisteredType("SubMenuTab", {
		controllerIndex = var_64_1
	})

	var_64_18.id = "EastTab"

	var_64_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 308, _1080p * 478, _1080p * 108, _1080p * 160)
	var_64_0:addElement(var_64_18)

	var_64_0.EastTab = var_64_18

	local var_64_19
	local var_64_20 = {
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
		controllerIndex = var_64_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("OperatorSelectButtonContainer", {
				controllerIndex = var_64_1
			})
		end,
		refreshChild = function(arg_66_0, arg_66_1, arg_66_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 60,
		spacingY = _1080p * 60,
		columnWidth = _1080p * 234,
		rowHeight = _1080p * 146,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_64_21 = LUI.UIGrid.new(var_64_20)

	var_64_21.id = "OperatorGrid"

	var_64_21:setUseStencil(false)
	var_64_21:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -960, _1080p * 960, _1080p * -232, _1080p * -86)
	var_64_0:addElement(var_64_21)

	var_64_0.OperatorGrid = var_64_21

	local var_64_22
	local var_64_23 = MenuBuilder.BuildRegisteredType("OperatorSelectChallengesLayout", {
		controllerIndex = var_64_1
	})

	var_64_23.id = "OperatorSelectChallengesLayout"

	var_64_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1374, _1080p * 1824, _1080p * 216, _1080p * 666)
	var_64_0:addElement(var_64_23)

	var_64_0.OperatorSelectChallengesLayout = var_64_23

	local var_64_24
	local var_64_25 = MenuBuilder.BuildRegisteredType("OperatorEdit", {
		controllerIndex = var_64_1
	})

	var_64_25.id = "OperatorEdit"

	var_64_25:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_64_25:SetAlpha(0, 0)
	var_64_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1069, _1080p * 1269, _1080p * 251, _1080p * 289)
	var_64_0:addElement(var_64_25)

	var_64_0.OperatorEdit = var_64_25

	local var_64_26
	local var_64_27 = LUI.UIImage.new()

	var_64_27.id = "WestStar"

	var_64_27:SetAlpha(0, 0)
	var_64_27:setImage(RegisterMaterial("favorite"), 0)
	var_64_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 132, _1080p * 181, _1080p * 108, _1080p * 157)
	var_64_0:addElement(var_64_27)

	var_64_0.WestStar = var_64_27

	local var_64_28
	local var_64_29 = LUI.UIImage.new()

	var_64_29.id = "EastStar"

	var_64_29:SetAlpha(0, 0)
	var_64_29:setImage(RegisterMaterial("favorite"), 0)
	var_64_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 308, _1080p * 356, _1080p * 108, _1080p * 157)
	var_64_0:addElement(var_64_29)

	var_64_0.EastStar = var_64_29

	local var_64_30
	local var_64_31 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_64_1
	})

	var_64_31.id = "LobbyMembersFooter"

	var_64_31:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_64_0:addElement(var_64_31)

	var_64_0.LobbyMembersFooter = var_64_31

	local var_64_32
	local var_64_33 = LUI.UIText.new()

	var_64_33.id = "PromptKBM"

	var_64_33:setText(Engine.CBBHFCGDIC("OPERATIONS/EDIT_SKIN"), 0)
	var_64_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_64_33:SetAlignment(LUI.Alignment.Left)
	var_64_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 235, _1080p * 504, _1080p * 749, _1080p * 769)
	var_64_0:addElement(var_64_33)

	var_64_0.PromptKBM = var_64_33

	local var_64_34
	local var_64_35 = LUI.UIText.new()

	var_64_35.id = "PromptPreview"

	var_64_35:setText(Engine.CBBHFCGDIC("OPERATIONS/OPERATOR_PREVIEW"), 0)
	var_64_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_64_35:SetAlignment(LUI.Alignment.Left)
	var_64_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 235, _1080p * 504, _1080p * 783, _1080p * 803)
	var_64_0:addElement(var_64_35)

	var_64_0.PromptPreview = var_64_35

	local var_64_36

	if CONDITIONS.IsInKoreanIGRPaidSession(var_64_0) then
		local var_64_37 = MenuBuilder.BuildRegisteredType("IGROperatorUnlockTip", {
			controllerIndex = var_64_1
		})

		var_64_37.id = "IGROperatorUnlockTip"

		var_64_37:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -182, _1080p * 618, _1080p * -70, 0)
		var_64_0:addElement(var_64_37)

		var_64_0.IGROperatorUnlockTip = var_64_37
	end

	local var_64_38

	if CONDITIONS.IsKoreanIGR(var_64_0) then
		local var_64_39 = MenuBuilder.BuildRegisteredType("IGROperatorUnlockTip", {
			controllerIndex = var_64_1
		})

		var_64_39.id = "IGROperatorUnlockTipCopy0"

		var_64_39:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -182, _1080p * 618, _1080p * -70, 0)
		var_64_0:addElement(var_64_39)

		var_64_0.IGROperatorUnlockTipCopy0 = var_64_39
	end

	local var_64_40
	local var_64_41 = MenuBuilder.BuildRegisteredType("BattlePassSeasonResetStatus", {
		controllerIndex = var_64_1
	})

	var_64_41.id = "BattlePassSeasonResetStatus"

	var_64_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1449, _1080p * 1824, _1080p * 52, _1080p * 132)
	var_64_0:addElement(var_64_41)

	var_64_0.BattlePassSeasonResetStatus = var_64_41

	local var_64_42
	local var_64_43 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_64_1
	})

	var_64_43.id = "NewItemNotification"

	var_64_43:SetAlpha(0, 0)
	var_64_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 348, _1080p * 356, _1080p * 741, _1080p * 749)
	var_64_0:addElement(var_64_43)

	var_64_0.NewItemNotification = var_64_43

	local function var_64_44()
		return
	end

	var_64_0._sequences.DefaultSequence = var_64_44

	local var_64_45
	local var_64_46 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		}
	}

	var_64_14:RegisterAnimationSequence("FadeOut", var_64_46)

	local var_64_47 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_64_23:RegisterAnimationSequence("FadeOut", var_64_47)

	local var_64_48 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_64_25:RegisterAnimationSequence("FadeOut", var_64_48)

	local var_64_49 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_64_33:RegisterAnimationSequence("FadeOut", var_64_49)

	local var_64_50 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_64_35:RegisterAnimationSequence("FadeOut", var_64_50)

	local function var_64_51()
		var_64_14:AnimateSequence("FadeOut")
		var_64_23:AnimateSequence("FadeOut")
		var_64_25:AnimateSequence("FadeOut")
		var_64_33:AnimateSequence("FadeOut")
		var_64_35:AnimateSequence("FadeOut")
	end

	var_64_0._sequences.FadeOut = var_64_51

	local var_64_52
	local var_64_53 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		}
	}

	var_64_14:RegisterAnimationSequence("FadeIn", var_64_53)

	local var_64_54 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_64_23:RegisterAnimationSequence("FadeIn", var_64_54)

	local function var_64_55()
		var_64_14:AnimateSequence("FadeIn")
		var_64_23:AnimateSequence("FadeIn")
	end

	var_64_0._sequences.FadeIn = var_64_55

	local var_64_56
	local var_64_57 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_64_27:RegisterAnimationSequence("WestFavorite", var_64_57)

	local var_64_58 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_64_29:RegisterAnimationSequence("WestFavorite", var_64_58)

	local function var_64_59()
		var_64_27:AnimateSequence("WestFavorite")
		var_64_29:AnimateSequence("WestFavorite")
	end

	var_64_0._sequences.WestFavorite = var_64_59

	local var_64_60
	local var_64_61 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_64_27:RegisterAnimationSequence("EastFavorite", var_64_61)

	local var_64_62 = {
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_64_29:RegisterAnimationSequence("EastFavorite", var_64_62)

	local function var_64_63()
		var_64_27:AnimateSequence("EastFavorite")
		var_64_29:AnimateSequence("EastFavorite")
	end

	var_64_0._sequences.EastFavorite = var_64_63

	local function var_64_64()
		return
	end

	var_64_0._sequences.OnOperatorUnlocked = var_64_64

	local var_64_65
	local var_64_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_64_33:RegisterAnimationSequence("OnOperatorLocked", var_64_66)

	local function var_64_67()
		var_64_33:AnimateSequence("OnOperatorLocked")
	end

	var_64_0._sequences.OnOperatorLocked = var_64_67

	local var_64_68
	local var_64_69 = {
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

	var_64_33:RegisterAnimationSequence("AR", var_64_69)

	local var_64_70 = {
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

	var_64_35:RegisterAnimationSequence("AR", var_64_70)

	local function var_64_71()
		var_64_33:AnimateSequence("AR")
		var_64_35:AnimateSequence("AR")
	end

	var_64_0._sequences.AR = var_64_71

	var_0_43(var_64_0, var_64_1, arg_64_1)

	return var_64_0
end

MenuBuilder.registerType("OperatorSelect", OperatorSelect)
LockTable(_M)
