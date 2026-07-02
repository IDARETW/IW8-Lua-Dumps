module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.ReticleGrid:GetFocusPositionIndex() + 1
end

local function var_0_1(arg_2_0)
	local function var_2_0(arg_3_0, arg_3_1)
		local var_3_0 = CSV.reticleCategoryTable.cols
		local var_3_1 = arg_3_1 and var_3_0.altScopeImage or var_3_0.scopeImage

		return StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, var_3_0.categoryRef, arg_3_0, var_3_1)
	end

	local var_2_1 = arg_2_0._isStorePreview and arg_2_0._storePreviewData.Category or arg_2_0._category
	local var_2_2 = var_2_0(var_2_1, false)
	local var_2_3 = arg_2_0._supportAltImage and var_2_0(var_2_1, true) or nil

	return var_2_2, var_2_3
end

local function var_0_2(arg_4_0)
	local var_4_0 = LOOT.GetBaseWeaponItemID(arg_4_0.weaponPlayerData.weapon:get())

	return LOOT.GetGameSourceIDFromItemID(var_4_0)
end

local function var_0_3(arg_5_0)
	local var_5_0 = {}
	local var_5_1 = CSV.reticleChallenges
	local var_5_2 = StringTable.BFHCAIIDA(var_5_1.file)

	for iter_5_0 = 0, var_5_2 - 1 do
		local var_5_3 = CSV.ReadRow(var_5_1, iter_5_0)
		local var_5_4 = var_5_3.loot

		if not string.find(var_5_4, "|") then
			var_5_0[var_5_4] = iter_5_0
		else
			local var_5_5 = split(var_5_3.loot, "|")

			for iter_5_1, iter_5_2 in ipairs(var_5_5) do
				var_5_0[iter_5_2] = iter_5_0
			end
		end
	end

	return var_5_0
end

local function var_0_4(arg_6_0, arg_6_1)
	arg_6_0._reticleChallenges = var_0_3(arg_6_0)
	arg_6_0._reticleTable = {}

	local function var_6_0(arg_7_0, arg_7_1)
		local var_7_0 = {
			lootID = LOOT.GetItemID(LOOT.itemTypes.RETICLE, arg_7_1)
		}
		local var_7_1 = Challenge.GetReticleChallengeData(arg_6_0._reticleChallenges, arg_7_1, var_7_0.lootID)

		var_7_0.challengeID = var_7_1.id
		var_7_0.challengeRef = var_7_1.ref

		if #var_7_0.challengeID > 0 then
			var_7_0.progress = Gunsmith.CEBFICDDGD(arg_7_0, var_7_0.challengeID).progress
		end

		var_7_0.unlocked = LOOT.IsUnlockedWithID(arg_7_0, var_7_0.lootID)

		return var_7_0
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		arg_6_0._atLeast1LockedReticle = false
	end

	local var_6_1 = StringTable.BFHCAIIDA(CSV.reticles.file)

	for iter_6_0 = 0, var_6_1 - 1 do
		local var_6_2 = CSV.ReadRow(CSV.reticles, iter_6_0)
		local var_6_3 = arg_6_0.weaponPlayerData.weapon:get()
		local var_6_4 = LOOT.GetGameSourceIDFromItemID(LOOT.GetBaseWeaponItemID(var_6_3)) == LUI.GAME_SOURCE_ID.COLD_WAR and var_6_2.category == "reticle_universal_t9"

		if var_6_2 and var_6_2.category == arg_6_0._category and var_6_2.hideInUI ~= "1" or var_6_2.ref == WEAPON.ReticleNoneValue or var_6_4 then
			if var_6_2.ref == WEAPON.ReticleNoneValue then
				var_6_2.image = StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.attachRef, arg_6_0._opticRef, CSV.reticleCategoryTable.cols.defaultReticle)
				var_6_2.altImage = StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.attachRef, arg_6_0._opticRef, CSV.reticleCategoryTable.cols.altReticleImage)
			end

			var_6_2.unlockInfo = var_6_0(arg_6_0._controllerIndex, var_6_2.ref)

			if CONDITIONS.IsWZWipFlowEnabled() and not var_6_2.unlockInfo.unlocked then
				arg_6_0._atLeast1LockedReticle = true
			end

			local var_6_5 = true

			if CONDITIONS.IsWZWipFlowEnabled() and iter_6_0 > 1 then
				var_6_5 = LOOT.ItemIDsMatchGameSourceIDs(LOOT.GetBaseWeaponItemID(var_6_3), LOOT.GetItemID(LOOT.itemTypes.RETICLE, var_6_2.ref))
			end

			if var_6_5 and (var_6_2.unlockType ~= "purchase" or var_6_2.unlockInfo.unlocked) then
				table.insert(arg_6_0._reticleTable, var_6_2)
			end
		end
	end
