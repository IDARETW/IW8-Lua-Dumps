OPERATOR = {}
OPERATOR.SuperFaction = {
	EAST = 1,
	WEST = 0
}
OPERATOR.Gender = {
	MALE = 0,
	FEMALE = 1
}
OPERATOR.Category = {
	OPERATORS = 2,
	MILSIM = 3,
	RANDOM = 1
}
OPERATOR.UnlockState = {
	HIDDEN = 1,
	REVEALED2 = 3,
	REVEALED1 = 2
}
OPERATOR.DEFAULT_COLUMN_WIDTH = 110 * _1080p
OPERATOR.FACTION_COLUMN_WIDTH = 140 * _1080p
OPERATOR.ALL_GAME_SOURCE_ID = "all"
OPERATOR.WZ_OPERATOR_INDEX = 0
OPERATOR.DEFAULT_FACTION_INDEX = 0
OPERATOR.RANDOM_FACTION = "RANDOM"
OPERATOR.DEFAULT_FACTION = "DEFAULT"
OPERATOR.FIRST_VALID_RANK = 0
OPERATOR.WestDefaultLaunchRef = "murphy_western"
OPERATOR.EastDefaultLaunchRef = "minotavr_eastern"
OPERATOR.DefaultT9Ref = "t9woods_western"
OPERATOR.DefaultS4Ref = "s4_wade_usa"
OPERATOR.DominoRef = "domino_western"
OPERATOR.KingsleyRef = "t9kingsley_western"
OPERATOR.DefaultWestBody = "body_mp_western_fireteam_west_ar_1_1_lod1"
OPERATOR.DefaultWestHead = "head_mp_western_fireteam_west_ar_1_1"
OPERATOR.DefaultEastBody = "body_mp_eastern_fireteam_east_ar_lod1"
OPERATOR.DefaultEastHead = "head_mp_eastern_fireteam_east_ar_1"
OPERATOR.MWExclusiveExecutionRef = "universal_ref"
OPERATOR.T9ExclusiveExecutionRef = "t9_exclusive_ref"
OPERATOR.S4ExclusiveExecutionRef = "s4_exclusive_ref"
OPERATOR.proxyBody = "mp_proxy_operator_1_1"
OPERATOR.proxyHead = "head_mp_proxy_operator_1_1"
OPERATOR.CachedSkinRefs = {}
OPERATOR.CachedExecutionRefs = {}
OPERATOR.CachedTauntRefs = {}
OPERATOR.CachedUltraScriptableStates = {}
OPERATOR.UnlockedSkinRefs = {}
OPERATOR.DvarFilterRefs = {}
OPERATOR.OPERATOR_INFO_TAB_DATA = {
	BIO = {
		index = 1,
		asset = "WZOperatorInfoBio",
		id = "InfoBio",
		title = "LUA_MENU/OPERATOR_BIO_TITLE",
		name = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_BIO")
	},
	PROGRESSION = {
		index = 2,
		asset = "WZOperatorInfoProgression",
		id = "InfoProgression",
		title = "LUA_MENU/OPERATOR_PROGRESSION",
		name = Engine.CBBHFCGDIC("LUA_MENU/PROGRESSION")
	},
	MISSION = {
		index = 3,
		asset = "WZOperatorInfoMissions",
		insertOperator = true,
		id = "InfoMissions",
		title = "LUA_MENU/OPERATOR_MISSIONS_TITLE",
		name = Engine.CBBHFCGDIC("LUA_MENU/MISSIONS")
	}
}

local var_0_0

if Engine.BHICADFIHA() and Dvar.IBEGCHEFE("ui_debug_operators") then
	local var_0_1 = 12

	var_0_0 = {
		DEBUG_CUSTOMIZATION_ITEMS = Dvar.IBEGCHEFE("ui_debug_operator_customization"),
		IsOperatorLocked = function(arg_1_0)
			return false
		end,
		GetOperatorProgression = function(arg_2_0)
			if arg_2_0 == "s4_roland_ger" then
				return {
					maxXP = 500,
					rank = 4,
					XP = 120,
					minXP = 0,
					maxRank = 20
				}
			elseif arg_2_0 == "s4_beatrice_fra" then
				return {
					maxXP = 100,
					rank = 1,
					XP = 0,
					minXP = 0,
					maxRank = 20
				}
			elseif arg_2_0 == "s4_daniel_usa" then
				return {
					maxXP = 800,
					rank = 8,
					XP = 750,
					minXP = 0,
					maxRank = 20
				}
			elseif arg_2_0 == "s4_polina_rus" then
				return {
					maxXP = 500,
					rank = 20,
					XP = 0,
					minXP = 0,
					maxRank = 20
				}
			else
				return {
					maxXP = 500,
					rank = 1,
					XP = 0,
					minXP = 0,
					maxRank = 20
				}
			end
		end,
		GetProgressionUnlocks = function(arg_3_0, arg_3_1, arg_3_2)
			return {
				{
					lootID = 33904433,
					bonusXP = true,
					level = 1
				},
				{
					lootID = 33904434,
					level = 2
				},
				{
					lootID = 33904435,
					level = 3
				},
				{
					lootID = 33614468,
					bonusXP = true,
					level = 4
				},
				{
					lootID = 33624435,
					bonusXP = true,
					level = 5
				},
				{
					lootID = 33614433,
					level = 6
				},
				{
					lootID = 33555070,
					level = 7
				},
				{
					lootID = 33624475,
					level = 8
				},
				{
					lootID = 33555078,
					level = 9
				},
				{
					lootID = 33614432,
					bonusXP = true,
					level = 10
				},
				{
					lootID = 33555084,
					bonusXP = true,
					level = 11
				},
				{
					lootID = 33624433,
					level = 12
				},
				{
					lootID = 33555074,
					level = 13
				},
				{
					lootID = 33614464,
					level = 14
				},
				{
					lootID = 33555063,
					bonusXP = true,
					level = 15
				},
				{
					lootID = 33624432,
					level = 16
				},
				{
					lootID = 33555060,
					level = 17
				},
				{
					lootID = 33604445,
					bonusXP = true,
					level = 18
				},
				{
					lootID = 33555066,
					bonusXP = true,
					level = 19
				},
				{
					lootID = 33555092,
					level = 20
				}
			}
		end,
		IsOperatorMissionsAvailable = function(arg_4_0, arg_4_1)
			return true
		end
	}
end

local function var_0_2(arg_5_0)
	if Dvar.IBEGCHEFE("lui_operators_force_refresh_filtered") then
		OPERATOR.DvarFilterRefs = {}
	end

	if OPERATOR.DvarFilterRefs.__init then
		return
	end

	OPERATOR.DvarFilterRefs.__init = true

	local var_5_0 = StringTable.BFHCAIIDA(CSV.operators.file)

	for iter_5_0 = 0, var_5_0 - 1 do
		local var_5_1 = CSV.ReadRow(CSV.operators, iter_5_0)

		if var_5_1 and var_5_1.dvarFilter ~= "" then
			local var_5_2 = Dvar.CFHDGABACF(var_5_1.dvarFilter)
			local var_5_3 = var_5_2 == nil or var_5_2 == OPERATOR.UnlockState.HIDDEN

			if var_5_3 and OPERATOR.IsUnlocked(arg_5_0, var_5_1.ref) then
				var_5_3 = false
			end

			OPERATOR.DvarFilterRefs[var_5_1.ref] = var_5_3
		end
	end
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	assert(OPERATOR.DvarFilterRefs.__init)

	if OPERATOR.DvarFilterRefs[arg_6_3.ref] then
		return
	end

	if arg_6_1 then
		if not arg_6_0[arg_6_1] then
			arg_6_0[arg_6_1] = {}
			arg_6_0[arg_6_1].displayOrder = arg_6_2
		end

		arg_6_0[arg_6_1].displayOrder = math.max(arg_6_0[arg_6_1].displayOrder, arg_6_2)

		table.insert(arg_6_0[arg_6_1], arg_6_3)
	else
		table.insert(arg_6_0, arg_6_3)
	end
end

local function var_0_4(arg_7_0, arg_7_1)
	assert(arg_7_1.operatorRefMap and type(arg_7_1.operatorRefMap) == "table")

	local var_7_0 = arg_7_1.createFactionSubTable

	var_0_2(arg_7_0)

	local var_7_1 = {}
	local var_7_2 = StringTable.BFHCAIIDA(CSV.operators.file)

	for iter_7_0 = 0, var_7_2 - 1 do
		local var_7_3 = CSV.ReadRow(CSV.operators, iter_7_0)
		local var_7_4 = OPERATOR.IsOperatorAvailableForSelection(arg_7_0, var_7_3)

		if var_7_3 and var_7_4 and tonumber(var_7_3.displayOrder) >= 0 then
			local var_7_5 = var_7_3.ref
			local var_7_6 = var_7_3.factionRef

			if var_7_6 ~= OPERATOR.DEFAULT_FACTION then
				OPERATOR.ValidateEquippedCustomization(arg_7_0, var_7_5, var_7_3)
			end

			local var_7_7 = math.floor(var_7_3.displayOrder)

			arg_7_1.operatorRefMap[var_7_5] = var_7_3

			var_0_3(var_7_1, var_7_0 and var_7_6 or nil, var_7_7, var_7_3)
		end
	end

	return var_7_1
end

local function var_0_5(arg_8_0, arg_8_1)
	local var_8_0 = OPERATOR.GetOutfitMissionQuestsForOperators(arg_8_1, arg_8_0)

	OPERATOR.GetVGMissionsForOperators(arg_8_0, arg_8_1)

	for iter_8_0, iter_8_1 in pairs(arg_8_1) do
		local var_8_1 = var_8_0[iter_8_0]

		if var_8_1 then
			table.sort(var_8_1, OPERATOR.OutfitMissionSortFn)

			iter_8_1.outfitMissionQuests = var_8_1
		end
	end
end

local function var_0_6(arg_9_0)
	for iter_9_0, iter_9_1 in pairs(arg_9_0) do
		table.sort(iter_9_1, OPERATOR.Internal_SortByDisplayOrder)
	end
end

function OPERATOR.GetSkinsCSVFile(arg_10_0)
	if OPERATOR.IsDefaultOperator(arg_10_0) then
		return CSV.defaultOperatorSkins
	else
		return CSV.operatorSkins
	end
end

function OPERATOR.GetOperatorGameSourceID(arg_11_0)
	assert(arg_11_0)

	local var_11_0 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, arg_11_0)

	return LOOT.GetGameSourceIDFromItemID(var_11_0)
end

function OPERATOR.GetOperatorActivationID(arg_12_0)
	return StringTable.DIFCHIGDFB(CSV.activationTokens.file, CSV.activationTokens.cols.sentinelItemID, arg_12_0, CSV.activationTokens.cols.itemID)
end

local function var_0_7(arg_13_0, arg_13_1)
	if arg_13_0 then
		local var_13_0 = CSV.MultiTableLookup(CSV.itemSourceTable.fileList, CSV.itemSourceTable.cols.refName, arg_13_0, CSV.itemSourceTable.cols.gameSourceID) or ""

		if var_13_0 == "" then
			var_13_0 = LUI.GAME_SOURCE_ID.MODERN_WARFARE
		end

		return var_13_0 == arg_13_1
	end

	return false
end

function OPERATOR.IsDefaultOperator(arg_14_0)
	if arg_14_0 then
		return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_14_0, CSV.operators.cols.factionRef) == "DEFAULT"
	end

	return true
end

function OPERATOR.IsS4Operator(arg_15_0)
	return var_0_7(arg_15_0, LUI.GAME_SOURCE_ID.VANGUARD)
end

function OPERATOR.IsT9Operator(arg_16_0)
	return var_0_7(arg_16_0, LUI.GAME_SOURCE_ID.COLD_WAR)
end

function OPERATOR.IsMWOperator(arg_17_0)
	return var_0_7(arg_17_0, LUI.GAME_SOURCE_ID.MODERN_WARFARE)
end

function OPERATOR.IsWZOperator(arg_18_0)
	return var_0_7(arg_18_0, LUI.GAME_SOURCE_ID.WARZONE)
end

function OPERATOR.IsCDLOperator(arg_19_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_19_0, CSV.operators.cols.factionRef) == "CDL"
end

function OPERATOR.IsLaunchOperator(arg_20_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_20_0, CSV.operators.cols.isLaunchOperator) == "1"
end

function OPERATOR.IsRandomOperator(arg_21_0)
	return arg_21_0 == RANDOM.ref
end

function OPERATOR.IsRandomFavOperator(arg_22_0)
	return arg_22_0 == RANDOM.favRef
end

function OPERATOR.IsT9DefaultOperator(arg_23_0)
	return ({
		t9st1_western = true,
		t9st4_western = true,
		t9st2_western = true,
		t9st5_western = true
	})[arg_23_0] or false
end

function OPERATOR.DoesSkinHaveOverrides(arg_24_0, arg_24_1, arg_24_2)
	if arg_24_0 == "default_western" then
		return arg_24_2 == OPERATOR.DefaultWestHead and arg_24_1 == OPERATOR.DefaultWestBody
	else
		return arg_24_2 == OPERATOR.DefaultEastHead and arg_24_1 == OPERATOR.DefaultEastBody
	end

	return false
end

function OPERATOR.HasWeaponClassOverridesForSkin(arg_25_0, arg_25_1, arg_25_2)
	if OPERATOR.IsDefaultOperator(arg_25_0) then
		return OPERATOR.DoesSkinHaveOverrides(arg_25_0, arg_25_1, arg_25_2)
	end

	return false
end

function OPERATOR.GetDefaultLaunchOperatorForSuperfaction(arg_26_0)
	return arg_26_0 == OPERATOR.SuperFaction.WEST and OPERATOR.WestDefaultLaunchRef or OPERATOR.EastDefaultLaunchRef
end

function OPERATOR.GetWeaponAccessoryModelFromLoadout(arg_27_0)
	local var_27_0 = OPERATOR.GetSelectedOperatorIndex(arg_27_0)
	local var_27_1 = OPERATOR.GetEquippedOperatorRef(arg_27_0, var_27_0)

	if OPERATOR.IsT9Operator(var_27_1) then
		return WATCH.WatchNoneValue
	end

	local var_27_2 = WATCH.GetEquippedWatch(arg_27_0)

	if var_27_2 == WATCH.WatchNoneValue then
		return WATCH.WatchNoneValue
	end

	local var_27_3 = WATCH.GetFullModelName(var_27_2, true)

	if var_27_3 and #var_27_3 > 0 then
		return var_27_3
	end

	return WATCH.WatchNoneValue
end

function OPERATOR.IsStowedWeaponClassAllowed(arg_28_0)
	return arg_28_0 ~= WEAPON.SMGClass and arg_28_0 ~= WEAPON.ARClass and arg_28_0 ~= WEAPON.MELEEClass2
end

function OPERATOR.IsStowedWeaponAllowed(arg_29_0)
	return arg_29_0 ~= WEAPON.Knife
end

function OPERATOR.IsStowedWeaponAllowedInPreviewScreens(arg_30_0)
	return arg_30_0 ~= WEAPON.FrontEndRiotShield and arg_30_0 ~= WEAPON.RiotShield and arg_30_0 ~= WEAPON.FrontEndRiotShield_V2 and arg_30_0 ~= WEAPON.RiotShield_V2 and arg_30_0 ~= WEAPON.FrontEndRiotShield_V4 and arg_30_0 ~= WEAPON.RiotShield_V4
end

function OPERATOR.ShouldStripAttachments(arg_31_0)
	return arg_31_0 == WEAPON.pistolClass
end

function OPERATOR.CheckForAccessoryOverride(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0
	local var_32_1 = StringTable.BJJBBCJGEJ(CSV.bodies.file, CSV.bodies.cols.model, arg_32_0)

	if var_32_1 < 0 then
		local var_32_2 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.bodyModelHighRes, arg_32_2, CSV.operatorSkins.cols.bodyModel)

		if #var_32_2 > 0 then
			var_32_0 = StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.model, var_32_2, CSV.bodies.cols.hideWatch)
		end
	else
		var_32_0 = StringTable.CBGJCDIHCE(CSV.bodies.file, var_32_1, CSV.bodies.cols.hideWatch)
	end

	if var_32_0 == "1" then
		return WATCH.WatchNoneValue
	end

	if var_32_1 >= 0 then
		local var_32_3 = StringTable.CBGJCDIHCE(CSV.bodies.file, var_32_1, CSV.bodies.cols.watchStyle)

		if #var_32_3 > 0 then
			if var_32_3 == "hide" then
				return WATCH.WatchNoneValue
			end

			return WATCH.GetOverride(arg_32_1, var_32_3)
		end
	end

	return arg_32_1
end

