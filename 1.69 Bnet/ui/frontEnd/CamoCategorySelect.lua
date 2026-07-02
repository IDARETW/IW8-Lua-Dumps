module(..., package.seeall)

local var_0_0 = "special"
local var_0_1 = "ranked_play"
local var_0_2 = "SeasonalEvent"

local function var_0_3(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1 = StringTable.BFHCAIIDA(CSV.camoTable.file)

	for iter_1_0 = 0, var_1_1 - 1 do
		if StringTable.CBGJCDIHCE(CSV.camoTable.file, iter_1_0, CSV.camoTable.cols.category) == arg_1_1 then
			local var_1_2 = StringTable.CBGJCDIHCE(CSV.camoTable.file, iter_1_0, CSV.camoTable.cols.ref)
			local var_1_3 = LOOT.GetItemID(LOOT.itemTypes.CAMO, var_1_2)

			if LOOT.IsItemIDEquippableByCurrentTitle(arg_1_0._controllerIndex, var_1_3) then
				local var_1_4 = LOOT.IsUnlockedWithID(arg_1_0._controllerIndex, var_1_3)
				local var_1_5 = LOOT.GetItemID(LOOT.itemTypes.CAMO, var_1_2, {
					weaponRef = arg_1_0._weaponTable.weapon
				})

				if not arg_1_2 or var_1_4 then
					local var_1_6 = CSV.ReadRow(CSV.camoTable, iter_1_0)

					var_1_6.unlockInfo = {
						lootID = var_1_5,
						unlocked = var_1_4,
						lockedText = lockedText
					}

					table.insert(var_1_0, var_1_6)
				end
			end
		end
	end

	return var_1_0
end

local function var_0_4(arg_2_0)
	local var_2_0

	if arg_2_0.weaponRef then
		var_2_0 = LOOT.GetBaseWeaponItemID(arg_2_0.weaponRef)
	end

	local var_2_1

	if arg_2_0.camoRef then
		var_2_1 = LOOT.GetItemID(LOOT.itemTypes.CAMO, arg_2_0.camoRef)
	elseif arg_2_0.camoLootID then
		var_2_1 = arg_2_0.camoLootID
	end

	if var_2_0 and var_2_1 then
		return LOOT.ItemIDsMatchGameSourceIDs(var_2_0, var_2_1)
	end
end

local var_0_5 = {}

local function var_0_6(arg_3_0)
	if not arg_3_0 then
		return false
	end

	if not var_0_5.__init then
		local var_3_0 = StringTable.BFHCAIIDA(CSV.camoCategoryTable.file)

		for iter_3_0 = 0, var_3_0 - 1 do
			if StringTable.CBGJCDIHCE(CSV.camoCategoryTable.file, iter_3_0, CSV.camoCategoryTable.cols.singleMastery) == "1" then
				local var_3_1 = StringTable.CBGJCDIHCE(CSV.camoCategoryTable.file, iter_3_0, CSV.camoCategoryTable.cols.ref)

				var_0_5[var_3_1] = true
			end
		end

		var_0_5.__init = true
	end

	return var_0_5[arg_3_0] ~= nil
end

local function var_0_7(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	local var_4_0 = var_0_3(arg_4_0, arg_4_1, true)

	if arg_4_3 ~= nil and var_4_0 then
		for iter_4_0 = 1, #var_4_0 do
			local var_4_1 = var_4_0[iter_4_0]
			local var_4_2 = true
			local var_4_3 = true

			if CONDITIONS.IsWZWipFlowEnabled() then
				var_4_2 = var_0_4({
					weaponRef = arg_4_2,
					camoRef = var_4_1.ref
				})
				var_4_3 = LUI.IsValidPlatformExclusiveType(var_4_1)
			end

			if var_4_2 and var_4_3 then
				if not arg_4_3[var_4_1.category] then
					arg_4_3[var_4_1.category] = {}

					table.insert(arg_4_3[var_4_1.category], arg_4_4)
				end

				table.insert(arg_4_3[var_4_1.category], var_4_1)
			end
		end
	end
end

local function var_0_8(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = {}
	local var_5_1 = CSV.camosIDs
	local var_5_2 = var_5_1.GetFile(arg_5_1)
	local var_5_3 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, arg_5_1)

	local function var_5_4(arg_6_0, arg_6_1)
		local var_6_0 = StringTable.CBGJCDIHCE(arg_6_0.file, arg_6_1, arg_6_0.cols.ref)

		return string.find(var_6_0, arg_5_1)
	end

	local var_5_5, var_5_6 = Challenge.GetChallengesNoProgress(controllerIndex, Challenge.Type.GUNSMITH, var_5_4)
	local var_5_7 = StringTable.BFHCAIIDA(var_5_2)

	for iter_5_0 = 0, var_5_7 - 1 do
		local var_5_8 = 0
		local var_5_9 = CSV.ReadRowWithFile(var_5_1, var_5_2, iter_5_0).index
		local var_5_10 = tonumber(var_5_9)

		if var_5_10 and LOOT.IsCamo(var_5_10) then
			local var_5_11 = LOOT.GetItemRef(LOOT.itemTypes.CAMO, var_5_10, {
				weaponRef = arg_5_1
			})

			if var_5_11 and #var_5_11 > 0 then
				local var_5_12 = StringTable.BJJBBCJGEJ(CSV.camoTable.file, CSV.camoTable.cols.ref, var_5_11)
				local var_5_13 = CSV.ReadRow(CSV.camoTable, var_5_12)
				local var_5_14 = Challenge.GetChallengeAndTierForLoot(var_5_10, var_5_5, var_5_6)

				if var_5_14 ~= nil then
					var_5_13.unlockInfo = {}

					if var_5_14 then
						var_5_13.unlockInfo.challengeID = var_5_14.id
						var_5_13.unlockInfo.challengeRef = var_5_14.aeName
						var_5_13.unlockInfo.level = var_5_14.unlockLevel
					end

					var_5_13.unlockInfo.lootID = var_5_10

					if Challenge.IsValidChallengeID(var_5_13.unlockInfo.challengeID) then
						var_5_13.unlockInfo.progress = Gunsmith.CEFIIHJEFG(arg_5_0._controllerIndex, var_5_14.id).progress
					end

					var_5_13.unlockInfo.unlocked = LOOT.IsUnlockedWithID(arg_5_0._controllerIndex, var_5_13.unlockInfo.lootID)

					if not var_5_0[var_5_13.category] then
						var_5_0[var_5_13.category] = {}

						table.insert(var_5_0[var_5_13.category], arg_5_2)
					end

					table.insert(var_5_0[var_5_13.category], var_5_13)
				end
			end
		end
	end

	return var_5_0
end

local function var_0_9(arg_7_0)
	local var_7_0 = arg_7_0._weaponTable.weapon
	local var_7_1 = CSV.ReadRow(CSV.camoTable, 0)

	var_7_1.unlockInfo = {}
	var_7_1.unlockInfo.unlocked = true

	local var_7_2 = {}

	if LOOT.IsS4Item({
		type = LOOT.itemTypes.WEAPON,
		ref = var_7_0
	}) then
		var_7_2 = var_0_8(arg_7_0, var_7_0, var_7_1)
	else
		local var_7_3 = {}
		local var_7_4 = CSV.gunsmithProgressionTable
		local var_7_5 = var_7_4:GetFile(var_7_0)
		local var_7_6 = StringTable.BFHCAIIDA(var_7_5)

		for iter_7_0 = 0, var_7_6 - 1 do
			local var_7_7 = 0
			local var_7_8 = CSV.ReadRowWithFile(var_7_4, var_7_5, iter_7_0)
			local var_7_9 = var_7_8.level
			local var_7_10 = {}

			while var_7_8.lootID and #var_7_8.lootID > 0 or #var_7_10 > 0 do
				local var_7_11

				if #var_7_10 > 0 then
					var_7_11 = table.remove(var_7_10, 1)
				else
					var_7_11 = var_7_8.lootID

					if var_7_11 and string.match(var_7_11, "|") then
						var_7_10 = split(var_7_11, "|")
					end
				end

				local var_7_12 = tonumber(var_7_11)

				if var_7_12 and LOOT.IsCamo(var_7_12) then
					local var_7_13 = true

					if CONDITIONS.IsWZWipFlowEnabled() then
						var_7_13 = var_0_4({
							weaponRef = var_7_0,
							camoLootID = var_7_12
						})
					end

					if var_7_13 then
						local var_7_14 = LOOT.GetItemRef(LOOT.itemTypes.CAMO, var_7_12, {
							weaponRef = var_7_0
						})

						if var_7_14 and #var_7_14 > 0 then
							local var_7_15 = StringTable.BJJBBCJGEJ(CSV.camoTable.file, CSV.camoTable.cols.ref, var_7_14)
							local var_7_16 = CSV.ReadRow(CSV.camoTable, var_7_15)

							var_7_16.unlockInfo = LUI.ShallowCopy(var_7_8)
							var_7_16.unlockInfo.lootID = var_7_12

							if #var_7_16.unlockInfo.challengeID > 0 then
								var_7_16.unlockInfo.progress = Gunsmith.CEFIIHJEFG(arg_7_0._controllerIndex, var_7_16.unlockInfo.challengeID).progress
							end

							local var_7_17 = LOOT.IsUnlockedWithID(arg_7_0._controllerIndex, var_7_16.unlockInfo.lootID)

							if var_7_17 and var_7_2[var_7_16.category] and var_0_6(var_7_16.category) and not var_7_2[var_7_16.category][2].unlockInfo.unlocked then
								var_7_17 = false
							end

							var_7_16.unlockInfo.unlocked = var_7_17

							if not var_7_2[var_7_16.category] then
								var_7_2[var_7_16.category] = {}

								table.insert(var_7_2[var_7_16.category], var_7_1)
							end

							table.insert(var_7_2[var_7_16.category], var_7_16)
						end
					end
				end

				if next(var_7_10) == nil then
					var_7_7 = var_7_7 + 1

					local var_7_18 = var_7_4.colOffset * var_7_7
					local var_7_19 = {
						lootID = var_7_4.cols.lootID + var_7_18,
						challengeID = var_7_4.cols.challengeID + var_7_18,
						challengeRef = var_7_4.cols.challengeRef + var_7_18
					}

					var_7_8 = CSV.ReadRowWithFileAndColumns(var_7_5, iter_7_0, var_7_19)
					var_7_8.level = var_7_9
				end
			end
		end
	end

	var_0_7(arg_7_0, var_0_0, var_7_0, var_7_2, var_7_1)
	var_0_7(arg_7_0, var_0_1, var_7_0, var_7_2, var_7_1)
	var_0_7(arg_7_0, var_0_2, var_7_0, var_7_2, var_7_1)

	local var_7_20 = {}
	local var_7_21 = {}
	local var_7_22 = 0
	local var_7_23 = false
	local var_7_24 = StringTable.BFHCAIIDA(CSV.camoCategoryTable.file)

	for iter_7_1 = 1, var_7_24 - 1 do
		local var_7_25 = StringTable.CBGJCDIHCE(CSV.camoCategoryTable.file, iter_7_1, CSV.camoCategoryTable.cols.ref)

		if var_7_2[var_7_25] then
			var_7_22 = var_7_22 + 1

			if var_7_25 == arg_7_0._equippedCamoCategory then
				arg_7_0._defaultGridIndex = var_7_22 - 1
			end

			local var_7_26 = CSV.ReadRow(CSV.camoCategoryTable, iter_7_1)

			if LOOT.IsAZombieCamoCategory(var_7_25) then
				table.insert(var_7_21, var_7_26)
			else
				table.insert(var_7_20, var_7_26)
			end
		end
	end

	if var_7_2[StringTable.CBGJCDIHCE(CSV.camoCategoryTable.file, 0, CSV.camoCategoryTable.cols.ref)] then
		if var_0_0 == arg_7_0._equippedCamoCategory then
			arg_7_0._defaultGridIndex = var_7_22
		end

		local var_7_27 = CSV.ReadRow(CSV.camoCategoryTable, 0)

		table.insert(var_7_20, var_7_27)
	end

	arg_7_0._categoryTable = var_7_20
	arg_7_0._zombiesCategoryTable = var_7_21
	arg_7_0._camoTable = var_7_2
end

local function var_0_10(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0

	if arg_8_0._camoTable[arg_8_2] then
		var_8_0 = arg_8_0._camoTable[arg_8_2][2]
	end

	local var_8_1 = LOOT.IsMWItem({
		type = LOOT.itemTypes.WEAPON,
		ref = arg_8_3
	})

	if var_8_0 and not var_8_1 then
		local var_8_2 = tonumber(var_8_0.unlockInfo.level)
		local var_8_3 = Gunsmith.BEDFIJHAB(arg_8_0._controllerIndex, arg_8_3)
		local var_8_4 = false
		local var_8_5 = var_8_0 and var_8_0.unlockInfo and var_8_0.unlockInfo.unlocked

		if PROGRESSION.ShouldUnlockAll() or PROGRESSION.ShouldUnlockReleased(var_8_0.unlockInfo.lootID) or var_8_5 then
			var_8_4 = true
		elseif var_8_3 and var_8_3.rank and var_8_2 then
			var_8_4 = var_8_2 <= var_8_3.rank
		end

		if not var_8_4 then
			if CONDITIONS.IsWZWipFlowEnabled() then
				arg_8_0._atLeast1LockedCamoCategory = true
			end

			local var_8_6 = PROGRESSION.GetUnlockTextWithRank(var_8_0.unlockInfo.level)

			arg_8_1:SetDescription(var_8_6)
			arg_8_1:SetButtonDisabled(true)
		elseif arg_8_1:IsDisabled() then
			arg_8_1:SetButtonDisabled(false)
			ACTIONS.AnimateSequence(arg_8_1, "ShowImage")
		end
	elseif var_8_0 and not var_8_0.unlockInfo.unlocked then
		if CONDITIONS.IsWZWipFlowEnabled() then
			arg_8_0._atLeast1LockedCamoCategory = true
		end

		local var_8_7
		local var_8_8 = var_8_0.unlockInfo.challengeID

		if var_8_8 and #var_8_8 > 0 then
			local var_8_9 = StringTable.BJJBBCJGEJ(CSV.gunsmithChallenges.file, CSV.gunsmithChallenges.cols.id, var_8_8)
			local var_8_10 = StringTable.CBGJCDIHCE(CSV.gunsmithChallenges.file, var_8_9, CSV.gunsmithChallenges.cols.desc)

			var_8_7 = Engine.CBBHFCGDIC(var_8_10)
		else
			var_8_7 = PROGRESSION.GetUnlockTextWithRank(var_8_0.unlockInfo.level)
		end

		arg_8_1:SetDescription(var_8_7)
		arg_8_1:SetButtonDisabled(true)
	elseif not var_8_0 then
		assert(var_8_0 ~= nil, "WARNING: Missing camos for category " .. arg_8_2 .. ". Ensure progression data is properly set up for the current weapon.")
		arg_8_1:SetButtonDisabled(true)
	end
end

local function var_0_11(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if CONDITIONS.IsWZWipFlowEnabled() then
		arg_9_0._atLeast1LockedCamoCategory = false
	end

	arg_9_0.CamoCategoryButtonGrid:SetRefreshChild(function(arg_10_0, arg_10_1, arg_10_2)
		local var_10_0 = arg_9_0.CamoCategoryButtonGrid:GetContentIndex(arg_10_1, arg_10_2)
		local var_10_1 = arg_9_0._isZombieCamosTab and arg_9_0._zombiesCategoryTable[var_10_0 + 1] or arg_9_0._categoryTable[var_10_0 + 1]
		local var_10_2 = var_10_1.name
		local var_10_3 = arg_9_0._camoTable[var_10_1.ref][2].image
		local var_10_4 = var_10_1.ref == arg_9_0._equippedCamoCategory

		ACTIONS.AnimateSequence(arg_10_0.EquippedNotification, var_10_4 and "On" or "Off")
		ACTIONS.AnimateSequence(arg_10_0, var_10_4 and "EquippedAndNew" or "NotEquippedAndNew")

		if var_10_4 then
			var_10_3 = WEAPON.GetCamoImage(arg_9_0._equippedCamo)
		end

		arg_10_0.Category:setText(Engine.CBBHFCGDIC(var_10_2))
		arg_10_0.Image:setImage(RegisterMaterial(var_10_3))

		if not arg_10_0._handlerAdded then
			arg_10_0._handlerAdded = true

			arg_10_0:addEventHandler("button_action", function(arg_11_0, arg_11_1)
				local var_11_0 = arg_9_0._isZombieCamosTab and arg_9_0._zombiesCategoryTable[var_10_0 + 1] or arg_9_0._categoryTable[var_10_0 + 1]
				local var_11_1 = {
					weaponSlot = arg_9_2,
					loadoutIndex = arg_9_1,
					camoTable = arg_9_0._camoTable[var_11_0.ref],
					category = Engine.CBBHFCGDIC(var_11_0.name),
					camoCategoryRef = var_11_0.ref
				}

				LUI.FlowManager.RequestAddMenu("CamoSelect", true, arg_11_1.controller, nil, var_11_1, true)
			end)
		end

		local var_10_5 = false
		local var_10_6 = arg_9_0._camoTable[var_10_1.ref]
		local var_10_7 = 0

		if var_10_6 then
			for iter_10_0, iter_10_1 in ipairs(var_10_6) do
				if iter_10_0 > 1 then
					local var_10_8 = iter_10_1.unlockInfo.lootID

					if Loot.HDJCADADF(arg_9_0._controllerIndex, var_10_8) then
						var_10_5 = true
					end

					if iter_10_1.unlockInfo.unlocked then
						var_10_7 = var_10_7 + 1
					end
				end
			end
		end

		arg_10_0:UpdateBreadcrumb(var_10_5)
		arg_10_0:SetDescription(Engine.CBBHFCGDIC("CAS/GUNSMITH_UNLOCKS", var_10_7, #var_10_6 - 1))
		var_0_10(arg_9_0, arg_10_0, var_10_1.ref, arg_9_3)
	end)
	arg_9_0.CamoCategoryButtonGrid:SetNumChildren(arg_9_0._isZombieCamosTab and #arg_9_0._zombiesCategoryTable or #arg_9_0._categoryTable)
	arg_9_0.CamoCategoryButtonGrid:RefreshContent()

	local var_9_0 = arg_9_0.CamoCategoryButtonGrid:GetPositionForIndex(arg_9_0._defaultGridIndex or 0)

	arg_9_0.CamoCategoryButtonGrid:SetDefaultFocus(var_9_0)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_9_1 = LOOT.GetBaseWeaponItemID(arg_9_0._weaponTable.weapon)
		local var_9_2 = LOOT.GetGameSourceIDFromItemID(var_9_1)

		if arg_9_0._atLeast1LockedCamoCategory and var_9_2 == LUI.GAME_SOURCE_ID.COLD_WAR and Dvar.IBEGCHEFE("scr_t9CamoCategoryProgressableMessage") then
			arg_9_0.WZWipSnipeProgressableMessage:UpdateMessage({
				gameSourceID = var_9_2,
				isZombiesTab = arg_9_0._isZombieCamosTab
			})
			ACTIONS.AnimateSequence(arg_9_0.WZWipSnipeProgressableMessage, "Show")
		else
			ACTIONS.AnimateSequence(arg_9_0.WZWipSnipeProgressableMessage, "Hide")
		end
	end
end

local function var_0_12(arg_12_0, arg_12_1)
	if #arg_12_0._zombiesCategoryTable == 0 then
		arg_12_0:RemoveElement(arg_12_0.Tabs)
		var_0_11(arg_12_0, arg_12_0._loadoutIndex, arg_12_0._weaponSlot, arg_12_0._weaponTable.weapon)

		return
	end

	arg_12_0._tabsData = {}
	arg_12_0._tabsData[#arg_12_0._tabsData + 1] = {
		hasDefaultFocus = true,
		name = Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS")
	}
	arg_12_0._tabsData[#arg_12_0._tabsData + 1] = {
		hasDefaultFocus = false,
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ZM"))
	}

	local var_12_0 = {}

	for iter_12_0, iter_12_1 in pairs(arg_12_0._tabsData) do
		local var_12_1 = {
			name = iter_12_1.name,
			hasDefaultFocus = iter_12_1.hasDefaultFocus,
			focusFunction = function(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
				arg_12_0._isZombieCamosTab = arg_13_2 == 1 and true or false

				var_0_11(arg_12_0, arg_12_0._loadoutIndex, arg_12_0._weaponSlot, arg_12_0._weaponTable.weapon)
			end
		}

		table.insert(var_12_0, var_12_1)
	end

	arg_12_0.Tabs:SetTabs(var_12_0)
	arg_12_0.Tabs:SizeTabsToFit()
end

local function var_0_13(arg_14_0, arg_14_1, arg_14_2)
	assert(arg_14_0.MenuTitle)
	assert(arg_14_0.CamoCategoryButtonGrid)

	arg_14_0._controllerIndex = arg_14_1

	if Engine.BHICADFIHA() then
		if not arg_14_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for WeaponCustomize menu. Only OK after a MyChanges.")

			arg_14_2.loadoutIndex = 0
		end

		if not arg_14_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for WeaponCustomize menu. Only OK after a MyChanges.")

			arg_14_2.weaponSlot = 0
		end
	end

	assert(arg_14_2.loadoutIndex)
	assert(arg_14_2.weaponSlot)
	FrontEndScene.SetExclusiveWeaponModels({
		FrontEndScene.ClientWeapons.Preview
	})

	arg_14_0.weaponModel = WEAPON.GetWeaponModel(arg_14_1, FrontEndScene.ClientWeapons.Preview)

	arg_14_0:addElement(arg_14_0.weaponModel)

	local var_14_0 = PlayerData.BFFBGAJGD(arg_14_0._controllerIndex, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_14_2.loadoutIndex].weaponSetups[arg_14_2.weaponSlot]

	arg_14_0._weaponTable = WEAPON.GenerateWeaponTable(var_14_0)

	WEAPON.SetPreviewSceneForWeapon(arg_14_0._weaponTable.weapon)

	arg_14_0._equippedCamo = arg_14_0._weaponTable.camo
	arg_14_0._equippedCamoCategory = WEAPON.GetCamoCategory(arg_14_0._equippedCamo)

	var_0_9(arg_14_0)

	arg_14_0._loadoutIndex = arg_14_2.loadoutIndex
	arg_14_0._weaponSlot = arg_14_2.weaponSlot

	local var_14_1 = WEAPON.GetCamoName(arg_14_0._equippedCamo)

	arg_14_0.CamoPanel.Name:setText(ToUpperCase(Engine.CBBHFCGDIC(var_14_1)))

	local var_14_2 = arg_14_0._equippedCamo ~= WEAPON.CamoNoneValue

	arg_14_0.CamoPanel:SetAlpha(var_14_2 and 1 or 0)

	if var_14_2 then
		ACTIONS.AnimateSequence(arg_14_0.CamoPanel, "EquippedNoChallenge")
	end

	if Engine.DDJFBBJAIG() then
		local var_14_3 = WEAPON.GenerateWeaponTable(var_14_0)
		local var_14_4 = WEAPON.GetWeaponModelName(var_14_3.weapon, var_14_3, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_14_1
		})

		FrontEndScene.RequestWeaponViewModels({
			var_14_4
		}, arg_14_1)
		WEAPON.SetModelIfLoaded(arg_14_1, arg_14_0.weaponModel, var_14_4, {
			modelWeaponTable = arg_14_0._weaponTable
		})
	end

	arg_14_0.bindButton:addEventHandler("button_right_stick", function(arg_15_0, arg_15_1)
		local var_15_0 = {
			weaponTable = arg_14_0._weaponTable
		}

		LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_15_1.controller, nil, var_15_0, true)

		if arg_15_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end)
	arg_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt1",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_CAMO")
	})
	arg_14_0.bindButton:addEventHandler("button_alt1", function(arg_16_0, arg_16_1)
		WEAPON.SetEquippedCamo(var_14_0, WEAPON.CamoNoneValue)
		arg_14_0.CamoPanel:SetAlpha(0)

		if Engine.DDJFBBJAIG() then
			local var_16_0 = WEAPON.GenerateWeaponTable(var_14_0)

			var_16_0.camo = WEAPON.CamoNoneValue
			arg_14_0._weaponTable.camo = WEAPON.CamoNoneValue

			local var_16_1 = WEAPON.GetWeaponModelName(var_16_0.weapon, var_16_0, {
				includeCamos = true,
				includeAttachments = true,
				includeStickers = true,
				controllerIndex = arg_14_0._controllerIndex
			})

			FrontEndScene.RequestWeaponViewModels({
				var_16_1
			}, arg_14_0._controllerIndex)
			WEAPON.SetModelIfLoaded(arg_14_0._controllerIndex, arg_14_0.weaponModel, var_16_1, {
				modelWeaponTable = arg_14_0._weaponTable
			})
			Engine.BJDBIAGIDA(SOUND_SETS.default.action)
			arg_14_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_alt1"
			})

			arg_14_0._equippedCamoCategory = "default"

			arg_14_0.CamoCategoryButtonGrid:RefreshContent()
		end
	end)

	local var_14_5 = var_14_0.weapon:get()

	if PROGRESSION.ShouldUnlockAll() then
		arg_14_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_14_0.GunsmithWeaponLevel:Setup(arg_14_1, var_14_5)
	end

	if CONDITIONS.IsWZWipFlowEnabled() and Engine.DDJFBBJAIG() then
		arg_14_0.WZWipSnipeBackgroundSceneOverlay:UpdateSnipeOverlay({
			useGunsmithSetup = true,
			weaponRef = var_14_5
		})
	end

	if arg_14_0.WZWipSnipeBackgroundSceneOverlay and arg_14_0.WZWipSnipeBackgroundSceneOverlay._gameSourceID == LUI.GAME_SOURCE_ID.COLD_WAR then
		arg_14_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/CW_CAMO_CATEGORY_TITLE"))
	elseif arg_14_0.WZWipSnipeBackgroundSceneOverlay and arg_14_0.WZWipSnipeBackgroundSceneOverlay._gameSourceID == LUI.GAME_SOURCE_ID.VANGUARD then
		arg_14_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/VG_CAMO_CATEGORY_TITLE"))
	else
		arg_14_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/MW_CAMO_CATEGORY_TITLE"))
	end

	if Dvar.IBEGCHEFE("NORNTKRSTT") then
		var_0_12(arg_14_0, arg_14_1)
	else
		arg_14_0:RemoveElement(arg_14_0.Tabs)
		var_0_11(arg_14_0, arg_14_0._loadoutIndex, arg_14_0._weaponSlot, arg_14_0._weaponTable.weapon)
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_14_0.TabBacker)
end