end

local function var_0_5(arg_8_0)
	local var_8_0 = (function()
		for iter_9_0, iter_9_1 in ipairs(arg_8_0._reticleTable) do
			if arg_8_0._equippedReticle == iter_9_1.ref then
				return iter_9_0 - 1
			end
		end
	end)() or 0
	local var_8_1 = arg_8_0.ReticleGrid:GetPositionForIndex(var_8_0)

	arg_8_0.ReticleGrid:SetFocusedPosition(var_8_1, true)
end

local function var_0_6(arg_10_0, arg_10_1)
	arg_10_0.Scope:setImage(RegisterMaterial(arg_10_1))
end

local function var_0_7(arg_11_0)
	local var_11_0 = var_0_0(arg_11_0)
	local var_11_1 = arg_11_0._reticleTable[var_11_0]

	if arg_11_0._equippedReticle == var_11_1.ref then
		var_11_1 = arg_11_0._reticleTable[1]
	end

	local var_11_2 = WEAPON.SetEquippedReticle(arg_11_0.weaponPlayerData, var_11_1.ref)

	arg_11_0:UpdateGrid()

	local var_11_3 = "hud_cmd_active_backer"

	if var_11_1.image ~= "" then
		var_11_3 = var_11_1.image
	end

	local var_11_4 = {
		displayTime = 2000,
		icon = var_11_3,
		header = Engine.CBBHFCGDIC("LUA_MENU/RETICLE_EQUIPPED"),
		description = Engine.CBBHFCGDIC(var_11_1.name),
		type = LUI.ToastManager.NotificationType.ReticleEquipped,
		controllerIndex = arg_11_0._controllerIndex
	}

	arg_11_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_11_4
	})
end

