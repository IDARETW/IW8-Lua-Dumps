MenuUtils = MenuUtils or {}
MenuUtils.MenusBlockingConnectionPopups = {
	"popup_leave_game",
	"leave_public_mp_lobby",
	"leave_private_mp_lobby",
	"MPPauseMenu"
}
MenuUtils.FENCEDLCTIMER = 5000
MenuUtils.GAME_SOURCE_ID_ORDER = {
	[LUI.GAME_SOURCE_ID.VANGUARD] = 1,
	[LUI.GAME_SOURCE_ID.COLD_WAR] = 2,
	[LUI.GAME_SOURCE_ID.MODERN_WARFARE] = 3
}

function MenuUtils.AddDismissPauseMenuKBMHandler(arg_1_0)
	arg_1_0:addEventHandler("gamepad_button", function(arg_2_0, arg_2_1)
		if arg_2_1.down and arg_2_1.button == "dismiss_pause_menu" and not Engine.DDJFBBJAIG() then
			if Engine.CAADCDEEIA() then
				ACTIONS.ResumeGame(arg_2_0)
			end

			local var_2_0 = Engine.DBFFAEEFGJ().flowManager:GetStackTop()

			LUI.FlowManager.RequestCloseAllMenus(var_2_0.name, true, arg_2_1.controller)

			return true
		end

		return false
	end)
end

