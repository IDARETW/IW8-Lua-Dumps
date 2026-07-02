module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.ButtonsList)
	assert(arg_1_0.ButtonOptionsDescriptionText)

	local var_1_0 = Engine.BECCFCBIAA("colorBlindMode", arg_1_1)
	local var_1_1 = OPTIONS.GetColorBlindConfig(arg_1_1)

	local function var_1_2(arg_2_0, arg_2_1)
		Engine.DFJDIFJEGA("colorBlindMode", arg_2_0.index - 1, arg_1_1)
		arg_2_0:dispatchEventToParent({
			name = "request_active",
			target = arg_2_0
		})
		arg_1_0.ButtonOptionsDescriptionText.Description:setText(var_1_1.description[arg_2_0.index])
	end

	arg_1_0.ButtonsList:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = var_1_1.labels[arg_3_2 + 1]

		arg_3_0:SetText(var_3_0)

		arg_3_0.index = arg_3_2 + 1

		arg_3_0:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			arg_1_0.confirmedChoice = true

			ACTIONS.LeaveMenu(arg_1_0)
		end)
		arg_3_0:addEventHandler("gain_focus", function(arg_5_0, arg_5_1)
			var_1_2(arg_5_0, arg_5_1)
		end)
	end)
	arg_1_0.ButtonsList:SetNumColumns(1)
	arg_1_0.ButtonsList:SetNumRows(#var_1_1.labels)
	arg_1_0.ButtonsList:RefreshContent()
	arg_1_0.ButtonsList:SetActiveParentBehavior()
	arg_1_0:addEventHandler("menu_close", function(arg_6_0, arg_6_1)
		if not arg_1_0.confirmedChoice then
			Engine.DFJDIFJEGA("colorBlindMode", var_1_0, arg_1_1)
		end
	end)
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
		arg_1_0.bindButton:addEventHandler("button_start", function(arg_8_0, arg_8_1)
			if Engine.CAADCDEEIA() then
				ACTIONS.ResumeGame(arg_8_0)
			end

			LUI.FlowManager.RequestCloseAllMenus()

			return true
		end)
		MenuUtils.AddDismissPauseMenuKBMHandler(arg_1_0)
	end

	arg_1_0.bindButton:addEventHandler("button_select", function(arg_9_0, arg_9_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/COLOR_BLIND_CAPS"))

	local var_1_3 = arg_1_0.ButtonsList:GetElementAtPosition(0, var_1_1.defaultValue - 1)

	arg_1_0.ButtonOptionsDescriptionText.Description:setText(var_1_1.description[var_1_3.index])

	if var_1_3 then
		var_1_3:dispatchEventToParent({
			name = "request_active",
			target = var_1_3
		})
	end

	local function var_1_4()
		local var_10_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_1_0.Background:SetScale(var_10_0)
	end

	arg_1_0:addAndCallEventHandler("onVideoChange", var_1_4)

	if Engine.DDJFBBJAIG() then
		arg_1_0.BackgroundMP:SetAlpha(0)
		arg_1_0.Background:SetAlpha(1)
		LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	else
		arg_1_0.BackgroundMP:SetAlpha(0.5)
		arg_1_0.Background:SetAlpha(0)
		ACTIONS.ScaleFullscreen(arg_1_0.BackgroundMP)
	end

	local var_1_5 = LUI.UIElement.new()

	var_1_5:SetBlurStrength(5)
	var_1_5:setupWorldBlur()

	var_1_5.id = "blur"

	arg_1_0:addElement(var_1_5)
end

function ColorblindFullscreen(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIVerticalNavigator.new()

	var_11_0.id = "ColorblindFullscreen"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	var_11_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_11_1
	})
	var_11_0.HelperBar.id = "HelperBar"

	var_11_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_11_0.HelperBar:setPriority(10)
	var_11_0:addElement(var_11_0.HelperBar)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Background"

	var_11_4:setImage(RegisterMaterial("frontend_option_bg"), 0)
	var_11_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.Background = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "BackgroundMP"

	var_11_6:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_11_6:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_11_0:addElement(var_11_6)

	var_11_0.BackgroundMP = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "MenuTitle"

	var_11_8.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/COLOR_BLIND_CAPS")), 0)
	var_11_8.Line:SetLeft(0, 0)
	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_11_0:addElement(var_11_8)

	var_11_0.MenuTitle = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "ImagePreview"

	var_11_10:setImage(RegisterMaterial("image_options_colorblindtype_fullscreen"), 0)
	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 724, _1080p * 1790, _1080p * 216, _1080p * 817)
	var_11_0:addElement(var_11_10)

	var_11_0.ImagePreview = var_11_10

	local var_11_11
	local var_11_12 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericOptionButton", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_13 = LUI.UIGrid.new(var_11_12)

	var_11_13.id = "ButtonsList"

	var_11_13:setUseStencil(true)
	var_11_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 631, _1080p * 216, _1080p * 979)
	var_11_0:addElement(var_11_13)

	var_11_0.ButtonsList = var_11_13

	local var_11_14
	local var_11_15 = LUI.UIImage.new()

	var_11_15.id = "ImageIcon1"

	var_11_15:SetRGBFromTable(SWATCHES.Scoreboard.highlight, 0)
	var_11_15:setImage(RegisterMaterial("icon_minimap_player"), 0)
	var_11_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 940, _1080p * 1016, _1080p * 860, _1080p * 936)
	var_11_0:addElement(var_11_15)

	var_11_0.ImageIcon1 = var_11_15

	local var_11_16
	local var_11_17 = LUI.UIImage.new()

	var_11_17.id = "ImageIcon2"

	var_11_17:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam, 0)
	var_11_17:setImage(RegisterMaterial("icon_minimap_player"), 0)
	var_11_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1272, _1080p * 1348, _1080p * 860, _1080p * 936)
	var_11_0:addElement(var_11_17)

	var_11_0.ImageIcon2 = var_11_17

	local var_11_18
	local var_11_19 = LUI.UIImage.new()

	var_11_19.id = "ImageIcon3"

	var_11_19:SetRGBFromTable(SWATCHES.Scoreboard.enemyTeam, 0)
	var_11_19:setImage(RegisterMaterial("icon_minimap_player"), 0)
	var_11_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1604, _1080p * 1680, _1080p * 860, _1080p * 936)
	var_11_0:addElement(var_11_19)

	var_11_0.ImageIcon3 = var_11_19

	local var_11_20
	local var_11_21 = LUI.UIText.new()

	var_11_21.id = "YouText"

	var_11_21:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_11_21:setText(Engine.CBBHFCGDIC("LUA_MENU/YOU"), 0)
	var_11_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_21:SetAlignment(LUI.Alignment.Right)
	var_11_21:SetVerticalAlignment(LUI.Alignment.Center)
	var_11_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 755, _1080p * 937, _1080p * 878, _1080p * 908)
	var_11_0:addElement(var_11_21)

	var_11_0.YouText = var_11_21

	local var_11_22
	local var_11_23 = LUI.UIText.new()

	var_11_23.id = "AllyText"

	var_11_23:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_11_23:setText(Engine.CBBHFCGDIC("LUA_MENU/ALLY"), 0)
	var_11_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_23:SetAlignment(LUI.Alignment.Right)
	var_11_23:SetVerticalAlignment(LUI.Alignment.Center)
	var_11_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1087, _1080p * 1269, _1080p * 878, _1080p * 908)
	var_11_0:addElement(var_11_23)

	var_11_0.AllyText = var_11_23

	local var_11_24
	local var_11_25 = LUI.UIText.new()

	var_11_25.id = "EnemyText"

	var_11_25:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_11_25:setText(Engine.CBBHFCGDIC("LUA_MENU/ENEMY"), 0)
	var_11_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_25:SetAlignment(LUI.Alignment.Right)
	var_11_25:SetVerticalAlignment(LUI.Alignment.Center)
	var_11_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1418, _1080p * 1600, _1080p * 878, _1080p * 908)
	var_11_0:addElement(var_11_25)

	var_11_0.EnemyText = var_11_25

	local var_11_26
	local var_11_27 = MenuBuilder.BuildRegisteredType("ButtonOptionsDescriptionText", {
		controllerIndex = var_11_1
	})

	var_11_27.id = "ButtonOptionsDescriptionText"

	var_11_27.Description:SetRight(_1080p * 300, 0)
	var_11_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 300, _1080p * 540, _1080p * 566)
	var_11_0:addElement(var_11_27)

	var_11_0.ButtonOptionsDescriptionText = var_11_27

	local function var_11_28()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_28

	local var_11_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 680
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1746
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 541
		}
	}

	var_11_10:RegisterAnimationSequence("Splitscreen", var_11_29)

	local var_11_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 154
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 917
		}
	}

	var_11_13:RegisterAnimationSequence("Splitscreen", var_11_30)

	local var_11_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 865
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 457
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 941
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 533
		}
	}

	var_11_15:RegisterAnimationSequence("Splitscreen", var_11_31)

	local var_11_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1197
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 457
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1273
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 533
		}
	}

	var_11_17:RegisterAnimationSequence("Splitscreen", var_11_32)

	local var_11_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1529
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 457
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1605
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 533
		}
	}

	var_11_19:RegisterAnimationSequence("Splitscreen", var_11_33)

	local var_11_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 680
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 475
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 862
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 505
		}
	}

	var_11_21:RegisterAnimationSequence("Splitscreen", var_11_34)

	local var_11_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1012
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 475
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1194
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 505
		}
	}

	var_11_23:RegisterAnimationSequence("Splitscreen", var_11_35)

	local var_11_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1343
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 475
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1525
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 505
		}
	}

	var_11_25:RegisterAnimationSequence("Splitscreen", var_11_36)

	local var_11_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 457
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 483
		}
	}

	var_11_27:RegisterAnimationSequence("Splitscreen", var_11_37)

	local function var_11_38()
		var_11_10:AnimateSequence("Splitscreen")
		var_11_13:AnimateSequence("Splitscreen")
		var_11_15:AnimateSequence("Splitscreen")
		var_11_17:AnimateSequence("Splitscreen")
		var_11_19:AnimateSequence("Splitscreen")
		var_11_21:AnimateSequence("Splitscreen")
		var_11_23:AnimateSequence("Splitscreen")
		var_11_25:AnimateSequence("Splitscreen")
		var_11_27:AnimateSequence("Splitscreen")
	end

	var_11_0._sequences.Splitscreen = var_11_38

	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_11_39 = LUI.UIBindButton.new()

	var_11_39.id = "selfBindButton"

	var_11_0:addElement(var_11_39)

	var_11_0.bindButton = var_11_39

	var_11_0.bindButton:addEventHandler("button_secondary", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_11_1
		end

		ACTIONS.LeaveMenu(var_11_0)
	end)
	PostLoadFunc(var_11_0, var_11_1, arg_11_1)

	if CONDITIONS.IsSplitscreen(var_11_0) then
		ACTIONS.AnimateSequence(var_11_0, "Splitscreen")
	end

	return var_11_0
end

MenuBuilder.registerType("ColorblindFullscreen", ColorblindFullscreen)
LockTable(_M)
