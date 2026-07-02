module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0.MenuTitle ~= nil then
		arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/NETWORK_DIAGNOSTIC_OPTIONS_CAPS"))
	end

	assert(arg_1_0.bindButton)

	if not Engine.DDJFBBJAIG() then
		arg_1_0:addEventHandler("menu_create", function()
			arg_1_0:AddButtonHelperText({
				clickable = true,
				priority = 20,
				side = "left",
				kbmTooltipPromptOverload = "button_dismiss_pause_menu",
				button_ref = "button_start",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
			})
		end)
		arg_1_0.bindButton:addEventHandler("button_start", function(arg_3_0, arg_3_1)
			if Engine.CAADCDEEIA() then
				ACTIONS.ResumeGame(arg_3_0)
			end

			LUI.FlowManager.RequestCloseAllMenus()

			return true
		end)
	end

	assert(arg_1_0.NetworkDiagnosticOptionsButtonsElement.ConnectionMeterHistograms)

	if not Engine.DDJFBBJAIG() then
		arg_1_0.NetworkDiagnosticOptionsButtonsElement.ConnectionMeterHistograms:processEvent({
			name = "connection_meter_refresh"
		})
	end

	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetBlurStrength(5)
	var_1_0:setupWorldBlur()

	var_1_0.id = "blur"

	arg_1_0:addElement(var_1_0)
end

function NetworkDiagnosticOptions(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "NetworkDiagnosticOptions"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	var_4_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})
	var_4_0.HelperBar.id = "HelperBar"

	var_4_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_4_0.HelperBar:setPriority(10)
	var_4_0:addElement(var_4_0.HelperBar)

	local var_4_2 = var_4_0
	local var_4_3

	if not Engine.DDJFBBJAIG() then
		local var_4_4 = LUI.UIImage.new()

		var_4_4.id = "Background"

		var_4_4:SetRGBFromInt(0, 0)
		var_4_4:SetAlpha(0.5, 0)
		var_4_0:addElement(var_4_4)

		var_4_0.Background = var_4_4
	end

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "ButtonDescriptionText"

	var_4_6.Description:SetRight(_1080p * 415, 0)
	var_4_6.Description:SetRGBFromInt(16777215, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 860, _1080p * 892)
	var_4_0:addElement(var_4_6)

	var_4_0.ButtonDescriptionText = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("NetworkDiagnosticOptionsButtons", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "NetworkDiagnosticOptionsButtonsElement"

	var_4_8:setImage(RegisterMaterial("hud_ability_disabled_x"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 878, _1080p * 300, _1080p * 790)
	var_4_0:addElement(var_4_8)

	var_4_0.NetworkDiagnosticOptionsButtonsElement = var_4_8

	local var_4_9

	if not CONDITIONS.IsThirdGameModeDesired(var_4_0) then
		local var_4_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
			controllerIndex = var_4_1
		})

		var_4_10.id = "MenuTitle"

		var_4_10.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/NETWORK_DIAGNOSTIC_OPTIONS_CAPS"), 0)
		var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
		var_4_0:addElement(var_4_10)

		var_4_0.MenuTitle = var_4_10
	end

	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_4_11 = LUI.UIBindButton.new()

	var_4_11.id = "selfBindButton"

	var_4_0:addElement(var_4_11)

	var_4_0.bindButton = var_4_11

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("NetworkDiagnosticOptions", NetworkDiagnosticOptions)
LockTable(_M)
