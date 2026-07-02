module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if LOOT.HideLootBreadcrumbsCondition(true) then
		return
	end

	local var_1_0 = arg_1_0.Tabs:GetTabAtIndex(arg_1_1)

	if not var_1_0:IsEnabled() then
		return
	end

	local var_1_1 = WEAPON.GetNewWeaponIDsByClass(arg_1_0._controllerIndex, arg_1_0.tabsData[arg_1_1].classRef)

	if var_1_0.NewItemSmallIcon then
		var_1_0.NewItemSmallIcon:UpdateAlpha(#var_1_1 > 0 and not arg_1_0._isRestricted and 1 or 0, 0, true)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = {}

	table.insert(var_2_0, arg_2_0._otherSelectedModel)
	table.insert(var_2_0, arg_2_0._equippedWatchModel)

	local var_2_1 = LUI.FlowManager.GetScopedData(arg_2_0)
	local var_2_2

	for iter_2_0 = arg_2_2 - 1, arg_2_2 + 1 do
		if iter_2_0 > #arg_2_0._currentWeapons then
			iter_2_0 = 1
		elseif iter_2_0 == 0 then
			iter_2_0 = #arg_2_0._currentWeapons
		end

		assert(iter_2_0 > 0 and iter_2_0 <= #arg_2_0._currentWeapons)

		local var_2_3 = arg_2_0._currentWeapons[iter_2_0].ref
		local var_2_4 = WEAPON.GetWeaponModelNameFromRef(var_2_3)
		local var_2_5 = DYN_ATTACHMENT.GetDynamicAttachmentsTable(var_2_4)

		DYN_ATTACHMENT.SetupWeaponAttachmentStreamer(arg_2_0, var_2_5, false)

		if not LUI.IsItemInArray(var_2_0, var_2_4) then
			if iter_2_0 == arg_2_2 then
				var_2_2 = var_2_4
			else
				table.insert(var_2_0, var_2_4)
			end
		end
	end

	if var_2_2 then
		table.insert(var_2_0, var_2_2)
	end

	if #var_2_0 > 0 then
		FrontEndScene.RequestWeaponViewModels(var_2_0, arg_2_1)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0:GetBuiltChildren()

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		iter_3_1:SetHandleMouse(arg_3_1)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {}

	for iter_4_0 = arg_4_2 - 1, arg_4_2 + 1 do
		if iter_4_0 >= 1 and iter_4_0 <= #arg_4_0.tabsData and iter_4_0 ~= arg_4_2 then
			local var_4_1 = arg_4_0.tabsData[iter_4_0].weaponData[1].ref
			local var_4_2 = WEAPON.GetWeaponModelNameFromRef(var_4_1)

			if not LUI.IsItemInArray(var_4_0, var_4_2) then
				table.insert(var_4_0, var_4_2)
			end
		end
	end

	if not LUI.IsItemInArray(var_4_0, arg_4_0._otherSelectedModel) then
		table.insert(var_4_0, arg_4_0._otherSelectedModel)
		table.insert(var_4_0, arg_4_0._equippedWatchModel)
	end

	if #var_4_0 > 0 then
		FrontEndScene.RequestWeaponViewModels(var_4_0, arg_4_1)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if arg_5_2.isBlueprint then
		return WEAPON.GetWeaponModelName(arg_5_2.weaponData.ref, arg_5_2.weaponData.blueprint, {
			includeAttachments = true,
			controllerIndex = arg_5_1
		})
	else
		return WEAPON.GetWeaponModelNameFromRef(arg_5_2.weaponData.ref)
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5)
	local var_6_0 = var_0_4(arg_6_0, arg_6_1, arg_6_2, arg_6_5.weaponSetups[arg_6_4])

	if arg_6_0._currentWeaponModel then
		local function var_6_1()
			assert(arg_6_0._nextWeaponModel)

			arg_6_0._currentWeaponModel = arg_6_0._nextWeaponModel
			arg_6_0._nextWeaponModel = nil

			arg_6_3:SetWeaponModel(arg_6_0._currentWeaponModel)

			if arg_6_3.hidden then
				arg_6_3:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -302, _1080p * 779, _1080p * 290, _1080p * 740, 0)

				arg_6_3.hidden = false
			end
		end

		arg_6_0._nextWeaponModel = var_6_0

		assert(arg_6_0._nextWeaponModel)

		if Streaming.DACIGAEDAE({
			arg_6_0._nextWeaponModel
		}, arg_6_1) then
			var_6_1()
		else
			local var_6_2

			local function var_6_3()
				local var_8_0 = arg_6_5.weaponSetups[arg_6_4]
				local var_8_1 = WEAPON.GenerateWeaponTable(var_8_0)

				if arg_6_0._nextWeaponModel then
					if Streaming.DACIGAEDAE({
						arg_6_0._nextWeaponModel
					}, arg_6_1) then
						var_6_1()
					else
						arg_6_0:Wait(100, true).onComplete = var_6_3

						arg_6_3:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -302, _1080p * 779, _1080p * 1500, _1080p * 1500, 0)

						arg_6_3.hidden = true
					end
				end
			end

			var_6_3()
		end
	else
		arg_6_3:SetWeaponModel(var_6_0)

		arg_6_0._currentWeaponModel = var_6_0
		arg_6_0._nextWeaponModel = nil
	end
end

local function var_0_6(arg_9_0, arg_9_1)
	local var_9_0 = -0.6
	local var_9_1 = 0.6
	local var_9_2 = -0.6
	local var_9_3 = 0.6
	local var_9_4 = 3500
	local var_9_5 = ""
	local var_9_6 = WEAPON.GetWeaponClass(arg_9_1)

	if arg_9_0.weaponSlot == WEAPON.PrimarySlot then
		var_9_5 = "loadout_showcase_p"
	else
		var_9_5 = WEAPON.GetGunTableSecondPositionScene(arg_9_1)

		if var_9_5 == "loadout_showcase_s" then
			var_9_0, var_9_1, var_9_2, var_9_3 = -0.3, 0.3, -0.3, 0.3
			var_9_4 = 4500
		end
	end

	if arg_9_0._currentCamera ~= var_9_5 then
		arg_9_0._currentCamera = var_9_5

		Engine.DHFCHIIJCA(arg_9_0._currentCamera)
	end

	arg_9_0.FrontendCameraMover:SetLimits(var_9_0, var_9_1, var_9_2, var_9_3)
	arg_9_0.FrontendCameraMover:SetSwayValues(var_9_4, 0.06, 0.1)
end

local function var_0_7(arg_10_0)
	return arg_10_0 and not arg_10_0.disabled and arg_10_0.weaponData.isUnlocked and arg_10_0.weaponData.isGunsmithDisabled ~= "1"
end

