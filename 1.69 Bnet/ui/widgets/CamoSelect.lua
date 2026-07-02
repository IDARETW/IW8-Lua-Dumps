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

	local var_5_3 = "CAMOS/DEFAULT"
	local var_5_4 = var_5_1.unlockInfo

	var_5_4.equipped = var_5_2

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_5_5 = WEAPON.GenerateWeaponTable(arg_5_0.weaponPlayerData)

		var_5_4.lockedText = LOOT.IsT9Item({
			type = LOOT.itemTypes.WEAPON,
			ref = var_5_5.weapon
		}) and "LUA_MENU/T9_CHALLENGE_DISCLAIMER" or "LUA_MENU/CHALLENGE_PROGRESS_DISCLAIMER"
	else
		var_5_4.lockedText = "LUA_MENU/CHALLENGE_PROGRESS_DISCLAIMER"
	end

	var_5_4.lockedText = Engine.CBBHFCGDIC(var_5_4.lockedText)
	var_5_4.isAZombieCamo = arg_5_0._isZombieCategory
	var_5_4.isDefaultCamo = var_5_1.name == var_5_3

	arg_5_0.CamoPanel:UpdatePanelInfo(var_5_4)

	if Engine.DDJFBBJAIG() then
		local var_5_6 = WEAPON.GenerateWeaponTable(arg_5_0.weaponPlayerData)

		var_5_6.camo = var_5_1.ref

		local var_5_7 = WEAPON.GetWeaponModelName(var_5_6.weapon, var_5_6, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_5_0._controllerIndex
		})

		FrontEndScene.RequestWeaponViewModels({
			var_5_7
		}, arg_5_0._controllerIndex)
		WEAPON.SetModelIfLoaded(arg_5_0._controllerIndex, arg_5_0.weaponModel, var_5_7, {
			modelWeaponTable = var_5_6
		})
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

local function var_0_10(arg_15_0)
	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_15_0 = LOOT.GetBaseWeaponItemID(arg_15_0._selectedWeapon)
		local var_15_1 = LOOT.GetGameSourceIDFromItemID(var_15_0)

		arg_15_0.WZWipSnipeProgressableMessage:UpdateMessage({
			gameSourceID = var_15_1,
			isZombiesTab = arg_15_0._isZombieCategory,
			isRankedCategory = arg_15_0._isRankedCategory
		})
		ACTIONS.AnimateSequence(arg_15_0, var_15_1 == LUI.GAME_SOURCE_ID.VANGUARD and "VG" or "MWAndCW")
		ACTIONS.AnimateSequence(arg_15_0.WZWipSnipeProgressableMessage, "Show")
	end
end

local function var_0_11(arg_16_0, arg_16_1, arg_16_2)
	assert(arg_16_0.MenuTitle)
	assert(arg_16_0.CamoPanel)
	assert(arg_16_0.CamoGrid)
	arg_16_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CAMO_SELECT_TITLE_WITH_CATEGORY", arg_16_2.category))

	arg_16_0._isZombieCategory = LOOT.IsAZombieCamoCategory(arg_16_2.camoCategoryRef)
	arg_16_0.EquipItem = var_0_2
	arg_16_0.PreviewItem = var_0_3
	arg_16_0.ViewWeapon = var_0_4
	arg_16_0.ViewItem = var_0_5
	arg_16_0.UpdateGrid = var_0_7
	arg_16_0.UpdateBreadcrumb = var_0_9
	arg_16_0._controllerIndex = arg_16_1

	assert(arg_16_2.camoTable)

	arg_16_0._camoTable = arg_16_2.camoTable

	assert(arg_16_2.camoCategoryRef)

	local var_16_0 = "ranked_play"

	arg_16_0._isRankedCategory = arg_16_2.camoCategoryRef == var_16_0

	assert(arg_16_2.loadoutIndex)
	assert(arg_16_2.weaponSlot)
	FrontEndScene.SetExclusiveWeaponModels({
		FrontEndScene.ClientWeapons.Preview
	})

	arg_16_0.weaponModel = WEAPON.GetWeaponModel(arg_16_1, FrontEndScene.ClientWeapons.Preview, CSV.weaponOffsets.previewFile)

	arg_16_0:addElement(arg_16_0.weaponModel)

	arg_16_0.weaponPlayerData = PlayerData.BFFBGAJGD(arg_16_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_16_2.loadoutIndex].weaponSetups[arg_16_2.weaponSlot]
	arg_16_0._weaponRef = arg_16_0.weaponPlayerData.weapon:get()

	WEAPON.SetPreviewSceneForWeapon(arg_16_0._weaponRef)

	arg_16_0._equippedCamo = WEAPON.GetEquippedCamo(arg_16_0.weaponPlayerData)

	arg_16_0.CamoGrid:SetRefreshChild(var_0_8(arg_16_0))
	arg_16_0:UpdateGrid()
	var_0_1(arg_16_0)
	arg_16_0.bindButton:addEventHandler("button_right_stick", function(arg_17_0, arg_17_1)
		arg_16_0:ViewWeapon()

		if arg_17_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end)

	arg_16_0._selectedWeapon = arg_16_0.weaponPlayerData.weapon:get()

	if PROGRESSION.ShouldUnlockAll() then
		arg_16_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_16_0.GunsmithWeaponLevel:Setup(arg_16_1, arg_16_0._selectedWeapon)
	end

	if CONDITIONS.IsWZWipFlowEnabled() and Engine.DDJFBBJAIG() then
		arg_16_0.WZWipSnipeBackgroundSceneOverlay:UpdateSnipeOverlay({
			useGunsmithSetup = true,
			weaponRef = arg_16_0._selectedWeapon
		})
	end

	var_0_10(arg_16_0)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_16_0.TabBacker)