function OPERATOR.ValidateAccessoryModel(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_1

	if not LUI.FindLast(arg_33_1, "_lod1") then
		arg_33_1 = arg_33_1 .. "_lod1"
	end

	arg_33_0 = arg_33_0 or WATCH.WatchNoneValue

	if arg_33_0 ~= WATCH.WatchNoneValue then
		arg_33_0 = OPERATOR.CheckForAccessoryOverride(arg_33_1, arg_33_0, var_33_0)
	end

	return arg_33_0
end

function OPERATOR.TryOverrideStowedWeapon(arg_34_0, arg_34_1)
	if arg_34_1 == WEAPON.NoneValue then
		return WEAPON.NoneValue
	end

	local var_34_0 = WEAPON.GetWeaponDetailsFromModel(arg_34_1)

	if not OPERATOR.IsStowedWeaponClassAllowed(var_34_0.weaponClass) then
		return WEAPON.NoneValue
	end

	if not OPERATOR.IsStowedWeaponAllowed(var_34_0.weaponAsset) then
		return WEAPON.NoneValue
	end

	return arg_34_1
end

function OPERATOR.SetClientCharacterScriptableState(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = OPERATOR.GetOperatorSkinRef(arg_35_1, arg_35_2)
	local var_35_1 = OPERATOR.GetUltraScriptableState(var_35_0)

	if var_35_1 == "" then
		ClientCharacter.JCCJBADEG(arg_35_0, "ultra_operators", "neutral")
	else
		ClientCharacter.JCCJBADEG(arg_35_0, "ultra_operators", var_35_1)
	end
end

function OPERATOR.InternalSetupClientCharacter(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5, arg_36_6)
	if not arg_36_0 then
		DebugPrint("InternalSetupClientCharacter() -> character param is nil, setup was skipped")

		return
	end

	arg_36_5 = arg_36_5 and OPERATOR.TryOverrideStowedWeapon(arg_36_0, arg_36_5)

	if arg_36_1 and arg_36_2 then
		ClientCharacter.DFHIIAGHDG(arg_36_0, arg_36_1, arg_36_2)
		OPERATOR.SetClientCharacterScriptableState(arg_36_0, arg_36_1, arg_36_2)
	end

	if arg_36_3 and #arg_36_3 > 0 then
		ClientCharacter.CAECDIHFCF(arg_36_0, arg_36_3)
	end

	if arg_36_4 then
		ClientCharacter.FHCIHJDAB(arg_36_0, arg_36_4, arg_36_5, arg_36_6)
	end
end

function OPERATOR.InternalShowCharacterAndWeaponWhenLoaded(arg_37_0, arg_37_1, arg_37_2)
	arg_37_2 = arg_37_2 or {}

	local var_37_0

	local function var_37_1()
		FrontEndScene.SetCharacterVisible(arg_37_1, true)

		if not arg_37_2.isPet then
			ClientCharacter.DGGEBHHGJG(arg_37_1, not arg_37_2.hideWeapon)
		end
	end

	local var_37_2

	local function var_37_3()
		if ClientCharacter.IJFGGGBAB(arg_37_1) and ClientCharacter.EBDDCJHAHD(arg_37_1) then
			var_37_1()
		else
			arg_37_0:Wait(100, true).onComplete = var_37_3
		end
	end

	if arg_37_0 then
		var_37_3()
	else
		var_37_1()
	end
end

function OPERATOR.UpdateClientCharacter(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	arg_40_3 = arg_40_3 or {}

	FrontEndScene.SetCharacterVisible(arg_40_0, false, arg_40_3.defaultAnim)
	OPERATOR.InternalSetupClientCharacter(arg_40_0, arg_40_1, arg_40_2, arg_40_3.operatorPose, arg_40_3.weaponModel, arg_40_3.secondaryModel, arg_40_3.accessoryModel)

	if arg_40_3.showCharacter then
		OPERATOR.InternalShowCharacterAndWeaponWhenLoaded(arg_40_3.element, arg_40_0, arg_40_3)
	end
end

function OPERATOR.GetCharacterTweenContainer(arg_41_0, arg_41_1)
	local var_41_0 = "tweenContainer" .. arg_41_1

	if not arg_41_0[var_41_0] then
		arg_41_0[var_41_0] = LUI.UIElement.new()

		arg_41_0:addElement(arg_41_0[var_41_0])
	end

	return arg_41_0[var_41_0]
end

function OPERATOR.UpdatePet(arg_42_0, arg_42_1, arg_42_2)
	arg_42_2 = arg_42_2 or {}

	local var_42_0 = arg_42_2.hideAnim or "chr_menu_mp_squad_dog_01"

	FrontEndScene.SetCharacterVisible(arg_42_1, false, var_42_0)

	if arg_42_2.execution and not arg_42_2.executionPet then
		arg_42_2.executionPet = OPERATOR.GetExecutionPet(arg_42_2.execution)
	end

	if arg_42_2.executionPet and #arg_42_2.executionPet > 0 then
		local var_42_1 = StringTable.BJJBBCJGEJ(CSV.pets.file, CSV.pets.cols.ref, arg_42_2.executionPet)

		if not var_42_1 or var_42_1 == -1 then
			local var_42_2 = "Failed to find pet row entry for petRef: " .. arg_42_2.executionPet .. "; likely missing from CSV.pets.file: " .. CSV.pets.file

			OPERATOR.NotifyPetRefError(arg_42_2.executionPet, var_42_2)

			return
		end

		local var_42_3 = CSV.ReadRow(CSV.pets, var_42_1)

		if not var_42_3 or not arg_42_1 then
			DebugPrint("Invalid Pet Data or PetIndex Found!")
			LUI.FlowManager.RequestDevErrorPopup("Invalid Pet Data or PetIndex Found!")

			return
		end

		ClientCharacter.DFHIIAGHDG(arg_42_1, var_42_3.body)

		local var_42_4 = arg_42_2.idle and var_42_3.idleAnim or OPERATOR.GetPetWalk(arg_42_0, var_42_1, arg_42_1)

		if var_42_4 then
			ClientCharacter.CAECDIHFCF(arg_42_1, var_42_4)
		else
			DebugPrint("Unable to find Pet Animation")
			LUI.FlowManager.RequestDevErrorPopup("Unable to find Pet Animation")
		end

		if arg_42_2.element then
			local var_42_5 = OPERATOR.GetCharacterTweenContainer(arg_42_2.element, arg_42_1)

			OPERATOR.InternalShowCharacterAndWeaponWhenLoaded(var_42_5, arg_42_1, {
				isPet = true
			})
		end
	end
end

function OPERATOR.GetPetWalk(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = StringTable.CBGJCDIHCE(CSV.pets.file, arg_43_1, CSV.pets.cols.walkAnimsStart + 1)

	if var_43_0 and #var_43_0 > 0 then
		return OPERATOR.GetRandomPetWalk(arg_43_0, arg_43_1, arg_43_2)
	else
		return StringTable.CBGJCDIHCE(CSV.pets.file, arg_43_1, CSV.pets.cols.walkAnimsStart)
	end
end

function OPERATOR.GetRandomPetWalk(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = LUI.DataSourceInGlobalModel.new("frontend.randomDogWalk." .. arg_44_1 .. "." .. arg_44_2)
	local var_44_1 = var_44_0:GetValue(arg_44_0)

	if not var_44_1 or #var_44_1 == 0 then
		local var_44_2 = {}

		for iter_44_0 = CSV.pets.cols.walkAnimsStart, CSV.pets.cols.walkAnimsEnd do
			local var_44_3 = StringTable.CBGJCDIHCE(CSV.pets.file, arg_44_1, iter_44_0)

			if var_44_3 and #var_44_3 > 0 then
				table.insert(var_44_2, var_44_3)
			end
		end

		if #var_44_2 <= 0 then
			assert(false, "Pet in row" .. arg_44_1 .. " doesn't have any walk anims setup.")
		end

		var_44_1 = var_44_2[math.random(1, #var_44_2)]

		var_44_0:SetValue(arg_44_0, var_44_1)
	end

	return var_44_1
end

function OPERATOR.GetWeaponDataFromLoadout(arg_45_0)
	local var_45_0 = LOADOUT.GetFavoriteLoadoutWeapons(arg_45_0)
	local var_45_1 = var_45_0.primaryWeaponModel
	local var_45_2 = var_45_0.secondaryWeaponModel
	local var_45_3 = WEAPON.GetWeaponDetailsFromModel(var_45_2)

	if OPERATOR.ShouldStripAttachments(var_45_3.weaponClass) and var_45_3.weaponRef and #var_45_3.weaponRef > 0 then
		var_45_2 = WEAPON.GetWeaponModelNameFromRef(var_45_3.weaponRef)
	end

	return var_45_1, var_45_2
end

function OPERATOR.GetEquippedItemForLootType(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = PlayerData.BFFBGAJGD(arg_46_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	if arg_46_2 == LOOT.itemTypes.OPERATOR_SKIN then
		return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.lootIndex, var_46_0.operatorCustomization[arg_46_1].skin:get(), CSV.operatorSkins.cols.ref)
	elseif arg_46_2 == LOOT.itemTypes.OPERATOR_EXECUTION then
		return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.lootIndex, var_46_0.operatorCustomization[arg_46_1].execution:get(), CSV.operatorExecutions.cols.ref)
	elseif arg_46_2 == LOOT.itemTypes.OPERATOR_TAUNT then
		return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.lootIndex, var_46_0.operatorCustomization[arg_46_1].taunt:get(), CSV.operatorQuips.cols.ref)
	elseif arg_46_2 == LOOT.itemTypes.OPERATOR_INTRO then
		return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.lootIndex, var_46_0.operatorCustomization[arg_46_1].intro:get(), CSV.operatorIntros.cols.ref)
	end
end

function OPERATOR.GetEquippedItemIndexForLootType(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = PlayerData.BFFBGAJGD(arg_47_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	if var_47_0.operatorCustomization[arg_47_1] == nil then
		local var_47_1 = "Failed to find operatorCustomization entry for operatorRef: " .. arg_47_1 .. "; likely missing from .customizationSetup in PlayerData." .. "IO."

		OPERATOR.NotifyOperatorRefError(arg_47_1, var_47_1)

		return
	end

	if arg_47_2 == LOOT.itemTypes.OPERATOR_SKIN then
		return var_47_0.operatorCustomization[arg_47_1].skin:get()
	elseif arg_47_2 == LOOT.itemTypes.OPERATOR_EXECUTION then
		return var_47_0.operatorCustomization[arg_47_1].execution:get()
	elseif arg_47_2 == LOOT.itemTypes.OPERATOR_TAUNT then
		return var_47_0.operatorCustomization[arg_47_1].taunt:get()
	elseif arg_47_2 == LOOT.itemTypes.OPERATOR_INTRO then
		return var_47_0.operatorCustomization[arg_47_1].intro:get()
	end
end

function OPERATOR.SetEquippedItemForLootType(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	local var_48_0 = PlayerData.BFFBGAJGD(arg_48_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	if var_48_0.operatorCustomization[arg_48_1] == nil then
		local var_48_1 = "Failed to find operatorCustomization entry for operatorRef: " .. arg_48_1 .. ", with lootIndex: " .. arg_48_3 .. "; likely missing from .customizationSetup in PlayerData." .. "IO."

		OPERATOR.NotifyOperatorRefError(arg_48_1, var_48_1)

		return
	end

	if arg_48_2 == LOOT.itemTypes.OPERATOR_SKIN then
		var_48_0.operatorCustomization[arg_48_1].skin:set(arg_48_3)
	elseif arg_48_2 == LOOT.itemTypes.OPERATOR_EXECUTION then
		var_48_0.operatorCustomization[arg_48_1].execution:set(arg_48_3)
	elseif arg_48_2 == LOOT.itemTypes.OPERATOR_TAUNT then
		var_48_0.operatorCustomization[arg_48_1].taunt:set(arg_48_3)
	elseif arg_48_2 == LOOT.itemTypes.OPERATOR_INTRO then
		var_48_0.operatorCustomization[arg_48_1].intro:set(arg_48_3)
	end
end

function OPERATOR.GetConfigString(arg_49_0)
	local var_49_0 = ""
	local var_49_1 = PlayerData.BFFBGAJGD(arg_49_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_49_2 = var_49_1.operators[OPERATOR.SuperFaction.WEST]:get()
	local var_49_3 = var_49_1.operators[OPERATOR.SuperFaction.EAST]:get()
	local var_49_4 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, var_49_2)
	local var_49_5 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, var_49_3)

	if var_49_4 then
		var_49_0 = var_49_0 .. "+" .. var_49_4
	end

	if var_49_5 then
		var_49_0 = var_49_0 .. "+" .. var_49_5
	end

	if #var_49_0 > 0 then
		var_49_0 = string.sub(var_49_0, 2)
	end

	return var_49_0
end

function OPERATOR.GetCosmeticConfigString(arg_50_0, arg_50_1)
	local var_50_0 = ""
	local var_50_1 = PlayerData.BFFBGAJGD(arg_50_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_50_2 = var_50_1.operatorCustomization[arg_50_0].skin:get()
	local var_50_3 = var_50_1.operatorCustomization[arg_50_0].execution:get()
	local var_50_4 = var_50_1.operatorCustomization[arg_50_0].taunt:get()
	local var_50_5 = OPERATOR.GetCosmeticRefByLootTypeAndIndex(LOOT.itemTypes.OPERATOR_SKIN, var_50_2)
	local var_50_6 = OPERATOR.GetCosmeticRefByLootTypeAndIndex(LOOT.itemTypes.OPERATOR_EXECUTION, var_50_3)
	local var_50_7 = OPERATOR.GetCosmeticRefByLootTypeAndIndex(LOOT.itemTypes.OPERATOR_TAUNT, var_50_4)
	local var_50_8 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, arg_50_0)
	local var_50_9 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR_SKIN, var_50_5)
	local var_50_10 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR_EXECUTION, var_50_6)
	local var_50_11 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR_TAUNT, var_50_7)

	if var_50_8 then
		var_50_0 = var_50_0 .. "+" .. var_50_8
	end

	if var_50_9 then
		var_50_0 = var_50_0 .. "+" .. var_50_9
	end

	if var_50_10 then
		var_50_0 = var_50_0 .. "+" .. var_50_10
	end

	if var_50_11 then
		var_50_0 = var_50_0 .. "+" .. var_50_11
	end

	if #var_50_0 > 0 then
		var_50_0 = string.sub(var_50_0, 2)
	end

	return var_50_0
end

function OPERATOR.IsSkinGlobal(arg_51_0)
	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_51_0, CSV.operatorSkins.cols.isGlobal) == "1"
end

function OPERATOR.IsExecutionMWExclusive(arg_52_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_52_0, CSV.operatorExecutions.cols.operatorRef) == OPERATOR.MWExclusiveExecutionRef
end

function OPERATOR.IsExecutionT9Exclusive(arg_53_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_53_0, CSV.operatorExecutions.cols.operatorRef) == OPERATOR.T9ExclusiveExecutionRef
end

function OPERATOR.IsExecutionS4Exclusive(arg_54_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_54_0, CSV.operatorExecutions.cols.operatorRef) == OPERATOR.S4ExclusiveExecutionRef
end

function OPERATOR.GetGender(arg_55_0)
	assert(arg_55_0)

	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_55_0, CSV.operators.cols.gender)
end

function OPERATOR.GetName(arg_56_0)
	assert(arg_56_0)

	if arg_56_0 then
		return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_56_0, CSV.operators.cols.name)
	end
end

function OPERATOR.GetIcon(arg_57_0)
	assert(arg_57_0)

	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_57_0, CSV.operators.cols.icon)
end

function OPERATOR.GetLootIcon(arg_58_0)
	assert(arg_58_0)

	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_58_0, CSV.operators.cols.lootImage)
end

function OPERATOR.GetIntroVideo(arg_59_0)
	assert(arg_59_0)

	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_59_0, CSV.operators.cols.introVideo)
end

function OPERATOR.IsIntroVideoEncrypted(arg_60_0)
	assert(arg_60_0)

	local var_60_0 = tonumber(StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_60_0, CSV.operators.cols.introVideoEncrypted))

	return var_60_0 and var_60_0 == 1
end

function OPERATOR.GetDefaultSkin(arg_61_0)
	assert(arg_61_0)

	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_61_0, CSV.operators.cols.defaultSkin)
end

function OPERATOR.GetSkinID(arg_62_0)
	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_62_0, CSV.operatorSkins.cols.lootIndex)
end

function OPERATOR.GetSkinRef(arg_63_0)
	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.lootIndex, arg_63_0, CSV.operatorSkins.cols.ref)
end

function OPERATOR.GetSkinName(arg_64_0)
	assert(arg_64_0)

	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_64_0, CSV.operatorSkins.cols.name)
end

function OPERATOR.GetSkinDesc(arg_65_0)
	assert(arg_65_0)

	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_65_0, CSV.operatorSkins.cols.desc)
end

function OPERATOR.GetSkinIcon(arg_66_0)
	assert(arg_66_0)

	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_66_0, CSV.operatorSkins.cols.icon)
end

function OPERATOR.GetLootSkinImage(arg_67_0)
	assert(arg_67_0)

	return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_67_0, CSV.operatorSkins.cols.lootImage)
end

function OPERATOR.GetEquippedOperatorName(arg_68_0, arg_68_1)
	local var_68_0 = PlayerData.BFFBGAJGD(arg_68_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	return Engine.CBBHFCGDIC(OPERATOR.GetName(var_68_0.operators[arg_68_1]:get()))
end

function OPERATOR.GetExecutionID(arg_69_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_69_0, CSV.operatorExecutions.cols.lootIndex)
end

function OPERATOR.GetExecutionRef(arg_70_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.lootIndex, arg_70_0, CSV.operatorExecutions.cols.ref)
end

function OPERATOR.GetExecutionPet(arg_71_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.lootIndex, arg_71_0, CSV.operatorExecutions.cols.pet)
end

function OPERATOR.GetPetModel(arg_72_0)
	return StringTable.DIFCHIGDFB(CSV.pets.file, CSV.pets.cols.ref, arg_72_0, CSV.pets.cols.body)
end

function OPERATOR.GetPetHideAnim(arg_73_0)
	return StringTable.DIFCHIGDFB(CSV.pets.file, CSV.pets.cols.ref, arg_73_0, CSV.pets.cols.hideAnim)
end

function OPERATOR.GetExecutionVideo(arg_74_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_74_0, CSV.operatorExecutions.cols.videoPreview)
end

function OPERATOR.GetTauntVideo(arg_75_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_75_0, CSV.operatorQuips.cols.lootImage)
end

function OPERATOR.GetIntroImage(arg_76_0)
	return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_76_0, CSV.operatorIntros.cols.imagePreview)
end

function OPERATOR.GetExecutionName(arg_77_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_77_0, CSV.operatorExecutions.cols.name)
end

function OPERATOR.GetExecutionDesc(arg_78_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_78_0, CSV.operatorExecutions.cols.desc)
end

function OPERATOR.GetExecutionIcon(arg_79_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_79_0, CSV.operatorExecutions.cols.icon)
end

function OPERATOR.GetExecutionLootImage(arg_80_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_80_0, CSV.operatorExecutions.cols.lootImage)
end

function OPERATOR.GetExecutionBattlepassImage(arg_81_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_81_0, CSV.operatorExecutions.cols.battlepassImage)
end

function OPERATOR.GetExecutionSeason(arg_82_0)
	return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_82_0, CSV.operatorExecutions.cols.season)
end

function OPERATOR.GetQuipID(arg_83_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_83_0, CSV.operatorQuips.cols.lootIndex)
end

function OPERATOR.GetQuipName(arg_84_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_84_0, CSV.operatorQuips.cols.name)
end

function OPERATOR.GetQuipIcon(arg_85_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_85_0, CSV.operatorQuips.cols.icon)
end

function OPERATOR.GetQuipLootImage(arg_86_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_86_0, CSV.operatorQuips.cols.lootImage)
end

function OPERATOR.GetQuipAlias(arg_87_0)
	if not arg_87_0 then
		return
	end

	local var_87_0 = StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_87_0, CSV.operatorQuips.cols.operatorRef)

	if not var_87_0 or #var_87_0 <= 0 then
		return
	end

	local var_87_1 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, var_87_0, CSV.operators.cols.voice)

	if not var_87_1 or #var_87_1 <= 0 then
		return
	end

	local var_87_2 = StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_87_0, CSV.operatorQuips.cols.alias)

	if not var_87_2 or #var_87_2 <= 0 then
		return
	end

	return "dx_mpp_" .. var_87_1 .. "_flavor_player_execution" .. var_87_2
