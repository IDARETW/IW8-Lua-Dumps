module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if CONDITIONS.IsSplitscreen() then
		if arg_1_0.ArrowUp then
			arg_1_0.Categories:AddArrow(arg_1_0.ArrowUp)
		end

		if arg_1_0.ArrowDown then
			arg_1_0.Categories:AddArrow(arg_1_0.ArrowDown)
		end

		if arg_1_0.ListCount then
			arg_1_0.Categories:AddItemNumbers(arg_1_0.ListCount)
		end

		if CONDITIONS.InGame(arg_1_0) then
			ACTIONS.AnimateSequence(arg_1_0, "Splitscreen")
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.WeaponName:setText(WEAPON.GetName(arg_2_0._weaponTable.weapon))
	arg_2_0.WeaponWithAttachments:UpdateWithWeaponTable(arg_2_1, false, arg_2_0._weaponTable)
	arg_2_0.WeaponAttributes:Setup(arg_2_0._weaponTable)

	local var_2_0 = 0

	for iter_2_0, iter_2_1 in ipairs(arg_2_0._weaponTable.attachments) do
		if iter_2_1.ref ~= ATTACHMENT.none then
			var_2_0 = var_2_0 + 1
		end
	end

	ATTACHMENT.SetupSlotDisplay(arg_2_0.EquippedCount, {
		weaponTable = arg_2_0._weaponTable
	})
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0) do
		if arg_3_1[iter_3_1] and #arg_3_1[iter_3_1] > 0 then
			table.insert(var_3_0, iter_3_1)
		end
	end

	return var_3_0
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._weaponTable = WEAPON.GenerateWeaponTable(arg_4_2)
	arg_4_0._blockedCategories = GUNSMITH.GetBlockedCategories(arg_4_0._weaponTable)

	arg_4_0.Categories:RefreshContent()
	var_0_1(arg_4_0, arg_4_1)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	var_0_0(arg_5_0, arg_5_1)
	assert(arg_5_0.Categories)
	assert(arg_5_0.MenuTitle)
	assert(arg_5_0.WeaponWithAttachments)
	assert(arg_5_0.bindButton)

	if Engine.BHICADFIHA() then
		if not arg_5_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for InGameGunsmith menu. Only OK after a MyChanges.")

			arg_5_2.loadoutIndex = 0
		end

		if not arg_5_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for InGameGunsmith menu. Only OK after a MyChanges.")

			arg_5_2.weaponSlot = 0
		end
	end

	assert(arg_5_2.loadoutIndex)
	assert(arg_5_2.weaponSlot)

	local var_5_0 = PlayerData.BFFBGAJGD(arg_5_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_5_2.loadoutIndex]

	if CONDITIONS.IsWaveGameType() then
		var_5_0 = PlayerData.BFFBGAJGD(arg_5_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadoutWaveMode
	end

	local var_5_1 = var_5_0.weaponSetups[arg_5_2.weaponSlot]

	arg_5_0._weaponTable = WEAPON.GenerateWeaponTable(var_5_1)
	arg_5_0._blockedCategories = GUNSMITH.GetBlockedCategories(arg_5_0._weaponTable)

	local var_5_2 = LUI.FlowManager.GetScopedData(arg_5_0)

	if not var_5_2.startTime then
		var_5_2.startTime = Engine.DCJHCAFIIA()
		var_5_2.previousItemID = arg_5_0._weaponTable.lootID
	end

	local var_5_3 = GUNSMITH.GetAttachmentCategories(arg_5_0._weaponTable.weapon)
	local var_5_4 = GUNSMITH.GetAttachmentsAndBucketItems(arg_5_1, arg_5_0._weaponTable.weapon, arg_5_0._weaponTable.lootID)
	local var_5_5 = var_0_2(var_5_3, var_5_4)

	arg_5_0.Categories:SetNumChildren(0)
	arg_5_0.Categories:SetRefreshChild(function(arg_6_0, arg_6_1, arg_6_2)
		local var_6_0 = arg_5_0.Categories:GetContentIndex(arg_6_1, arg_6_2)
		local var_6_1 = var_5_5[var_6_0 + 1]
		local var_6_2 = var_5_4[var_6_1]

		arg_6_0:Setup(arg_5_1, var_6_1, var_6_2, arg_5_0._weaponTable, arg_5_0._blockedCategories[var_6_1])
	end)
	arg_5_0.Categories:SetNumChildren(#var_5_5)
	arg_5_0.Categories:RefreshContent()
	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CAS/GUNSMITH_WEAPON", WEAPON.GetName(arg_5_0._weaponTable.weapon)))
	var_0_1(arg_5_0, arg_5_1)

	local function var_5_6(arg_7_0)
		local var_7_0 = LUI.FlowManager.GetScopedData(arg_7_0)

		if var_7_0.selectedIndex then
			GUNSMITH.EquipAttachment(nil, arg_5_1, ATTACHMENT.none, var_5_1, {
				attachSlot = var_7_0.selectedIndex
			})
			var_0_3(arg_5_0, arg_5_1, var_5_1)
		end
	end

	arg_5_0.bindButton:registerEventHandler("button_alt1", function(arg_8_0, arg_8_1)
		var_5_6(arg_8_0)
	end)
	arg_5_0:addEventHandler("contextual_menu_deselect_category", var_5_6)
	arg_5_0.bindButton:registerEventHandler("button_alt2", function(arg_9_0, arg_9_1)
		ATTACHMENT.ClearAllAttachments(var_5_1)
		var_0_3(arg_5_0, arg_5_1, var_5_1)
	end)

	if CONDITIONS.InGame() and not CONDITIONS.IsThirdGameMode() then
		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			clickable = true,
			priority = 5,
			ignoreTooltip = false,
			side = "left",
			kbmTooltipPromptOverload = "button_dismiss_pause_menu",
			button_ref = "button_start",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
		})
		arg_5_0.bindButton:addEventHandler("button_start", function(arg_10_0, arg_10_1)
			LUI.FlowManager.RequestCloseAllMenus()
		end)
	end

	arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 4,
		gamepad_only = true,
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
	})

	if CONDITIONS.UsingWZLoadouts() then
		arg_5_0.WZWipSnipeBackgroundSceneOverlay:UpdateSnipeOverlay({
			useGunsmithSetup = true,
			weaponRef = arg_5_0._weaponTable.weapon
		})
		arg_5_0.WZWipSnipeIcon:UpdateSnipeIcon({
			selected = true,
			weaponRef = arg_5_0._weaponTable.weapon
		})
	end

	if arg_5_0.InGameMenuBackground then
		ACTIONS.ScaleFullscreen(arg_5_0.InGameMenuBackground)
		ACTIONS.ScaleFullscreen(arg_5_0.Vignette)
	end

	if CONDITIONS.IsWaveGameType() then
		arg_5_0.bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
			return
		end)
		arg_5_0:registerOmnvarHandler("cp_open_cac", function(arg_12_0, arg_12_1)
			if arg_12_1.value == -2 and CONDITIONS.IsWaveGameType() then
				LUI.FlowManager.RequestCloseAllMenus()
			end
		end)
	else
		arg_5_0.bindButton:addEventHandler("button_secondary", function(arg_13_0, arg_13_1)
			local var_13_0 = LUI.FlowManager.GetScopedData(arg_13_0)
			local var_13_1 = LUI.FlowManager.GetScopedData("LoadoutSelect")
			local var_13_2 = Engine.BAHGDJFBEF(Engine.DCJHCAFIIA(), "-" .. var_5_2.startTime)
			local var_13_3 = 0

			METRICS.LootUsageSendDLogEvent(arg_13_0, {
				controllerIndex = arg_5_1,
				startTime = startTime,
				previousItemIDs = previousItemID,
				newItemIDs = newItemID
			})
		end)
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_5_0, "WZSetup")
	end
