module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Background)
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

	assert(arg_1_0.Background)

	local function var_1_5()
		local var_8_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_1_0.Background:SetScale(var_8_0)
	end

	arg_1_0:addAndCallEventHandler("onVideoChange", var_1_5)

	if Engine.DDJFBBJAIG() then
		arg_1_0.BackgroundMP:SetAlpha(0)
		arg_1_0.Background:SetAlpha(1)
		LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	else
		arg_1_0.BackgroundMP:SetAlpha(0.8)
		arg_1_0.Background:SetAlpha(0)
		ACTIONS.ScaleFullscreen(arg_1_0.BackgroundMP)
	end

	local var_1_6 = LUI.UIElement.new()

	var_1_6:SetBlurStrength(5)
	var_1_6:setupWorldBlur()

	var_1_6.id = "blur"

	arg_1_0:addElement(var_1_6)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function BootBrightness(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIVerticalNavigator.new()

	var_9_0.id = "BootBrightness"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	var_9_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_9_1
	})
	var_9_0.HelperBar.id = "HelperBar"

	var_9_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_9_0.HelperBar:setPriority(10)
	var_9_0:addElement(var_9_0.HelperBar)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Background"

	var_9_4:setImage(RegisterMaterial("frontend_option_bg"), 0)
	var_9_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.Background = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "BackgroundMP"

	var_9_6:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_9_6:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_9_0:addElement(var_9_6)

	var_9_0.BackgroundMP = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("BrightnessGuide", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "BrightnessGuide"

	var_9_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -375, _1080p * 375, _1080p * -175, _1080p * 75)
	var_9_0:addElement(var_9_8)

	var_9_0.BrightnessGuide = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIText.new()

	var_9_10.id = "HelpText"

	var_9_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_9_10:setText(Engine.CBBHFCGDIC("MENU/BRIGHTNESS_DESC2"), 0)
	var_9_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_10:SetAlignment(LUI.Alignment.Center)
	var_9_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -375, _1080p * 375, _1080p * 150, _1080p * 174)
	var_9_0:addElement(var_9_10)

	var_9_0.HelpText = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "MenuTitle"

	var_9_12.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BRIGHTNESS")), 0)
	var_9_12.Line:SetLeft(0, 0)
	var_9_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 60, 0, _1080p * 100)
	var_9_0:addElement(var_9_12)

	var_9_0.MenuTitle = var_9_12

	local function var_9_13()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_13

	local var_9_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 183
		}
	}

	var_9_10:RegisterAnimationSequence("AR", var_9_14)

	local function var_9_15()
		var_9_10:AnimateSequence("AR")
	end

	var_9_0._sequences.AR = var_9_15

	local var_9_16 = {
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

	var_9_8:RegisterAnimationSequence("Splitscreen", var_9_16)

	local var_9_17 = {
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

	var_9_10:RegisterAnimationSequence("Splitscreen", var_9_17)

	local function var_9_18()
		var_9_8:AnimateSequence("Splitscreen")
		var_9_10:AnimateSequence("Splitscreen")
	end

	var_9_0._sequences.Splitscreen = var_9_18

	PostLoadFunc(var_9_0, var_9_1, arg_9_1)

	if CONDITIONS.IsSplitscreen(var_9_0) then
		ACTIONS.AnimateSequence(var_9_0, "Splitscreen")
	end

	return var_9_0
end

MenuBuilder.registerType("BootBrightness", BootBrightness)
LockTable(_M)
