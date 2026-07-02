module(..., package.seeall)

if Engine.DDJFBBJAIG() then
	LUI.FlowManager.RegisterFenceGroup("WeaponLocker", {
		"StatsGroup"
	})
end

local var_0_0 = 5

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1 = WATCH.GetEquippedWatch(arg_1_1)
	local var_1_2 = WATCH.GetFullModelName(var_1_1)

	table.insert(var_1_0, var_1_2)

	local var_1_3 = PlayerData.BFFBGAJGD(arg_1_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_1_0._loadoutIndex]
	local var_1_4 = 1 - arg_1_0._weaponSlot
	local var_1_5 = var_1_3.weaponSetups[var_1_4]
	local var_1_6 = WEAPON.GetWeaponModelNameFromPlayerData(var_1_5.weapon:get(), var_1_5, {
		includeCamos = true,
		includeAttachments = true,
		includeStickers = true,
		controllerIndex = arg_1_1
	})

	table.insert(var_1_0, var_1_6)
	table.insert(var_1_0, arg_1_2)
	FrontEndScene.RequestWeaponViewModels(var_1_0, arg_1_1)
end

local function var_0_2(arg_2_0, arg_2_1)
	if not arg_2_1 then
		return
	end

	local var_2_0 = arg_2_0.Tabs:GetTabAtIndex(arg_2_1)

	if not var_2_0:IsEnabled() then
		return
	end

	local var_2_1 = arg_2_0.tabsData[arg_2_1].classData.ref
	local var_2_2 = WEAPON.GetNewWeaponIDsByClass(arg_2_0._controllerIndex, var_2_1, {
		getBaseWeapon = false
	})

	if var_2_0.NewItemSmallIcon then
		var_2_0.NewItemSmallIcon:UpdateAlpha(#var_2_2 > 0 and 1 or 0)
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	local var_3_0 = 0

	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		local var_3_1 = arg_3_1[iter_3_0].ref

		if var_3_1 and var_3_1 ~= "none" then
			var_3_0 = var_3_0 + 1
		end
	end

	arg_3_0.GunsmithDetailedEquippedSlots.EquippedText:setText(Engine.CBBHFCGDIC("CAS/EQUIPPED_COUNT", var_3_0, ATTACHMENT.count))
end

local function var_0_4(arg_4_0, arg_4_1)
	local var_4_0 = false

	if arg_4_0._selectedWeapon then
		if arg_4_1.isCustom or #arg_4_0._selectedWeapon.blueprintName > 0 then
			var_4_0 = GUNSMITH.AreCustomModsEqual(arg_4_0._selectedWeapon, arg_4_1)
		else
			var_4_0 = arg_4_0._selectedWeapon.weapon == arg_4_1.weapon and arg_4_0._selectedWeapon.lootID == arg_4_1.lootID
		end
	end

	return var_4_0
end

local function var_0_5(arg_5_0, arg_5_1)
	local var_5_0 = LUI.FlowManager.GetScopedData(arg_5_0)

	arg_5_0.GunsmithDetailedEquippedSlots:Setup(arg_5_1)
	var_0_3(arg_5_0, arg_5_1.attachments)
	arg_5_0.CategoryName:setText(WEAPON.GetSubClass(arg_5_1.weapon))

	if arg_5_1.isCustom then
		arg_5_0.WeaponName:setText(ToUpperCase(GUNSMITH.GetCustomModName(arg_5_1.blueprintName)))
		arg_5_0.SeasonWithText:SetAlpha(0)
	else
		arg_5_0.WeaponName:setText(ToUpperCase(arg_5_1.lootName))

		local var_5_1 = LOOT.GetItemQualityWithID(LOOT.itemTypes.WEAPON, arg_5_1.lootID)
		local var_5_2 = LOOT.GetItemSeasonByID(LOOT.itemTypes.WEAPON, arg_5_1.lootID)

		arg_5_0.QualityWithText:UpdateQualityText(var_5_1)

		if var_5_2 and var_5_2 > 0 and Dvar.IBEGCHEFE("NPOLQSQMNO") then
			arg_5_0.SeasonWithText:SetAlpha(1)
			arg_5_0.SeasonWithText:UpdateSeasonText(var_5_2)
		else
			arg_5_0.SeasonWithText:SetAlpha(0)
		end

		arg_5_0.SpecialWeaponAttributeWithText:SetAlpha(0)

		local var_5_3 = WEAPON.GetSpecialAttributeIcon(arg_5_1.lootID)
		local var_5_4 = WEAPON.GetSpecialAttributeName(arg_5_1.lootID)

		if #var_5_3 > 0 and #var_5_4 > 0 and not CONDITIONS.InGame(arg_5_0) then
			arg_5_0.SpecialWeaponAttributeWithText.Icon:setImage(RegisterMaterial(var_5_3))
			arg_5_0.SpecialWeaponAttributeWithText.Title:setText(Engine.CBBHFCGDIC(var_5_4))
			arg_5_0.SpecialWeaponAttributeWithText:SetAlpha(1)
		end
	end

	arg_5_0.WeaponWithAttachments:UpdateWithWeaponTable(arg_5_0._controllerIndex, false, arg_5_1)
	arg_5_0.WeaponAttributes:Setup(arg_5_1)

	if Engine.DDJFBBJAIG() then
		local var_5_5 = WEAPON.GetWeaponModelName(arg_5_1.weapon, arg_5_1, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_5_0._controllerIndex
		})

		var_0_1(arg_5_0, arg_5_0._controllerIndex, var_5_5)
		WEAPON.SetModelIfLoaded(arg_5_0._controllerIndex, arg_5_0._weaponModel, var_5_5, {
			forceOffsetsAndRotations = arg_5_0._selectingForWeapon
		})
	end

	arg_5_0._currentMod = arg_5_1
	var_5_0.lastFocusedClass = WEAPON.GetWeaponClass(arg_5_0._currentMod.weapon)

	local var_5_6 = not arg_5_1.isCustom
	local var_5_7 = var_0_4(arg_5_0, arg_5_1)
	local var_5_8 = "IsNotEquippedAndNotBlueprint"

	if var_5_6 and var_5_7 then
		var_5_8 = "IsEquippedAndBlueprint"
	elseif not var_5_6 and var_5_7 then
		var_5_8 = "IsEquippedAndNotBlueprint"
	elseif var_5_6 and not var_5_7 then
		var_5_8 = "IsNotEquippedAndBlueprint"
	end

	ACTIONS.AnimateSequence(arg_5_0, var_5_8)

	if not arg_5_1.isBase and not arg_5_1.isCustom and arg_5_1.lootID then
		arg_5_0.NewItemNotification:UpdateBreadcrumbByID(arg_5_0._controllerIndex, arg_5_1.lootID)
	end

	if arg_5_1.isCustom and not arg_5_0._selectingForWeapon then
		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 3,
			helper_text = Engine.CBBHFCGDIC("CAS/DELETE")
		})
	elseif arg_5_0._selectingForWeapon then
		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 3,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	else
		arg_5_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_primary"
		})
	end

	local var_5_9 = arg_5_0.BlueprintTag:SetBlueprint(not arg_5_1.isCustom, arg_5_1.fromBundle)
	local var_5_10 = arg_5_0.BlueprintTag:GetCurrentAnchorsAndPositions().left
	local var_5_11 = 20 * _1080p

	arg_5_0.SeasonWithText:SetLeft(var_5_10 + var_5_9 + var_5_11)

	if Engine.DDJFBBJAIG() and not Onboarding.Armory.WasCompleted(arg_5_0, arg_5_0._controllerIndex) then
		if CONDITIONS.IsMagmaGameMode(arg_5_0) then
			LUI.FlowManager.RequestPopupMenu(arg_5_0, "onboardingpopup", true, arg_5_0._controllerIndex, false, ONBOARDING_DATA.GetOnboardingWZArmoryData())
		else
			LUI.FlowManager.RequestPopupMenu(arg_5_0, "onboardingpopup", true, arg_5_0._controllerIndex, false, ONBOARDING_DATA.GetOnboardingArmoryData())
		end

		Onboarding.Armory.MarkCompleted(arg_5_0, arg_5_0._controllerIndex)
	end

	if arg_5_0.BundleUpsellButton then
		if arg_5_1.fromBundle and arg_5_1.bundleID and Dvar.IBEGCHEFE("LTSNLQNRKO") then
			arg_5_0.BundleUpsellButton:SetupUpsellButtonWithBundleID(arg_5_0._controllerIndex, arg_5_1.bundleID)
		else
			arg_5_0.BundleUpsellButton:HideButton()
		end
	end
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = #arg_6_2

	assert(var_6_0 > 0)

	arg_6_0._currentModifications = arg_6_2

	if Engine.DDJFBBJAIG() then
		arg_6_0.WeaponGrid:SetNumChildren(var_6_0)

		if var_6_0 > var_0_0 then
			arg_6_0.WeaponGrid:SetNumColumns(var_0_0)
		else
			arg_6_0.WeaponGrid:SetNumColumns(var_6_0)
		end
	else
		arg_6_0.WeaponGrid:SetNumColumns(1)
		arg_6_0.WeaponGrid:SetNumRows(var_6_0)
	end

	arg_6_0.WeaponGrid:RefreshContent()
	Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)

	local var_6_1 = LUI.FlowManager.GetScopedData(arg_6_0)

	if var_6_1.blueprintStore and #arg_6_2 == 1 then
		var_6_1.oneMod = true
	end
