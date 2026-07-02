module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.CamoGrid:GetFocusPositionIndex() + 1
end

local function var_0_1(arg_2_0)
	local var_2_0 = (function()
		for iter_3_0, iter_3_1 in ipairs(arg_2_0._camoTable) do
			if arg_2_0._equippedCamo == iter_3_1.ref then
				return iter_3_0 - 1
			end
		end
	end)() or 0
	local var_2_1 = arg_2_0.CamoGrid:GetPositionForIndex(var_2_0)

	arg_2_0.CamoGrid:SetFocusedPosition(var_2_1, true)
end

local function var_0_2(arg_4_0)
	local var_4_0 = var_0_0(arg_4_0)
	local var_4_1 = arg_4_0._camoTable[var_4_0]

	if arg_4_0._equippedCamo == var_4_1.ref then
		var_4_1 = arg_4_0._camoTable[1]
	end

	WEAPON.SetEquippedCamo(arg_4_0.weaponPlayerData, var_4_1.ref)
	arg_4_0:UpdateGrid()

	local var_4_2 = "hud_cmd_active_backer"

	if var_4_1.image ~= "" then
		var_4_2 = var_4_1.image
	end

	local var_4_3 = {
		displayTime = 2000,
		icon = var_4_2,
		header = Engine.CBBHFCGDIC("LUA_MENU/CAMO_EQUIPPED"),
		description = Engine.CBBHFCGDIC(var_4_1.name),
		type = LUI.ToastManager.NotificationType.CamoEquipped,
		controllerIndex = arg_4_0._controllerIndex
	}

	arg_4_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_4_3
	})
end

local function var_0_3(arg_5_0)
	local var_5_0 = var_0_0(arg_5_0)
	local var_5_1 = arg_5_0._camoTable[var_5_0]

	arg_5_0.CamoPanel.Name:setText(ToUpperCase(Engine.CBBHFCGDIC(var_5_1.name)))

	local var_5_2 = arg_5_0._equippedCamo == var_5_1.ref

	if var_5_2 and not arg_5_0.CamoPanel.EquippedWidget.enabled then
		ACTIONS.AnimateSequence(arg_5_0.CamoPanel.EquippedWidget, "TurnOn")
	end

	arg_5_0.CamoPanel.EquippedWidget:UpdateVisibility(var_5_2)

	local var_5_3 = var_5_1.unlockInfo

	var_5_3.equipped = var_5_2
	var_5_3.lockedText = Engine.CBBHFCGDIC("LUA_MENU/CHALLENGE_PROGRESS_DISCLAIMER")

	arg_5_0.CamoPanel:UpdatePanelInfo(var_5_3)

	if Engine.DDJFBBJAIG() then
		local var_5_4 = WEAPON.GenerateWeaponTable(arg_5_0.weaponPlayerData)

		var_5_4.camo = var_5_1.ref

		local var_5_5 = WEAPON.GetWeaponModelName(var_5_4.weapon, var_5_4, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_5_0._controllerIndex
		})

		FrontEndScene.RequestWeaponViewModels({
			var_5_5
		}, arg_5_0._controllerIndex)
		WEAPON.SetModelIfLoaded(arg_5_0._controllerIndex, arg_5_0.weaponModel, var_5_5)
	end
end

local function var_0_4(arg_6_0)
	local var_6_0 = {
		weaponTable = WEAPON.GenerateWeaponTable(arg_6_0.weaponPlayerData)
	}
	local var_6_1 = var_0_0(arg_6_0)
	local var_6_2 = arg_6_0._camoTable[var_6_1]

	var_6_0.weaponTable.camo = var_6_2.ref

	LUI.FlowManager.RequestAddMenu("WeaponPreview", true, controllerIndex, nil, var_6_0, true)
end

