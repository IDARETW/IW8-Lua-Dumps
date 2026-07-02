module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuBackgroundImage)
	Dvar.DHEGHJJJHI("NRSSTPLOSQ", true)

	if arg_1_0.MenuTitle ~= nil then
		arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/MIX_PRESET"))
	end

	local var_1_0

	arg_1_0._selectedMix, arg_1_0._mixIndex = OPTIONS.GetCurrentAudioMixPreset()

	local var_1_1 = OPTIONS_DATA.optionsDataList.MixPreset.defaultOptionValue(arg_1_1)
	local var_1_2 = OPTIONS.GetMixPresets()

	arg_1_0.ButtonsList:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = var_1_2[arg_2_2 + 1]

		arg_2_0:SetText(Engine.CBBHFCGDIC(var_2_0.label))

		if arg_2_2 + 1 == var_1_1 then
			ACTIONS.AnimateSequence(arg_2_0, "NotificationOn")

			arg_2_0._isDefaultAudio = true
		end

		arg_2_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			arg_1_0._selectedMix = var_2_0.value

			ACTIONS.AnimateSequence(arg_3_0, "NotificationOff")
			arg_3_0:dispatchEventToParent({
				name = "request_active",
				target = arg_3_0
			})

			if arg_1_0._equipped then
				arg_1_0._equipped:SetEquipped(false)

				if arg_1_0._equipped._isDefaultAudio then
					ACTIONS.AnimateSequence(arg_1_0._equipped, "NotificationOn")
				end
			end

			arg_3_0:SetEquipped(true)

			arg_1_0._equipped = arg_3_0
		end)
		arg_2_0:addEventHandler("gain_focus", function(arg_4_0, arg_4_1)
			Dvar.DFIJDJFIFD("PTKLRRLLQ", var_2_0.value)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_1_1)

			if var_2_0.image then
				arg_1_0.AudioPreview:setImage(RegisterMaterial(var_2_0.image))
				arg_1_0.ButtonTitle:setText(Engine.CBBHFCGDIC(var_2_0.label))
				arg_1_0.ButtonOptionsDescriptionText.Description:setText(Engine.CBBHFCGDIC(var_2_0.description))
			end

			arg_4_0:dispatchEventToParent({
				name = "request_active",
				target = arg_4_0
			})
		end)
	end)
	arg_1_0.ButtonsList:SetNumColumns(1)
	arg_1_0.ButtonsList:SetNumRows(#var_1_2)
	arg_1_0.ButtonsList:RefreshContent()
	arg_1_0.ButtonOptionsDescriptionText.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/MIX_PRESET_DESC"))

	local var_1_3 = LUI.UIBindButton.new()

	var_1_3.id = "selfBindButton"

	arg_1_0:addElement(var_1_3)

	arg_1_0.bindButton = var_1_3

	assert(arg_1_0.bindButton)

	if not Engine.DDJFBBJAIG() then
		arg_1_0:addEventHandler("menu_create", function()
			arg_1_0:AddButtonHelperText({
				clickable = true,
				priority = 2,
				side = "left",
				kbmTooltipPromptOverload = "button_dismiss_pause_menu",
				button_ref = "button_start",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
			})
		end)
		arg_1_0.bindButton:addEventHandler("button_start", function(arg_6_0, arg_6_1)
			if Engine.CAADCDEEIA() then
				ACTIONS.ResumeGame(arg_6_0)
			end

			LUI.FlowManager.RequestCloseAllMenus()

			return true
		end)
		MenuUtils.AddDismissPauseMenuKBMHandler(arg_1_0)
	end

	arg_1_0.bindButton:registerEventHandler("button_alt1", function(arg_7_0, arg_7_1)
		arg_1_0:RemoveButtonHelperTextFromElement(arg_1_0.HelperBar, "button_alt1", "left")

		if var_1_0 == nil or not Engine.CHFEJIG(var_1_0) then
			var_1_0 = Engine.BJDBIAGIDA("ui_audio_test")

			arg_1_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/STOP_AUDIO_PROMPT"), 0)
			arg_1_0.PlayPromptSplitscreen:setText(Engine.CBBHFCGDIC("LUA_MENU/STOP_AUDIO_PROMPT"), 0)
			arg_1_0:AddButtonHelperText({
				kbm_only = true,
				priority = 2,
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/STOP")
			})

			if arg_1_0.checkSoundTimer then
				arg_1_0:RemoveElement(arg_1_0.checkSoundTimer)
				arg_1_0.checkSoundTimer:closeTree()

				arg_1_0.checkSoundTimer = nil
			end

			arg_1_0.checkSoundTimer = LUI.UITimer.new({
				interval = 45,
				event = "checkSound"
			})

			arg_1_0:addElement(arg_1_0.checkSoundTimer)
		else
			Engine.EAGBECEBGA(var_1_0)

			var_1_0 = nil

			arg_1_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
			arg_1_0.PlayPromptSplitscreen:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
			arg_1_0:AddButtonHelperText({
				kbm_only = true,
				priority = 2,
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
			})

			if arg_1_0.checkSoundTimer then
				arg_1_0:RemoveElement(arg_1_0.checkSoundTimer)
				arg_1_0.checkSoundTimer:closeTree()

				arg_1_0.checkSoundTimer = nil
			end
		end
	end)
	arg_1_0:registerEventHandler("checkSound", function(arg_8_0, arg_8_1)
		if not Engine.CHFEJIG(var_1_0) then
			var_1_0 = nil

			arg_1_0:RemoveButtonHelperTextFromElement(arg_1_0.HelperBar, "button_alt1", "left")
			arg_1_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
			arg_1_0.PlayPromptSplitscreen:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
			arg_1_0:AddButtonHelperText({
				kbm_only = true,
				priority = 2,
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
			})

			if arg_1_0.checkSoundTimer then
				arg_1_0:RemoveElement(arg_1_0.checkSoundTimer)
				arg_1_0.checkSoundTimer:closeTree()

				arg_1_0.checkSoundTimer = nil
			end
		end
	end)
	arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		Dvar.DFIJDJFIFD("PTKLRRLLQ", arg_1_0._selectedMix)
		Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_1_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0:addEventHandler("menu_create", function(arg_10_0, arg_10_1)
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 0,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_10_0:AddButtonHelperText({
			side = "left",
			priority = 1,
			gamepad_only = true,
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
		arg_10_0:AddButtonHelperText({
			kbm_only = true,
			priority = 2,
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
		})
		arg_10_0.ButtonsList:SetActiveParentBehavior()

		local var_10_0 = arg_10_0.ButtonsList:GetElementAtPosition(0, arg_1_0._mixIndex - 1)

		if var_10_0 then
			var_10_0:SetEquipped(true)
			ACTIONS.AnimateSequence(var_10_0, "NotificationOff")

			arg_1_0._equipped = var_10_0
		end

		arg_10_0.ButtonsList:SetFocusedPosition({
			x = 0,
			y = arg_1_0._mixIndex - 1
		}, true)
	end)
	arg_1_0.MenuBackgroundImage:SetVideoSizeUpdateHandler()
	arg_1_0:registerEventHandler("update_button_selected", function(arg_11_0, arg_11_1)
		local var_11_0 = arg_11_1.buttonName or ""
		local var_11_1 = arg_11_1.description or ""

		arg_11_0.ButtonTitle:setText(var_11_0, 0)
		arg_11_0.ButtonOptionsDescriptionText:setText(var_11_1, 0)
	end)
	arg_1_0:addEventHandler("on_close", function()
		Dvar.DHEGHJJJHI("NRSSTPLOSQ", false)

		if var_1_0 then
			Engine.EAGBECEBGA(var_1_0)

			var_1_0 = nil
		end
	end)
end

function AudioMixPreset(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIVerticalNavigator.new()

	var_13_0.id = "AudioMixPreset"
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
	local var_13_4 = MenuBuilder.BuildRegisteredType("MenuBackgroundImage", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "MenuBackgroundImage"

	var_13_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.MenuBackgroundImage = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "MenuTitle"

	var_13_6.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MIX_PRESET")), 0)
	var_13_6.Line:SetLeft(0, 0)
	var_13_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_13_0:addElement(var_13_6)

	var_13_0.MenuTitle = var_13_6

	local var_13_7
	local var_13_8 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 3,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 10,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_13_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericOptionButton", {
				controllerIndex = var_13_1
			})
		end,
		refreshChild = function(arg_15_0, arg_15_1, arg_15_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_13_9 = LUI.UIGrid.new(var_13_8)

	var_13_9.id = "ButtonsList"

	var_13_9:setUseStencil(true)
	var_13_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 631, _1080p * 216, _1080p * 979)
	var_13_0:addElement(var_13_9)

	var_13_0.ButtonsList = var_13_9

	local var_13_10
	local var_13_11 = MenuBuilder.BuildRegisteredType("ButtonOptionsDescriptionText", {
		controllerIndex = var_13_1
	})

	var_13_11.id = "ButtonOptionsDescriptionText"

	var_13_11.Description:SetRight(_1080p * 300, 0)
	var_13_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 631, _1080p * 1131, _1080p * 730, _1080p * 756)
	var_13_0:addElement(var_13_11)

	var_13_0.ButtonOptionsDescriptionText = var_13_11

	local var_13_12
	local var_13_13 = LUI.UIImage.new()

	var_13_13.id = "AudioPreview"

	var_13_13:setImage(RegisterMaterial("image_options_audio"), 0)
	var_13_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 632, _1080p * 1424, _1080p * 270, _1080p * 718)
	var_13_0:addElement(var_13_13)

	var_13_0.AudioPreview = var_13_13

	local var_13_14
	local var_13_15 = LUI.UIText.new()

	var_13_15.id = "PlayPrompt"

	var_13_15:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_13_15:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
	var_13_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_15:SetAlignment(LUI.Alignment.Left)
	var_13_15:SetTintFontIcons(true)
	var_13_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 134, _1080p * 631, _1080p * 185, _1080p * 203)
	var_13_0:addElement(var_13_15)

	var_13_0.PlayPrompt = var_13_15

	local var_13_16
	local var_13_17 = LUI.UIText.new()

	var_13_17.id = "ButtonTitle"

	var_13_17:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_13_17:setText(ToUpperCase(""), 0)
	var_13_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_17:SetAlignment(LUI.Alignment.Left)
	var_13_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 631, _1080p * 1424, _1080p * 207, _1080p * 255)
	var_13_0:addElement(var_13_17)

	var_13_0.ButtonTitle = var_13_17

	local var_13_18
	local var_13_19 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_13_1
	})

	var_13_19.id = "VerticalMinimalScrollbar"

	var_13_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 561, _1080p * 572, _1080p * 154, _1080p * 534)
	var_13_0:addElement(var_13_19)

	var_13_0.VerticalMinimalScrollbar = var_13_19

	local var_13_20
	local var_13_21 = LUI.UIText.new()

	var_13_21.id = "PlayPromptSplitscreen"

	var_13_21:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_13_21:SetAlpha(0, 0)
	var_13_21:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
	var_13_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_21:SetAlignment(LUI.Alignment.Left)
	var_13_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 134, _1080p * 631, _1080p * 123, _1080p * 141)
	var_13_0:addElement(var_13_21)

	var_13_0.PlayPromptSplitscreen = var_13_21

	local function var_13_22()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_22

	local var_13_23
	local var_13_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 154
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 534
		}
	}

	var_13_9:RegisterAnimationSequence("Splitscreen", var_13_24)

	local var_13_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 226
		}
	}

	var_13_11:RegisterAnimationSequence("Splitscreen", var_13_25)

	local var_13_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 205
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 653
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_13:RegisterAnimationSequence("Splitscreen", var_13_26)

	local var_13_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_15:RegisterAnimationSequence("Splitscreen", var_13_27)

	local var_13_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -398
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -350
		}
	}

	var_13_17:RegisterAnimationSequence("Splitscreen", var_13_28)

	local var_13_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 123
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 141
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_21:RegisterAnimationSequence("Splitscreen", var_13_29)

	local function var_13_30()
		var_13_9:AnimateSequence("Splitscreen")
		var_13_11:AnimateSequence("Splitscreen")
		var_13_13:AnimateSequence("Splitscreen")
		var_13_15:AnimateSequence("Splitscreen")
		var_13_17:AnimateSequence("Splitscreen")
		var_13_21:AnimateSequence("Splitscreen")
	end

	var_13_0._sequences.Splitscreen = var_13_30

	local var_13_31 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_13_19,
		startCap = var_13_19.startCap,
		endCap = var_13_19.endCap,
		sliderArea = var_13_19.sliderArea,
		slider = var_13_19.sliderArea and var_13_19.sliderArea.slider,
		fixedSizeSlider = var_13_19.sliderArea and var_13_19.sliderArea.fixedSizeSlider
	})

	var_13_9:AddScrollbar(var_13_31)
	var_0_0(var_13_0, var_13_1, arg_13_1)

	if CONDITIONS.IsSplitscreen(var_13_0) then
		ACTIONS.AnimateSequence(var_13_0, "Splitscreen")
	end

	return var_13_0
end

MenuBuilder.registerType("AudioMixPreset", AudioMixPreset)
LockTable(_M)
