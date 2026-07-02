module(..., package.seeall)

local var_0_0 = {
	[LOOT.seasonsSortingOptions.RECENT_FIRST] = "MENU/NEW",
	[LOOT.seasonsSortingOptions.OLD_FIRST] = "MENU/OLD"
}
local var_0_1 = {
	[LOOT.raritySortingOptions.LOW_FIRST] = "LOOT_MP/QUALITY_1",
	[LOOT.raritySortingOptions.HIGH_FIRST] = "LOOT_MP/QUALITY_4"
}
local var_0_2 = {
	[LOOT.weaponFilterOptions.ALL] = "LUA_MENU/ALL",
	[LOOT.weaponFilterOptions.COLD_WAR] = "LUA_MENU/COLD_WAR_ONLY",
	[LOOT.weaponFilterOptions.MODERN_WARFARE] = "LUA_MENU/MW_ONLY",
	[LOOT.weaponFilterOptions.VANGUARD] = "LUA_MENU/VANGUARD_ONLY"
}
local var_0_3 = {
	[LOOT.weaponSortByTitleOptions.COLD_WAR_FIRST] = "LUA_MENU/COLD_WAR_FIRST",
	[LOOT.weaponSortByTitleOptions.MW_FIRST] = "LUA_MENU/MW_FIRST",
	[LOOT.weaponSortByTitleOptions.VANGUARD_FIRST] = "LUA_MENU/VANGUARD_FIRST"
}
local var_0_4 = {
	[LOOT.sortByTitleOptions.COLD_WAR_FIRST] = "LUA_MENU/COLD_WAR_FIRST",
	[LOOT.sortByTitleOptions.MW_FIRST] = "LUA_MENU/MW_FIRST",
	[LOOT.sortByTitleOptions.VANGUARD_FIRST] = "LUA_MENU/VANGUARD_FIRST"
}
local var_0_5 = {
	[LOOT.filterOptions.ALL] = "LUA_MENU/ALL",
	[LOOT.filterOptions.COLD_WAR_ONLY] = "LUA_MENU/COLD_WAR_ONLY",
	[LOOT.filterOptions.MODERN_WARFARE_ONLY] = "LUA_MENU/MW_ONLY",
	[LOOT.filterOptions.VANGUARD_ONLY] = "LUA_MENU/VANGUARD_ONLY"
}
local var_0_6 = {
	[LOOT.weaponSortByWeaponDataOptions.HIGHEST_LEVEL_FIRST] = "LUA_MENU/HIGHEST_LEVEL_FIRST",
	[LOOT.weaponSortByWeaponDataOptions.LOWEST_LEVEL_FIRST] = "LUA_MENU/LOWEST_LEVEL_FIRST",
	[LOOT.weaponSortByWeaponDataOptions.NEW_FIRST] = "LUA_MENU/NEW_FIRST",
	[LOOT.weaponSortByWeaponDataOptions.UNLOCKED_FIRST] = "LUA_MENU/UNLOCKED_FIRST",
	[LOOT.weaponSortByWeaponDataOptions.LOCKED_FIRST] = "LUA_MENU/LOCKED_FIRST"
}

local function var_0_7(arg_1_0, arg_1_1)
	arg_1_0._sortStateStrings[arg_1_0._sortStateStringsIndex] = ToUpperCase(Engine.CBBHFCGDIC(arg_1_0._sortTypeKey))

	if arg_1_1 then
		arg_1_0._sortStateStringsIndex = arg_1_0._sortStateStringsIndex + 1
	end
end

local function var_0_8(arg_2_0, arg_2_1)
	arg_2_0._sortStateStrings[arg_2_0._sortStateStringsIndex] = Engine.CBBHFCGDIC("LUA_MENU/X_COLON_Y", ToUpperCase(Engine.CBBHFCGDIC(arg_2_0._categoryPrefixKey)), ToUpperCase(Engine.CBBHFCGDIC(arg_2_0._sortTypeKey)))

	if arg_2_1 then
		arg_2_0._sortStateStringsIndex = arg_2_0._sortStateStringsIndex + 1
	end
end

