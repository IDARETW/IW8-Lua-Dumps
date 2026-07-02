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
		if iter_2_0 > #arg_2_0.currentWeapons then
			iter_2_0 = 1
		elseif iter_2_0 == 0 then
			iter_2_0 = #arg_2_0.currentWeapons
		end

		assert(iter_2_0 > 0 and iter_2_0 <= #arg_2_0.currentWeapons)

		local var_2_3 = arg_2_0.currentWeapons[iter_2_0].ref
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

		if arg_11_1.isAlreadyEquipped then
			var_12_4.isOverkill = true
			var_12_4.unlockText = Engine.CBBHFCGDIC("LUA_MENU/WEAPON_CONFLICT", arg_11_0.weaponSlot == 0 and "LUA_MENU/SECONDARY" or "LUA_MENU/PRIMARY")
			var_12_4.isUnlocked = false
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

	if var_20_5.WeaponLevelBar then
		var_20_5.WeaponLevelBar:Setup(arg_20_1, var_20_5.weaponData.ref)
	end

	var_20_5.WeaponLevel:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_FACTION_LEVEL", PROGRESSION.GetWeaponLevel(arg_20_1, var_20_5.weaponData.ref)))
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
		if arg_20_2.BlueprintButton then
			arg_20_2.BlueprintButton:SetButtonDisabled(true)
			arg_20_2.BlueprintButton:SetMouseFocusBlocker(true)
			arg_20_2.BlueprintButton:SetAlpha(0)
		end

		if arg_20_2.BlueprintStoreButton then
			arg_20_2.BlueprintStoreButton:SetButtonDisabled(true)
			arg_20_2.BlueprintStoreButton:SetMouseFocusBlocker(true)
			arg_20_2.BlueprintStoreButton:SetAlpha(0)
		end

		arg_20_0._isRestricted = arg_20_3.isRestricted

		if arg_20_0._isRestricted then
			ACTIONS.AnimateSequence(var_20_5, "ShowRestriction")
			var_20_5:SetButtonDisabled(true)
		else
			ACTIONS.AnimateSequence(var_20_5, "HideRestriction")
			var_20_5:SetButtonDisabled(false)
		end
	end

	return var_20_5
end

local function var_0_14(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	local var_25_0 = arg_25_0.WeaponsGrid:GetFocusPositionIndex()

	arg_25_0.currentWeapons = arg_25_4
	arg_25_0.WeaponsGrid._shouldFocus = false

	arg_25_0.WeaponsGrid:SetNumChildren(#arg_25_4)
	arg_25_0.WeaponsGrid:RefreshContent()

	local var_25_1 = 0

	for iter_25_0, iter_25_1 in ipairs(arg_25_4) do
		if arg_25_0.equippedWeapon == iter_25_1.ref then
			var_25_1 = iter_25_0 - 1

			break
		end
	end

	local var_25_2 = arg_25_0.WeaponsGrid:GetPositionForIndex(var_25_1, {
		relativePosition = false
	})

	if not LUI.IsLastInputMouseNavigation(arg_25_1) then
		arg_25_0.WeaponsGrid:SetFocusedPosition(var_25_2, true)
	else
		arg_25_0.WeaponsGrid:SetPosition({
			x = var_25_2.x,
			y = var_25_2.y + 1
		}, true)
		Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
	end

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

local function var_0_15(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0.bindButton:addEventHandler("button_secondary", function(arg_27_0, arg_27_1)
		ACTIONS.LeaveMenu(arg_26_0)
	end)
	arg_26_0.bindButton:addEventHandler("button_alt2", function(arg_28_0, arg_28_1)
		local var_28_0 = LUI.FlowManager.GetScopedData(arg_26_0).previousFocusedButton

		if var_0_7(var_28_0) then
			var_0_10(arg_26_0, arg_26_1, var_28_0)
		end
	end)

	if CONDITIONS.InFrontend(arg_26_0) then
		local function var_26_0(arg_29_0, arg_29_1)
			if LUI.IsLastInputGamepad(arg_29_1.controllerIndex) then
				arg_29_0:AddButtonHelperTextToElement(arg_29_0.HelperBar, {
					side = "left",
					button_ref = "button_r3",
					priority = 2,
					helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
				})
				arg_29_0.InfoPanel.SecondActionPrompt:SetAlpha(0)
			else
				arg_29_0:RemoveButtonHelperTextFromElement(arg_29_0.HelperBar, "button_r3", "left")
				arg_29_0.InfoPanel.SecondActionPrompt:SetAlpha(1)
			end
		end

		arg_26_0:addAndCallEventHandler("update_input_type", var_26_0, {
			controllerIndex = arg_26_1
		})
		arg_26_0.bindButton:addEventHandler("button_right_stick", function(arg_30_0, arg_30_1)
			local var_30_0 = arg_30_0:getParent()

			var_0_11(var_30_0, arg_26_1, arg_26_2)
		end)
	end
end

local function var_0_16(arg_31_0, arg_31_1)
	if Engine.DDJFBBJAIG() then
		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.GunTablePrimary,
			FrontEndScene.ClientWeapons.GunTableSecondary,
			FrontEndScene.ClientWeapons.Watch
		})

		local var_31_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
			enableSway = true,
			controllerIndex = arg_31_1
		})

		var_31_0:SetSwayValues(2000, 0.1, 0.1)

		arg_31_0.FrontendCameraMover = var_31_0

		arg_31_0:addElement(var_31_0)
	end
