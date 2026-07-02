module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.ModificationDisplay)
	assert(arg_1_0.DeleteButton)

	if Engine.BHICADFIHA() then
		if not arg_1_2.modSlot then
			DebugPrint("WARNING: Missing \"modSlot\" option for DeleteCustomMod menu. Only OK after a MyChanges.")

			arg_1_2.modSlot = 0
		end

		if not arg_1_2.weaponRef then
			DebugPrint("WARNING: Missing \"weaponTable\" option for DeleteCustomMod menu. Only OK after a MyChanges.")

			arg_1_2.weaponRef = WEAPON.DefaultPrimary
		end
	end

	assert(arg_1_2.modSlot)
	assert(arg_1_2.weaponRef)

	arg_1_0._modification = GUNSMITH.GetCustomMod(arg_1_1, arg_1_2.weaponRef, arg_1_2.modSlot)

	arg_1_0.ModificationDisplay:Setup(arg_1_0._modification)
	arg_1_0.ModificationDisplay.ModName:setText(ToUpperCase(GUNSMITH.GetCustomModName(arg_1_0._modification.blueprintName)))
	ACTIONS.AnimateSequence(arg_1_0.ModificationDisplay, "ActiveName")

	local function var_1_0()
		local var_2_0 = {
			iconScale = -0.3,
			displayTime = 3000,
			icon = "icon_mod",
			iconColor = SWATCHES.genericMenu.notificationHighlight,
			header = Engine.CBBHFCGDIC("CAS/MODIFICATION_DELETED"),
			description = Engine.JCBDICCAH(GUNSMITH.GetCustomModName(arg_1_0._modification.blueprintName)),
			type = LUI.ToastManager.NotificationType.None,
			controllerIndex = arg_1_1
		}

		arg_1_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_2_0
		})
		GUNSMITH.DeleteCustomMod(arg_1_1, arg_1_0._modification.weapon, arg_1_2.modSlot)

		if arg_1_2.closeLocker then
			LUI.FlowManager.RequestLeaveMenuByName("WeaponLocker")
		end

		LUI.FlowManager.RequestLeaveMenu(arg_1_0)
	end

	LUI.AddUIHoldButtonLogic(arg_1_0.DeleteButton, arg_1_1, {
		clickKeyboardAndMouse = true,
		requireFocus = true,
		duration = 1000,
		buttons = {
			primary = true
		},
		fill = arg_1_0.DeleteButton.GenericProgressBar,
		onFill = function()
			if LUI.IsLastInputGamepad(arg_1_1) then
				var_1_0()
			else
				local var_3_0 = {
					title = Engine.CBBHFCGDIC("MENU/CONFIRMATION_POPUP_TITLE"),
					message = Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MOD_DELETE"),
					yesAction = var_1_0
				}

				LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_1_1, false, var_3_0)
			end
		end
	})
end

function DeleteCustomMod(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "DeleteCustomMod"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Darkener"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0.8, 0)
	var_4_4:SetScale(1, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 269, _1080p * -270)
	var_4_0:addElement(var_4_4)

	var_4_0.Darkener = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericPopupWindow"

	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -324, _1080p * 324)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericPopupWindow = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("ModificationDisplay", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "ModificationDisplay"

	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -498, _1080p * 498, _1080p * -218, _1080p * 218)
	var_4_0:addElement(var_4_8)

	var_4_0.ModificationDisplay = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "Title"

	var_4_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_10:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/DELETE_CUSTOM_MOD")), 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_10:SetAlignment(LUI.Alignment.Center)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -292, _1080p * -232)
	var_4_0:addElement(var_4_10)

	var_4_0.Title = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("GenericHoldButton", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "DeleteButton"

	var_4_12.GenericProgressBar.DialogueBackground:SetAlpha(0, 0)
	var_4_12.Text:setText(Engine.CBBHFCGDIC("CAS/DELETE"), 0)
	var_4_12.Text:SetAlignment(LUI.Alignment.Center)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 251, _1080p * 289)
	var_4_0:addElement(var_4_12)

	var_4_0.DeleteButton = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "ButtonHelperBar"

	var_4_14.Background:SetAlpha(0, 0)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 324, _1080p * 384)
	var_4_0:addElement(var_4_14)

	var_4_0.ButtonHelperBar = var_4_14

	var_4_4:addEventHandler("menu_create", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_4_1
		end

		ACTIONS.ScaleFullscreen(var_4_0)
	end)

	function var_4_0.addButtonHelperFunction(arg_6_0, arg_6_1)
		arg_6_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_6_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_15 = LUI.UIBindButton.new()

	var_4_15.id = "selfBindButton"

	var_4_0:addElement(var_4_15)

	var_4_0.bindButton = var_4_15

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("DeleteCustomMod", DeleteCustomMod)
LockTable(_M)
