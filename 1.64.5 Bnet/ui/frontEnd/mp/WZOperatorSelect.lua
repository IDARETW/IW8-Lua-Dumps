module(..., package.seeall)

local var_0_0 = 1

local function var_0_1(arg_1_0)
	return arg_1_0._currentMenu or arg_1_0:GetCurrentMenu(arg_1_0)
end

local function var_0_2(arg_2_0)
	if arg_2_0 == OPERATOR.DEFAULT_FACTION then
		return OPERATOR.Category.MILSIM
	elseif arg_2_0 == OPERATOR.RANDOM_FACTION then
		return OPERATOR.Category.RANDOM
	else
		return OPERATOR.Category.OPERATORS
	end
end

local function var_0_3(arg_3_0)
	return (OPERATOR.GetOperatorIndex(arg_3_0, arg_3_0:GetSelectedOperator()))
end

local function var_0_4(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0.Grid:GetPositionForIndex(arg_4_1, {
		relativePosition = false
	})

	return {
		x = var_4_0.x,
		y = var_4_0.y
	}
end

local function var_0_5(arg_5_0)
	local var_5_0 = OPERATOR.GetOperatorIndex(arg_5_0, arg_5_0:GetSelectedOperator())

	return var_0_4(arg_5_0, var_5_0)
end

local function var_0_6(arg_6_0)
	local var_6_0 = arg_6_0:GetFocusedOperatorListPosition()

	return arg_6_0.Grid:GetElementAtPosition(var_6_0.x, var_6_0.y)
end

local function var_0_7(arg_7_0)
	return arg_7_0.Grid:GetNumColumns()
end

local function var_0_8(arg_8_0)
	return LUI.FlowManager.GetScopedData(arg_8_0).operatorData.westSelectedOperator
end

local function var_0_9(arg_9_0, arg_9_1)
	local var_9_0 = LOOT.WZGetPlayerOperatorFilterPreference(arg_9_1)

	if var_9_0 == LOOT.operatorFilterOptions.MODERN_WARFARE_ONLY then
		return LUI.GAME_SOURCE_ID.MODERN_WARFARE
	elseif var_9_0 == LOOT.operatorFilterOptions.COLD_WAR_ONLY then
		return LUI.GAME_SOURCE_ID.COLD_WAR
	elseif var_9_0 == LOOT.operatorFilterOptions.VANGUARD_ONLY then
		return LUI.GAME_SOURCE_ID.VANGUARD
	else
		return OPERATOR.ALL_GAME_SOURCE_ID
	end
end

local function var_0_10(arg_10_0, arg_10_1)
	ACTIONS.AnimateSequence(arg_10_0.WZOperatorFilter, arg_10_1 and "ShowFavoriteFilter" or "HideFavoriteFilter")

	arg_10_0.WZOperatorFilter.OperatorFilterFavorites.disabled = not arg_10_1

	arg_10_0.WZOperatorFilter.OperatorFilterFavorites:SetFocusable(arg_10_1)
	arg_10_0.WZOperatorFilter.OperatorFilterFavorites:SetHandleMouse(arg_10_1)

	if not arg_10_1 then
		arg_10_0.WZOperatorFilter.OperatorFilterFavorites:SetSelected(false)
	end
end

local function var_0_11(arg_11_0, arg_11_1)
	local var_11_0 = LOOT.WZGetPlayerOperatorFilterPreference(arg_11_1)
	local var_11_1 = var_11_0 == LOOT.operatorFilterOptions.FAVORITES
	local var_11_2 = var_11_0 == LOOT.operatorFilterOptions.MODERN_WARFARE_ONLY
	local var_11_3 = var_11_0 == LOOT.operatorFilterOptions.COLD_WAR_ONLY
	local var_11_4 = var_11_0 == LOOT.operatorFilterOptions.VANGUARD_ONLY
	local var_11_5 = var_11_0 == LOOT.operatorFilterOptions.ALL
	local var_11_6

	if var_11_2 then
		var_11_6 = arg_11_0.operatorsByGameSourceID[LUI.GAME_SOURCE_ID.MODERN_WARFARE]
	elseif var_11_3 then
		var_11_6 = arg_11_0.operatorsByGameSourceID[LUI.GAME_SOURCE_ID.COLD_WAR]
	elseif var_11_4 then
		var_11_6 = arg_11_0.operatorsByGameSourceID[LUI.GAME_SOURCE_ID.VANGUARD]
	else
		var_11_6 = arg_11_0.operatorsByGameSourceID[OPERATOR.ALL_GAME_SOURCE_ID]
	end

	local var_11_7 = {}
	local var_11_8 = 0

	if var_11_1 then
		for iter_11_0, iter_11_1 in pairs(var_11_6) do
			for iter_11_2, iter_11_3 in pairs(arg_11_0._favoriteOperators) do
				if arg_11_0._favoriteOperators[iter_11_1.ref] then
					if var_11_7 then
						table.insert(var_11_7, iter_11_1)

						if OPERATOR.IsUnlocked(arg_11_1, iter_11_1.ref) then
							var_11_8 = var_11_8 + 1
						end
					end

					break
				end
			end
		end

		OPERATOR.InsertRandomOperatorData(arg_11_1, {
			isRandomFavorite = true,
			tableToInsertRandom = var_11_7,
			isRandomFavoriteAvailable = var_11_8 > 1 and #var_11_7 > 1
		})
	end

	local var_11_9 = var_11_7 and #var_11_7 > 0 or arg_11_0._currentFavoriteCount > 0

	var_0_10(arg_11_0, var_11_9)

	if var_11_1 then
		if var_11_9 then
			var_11_6 = var_11_7
		else
			arg_11_0.WZOperatorFilter:SetFilterToDefault()
			arg_11_0.WZOperatorFilter.OperatorFilterAllOperatorsButton:SetSelected(true)
		end
	end

	local var_11_10 = math.min(arg_11_0.Grid:GetMaxVisibleColumns(), #var_11_6) / 2

	arg_11_0.Grid:SetScrollingThreshold(var_11_10 - 1)

	for iter_11_4, iter_11_5 in pairs(var_11_6) do
		iter_11_5.isSelected = OPERATOR.SetIsOperatorSelected(arg_11_1, {
			operatorInfo = iter_11_5
		})
	end

	local var_11_11 = arg_11_0.operatorsByGameSourceID[LUI.GAME_SOURCE_ID.VANGUARD]

	local function var_11_12(arg_12_0, arg_12_1)
		if not var_11_1 then
			local var_12_0 = Engine.CBBHFCGDIC(OPERATOR.GetFactionName(arg_12_0.ref))
			local var_12_1 = Engine.CBBHFCGDIC(OPERATOR.GetFactionName(arg_12_1.ref))

			if var_12_0 ~= var_12_1 then
				return var_12_0 < var_12_1
			end
		end

		local var_12_2 = Engine.CBBHFCGDIC(arg_12_0.name)
		local var_12_3 = Engine.CBBHFCGDIC(arg_12_1.name)

		if arg_12_0.isSelected ~= arg_12_1.isSelected then
			return arg_12_0.isSelected and not arg_12_1.isSelected
		end

		if var_12_2 ~= var_12_3 then
			return var_12_2 < var_12_3
		end
	end

	if var_11_5 then
		local var_11_13 = 1
		local var_11_14

		while var_11_11[var_11_13] do
			if OPERATOR.IsRandomOperator(var_11_11[var_11_13].ref) then
				var_11_14 = var_11_11[var_11_13]

				table.remove(var_11_11, var_11_13)

				break
			else
				var_11_13 = var_11_13 + 1
			end
		end

		local var_11_15 = 1

		while var_11_6[var_11_15] do
			if var_11_6[var_11_15] and OPERATOR.IsS4Operator(var_11_6[var_11_15].ref) then
				table.remove(var_11_6, var_11_15)
			else
				var_11_15 = var_11_15 + 1
			end
		end

		table.sort(var_11_11, var_11_12)

		if var_11_14 ~= nil then
			table.insert(var_11_11, 1, var_11_14)
		end
	end

	table.sort(var_11_6, function(arg_13_0, arg_13_1)
		local var_13_0 = OPERATOR.IsRandomOperator(arg_13_0.ref) or OPERATOR.IsRandomFavOperator(arg_13_0.ref)
		local var_13_1 = OPERATOR.IsRandomOperator(arg_13_1.ref) or OPERATOR.IsRandomFavOperator(arg_13_1.ref)
		local var_13_2 = OPERATOR.IsT9Operator(arg_13_0.ref)
		local var_13_3 = OPERATOR.IsT9Operator(arg_13_1.ref)

		if var_13_0 ~= var_13_1 then
			return var_13_0 and not var_13_1
		elseif var_13_2 ~= var_13_3 then
			return var_13_2 and not var_13_3
		end

		return (var_11_12(arg_13_0, arg_13_1))
	end)

	if var_11_5 then
		for iter_11_6 = #var_11_11, 1, -1 do
			if not OPERATOR.IsRandomOperator(var_11_11[iter_11_6].ref) then
				table.insert(var_11_6, 2, var_11_11[iter_11_6])
			end
		end
	end

	local var_11_16 = {}

	for iter_11_7, iter_11_8 in pairs(var_11_6) do
		iter_11_8.favorited = false

		local var_11_17 = OPERATOR.GetFactionName(iter_11_8.ref)
		local var_11_18 = OPERATOR.IsUnlocked(arg_11_1, iter_11_8.ref)

		iter_11_8.showFactionHeader = false

		if not var_11_16[var_11_17] and iter_11_8.factionRef ~= OPERATOR.RANDOM_FACTION then
			var_11_16[var_11_17] = true

			local var_11_19 = var_11_6[iter_11_7]

			var_11_19.numOperators = 1
			var_11_19.numOperatorsUnlocked = var_11_18 and 1 or 0
			var_11_19.showFactionHeader = not var_11_1
			arg_11_0.factionLead = var_11_19
		elseif iter_11_8.factionRef ~= OPERATOR.RANDOM_FACTION and arg_11_0.factionLead and iter_11_8.factionRef == arg_11_0.factionLead.factionRef then
			arg_11_0.factionLead.numOperators = arg_11_0.factionLead.numOperators + 1

			if var_11_18 then
				arg_11_0.factionLead.numOperatorsUnlocked = arg_11_0.factionLead.numOperatorsUnlocked + 1
			end
		end

		for iter_11_9, iter_11_10 in pairs(arg_11_0._favoriteOperators) do
			if arg_11_0._favoriteOperators[iter_11_8.ref] then
				iter_11_8.favorited = true

				break
			end
		end
	end

	return var_11_6
end

local function var_0_12(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:GetSelectedOperator()

	if #OPERATOR.GetExecutionsForOperator(arg_14_0, var_14_0, arg_14_1) > 0 then
		return true
	end

	if #OPERATOR.GetTauntsForOperator(arg_14_0, var_14_0, arg_14_1) > 0 then
		return true
	end

	if #OPERATOR.GetSkinsForOperator(var_14_0, arg_14_1, true, true) > 0 then
		return true
	end

	return false
end

local function var_0_13(arg_15_0)
	local var_15_0 = LUI.FlowManager.GetScopedData(arg_15_0).operatorData.useEquippedOperatorFocusIndex or false

	for iter_15_0, iter_15_1 in pairs(arg_15_0._currentOperators) do
		if var_15_0 and iter_15_1.isSelected then
			return iter_15_0 - 1
		elseif arg_15_0._currentChild and arg_15_0._currentChild._operatorInfo.ref == iter_15_1.ref then
			return iter_15_0 - 1
		end
	end

	return 0
end

local function var_0_14(arg_16_0, arg_16_1)
	assert(arg_16_0.operatorsByGameSourceID)
	ACTIONS.AnimateSequence(arg_16_0, "GridFadeOut")

	arg_16_0._needsUpdate = true
	arg_16_0._currentOperators = var_0_11(arg_16_0, arg_16_1)

	arg_16_0.Grid:SetNumChildren(#arg_16_0._currentOperators)
	arg_16_0.Grid:RefreshContent()

	local var_16_0 = LOOT.WZGetPlayerOperatorFilterPreference(arg_16_1)

	arg_16_0.ScrollHeader:SetupScrollHeader(arg_16_1, {
		subtractRandomOperator = true,
		operators = arg_16_0._currentOperators
	})
	arg_16_0.Grid:processEvent({
		name = "gain_focus"
	})

	arg_16_0._needsUpdate = false

	local var_16_1 = #arg_16_0._currentOperators <= arg_16_0.Grid:GetMaxVisibleColumns()

	if not LUI.IsLastInputGamepad(arg_16_1) then
		ACTIONS.AnimateSequence(arg_16_0, var_16_1 and "HideArrows" or "ShowArrows")

		arg_16_0.RightArrow.disabled = var_16_1
		arg_16_0.LeftArrow.disabled = var_16_1
	else
		ACTIONS.AnimateSequence(arg_16_0, var_16_1 and "HidePrompts" or "ShowPrompts")
	end

	arg_16_0.Grid:SetFocusedPosition({
		y = 0,
		x = var_0_13(arg_16_0)
	}, true)
	ACTIONS.AnimateSequence(arg_16_0, "GridFadeIn")
end

local function var_0_15(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1.outfitMissionQuests or {}

	arg_17_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetNumChildren(#var_17_0)
	arg_17_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetRefreshChild(function(arg_18_0, arg_18_1, arg_18_2)
		local var_18_0 = arg_18_2 + 1
		local var_18_1 = var_17_0[var_18_0]

		arg_18_0:Setup(var_18_1, var_18_0)
	end)
	arg_17_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid:UpdateDetails(var_17_0)
end

local function var_0_16(arg_19_0, arg_19_1)
	if not arg_19_0._updatedEditLine then
		if not arg_19_0.OperatorEdit.DynamicLine then
			arg_19_0.OperatorEdit:CreateDynamicLineToClientCharacter(arg_19_0)
		end

		local var_19_0 = ClientCharacter.DBDJAAEGDH(arg_19_1)

		arg_19_0.OperatorEdit:UpdateLine(var_19_0)
		arg_19_0.OperatorEdit:SetAlpha(1, 200, LUI.EASING.inSine)

		arg_19_0._updatedEditLine = true
	else
		arg_19_0.OperatorEdit:SetAlpha(1)
	end
end

local function var_0_17(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.isCustomizationAvailable = arg_20_2 and var_0_12(arg_20_0, arg_20_1) or false
	arg_20_0.isPreviewAvailable = not arg_20_2 and OPERATOR.IsOperatorPreviewAvailable(arg_20_0, arg_20_1, "OperatorShowcase", true)
end

local function var_0_18(arg_21_0, arg_21_1)
	local var_21_0

	local function var_21_1()
		local var_22_0 = arg_21_0:GetSelectedOperator()

		if not var_22_0 or not OPERATOR.IsOperatorSubMenuAvailable(arg_21_0, arg_21_1, "OperatorCustomization", true) then
			return
		end

		local var_22_1 = OPERATOR.WZ_OPERATOR_INDEX
		local var_22_2 = OPERATOR.IsUnlocked(arg_21_1, var_22_0)
		local var_22_3 = FrontEndScene.IsSceneFadeComplete(arg_21_1)
		local var_22_4 = FrontEndScene.IsCharacterFullyLoaded(var_22_1)

		if var_22_3 and var_22_4 and (var_22_2 or arg_21_0.isPreviewAvailable) then
			var_0_16(arg_21_0, var_22_1)
		else
			arg_21_0.OperatorEdit:SetAlpha(0)

			arg_21_0:Wait(200, true).onComplete = var_21_1
		end
	end

	var_21_1()
end

local function var_0_19(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_2.isRandom or false
	local var_23_1 = arg_23_2.isRandomFavorite or false
	local var_23_2 = OPERATOR.IsUnlocked(arg_23_1, arg_23_2.ref)
	local var_23_3 = OPERATOR.IsCDLOperator(arg_23_2.ref)

	if var_0_1(arg_23_0) then
		if var_23_2 and arg_23_2.ref ~= arg_23_0._currentEquippedOperator then
			arg_23_0:AddButtonPrompt({
				side = "left",
				priority = 2,
				gamepad_only = true,
				button_ref = "button_primary",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
			})
		else
			arg_23_0:RemoveButtonPrompt({
				side = "left",
				button_ref = "button_primary",
				helper_text = ""
			})
		end

		if not var_23_0 and not var_23_1 then
			arg_23_0:AddButtonPrompt({
				side = "left",
				button_ref = "button_r3",
				priority = 6,
				helper_text = Engine.CBBHFCGDIC(arg_23_2.favorited and "LUA_MENU/SET_UNFAVORITE" or "LUA_MENU/SET_FAVORITE")
			})
			arg_23_0.PromptPreview:setText(Engine.CBBHFCGDIC(arg_23_2.favorited and "OPERATIONS/OPERATOR_UNFAVORITE" or "OPERATIONS/OPERATOR_FAVORITE"))
		else
			arg_23_0:RemoveButtonPrompt({
				side = "left",
				button_ref = "button_r3",
				helper_text = ""
			})
		end

		if OPERATOR.IsDefaultOperator(arg_23_2.ref) or var_23_0 or var_23_1 or var_23_3 then
			arg_23_0:RemoveButtonPrompt({
				side = "left",
				button_ref = "button_l3",
				helper_text = ""
			})
		else
			arg_23_0:AddButtonPrompt({
				side = "left",
				button_ref = "button_l3",
				priority = 5,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_BIO")
			})
		end
	end
end

local function var_0_20(arg_24_0, arg_24_1)
	local var_24_0 = LUI.FlowManager.GetScopedData(arg_24_0)

	if not var_24_0 or not var_24_0.operatorData or not var_24_0.operatorData.useEquippedOperatorFocusIndex then
		var_0_19(arg_24_0, arg_24_1, arg_24_0._currentChild._operatorInfo)
	else
		local var_24_1 = OPERATOR.GetEquippedOperatorIndex(arg_24_0, arg_24_1) + 1
		local var_24_2 = arg_24_0._currentOperators[var_24_1]

		var_0_19(arg_24_0, arg_24_1, var_24_2)
	end
end

local function var_0_21(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1.factionRef == OPERATOR.RANDOM_FACTION

	if not var_25_0 then
		arg_25_0.WZOperatorSelectSnipe:SetSnipeIcon(arg_25_1.ref)
	end

	arg_25_0.WZOperatorSelectSnipe:SetAlpha(var_25_0 and 0 or 1)
end

local function var_0_22(arg_26_0, arg_26_1)
	local var_26_0 = LUI.FlowManager.GetScopedData(arg_26_0)

	var_26_0.operatorData.westSelectedOperator = arg_26_1.ref
	var_26_0.operatorData.westSelectedOperatorOutfitMissionQuests = arg_26_1.outfitMissionQuests
	var_26_0.operatorData.westSelectedOperatorChallenges = arg_26_1.challenges
end

local function var_0_23(arg_27_0)
	if arg_27_0.WZOperatorSelectChallengesLayout and arg_27_0.WZOperatorSelectChallengesLayout.BundleUpsellButton then
		return arg_27_0.WZOperatorSelectChallengesLayout.BundleUpsellButton._isVisible
	end

	return false
end

local function var_0_24(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4)
	local var_28_0 = arg_28_2.ref

	ACTIONS.AnimateSequence(arg_28_0, "OnOperatorUnlocked")

	if not Engine.CJJAFGIFAC(arg_28_1) then
		arg_28_0.WZOperatorSelectChallengesLayout:SetAlpha(0)
	else
		local var_28_1 = OPERATOR.IsS4Operator(var_28_0)

		if var_28_1 and arg_28_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.WZWipSelectOperatorProgress then
			arg_28_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.WZWipSelectOperatorProgress:SetupProgression(var_28_0)
		end

		if arg_28_3 and #arg_28_3 > 0 then
			ACTIONS.AnimateSequence(arg_28_0.WZOperatorSelectChallengesLayout, "OnOperatorUnlockedWithMissions")
			ACTIONS.AnimateSequence(arg_28_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid, "OnOperatorUnlocked")

			arg_28_0.WZOperatorSelectChallengesLayout._missionGridShown = true

			arg_28_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetMouseFocusBlocker(false)
		elseif arg_28_4 and #arg_28_4 > 0 then
			ACTIONS.AnimateSequence(arg_28_0.WZOperatorSelectChallengesLayout, "OnOperatorUnlockedWithMissions")
			ACTIONS.AnimateSequence(arg_28_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid, "OnOperatorUnlockedVGWithMissions")

			arg_28_0.WZOperatorSelectChallengesLayout._missionGridShown = true

			arg_28_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetMouseFocusBlocker(false)
		elseif var_28_1 then
			ACTIONS.AnimateSequence(arg_28_0.WZOperatorSelectChallengesLayout, "OnOperatorUnlockedWithMissions")
			ACTIONS.AnimateSequence(arg_28_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid, "OnOperatorUnlockedVG")

			arg_28_0.WZOperatorSelectChallengesLayout._missionGridShown = true

			arg_28_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetMouseFocusBlocker(false)
		else
			ACTIONS.AnimateSequence(arg_28_0.WZOperatorSelectChallengesLayout, "OnOperatorUnlocked")

			arg_28_0.WZOperatorSelectChallengesLayout._missionGridShown = false

			arg_28_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetMouseFocusBlocker(true)
		end

		arg_28_0.WZOperatorSelectChallengesLayout:UpdateDividerVisibility()
	end

	arg_28_0.OperatorEdit.EditButton:SetButtonDisabled(false)

	local var_28_2 = OPERATOR.GetLootIDFromRef(var_28_0)

	assert(var_28_2)

	if var_28_2 and #var_28_2 > 0 then
		if Loot.HDJCADADF(arg_28_1, var_28_2) then
			local var_28_3 = LUI.FlowManager.GetScopedData(arg_28_0)

			var_28_3.currentFilter = arg_28_0.WZOperatorFilter:GetCurrentFilter()

			if not LOOT.HideLootBreadcrumbsCondition(true) then
				var_28_3.operatorData.currentState = OPERATOR.WZ_OPERATOR_INDEX
				var_28_3.operatorData.useSelectedOperatorIndexForFocus = true
				var_28_3.operatorData.useEquippedOperatorFocusIndex = false
			end
		end
	elseif var_28_2 == "" then
		DebugPrint("WARNING: Missing OperatorID for " .. var_28_0 .. " in WZOperatorSelect:OnOperatorUnlockedChildFocused().")
	end
end

local function var_0_25(arg_29_0, arg_29_1, arg_29_2)
	if not Engine.CJJAFGIFAC(arg_29_1) then
		arg_29_0.WZOperatorSelectChallengesLayout:SetAlpha(0)
	else
		ACTIONS.AnimateSequence(arg_29_0.WZOperatorSelectChallengesLayout, "OnOperatorLocked")
	end

	ACTIONS.AnimateSequence(arg_29_0, "OnOperatorLocked")
	arg_29_0.OperatorEdit.EditButton:SetButtonDisabled(true)

	if var_0_1(arg_29_0) then
		arg_29_0:RemoveButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			helper_text = ""
		})
		arg_29_0:RemoveButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			helper_text = ""
		})
	end

	arg_29_0.WZOperatorSelectChallengesLayout.OperatorSelectChallengesLayoutMissionGrid.Grid:SetMouseFocusBlocker(true)
end

local function var_0_26(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = true

	if arg_30_0._currentChild then
		var_30_0 = arg_30_0._currentChild._operatorRef ~= arg_30_1._operatorRef

		if arg_30_0._needsUpdate then
			var_30_0 = arg_30_0._needsUpdate
		end
	end

	if var_30_0 then
		arg_30_0._currentChild = arg_30_1

		local var_30_1 = arg_30_0._currentOperators[arg_30_1._operatorIndex]

		assert(var_30_1)

		arg_30_0.operatorInfo = var_30_1

		arg_30_0:SetSelectedOperator(var_30_1)
		OPERATOR.RequestStreamingModels(arg_30_0, arg_30_2, {
			child = arg_30_1
		})

		if not var_30_1.isRandom or not var_30_1.operatorPose then
			local var_30_2 = arg_30_0._idleAnimationsTable[var_30_1.ref]
		end

		local var_30_3 = LUI.FlowManager.GetScopedData(arg_30_0)
		local var_30_4 = OPERATOR.OperatorHasNewLoots(arg_30_2, var_30_1.ref)

		if LUI.IsLastInputGamepad(arg_30_2) then
			arg_30_0.NewItemNotification:SetAlpha(0)
			arg_30_0.OperatorEdit:UpdateNewItemNotification(var_30_4)
		else
			arg_30_0.OperatorEdit:UpdateNewItemNotification(0)
			arg_30_0.NewItemNotification:UpdateAlpha(var_30_4 and 1 or 0, 0, true)
		end

		OPERATOR.SetSceneCharacterModel(arg_30_0, arg_30_2, {
			showARandomSkin = true,
			element = arg_30_0.WZOperatorDetails,
			operatorInfo = var_30_1,
			previousMenu = var_30_3.menuName,
			menuRef = arg_30_0
		})
		arg_30_0.WZOperatorDetails:SetOperatorDetails(arg_30_2, {
			operatorInfo = var_30_1
		})
		arg_30_0.WZOperatorDetails:UpdateEquippedWidget(arg_30_2, var_30_1)
		var_0_21(arg_30_0, var_30_1)

		local var_30_5 = OPERATOR.IsUnlocked(arg_30_2, var_30_1.ref)

		arg_30_0._isFocusedOperatorUnlocked = var_30_5

		var_0_17(arg_30_0, arg_30_2, var_30_5)

		if var_30_5 then
			var_0_24(arg_30_0, arg_30_2, var_30_1, var_30_1.outfitMissionQuests, var_30_1.challenges)
		else
			var_0_25(arg_30_0, arg_30_2, var_30_1.ref)
		end

		var_0_19(arg_30_0, arg_30_2, var_30_1)
		arg_30_0.WZOperatorSelectChallengesLayout:SetData(var_30_1, var_30_5)

		if not Dvar.IBEGCHEFE("LTSNLQNRKO") then
			arg_30_0.WZOperatorSelectChallengesLayout.BundleUpsellButton:HideButton()
		else
			arg_30_0.WZOperatorSelectChallengesLayout.BundleUpsellButton:SetupUpsellButton(arg_30_2, LOOT.itemTypes.OPERATOR, var_30_1.ref)
		end

		if var_30_3.menuName == "OperatorShowcase" then
			var_30_3.menuName = nil
		else
			OPERATOR.OnEquippedOperatorFocused(arg_30_0, arg_30_2, {
				child = arg_30_1
			})
		end

		arg_30_0:SetPrompt(arg_30_2)
	end
end

local function var_0_27(arg_31_0, arg_31_1)
	return function(arg_32_0, arg_32_1)
		local var_32_0 = LUI.FlowManager.GetScopedData(arg_31_0)

		if var_32_0 then
			var_32_0.operatorData.useEquippedOperatorFocusIndex = true
			var_32_0.operatorData.useSelectedOperatorIndexForFocus = false
			var_32_0.operatorData.randomSkins = nil
		end

		local var_32_1 = LUI.FlowManager.GetScopedData(arg_31_0)

		FrontEndScene.SetCharacterVisible(OPERATOR.WZ_OPERATOR_INDEX, false)
		arg_31_0:RemoveButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			helper_text = ""
		})
		arg_31_0:RemoveButtonPrompt({
			side = "left",
			button_ref = "button_left_trigger",
			helper_text = ""
		})
	end
end

local function var_0_28(arg_33_0)
	return function(arg_34_0, arg_34_1)
		Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
		OPERATOR.ClearOperatorBreadcrumbs(arg_34_1.controller)
		LOOT.ClearTabBreadcrumb(arg_33_0)
		arg_33_0.Grid:processEvent({
			name = "clear_new"
		})

		if var_0_1(arg_33_0) then
			arg_33_0:RemoveButtonPrompt({
				side = "left",
				button_ref = "button_left_trigger",
				helper_text = ""
			})
		end
	end
end

local function var_0_29(arg_35_0, arg_35_1)
	arg_35_0.OperatorEdit:SetAlpha(0)
	arg_35_0.PromptKBM:SetAlpha(0)
	arg_35_0.NewItemNotification:SetAlpha(0)
	arg_35_0.PromptPreview:SetAlpha(0)

	if OPERATOR.IsOperatorSubMenuAvailable(arg_35_0, arg_35_1, "OperatorCustomization", true) or arg_35_0.isPreviewAvailable then
		local var_35_0 = arg_35_0:GetSelectedOperator()
		local var_35_1

		var_35_1 = var_35_0 and OPERATOR.IsDefaultOperator(var_35_0)

		local var_35_2 = not Engine.GEHBEDCEC() or arg_35_0.isCustomizationAvailable

		arg_35_0.OperatorEdit.EditText:setText(Engine.CBBHFCGDIC(arg_35_0.isCustomizationAvailable and "OPERATIONS/EDIT_SKIN" or "OPERATIONS/OPERATOR_PREVIEW"))
		arg_35_0.PromptKBM:setText(Engine.CBBHFCGDIC(arg_35_0.isCustomizationAvailable and "OPERATIONS/EDIT_SKIN" or "OPERATIONS/OPERATOR_PREVIEW"))
		arg_35_0.OperatorEdit:processEvent({
			name = "update_input_type",
			controllerIndex = arg_35_1
		})

		if LUI.IsLastInputGamepad(arg_35_1) then
			if var_35_2 or arg_35_0.isPreviewAvailable then
				var_0_18(arg_35_0, arg_35_1)
			end
		else
			arg_35_0.OperatorEdit:SetAlpha(0)

			if var_35_2 or arg_35_0.isPreviewAvailable then
				arg_35_0.PromptKBM:SetAlpha(1)
			end

			arg_35_0.PromptPreview:SetAlpha(1)
		end
	end
end

local function var_0_30(arg_36_0, arg_36_1, arg_36_2)
	if OPERATOR.IsOperatorSubMenuAvailable(arg_36_0, arg_36_1, arg_36_2) then
		local var_36_0 = arg_36_2 == "OperatorCustomization" and not arg_36_0.isCustomizationAvailable

		if var_36_0 and not arg_36_0.isPreviewAvailable then
			return
		end

		if var_36_0 and arg_36_0.isPreviewAvailable then
			arg_36_2 = "OperatorShowcase"
		end

		LUI.FlowManager.GetScopedData(arg_36_0).currentFilter = arg_36_0.WZOperatorFilter:GetCurrentFilter()

		OPERATOR.OpenOperatorSubMenu(arg_36_0, arg_36_1, {
			subMenuName = arg_36_2
		})
	end
end

local function var_0_31(arg_37_0)
	return function(arg_38_0, arg_38_1)
		local var_38_0 = arg_37_0._isFocusedOperatorUnlocked and OPERATOR.IsOperatorMissionsAvailable(arg_37_0, arg_38_1.controller) and Engine.CJJAFGIFAC(arg_38_1.controller)

		if not var_38_0 then
			Engine.BJDBIAGIDA(SOUND_SETS.default.deny)

			return
		end

		if var_38_0 and Dvar.IBEGCHEFE("TMRRKNKQ") and CONDITIONS.IsWZWipFlowEnabled() then
			OPERATOR.OpenOperatorInformationMenu(arg_37_0, arg_38_1.controller, {
				startTabIndex = OPERATOR.OPERATOR_INFO_TAB_DATA.MISSION.index
			})

			return
		end

		if var_38_0 then
			OPERATOR.OpenOperatorMissions(arg_37_0, arg_38_1.controller, arg_37_0._currentEquippedOperator)
		end
	end
end

local function var_0_32(arg_39_0, arg_39_1)
	arg_39_0.WZOperatorSelectChallengesLayout.OperatorChallenges.WZOperatorUpsellPrompt:OnPerformPromptAction(arg_39_1)
end

local function var_0_33(arg_40_0, arg_40_1)
	local var_40_0 = LUI.FlowManager.GetScopedData(arg_40_0)

	var_40_0.operatorData.useEquippedOperatorFocusIndex = true
	var_40_0.operatorData.useSelectedOperatorIndexForFocus = false

	arg_40_0.Grid:SetNumChildren(0)
	arg_40_0.Grid:RefreshContent()
	var_0_14(arg_40_0, arg_40_1.controllerIndex)
end

local function var_0_34(arg_41_0, arg_41_1)
	if not var_0_23(arg_41_0) then
		local var_41_0 = LUI.FlowManager.GetScopedData(arg_41_0)

		var_41_0.operatorData.useEquippedOperatorFocusIndex = false
		var_41_0.operatorData.useSelectedOperatorIndexForFocus = true

		if LUI.IsLastInputKeyboardMouse(arg_41_1.controller) then
			Engine.BJDBIAGIDA(SOUND_SETS.default.action)
		end

		var_0_32(arg_41_0, arg_41_1.controller)
	end
end

local function var_0_35(arg_42_0, arg_42_1, arg_42_2)
	OPERATOR.CheckValidOperatorParams(arg_42_2)
	OPERATOR.EquipOperator(arg_42_0, arg_42_1, {
		operatorInfo = arg_42_2.operatorInfo,
		updateCallbackFunction = function(arg_43_0, arg_43_1, arg_43_2)
			var_0_19(arg_43_0, arg_43_1, arg_43_2.operatorInfo)
			arg_43_0.WZOperatorDetails:UpdateEquippedWidget(arg_43_1, arg_43_2.operatorInfo)
		end
	})
end

local function var_0_36(arg_44_0)
	arg_44_0.WZOperatorFilter:SetFavoriteCount(arg_44_0._currentFavoriteCount)
end

local function var_0_37(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_0._currentChild
	local var_45_1 = LOOT.WZGetPlayerOperatorFilterPreference(arg_45_1.controller) == LOOT.operatorFilterOptions.FAVORITES and not arg_45_0.WZOperatorFilter.OperatorFilterFavorites.disabled

	OPERATOR.SetFavorite(arg_45_0, arg_45_1.controller, {
		operator = arg_45_0._currentChild,
		currentFavorites = arg_45_0._favoriteOperators,
		currentCount = arg_45_0._currentFavoriteCount,
		onUnsuccessful = function(arg_46_0)
			ACTIONS.AnimateSequence(arg_46_0, "ShowFavoriteWarning")
			arg_46_0.WZOperatorFilter:AnimateFilterDisplay({
				doWarning = true,
				targetFilter = arg_46_0.WZOperatorFilter.OperatorFilterFavorites
			})
		end,
		onSuccessfulRemoval = function(arg_47_0, arg_47_1)
			arg_47_0._favoriteOperators = arg_47_1.updatedFavorites
			arg_47_0._currentFavoriteCount = arg_47_1.favoriteCount

			arg_47_0.WZOperatorFilter:AnimateFilterDisplay({
				targetFilter = arg_47_0.WZOperatorFilter.OperatorFilterFavorites,
				isSelected = var_45_1
			})
		end,
		onSuccessfulAdd = function(arg_48_0, arg_48_1)
			arg_48_0._favoriteOperators = arg_48_1.updatedFavorites
			arg_48_0._currentFavoriteCount = arg_48_1.favoriteCount

			ACTIONS.AnimateSequence(arg_48_0.WZOperatorFilter, "ShowFavoriteFilter")
			arg_48_0.WZOperatorFilter:AnimateFilterDisplay({
				targetFilter = arg_48_0.WZOperatorFilter.OperatorFilterFavorites,
				isSelected = var_45_1
			})
		end
	})

	if var_45_1 then
		var_0_14(arg_45_0, arg_45_1.controller)
	end

	arg_45_0.WZOperatorDetails:SetFavoriteStatus({
		isFavorite = var_45_0._operatorInfo.favorited
	})

	local var_45_2 = RANDOM.GetFavoriteEnabled(arg_45_1.controller)
	local var_45_3 = arg_45_0._currentFavoriteCount == 0
	local var_45_4 = var_45_2 and arg_45_0._currentFavoriteCount == 1

	var_0_10(arg_45_0, not var_45_3)

	if var_45_4 then
		RANDOM.SetEnabled(arg_45_1.controller, LOOT.itemTypes.OPERATOR, false, {
			operatorFaction = OPERATOR.WZ_OPERATOR_INDEX
		})
		var_0_35(arg_45_0, arg_45_1.controller, {
			operatorInfo = RANDOM.GetItemData(arg_45_1.controller, {
				itemType = LOOT.itemTypes.OPERATOR
			})
		})
	end

	if var_45_1 and var_45_3 then
		arg_45_0.WZOperatorFilter.OperatorFilterAllOperatorsButton:SetSelected(true)
		arg_45_0.WZOperatorFilter:SetFilterToDefault()
		arg_45_0.WZOperatorFilter:UpdateCategoryButtons()
	end

	var_0_36(arg_45_0)
	var_0_19(arg_45_0, arg_45_1.controller, var_45_0._operatorInfo)
end

local function var_0_38(arg_49_0, arg_49_1)
	if OPERATOR.IsOperatorBioAvailable(arg_49_0, arg_49_1) then
		local var_49_0 = var_0_6(arg_49_0).Button._factionRef

		return (OPERATOR.GetOperatorsByFactionRef(arg_49_0.operatorsByGameSourceID[OPERATOR.ALL_GAME_SOURCE_ID], var_49_0))
	end

	return nil
end

local function var_0_39(arg_50_0, arg_50_1)
	if OPERATOR.IsOperatorBioAvailable(arg_50_0, arg_50_1.controller) then
		if Dvar.IBEGCHEFE("TMRRKNKQ") and CONDITIONS.IsWZWipFlowEnabled() then
			OPERATOR.OpenOperatorInformationMenu(arg_50_0, arg_50_1.controller)
		else
			OPERATOR.OpenOperatorBio(arg_50_0, arg_50_1.controller, {
				associates = arg_50_0:GetOperatorAssociates(arg_50_1.controller)
			})
		end
	end
end

local function var_0_40(arg_51_0, arg_51_1)
	if arg_51_0.WZOperatorSelectChallengesLayout and arg_51_0.WZOperatorSelectChallengesLayout.BundleUpsellButton then
		arg_51_0.WZOperatorSelectChallengesLayout.BundleUpsellButton:OpenBundle(arg_51_1)
	end
end

local function var_0_41(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_1.element
	local var_52_1 = var_52_0._operatorInfo.ref
	local var_52_2 = LOOT.IsUnlocked(arg_52_1.controller, LOOT.itemTypes.OPERATOR, var_52_1)
	local var_52_3 = IsPrivateMatch() and OPERATOR.IsUnlockedInPrivate(var_52_1)
	local var_52_4 = false

	if CONDITIONS.IsInKoreanIGRPaidSession() then
		var_52_4 = OPERATOR.IsUnlockedInIGR(var_52_1)
	end

	if var_52_0.disabled then
		if var_0_23(arg_52_0) then
			var_0_40(arg_52_0, arg_52_1.controller)

			if LUI.IsLastInputKeyboardMouse(arg_52_1.controller) then
				Engine.BJDBIAGIDA(SOUND_SETS.default.action)
			end
		else
			local var_52_5 = OPERATOR.IsT9Operator(var_52_1)
			local var_52_6 = OPERATOR.IsS4Operator(var_52_1)
			local var_52_7

			var_52_7 = Dvar.IBEGCHEFE("RONTRKPRP") == true

			local var_52_8 = Dvar.IBEGCHEFE("MKLPPNMKMR") == true

			if var_52_6 and not var_52_2 and not var_52_8 then
				var_0_34(arg_52_0, arg_52_1)
			else
				Engine.BJDBIAGIDA(SOUND_SETS.default.deny)
			end
		end
	elseif var_52_2 or var_52_3 or var_52_4 then
		var_0_35(arg_52_0, arg_52_1.controller, {
			operatorInfo = var_52_0._operatorInfo
		})
		var_52_0:SetSelected(true)
	end
end

local function var_0_42(arg_53_0, arg_53_1)
	local function var_53_0(arg_54_0, arg_54_1)
		return function()
			local var_55_0 = LUI.FlowManager.GetScopedData(arg_54_0)
			local var_55_1 = var_55_0.operatorData.useEquippedOperatorFocusIndex or false
			local var_55_2 = var_55_0.operatorData.useSelectedOperatorIndexForFocus or false
			local var_55_3 = RANDOM.IsEnabled(arg_54_1, LOOT.itemTypes.OPERATOR, {
				operatorFaction = OPERATOR.WZ_OPERATOR_INDEX
			})
			local var_55_4 = RANDOM.GetFavoriteEnabled(arg_54_1)
			local var_55_5 = LOOT.WZGetPlayerOperatorFilterPreference(arg_54_1)
			local var_55_6 = var_0_9(arg_54_0, arg_54_1)
			local var_55_7
			local var_55_8 = var_55_5 == LOOT.operatorFilterOptions.FAVORITES or var_55_4

			local function var_55_9(arg_56_0)
				if arg_56_0 ~= nil then
					local var_56_0 = OPERATOR.GetOperatorGameSourceID(arg_56_0)

					if var_55_6 == OPERATOR.ALL_GAME_SOURCE_ID or var_55_6 == var_56_0 then
						return OPERATOR.GetOperatorIndex(arg_54_0, arg_56_0)
					end
				end

				return nil
			end

			if var_55_3 then
				var_55_7 = var_0_13(arg_54_0)
			elseif var_55_1 then
				local var_55_10 = OPERATOR.GetEquippedOperatorFromPlayerData(arg_54_0, arg_54_1)

				var_55_7 = var_55_9(var_55_10)
			elseif var_55_2 then
				local var_55_11 = var_0_8(arg_54_0)

				var_55_7 = var_55_9(var_55_11)
			end

			if var_55_7 == nil then
				var_55_7 = var_0_0
			end

			if var_55_8 then
				return {
					y = 0,
					x = var_0_13(arg_54_0)
				}
			end

			return arg_54_0.Grid:GetPositionForIndex(var_55_7, {
				relativePosition = false
			})
		end
	end

	arg_53_0.Grid:SetRefreshChild(function(arg_57_0, arg_57_1, arg_57_2)
		local var_57_0 = arg_57_1 + arg_57_2 * arg_53_0.Grid:GetNumColumns()

		if var_57_0 == nil or not arg_53_0._currentOperators then
			return
		end

		local var_57_1 = var_57_0 + 1
		local var_57_2 = arg_53_0._currentOperators[var_57_1]
		local var_57_3 = var_0_2(var_57_2.factionRef)

		arg_57_0._column = arg_57_1

		arg_57_0:SetupButton(arg_53_1, var_57_3, var_57_1, var_57_2, arg_53_0)
		arg_57_0:SetButtonDisplay()
	end)
	arg_53_0.Grid:SetDefaultFocus(var_53_0(arg_53_0, arg_53_1))
	var_0_14(arg_53_0, arg_53_1)
	GRID.SetUpArrowScrolling(arg_53_0, arg_53_1, {
		doProcessDisabledItemClick = true,
		doProcessItemClick = true,
		scrollStepsForward = arg_53_0.Grid:GetMaxVisibleColumns() / 4,
		bindButtonInput = {
			button_secondary = var_0_27,
			button_alt1 = var_0_34,
			button_alt2 = function(arg_58_0, arg_58_1)
				var_0_30(arg_58_0, arg_58_1.controller, "OperatorCustomization")
			end,
			button_left_stick = var_0_39,
			button_right_stick = var_0_37
		},
		kbmArrowUI = {
			leftArrow = arg_53_0.LeftArrow,
			rightArrow = arg_53_0.RightArrow
		}
	})
end

local function var_0_43(arg_59_0)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_59_0, "AR")
	end
end

local function var_0_44(arg_60_0, arg_60_1)
	local var_60_0 = LUI.FlowManager.GetScopedData(arg_60_0)

	if not var_60_0.operatorData then
		var_60_0.operatorData = var_60_0.operatorData or {}
		var_60_0.operatorData.useEquippedOperatorFocusIndex = true
	end

	var_60_0.controllerIndex = arg_60_1
	arg_60_0.isCustomizationAvailable = false
	arg_60_0.currentState = OPERATOR.WZ_OPERATOR_INDEX
	arg_60_0.previousState = OPERATOR.WZ_OPERATOR_INDEX
	arg_60_0.operatorsByGameSourceID = OPERATOR.GetWarzoneOperators(arg_60_1)
end

local function var_0_45(arg_61_0, arg_61_1)
	local var_61_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_61_1
	})

	var_61_0:SetLimits(-2, 2, -2, 2)
	var_61_0:SetSwayValues(2000, 0.06, 0.1)
	arg_61_0:addElement(var_61_0)
end

local function var_0_46(arg_62_0, arg_62_1)
	local function var_62_0(arg_63_0, arg_63_1)
		local var_63_0 = Onboarding.MilSimOperators.WasCompleted(arg_63_0, arg_63_1)

		if not CONDITIONS.IsMagmaGameMode() and not var_63_0 then
			local var_63_1 = ONBOARDING_DATA.GetOnboardingMilSimOperatorsData()

			function var_63_1.confirmButton.action(arg_64_0, arg_64_1)
				ACTIONS.LeaveMenu(arg_64_0)
			end

			LUI.FlowManager.RequestPopupMenu(arg_63_0, "onboardingfeaturepopup", true, arg_63_1, false, var_63_1)
			Onboarding.MilSimOperators.MarkCompleted(arg_63_0, arg_63_1)
		end
	end

	local function var_62_1(arg_65_0, arg_65_1)
		if not Onboarding.OperatorMissions.WasCompleted(arg_65_0, arg_65_1) then
			local var_65_0

			if CONDITIONS.IsWZWipOperatorFlowEnabled() then
				var_65_0 = ONBOARDING_DATA.GetOnboardingCH2WZOperatorMissionsData()
			else
				var_65_0 = ONBOARDING_DATA.GetOnboardingOperatorMissionsData()
			end

			function var_65_0.confirmButton.action(arg_66_0, arg_66_1)
				ACTIONS.LeaveMenu(arg_66_0)
				var_62_0(arg_65_0, arg_66_1)
			end

			LUI.FlowManager.RequestPopupMenu(arg_65_0, "onboardingpopup", true, arg_65_1, false, var_65_0)
			Onboarding.OperatorMissions.MarkCompleted(arg_65_0, arg_65_1)
		else
			var_62_0(arg_65_0, arg_65_1)
		end
	end

	;(function(arg_67_0, arg_67_1)
		local var_67_0 = CONDITIONS.IsWZWipOperatorFlowEnabled()
		local var_67_1 = Onboarding.WZSplitLoadoutAndCWOperators.WasCompleted(arg_67_0, arg_67_1)

		if var_67_0 and not var_67_1 then
			local var_67_2 = ONBOARDING_DATA.GetOnboardingWZCWOperatorsData()

			function var_67_2.confirmButton.action(arg_68_0, arg_68_1)
				ACTIONS.LeaveMenu(arg_68_0)
				var_62_1(arg_67_0, arg_68_1)
			end

			LUI.FlowManager.RequestPopupMenu(arg_67_0, "onboardingpopup", true, arg_67_1, false, var_67_2)
			Onboarding.WZSplitLoadoutAndCWOperators.MarkCompleted(arg_67_0, arg_67_1)
		else
			var_62_1(arg_67_0, arg_67_1)
		end
	end)(arg_62_0, arg_62_1)
end

local function var_0_47(arg_69_0, arg_69_1)
	local var_69_0 = LUI.UIBindButton.new()

	var_69_0.id = "bindButton"

	arg_69_0:addElement(var_69_0)

	arg_69_0.bindButton = var_69_0

	arg_69_0.bindButton:addEventHandler("button_right_trigger", var_0_31(arg_69_0))
	arg_69_0.bindButton:addEventHandler("button_left_trigger", var_0_28(arg_69_0))
	arg_69_0.OperatorEdit.EditButton:addEventHandler("button_action", var_0_30(arg_69_0, arg_69_1, "OperatorCustomization"))
	arg_69_0:addEventHandler("operator_filter_changed", var_0_33)
	arg_69_0:addEventHandler("grid_item_clicked", var_0_41)
	arg_69_0:addEventHandler(LUI.TabManager.TAB_SWITCH_EVENT, var_0_27(arg_69_0, arg_69_1))
	arg_69_0:addEventHandler("tab_create", function(arg_70_0, arg_70_1)
		arg_69_0._currentMenu = var_0_1(arg_69_0)

		var_0_42(arg_69_0, arg_69_1)
	end)
end

local function var_0_48(arg_71_0)
	if arg_71_0.WZOperatorSelectChallengesLayout.BundleUpsellButton then
		arg_71_0.WZOperatorSelectChallengesLayout.BundleUpsellButton:SetUpsellMenu("WZOperatorSelect")
		arg_71_0.WZOperatorSelectChallengesLayout.BundleUpsellButton:SetPreOpenStoreBundlePreviewFunc(function(arg_72_0)
			local var_72_0 = LUI.FlowManager.GetScopedData(arg_71_0)

			var_72_0.operatorData.currentState = OPERATOR.WZ_OPERATOR_INDEX
			var_72_0.operatorData.useSelectedOperatorIndexForFocus = true
		end)
	end
end

local function var_0_49(arg_73_0, arg_73_1, arg_73_2)
	FrontEndScene.HideAllCharacters()
	Engine.EBCGADABJ()
	Streaming.BDDBGGIC(true)

	arg_73_0.UpdateGrid = var_0_14
	arg_73_0.UpdateButtonPrompts = var_0_20
	arg_73_0.OnChildFocused = var_0_26
	arg_73_0.GetOperatorPositionFromIndex = var_0_4
	arg_73_0.GetSelectedOperator = var_0_8
	arg_73_0.GetFocusedOperatorIndex = var_0_3
	arg_73_0.GetFocusedOperatorListPosition = var_0_5
	arg_73_0.GetNumColumns = var_0_7
	arg_73_0.HandleButtonPressed = HandleButtonPressed
	arg_73_0.SetSelectedOperator = var_0_22
	arg_73_0.SetPrompt = var_0_29
	arg_73_0.SetFavorite = var_0_37
	arg_73_0.GetOperatorAssociates = var_0_38
	arg_73_0._favoriteOperators = LOOT.GetFavoritesForType(LOOT.itemTypes.OPERATOR)
	arg_73_0._currentFavoriteCount = arg_73_0._favoriteOperators.count

	local var_73_0 = PlayerData.BFFBGAJGD(arg_73_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_73_1 = LOOT.WZGetPlayerOperatorFilterPreference(arg_73_1)
	local var_73_2 = LUI.FlowManager.GetScopedData(arg_73_0)

	arg_73_0._idleAnimationsTable, arg_73_0._equipAnimationsTable = OPERATOR.GetSceneCharacterModelAnimations()

	var_0_36(arg_73_0)

	if var_73_2.currentFilter then
		arg_73_0.WZOperatorFilter:SetInitialFilter({
			filterToSet = var_73_2.currentFilter
		})

		var_73_2.currentFilter = nil
	else
		local var_73_3 = RANDOM.GetFavoriteEnabled(arg_73_1)
		local var_73_4 = false

		for iter_73_0, iter_73_1 in pairs(arg_73_0._favoriteOperators) do
			if arg_73_0._favoriteOperators[var_73_0.operators[OPERATOR.WZ_OPERATOR_INDEX]:get()] then
				var_73_4 = true

				break
			end
		end

		if var_73_3 or var_73_4 then
			arg_73_0.WZOperatorFilter:SetInitialFilter({
				filterToSet = LOOT.operatorFilterOptions.FAVORITES
			})
		end
	end

	var_0_45(arg_73_0)
	var_0_44(arg_73_0, arg_73_1)
	OPERATOR.SetupScene(arg_73_0, arg_73_1)
	var_0_29(arg_73_0, arg_73_1)
	var_0_47(arg_73_0, arg_73_1)
	var_0_43(arg_73_0)
	var_0_46(arg_73_0, arg_73_1)
	var_0_48(arg_73_0)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_73_0)
	end
end

function WZOperatorSelect(arg_74_0, arg_74_1)
	local var_74_0 = LUI.UIElement.new()

	var_74_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_74_0.id = "WZOperatorSelect"
	var_74_0._animationSets = var_74_0._animationSets or {}
	var_74_0._sequences = var_74_0._sequences or {}

	local var_74_1 = arg_74_1 and arg_74_1.controllerIndex

	if not var_74_1 and not Engine.DDJFBBJAIG() then
		var_74_1 = var_74_0:getRootController()
	end

	assert(var_74_1)

	local var_74_2 = var_74_0
	local var_74_3
	local var_74_4 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_74_1
	})

	var_74_4.id = "Vignette"

	var_74_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_74_0:addElement(var_74_4)

	var_74_0.Vignette = var_74_4

	local var_74_5
	local var_74_6 = LUI.UIImage.new()

	var_74_6.id = "WZWipBacking"

	var_74_6:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_74_6:SetAlpha(0.7, 0)
	var_74_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -822, _1080p * 822, _1080p * -261, _1080p * -79)
	var_74_0:addElement(var_74_6)

	var_74_0.WZWipBacking = var_74_6

	local var_74_7
	local var_74_8 = LUI.UIImage.new()

	var_74_8.id = "WZWipBotSep"

	var_74_8:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_74_8:SetAlpha(0.5, 0)
	var_74_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -822, _1080p * 822, _1080p * -79, _1080p * -78)
	var_74_0:addElement(var_74_8)

	var_74_0.WZWipBotSep = var_74_8

	local var_74_9
	local var_74_10 = LUI.UIImage.new()

	var_74_10.id = "WZWipTopSep"

	var_74_10:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_74_10:SetAlpha(0.5, 0)
	var_74_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -822, _1080p * 822, _1080p * -262, _1080p * -261)
	var_74_0:addElement(var_74_10)

	var_74_0.WZWipTopSep = var_74_10

	local var_74_11
	local var_74_12 = MenuBuilder.BuildRegisteredType("WZOperatorDetails", {
		controllerIndex = var_74_1
	})

	var_74_12.id = "WZOperatorDetails"

	var_74_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 216, _1080p * 716)
	var_74_0:addElement(var_74_12)

	var_74_0.WZOperatorDetails = var_74_12

	local var_74_13
	local var_74_14 = {
		scrollingThresholdX = 6,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 15,
		wrapY = false,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_74_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WZOperatorSelectButtonContainer", {
				controllerIndex = var_74_1
			})
		end,
		refreshChild = function(arg_76_0, arg_76_1, arg_76_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 110,
		rowHeight = _1080p * 134,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Bottom
	}
	local var_74_15 = LUI.UIGrid.new(var_74_14)

	var_74_15.id = "Grid"

	var_74_15:setUseStencil(true)
	var_74_15:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -811, _1080p * 811, _1080p * -288, _1080p * -84)
	var_74_0:addElement(var_74_15)

	var_74_0.Grid = var_74_15

	local var_74_16
	local var_74_17 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbar", {
		controllerIndex = var_74_1
	})

	var_74_17.id = "HorizontalScrollbar"

	var_74_17:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -822, _1080p * 822, _1080p * -92, _1080p * -84)
	var_74_0:addElement(var_74_17)

	var_74_0.HorizontalScrollbar = var_74_17

	local var_74_18
	local var_74_19 = MenuBuilder.BuildRegisteredType("WZOperatorScrollHeader", {
		controllerIndex = var_74_1
	})

	var_74_19.id = "ScrollHeader"

	var_74_19.Line:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_74_19.Line:SetAlpha(0, 0)
	var_74_19:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -822, _1080p * 822, _1080p * -300, _1080p * -271)
	var_74_0:addElement(var_74_19)

	var_74_0.ScrollHeader = var_74_19

	local var_74_20
	local var_74_21 = MenuBuilder.BuildRegisteredType("WZOperatorSelectSnipe", {
		controllerIndex = var_74_1
	})

	var_74_21.id = "WZOperatorSelectSnipe"

	var_74_21:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -225, _1080p * 225, _1080p * -321, _1080p * -273)
	var_74_0:addElement(var_74_21)

	var_74_0.WZOperatorSelectSnipe = var_74_21

	local var_74_22
	local var_74_23 = MenuBuilder.BuildRegisteredType("WZOperatorSelectChallengesLayout", {
		controllerIndex = var_74_1
	})

	var_74_23.id = "WZOperatorSelectChallengesLayout"

	var_74_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1374, _1080p * 1824, _1080p * 216, _1080p * 666)
	var_74_0:addElement(var_74_23)

	var_74_0.WZOperatorSelectChallengesLayout = var_74_23

	local var_74_24
	local var_74_25 = LUI.UIText.new()

	var_74_25.id = "PromptKBM"

	var_74_25:setText(Engine.CBBHFCGDIC("OPERATIONS/EDIT_SKIN"), 0)
	var_74_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_74_25:SetAlignment(LUI.Alignment.Left)
	var_74_25:SetOptOutRightToLeftAlignmentFlip(true)
	var_74_25:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 221, _1080p * 490, _1080p * 176, _1080p * 197)
	var_74_0:addElement(var_74_25)

	var_74_0.PromptKBM = var_74_25

	local var_74_26
	local var_74_27 = LUI.UIText.new()

	var_74_27.id = "PromptPreview"

	var_74_27:setText(Engine.CBBHFCGDIC("OPERATIONS/OPERATOR_FAVORITE"), 0)
	var_74_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_74_27:SetAlignment(LUI.Alignment.Left)
	var_74_27:SetOptOutRightToLeftAlignmentFlip(true)
	var_74_27:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 221, _1080p * 490, _1080p * 214, _1080p * 234)
	var_74_0:addElement(var_74_27)

	var_74_0.PromptPreview = var_74_27

	local var_74_28
	local var_74_29 = MenuBuilder.BuildRegisteredType("OperatorEdit", {
		controllerIndex = var_74_1
	})

	var_74_29.id = "OperatorEdit"

	var_74_29:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_74_29:SetAlpha(0, 0)
	var_74_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1069, _1080p * 1269, _1080p * 251, _1080p * 289)
	var_74_0:addElement(var_74_29)

	var_74_0.OperatorEdit = var_74_29

	local var_74_30
	local var_74_31 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_74_1
	})

	var_74_31.id = "NewItemNotification"

	var_74_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 348, _1080p * 356, _1080p * 741, _1080p * 749)
	var_74_0:addElement(var_74_31)

	var_74_0.NewItemNotification = var_74_31

	local var_74_32
	local var_74_33 = MenuBuilder.BuildRegisteredType("WZOperatorFilter", {
		controllerIndex = var_74_1
	})

	var_74_33.id = "WZOperatorFilter"

	var_74_33:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 130, _1080p * 642, _1080p * -25, _1080p * 162)
	var_74_0:addElement(var_74_33)

	var_74_0.WZOperatorFilter = var_74_33

	local var_74_34
	local var_74_35 = MenuBuilder.BuildRegisteredType("GenericArrowButtonLarge", {
		controllerIndex = var_74_1
	})

	var_74_35.id = "LeftArrow"

	var_74_35:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 35, _1080p * 175, _1080p * -288, _1080p * -38)
	var_74_0:addElement(var_74_35)

	var_74_0.LeftArrow = var_74_35

	local var_74_36
	local var_74_37 = MenuBuilder.BuildRegisteredType("GenericArrowButtonLarge", {
		controllerIndex = var_74_1
	})

	var_74_37.id = "RightArrow"

	var_74_37.Arrow:SetZRotation(271, 0)
	var_74_37:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -176, _1080p * -36, _1080p * -288, _1080p * -38)
	var_74_0:addElement(var_74_37)

	var_74_0.RightArrow = var_74_37

	local function var_74_38()
		return
	end

	var_74_0._sequences.DefaultSequence = var_74_38

	local var_74_39
	local var_74_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_74_25:RegisterAnimationSequence("OnOperatorLocked", var_74_40)

	local function var_74_41()
		var_74_25:AnimateSequence("OnOperatorLocked")
	end

	var_74_0._sequences.OnOperatorLocked = var_74_41

	local function var_74_42()
		return
	end

	var_74_0._sequences.OnOperatorUnlocked = var_74_42

	local var_74_43
	local var_74_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 222
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 491
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 176
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 197
		}
	}

	var_74_25:RegisterAnimationSequence("AR", var_74_44)

	local var_74_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 222
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 491
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_74_27:RegisterAnimationSequence("AR", var_74_45)

	local function var_74_46()
		var_74_25:AnimateSequence("AR")
		var_74_27:AnimateSequence("AR")
	end

	var_74_0._sequences.AR = var_74_46

	local var_74_47
	local var_74_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_74_15:RegisterAnimationSequence("GridFadeIn", var_74_48)

	local var_74_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_74_17:RegisterAnimationSequence("GridFadeIn", var_74_49)

	local var_74_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_74_19:RegisterAnimationSequence("GridFadeIn", var_74_50)

	local function var_74_51()
		var_74_15:AnimateSequence("GridFadeIn")
		var_74_17:AnimateSequence("GridFadeIn")
		var_74_19:AnimateSequence("GridFadeIn")
	end

	var_74_0._sequences.GridFadeIn = var_74_51

	local var_74_52
	local var_74_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_74_15:RegisterAnimationSequence("GridFadeOut", var_74_53)

	local var_74_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_74_17:RegisterAnimationSequence("GridFadeOut", var_74_54)

	local var_74_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_74_19:RegisterAnimationSequence("GridFadeOut", var_74_55)

	local function var_74_56()
		var_74_15:AnimateSequence("GridFadeOut")
		var_74_17:AnimateSequence("GridFadeOut")
		var_74_19:AnimateSequence("GridFadeOut")
	end

	var_74_0._sequences.GridFadeOut = var_74_56

	local function var_74_57()
		return
	end

	var_74_0._sequences.ShowFavoriteWarning = var_74_57

	local var_74_58
	local var_74_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_74_35:RegisterAnimationSequence("ShowArrows", var_74_59)

	local var_74_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_74_37:RegisterAnimationSequence("ShowArrows", var_74_60)

	local function var_74_61()
		var_74_35:AnimateSequence("ShowArrows")
		var_74_37:AnimateSequence("ShowArrows")
	end

	var_74_0._sequences.ShowArrows = var_74_61

	local var_74_62
	local var_74_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_74_35:RegisterAnimationSequence("HideArrows", var_74_63)

	local var_74_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_74_37:RegisterAnimationSequence("HideArrows", var_74_64)

	local function var_74_65()
		var_74_35:AnimateSequence("HideArrows")
		var_74_37:AnimateSequence("HideArrows")
	end

	var_74_0._sequences.HideArrows = var_74_65

	local function var_74_66()
		return
	end

	var_74_0._sequences.ShowPrompts = var_74_66

	local function var_74_67()
		return
	end

	var_74_0._sequences.HidePrompts = var_74_67

	local var_74_68 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.horizontal,
		eventListener = var_74_17,
		startCap = var_74_17.startCap,
		endCap = var_74_17.endCap,
		sliderArea = var_74_17.sliderArea,
		slider = var_74_17.sliderArea and var_74_17.sliderArea.slider,
		fixedSizeSlider = var_74_17.sliderArea and var_74_17.sliderArea.fixedSizeSlider
	})

	var_74_15:AddScrollbar(var_74_68)
	var_0_49(var_74_0, var_74_1, arg_74_1)

	return var_74_0
end

MenuBuilder.registerType("WZOperatorSelect", WZOperatorSelect)
LockTable(_M)