end

local function var_0_7(arg_7_0)
	local var_7_0 = arg_7_0.WeaponGrid:GetFocusPosition(LUI.DIRECTION.horizontal)
	local var_7_1 = arg_7_0.WeaponGrid:GetFocusPosition(LUI.DIRECTION.vertical)

	if not var_7_1 or not var_7_0 then
		return nil
	end

	local var_7_2 = arg_7_0.WeaponGrid:GetContentIndex(var_7_0, var_7_1)

	return arg_7_0._currentModifications[var_7_2 + 1]
end

local function var_0_8(arg_8_0, arg_8_1)
	local var_8_0 = {}
	local var_8_1 = LUI.FlowManager.GetScopedData(arg_8_0)

	arg_8_0._numEnabledTabs = 0

	local var_8_2 = {}

	for iter_8_0 = 0, StringTable.BFHCAIIDA(CSV.weaponClasses.file) do
		local var_8_3 = CSV.ReadRow(CSV.weaponClasses, iter_8_0)

		if tonumber(var_8_3.showInMenus) == 1 and tonumber(var_8_3.hasVariants) == 1 then
			var_8_2[var_8_3.ref] = arg_8_0._modificationTable[var_8_3.ref] and #arg_8_0._modificationTable[var_8_3.ref] > 0

			if var_8_2[var_8_3.ref] then
				local var_8_4 = {
					classData = var_8_3,
					name = Engine.CBBHFCGDIC(var_8_3.pluralName),
					focusFunction = function(arg_9_0, arg_9_1, arg_9_2)
						local var_9_0 = var_0_7(arg_8_0)

						if var_9_0 and var_9_0.lootID and var_9_0.isCustom == false then
							Loot.BCAACADBEA(arg_9_1, var_9_0.lootID)
						end

						arg_8_0:UpdateTabBreadcrumb(arg_8_0._currentTabIndex)

						arg_8_0._currentTabIndex = arg_9_2 + 1

						local var_9_1 = var_8_0[arg_9_2 + 1].classData

						var_0_6(arg_8_0, arg_9_1, arg_8_0._modificationTable[var_9_1.ref])

						local var_9_2 = var_0_7(arg_8_0)

						if var_9_2 then
							var_0_5(arg_8_0, var_9_2)
						end
					end
				}

				if not var_8_4.disabled then
					arg_8_0._numEnabledTabs = arg_8_0._numEnabledTabs + 1
				end

				table.insert(var_8_0, var_8_4)
			end
		end
	end

	arg_8_0.tabsData = var_8_0

	arg_8_0.Tabs:SetDefaultFocus(function()
		local var_10_0 = LUI.FlowManager.GetScopedData(arg_8_0)

		if var_10_0.lastFocusedClass then
			for iter_10_0, iter_10_1 in pairs(var_8_0) do
				if var_8_2[iter_10_1.classData.ref] and var_10_0.lastFocusedClass == iter_10_1.classData.ref then
					return iter_10_0
				end
			end
		end

		return 1
	end)
	arg_8_0.Tabs:SetTabs(var_8_0)

	for iter_8_1 = 1, #var_8_0 do
		arg_8_0:UpdateTabBreadcrumb(iter_8_1)
	end