end

function InGameGunsmith(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0.id = "InGameGunsmith"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	var_14_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_14_1
	})
	var_14_0.HelperBar.id = "HelperBar"

	var_14_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_14_0.HelperBar:setPriority(10)
	var_14_0:addElement(var_14_0.HelperBar)

	local var_14_2 = var_14_0
	local var_14_3

	if CONDITIONS.InGame() then
		local var_14_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_14_1
		})

		var_14_4.id = "InGameMenuBackground"

		var_14_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_14_0:addElement(var_14_4)

		var_14_0.InGameMenuBackground = var_14_4
	end

	local var_14_5

	if CONDITIONS.UsingWZLoadouts() then
		local var_14_6 = MenuBuilder.BuildRegisteredType("WZSnipeBackgroundSceneOverlay", {
			controllerIndex = var_14_1
		})

		var_14_6.id = "WZWipSnipeBackgroundSceneOverlay"

		var_14_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_14_0:addElement(var_14_6)

		var_14_0.WZWipSnipeBackgroundSceneOverlay = var_14_6
	end

	local var_14_7

	if CONDITIONS.AlwaysTrue() then
		local var_14_8 = LUI.UIImage.new()

		var_14_8.id = "Vignette"

		var_14_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
		var_14_8:SetAlpha(0.5, 0)
		var_14_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
		var_14_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -900, 0, 0)
		var_14_0:addElement(var_14_8)

		var_14_0.Vignette = var_14_8
	end

	local var_14_9
	local var_14_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_14_1
	})

	var_14_10.id = "MenuTitle"

	var_14_10.MenuTitle:setText("", 0)
	var_14_10.Line:SetLeft(0, 0)
	var_14_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_14_0:addElement(var_14_10)

	var_14_0.MenuTitle = var_14_10

	local var_14_11
	local var_14_12 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_14_1
	})

	var_14_12.id = "Background"

	var_14_12:SetAlpha(0.75, 0)
	var_14_12.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_14_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 702, _1080p * 1190, _1080p * 178, _1080p * 676)
	var_14_0:addElement(var_14_12)

	var_14_0.Background = var_14_12

	local var_14_13
	local var_14_14 = LUI.UIText.new()

	var_14_14.id = "WeaponName"

	var_14_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_14_14:setText("", 0)
	var_14_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_14_14:SetAlignment(LUI.Alignment.Left)
	var_14_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 768, _1080p * 1132, _1080p * 200, _1080p * 230)
	var_14_0:addElement(var_14_14)

	var_14_0.WeaponName = var_14_14

	local var_14_15
	local var_14_16 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_14_1
	})

	var_14_16.id = "WeaponAttributes"

	var_14_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 740, _1080p * 1152, _1080p * 449, _1080p * 641)
	var_14_0:addElement(var_14_16)

	var_14_0.WeaponAttributes = var_14_16

	local var_14_17
	local var_14_18 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		maxVisibleRows = SubtractForSplitscreen(9, 5),
		controllerIndex = var_14_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("InGameGunsmithCategory", {
				controllerIndex = var_14_1
			})
		end,
		refreshChild = function(arg_16_0, arg_16_1, arg_16_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 424,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_14_19 = LUI.UIGrid.new(var_14_18)

	var_14_19.id = "Categories"

	var_14_19:setUseStencil(true)
	var_14_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 520, _1080p * 178, _1080p * 979)
	var_14_0:addElement(var_14_19)

	var_14_0.Categories = var_14_19

	local var_14_20
	local var_14_21 = MenuBuilder.BuildRegisteredType("WeaponWithAttachments", {
		controllerIndex = var_14_1
	})

	var_14_21.id = "WeaponWithAttachments"

	var_14_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 840, _1080p * 1096, _1080p * 281, _1080p * 409)
	var_14_0:addElement(var_14_21)

	var_14_0.WeaponWithAttachments = var_14_21

	local var_14_22
	local var_14_23 = MenuBuilder.BuildRegisteredType("GunsmithEquippedSlots", {
		controllerIndex = var_14_1
	})

	var_14_23.id = "EquippedCount"

	var_14_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 428, _1080p * 121, _1080p * 153)
	var_14_0:addElement(var_14_23)

	var_14_0.EquippedCount = var_14_23

	local var_14_24

	if CONDITIONS.InGame() then
		local var_14_25 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_14_1
		})

		var_14_25.id = "InGameMenuTimerStatus"

		var_14_25:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -140, _1080p * 260, _1080p * 54, _1080p * 104)
		var_14_0:addElement(var_14_25)

		var_14_0.InGameMenuTimerStatus = var_14_25
	end

	local var_14_26

	if CONDITIONS.IsSplitscreen() then
		var_14_26 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
			controllerIndex = var_14_1
		})
		var_14_26.id = "ArrowUp"

		var_14_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -752, _1080p * -720, _1080p * 533, _1080p * 565)
		var_14_0:addElement(var_14_26)

		var_14_0.ArrowUp = var_14_26
	end

	local var_14_27

	if CONDITIONS.IsSplitscreen() then
		var_14_27 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
			controllerIndex = var_14_1
		})
		var_14_27.id = "ArrowDown"

		var_14_27.Arrow:SetZRotation(180, 0)
		var_14_27:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -584, _1080p * -552, _1080p * 533, _1080p * 565)
		var_14_0:addElement(var_14_27)

		var_14_0.ArrowDown = var_14_27
	end

	local var_14_28

	if CONDITIONS.IsSplitscreen() then
		var_14_28 = LUI.UIText.new()
		var_14_28.id = "ListCount"

		var_14_28:SetRGBFromTable(SWATCHES.text.primaryText, 0)
		var_14_28:setText("", 0)
		var_14_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_14_28:SetAlignment(LUI.Alignment.Center)
		var_14_28:SetVerticalAlignment(LUI.Alignment.Center)
		var_14_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -720, _1080p * -584, _1080p * 540, _1080p * 560)
		var_14_0:addElement(var_14_28)

		var_14_0.ListCount = var_14_28
	end

	local var_14_29

	if CONDITIONS.IsWaveGameType() then
		var_14_29 = MenuBuilder.BuildRegisteredType("PurchaseWidget", {
			controllerIndex = var_14_1
		})
		var_14_29.id = "PurchaseWidget"

		var_14_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 702, _1080p * 1190, _1080p * 785, _1080p * 929)
		var_14_0:addElement(var_14_29)

		var_14_0.PurchaseWidget = var_14_29
	end

	local var_14_30

	if CONDITIONS.IsWaveGameType() then
		var_14_30 = MenuBuilder.BuildRegisteredType("WaveTimer", {
			controllerIndex = var_14_1
		})
		var_14_30.id = "WaveTimer"

		var_14_30.ReinforcementsText:setText(Engine.CBBHFCGDIC("COOP_GAME_PLAY/RESPAWN_COUNTDOWN"), 0)
		var_14_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1385, _1080p * 1670, _1080p * 240, _1080p * 374)
		var_14_0:addElement(var_14_30)

		var_14_0.WaveTimer = var_14_30
	end

	local var_14_31
	local var_14_32 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_14_1
	})

	var_14_32.id = "Scrollbar"

	var_14_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 522, _1080p * 533, _1080p * 178, _1080p * 528)
	var_14_0:addElement(var_14_32)

	var_14_0.Scrollbar = var_14_32

	local var_14_33

	if CONDITIONS.UsingWZLoadouts() then
		local var_14_34 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
			controllerIndex = var_14_1
		})

		var_14_34.id = "WZWipSnipeIcon"

		var_14_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1052, _1080p * 1180, _1080p * 188, _1080p * 220)
		var_14_0:addElement(var_14_34)

		var_14_0.WZWipSnipeIcon = var_14_34
	end

	local function var_14_35()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_35

	local var_14_36
	local var_14_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 598
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1521
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 497
		}
	}

	var_14_12:RegisterAnimationSequence("Splitscreen", var_14_37)

	local var_14_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 638
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1002
		}
	}

	var_14_14:RegisterAnimationSequence("Splitscreen", var_14_38)

	local var_14_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1083
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1495
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 230
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 422
		}
	}

	var_14_16:RegisterAnimationSequence("Splitscreen", var_14_39)

	local var_14_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 710
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 966
		}
	}

	var_14_21:RegisterAnimationSequence("Splitscreen", var_14_40)

	if CONDITIONS.IsWaveGameType() then
		local var_14_41 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1539
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 337
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1919
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 481
			}
		}

		var_14_29:RegisterAnimationSequence("Splitscreen", var_14_41)
	end

	if CONDITIONS.IsWaveGameType() then
		local var_14_42 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1539
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 200
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1824
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 334
			}
		}

		var_14_30:RegisterAnimationSequence("Splitscreen", var_14_42)
	end

	local function var_14_43()
		var_14_12:AnimateSequence("Splitscreen")
		var_14_14:AnimateSequence("Splitscreen")
		var_14_16:AnimateSequence("Splitscreen")
		var_14_21:AnimateSequence("Splitscreen")

		if CONDITIONS.IsWaveGameType() then
			var_14_29:AnimateSequence("Splitscreen")
		end

		if CONDITIONS.IsWaveGameType() then
			var_14_30:AnimateSequence("Splitscreen")
		end
	end

	var_14_0._sequences.Splitscreen = var_14_43

	local var_14_44
	local var_14_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 203
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1004
		}
	}

	var_14_19:RegisterAnimationSequence("DisplayExtraAttachments", var_14_45)

	local var_14_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 156
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 188
		}
	}

	var_14_23:RegisterAnimationSequence("DisplayExtraAttachments", var_14_46)

	if CONDITIONS.IsSplitscreen() then
		local var_14_47 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 558
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 590
			}
		}

		var_14_26:RegisterAnimationSequence("DisplayExtraAttachments", var_14_47)
	end

	if CONDITIONS.IsSplitscreen() then
		local var_14_48 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 558
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 590
			}
		}

		var_14_27:RegisterAnimationSequence("DisplayExtraAttachments", var_14_48)
	end

	if CONDITIONS.IsSplitscreen() then
		local var_14_49 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 565
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 585
			}
		}

		var_14_28:RegisterAnimationSequence("DisplayExtraAttachments", var_14_49)
	end

	local var_14_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 203
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 553
		}
	}

	var_14_32:RegisterAnimationSequence("DisplayExtraAttachments", var_14_50)

	local function var_14_51()
		var_14_19:AnimateSequence("DisplayExtraAttachments")
		var_14_23:AnimateSequence("DisplayExtraAttachments")

		if CONDITIONS.IsSplitscreen() then
			var_14_26:AnimateSequence("DisplayExtraAttachments")
		end

		if CONDITIONS.IsSplitscreen() then
			var_14_27:AnimateSequence("DisplayExtraAttachments")
		end

		if CONDITIONS.IsSplitscreen() then
			var_14_28:AnimateSequence("DisplayExtraAttachments")
		end

		var_14_32:AnimateSequence("DisplayExtraAttachments")
	end

	var_14_0._sequences.DisplayExtraAttachments = var_14_51

	local var_14_52
	local var_14_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 979
		}
	}

	var_14_19:RegisterAnimationSequence("HideExtraAttachments", var_14_53)

	local var_14_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 121
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 153
		}
	}

	var_14_23:RegisterAnimationSequence("HideExtraAttachments", var_14_54)

	if CONDITIONS.IsSplitscreen() then
		local var_14_55 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 533
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 565
			}
		}

		var_14_26:RegisterAnimationSequence("HideExtraAttachments", var_14_55)
	end

	if CONDITIONS.IsSplitscreen() then
		local var_14_56 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 533
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 565
			}
		}

		var_14_27:RegisterAnimationSequence("HideExtraAttachments", var_14_56)
	end

	if CONDITIONS.IsSplitscreen() then
		local var_14_57 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 540
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 560
			}
		}

		var_14_28:RegisterAnimationSequence("HideExtraAttachments", var_14_57)
	end

	local var_14_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 528
		}
	}

	var_14_32:RegisterAnimationSequence("HideExtraAttachments", var_14_58)

	local function var_14_59()
		var_14_19:AnimateSequence("HideExtraAttachments")
		var_14_23:AnimateSequence("HideExtraAttachments")

		if CONDITIONS.IsSplitscreen() then
			var_14_26:AnimateSequence("HideExtraAttachments")
		end

		if CONDITIONS.IsSplitscreen() then
			var_14_27:AnimateSequence("HideExtraAttachments")
		end

		if CONDITIONS.IsSplitscreen() then
			var_14_28:AnimateSequence("HideExtraAttachments")
		end

		var_14_32:AnimateSequence("HideExtraAttachments")
	end

	var_14_0._sequences.HideExtraAttachments = var_14_59

	local var_14_60
	local var_14_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_bkg_challenge"),
			child = var_14_0.Background.WZWipPromptBackground
		}
	}

	var_14_12:RegisterAnimationSequence("WZSetup", var_14_61)

	local var_14_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_14_14:RegisterAnimationSequence("WZSetup", var_14_62)

	local function var_14_63()
		var_14_12:AnimateSequence("WZSetup")
		var_14_14:AnimateSequence("WZSetup")
	end

	var_14_0._sequences.WZSetup = var_14_63

	ACTIONS.AnimateSequenceByElement(var_14_0, {
		elementPath = "self.WeaponAttributes",
		sequenceName = "Gunsmith",
		elementName = "WeaponAttributes"
	})

	local var_14_64 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_14_32,
		startCap = var_14_32.startCap,
		endCap = var_14_32.endCap,
		sliderArea = var_14_32.sliderArea,
		slider = var_14_32.sliderArea and var_14_32.sliderArea.slider,
		fixedSizeSlider = var_14_32.sliderArea and var_14_32.sliderArea.fixedSizeSlider
	})

	var_14_19:AddScrollbar(var_14_64)
	var_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = -2,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("CAS/SELECT")
	})
	var_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt2",
		priority = 5,
		helper_text = Engine.CBBHFCGDIC("CAS/DESELECT_ALL")
	})

	local var_14_65 = LUI.UIBindButton.new()

	var_14_65.id = "selfBindButton"

	var_14_0:addElement(var_14_65)

	var_14_0.bindButton = var_14_65

	var_14_0.bindButton:addEventHandler("button_secondary", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_14_1
		end

		ACTIONS.LeaveMenu(var_14_0)
	end)
	var_0_4(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("InGameGunsmith", InGameGunsmith)
LockTable(_M)
