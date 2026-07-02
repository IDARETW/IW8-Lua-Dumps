module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.ReticleGrid:GetFocusPositionIndex() + 1
end

local function var_0_1(arg_2_0)
	arg_2_0._reticleTable = {}

	local function var_2_0(arg_3_0, arg_3_1)
		local var_3_0 = {
			lootID = LOOT.GetItemID(LOOT.itemTypes.RETICLE, arg_3_1)
		}
		local var_3_1 = Challenge.GetReticleChallengeData(var_3_0.lootID)

		var_3_0.challengeID = var_3_1.id
		var_3_0.challengeRef = var_3_1.ref

		if #var_3_0.challengeID > 0 then
			var_3_0.progress = Gunsmith.CEBFICDDGD(arg_3_0, tonumber(var_3_0.challengeID)).progress
		end

		var_3_0.unlocked = LOOT.IsUnlockedWithID(arg_3_0, var_3_0.lootID)

		return var_3_0
	end

	local var_2_1 = StringTable.BFHCAIIDA(CSV.reticles.file)

	for iter_2_0 = 0, var_2_1 - 1 do
		local var_2_2 = CSV.ReadRow(CSV.reticles, iter_2_0)

		if var_2_2 and var_2_2.category == arg_2_0._category and var_2_2.hideInUI ~= "1" or var_2_2.ref == WEAPON.ReticleNoneValue then
			if var_2_2.ref == WEAPON.ReticleNoneValue then
				var_2_2.image = StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.attachRef, arg_2_0._opticRef, CSV.reticleCategoryTable.cols.defaultReticle)
				var_2_2.altImage = StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.attachRef, arg_2_0._opticRef, CSV.reticleCategoryTable.cols.altReticleImage)
			end

			var_2_2.unlockInfo = var_2_0(arg_2_0._controllerIndex, var_2_2.ref)

			if var_2_2.unlockType ~= "purchase" or var_2_2.unlockInfo.unlocked then
				table.insert(arg_2_0._reticleTable, var_2_2)
			end
		end
	end
end

local function var_0_2(arg_4_0)
	local var_4_0 = (function()
		for iter_5_0, iter_5_1 in ipairs(arg_4_0._reticleTable) do
			if arg_4_0._equippedReticle == iter_5_1.ref then
				return iter_5_0 - 1
			end
		end
	end)() or 0
	local var_4_1 = arg_4_0.ReticleGrid:GetPositionForIndex(var_4_0)

	arg_4_0.ReticleGrid:SetFocusedPosition(var_4_1, true)
end

local function var_0_3(arg_6_0)
	local var_6_0 = var_0_0(arg_6_0)
	local var_6_1 = arg_6_0._reticleTable[var_6_0]

	if arg_6_0._equippedReticle == var_6_1.ref then
		var_6_1 = arg_6_0._reticleTable[1]
	end

	WEAPON.SetEquippedReticle(arg_6_0.weaponPlayerData, var_6_1.ref)
	arg_6_0:UpdateGrid()

	local var_6_2 = "hud_cmd_active_backer"

	if var_6_1.image ~= "" then
		var_6_2 = var_6_1.image
	end

	local var_6_3 = {
		displayTime = 2000,
		icon = var_6_2,
		header = Engine.CBBHFCGDIC("LUA_MENU/RETICLE_EQUIPPED"),
		description = Engine.CBBHFCGDIC(var_6_1.name),
		type = LUI.ToastManager.NotificationType.ReticleEquipped,
		controllerIndex = arg_6_0._controllerIndex
	}

	arg_6_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_6_3
	})
end