end

local function var_0_9(arg_11_0, arg_11_1)
	if arg_11_0.fromBundle == arg_11_1.fromBundle then
		if arg_11_0.displayOrder == arg_11_1.displayOrder then
			if not arg_11_0.isCustom and not arg_11_1.isCustom then
				if not arg_11_0.isBase and not arg_11_1.isBase then
					return arg_11_0.rarity > arg_11_1.rarity
				else
					return arg_11_0.isBase and not arg_11_1.isBase
				end
			else
				return arg_11_1.isCustom and not arg_11_0.isCustom
			end
		else
			return arg_11_0.displayOrder < arg_11_1.displayOrder
		end
	else
		return not arg_11_0.fromBundle and arg_11_1.fromBundle
	end
end

local function var_0_10(arg_12_0, arg_12_1)
	local var_12_0 = LUI.FlowManager.GetScopedData(arg_12_0)
	local var_12_1 = {}

	if CountTableKeys(var_12_0.filteredWeapons) > 0 then
		var_12_1.byWeapons = var_12_0.filteredWeapons

		if var_12_0.deletingForWeapon then
			var_12_1.forceCustom = true
		end
	end

	if var_12_0.selectingForWeapon then
		var_12_1.includeBaseWeapons = true
	elseif var_12_0.blueprintStore then
		var_12_1.exclusiveBundleItems = true
		var_12_1.forceLoot = true
	else
		var_12_1.includeBundleItems = Dvar.IBEGCHEFE("NKRLMNTNRS")
	end

	arg_12_0._modificationTable = WEAPON.GetArmoryWeaponsByClass(arg_12_1, var_12_1)

	local var_12_2 = 0

	for iter_12_0, iter_12_1 in pairs(arg_12_0._modificationTable) do
		var_12_2 = var_12_2 + #iter_12_1

		table.sort(iter_12_1, var_0_9)
	end

	var_0_8(arg_12_0, arg_12_1)

	if arg_12_0._hideTabs then
		arg_12_0.Tabs:SetAlpha(0)
	end
end

local function var_0_11(arg_13_0, arg_13_1)
	local var_13_0
	local var_13_1

	if Engine.DDJFBBJAIG() then
		var_13_1 = {
			scrollingThresholdX = 1,
			maxVelocity = 5000,
			adjustSizeToContent = false,
			scrollingThresholdY = 1,
			wrapX = true,
			maxVisibleRows = 2,
			wrapY = true,
			springCoefficient = 400,
			maxVisibleColumns = var_0_0,
			controllerIndex = arg_13_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("WeaponLockerButton", {
					controllerIndex = arg_13_1
				})
			end,
			refreshChild = function(arg_15_0, arg_15_1, arg_15_2)
				return
			end,
			spacingX = _1080p * 28,
			spacingY = _1080p * 10,
			columnWidth = _1080p * 310,
			rowHeight = _1080p * 100,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}
	else
		var_13_1 = {
			scrollingThresholdX = 1,
			wrapX = true,
			maxVelocity = 5000,
			adjustSizeToContent = true,
			scrollingThresholdY = 1,
			maxVisibleColumns = 1,
			wrapY = true,
			forcePrimaryAxisScrolling = true,
			springCoefficient = 400,
			maxVisibleRows = SubtractForSplitscreen(6, 3),
			controllerIndex = arg_13_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("WeaponLockerButton", {
					controllerIndex = arg_13_1
				})
			end,
			refreshChild = function(arg_17_0, arg_17_1, arg_17_2)
				return
			end,
			spacingX = _1080p * 5,
			spacingY = _1080p * 5,
			columnWidth = _1080p * 310,
			rowHeight = _1080p * 100,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}
	end

	local var_13_2 = LUI.UIGrid.new(var_13_1)

	var_13_2.id = "WeaponGrid"

	var_13_2:setUseStencil(true)
	var_13_2:AddItemNumbers(arg_13_0.ListCount)
	var_13_2:AddArrow(arg_13_0.ArrowUp)
	var_13_2:setPriority(-10)
	arg_13_0.ArrowUp:SetupArrow(LUI.BEARING.up)
	var_13_2:AddArrow(arg_13_0.ArrowDown)
	arg_13_0.ArrowDown:SetupArrow(LUI.BEARING.down)

	if Engine.DDJFBBJAIG() then
		var_13_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 2016, _1080p * 746, _1080p * 957)
	else
		var_13_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 440, _1080p * 206, _1080p * 830)
	end

	arg_13_0:addElement(var_13_2)

	arg_13_0.WeaponGrid = var_13_2

	var_13_2:SetRefreshChild(function(arg_18_0, arg_18_1, arg_18_2)
		local var_18_0 = arg_13_0.WeaponGrid:GetContentIndex(arg_18_1, arg_18_2)
		local var_18_1 = arg_13_0._currentModifications[var_18_0 + 1]
		local var_18_2 = #arg_13_0._currentModifications == 1 and arg_13_0._numEnabledTabs == 1

		arg_18_0:Setup(var_18_1, var_0_4(arg_13_0, var_18_1), var_18_2)
	end)

	local var_13_3 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_13_0.Scrollbar,
		startCap = arg_13_0.Scrollbar.startCap,
		endCap = arg_13_0.Scrollbar.endCap,
		sliderArea = arg_13_0.Scrollbar.sliderArea,
		slider = arg_13_0.Scrollbar.sliderArea and arg_13_0.Scrollbar.sliderArea.slider,
		fixedSizeSlider = arg_13_0.Scrollbar.sliderArea and arg_13_0.Scrollbar.sliderArea.fixedSizeSlider
	})

	var_13_2:AddScrollbar(var_13_3)