local function var_0_9(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._sortStateStrings = {}
	arg_3_0._sortStateStringsIndex = 1
	arg_3_0._sortTypeKey = ""
	arg_3_0._categoryPrefixKey = ""

	local var_3_0 = false

	if arg_3_1.seasonsSortingType and var_0_0[arg_3_1.seasonsSortingType] then
		arg_3_0._sortTypeKey = var_0_0[arg_3_1.seasonsSortingType]

		var_0_7(arg_3_0, true)
	end

	if arg_3_1.raritySortingType and var_0_1[arg_3_1.raritySortingType] then
		arg_3_0._sortTypeKey = var_0_1[arg_3_1.raritySortingType]

		var_0_7(arg_3_0, false)
	end

	if arg_3_1.filterByTitleType and var_0_5[arg_3_1.filterByTitleType] then
		var_3_0 = true
		arg_3_0._categoryPrefixKey = "LUA_MENU/SORT"
		arg_3_0._sortTypeKey = var_0_5[arg_3_1.filterByTitleType]

		var_0_8(arg_3_0, true)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		if not CONDITIONS.AllT9WeaponsAreHidden() then
			if arg_3_1.weaponFilterType and var_0_2[arg_3_1.weaponFilterType] then
				var_3_0 = true
				arg_3_0._categoryPrefixKey = "LUA_MENU/FILTER"
				arg_3_0._sortTypeKey = var_0_2[arg_3_1.weaponFilterType]

				var_0_8(arg_3_0, true)
			end

			if arg_3_1.weaponSortingByTitleType and var_0_3[arg_3_1.weaponSortingByTitleType] then
				var_3_0 = true
				arg_3_0._categoryPrefixKey = "LUA_MENU/SORT"
				arg_3_0._sortTypeKey = var_0_3[arg_3_1.weaponSortingByTitleType]

				var_0_8(arg_3_0, true)
			end
		end

		if arg_3_1.weaponSortingByWeaponDataType and var_0_6[arg_3_1.weaponSortingByWeaponDataType] then
			var_3_0 = true
			arg_3_0._categoryPrefixKey = "LUA_MENU/SORT"
			arg_3_0._sortTypeKey = var_0_6[arg_3_1.weaponSortingByWeaponDataType]

			var_0_8(arg_3_0, false)
		end
	end

	local var_3_1

	if arg_3_0._sortStateStringsIndex == 1 and #arg_3_0._sortStateStrings == 0 then
		local var_3_2 = var_3_0 and "LUA_MENU/DEFAULT_ORDER" or "LUA_MENU/ALPHABETICAL"

		var_3_1 = Engine.CBBHFCGDIC("LUA_MENU/BRACKETS_WRAPPER", Engine.JCBDICCAH(ToUpperCase(Engine.CBBHFCGDIC(var_3_2))))
	else
		if #arg_3_0._sortStateStrings == 1 then
			var_3_1 = arg_3_0._sortStateStrings[1]
		elseif #arg_3_0._sortStateStrings == 2 then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU/TWO_STATE_SORT_PROMPT_WITH_DIVIDER", Engine.JCBDICCAH(arg_3_0._sortStateStrings[1]), Engine.JCBDICCAH(arg_3_0._sortStateStrings[2]))
		elseif #arg_3_0._sortStateStrings == 3 then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU/THREE_STATE_SORT_PROMPT_W_DIVIDERS", Engine.JCBDICCAH(arg_3_0._sortStateStrings[1]), Engine.JCBDICCAH(arg_3_0._sortStateStrings[2]), Engine.JCBDICCAH(arg_3_0._sortStateStrings[3]))
		end

		local var_3_3 = var_3_0 and "LUA_MENU/BRACKETS_WRAPPER" or "LUA_MENU/CURRENT_SORT_FILTER"

		var_3_1 = Engine.CBBHFCGDIC(var_3_3, var_3_1)
	end

	local var_3_4 = arg_3_2 and Engine.CBBHFCGDIC(arg_3_2) .. Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER_TYPE", Engine.JCBDICCAH(var_3_1)) or Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER_PROMPT", Engine.JCBDICCAH(var_3_1))

	arg_3_0.SortPrompt:setText(var_3_4)
end

local function var_0_10(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.UpdateText = var_0_9
	arg_4_0._sortStateStrings = {}
	arg_4_0._sortStateStringsIndex = 1
	arg_4_0._sortTypeKey = ""
	arg_4_0._categoryPrefixKey = ""

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function SortPrompt(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 130 * _1080p, 0, 24 * _1080p)

	var_5_0.id = "SortPrompt"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIText.new()

	var_5_4.id = "SortPrompt"

	var_5_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_4:setText("", 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_4:SetWordWrap(false)
	var_5_4:SetAlignment(LUI.Alignment.Right)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
	var_5_0:addElement(var_5_4)

	var_5_0.SortPrompt = var_5_4

	local function var_5_5()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_5

	local var_5_6
	local var_5_7 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Warning", var_5_7)

	local function var_5_8()
		var_5_4:AnimateSequence("Warning")
	end

	var_5_0._sequences.Warning = var_5_8

	local var_5_9
	local var_5_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("StopWarning", var_5_10)

	local function var_5_11()
		var_5_4:AnimateSequence("StopWarning")
	end

	var_5_0._sequences.StopWarning = var_5_11

	local var_5_12
	local var_5_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_5_4:RegisterAnimationSequence("AR", var_5_13)

	local function var_5_14()
		var_5_4:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_14

	local var_5_15
	local var_5_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipWeaponSelectSortPromptSetup", var_5_16)

	local function var_5_17()
		var_5_4:AnimateSequence("WZWipWeaponSelectSortPromptSetup")
	end

	var_5_0._sequences.WZWipWeaponSelectSortPromptSetup = var_5_17

	var_0_10(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SortPrompt", SortPrompt)
LockTable(_M)
