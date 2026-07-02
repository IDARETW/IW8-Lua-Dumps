module(..., package.seeall)

local var_0_0 = {
	equip_c4 = Engine.CBBHFCGDIC("EQUIPMENT/C4_DESC_KBM")
}
local var_0_1 = {
	"equip_throwing_knife_fire"
}

local function var_0_2(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = arg_1_2.loadouts[arg_1_0.loadoutIndex].equipmentSetups[arg_1_0.equipmentIndex].equipment
	local var_1_1 = var_1_0:get() == arg_1_3.ref
	local var_1_2 = MatchRules.BAJDCAAGCG(arg_1_3.ref)
	local var_1_3 = MenuBuilder.BuildRegisteredType("EquipmentButton", {
		controllerIndex = arg_1_1
	})

	assert(var_1_3.Text)

	var_1_3.id = "EquipmentButton"

	var_1_3.Text:setText(Engine.CBBHFCGDIC(arg_1_3.nameRef))
	var_1_3.Icon:setImage(RegisterMaterial(arg_1_3.image))
	var_1_3:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 62, 0)

	local var_1_4 = LOOT.GetItemID(LOOT.itemTypes.EQUIPMENT, arg_1_3.ref)
	local var_1_5 = Loot.HDJCADADF(arg_1_1, var_1_4)

	var_1_3:SetNew(var_1_5, arg_1_3.ref)
	var_1_3:SetSelected(var_1_1)
	var_1_3:SetButtonDisabled(not arg_1_3.isUnlocked)
	var_1_3:SetupRestriction(var_1_2)

	local function var_1_6(arg_2_0)
		arg_1_0._selectedEquipmentName = Engine.CBBHFCGDIC(arg_1_3.nameRef)

		local var_2_0 = Loot.HDJCADADF(arg_1_1, var_1_4)

		arg_1_0.InfoPanel.ItemName:setText(ToUpperCase(arg_1_0._selectedEquipmentName))
		arg_1_0.InfoPanel:SetEquipped(var_1_1)

		local var_2_1 = Engine.CBBHFCGDIC(arg_1_3.desc)

		var_2_1 = not Engine.BGGJFFFAFG(arg_1_1) and var_0_0[arg_1_3.ref] or var_2_1

		local var_2_2 = {
			newDesc = var_2_1,
			isUnlocked = arg_1_3.isUnlocked,
			unlockText = arg_1_3.unlockCriteria,
			isNew = var_2_0,
			isRestricted = CONDITIONS.AreRestrictionsActive(arg_1_1) and var_1_2,
			unlockRank = PROGRESSION.GetUnlockRank(var_1_4)
		}

		arg_1_0.InfoPanel:UpdateDescription(var_2_2)

		if Engine.DDJFBBJAIG() then
			CLIENT_MODEL.SetModel(arg_1_0.equipmentIndex == 0 and CLIENT_MODEL.coreMPModels.LETHAL or CLIENT_MODEL.coreMPModels.TACTICAL, arg_1_3.model)
		end
	end

	var_1_3:addEventHandler("button_over", var_1_6)
	var_1_3:addEventHandler("button_over_disable", var_1_6)
	var_1_3:addEventHandler("button_action", function(arg_3_0)
		local var_3_0 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "cac_equip_fill",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC(arg_1_0.equipmentIndex == 0 and "LUA_MENU/LETHAL_EQUIPPED" or "LUA_MENU/TACTICAL_EQUIPPED"),
			description = Engine.CBBHFCGDIC(arg_1_3.nameRef),
			type = LUI.ToastManager.NotificationType.EquipmentEquipped,
			controllerIndex = arg_1_1
		}

		arg_1_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_3_0
		})
		var_1_0:set(arg_1_3.ref)

		if CONDITIONS.InGame() then
			Engine.EBHIFJCGBH("equip_item_ingame", 1)
		end

		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true)
	end)

	return var_1_3
end