function MenuUtils.GoToStoreUpsellPopup(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = PROGRESSION.GetCurrentUpsellTitleIDNum()

	if arg_3_3 then
		if arg_3_3 == LUI.DEEP_LINK_GAME.COLD_WAR then
			var_3_0 = PROGRESSION.Title.T9
		elseif arg_3_3 == LUI.DEEP_LINK_GAME.VANGUARD then
			var_3_0 = PROGRESSION.Title.S4
		end
	end

	local var_3_1 = {
		isZeus = var_3_0 == PROGRESSION.Title.T9,
		isVanguard = var_3_0 == PROGRESSION.Title.S4,
		fromPlaylistEventButton = arg_3_2
	}

	LUI.FlowManager.RequestPopupMenu(arg_3_0, "StoreGameUpsellPopup", true, arg_3_1, false, var_3_1)
end

function MenuUtils.CanShowConnectionPopups()
	local var_4_0 = true
	local var_4_1 = Engine.DBFFAEEFGJ().flowManager:GetStackTop()

	if var_4_1 then
		for iter_4_0, iter_4_1 in ipairs(MenuUtils.MenusBlockingConnectionPopups) do
			if iter_4_1 == var_4_1.name then
				var_4_0 = false

				break
			end
		end
	end

	return var_4_0
end

function MenuUtils.GetOrdinalPlacment(arg_5_0)
	local var_5_0 = ""

	if arg_5_0 < 100 then
		if arg_5_0 == 11 or arg_5_0 == 12 or arg_5_0 == 13 then
			var_5_0 = "MP/FOURTH_PLACE"
		elseif arg_5_0 % 10 == 1 then
			var_5_0 = "MP/FIRST_PLACE"
		elseif arg_5_0 % 10 == 2 then
			var_5_0 = "MP/SECOND_PLACE"
		elseif arg_5_0 % 10 == 3 then
			var_5_0 = "MP/THIRD_PLACE"
		else
			var_5_0 = "MP/FOURTH_PLACE"
		end
	elseif arg_5_0 >= 100 then
		var_5_0 = (arg_5_0 % 100 == 11 or arg_5_0 % 100 == 12 or arg_5_0 % 100 == 13) and "MP/FOURTH_PLACE" or arg_5_0 % 100 == 1 and "MP/FIRST_PLACE" or arg_5_0 % 100 == 2 and "MP/SECOND_PLACE" or arg_5_0 % 100 == 3 and "MP/THIRD_PLACE" or "MP/FOURTH_PLACE"
	end

	return (Engine.CBBHFCGDIC(var_5_0, arg_5_0))
end

function MenuUtils.GetOrdinalNumber(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1 and "_FEM" or ""

	if arg_6_0 == 1 then
		return Engine.CBBHFCGDIC("LUA_MENU/FIRST_PLACE" .. var_6_0, arg_6_0)
	elseif arg_6_0 == 2 then
		return Engine.CBBHFCGDIC("LUA_MENU/SECOND_PLACE" .. var_6_0, arg_6_0)
	elseif arg_6_0 == 3 then
		return Engine.CBBHFCGDIC("LUA_MENU/THIRD_PLACE" .. var_6_0, arg_6_0)
	else
		return Engine.CBBHFCGDIC("LUA_MENU/FOURTH_PLACE" .. var_6_0, arg_6_0)
	end
end

function MenuUtils.SetupSceneChangeCallback(arg_7_0, arg_7_1)
	assert(arg_7_1 and type(arg_7_1) == "function")

	arg_7_0._sceneTimer = LUI.UITimer.new({
		interval = 50,
		event = "check_scene_transition"
	})

	arg_7_0:addElement(arg_7_0._sceneTimer)
	arg_7_0:registerEventHandler("check_scene_transition", function(arg_8_0, arg_8_1)
		if #Dvar.DHEEJCCJBH("NRLKQRRMKK") == 0 and Engine.DHEEHAJFEA() then
			arg_8_0._sceneTimer:closeTree()

			arg_8_0._sceneTimer = nil

			arg_7_1()
		end

		return true
	end)
end

function MenuUtils.SetupSceneChangeCallbackWithMenuArg(arg_9_0, arg_9_1)
	assert(arg_9_1 and type(arg_9_1) == "function")

	arg_9_0._sceneTimer = LUI.UITimer.new({
		interval = 50,
		event = "check_scene_transition"
	})

	arg_9_0:addElement(arg_9_0._sceneTimer)
	arg_9_0:registerEventHandler("check_scene_transition", function(arg_10_0, arg_10_1)
		if #Dvar.DHEEJCCJBH("NRLKQRRMKK") == 0 and Engine.DHEEHAJFEA() then
			arg_10_0._sceneTimer:closeTree()

			arg_10_0._sceneTimer = nil

			arg_9_1(arg_9_0)
		end

		return true
	end)
end

function MenuUtils.WaitForEntitySystem(arg_11_0, arg_11_1)
	assert(arg_11_1 and type(arg_11_1) == "function")

	arg_11_0._entitySystemTimer = LUI.UITimer.new({
		interval = 100,
		event = "check_entity_system_allocated"
	})

	arg_11_0:addElement(arg_11_0._entitySystemTimer)
	arg_11_0:registerEventHandler("check_entity_system_allocated", function(arg_12_0, arg_12_1)
		if Engine.DHEEHAJFEA() and arg_12_0._entitySystemTimer then
			arg_12_0._entitySystemTimer:closeTree()

			arg_12_0._entitySystemTimer = nil

			arg_11_1()
		end

		return true
	end)
end

function MenuUtils.GetMainMenu()
	if Engine.EAIICIFIFA() then
		return "CPMainMenu"
	elseif Engine.ECHCFGDDDF() then
		if Engine.HEEFCICJE() then
			return "BRMainMenu"
		else
			return "MPMainMenu"
		end
	else
		return "MainMenu"
	end
end

function MenuUtils.SortViaFunctions(arg_14_0, arg_14_1)
	if arg_14_0 ~= arg_14_1 then
		for iter_14_0, iter_14_1 in ipairs(MenuUtils._options) do
			local var_14_0 = iter_14_1.sortFunc(arg_14_0, arg_14_1, iter_14_1.sortFuncParams)

			if var_14_0 ~= nil then
				return var_14_0
			end
		end
	end

	return false
end

function MenuUtils.SortNoneValue(arg_15_0, arg_15_1, arg_15_2)
	assert(arg_15_0.ref, "In MenuUtils.SortNoneValue() a.ref is null : function unable to be evaluated.")
	assert(arg_15_1.ref, "In MenuUtils.SortNoneValue() b.ref is null : function unable to be evaluated.")
	assert(type(arg_15_2) == "table", "In MenuUtils.SortNoneValue() sortFuncParams is not a table and cannot contain a noneValue : function unable to be evaluated.")
	assert(arg_15_2.noneValue, "In MenuUtils.SortNoneValue() sortFuncParams.noneValue is null : function unable to be evaluated.")

	if arg_15_0.ref ~= arg_15_1.ref then
		if arg_15_0.ref ~= arg_15_2.noneValue and arg_15_1.ref == arg_15_2.noneValue then
			return false
		elseif arg_15_0.ref == arg_15_2.noneValue and arg_15_1.ref ~= arg_15_2.noneValue then
			return true
		end
	end

	return nil
end

function MenuUtils.SortRandomValue(arg_16_0, arg_16_1)
	assert(arg_16_0.lootID, "In MenuUtils.SortRandomValue() a.lootID is null : function unable to be evaluated.")
	assert(arg_16_1.lootID, "In MenuUtils.SortRandomValue() b.lootID is null : function unable to be evaluated.")

	if arg_16_0.lootID ~= arg_16_1.lootID then
		if arg_16_0.lootID ~= RANDOM.lootID and arg_16_1.lootID == RANDOM.lootID then
			return false
		elseif arg_16_0.lootID == RANDOM.lootID and arg_16_1.lootID ~= RANDOM.lootIDe then
			return true
		end
	end

	return nil
end

function MenuUtils.SortSelected(arg_17_0, arg_17_1)
	assert(arg_17_0.selected ~= nil, "In MenuUtils.SortSelected() a.selected is null : function unable to be evaluated.")
	assert(arg_17_1.selected ~= nil, "In MenuUtils.SortSelected() b.selected is null : function unable to be evaluated.")

	if arg_17_0.selected ~= arg_17_1.selected then
		return arg_17_0.selected and not arg_17_1.selected
	end

	return nil
end

function MenuUtils.SortFavorites(arg_18_0, arg_18_1, arg_18_2)
	assert(arg_18_0.ref, "In MenuUtils.SortFavorites() a.ref is null : function unable to be evaluated.")
	assert(arg_18_1.ref, "In MenuUtils.SortFavorites() b.ref is null : function unable to be evaluated.")
	assert(type(arg_18_2) == "table", "In MenuUtils.SortFavorites() sortFuncParams is not a table and cannot contain a favoritesTable : function unable to be evaluated.")
	assert(type(arg_18_2.favoritesTable) == "table", "In MenuUtils.SortFavorites() sortFuncParams.favoritesTable is not a table and cannot contain needed information : function unable to be evaluated.")

	if arg_18_2.favoritesTable[arg_18_0.ref] ~= arg_18_2.favoritesTable[arg_18_1.ref] then
		if arg_18_2.favoritesTable[arg_18_0.ref] and not arg_18_2.favoritesTable[arg_18_1.ref] then
			return true
		else
			return false
		end
	end

	return nil
end

function MenuUtils.SortNew(arg_19_0, arg_19_1, arg_19_2)
	assert(arg_19_0.lootID, "In MenuUtils.SortNew() a.lootID is null : function unable to be evaluated.")
	assert(arg_19_1.lootID, "In MenuUtils.SortNew() b.lootID is null : function unable to be evaluated.")
	assert(type(arg_19_2) == "table", "In MenuUtils.SortNew() sortFuncParams is not a table and cannot contain a controllerIndex : function unable to be evaluated.")
	assert(arg_19_2.controllerIndex, "In MenuUtils.SortNew() sortFuncParams.controllerIndex is null : function unable to be evaluated.")

	local var_19_0 = Loot.HDJCADADF(arg_19_2.controllerIndex, arg_19_0.lootID)
	local var_19_1 = Loot.HDJCADADF(arg_19_2.controllerIndex, arg_19_1.lootID)

	if var_19_0 ~= var_19_1 then
		if var_19_0 and not var_19_1 then
			return true
		else
			return false
		end
	end

	return nil
end

function MenuUtils.SortUnlocks(arg_20_0, arg_20_1, arg_20_2)
	assert(arg_20_0.isUnlocked ~= nil, "In MenuUtils.SortUnlocks() a.isUnlocked is null : function unable to be evaluated.")
	assert(arg_20_1.isUnlocked ~= nil, "In MenuUtils.SortUnlocks() b.isUnlocked is null : function unable to be evaluated.")

	if arg_20_0.isUnlocked ~= arg_20_1.isUnlocked then
		if arg_20_2 == nil or arg_20_2.sortByUnlockedFirst == nil or arg_20_2.sortByUnlockedFirst == true then
			if arg_20_0.isUnlocked and not arg_20_1.isUnlocked then
				return true
			else
				return false
			end
		elseif not arg_20_0.isUnlocked and arg_20_1.isUnlocked then
			return true
		else
			return false
		end
	end

	return nil
end

function MenuUtils.SortSeasons(arg_21_0, arg_21_1, arg_21_2)
	assert(arg_21_0.season, "In MenuUtils.SortSeasons() a.season is null : function unable to be evaluated.")
	assert(arg_21_1.season, "In MenuUtils.SortSeasons() b.season is null : function unable to be evaluated.")
	assert(type(arg_21_2) == "table", "In MenuUtils.SortSeasons() sortFuncParams is not a table and cannot contain a seasonsSortingType : function unable to be evaluated.")
	assert(arg_21_2.seasonsSortingType, "In MenuUtils.SortSeasons() sortFuncParams.seasonsSortingType is null : function unable to be evaluated.")

	if arg_21_0.season ~= arg_21_1.season then
		if arg_21_2.seasonsSortingType == LOOT.seasonsSortingOptions.OLD_FIRST then
			return arg_21_0.season < arg_21_1.season
		elseif arg_21_2.seasonsSortingType == LOOT.seasonsSortingOptions.RECENT_FIRST then
			return arg_21_0.season > arg_21_1.season
		end
	end

	return nil
end

function MenuUtils.SortRarity(arg_22_0, arg_22_1, arg_22_2)
	assert(arg_22_0.rarity, "In MenuUtils.SortRarity() a.rarity is null : function unable to be evaluated.")
	assert(arg_22_1.rarity, "In MenuUtils.SortRarity() b.rarity is null : function unable to be evaluated.")
	assert(type(arg_22_2) == "table", "In MenuUtils.SortRarity() sortFuncParams is not a table and cannot contain a raritySortingType : function unable to be evaluated.")
	assert(arg_22_2.raritySortingType, "In MenuUtils.SortRarity() sortFuncParams.raritySortingType is null : function unable to be evaluated.")

	if arg_22_0.rarity ~= arg_22_1.rarity then
		if arg_22_2.raritySortingType == LOOT.raritySortingOptions.LOW_FIRST then
			return arg_22_0.rarity < arg_22_1.rarity
		elseif arg_22_2.raritySortingType == LOOT.raritySortingOptions.HIGH_FIRST then
			return arg_22_0.rarity > arg_22_1.rarity
		end
	end

	return nil
end

function MenuUtils.SortName(arg_23_0, arg_23_1)
	assert(arg_23_0.name, "In MenuUtils.SortName() a.name is null : function unable to be evaluated.")
	assert(arg_23_1.name, "In MenuUtils.SortName() b.name is null : function unable to be evaluated.")

	local var_23_0 = Engine.CBBHFCGDIC(arg_23_0.name)
	local var_23_1 = Engine.CBBHFCGDIC(arg_23_1.name)

	if var_23_0 ~= var_23_1 then
		return var_23_0 < var_23_1
	end

	return nil
end

function MenuUtils.SortLevel(arg_24_0, arg_24_1, arg_24_2)
	assert(arg_24_0.ref, "In MenuUtils.SortLevel() a.ref is null : function unable to be evaluated.")
	assert(arg_24_1.ref, "In MenuUtils.SortLevel() b.ref is null : function unable to be evaluated.")
	assert(type(arg_24_2) == "table", "In MenuUtils.SortLevel() sortFuncParams is not a table and cannot contain a controllerIndex : function unable to be evaluated.")
	assert(arg_24_2.controllerIndex, "In MenuUtils.SortLevel() sortFuncParams.controllerIndex is null : function unable to be evaluated.")

	local var_24_0 = PROGRESSION.GetWeaponLevel(arg_24_2.controllerIndex, arg_24_0.ref)
	local var_24_1 = PROGRESSION.GetWeaponLevel(arg_24_2.controllerIndex, arg_24_1.ref)

	if var_24_0 ~= var_24_1 then
		if arg_24_2.sortByHighestLevelFirst then
			return var_24_1 < var_24_0
		else
			return var_24_0 < var_24_1
		end
	end

	return nil
end

function MenuUtils.SortGameTypeFirst(arg_25_0, arg_25_1, arg_25_2)
	assert(arg_25_0.gameSourceID, "In MenuUtils.SortGameTypeFirst() a.gameSourceID is null : function unable to be evaluated.")
	assert(arg_25_1.gameSourceID, "In MenuUtils.SortGameTypeFirst() b.gameSourceID is null : function unable to be evaluated.")
	assert(type(arg_25_2) == "table", "In MenuUtils.SortGameTypeFirst() sortFuncParams is not a table and cannot contain a gameSourceID : function unable to be evaluated.")
	assert(arg_25_2.gameSourceID, "In MenuUtils.SortGameTypeFirst() sortFuncParams.gameSourceID is null : function unable to be evaluated.")

	if arg_25_0.gameSourceID ~= arg_25_1.gameSourceID then
		if arg_25_2.gameSourceID == arg_25_0.gameSourceID then
			return true
		else
			return false
		end
	end

	return nil
end

function MenuUtils.SortIsItemInAnyStoreBundle(arg_26_0, arg_26_1)
	assert(arg_26_0.lootID, "In MenuUtils.SortIsItemInAnyStoreBundle() a.lootID is null : function unable to be evaluated.")
	assert(arg_26_1.lootID, "In MenuUtils.SortIsItemInAnyStoreBundle() b.lootID is null : function unable to be evaluated.")

	local var_26_0 = LOOT.IsItemInAnyStoreBundle(arg_26_0.lootID)
	local var_26_1 = LOOT.IsItemInAnyStoreBundle(arg_26_1.lootID)

	if var_26_0 ~= var_26_1 then
		if var_26_0 and not var_26_1 then
			return true
		else
			return false
		end
	end

	return nil
end

function MenuUtils.SortIsInEarnedTable(arg_27_0, arg_27_1, arg_27_2)
	assert(arg_27_0.lootID, "In MenuUtils.SortIsInEarnedTable() a.lootID is null : function unable to be evaluated.")
	assert(arg_27_1.lootID, "In MenuUtils.SortIsInEarnedTable() b.lootID is null : function unable to be evaluated.")
	assert(type(arg_27_2) == "table", "In MenuUtils.SortIsInEarnedTable() sortFuncParams is not a table and cannot contain a earnedLootTable : function unable to be evaluated.")
	assert(arg_27_2.earnedLootTable, "In MenuUtils.SortIsInEarnedTable() sortFuncParams.earnedLootTable is null : function unable to be evaluated.")

	local var_27_0 = arg_27_2.earnedLootTable[arg_27_0.lootID]
	local var_27_1 = arg_27_2.earnedLootTable[arg_27_1.lootID]

	if var_27_0 ~= var_27_1 then
		if var_27_0 and not var_27_1 then
			return true
		else
			return false
		end
	end

	return nil
end

function MenuUtils.SortByDisplayOrder(arg_28_0, arg_28_1)
	assert(arg_28_0.displayOrder, "In MenuUtils.SortByDisplayOrder() a.displayOrder is null : function unable to be evaluated.")
	assert(arg_28_1.displayOrder, "In MenuUtils.SortByDisplayOrder() b.displayOrder is null : function unable to be evaluated.")

	return tonumber(arg_28_0.displayOrder) < tonumber(arg_28_1.displayOrder)
end

function MenuUtils.SortBySubClassIDAndGameSource(arg_29_0, arg_29_1)
	assert(arg_29_0.ref, "In MenuUtils.SortBySubClassIDAndGameSource() a.ref is null : function unable to be evaluated.")
	assert(arg_29_1.ref, "In MenuUtils.SortBySubClassIDAndGameSource() b.ref is null : function unable to be evaluated.")

	local var_29_0 = WEAPON.GetSubClassIndex(arg_29_0.ref)
	local var_29_1 = WEAPON.GetSubClassIndex(arg_29_1.ref)

	if var_29_0 == var_29_1 then
		return (MenuUtils.SortByGameSourceOrder(arg_29_0, arg_29_1))
	else
		return var_29_0 < var_29_1
	end
end

function MenuUtils.SortByGameSourceOrder(arg_30_0, arg_30_1)
	assert(arg_30_0.gameSourceID, "In MenuUtils.SortByGameSourceOrder() a.gameSourceID is null : function unable to be evaluated.")
	assert(arg_30_1.gameSourceID, "In MenuUtils.SortByGameSourceOrder() b.gameSourceID is null : function unable to be evaluated.")

	if arg_30_0.gameSourceID ~= arg_30_1.gameSourceID then
		return MenuUtils.GAME_SOURCE_ID_ORDER[arg_30_0.gameSourceID] < MenuUtils.GAME_SOURCE_ID_ORDER[arg_30_1.gameSourceID]
	end

	return nil
end

function MenuUtils.SortTableViaOptions(arg_31_0, arg_31_1)
	assert(type(arg_31_0) == "table", "In MenuUtils.SortTableViaOptions() tableToSort is not a table so there will be nothing to sort : function unable to be evaluated.")
	assert(type(arg_31_1) == "table", "In MenuUtils.SortTableViaOptions() options is not a table so there is no info to sort with : function unable to be evaluated.")
	assert(MenuUtils._options == nil, "In MenuUtils.SortTableViaOptions() MenuUtils._options has information in it and was not cleared properly in the last sort.")

	MenuUtils._options = arg_31_1

	table.sort(arg_31_0, MenuUtils.SortViaFunctions)

	MenuUtils._options = nil
end

function MenuUtils.SelectPopupImage(arg_32_0)
	if Engine.CJJAFGIFAC(arg_32_0.controllerIndex) then
		if not Engine.CFHBIHABCB(arg_32_0.controllerIndex) then
			arg_32_0.imageOverride = "logo_wz_shadow"
		end
	elseif not CONDITIONS.IsLazeOrOutrun() then
		arg_32_0.imageOverride = "logo_cod_warzone_mw_shadow"
	else
		arg_32_0.imageOverride = "mm_element_logo_white"
	end
end
