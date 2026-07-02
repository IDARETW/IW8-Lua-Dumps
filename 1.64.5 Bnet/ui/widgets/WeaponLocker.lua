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
	local var_2_2 = #WEAPON.GetNewWeaponIDsByClass(arg_2_0._controllerIndex, var_2_1, {
		getBaseWeapon = false
	}) > 0

	if var_2_1 == WEAPON.MELEEClass or var_2_1 == WEAPON.MELEEClass2 then
		local var_2_3 = var_2_1 == WEAPON.MELEEClass and WEAPON.MELEEClass2 or WEAPON.MELEEClass
		local var_2_4 = WEAPON.GetNewWeaponIDsByClass(arg_2_0._controllerIndex, var_2_3, {
			getBaseWeapon = false
		})

		var_2_2 = var_2_2 or #var_2_4 > 0
	end

	if var_2_0.NewItemSmallIcon then
		var_2_0:SetBreadcrumb(var_2_2)
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	local var_3_0 = false

	if arg_3_0._selectedWeapon then
		if arg_3_1.isCustom or #arg_3_0._selectedWeapon.blueprintName > 0 then
			var_3_0 = GUNSMITH.AreCustomModsEqual(arg_3_0._selectedWeapon, arg_3_1)
		else
			var_3_0 = arg_3_0._selectedWeapon.weapon == arg_3_1.weapon and arg_3_0._selectedWeapon.lootID == arg_3_1.lootID
		end
	end

	return var_3_0
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_2 and WEAPON.GetDismembermentType(arg_4_2) or false
	local var_4_1 = arg_4_1 and WEAPON.GetTracerType(arg_4_1) or false

	if var_4_0 and Loot.DEBEIFJEEG(arg_4_0._controllerIndex, arg_4_1) > 0 or var_4_0 and arg_4_1 == 0 or var_4_1 then
		return true
	else
		return false
	end
end

local function var_0_5(arg_5_0, arg_5_1)
	local var_5_0 = LUI.FlowManager.GetScopedData(arg_5_0)
	local var_5_1 = ATTACHMENT.SetupSlotDisplay(arg_5_0.GunsmithDetailedEquippedSlots, {
		weaponTable = arg_5_1
	})
	local var_5_2, var_5_3, var_5_4, var_5_5 = arg_5_0.GunsmithDetailedEquippedSlots:getLocalRect()

	arg_5_0.GunsmithDetailedEquippedSlots:SetLeft(-(math.abs(var_5_4 / _1080p) + var_5_1))
	arg_5_0.CategoryName:setText(WEAPON.GetSubClass(arg_5_1.weapon))

	if arg_5_1.isCustom then
		arg_5_0.WeaponName:setText(ToUpperCase(GUNSMITH.GetCustomModName(arg_5_1.blueprintName)))
		arg_5_0.SeasonWithText:SetAlpha(0)
		arg_5_0.SpecialWeaponAttributeWithText:SetAlpha(0)
		arg_5_0.SpecialWeaponAttributeWithText:SetupWeaponAttribute(arg_5_1.lootID, arg_5_1)
	else
		arg_5_0.WeaponName:setText(ToUpperCase(arg_5_1.lootName))

		local var_5_6 = LOOT.GetItemQualityWithID(LOOT.itemTypes.WEAPON, arg_5_1.lootID)
		local var_5_7 = LOOT.GetItemSeasonByID(LOOT.itemTypes.WEAPON, arg_5_1.lootID)

		arg_5_0.QualityWithText:UpdateQualityText(var_5_6)

		if var_5_7 and var_5_7 > 0 and Dvar.IBEGCHEFE("NPOLQSQMNO") then
			arg_5_0.SeasonWithText:SetAlpha(1)
			arg_5_0.SeasonWithText:UpdateSeasonText(var_5_7)
		else
			arg_5_0.SeasonWithText:SetAlpha(0)
		end

		arg_5_0.SpecialWeaponAttributeWithText:SetAlpha(0)

		if not arg_5_1.isBase then
			arg_5_0.SpecialWeaponAttributeWithText:SetupWeaponAttribute(arg_5_1.lootID, arg_5_1)
		end
	end

	arg_5_0.WeaponWithAttachments:UpdateWithWeaponTable(arg_5_0._controllerIndex, false, arg_5_1)
	arg_5_0.WeaponAttributes:Setup(arg_5_1)

	if Engine.DDJFBBJAIG() then
		local var_5_8 = WEAPON.GetWeaponModelName(arg_5_1.weapon, arg_5_1, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_5_0._controllerIndex
		})

		var_0_1(arg_5_0, arg_5_0._controllerIndex, var_5_8)
		WEAPON.SetModelIfLoaded(arg_5_0._controllerIndex, arg_5_0._weaponModel, var_5_8, {
			forceOffsetsAndRotations = arg_5_0._selectingForWeapon,
			modelWeaponTable = arg_5_1
		})
	end

	local var_5_9 = arg_5_0.QualityWithText:GetCurrentAnchorsAndPositions().left
	local var_5_10 = var_5_9 + arg_5_0.QualityWithText:CalculateWidth()
	local var_5_11 = 8 * _1080p

	arg_5_0.SpecialWeaponAttributeWithText:SetLeft(arg_5_1.isCustom and var_5_9 or var_5_10 + var_5_11)
	arg_5_0.SpecialWeaponAttributeWithText:SetRight(arg_5_1.isCustom and var_5_9 + 400 * _1080p or var_5_10 + var_5_11 + 400 * _1080p)

	local var_5_12 = 170

	arg_5_0.ReactiveIcon:SetLeft(arg_5_1.isCustom and var_5_9 or var_5_10 + var_5_11)
	arg_5_0.ReactiveIcon:SetRight(arg_5_1.isCustom and var_5_9 + var_5_12 * _1080p or var_5_10 + var_5_11 + var_5_12 * _1080p)

	arg_5_0._currentMod = arg_5_1
	var_5_0.lastFocusedClass = WEAPON.GetWeaponClass(arg_5_0._currentMod.weapon, true)

	local var_5_13 = not arg_5_1.isCustom
	local var_5_14 = var_0_3(arg_5_0, arg_5_1)
	local var_5_15 = var_0_4(arg_5_0, arg_5_1.lootID, arg_5_1)
	local var_5_16 = var_5_14 and "Equipped" or "UnEquipped"

	if var_5_13 then
		var_5_16 = var_5_14 and "EquippedBlueprint" or "UnEquippedBlueprint"
	elseif var_5_15 then
		var_5_16 = var_5_14 and "EquippedSpecial" or "UnEquippedSpecial"
	end

	ACTIONS.AnimateSequence(arg_5_0, var_5_16)

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

	local var_5_17 = arg_5_0.BlueprintTag:SetBlueprint(not arg_5_1.isCustom, arg_5_1.fromBundle)
	local var_5_18 = arg_5_0.BlueprintTag:GetCurrentAnchorsAndPositions().left
	local var_5_19 = 20 * _1080p

	arg_5_0.SeasonWithText:SetLeft(var_5_18 + var_5_17 + var_5_19)

	if arg_5_0.BundleUpsellButton then
		if arg_5_1.fromBundle and arg_5_1.bundleID and Dvar.IBEGCHEFE("LTSNLQNRKO") then
			arg_5_0.BundleUpsellButton:SetupUpsellButtonWithBundleID(arg_5_0._controllerIndex, arg_5_1.bundleID)
		else
			arg_5_0.BundleUpsellButton:HideButton()
		end
	end

	WEAPON.DisplaySnipeIconByWeaponRef(arg_5_0, arg_5_1.weapon, {
		setSnipeAnimOnElement = true
	})

	if CONDITIONS.IsWZWipFlowEnabled() then
		arg_5_0.WZWipSnipeBackgroundSceneOverlay:UpdateSnipeOverlay({
			useGunsmithSetup = false,
			weaponRef = arg_5_1.weapon
		})
	end

	local var_5_20 = false

	if arg_5_1 and not arg_5_1.isBase and arg_5_1.lootID and Engine.DDJFBBJAIG() then
		local var_5_21 = arg_5_1.lootID

		if var_5_21 == 0 then
			var_5_21 = LOOT.GetBaseWeaponItemID(arg_5_1.weapon)
		end

		var_5_20 = LOOT.HasReactiveCamo(var_5_21)
	end

	ACTIONS.AnimateSequence(arg_5_0, var_5_20 and "ShowReactiveIcon" or "HideReactiveIcon")
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