end

function OPERATOR.GetTauntRef(arg_88_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.lootIndex, arg_88_0, CSV.operatorQuips.cols.ref)
end

function OPERATOR.GetTauntName(arg_89_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_89_0, CSV.operatorQuips.cols.name)
end

function OPERATOR.GetTauntDesc(arg_90_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_90_0, CSV.operatorQuips.cols.desc)
end

function OPERATOR.GetTauntIcon(arg_91_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_91_0, CSV.operatorQuips.cols.icon)
end

function OPERATOR.GetTauntSeason(arg_92_0)
	return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_92_0, CSV.operatorQuips.cols.season)
end

function OPERATOR.GetIntroName(arg_93_0)
	return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_93_0, CSV.operatorIntros.cols.name)
end

function OPERATOR.GetIntroDesc(arg_94_0)
	return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_94_0, CSV.operatorIntros.cols.desc)
end

function OPERATOR.GetIntroIcon(arg_95_0)
	return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_95_0, CSV.operatorIntros.cols.icon)
end

function OPERATOR.GetIntroSeason(arg_96_0)
	return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_96_0, CSV.operatorIntros.cols.season)
end

function OPERATOR.GetSkinOwnerRef(arg_97_0)
	local var_97_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_97_0, CSV.operatorSkins.cols.operatorRef)

	if var_97_0 and #var_97_0 > 0 then
		return var_97_0
	end
end

function OPERATOR.GetQuipOwnerRef(arg_98_0)
	local var_98_0 = StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_98_0, CSV.operatorQuips.cols.operatorRef)

	if var_98_0 and #var_98_0 > 0 then
		return var_98_0
	end
end

function OPERATOR.GetExecutionOwnerRef(arg_99_0)
	local var_99_0 = StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_99_0, CSV.operatorExecutions.cols.operatorRef)

	if var_99_0 and #var_99_0 > 0 then
		return var_99_0
	else
		OPERATOR.NotifyOperatorRefError(arg_99_0, "OPERATOR.GetExecutionOwnerRef failed to find in: " .. CSV.operatorExecutions.file)
	end
end

function OPERATOR.GetSkinOwnerName(arg_100_0)
	if OPERATOR.IsSkinGlobal(arg_100_0) then
		return "LOOT_MP/OPERATOR"
	else
		local var_100_0 = OPERATOR.GetSkinOwnerRef(arg_100_0)

		if var_100_0 then
			return OPERATOR.GetName(var_100_0)
		end
	end
end

function OPERATOR.GetQuipOwnerName(arg_101_0)
	local var_101_0 = OPERATOR.GetQuipOwnerRef(arg_101_0)

	return OPERATOR.GetName(var_101_0)
end

function OPERATOR.NotifyOperatorRefError(arg_102_0, arg_102_1)
	if Dvar.IBEGCHEFE("ui_killswitch_baddata_notification_operatorref") then
		return
	end

	if arg_102_0 then
		local var_102_0 = "Bad data error on Operator ref: " .. tostring(arg_102_0) .. ", " .. arg_102_1

		DebugPrint(var_102_0)

		if not CONDITIONS.IsQABotSkipActive() then
			LUI.FlowManager.RequestDevErrorPopup(Engine.CBBHFCGDIC("MENU/ERROR"), var_102_0)
		end
	end
end

function OPERATOR.NotifyPetRefError(arg_103_0, arg_103_1)
	if Dvar.IBEGCHEFE("ui_killswitch_baddata_notification_petref") then
		return
	end

	if arg_103_0 then
		local var_103_0 = "Bad data error on Pet ref: " .. tostring(arg_103_0) .. ", " .. arg_103_1

		DebugPrint(var_103_0)

		if not CONDITIONS.IsQABotSkipActive() then
			LUI.FlowManager.RequestDevErrorPopup(Engine.CBBHFCGDIC("MENU/ERROR"), var_103_0)
		end
	end
end

function OPERATOR.GetExecutionOwnerName(arg_104_0)
	if OPERATOR.IsExecutionMWExclusive(arg_104_0) then
		return "LOOT_MP/OPERATOR"
	elseif OPERATOR.IsExecutionT9Exclusive(arg_104_0) then
		return "LOOT_MP/T9_OPERATOR"
	elseif OPERATOR.IsExecutionS4Exclusive(arg_104_0) then
		return "LOOT_MP/S4_OPERATOR"
	else
		local var_104_0 = OPERATOR.GetExecutionOwnerRef(arg_104_0)

		return OPERATOR.GetName(var_104_0)
	end
end

function OPERATOR.GetOperatorSkinRef(arg_105_0, arg_105_1)
	local var_105_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.bodyModel, arg_105_0, CSV.operators.cols.ref)

	if not var_105_0 or #var_105_0 <= 0 then
		var_105_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.headModel, arg_105_1, CSV.operators.cols.ref)
	end

	return var_105_0
end

function OPERATOR.GetOperatorFactionRef(arg_106_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_106_0, CSV.operators.cols.factionRef)
end

function OPERATOR.GetOperatorSuperFactionRef(arg_107_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_107_0, CSV.operators.cols.superfaction)
end

function OPERATOR.GetSuperFactionIndexForPlayerData(arg_108_0)
	if CONDITIONS.IsMagmaGameMode() then
		return OPERATOR.WZ_OPERATOR_INDEX
	else
		return tonumber(OPERATOR.GetOperatorSuperFactionRef(arg_108_0))
	end
end

function OPERATOR.GetFactionIcon(arg_109_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_109_0, CSV.operators.cols.factionIcon)
end

function OPERATOR.GetFactionName(arg_110_0)
	local var_110_0 = OPERATOR.GetOperatorFactionRef(arg_110_0)

	if var_110_0 and #var_110_0 > 0 then
		return StringTable.DIFCHIGDFB(CSV.FactionTable.file, CSV.FactionTable.cols.ref, var_110_0, CSV.FactionTable.cols.name)
	end
end

function OPERATOR.GetViewHandsForOperator(arg_111_0)
	return StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.model, arg_111_0, CSV.bodies.cols.armModel)
end

function OPERATOR.GetFavoriteOperatorRef(arg_112_0)
	local var_112_0 = OPERATOR.GetSelectedOperatorIndex(arg_112_0)

	return (OPERATOR.GetEquippedOperatorRef(arg_112_0, var_112_0))
end

function OPERATOR.GetEquippedOperatorRef(arg_113_0, arg_113_1)
	return (PlayerData.BFFBGAJGD(arg_113_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[arg_113_1]:get())
end

function OPERATOR.GetEquippedOperatorData(arg_114_0, arg_114_1)
	local var_114_0 = PlayerData.BFFBGAJGD(arg_114_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[arg_114_1]:get()
	local var_114_1 = StringTable.BJJBBCJGEJ(CSV.operators.file, CSV.operators.cols.ref, var_114_0)

	return CSV.ReadRow(CSV.operators, var_114_1)
end

function OPERATOR.GetEquippedSkinForOperator(arg_115_0, arg_115_1)
	local var_115_0 = PlayerData.BFFBGAJGD(arg_115_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	arg_115_1 = arg_115_1 == RANDOM.favRef and RANDOM.ref or arg_115_1

	local var_115_1 = var_115_0.operatorCustomization[arg_115_1].skin:get()

	assert(var_115_1)

	return OPERATOR.GetOperatorSkin(arg_115_0, var_115_1, arg_115_1)
end

function OPERATOR.GetWeaponClassDefaultOperatorSkin(arg_116_0, arg_116_1, arg_116_2)
	local var_116_0 = LOADOUT.GetFavoriteLoadoutIndex(arg_116_0)
	local var_116_1 = PlayerData.BFFBGAJGD(arg_116_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[var_116_0].weaponSetups[0]
	local var_116_2 = arg_116_2 or var_116_1.weapon:get()
	local var_116_3
	local var_116_4
	local var_116_5 = WEAPON.GetWeaponClass(var_116_2)

	for iter_116_0 = 0, StringTable.BFHCAIIDA(CSV.defaultOperatorSkins.file) - 1 do
		local var_116_6 = StringTable.CBGJCDIHCE(CSV.defaultOperatorSkins.file, iter_116_0, CSV.defaultOperatorSkins.cols.weaponClass)
		local var_116_7 = StringTable.CBGJCDIHCE(CSV.defaultOperatorSkins.file, iter_116_0, CSV.defaultOperatorSkins.cols.operatorRef)

		if var_116_6 == var_116_5 and var_116_7 == arg_116_1 then
			var_116_4 = StringTable.CBGJCDIHCE(CSV.defaultOperatorSkins.file, iter_116_0, CSV.defaultOperatorSkins.cols.bodyModel)
			var_116_3 = StringTable.CBGJCDIHCE(CSV.defaultOperatorSkins.file, iter_116_0, CSV.defaultOperatorSkins.cols.headModel)

			return var_116_3, var_116_4
		end
	end

	if arg_116_1 == "default_western" then
		var_116_3 = OPERATOR.DefaultWestHead
		var_116_4 = OPERATOR.DefaultWestBody
	else
		var_116_3 = OPERATOR.DefaultEastHead
		var_116_4 = OPERATOR.DefaultEastBody
	end

	return var_116_3, var_116_4
end

function OPERATOR.GetOperatorSkin(arg_117_0, arg_117_1, arg_117_2)
	local var_117_0 = {}

	if not (arg_117_1 == nil) then
		local var_117_1 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.lootIndex, arg_117_1, CSV.operatorSkins.cols.headModel)
		local var_117_2 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.lootIndex, arg_117_1, CSV.operatorSkins.cols.bodyModel)

		if OPERATOR.HasWeaponClassOverridesForSkin(arg_117_2, var_117_2, var_117_1) then
			var_117_1, var_117_2 = OPERATOR.GetWeaponClassDefaultOperatorSkin(arg_117_0, arg_117_2)
		end

		local var_117_3 = OPERATOR.GetSkinsCSVFile(arg_117_2)
		local var_117_4 = StringTable.DIFCHIGDFB(var_117_3.file, var_117_3.cols.headModel, var_117_1, var_117_3.cols.headModelHighRes)
		local var_117_5 = StringTable.DIFCHIGDFB(var_117_3.file, var_117_3.cols.bodyModel, var_117_2, var_117_3.cols.bodyModelHighRes)

		var_117_0.headModel = #var_117_4 > 0 and var_117_4 or var_117_1
		var_117_0.bodyModel = #var_117_5 > 0 and var_117_5 or var_117_2

		if #var_117_0.bodyModel <= 0 or #var_117_0.headModel <= 0 then
			var_117_0.bodyModel = OPERATOR.proxyBody
			var_117_0.headModel = OPERATOR.proxyHead
		end
	else
		var_117_0.bodyModel = OPERATOR.proxyBody
		var_117_0.headModel = OPERATOR.proxyHead
	end

	return var_117_0
end

function OPERATOR.GetOperatorSkinByRef(arg_118_0, arg_118_1, arg_118_2)
	local var_118_0 = {}
	local var_118_1 = {
		headModel = OPERATOR.proxyHead,
		bodyModel = OPERATOR.proxyBody
	}

	if arg_118_1 == RANDOM.lootID then
		return var_118_1
	end

	local var_118_2 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_118_1, CSV.operatorSkins.cols.headModel)
	local var_118_3 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_118_1, CSV.operatorSkins.cols.bodyModel)

	if OPERATOR.HasWeaponClassOverridesForSkin(arg_118_2, var_118_3, var_118_2) then
		var_118_2, var_118_3 = OPERATOR.GetWeaponClassDefaultOperatorSkin(arg_118_0, arg_118_2)
	else
		local var_118_4 = {
			{
				col = CSV.operatorSkins.cols.ref,
				key = arg_118_1
			},
			{
				col = CSV.operatorSkins.cols.operatorRef,
				key = arg_118_2
			}
		}
		local var_118_5 = StringTable.BABCABFJEJ(CSV.operatorSkins.file, var_118_4)

		var_118_2 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, var_118_5, CSV.operatorSkins.cols.headModel)
		var_118_3 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, var_118_5, CSV.operatorSkins.cols.bodyModel)
	end

	local var_118_6 = OPERATOR.GetSkinsCSVFile(arg_118_2)
	local var_118_7 = StringTable.DIFCHIGDFB(var_118_6.file, var_118_6.cols.headModel, var_118_2, var_118_6.cols.headModelHighRes)
	local var_118_8 = StringTable.DIFCHIGDFB(var_118_6.file, var_118_6.cols.bodyModel, var_118_3, var_118_6.cols.bodyModelHighRes)

	var_118_0.headModel = #var_118_7 > 0 and var_118_7 or var_118_2
	var_118_0.bodyModel = #var_118_8 > 0 and var_118_8 or var_118_3

	if #var_118_0.bodyModel <= 0 or #var_118_0.headModel <= 0 then
		return var_118_1
	end

	return var_118_0
end

function OPERATOR.SetSelectedOperatorIndex(arg_119_0, arg_119_1)
	PlayerData.BFFBGAJGD(arg_119_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.selectedOperatorIndex:set(arg_119_1)
	Engine.DAGFFDGFII("uploadstats", arg_119_0)
end

function OPERATOR.SetIsOperatorSelected(arg_120_0, arg_120_1)
	assert(arg_120_1 and type(arg_120_1) == "table" and arg_120_1.operatorInfo, "You must provide a table with a property/value for operatorInfo.")

	local var_120_0 = arg_120_1.operatorInfo
	local var_120_1 = OPERATOR.GetSuperFactionIndexForPlayerData(var_120_0.ref)
	local var_120_2 = PlayerData.BFFBGAJGD(arg_120_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[var_120_1]:get()
	local var_120_3 = {
		operatorFaction = var_120_1
	}

	if RANDOM.IsEnabled(arg_120_0, LOOT.itemTypes.OPERATOR, var_120_3) then
		local var_120_4 = OPERATOR.IsRandomOperator(var_120_0.ref)

		if RANDOM.GetIsRandomFavorite(arg_120_0, tonumber(var_120_0.lootIndex)) then
			return true
		elseif var_120_4 and not RANDOM.GetFavoriteEnabled(arg_120_0) then
			return true
		end
	else
		return var_120_2 == var_120_0.ref
	end

	return false
end

function OPERATOR.GetSelectedOperatorIndex(arg_121_0)
	return PlayerData.BFFBGAJGD(arg_121_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.selectedOperatorIndex:get()
end

function OPERATOR.GetEquippedOperatorSkin(arg_122_0, arg_122_1)
	local var_122_0 = PlayerData.BFFBGAJGD(arg_122_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_122_1 = var_122_0.operators[arg_122_1]:get()
	local var_122_2 = var_122_0.operatorCustomization[var_122_1].skin:get()

	assert(var_122_2)

	local var_122_3 = OPERATOR.GetOperatorSkin(arg_122_0, var_122_2, var_122_1)

	return var_122_3.bodyModel, var_122_3.headModel
end

function OPERATOR.GetPetForEquippedOperator(arg_123_0, arg_123_1)
	local var_123_0 = PlayerData.BFFBGAJGD(arg_123_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[arg_123_1]:get()

	return OPERATOR.GetPetForOperator(arg_123_0, var_123_0)
end

function OPERATOR.GetPetForOperator(arg_124_0, arg_124_1)
	local var_124_0 = OPERATOR.GetExecutionForOperator(arg_124_0, arg_124_1)

	return OPERATOR.GetExecutionPet(var_124_0)
end

function OPERATOR.GetOperatorSeason(arg_125_0)
	local var_125_0 = "loot/operator_ids.csv"
	local var_125_1 = 5

	return StringTable.DIFCHIGDFB(var_125_0, CSV.operators.cols.ref, arg_125_0, var_125_1)
end

function OPERATOR.GetLootIDFromRef(arg_126_0)
	local var_126_0 = "loot/operator_ids.csv"

	return StringTable.DIFCHIGDFB(var_126_0, CSV.lootIDs.cols.ref, arg_126_0, CSV.lootIDs.cols.index)
end

function OPERATOR.IsUnlockedInPrivate(arg_127_0)
	return StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_127_0, CSV.operators.cols.unlockedInPrivate) == "1"
end

function OPERATOR.IsUnlockedInIGR(arg_128_0)
	local var_128_0 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_128_0, CSV.operators.cols.unlockedInIGR)

	if string.find(var_128_0, "_igr_") then
		return Dvar.CFHDGABACF(var_128_0) == 1
	end

	if var_128_0 == "1" then
		return true
	end

	return false
end

function OPERATOR.IsUnlocked(arg_129_0, arg_129_1)
	assert(arg_129_1)

	if OPERATOR.IsRandomOperator(arg_129_1) or OPERATOR.IsRandomFavOperator(arg_129_1) then
		return true
	end

	local var_129_0 = LOOT.IsUnlocked(arg_129_0, LOOT.itemTypes.OPERATOR, arg_129_1)

	if IsSystemLink() or IsPrivateMatch() and not CONDITIONS.IsThirdGameMode() or MLG.IsCDLActive(arg_129_0) or CONDITIONS.IsInGameBattlesMatch() then
		var_129_0 = var_129_0 or OPERATOR.IsUnlockedInPrivate(arg_129_1)
	end

	if Engine.GEHBEDCEC() then
		var_129_0 = var_129_0 or OPERATOR.IsUnlockedInIGR(arg_129_1)
	end

	return var_129_0
end

function OPERATOR.GetUnlockMethod(arg_130_0, arg_130_1, arg_130_2)
	if arg_130_1 == LOOT.itemTypes.OPERATOR_SKIN then
		return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_130_2, CSV.operatorSkins.cols.unlockType)
	elseif arg_130_1 == LOOT.itemTypes.OPERATOR_EXECUTION then
		return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, arg_130_2, CSV.operatorExecutions.cols.unlockType)
	elseif arg_130_1 == LOOT.itemTypes.OPERATOR_TAUNT then
		return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_130_2, CSV.operatorQuips.cols.unlockType)
	elseif arg_130_1 == LOOT.itemTypes.OPERATOR_INTRO then
		return StringTable.DIFCHIGDFB(CSV.operatorIntros.file, CSV.operatorIntros.cols.ref, arg_130_2, CSV.operatorIntros.cols.unlockType)
	end
end

function OPERATOR.GetItemValue(arg_131_0, arg_131_1, arg_131_2)
	return LOOT.GetItemCost(arg_131_1, arg_131_2)
end

