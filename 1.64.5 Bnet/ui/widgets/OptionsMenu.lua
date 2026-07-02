module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	Engine.BBHEIABDAC(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = MenuBuilder.BuildRegisteredType(arg_2_2, {
		controllerIndex = arg_2_1
	})

	var_2_0.id = arg_2_2

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1020, _1080p * 1770, _1080p * 415, _1080p * 665)
	arg_2_0:addElement(var_2_0)
	arg_2_3.button:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		var_2_0:processEvent({
			name = arg_2_3.guideEventOver
		})

		if CONDITIONS.IsSplitscreen(arg_2_0) then
			var_2_0:SetTop(150)
			var_2_0:SetLeft(_1080p * 1344)
		end
	end)
	arg_2_3.button:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		var_2_0:processEvent({
			name = arg_2_3.guideEventUp
		})
	end)

	return var_2_0
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/OPTIONS"))

	if Engine.EAAHGICFBD() and Engine.DDJFBBJAIG() then
		local var_5_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
			enableSway = false,
			controllerIndex = arg_5_1
		})

		arg_5_0:addElement(var_5_0)
	end

	assert(arg_5_0.bindButton)

	if not Engine.DDJFBBJAIG() then
		arg_5_0:addEventHandler("menu_create", function()
			arg_5_0:AddButtonHelperText({
				side = "left",
				priority = 20,
				kbmTooltipPromptOverload = "button_dismiss_pause_menu",
				gamepad_only = true,
				button_ref = "button_start",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
			})
		end)
		arg_5_0.bindButton:addEventHandler("button_start", function(arg_7_0, arg_7_1)
			if LUI.IsLastInputGamepad(arg_5_1) then
				if Engine.CAADCDEEIA() then
					ACTIONS.ResumeGame(arg_7_0)
				end

				Engine.EBIDFIDHIE("updategamerprofile")
				LUI.FlowManager.RequestCloseAllMenus()

				return true
			end
		end)
	end

	if CONDITIONS.IsConsoleGame(arg_5_0) and (Engine.DDJFBBJAIG() and Engine.BFDACIJIAD(arg_5_1) or Engine.BFDACIJIAD(arg_5_1)) then
		if arg_5_0.OptionsButtons.Brightness then
			local var_5_1 = {
				guideEventUp = "brightness_up",
				guideEventOver = "brightness_over",
				button = arg_5_0.OptionsButtons.Brightness
			}

			arg_5_0.BrightnessGuide = var_0_1(arg_5_0, arg_5_1, "BrightnessGuide", var_5_1)
		end

		if arg_5_0.OptionsButtons.HDRBrightness then
			local var_5_2 = {
				guideEventUp = "brightness_up",
				guideEventOver = "brightness_over",
				button = arg_5_0.OptionsButtons.HDRBrightness
			}

			arg_5_0.HDRBrightnessGuide = var_0_1(arg_5_0, arg_5_1, "HDRBrightnessGuide", var_5_2)
		end

		if not Engine.EBFEGIICEF() then
			if arg_5_0.OptionsButtons.HDRBlackPoint then
				local var_5_3 = {
					guideEventUp = "black_point_up",
					guideEventOver = "black_point_over",
					button = arg_5_0.OptionsButtons.HDRBlackPoint
				}

				arg_5_0.HDRBlackPointGuide = var_0_1(arg_5_0, arg_5_1, "HDRBlackPointGuide", var_5_3)
			end

			if arg_5_0.OptionsButtons.HDRWhitePoint then
				local var_5_4 = {
					guideEventUp = "white_point_up",
					guideEventOver = "white_point_over",
					button = arg_5_0.OptionsButtons.HDRWhitePoint
				}

				arg_5_0.HDRWhitePointGuide = var_0_1(arg_5_0, arg_5_1, "HDRWhitePointGuide", var_5_4)
			end
		end
	end

	if CONDITIONS.IsPC(arg_5_0) then
		assert(arg_5_0.PCOptionsButtonsElement)
		assert(arg_5_0.PCOptionWindow)
		assert(arg_5_0.PCOptionWindowSubmenu)
		arg_5_0.PCOptionsButtonsElement:registerEventHandler("category_button_over", function(arg_8_0, arg_8_1)
			arg_5_0.ButtonDescriptionText:SetAlpha(1, 0)
			arg_5_0.PCOptionWindow:processEvent({
				name = "hide_description_text"
			})
		end)
		arg_5_0.PCOptionWindow:registerEventHandler("optionwindow_button_over", function(arg_9_0, arg_9_1)
			arg_5_0.ButtonDescriptionText:SetAlpha(0, 0)
			arg_5_0.PCOptionWindow:processEvent({
				name = "show_description_text"
			})
		end)

		local var_5_5 = MenuBuilder.BuildRegisteredType("BrightnessGuide", {
			controllerIndex = arg_5_1
		})

		var_5_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 920, _1080p * 1670, _1080p * 615, _1080p * 865)
		arg_5_0:addElement(var_5_5)

		local var_5_6 = MenuBuilder.BuildRegisteredType("ConnectionMeter", {
			controllerIndex = arg_5_1
		})

		var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1250, _1080p * 1750, _1080p * 740, _1080p * 940)
		arg_5_0:addElement(var_5_6)
		arg_5_0:addEventHandler("gain_focus", function(arg_10_0, arg_10_1)
			if LUI.FlowManager.GetScopedData(arg_5_0).showingSubCategory then
				ACTIONS.GainFocus(arg_5_0, "PCOptionWindowSubmenu", arg_5_1)

				return true
			end
		end)
		arg_5_0.PCOptionsButtonsElement:registerEventHandler("category_changed", function(arg_11_0, arg_11_1)
			arg_5_0.PCOptionWindow:UpdateOptions(arg_5_1, arg_11_1.title, arg_11_1.createOptions)

			if not arg_11_1.noFocus then
				ACTIONS.LoseFocus(arg_5_0, "PCOptionsButtonsElement", arg_5_1)
				ACTIONS.LoseFocus(arg_5_0, "PCOptionWindowSubmenu", arg_5_1)
				ACTIONS.GainFocus(arg_5_0, "PCOptionWindow", arg_5_1)
			end
		end)
		arg_5_0.PCOptionWindow:registerEventHandler("subcategory_changed", function(arg_12_0, arg_12_1)
			arg_5_0.PCOptionWindowSubmenu:UpdateOptions(arg_5_1, arg_12_1.title, arg_12_1.createOptions)
			ACTIONS.AnimateSequence(arg_5_0, "ShowSubmenu")

			LUI.FlowManager.GetScopedData(arg_5_0).showingSubCategory = true

			if not arg_12_1.noFocus then
				ACTIONS.LoseFocus(arg_5_0, "PCOptionsButtonsElement", arg_5_1)
				ACTIONS.LoseFocus(arg_5_0, "PCOptionWindow", arg_5_1)
				ACTIONS.GainFocus(arg_5_0, "PCOptionWindowSubmenu", arg_5_1)
			end
		end)
		arg_5_0.PCOptionWindowSubmenu:processEvent({
			name = "hide_description_text"
		})
		arg_5_0.PCOptionWindow:registerEventHandler("brightness_over", function()
			var_5_5:processEvent({
				name = "brightness_over"
			})
		end)
		arg_5_0.PCOptionWindow:registerEventHandler("brightness_up", function()
			var_5_5:processEvent({
				name = "brightness_up"
			})
		end)
		arg_5_0.PCOptionWindow:registerEventHandler("connection_meter_toggle_internal", function()
			var_5_6:processEvent({
				name = "connection_meter_toggle"
			})
		end)
		arg_5_0.PCOptionsButtonsElement:registerEventHandler("network_diagnostic_show_internal", function()
			var_5_6:processEvent({
				name = "network_diagnostic_show"
			})
		end)
		arg_5_0.PCOptionsButtonsElement:registerEventHandler("network_diagnostic_hide_internal", function()
			var_5_6:processEvent({
				name = "network_diagnostic_hide"
			})
		end)

		local function var_5_7(arg_18_0)
			LUI.FlowManager.GetScopedData(arg_5_0).showingSubCategory = false

			ACTIONS.AnimateSequence(arg_5_0, "HideSubmenu")
			arg_5_0.PCOptionWindowSubmenu:ClearCurrentOptions()

			if arg_18_0 and not arg_18_0.noFocus then
				ACTIONS.LoseFocus(arg_5_0, "PCOptionsButtonsElement", arg_5_1)
				ACTIONS.LoseFocus(arg_5_0, "PCOptionWindowSubmenu", arg_5_1)
				ACTIONS.GainFocus(arg_5_0, "PCOptionWindow", arg_5_1)
			end
		end

		arg_5_0:addEventHandler("subcategory_option_selected", function(arg_19_0, arg_19_1)
			arg_5_0.PCOptionWindow:RefreshCurrentOptions()
		end)
		arg_5_0.bindButton:registerEventHandler("button_secondary", function(arg_20_0, arg_20_1)
			local var_20_0 = arg_20_1.controller or arg_5_1

			if LUI.FlowManager.GetScopedData(arg_5_0).showingSubCategory then
				var_5_7(arg_20_1)
				Engine.BJDBIAGIDA(CoD.SFX.SelectBack)
			elseif arg_5_0.PCOptionWindow:getFirstInFocus() ~= nil then
				ACTIONS.LoseFocus(arg_5_0, "PCOptionWindow", var_20_0)
				ACTIONS.LoseFocus(arg_5_0, "PCOptionWindowSubmenu", var_20_0)
				ACTIONS.GainFocus(arg_5_0, "PCOptionsButtonsElement", var_20_0)
			else
				ACTIONS.LeaveMenu(arg_5_0)
				Engine.DAGFFDGFII("profile_menuDvarsFinish")

				if Dvar.BJJCJHDBII("MPLORMMQPT") == 2 then
					Dvar.IICIFEEDC("QLQPPSRK", -100)
				end

				if Dvar.BJJCJHDBII("MPLORMMQPT") == 1 then
					Dvar.IICIFEEDC("QLQPPSRK", 0)
				end

				Engine.EBIDFIDHIE("updategamerprofile")
			end

			return true
		end)

		if not Engine.EAAHGICFBD() then
			assert(arg_5_0.Background)
			LAYOUT.AddAspectRatioFadeFrame(arg_5_0, arg_5_1, arg_5_0.Background)
		end
	end

	arg_5_0:addEventHandler("menu_close", function(arg_21_0, arg_21_1)
		Engine.EBIDFIDHIE("updategamerprofile")
	end)
	ACTIONS.PlaySoundSetSound(arg_5_0, "selectAlt", false)
	arg_5_0:addElement(CoD.GetWorldBlur())