end

function CamoSelect(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0.id = "CamoSelect"
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

	if CONDITIONS.InGame() then
		local var_18_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_18_1
		})

		var_18_4.id = "InGameMenuBackground"

		var_18_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_18_0:addElement(var_18_4)

		var_18_0.InGameMenuBackground = var_18_4
	end

	local var_18_5
	local var_18_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_18_1
	})

	var_18_6.id = "TabBacker"

	var_18_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_18_0:addElement(var_18_6)

	var_18_0.TabBacker = var_18_6

	local var_18_7

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_18_8 = MenuBuilder.BuildRegisteredType("WZSnipeBackgroundSceneOverlay", {
			controllerIndex = var_18_1
		})

		var_18_8.id = "WZWipSnipeBackgroundSceneOverlay"

		var_18_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_18_0:addElement(var_18_8)

		var_18_0.WZWipSnipeBackgroundSceneOverlay = var_18_8
	end

	local var_18_9
	local var_18_10 = {
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
		controllerIndex = var_18_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericLootButton", {
				controllerIndex = var_18_1
			})
		end,
		refreshChild = function(arg_20_0, arg_20_1, arg_20_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 126,
		rowHeight = _1080p * 126,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_18_11 = LUI.UIGrid.new(var_18_10)

	var_18_11.id = "CamoGrid"

	var_18_11:setUseStencil(true)
	var_18_11:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 156, _1080p * 1764, _1080p * -249, _1080p * -104)
	var_18_0:addElement(var_18_11)

	var_18_0.CamoGrid = var_18_11

	local var_18_12
	local var_18_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_18_1
	})

	var_18_13.id = "MenuTitle"

	var_18_13.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CAMO_SELECT_TITLE"), 0)
	var_18_13.Line:SetLeft(0, 0)
	var_18_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_18_0:addElement(var_18_13)

	var_18_0.MenuTitle = var_18_13

	local var_18_14

	if CONDITIONS.InFrontend() then
		local var_18_15 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_18_1
		})

		var_18_15.id = "LobbyMembersFooter"

		var_18_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_18_0:addElement(var_18_15)

		var_18_0.LobbyMembersFooter = var_18_15
	end

	local var_18_16
	local var_18_17 = MenuBuilder.BuildRegisteredType("WeaponCustomizationPanel", {
		controllerIndex = var_18_1
	})

	var_18_17.id = "CamoPanel"

	var_18_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 200, _1080p * 480)
	var_18_0:addElement(var_18_17)

	var_18_0.CamoPanel = var_18_17

	local var_18_18
	local var_18_19 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_18_1
	})

	var_18_19.id = "GunsmithWeaponLevel"

	var_18_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_18_0:addElement(var_18_19)

	var_18_0.GunsmithWeaponLevel = var_18_19

	local var_18_20
	local var_18_21 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbar", {
		controllerIndex = var_18_1
	})

	var_18_21.id = "Scrollbar"

	var_18_21:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 156, _1080p * 1764, _1080p * -101, _1080p * -90)
	var_18_0:addElement(var_18_21)

	var_18_0.Scrollbar = var_18_21

	local var_18_22

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_18_22 = MenuBuilder.BuildRegisteredType("WZSnipeProgressableMessage", {
			controllerIndex = var_18_1
		})
		var_18_22.id = "WZWipSnipeProgressableMessage"

		var_18_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 167, _1080p * 647, _1080p * 793, _1080p * 825)
		var_18_0:addElement(var_18_22)

		var_18_0.WZWipSnipeProgressableMessage = var_18_22
	end

	local function var_18_23()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_23

	local var_18_24

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_18_25 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 167
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 647
			}
		}

		var_18_22:RegisterAnimationSequence("VG", var_18_25)
	end

	local function var_18_26()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_18_22:AnimateSequence("VG")
		end
	end

	var_18_0._sequences.VG = var_18_26

	local var_18_27

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_18_28 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 156
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 636
			}
		}

		var_18_22:RegisterAnimationSequence("MWAndCW", var_18_28)
	end

	local function var_18_29()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_18_22:AnimateSequence("MWAndCW")
		end
	end

	var_18_0._sequences.MWAndCW = var_18_29

	local var_18_30

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_18_31 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 156
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 636
			}
		}

		var_18_22:RegisterAnimationSequence("CW", var_18_31)
	end

	local function var_18_32()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_18_22:AnimateSequence("CW")
		end
	end

	var_18_0._sequences.CW = var_18_32

	local var_18_33 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.horizontal,
		eventListener = var_18_21,
		startCap = var_18_21.startCap,
		endCap = var_18_21.endCap,
		sliderArea = var_18_21.sliderArea,
		slider = var_18_21.sliderArea and var_18_21.sliderArea.slider,
		fixedSizeSlider = var_18_21.sliderArea and var_18_21.sliderArea.fixedSizeSlider
	})

	var_18_11:AddScrollbar(var_18_33)
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
	var_18_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_r3",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
	})

	local var_18_34 = LUI.UIBindButton.new()

	var_18_34.id = "selfBindButton"

	var_18_0:addElement(var_18_34)

	var_18_0.bindButton = var_18_34

	var_18_0.bindButton:addEventHandler("button_secondary", function(arg_25_0, arg_25_1)
		if not arg_25_1.controller then
			local var_25_0 = var_18_1
		end

		ACTIONS.LeaveMenu(var_18_0)
	end)
	var_0_11(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("CamoSelect", CamoSelect)
LockTable(_M)