function OPERATOR.GetIdleAnimations(arg_132_0)
	local var_132_0 = {}
	local var_132_1 = CSV.operatorSelectAnimations.cols.idleAnimationsEnd - CSV.operatorSelectAnimations.cols.idleAnimationsStart + 1

	for iter_132_0 = 0, var_132_1 - 1 do
		local var_132_2 = StringTable.CBGJCDIHCE(CSV.operatorSelectAnimations.file, arg_132_0, CSV.operatorSelectAnimations.cols.idleAnimationsStart + iter_132_0)

		if var_132_2 and var_132_2 ~= "" then
			table.insert(var_132_0, var_132_2)
		end
	end

	return var_132_0
end

function OPERATOR.GetEquipAnimations(arg_133_0)
	local var_133_0 = {}
	local var_133_1 = CSV.operatorSelectAnimations.cols.equipAnimationsEnd - CSV.operatorSelectAnimations.cols.equipAnimationsStart + 1

	for iter_133_0 = 0, var_133_1 - 1 do
		local var_133_2 = StringTable.CBGJCDIHCE(CSV.operatorSelectAnimations.file, arg_133_0, CSV.operatorSelectAnimations.cols.equipAnimationsStart + iter_133_0)

		if var_133_2 and var_133_2 ~= "" then
			table.insert(var_133_0, var_133_2)
		end
	end

	return var_133_0
end

function OPERATOR.GetTransitionInfoFromAnimation(arg_134_0)
	local var_134_0 = StringTable.BJJBBCJGEJ(CSV.operatorSelectAnimationTransitions.file, CSV.operatorSelectAnimationTransitions.cols.ref, arg_134_0)
	local var_134_1 = CSV.ReadRow(CSV.operatorSelectAnimationTransitions, var_134_0)
	local var_134_2 = 0
	local var_134_3 = 0
	local var_134_4

	if var_134_1.blendTime and #var_134_1.blendTime > 0 then
		var_134_2 = tonumber(var_134_1.blendTime)
	end

	if var_134_1.startTime and #var_134_1.startTime > 0 then
		var_134_3 = tonumber(var_134_1.startTime)
	end

	if var_134_1.notetrack and #var_134_1.notetrack > 0 then
		var_134_4 = var_134_1.notetrack
	end

	return var_134_2, var_134_3, var_134_4
end

function OPERATOR.GetTurnIdleAnimation(arg_135_0, arg_135_1, arg_135_2)
	arg_135_2 = arg_135_2 or 0

	local var_135_0 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_135_0, CSV.operators.cols.gender)

	return (StringTable.DIFCHIGDFB(CSV.operatorTurnAnimations.file, CSV.operatorTurnAnimations.cols.gender, var_135_0, CSV.operatorTurnAnimations.cols.idleFront + arg_135_2))
end

function OPERATOR.GetTurnLeftAnimation(arg_136_0, arg_136_1, arg_136_2)
	arg_136_2 = arg_136_2 or 0

	local var_136_0 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_136_0, CSV.operators.cols.gender)

	return (StringTable.DIFCHIGDFB(CSV.operatorTurnAnimations.file, CSV.operatorTurnAnimations.cols.gender, var_136_0, CSV.operatorTurnAnimations.cols.leftTurnFront + arg_136_2))
end

function OPERATOR.GetTurnRightAnimation(arg_137_0, arg_137_1, arg_137_2)
	arg_137_2 = arg_137_2 or 0

	local var_137_0 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_137_0, CSV.operators.cols.gender)

	return (StringTable.DIFCHIGDFB(CSV.operatorTurnAnimations.file, CSV.operatorTurnAnimations.cols.gender, var_137_0, CSV.operatorTurnAnimations.cols.rightTurnFront + arg_137_2))
end

function OPERATOR.GetWeaponPosesTable()
	local var_138_0 = {}

	for iter_138_0 = 0, StringTable.BFHCAIIDA(CSV.operatorWeaponPoses.file) - 1 do
		local var_138_1 = CSV.ReadRow(CSV.operatorWeaponPoses, iter_138_0)

		if var_138_1.weaponType ~= "" then
			if not var_138_0[var_138_1.weaponType] then
				var_138_0[var_138_1.weaponType] = {}
			end

			if not var_138_0[var_138_1.weaponType][var_138_1.superfaction] then
				var_138_0[var_138_1.weaponType][var_138_1.superfaction] = {}
			end

			if not var_138_0[var_138_1.weaponType][var_138_1.superfaction][var_138_1.gender] then
				var_138_0[var_138_1.weaponType][var_138_1.superfaction][var_138_1.gender] = {}
			end

			table.insert(var_138_0[var_138_1.weaponType][var_138_1.superfaction][var_138_1.gender], var_138_1.pose)
		end
	end

	return var_138_0
end

function OPERATOR.GetSkinsForOperator(arg_139_0, arg_139_1, arg_139_2, arg_139_3)
	assert(arg_139_0)

	return OPERATOR.GetSkinsForOperators({
		[arg_139_0] = true
	}, arg_139_1, arg_139_2, arg_139_3)[arg_139_0] or {}
end

function OPERATOR.CreateSkinCache()
	for iter_140_0, iter_140_1 in pairs(OPERATOR.CachedSkinRefs) do
		return
	end

	OPERATOR.CachedSkinRefs = {}

	local var_140_0 = StringTable.BFHCAIIDA(CSV.operatorSkins.file)

	for iter_140_2 = 0, var_140_0 - 1 do
		local var_140_1 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, iter_140_2, CSV.operatorSkins.cols.operatorRef)

		if not OPERATOR.CachedSkinRefs[var_140_1] then
			OPERATOR.CachedSkinRefs[var_140_1] = {}
		end

		local var_140_2 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, iter_140_2, CSV.operatorSkins.cols.ref)

		table.insert(OPERATOR.CachedSkinRefs[var_140_1], var_140_2)
	end
end

function OPERATOR.GetFirstUnlockedSkin(arg_141_0, arg_141_1)
	OPERATOR.CreateSkinCache()

	if OPERATOR.UnlockedSkinRefs[arg_141_0] then
		return OPERATOR.UnlockedSkinRefs[arg_141_0]
	end

	if OPERATOR.CachedSkinRefs[arg_141_0] then
		local var_141_0 = OPERATOR.CachedSkinRefs[arg_141_0]

		for iter_141_0 = 1, #var_141_0 do
			if LOOT.IsUnlocked(arg_141_1, LOOT.itemTypes.OPERATOR_SKIN, var_141_0[iter_141_0]) then
				OPERATOR.UnlockedSkinRefs[arg_141_0] = var_141_0[iter_141_0]

				return var_141_0[iter_141_0]
			end
		end

		return false
	end
end

function OPERATOR.GetFirstUnlockedExecution(arg_142_0, arg_142_1)
	local var_142_0 = OPERATOR.GetExecutionsForOperator(nil, arg_142_0, arg_142_1)

	if #var_142_0 > 0 then
		return var_142_0[1].ref
	end
end

function OPERATOR.GetFirstUnlockedTaunt(arg_143_0, arg_143_1)
	local var_143_0 = OPERATOR.GetTauntsForOperator(nil, arg_143_0, arg_143_1)

	if #var_143_0 > 0 then
		return var_143_0[1].ref
	end
end

function OPERATOR.GetSkinsForOperators(arg_144_0, arg_144_1, arg_144_2, arg_144_3)
	assert(arg_144_0)

	local var_144_0 = {}
	local var_144_1
	local var_144_2 = arg_144_2 or Dvar.IBEGCHEFE("NLTNQNSMQK")

	if var_144_2 then
		var_144_1 = {}
	end

	local var_144_3 = StringTable.BFHCAIIDA(CSV.operatorSkins.file)

	for iter_144_0 = 0, var_144_3 - 1 do
		local var_144_4 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, iter_144_0, CSV.operatorSkins.cols.operatorRef)

		if arg_144_0[var_144_4] then
			local var_144_5 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, iter_144_0, CSV.operatorSkins.cols.ref)
			local var_144_6 = LOOT.IsUnlocked(arg_144_1, LOOT.itemTypes.OPERATOR_SKIN, var_144_5)

			if not var_144_6 and Engine.GEHBEDCEC() and OPERATOR.IsUnlockedInIGR(var_144_4) and OPERATOR.GetDefaultSkin(var_144_4) == var_144_5 then
				var_144_6 = true
			end

			if not var_144_6 and Engine.CJJAFGIFAC(arg_144_1) or var_144_6 then
				local var_144_7 = CSV.ReadRow(CSV.operatorSkins, iter_144_0)

				var_144_7.rarity = LOOT.GetItemQuality(LOOT.itemTypes.OPERATOR_SKIN, var_144_7.ref)
				var_144_7.season = LOOT.GetItemSeason(LOOT.itemTypes.OPERATOR_SKIN, var_144_7.ref)
				var_144_7.isUnlocked = var_144_6
				var_144_7.lootId = tostring(LOOT.GetItemID(LOOT.itemTypes.OPERATOR_SKIN, var_144_7.ref))

				if var_144_7.lootId ~= "1" then
					if CONDITIONS.IsWZWipFlowEnabled() then
						LUI.InsertPlatformValidatedDataIntoTable(var_144_0, var_144_7)
					else
						table.insert(var_144_0, var_144_7)
					end

					if var_144_2 then
						var_144_1[var_144_7.lootId] = var_144_7
					end
				end
			end
		end
	end

	if var_144_2 then
		local var_144_8 = Challenge.GetChallengeDataForSkinLootIds(arg_144_1, var_144_1)

		for iter_144_1, iter_144_2 in pairs(var_144_1) do
			iter_144_2.challengeData = var_144_8[iter_144_1]
		end
	end

	local var_144_9 = {}
	local var_144_10 = BATTLEPASS.GetItemTable()

	for iter_144_3, iter_144_4 in ipairs(var_144_0) do
		local var_144_11 = arg_144_3 and iter_144_4.challengeData and not Challenge.IsMissionCurrent(arg_144_1, iter_144_4.challengeData.id)

		if iter_144_4.isUnlocked or iter_144_4.challengeData and not var_144_11 or var_144_10[iter_144_4.lootId] then
			if not var_144_9[iter_144_4.operatorRef] then
				var_144_9[iter_144_4.operatorRef] = {}
			end

			table.insert(var_144_9[iter_144_4.operatorRef], iter_144_4)
		end
	end

	return var_144_9
end

function OPERATOR.GetOperatorSkinMap(arg_145_0, arg_145_1)
	assert(arg_145_0)

	local var_145_0 = {}
	local var_145_1 = {}
	local var_145_2 = Engine.CJJAFGIFAC(arg_145_1)
	local var_145_3 = StringTable.BFHCAIIDA(CSV.operatorSkins.file)

	for iter_145_0 = 0, var_145_3 - 1 do
		local var_145_4 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, iter_145_0, CSV.operatorSkins.cols.operatorRef)

		if arg_145_0[var_145_4] then
			local var_145_5 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, iter_145_0, CSV.operatorSkins.cols.ref)
			local var_145_6 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR_SKIN, var_145_5)
			local var_145_7 = not var_145_6 or LOOT.IsUnlockedWithID(arg_145_1, var_145_6)

			if not var_145_7 and Engine.GEHBEDCEC() and OPERATOR.IsUnlockedInIGR(var_145_4) and OPERATOR.GetDefaultSkin(var_145_4) == var_145_5 then
				var_145_7 = true
			end

			if not var_145_7 and var_145_2 or var_145_7 then
				local var_145_8 = false

				if CONDITIONS.IsWZWipFlowEnabled() then
					local var_145_9 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, iter_145_0, CSV.operatorSkins.cols.platformExclusiveType)

					if LUI.IsValidPlatformExclusiveType(var_145_9) then
						var_145_8 = true
					end
				else
					var_145_8 = true
				end

				if var_145_8 then
					var_145_1[var_145_6] = var_145_4
				end
			end
		end
	end

	return Challenge.GetChallengeIndexForSkinLootIds(arg_145_1, var_145_1)
end

function OPERATOR.GetOutfitChallengeDetailsFromObjective(arg_146_0, arg_146_1)
	local var_146_0
	local var_146_1 = 1
	local var_146_2 = 1

	for iter_146_0 = 1, #arg_146_1 do
		local var_146_3 = arg_146_1[iter_146_0].objectives

		for iter_146_1 = 1, #var_146_3 do
			if var_146_3[iter_146_1].id == arg_146_0 then
				var_146_0 = arg_146_1[iter_146_0]
				var_146_1 = iter_146_1
				var_146_2 = iter_146_0

				break
			end
		end

		if var_146_0 then
			break
		end
	end

	assert(var_146_0)

	return {
		challenge = var_146_0,
		objectiveIndex = var_146_1,
		missionIndex = var_146_2
	}
end

function OPERATOR.GetOutfitMissionQuestsForOperator(arg_147_0, arg_147_1, arg_147_2)
	return OPERATOR.GetOutfitMissionQuestsForOperators({
		[arg_147_0] = true
	}, arg_147_1, arg_147_2)[arg_147_0]
end

function OPERATOR.GetOutfitMissionQuestsForOperators(arg_148_0, arg_148_1, arg_148_2)
	local var_148_0 = {}
	local var_148_1 = {}
	local var_148_2 = OPERATOR.GetOperatorSkinMap(arg_148_0, arg_148_1)
	local var_148_3 = SEASON.GetCurrentSeasonDataNum()

	local function var_148_4(arg_149_0, arg_149_1)
		local var_149_0

		for iter_149_0, iter_149_1 in ipairs(arg_149_0) do
			var_149_0 = var_148_2[iter_149_1.rowIndex]

			if var_149_0 ~= nil then
				break
			end
		end

		if var_149_0 == nil and #arg_149_0 > 0 then
			var_149_0 = StringTable.DIFCHIGDFB(CSV.missionIDs.file, CSV.missionIDs.cols.ref, arg_149_0[1].id, CSV.missionIDs.cols.operatorRef)
		end

		if var_149_0 ~= nil and var_149_0 ~= "" then
			if not var_148_1[var_149_0] then
				var_148_1[var_149_0] = {}
			end

			local var_149_1 = arg_149_1.isOwned or arg_149_1.season == var_148_3
			local var_149_2 = arg_148_2 ~= nil
			local var_149_3 = not arg_149_1.isBattlePassLocked and arg_149_1.battlePassLevelToUnlock
			local var_149_4 = arg_149_1.isBattlePassLocked and arg_149_1.season == var_148_3

			if var_149_2 or var_149_1 or var_149_3 or var_149_4 then
				table.insert(var_148_1[var_149_0], arg_149_1)
			end

			return true
		end

		return false
	end

	local function var_148_5(arg_150_0)
		return false
	end

	local var_148_6 = Challenge.GetQuestsForMissionChallenges(arg_148_1, {
		Challenge.Operator
	})

	if arg_148_2 then
		local var_148_7 = {}

		for iter_148_0, iter_148_1 in ipairs(var_148_6.questIDs) do
			local var_148_8 = var_148_6.quests[iter_148_1]
			local var_148_9 = false

			for iter_148_2 = 1, #var_148_8 do
				if var_148_8[iter_148_2].id == arg_148_2 then
					var_148_9 = true

					break
				end
			end

			if not var_148_9 then
				table.insert(var_148_7, iter_148_0)
			end
		end

		if #var_148_7 > 0 then
			for iter_148_3 = #var_148_7, 1, -1 do
				table.remove(var_148_6.questIDs, var_148_7[iter_148_3])
			end
		end
	end

	Challenge.GetMissionsForQuests(arg_148_1, var_148_6, nil, var_148_5, var_148_4)

	return var_148_1
end

function OPERATOR.CreateExecutionCache()
	OPERATOR.CachedExecutionRefs = {}

	local var_151_0 = StringTable.BFHCAIIDA(CSV.operatorExecutions.file)

	for iter_151_0 = 0, var_151_0 - 1 do
		local var_151_1 = CSV.ReadRow(CSV.operatorExecutions, iter_151_0)

		if var_151_1 and var_151_1.hideInUI ~= "1" then
			if not OPERATOR.CachedExecutionRefs[var_151_1.operatorRef] then
				OPERATOR.CachedExecutionRefs[var_151_1.operatorRef] = {}
			end

			table.insert(OPERATOR.CachedExecutionRefs[var_151_1.operatorRef], var_151_1)
		end
	end

	OPERATOR.CachedExecutionRefs.__init = true
end