local function var_0_4(arg_7_0)
	local var_7_0 = var_0_0(arg_7_0)
	local var_7_1 = arg_7_0._reticleTable[var_7_0]
	local var_7_2

	if var_7_0 > 1 then
		var_7_2 = arg_7_0._reticleTable[var_7_0 - 1]
	end

	arg_7_0.ReticlePanel.Name:setText(ToUpperCase(Engine.CBBHFCGDIC(var_7_1.name)))

	local var_7_3 = var_7_1.image

	if arg_7_0._isAltImage then
		var_7_3 = arg_7_0._opticRef == "hybrid" and var_7_1.flipHybridAltImage or var_7_1.altImage
	end

	if var_7_3 ~= "" then
		arg_7_0.Preview:setImage(RegisterMaterial(var_7_3))
	end

	if arg_7_0._supportAltImage then
		local var_7_4 = arg_7_0._isAltImage and arg_7_0._altScopeImage or arg_7_0._defaultScopeImage
		local var_7_5 = RegisterMaterial(var_7_4)

		if Engine.DFEIGFBEH(var_7_5) > 1 then
			ACTIONS.AnimateSequence(arg_7_0, "ScopeImage2x1")
		else
			ACTIONS.AnimateSequence(arg_7_0, "ScopeImage1x1")
		end

		arg_7_0.Scope:setImage(var_7_5)
	end

	local var_7_6 = arg_7_0._equippedReticle == var_7_1.ref

	if var_7_6 and not arg_7_0.ReticlePanel.EquippedWidget.enabled then
		ACTIONS.AnimateSequence(arg_7_0.ReticlePanel.EquippedWidget, "TurnOn")

		arg_7_0.ReticlePanel.EquippedWidget.enabled = true
	end

	arg_7_0.ReticlePanel.EquippedWidget:UpdateVisibility(var_7_6)

	local var_7_7 = var_7_1.unlockInfo

	var_7_7.equipped = var_7_6
	var_7_7.lockedText = Engine.CBBHFCGDIC("LUA_MENU/RETICLE_UNLOCK_TEXT", arg_7_0._categoryName)

	if not var_7_2 or not var_7_2.unlockInfo.unlocked then
		var_7_7.isClassified = true
	end

	arg_7_0.ReticlePanel:UpdatePanelInfo(var_7_7)
	ACTIONS.AnimateSequence(arg_7_0, var_7_7.unlocked and "UnlockedPrompt" or "LockedPrompt")
end

local function var_0_5(arg_8_0)
	arg_8_0._equippedReticle = WEAPON.GetEquippedReticle(arg_8_0.weaponPlayerData)

	arg_8_0.ReticleGrid:RemoveFocusFromChild()
	arg_8_0.ReticleGrid:SetNumChildren(#arg_8_0._reticleTable)
	arg_8_0.ReticleGrid:RefreshContent()
end

local function var_0_6(arg_9_0)
	return function(arg_10_0, arg_10_1, arg_10_2)
		local var_10_0 = arg_10_1 + arg_10_2 * arg_9_0.ReticleGrid:GetNumColumns()
		local var_10_1 = LUI.ShallowCopy(arg_9_0._reticleTable[var_10_0 + 1])

		if arg_9_0._isAltImage then
			var_10_1.image = var_10_1.altImage
		end

		var_10_1.lootType = LOOT.itemTypes.RETICLE

		local var_10_2 = arg_9_0._equippedReticle == var_10_1.ref

		arg_10_0:RefreshButton(arg_9_0, var_10_1, var_10_2)
	end
end

local function var_0_7(arg_11_0, arg_11_1)
	arg_11_0.ReticlePanel.NewItemNotification:UpdateBreadcrumbByID(arg_11_0._controllerIndex, arg_11_1, true)
end

local function var_0_8(arg_12_0, arg_12_1)
	FrontEndScene.HideWeaponModels()
	Engine.DHFCHIIJCA("quartermaster")

	local var_12_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_12_1
	})

	var_12_0:SetLimits(-10, 10, -10, 4)
	var_12_0:SetSwayValues(2000, 0.06, 0.1)
	arg_12_0:addElement(var_12_0)
end

local function var_0_9(arg_13_0)
	if arg_13_0._supportAltImage then
		arg_13_0.bindButton:addEventHandler("button_alt1", function(arg_14_0, arg_14_1)
			arg_13_0._isAltImage = not arg_13_0._isAltImage

			arg_13_0:PreviewItem()
			arg_13_0.ReticleGrid:RefreshContent()
		end)
	end
end