local function var_0_11(arg_13_0, arg_13_1, arg_13_2)
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

	local var_13_3 = false

	if CONDITIONS.AreRestrictionsActiveAndBlueprintsAllowed(arg_13_0, arg_13_1) and MatchRules.CADFFHGJAE(arg_13_2) then
		var_13_3 = true
	end

	var_13_2:SetRefreshChild(function(arg_18_0, arg_18_1, arg_18_2)
		local var_18_0 = arg_13_0.WeaponGrid:GetContentIndex(arg_18_1, arg_18_2)
		local var_18_1 = arg_13_0._currentModifications[var_18_0 + 1]
		local var_18_2 = false

		if #var_18_1.attachments > 0 and CONDITIONS.AreRestrictionsActiveAndBlueprintsAllowed(arg_13_0, arg_13_1) and not var_13_3 then
			for iter_18_0, iter_18_1 in pairs(var_18_1.attachments) do
				var_18_2 = MLG.IsAttachmentRestricted(iter_18_1.ref, arg_13_2)
			end
		end

		local var_18_3 = #arg_13_0._currentModifications == 1 and arg_13_0._numEnabledTabs == 1

		arg_18_0:Setup(var_18_1, var_0_3(arg_13_0, var_18_1), var_18_3, var_13_3 or var_18_2)
	end)

	local var_13_4 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_13_0.Scrollbar,
		startCap = arg_13_0.Scrollbar.startCap,
		endCap = arg_13_0.Scrollbar.endCap,
		sliderArea = arg_13_0.Scrollbar.sliderArea,
		slider = arg_13_0.Scrollbar.sliderArea and arg_13_0.Scrollbar.sliderArea.slider,
		fixedSizeSlider = arg_13_0.Scrollbar.sliderArea and arg_13_0.Scrollbar.sliderArea.fixedSizeSlider
	})

	var_13_2:AddScrollbar(var_13_4)
end

local function var_0_12(arg_19_0, arg_19_1)
	if not Engine.DDJFBBJAIG() then
		return
	end

	if arg_19_1 then
		-- block empty
	elseif not Onboarding.Armory.WasCompleted(arg_19_0, arg_19_0._controllerIndex) then
		if CONDITIONS.IsWZWipFlowEnabled() then
			LUI.FlowManager.RequestPopupMenu(arg_19_0, "onboardingpopup", true, arg_19_0._controllerIndex, false, ONBOARDING_DATA.GetOnboardingWZArmoryData())
		else
			LUI.FlowManager.RequestPopupMenu(arg_19_0, "onboardingpopup", true, arg_19_0._controllerIndex, false, ONBOARDING_DATA.GetOnboardingArmoryData())
		end

		Onboarding.Armory.MarkCompleted(arg_19_0, arg_19_0._controllerIndex)
	end
end

local function var_0_13(arg_20_0, arg_20_1)
	ACTIONS.UploadStats(arg_20_0, arg_20_1.controller)
end