local function var_0_8(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	return function(arg_12_0, arg_12_1)
		if Engine.DDJFBBJAIG() then
			var_0_6(arg_11_0, arg_11_1.weaponData.ref)
		end

		local var_12_0 = arg_11_1.weaponData.isUnlocked

		arg_11_0.InfoPanel.ItemName:setText(ToUpperCase(arg_11_1.weaponName))
		arg_11_0.InfoPanel:SetEquipped(arg_11_1._isSelected)

		local var_12_1 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, arg_11_1.weaponData.ref)
		local var_12_2 = false

		if not LOOT.HideLootBreadcrumbsCondition(true) then
			var_12_2 = Loot.HDJCADADF(arg_11_2, var_12_1)
		end

		local var_12_3 = CONDITIONS.AreRestrictionsActive(arg_11_2) and MatchRules.CADFFHGJAE(arg_11_1.weaponData.ref)
		local var_12_4 = {
			newDesc = arg_11_1.desc,
			isUnlocked = var_12_0,
			isNew = var_12_2,
			isRestricted = var_12_3
		}

		if not var_12_0 then
			if arg_11_1.weaponData.unlockThroughSeasonalEvent then
				var_12_4.unlockText = arg_11_1.weaponData.unlockCriteria
				var_12_4.unlockThroughSeasonalEvent = true
			else
				local var_12_5 = WEAPON.GetChallengeUnlockRow(var_12_1)

				if var_12_5 and var_12_5 >= 0 then
					local var_12_6 = CSV.ReadRow(CSV.gunChallenges, var_12_5)
					local var_12_7 = Gunsmith.CIJGBIFEIF(arg_11_2, var_12_6.id).progress

					var_12_4.challengeInfo = {
						lootID = var_12_1,
						challengeID = var_12_6.id,
						progress = var_12_7
					}
				else
					var_12_4.unlockText = arg_11_1.weaponData.unlockCriteria
					var_12_4.unlockRank = PROGRESSION.GetUnlockRank(var_12_1)
				end
			end
		end

		if arg_11_1.isAlreadyEquipped then
			var_12_4.isOverkill = true
			var_12_4.unlockText = Engine.CBBHFCGDIC("LUA_MENU/WEAPON_CONFLICT", arg_11_0.weaponSlot == 0 and "LUA_MENU/SECONDARY" or "LUA_MENU/PRIMARY")
			var_12_4.isUnlocked = false
		end

		if CONDITIONS.UsingWZLoadouts() then
			var_12_4.weaponRef = arg_11_1.weaponData.ref
			var_12_4.selected = arg_11_0.equippedWeapon == arg_11_1.weaponData.ref

			arg_11_0.WZWipSnipeBackgroundSceneOverlay:UpdateSnipeOverlay({
				weaponRef = arg_11_1.weaponData.ref,
				useGunsmithSetup = not Engine.DDJFBBJAIG()
			})
		end

		arg_11_0.InfoPanel:UpdateDescription(var_12_4)

		if Engine.DDJFBBJAIG() then
			local var_12_8 = var_0_7(arg_11_1)

			arg_11_0.InfoPanel.ActionPrompt:SetAlpha(var_12_8 and 1 or 0)
		end

		if arg_11_1.isBlueprint then
			local var_12_9 = arg_11_1.weaponData.blueprint

			if var_12_9 then
				local var_12_10 = ATTACHMENT.GetStatsForAttachments(arg_11_1.weaponData.ref, var_12_9.attachments)

				arg_11_0.WeaponAttributes:Setup(var_12_9, arg_11_4)
			end
		else
			arg_11_0.WeaponAttributes:Setup({
				weapon = arg_11_1.weaponData.ref
			}, arg_11_4)
		end

		arg_11_0.currentSelection = {
			weapon = arg_11_1.weaponData.ref,
			blueprint = arg_11_1.weaponData.blueprint
		}

		if Engine.DDJFBBJAIG() then
			var_0_1(arg_11_0, arg_11_2, arg_11_1.gridIndex, arg_11_3)
			var_0_5(arg_11_0, arg_11_2, arg_11_1, arg_11_0.weaponModel, arg_11_0.weaponSlot, arg_11_3)
		end

		local var_12_11 = LUI.FlowManager.GetScopedData(arg_11_0)

		var_12_11.previousFocusedButton = arg_11_1

		if arg_11_1._isSelected then
			arg_11_0.InfoPanel.NewItemNotification:SetAlpha(0)
		else
			arg_11_0.InfoPanel.NewItemNotification:UpdateBreadcrumbByID(arg_11_2, var_12_1, true)
		end

		local var_12_12 = WEAPON.GetName(arg_11_0.equippedWeapon)

		arg_11_0.ComparisonString:setText(Engine.CBBHFCGDIC("WEAPON/COMPARISON", var_12_12))

		if arg_11_0.BundleUpsellButton then
			if Dvar.IBEGCHEFE("LTSNLQNRKO") and Dvar.IBEGCHEFE("NKRLMNTNRS") and not CONDITIONS.AreRestrictionsActive(arg_11_2) and var_12_11.bundleVariants[arg_11_1.weaponData.ref] and var_12_11.bundleVariants[arg_11_1.weaponData.ref][1] then
				arg_11_0.BundleUpsellButton:SetupUpsellButtonWithBundleID(arg_11_2, var_12_11.bundleVariants[arg_11_1.weaponData.ref][1].bundleID)
			else
				arg_11_0.BundleUpsellButton:HideButton()
			end
		end

		if arg_11_0.MasterChallenges then
			if GUNSMITH.AreMasterChallengesEnabled(arg_11_2, arg_11_1.weaponData.ref) then
				arg_11_0.MasterChallenges:SetAlpha(1)
				arg_11_0.MasterChallenges:Setup(arg_11_1.weaponData.ref)
			else
				arg_11_0.MasterChallenges:SetAlpha(0)
			end
		end
	end
end

local function var_0_9(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_2._loadoutPlayerData.loadoutPerks[0]:get()
	local var_13_1 = arg_13_2._loadoutPlayerData.loadoutPerks[1]:get()
	local var_13_2 = arg_13_2._loadoutPlayerData.loadoutPerks[2]:get()

	if not PERK.IsPerkOverkill(var_13_0) and not PERK.IsPerkOverkill(var_13_1) then
		local var_13_3 = PERK.IsPerkOverkill(var_13_2)
	end

	if arg_13_2.equippedWeapon ~= arg_13_0.weaponData.ref then
		local var_13_4 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("LUA_MENU/WEAPON_EQUIPPED"),
			description = Engine.CBBHFCGDIC(arg_13_0.weaponData.name),
			type = LUI.ToastManager.NotificationType.WeaponEquipped,
			controllerIndex = arg_13_1
		}

		arg_13_2:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_13_4
		})
	end

	if arg_13_0.isBlueprint then
		WEAPON.EquipModification(arg_13_2._loadoutPlayerData.weaponSetups[arg_13_2.weaponSlot], arg_13_0.weaponData.blueprint)
	else
		WEAPON.EquipBaseWeapon(arg_13_2._loadoutPlayerData.weaponSetups[arg_13_2.weaponSlot], arg_13_0.weaponData.ref)
	end
end

local function var_0_10(arg_14_0, arg_14_1, arg_14_2)
	var_0_9(arg_14_2, controllerindex, arg_14_0, arg_14_0._loadoutPlayerData)
	GUNSMITH.OpenGunsmith(arg_14_1, arg_14_0.loadoutIndex, arg_14_0.weaponSlot, true)
end

local function var_0_11(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_2 or {}

	var_15_0.weaponTable = WEAPON.GenerateWeaponTableFromRef(arg_15_0.currentSelection.weapon)

	LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_15_1, nil, var_15_0, true)
end

local function var_0_12(arg_16_0, arg_16_1, arg_16_2)
	arg_16_1:SetupContextualMenu({
		title = arg_16_1.weaponName
	})

	local var_16_0 = {
		id = "equipAndGunsmith",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/TO_GUNSMITH_CONTEXTUAL_MENU"),
		actionFunction = function()
			var_0_10(arg_16_0, arg_16_2, arg_16_1)
		end,
		conditionFunction = function()
			return var_0_7(arg_16_1)
		end
	}

	arg_16_1:AddContextualMenuAction(var_16_0)

	if CONDITIONS.InFrontend(self) then
		local var_16_1 = {
			id = "previewWeapon",
			actionName = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON"),
			actionFunction = function()
				var_0_11(arg_16_0, arg_16_2, nil)
			end
		}

		arg_16_1:AddContextualMenuAction(var_16_1)
	end
end