local function var_0_5(arg_7_0)
	local var_7_0 = {
		weaponTable = WEAPON.GenerateEmptyWeaponTable(arg_7_0.weaponPlayerData)
	}
	local var_7_1 = var_0_0(arg_7_0)

	if var_7_1 then
		local var_7_2 = arg_7_0._camoTable[var_7_1]

		var_7_0.weaponTable.camo = var_7_2.ref
	end

	LUI.FlowManager.RequestAddMenu("WeaponPreview", true, nil, nil, var_7_0, true)
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_2 ~= "STICKERS/DEFAULT" then
		arg_8_1:SetupContextualMenu({
			title = Engine.CBBHFCGDIC(arg_8_2)
		})

		local var_8_0 = {
			id = "weaponCamoPreview",
			actionName = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_CAMO1"),
			actionFunction = function()
				arg_8_0:ViewItem()
			end
		}

		arg_8_1:AddContextualMenuAction(var_8_0)

		local var_8_1 = {
			id = "weaponPreview",
			actionName = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON"),
			actionFunction = function()
				arg_8_0:ViewWeapon()
			end
		}

		arg_8_1:AddContextualMenuAction(var_8_1)
	end
end

local function var_0_7(arg_11_0)
	arg_11_0._equippedCamo = WEAPON.GetEquippedCamo(arg_11_0.weaponPlayerData)

	arg_11_0.CamoGrid:RemoveFocusFromChild()
	arg_11_0.CamoGrid:SetNumChildren(#arg_11_0._camoTable)
	arg_11_0.CamoGrid:RefreshContent()
end

local function var_0_8(arg_12_0)
	return function(arg_13_0, arg_13_1, arg_13_2)
		local var_13_0 = arg_13_1 + arg_13_2 * arg_12_0.CamoGrid:GetNumColumns()
		local var_13_1 = arg_12_0._camoTable[var_13_0 + 1]

		var_13_1.lootType = LOOT.itemTypes.CAMO
		var_13_1.weaponRef = arg_12_0._weaponRef

		local var_13_2 = arg_12_0._equippedCamo == var_13_1.ref

		arg_13_0:RefreshButton(arg_12_0, var_13_1, var_13_2)
		var_0_6(arg_12_0, arg_13_0, var_13_1.name)
	end
end

local function var_0_9(arg_14_0, arg_14_1)
	arg_14_0.CamoPanel.NewItemNotification:UpdateBreadcrumbByID(arg_14_0._controllerIndex, arg_14_1, true)
end

local function var_0_10(arg_15_0, arg_15_1, arg_15_2)
	assert(arg_15_0.MenuTitle)
	assert(arg_15_0.CamoPanel)
	assert(arg_15_0.CamoGrid)
	arg_15_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CAMO_SELECT_TITLE_WITH_CATEGORY", arg_15_2.category))

	arg_15_0.EquipItem = var_0_2
	arg_15_0.PreviewItem = var_0_3
	arg_15_0.ViewWeapon = var_0_4
	arg_15_0.ViewItem = var_0_5
	arg_15_0.UpdateGrid = var_0_7
	arg_15_0.UpdateBreadcrumb = var_0_9
	arg_15_0._controllerIndex = arg_15_1

	assert(arg_15_2.camoTable)

	arg_15_0._camoTable = arg_15_2.camoTable

	assert(arg_15_2.loadoutIndex)
	assert(arg_15_2.weaponSlot)
	FrontEndScene.SetExclusiveWeaponModels({
		FrontEndScene.ClientWeapons.Preview
	})

	arg_15_0.weaponModel = WEAPON.GetWeaponModel(arg_15_1, FrontEndScene.ClientWeapons.Preview, CSV.weaponOffsets.previewFile)

	arg_15_0:addElement(arg_15_0.weaponModel)

	arg_15_0.weaponPlayerData = PlayerData.BFFBGAJGD(arg_15_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_15_2.loadoutIndex].weaponSetups[arg_15_2.weaponSlot]
	arg_15_0._weaponRef = arg_15_0.weaponPlayerData.weapon:get()

	WEAPON.SetPreviewSceneForWeapon(arg_15_0._weaponRef)

	arg_15_0._equippedCamo = WEAPON.GetEquippedCamo(arg_15_0.weaponPlayerData)

	arg_15_0.CamoGrid:SetRefreshChild(var_0_8(arg_15_0))
	arg_15_0:UpdateGrid()
	var_0_1(arg_15_0)
	arg_15_0.bindButton:addEventHandler("button_right_stick", function(arg_16_0, arg_16_1)
		arg_15_0:ViewWeapon()

		if arg_16_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end)

	local var_15_0 = arg_15_0.weaponPlayerData.weapon:get()

	if PROGRESSION.ShouldUnlockAll() then
		arg_15_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_15_0.GunsmithWeaponLevel:Setup(arg_15_1, var_15_0)
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_15_0.TabBacker)
end

