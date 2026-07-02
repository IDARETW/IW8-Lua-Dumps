module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CODCASTER/KEYBOARD_SHORTCUTS"))
	arg_1_0:addElement(CoD.GetWorldBlur())
end

function CodcasterKeyboardMenu(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0.id = "CodcasterKeyboardMenu"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	var_2_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_2_1
	})
	var_2_0.HelperBar.id = "HelperBar"

	var_2_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_2_0.HelperBar:setPriority(10)
	var_2_0:addElement(var_2_0.HelperBar)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Background"

	var_2_4:SetRGBFromInt(0, 0)
	var_2_4:SetAlpha(0.5, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "BackgroundKeys"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_2_6:SetAlpha(0.5, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 185, _1080p * 905)
	var_2_0:addElement(var_2_6)

	var_2_0.BackgroundKeys = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "MenuTitle"

	var_2_8.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/KEYBOARD_SHORTCUTS")), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_2_0:addElement(var_2_8)

	var_2_0.MenuTitle = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("CodcasterKeyboardShortcuts", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "CodcasterKeyboardShortcuts"

	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 324, _1080p * 1596, _1080p * 177, _1080p * 902)
	var_2_0:addElement(var_2_10)

	var_2_0.CodcasterKeyboardShortcuts = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "LobbyMembersFooter"

	var_2_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_2_0:addElement(var_2_12)

	var_2_0.LobbyMembersFooter = var_2_12

	var_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_2_13 = LUI.UIBindButton.new()

	var_2_13.id = "selfBindButton"

	var_2_0:addElement(var_2_13)

	var_2_0.bindButton = var_2_13

	var_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CodcasterKeyboardMenu", CodcasterKeyboardMenu)
LockTable(_M)