local function var_0_13(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4, arg_20_5)
	assert(arg_20_2.WeaponButton.BlueprintIndicator)

	local var_20_0 = 1 - arg_20_0.weaponSlot
	local var_20_1 = arg_20_5.weaponSetups[arg_20_0.weaponSlot]
	local var_20_2 = arg_20_5.weaponSetups[var_20_0]
	local var_20_3 = var_20_1.weapon:get()
	local var_20_4 = var_20_2.weapon:get()
	local var_20_5 = arg_20_2.WeaponButton

	var_20_5.lootID = LOOT.GetItemID(LOOT.itemTypes.WEAPON, arg_20_3.ref)
	var_20_5.isNew = var_20_5.NewItemNotification:UpdateBreadcrumbByID(arg_20_1, var_20_5.lootID, true)

	local var_20_6 = var_20_4 == arg_20_3.ref
	local var_20_7 = var_20_3 == arg_20_3.ref or var_20_6

	var_20_5:SetButtonDisabled(not arg_20_3.isUnlocked or var_20_6)

	if arg_20_2.BlueprintButton then
		arg_20_2.BlueprintButton:SetButtonDisabled(var_20_6)
	end

	var_20_5.isAlreadyEquipped = var_20_6

	var_20_5:SetSelected(var_20_7)

	arg_20_3.unlockRow = 0
	var_20_5.weaponData = arg_20_3

	if arg_20_2.BlueprintButton then
		arg_20_2.BlueprintButton.weaponData = arg_20_3
	end

	var_20_5.gridIndex = arg_20_4
	var_20_5.desc = WEAPON.GetDesc(var_20_5.weaponData.ref)
	var_20_5.className = WEAPON.GetWeaponClassName(var_20_5.weaponData.ref)

	local var_20_8 = arg_20_0.blueprintsByWeapon[arg_20_3.ref]
	local var_20_9 = arg_20_0.blueprintsByWeapon[arg_20_3.ref] and #arg_20_0.blueprintsByWeapon[arg_20_3.ref] or 0

	arg_20_2:SetBlueprintActive(arg_20_3.ref, var_20_8 and CONDITIONS.AreWeaponVariantsEnabled(arg_20_1), var_20_9 - 1)

	local var_20_10 = WEAPON.GetNewArmoryIDsByWeapon(arg_20_1, var_20_5.weaponData.ref)

	if var_20_10 and arg_20_2.BlueprintButton and arg_20_2.BlueprintButton.NewItemSmallIcon then
		arg_20_2.BlueprintButton.NewItemSmallIcon:UpdateAlpha(#var_20_10 > 0 and 1 or 0, 0, true)
	end

	if arg_20_2.BlueprintStoreButton then
		local var_20_11 = LUI.FlowManager.GetScopedData(arg_20_0)
		local var_20_12 = STORE.AreAnyBundlesNew(arg_20_1, var_20_11.bundleVariants[arg_20_3.ref])

		arg_20_2.BlueprintStoreButton.NewItemSmallIcon:UpdateAlpha(var_20_12 and 1 or 0, 0, true)
	end

	local var_20_13 = ""

	if var_20_7 then
		if var_20_3 == arg_20_3.ref then
			var_20_13 = GUNSMITH.GetCustomModName(var_20_1.blueprintName:get())
			var_20_5.weaponData.blueprint = WEAPON.GenerateWeaponTable(var_20_1)
		elseif var_20_4 == arg_20_3.ref then
			var_20_13 = GUNSMITH.GetCustomModName(var_20_2.blueprintName:get())
			var_20_5.weaponData.blueprint = WEAPON.GenerateWeaponTable(var_20_2)
		end
	end

	var_20_5.isBlueprint = #var_20_13 > 0

	if var_20_5.isBlueprint then
		var_20_5.weaponName = Engine.CBBHFCGDIC("CAS/BLUEPRINT_AND_WEAPON", arg_20_3.name, Engine.JCBDICCAH(var_20_13))
	else
		var_20_5.weaponName = Engine.CBBHFCGDIC(arg_20_3.name)
	end

	var_20_5.Text:setText(var_20_5.weaponName)

	local var_20_14 = WEAPON.GetSubClass(arg_20_3.ref)

	var_20_5.ClassName:setText(var_20_14)
	var_20_5.WeaponIcon:setImage(RegisterMaterial(WEAPON.GetBWImage(var_20_5.weaponData.ref)))

	if CONDITIONS.UsingWZLoadouts() then
		WEAPON.DisplaySnipeIconByWeaponRef(var_20_5, arg_20_3.ref, {
			setSnipeAnimOnElement = true,
			useArabicPrefix = IsLanguageArabic()
		})
	end

	if var_20_5.WeaponLevelBar then
		var_20_5.WeaponLevelBar:Setup(arg_20_1, var_20_5.weaponData.ref)
	end

	if CONDITIONS.UsingWZLoadouts() and PROGRESSION.IsWeaponMaxLevel(arg_20_1, var_20_5.weaponData.ref) then
		var_20_5.WeaponLevel:setText(Engine.CBBHFCGDIC("LUA_MENU/MAX_LEVEL_NUMBER", PROGRESSION.GetWeaponLevel(arg_20_1, var_20_5.weaponData.ref)))
	else
		var_20_5.WeaponLevel:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_FACTION_LEVEL", PROGRESSION.GetWeaponLevel(arg_20_1, var_20_5.weaponData.ref)))
	end

	var_0_12(arg_20_0, var_20_5, arg_20_1)

	if not var_20_5.handlersAdded then
		var_20_5:addEventHandler("button_over", var_0_8(arg_20_0, var_20_5, arg_20_1, arg_20_5, var_20_3))
		var_20_5:addEventHandler("tab_changed", var_0_8(arg_20_0, var_20_5, arg_20_1, arg_20_5, var_20_3))
		var_20_5:addEventHandler("button_over_disable", var_0_8(arg_20_0, var_20_5, arg_20_1, arg_20_5, var_20_3))
		var_20_5:addEventHandler("lose_focus", function(arg_21_0)
			if var_20_5.isNew then
				var_20_5.NewItemNotification:ClearBreadcrumbByID(arg_20_1, arg_21_0.lootID, true)
				arg_20_0:UpdateTabBreadcrumb(arg_20_0._currentTabIndex)
			end

			if var_20_5.isNew and arg_20_0._currentTabIndex ~= arg_20_0._lastTabIndex then
				arg_20_0:UpdateTabBreadcrumb(arg_20_0._lastTabIndex)

				arg_20_0._lastTabIndex = arg_20_0._currentTabIndex
			end
		end)
		var_20_5:addEventHandler("button_action", function(arg_22_0)
			DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_22_0, arg_20_1, DYN_ATTACHMENT.StreamedImageAction.REMOVE)
			var_0_9(arg_22_0, controllerindex, arg_20_0, arg_20_5)

			if CONDITIONS.InGame() then
				Engine.EBHIFJCGBH("equip_item_ingame", 1)
			end

			DYN_ATTACHMENT.UpdateLoadoutWeaponStreamedImages(arg_22_0, arg_20_1, DYN_ATTACHMENT.StreamedImageAction.ADD)
			LUI.FlowManager.RequestLeaveMenu(arg_20_0, true)
		end)

		var_20_5.handlersAdded = true

		if arg_20_2.BlueprintButton then
			arg_20_2.BlueprintButton:addEventHandler("button_over", var_0_8(arg_20_0, var_20_5, arg_20_1, arg_20_5, var_20_3))
			arg_20_2.BlueprintButton:addEventHandler("button_action", function(arg_23_0)
				local var_23_0 = {}

				var_23_0.selectingForWeapon = true
				var_23_0.weaponSlot = arg_20_0.weaponSlot
				var_23_0.loadoutIndex = arg_20_0.loadoutIndex
				var_23_0.weaponRef = arg_23_0.weaponData.ref
				var_23_0.hideTabs = true

				LUI.FlowManager.RequestAddMenu("WeaponLocker", true, arg_20_1, false, var_23_0)
			end)
		end

		if arg_20_2.BlueprintStoreButton then
			arg_20_2.BlueprintStoreButton:addEventHandler("button_over", var_0_8(arg_20_0, var_20_5, arg_20_1, arg_20_5, var_20_3))
			arg_20_2.BlueprintStoreButton:addEventHandler("button_action", function(arg_24_0, arg_24_1)
				local var_24_0 = {
					blueprintStore = true,
					weaponRef = var_20_5.weaponData.ref,
					weaponSlot = arg_20_0.weaponSlot
				}

				LUI.FlowManager.RequestAddMenu("WeaponLocker", true, arg_24_1.controller, false, var_24_0, true)
			end)
		end
	end

	if CONDITIONS.AreRestrictionsActive(arg_20_1) then
		arg_20_0._isRestricted = arg_20_3.isRestricted

		if arg_20_0._isRestricted then
			ACTIONS.AnimateSequence(var_20_5, "ShowRestriction")
			var_20_5:SetButtonDisabled(true)
		else
			ACTIONS.AnimateSequence(var_20_5, "HideRestriction")
			var_20_5:SetButtonDisabled(false)
		end
	end

	if CONDITIONS.InFrontend() then
		local var_20_15 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_20_3.ref, CSV.MPWeapons.cols.recommended)

		if Dvar.IBEGCHEFE("lui_hide_recommended_weapons") ~= true and var_20_15 == "1" then
			ACTIONS.AnimateSequence(var_20_5, "ShowRecommended")
		else
			ACTIONS.AnimateSequence(var_20_5, "HideRecommended")
		end
	end

	return var_20_5
end