function CamoCategorySelect(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0.id = "CamoCategorySelect"

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	var_17_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_17_1
	})
	var_17_0.HelperBar.id = "HelperBar"

	var_17_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_17_0.HelperBar:setPriority(10)
	var_17_0:addElement(var_17_0.HelperBar)

	local var_17_2 = var_17_0
	local var_17_3

	if CONDITIONS.InGame() then
		local var_17_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_17_1
		})

		var_17_4.id = "InGameMenuBackground"

		var_17_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_17_0:addElement(var_17_4)

		var_17_0.InGameMenuBackground = var_17_4
	end

	local var_17_5
	local var_17_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_17_1
	})

	var_17_6.id = "TabBacker"

	var_17_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_17_0:addElement(var_17_6)

	var_17_0.TabBacker = var_17_6

	local var_17_7

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_8 = MenuBuilder.BuildRegisteredType("WZSnipeBackgroundSceneOverlay", {
			controllerIndex = var_17_1
		})

		var_17_8.id = "WZWipSnipeBackgroundSceneOverlay"

		var_17_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_17_0:addElement(var_17_8)

		var_17_0.WZWipSnipeBackgroundSceneOverlay = var_17_8
	end

	local var_17_9

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_10 = MenuBuilder.BuildRegisteredType("WZSnipeProgressableMessage", {
			controllerIndex = var_17_1
		})

		var_17_10.id = "WZWipSnipeProgressableMessage"

		var_17_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 610, _1080p * 663, _1080p * 695)
		var_17_0:addElement(var_17_10)

		var_17_0.WZWipSnipeProgressableMessage = var_17_10
	end

	local var_17_11
	local var_17_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_17_1
	})

	var_17_12.id = "MenuTitle"

	var_17_12.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CAMO_CATEGORY_TITLE")), 0)
	var_17_12.Line:SetLeft(0, 0)
	var_17_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_17_0:addElement(var_17_12)

	var_17_0.MenuTitle = var_17_12

	local var_17_13
	local var_17_14 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = true,
		maxVisibleColumns = 5,
		maxVisibleRows = 2,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_17_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CamoCategoryButton", {
				controllerIndex = var_17_1
			})
		end,
		refreshChild = function(arg_19_0, arg_19_1, arg_19_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 301,
		rowHeight = _1080p * 112,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_17_15 = LUI.UIGrid.new(var_17_14)

	var_17_15.id = "CamoCategoryButtonGrid"

	var_17_15:setUseStencil(true)
	var_17_15:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 1706, _1080p * -345, _1080p * -101)
	var_17_0:addElement(var_17_15)

	var_17_0.CamoCategoryButtonGrid = var_17_15

	local var_17_16
	local var_17_17 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_17_1
	})

	var_17_17.id = "LobbyStatus"

	var_17_17:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_17_0:addElement(var_17_17)

	var_17_0.LobbyStatus = var_17_17

	local var_17_18
	local var_17_19 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_17_1
	})

	var_17_19.id = "VerticalMinimalScrollbar"

	var_17_19:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1706, _1080p * 1717, _1080p * -345, _1080p * -101)
	var_17_0:addElement(var_17_19)

	var_17_0.VerticalMinimalScrollbar = var_17_19

	local var_17_20
	local var_17_21 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_17_1
	})

	var_17_21.id = "GunsmithWeaponLevel"

	var_17_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_17_0:addElement(var_17_21)

	var_17_0.GunsmithWeaponLevel = var_17_21

	local var_17_22
	local var_17_23 = MenuBuilder.BuildRegisteredType("WeaponCustomizationPanel", {
		controllerIndex = var_17_1
	})

	var_17_23.id = "CamoPanel"

	var_17_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 200, _1080p * 480)
	var_17_0:addElement(var_17_23)

	var_17_0.CamoPanel = var_17_23

	local var_17_24
	local var_17_25 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_17_1
			})
		end,
		controllerIndex = var_17_1
	}
	local var_17_26 = LUI.TabManager.new(var_17_25)

	var_17_26.id = "Tabs"

	var_17_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 589, _1080p * 108, _1080p * 160)
	var_17_0:addElement(var_17_26)

	var_17_0.Tabs = var_17_26

	local var_17_27 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_17_19,
		startCap = var_17_19.startCap,
		endCap = var_17_19.endCap,
		sliderArea = var_17_19.sliderArea,
		slider = var_17_19.sliderArea and var_17_19.sliderArea.slider,
		fixedSizeSlider = var_17_19.sliderArea and var_17_19.sliderArea.fixedSizeSlider
	})

	var_17_15:AddScrollbar(var_17_27)
	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_r3",
		priority = 3,
		helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
	})

	local var_17_28 = LUI.UIBindButton.new()

	var_17_28.id = "selfBindButton"

	var_17_0:addElement(var_17_28)

	var_17_0.bindButton = var_17_28

	var_17_0.bindButton:addEventHandler("button_secondary", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_17_1
		end

		ACTIONS.LeaveMenu(var_17_0)
	end)
	var_0_13(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("CamoCategorySelect", CamoCategorySelect)
LockTable(_M)