local function var_0_3(arg_4_0, arg_4_1)
	if Engine.DDJFBBJAIG() then
		local var_4_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
			enableSway = true,
			controllerIndex = arg_4_1
		})

		var_4_0:SetSwayValues(4500, 0.06, 0.1)
		var_4_0:SetLimits(-0.3, 0.3, -0.3, 0.3)
		arg_4_0:addElement(var_4_0)

		local var_4_1 = WATCH.GetEquippedWatch(arg_4_1)

		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.GunTablePrimary,
			FrontEndScene.ClientWeapons.GunTableSecondary,
			FrontEndScene.ClientWeapons.Watch
		})

		local var_4_2 = WEAPON.GetWeaponModel(arg_4_1, FrontEndScene.ClientWeapons.Watch, CSV.weaponOffsets.watchFile)

		arg_4_0:addElement(var_4_2)
		LOADOUT.RequestWatchAndWeaponModels(arg_4_1, arg_4_0.loadoutIndex)
		WATCH.SetWatchModelIfLoaded(arg_4_0, arg_4_1, var_4_2, var_4_1)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.InfoPanel)
	assert(arg_5_0.MenuTitle)
	assert(arg_5_0.MenuTitle.MenuTitle)

	arg_5_0._selectedEquipmentName = ""

	arg_5_0.InfoPanel:SetupPanel(arg_5_0.InfoPanel:GetCurrentAnchorsAndPositions())

	if Engine.BHICADFIHA() then
		if not arg_5_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for EquipmentSelect menu. Only OK after a MyChanges.")

			arg_5_2.loadoutIndex = 0
		end

		if not arg_5_2.equipmentIndex then
			DebugPrint("WARNING: Missing \"equipmentIndex\" option for EquipmentSelect menu. Only OK after a MyChanges.")

			arg_5_2.equipmentIndex = 0
		end
	end

	assert(arg_5_2.loadoutIndex)
	assert(arg_5_2.equipmentIndex)
	assert(arg_5_2.equipmentIndex)

	arg_5_0.loadoutIndex = arg_5_2.loadoutIndex

	var_0_3(arg_5_0, arg_5_1)

	arg_5_0.equipmentIndex = arg_5_2.equipmentIndex

	local var_5_0 = arg_5_0.equipmentIndex == 0 and "LUA_MENU/RIG_LETHAL" or "LUA_MENU/RIG_TACTICAL"

	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC(var_5_0))

	local var_5_1 = {}

	for iter_5_0 = 0, StringTable.BFHCAIIDA(CSV.MPEquipment.file) - 1 do
		local var_5_2 = CSV.ReadRow(CSV.MPEquipment, iter_5_0)

		if tonumber(var_5_2.uiSlot) == arg_5_0.equipmentIndex + 1 and tonumber(var_5_2.uiOrder) >= 0 then
			var_5_2.isRestricted = MatchRules.BAJDCAAGCG(var_5_2.ref)

			if Engine.DDJFBBJAIG() or not var_5_2.isRestricted then
				if var_5_2.disableAutoUnlockPrivate == "1" then
					var_5_2.isUnlocked = LOOT.IsUnlocked(arg_5_1, LOOT.itemTypes.EQUIPMENT, var_5_2.ref)
				else
					var_5_2.isUnlocked = PROGRESSION.IsUnlocked(arg_5_1, LOOT.itemTypes.EQUIPMENT, var_5_2.ref)
				end

				var_5_2.order = tonumber(var_5_2.uiOrder)

				if not var_5_2.isUnlocked then
					var_5_2.unlockCriteria = PROGRESSION.GetUnlockText(arg_5_1, LOOT.itemTypes.EQUIPMENT, var_5_2.ref)
				end

				table.insert(var_5_1, var_5_2)
			end
		end
	end

	local function var_5_3(arg_6_0, arg_6_1)
		if arg_6_0.isRestricted ~= arg_6_1.isRestricted then
			return arg_6_1.isRestricted and not arg_6_0.isRestricted
		end

		if arg_6_0.isUnlocked ~= arg_6_1.isUnlocked then
			return arg_6_0.isUnlocked
		end

		if arg_6_0.order ~= arg_6_1.order then
			return arg_6_0.order < arg_6_1.order
		end

		local var_6_0 = Engine.CBBHFCGDIC(arg_6_0.nameRef)
		local var_6_1 = Engine.CBBHFCGDIC(arg_6_1.nameRef)

		if var_6_0 ~= var_6_1 then
			return var_6_0 < var_6_1
		end

		return false
	end

	table.sort(var_5_1, var_5_3)

	local var_5_4 = {
		adjustSizeToContent = true,
		maxVisibleColumns = 1,
		wrapY = true,
		maxRows = 20,
		wrapX = false,
		maxVisibleRows = SubtractForSplitscreen(12, 7),
		controllerIndex = arg_5_1,
		spacingY = _1080p * 4
	}
	local var_5_5 = LUI.UIGrid.new(var_5_4)

	var_5_5.id = "EquipmentGrid"

	var_5_5:setUseStencil(true)
	var_5_5:AddItemNumbers(arg_5_0.ListNumber)
	var_5_5:AddArrow(arg_5_0.ArrowUp)
	arg_5_0.ArrowUp:SetupArrow(LUI.BEARING.up)
	var_5_5:AddArrow(arg_5_0.ArrowDown)
	arg_5_0.ArrowDown:SetupArrow(LUI.BEARING.down)
	var_5_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 216, _1080p * 900)
	arg_5_0:addElement(var_5_5)

	arg_5_0.equipmentGrid = var_5_5

	local var_5_6 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_5_0.VerticalScrollbar,
		startCap = arg_5_0.VerticalScrollbar.startCap,
		endCap = arg_5_0.VerticalScrollbar.endCap,
		sliderArea = arg_5_0.VerticalScrollbar.sliderArea,
		slider = arg_5_0.VerticalScrollbar.sliderArea and arg_5_0.VerticalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_5_0.VerticalScrollbar.sliderArea and arg_5_0.VerticalScrollbar.sliderArea.fixedSizeSlider
	})

	var_5_5:AddScrollbar(var_5_6)

	local var_5_7 = PlayerData.BFFBGAJGD(arg_5_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers
	local var_5_8 = 0
	local var_5_9 = 1
	local var_5_10 = var_5_7.loadouts[arg_5_0.loadoutIndex].equipmentSetups[arg_5_0.equipmentIndex].equipment:get()

	for iter_5_1, iter_5_2 in ipairs(var_5_1) do
		local var_5_11 = var_0_2(arg_5_0, arg_5_1, var_5_7, iter_5_2)

		arg_5_0.equipmentGrid:AddElement(var_5_11)

		if var_5_10 == iter_5_2.ref then
			var_5_9 = iter_5_1 - 1
		end

		if Engine.DDJFBBJAIG() and CONDITIONS.AreRestrictionsActive() then
			var_5_11:SetButtonDisabled(iter_5_2.isRestricted)
		end
	end

	local function var_5_12()
		if arg_5_0._selectedIndex then
			return {
				x = 0,
				y = arg_5_0._selectedIndex
			}
		else
			return {
				x = 0,
				y = var_5_9
			}
		end
	end

	arg_5_0.equipmentGrid:SetDefaultFocus(var_5_12)
	arg_5_0.equipmentGrid:RefreshContent()
	arg_5_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		ACTIONS.LeaveMenu(arg_5_0)
	end)
	arg_5_0:addEventHandler("menu_create", function(arg_9_0, arg_9_1)
		if not arg_9_0.equipmentGrid:GetFocusPositionIndex() then
			arg_9_0.equipmentGrid:GetElementAtPosition(0, var_5_9):processEvent({
				name = "gain_focus"
			})
		end
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

	local function var_5_13()
		local var_11_0 = CoD.GetAspectRatioScaleAdjust(0.7)

		arg_5_0.Vignette:SetScale(var_11_0)
	end

	arg_5_0:addAndCallEventHandler("onVideoChange", var_5_13)

	if not CONDITIONS.InGame(arg_5_0) then
		LAYOUT.AddAspectRatioFadeFrame(arg_5_0, arg_5_1)
	end

	if arg_5_0.InGameMenuBackground then
		ACTIONS.ScaleFullscreen(arg_5_0.InGameMenuBackground)
	end

	arg_5_0:registerEventHandler("closing_quick_access_menu", function(arg_12_0, arg_12_1)
		if arg_12_0.equipmentIndex == 0 then
			Engine.DHFCHIIJCA("loadout_showcase_l")
		else
			Engine.DHFCHIIJCA("loadout_showcase_t")
		end

		return true
	end)

	if CONDITIONS.IsSplitscreen(arg_5_0) and CONDITIONS.InGame(arg_5_0) then
		ACTIONS.ScaleFullscreen(arg_5_0.Vignette)
		ACTIONS.AnimateSequence(arg_5_0, "Splitscreen")
	end
end

function EquipmentSelect(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0.id = "EquipmentSelect"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	var_13_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_13_1
	})
	var_13_0.HelperBar.id = "HelperBar"

	var_13_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_13_0.HelperBar:setPriority(10)
	var_13_0:addElement(var_13_0.HelperBar)

	local var_13_2 = var_13_0
	local var_13_3

	if CONDITIONS.InGame(var_13_0) then
		local var_13_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_13_1
		})

		var_13_4.id = "InGameMenuBackground"

		var_13_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_13_0:addElement(var_13_4)

		var_13_0.InGameMenuBackground = var_13_4
	end

	local var_13_5
	local var_13_6 = LUI.UIImage.new()

	var_13_6.id = "Vignette"

	var_13_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_13_6:SetAlpha(0.5, 0)
	var_13_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_13_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1020, 0, 0)
	var_13_0:addElement(var_13_6)

	var_13_0.Vignette = var_13_6

	local var_13_7
	local var_13_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_13_1
	})

	var_13_8.id = "MenuTitle"

	var_13_8.MenuTitle:setText("EQUIPMENT SELECT", 0)
	var_13_8.Line:SetLeft(0, 0)
	var_13_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_13_0:addElement(var_13_8)

	var_13_0.MenuTitle = var_13_8

	local var_13_9
	local var_13_10 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_13_1
	})

	var_13_10.id = "EquippedWidget"

	var_13_10:SetAlpha(0, 0)
	var_13_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 610, _1080p * 760, _1080p * 308, _1080p * 339)
	var_13_0:addElement(var_13_10)

	var_13_0.EquippedWidget = var_13_10

	local var_13_11
	local var_13_12 = LUI.UIStyledText.new()

	var_13_12.id = "ListNumber"

	var_13_12:SetAlpha(0.7, 0)
	var_13_12:setText("", 0)
	var_13_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_12:SetAlignment(LUI.Alignment.Center)
	var_13_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 258, _1080p * 422, _1080p * 980, _1080p * 1006)
	var_13_0:addElement(var_13_12)

	var_13_0.ListNumber = var_13_12

	local var_13_13
	local var_13_14 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_13_1
	})

	var_13_14.id = "ArrowUp"

	var_13_14:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_13_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 226, _1080p * 258, _1080p * 977, _1080p * 1009)
	var_13_0:addElement(var_13_14)

	var_13_0.ArrowUp = var_13_14

	local var_13_15
	local var_13_16 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_13_1
	})

	var_13_16.id = "ArrowDown"

	var_13_16:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_13_16.Arrow:SetZRotation(180, 0)
	var_13_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 422, _1080p * 454, _1080p * 977, _1080p * 1009)
	var_13_0:addElement(var_13_16)

	var_13_0.ArrowDown = var_13_16

	local var_13_17

	if CONDITIONS.InFrontendPublicMP(var_13_0) then
		local var_13_18 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_13_1
		})

		var_13_18.id = "MPPlayerDetails"

		var_13_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_13_0:addElement(var_13_18)

		var_13_0.MPPlayerDetails = var_13_18
	end

	local var_13_19
	local var_13_20 = MenuBuilder.BuildRegisteredType("PerkInfoPanel", {
		controllerIndex = var_13_1
	})

	var_13_20.id = "InfoPanel"

	if CONDITIONS.InFrontend(var_13_0) then
		var_13_20.ActionPrompt:setText("", 0)
	end

	if CONDITIONS.InFrontend(var_13_0) then
		var_13_20.SecondActionPrompt:setText("", 0)
	end

	var_13_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 615, _1080p * 1142, _1080p * 217, _1080p * 308)
	var_13_0:addElement(var_13_20)

	var_13_0.InfoPanel = var_13_20

	local var_13_21

	if CONDITIONS.InFrontend(var_13_0) then
		local var_13_22 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_13_1
		})

		var_13_22.id = "LobbyMembersFooter"

		var_13_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_13_0:addElement(var_13_22)

		var_13_0.LobbyMembersFooter = var_13_22
	end

	local var_13_23

	if CONDITIONS.InGame(var_13_0) then
		local var_13_24 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_13_1
		})

		var_13_24.id = "InGameMenuTimerStatus"

		var_13_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -140, _1080p * 260, _1080p * 54, _1080p * 104)
		var_13_0:addElement(var_13_24)

		var_13_0.InGameMenuTimerStatus = var_13_24
	end

	local var_13_25
	local var_13_26 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_13_1
	})

	var_13_26.id = "VerticalScrollbar"

	var_13_26:SetAlpha(0, 0)
	var_13_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 559, _1080p * 570, _1080p * 217, _1080p * 540)
	var_13_0:addElement(var_13_26)

	var_13_0.VerticalScrollbar = var_13_26

	local var_13_27

	if Engine.DDJFBBJAIG() then
		local var_13_28 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_13_1
		})

		var_13_28.id = "CDLRestrictionTag"

		var_13_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
		var_13_0:addElement(var_13_28)

		var_13_0.CDLRestrictionTag = var_13_28
	end

	local function var_13_29()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_29

	local var_13_30
	local var_13_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 542
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 568
		}
	}

	var_13_12:RegisterAnimationSequence("Splitscreen", var_13_31)

	local var_13_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 540
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 572
		}
	}

	var_13_14:RegisterAnimationSequence("Splitscreen", var_13_32)

	local var_13_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 540
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 572
		}
	}

	var_13_16:RegisterAnimationSequence("Splitscreen", var_13_33)

	local var_13_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_26:RegisterAnimationSequence("Splitscreen", var_13_34)

	local function var_13_35()
		var_13_12:AnimateSequence("Splitscreen")
		var_13_14:AnimateSequence("Splitscreen")
		var_13_16:AnimateSequence("Splitscreen")
		var_13_26:AnimateSequence("Splitscreen")
	end

	var_13_0._sequences.Splitscreen = var_13_35

	var_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/EQUIP")
	})

	local var_13_36 = LUI.UIBindButton.new()

	var_13_36.id = "selfBindButton"

	var_13_0:addElement(var_13_36)

	var_13_0.bindButton = var_13_36

	var_0_4(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("EquipmentSelect", EquipmentSelect)
LockTable(_M)
