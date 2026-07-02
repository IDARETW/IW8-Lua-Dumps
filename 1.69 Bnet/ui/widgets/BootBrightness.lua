module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuBackgroundImage)
	assert(arg_1_0.MenuTitle)
	assert(arg_1_0.BrightnessGuide)
	assert(arg_1_0.HelpText)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/BRIGHTNESS"))

	arg_1_0.isBootOptions = arg_1_2.isBootOption or false
	arg_1_0.chatOptOut = true

	arg_1_0.BrightnessGuide.CalibrationGuide:SetLabelsVisible(true)
	arg_1_0:addEventHandler("menu_create", function(arg_2_0, arg_2_1)
		arg_2_0:dispatchEventToChildren({
			name = "brightness_over"
		})

		if arg_2_0.isBootOptions then
			arg_2_0.isQuickAccessShortcutsDisabled = true
		end

		if (Engine.BAHIIBFDDG() or Engine.BEFACAIFDD()) and arg_2_0.isBootOptions then
			local var_2_0 = MenuBuilder.BuildRegisteredType("PlayerLogIn", {
				controllerIndex = arg_1_1
			})

			var_2_0.id = "gamertag"

			var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 116, _1080p * 585, _1080p * 964.5, _1080p * 993.5)
			arg_2_0:addElement(var_2_0)

			arg_2_0.gamertag = var_2_0
		end

		if not arg_2_0.isBootOptions then
			arg_2_0:AddButtonHelperText({
				clickable = true,
				button_ref = "button_secondary",
				side = "left",
				helper_text = Engine.CBBHFCGDIC("MENU/BACK")
			})

			local var_2_1 = LUI.UIBindButton.new()

			var_2_1.id = "selfBindButton"

			arg_2_0:addElement(var_2_1)

			arg_2_0.bindButton = var_2_1

			arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
				ACTIONS.LeaveMenu(arg_2_0)
			end)
			arg_2_0:addEventHandler("gamepad_button", function(arg_4_0, arg_4_1)
				if arg_4_1.button == "primary" then
					ACTIONS.LeaveMenu(arg_4_0)
				end
			end)
			arg_2_0.bindButton:addEventHandler("button_select", function(arg_5_0, arg_5_1)
				ACTIONS.LeaveMenu(arg_2_0)
			end)

			if not Engine.DDJFBBJAIG() then
				arg_2_0:AddButtonHelperText({
					clickable = true,
					priority = 2,
					side = "left",
					kbmTooltipPromptOverload = "button_dismiss_pause_menu",
					button_ref = "button_start",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
				})
				arg_2_0.bindButton:addEventHandler("button_start", function(arg_6_0, arg_6_1)
					if Engine.CAADCDEEIA() then
						ACTIONS.ResumeGame(arg_6_0)
					end

					LUI.FlowManager.RequestCloseAllMenus()

					return true
				end)
				MenuUtils.AddDismissPauseMenuKBMHandler(arg_2_0)
			end
		end

		arg_2_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end)

	local var_1_0 = OPTIONS.InitOptionsList(arg_1_0, arg_1_1)
	local var_1_1 = OPTIONS.GetOptionsDataByIdentifier(arg_1_0, arg_1_1, var_1_0, "Brightness", CSV.generalOptions)

	var_1_1.name = ""
	var_1_1.detailedPreviewImage = nil
	var_1_1.customPreviewButtonAction = nil

	local var_1_2 = OPTIONS.CreateOption(arg_1_0, arg_1_1, var_1_1)

	if CONDITIONS.IsSplitscreen(arg_1_0) then
		var_1_2:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -182, _1080p * 182, _1080p * 180, _1080p * 218)
	else
		var_1_2:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -182, _1080p * 182, _1080p * 274, _1080p * 312)
	end

	if var_1_2.HideLeftLine then
		var_1_2:HideLeftLine()
	end

	var_1_2:RemoveToolTipData()
	arg_1_0:addElement(var_1_2)

	arg_1_0.Slider = var_1_2

	if arg_1_0.isBootOptions then
		local var_1_3
		local var_1_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = arg_1_1
		})

		var_1_4.id = "Continue"

		var_1_4.Text:SetLeft(0, 0)
		var_1_4.Text:setText(Engine.CBBHFCGDIC("MENU/CONTINUE"), 0)
		var_1_4.Text:SetAlignment(LUI.Alignment.Center)
		var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -182, _1080p * 182, _1080p * 322, _1080p * 360)
		arg_1_0:addElement(var_1_4)

		arg_1_0.Continue = var_1_4

		arg_1_0.Continue:addEventHandler("button_action", function()
			LUI.FlowManager.RequestLeaveMenu(arg_1_0, true)
		end)
	end

	arg_1_0.MenuBackgroundImage:SetVideoSizeUpdateHandler()

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function BootBrightness(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0.id = "BootBrightness"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	var_8_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})
	var_8_0.HelperBar.id = "HelperBar"

	var_8_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_8_0.HelperBar:setPriority(10)
	var_8_0:addElement(var_8_0.HelperBar)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("MenuBackgroundImage", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "MenuBackgroundImage"

	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.MenuBackgroundImage = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("BrightnessGuide", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "BrightnessGuide"

	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -375, _1080p * 375, _1080p * -175, _1080p * 75)
	var_8_0:addElement(var_8_6)

	var_8_0.BrightnessGuide = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIText.new()

	var_8_8.id = "HelpText"

	var_8_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_8:setText(Engine.CBBHFCGDIC("MENU/BRIGHTNESS_DESC2"), 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_8:SetAlignment(LUI.Alignment.Center)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -375, _1080p * 375, _1080p * 150, _1080p * 174)
	var_8_0:addElement(var_8_8)

	var_8_0.HelpText = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "MenuTitle"

	var_8_10.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BRIGHTNESS")), 0)
	var_8_10.Line:SetLeft(0, 0)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 60, 0, _1080p * 100)
	var_8_0:addElement(var_8_10)

	var_8_0.MenuTitle = var_8_10

	local function var_8_11()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_11

	local var_8_12
	local var_8_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 183
		}
	}

	var_8_8:RegisterAnimationSequence("AR", var_8_13)

	local function var_8_14()
		var_8_8:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_14

	local var_8_15
	local var_8_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -193
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 57
		}
	}

	var_8_6:RegisterAnimationSequence("Splitscreen", var_8_16)

	local var_8_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 111
		}
	}

	var_8_8:RegisterAnimationSequence("Splitscreen", var_8_17)

	local function var_8_18()
		var_8_6:AnimateSequence("Splitscreen")
		var_8_8:AnimateSequence("Splitscreen")
	end

	var_8_0._sequences.Splitscreen = var_8_18

	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	if CONDITIONS.IsSplitscreen(var_8_0) then
		ACTIONS.AnimateSequence(var_8_0, "Splitscreen")
	end

	return var_8_0
end

MenuBuilder.registerType("BootBrightness", BootBrightness)
LockTable(_M)