end

function OptionsMenu(arg_22_0, arg_22_1)
	local var_22_0 = LUI.UIElement.new()

	var_22_0.id = "OptionsMenu"
	var_22_0._animationSets = {}
	var_22_0._sequences = {}

	local var_22_1 = arg_22_1 and arg_22_1.controllerIndex

	if not var_22_1 and not Engine.DDJFBBJAIG() then
		var_22_1 = var_22_0:getRootController()
	end

	assert(var_22_1)
	var_0_0(var_22_0, var_22_1, arg_22_1)

	local var_22_2 = var_22_0
	local var_22_3
	local var_22_4 = LUI.UIImage.new()

	var_22_4.id = "Background"

	var_22_4:SetRGBFromInt(0, 0)
	var_22_4:SetAlpha(0.5, 0)
	var_22_0:addElement(var_22_4)

	var_22_0.Background = var_22_4

	local var_22_5
	local var_22_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_22_1
	})

	var_22_6.id = "ButtonHelperBar"

	var_22_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_22_0:addElement(var_22_6)

	var_22_0.ButtonHelperBar = var_22_6

	local var_22_7
	local var_22_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_22_1
	})

	var_22_8.id = "MenuTitle"

	var_22_8.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")), 0)
	var_22_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_22_0:addElement(var_22_8)

	var_22_0.MenuTitle = var_22_8

	local var_22_9
	local var_22_10 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_22_1
	})

	var_22_10.id = "ButtonDescriptionText"

	var_22_10.Description:SetRight(_1080p * 415, 0)
	var_22_10.Description:SetRGBFromInt(16777215, 0)
	var_22_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 780, _1080p * 914, _1080p * 946)
	var_22_0:addElement(var_22_10)

	var_22_0.ButtonDescriptionText = var_22_10

	local var_22_11

	if CONDITIONS.IsConsoleGame(var_22_0) then
		var_22_11 = MenuBuilder.BuildRegisteredType("OptionsButtons", {
			controllerIndex = var_22_1
		})
		var_22_11.id = "OptionsButtons"

		var_22_11:setImage(RegisterMaterial("hud_ability_disabled_x"), 0)
		var_22_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 780, _1080p * 216, _1080p * 881)
		var_22_0:addElement(var_22_11)

		var_22_0.OptionsButtons = var_22_11
	end

	local var_22_12

	if CONDITIONS.IsPC(var_22_0) then
		var_22_12 = MenuBuilder.BuildRegisteredType("PCOptionsButtons", {
			controllerIndex = var_22_1
		})
		var_22_12.id = "PCOptionsButtonsElement"

		var_22_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 730, _1080p * 196, _1080p * 809)
		var_22_0:addElement(var_22_12)

		var_22_0.PCOptionsButtonsElement = var_22_12
	end

	local var_22_13

	if CONDITIONS.IsPC(var_22_0) then
		var_22_13 = MenuBuilder.BuildRegisteredType("PCOptionWindow", {
			controllerIndex = var_22_1
		})
		var_22_13.id = "PCOptionWindow"

		var_22_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1790, _1080p * 196, _1080p * 996)
		var_22_0:addElement(var_22_13)

		var_22_0.PCOptionWindow = var_22_13
	end

	local var_22_14

	if CONDITIONS.IsPC(var_22_0) then
		var_22_14 = MenuBuilder.BuildRegisteredType("PCOptionWindow", {
			controllerIndex = var_22_1
		})
		var_22_14.id = "PCOptionWindowSubmenu"

		var_22_14:SetAlpha(0, 0)
		var_22_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1946, _1080p * 2582, _1080p * 196, _1080p * 996)
		var_22_0:addElement(var_22_14)

		var_22_0.PCOptionWindowSubmenu = var_22_14
	end

	local var_22_15
	local var_22_16 = MenuBuilder.BuildRegisteredType("ArrowUp", {
		controllerIndex = var_22_1
	})

	var_22_16.id = "ArrowUp"

	var_22_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 463, _1080p * 483, _1080p * 881, _1080p * 921)
	var_22_0:addElement(var_22_16)

	var_22_0.ArrowUp = var_22_16

	local var_22_17
	local var_22_18 = MenuBuilder.BuildRegisteredType("ArrowDown", {
		controllerIndex = var_22_1
	})

	var_22_18.id = "ArrowDown"

	var_22_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 427, _1080p * 447, _1080p * 881, _1080p * 921)
	var_22_0:addElement(var_22_18)

	var_22_0.ArrowDown = var_22_18

	local function var_22_19()
		return
	end

	var_22_0._sequences.DefaultSequence = var_22_19

	local var_22_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1920
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 995
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1080
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_22_6:RegisterAnimationSequence("FullScreenState", var_22_20)

	local var_22_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 906
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 917
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 949
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_22_10:RegisterAnimationSequence("FullScreenState", var_22_21)

	if CONDITIONS.IsConsoleGame(var_22_0) then
		local var_22_22 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 130
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 906
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 216
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 917
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_22_11:RegisterAnimationSequence("FullScreenState", var_22_22)
	end

	local function var_22_23()
		var_22_6:AnimateSequence("FullScreenState")
		var_22_10:AnimateSequence("FullScreenState")

		if CONDITIONS.IsConsoleGame(var_22_0) then
			var_22_11:AnimateSequence("FullScreenState")
		end
	end

	var_22_0._sequences.FullScreenState = var_22_23

	local var_22_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 550
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 496
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 528
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_22_10:RegisterAnimationSequence("SplitScreenState", var_22_24)

	if CONDITIONS.IsConsoleGame(var_22_0) then
		local var_22_25 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 130
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 906
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 216
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 496
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_22_11:RegisterAnimationSequence("SplitScreenState", var_22_25)
	end

	local function var_22_26()
		var_22_10:AnimateSequence("SplitScreenState")

		if CONDITIONS.IsConsoleGame(var_22_0) then
			var_22_11:AnimateSequence("SplitScreenState")
		end
	end

	var_22_0._sequences.SplitScreenState = var_22_26

	if CONDITIONS.IsPC(var_22_0) then
		local var_22_27 = {
			{
				duration = 120,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -600
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Right
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 196
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 809
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_22_12:RegisterAnimationSequence("ShowSubmenu", var_22_27)
	end

	if CONDITIONS.IsPC(var_22_0) then
		local var_22_28 = {
			{
				duration = 120,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 96
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1096
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 196
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 996
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_22_13:RegisterAnimationSequence("ShowSubmenu", var_22_28)
	end

	if CONDITIONS.IsPC(var_22_0) then
		local var_22_29 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1154
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1790
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 196
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 996
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_22_14:RegisterAnimationSequence("ShowSubmenu", var_22_29)
	end

	local function var_22_30()
		if CONDITIONS.IsPC(var_22_0) then
			var_22_12:AnimateSequence("ShowSubmenu")
		end

		if CONDITIONS.IsPC(var_22_0) then
			var_22_13:AnimateSequence("ShowSubmenu")
		end

		if CONDITIONS.IsPC(var_22_0) then
			var_22_14:AnimateSequence("ShowSubmenu")
		end
	end

	var_22_0._sequences.ShowSubmenu = var_22_30

	if CONDITIONS.IsPC(var_22_0) then
		local var_22_31 = {
			{
				duration = 120,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 130
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 730
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 196
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 809
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_22_12:RegisterAnimationSequence("HideSubmenu", var_22_31)
	end

	if CONDITIONS.IsPC(var_22_0) then
		local var_22_32 = {
			{
				duration = 120,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 790
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1790
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 196
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 996
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_22_13:RegisterAnimationSequence("HideSubmenu", var_22_32)
	end

	if CONDITIONS.IsPC(var_22_0) then
		local var_22_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1946
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 2582
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 196
			},
			{
				duration = 120,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 996
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0,
				duration = 120,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 120,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_22_14:RegisterAnimationSequence("HideSubmenu", var_22_33)
	end

	local function var_22_34()
		if CONDITIONS.IsPC(var_22_0) then
			var_22_12:AnimateSequence("HideSubmenu")
		end

		if CONDITIONS.IsPC(var_22_0) then
			var_22_13:AnimateSequence("HideSubmenu")
		end

		if CONDITIONS.IsPC(var_22_0) then
			var_22_14:AnimateSequence("HideSubmenu")
		end
	end

	var_22_0._sequences.HideSubmenu = var_22_34

	function var_22_0.addButtonHelperFunction(arg_28_0, arg_28_1)
		arg_28_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
		arg_28_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_22_0:addEventHandler("menu_create", var_22_0.addButtonHelperFunction)

	local var_22_35 = LUI.UIBindButton.new()

	var_22_35.id = "selfBindButton"

	var_22_0:addElement(var_22_35)

	var_22_0.bindButton = var_22_35

	var_22_0.bindButton:addEventHandler("button_secondary", function(arg_29_0, arg_29_1)
		if not arg_29_1.controller then
			local var_29_0 = var_22_1
		end

		ACTIONS.LeaveMenu(var_22_0)
	end)
	var_22_0:addEventHandler("menu_create", function(arg_30_0, arg_30_1)
		if not arg_30_1.controller then
			local var_30_0 = var_22_1
		end

		if CONDITIONS.IsSplitscreen(var_22_0) then
			ACTIONS.AnimateSequence(var_22_0, "SplitScreenState")
		end

		if CONDITIONS.IsThirdGameMode(var_22_0) then
			ACTIONS.PlaySoundSetSound(var_22_0, "cpSelectAlt", false)
		end
	end)
	var_0_2(var_22_0, var_22_1, arg_22_1)

	return var_22_0
end

MenuBuilder.registerType("OptionsMenu", OptionsMenu)
LockTable(_M)
