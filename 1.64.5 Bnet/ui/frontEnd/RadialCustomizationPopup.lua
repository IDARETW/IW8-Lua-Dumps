module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LUI.IsLastInputGamepad(arg_1_1)

	arg_1_0:SetKeepSelectionWhileInDeadZone(var_1_0 and not arg_1_2)
	arg_1_0:SetUseBothThumbsticks(true)
	arg_1_0:SetActive(true)
	arg_1_0:SetAlpha(1)
	arg_1_0.CancelLabel:setText(var_1_0 and Engine.CBBHFCGDIC("LUA_MENU/BACK") or "")
	arg_1_0.CommandsLabel:setText(var_1_0 and Engine.CBBHFCGDIC("LUA_MENU/ROTATE") or "")
	arg_1_0.CommandsButton:setText(var_1_0 and Engine.CBBHFCGDIC("LUA_MENU/RADIAL_ROTATE_BUTTON") or "")
	arg_1_0.CancelMouseButton:setText(var_1_0 and Engine.CBBHFCGDIC("LUA_MENU/PAD_SECONDARY_BUTTON") or "")
	arg_1_0.SelectButtonLabel:setText(var_1_0 and Engine.CBBHFCGDIC("LUA_MENU/SELECT") or "")
	arg_1_0.SelectButtonPrompt:setText(var_1_0 and Engine.CBBHFCGDIC("LUA_MENU/PAD_PRIMARY_BUTTON") or "")

	if arg_1_2 then
		arg_1_0:SetAllowNavigation(false)
	end

	local var_1_1 = Engine.BBDCAFEGDJ() == 1

	arg_1_0.Hint:setText(var_1_1 and Engine.CBBHFCGDIC("LUA_MENU/GESTURE_HINT") or Engine.CBBHFCGDIC("LUA_MENU/GESTURE_HINT_KBM"))
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.RadialMenu:GetSelectedWidget()

	var_2_0.Icon:setImage(arg_2_0.RadialButton.Image:GetImage())
	ACTIONS.AnimateSequence(var_2_0, "Available")
	ACTIONS.AnimateSequence(var_2_0, "Pulse")

	arg_2_0:Wait(400).onComplete = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.BindButton = LUI.UIBindButton.new()
	arg_3_0.BindButton.id = "BindButton"

	if not arg_3_2.previewMode then
		local function var_3_0(arg_4_0, arg_4_1)
			if arg_3_0._hasEquipped then
				return
			end

			local var_4_0 = arg_3_0.RadialMenu:GetSelectedIndex()

			if GESTURES.IsGimmeSlotActive(var_4_0, arg_3_1) then
				return
			end

			if arg_4_1.qualifier == "keyboard" and var_4_0 < 0 then
				return
			end

			arg_3_0.BindButton:registerEventHandler("button_secondary", nil)
			arg_3_2.menu:EquipSelection(arg_3_1, var_4_0)

			arg_3_0._hasEquipped = true

			var_0_1(arg_3_0, function()
				arg_3_2.menu:ClosePopupAction(arg_3_1)
				ACTIONS.LeaveMenu(arg_3_0)
			end)
		end

		arg_3_0.RadialMenu:addEventHandler("leftmousedown", var_3_0)
		arg_3_0.BindButton:addEventHandler("button_primary", var_3_0)
	else
		arg_3_0.BindButton:addEventHandler("button_alt1", function()
			arg_3_2.menu:ClosePopupPreviewAction()
			ACTIONS.LeaveMenu(arg_3_0)
		end)
	end

	arg_3_0.BindButton:addEventHandler("button_secondary", function()
		if not arg_3_2.previewMode then
			arg_3_2.menu:ClosePopupAction(arg_3_1)
		else
			arg_3_2.menu:ClosePopupPreviewAction()
		end

		ACTIONS.LeaveMenu(arg_3_0)
	end)
	arg_3_0:addElement(arg_3_0.BindButton)
end