local function var_0_14(arg_21_0, arg_21_1, arg_21_2)
	assert(arg_21_0.Tabs)
	assert(arg_21_0.CategoryName)
	assert(arg_21_0.WeaponName)
	assert(arg_21_0.WeaponAttributes)
	assert(arg_21_0.GunsmithDetailedEquippedSlots)
	assert(arg_21_0.GunsmithDetailedEquippedSlots.EquippedText)
	assert(arg_21_0.Scrollbar)
	assert(arg_21_0.NewItemNotification)

	arg_21_0.Setup = var_0_10
	arg_21_0._controllerIndex = arg_21_1
	arg_21_0.UpdateTabBreadcrumb = var_0_2
	arg_21_0.HasSpecialWeaponAttribute = var_0_4

	if IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_21_0, "CHT")
	end

	if arg_21_2.deletingForWeapon then
		assert(arg_21_2.weaponRef)
		arg_21_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CAS/DELETE_SPECIFIC_WEAPON_MOD", WEAPON.GetName(arg_21_2.weaponRef)))
		arg_21_0.SpecialWeaponAttributeWithText:SetAlpha(0)
	elseif arg_21_2.blueprintStore then
		arg_21_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CAS/BLUEPRINT_STORE"))
		var_0_12(arg_21_0, true)
	else
		arg_21_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CAS/WEAPON_LOCKER"))
		var_0_12(arg_21_0, false)
	end

	arg_21_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	local var_21_0 = LUI.FlowManager.GetScopedData(arg_21_0)

	var_21_0.filteredWeapons = var_21_0.filteredWeapons or {}
	arg_21_0._selectingForWeapon = arg_21_2.selectingForWeapon

	if arg_21_2.selectingForWeapon or arg_21_2.deletingForWeapon or arg_21_2.blueprintStore then
		assert(arg_21_2.weaponRef)

		var_21_0.filteredWeapons[arg_21_2.weaponRef] = true
	end

	if arg_21_2.blueprintStore then
		ACTIONS.AnimateSequence(arg_21_0, "BlueprintStore")
	end

	if arg_21_2.selectingForWeapon then
		assert(arg_21_2.loadoutIndex)
		assert(arg_21_2.weaponSlot)

		local var_21_1 = PlayerData.BFFBGAJGD(arg_21_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_21_2.loadoutIndex].weaponSetups[arg_21_2.weaponSlot]

		arg_21_0._selectedWeapon = WEAPON.GenerateWeaponTable(var_21_1)
	else
		ACTIONS.AnimateSequence(arg_21_0, "IsNotEquippedAndNotBlueprint")

		arg_21_0._lastEquipSequencePlayed = "IsNotEquippedAndNotBlueprint"
	end

	arg_21_0._weaponSlot = arg_21_2.weaponSlot or WEAPON.PrimarySlot
	arg_21_0._loadoutIndex = arg_21_2.loadoutIndex or LOADOUT.GetFavoriteLoadoutIndex(arg_21_1)
	arg_21_0._hideTabs = arg_21_2.hideTabs

	var_0_11(arg_21_0, arg_21_1, arg_21_2.weaponRef)

	if arg_21_0.InGameMenuBackground then
		arg_21_0:RemoveElement(arg_21_0.InGameMenuBackground)
		arg_21_0.InGameMenuBackground:setPriority(-11)
		arg_21_0:addElement(arg_21_0.InGameMenuBackground)
	end

	arg_21_0:RemoveElement(arg_21_0.Vignette)
	arg_21_0.Vignette:setPriority(-12)
	arg_21_0:addElement(arg_21_0.Vignette)
	arg_21_0:Setup(arg_21_1)
	arg_21_0:addEventHandler("restore_focus", function(arg_22_0, arg_22_1)
		local var_22_0 = LUI.FlowManager.GetScopedData(arg_22_0)

		if arg_22_1.data then
			arg_22_1.data.currentTab = nil
		end

		if var_22_0.updateModifications then
			arg_21_0:Setup(arg_21_1)

			var_22_0.updateModifications = false
		end
	end)
	arg_21_0:registerEventHandler("update_for_weapon", function(arg_23_0, arg_23_1)
		var_0_5(arg_23_0, arg_23_1.weapon)
	end)
	arg_21_0:registerEventHandler("clear_newMod", function(arg_24_0, arg_24_1)
		arg_24_0:UpdateTabBreadcrumb(arg_24_0._currentTabIndex)
	end)

	if Engine.DDJFBBJAIG() then
		local var_21_2 = WATCH.GetEquippedWatch(arg_21_1)

		WATCH.CreateWidgetForWatch(arg_21_0, arg_21_1, var_21_2)

		local var_21_3 = {}

		if var_21_2 ~= WATCH.WatchNoneValue then
			table.insert(var_21_3, FrontEndScene.ClientWeapons.Watch)
		end

		if arg_21_2.weaponSlot == WEAPON.SecondarySlot and arg_21_2.weaponRef then
			Engine.DHFCHIIJCA(WEAPON.GetGunTableSecondPositionScene(arg_21_2.weaponRef))
			table.insert(var_21_3, FrontEndScene.ClientWeapons.GunTablePrimary)
		else
			Engine.DHFCHIIJCA("loadout_showcase_armory")
			table.insert(var_21_3, FrontEndScene.ClientWeapons.GunTableSecondary)
		end

		FrontEndScene.SetExclusiveWeaponModels(var_21_3)

		arg_21_0._weaponModel = WEAPON.GetWeaponModel(arg_21_1, arg_21_2.weaponSlot or WEAPON.PrimarySlot)

		arg_21_0:addElement(arg_21_0._weaponModel)
		arg_21_0.bindButton:addEventHandler("button_alt1", function(arg_25_0, arg_25_1)
			arg_21_2.weaponTable = arg_21_0._currentMod
			arg_21_2.fromArmory = true
			arg_21_2.weaponRef = arg_21_2.weaponTable.weapon

			LUI.FlowManager.RequestAddMenu("ModificationPreview", true, arg_21_1, nil, arg_21_2, true)
		end)
	end

	if Engine.DDJFBBJAIG() then
		local function var_21_4(arg_26_0, arg_26_1)
			if LUI.IsLastInputKeyboardMouse(arg_26_1.controllerIndex) then
				ACTIONS.AnimateSequence(arg_26_0, "PC")
			else
				ACTIONS.AnimateSequence(arg_26_0, "Console")
			end
		end

		arg_21_0:addAndCallEventHandler("update_input_type", var_21_4, {
			controllerIndex = arg_21_1
		})
	elseif CONDITIONS.IsSplitscreen(arg_21_0) and CONDITIONS.InGame(arg_21_0) then
		ACTIONS.AnimateSequence(arg_21_0, "Splitscreen")
	else
		ACTIONS.AnimateSequence(arg_21_0, "InGame")
	end

	arg_21_0:registerEventHandler("menu_close", var_0_13)
	arg_21_0:registerEventHandler("menu_close_all", var_0_13)

	if not IsLanguageArabic() then
		arg_21_0.NewItemNotification:SetupLeftAlignment()
	end

	if arg_21_0._currentModifications[1] then
		var_0_5(arg_21_0, arg_21_0._currentModifications[1])
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_21_0.TabBacker)

	if arg_21_0.InGameMenuBackground then
		ACTIONS.ScaleFullscreen(arg_21_0.InGameMenuBackground)
	end

	ACTIONS.ScaleFullscreen(arg_21_0.Vignette)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_21_0, "AR")
	end

	if arg_21_0.BundleUpsellButton then
		arg_21_0.BundleUpsellButton:SetButtonPrimary(true)
		arg_21_0:registerEventHandler("open_bundle", function(arg_27_0, arg_27_1)
			local var_27_0 = LUI.FlowManager.GetScopedData(arg_21_0)
			local var_27_1 = false

			if var_27_0.blueprintStore and var_27_0.oneMod then
				var_27_1 = true
			end

			arg_21_0.BundleUpsellButton:OpenBundle(arg_21_1, {
				oneModBlueprintStore = var_27_1
			})
		end)
	end

	if arg_21_0.BundleUpsellButton then
		local var_21_5 = "WeaponLocker"

		if arg_21_0._selectingForWeapon then
			var_21_5 = "WeaponVariantSelect"
		elseif arg_21_2.blueprintStore then
			var_21_5 = LUI.FlowManager.IsInStack("WeaponSelect") and "BlueprintStore from WeaponSelect" or "BlueprintStore from LoadoutSelect"
		end

		arg_21_0.BundleUpsellButton:SetUpsellMenu(var_21_5)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_21_0, "WZWipSetup")
		LAYOUT.SetupScalingBackgroundVignette(arg_21_0)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_21_0, arg_21_1)
