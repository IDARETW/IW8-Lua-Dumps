module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._controllerIndex = arg_1_1

	local function var_1_0(arg_2_0)
		arg_1_0.currentText = arg_2_0
	end

	local function var_1_1()
		return arg_1_0.currentText
	end

	local function var_1_2(arg_4_0)
		if Loot.BCBJJICIBA(arg_1_0._controllerIndex, arg_4_0) == 1 then
			local var_4_0, var_4_1 = Loot.BGIBBGIIDJ(arg_1_0._controllerIndex)

			arg_1_0.InvalidCode:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CREATOR_CODE_CASE_SENSITIVE"))
			ACTIONS.LeaveMenu(arg_1_0)

			local var_4_2 = {
				icon = "hud_info_alert",
				displayTime = 3000,
				header = Engine.CBBHFCGDIC("LUA_MENU_MP/SUPPORT_A_CREATOR"),
				description = Engine.CBBHFCGDIC("CONTENT_CREATOR_CODES/" .. var_4_1)
			}

			arg_1_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_4_2
			})
		else
			arg_1_0.InvalidCode:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CREATOR_NOT_FOUND"))
			arg_1_0.InvalidCode:SetRGBFromTable(SWATCHES.HUD.inactive)
		end
	end

	function arg_1_0.CreatorCodeSearch.NameTextBox.buttonActionCallbackFunc()
		if Engine.HDGDBCJFG() or LUI.IsLastInputGamepad(arg_1_1) then
			arg_1_0.CreatorCodeSearch.NameTextBox:TextEditOff()
			OSK.CBJGJDGFC(arg_1_1, "", "", 50, false, false, true, function(arg_6_0, arg_6_1, arg_6_2)
				if arg_6_1 then
					var_1_0(arg_6_1)
					arg_1_0.CreatorCodeSearch.NameTextBox.textEdit:setTextEditText(arg_6_1)
					arg_1_0.CreatorCodeSearch.NameTextBox:processEvent({
						name = "lose_focus"
					})
					arg_1_0.AddSupport:processEvent({
						name = "gain_focus"
					})
				end

				arg_1_0.CreatorCodeSearch.NameTextBox:TextEditOff()
			end, CoD.KeyboardInputTypes.Email)
		end
	end

	function arg_1_0.CreatorCodeSearch.NameTextBox.textEditCompleteCallbackFunc(arg_7_0, arg_7_1)
		if LUI.IsLastInputKeyboardMouse(arg_1_1) then
			arg_1_0.CreatorCodeSearch.NameTextBox:TextEditOff()

			local var_7_0 = var_1_1()

			if var_7_0 then
				var_1_2(var_7_0)
			end
		else
			return function(arg_8_0, arg_8_1)
				local var_8_0 = arg_8_0:getParent()
				local var_8_1 = FocusType.MouseOver

				if Engine.HDGDBCJFG() and LUI.IsLastInputGamepad(arg_1_0._controllerIndex) then
					var_8_1 = FocusType.Gamepad
				end

				var_8_0:FocusNextElement(arg_8_0, "down", var_8_1, arg_8_1.qualifier, arg_1_0._controllerIndex)
			end
		end
	end

	function arg_1_0.CreatorCodeSearch.NameTextBox.isTypingCallbackFunc(arg_9_0, arg_9_1)
		arg_1_0.CreatorCodeSearch.NameTextBox.textEdit:setTextEditText(arg_9_1)
		var_1_0(arg_9_1)
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
	arg_1_0.AddSupport:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		arg_1_0.CreatorCodeSearch.NameTextBox:TextEditOff()

		local var_10_0 = var_1_1()

		if var_10_0 then
			var_1_2(var_10_0)
		end
	end)
	arg_1_0.Cancel:addEventHandler("button_action", function(arg_11_0, arg_11_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.ButtonHelperBar.bindButton:addEventHandler("button_secondary", function(arg_12_0, arg_12_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
end

function CreatorCodePopup(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIVerticalNavigator.new()

	var_13_0.id = "CreatorCodePopup"

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "Darkener"

	var_13_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_13_4:SetAlpha(0.8, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Darkener = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "GenericPopupWindow"

	var_13_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -182, _1080p * 182)
	var_13_0:addElement(var_13_6)

	var_13_0.GenericPopupWindow = var_13_6

	local var_13_7
	local var_13_8 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_13_1
	})

	var_13_8.id = "ButtonHelperBar"

	var_13_8.Background:SetAlpha(0, 0)
	var_13_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 182, _1080p * 242)
	var_13_0:addElement(var_13_8)

	var_13_0.ButtonHelperBar = var_13_8

	local var_13_9
	local var_13_10 = LUI.UIText.new()

	var_13_10.id = "Title"

	var_13_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_13_10:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/SUPPORT_A_CREATOR")), 0)
	var_13_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_13_10:SetAlignment(LUI.Alignment.Left)
	var_13_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -144, _1080p * -84)
	var_13_0:addElement(var_13_10)

	var_13_0.Title = var_13_10

	local var_13_11
	local var_13_12 = LUI.UIImage.new()

	var_13_12.id = "Image"

	var_13_12:SetAlpha(0.6, 0)
	var_13_12:setImage(RegisterMaterial("mm_element_logo_white"), 0)
	var_13_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -806, _1080p * -294, _1080p * -130, _1080p * 126)
	var_13_0:addElement(var_13_12)

	var_13_0.Image = var_13_12

	local var_13_13
	local var_13_14 = LUI.UIStyledText.new()

	var_13_14.id = "Description"

	var_13_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_14:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CREATOR_CODES_POPUP_DESC"), 0)
	var_13_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_14:SetAlignment(LUI.Alignment.Left)
	var_13_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 443, _1080p * -84, _1080p * -62)
	var_13_0:addElement(var_13_14)

	var_13_0.Description = var_13_14

	local var_13_15
	local var_13_16 = MenuBuilder.BuildRegisteredType("CreatorCodeSearch", {
		controllerIndex = var_13_1
	})

	var_13_16.id = "CreatorCodeSearch"

	var_13_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 720, _1080p * 1250, _1080p * -48, _1080p * 52)
	var_13_0:addElement(var_13_16)

	var_13_0.CreatorCodeSearch = var_13_16

	local var_13_17
	local var_13_18 = LUI.UIStyledText.new()

	var_13_18.id = "InvalidCode"

	var_13_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CREATOR_CODE_CASE_SENSITIVE"), 0)
	var_13_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_13_18:SetAlignment(LUI.Alignment.Left)
	var_13_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 720, _1080p * 1358, _1080p * 26, _1080p * 40)
	var_13_0:addElement(var_13_18)

	var_13_0.InvalidCode = var_13_18

	local var_13_19
	local var_13_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_13_1
	})

	var_13_20.id = "AddSupport"

	var_13_20.Text:SetLeft(_1080p * 20, 0)
	var_13_20.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/ADD_SUPPORT")), 0)
	var_13_20.Text:SetAlignment(LUI.Alignment.Left)
	var_13_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 720, _1080p * 1140, _1080p * 52, _1080p * 90)
	var_13_0:addElement(var_13_20)

	var_13_0.AddSupport = var_13_20

	local var_13_21
	local var_13_22 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_13_1
	})

	var_13_22.id = "Cancel"

	var_13_22.Text:SetLeft(_1080p * 20, 0)
	var_13_22.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CANCEL")), 0)
	var_13_22.Text:SetAlignment(LUI.Alignment.Left)
	var_13_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 720, _1080p * 1140, _1080p * 96, _1080p * 134)
	var_13_0:addElement(var_13_22)

	var_13_0.Cancel = var_13_22

	function var_13_8.addButtonHelperFunction(arg_14_0, arg_14_1)
		arg_14_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
		arg_14_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("PLATFORM/BACK")
		})
	end

	local var_13_23 = LUI.UIBindButton.new()

	var_13_23.id = "ButtonHelperBarBindButton"

	var_13_8:addElement(var_13_23)

	var_13_8.bindButton = var_13_23

	var_0_0(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("CreatorCodePopup", CreatorCodePopup)
LockTable(_M)