local function var_0_10(arg_15_0, arg_15_1, arg_15_2)
	assert(arg_15_0.MenuTitle)
	assert(arg_15_0.ReticlePanel)
	assert(arg_15_0.ReticleGrid)

	arg_15_0.EquipItem = var_0_3
	arg_15_0.PreviewItem = var_0_4
	arg_15_0.UpdateGrid = var_0_5
	arg_15_0.UpdateBreadcrumb = var_0_7

	var_0_8(arg_15_0, arg_15_1)

	arg_15_0._controllerIndex = arg_15_1

	if not arg_15_2.isStorePreview then
		assert(arg_15_2.loadoutIndex)
		assert(arg_15_2.weaponSlot)
		assert(arg_15_2.equippedOptic)

		arg_15_0._opticRef = ATTACHMENT.GetOpticRef(arg_15_2.equippedOptic)
		arg_15_0._category = ATTACHMENT.GetOpticReticleCategory(arg_15_0._opticRef)
		arg_15_0._categoryName = Engine.CBBHFCGDIC(WEAPON.GetReticleCategoryName(arg_15_0._category))
		arg_15_0._supportAltImage = ATTACHMENT.ReticleTypeSupportsAltImage(arg_15_0._category)
		arg_15_0._isAltImage = false

		arg_15_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/RETICLE_SELECT_TITLE", arg_15_0._categoryName))

		if arg_15_0._supportAltImage then
			arg_15_0._defaultScopeImage = StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.categoryRef, arg_15_0._category, CSV.reticleCategoryTable.cols.scopeImage)
			arg_15_0._altScopeImage = StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.categoryRef, arg_15_0._category, CSV.reticleCategoryTable.cols.altScopeImage)

			arg_15_0.Scope:setImage(RegisterMaterial(arg_15_0._defaultScopeImage))
			arg_15_0.ToggleHybridPrompt:SetAlpha(1)
		else
			local var_15_0 = StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.categoryRef, arg_15_0._category, CSV.reticleCategoryTable.cols.scopeImage)

			arg_15_0.Scope:setImage(RegisterMaterial(var_15_0))
		end

		arg_15_0.weaponPlayerData = PlayerData.BFFBGAJGD(arg_15_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_15_2.loadoutIndex].weaponSetups[arg_15_2.weaponSlot]
		arg_15_0._equippedReticle = WEAPON.GetEquippedReticle(arg_15_0.weaponPlayerData)
		arg_15_0._reticleTable = {}

		var_0_1(arg_15_0)
		arg_15_0.ReticleGrid:SetRefreshChild(var_0_6(arg_15_0))
		arg_15_0:UpdateGrid()
		var_0_2(arg_15_0)
		arg_15_0:addEventHandler("restore_focus", function(arg_16_0, arg_16_1)
			var_0_1(arg_15_0, arg_15_1)
			arg_15_0:UpdateGrid()
		end)
		var_0_9(arg_15_0)

		local var_15_1 = arg_15_0.weaponPlayerData.weapon:get()

		if PROGRESSION.ShouldUnlockAll() then
			arg_15_0.GunsmithWeaponLevel:SetAlpha(0)
		else
			arg_15_0.GunsmithWeaponLevel:Setup(arg_15_1, var_15_1)
		end
	else
		arg_15_0.ReticleGrid:closeTree()

		arg_15_0.ReticleGrid = nil

		arg_15_0.Scrollbar:SetAlpha(0)
		arg_15_0.ReticlePanel:SetAlpha(0)
		arg_15_0.GunsmithWeaponLevel:SetAlpha(0)

		local var_15_2 = LOOT.GetItemRef(LOOT.itemTypes.RETICLE, arg_15_2.lootID)
		local var_15_3 = WEAPON.GetReticleName(var_15_2)
		local var_15_4 = StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, var_15_2, CSV.reticles.cols.category)
		local var_15_5 = StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.categoryRef, var_15_4, CSV.reticleCategoryTable.cols.scopeImage)

		arg_15_0.Scope:setImage(RegisterMaterial(var_15_5))

		local var_15_6 = StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, var_15_2, CSV.reticles.cols.image)

		arg_15_0.Preview:setImage(RegisterMaterial(var_15_6))
		arg_15_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC(var_15_3))
		arg_15_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			side = "left",
			button_ref = "button_primary"
		})

		local var_15_7 = arg_15_2.bundleData

		if arg_15_2.quickPurchaseEnabled and CONDITIONS.IsMenuInStack("StoreBundlePreview") and not var_15_7.isBundlePurchased then
			arg_15_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				priority = 10,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUICK_PURCHASE")
			})
			arg_15_0.bindButton:addEventHandler("button_alt1", function(arg_17_0, arg_17_1)
				STORE.OpenQuickPurchasePopupInPreview(var_15_7)
			end)
		end
	end

	if IsLanguageRussian() or IsLanguagePolish() then
		ACTIONS.AnimateSequence(arg_15_0, "RU")
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_15_0, arg_15_1)
	ACTIONS.ScaleFullscreen(arg_15_0.ReticleBackground)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_15_0.TabBacker)