function CamoSelect(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0.id = "CamoSelect"

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

	if CONDITIONS.InGame(var_17_0) then
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
	local var_17_8 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 11,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_17_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericLootButton", {
				controllerIndex = var_17_1
			})
		end,
		refreshChild = function(arg_19_0, arg_19_1, arg_19_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 126,
		rowHeight = _1080p * 126,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_17_9 = LUI.UIGrid.new(var_17_8)

	var_17_9.id = "CamoGrid"

	var_17_9:setUseStencil(true)
	var_17_9:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 156, _1080p * 1764, _1080p * -249, _1080p * -104)
	var_17_0:addElement(var_17_9)

	var_17_0.CamoGrid = var_17_9

	local var_17_10
	local var_17_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_17_1
	})

	var_17_11.id = "MenuTitle"

	var_17_11.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CAMO_SELECT_TITLE"), 0)
	var_17_11.Line:SetLeft(0, 0)
	var_17_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_17_0:addElement(var_17_11)

	var_17_0.MenuTitle = var_17_11

	local var_17_12

	if CONDITIONS.InFrontend(var_17_0) then
		local var_17_13 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_17_1
		})

		var_17_13.id = "LobbyMembersFooter"

		var_17_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_17_0:addElement(var_17_13)

		var_17_0.LobbyMembersFooter = var_17_13
	end

	local var_17_14
	local var_17_15 = MenuBuilder.BuildRegisteredType("WeaponCustomizationPanel", {
		controllerIndex = var_17_1
	})

	var_17_15.id = "CamoPanel"

	var_17_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 200, _1080p * 480)
	var_17_0:addElement(var_17_15)

	var_17_0.CamoPanel = var_17_15

	local var_17_16
	local var_17_17 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_17_1
	})

	var_17_17.id = "GunsmithWeaponLevel"

	var_17_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_17_0:addElement(var_17_17)

	var_17_0.GunsmithWeaponLevel = var_17_17

	local var_17_18
	local var_17_19 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbar", {
		controllerIndex = var_17_1
	})

	var_17_19.id = "Scrollbar"

	var_17_19:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 156, _1080p * 1764, _1080p * -101, _1080p * -90)
	var_17_0:addElement(var_17_19)

	var_17_0.Scrollbar = var_17_19

	local var_17_20 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.horizontal,
		eventListener = var_17_19,
		startCap = var_17_19.startCap,
		endCap = var_17_19.endCap,
		sliderArea = var_17_19.sliderArea,
		slider = var_17_19.sliderArea and var_17_19.sliderArea.slider,
		fixedSizeSlider = var_17_19.sliderArea and var_17_19.sliderArea.fixedSizeSlider
	})

	var_17_9:AddScrollbar(var_17_20)
	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("MENU/WEAPON_CUSTOMIZATION_SELECTION")
	})
	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_r3",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
	})

	local var_17_21 = LUI.UIBindButton.new()

	var_17_21.id = "selfBindButton"

	var_17_0:addElement(var_17_21)

	var_17_0.bindButton = var_17_21

	var_17_0.bindButton:addEventHandler("button_secondary", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_17_1
		end

		ACTIONS.LeaveMenu(var_17_0)
	end)
	var_0_10(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("CamoSelect", CamoSelect)
LockTable(_M)
