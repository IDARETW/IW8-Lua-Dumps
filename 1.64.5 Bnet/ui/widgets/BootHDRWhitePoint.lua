module(..., package.seeall)

local function var_0_0(arg_1_0)
	return function(arg_2_0, arg_2_1)
		Dvar.IICIFEEDC("NKQOMLOSN", arg_2_0)
		arg_1_0:dispatchEventToCurrentMenu({
			name = "white_point_updated"
		})
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.MenuBackgroundImage)
	assert(arg_3_0.MenuTitle)
	assert(arg_3_0.Step)
	assert(arg_3_0.HDRWhitePointGuide)
	assert(arg_3_0.Subtitle)
	assert(arg_3_0.HelpText)
	assert(arg_3_0.Slider)
	assert(arg_3_0.Continue)

	arg_3_0.isBootOptions = arg_3_2.isBootOption or false

	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/HDR_CALIBRATION"))
	arg_3_0.Step:setText(Engine.CBBHFCGDIC("MENU/HDR_STEP", 2, 2))
	arg_3_0.HDRWhitePointGuide.CalibrationGuide:SetLabelsVisible(true)
	arg_3_0:addEventHandler("menu_create", function(arg_4_0, arg_4_1)
		arg_4_0:dispatchEventToChildren({
			name = "white_point_over"
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

		LUI.FlowManager.RequestLeaveMenu(arg_3_0, true)
	end)

	arg_3_0.Slider.listDefaultFocus = true

	local var_3_0 = Dvar.BJJCJHDBII("NKQOMLOSN")
	local var_3_1 = {
		wrapAround = false,
		defaultValue = var_3_0,
		action = var_0_0(arg_3_0),
		min = SliderBounds.HDRMaxLum.Min,
		max = SliderBounds.HDRMaxLum.Max,
		step = SliderBounds.HDRMaxLum.Step,
		decimalPlacesToRound = SliderBounds.HDRMaxLum.DecimalsToRound,
		fillElement = arg_3_0.Slider.GenericFillBar.Fill,
		textSelectionColor = {
			g = 100,
			a = 255,
			b = 100,
			r = 96
		}
	}

	LUI.AddSliderWithEditBoxLogic(arg_3_0.Slider, arg_3_1, var_3_1)
	arg_3_0.MenuBackgroundImage:SetVideoSizeUpdateHandler()
end

function BootHDRWhitePoint(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIVerticalNavigator.new()

	var_9_0.id = "BootHDRWhitePoint"

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
	local var_9_4 = MenuBuilder.BuildRegisteredType("MenuBackgroundImage", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "MenuBackgroundImage"

	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.MenuBackgroundImage = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIText.new()

	var_9_6.id = "Step"

	var_9_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_9_6:setText("", 0)
	var_9_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_6:SetAlignment(LUI.Alignment.Center)
	var_9_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_9_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 885, _1080p * 1035, _1080p * 230, _1080p * 254)
	var_9_0:addElement(var_9_6)

	var_9_0.Step = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("HDRWhitePointGuide", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "HDRWhitePointGuide"

	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 585, _1080p * 1335, _1080p * 365, _1080p * 615)
	var_9_0:addElement(var_9_8)

	var_9_0.HDRWhitePointGuide = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIText.new()

	var_9_10.id = "Subtitle"

	var_9_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_9_10:setText(Engine.CBBHFCGDIC("MENU/HDR_WHITE_POINT"), 0)
	var_9_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_10:SetAlignment(LUI.Alignment.Center)
	var_9_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 585, _1080p * -585, _1080p * 689, _1080p * 725)
	var_9_0:addElement(var_9_10)

	var_9_0.Subtitle = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIText.new()

	var_9_12.id = "HelpText"

	var_9_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_9_12:setText(Engine.CBBHFCGDIC("MENU/HDR_CALIBRATION_DESC"), 0)
	var_9_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_12:SetAlignment(LUI.Alignment.Center)
	var_9_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -500, _1080p * 500, _1080p * 744, _1080p * 768)
	var_9_0:addElement(var_9_12)

	var_9_0.HelpText = var_9_12

	local var_9_13
	local var_9_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_9_1
	})

	var_9_14.id = "Continue"

	var_9_14.Text:SetLeft(_1080p * 20, 0)
	var_9_14.Text:setText(Engine.CBBHFCGDIC("MENU/CONTINUE"), 0)
	var_9_14.Text:SetAlignment(LUI.Alignment.Center)
	var_9_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -188, _1080p * 172, _1080p * 903, _1080p * 941)
	var_9_0:addElement(var_9_14)

	var_9_0.Continue = var_9_14

	local var_9_15
	local var_9_16 = LUI.UIImage.new()

	var_9_16.id = "Pip1"

	var_9_16:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_9_16:SetAlpha(0.4, 0)
	var_9_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -16, _1080p * -4, _1080p * 260, _1080p * 272)
	var_9_0:addElement(var_9_16)

	var_9_0.Pip1 = var_9_16

	local var_9_17
	local var_9_18 = LUI.UIImage.new()

	var_9_18.id = "Pip2"

	var_9_18:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_9_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 4, _1080p * 16, _1080p * 260, _1080p * 272)
	var_9_0:addElement(var_9_18)

	var_9_0.Pip2 = var_9_18

	local var_9_19
	local var_9_20 = MenuBuilder.BuildRegisteredType("GenericSliderWithEditBox", {
		controllerIndex = var_9_1
	})

	var_9_20.id = "Slider"

	var_9_20.GenericOptionButtonBase.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_9_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -188, _1080p * 172, _1080p * 859, _1080p * 897)
	var_9_0:addElement(var_9_20)

	var_9_0.Slider = var_9_20

	local var_9_21
	local var_9_22 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_9_1
	})

	var_9_22.id = "MenuTitle"

	var_9_22.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/HDR_CALIBRATION")), 0)
	var_9_22.Line:SetLeft(0, 0)
	var_9_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -960, _1080p * 60, 0, _1080p * 100)
	var_9_0:addElement(var_9_22)

	var_9_0.MenuTitle = var_9_22

	var_0_1(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("BootHDRWhitePoint", BootHDRWhitePoint)
LockTable(_M)