end

function ReticleSelect(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0.id = "ReticleSelect"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	var_18_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_18_1
	})
	var_18_0.HelperBar.id = "HelperBar"

	var_18_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_18_0.HelperBar:setPriority(10)
	var_18_0:addElement(var_18_0.HelperBar)

	local var_18_2 = var_18_0
	local var_18_3

	if Engine.DDJFBBJAIG() then
		local var_18_4 = LUI.UIImage.new()

		var_18_4.id = "ReticleBackground"

		var_18_4:SetRGBFromInt(0, 0)
		var_18_4:SetAlpha(0.5, 0)
		var_18_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
		var_18_0:addElement(var_18_4)

		var_18_0.ReticleBackground = var_18_4
	end

	local var_18_5

	if CONDITIONS.InGame(var_18_0) then
		local var_18_6 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_18_1
		})

		var_18_6.id = "InGameMenuBackground"

		var_18_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_18_0:addElement(var_18_6)

		var_18_0.InGameMenuBackground = var_18_6
	end

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "TabBacker"

	var_18_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_18_0:addElement(var_18_8)

	var_18_0.TabBacker = var_18_8

	local var_18_9
	local var_18_10 = LUI.UIImage.new()

	var_18_10.id = "Scope"

	var_18_10:setImage(RegisterMaterial("mp_reticle_scope_4x"), 0)
	var_18_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -506, _1080p * 518, _1080p * -1022, _1080p * 2)
	var_18_0:addElement(var_18_10)

	var_18_0.Scope = var_18_10

	local var_18_11
	local var_18_12 = {
		scrollingThresholdX = 0,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 12,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_18_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericLootButton", {
				controllerIndex = var_18_1
			})
		end,
		refreshChild = function(arg_20_0, arg_20_1, arg_20_2)
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
	local var_18_13 = LUI.UIGrid.new(var_18_12)

	var_18_13.id = "ReticleGrid"

	var_18_13:SetScale(-0.1, 0)
	var_18_13:setUseStencil(true)
	var_18_13:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 7, _1080p * 1797, _1080p * -254, _1080p * -113)
	var_18_0:addElement(var_18_13)

	var_18_0.ReticleGrid = var_18_13

	local var_18_14
	local var_18_15 = LUI.UIImage.new()

	var_18_15.id = "Preview"

	var_18_15:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -94, _1080p * 106, _1080p * -675, _1080p * -475)
	var_18_0:addElement(var_18_15)

	var_18_0.Preview = var_18_15

	local var_18_16
	local var_18_17 = LUI.UIImage.new()

	var_18_17.id = "PreviewLockIcon"

	var_18_17:SetAlpha(0, 0)
	var_18_17:setImage(RegisterMaterial("icon_waypoint_locked"), 0)
	var_18_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * -175, _1080p * -25)
	var_18_0:addElement(var_18_17)

	var_18_0.PreviewLockIcon = var_18_17

	local var_18_18
	local var_18_19 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_18_1
	})

	var_18_19.id = "MenuTitle"

	var_18_19.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/RETICLE_SELECT"), 0)
	var_18_19.Line:SetLeft(0, 0)
	var_18_19:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_18_0:addElement(var_18_19)

	var_18_0.MenuTitle = var_18_19

	local var_18_20

	if CONDITIONS.InFrontend(var_18_0) then
		var_18_20 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_18_1
		})
		var_18_20.id = "LobbyMembersFooter"

		var_18_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_18_0:addElement(var_18_20)

		var_18_0.LobbyMembersFooter = var_18_20
	end

	local var_18_21
	local var_18_22 = MenuBuilder.BuildRegisteredType("WeaponCustomizationPanel", {
		controllerIndex = var_18_1
	})

	var_18_22.id = "ReticlePanel"

	var_18_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 365, _1080p * 645)
	var_18_0:addElement(var_18_22)

	var_18_0.ReticlePanel = var_18_22

	local var_18_23
	local var_18_24 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_18_1
	})

	var_18_24.id = "Scrollbar"

	var_18_24:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1713, _1080p * 1723, _1080p * -247, _1080p * -121)
	var_18_0:addElement(var_18_24)

	var_18_0.Scrollbar = var_18_24

	local var_18_25
	local var_18_26 = LUI.UIText.new()

	var_18_26.id = "ToggleHybridPrompt"

	var_18_26:SetAlpha(0, 0)
	var_18_26:setText(Engine.CBBHFCGDIC("LUA_MENU/TOGGLE_HYBRID"), 0)
	var_18_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_26:SetAlignment(LUI.Alignment.Left)
	var_18_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 466, _1080p * 797, _1080p * 821)
	var_18_0:addElement(var_18_26)

	var_18_0.ToggleHybridPrompt = var_18_26

	local var_18_27
	local var_18_28 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_18_1
	})

	var_18_28.id = "GunsmithWeaponLevel"

	var_18_28:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_18_0:addElement(var_18_28)

	var_18_0.GunsmithWeaponLevel = var_18_28

	local function var_18_29()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_29

	local var_18_30

	if CONDITIONS.InFrontend(var_18_0) then
		local var_18_31 = {
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

		var_18_20:RegisterAnimationSequence("RU", var_18_31)
	end

	local function var_18_32()
		if CONDITIONS.InFrontend(var_18_0) then
			var_18_20:AnimateSequence("RU")
		end
	end

	var_18_0._sequences.RU = var_18_32

	local function var_18_33()
		return
	end

	var_18_0._sequences.UnlockedPrompt = var_18_33

	local var_18_34
	local var_18_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 661
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 679
		}
	}

	var_18_26:RegisterAnimationSequence("LockedPrompt", var_18_35)

	local function var_18_36()
		var_18_26:AnimateSequence("LockedPrompt")
	end

	var_18_0._sequences.LockedPrompt = var_18_36

	local var_18_37
	local var_18_38 = {
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

	var_18_10:RegisterAnimationSequence("ScopeImage2x1", var_18_38)

	local function var_18_39()
		var_18_10:AnimateSequence("ScopeImage2x1")
	end

	var_18_0._sequences.ScopeImage2x1 = var_18_39

	local var_18_40
	local var_18_41 = {
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

	var_18_10:RegisterAnimationSequence("ScopeImage1x1", var_18_41)

	local function var_18_42()
		var_18_10:AnimateSequence("ScopeImage1x1")
	end

	var_18_0._sequences.ScopeImage1x1 = var_18_42

	local var_18_43 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_18_24,
		startCap = var_18_24.startCap,
		endCap = var_18_24.endCap,
		sliderArea = var_18_24.sliderArea,
		slider = var_18_24.sliderArea and var_18_24.sliderArea.slider,
		fixedSizeSlider = var_18_24.sliderArea and var_18_24.sliderArea.fixedSizeSlider
	})

	var_18_13:AddScrollbar(var_18_43)
	var_18_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_18_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("MENU/WEAPON_CUSTOMIZATION_SELECTION")
	})

	local var_18_44 = LUI.UIBindButton.new()

	var_18_44.id = "selfBindButton"

	var_18_0:addElement(var_18_44)

	var_18_0.bindButton = var_18_44

	var_18_0.bindButton:addEventHandler("button_secondary", function(arg_27_0, arg_27_1)
		if not arg_27_1.controller then
			local var_27_0 = var_18_1
		end

		ACTIONS.LeaveMenu(var_18_0)
	end)
	var_0_10(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("ReticleSelect", ReticleSelect)
LockTable(_M)