end

local function var_0_12(arg_19_0, arg_19_1)
	ACTIONS.UploadStats(arg_19_0, arg_19_1.controller)
end

local function var_0_13(arg_20_0, arg_20_1, arg_20_2)
	assert(arg_20_0.Tabs)
	assert(arg_20_0.CategoryName)
	assert(arg_20_0.WeaponName)
	assert(arg_20_0.WeaponAttributes)
	assert(arg_20_0.GunsmithDetailedEquippedSlots)
	assert(arg_20_0.GunsmithDetailedEquippedSlots.EquippedText)
	assert(arg_20_0.Scrollbar)
	assert(arg_20_0.NewItemNotification)

	arg_20_0.Setup = var_0_10
	arg_20_0._controllerIndex = arg_20_1
	arg_20_0.UpdateTabBreadcrumb = var_0_2

	if IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_20_0, "CHT")
	end

	if arg_20_2.deletingForWeapon then
		assert(arg_20_2.weaponRef)
		arg_20_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CAS/DELETE_SPECIFIC_WEAPON_MOD", WEAPON.GetName(arg_20_2.weaponRef)))
		arg_20_0.SpecialWeaponAttributeWithText:SetAlpha(0)
	elseif arg_20_2.blueprintStore then
		arg_20_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CAS/BLUEPRINT_STORE"))
	else
		arg_20_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CAS/WEAPON_LOCKER"))
	end

	arg_20_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	local var_20_0 = LUI.FlowManager.GetScopedData(arg_20_0)

	var_20_0.filteredWeapons = var_20_0.filteredWeapons or {}
	arg_20_0._selectingForWeapon = arg_20_2.selectingForWeapon

	if arg_20_2.selectingForWeapon or arg_20_2.deletingForWeapon or arg_20_2.blueprintStore then
		assert(arg_20_2.weaponRef)

		var_20_0.filteredWeapons[arg_20_2.weaponRef] = true
	end

	if arg_20_2.blueprintStore then
		ACTIONS.AnimateSequence(arg_20_0, "BlueprintStore")
	end

	if arg_20_2.selectingForWeapon then
		assert(arg_20_2.loadoutIndex)
		assert(arg_20_2.weaponSlot)

		local var_20_1 = PlayerData.BFFBGAJGD(arg_20_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_20_2.loadoutIndex].weaponSetups[arg_20_2.weaponSlot]

		arg_20_0._selectedWeapon = WEAPON.GenerateWeaponTable(var_20_1)
	else
		ACTIONS.AnimateSequence(arg_20_0, "IsNotEquippedAndNotBlueprint")

		arg_20_0._lastEquipSequencePlayed = "IsNotEquippedAndNotBlueprint"
	end

	arg_20_0._weaponSlot = arg_20_2.weaponSlot or WEAPON.PrimarySlot
	arg_20_0._loadoutIndex = arg_20_2.loadoutIndex or LOADOUT.GetFavoriteLoadoutIndex(arg_20_1)
	arg_20_0._hideTabs = arg_20_2.hideTabs

	var_0_11(arg_20_0, arg_20_1)

	if arg_20_0.InGameMenuBackground then
		arg_20_0:RemoveElement(arg_20_0.InGameMenuBackground)
		arg_20_0.InGameMenuBackground:setPriority(-11)
		arg_20_0:addElement(arg_20_0.InGameMenuBackground)
	end

	arg_20_0:RemoveElement(arg_20_0.Vignette)
	arg_20_0.Vignette:setPriority(-12)
	arg_20_0:addElement(arg_20_0.Vignette)
	arg_20_0:Setup(arg_20_1)
	arg_20_0:addEventHandler("restore_focus", function(arg_21_0, arg_21_1)
		local var_21_0 = LUI.FlowManager.GetScopedData(arg_21_0)

		if arg_21_1.data then
			arg_21_1.data.currentTab = nil
		end

		if var_21_0.updateModifications then
			arg_20_0:Setup(arg_20_1)

			var_21_0.updateModifications = false
		end
	end)
	arg_20_0:registerEventHandler("update_for_weapon", function(arg_22_0, arg_22_1)
		var_0_5(arg_22_0, arg_22_1.weapon)
	end)
	arg_20_0:registerEventHandler("clear_newMod", function(arg_23_0, arg_23_1)
		arg_23_0:UpdateTabBreadcrumb(arg_23_0._currentTabIndex)
	end)

	if Engine.DDJFBBJAIG() then
		local var_20_2 = WATCH.GetEquippedWatch(arg_20_1)

		WATCH.CreateWidgetForWatch(arg_20_0, arg_20_1, var_20_2)

		if arg_20_2.weaponSlot == WEAPON.SecondarySlot and arg_20_2.weaponRef then
			Engine.DHFCHIIJCA(WEAPON.GetGunTableSecondPositionScene(arg_20_2.weaponRef))
		else
			Engine.DHFCHIIJCA("loadout_showcase_armory")
		end

		if var_20_2 ~= WATCH.WatchNoneValue then
			FrontEndScene.SetExclusiveWeaponModels({
				FrontEndScene.ClientWeapons.GunTablePrimary,
				FrontEndScene.ClientWeapons.GunTableSecondary,
				FrontEndScene.ClientWeapons.Watch
			})
		else
			FrontEndScene.SetExclusiveWeaponModels({
				FrontEndScene.ClientWeapons.GunTablePrimary,
				FrontEndScene.ClientWeapons.GunTableSecondary
			})
		end

		arg_20_0._weaponModel = WEAPON.GetWeaponModel(arg_20_1, arg_20_2.weaponSlot or WEAPON.PrimarySlot)

		arg_20_0:addElement(arg_20_0._weaponModel)
		arg_20_0.bindButton:addEventHandler("button_alt1", function(arg_24_0, arg_24_1)
			arg_20_2.weaponTable = arg_20_0._currentMod
			arg_20_2.fromArmory = true
			arg_20_2.weaponRef = arg_20_2.weaponTable.weapon

			LUI.FlowManager.RequestAddMenu("ModificationPreview", true, arg_20_1, nil, arg_20_2, true)
		end)
	end

	if Engine.DDJFBBJAIG() then
		local function var_20_3(arg_25_0, arg_25_1)
			if LUI.IsLastInputKeyboardMouse(arg_25_1.controllerIndex) then
				ACTIONS.AnimateSequence(arg_25_0, "PC")
			else
				ACTIONS.AnimateSequence(arg_25_0, "Console")
			end
		end

		arg_20_0:addAndCallEventHandler("update_input_type", var_20_3, {
			controllerIndex = arg_20_1
		})
	elseif CONDITIONS.IsSplitscreen(arg_20_0) and CONDITIONS.InGame(arg_20_0) then
		ACTIONS.AnimateSequence(arg_20_0, "Splitscreen")
	else
		ACTIONS.AnimateSequence(arg_20_0, "InGame")
	end

	arg_20_0:registerEventHandler("menu_close", var_0_12)
	arg_20_0:registerEventHandler("menu_close_all", var_0_12)

	if not IsLanguageArabic() then
		arg_20_0.NewItemNotification:SetupLeftAlignment()
	end

	if arg_20_0._currentModifications[1] then
		var_0_5(arg_20_0, arg_20_0._currentModifications[1])
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_20_0.TabBacker)

	if arg_20_0.InGameMenuBackground then
		ACTIONS.ScaleFullscreen(arg_20_0.InGameMenuBackground)
	end

	ACTIONS.ScaleFullscreen(arg_20_0.Vignette)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_20_0, "AR")
	end

	if arg_20_0.BundleUpsellButton then
		arg_20_0.BundleUpsellButton:SetButtonPrimary(true)
		arg_20_0:registerEventHandler("open_bundle", function(arg_26_0, arg_26_1)
			local var_26_0 = LUI.FlowManager.GetScopedData(arg_20_0)
			local var_26_1 = false

			if var_26_0.blueprintStore and var_26_0.oneMod then
				var_26_1 = true
			end

			arg_20_0.BundleUpsellButton:OpenBundle(arg_20_1, {
				oneModBlueprintStore = var_26_1
			})
		end)
	end

	if arg_20_0.BundleUpsellButton then
		local var_20_4 = "WeaponLocker"

		if arg_20_0._selectingForWeapon then
			var_20_4 = "WeaponVariantSelect"
		elseif arg_20_2.blueprintStore then
			var_20_4 = LUI.FlowManager.IsInStack("WeaponSelect") and "BlueprintStore from WeaponSelect" or "BlueprintStore from LoadoutSelect"
		end

		arg_20_0.BundleUpsellButton:SetUpsellMenu(var_20_4)
	end