end

local function var_0_17(arg_32_0, arg_32_1, arg_32_2)
	if arg_32_2.streamedImageTable and #arg_32_2.streamedImageTable > 0 then
		DYN_ATTACHMENT.SetupWidgetStreamer(arg_32_0, arg_32_2.streamedImageTable)
	end

	var_0_16(arg_32_0, arg_32_1)

	if Engine.DDJFBBJAIG() then
		MenuUtils.SetupSceneChangeCallback(arg_32_0, function()
			local var_33_0 = WATCH.GetEquippedWatch(arg_32_1)
			local var_33_1 = WEAPON.GetWeaponModel(arg_32_1, FrontEndScene.ClientWeapons.Watch, CSV.weaponOffsets.watchFile)

			arg_32_0:addElement(var_33_1)
			WATCH.SetWatchModelIfLoaded(arg_32_0, arg_32_1, var_33_1, var_33_0)
		end)
	end

	assert(arg_32_0.Tabs)
	assert(arg_32_0.WeaponsGrid)
	assert(arg_32_0.InfoPanel)
	assert(arg_32_0.WeaponAttributes)
	assert(arg_32_0.bindButton)

	arg_32_0._controllerIndex = arg_32_1
	arg_32_0.UpdateTabBreadcrumb = var_0_0

	if IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_32_0, "CHT")
	end

	if Engine.DDJFBBJAIG() then
		ACTIONS.AnimateSequence(arg_32_0, "Frontend")
	elseif CONDITIONS.IsSplitscreen(arg_32_0) and CONDITIONS.InGame(arg_32_0) then
		ACTIONS.AnimateSequence(arg_32_0, "SplitScreen")
	else
		ACTIONS.AnimateSequence(arg_32_0, "InGame")
	end

	arg_32_0.InfoPanel:SetupPanel(arg_32_0.InfoPanel:GetCurrentAnchorsAndPositions())

	if (arg_32_0.BundleUpsellButton or CONDITIONS.IsBlueprintStoreEnabled()) and Engine.DDJFBBJAIG() then
		local var_32_0 = LUI.FlowManager.GetScopedData(arg_32_0)

		var_32_0.bundleVariants = WEAPON.GetPriorityVariants(arg_32_1, {
			excludeOwned = true,
			useBaseRefKeys = true
		})
		var_32_0.bundleVariants = WEAPON.GetAllVariantsInStore(arg_32_1, {
			excludeOwned = true,
			useBaseRefKeys = true,
			variantsTable = var_32_0.bundleVariants
		})
	end

	if Engine.BHICADFIHA() then
		if not arg_32_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for WeaponSelect menu. Only OK after a MyChanges.")

			arg_32_2.loadoutIndex = 0
		end

		if not arg_32_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for WeaponSelect menu. Only OK after a MyChanges.")

			arg_32_2.weaponSlot = 0
		end
	end

	assert(arg_32_2.loadoutIndex)
	assert(arg_32_2.weaponSlot)
	arg_32_0.MenuTitle:SetTitle(arg_32_2.weaponSlot == 0 and Engine.CBBHFCGDIC("LUA_MENU/PRIMARY_WEAPON_SELECT") or Engine.CBBHFCGDIC("LUA_MENU/SECONDARY_WEAPON_SELECT"))
	var_0_15(arg_32_0, arg_32_1, arg_32_2)

	arg_32_0.loadoutIndex = arg_32_2.loadoutIndex
	arg_32_0.weaponSlot = arg_32_2.weaponSlot
	arg_32_0.blueprintsByWeapon = WEAPON.GetModificationsByWeaponWithBaseWeapon(arg_32_1)

	local var_32_1 = PlayerData.BFFBGAJGD(arg_32_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_32_0.loadoutIndex]

	arg_32_0._loadoutPlayerData = var_32_1
	arg_32_0.equippedWeapon = var_32_1.weaponSetups[arg_32_0.weaponSlot].weapon:get()

	local var_32_2 = var_32_1.loadoutPerks[0]:get()
	local var_32_3 = var_32_1.loadoutPerks[1]:get()
	local var_32_4 = var_32_1.loadoutPerks[2]:get()
	local var_32_5 = PERK.IsPerkOverkill(var_32_2) or PERK.IsPerkOverkill(var_32_3) or PERK.IsPerkOverkill(var_32_4)
	local var_32_6 = arg_32_0.weaponSlot == WEAPON.SecondarySlot and var_32_5 and WEAPON.PrimarySlot or arg_32_0.weaponSlot

	if Engine.DDJFBBJAIG() then
		var_0_6(arg_32_0, arg_32_0.equippedWeapon)

		local var_32_7 = WEAPON.GetWeaponModel(arg_32_1, arg_32_2.weaponSlot)

		arg_32_0:addElement(var_32_7)

		arg_32_0.weaponModel = var_32_7

		local var_32_8 = 1 - arg_32_0.weaponSlot
		local var_32_9 = var_32_1.weaponSetups[var_32_8]

		arg_32_0._otherSelectedModel = WEAPON.GetWeaponModelNameFromPlayerData(var_32_9.weapon:get(), var_32_9, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_32_1
		})

		local var_32_10 = WATCH.GetEquippedWatch(arg_32_1)

		arg_32_0._equippedWatchModel = WATCH.GetFullModelName(var_32_10)
	end

	local var_32_11 = CONDITIONS.InGame()
	local var_32_12 = BATTLEPASS.GetLootTierMap()
	local var_32_13 = {}
	local var_32_14 = {}

	for iter_32_0 = 0, StringTable.BFHCAIIDA(CSV.weapons.file) do
		local var_32_15 = CSV.ReadRow(CSV.weapons, iter_32_0)

		if tonumber(var_32_15.displayOrder) and tonumber(var_32_15.displayOrder) >= 0 then
			local var_32_16 = MatchRules.CADFFHGJAE(var_32_15.ref)

			if not var_32_11 or not var_32_16 then
				if not var_32_13[var_32_15.menuClass] then
					var_32_13[var_32_15.menuClass] = {}
				end

				var_32_15.isUnlocked = PROGRESSION.IsUnlocked(arg_32_1, LOOT.itemTypes.WEAPON, var_32_15.ref)

				if not var_32_15.isUnlocked then
					local var_32_17 = var_32_12[LOOT.GetItemID(LOOT.itemTypes.WEAPON, var_32_15.ref)]

					if var_32_17 then
						var_32_15.unlockCriteria = Engine.CBBHFCGDIC("BATTLEPASS/LOCKED_INCOMPLETE_WITH_BATTLEPASS", var_32_17)
					else
						var_32_15.unlockCriteria = PROGRESSION.GetUnlockText(arg_32_1, LOOT.itemTypes.WEAPON, var_32_15.ref)
					end
				end

				var_32_15.isRestricted = var_32_16

				if var_32_16 then
					if not var_32_14[var_32_15.menuClass] then
						var_32_14[var_32_15.menuClass] = {}
					end

					table.insert(var_32_14[var_32_15.menuClass], var_32_15)
				else
					table.insert(var_32_13[var_32_15.menuClass], var_32_15)
				end
			end
		end
	end

	for iter_32_1, iter_32_2 in pairs(var_32_13) do
		table.sort(iter_32_2, function(arg_34_0, arg_34_1)
			return tonumber(arg_34_0.displayOrder) < tonumber(arg_34_1.displayOrder)
		end)
	end

	for iter_32_3, iter_32_4 in pairs(var_32_14) do
		table.sort(iter_32_4, function(arg_35_0, arg_35_1)
			return tonumber(arg_35_0.displayOrder) < tonumber(arg_35_1.displayOrder)
		end)
	end

	for iter_32_5, iter_32_6 in pairs(var_32_14) do
		for iter_32_7, iter_32_8 in pairs(iter_32_6) do
			table.insert(var_32_13[iter_32_5], iter_32_8)
		end
	end

	arg_32_0.WeaponsGrid:SetRefreshChild(function(arg_36_0, arg_36_1, arg_36_2)
		var_0_13(arg_32_0, arg_32_1, arg_36_0, arg_32_0.currentWeapons[arg_36_2 + 1], arg_36_2 + 1, var_32_1)
	end)

	local var_32_18 = {}

	for iter_32_9 = 0, StringTable.BFHCAIIDA(CSV.weaponClasses.file) do
		local var_32_19 = CSV.ReadRow(CSV.weaponClasses, iter_32_9)

		if var_32_19.showInMenus == "1" and tonumber(var_32_19.slot) == var_32_6 + 1 and var_32_13[var_32_19.ref] then
			local var_32_20 = MatchRules.DEJJEDIGDE(var_32_19.ref)

			if not var_32_11 or not var_32_20 then
				local var_32_21 = {
					classRef = var_32_19.ref,
					name = Engine.CBBHFCGDIC(var_32_19.pluralName),
					focusFunction = function(arg_37_0, arg_37_1, arg_37_2)
						arg_32_0._lastTabIndex = arg_32_0._currentTabIndex
						arg_32_0._currentTabIndex = arg_37_2 + 1

						if not arg_32_0._lastTabIndex then
							arg_32_0._lastTabIndex = arg_32_0._currentTabIndex
						end

						var_0_14(arg_32_0, arg_37_1, iter_32_9 + 1, var_32_1, var_32_13[var_32_19.ref])
					end,
					weaponData = var_32_13[var_32_19.ref]
				}

				if var_32_19.ref == WEAPON.GetWeaponClass(arg_32_0.equippedWeapon) then
					var_32_21.hasDefaultFocus = true
				end

				table.insert(var_32_18, var_32_21)
			end
		end
	end

	arg_32_0.tabsData = var_32_18

	arg_32_0.Tabs:SetTabs(var_32_18)
	arg_32_0.Tabs:SetAlignment(LUI.Alignment.Left)

	for iter_32_10 = 1, #var_32_18 do
		arg_32_0:UpdateTabBreadcrumb(iter_32_10)
	end

	local function var_32_22(arg_38_0, arg_38_1)
		if Engine.DDJFBBJAIG() then
			if LUI.IsLastInputKeyboardMouse(arg_38_1.controllerIndex) then
				arg_38_0.InfoPanel.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/TO_GUNSMITH_PROMPT"), 0)
			else
				arg_38_0.InfoPanel.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/TO_GUNSMITH_PROMPT"), 0)
			end
		end
	end

	arg_32_0:addAndCallEventHandler("update_input_type", var_32_22, {
		controllerIndex = arg_32_1
	})

	if CONDITIONS.InGame() and not CONDITIONS.IsThirdGameMode() then
		arg_32_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = 5,
			ignoreTooltip = false,
			side = "left",
			kbmTooltipPromptOverload = "button_dismiss_pause_menu",
			button_ref = "button_start",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
		})
		arg_32_0.bindButton:addEventHandler("button_start", function(arg_39_0, arg_39_1)
			LUI.FlowManager.RequestCloseAllMenus()
		end)
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_32_0.TabBacker)

	if not arg_32_0.InGameMenuBackground then
		LAYOUT.AddAspectRatioFadeFrame(arg_32_0, arg_32_1)
	end

	if arg_32_0.InGameMenuBackground then
		ACTIONS.ScaleFullscreen(arg_32_0.InGameMenuBackground)
	end

	if CONDITIONS.InGame() then
		ACTIONS.ScaleFullscreen(arg_32_0.Vignette)
	end

	if arg_32_0.BundleUpsellButton then
		arg_32_0.BundleUpsellButton:SetUpsellMenu("WeaponSelect")
	end