local function var_0_3(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.RadialButton = MenuBuilder.BuildRegisteredType("RadialCustomizationButton", {
		controllerIndex = arg_8_1
	})
	arg_8_0.RadialButton.id = "FocusedButton"

	ACTIONS.AnimateSequence(arg_8_0.RadialButton, "ButtonOver")
	arg_8_0.RadialButton.Image:setImage(arg_8_2.button.Image:GetImage())
	arg_8_0.RadialButton:SetQuality(arg_8_2.button.rarity)
	arg_8_0.RadialButton:SetSelected(arg_8_2.button.isSelected)
	arg_8_0.RadialButton:SetFavorite(arg_8_2.button.isFavorite)
	arg_8_0:addElement(arg_8_0.RadialButton)

	local var_8_0 = arg_8_2.button:GetCurrentAnchorsAndPositions()

	local function var_8_1()
		arg_8_0.RadialButton:SetAnchorsAndPosition(var_8_0.leftAnchor, var_8_0.rightAnchor, var_8_0.topAnchor, var_8_0.bottomAnchor, var_8_0.left + arg_8_2.gridLeft, var_8_0.right + arg_8_2.gridLeft, var_8_0.top + arg_8_2.gridTop, var_8_0.bottom + arg_8_2.gridTop)
	end

	var_8_1()

	local var_8_2 = 0
	local var_8_3 = 10
	local var_8_4

	local function var_8_5(arg_10_0)
		local var_10_0 = arg_8_2.button:GetCurrentAnchorsAndPositions()

		if var_8_0 == var_10_0 then
			var_8_2 = var_8_2 + 1
		else
			var_8_0 = var_10_0
		end

		if var_8_2 >= var_8_3 then
			arg_10_0 = false
		end

		var_8_1()

		if arg_10_0 then
			arg_8_0:Wait(16).onComplete = function()
				var_8_5(arg_10_0)
			end
		end
	end

	var_8_5(true)
end

local function var_0_4(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_0.RadialMenu)
	assert(arg_12_2.menu)
	var_0_2(arg_12_0, arg_12_1, arg_12_2)

	if arg_12_2.button and arg_12_2.gridLeft and arg_12_2.gridTop then
		var_0_3(arg_12_0, arg_12_1, arg_12_2)
	end

	local function var_12_0(arg_13_0, arg_13_1)
		if LUI.IsLastInputKeyboardMouse(arg_13_1.controllerIndex) then
			arg_13_0.CommandsLabel:setText("")
			arg_13_0.CommandsButton:setText("")
			arg_13_0:SetKeepSelectionWhileInDeadZone(false)
		else
			arg_13_0.CommandsLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/ROTATE"))
			arg_13_0.CommandsButton:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_ROTATE_BUTTON"))
			arg_13_0:SetKeepSelectionWhileInDeadZone(true)
		end

		var_0_0(arg_13_0, arg_12_1, arg_12_2.previewMode)
	end

	if arg_12_2.previewMode then
		arg_12_0:SetHandleMouse(true)
		arg_12_0:addEventHandler("rightmousedown", function(arg_14_0, arg_14_1)
			arg_12_2.menu:ClosePopupPreviewAction()
			ACTIONS.LeaveMenu(arg_14_0)
		end)
		ACTIONS.AnimateSequence(arg_12_0.RadialMenu, "PreviewMode")
	end

	arg_12_0:registerEventHandler("opening_quick_access_menu", function(arg_15_0, arg_15_1)
		ACTIONS.LeaveMenu(arg_15_0)
	end)
	arg_12_0.RadialMenu:addAndCallEventHandler("update_input_type", var_12_0, {
		controllerIndex = arg_12_1
	})
	arg_12_0.RadialMenu:SetDisableInfiniteOuterRadius(true)
	ACTIONS.ScaleFullscreen(arg_12_0.Darkener)
	arg_12_0.Darkener:SetHandleMouse(true)
	arg_12_0.Darkener:addEventHandler("leftmouseup", function(arg_16_0, arg_16_1)
		ACTIONS.LeaveMenu(arg_12_0)
	end)
end

function RadialCustomizationPopup(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0.id = "RadialCustomizationPopup"

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = LUI.UIImage.new()

	var_17_4.id = "Darkener"

	var_17_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_17_4:SetAlpha(0.5, 0)
	var_17_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_17_0:addElement(var_17_4)

	var_17_0.Darkener = var_17_4

	local var_17_5
	local var_17_6 = MenuBuilder.BuildRegisteredType("RadialMenu", {
		controllerIndex = var_17_1
	})

	var_17_6.id = "RadialMenu"

	var_17_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1264, _1080p * 1776, _1080p * 284, _1080p * 796)
	var_17_0:addElement(var_17_6)

	var_17_0.RadialMenu = var_17_6

	var_0_4(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("RadialCustomizationPopup", RadialCustomizationPopup)
LockTable(_M)
