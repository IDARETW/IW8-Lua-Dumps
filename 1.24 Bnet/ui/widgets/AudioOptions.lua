module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0.MenuTitle ~= nil then
		arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/AUDIO_SUB_VOLUMES_CAPS"))
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

	assert(arg_1_0.Background)

	local function var_1_0()
		local var_4_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_1_0.Background:SetScale(var_4_0)
	end

	arg_1_0:addAndCallEventHandler("onVideoChange", var_1_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	arg_1_0:registerEventHandler("update_button_selected", function(arg_5_0, arg_5_1)
		local var_5_0 = arg_5_1.buttonName or ""
		local var_5_1 = arg_5_1.description or ""

		arg_5_0.ButtonTitle:setText(var_5_0, 0)
		arg_5_0.ButtonDescription:setText(var_5_1, 0)
	end)

	local var_1_1 = LUI.UIElement.new()

	var_1_1:SetBlurStrength(5)
	var_1_1:setupWorldBlur()

	var_1_1.id = "blur"

	arg_1_0:addElement(var_1_1)
end

function AudioOptions(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "AudioOptions"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	var_6_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})
	var_6_0.HelperBar.id = "HelperBar"

	var_6_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0.HelperBar:setPriority(10)
	var_6_0:addElement(var_6_0.HelperBar)

	local var_6_2 = var_6_0
	local var_6_3

	if Engine.DDJFBBJAIG() then
		local var_6_4 = LUI.UIImage.new()

		var_6_4.id = "Background"

		var_6_4:setImage(RegisterMaterial("frontend_option_bg"), 0)
		var_6_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
		var_6_0:addElement(var_6_4)

		var_6_0.Background = var_6_4
	end

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "ButtonDescription"

	var_6_6:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * 864, _1080p * -248, _1080p * -224)
	var_6_0:addElement(var_6_6)

	var_6_0.ButtonDescription = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIText.new()

	var_6_8.id = "ButtonTitle"

	var_6_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_6_8:setText(ToUpperCase(""), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * 830, _1080p * -333, _1080p * -285)
	var_6_0:addElement(var_6_8)

	var_6_0.ButtonTitle = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("AudioOptionsButtons", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "AudioOptionsButtonsElement"

	var_6_10:setImage(RegisterMaterial("hud_ability_disabled_x"), 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 730, _1080p * 216, _1080p * 706)
	var_6_0:addElement(var_6_10)

	var_6_0.AudioOptionsButtonsElement = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "MenuTitle"

	var_6_12.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/AUDIO_OPTIONS_CAPS"), 0)
	var_6_12.Line:SetLeft(0, 0)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_6_0:addElement(var_6_12)

	var_6_0.MenuTitle = var_6_12

	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_6_13 = LUI.UIBindButton.new()

	var_6_13.id = "selfBindButton"

	var_6_0:addElement(var_6_13)

	var_6_0.bindButton = var_6_13

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_6_1
		end

		ACTIONS.LeaveMenu(var_6_0)
	end)
	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("AudioOptions", AudioOptions)
LockTable(_M)