end

function WeaponSelect(arg_40_0, arg_40_1)
	local var_40_0 = LUI.UIElement.new()

	var_40_0.id = "WeaponSelect"
	var_40_0._animationSets = var_40_0._animationSets or {}
	var_40_0._sequences = var_40_0._sequences or {}

	local var_40_1 = arg_40_1 and arg_40_1.controllerIndex

	if not var_40_1 and not Engine.DDJFBBJAIG() then
		var_40_1 = var_40_0:getRootController()
	end

	assert(var_40_1)

	var_40_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_40_1
	})
	var_40_0.HelperBar.id = "HelperBar"

	var_40_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_40_0.HelperBar:setPriority(10)
	var_40_0:addElement(var_40_0.HelperBar)

	local var_40_2 = var_40_0
	local var_40_3

	if CONDITIONS.InGame(var_40_0) then
		local var_40_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_40_1
		})

		var_40_4.id = "InGameMenuBackground"

		var_40_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_40_0:addElement(var_40_4)

		var_40_0.InGameMenuBackground = var_40_4
	end

	local var_40_5
	local var_40_6 = LUI.UIImage.new()

	var_40_6.id = "Vignette"

	var_40_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_40_6:SetAlpha(0.5, 0)
	var_40_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_40_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -185, _1080p * -1058, 0, 0)
	var_40_0:addElement(var_40_6)

	var_40_0.Vignette = var_40_6

	local var_40_7
	local var_40_8 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_40_1
	})

	var_40_8.id = "TabBacker"

	var_40_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_40_0:addElement(var_40_8)

	var_40_0.TabBacker = var_40_8

	local var_40_9
	local var_40_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_40_1
	})

	var_40_10.id = "MenuTitle"

	var_40_10.MenuTitle:setText("", 0)
	var_40_10.Line:SetLeft(0, 0)
	var_40_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_40_0:addElement(var_40_10)

	var_40_0.MenuTitle = var_40_10

	local var_40_11
	local var_40_12 = {
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
		controllerIndex = var_40_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WeaponButtonGroup", {
				controllerIndex = var_40_1
			})
		end,
		refreshChild = function(arg_42_0, arg_42_1, arg_42_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 532,
		rowHeight = _1080p * 162,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_40_13 = LUI.UIGrid.new(var_40_12)

	var_40_13.id = "WeaponsGrid"

	var_40_13:setUseStencil(true)
	var_40_13:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -838, _1080p * -312, _1080p * 213, _1080p * 898)
	var_40_0:addElement(var_40_13)

	var_40_0.WeaponsGrid = var_40_13

	local var_40_14
	local var_40_15 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_40_1
	})

	var_40_15.id = "WeaponAttributes"

	var_40_15:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 720, _1080p * 1154, _1080p * -261, _1080p * -101)
	var_40_0:addElement(var_40_15)

	var_40_0.WeaponAttributes = var_40_15

	local var_40_16

	if not Engine.DDJFBBJAIG() then
		var_40_16 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_40_1
		})
		var_40_16.id = "InGameMenuTimerStatus"

		var_40_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 820, _1080p * 1220, _1080p * 54, _1080p * 104)
		var_40_0:addElement(var_40_16)

		var_40_0.InGameMenuTimerStatus = var_40_16
	end

	local var_40_17

	if CONDITIONS.InFrontendPublicMP(var_40_0) then
		local var_40_18 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_40_1
		})

		var_40_18.id = "MPPlayerDetails"

		var_40_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_40_0:addElement(var_40_18)

		var_40_0.MPPlayerDetails = var_40_18
	end

	local var_40_19
	local var_40_20 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_40_1
	})

	var_40_20.id = "VWeaponScrollbar"

	var_40_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 108, _1080p * 216, _1080p * 891)
	var_40_0:addElement(var_40_20)

	var_40_0.VWeaponScrollbar = var_40_20

	local var_40_21
	local var_40_22 = MenuBuilder.BuildRegisteredType("PerkInfoPanel", {
		controllerIndex = var_40_1
	})

	var_40_22.id = "InfoPanel"

	if CONDITIONS.InFrontendOrWaveMode(var_40_0) then
		var_40_22.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/TO_GUNSMITH_PROMPT"), 0)
	end

	if CONDITIONS.InFrontendOrWaveMode(var_40_0) then
		var_40_22.SecondActionPrompt:setText(Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON_PROMPT"), 0)
	end

	var_40_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 720, _1080p * 1246, _1080p * 216, _1080p * 306)
	var_40_0:addElement(var_40_22)

	var_40_0.InfoPanel = var_40_22

	local var_40_23
	local var_40_24 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_40_1
			})
		end,
		controllerIndex = var_40_1
	}
	local var_40_25 = LUI.TabManager.new(var_40_24)

	var_40_25.id = "Tabs"

	var_40_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 996, _1080p * 108, _1080p * 160)
	var_40_0:addElement(var_40_25)

	var_40_0.Tabs = var_40_25

	local var_40_26
	local var_40_27 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_40_1
	})

	var_40_27.id = "ArrowUp"

	var_40_27:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -743, _1080p * -711, _1080p * 898, _1080p * 930)
	var_40_0:addElement(var_40_27)

	var_40_0.ArrowUp = var_40_27

	local var_40_28
	local var_40_29 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_40_1
	})

	var_40_29.id = "ArrowDown"

	var_40_29.Arrow:SetZRotation(180, 0)
	var_40_29:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -575, _1080p * -543, _1080p * 898, _1080p * 930)
	var_40_0:addElement(var_40_29)

	var_40_0.ArrowDown = var_40_29

	local var_40_30
	local var_40_31 = LUI.UIText.new()

	var_40_31.id = "ListCount"

	var_40_31:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_40_31:setText("", 0)
	var_40_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_40_31:SetAlignment(LUI.Alignment.Center)
	var_40_31:SetVerticalAlignment(LUI.Alignment.Center)
	var_40_31:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -711, _1080p * -575, _1080p * 905, _1080p * 925)
	var_40_0:addElement(var_40_31)

	var_40_0.ListCount = var_40_31

	local var_40_32

	if CONDITIONS.InFrontend(var_40_0) then
		local var_40_33 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_40_1
		})

		var_40_33.id = "LobbyMembersFooter"

		var_40_33:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_40_0:addElement(var_40_33)

		var_40_0.LobbyMembersFooter = var_40_33
	end

	local var_40_34
	local var_40_35 = LUI.UIStyledText.new()

	var_40_35.id = "ComparisonString"

	var_40_35:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_40_35:setText("", 0)
	var_40_35:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_40_35:SetAlignment(LUI.Alignment.Left)
	var_40_35:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 753, _1080p * 1135, _1080p * -284, _1080p * -267)
	var_40_0:addElement(var_40_35)

	var_40_0.ComparisonString = var_40_35

	local var_40_36

	if Engine.DDJFBBJAIG() then
		local var_40_37 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_40_1
		})

		var_40_37.id = "CDLRestrictionTag"

		var_40_37.CDLInfo:SetAlpha(1, 0)
		var_40_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
		var_40_0:addElement(var_40_37)

		var_40_0.CDLRestrictionTag = var_40_37
	end

	local var_40_38

	if Engine.DDJFBBJAIG() then
		local var_40_39 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
			controllerIndex = var_40_1
		})

		var_40_39.id = "BundleUpsellButton"

		var_40_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1340, _1080p * 1790, _1080p * 775, _1080p * 979)
		var_40_0:addElement(var_40_39)

		var_40_0.BundleUpsellButton = var_40_39
	end

	local var_40_40

	if CONDITIONS.InFrontendPublic(var_40_0) then
		local var_40_41 = MenuBuilder.BuildRegisteredType("WeaponMasterSummary", {
			controllerIndex = var_40_1
		})

		var_40_41.id = "MasterChallenges"

		var_40_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1290, _1080p * 1790, _1080p * 216, _1080p * 396)
		var_40_0:addElement(var_40_41)

		var_40_0.MasterChallenges = var_40_41
	end

	local function var_40_42()
		return
	end

	var_40_0._sequences.DefaultSequence = var_40_42

	local var_40_43
	local var_40_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 654
		}
	}

	var_40_13:RegisterAnimationSequence("Frontend", var_40_44)

	local var_40_45 = {
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

	var_40_15:RegisterAnimationSequence("Frontend", var_40_45)

	local var_40_46 = {
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

	var_40_22:RegisterAnimationSequence("Frontend", var_40_46)

	local function var_40_47()
		var_40_13:AnimateSequence("Frontend")
		var_40_15:AnimateSequence("Frontend")
		var_40_22:AnimateSequence("Frontend")
	end

	var_40_0._sequences.Frontend = var_40_47

	local var_40_48
	local var_40_49 = {
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

	var_40_13:RegisterAnimationSequence("InGame", var_40_49)

	local var_40_50 = {
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

	var_40_27:RegisterAnimationSequence("InGame", var_40_50)

	local var_40_51 = {
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

	var_40_29:RegisterAnimationSequence("InGame", var_40_51)

	local var_40_52 = {
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

	var_40_31:RegisterAnimationSequence("InGame", var_40_52)

	local function var_40_53()
		var_40_13:AnimateSequence("InGame")
		var_40_27:AnimateSequence("InGame")
		var_40_29:AnimateSequence("InGame")
		var_40_31:AnimateSequence("InGame")
	end

	var_40_0._sequences.InGame = var_40_53

	local var_40_54
	local var_40_55 = {
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

	var_40_31:RegisterAnimationSequence("CountArabic", var_40_55)

	local function var_40_56()
		var_40_31:AnimateSequence("CountArabic")
	end

	var_40_0._sequences.CountArabic = var_40_56

	local var_40_57
	local var_40_58 = {
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

	var_40_13:RegisterAnimationSequence("SplitScreen", var_40_58)

	local var_40_59 = {
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

	var_40_15:RegisterAnimationSequence("SplitScreen", var_40_59)

	if not Engine.DDJFBBJAIG() then
		local var_40_60 = {
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

		var_40_16:RegisterAnimationSequence("SplitScreen", var_40_60)
	end

	local var_40_61 = {
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

	var_40_20:RegisterAnimationSequence("SplitScreen", var_40_61)

	local var_40_62 = {
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

	var_40_22:RegisterAnimationSequence("SplitScreen", var_40_62)

	local var_40_63 = {
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

	var_40_27:RegisterAnimationSequence("SplitScreen", var_40_63)

	local var_40_64 = {
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

	var_40_29:RegisterAnimationSequence("SplitScreen", var_40_64)

	local var_40_65 = {
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

	var_40_31:RegisterAnimationSequence("SplitScreen", var_40_65)

	local function var_40_66()
		var_40_13:AnimateSequence("SplitScreen")
		var_40_15:AnimateSequence("SplitScreen")

		if not Engine.DDJFBBJAIG() then
			var_40_16:AnimateSequence("SplitScreen")
		end

		var_40_20:AnimateSequence("SplitScreen")
		var_40_22:AnimateSequence("SplitScreen")
		var_40_27:AnimateSequence("SplitScreen")
		var_40_29:AnimateSequence("SplitScreen")
		var_40_31:AnimateSequence("SplitScreen")
	end

	var_40_0._sequences.SplitScreen = var_40_66

	local var_40_67
	local var_40_68 = {
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

	var_40_35:RegisterAnimationSequence("CHT", var_40_68)

	local function var_40_69()
		var_40_35:AnimateSequence("CHT")
	end

	var_40_0._sequences.CHT = var_40_69

	local var_40_70 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_40_20,
		startCap = var_40_20.startCap,
		endCap = var_40_20.endCap,
		sliderArea = var_40_20.sliderArea,
		slider = var_40_20.sliderArea and var_40_20.sliderArea.slider,
		fixedSizeSlider = var_40_20.sliderArea and var_40_20.sliderArea.fixedSizeSlider
	})

	var_40_13:AddScrollbar(var_40_70)
	var_40_13:AddArrow(var_40_27)
	var_40_13:AddArrow(var_40_29)
	var_40_13:AddItemNumbers(var_40_31)
	var_40_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_40_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/EQUIP")
	})

	local var_40_71 = LUI.UIBindButton.new()

	var_40_71.id = "selfBindButton"

	var_40_0:addElement(var_40_71)

	var_40_0.bindButton = var_40_71

	var_0_17(var_40_0, var_40_1, arg_40_1)

	if CONDITIONS.IsArabic(var_40_0) then
		ACTIONS.AnimateSequence(var_40_0, "CountArabic")
	end

	return var_40_0
end

MenuBuilder.registerType("WeaponSelect", WeaponSelect)
LockTable(_M)