local function var_0_8(arg_12_0)
	local var_12_0 = var_0_0(arg_12_0)
	local var_12_1 = arg_12_0._reticleTable[var_12_0]
	local var_12_2

	if var_12_0 > 1 then
		var_12_2 = arg_12_0._reticleTable[var_12_0 - 1]
	end

	arg_12_0.ReticlePanel.Name:setText(ToUpperCase(Engine.CBBHFCGDIC(var_12_1.name)))

	local var_12_3 = var_12_1.image

	if arg_12_0._isAltImage then
		arg_12_0._isAltImageHybridScope = arg_12_0._opticRef == "hybrid"
		var_12_3 = arg_12_0._isAltImageHybridScope and var_12_1.flipHybridAltImage or var_12_1.altImage
	end

	if var_12_3 ~= "" then
		arg_12_0.Preview:setImage(RegisterMaterial(var_12_3))
	end

	if arg_12_0._supportAltImage then
		local var_12_4 = arg_12_0._isAltImage and arg_12_0._altScopeImage or arg_12_0._defaultScopeImage
		local var_12_5 = RegisterMaterial(var_12_4)

		if Engine.DFEIGFBEH(var_12_5) > 1 then
			ACTIONS.AnimateSequence(arg_12_0, "ScopeImage2x1")
		else
			ACTIONS.AnimateSequence(arg_12_0, "ScopeImage1x1")
		end

		arg_12_0.Scope:setImage(var_12_5)
	end

	local var_12_6 = arg_12_0._equippedReticle == var_12_1.ref

	if var_12_6 and not arg_12_0.ReticlePanel.EquippedWidget.enabled then
		ACTIONS.AnimateSequence(arg_12_0.ReticlePanel.EquippedWidget, "TurnOn")

		arg_12_0.ReticlePanel.EquippedWidget.enabled = true
	end

	arg_12_0.ReticlePanel.EquippedWidget:UpdateVisibility(var_12_6)

	local var_12_7 = var_12_1.unlockInfo

	var_12_7.equipped = var_12_6
	var_12_7.lockedText = Engine.CBBHFCGDIC("LUA_MENU/RETICLE_UNLOCK_TEXT", arg_12_0._categoryName)

	if not var_12_2 or not var_12_2.unlockInfo.unlocked then
		var_12_7.isClassified = true
	end

	if arg_12_0.WZWipSnipeProgressableMessage ~= nil then
		local var_12_8 = "none"

		if (not var_12_7.challengeID or #var_12_7.challengeID == 0) and var_12_1.ref ~= var_12_8 then
			ACTIONS.AnimateSequence(arg_12_0.WZWipSnipeProgressableMessage, "Hide")
		else
			ACTIONS.AnimateSequence(arg_12_0.WZWipSnipeProgressableMessage, "Show")
		end
	end

	arg_12_0.ReticlePanel:UpdatePanelInfo(var_12_7)
end

local function var_0_9(arg_13_0)
	arg_13_0._equippedReticle = WEAPON.GetEquippedReticle(arg_13_0.weaponPlayerData)

	arg_13_0.ReticleGrid:RemoveFocusFromChild()
	arg_13_0.ReticleGrid:SetNumChildren(#arg_13_0._reticleTable)
	arg_13_0.ReticleGrid:RefreshContent()
end

local function var_0_10(arg_14_0)
	return function(arg_15_0, arg_15_1, arg_15_2)
		local var_15_0 = arg_15_1 + arg_15_2 * arg_14_0.ReticleGrid:GetNumColumns()
		local var_15_1 = LUI.ShallowCopy(arg_14_0._reticleTable[var_15_0 + 1])

		if arg_14_0._isAltImage then
			if arg_14_0._isAltImageHybridScope then
				var_15_1.image = var_15_1.flipHybridAltImage
			else
				var_15_1.image = var_15_1.altImage
			end
		end

		var_15_1.lootType = LOOT.itemTypes.RETICLE

		local var_15_2 = arg_14_0._equippedReticle == var_15_1.ref

		arg_15_0:RefreshButton(arg_14_0, var_15_1, var_15_2)
	end
end

local function var_0_11(arg_16_0, arg_16_1)
	arg_16_0.ReticlePanel.NewItemNotification:UpdateBreadcrumbByID(arg_16_0._controllerIndex, arg_16_1, true)
end

local function var_0_12(arg_17_0, arg_17_1)
	FrontEndScene.HideWeaponModels()
	Engine.DHFCHIIJCA("quartermaster")

	local var_17_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_17_1
	})

	var_17_0:SetLimits(-10, 10, -10, 4)
	var_17_0:SetSwayValues(2000, 0.06, 0.1)
	arg_17_0:addElement(var_17_0)
end

local function var_0_13(arg_18_0)
	local var_18_0 = arg_18_0._isStorePreview and Engine.CBBHFCGDIC(arg_18_0._storePreviewData.Name) or Engine.CBBHFCGDIC("LUA_MENU/RETICLE_SELECT_TITLE", arg_18_0._categoryName)

	arg_18_0.MenuTitle:SetTitle(var_18_0)
end

