module(..., package.seeall)

local function var_0_0(arg_1_0)
	return function(arg_2_0, arg_2_1)
		Dvar.IICIFEEDC("LLTNTOTMMT", arg_2_0)
		arg_1_0:dispatchEventToCurrentMenu({
			name = "black_point_updated"
		})
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Background)
	assert(arg_3_0.MenuTitle)
	assert(arg_3_0.Step)
	assert(arg_3_0.HDRBlackPointGuide)
	assert(arg_3_0.Subtitle)
	assert(arg_3_0.HelpText)
	assert(arg_3_0.Slider)
	assert(arg_3_0.Continue)

	arg_3_0.isBootOptions = arg_3_2.isBootOption or false

	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/HDR_CALIBRATION"))
	arg_3_0.Step:setText(Engine.CBBHFCGDIC("MENU/HDR_STEP", 1, 2))
	arg_3_0.HDRBlackPointGuide.CalibrationGuide:SetLabelsVisible(true)
	arg_3_0:addEventHandler("menu_create", function(arg_4_0, arg_4_1)
		arg_4_0:dispatchEventToChildren({
			name = "black_point_over"
		})

		if arg_4_0.isBootOptions then
			arg_4_0.isQuickAccessShortcutsDisabled = true
		end

		if not arg_3_2.fromOptionMenu and (Engine.BAHIIBFDDG() or Engine.BEFACAIFDD()) then
			local var_4_0 = MenuBuilder.BuildRegisteredType("PlayerLogIn", {
				controllerIndex = arg_3_1
			})

			var_4_0.id = "gamertag"

			var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 116, _1080p * 585, _1080p * 964.5, _1080p * 993.5)
			arg_4_0:addElement(var_4_0)

			arg_4_0.gamertag = var_4_0
		end

		if not arg_4_0.isBootOptions then
			arg_4_0:AddButtonHelperText({
				clickable = true,
				button_ref = "button_secondary",
				side = "left",
				helper_text = Engine.CBBHFCGDIC("MENU/BACK")
			})

			local var_4_1 = LUI.UIBindButton.new()

			var_4_1.id = "selfBindButton"

			arg_4_0:addElement(var_4_1)

			arg_4_0.bindButton = var_4_1

			arg_4_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
				ACTIONS.LeaveMenu(arg_4_0)
			end)
			arg_4_0:addEventHandler("gamepad_button", function(arg_6_0, arg_6_1)
				if arg_6_1.button == "secondary" then
					ACTIONS.LeaveMenu(arg_6_0)
				end
			end)
			arg_4_0.bindButton:addEventHandler("button_select", function(arg_7_0, arg_7_1)
				ACTIONS.LeaveMenu(arg_4_0)
			end)
		end

		arg_4_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end)
	arg_3_0.Continue:addEventHandler("button_action", function()
		if arg_3_2.fromOptionMenu then
			Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_3_1)
		end

		LUI.FlowManager.RequestPopupMenu(unused, "BootHDRWhitePoint", false, arg_3_1, true, arg_3_2, nil, true, true)
	end)

	arg_3_0.Slider.listDefaultFocus = true

	local var_3_0 = Dvar.BJJCJHDBII("LLTNTOTMMT")
	local var_3_1 = {
		wrapAround = false,
		defaultValue = var_3_0,
		action = var_0_0(arg_3_0),
		min = SliderBounds.HDRMinLum.Min,
		max = SliderBounds.HDRMinLum.Max,
		step = SliderBounds.HDRMinLum.Step,
		decimalPlacesToRound = SliderBounds.HDRMinLum.DecimalsToRound,
		fillElement = arg_3_0.Slider.GenericFillBar.Fill,
		textSelectionColor = {
			g = 100,
			a = 255,
			b = 100,
			r = 96
		}
	}

	LUI.AddSliderWithEditBoxLogic(arg_3_0.Slider, arg_3_1, var_3_1)
	assert(arg_3_0.Background)

	local function var_3_2()
		local var_9_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_3_0.Background:SetScale(var_9_0)
	end

	arg_3_0:addAndCallEventHandler("onVideoChange", var_3_2)

	if Engine.DDJFBBJAIG() then
		arg_3_0.BackgroundMP:SetAlpha(0)
		arg_3_0.Background:SetAlpha(1)
		LAYOUT.AddAspectRatioFadeFrame(arg_3_0, arg_3_1)
	else
		arg_3_0.BackgroundMP:SetAlpha(0.8)
		arg_3_0.Background:SetAlpha(0)
		ACTIONS.ScaleFullscreen(arg_3_0.BackgroundMP)
	end

	if CONDITIONS.IsSplitscreen(arg_3_0) then
		ACTIONS.AnimateSequence(arg_3_0, "Splitscreen")
	end
end

