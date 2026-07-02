module(..., package.seeall)

local var_0_0 = 12

local function var_0_1(arg_1_0)
	local var_1_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("CAS/NAME_WARNING")
	}
	local var_1_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_1_0)

	var_1_1.id = "NameWarningPopup"

	return var_1_1
end

MenuBuilder.registerType("NameWarningPopup", var_0_1)

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = LUI.FlowManager.GetScopedData(arg_2_0)

	arg_2_0._tempName = arg_2_2

	arg_2_0.ModificationDisplay.ModName:setText(Engine.JCBDICCAH(ToUpperCase(arg_2_2)))
	ACTIONS.AnimateSequence(arg_2_0.ModificationDisplay, "ActiveName")
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	if arg_3_0._tempName and #arg_3_0._tempName > 0 then
		arg_3_3.modSlot = arg_3_2
		arg_3_0._weaponTable.blueprintName = GUNSMITH.GenerateModName(arg_3_0._tempName, arg_3_2)

		GUNSMITH.SaveAsCustomMod(arg_3_1, arg_3_0._weaponTable, arg_3_2)
		arg_3_4.blueprintName:set(arg_3_0._weaponTable.blueprintName)

		arg_3_3.weaponRef = arg_3_0._weaponTable.weapon

		local var_3_0 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "icon_mod",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("CAS/MODIFICATION_ADDED"),
			description = Engine.JCBDICCAH(GUNSMITH.GetCustomModName(arg_3_0._weaponTable.blueprintName)),
			type = LUI.ToastManager.NotificationType.None,
			controllerIndex = arg_3_1
		}

		arg_3_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_3_0
		})
		LUI.FlowManager.RequestAddMenu("ModificationPreview", true, arg_3_1, true, arg_3_3)
	else
		LUI.FlowManager.RequestPopupMenu(nil, "NameWarningPopup", true, arg_3_1)
	end
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.ModificationDisplay)
	assert(arg_4_0.CreateModButton)
	assert(arg_4_0.EnterName)
	assert(arg_4_0.CreateNewButton)

	if Engine.BHICADFIHA() then
		if not arg_4_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for SaveCustomMod menu. Only OK after a MyChanges.")

			arg_4_2.loadoutIndex = 0
		end

		if not arg_4_2.weaponIndex then
			DebugPrint("WARNING: Missing \"weaponIndex\" option for SaveCustomMod menu. Only OK after a MyChanges.")

			arg_4_2.weaponIndex = 0
		end

		if not arg_4_2.modSlot then
			DebugPrint("WARNING: Missing \"modSlot\" option for SaveCustomMod menu. Only OK after a MyChanges.")

			arg_4_2.modSlot = 0
		end
	end

	assert(arg_4_2.loadoutIndex)
	assert(arg_4_2.weaponIndex)
	assert(arg_4_2.modSlot)

	local var_4_0 = PlayerData.BFFBGAJGD(arg_4_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_4_2.loadoutIndex].weaponSetups[arg_4_2.weaponIndex]

	arg_4_0._weaponTable = WEAPON.GenerateWeaponTable(var_4_0)

	arg_4_0.ModificationDisplay:Setup(arg_4_0._weaponTable)

	arg_4_0._tempName = ""

	if #arg_4_0._weaponTable.blueprintName > 0 then
		arg_4_0._tempName = GUNSMITH.GetCustomModName(arg_4_0._weaponTable.blueprintName)

		arg_4_0.ModificationDisplay.ModName:setText(ToUpperCase(arg_4_0._tempName))
		ACTIONS.AnimateSequence(arg_4_0.ModificationDisplay, "ActiveName")
		arg_4_0.CreateModButton.Text:setText(Engine.CBBHFCGDIC("CAS/UPDATE_MOD"))

		arg_4_0._updatingMod = true
	end

	LUI.AddUIHoldButtonLogic(arg_4_0.CreateModButton, arg_4_1, {
		clickKeyboardAndMouse = true,
		requireFocus = true,
		duration = 1000,
		buttons = {
			primary = true
		},
		fill = arg_4_0.CreateModButton.GenericProgressBar,
		onFill = function(arg_5_0, arg_5_1)
			var_0_3(arg_4_0, arg_4_1, arg_4_2.modSlot, arg_4_2, var_4_0)
		end
	})
	arg_4_0.EnterName:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		local var_6_0 = LUI.FlowManager.GetScopedData(arg_6_0)

		OSK.CBJGJDGFC(arg_4_1, Engine.CBBHFCGDIC("CAS/ENTER_NAME"), arg_4_0._tempName, var_0_0, true, true, true, function(arg_7_0, arg_7_1)
			if arg_7_1 then
				var_0_2(arg_4_0, arg_7_0, arg_7_1, arg_4_2.modSlot)
			end
		end)
	end)

	arg_4_0.EnterName.navigation = {}
	arg_4_0.EnterName.navigation.down = arg_4_0.CreateModButton
	arg_4_0.EnterName.navigation.up = arg_4_0.CreateModButton
	arg_4_0.CreateModButton.navigation = {}
	arg_4_0.CreateModButton.navigation.down = arg_4_0.EnterName
	arg_4_0.CreateModButton.navigation.up = arg_4_0.EnterName

	if not arg_4_0._updatingMod then
		arg_4_0.CreateNewButton:closeTree()

		arg_4_0.CreateNewButton = nil
	else
		arg_4_0.CreateModButton.navigation.down = arg_4_0.CreateNewButton
		arg_4_0.EnterName.navigation.up = arg_4_0.CreateNewButton
		arg_4_0.CreateNewButton.navigation = {}
		arg_4_0.CreateNewButton.navigation.down = arg_4_0.EnterName
		arg_4_0.CreateNewButton.navigation.up = arg_4_0.CreateModButton

		LUI.AddUIHoldButtonLogic(arg_4_0.CreateNewButton, arg_4_1, {
			clickKeyboardAndMouse = true,
			requireFocus = true,
			duration = 1000,
			buttons = {
				primary = true
			},
			fill = arg_4_0.CreateNewButton.GenericProgressBar,
			onFill = function(arg_8_0, arg_8_1)
				local var_8_0 = LOOT.GetItemID(LOOT.itemTypes.WEAPON, arg_4_0._weaponTable.weapon)
				local var_8_1 = GUNSMITH.GetFirstFreeCustomModSlot(arg_4_1, arg_4_0._weaponTable.weapon, var_8_0)

				if var_8_1 then
					var_0_3(arg_4_0, arg_4_1, var_8_1, arg_4_2, var_4_0)
				else
					LUI.FlowManager.RequestPopupMenu(nil, "CustomModSlotsFull", true, arg_4_1, false, {
						weaponRef = arg_4_0._weaponTable.weapon
					})
				end
			end
		})
	end

	ACTIONS.ScaleFullscreen(arg_4_0.Darkener)