local function var_0_14(arg_19_0, arg_19_1)
	arg_19_0._opticRef = ATTACHMENT.GetOpticRef(arg_19_1)
	arg_19_0._category = ATTACHMENT.GetOpticReticleCategory(arg_19_0._opticRef)
	arg_19_0._categoryName = Engine.CBBHFCGDIC(WEAPON.GetReticleCategoryName(arg_19_0._category))
	arg_19_0._supportAltImage = ATTACHMENT.ReticleTypeSupportsAltImage(arg_19_0._category)
	arg_19_0._isAltImage = false
	arg_19_0._isAltImageHybridScope = false

	local var_19_0, var_19_1 = var_0_1(arg_19_0)

	if arg_19_0._supportAltImage then
		arg_19_0._defaultScopeImage = var_19_0
		arg_19_0.altScopeImage = var_19_1

		arg_19_0.ReticlePanel.ToggleHybridPrompt:SetAlpha(1)
	end

	var_0_6(arg_19_0, var_19_0)
end

local function var_0_15(arg_20_0)
	local var_20_0 = arg_20_0._storePreviewData.Ref
	local var_20_1 = StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, var_20_0, CSV.reticles.cols.image)
	local var_20_2 = var_0_1(arg_20_0)

	arg_20_0.Preview:setImage(RegisterMaterial(var_20_1))
	var_0_6(arg_20_0, var_20_2)
end

local function var_0_16(arg_21_0)
	if arg_21_0._supportAltImage then
		arg_21_0.bindButton:addEventHandler("button_alt1", function(arg_22_0, arg_22_1)
			arg_21_0._isAltImage = not arg_21_0._isAltImage

			arg_21_0:PreviewItem()
			arg_21_0.ReticleGrid:RefreshContent()
		end)
	end
end

local function var_0_17(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = PlayerData.BFFBGAJGD(arg_23_1, LOADOUT.GetLoadoutStatsGroup())
	local var_23_1 = arg_23_2.loadoutIndex and arg_23_2.loadoutIndex or LOADOUT.GetFavoriteLoadoutIndex(arg_23_1) or 0
	local var_23_2 = var_23_0.squadMembers.loadouts[var_23_1]
	local var_23_3 = arg_23_2.weaponSlot and arg_23_2.weaponSlot or 0

	arg_23_0.weaponPlayerData = var_23_2.weaponSetups[var_23_3]
	arg_23_0._equippedReticle = WEAPON.GetEquippedReticle(arg_23_0.weaponPlayerData)
end

local function var_0_18(arg_24_0, arg_24_1)
	local var_24_0 = LOOT.GetItemRef(LOOT.itemTypes.RETICLE, arg_24_1)
	local var_24_1 = WEAPON.GetReticleName(var_24_0)
	local var_24_2 = StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, var_24_0, CSV.reticles.cols.category)
	local var_24_3 = LOOT.GetGameSourceIDFromItemID(arg_24_1)

	arg_24_0._storePreviewData = {
		ID = arg_24_1,
		Ref = var_24_0,
		Name = var_24_1,
		Category = var_24_2
	}

	arg_24_0.SetupStorePreview(arg_24_0)
end

local function var_0_19(arg_25_0)
	assert(arg_25_0.ItemType)
	assert(arg_25_0.ItemQuality)

	local var_25_0 = LOOT.GetItemQuality(LOOT.itemTypes.RETICLE, arg_25_0._storePreviewData.Ref, arg_25_0._storePreviewData.ID) or 0

	arg_25_0.ItemQuality:UpdateQualityText(var_25_0)
	arg_25_0.Name:SetTitle(Engine.CBBHFCGDIC(arg_25_0._storePreviewData.Name))
	ACTIONS.AnimateSequence(arg_25_0, "FromStore")

	if Loot.DEBEIFJEEG(arg_25_0._controllerIndex, arg_25_0._storePreviewData.ID) > 0 then
		local var_25_1 = LAYOUT.GetTextWidth(arg_25_0.Name.MenuTitle)
		local var_25_2 = LAYOUT.GetElementWidth(arg_25_0.CheckboxFrame)
		local var_25_3 = 100 * _1080p
		local var_25_4 = 16 * _1080p
		local var_25_5 = {
			arg_25_0.Checkbox,
			arg_25_0.CheckboxFrame
		}

		for iter_25_0 = 1, #var_25_5 do
			var_25_5[iter_25_0]:SetLeft(var_25_1 + var_25_3 + var_25_4)
			var_25_5[iter_25_0]:SetRight(var_25_1 + var_25_3 + var_25_4 + var_25_2)
			var_25_5[iter_25_0]:SetAlpha(1)
		end
	end