function BootHDRBlackPoint(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIVerticalNavigator.new()

	var_10_0.id = "BootHDRBlackPoint"
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
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Background"

	var_10_4:setImage(RegisterMaterial("frontend_option_bg"), 0)
	var_10_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Background = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "BackgroundMP"

	var_10_6:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_10_6:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_10_0:addElement(var_10_6)

	var_10_0.BackgroundMP = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("HDRBlackPointGuide", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "HDRBlackPointGuide"

	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 585, _1080p * 1335, _1080p * 365, _1080p * 615)
	var_10_0:addElement(var_10_8)

	var_10_0.HDRBlackPointGuide = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIText.new()

	var_10_10.id = "HelpText"

	var_10_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_10:setText(Engine.CBBHFCGDIC("MENU/HDR_CALIBRATION_DESC"), 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_10:SetAlignment(LUI.Alignment.Center)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -500, _1080p * 500, _1080p * 744, _1080p * 768)
	var_10_0:addElement(var_10_10)

	var_10_0.HelpText = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIText.new()

	var_10_12.id = "Subtitle"

	var_10_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_12:setText(Engine.CBBHFCGDIC("MENU/HDR_BLACK_POINT"), 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_12:SetAlignment(LUI.Alignment.Center)
	var_10_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 585, _1080p * -585, _1080p * 689, _1080p * 725)
	var_10_0:addElement(var_10_12)

	var_10_0.Subtitle = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "Continue"

	var_10_14.Text:SetLeft(_1080p * 20, 0)
	var_10_14.Text:setText(Engine.CBBHFCGDIC("MENU/CONTINUE"), 0)
	var_10_14.Text:SetAlignment(LUI.Alignment.Center)
	var_10_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -188, _1080p * 172, _1080p * 903, _1080p * 941)
	var_10_0:addElement(var_10_14)

	var_10_0.Continue = var_10_14

	local var_10_15
	local var_10_16 = LUI.UIText.new()

	var_10_16.id = "Step"

	var_10_16:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_16:setText("", 0)
	var_10_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_16:SetAlignment(LUI.Alignment.Center)
	var_10_16:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 885, _1080p * 1035, _1080p * 230, _1080p * 254)
	var_10_0:addElement(var_10_16)

	var_10_0.Step = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIImage.new()

	var_10_18.id = "Pip1"

	var_10_18:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_10_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -16, _1080p * -4, _1080p * 260, _1080p * 272)
	var_10_0:addElement(var_10_18)

	var_10_0.Pip1 = var_10_18

	local var_10_19
	local var_10_20 = LUI.UIImage.new()

	var_10_20.id = "Pip2"

	var_10_20:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_10_20:SetAlpha(0.4, 0)
	var_10_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 4, _1080p * 16, _1080p * 260, _1080p * 272)
	var_10_0:addElement(var_10_20)

	var_10_0.Pip2 = var_10_20

	local var_10_21
	local var_10_22 = MenuBuilder.BuildRegisteredType("GenericSliderWithEditBox", {
		controllerIndex = var_10_1
	})

	var_10_22.id = "Slider"

	var_10_22.GenericOptionButtonBase.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_10_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -188, _1080p * 172, _1080p * 859, _1080p * 897)
	var_10_0:addElement(var_10_22)

	var_10_0.Slider = var_10_22

	local var_10_23
	local var_10_24 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_10_1
	})

	var_10_24.id = "MenuTitle"

	var_10_24.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/HDR_CALIBRATION")), 0)
	var_10_24.Line:SetLeft(0, 0)
	var_10_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 60, 0, _1080p * 100)
	var_10_0:addElement(var_10_24)

	var_10_0.MenuTitle = var_10_24

	local function var_10_25()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_25

	local var_10_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 360
		}
	}

	var_10_8:RegisterAnimationSequence("Splitscreen", var_10_26)

	local var_10_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 430
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 454
		}
	}

	var_10_10:RegisterAnimationSequence("Splitscreen", var_10_27)

	local var_10_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 375
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 411
		}
	}

	var_10_12:RegisterAnimationSequence("Splitscreen", var_10_28)

	local var_10_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 521
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 559
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 170
		}
	}

	var_10_14:RegisterAnimationSequence("Splitscreen", var_10_29)

	local var_10_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 80
		}
	}

	var_10_16:RegisterAnimationSequence("Splitscreen", var_10_30)

	local var_10_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		}
	}

	var_10_18:RegisterAnimationSequence("Splitscreen", var_10_31)

	local var_10_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		}
	}

	var_10_20:RegisterAnimationSequence("Splitscreen", var_10_32)

	local var_10_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 477
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 515
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 170
		}
	}

	var_10_22:RegisterAnimationSequence("Splitscreen", var_10_33)

	local function var_10_34()
		var_10_8:AnimateSequence("Splitscreen")
		var_10_10:AnimateSequence("Splitscreen")
		var_10_12:AnimateSequence("Splitscreen")
		var_10_14:AnimateSequence("Splitscreen")
		var_10_16:AnimateSequence("Splitscreen")
		var_10_18:AnimateSequence("Splitscreen")
		var_10_20:AnimateSequence("Splitscreen")
		var_10_22:AnimateSequence("Splitscreen")
	end

	var_10_0._sequences.Splitscreen = var_10_34

	var_0_1(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("BootHDRBlackPoint", BootHDRBlackPoint)
LockTable(_M)