end

function WeaponLocker(arg_27_0, arg_27_1)
	local var_27_0 = LUI.UIElement.new()

	var_27_0.id = "WeaponLocker"
	var_27_0._animationSets = var_27_0._animationSets or {}
	var_27_0._sequences = var_27_0._sequences or {}

	local var_27_1 = arg_27_1 and arg_27_1.controllerIndex

	if not var_27_1 and not Engine.DDJFBBJAIG() then
		var_27_1 = var_27_0:getRootController()
	end

	assert(var_27_1)

	var_27_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_27_1
	})
	var_27_0.HelperBar.id = "HelperBar"

	var_27_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_27_0.HelperBar:setPriority(10)
	var_27_0:addElement(var_27_0.HelperBar)

	local var_27_2 = var_27_0
	local var_27_3
	local var_27_4 = LUI.UIImage.new()

	var_27_4.id = "Vignette"

	var_27_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_27_4:SetAlpha(0.5, 0)
	var_27_4:setImage(RegisterMaterial("menu_vignette_corner"), 0)
	var_27_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -638, 0, 0)
	var_27_0:addElement(var_27_4)

	var_27_0.Vignette = var_27_4

	local var_27_5

	if CONDITIONS.InGame(var_27_0) then
		local var_27_6 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_27_1
		})

		var_27_6.id = "InGameMenuBackground"

		var_27_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_27_0:addElement(var_27_6)

		var_27_0.InGameMenuBackground = var_27_6
	end

	local var_27_7
	local var_27_8 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_27_1
	})

	var_27_8.id = "ItemDescBacker"

	var_27_8:SetAlpha(0, 0)
	var_27_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 70, _1080p * 903, _1080p * 170, _1080p * 402)
	var_27_0:addElement(var_27_8)

	var_27_0.ItemDescBacker = var_27_8

	local var_27_9
	local var_27_10 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_27_1
	})

	var_27_10.id = "TabBacker"

	var_27_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_27_0:addElement(var_27_10)

	var_27_0.TabBacker = var_27_10

	local var_27_11
	local var_27_12 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_27_1
			})
		end,
		controllerIndex = var_27_1
	}
	local var_27_13 = LUI.TabManager.new(var_27_12)

	var_27_13.id = "Tabs"

	var_27_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 1824, _1080p * 108, _1080p * 160)
	var_27_0:addElement(var_27_13)

	var_27_0.Tabs = var_27_13

	local var_27_14
	local var_27_15 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_27_1
	})

	var_27_15.id = "MenuTitle"

	var_27_15.MenuTitle:setText(Engine.CBBHFCGDIC("CAS/WEAPON_LOCKER"), 0)
	var_27_15.Line:SetLeft(0, 0)
	var_27_15:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_27_0:addElement(var_27_15)

	var_27_0.MenuTitle = var_27_15

	local var_27_16

	if CONDITIONS.InFrontendPublicMP(var_27_0) then
		local var_27_17 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_27_1
		})

		var_27_17.id = "MPPlayerDetails"

		var_27_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_27_0:addElement(var_27_17)

		var_27_0.MPPlayerDetails = var_27_17
	end

	local var_27_18
	local var_27_19 = LUI.UIText.new()

	var_27_19.id = "CategoryName"

	var_27_19:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_27_19:setText("", 0)
	var_27_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_19:SetAlignment(LUI.Alignment.Left)
	var_27_19:SetOptOutRightToLeftAlignmentFlip(true)
	var_27_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 860, _1080p * 182, _1080p * 206)
	var_27_0:addElement(var_27_19)

	var_27_0.CategoryName = var_27_19

	local var_27_20
	local var_27_21 = LUI.UIText.new()

	var_27_21.id = "WeaponName"

	var_27_21:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_27_21:setText("", 0)
	var_27_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_27_21:SetWordWrap(false)
	var_27_21:SetAlignment(LUI.Alignment.Left)
	var_27_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 860, _1080p * 200, _1080p * 270)
	var_27_0:addElement(var_27_21)

	var_27_0.WeaponName = var_27_21

	local var_27_22
	local var_27_23 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_27_1
	})

	var_27_23.id = "WeaponAttributes"

	var_27_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 529, _1080p * 540, _1080p * 722)
	var_27_0:addElement(var_27_23)

	var_27_0.WeaponAttributes = var_27_23

	local var_27_24
	local var_27_25 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_27_1
	})

	var_27_25.id = "LobbyMembersFooter"

	var_27_25:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_27_0:addElement(var_27_25)

	var_27_0.LobbyMembersFooter = var_27_25

	local var_27_26
	local var_27_27 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_27_1
	})

	var_27_27.id = "Scrollbar"

	var_27_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1768, _1080p * 1779, _1080p * 745, _1080p * 955)
	var_27_0:addElement(var_27_27)

	var_27_0.Scrollbar = var_27_27

	local var_27_28
	local var_27_29 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_27_1
	})

	var_27_29.id = "EquippedWidget"

	var_27_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 232, _1080p * 355, _1080p * 385)
	var_27_0:addElement(var_27_29)

	var_27_0.EquippedWidget = var_27_29

	local var_27_30
	local var_27_31 = MenuBuilder.BuildRegisteredType("BlueprintTag", {
		controllerIndex = var_27_1
	})

	var_27_31.id = "BlueprintTag"

	var_27_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 234, _1080p * 275, _1080p * 305)
	var_27_0:addElement(var_27_31)

	var_27_0.BlueprintTag = var_27_31

	local var_27_32
	local var_27_33 = MenuBuilder.BuildRegisteredType("GunsmithDetailedEquippedSlots", {
		controllerIndex = var_27_1
	})

	var_27_33.id = "GunsmithDetailedEquippedSlots"

	var_27_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1299, _1080p * 1824, _1080p * 177, _1080p * 209)
	var_27_0:addElement(var_27_33)

	var_27_0.GunsmithDetailedEquippedSlots = var_27_33

	local var_27_34
	local var_27_35 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_27_1
	})

	var_27_35.id = "NewItemNotification"

	var_27_35:SetAlpha(0, 0)
	var_27_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 174, _1080p * 355, _1080p * 385)
	var_27_0:addElement(var_27_35)

	var_27_0.NewItemNotification = var_27_35

	local var_27_36
	local var_27_37 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_27_1
	})

	var_27_37.id = "ArrowUp"

	var_27_37:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -132, _1080p * -100, _1080p * 968, _1080p * 1000)
	var_27_0:addElement(var_27_37)

	var_27_0.ArrowUp = var_27_37

	local var_27_38
	local var_27_39 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_27_1
	})

	var_27_39.id = "ArrowDown"

	var_27_39.Arrow:SetZRotation(180, 0)
	var_27_39:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 36, _1080p * 68, _1080p * 968, _1080p * 1000)
	var_27_0:addElement(var_27_39)

	var_27_0.ArrowDown = var_27_39

	local var_27_40
	local var_27_41 = LUI.UIText.new()

	var_27_41.id = "ListCount"

	var_27_41:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_27_41:setText("", 0)
	var_27_41:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_41:SetAlignment(LUI.Alignment.Center)
	var_27_41:SetVerticalAlignment(LUI.Alignment.Center)
	var_27_41:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -100, _1080p * 36, _1080p * 975, _1080p * 995)
	var_27_0:addElement(var_27_41)

	var_27_0.ListCount = var_27_41

	local var_27_42
	local var_27_43 = MenuBuilder.BuildRegisteredType("SeasonWithText", {
		controllerIndex = var_27_1
	})

	var_27_43.id = "SeasonWithText"

	var_27_43:SetAlpha(0, 0)
	var_27_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 308, _1080p * 468, _1080p * 272, _1080p * 304)
	var_27_0:addElement(var_27_43)

	var_27_0.SeasonWithText = var_27_43

	local var_27_44
	local var_27_45 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_27_1
	})

	var_27_45.id = "QualityWithText"

	var_27_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 256, _1080p * 313, _1080p * 345)
	var_27_0:addElement(var_27_45)

	var_27_0.QualityWithText = var_27_45

	local var_27_46
	local var_27_47 = MenuBuilder.BuildRegisteredType("WeaponWithAttachments", {
		controllerIndex = var_27_1
	})

	var_27_47.id = "WeaponWithAttachments"

	var_27_47:SetAlpha(0, 0)
	var_27_47:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 840, _1080p * 1096, _1080p * 281, _1080p * 409)
	var_27_0:addElement(var_27_47)

	var_27_0.WeaponWithAttachments = var_27_47

	local var_27_48

	if CONDITIONS.InFrontend(var_27_0) then
		var_27_48 = LUI.UIStyledText.new()
		var_27_48.id = "TutorialPrompt"

		var_27_48:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_27_48:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/WEAPON_DETAILS"), 0)
		var_27_48:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_27_48:SetAlignment(LUI.Alignment.Left)
		var_27_48:SetOptOutRightToLeftAlignmentFlip(true)
		var_27_48:SetTintFontIcons(true)
		var_27_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 107, _1080p * 607, _1080p * 511, _1080p * 535)
		var_27_0:addElement(var_27_48)

		var_27_0.TutorialPrompt = var_27_48
	end

	local var_27_49

	if CONDITIONS.InFrontend(var_27_0) then
		var_27_49 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
			controllerIndex = var_27_1
		})
		var_27_49.id = "BundleUpsellButton"

		var_27_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1374, _1080p * 1824, _1080p * 530, _1080p * 734)
		var_27_0:addElement(var_27_49)

		var_27_0.BundleUpsellButton = var_27_49
	end

	local var_27_50
	local var_27_51 = MenuBuilder.BuildRegisteredType("SpecialWeaponAttributeWithText", {
		controllerIndex = var_27_1
	})

	var_27_51.id = "SpecialWeaponAttributeWithText"

	var_27_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 268, _1080p * 668, _1080p * 311, _1080p * 343)
	var_27_0:addElement(var_27_51)

	var_27_0.SpecialWeaponAttributeWithText = var_27_51

	local function var_27_52()
		return
	end

	var_27_0._sequences.DefaultSequence = var_27_52

	local var_27_53
	local var_27_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 355
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 385
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_29:RegisterAnimationSequence("IsEquippedAndBlueprint", var_27_54)

	local var_27_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_45:RegisterAnimationSequence("IsEquippedAndBlueprint", var_27_55)

	local function var_27_56()
		var_27_29:AnimateSequence("IsEquippedAndBlueprint")
		var_27_45:AnimateSequence("IsEquippedAndBlueprint")
	end

	var_27_0._sequences.IsEquippedAndBlueprint = var_27_56

	local var_27_57
	local var_27_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_29:RegisterAnimationSequence("IsNotEquippedAndBlueprint", var_27_58)

	local var_27_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_45:RegisterAnimationSequence("IsNotEquippedAndBlueprint", var_27_59)

	local function var_27_60()
		var_27_29:AnimateSequence("IsNotEquippedAndBlueprint")
		var_27_45:AnimateSequence("IsNotEquippedAndBlueprint")
	end

	var_27_0._sequences.IsNotEquippedAndBlueprint = var_27_60

	local var_27_61
	local var_27_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_29:RegisterAnimationSequence("IsNotEquippedAndNotBlueprint", var_27_62)

	local var_27_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_45:RegisterAnimationSequence("IsNotEquippedAndNotBlueprint", var_27_63)

	local function var_27_64()
		var_27_29:AnimateSequence("IsNotEquippedAndNotBlueprint")
		var_27_45:AnimateSequence("IsNotEquippedAndNotBlueprint")
	end

	var_27_0._sequences.IsNotEquippedAndNotBlueprint = var_27_64

	local var_27_65
	local var_27_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 343
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_29:RegisterAnimationSequence("IsEquippedAndNotBlueprint", var_27_66)

	local var_27_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_45:RegisterAnimationSequence("IsEquippedAndNotBlueprint", var_27_67)

	local function var_27_68()
		var_27_29:AnimateSequence("IsEquippedAndNotBlueprint")
		var_27_45:AnimateSequence("IsEquippedAndNotBlueprint")
	end

	var_27_0._sequences.IsEquippedAndNotBlueprint = var_27_68

	local var_27_69
	local var_27_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1779
		}
	}

	var_27_27:RegisterAnimationSequence("PC", var_27_70)

	local function var_27_71()
		var_27_27:AnimateSequence("PC")
	end

	var_27_0._sequences.PC = var_27_71

	local var_27_72
	local var_27_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1779
		}
	}

	var_27_27:RegisterAnimationSequence("Console", var_27_73)

	local function var_27_74()
		var_27_27:AnimateSequence("Console")
	end

	var_27_0._sequences.Console = var_27_74

	local var_27_75
	local var_27_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 556
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1020
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 814
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_8:RegisterAnimationSequence("InGame", var_27_76)

	local var_27_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 580
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1008
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 216
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 240
		}
	}

	var_27_19:RegisterAnimationSequence("InGame", var_27_77)

	local var_27_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 580
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1008
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 240
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 270
		}
	}

	var_27_21:RegisterAnimationSequence("InGame", var_27_78)

	local var_27_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 556
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 611
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1020
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 793
		}
	}

	var_27_23:RegisterAnimationSequence("InGame", var_27_79)

	local var_27_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 207
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 107
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 829
		}
	}

	var_27_27:RegisterAnimationSequence("InGame", var_27_80)

	local var_27_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 580
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 716
		}
	}

	var_27_29:RegisterAnimationSequence("InGame", var_27_81)

	local var_27_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 580
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 718
		}
	}

	var_27_31:RegisterAnimationSequence("InGame", var_27_82)

	local var_27_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 146
		}
	}

	var_27_33:RegisterAnimationSequence("InGame", var_27_83)

	local var_27_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 584
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 648
		}
	}

	var_27_35:RegisterAnimationSequence("InGame", var_27_84)

	local var_27_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -787
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -755
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 838
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 870
		}
	}

	var_27_37:RegisterAnimationSequence("InGame", var_27_85)

	local var_27_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -619
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -587
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 838
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 870
		}
	}

	var_27_39:RegisterAnimationSequence("InGame", var_27_86)

	local var_27_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -755
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -619
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 845
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 865
		}
	}

	var_27_41:RegisterAnimationSequence("InGame", var_27_87)

	local var_27_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 792
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 952
		}
	}

	var_27_43:RegisterAnimationSequence("InGame", var_27_88)

	local var_27_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 580
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 740
		}
	}

	var_27_45:RegisterAnimationSequence("InGame", var_27_89)

	local var_27_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 664
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 412
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 920
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 540
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_47:RegisterAnimationSequence("InGame", var_27_90)

	local var_27_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_27_51:RegisterAnimationSequence("InGame", var_27_91)

	local function var_27_92()
		var_27_8:AnimateSequence("InGame")
		var_27_19:AnimateSequence("InGame")
		var_27_21:AnimateSequence("InGame")
		var_27_23:AnimateSequence("InGame")
		var_27_27:AnimateSequence("InGame")
		var_27_29:AnimateSequence("InGame")
		var_27_31:AnimateSequence("InGame")
		var_27_33:AnimateSequence("InGame")
		var_27_35:AnimateSequence("InGame")
		var_27_37:AnimateSequence("InGame")
		var_27_39:AnimateSequence("InGame")
		var_27_41:AnimateSequence("InGame")
		var_27_43:AnimateSequence("InGame")
		var_27_45:AnimateSequence("InGame")
		var_27_47:AnimateSequence("InGame")
		var_27_51:AnimateSequence("InGame")
	end

	var_27_0._sequences.InGame = var_27_92

	local var_27_93
	local var_27_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1658
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 528
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 488
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		}
	}

	var_27_8:RegisterAnimationSequence("Splitscreen", var_27_94)

	local var_27_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 978
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 238
		}
	}

	var_27_19:RegisterAnimationSequence("Splitscreen", var_27_95)

	local var_27_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 978
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 268
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 238
		}
	}

	var_27_21:RegisterAnimationSequence("Splitscreen", var_27_96)

	local var_27_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 311
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1611
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 493
		}
	}

	var_27_23:RegisterAnimationSequence("Splitscreen", var_27_97)

	local var_27_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 604
		}
	}

	var_27_27:RegisterAnimationSequence("Splitscreen", var_27_98)

	local var_27_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 648
		}
	}

	var_27_29:RegisterAnimationSequence("Splitscreen", var_27_99)

	local var_27_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 650
		}
	}

	var_27_31:RegisterAnimationSequence("Splitscreen", var_27_100)

	local var_27_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 238
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 270
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1086
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1611
		}
	}

	var_27_33:RegisterAnimationSequence("Splitscreen", var_27_101)

	local var_27_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 516
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 580
		}
	}

	var_27_35:RegisterAnimationSequence("Splitscreen", var_27_102)

	local var_27_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 528
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 560
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -770
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -738
		}
	}

	var_27_37:RegisterAnimationSequence("Splitscreen", var_27_103)

	local var_27_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 528
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 560
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -602
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -570
		}
	}

	var_27_39:RegisterAnimationSequence("Splitscreen", var_27_104)

	local var_27_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 535
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 555
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -738
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -602
		}
	}

	var_27_41:RegisterAnimationSequence("Splitscreen", var_27_105)

	local var_27_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 724
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 884
		}
	}

	var_27_43:RegisterAnimationSequence("Splitscreen", var_27_106)

	local var_27_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 672
		}
	}

	var_27_45:RegisterAnimationSequence("Splitscreen", var_27_107)

	local var_27_108 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 764
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 331
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1020
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 459
		}
	}

	var_27_47:RegisterAnimationSequence("Splitscreen", var_27_108)

	local function var_27_109()
		var_27_8:AnimateSequence("Splitscreen")
		var_27_19:AnimateSequence("Splitscreen")
		var_27_21:AnimateSequence("Splitscreen")
		var_27_23:AnimateSequence("Splitscreen")
		var_27_27:AnimateSequence("Splitscreen")
		var_27_29:AnimateSequence("Splitscreen")
		var_27_31:AnimateSequence("Splitscreen")
		var_27_33:AnimateSequence("Splitscreen")
		var_27_35:AnimateSequence("Splitscreen")
		var_27_37:AnimateSequence("Splitscreen")
		var_27_39:AnimateSequence("Splitscreen")
		var_27_41:AnimateSequence("Splitscreen")
		var_27_43:AnimateSequence("Splitscreen")
		var_27_45:AnimateSequence("Splitscreen")
		var_27_47:AnimateSequence("Splitscreen")
	end

	var_27_0._sequences.Splitscreen = var_27_109

	local var_27_110
	local var_27_111 = {}

	var_27_19:RegisterAnimationSequence("AR", var_27_111)

	local function var_27_112()
		var_27_19:AnimateSequence("AR")
	end

	var_27_0._sequences.AR = var_27_112

	local var_27_113
	local var_27_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1699
		}
	}

	var_27_23:RegisterAnimationSequence("BlueprintStore", var_27_114)

	if CONDITIONS.InFrontend(var_27_0) then
		local var_27_115 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1277
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1777
			}
		}

		var_27_48:RegisterAnimationSequence("BlueprintStore", var_27_115)
	end

	if CONDITIONS.InFrontend(var_27_0) then
		local var_27_116 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 95
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 545
			}
		}

		var_27_49:RegisterAnimationSequence("BlueprintStore", var_27_116)
	end

	local function var_27_117()
		var_27_23:AnimateSequence("BlueprintStore")

		if CONDITIONS.InFrontend(var_27_0) then
			var_27_48:AnimateSequence("BlueprintStore")
		end

		if CONDITIONS.InFrontend(var_27_0) then
			var_27_49:AnimateSequence("BlueprintStore")
		end
	end

	var_27_0._sequences.BlueprintStore = var_27_117

	local var_27_118

	if CONDITIONS.InFrontend(var_27_0) then
		local var_27_119 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 494
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 518
			}
		}

		var_27_48:RegisterAnimationSequence("CHT", var_27_119)
	end

	local function var_27_120()
		if CONDITIONS.InFrontend(var_27_0) then
			var_27_48:AnimateSequence("CHT")
		end
	end

	var_27_0._sequences.CHT = var_27_120

	var_27_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_27_121 = LUI.UIBindButton.new()

	var_27_121.id = "selfBindButton"

	var_27_0:addElement(var_27_121)

	var_27_0.bindButton = var_27_121

	var_27_0.bindButton:addEventHandler("button_secondary", function(arg_41_0, arg_41_1)
		if not arg_41_1.controller then
			local var_41_0 = var_27_1
		end

		ACTIONS.LeaveMenu(var_27_0)
	end)
	var_0_13(var_27_0, var_27_1, arg_27_1)

	return var_27_0
end

MenuBuilder.registerType("WeaponLocker", WeaponLocker)
LockTable(_M)
