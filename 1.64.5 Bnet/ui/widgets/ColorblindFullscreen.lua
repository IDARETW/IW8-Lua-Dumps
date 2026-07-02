module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuBackgroundImage)
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

		local var_2_0, var_2_1 = Engine.CBCJIDDIED(arg_1_1)

		if var_2_0 and not var_2_1 then
			if arg_2_0.index == COLOR_BLIND.modes.none then
				ACTIONS.AnimateSequence(arg_1_0, "NoFilter")
			elseif arg_2_0.index == COLOR_BLIND.modes.protanope then
				ACTIONS.AnimateSequence(arg_1_0, "Protanopia")
			elseif arg_2_0.index == COLOR_BLIND.modes.deuteranope then
				ACTIONS.AnimateSequence(arg_1_0, "Deutanopia")
			elseif arg_2_0.index == COLOR_BLIND.modes.tritanope then
				ACTIONS.AnimateSequence(arg_1_0, "Tritanopia")
			end
		end
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

	arg_1_0.MenuBackgroundImage:SetVideoSizeUpdateHandler()
end

function ColorblindFullscreen(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIVerticalNavigator.new()

	var_10_0.id = "ColorblindFullscreen"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("MenuBackgroundImage", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "MenuBackgroundImage"

	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.MenuBackgroundImage = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "MenuTitle"

	var_10_6.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/COLOR_BLIND_CAPS")), 0)
	var_10_6.Line:SetLeft(0, 0)
	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_10_0:addElement(var_10_6)

	var_10_0.MenuTitle = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "ImagePreview"

	var_10_8:setImage(RegisterMaterial("image_options_colorblindtype_fullscreen"), 0)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 724, _1080p * 1790, _1080p * 216, _1080p * 817)
	var_10_0:addElement(var_10_8)

	var_10_0.ImagePreview = var_10_8

	local var_10_9
	local var_10_10 = {
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
		controllerIndex = var_10_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericOptionButton", {
				controllerIndex = var_10_1
			})
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_10_11 = LUI.UIGrid.new(var_10_10)

	var_10_11.id = "ButtonsList"

	var_10_11:setUseStencil(true)
	var_10_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 631, _1080p * 216, _1080p * 979)
	var_10_0:addElement(var_10_11)

	var_10_0.ButtonsList = var_10_11

	local var_10_12
	local var_10_13 = LUI.UIImage.new()

	var_10_13.id = "ImageIcon1"

	var_10_13:SetRGBFromTable(SWATCHES.Scoreboard.highlight, 0)
	var_10_13:setImage(RegisterMaterial("icon_minimap_player"), 0)
	var_10_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 940, _1080p * 1016, _1080p * 860, _1080p * 936)
	var_10_0:addElement(var_10_13)

	var_10_0.ImageIcon1 = var_10_13

	local var_10_14
	local var_10_15 = LUI.UIImage.new()

	var_10_15.id = "ImageIcon2"

	var_10_15:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam, 0)
	var_10_15:setImage(RegisterMaterial("icon_minimap_player"), 0)
	var_10_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1272, _1080p * 1348, _1080p * 860, _1080p * 936)
	var_10_0:addElement(var_10_15)

	var_10_0.ImageIcon2 = var_10_15

	local var_10_16
	local var_10_17 = LUI.UIImage.new()

	var_10_17.id = "ImageIcon3"

	var_10_17:SetRGBFromTable(SWATCHES.Scoreboard.enemyTeam, 0)
	var_10_17:setImage(RegisterMaterial("icon_minimap_player"), 0)
	var_10_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1604, _1080p * 1680, _1080p * 860, _1080p * 936)
	var_10_0:addElement(var_10_17)

	var_10_0.ImageIcon3 = var_10_17

	local var_10_18
	local var_10_19 = LUI.UIText.new()

	var_10_19.id = "YouText"

	var_10_19:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_19:setText(Engine.CBBHFCGDIC("LUA_MENU/YOU"), 0)
	var_10_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_19:SetAlignment(LUI.Alignment.Right)
	var_10_19:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 755, _1080p * 937, _1080p * 878, _1080p * 908)
	var_10_0:addElement(var_10_19)

	var_10_0.YouText = var_10_19

	local var_10_20
	local var_10_21 = LUI.UIText.new()

	var_10_21.id = "AllyText"

	var_10_21:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_21:setText(Engine.CBBHFCGDIC("LUA_MENU/ALLY"), 0)
	var_10_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_21:SetAlignment(LUI.Alignment.Right)
	var_10_21:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1087, _1080p * 1269, _1080p * 878, _1080p * 908)
	var_10_0:addElement(var_10_21)

	var_10_0.AllyText = var_10_21

	local var_10_22
	local var_10_23 = LUI.UIText.new()

	var_10_23.id = "EnemyText"

	var_10_23:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_23:setText(Engine.CBBHFCGDIC("LUA_MENU/ENEMY"), 0)
	var_10_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_23:SetAlignment(LUI.Alignment.Right)
	var_10_23:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1418, _1080p * 1600, _1080p * 878, _1080p * 908)
	var_10_0:addElement(var_10_23)

	var_10_0.EnemyText = var_10_23

	local var_10_24
	local var_10_25 = MenuBuilder.BuildRegisteredType("ButtonOptionsDescriptionText", {
		controllerIndex = var_10_1
	})

	var_10_25.id = "ButtonOptionsDescriptionText"

	var_10_25.Description:SetRight(_1080p * 300, 0)
	var_10_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 300, _1080p * 540, _1080p * 566)
	var_10_0:addElement(var_10_25)

	var_10_0.ButtonOptionsDescriptionText = var_10_25

	local function var_10_26()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_26

	local var_10_27
	local var_10_28 = {
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

	var_10_8:RegisterAnimationSequence("Splitscreen", var_10_28)

	local var_10_29 = {
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

	var_10_11:RegisterAnimationSequence("Splitscreen", var_10_29)

	local var_10_30 = {
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

	var_10_13:RegisterAnimationSequence("Splitscreen", var_10_30)

	local var_10_31 = {
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

	var_10_15:RegisterAnimationSequence("Splitscreen", var_10_31)

	local var_10_32 = {
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

	var_10_17:RegisterAnimationSequence("Splitscreen", var_10_32)

	local var_10_33 = {
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

	var_10_19:RegisterAnimationSequence("Splitscreen", var_10_33)

	local var_10_34 = {
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

	var_10_21:RegisterAnimationSequence("Splitscreen", var_10_34)

	local var_10_35 = {
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

	var_10_23:RegisterAnimationSequence("Splitscreen", var_10_35)

	local var_10_36 = {
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

	var_10_25:RegisterAnimationSequence("Splitscreen", var_10_36)

	local function var_10_37()
		var_10_8:AnimateSequence("Splitscreen")
		var_10_11:AnimateSequence("Splitscreen")
		var_10_13:AnimateSequence("Splitscreen")
		var_10_15:AnimateSequence("Splitscreen")
		var_10_17:AnimateSequence("Splitscreen")
		var_10_19:AnimateSequence("Splitscreen")
		var_10_21:AnimateSequence("Splitscreen")
		var_10_23:AnimateSequence("Splitscreen")
		var_10_25:AnimateSequence("Splitscreen")
	end

	var_10_0._sequences.Splitscreen = var_10_37

	local var_10_38
	local var_10_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("image_options_colorblindtype_protanopia_fullscreen")
		}
	}

	var_10_8:RegisterAnimationSequence("Protanopia", var_10_39)

	local var_10_40 = {
		{
			value = 14930251,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_13:RegisterAnimationSequence("Protanopia", var_10_40)

	local var_10_41 = {
		{
			value = 8300017,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_15:RegisterAnimationSequence("Protanopia", var_10_41)

	local var_10_42 = {
		{
			value = 14060554,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_17:RegisterAnimationSequence("Protanopia", var_10_42)

	local function var_10_43()
		var_10_8:AnimateSequence("Protanopia")
		var_10_13:AnimateSequence("Protanopia")
		var_10_15:AnimateSequence("Protanopia")
		var_10_17:AnimateSequence("Protanopia")
	end

	var_10_0._sequences.Protanopia = var_10_43

	local var_10_44
	local var_10_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("image_options_colorblindtype_deutanopia_fullscreen")
		}
	}

	var_10_8:RegisterAnimationSequence("Deutanopia", var_10_45)

	local var_10_46 = {
		{
			value = 16107852,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_13:RegisterAnimationSequence("Deutanopia", var_10_46)

	local var_10_47 = {
		{
			value = 46065,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_15:RegisterAnimationSequence("Deutanopia", var_10_47)

	local var_10_48 = {
		{
			value = 16728087,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_17:RegisterAnimationSequence("Deutanopia", var_10_48)

	local function var_10_49()
		var_10_8:AnimateSequence("Deutanopia")
		var_10_13:AnimateSequence("Deutanopia")
		var_10_15:AnimateSequence("Deutanopia")
		var_10_17:AnimateSequence("Deutanopia")
	end

	var_10_0._sequences.Deutanopia = var_10_49

	local var_10_50
	local var_10_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("image_options_colorblindtype_tritanopia_fullscreen")
		}
	}

	var_10_8:RegisterAnimationSequence("Tritanopia", var_10_51)

	local var_10_52 = {
		{
			value = 16758106,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_13:RegisterAnimationSequence("Tritanopia", var_10_52)

	local var_10_53 = {
		{
			value = 50156,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_15:RegisterAnimationSequence("Tritanopia", var_10_53)

	local var_10_54 = {
		{
			value = 16732247,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_17:RegisterAnimationSequence("Tritanopia", var_10_54)

	local function var_10_55()
		var_10_8:AnimateSequence("Tritanopia")
		var_10_13:AnimateSequence("Tritanopia")
		var_10_15:AnimateSequence("Tritanopia")
		var_10_17:AnimateSequence("Tritanopia")
	end

	var_10_0._sequences.Tritanopia = var_10_55

	local var_10_56
	local var_10_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("image_options_colorblindtype_fullscreen")
		}
	}

	var_10_8:RegisterAnimationSequence("NoFilter", var_10_57)

	local var_10_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.highlight
		}
	}

	var_10_13:RegisterAnimationSequence("NoFilter", var_10_58)

	local var_10_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.friendlyTeam
		}
	}

	var_10_15:RegisterAnimationSequence("NoFilter", var_10_59)

	local var_10_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeam
		}
	}

	var_10_17:RegisterAnimationSequence("NoFilter", var_10_60)

	local function var_10_61()
		var_10_8:AnimateSequence("NoFilter")
		var_10_13:AnimateSequence("NoFilter")
		var_10_15:AnimateSequence("NoFilter")
		var_10_17:AnimateSequence("NoFilter")
	end

	var_10_0._sequences.NoFilter = var_10_61

	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_10_62 = LUI.UIBindButton.new()

	var_10_62.id = "selfBindButton"

	var_10_0:addElement(var_10_62)

	var_10_0.bindButton = var_10_62

	var_10_0.bindButton:addEventHandler("button_secondary", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_10_1
		end

		ACTIONS.LeaveMenu(var_10_0)
	end)
	PostLoadFunc(var_10_0, var_10_1, arg_10_1)

	if CONDITIONS.IsSplitscreen(var_10_0) then
		ACTIONS.AnimateSequence(var_10_0, "Splitscreen")
	end

	return var_10_0
end

MenuBuilder.registerType("ColorblindFullscreen", ColorblindFullscreen)
LockTable(_M)