local function var_0_14(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	local var_25_0 = arg_25_0.WeaponsGrid:GetFocusPositionIndex()

	arg_25_0._currentWeapons = arg_25_4
	arg_25_0.WeaponsGrid._shouldFocus = false

	arg_25_0.WeaponsGrid:SetNumChildren(#arg_25_4)

	local var_25_1 = 0

	for iter_25_0, iter_25_1 in ipairs(arg_25_4) do
		if arg_25_0.equippedWeapon == iter_25_1.ref then
			var_25_1 = iter_25_0

			break
		end
	end

	local var_25_2 = arg_25_0.WeaponsGrid:GetPositionForIndex(var_25_1, {
		relativePosition = false
	})

	var_25_2.y = var_25_2.y == 0 and var_25_2.y or var_25_2.y - 1

	if LUI.IsLastInputMouseNavigation(arg_25_1) then
		Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
	end

	arg_25_0.WeaponsGrid:SetFocusedPosition(var_25_2, true)
	arg_25_0.WeaponsGrid:RefreshContent()

	local var_25_3 = arg_25_0.WeaponsGrid:GetElementAtPosition(var_25_2.x, var_25_2.y)

	if Engine.DDJFBBJAIG() then
		var_0_3(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	end

	if var_25_3 then
		var_25_3:processEvent({
			name = "tab_changed"
		})
	end

	if var_25_0 == var_25_1 then
		local var_25_4 = CoD.SFX.MouseOver

		if var_25_3 and var_25_3.WeaponButton and var_25_3.WeaponButton.gainFocusSFX then
			if LUI.IsLastInputGamepad(arg_25_1) then
				var_25_4 = var_25_3.WeaponButton.gainFocusGamepadSFX
			elseif LUI.IsLastInputKeyboardMouse(arg_25_1) then
				var_25_4 = var_25_3.WeaponButton.gainFocusSFX
			end
		end

		Engine.BJDBIAGIDA(var_25_4)

		if var_25_3 and not var_25_3.WeaponButton.disabled then
			ACTIONS.AnimateSequence(var_25_3.WeaponButton, "ProgressBarOver")
		end
	end
end

local function var_0_15(arg_26_0, arg_26_1)
	local var_26_0 = LUI.FlowManager.GetScopedData(arg_26_0)
	local var_26_1 = {
		weaponFilterType = var_26_0.weaponFilterType,
		weaponSortingByTitleType = var_26_0.weaponSortingByTitleType,
		weaponSortingByWeaponDataType = var_26_0.weaponSortingByWeaponDataType
	}

	if LUI.IsLastInputGamepad(arg_26_1) then
		arg_26_0.WZWipSortPrompt:UpdateText(var_26_1, "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON")
	else
		arg_26_0.WZWipSortPrompt:UpdateText(var_26_1, "INPUT/KB_LEFT_TRIGGER_BUTTON")
	end
end

local function var_0_16(arg_27_0)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in pairs(LUI.GAME_SOURCE_ID) do
		var_27_0[iter_27_1] = 0
	end

	for iter_27_2, iter_27_3 in pairs(arg_27_0._weaponTable[arg_27_0.tabsData[arg_27_0._currentTabIndex].classRef]) do
		for iter_27_4, iter_27_5 in pairs(LUI.GAME_SOURCE_ID) do
			if iter_27_3.gameSourceID == iter_27_5 then
				var_27_0[iter_27_5] = var_27_0[iter_27_5] + 1

				break
			end
		end
	end

	return var_27_0
end

local function var_0_17(arg_28_0)
	local var_28_0 = LUI.FlowManager.GetScopedData(arg_28_0)

	if var_28_0.weaponFilterType and var_28_0.weaponFilterType == LOOT.weaponFilterOptions.ALL then
		local var_28_1 = #arg_28_0.tabsData

		for iter_28_0 = 1, var_28_1 do
			if iter_28_0 ~= arg_28_0._currentTabIndex then
				arg_28_0.Tabs:GetTabAtIndex(iter_28_0):Enable()
			end
		end

		return
	elseif not var_28_0.weaponFilterType then
		return
	end

	local var_28_2 = {}
	local var_28_3 = #arg_28_0.tabsData

	for iter_28_1 = 1, var_28_3 do
		var_28_2[iter_28_1] = false
	end

	for iter_28_2 = 1, var_28_3 do
		for iter_28_3, iter_28_4 in pairs(arg_28_0._weaponTable[arg_28_0.tabsData[iter_28_2].classRef]) do
			if var_28_0.weaponFilterType == LOOT.weaponFilterOptions.COLD_WAR and iter_28_4.gameSourceID == LUI.GAME_SOURCE_ID.COLD_WAR then
				var_28_2[iter_28_2] = true

				break
			elseif var_28_0.weaponFilterType == LOOT.weaponFilterOptions.MODERN_WARFARE and iter_28_4.gameSourceID == LUI.GAME_SOURCE_ID.MODERN_WARFARE then
				var_28_2[iter_28_2] = true

				break
			elseif var_28_0.weaponFilterType == LOOT.weaponFilterOptions.VANGUARD and iter_28_4.gameSourceID == LUI.GAME_SOURCE_ID.VANGUARD then
				var_28_2[iter_28_2] = true

				break
			end
		end
	end

	for iter_28_5 = 1, var_28_3 do
		if iter_28_5 ~= arg_28_0._currentTabIndex then
			local var_28_4 = arg_28_0.Tabs:GetTabAtIndex(iter_28_5)

			if var_28_2[iter_28_5] then
				var_28_4:Enable()
			else
				var_28_4:Disable()
			end
		end
	end
end

local function var_0_18(arg_29_0, arg_29_1)
	local var_29_0 = {}
	local var_29_1 = LUI.FlowManager.GetScopedData(arg_29_0)

	for iter_29_0, iter_29_1 in pairs(arg_29_0._weaponTable[arg_29_0.tabsData[arg_29_0._currentTabIndex].classRef]) do
		if var_29_1.weaponFilterType == LOOT.weaponFilterOptions.COLD_WAR then
			if iter_29_1.gameSourceID == LUI.GAME_SOURCE_ID.COLD_WAR then
				table.insert(var_29_0, iter_29_1)
			end
		elseif var_29_1.weaponFilterType == LOOT.weaponFilterOptions.MODERN_WARFARE then
			if iter_29_1.gameSourceID == LUI.GAME_SOURCE_ID.MODERN_WARFARE then
				table.insert(var_29_0, iter_29_1)
			end
		elseif var_29_1.weaponFilterType == LOOT.weaponFilterOptions.VANGUARD then
			if iter_29_1.gameSourceID == LUI.GAME_SOURCE_ID.VANGUARD then
				table.insert(var_29_0, iter_29_1)
			end
		else
			table.insert(var_29_0, iter_29_1)
		end
	end

	arg_29_0._currentWeapons = var_29_0

	local var_29_2 = {}
	local var_29_3 = var_29_1.weaponSortingByWeaponDataType == LOOT.weaponSortByWeaponDataOptions.HIGHEST_LEVEL_FIRST
	local var_29_4 = var_29_1.weaponSortingByWeaponDataType == LOOT.weaponSortByWeaponDataOptions.LOWEST_LEVEL_FIRST
	local var_29_5 = var_29_3 or var_29_4
	local var_29_6 = var_29_1.weaponSortingByWeaponDataType == LOOT.weaponSortByWeaponDataOptions.NEW_FIRST
	local var_29_7 = var_29_1.weaponSortingByWeaponDataType == LOOT.weaponSortByWeaponDataOptions.UNLOCKED_FIRST
	local var_29_8 = var_29_1.weaponSortingByWeaponDataType == LOOT.weaponSortByWeaponDataOptions.LOCKED_FIRST

	if var_29_7 or var_29_8 then
		table.insert(var_29_2, {
			sortFunc = MenuUtils.SortUnlocks,
			sortFuncParams = {
				sortByUnlockedFirst = var_29_7
			}
		})
	elseif var_29_5 then
		table.insert(var_29_2, {
			sortFunc = MenuUtils.SortLevel,
			sortFuncParams = {
				controllerIndex = arg_29_1,
				sortByHighestLevelFirst = var_29_3
			}
		})
	elseif var_29_6 then
		table.insert(var_29_2, {
			sortFunc = MenuUtils.SortNew,
			sortFuncParams = {
				controllerIndex = arg_29_1
			}
		})
	end

	if var_29_1.weaponSortingByTitleType ~= LOOT.weaponSortByTitleOptions.OFF then
		table.insert(var_29_2, {
			sortFunc = MenuUtils.SortGameTypeFirst,
			sortFuncParams = {
				gameSourceID = LOOT.weaponSortGameSourceID[var_29_1.weaponSortingByTitleType]
			}
		})
	end

	if Dvar.IBEGCHEFE("NKOPLQKLQT") then
		table.insert(var_29_2, {
			sortFunc = MenuUtils.SortBySubClassIDAndGameSource
		})
	else
		table.insert(var_29_2, {
			sortFunc = MenuUtils.SortByDisplayOrder
		})
	end

	MenuUtils.SortTableViaOptions(arg_29_0._currentWeapons, var_29_2)
	var_0_17(arg_29_0)
	var_0_15(arg_29_0, arg_29_1)
end

local function var_0_19(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0.bindButton:addEventHandler("button_secondary", function(arg_31_0, arg_31_1)
		ACTIONS.LeaveMenu(arg_30_0)
	end)
	arg_30_0.bindButton:addEventHandler("button_alt2", function(arg_32_0, arg_32_1)
		local var_32_0 = LUI.FlowManager.GetScopedData(arg_30_0).previousFocusedButton

		if var_0_7(var_32_0) then
			var_0_10(arg_30_0, arg_30_1, var_32_0)
		end
	end)

	if CONDITIONS.InFrontend(arg_30_0) then
		local function var_30_0(arg_33_0, arg_33_1)
			if LUI.IsLastInputGamepad(arg_33_1.controllerIndex) then
				arg_33_0:AddButtonHelperTextToElement(arg_33_0.HelperBar, {
					side = "left",
					button_ref = "button_r3",
					priority = 2,
					helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
				})
				arg_33_0.InfoPanel.SecondActionPrompt:SetAlpha(0)
			else
				arg_33_0:RemoveButtonHelperTextFromElement(arg_33_0.HelperBar, "button_r3", "left")
				arg_33_0.InfoPanel.SecondActionPrompt:SetAlpha(1)
			end
		end

		arg_30_0:addAndCallEventHandler("update_input_type", var_30_0, {
			controllerIndex = arg_30_1
		})
		arg_30_0.bindButton:addEventHandler("button_right_stick", function(arg_34_0, arg_34_1)
			local var_34_0 = arg_34_0:getParent()

			var_0_11(var_34_0, arg_30_1, arg_30_2)
		end)
	end

	if CONDITIONS.UsingWZLoadouts() then
		arg_30_0.HelperBar:AddButtonHelperTextToElement(arg_30_0, {
			kbm_only = true,
			priority = 4,
			side = "left",
			button_ref = "button_left_trigger",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SORT_FILTER")
		})
		arg_30_0.bindButton:addEventHandler("button_left_trigger", function(arg_35_0, arg_35_1)
			local var_35_0 = {
				data = {}
			}

			LOOT.SetupSortingBehavior(var_35_0.data, arg_30_0._controllerIndex, LOOT.itemTypes.WEAPON)

			var_35_0.numWeaponsByGameType = var_0_16(arg_30_0, arg_30_1)
			var_35_0.controllerIndex = arg_30_1
			var_35_0.type = LOOT.itemTypes.WEAPON

			local var_35_1 = MenuBuilder.BuildRegisteredType("WZCustomizeFilteringSortingPopup", var_35_0)

			LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_30_1, false, {
				flyInLeftNarrow = true,
				disableQuickAccessShortcuts = false,
				widget = var_35_1
			})
			var_35_1:addEventHandler("menu_close", function(arg_36_0, arg_36_1)
				local var_36_0 = LUI.FlowManager.GetScopedData(arg_30_0)
				local var_36_1 = {}

				LOOT.SetupSortingBehavior(var_36_1, arg_30_1, LOOT.itemTypes.WEAPON)

				var_36_0.weaponFilterType = var_36_1.weaponFilterType or LOOT.weaponFilterOptions.ALL
				var_36_0.weaponSortingByTitleType = var_36_1.weaponSortingByTitleType or LOOT.weaponSortByTitleOptions.OFF
				var_36_0.weaponSortingByWeaponDataType = var_36_1.weaponSortingByWeaponDataType or LOOT.weaponSortByWeaponDataOptions.NONE
			end)
		end)
	end
end

local function var_0_20(arg_37_0, arg_37_1)
	if Engine.DDJFBBJAIG() then
		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.GunTablePrimary,
			FrontEndScene.ClientWeapons.GunTableSecondary,
			FrontEndScene.ClientWeapons.Watch
		})

		local var_37_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
			enableSway = true,
			controllerIndex = arg_37_1
		})

		var_37_0:SetSwayValues(2000, 0.1, 0.1)

		arg_37_0.FrontendCameraMover = var_37_0

		arg_37_0:addElement(var_37_0)
	end