end

local function var_0_20(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.weaponPlayerData.weapon:get()

	if PROGRESSION.ShouldUnlockAll() then
		arg_26_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_26_0.GunsmithWeaponLevel:Setup(arg_26_1, var_26_0)
	end
end

local function var_0_21(arg_27_0, arg_27_1)
	arg_27_0.HelperBar.ButtonHelperText:PopButtonPrompt({
		side = "left",
		button_ref = "button_primary"
	})

	local var_27_0 = arg_27_1.bundleData

	if arg_27_1.quickPurchaseEnabled and CONDITIONS.IsMenuInStack("StoreBundlePreview") and not var_27_0.isBundlePurchased then
		arg_27_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 10,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUICK_PURCHASE")
		})
		arg_27_0.bindButton:addEventHandler("button_alt1", function(arg_28_0, arg_28_1)
			STORE.OpenQuickPurchasePopupInPreview(var_27_0)
		end)
	end
end

local function var_0_22(arg_29_0)
	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_29_0 = var_0_2(arg_29_0)

		arg_29_0.WZWipSnipeProgressableMessage:UpdateMessage({
			gameSourceID = var_29_0
		})
	end
end

local function var_0_23(arg_30_0, arg_30_1, arg_30_2)
	assert(arg_30_0.MenuTitle)
	assert(arg_30_0.ReticlePanel)
	assert(arg_30_0.ReticleGrid)

	arg_30_0.EquipItem = var_0_7
	arg_30_0.PreviewItem = var_0_8
	arg_30_0.UpdateGrid = var_0_9
	arg_30_0.UpdateBreadcrumb = var_0_11
	arg_30_0.SetupStorePreview = var_0_19
	arg_30_0._controllerIndex = arg_30_1
	arg_30_0._isStorePreview = arg_30_2.isStorePreview or false

	var_0_12(arg_30_0, arg_30_1)
	var_0_17(arg_30_0, arg_30_1, arg_30_2)

	if not arg_30_0._isStorePreview then
		var_0_22(arg_30_0)
		assert(arg_30_2.loadoutIndex)
		assert(arg_30_2.weaponSlot)
		assert(arg_30_2.equippedOptic)
		var_0_14(arg_30_0, arg_30_2.equippedOptic)
		var_0_17(arg_30_0, arg_30_1, arg_30_2)
		var_0_4(arg_30_0, arg_30_1)
		arg_30_0.ReticleGrid:SetRefreshChild(var_0_10(arg_30_0))
		arg_30_0:UpdateGrid()
		var_0_5(arg_30_0)
		var_0_16(arg_30_0)
		var_0_20(arg_30_0, arg_30_1)
		arg_30_0:addEventHandler("restore_focus", function(arg_31_0, arg_31_1)
			var_0_4(arg_30_0, arg_30_1)
			arg_30_0:UpdateGrid()
		end)
	else
		arg_30_0.ReticleGrid:closeTree()

		arg_30_0.ReticleGrid = nil

		arg_30_0.Scrollbar:SetAlpha(0)
		arg_30_0.ReticlePanel:SetAlpha(0)
		arg_30_0.GunsmithWeaponLevel:SetAlpha(0)
		var_0_18(arg_30_0, arg_30_2.lootID)

		if CONDITIONS.IsWZWipFlowEnabled() then
			ACTIONS.AnimateSequence(arg_30_0.WZWipSnipeProgressableMessage, "Hide")
		end

		var_0_15(arg_30_0)
		var_0_21(arg_30_0, arg_30_2)
	end

	var_0_13(arg_30_0)

	if IsLanguageRussian() or IsLanguagePolish() then
		ACTIONS.AnimateSequence(arg_30_0, "RU")
	end

	if CONDITIONS.IsWZWipFlowEnabled() and Engine.DDJFBBJAIG() and not arg_30_0._isStorePreview then
		arg_30_0.WZWipSnipeBackgroundSceneOverlay:UpdateSnipeOverlay({
			weaponRef = arg_30_0.weaponPlayerData.weapon:get()
		})
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_30_0, arg_30_1)
	ACTIONS.ScaleFullscreen(arg_30_0.ReticleBackground)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_30_0.TabBacker)