end

function SaveCustomMod(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0.id = "SaveCustomMod"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Darkener"

	var_9_4:SetRGBFromInt(0, 0)
	var_9_4:SetAlpha(0.8, 0)
	var_9_4:SetScale(1, 0)
	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 269, _1080p * -270)
	var_9_0:addElement(var_9_4)

	var_9_0.Darkener = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "GenericPopupWindow"

	var_9_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -370, _1080p * 370)
	var_9_0:addElement(var_9_6)

	var_9_0.GenericPopupWindow = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("ModificationDisplay", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "ModificationDisplay"

	var_9_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -498, _1080p * 498, _1080p * -243, _1080p * 193)
	var_9_0:addElement(var_9_8)

	var_9_0.ModificationDisplay = var_9_8

	local var_9_9
	local var_9_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_9_1
	})

	var_9_10.id = "EnterName"

	var_9_10.Text:SetLeft(_1080p * 20, 0)
	var_9_10.Text:setText(Engine.CBBHFCGDIC("CAS/ENTER_NAME"), 0)
	var_9_10.Text:SetAlignment(LUI.Alignment.Center)
	var_9_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 220, _1080p * 258)
	var_9_0:addElement(var_9_10)

	var_9_0.EnterName = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "CreateModButton"

	var_9_12.GenericProgressBar.DialogueBackground:SetAlpha(0, 0)
	var_9_12.Text:setText(Engine.CBBHFCGDIC("CAS/SAVE_MOD"), 0)
	var_9_12.Text:SetAlignment(LUI.Alignment.Center)
	var_9_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 265, _1080p * 303)
	var_9_0:addElement(var_9_12)

	var_9_0.CreateModButton = var_9_12

	local var_9_13
	local var_9_14 = LUI.UIText.new()

	var_9_14.id = "Title"

	var_9_14:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_9_14:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/SAVE_MOD_TITLE")), 0)
	var_9_14:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_9_14:SetAlignment(LUI.Alignment.Center)
	var_9_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -340, _1080p * -280)
	var_9_0:addElement(var_9_14)

	var_9_0.Title = var_9_14

	local var_9_15
	local var_9_16 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_9_1
	})

	var_9_16.id = "ButtonHelperBar"

	var_9_16.Background:SetAlpha(0, 0)
	var_9_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 370, _1080p * 430)
	var_9_0:addElement(var_9_16)

	var_9_0.ButtonHelperBar = var_9_16

	local var_9_17
	local var_9_18 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_9_1
	})

	var_9_18.id = "CreateNewButton"

	var_9_18.GenericProgressBar.DialogueBackground:SetAlpha(0, 0)
	var_9_18.Text:setText(Engine.CBBHFCGDIC("CAS/CREATE_NEW_MOD"), 0)
	var_9_18.Text:SetAlignment(LUI.Alignment.Center)
	var_9_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 310, _1080p * 348)
	var_9_0:addElement(var_9_18)

	var_9_0.CreateNewButton = var_9_18

	function var_9_0.addButtonHelperFunction(arg_10_0, arg_10_1)
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_9_0:addEventHandler("menu_create", var_9_0.addButtonHelperFunction)

	local var_9_19 = LUI.UIBindButton.new()

	var_9_19.id = "selfBindButton"

	var_9_0:addElement(var_9_19)

	var_9_0.bindButton = var_9_19

	var_9_0.bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_9_1
		end

		ACTIONS.LeaveMenu(var_9_0)
	end)
	var_0_4(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("SaveCustomMod", SaveCustomMod)
LockTable(_M)