end

local function var_0_21(arg_38_0)
	local var_38_0 = LUI.FlowManager.GetScopedData(arg_38_0)
	local var_38_1 = {}

	LOOT.SetupSortingBehavior(var_38_1, arg_38_0._controllerIndex, LOOT.itemTypes.WEAPON)

	var_38_0.weaponFilterType = var_38_1.weaponFilterType or LOOT.weaponFilterOptions.ALL
	var_38_0.weaponSortingByTitleType = var_38_1.weaponSortingByTitleType or LOOT.weaponSortByTitleOptions.OFF
	var_38_0.weaponSortingByWeaponDataType = var_38_1.weaponSortingByWeaponDataType or LOOT.weaponSortByWeaponDataOptions.NONE

	ACTIONS.AnimateSequence(arg_38_0.WZWipSortPrompt, "WZWipWeaponSelectSortPromptSetup")
end

local function var_0_22(arg_39_0, arg_39_1, arg_39_2)
	if arg_39_2.streamedImageTable and #arg_39_2.streamedImageTable > 0 then
		DYN_ATTACHMENT.SetupWidgetStreamer(arg_39_0, arg_39_2.streamedImageTable)
	end

	var_0_20(arg_39_0, arg_39_1)

	if Engine.DDJFBBJAIG() then
		MenuUtils.SetupSceneChangeCallback(arg_39_0, function()
			local var_40_0 = WATCH.GetEquippedWatch(arg_39_1)
			local var_40_1 = WEAPON.GetWeaponModel(arg_39_1, FrontEndScene.ClientWeapons.Watch, CSV.weaponOffsets.watchFile)

			arg_39_0:addElement(var_40_1)
			WATCH.SetWatchModelIfLoaded(arg_39_0, arg_39_1, var_40_1, var_40_0)
		end)
	end

	assert(arg_39_0.Tabs)
	assert(arg_39_0.WeaponsGrid)
	assert(arg_39_0.InfoPanel)
	assert(arg_39_0.WeaponAttributes)
	assert(arg_39_0.bindButton)

	arg_39_0._controllerIndex = arg_39_1
	arg_39_0.UpdateTabBreadcrumb = var_0_0

	if IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_39_0, "CHT")
	end

	if Engine.DDJFBBJAIG() then
		ACTIONS.AnimateSequence(arg_39_0, "Frontend")
	elseif CONDITIONS.IsSplitscreen(arg_39_0) and CONDITIONS.InGame(arg_39_0) then
		ACTIONS.AnimateSequence(arg_39_0, "SplitScreen")
	else
		ACTIONS.AnimateSequence(arg_39_0, "InGame")
	end

	arg_39_0.InfoPanel:SetupPanel(arg_39_0.InfoPanel:GetCurrentAnchorsAndPositions())

	if (arg_39_0.BundleUpsellButton or CONDITIONS.IsBlueprintStoreEnabled()) and Engine.DDJFBBJAIG() then
		local var_39_0 = LUI.FlowManager.GetScopedData(arg_39_0)

		var_39_0.bundleVariants = WEAPON.GetPriorityVariants(arg_39_1, {
			excludeOwned = true,
			useBaseRefKeys = true
		})
		var_39_0.bundleVariants = WEAPON.GetAllVariantsInStore(arg_39_1, {
			excludeOwned = true,
			useBaseRefKeys = true,
			variantsTable = var_39_0.bundleVariants
		})
	end

	if Engine.BHICADFIHA() then
		if not arg_39_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for WeaponSelect menu. Only OK after a MyChanges.")

			arg_39_2.loadoutIndex = 0
		end

		if not arg_39_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for WeaponSelect menu. Only OK after a MyChanges.")

			arg_39_2.weaponSlot = 0
		end
	end

	assert(arg_39_2.loadoutIndex)
	assert(arg_39_2.weaponSlot)
	arg_39_0.MenuTitle:SetTitle(arg_39_2.weaponSlot == 0 and Engine.CBBHFCGDIC("LUA_MENU/PRIMARY_WEAPON_SELECT") or Engine.CBBHFCGDIC("LUA_MENU/SECONDARY_WEAPON_SELECT"))
	var_0_19(arg_39_0, arg_39_1, arg_39_2)

	arg_39_0.loadoutIndex = arg_39_2.loadoutIndex
	arg_39_0.weaponSlot = arg_39_2.weaponSlot
	arg_39_0.blueprintsByWeapon = WEAPON.GetModificationsByWeaponWithBaseWeapon(arg_39_1)

	local var_39_1 = PlayerData.BFFBGAJGD(arg_39_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_39_0.loadoutIndex]

	arg_39_0._loadoutPlayerData = var_39_1
	arg_39_0.equippedWeapon = var_39_1.weaponSetups[arg_39_0.weaponSlot].weapon:get()

	local var_39_2 = var_39_1.loadoutPerks[0]:get()
	local var_39_3 = var_39_1.loadoutPerks[1]:get()
	local var_39_4 = var_39_1.loadoutPerks[2]:get()
	local var_39_5 = PERK.IsPerkOverkill(var_39_2) or PERK.IsPerkOverkill(var_39_3) or PERK.IsPerkOverkill(var_39_4)
	local var_39_6 = arg_39_0.weaponSlot == WEAPON.SecondarySlot and var_39_5 and WEAPON.PrimarySlot or arg_39_0.weaponSlot

	if Engine.DDJFBBJAIG() then
		var_0_6(arg_39_0, arg_39_0.equippedWeapon)

		local var_39_7 = WEAPON.GetWeaponModel(arg_39_1, arg_39_2.weaponSlot)

		arg_39_0:addElement(var_39_7)

		arg_39_0.weaponModel = var_39_7

		local var_39_8 = 1 - arg_39_0.weaponSlot
		local var_39_9 = var_39_1.weaponSetups[var_39_8]

		arg_39_0._otherSelectedModel = WEAPON.GetWeaponModelNameFromPlayerData(var_39_9.weapon:get(), var_39_9, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_39_1
		})

		local var_39_10 = WATCH.GetEquippedWatch(arg_39_1)

		arg_39_0._equippedWatchModel = WATCH.GetFullModelName(var_39_10)
	end

	local var_39_11 = BATTLEPASS.GetLootTierMap()
	local var_39_12 = CONDITIONS.IsSeasonalEventActive()
	local var_39_13

	if var_39_12 then
		var_39_13 = SEASONAL_EVENT.GetChallengesData(arg_39_1).miscChallengesData
	end

	arg_39_0._weaponTable = {}

	local var_39_14 = {}

	for iter_39_0 = 0, StringTable.BFHCAIIDA(CSV.weapons.file) do
		local var_39_15 = CSV.ReadRow(CSV.weapons, iter_39_0)
		local var_39_16 = tonumber(var_39_15.displayOrder) and tonumber(var_39_15.displayOrder) >= 0
		local var_39_17 = Engine.BHICADFIHA() or #var_39_15.UIShowDvar == 0 or Dvar.IBEGCHEFE(var_39_15.UIShowDvar)

		if var_39_16 and var_39_17 then
			local var_39_18 = MatchRules.CADFFHGJAE(var_39_15.ref)

			if not CONDITIONS.InGame() or not var_39_18 then
				if not arg_39_0._weaponTable[var_39_15.menuClass] then
					arg_39_0._weaponTable[var_39_15.menuClass] = {}
				end

				var_39_15.isUnlocked = PROGRESSION.IsUnlocked(arg_39_1, LOOT.itemTypes.WEAPON, var_39_15.ref)

				local var_39_19 = not var_39_15.isUnlocked and var_39_15.hiddenWhenLocked == "1"
				local var_39_20 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, var_39_15.ref)
				local var_39_21 = not LOOT.IsItemRefEquippableForMode(LOOT.itemTypes.WEAPON, var_39_15.ref)
				local var_39_22 = var_39_19 or var_39_21

				if not var_39_15.isUnlocked then
					local var_39_23 = var_39_11 and var_39_11[var_39_20] or nil
					local var_39_24 = false

					if var_39_12 and var_39_13 then
						for iter_39_1, iter_39_2 in ipairs(var_39_13) do
							if tonumber(iter_39_2.lootID) == var_39_20 then
								var_39_24 = true

								break
							end
						end
					end

					if var_39_23 then
						var_39_15.unlockCriteria = Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_INCOMPLETE_WITH_BATTLEPASS", var_39_23)
					elseif var_39_24 then
						var_39_15.unlockCriteria = Engine.CBBHFCGDIC("SEASONAL_EVENT/COMPLETE_ALL_GAME_CHALLENGES", #var_39_13 / 2 - 1, Engine.CBBHFCGDIC("SEASONAL_EVENT/SEASONAL_EVENT_TITLE"))
						var_39_15.unlockThroughSeasonalEvent = true
					else
						var_39_15.unlockCriteria = PROGRESSION.GetUnlockText(arg_39_1, LOOT.itemTypes.WEAPON, var_39_15.ref)
					end
				end

				if not var_39_22 then
					if CONDITIONS.UsingWZLoadouts() then
						var_39_15.lootID = var_39_20
						var_39_15.gameSourceID = LOOT.GetGameSourceIDFromItemID(var_39_20)
					end

					var_39_15.isRestricted = var_39_18

					if var_39_18 then
						if not var_39_14[var_39_15.menuClass] then
							var_39_14[var_39_15.menuClass] = {}
						end

						table.insert(var_39_14[var_39_15.menuClass], var_39_15)
					else
						table.insert(arg_39_0._weaponTable[var_39_15.menuClass], var_39_15)
					end
				end
			end
		end
	end

	for iter_39_3, iter_39_4 in pairs(arg_39_0._weaponTable) do
		table.sort(iter_39_4, function(arg_41_0, arg_41_1)
			return tonumber(arg_41_0.displayOrder) < tonumber(arg_41_1.displayOrder)
		end)
	end

	for iter_39_5, iter_39_6 in pairs(var_39_14) do
		table.sort(iter_39_6, function(arg_42_0, arg_42_1)
			return tonumber(arg_42_0.displayOrder) < tonumber(arg_42_1.displayOrder)
		end)
	end

	for iter_39_7, iter_39_8 in pairs(var_39_14) do
		for iter_39_9, iter_39_10 in pairs(iter_39_8) do
			table.insert(arg_39_0._weaponTable[iter_39_7], iter_39_10)
		end
	end

	arg_39_0.WeaponsGrid:SetRefreshChild(function(arg_43_0, arg_43_1, arg_43_2)
		var_0_13(arg_39_0, arg_39_1, arg_43_0, arg_39_0._currentWeapons[arg_43_2 + 1], arg_43_2 + 1, var_39_1)
	end)

	if not CONDITIONS.InGame() and CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_39_0, "WZWipSetup")
		LAYOUT.SetupScalingBackgroundVignette(arg_39_0, {
			customAnimState = "ShowWeaponOverlay",
			customVignette = arg_39_0.WZVignette
		})
	end

	if CONDITIONS.UsingWZLoadouts() then
		var_0_21(arg_39_0)
		ACTIONS.AnimateSequence(arg_39_0.InfoPanel, "WZWipWeaponSelectSetup")

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_39_0.InfoPanel, "WZAR")
		else
			arg_39_0.InfoPanel.NewItemNotification:SetupLeftAlignment()
		end
	end

	local var_39_25 = {}

	for iter_39_11 = 0, StringTable.BFHCAIIDA(CSV.weaponClasses.file) do
		local var_39_26 = CSV.ReadRow(CSV.weaponClasses, iter_39_11)

		if var_39_26.showInMenus == "1" and tonumber(var_39_26.slot) == var_39_6 + 1 and arg_39_0._weaponTable[var_39_26.ref] and not (var_39_26.isWZOnly == "1" and not CONDITIONS.UsingWZLoadouts()) then
			local var_39_27 = MatchRules.DEJJEDIGDE(var_39_26.ref)

			if not CONDITIONS.InGame() or not var_39_27 then
				local var_39_28 = {
					classRef = var_39_26.ref,
					name = Engine.CBBHFCGDIC(var_39_26.pluralName),
					focusFunction = function(arg_44_0, arg_44_1, arg_44_2)
						arg_39_0._lastTabIndex = arg_39_0._currentTabIndex
						arg_39_0._currentTabIndex = arg_44_2 + 1

						if not arg_39_0._lastTabIndex then
							arg_39_0._lastTabIndex = arg_39_0._currentTabIndex
						end

						if CONDITIONS.UsingWZLoadouts() then
							var_0_18(arg_39_0, arg_44_1)

							if arg_39_0._currentWeapons == nil or #arg_39_0._currentWeapons == 0 then
								LUI.FlowManager.GetScopedData(arg_39_0).weaponFilterType = LOOT.weaponFilterOptions.ALL

								var_0_18(arg_39_0, arg_44_1)
							end

							var_0_14(arg_39_0, arg_44_1, iter_39_11 + 1, var_39_1, arg_39_0._currentWeapons)
						else
							var_0_14(arg_39_0, arg_44_1, iter_39_11 + 1, var_39_1, arg_39_0._weaponTable[var_39_26.ref])
						end
					end,
					weaponData = arg_39_0._weaponTable[var_39_26.ref]
				}

				if var_39_26.ref == WEAPON.GetWeaponClass(arg_39_0.equippedWeapon) then
					var_39_28.hasDefaultFocus = true
				end

				table.insert(var_39_25, var_39_28)
			end
		end
	end

	arg_39_0.tabsData = var_39_25

	arg_39_0.Tabs:SetTabs(var_39_25)
	arg_39_0.Tabs:SetAlignment(LUI.Alignment.Left)

	for iter_39_12 = 1, #var_39_25 do
		arg_39_0:UpdateTabBreadcrumb(iter_39_12)
	end

	local function var_39_29(arg_45_0, arg_45_1)
		if Engine.DDJFBBJAIG() then
			if LUI.IsLastInputKeyboardMouse(arg_45_1.controllerIndex) then
				arg_45_0.InfoPanel.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/TO_GUNSMITH_PROMPT"), 0)
			else
				arg_45_0.InfoPanel.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/TO_GUNSMITH_PROMPT"), 0)
			end

			if CONDITIONS.UsingWZLoadouts() then
				var_0_15(arg_45_0, arg_45_1.controllerIndex)
			end
		end
	end

	arg_39_0:addAndCallEventHandler("update_input_type", var_39_29, {
		controllerIndex = arg_39_1
	})

	if CONDITIONS.InGame() and not CONDITIONS.IsThirdGameMode() then
		arg_39_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = 5,
			ignoreTooltip = false,
			side = "left",
			kbmTooltipPromptOverload = "button_dismiss_pause_menu",
			button_ref = "button_start",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
		})
		arg_39_0.bindButton:addEventHandler("button_start", function(arg_46_0, arg_46_1)
			LUI.FlowManager.RequestCloseAllMenus()
		end)
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_39_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_39_0, arg_39_1)

	if arg_39_0.InGameMenuBackground then
		ACTIONS.ScaleFullscreen(arg_39_0.InGameMenuBackground)
	end

	if CONDITIONS.InGame() then
		ACTIONS.ScaleFullscreen(arg_39_0.Vignette)
	end

	if arg_39_0.BundleUpsellButton then
		arg_39_0.BundleUpsellButton:SetUpsellMenu("WeaponSelect")
	end
