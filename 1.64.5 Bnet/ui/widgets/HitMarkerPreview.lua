module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuBackgroundImage)

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
	arg_1_0.MenuBackgroundImage:SetVideoSizeUpdateHandler()
	arg_1_0:registerEventHandler("update_button_selected", function(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_1.buttonName or ""
		local var_10_1 = arg_10_1.description or ""

		arg_10_0.ButtonTitle:setText(var_10_0, 0)
		arg_10_0.ButtonOptionsDescriptionText:setText(var_10_1, 0)
	end)
	arg_1_0:addEventHandler("on_close", function()
		if var_1_0 then
			Engine.EAGBECEBGA(var_1_0)

			var_1_0 = nil
		end
	end)
end

function HitMarkerPreview(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIVerticalNavigator.new()

	var_12_0.id = "HitMarkerPreview"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	var_12_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_12_1
	})
	var_12_0.HelperBar.id = "HelperBar"

	var_12_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_12_0.HelperBar:setPriority(10)
	var_12_0:addElement(var_12_0.HelperBar)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("MenuBackgroundImage", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "MenuBackgroundImage"

	var_12_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.MenuBackgroundImage = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "MenuTitle"

	var_12_6.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/HIT_MARKER_PRESETS")), 0)
	var_12_6.Line:SetLeft(0, 0)
	var_12_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_12_0:addElement(var_12_6)

	var_12_0.MenuTitle = var_12_6

	local var_12_7
	local var_12_8 = {
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
		controllerIndex = var_12_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericOptionButton", {
				controllerIndex = var_12_1
			})
		end,
		refreshChild = function(arg_14_0, arg_14_1, arg_14_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_12_9 = LUI.UIGrid.new(var_12_8)

	var_12_9.id = "ButtonsList"

	var_12_9:setUseStencil(true)
	var_12_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 631, _1080p * 216, _1080p * 979)
	var_12_0:addElement(var_12_9)

	var_12_0.ButtonsList = var_12_9

	local var_12_10
	local var_12_11 = MenuBuilder.BuildRegisteredType("ButtonOptionsDescriptionText", {
		controllerIndex = var_12_1
	})

	var_12_11.id = "ButtonOptionsDescriptionText"

	var_12_11.Description:SetRight(_1080p * 300, 0)
	var_12_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 631, _1080p * 1131, _1080p * 255, _1080p * 281)
	var_12_0:addElement(var_12_11)

	var_12_0.ButtonOptionsDescriptionText = var_12_11

	local var_12_12
	local var_12_13 = LUI.UIText.new()

	var_12_13.id = "PlayPrompt"

	var_12_13:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_12_13:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
	var_12_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_13:SetAlignment(LUI.Alignment.Left)
	var_12_13:SetTintFontIcons(true)
	var_12_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 134, _1080p * 631, _1080p * 185, _1080p * 203)
	var_12_0:addElement(var_12_13)

	var_12_0.PlayPrompt = var_12_13

	local var_12_14
	local var_12_15 = LUI.UIText.new()

	var_12_15.id = "ButtonTitle"

	var_12_15:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_12_15:setText(ToUpperCase(""), 0)
	var_12_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_15:SetAlignment(LUI.Alignment.Left)
	var_12_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 631, _1080p * 1424, _1080p * 207, _1080p * 255)
	var_12_0:addElement(var_12_15)

	var_12_0.ButtonTitle = var_12_15

	local var_12_16
	local var_12_17 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_12_1
	})

	var_12_17.id = "VerticalMinimalScrollbar"

	var_12_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 561, _1080p * 572, _1080p * 154, _1080p * 534)
	var_12_0:addElement(var_12_17)

	var_12_0.VerticalMinimalScrollbar = var_12_17

	local var_12_18
	local var_12_19 = LUI.UIText.new()

	var_12_19.id = "PlayPromptSplitscreen"

	var_12_19:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_12_19:SetAlpha(0, 0)
	var_12_19:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
	var_12_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_19:SetAlignment(LUI.Alignment.Left)
	var_12_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 134, _1080p * 631, _1080p * 123, _1080p * 141)
	var_12_0:addElement(var_12_19)

	var_12_0.PlayPromptSplitscreen = var_12_19

	local function var_12_20()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_20

	local var_12_21
	local var_12_22 = {
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

	var_12_9:RegisterAnimationSequence("Splitscreen", var_12_22)

	local var_12_23 = {
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

	var_12_11:RegisterAnimationSequence("Splitscreen", var_12_23)

	local var_12_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_13:RegisterAnimationSequence("Splitscreen", var_12_24)

	local var_12_25 = {
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

	var_12_15:RegisterAnimationSequence("Splitscreen", var_12_25)

	local var_12_26 = {
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

	var_12_19:RegisterAnimationSequence("Splitscreen", var_12_26)

	local function var_12_27()
		var_12_9:AnimateSequence("Splitscreen")
		var_12_11:AnimateSequence("Splitscreen")
		var_12_13:AnimateSequence("Splitscreen")
		var_12_15:AnimateSequence("Splitscreen")
		var_12_19:AnimateSequence("Splitscreen")
	end

	var_12_0._sequences.Splitscreen = var_12_27

	local var_12_28 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_12_17,
		startCap = var_12_17.startCap,
		endCap = var_12_17.endCap,
		sliderArea = var_12_17.sliderArea,
		slider = var_12_17.sliderArea and var_12_17.sliderArea.slider,
		fixedSizeSlider = var_12_17.sliderArea and var_12_17.sliderArea.fixedSizeSlider
	})

	var_12_9:AddScrollbar(var_12_28)
	var_0_0(var_12_0, var_12_1, arg_12_1)

	if CONDITIONS.IsSplitscreen(var_12_0) then
		ACTIONS.AnimateSequence(var_12_0, "Splitscreen")
	end

	return var_12_0
end

MenuBuilder.registerType("HitMarkerPreview", HitMarkerPreview)
LockTable(_M)