end

function WeaponLocker(arg_28_0, arg_28_1)
	local var_28_0 = LUI.UIElement.new()

	var_28_0.id = "WeaponLocker"
	var_28_0._animationSets = var_28_0._animationSets or {}
	var_28_0._sequences = var_28_0._sequences or {}

	local var_28_1 = arg_28_1 and arg_28_1.controllerIndex

	if not var_28_1 and not Engine.DDJFBBJAIG() then
		var_28_1 = var_28_0:getRootController()
	end

	assert(var_28_1)

	var_28_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_28_1
	})
	var_28_0.HelperBar.id = "HelperBar"

	var_28_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_28_0.HelperBar:setPriority(10)
	var_28_0:addElement(var_28_0.HelperBar)

	local var_28_2 = var_28_0
	local var_28_3
	local var_28_4 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_28_1
	})

	var_28_4.id = "Vignette"

	var_28_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_28_0:addElement(var_28_4)

	var_28_0.Vignette = var_28_4

	local var_28_5

	if CONDITIONS.InGame() then
		local var_28_6 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_28_1
		})

		var_28_6.id = "InGameMenuBackground"

		var_28_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_28_0:addElement(var_28_6)

		var_28_0.InGameMenuBackground = var_28_6
	end

	local var_28_7

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_28_8 = MenuBuilder.BuildRegisteredType("WZSnipeBackgroundSceneOverlay", {
			controllerIndex = var_28_1
		})

		var_28_8.id = "WZWipSnipeBackgroundSceneOverlay"

		var_28_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -11, _1080p * -11, 0, 0)
		var_28_0:addElement(var_28_8)

		var_28_0.WZWipSnipeBackgroundSceneOverlay = var_28_8
	end

	local var_28_9
	local var_28_10 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_28_1
	})

	var_28_10.id = "ItemDescBacker"

	var_28_10:SetAlpha(0, 0)
	var_28_10.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_28_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 70, _1080p * 903, _1080p * 170, _1080p * 450)
	var_28_0:addElement(var_28_10)

	var_28_0.ItemDescBacker = var_28_10

	local var_28_11
	local var_28_12 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_28_1
	})

	var_28_12.id = "TabBacker"

	var_28_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_28_0:addElement(var_28_12)

	var_28_0.TabBacker = var_28_12

	local var_28_13
	local var_28_14 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_28_1
			})
		end,
		controllerIndex = var_28_1
	}
	local var_28_15 = LUI.TabManager.new(var_28_14)

	var_28_15.id = "Tabs"

	var_28_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 1824, _1080p * 108, _1080p * 160)
	var_28_0:addElement(var_28_15)

	var_28_0.Tabs = var_28_15

	local var_28_16
	local var_28_17 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_28_1
	})

	var_28_17.id = "MenuTitle"

	var_28_17.MenuTitle:setText(Engine.CBBHFCGDIC("CAS/WEAPON_LOCKER"), 0)
	var_28_17.Line:SetLeft(0, 0)
	var_28_17:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_28_0:addElement(var_28_17)

	var_28_0.MenuTitle = var_28_17

	local var_28_18

	if CONDITIONS.InFrontendPublicMP() then
		local var_28_19 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_28_1
		})

		var_28_19.id = "MPPlayerDetails"

		var_28_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_28_0:addElement(var_28_19)

		var_28_0.MPPlayerDetails = var_28_19
	end

	local var_28_20
	local var_28_21 = LUI.UIText.new()

	var_28_21.id = "CategoryName"

	var_28_21:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_28_21:setText("", 0)
	var_28_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_28_21:SetAlignment(LUI.Alignment.Left)
	var_28_21:SetOptOutRightToLeftAlignmentFlip(true)
	var_28_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 860, _1080p * 182, _1080p * 206)
	var_28_0:addElement(var_28_21)

	var_28_0.CategoryName = var_28_21

	local var_28_22
	local var_28_23 = LUI.UIText.new()

	var_28_23.id = "WeaponName"

	var_28_23:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_28_23:setText("", 0)
	var_28_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_28_23:SetWordWrap(false)
	var_28_23:SetAlignment(LUI.Alignment.Left)
	var_28_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 860, _1080p * 200, _1080p * 270)
	var_28_0:addElement(var_28_23)

	var_28_0.WeaponName = var_28_23

	local var_28_24
	local var_28_25 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_28_1
	})

	var_28_25.id = "WeaponAttributes"

	var_28_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 529, _1080p * 540, _1080p * 722)
	var_28_0:addElement(var_28_25)

	var_28_0.WeaponAttributes = var_28_25

	local var_28_26

	if CONDITIONS.InFrontend() then
		local var_28_27 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_28_1
		})

		var_28_27.id = "LobbyMembersFooter"

		var_28_27:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_28_0:addElement(var_28_27)

		var_28_0.LobbyMembersFooter = var_28_27
	end

	local var_28_28
	local var_28_29 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_28_1
	})

	var_28_29.id = "Scrollbar"

	var_28_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1768, _1080p * 1779, _1080p * 745, _1080p * 955)
	var_28_0:addElement(var_28_29)

	var_28_0.Scrollbar = var_28_29

	local var_28_30
	local var_28_31 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_28_1
	})

	var_28_31.id = "EquippedWidget"

	var_28_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 232, _1080p * 355, _1080p * 385)
	var_28_0:addElement(var_28_31)

	var_28_0.EquippedWidget = var_28_31

	local var_28_32
	local var_28_33 = MenuBuilder.BuildRegisteredType("BlueprintTag", {
		controllerIndex = var_28_1
	})

	var_28_33.id = "BlueprintTag"

	var_28_33.BlueprintIcon:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_28_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 234, _1080p * 275, _1080p * 305)
	var_28_0:addElement(var_28_33)

	var_28_0.BlueprintTag = var_28_33

	local var_28_34
	local var_28_35 = MenuBuilder.BuildRegisteredType("GunsmithDetailedEquippedSlots", {
		controllerIndex = var_28_1
	})

	var_28_35.id = "GunsmithDetailedEquippedSlots"

	var_28_35:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -621, _1080p * -96, _1080p * 177, _1080p * 209)
	var_28_0:addElement(var_28_35)

	var_28_0.GunsmithDetailedEquippedSlots = var_28_35

	local var_28_36
	local var_28_37 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_28_1
	})

	var_28_37.id = "NewItemNotification"

	var_28_37:SetAlpha(0, 0)
	var_28_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 174, _1080p * 355, _1080p * 385)
	var_28_0:addElement(var_28_37)

	var_28_0.NewItemNotification = var_28_37

	local var_28_38
	local var_28_39 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_28_1
	})

	var_28_39.id = "ArrowUp"

	var_28_39:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -132, _1080p * -100, _1080p * 968, _1080p * 1000)
	var_28_0:addElement(var_28_39)

	var_28_0.ArrowUp = var_28_39

	local var_28_40
	local var_28_41 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_28_1
	})

	var_28_41.id = "ArrowDown"

	var_28_41.Arrow:SetZRotation(180, 0)
	var_28_41:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 36, _1080p * 68, _1080p * 968, _1080p * 1000)
	var_28_0:addElement(var_28_41)

	var_28_0.ArrowDown = var_28_41

	local var_28_42
	local var_28_43 = LUI.UIText.new()

	var_28_43.id = "ListCount"

	var_28_43:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_28_43:setText("", 0)
	var_28_43:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_28_43:SetAlignment(LUI.Alignment.Center)
	var_28_43:SetVerticalAlignment(LUI.Alignment.Center)
	var_28_43:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -100, _1080p * 36, _1080p * 975, _1080p * 995)
	var_28_0:addElement(var_28_43)

	var_28_0.ListCount = var_28_43

	local var_28_44
	local var_28_45 = MenuBuilder.BuildRegisteredType("SeasonWithText", {
		controllerIndex = var_28_1
	})

	var_28_45.id = "SeasonWithText"

	var_28_45:SetAlpha(0, 0)
	var_28_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 308, _1080p * 468, _1080p * 272, _1080p * 304)
	var_28_0:addElement(var_28_45)

	var_28_0.SeasonWithText = var_28_45

	local var_28_46
	local var_28_47 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_28_1
	})

	var_28_47.id = "QualityWithText"

	var_28_47:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 256, _1080p * 313, _1080p * 345)
	var_28_0:addElement(var_28_47)

	var_28_0.QualityWithText = var_28_47

	local var_28_48
	local var_28_49 = MenuBuilder.BuildRegisteredType("WeaponWithAttachments", {
		controllerIndex = var_28_1
	})

	var_28_49.id = "WeaponWithAttachments"

	var_28_49:SetAlpha(0, 0)
	var_28_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 840, _1080p * 1096, _1080p * 281, _1080p * 409)
	var_28_0:addElement(var_28_49)

	var_28_0.WeaponWithAttachments = var_28_49

	local var_28_50

	if CONDITIONS.InFrontend() then
		var_28_50 = LUI.UIStyledText.new()
		var_28_50.id = "TutorialPrompt"

		var_28_50:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_28_50:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/WEAPON_DETAILS"), 0)
		var_28_50:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_28_50:SetAlignment(LUI.Alignment.Left)
		var_28_50:SetOptOutRightToLeftAlignmentFlip(true)
		var_28_50:SetTintFontIcons(true)
		var_28_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 107, _1080p * 607, _1080p * 511, _1080p * 535)
		var_28_0:addElement(var_28_50)

		var_28_0.TutorialPrompt = var_28_50
	end

	local var_28_51

	if CONDITIONS.InFrontend() then
		var_28_51 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
			controllerIndex = var_28_1
		})
		var_28_51.id = "BundleUpsellButton"

		var_28_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1374, _1080p * 1824, _1080p * 530, _1080p * 734)
		var_28_0:addElement(var_28_51)

		var_28_0.BundleUpsellButton = var_28_51
	end

	local var_28_52
	local var_28_53 = MenuBuilder.BuildRegisteredType("SpecialWeaponAttributeWithText", {
		controllerIndex = var_28_1
	})

	var_28_53.id = "SpecialWeaponAttributeWithText"

	var_28_53:SetAlpha(0, 0)
	var_28_53.Title:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_28_53:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 268, _1080p * 668, _1080p * 313, _1080p * 345)
	var_28_0:addElement(var_28_53)

	var_28_0.SpecialWeaponAttributeWithText = var_28_53

	local var_28_54

	if Engine.DDJFBBJAIG() and CONDITIONS.AreRestrictionsActiveAndBlueprintsAllowed(var_28_0, var_28_1) then
		local var_28_55 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_28_1
		})

		var_28_55.id = "CDLRestrictionTag"

		var_28_55.CDLInfo:SetAlpha(1, 0)
		var_28_55:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 235, _1080p * 265)
		var_28_0:addElement(var_28_55)

		var_28_0.CDLRestrictionTag = var_28_55
	end

	local var_28_56
	local var_28_57 = LUI.UIImage.new()

	var_28_57.id = "ReactiveIcon"

	var_28_57:setImage(RegisterMaterial("ui_icon_blueprint_reactive_camo_flipbook"), 0)
	var_28_57:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 242, _1080p * 412, _1080p * 357, _1080p * 427)
	var_28_0:addElement(var_28_57)

	var_28_0.ReactiveIcon = var_28_57

	local var_28_58
	local var_28_59 = MenuBuilder.BuildRegisteredType("WZWeaponButtonSnipeIcon", {
		controllerIndex = var_28_1
	})

	var_28_59.id = "SnipeIcon"

	var_28_59:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 106, _1080p * 184, _1080p * 354, _1080p * 396)
	var_28_0:addElement(var_28_59)

	var_28_0.SnipeIcon = var_28_59

	local function var_28_60()
		return
	end

	var_28_0._sequences.DefaultSequence = var_28_60

	local var_28_61
	local var_28_62 = {
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

	var_28_31:RegisterAnimationSequence("EquippedBlueprint", var_28_62)

	local var_28_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_47:RegisterAnimationSequence("EquippedBlueprint", var_28_63)

	local var_28_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 392
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 434
		}
	}

	var_28_59:RegisterAnimationSequence("EquippedBlueprint", var_28_64)

	local function var_28_65()
		var_28_31:AnimateSequence("EquippedBlueprint")
		var_28_47:AnimateSequence("EquippedBlueprint")
		var_28_59:AnimateSequence("EquippedBlueprint")
	end

	var_28_0._sequences.EquippedBlueprint = var_28_65

	local var_28_66
	local var_28_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_31:RegisterAnimationSequence("UnEquippedBlueprint", var_28_67)

	local var_28_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 397
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 427
		}
	}

	var_28_37:RegisterAnimationSequence("UnEquippedBlueprint", var_28_68)

	local var_28_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_47:RegisterAnimationSequence("UnEquippedBlueprint", var_28_69)

	local var_28_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 350
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 392
		}
	}

	var_28_59:RegisterAnimationSequence("UnEquippedBlueprint", var_28_70)

	local function var_28_71()
		var_28_31:AnimateSequence("UnEquippedBlueprint")
		var_28_37:AnimateSequence("UnEquippedBlueprint")
		var_28_47:AnimateSequence("UnEquippedBlueprint")
		var_28_59:AnimateSequence("UnEquippedBlueprint")
	end

	var_28_0._sequences.UnEquippedBlueprint = var_28_71

	local var_28_72
	local var_28_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_31:RegisterAnimationSequence("UnEquipped", var_28_73)

	local var_28_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_47:RegisterAnimationSequence("UnEquipped", var_28_74)

	local var_28_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 321
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 363
		}
	}

	var_28_59:RegisterAnimationSequence("UnEquipped", var_28_75)

	local function var_28_76()
		var_28_31:AnimateSequence("UnEquipped")
		var_28_47:AnimateSequence("UnEquipped")
		var_28_59:AnimateSequence("UnEquipped")
	end

	var_28_0._sequences.UnEquipped = var_28_76

	local var_28_77
	local var_28_78 = {
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

	var_28_31:RegisterAnimationSequence("Equipped", var_28_78)

	local var_28_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_47:RegisterAnimationSequence("Equipped", var_28_79)

	local var_28_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 350
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 392
		}
	}

	var_28_59:RegisterAnimationSequence("Equipped", var_28_80)

	local function var_28_81()
		var_28_31:AnimateSequence("Equipped")
		var_28_47:AnimateSequence("Equipped")
		var_28_59:AnimateSequence("Equipped")
	end

	var_28_0._sequences.Equipped = var_28_81

	local var_28_82
	local var_28_83 = {
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

	var_28_29:RegisterAnimationSequence("PC", var_28_83)

	local function var_28_84()
		var_28_29:AnimateSequence("PC")
	end

	var_28_0._sequences.PC = var_28_84

	local var_28_85
	local var_28_86 = {
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

	var_28_29:RegisterAnimationSequence("Console", var_28_86)

	local function var_28_87()
		var_28_29:AnimateSequence("Console")
	end

	var_28_0._sequences.Console = var_28_87

	local var_28_88
	local var_28_89 = {
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

	var_28_10:RegisterAnimationSequence("InGame", var_28_89)

	local var_28_90 = {
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

	var_28_21:RegisterAnimationSequence("InGame", var_28_90)

	local var_28_91 = {
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

	var_28_23:RegisterAnimationSequence("InGame", var_28_91)

	local var_28_92 = {
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

	var_28_25:RegisterAnimationSequence("InGame", var_28_92)

	local var_28_93 = {
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

	var_28_29:RegisterAnimationSequence("InGame", var_28_93)

	local var_28_94 = {
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

	var_28_31:RegisterAnimationSequence("InGame", var_28_94)

	local var_28_95 = {
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

	var_28_33:RegisterAnimationSequence("InGame", var_28_95)

	local var_28_96 = {
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

	var_28_35:RegisterAnimationSequence("InGame", var_28_96)

	local var_28_97 = {
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

	var_28_37:RegisterAnimationSequence("InGame", var_28_97)

	local var_28_98 = {
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

	var_28_39:RegisterAnimationSequence("InGame", var_28_98)

	local var_28_99 = {
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

	var_28_41:RegisterAnimationSequence("InGame", var_28_99)

	local var_28_100 = {
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

	var_28_43:RegisterAnimationSequence("InGame", var_28_100)

	local var_28_101 = {
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

	var_28_45:RegisterAnimationSequence("InGame", var_28_101)

	local var_28_102 = {
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

	var_28_47:RegisterAnimationSequence("InGame", var_28_102)

	local var_28_103 = {
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

	var_28_49:RegisterAnimationSequence("InGame", var_28_103)

	local var_28_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_53:RegisterAnimationSequence("InGame", var_28_104)

	local var_28_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 591
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 669
		}
	}

	var_28_59:RegisterAnimationSequence("InGame", var_28_105)

	local function var_28_106()
		var_28_10:AnimateSequence("InGame")
		var_28_21:AnimateSequence("InGame")
		var_28_23:AnimateSequence("InGame")
		var_28_25:AnimateSequence("InGame")
		var_28_29:AnimateSequence("InGame")
		var_28_31:AnimateSequence("InGame")
		var_28_33:AnimateSequence("InGame")
		var_28_35:AnimateSequence("InGame")
		var_28_37:AnimateSequence("InGame")
		var_28_39:AnimateSequence("InGame")
		var_28_41:AnimateSequence("InGame")
		var_28_43:AnimateSequence("InGame")
		var_28_45:AnimateSequence("InGame")
		var_28_47:AnimateSequence("InGame")
		var_28_49:AnimateSequence("InGame")
		var_28_53:AnimateSequence("InGame")
		var_28_59:AnimateSequence("InGame")
	end

	var_28_0._sequences.InGame = var_28_106

	local var_28_107
	local var_28_108 = {
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

	var_28_10:RegisterAnimationSequence("Splitscreen", var_28_108)

	local var_28_109 = {
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

	var_28_21:RegisterAnimationSequence("Splitscreen", var_28_109)

	local var_28_110 = {
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

	var_28_23:RegisterAnimationSequence("Splitscreen", var_28_110)

	local var_28_111 = {
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

	var_28_25:RegisterAnimationSequence("Splitscreen", var_28_111)

	local var_28_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 604
		}
	}

	var_28_29:RegisterAnimationSequence("Splitscreen", var_28_112)

	local var_28_113 = {
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

	var_28_31:RegisterAnimationSequence("Splitscreen", var_28_113)

	local var_28_114 = {
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

	var_28_33:RegisterAnimationSequence("Splitscreen", var_28_114)

	local var_28_115 = {
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

	var_28_35:RegisterAnimationSequence("Splitscreen", var_28_115)

	local var_28_116 = {
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

	var_28_37:RegisterAnimationSequence("Splitscreen", var_28_116)

	local var_28_117 = {
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

	var_28_39:RegisterAnimationSequence("Splitscreen", var_28_117)

	local var_28_118 = {
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

	var_28_41:RegisterAnimationSequence("Splitscreen", var_28_118)

	local var_28_119 = {
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

	var_28_43:RegisterAnimationSequence("Splitscreen", var_28_119)

	local var_28_120 = {
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

	var_28_45:RegisterAnimationSequence("Splitscreen", var_28_120)

	local var_28_121 = {
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

	var_28_47:RegisterAnimationSequence("Splitscreen", var_28_121)

	local var_28_122 = {
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

	var_28_49:RegisterAnimationSequence("Splitscreen", var_28_122)

	local function var_28_123()
		var_28_10:AnimateSequence("Splitscreen")
		var_28_21:AnimateSequence("Splitscreen")
		var_28_23:AnimateSequence("Splitscreen")
		var_28_25:AnimateSequence("Splitscreen")
		var_28_29:AnimateSequence("Splitscreen")
		var_28_31:AnimateSequence("Splitscreen")
		var_28_33:AnimateSequence("Splitscreen")
		var_28_35:AnimateSequence("Splitscreen")
		var_28_37:AnimateSequence("Splitscreen")
		var_28_39:AnimateSequence("Splitscreen")
		var_28_41:AnimateSequence("Splitscreen")
		var_28_43:AnimateSequence("Splitscreen")
		var_28_45:AnimateSequence("Splitscreen")
		var_28_47:AnimateSequence("Splitscreen")
		var_28_49:AnimateSequence("Splitscreen")
	end

	var_28_0._sequences.Splitscreen = var_28_123

	local var_28_124
	local var_28_125 = {}

	var_28_21:RegisterAnimationSequence("AR", var_28_125)

	local function var_28_126()
		var_28_21:AnimateSequence("AR")
	end

	var_28_0._sequences.AR = var_28_126

	local var_28_127
	local var_28_128 = {
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

	var_28_25:RegisterAnimationSequence("BlueprintStore", var_28_128)

	if CONDITIONS.InFrontend() then
		local var_28_129 = {
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

		var_28_50:RegisterAnimationSequence("BlueprintStore", var_28_129)
	end

	if CONDITIONS.InFrontend() then
		local var_28_130 = {
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

		var_28_51:RegisterAnimationSequence("BlueprintStore", var_28_130)
	end

	local function var_28_131()
		var_28_25:AnimateSequence("BlueprintStore")

		if CONDITIONS.InFrontend() then
			var_28_50:AnimateSequence("BlueprintStore")
		end

		if CONDITIONS.InFrontend() then
			var_28_51:AnimateSequence("BlueprintStore")
		end
	end

	var_28_0._sequences.BlueprintStore = var_28_131

	local var_28_132

	if CONDITIONS.InFrontend() then
		local var_28_133 = {
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

		var_28_50:RegisterAnimationSequence("CHT", var_28_133)
	end

	local function var_28_134()
		if CONDITIONS.InFrontend() then
			var_28_50:AnimateSequence("CHT")
		end
	end

	var_28_0._sequences.CHT = var_28_134

	local var_28_135
	local var_28_136 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 242
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 412
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 357
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 427
		}
	}

	var_28_57:RegisterAnimationSequence("ShowReactiveIcon", var_28_136)

	local function var_28_137()
		var_28_57:AnimateSequence("ShowReactiveIcon")
	end

	var_28_0._sequences.ShowReactiveIcon = var_28_137

	local var_28_138
	local var_28_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_57:RegisterAnimationSequence("HideReactiveIcon", var_28_139)

	local function var_28_140()
		var_28_57:AnimateSequence("HideReactiveIcon")
	end

	var_28_0._sequences.HideReactiveIcon = var_28_140

	local var_28_141
	local var_28_142 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_31:RegisterAnimationSequence("UnEquippedSpecial", var_28_142)

	local var_28_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_47:RegisterAnimationSequence("UnEquippedSpecial", var_28_143)

	local var_28_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 350
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 392
		}
	}

	var_28_59:RegisterAnimationSequence("UnEquippedSpecial", var_28_144)

	local function var_28_145()
		var_28_31:AnimateSequence("UnEquippedSpecial")
		var_28_47:AnimateSequence("UnEquippedSpecial")
		var_28_59:AnimateSequence("UnEquippedSpecial")
	end

	var_28_0._sequences.UnEquippedSpecial = var_28_145

	local var_28_146
	local var_28_147 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_31:RegisterAnimationSequence("EquippedSpecial", var_28_147)

	local var_28_148 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_47:RegisterAnimationSequence("EquippedSpecial", var_28_148)

	local var_28_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 392
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 434
		}
	}

	var_28_59:RegisterAnimationSequence("EquippedSpecial", var_28_149)

	local function var_28_150()
		var_28_31:AnimateSequence("EquippedSpecial")
		var_28_47:AnimateSequence("EquippedSpecial")
		var_28_59:AnimateSequence("EquippedSpecial")
	end

	var_28_0._sequences.EquippedSpecial = var_28_150

	local var_28_151
	local var_28_152 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZTitle
		}
	}

	var_28_21:RegisterAnimationSequence("WZWipSetup", var_28_152)

	local var_28_153 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_28_23:RegisterAnimationSequence("WZWipSetup", var_28_153)

	local function var_28_154()
		var_28_21:AnimateSequence("WZWipSetup")
		var_28_23:AnimateSequence("WZWipSetup")
	end

	var_28_0._sequences.WZWipSetup = var_28_154

	local var_28_155
	local var_28_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_28_59:RegisterAnimationSequence("MW", var_28_156)

	local function var_28_157()
		var_28_59:AnimateSequence("MW")
	end

	var_28_0._sequences.MW = var_28_157

	local var_28_158
	local var_28_159 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_28_59:RegisterAnimationSequence("CW", var_28_159)

	local function var_28_160()
		var_28_59:AnimateSequence("CW")
	end

	var_28_0._sequences.CW = var_28_160

	local var_28_161
	local var_28_162 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_28_59:RegisterAnimationSequence("VG", var_28_162)

	local function var_28_163()
		var_28_59:AnimateSequence("VG")
	end

	var_28_0._sequences.VG = var_28_163

	var_28_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_28_164 = LUI.UIBindButton.new()

	var_28_164.id = "selfBindButton"

	var_28_0:addElement(var_28_164)

	var_28_0.bindButton = var_28_164

	var_28_0.bindButton:addEventHandler("button_secondary", function(arg_50_0, arg_50_1)
		if not arg_50_1.controller then
			local var_50_0 = var_28_1
		end

		ACTIONS.LeaveMenu(var_28_0)
	end)
	var_0_14(var_28_0, var_28_1, arg_28_1)

	return var_28_0
end

MenuBuilder.registerType("WeaponLocker", WeaponLocker)
LockTable(_M)