function OPERATOR.GetExecutionsForOperator(arg_152_0, arg_152_1, arg_152_2)
	assert(arg_152_1)

	local var_152_0 = {}

	if not OPERATOR.CachedExecutionRefs.__init then
		OPERATOR.CreateExecutionCache()
	end

	local var_152_1 = {}

	if OPERATOR.CachedExecutionRefs[arg_152_1] ~= nil then
		for iter_152_0 = 1, #OPERATOR.CachedExecutionRefs[arg_152_1] do
			var_152_1[iter_152_0] = OPERATOR.CachedExecutionRefs[arg_152_1][iter_152_0]
		end
	end

	local var_152_2 = OPERATOR.CachedExecutionRefs[OPERATOR.MWExclusiveExecutionRef]
	local var_152_3 = OPERATOR.CachedExecutionRefs[OPERATOR.T9ExclusiveExecutionRef]
	local var_152_4 = OPERATOR.CachedExecutionRefs[OPERATOR.S4ExclusiveExecutionRef]
	local var_152_5 = OPERATOR.IsT9Operator(arg_152_1)
	local var_152_6 = OPERATOR.IsS4Operator(arg_152_1)
	local var_152_7

	if var_152_5 then
		var_152_7 = var_152_3
	elseif var_152_6 then
		var_152_7 = var_152_4
	else
		var_152_7 = var_152_2
	end

	if var_152_7 ~= nil then
		for iter_152_1 = 1, #var_152_7 do
			var_152_1[#var_152_1 + 1] = var_152_7[iter_152_1]
		end
	end

	for iter_152_2 = 1, #var_152_1 do
		local var_152_8 = var_152_1[iter_152_2]

		if var_152_8 then
			var_152_8.isUnlocked = LOOT.IsUnlocked(arg_152_2, LOOT.itemTypes.OPERATOR_EXECUTION, var_152_8.ref)

			if var_152_8.isUnlocked then
				var_152_8.rarity = LOOT.GetItemQuality(LOOT.itemTypes.OPERATOR_EXECUTION, var_152_8.ref)
				var_152_8.season = LOOT.GetItemSeason(LOOT.itemTypes.OPERATOR_EXECUTION, var_152_8.ref)
				var_152_8.uiPriority = var_152_8.uiPriority or 30

				table.insert(var_152_0, var_152_8)
			end
		end
	end

	return var_152_0
end

function OPERATOR.CreateTauntCache()
	OPERATOR.CachedTauntRefs = {}

	local var_153_0 = StringTable.BFHCAIIDA(CSV.operatorQuips.file)

	for iter_153_0 = 0, var_153_0 - 1 do
		local var_153_1 = CSV.ReadRow(CSV.operatorQuips, iter_153_0)

		if var_153_1 then
			if not OPERATOR.CachedTauntRefs[var_153_1.operatorRef] then
				OPERATOR.CachedTauntRefs[var_153_1.operatorRef] = {}
			end

			table.insert(OPERATOR.CachedTauntRefs[var_153_1.operatorRef], var_153_1)
		end
	end

	OPERATOR.CachedTauntRefs.__init = true
end

function OPERATOR.GetTauntsForOperator(arg_154_0, arg_154_1, arg_154_2)
	assert(arg_154_1)

	local var_154_0 = {}

	if not OPERATOR.CachedTauntRefs.__init then
		OPERATOR.CreateTauntCache()
	end

	local var_154_1 = OPERATOR.CachedTauntRefs[arg_154_1] or {}

	for iter_154_0 = 1, #var_154_1 do
		local var_154_2 = var_154_1[iter_154_0]

		if var_154_2 then
			var_154_2.isUnlocked = LOOT.IsUnlocked(arg_154_2, LOOT.itemTypes.OPERATOR_TAUNT, var_154_2.ref)

			if var_154_2.isUnlocked then
				var_154_2.rarity = LOOT.GetItemQuality(LOOT.itemTypes.OPERATOR_TAUNT, var_154_2.ref)
				var_154_2.season = LOOT.GetItemSeason(LOOT.itemTypes.OPERATOR_TAUNT, var_154_2.ref)
				var_154_2.uiPriority = var_154_2.uiPriority or 30

				table.insert(var_154_0, var_154_2)
			end
		end
	end

	return var_154_0
end

function OPERATOR.GetIntrosForOperator(arg_155_0, arg_155_1, arg_155_2)
	assert(arg_155_1)

	local var_155_0 = {}
	local var_155_1 = StringTable.BFHCAIIDA(CSV.operatorIntros.file)

	for iter_155_0 = 0, var_155_1 - 1 do
		local var_155_2 = CSV.ReadRow(CSV.operatorIntros, iter_155_0)

		if var_155_2 and var_155_2.operatorRef == arg_155_1 then
			var_155_2.isUnlocked = true

			table.insert(var_155_0, var_155_2)
		end
	end

	return var_155_0
end

function OPERATOR.GetOperatorsForSuperfaction(arg_156_0, arg_156_1)
	assert(arg_156_1)

	local var_156_0 = {}
	local var_156_1 = StringTable.BFHCAIIDA(CSV.operators.file)

	for iter_156_0 = 0, var_156_1 - 1 do
		local var_156_2 = CSV.ReadRow(CSV.operators, iter_156_0)

		if var_156_2 and tonumber(var_156_2.displayOrder) >= 0 and tonumber(var_156_2.superfaction) == arg_156_1 then
			table.insert(var_156_0, var_156_2)
		end
	end

	table.sort(var_156_0, OPERATOR.Internal_SortByDisplayOrder)

	return var_156_0
end

function OPERATOR.GetExecutionForOperator(arg_157_0, arg_157_1)
	return PlayerData.BFFBGAJGD(arg_157_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operatorCustomization[arg_157_1].execution:get()
end

function OPERATOR.CheckCustomizationsShouldBeEquipped(arg_158_0)
	if not Dvar.IBEGCHEFE("NRQQOMLOQL") then
		return
	end

	local var_158_0 = OPERATOR.GetSelectedOperatorIndex(arg_158_0)
	local var_158_1 = OPERATOR.GetEquippedOperatorRef(arg_158_0, var_158_0)

	if var_158_1 ~= nil then
		local var_158_2 = StringTable.BJJBBCJGEJ(CSV.operators.file, CSV.operators.cols.ref, var_158_1)

		if type(var_158_2) == "number" then
			local var_158_3 = CSV.ReadRow(CSV.operators, var_158_2)

			if var_158_3 then
				OPERATOR.ValidateEquippedCustomization(arg_158_0, var_158_1, var_158_3)
			end
		end
	end
end

function OPERATOR.ValidateEquippedCustomization(arg_159_0, arg_159_1, arg_159_2)
	local var_159_0 = PlayerData.BFFBGAJGD(arg_159_0, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operatorCustomization[arg_159_1]

	if OPERATOR.IsRandomOperator(arg_159_1) then
		return
	end

	if var_159_0 == nil then
		assert(false, arg_159_1 .. ", is missing an entry in the enum: Operator. FILE: loadout_mp.rddl")
	end

	local var_159_1 = var_159_0.skin:get()
	local var_159_2 = var_159_0.execution:get()
	local var_159_3 = var_159_0.taunt:get()

	if var_159_1 == 0 or not LOOT.IsUnlocked(arg_159_0, LOOT.itemTypes.OPERATOR_SKIN, OPERATOR.GetSkinRef(var_159_1)) then
		local var_159_4 = OPERATOR.GetFirstUnlockedSkin(arg_159_1, arg_159_0)

		if var_159_4 then
			local var_159_5 = OPERATOR.GetSkinID(var_159_4)

			var_159_0.skin:set(tonumber(var_159_5))
		elseif #arg_159_2.defaultSkin > 0 then
			local var_159_6 = OPERATOR.GetSkinID(arg_159_2.defaultSkin)

			if #var_159_6 > 0 then
				var_159_0.skin:set(tonumber(var_159_6))
			end
		end
	end

	if var_159_2 == 0 or not LOOT.IsUnlocked(arg_159_0, LOOT.itemTypes.OPERATOR_EXECUTION, OPERATOR.GetExecutionRef(var_159_2)) then
		local var_159_7 = OPERATOR.GetFirstUnlockedExecution(arg_159_1, arg_159_0)

		if var_159_7 then
			local var_159_8 = OPERATOR.GetExecutionID(var_159_7)

			var_159_0.execution:set(tonumber(var_159_8))
		elseif #arg_159_2.defaultExecution > 0 then
			local var_159_9 = OPERATOR.GetExecutionID(arg_159_2.defaultExecution)

			if #var_159_9 > 0 then
				var_159_0.execution:set(tonumber(var_159_9))
			end
		end
	end

	if var_159_3 == 0 or not LOOT.IsUnlocked(arg_159_0, LOOT.itemTypes.OPERATOR_TAUNT, OPERATOR.GetTauntRef(var_159_3)) then
		local var_159_10 = OPERATOR.GetFirstUnlockedTaunt(arg_159_1, arg_159_0)

		if var_159_10 then
			local var_159_11 = OPERATOR.GetQuipID(var_159_10)

			var_159_0.taunt:set(tonumber(var_159_11))
		elseif #arg_159_2.defaultQuip > 0 then
			local var_159_12 = OPERATOR.GetQuipID(arg_159_2.defaultQuip)

			if #var_159_12 > 0 then
				var_159_0.taunt:set(tonumber(var_159_12))
			end
		end
	end
end

function OPERATOR.OutfitMissionSortFn(arg_160_0, arg_160_1)
	if not arg_160_0.complete ~= not arg_160_1.complete then
		return arg_160_1.complete
	end

	if not arg_160_0.unlocked ~= not arg_160_1.unlocked then
		return arg_160_0.unlocked
	end

	if not arg_160_0.isBattlePassLocked ~= not arg_160_1.isBattlePassLocked then
		return not arg_160_0.isBattlePassLocked
	end

	if arg_160_0.progress ~= arg_160_1.progress then
		return arg_160_0.progress > arg_160_1.progress
	end

	return arg_160_0.id < arg_160_1.id
end

function OPERATOR.InsertRandomOperatorCategory(arg_161_0, arg_161_1, arg_161_2)
	local var_161_0 = RANDOM.GetItemData(arg_161_0)

	var_161_0.superfaction = arg_161_2
	arg_161_1[OPERATOR.RANDOM_FACTION] = {
		var_161_0
	}
	arg_161_1[OPERATOR.RANDOM_FACTION].displayOrder = -1
end

function OPERATOR.IsOperatorAvailableForSelection(arg_162_0, arg_162_1)
	local var_162_0 = true

	if Engine.GEHBEDCEC() or arg_162_1.hiddenWhenLocked == "1" then
		var_162_0 = OPERATOR.IsUnlocked(arg_162_0, arg_162_1.ref)
	end

	if Engine.ECAJCAJJGF() then
		var_162_0 = var_162_0 and (not CONDITIONS.IsWeGameGovBanned() or tonumber(arg_162_1.weGame) == 1)
	end

	if not CONDITIONS.IsMagmaGameMode() and arg_162_1.onlyInWarzone == "1" then
		var_162_0 = false
	end

	var_162_0 = var_162_0 and LOOT.IsItemRefEquippableForMode(LOOT.itemTypes.OPERATOR, arg_162_1.ref)

	return var_162_0
end

function OPERATOR.GetAllOperators(arg_163_0)
	local var_163_0 = {}
	local var_163_1 = {}

	var_163_0.east = {}
	var_163_0.west = {}

	var_0_2(arg_163_0)

	local var_163_2 = StringTable.BFHCAIIDA(CSV.operators.file)

	for iter_163_0 = 0, var_163_2 - 1 do
		local var_163_3 = CSV.ReadRow(CSV.operators, iter_163_0)
		local var_163_4 = OPERATOR.IsOperatorAvailableForSelection(arg_163_0, var_163_3)

		if var_163_3 and var_163_4 and tonumber(var_163_3.displayOrder) >= 0 then
			local var_163_5 = var_163_3.ref

			if var_163_3.factionRef ~= "DEFAULT" then
				OPERATOR.ValidateEquippedCustomization(arg_163_0, var_163_5, var_163_3)
			end

			local var_163_6 = var_163_3.factionRef
			local var_163_7 = math.floor(var_163_3.displayOrder)

			var_163_1[var_163_5] = var_163_3

			local var_163_8 = tonumber(var_163_3.superfaction) == OPERATOR.SuperFaction.EAST and var_163_0.east or var_163_0.west

			var_0_3(var_163_8, var_163_6, var_163_7, var_163_3)
		end
	end

	if OPERATOR.IsRandomFeatureEnabled() then
		OPERATOR.InsertRandomOperatorCategory(arg_163_0, var_163_0.west, OPERATOR.SuperFaction.WEST)
		OPERATOR.InsertRandomOperatorCategory(arg_163_0, var_163_0.east, OPERATOR.SuperFaction.EAST)
	end

	var_0_5(arg_163_0, var_163_1)

	local var_163_9 = {
		east = OPERATOR.Internal_GetFactionsSortedByDisplayOrder(var_163_0.east, OPERATOR.Internal_SortByDisplayOrder),
		west = OPERATOR.Internal_GetFactionsSortedByDisplayOrder(var_163_0.west, OPERATOR.Internal_SortByDisplayOrder)
	}

	var_0_6(var_163_0.east)
	var_0_6(var_163_0.west)

	return var_163_0, var_163_9
end

function OPERATOR.InsertRandomOperatorData(arg_164_0, arg_164_1)
	assert(arg_164_1 and type(arg_164_1) == "table" and arg_164_1.tableToInsertRandom and type(arg_164_1.tableToInsertRandom) == "table", "You must pass in options which include a property/value for the table to insert the random option.")

	if Dvar.IBEGCHEFE("TQRNTTMSL") then
		local var_164_0 = RANDOM.GetItemData(arg_164_0, {
			itemType = LOOT.itemTypes.OPERATOR,
			isFav = arg_164_1.isRandomFavorite
		})

		var_164_0.isRandomFavoriteAvailable = arg_164_1.isRandomFavoriteAvailable

		table.insert(arg_164_1.tableToInsertRandom, 1, var_164_0)
	end
end

function OPERATOR.GetOperatorIndex(arg_165_0, arg_165_1)
	assert(arg_165_0._currentOperators, "A table named '_currentOperators' that contains the current set operator data must be present in the referencing lua file.")

	local var_165_0 = 0

	for iter_165_0 = 1, #arg_165_0._currentOperators do
		if arg_165_0._currentOperators[iter_165_0].ref == arg_165_1 then
			return iter_165_0 - 1
		end
	end

	return var_165_0
end

function OPERATOR.DeselectOperator(arg_166_0, arg_166_1)
	if not arg_166_1 or type(arg_166_1) ~= "table" or not arg_166_1.operatorRef then
		assert(false, "You must provide a table of options that include a property/value for the operatorRef")
	end

	if arg_166_1.selectedOutsideOfGrid then
		return
	end

	assert(arg_166_0.Grid, "All Operator displays require a Grid Layout widget with the name 'Grid'. Please check your menu/widget in the UI Editor tool.")

	local var_166_0 = OPERATOR.GetOperatorIndex(arg_166_0, arg_166_1.operatorRef)
	local var_166_1 = arg_166_0.Grid:GetPositionForIndex(var_166_0, {
		relativePosition = false
	})
	local var_166_2 = arg_166_0.Grid:GetElementAtPosition(var_166_1.x, var_166_1.y)

	if var_166_2 then
		(var_166_2.Button ~= nil and var_166_2.Button or var_166_2):SetSelected(false)
	end
end

function OPERATOR.CheckValidOperatorParams(arg_167_0)
	if not arg_167_0 or type(arg_167_0) ~= "table" or not arg_167_0.operatorInfo then
		assert(false, "You must pass in a table of options which include a property/value for the operatorInfo.")
	end
end

function OPERATOR.EquipOperator(arg_168_0, arg_168_1, arg_168_2)
	OPERATOR.CheckValidOperatorParams(arg_168_2)

	local var_168_0 = arg_168_2.operatorInfo
	local var_168_1 = PlayerData.BFFBGAJGD(arg_168_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
	local var_168_2 = var_168_1.operators[OPERATOR.WZ_OPERATOR_INDEX]:get()
	local var_168_3 = {
		operatorFaction = OPERATOR.WZ_OPERATOR_INDEX
	}
	local var_168_4 = tonumber(var_168_0.lootIndex)
	local var_168_5 = RANDOM.SetFavoriteEnabled(arg_168_1, var_168_4)

	var_168_0.isRandom = var_168_4 == RANDOM.lootID
	var_168_3.isFav = var_168_5

	RANDOM.SetEnabled(arg_168_1, LOOT.itemTypes.OPERATOR, var_168_5 or var_168_0.isRandom, var_168_3)

	if var_168_2 ~= var_168_0.ref and arg_168_0._currentEquippedOperator ~= var_168_0.ref then
		OPERATOR.DeselectOperator(arg_168_0, {
			operatorRef = var_168_2,
			selectedOutsideOfGrid = arg_168_2.selectedOutsideOfGrid
		})

		if not var_168_0.isRandom and not var_168_0.isRandomFavorite then
			OPERATOR.DeselectOperator(arg_168_0, {
				operatorRef = RANDOM.ref,
				selectedOutsideOfGrid = arg_168_2.selectedOutsideOfGrid
			})
			OPERATOR.DeselectOperator(arg_168_0, {
				operatorRef = RANDOM.favRef,
				selectedOutsideOfGrid = arg_168_2.selectedOutsideOfGrid
			})
			var_168_1.operators[OPERATOR.WZ_OPERATOR_INDEX]:set(var_168_0.ref)
			var_168_1.selectedOperatorIndex:set(OPERATOR.WZ_OPERATOR_INDEX)
			OPERATOR.PlayEquippedAnimAndQueueIdle(arg_168_0, arg_168_1, {
				newEquipped = true,
				operatorInfo = var_168_0
			})
		end

		if arg_168_2.updateCallbackFunction then
			arg_168_2.updateCallbackFunction(arg_168_0, arg_168_1, {
				operatorInfo = var_168_0
			})
		end

		arg_168_0._currentEquippedOperator = var_168_0.ref
		var_168_0.isSelected = true

		local var_168_6 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SELECTED"),
			description = Engine.CBBHFCGDIC(var_168_0.name),
			type = LUI.ToastManager.NotificationType.OperatorEquipped,
			controllerIndex = arg_168_1
		}

		arg_168_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_168_6
		})
		Engine.DAGFFDGFII("uploadstats", arg_168_1)

		local var_168_7 = Engine.DCJHCAFIIA()
		local var_168_8 = OPERATOR.GetConfigString(arg_168_1)
		local var_168_9 = OPERATOR.GetConfigString(arg_168_1)

		METRICS.LootUsageSendDLogEvent(arg_168_0, {
			controllerIndex = arg_168_1,
			startTime = var_168_7,
			previousItemIDs = var_168_8,
			newItemIDs = var_168_9
		})
		Lobby.PreloadViewHandsForLocalPlayer(arg_168_1)
	end
end

function OPERATOR.SetFavorite(arg_169_0, arg_169_1, arg_169_2)
	if not arg_169_2 or type(arg_169_2) ~= "table" or not arg_169_2.operator or not arg_169_2.currentFavorites or not arg_169_2.currentCount then
		assert(false, "You must provide a table of options that includes the operator to be favorited. You must provide the current table of favorites as the player data only updates after the game is closed, thus you must track the additions in the current session.")
	end

	local var_169_0 = arg_169_2.operator
	local var_169_1 = var_169_0._operatorInfo
	local var_169_2 = var_169_1.ref
	local var_169_3 = arg_169_2.currentFavorites
	local var_169_4 = LOOT.GetFavoritesForType(LOOT.itemTypes.OPERATOR).count

	if OPERATOR.IsRandomOperator(var_169_2) or OPERATOR.IsRandomFavOperator(var_169_2) then
		Engine.BJDBIAGIDA(SOUND_SETS.default.deny)

		return
	end

	if var_169_3[var_169_2] then
		local var_169_5 = LOOT.RemoveFavoriteForType(LOOT.itemTypes.OPERATOR, var_169_2)

		assert(var_169_5, "An error occurred while attempting to remove this favorite from Player Data.")

		var_169_3[var_169_2] = nil
		var_169_1.favorited = false

		Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

		var_169_4 = var_169_4 - 1

		if arg_169_2.onSuccessfulRemoval then
			arg_169_2.onSuccessfulRemoval(arg_169_0, {
				updatedFavorites = var_169_3,
				favoriteCount = var_169_4
			})
		end

		if var_169_0.Favorited then
			ACTIONS.AnimateSequence(var_169_0.Favorited, "Off")
		end

		Engine.DAGFFDGFII("uploadstats", arg_169_1)
	elseif var_169_4 >= LOOT.MAX_FAVORITE_OPERATORS then
		Engine.BJDBIAGIDA(SOUND_SETS.default.deny)

		if arg_169_2.onUnsuccessful then
			arg_169_2.onUnsuccessful(arg_169_0, var_169_2)
		end
	else
		local var_169_6 = LOOT.AddFavoriteForType(LOOT.itemTypes.OPERATOR, var_169_2)

		assert(var_169_6, "An error occurred while attempting to favorite operator " .. var_169_2 .. " into the Player Data")

		var_169_3[var_169_2] = var_169_6
		var_169_1.favorited = true

		Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

		local var_169_7 = var_169_4 + 1

		if arg_169_2.onSuccessfulAdd then
			arg_169_2.onSuccessfulAdd(arg_169_0, {
				updatedFavorites = var_169_3,
				favoriteCount = var_169_7
			})
		end

		if var_169_0.Favorited then
			ACTIONS.AnimateSequence(var_169_0.Favorited, "On")
		end

		Engine.DAGFFDGFII("uploadstats", arg_169_1)
	end
end

function OPERATOR.GetWarzoneOperators(arg_170_0)
	local var_170_0 = {}
	local var_170_1 = {}
	local var_170_2 = var_0_4(arg_170_0, {
		operatorRefMap = var_170_0
	})

	var_170_1[OPERATOR.ALL_GAME_SOURCE_ID] = {}

	var_0_5(arg_170_0, var_170_0)
	OPERATOR.InsertRandomOperatorData(arg_170_0, {
		tableToInsertRandom = var_170_1[OPERATOR.ALL_GAME_SOURCE_ID]
	})

	for iter_170_0, iter_170_1 in pairs(LUI.GAME_SOURCE_ID) do
		if not var_170_1[iter_170_1] then
			var_170_1[iter_170_1] = {}
		end

		OPERATOR.InsertRandomOperatorData(arg_170_0, {
			tableToInsertRandom = var_170_1[iter_170_1]
		})
	end

	for iter_170_2 = 1, #var_170_2 do
		local var_170_3 = var_170_2[iter_170_2]
		local var_170_4 = OPERATOR.GetOperatorGameSourceID(var_170_3.ref)

		if var_170_4 ~= "" then
			if not var_170_1[var_170_4] then
				var_170_1[var_170_4] = {}
			end

			table.insert(var_170_1[OPERATOR.ALL_GAME_SOURCE_ID], var_170_3)
			table.insert(var_170_1[var_170_4], var_170_3)
		end
	end

	return var_170_1
end

function OPERATOR.GetOperatorsByFactionRef(arg_171_0, arg_171_1)
	local var_171_0 = {}

	for iter_171_0, iter_171_1 in pairs(arg_171_0) do
		if iter_171_1.factionRef == arg_171_1 then
			table.insert(var_171_0, iter_171_1)
		end
	end

	return var_171_0
end

function OPERATOR.GetOperatorChallenges(arg_172_0, arg_172_1)
	local var_172_0 = OPERATOR.GetLootIDFromRef(arg_172_1)

	if var_172_0 and var_172_0 ~= "" then
		return OperatorChallenges.BFAGEJGBJD(arg_172_0, tonumber(var_172_0))
	elseif var_172_0 == "" then
		DebugPrint("WARNING: Missing OperatorLootID for " .. arg_172_1 .. " in OperatorUtils:GetOperatorChallenges().")
	end
end

function OPERATOR.GetOtherChallenges(arg_173_0, arg_173_1)
	local var_173_0 = OPERATOR.GetLootIDFromRef(arg_173_1)

	if var_173_0 and var_173_0 ~= "" then
		return OperatorChallenges.DHAAFHCJDB(arg_173_0, tonumber(var_173_0))
	elseif var_173_0 == "" then
		DebugPrint("WARNING: Missing OperatorLootID for " .. arg_173_1 .. " in OperatorUtils:GetOtherChallenges().")
	end
end

function OPERATOR.GetVGMissionsForOperators(arg_174_0, arg_174_1)
	local var_174_0 = "xp"
	local var_174_1 = "icon_operator_xp"

	for iter_174_0, iter_174_1 in pairs(arg_174_1) do
		if OPERATOR.IsS4Operator(iter_174_0) then
			iter_174_1.challenges = OPERATOR.GetOtherChallenges(arg_174_0, iter_174_0)

			if iter_174_1.challenges then
				for iter_174_2, iter_174_3 in pairs(iter_174_1.challenges) do
					iter_174_3.name = StringTable.DIFCHIGDFB(CSV.operatorChallenges.file, CSV.operatorChallenges.cols.id, iter_174_3.id, CSV.operatorChallenges.cols.name)
					iter_174_3.desc = StringTable.DIFCHIGDFB(CSV.operatorChallenges.file, CSV.operatorChallenges.cols.id, iter_174_3.id, CSV.operatorChallenges.cols.desc)
					iter_174_3.amount = StringTable.DIFCHIGDFB(CSV.operatorChallenges.file, CSV.operatorChallenges.cols.id, iter_174_3.id, CSV.operatorChallenges.cols.amount)
					iter_174_3.isOwned = true
					iter_174_3.unlocked = true
					iter_174_3.progress = tonumber(iter_174_3.progress)

					local var_174_2 = LUI.Split(iter_174_3.amount, "|")
					local var_174_3 = StringTable.DIFCHIGDFB(CSV.operatorChallenges.file, CSV.operatorChallenges.cols.id, iter_174_3.id, CSV.operatorChallenges.cols.operatorXP)
					local var_174_4 = LUI.Split(var_174_3, "|")

					iter_174_3.objectives = {}
					iter_174_3.numObjectivesComplete = 0
					iter_174_3.complete = tonumber(var_174_2[#var_174_2]) <= iter_174_3.progress

					local var_174_5 = LUI.Split(var_174_4[#var_174_4], "@")
					local var_174_6 = {
						type = var_174_0,
						name = Engine.CBBHFCGDIC("CHALLENGE/N_XP", var_174_5[1]),
						image = var_174_1,
						rarityImage = LOOT.GetRarityImage(LOOT.Rarity.BASE),
						rarityColor = LOOT.GetRarityColor(LOOT.Rarity.BASE)
					}

					iter_174_3.rewards = {}
					iter_174_3.rewards[Challenge.Reward.XP] = var_174_6

					local var_174_7 = iter_174_3.progress

					for iter_174_4 = 1, #var_174_2 do
						if iter_174_3.progress >= tonumber(var_174_2[iter_174_4]) then
							iter_174_3.numObjectivesComplete = iter_174_4
						end

						local var_174_8 = LUI.Split(var_174_4[iter_174_4], "@")
						local var_174_9 = {
							type = var_174_0,
							name = Engine.CBBHFCGDIC("CHALLENGE/N_XP", var_174_8[1]),
							image = var_174_1,
							rarityImage = LOOT.GetRarityImage(LOOT.Rarity.BASE),
							rarityColor = LOOT.GetRarityColor(LOOT.Rarity.BASE)
						}
						local var_174_10 = {}

						table.insert(var_174_10, var_174_9)

						local var_174_11 = {
							amountEarned = iter_174_3.progress,
							amountNeeded = var_174_2[iter_174_4],
							progress = iter_174_3.progress,
							desc = iter_174_3.desc,
							amount = var_174_2[iter_174_4],
							rewards = var_174_10
						}

						table.insert(iter_174_3.objectives, var_174_11)
					end
				end
			end
		end
	end
end

function OPERATOR.GetFunctionalUnlocks(arg_175_0, arg_175_1)
	return {
		6,
		60013
	}
end

function OPERATOR.GetOperatorProgress(arg_176_0, arg_176_1)
	if var_0_0 and var_0_0.GetOperatorProgression then
		local var_176_0 = var_0_0.GetOperatorProgression(arg_176_1)

		return {
			rank = var_176_0.rank,
			xp = var_176_0.XP
		}
	end

	local var_176_1 = OPERATOR.GetOperatorChallenges(arg_176_0, arg_176_1)

	if var_176_1 ~= nil then
		return {
			rank = var_176_1.Challenges.rank,
			xp = var_176_1.Challenges.xp
		}
	end

	return {
		rank = 0,
		xp = 0
	}
end

function OPERATOR.SwitchFactionEast(arg_177_0)
	if arg_177_0.previousState ~= arg_177_0.currentState or arg_177_0.currentState == OPERATOR.SuperFaction.EAST then
		return
	end

	if arg_177_0.isCustomizationMenu then
		Engine.DHFCHIIJCA("character_faction_select_r_detail")
	else
		Engine.DHFCHIIJCA("character_faction_select_r")
	end

	arg_177_0.currentState = OPERATOR.SuperFaction.EAST

	return true
end

function OPERATOR.SwitchFactionWest(arg_178_0)
	if arg_178_0.previousState ~= arg_178_0.currentState or arg_178_0.currentState == OPERATOR.SuperFaction.WEST then
		return
	end

	if arg_178_0.isCustomizationMenu then
		Engine.DHFCHIIJCA("character_faction_select_l_detail")
	else
		Engine.DHFCHIIJCA("character_faction_select_l")
	end

	arg_178_0.currentState = OPERATOR.SuperFaction.WEST

	return true
end

function OPERATOR.SwitchFaction(arg_179_0)
	if arg_179_0.currentState == OPERATOR.SuperFaction.WEST then
		return OPERATOR.SwitchFactionEast(arg_179_0)
	else
		return OPERATOR.SwitchFactionWest(arg_179_0)
	end
end

function OPERATOR.IsRandomFeatureEnabled()
	return Dvar.IBEGCHEFE("TQRNTTMSL") and Dvar.IBEGCHEFE("LTNLRPSNSM")
end

function OPERATOR.GetClientCharacterForSuperFaction(arg_181_0)
	if arg_181_0 == OPERATOR.SuperFaction.WEST then
		return FrontEndScene.ClientCharacters.OperatorWest
	end

	return FrontEndScene.ClientCharacters.OperatorEast
end

function OPERATOR.IsOperatorMissionsAvailable(arg_182_0, arg_182_1)
	local var_182_0 = LUI.FlowManager.GetScopedData(arg_182_0)
	local var_182_1 = arg_182_0.currentState == OPERATOR.SuperFaction.WEST and var_182_0.operatorData.westSelectedOperatorOutfitMissionQuests or var_182_0.operatorData.eastSelectedOperatorOutfitMissionQuests
	local var_182_2 = arg_182_0.currentState == OPERATOR.SuperFaction.WEST and var_182_0.operatorData.westSelectedOperatorChallenges or nil

	if var_182_1 and #var_182_1 > 0 or var_182_2 and #var_182_2 > 0 then
		return true
	else
		return false
	end
end

function OPERATOR.OpenOperatorMissions(arg_183_0, arg_183_1, arg_183_2)
	local var_183_0 = LUI.FlowManager.GetScopedData(arg_183_0)

	var_183_0.operatorData.currentState = arg_183_0.currentState
	var_183_0.operatorData.useEquippedOperatorFocusIndex = false
	var_183_0.operatorData.useSelectedOperatorIndexForFocus = true

	local var_183_1 = arg_183_0.currentState == OPERATOR.SuperFaction.WEST and var_183_0.operatorData.westSelectedOperator or var_183_0.operatorData.eastSelectedOperator
	local var_183_2 = arg_183_0.currentState == OPERATOR.SuperFaction.WEST and var_183_0.operatorData.westSelectedOperatorOutfitMissionQuests or var_183_0.operatorData.eastSelectedOperatorOutfitMissionQuests
	local var_183_3 = var_183_1 == arg_183_2

	LUI.FlowManager.RequestAddMenu("OperatorMissions", true, arg_183_1, false, {
		operatorRef = var_183_1,
		outfitMissionQuests = var_183_2,
		isActive = var_183_3,
		menu = arg_183_0
	})
end

function OPERATOR.GetPetCharacterForSuperFaction(arg_184_0)
	if arg_184_0 == OPERATOR.SuperFaction.WEST then
		return FrontEndScene.ClientCharacters.WestGoodBoy
	end

	return FrontEndScene.ClientCharacters.EastGoodGirl
end

function OPERATOR.IsOperatorBioAvailable(arg_185_0, arg_185_1, arg_185_2)
	local var_185_0 = LUI.FlowManager.GetScopedData(arg_185_0)
	local var_185_1 = (arg_185_2 and arg_185_2.operatorRef or false) and arg_185_2.operatorRef or arg_185_0.currentState == OPERATOR.SuperFaction.WEST and var_185_0.operatorData.westSelectedOperator or var_185_0.operatorData.eastSelectedOperator

	return not OPERATOR.IsDefaultOperator(var_185_1) and not OPERATOR.IsRandomOperator(var_185_1) and not OPERATOR.IsRandomFavOperator(var_185_1) and not OPERATOR.IsCDLOperator(var_185_1)
end

local function var_0_8(arg_186_0, arg_186_1)
	local var_186_0 = arg_186_1 > 1

	return {
		index = var_186_0 and arg_186_1 - 1 or arg_186_0
	}
end

local function var_0_9(arg_187_0, arg_187_1)
	local var_187_0 = arg_187_1 < arg_187_0

	return {
		index = var_187_0 and arg_187_1 + 1 or 1
	}
end

local function var_0_10(arg_188_0, arg_188_1)
	assert(arg_188_0._currentOperators)

	local var_188_0 = var_0_8(#arg_188_0._currentOperators, arg_188_1._operatorIndex)
	local var_188_1 = var_0_9(#arg_188_0._currentOperators, arg_188_1._operatorIndex)

	return {
		left = var_188_0,
		right = var_188_1
	}
end

local function var_0_11(arg_189_0, arg_189_1, arg_189_2)
	assert(#arg_189_1 == #arg_189_2)
	DebugPrint("")
	DebugPrint("Streaming Request Start...................................")

	for iter_189_0 = 1, #arg_189_1 do
		DebugPrint("Body: " .. arg_189_1[iter_189_0] .. ", " .. "Head: " .. arg_189_2[iter_189_0])
	end

	DebugPrint("Streaming Request End...................................")
	DebugPrint("")
end

function OPERATOR.RequestStreamingModels(arg_190_0, arg_190_1, arg_190_2)
	assert(arg_190_2.child, "A reference to the grid child must be provided to get the correct group of models to stream.")
	assert(arg_190_2.child._operatorInfo, "Each grid child (button) must store it's data in a property named _operatorInfo.")

	local var_190_0 = arg_190_2.child
	local var_190_1 = var_190_0._operatorInfo.ref
	local var_190_2 = {}
	local var_190_3 = {}
	local var_190_4 = {}
	local var_190_5 = arg_190_2.singleRequest or false
	local var_190_6 = var_0_10(arg_190_0, var_190_0)

	if var_190_5 then
		table.insert(var_190_4, var_190_0._operatorInfo.ref)
	else
		for iter_190_0, iter_190_1 in pairs(var_190_6) do
			local var_190_7 = arg_190_0._currentOperators[iter_190_1.index].ref
			local var_190_8 = false

			for iter_190_2 = 1, #var_190_4 do
				if var_190_4[iter_190_2] == var_190_7 then
					var_190_8 = true

					break
				end
			end

			if not var_190_8 then
				table.insert(var_190_4, var_190_7)
			end
		end

		table.insert(var_190_4, var_190_1)
	end

	local var_190_9 = PlayerData.BFFBGAJGD(arg_190_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup

	for iter_190_3 = 1, #var_190_4 do
		local var_190_10 = var_190_4[iter_190_3]

		if OPERATOR.IsRandomOperator(var_190_10) or OPERATOR.IsRandomFavOperator(var_190_10) then
			table.insert(var_190_2, OPERATOR.proxyBody)
			table.insert(var_190_3, OPERATOR.proxyHead)
		else
			local var_190_11 = var_190_9.operatorCustomization[var_190_10].skin:get()

			assert(var_190_11)

			local var_190_12 = OPERATOR.GetOperatorSkin(arg_190_1, var_190_11, var_190_10)

			if var_190_12.bodyModel and #var_190_12.bodyModel > 0 then
				table.insert(var_190_2, var_190_12.bodyModel)
			end

			if var_190_12.headModel and #var_190_12.headModel > 0 then
				table.insert(var_190_3, var_190_12.headModel)
			end

			local var_190_13 = var_190_9.operatorCustomization[var_190_10].execution:get()
			local var_190_14 = OPERATOR.GetExecutionPet(var_190_13)

			if #var_190_14 > 0 then
				local var_190_15 = OPERATOR.GetPetModel(var_190_14)

				table.insert(var_190_2, 1, var_190_14)
			end
		end
	end

	if #var_190_2 > 0 and #var_190_3 > 0 then
		if Dvar.IBEGCHEFE("lui_show_operator_streaming_requests") then
			var_0_11(arg_190_0, var_190_2, var_190_3)
		end

		FrontEndScene.RequestBodyModels(var_190_2)
		FrontEndScene.RequestHeadModels(var_190_3)
	end
end

function OPERATOR.GetSceneCharacterModelAnimations()
	local var_191_0 = {}
	local var_191_1 = {}

	for iter_191_0 = 0, StringTable.BFHCAIIDA(CSV.operatorSelectAnimations.file) - 1 do
		local var_191_2 = OPERATOR.GetIdleAnimations(iter_191_0)
		local var_191_3 = OPERATOR.GetEquipAnimations(iter_191_0)
		local var_191_4 = StringTable.CBGJCDIHCE(CSV.operatorSelectAnimations.file, iter_191_0, CSV.operatorSelectAnimations.cols.ref)

		var_191_0[var_191_4] = var_191_2[math.random(1, #var_191_2)]
		var_191_1[var_191_4] = var_191_3[math.random(1, #var_191_3)]
	end

	return var_191_0, var_191_1
end

function OPERATOR.CheckSceneHasAnimTables(arg_192_0)
	assert(arg_192_0._idleAnimationsTable, "Missing a table of the character idle animations. Check that you assigned menu._idleAnimationsTable from the OPERATOR.GetSceneCharacterModelAnimations call.")
	assert(arg_192_0._equipAnimationsTable, "Missing a table of the character equipped animations. Check that you assigned menu._equipAnimationsTable from the OPERATOR.GetSceneCharacterModelAnimations call.")
end

function OPERATOR.GetEquippedOperatorFromPlayerData(arg_193_0, arg_193_1)
	return PlayerData.BFFBGAJGD(arg_193_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[OPERATOR.WZ_OPERATOR_INDEX]:get()
end

function OPERATOR.GetEquippedOperatorIndex(arg_194_0, arg_194_1)
	local var_194_0 = OPERATOR.GetEquippedOperatorFromPlayerData(arg_194_0, arg_194_1)

	return OPERATOR.GetOperatorIndex(arg_194_0, var_194_0)
end

function OPERATOR.OnEquippedOperatorFocused(arg_195_0, arg_195_1, arg_195_2)
	assert(arg_195_2.child)

	local var_195_0 = arg_195_2.child

	assert(var_195_0._operatorInfo, "Operator information data needs to be stored on the child as the property child._operatorInfo")

	local var_195_1 = var_195_0._operatorInfo
	local var_195_2 = OPERATOR.GetEquippedOperatorIndex(arg_195_0, arg_195_1)
	local var_195_3 = OPERATOR.IsUnlocked(arg_195_1, var_195_1.ref)
	local var_195_4 = var_195_2 + 1 == arg_195_2.child._operatorIndex
	local var_195_5 = var_195_1.isRandom or var_195_1.isRandomFavorite

	if var_195_3 and var_195_4 or var_195_5 then
		OPERATOR.PlayEquippedAnimAndQueueIdle(arg_195_0, arg_195_1, {
			newEquipped = false,
			operatorInfo = var_195_1
		})
	end
end

function OPERATOR.PlayEquippedAnimAndQueueIdle(arg_196_0, arg_196_1, arg_196_2)
	OPERATOR.CheckValidOperatorParams(arg_196_2)
	OPERATOR.CheckSceneHasAnimTables(arg_196_0)

	local var_196_0 = arg_196_2.operatorInfo
	local var_196_1 = var_196_0.isRandom or var_196_0.isRandomFavorite
	local var_196_2
	local var_196_3

	if var_196_1 then
		var_196_2 = var_196_0.operatorPose
		var_196_3 = var_196_2
	else
		local var_196_4 = OPERATOR.GetEquippedSkinForOperator(arg_196_1, var_196_0.ref)
		local var_196_5 = OPERATOR.GetOperatorSkinRef(var_196_4.bodyModel, var_196_4.headModel)
		local var_196_6 = MP.StripPlatformSuffix(var_196_5)

		var_196_3 = arg_196_0._equipAnimationsTable[var_196_6]

		if not var_196_3 or #var_196_3 <= 0 then
			var_196_3 = arg_196_0._equipAnimationsTable[var_196_0.ref]

			if var_196_3 == nil or var_196_3 == "" then
				return
			end
		end

		var_196_2 = arg_196_0._idleAnimationsTable[var_196_6]

		if not var_196_2 or #var_196_2 <= 0 then
			var_196_2 = arg_196_0._idleAnimationsTable[var_196_0.ref]

			if var_196_2 == nil or var_196_2 == "" then
				var_196_2 = var_196_0.defaultPose
			end
		end
	end

	local var_196_7
	local var_196_8
	local var_196_9
	local var_196_10 = OPERATOR.WZ_OPERATOR_INDEX
	local var_196_11 = ClientCharacter.DCECEDGHEG(var_196_10)
	local var_196_12, var_196_13 = OPERATOR.GetTransitionInfoFromAnimation(var_196_11)

	if not arg_196_2.newEquipped then
		var_196_12 = 0
	end

	ClientCharacter.CAECDIHFCF(var_196_10, var_196_3, var_196_12, var_196_13)

	local var_196_14, var_196_15, var_196_16 = OPERATOR.GetTransitionInfoFromAnimation(var_196_3)

	ClientCharacter.BHJJGDDGFI(var_196_10, var_196_2, var_196_16, var_196_14, var_196_15)
end

local function var_0_12(arg_197_0, arg_197_1)
	return function()
		FrontEndScene.SetCharacterVisible(OPERATOR.WZ_OPERATOR_INDEX, true)
	end
end

function OPERATOR.SetupScene(arg_199_0, arg_199_1)
	Engine.DHFCHIIJCA("character_faction_select_l")

	if #Dvar.DHEEJCCJBH("NRLKQRRMKK") == 0 then
		FrontEndScene.SetCharacterVisible(OPERATOR.WZ_OPERATOR_INDEX, true)
	end

	MenuUtils.SetupSceneChangeCallback(arg_199_0, var_0_12(arg_199_0, arg_199_1))
end

function OPERATOR.SetSceneCharacterModel(arg_200_0, arg_200_1, arg_200_2)
	OPERATOR.CheckSceneHasAnimTables(arg_200_0)
	OPERATOR.CheckValidOperatorParams(arg_200_2)

	local var_200_0
	local var_200_1 = false
	local var_200_2 = arg_200_2.operatorInfo
	local var_200_3 = var_200_2.ref
	local var_200_4 = var_200_2.isRandom and var_200_2.operatorPose or arg_200_0._idleAnimationsTable[var_200_3]
	local var_200_5 = arg_200_2.previousMenu
	local var_200_6 = #Dvar.DHEEJCCJBH("NRLKQRRMKK") == 0

	if var_200_2.isRandom or var_200_2.isRandomFavorite then
		var_200_0 = OPERATOR.GetOperatorSkin(arg_200_1, var_200_2.lootIndex, var_200_3)
	else
		if RANDOM.IsEnabled(arg_200_1, LOOT.itemTypes.OPERATOR_SKIN, {
			operatorRef = var_200_3
		}) then
			if arg_200_2.menuRef and arg_200_2.showARandomSkin then
				local var_200_7 = LUI.FlowManager.GetScopedData(arg_200_2.menuRef)

				if var_200_7 and not var_200_7.operatorData.randomSkins then
					var_200_7.operatorData.randomSkins = {}
				end

				if not var_200_7.operatorData.randomSkins[var_200_3] then
					local var_200_8 = OPERATOR.GetSkinsForOperator(var_200_3, arg_200_1, true, true)
					local var_200_9 = {}

					for iter_200_0, iter_200_1 in ipairs(var_200_8) do
						if iter_200_1.isUnlocked then
							table.insert(var_200_9, iter_200_1)
						end
					end

					local var_200_10

					if #var_200_9 > 0 then
						var_200_10 = var_200_9[math.random(1, #var_200_9)]
					end

					if var_200_10 then
						var_200_0 = OPERATOR.GetOperatorSkin(arg_200_1, var_200_10.lootIndex, var_200_3)

						FrontEndScene.RequestBodyModels({
							var_200_0.bodyModel
						})
						FrontEndScene.RequestHeadModels({
							var_200_0.headModel
						})
						OPERATOR.SetEquippedItemForLootType(arg_200_1, var_200_3, LOOT.itemTypes.OPERATOR_SKIN, var_200_10.lootIndex)
						Engine.DAGFFDGFII("uploadstats", arg_200_1)

						var_200_7.operatorData.randomSkins[var_200_3] = var_200_0
					else
						assert(false, "no skin data")
					end
				else
					var_200_0 = var_200_7.operatorData.randomSkins[var_200_3]
				end
			else
				var_200_0 = {
					bodyModel = OPERATOR.proxyBody,
					headModel = OPERATOR.proxyHead
				}

				local var_200_11 = true
			end
		else
			var_200_0 = OPERATOR.GetEquippedSkinForOperator(arg_200_1, var_200_3)
		end

		local var_200_12 = OPERATOR.GetExecutionForOperator(arg_200_1, var_200_3)
		local var_200_13 = OPERATOR.GetPetCharacterForSuperFaction(operatorSuperfaction)

		OPERATOR.UpdatePet(arg_200_1, var_200_13, {
			idle = true,
			execution = var_200_12,
			element = arg_200_0
		})
	end

	local var_200_14, var_200_15 = OPERATOR.GetWeaponDataFromLoadout(arg_200_1)
	local var_200_16 = OPERATOR.GetWeaponAccessoryModelFromLoadout(arg_200_1)
	local var_200_17 = OPERATOR.ValidateAccessoryModel(var_200_16, var_200_0.bodyModel)
	local var_200_18 = WEAPON.GetWeaponDetailsFromModel(var_200_15)

	if not OPERATOR.IsStowedWeaponAllowedInPreviewScreens(var_200_18.weaponAsset) then
		var_200_15 = WEAPON.NoneValue
	end

	FrontEndScene.RequestWeaponWorldModels({
		var_200_14,
		var_200_15,
		var_200_17
	})

	local var_200_19 = {
		operatorPose = var_200_4,
		element = arg_200_2.element,
		weaponModel = var_200_14,
		secondaryModel = var_200_15,
		showCharacter = var_200_6,
		accessoryModel = var_200_17
	}

	OPERATOR.UpdateClientCharacter(OPERATOR.WZ_OPERATOR_INDEX, var_200_0.bodyModel, var_200_0.headModel, var_200_19)
	ClientCharacter.DDHJHDEHFG(OPERATOR.WZ_OPERATOR_INDEX, 0, 10, 0)

	if var_200_5 == "OperatorShowcase" then
		ClientCharacter.DGGEBHHGJG(OPERATOR.WZ_OPERATOR_INDEX, false)

		arg_200_0:Wait(50).onComplete = function()
			ClientCharacter.DGGEBHHGJG(OPERATOR.WZ_OPERATOR_INDEX, true)
		end
	end
end

function OPERATOR.OpenOperatorInformationMenu(arg_202_0, arg_202_1, arg_202_2)
	local var_202_0 = arg_202_0:GetOperatorAssociates(arg_202_1)
	local var_202_1 = LUI.FlowManager.GetScopedData(arg_202_0)

	var_202_1.operatorData.currentState = arg_202_0.currentState
	var_202_1.operatorData.useEquippedOperatorFocusIndex = false
	var_202_1.operatorData.useSelectedOperatorIndexForFocus = true

	local var_202_2 = arg_202_0.currentState == OPERATOR.SuperFaction.WEST and var_202_1.operatorData.westSelectedOperator or var_202_1.operatorData.eastSelectedOperator
	local var_202_3 = OPERATOR.GetOperatorFactionRef(var_202_2)
	local var_202_4 = CONDITIONS.IsWZWipOperatorFlowEnabled() and var_202_0 or arg_202_0._currentOperators[var_202_3]
	local var_202_5 = {
		startTabIndex = arg_202_2 and arg_202_2.startTabIndex or OPERATOR.OPERATOR_INFO_TAB_DATA.BIO.index,
		operatorList = var_202_4,
		favoriteOperators = arg_202_0._favoriteOperators,
		currentFavoriteCount = arg_202_0._currentFavoriteCount
	}

	LUI.FlowManager.GetScopedData(arg_202_0).currentFilter = arg_202_0.WZOperatorFilter:GetCurrentFilter()

	OPERATOR.OpenOperatorSubMenu(arg_202_0, arg_202_1, {
		subMenuName = "WZOperatorInformation",
		menuData = var_202_5
	})
end

function OPERATOR.OpenOperatorBio(arg_203_0, arg_203_1, arg_203_2)
	local var_203_0 = LUI.FlowManager.GetScopedData(arg_203_0)

	var_203_0.operatorData.currentState = arg_203_0.currentState
	var_203_0.operatorData.useEquippedOperatorFocusIndex = false
	var_203_0.operatorData.useSelectedOperatorIndexForFocus = true

	local var_203_1 = arg_203_0.currentState == OPERATOR.SuperFaction.WEST and var_203_0.operatorData.westSelectedOperator or var_203_0.operatorData.eastSelectedOperator
	local var_203_2 = OPERATOR.GetOperatorFactionRef(var_203_1)
	local var_203_3 = CONDITIONS.IsWZWipOperatorFlowEnabled() and arg_203_2 and arg_203_2.associates or arg_203_0._currentOperators[var_203_2]

	LUI.FlowManager.RequestPopupMenu(nil, "OperatorBio", true, arg_203_1, false, {
		operatorRef = var_203_1,
		operatorList = var_203_3
	})
end

function OPERATOR.IsOperatorSubMenuAvailable(arg_204_0, arg_204_1, arg_204_2, arg_204_3)
	local var_204_0 = arg_204_0:GetSelectedOperator()

	if var_204_0 then
		if OPERATOR.IsRandomOperator(var_204_0) or OPERATOR.IsRandomFavOperator(var_204_0) then
			return false
		end

		local var_204_1 = OPERATOR.IsDefaultOperator(var_204_0)
		local var_204_2 = OPERATOR.IsUnlocked(arg_204_1, var_204_0)
		local var_204_3 = not var_204_1 or var_204_1 and Dvar.IBEGCHEFE("LMTKOLOLTK")

		if not var_204_2 or arg_204_2 == "OperatorCustomization" and arg_204_3 then
			return true
		end

		if not var_204_2 or arg_204_2 == "OperatorCustomization" and not var_204_3 then
			return false
		end
	else
		return false
	end

	if arg_204_0.previousState ~= arg_204_0.currentState then
		return false
	end

	return true
end

function OPERATOR.IsOperatorPreviewAvailable(arg_205_0, arg_205_1, arg_205_2)
	local var_205_0 = arg_205_0:GetSelectedOperator()
	local var_205_1 = true

	if var_205_0 and not OPERATOR.IsRandomOperator(var_205_0) and not OPERATOR.IsRandomFavOperator(var_205_0) then
		var_205_1 = not RANDOM.IsEnabled(arg_205_1, LOOT.itemTypes.OPERATOR_SKIN, {
			operatorRef = var_205_0
		})
	end

	return var_205_1 and OPERATOR.IsOperatorSubMenuAvailable(arg_205_0, arg_205_1, arg_205_2)
end

function OPERATOR.CheckForAdditionalSubMenuOptions(arg_206_0, arg_206_1)
	if arg_206_1 == "OperatorCustomization" then
		local var_206_0 = arg_206_0:GetSelectedOperator()

		if var_206_0 then
			local var_206_1 = OPERATOR.IsDefaultOperator(var_206_0)
			local var_206_2 = OPERATOR.IsT9Operator(var_206_0)
			local var_206_3 = var_206_1 or var_206_2

			return {
				showSkins = true,
				showExecutions = true,
				showTaunts = not var_206_3
			}
		end
	end
end

function OPERATOR.OpenOperatorSubMenu(arg_207_0, arg_207_1, arg_207_2)
	if not arg_207_2 or type(arg_207_2) ~= "table" or not arg_207_2.subMenuName then
		assert(false, "You must provide a table of options specifying the name of the subMenu to open.")
	end

	local var_207_0 = LUI.FlowManager.GetScopedData(arg_207_0)
	local var_207_1 = arg_207_2.subMenuName

	var_207_0.menuName = var_207_1
	var_207_0.operatorData.currentState = arg_207_0.currentState
	var_207_0.operatorData.useEquippedOperatorFocusIndex = false
	var_207_0.operatorData.useSelectedOperatorIndexForFocus = true
	var_207_0.operatorData.operatorInfo = arg_207_0.operatorInfo

	if CONDITIONS.IsMagmaGameMode() then
		var_207_0.currentFilter = arg_207_0.WZOperatorFilter:GetCurrentFilter()
	end

	if arg_207_2.menuData then
		var_207_0.operatorData.menuData = arg_207_2.menuData
	end

	LUI.FlowManager.RequestAddMenu(var_207_1, false, arg_207_1, false, {
		operatorData = var_207_0.operatorData,
		menuOptions = OPERATOR.CheckForAdditionalSubMenuOptions(arg_207_0, var_207_1),
		menuRef = arg_207_0
	})
end

function OPERATOR.PlayFullscreenIntroVideo(arg_208_0, arg_208_1, arg_208_2, arg_208_3)
	Engine.EBCGADABJ()

	local var_208_0 = {
		hackForceMatchingTimerStartWithDelay = true,
		delayTime = 1,
		restartVideo = true,
		video = arg_208_1,
		isEncrypted = arg_208_3 and arg_208_3.isEncrypted
	}

	LUI.FlowManager.RequestAddMenu("CinematicFullscreen", true, arg_208_2, false, var_208_0)
end

function OPERATOR.GetOperatorRefByLootTypeAndID(arg_209_0, arg_209_1, arg_209_2)
	local var_209_0 = LOOT.GetItemRef(arg_209_0, arg_209_1)
	local var_209_1

	if arg_209_0 == LOOT.OperatorLootTypes.Skin then
		if OPERATOR.IsSkinGlobal(var_209_0) then
			var_209_1 = OPERATOR.GetFavoriteOperatorRef(arg_209_2)

			local var_209_2 = OPERATOR.IsDefaultOperator(var_209_1)
			local var_209_3 = OPERATOR.IsLaunchOperator(var_209_1)

			if var_209_2 or not var_209_3 then
				local var_209_4 = OPERATOR.GetSelectedOperatorIndex(arg_209_2)

				var_209_1 = OPERATOR.GetDefaultLaunchOperatorForSuperfaction(var_209_4)
			end
		else
			var_209_1 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, var_209_0, CSV.operatorSkins.cols.operatorRef)
		end
	elseif arg_209_0 == LOOT.OperatorLootTypes.Taunt then
		var_209_1 = StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, var_209_0, CSV.operatorQuips.cols.operatorRef)
	elseif arg_209_0 == LOOT.OperatorLootTypes.Execution then
		if OPERATOR.IsExecutionMWExclusive(var_209_0) then
			var_209_1 = OPERATOR.GetFavoriteOperatorRef(arg_209_2)

			if not OPERATOR.IsMWOperator(var_209_1) then
				local var_209_5 = OPERATOR.GetSelectedOperatorIndex(arg_209_2)

				var_209_1 = OPERATOR.GetDefaultLaunchOperatorForSuperfaction(var_209_5)
			end
		elseif OPERATOR.IsExecutionT9Exclusive(var_209_0) then
			var_209_1 = OPERATOR.GetFavoriteOperatorRef(arg_209_2)

			if not OPERATOR.IsT9Operator(var_209_1) then
				var_209_1 = OPERATOR.DefaultT9Ref
			end
		elseif OPERATOR.IsExecutionS4Exclusive(var_209_0) then
			var_209_1 = OPERATOR.GetFavoriteOperatorRef(arg_209_2)

			if not OPERATOR.IsS4Operator(var_209_1) then
				var_209_1 = OPERATOR.DefaultS4Ref
			end
		else
			var_209_1 = StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, var_209_0, CSV.operatorExecutions.cols.operatorRef)
		end
	end

	return var_209_1
end

function OPERATOR.GetCosmeticRefByLootTypeAndIndex(arg_210_0, arg_210_1)
	local var_210_0

	if arg_210_0 == LOOT.OperatorLootTypes.Skin then
		var_210_0 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.lootIndex, arg_210_1, CSV.operatorSkins.cols.ref)
	elseif arg_210_0 == LOOT.OperatorLootTypes.Taunt then
		var_210_0 = StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.lootIndex, arg_210_1, CSV.operatorQuips.cols.ref)
	elseif arg_210_0 == LOOT.OperatorLootTypes.Execution then
		var_210_0 = StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.lootIndex, arg_210_1, CSV.operatorExecutions.cols.ref)
	end

	return var_210_0
end

function OPERATOR.GetLootIndexFromLootID(arg_211_0, arg_211_1)
	local var_211_0 = LOOT.GetItemRef(arg_211_1, arg_211_0)

	if arg_211_1 == LOOT.OperatorLootTypes.Skin then
		return StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, var_211_0, CSV.operatorSkins.cols.lootIndex)
	elseif arg_211_1 == LOOT.OperatorLootTypes.Taunt then
		return StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, var_211_0, CSV.operatorQuips.cols.lootIndex)
	elseif arg_211_1 == LOOT.OperatorLootTypes.Execution then
		return StringTable.DIFCHIGDFB(CSV.operatorExecutions.file, CSV.operatorExecutions.cols.ref, var_211_0, CSV.operatorExecutions.cols.lootIndex)
	end
end

function OPERATOR.OperatorHasNewLoots(arg_212_0, arg_212_1)
	for iter_212_0, iter_212_1 in pairs(LOOT.OperatorLootTypes) do
		local var_212_0 = Loot.BCBAGDEJAJ(arg_212_0, LOOT.typeNames[iter_212_1])

		if var_212_0 and #var_212_0 > 0 then
			for iter_212_2, iter_212_3 in ipairs(var_212_0) do
				if OPERATOR.GetOperatorRefByLootTypeAndID(iter_212_1, iter_212_3, arg_212_0) == arg_212_1 then
					return true
				end
			end
		end
	end

	return false
end

function OPERATOR.ClearOperatorBreadcrumbs(arg_213_0)
	for iter_213_0, iter_213_1 in pairs(LOOT.OperatorLootTypes) do
		Loot.GADJEFJEA(arg_213_0, LOOT.typeNames[iter_213_1])
	end

	Loot.GADJEFJEA(arg_213_0, LOOT.typeNames[LOOT.itemTypes.OPERATOR])
	ACTIONS.UploadStats(nil, arg_213_0)
end

function OPERATOR.GetNewLootsByOperatorAndType(arg_214_0, arg_214_1, arg_214_2)
	local var_214_0 = {}
	local var_214_1 = Loot.BCBAGDEJAJ(arg_214_0, LOOT.typeNames[arg_214_2])

	if var_214_1 and #var_214_1 > 0 then
		for iter_214_0, iter_214_1 in ipairs(var_214_1) do
			if OPERATOR.GetOperatorRefByLootTypeAndID(arg_214_2, iter_214_1, arg_214_0) == arg_214_1 then
				table.insert(var_214_0, iter_214_1)
			end
		end
	end

	return var_214_0
end

function OPERATOR.GetOperatorRefsByFaction(arg_215_0, arg_215_1)
	local var_215_0 = {}
	local var_215_1 = StringTable.BFHCAIIDA(CSV.operators.file)

	for iter_215_0 = 0, var_215_1 - 1 do
		local var_215_2 = StringTable.CBGJCDIHCE(CSV.operators.file, iter_215_0, CSV.operators.cols.superfaction)

		if tonumber(var_215_2) == arg_215_1 then
			local var_215_3 = not CONDITIONS.IsWeGameGovBanned()

			if not var_215_3 then
				local var_215_4 = StringTable.CBGJCDIHCE(CSV.operators.file, iter_215_0, CSV.operators.cols.weGame)

				var_215_3 = tonumber(var_215_4) == 1
			end

			if var_215_3 then
				local var_215_5 = StringTable.CBGJCDIHCE(CSV.operators.file, iter_215_0, CSV.operators.cols.ref)

				table.insert(var_215_0, var_215_5)
			end
		end

		if operatorData and (not CONDITIONS.IsWeGameGovBanned() or tonumber(operatorData.weGame) == 1) and tonumber(operatorData.superfaction) == arg_215_1 then
			table.insert(var_215_0, operatorData.ref)
		end
	end

	return var_215_0
end

function OPERATOR.FactionHasNewLoots(arg_216_0, arg_216_1)
	local var_216_0 = OPERATOR.GetOperatorRefsByFaction(arg_216_0, arg_216_1)

	for iter_216_0, iter_216_1 in ipairs(var_216_0) do
		local var_216_1 = OPERATOR.IsUnlocked(arg_216_0, iter_216_1)
		local var_216_2 = OPERATOR.IsDefaultOperator(iter_216_1)

		if var_216_1 and not var_216_2 then
			local var_216_3 = OPERATOR.GetLootIDFromRef(iter_216_1)

			if var_216_3 and #var_216_3 > 0 then
				if Loot.HDJCADADF(arg_216_0, var_216_3) or OPERATOR.OperatorHasNewLoots(arg_216_0, iter_216_1) then
					return true
				end
			elseif var_216_3 == "" then
				DebugPrint("WARNING: Missing OperatorID for " .. iter_216_1 .. " in OperatorUtils:FactionHasNewLoots().")
			end
		end
	end

	return false
end

function OPERATOR.ShouldShowGhostTeaser(arg_217_0)
	return false
end

function OPERATOR.ShowGhostTeaser(arg_218_0, arg_218_1)
	if arg_218_1.showingGhost then
		return
	end

	local var_218_0 = LUI.UIElement.new()

	arg_218_1:addElement(var_218_0)

	arg_218_1.showingGhost = true

	local var_218_1

	local function var_218_2()
		local var_219_0 = "chr_menu_mp_squad_mag_tease_05"
		local var_219_1 = false

		if var_218_0._lastPlayedAnim ~= nil then
			if var_218_0._lastPlayedAnim == "chr_menu_mp_squad_mag_tease_05" then
				var_219_0 = "chr_menu_mp_squad_mag_tease_05_copy"
				var_219_1 = true
			else
				var_219_0 = "chr_menu_mp_squad_mag_tease_05"
			end
		end

		local var_219_2 = OPERATOR.ShouldShowGhostTeaser(arg_218_0)
		local var_219_3 = {
			weaponModel = "iw8_ar_scharlie_mpv2+rec_scharlie|1+back_scharlie|1+mag_scharlie|1+selectsemi+barlong_scharlie_v2|3+ammomod_wound+pistolgrip02_scharlie_v2|1+vzscope_mike14_ar",
			secondaryModel = "iw8_ar_scharlie_mpv2+rec_scharlie|1+back_scharlie|1+mag_scharlie|1+selectsemi+barlong_scharlie_v2|3+ammomod_wound+pistolgrip02_scharlie_v2|1+vzscope_mike14_ar",
			operatorPose = var_219_0,
			showCharacter = var_219_2,
			accessoryModel = WATCH.WatchNoneValue
		}

		OPERATOR.UpdateClientCharacter(FrontEndScene.ClientCharacters.Ghost, "body_mp_western_ghost_1_1_fe", "head_mp_western_ghost_1_1", var_219_3)

		var_218_0._lastPlayedAnim = var_219_0

		local var_219_4 = 20000
		local var_219_5 = 20000

		if var_219_1 then
			var_219_4 = 60000
			var_219_5 = 90000
		end

		var_218_0:Wait(math.random(var_219_4, var_219_5), true).onComplete = var_218_2
	end

	var_218_0:Wait(math.random(20000, 30000), true).onComplete = var_218_2
end

function OPERATOR.CreateUltraCache()
	for iter_220_0, iter_220_1 in pairs(OPERATOR.CachedUltraScriptableStates) do
		return
	end

	OPERATOR.CachedUltraScriptableStates = {}

	local var_220_0 = StringTable.BFHCAIIDA(CSV.operatorSkins.file)

	for iter_220_2 = 0, var_220_0 - 1 do
		local var_220_1 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, iter_220_2, CSV.operatorSkins.cols.ref)
		local var_220_2 = StringTable.CBGJCDIHCE(CSV.operatorSkins.file, iter_220_2, CSV.operatorSkins.cols.ultraAnimScriptableState)

		if var_220_2 ~= "" then
			local var_220_3 = MP.StripPlatformSuffix(var_220_1)

			OPERATOR.CachedUltraScriptableStates[var_220_3] = var_220_2
		end
	end
end

function OPERATOR.GetUltraScriptableState(arg_221_0)
	OPERATOR.CreateUltraCache()

	arg_221_0 = MP.StripPlatformSuffix(arg_221_0)

	local var_221_0 = OPERATOR.CachedUltraScriptableStates[arg_221_0]

	if var_221_0 then
		return var_221_0
	end

	return ""
end

function OPERATOR.GetRankMinXP(arg_222_0, arg_222_1)
	if var_0_0 and var_0_0.GetOperatorProgression then
		return var_0_0.GetOperatorProgression(arg_222_0).minXP
	end

	return tonumber(StringTable.DIFCHIGDFB(CSV.operatorRankTable.file, CSV.operatorRankTable.cols.index, arg_222_1, CSV.operatorRankTable.cols.minXP))
end

function OPERATOR.GetRankMaxXP(arg_223_0, arg_223_1)
	if var_0_0 and var_0_0.GetOperatorProgression then
		return var_0_0.GetOperatorProgression(arg_223_0).maxXP
	end

	return tonumber(StringTable.DIFCHIGDFB(CSV.operatorRankTable.file, CSV.operatorRankTable.cols.index, arg_223_1, CSV.operatorRankTable.cols.maxXP))
end

function OPERATOR.GetRank(arg_224_0, arg_224_1)
	if var_0_0 and var_0_0.GetOperatorProgression then
		return var_0_0.GetOperatorProgression(arg_224_1).rank
	end

	return OPERATOR.GetOperatorProgress(arg_224_0, arg_224_1).rank
end

function OPERATOR.GetRankDisplay(arg_225_0)
	arg_225_0 = arg_225_0 or OPERATOR.FIRST_VALID_RANK

	return arg_225_0 + 1
end

function OPERATOR.GetRankFromXP(arg_226_0, arg_226_1, arg_226_2)
	local var_226_0 = tonumber(arg_226_1)

	return PROGRESSION.GetRankFromXP(var_226_0, CSV.operatorRankTable, OPERATOR.GetMaxRank(arg_226_2), false, nil)
end

function OPERATOR.GetMaxRank(arg_227_0)
	if var_0_0 and var_0_0.GetOperatorProgression then
		return var_0_0.GetOperatorProgression(arg_227_0).maxRank
	end

	local var_227_0 = CSV.operatorProgressionTable:GetFile(arg_227_0)
	local var_227_1 = 0

	for iter_227_0 = 0, StringTable.BFHCAIIDA(var_227_0) - 1 do
		local var_227_2 = StringTable.CBGJCDIHCE(var_227_0, iter_227_0, CSV.operatorProgressionTable.cols.level)

		if var_227_2 and #var_227_2 > 0 then
			local var_227_3 = tonumber(var_227_2)

			if var_227_1 < var_227_3 then
				var_227_1 = var_227_3
			end
		end
	end

	return var_227_1
end

local function var_0_13(arg_228_0, arg_228_1)
	local var_228_0 = {}

	for iter_228_0, iter_228_1 in ipairs(LUI.Split(arg_228_1.lootID, "|")) do
		local var_228_1 = LOOT.GetTypeForID(iter_228_1)

		if var_228_1 ~= LOOT.itemTypes.INVALID then
			local var_228_2 = {
				level = tonumber(arg_228_1.level),
				lootID = tonumber(iter_228_1),
				type = var_228_1
			}

			if var_228_1 ~= nil then
				var_228_2.lootRef = LOOT.GetItemRef(var_228_1, iter_228_1, {
					operatorRef = arg_228_0
				})
			end

			table.insert(var_228_0, var_228_2)
		end
	end

	if arg_228_1.RewardPlayerXP and #arg_228_1.RewardPlayerXP > 0 then
		local var_228_3 = {
			level = tonumber(arg_228_1.level)
		}

		var_228_3.type = "xp"
		var_228_3.amount = operatorUnlock.RewardPlayerXP
		var_228_3.name = Engine.CBBHFCGDIC("LUA_MENU/REWARD_XP", var_228_3.amount)
		var_228_3.image = "icon_xp_token"

		table.insert(var_228_0, var_228_3)
	end

	if arg_228_1.RewardWeaponXP and #arg_228_1.RewardWeaponXP > 0 then
		local var_228_4 = split(arg_228_1.RewardWeaponXP, "@")
		local var_228_5 = {
			level = tonumber(arg_228_1.level)
		}

		var_228_5.type = "weapon_xp"
		var_228_5.amount = tonumber(var_228_4[1])
		var_228_5.lootID = tonumber(var_228_4[2])
		var_228_5.lootRef = LOOT.GetItemRef(LOOT.itemTypes.WEAPON, var_228_5.lootID)
		var_228_5.name = Engine.CBBHFCGDIC("LUA_MENU/REWARD_XP", var_228_5.amount)

		table.insert(var_228_0, var_228_5)
	end

	return var_228_0
end

function OPERATOR.GetProgressionUnlocks(arg_229_0)
	if var_0_0 and var_0_0.GetProgressionUnlocks then
		return var_0_0.GetProgressionUnlocks(arg_229_0)
	end

	local var_229_0 = CSV.operatorProgressionTable
	local var_229_1 = var_229_0:GetFile(arg_229_0)
	local var_229_2 = {}
	local var_229_3 = StringTable.BFHCAIIDA(var_229_1)

	for iter_229_0 = 0, var_229_3 - 1 do
		local var_229_4 = CSV.ReadRowWithFile(var_229_0, var_229_1, iter_229_0)
		local var_229_5 = var_0_13(arg_229_0, var_229_4)

		if #var_229_5 > 0 then
			table.insert(var_229_2, var_229_5[1])
		end
	end

	return var_229_2
end

function OPERATOR.GetCurrentOperatorUnlocks(arg_230_0, arg_230_1)
	local var_230_0 = CSV.operatorProgressionTable
	local var_230_1 = var_230_0:GetFile(arg_230_0)
	local var_230_2 = OPERATOR.GetMaxRank(arg_230_0)
	local var_230_3 = {}
	local var_230_4 = arg_230_1

	if var_230_2 < var_230_4 then
		return var_230_3
	end

	local var_230_5 = var_230_4
	local var_230_6 = 0
	local var_230_7 = CSV.ReadRowWithFile(var_230_0, var_230_1, var_230_5)
	local var_230_8 = {}

	for iter_230_0, iter_230_1 in ipairs(LUI.Split(var_230_7.lootID, "|")) do
		local var_230_9 = LOOT.GetTypeForID(iter_230_1)

		if var_230_9 ~= LOOT.itemTypes.INVALID then
			local var_230_10 = {
				level = var_230_5,
				lootID = tonumber(iter_230_1),
				type = var_230_9
			}

			if var_230_9 ~= nil then
				var_230_10.lootRef = LOOT.GetItemRef(var_230_9, iter_230_1, {
					operatorRef = arg_230_0
				})
			end

			table.insert(var_230_8, var_230_10)
		end
	end

	if var_230_7.RewardPlayerXP and #var_230_7.RewardPlayerXP > 0 then
		local var_230_11 = {
			level = var_230_5
		}

		var_230_11.type = "xp"
		var_230_11.amount = var_230_7.RewardPlayerXP
		var_230_11.name = Engine.CBBHFCGDIC("CHALLENGE/N_XP", var_230_11.amount)
		var_230_11.image = "icon_xp_token"

		table.insert(var_230_8, var_230_11)
	end

	if var_230_7.RewardWeaponXP and #var_230_7.RewardWeaponXP > 0 then
		local var_230_12 = split(var_230_7.RewardWeaponXP, "@")
		local var_230_13 = {
			level = var_230_5
		}

		var_230_13.type = "weapon_xp"
		var_230_13.amount = tonumber(var_230_12[1])
		var_230_13.lootID = tonumber(var_230_12[2])
		var_230_13.lootRef = LOOT.GetItemRef(LOOT.itemTypes.WEAPON, var_230_13.lootID)
		var_230_13.name = Engine.CBBHFCGDIC("CHALLENGE/N_XP", var_230_13.amount)

		table.insert(var_230_8, var_230_13)
	end

	table.insert(var_230_3, var_230_8)

	return var_230_3
end

function OPERATOR.GetProgressionDataFromAllUnlocks(arg_231_0, arg_231_1, arg_231_2)
	local var_231_0 = {}

	for iter_231_0, iter_231_1 in pairs(arg_231_1) do
		local var_231_1 = {}

		for iter_231_2, iter_231_3 in pairs(iter_231_1) do
			local var_231_2 = {
				typeString = ToUpperCase(Engine.CBBHFCGDIC(LOOT.typeNameStrings[iter_231_3.lootType])),
				type = iter_231_3.lootType,
				lootID = iter_231_3.lootID
			}
			local var_231_3 = iter_231_3.lootRef

			if iter_231_3.lootType == LOOT.itemTypes.ATTACHMENT then
				var_231_3 = ATTACHMENT.GetRef(iter_231_3.lootRef, arg_231_2)
			elseif iter_231_3.lootType == LOOT.itemTypes.EQUIPMENT then
				local var_231_4 = LOOT.GetIDFileForType(iter_231_3.lootType)
				local var_231_5 = StringTable.DIFCHIGDFB(var_231_4, CSV.lootIDs.cols.ref, var_231_3, CSV.lootIDs.cols.isPremium)

				if tonumber(var_231_5) == 1 then
					var_231_2.typeString = ToUpperCase(Engine.CBBHFCGDIC("MENU/LETHAL_CAPS"))
				else
					var_231_2.typeString = ToUpperCase(Engine.CBBHFCGDIC("MENU/SPECIAL_EQUIPMENT_CAPS"))
				end
			elseif iter_231_3.lootType == LOOT.itemTypes.WEAPON_XP then
				var_231_3 = WEAPON.GetVariantBaseRef(iter_231_3.lootID)
			end

			var_231_2.name = LOOT.GetItemName(iter_231_3.lootType, var_231_3, iter_231_3.lootID, iter_231_3.amount)
			var_231_2.image = LOOT.GetItemImage(iter_231_3.lootType, var_231_3, iter_231_3.lootID)

			if STORE.PreviewSupported(var_231_2.type) then
				function var_231_2.previewCallback()
					STORE.PreviewItem(arg_231_0, var_231_2.type, var_231_2.lootID)
				end
			end

			table.insert(var_231_1, var_231_2)
		end

		var_231_0[iter_231_0] = var_231_1
	end

	return var_231_0
end

function OPERATOR.Internal_SortByDisplayOrder(arg_233_0, arg_233_1)
	return tonumber(arg_233_0.displayOrder) < tonumber(arg_233_1.displayOrder)
end

function OPERATOR.Internal_GetFactionsSortedByDisplayOrder(arg_234_0)
	local var_234_0 = {}

	for iter_234_0 in pairs(arg_234_0) do
		table.insert(var_234_0, iter_234_0)
	end

	table.sort(var_234_0, function(arg_235_0, arg_235_1)
		return OPERATOR.Internal_SortByDisplayOrder(arg_234_0[arg_235_0], arg_234_0[arg_235_1])
	end)

	return var_234_0
end