end

function ReticleSelect(arg_32_0, arg_32_1)
	local var_32_0 = LUI.UIElement.new()

	var_32_0.id = "ReticleSelect"
	var_32_0._animationSets = var_32_0._animationSets or {}
	var_32_0._sequences = var_32_0._sequences or {}

	local var_32_1 = arg_32_1 and arg_32_1.controllerIndex

	if not var_32_1 and not Engine.DDJFBBJAIG() then
		var_32_1 = var_32_0:getRootController()
	end

	assert(var_32_1)

	var_32_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_32_1
	})
	var_32_0.HelperBar.id = "HelperBar"

	var_32_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_32_0.HelperBar:setPriority(10)
	var_32_0:addElement(var_32_0.HelperBar)

	local var_32_2 = var_32_0
	local var_32_3

	if Engine.DDJFBBJAIG() then
		local var_32_4 = LUI.UIImage.new()

		var_32_4.id = "ReticleBackground"

		var_32_4:SetRGBFromInt(0, 0)
		var_32_4:SetAlpha(0.5, 0)
		var_32_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
		var_32_0:addElement(var_32_4)

		var_32_0.ReticleBackground = var_32_4
	end

	local var_32_5

	if CONDITIONS.InGame(var_32_0) then
		local var_32_6 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_32_1
		})

		var_32_6.id = "InGameMenuBackground"

		var_32_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_32_0:addElement(var_32_6)

		var_32_0.InGameMenuBackground = var_32_6
	end

	local var_32_7
	local var_32_8 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_32_1
	})

	var_32_8.id = "TabBacker"

	var_32_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_32_0:addElement(var_32_8)

	var_32_0.TabBacker = var_32_8

	local var_32_9
	local var_32_10 = LUI.UIImage.new()

	var_32_10.id = "Preview"

	var_32_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -122, _1080p * 134, _1080p * -703, _1080p * -447)
	var_32_0:addElement(var_32_10)

	var_32_0.Preview = var_32_10

	local var_32_11
	local var_32_12 = LUI.UIImage.new()

	var_32_12.id = "Scope"

	var_32_12:setImage(RegisterMaterial("mp_reticle_scope_4x"), 0)
	var_32_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -506, _1080p * 518, _1080p * -1022, _1080p * 2)
	var_32_0:addElement(var_32_12)

	var_32_0.Scope = var_32_12

	local var_32_13

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_32_14 = MenuBuilder.BuildRegisteredType("WZSnipeBackgroundSceneOverlay", {
			controllerIndex = var_32_1
		})

		var_32_14.id = "WZWipSnipeBackgroundSceneOverlay"

		var_32_14:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_32_0:addElement(var_32_14)

		var_32_0.WZWipSnipeBackgroundSceneOverlay = var_32_14
	end

	local var_32_15

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_32_15 = MenuBuilder.BuildRegisteredType("WZSnipeProgressableMessage", {
			controllerIndex = var_32_1
		})
		var_32_15.id = "WZWipSnipeProgressableMessage"

		var_32_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 576, _1080p * 803, _1080p * 835)
		var_32_0:addElement(var_32_15)

		var_32_0.WZWipSnipeProgressableMessage = var_32_15
	end

	local var_32_16
	local var_32_17 = {
		scrollingThresholdX = 0,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 13,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_32_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericLootButton", {
				controllerIndex = var_32_1
			})
		end,
		refreshChild = function(arg_34_0, arg_34_1, arg_34_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 126,
		rowHeight = _1080p * 126,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_32_18 = LUI.UIGrid.new(var_32_17)

	var_32_18.id = "ReticleGrid"

	var_32_18:SetScale(-0.1, 0)
	var_32_18:setUseStencil(true)
	var_32_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 7, _1080p * 1797, _1080p * -254, _1080p * -113)
	var_32_0:addElement(var_32_18)

	var_32_0.ReticleGrid = var_32_18

	local var_32_19
	local var_32_20 = LUI.UIImage.new()

	var_32_20.id = "PreviewLockIcon"

	var_32_20:SetAlpha(0, 0)
	var_32_20:setImage(RegisterMaterial("icon_waypoint_locked"), 0)
	var_32_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * -175, _1080p * -25)
	var_32_0:addElement(var_32_20)

	var_32_0.PreviewLockIcon = var_32_20

	local var_32_21
	local var_32_22 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_32_1
	})

	var_32_22.id = "MenuTitle"

	var_32_22.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/RETICLE_SELECT"), 0)
	var_32_22.Line:SetLeft(0, 0)
	var_32_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_32_0:addElement(var_32_22)

	var_32_0.MenuTitle = var_32_22

	local var_32_23

	if CONDITIONS.InFrontend(var_32_0) then
		var_32_23 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_32_1
		})
		var_32_23.id = "LobbyMembersFooter"

		var_32_23:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_32_0:addElement(var_32_23)

		var_32_0.LobbyMembersFooter = var_32_23
	end

	local var_32_24
	local var_32_25 = MenuBuilder.BuildRegisteredType("WeaponCustomizationPanel", {
		controllerIndex = var_32_1
	})

	var_32_25.id = "ReticlePanel"

	var_32_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 365, _1080p * 645)
	var_32_0:addElement(var_32_25)

	var_32_0.ReticlePanel = var_32_25

	local var_32_26
	local var_32_27 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbar", {
		controllerIndex = var_32_1
	})

	var_32_27.id = "Scrollbar"

	var_32_27:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 1705, _1080p * -121, _1080p * -113)
	var_32_0:addElement(var_32_27)

	var_32_0.Scrollbar = var_32_27

	local var_32_28
	local var_32_29 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_32_1
	})

	var_32_29.id = "GunsmithWeaponLevel"

	var_32_29:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_32_0:addElement(var_32_29)

	var_32_0.GunsmithWeaponLevel = var_32_29

	local var_32_30
	local var_32_31 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_32_1
	})

	var_32_31.id = "Name"

	var_32_31:SetAlpha(0, 0)
	var_32_31.MenuTitle:setText("", 0)
	var_32_31.Line:SetLeft(0, 0)
	var_32_31:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, _1080p * 620, _1080p * 720)
	var_32_0:addElement(var_32_31)

	var_32_0.Name = var_32_31

	local var_32_32
	local var_32_33 = LUI.UIText.new()

	var_32_33.id = "ItemType"

	var_32_33:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_32_33:SetAlpha(0, 0)
	var_32_33:setText(Engine.CBBHFCGDIC("MENU/RETICLE"), 0)
	var_32_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_32_33:SetAlignment(LUI.Alignment.Left)
	var_32_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 590, _1080p * 728, _1080p * 758)
	var_32_0:addElement(var_32_33)

	var_32_0.ItemType = var_32_33

	local var_32_34
	local var_32_35 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_32_1
	})

	var_32_35.id = "ItemQuality"

	var_32_35:SetAlpha(0, 0)
	var_32_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 256, _1080p * 766, _1080p * 798)
	var_32_0:addElement(var_32_35)

	var_32_0.ItemQuality = var_32_35

	local var_32_36
	local var_32_37 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_32_38 = LUI.UIBorder.new(var_32_37)

	var_32_38.id = "CheckboxFrame"

	var_32_38:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_32_38:SetAlpha(0, 0)
	var_32_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 483, _1080p * 507, _1080p * 678, _1080p * 702)
	var_32_0:addElement(var_32_38)

	var_32_0.CheckboxFrame = var_32_38

	local var_32_39
	local var_32_40 = LUI.UIImage.new()

	var_32_40.id = "Checkbox"

	var_32_40:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_32_40:SetAlpha(0, 0)
	var_32_40:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_32_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 483, _1080p * 507, _1080p * 678, _1080p * 702)
	var_32_0:addElement(var_32_40)

	var_32_0.Checkbox = var_32_40

	local function var_32_41()
		return
	end

	var_32_0._sequences.DefaultSequence = var_32_41

	local var_32_42

	if CONDITIONS.InFrontend(var_32_0) then
		local var_32_43 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 50
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 200
			}
		}

		var_32_23:RegisterAnimationSequence("RU", var_32_43)
	end

	local function var_32_44()
		if CONDITIONS.InFrontend(var_32_0) then
			var_32_23:AnimateSequence("RU")
		end
	end

	var_32_0._sequences.RU = var_32_44

	local var_32_45
	local var_32_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1018
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1030
		}
	}

	var_32_12:RegisterAnimationSequence("ScopeImage2x1", var_32_46)

	local function var_32_47()
		var_32_12:AnimateSequence("ScopeImage2x1")
	end

	var_32_0._sequences.ScopeImage2x1 = var_32_47

	local var_32_48
	local var_32_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -506
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 518
		}
	}

	var_32_12:RegisterAnimationSequence("ScopeImage1x1", var_32_49)

	local function var_32_50()
		var_32_12:AnimateSequence("ScopeImage1x1")
	end

	var_32_0._sequences.ScopeImage1x1 = var_32_50

	local var_32_51

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_32_52 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_32_15:RegisterAnimationSequence("FromStore", var_32_52)
	end

	local var_32_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_32_31:RegisterAnimationSequence("FromStore", var_32_53)

	local var_32_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_32_33:RegisterAnimationSequence("FromStore", var_32_54)

	local var_32_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_32_35:RegisterAnimationSequence("FromStore", var_32_55)

	local function var_32_56()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_32_15:AnimateSequence("FromStore")
		end

		var_32_31:AnimateSequence("FromStore")
		var_32_33:AnimateSequence("FromStore")
		var_32_35:AnimateSequence("FromStore")
	end

	var_32_0._sequences.FromStore = var_32_56

	local var_32_57 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.horizontal,
		eventListener = var_32_27,
		startCap = var_32_27.startCap,
		endCap = var_32_27.endCap,
		sliderArea = var_32_27.sliderArea,
		slider = var_32_27.sliderArea and var_32_27.sliderArea.slider,
		fixedSizeSlider = var_32_27.sliderArea and var_32_27.sliderArea.fixedSizeSlider
	})

	var_32_18:AddScrollbar(var_32_57)
	var_32_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_32_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("MENU/WEAPON_CUSTOMIZATION_SELECTION")
	})

	local var_32_58 = LUI.UIBindButton.new()

	var_32_58.id = "selfBindButton"

	var_32_0:addElement(var_32_58)

	var_32_0.bindButton = var_32_58

	var_32_0.bindButton:addEventHandler("button_secondary", function(arg_40_0, arg_40_1)
		if not arg_40_1.controller then
			local var_40_0 = var_32_1
		end

		ACTIONS.LeaveMenu(var_32_0)
	end)
	var_0_23(var_32_0, var_32_1, arg_32_1)

	return var_32_0
end

MenuBuilder.registerType("ReticleSelect", ReticleSelect)
LockTable(_M)