end

function WeaponSelect(arg_47_0, arg_47_1)
	local var_47_0 = LUI.UIElement.new()

	var_47_0.id = "WeaponSelect"
	var_47_0._animationSets = var_47_0._animationSets or {}
	var_47_0._sequences = var_47_0._sequences or {}

	local var_47_1 = arg_47_1 and arg_47_1.controllerIndex

	if not var_47_1 and not Engine.DDJFBBJAIG() then
		var_47_1 = var_47_0:getRootController()
	end

	assert(var_47_1)

	var_47_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_47_1
	})
	var_47_0.HelperBar.id = "HelperBar"

	var_47_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_47_0.HelperBar:setPriority(10)
	var_47_0:addElement(var_47_0.HelperBar)

	local var_47_2 = var_47_0
	local var_47_3

	if CONDITIONS.InGame() then
		local var_47_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_47_1
		})

		var_47_4.id = "InGameMenuBackground"

		var_47_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_47_0:addElement(var_47_4)

		var_47_0.InGameMenuBackground = var_47_4
	end

	local var_47_5

	if CONDITIONS.UsingWZLoadouts() then
		local var_47_6 = MenuBuilder.BuildRegisteredType("WZSnipeBackgroundSceneOverlay", {
			controllerIndex = var_47_1
		})

		var_47_6.id = "WZWipSnipeBackgroundSceneOverlay"

		var_47_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_47_0:addElement(var_47_6)

		var_47_0.WZWipSnipeBackgroundSceneOverlay = var_47_6
	end

	local var_47_7
	local var_47_8 = LUI.UIImage.new()

	var_47_8.id = "Vignette"

	var_47_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_47_8:SetAlpha(0.5, 0)
	var_47_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_47_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -185, _1080p * -1058, 0, 0)
	var_47_0:addElement(var_47_8)

	var_47_0.Vignette = var_47_8

	local var_47_9

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_47_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
			controllerIndex = var_47_1
		})
		var_47_9.id = "WZVignette"

		var_47_9:SetAlpha(0, 0)
		var_47_9:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
		var_47_0:addElement(var_47_9)

		var_47_0.WZVignette = var_47_9
	end

	local var_47_10
	local var_47_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_47_1
	})

	var_47_11.id = "TabBacker"

	var_47_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_47_0:addElement(var_47_11)

	var_47_0.TabBacker = var_47_11

	local var_47_12
	local var_47_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_47_1
	})

	var_47_13.id = "MenuTitle"

	var_47_13.MenuTitle:setText("", 0)
	var_47_13.Line:SetLeft(0, 0)
	var_47_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_47_0:addElement(var_47_13)

	var_47_0.MenuTitle = var_47_13

	local var_47_14
	local var_47_15 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		maxVisibleRows = SubtractForSplitscreen(4, 2),
		controllerIndex = var_47_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WeaponButtonGroup", {
				controllerIndex = var_47_1
			})
		end,
		refreshChild = function(arg_49_0, arg_49_1, arg_49_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 532,
		rowHeight = _1080p * 162,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_47_16 = LUI.UIGrid.new(var_47_15)

	var_47_16.id = "WeaponsGrid"

	var_47_16:setUseStencil(true)
	var_47_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -838, _1080p * -312, _1080p * 213, _1080p * 898)
	var_47_0:addElement(var_47_16)

	var_47_0.WeaponsGrid = var_47_16

	local var_47_17
	local var_47_18 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_47_1
	})

	var_47_18.id = "WeaponAttributes"

	var_47_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 720, _1080p * 1154, _1080p * -261, _1080p * -101)
	var_47_0:addElement(var_47_18)

	var_47_0.WeaponAttributes = var_47_18

	local var_47_19

	if not Engine.DDJFBBJAIG() then
		var_47_19 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_47_1
		})
		var_47_19.id = "InGameMenuTimerStatus"

		var_47_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 820, _1080p * 1220, _1080p * 54, _1080p * 104)
		var_47_0:addElement(var_47_19)

		var_47_0.InGameMenuTimerStatus = var_47_19
	end

	local var_47_20

	if CONDITIONS.InFrontendPublicMP() then
		local var_47_21 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_47_1
		})

		var_47_21.id = "MPPlayerDetails"

		var_47_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_47_0:addElement(var_47_21)

		var_47_0.MPPlayerDetails = var_47_21
	end

	local var_47_22
	local var_47_23 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_47_1
	})

	var_47_23.id = "VWeaponScrollbar"

	var_47_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 108, _1080p * 216, _1080p * 891)
	var_47_0:addElement(var_47_23)

	var_47_0.VWeaponScrollbar = var_47_23

	local var_47_24
	local var_47_25 = MenuBuilder.BuildRegisteredType("PerkInfoPanel", {
		controllerIndex = var_47_1
	})

	var_47_25.id = "InfoPanel"

	if CONDITIONS.InFrontendOrWaveMode() then
		var_47_25.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/TO_GUNSMITH_PROMPT"), 0)
	end

	if CONDITIONS.InFrontendOrWaveMode() then
		var_47_25.SecondActionPrompt:setText(Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON_PROMPT"), 0)
	end

	var_47_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 720, _1080p * 1246, _1080p * 216, _1080p * 306)
	var_47_0:addElement(var_47_25)

	var_47_0.InfoPanel = var_47_25

	local var_47_26
	local var_47_27 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_47_1
			})
		end,
		controllerIndex = var_47_1
	}
	local var_47_28 = LUI.TabManager.new(var_47_27)

	var_47_28.id = "Tabs"

	var_47_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 996, _1080p * 108, _1080p * 160)
	var_47_0:addElement(var_47_28)

	var_47_0.Tabs = var_47_28

	local var_47_29
	local var_47_30 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_47_1
	})

	var_47_30.id = "ArrowUp"

	var_47_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -743, _1080p * -711, _1080p * 898, _1080p * 930)
	var_47_0:addElement(var_47_30)

	var_47_0.ArrowUp = var_47_30

	local var_47_31
	local var_47_32 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_47_1
	})

	var_47_32.id = "ArrowDown"

	var_47_32.Arrow:SetZRotation(180, 0)
	var_47_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -575, _1080p * -543, _1080p * 898, _1080p * 930)
	var_47_0:addElement(var_47_32)

	var_47_0.ArrowDown = var_47_32

	local var_47_33
	local var_47_34 = LUI.UIText.new()

	var_47_34.id = "ListCount"

	var_47_34:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_47_34:setText("", 0)
	var_47_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_47_34:SetAlignment(LUI.Alignment.Center)
	var_47_34:SetVerticalAlignment(LUI.Alignment.Center)
	var_47_34:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -711, _1080p * -575, _1080p * 905, _1080p * 925)
	var_47_0:addElement(var_47_34)

	var_47_0.ListCount = var_47_34

	local var_47_35

	if CONDITIONS.InFrontend() then
		local var_47_36 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_47_1
		})

		var_47_36.id = "LobbyMembersFooter"

		var_47_36:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_47_0:addElement(var_47_36)

		var_47_0.LobbyMembersFooter = var_47_36
	end

	local var_47_37
	local var_47_38 = LUI.UIStyledText.new()

	var_47_38.id = "ComparisonString"

	var_47_38:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_47_38:setText("", 0)
	var_47_38:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_47_38:SetAlignment(LUI.Alignment.Left)
	var_47_38:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 753, _1080p * 1135, _1080p * -284, _1080p * -267)
	var_47_0:addElement(var_47_38)

	var_47_0.ComparisonString = var_47_38

	local var_47_39

	if Engine.DDJFBBJAIG() then
		local var_47_40 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_47_1
		})

		var_47_40.id = "CDLRestrictionTag"

		var_47_40.CDLInfo:SetAlpha(1, 0)
		var_47_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 124, _1080p * 154)
		var_47_0:addElement(var_47_40)

		var_47_0.CDLRestrictionTag = var_47_40
	end

	local var_47_41

	if Engine.DDJFBBJAIG() then
		var_47_41 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
			controllerIndex = var_47_1
		})
		var_47_41.id = "BundleUpsellButton"

		var_47_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1340, _1080p * 1790, _1080p * 775, _1080p * 979)
		var_47_0:addElement(var_47_41)

		var_47_0.BundleUpsellButton = var_47_41
	end

	local var_47_42

	if CONDITIONS.InFrontendPublic() then
		local var_47_43 = MenuBuilder.BuildRegisteredType("WeaponMasterSummary", {
			controllerIndex = var_47_1
		})

		var_47_43.id = "MasterChallenges"

		var_47_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1272, _1080p * 1824, _1080p * 216, _1080p * 396)
		var_47_0:addElement(var_47_43)

		var_47_0.MasterChallenges = var_47_43
	end

	local var_47_44

	if CONDITIONS.UsingWZLoadouts() then
		local var_47_45 = MenuBuilder.BuildRegisteredType("SortPrompt", {
			controllerIndex = var_47_1
		})

		var_47_45.id = "WZWipSortPrompt"

		var_47_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 260, _1080p * 170, _1080p * 194)
		var_47_0:addElement(var_47_45)

		var_47_0.WZWipSortPrompt = var_47_45
	end

	local function var_47_46()
		return
	end

	var_47_0._sequences.DefaultSequence = var_47_46

	local var_47_47
	local var_47_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 654
		}
	}

	var_47_16:RegisterAnimationSequence("Frontend", var_47_48)

	local var_47_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 720
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1154
		}
	}

	var_47_18:RegisterAnimationSequence("Frontend", var_47_49)

	local var_47_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 720
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1246
		}
	}

	var_47_25:RegisterAnimationSequence("Frontend", var_47_50)

	local function var_47_51()
		var_47_16:AnimateSequence("Frontend")
		var_47_18:AnimateSequence("Frontend")
		var_47_25:AnimateSequence("Frontend")
	end

	var_47_0._sequences.Frontend = var_47_51

	local var_47_52
	local var_47_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -843
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -274
		}
	}

	var_47_16:RegisterAnimationSequence("InGame", var_47_53)

	local var_47_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -764
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -732
		}
	}

	var_47_30:RegisterAnimationSequence("InGame", var_47_54)

	local var_47_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -596
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -564
		}
	}

	var_47_32:RegisterAnimationSequence("InGame", var_47_55)

	local var_47_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -732
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -596
		}
	}

	var_47_34:RegisterAnimationSequence("InGame", var_47_56)

	local function var_47_57()
		var_47_16:AnimateSequence("InGame")
		var_47_30:AnimateSequence("InGame")
		var_47_32:AnimateSequence("InGame")
		var_47_34:AnimateSequence("InGame")
	end

	var_47_0._sequences.InGame = var_47_57

	local var_47_58
	local var_47_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 898
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 928
		}
	}

	var_47_34:RegisterAnimationSequence("CountArabic", var_47_59)

	local function var_47_60()
		var_47_34:AnimateSequence("CountArabic")
	end

	var_47_0._sequences.CountArabic = var_47_60

	local var_47_61
	local var_47_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 556
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -843
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -315
		}
	}

	var_47_16:RegisterAnimationSequence("SplitScreen", var_47_62)

	local var_47_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 720
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1246
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 540
		}
	}

	var_47_18:RegisterAnimationSequence("SplitScreen", var_47_63)

	if not Engine.DDJFBBJAIG() then
		local var_47_64 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 760
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1160
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 34
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 84
			}
		}

		var_47_19:RegisterAnimationSequence("SplitScreen", var_47_64)
	end

	local var_47_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 499
		}
	}

	var_47_23:RegisterAnimationSequence("SplitScreen", var_47_65)

	local var_47_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 720
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1246
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 262
		}
	}

	var_47_25:RegisterAnimationSequence("SplitScreen", var_47_66)

	local var_47_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 529
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 561
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -754
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -722
		}
	}

	var_47_30:RegisterAnimationSequence("SplitScreen", var_47_67)

	local var_47_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 529
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 561
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -586
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -554
		}
	}

	var_47_32:RegisterAnimationSequence("SplitScreen", var_47_68)

	local var_47_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 536
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 556
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -722
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -586
		}
	}

	var_47_34:RegisterAnimationSequence("SplitScreen", var_47_69)

	local function var_47_70()
		var_47_16:AnimateSequence("SplitScreen")
		var_47_18:AnimateSequence("SplitScreen")

		if not Engine.DDJFBBJAIG() then
			var_47_19:AnimateSequence("SplitScreen")
		end

		var_47_23:AnimateSequence("SplitScreen")
		var_47_25:AnimateSequence("SplitScreen")
		var_47_30:AnimateSequence("SplitScreen")
		var_47_32:AnimateSequence("SplitScreen")
		var_47_34:AnimateSequence("SplitScreen")
	end

	var_47_0._sequences.SplitScreen = var_47_70

	local var_47_71
	local var_47_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -304
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -286
		}
	}

	var_47_38:RegisterAnimationSequence("CHT", var_47_72)

	local function var_47_73()
		var_47_38:AnimateSequence("CHT")
	end

	var_47_0._sequences.CHT = var_47_73

	local var_47_74
	local var_47_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_47_8:RegisterAnimationSequence("WZWipSetup", var_47_75)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_47_76 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_47_9:RegisterAnimationSequence("WZWipSetup", var_47_76)
	end

	local function var_47_77()
		var_47_8:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_47_9:AnimateSequence("WZWipSetup")
		end
	end

	var_47_0._sequences.WZWipSetup = var_47_77

	if Engine.DDJFBBJAIG() then
		var_47_41:addEventHandler("button_over", function(arg_58_0, arg_58_1)
			if not arg_58_1.controller then
				local var_58_0 = var_47_1
			end

			ACTIONS.AnimateSequenceByElement(var_47_0, {
				elementPath = "self.BundleUpsellButton",
				sequenceName = "ButtonOver",
				elementName = "BundleUpsellButton"
			})
		end)
		var_47_41:addEventHandler("button_up", function(arg_59_0, arg_59_1)
			if not arg_59_1.controller then
				local var_59_0 = var_47_1
			end

			ACTIONS.AnimateSequenceByElement(var_47_0, {
				elementPath = "self.BundleUpsellButton",
				sequenceName = "ButtonUp",
				elementName = "BundleUpsellButton"
			})
		end)
	end

	local var_47_78 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_47_23,
		startCap = var_47_23.startCap,
		endCap = var_47_23.endCap,
		sliderArea = var_47_23.sliderArea,
		slider = var_47_23.sliderArea and var_47_23.sliderArea.slider,
		fixedSizeSlider = var_47_23.sliderArea and var_47_23.sliderArea.fixedSizeSlider
	})

	var_47_16:AddScrollbar(var_47_78)
	var_47_16:AddArrow(var_47_30)
	var_47_16:AddArrow(var_47_32)
	var_47_16:AddItemNumbers(var_47_34)
	var_47_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_47_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/EQUIP")
	})

	local var_47_79 = LUI.UIBindButton.new()

	var_47_79.id = "selfBindButton"

	var_47_0:addElement(var_47_79)

	var_47_0.bindButton = var_47_79

	var_0_22(var_47_0, var_47_1, arg_47_1)

	if CONDITIONS.IsArabic() then
		ACTIONS.AnimateSequence(var_47_0, "CountArabic")
	end

	return var_47_0
end

MenuBuilder.registerType("WeaponSelect", WeaponSelect)
LockTable(_M)
