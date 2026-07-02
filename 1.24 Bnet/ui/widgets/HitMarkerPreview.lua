module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0.MenuTitle ~= nil then
		arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/HIT_MARKER_PRESETS"))
	end

	local var_1_0

	arg_1_0._selectedHitMarker, arg_1_0._hitMarkerIndex = OPTIONS.GetCurrentHitMarkerPreset(arg_1_1)

	local var_1_1 = OPTIONS.GetHitMarkerPresets()

	arg_1_0.ButtonsList:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = var_1_1[arg_2_2 + 1]

		arg_2_0:SetText(Engine.CBBHFCGDIC(var_2_0.label))
		arg_2_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			arg_1_0._selectedHitMarker = var_2_0

			Engine.CFBBHFFBH(arg_1_1, var_2_0.value)
			arg_3_0:dispatchEventToParent({
				name = "request_active",
				target = arg_3_0
			})

			if arg_1_0._equipped then
				arg_1_0._equipped:SetEquipped(false)
			end

			arg_3_0:SetEquipped(true)

			arg_1_0._equipped = arg_3_0
		end)
		arg_2_0:addEventHandler("gain_focus", function(arg_4_0, arg_4_1)
			arg_1_0._focusedHitMarker = var_2_0

			if var_2_0.description then
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
	arg_1_0.ButtonsList:SetNumRows(#var_1_1)
	arg_1_0.ButtonsList:RefreshContent()
	arg_1_0.ButtonOptionsDescriptionText.Description:setText(Engine.CBBHFCGDIC("MENU/HIT_MARKER_PRESETS_DESC"))

	local var_1_2 = LUI.UIBindButton.new()

	var_1_2.id = "selfBindButton"

	arg_1_0:addElement(var_1_2)

	arg_1_0.bindButton = var_1_2

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

		if (var_1_0 == nil or not Engine.CHFEJIG(var_1_0)) and arg_1_0._focusedHitMarker.soundTest then
			var_1_0 = Engine.BJDBIAGIDA(arg_1_0._focusedHitMarker.soundTest)
		end
	end)
	arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0:addEventHandler("menu_create", function(arg_9_0, arg_9_1)
		arg_9_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 0,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_9_0:AddButtonHelperText({
			side = "left",
			priority = 1,
			gamepad_only = true,
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
		arg_9_0.ButtonsList:SetActiveParentBehavior()

		local var_9_0 = arg_9_0.ButtonsList:GetElementAtPosition(0, arg_1_0._hitMarkerIndex - 1)

		if var_9_0 then
			var_9_0:SetEquipped(true)

			arg_1_0._equipped = var_9_0
		end

		arg_9_0.ButtonsList:SetFocusedPosition({
			x = 0,
			y = arg_1_0._hitMarkerIndex - 1
		}, true)
	end)
	assert(arg_1_0.Background)

	local function var_1_3()
		local var_10_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_1_0.Background:SetScale(var_10_0)
	end

	arg_1_0:addAndCallEventHandler("onVideoChange", var_1_3)

	if Engine.DDJFBBJAIG() then
		arg_1_0.BackgroundMP:SetAlpha(0)
		arg_1_0.Background:SetAlpha(1)
		LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	else
		arg_1_0.BackgroundMP:SetAlpha(0.5)
		arg_1_0.Background:SetAlpha(0)
		ACTIONS.ScaleFullscreen(arg_1_0.BackgroundMP)
	end

	arg_1_0:registerEventHandler("update_button_selected", function(arg_11_0, arg_11_1)
		local var_11_0 = arg_11_1.buttonName or ""
		local var_11_1 = arg_11_1.description or ""

		arg_11_0.ButtonTitle:setText(var_11_0, 0)
		arg_11_0.ButtonOptionsDescriptionText:setText(var_11_1, 0)
	end)

	local var_1_4 = LUI.UIElement.new()

	var_1_4:SetBlurStrength(5)
	var_1_4:setupWorldBlur()

	var_1_4.id = "blur"

	arg_1_0:addElement(var_1_4)
	arg_1_0:addEventHandler("on_close", function()
		if var_1_0 then
			Engine.EAGBECEBGA(var_1_0)

			var_1_0 = nil
		end
	end)
end

function HitMarkerPreview(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIVerticalNavigator.new()

	var_13_0.id = "HitMarkerPreview"
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
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "Background"

	var_13_4:setImage(RegisterMaterial("frontend_option_bg"), 0)
	var_13_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Background = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIImage.new()

	var_13_6.id = "BackgroundMP"

	var_13_6:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_13_6:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_13_0:addElement(var_13_6)

	var_13_0.BackgroundMP = var_13_6

	local var_13_7
	local var_13_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_13_1
	})

	var_13_8.id = "MenuTitle"

	var_13_8.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/HIT_MARKER_PRESETS")), 0)
	var_13_8.Line:SetLeft(0, 0)
	var_13_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_13_0:addElement(var_13_8)

	var_13_0.MenuTitle = var_13_8

	local var_13_9
	local var_13_10 = {
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
	local var_13_11 = LUI.UIGrid.new(var_13_10)

	var_13_11.id = "ButtonsList"

	var_13_11:setUseStencil(true)
	var_13_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 631, _1080p * 216, _1080p * 979)
	var_13_0:addElement(var_13_11)

	var_13_0.ButtonsList = var_13_11

	local var_13_12
	local var_13_13 = MenuBuilder.BuildRegisteredType("ButtonOptionsDescriptionText", {
		controllerIndex = var_13_1
	})

	var_13_13.id = "ButtonOptionsDescriptionText"

	var_13_13.Description:SetRight(_1080p * 300, 0)
	var_13_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 631, _1080p * 1131, _1080p * 255, _1080p * 281)
	var_13_0:addElement(var_13_13)

	var_13_0.ButtonOptionsDescriptionText = var_13_13

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

	var_13_11:RegisterAnimationSequence("Splitscreen", var_13_24)

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

	var_13_13:RegisterAnimationSequence("Splitscreen", var_13_25)

	local var_13_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_15:RegisterAnimationSequence("Splitscreen", var_13_26)

	local var_13_27 = {
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

	var_13_17:RegisterAnimationSequence("Splitscreen", var_13_27)

	local var_13_28 = {
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

	var_13_21:RegisterAnimationSequence("Splitscreen", var_13_28)

	local function var_13_29()
		var_13_11:AnimateSequence("Splitscreen")
		var_13_13:AnimateSequence("Splitscreen")
		var_13_15:AnimateSequence("Splitscreen")
		var_13_17:AnimateSequence("Splitscreen")
		var_13_21:AnimateSequence("Splitscreen")
	end

	var_13_0._sequences.Splitscreen = var_13_29

	local var_13_30 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_13_19,
		startCap = var_13_19.startCap,
		endCap = var_13_19.endCap,
		sliderArea = var_13_19.sliderArea,
		slider = var_13_19.sliderArea and var_13_19.sliderArea.slider,
		fixedSizeSlider = var_13_19.sliderArea and var_13_19.sliderArea.fixedSizeSlider
	})

	var_13_11:AddScrollbar(var_13_30)
	var_0_0(var_13_0, var_13_1, arg_13_1)

	if CONDITIONS.IsSplitscreen(var_13_0) then
		ACTIONS.AnimateSequence(var_13_0, "Splitscreen")
	end

	return var_13_0
end

MenuBuilder.registerType("HitMarkerPreview", HitMarkerPreview)
LockTable(_M)
