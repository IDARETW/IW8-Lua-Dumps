module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Dvar.BJJCJHDBII("NMRKMSMTOO")
	local var_1_1 = LUI.clamp(var_1_0, SliderBounds.Brightness.DvarMin, SliderBounds.Brightness.DvarMax) + arg_1_0.colorModifier
	local var_1_2 = LUI.clamp(var_1_1, 0, 1)

	arg_1_0.Background:SetRGBFromTable({
		r = var_1_2,
		g = var_1_2,
		b = var_1_2
	})
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 and not arg_2_0.CalibrationGuide then
		local var_2_0
		local var_2_1 = MenuBuilder.BuildRegisteredType("CalibrationGuide", {
			controllerIndex = arg_2_1
		})

		var_2_1.id = "CalibrationGuide"

		var_2_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 789, _1080p * 1446, _1080p * 300, _1080p * 882)
		arg_2_0:addElement(var_2_1)

		arg_2_0.CalibrationGuide = var_2_1

		arg_2_0.CalibrationGuide:SetSwatchUpdateHandler(var_0_0)

		local var_2_2 = 0.04

		arg_2_0.CalibrationGuide.BarelyVisibleSwatch.colorModifier = arg_2_0.CalibrationGuide.BarelyVisibleSwatch.colorModifier + var_2_2

		arg_2_0.CalibrationGuide:processEvent({
			name = "calibration_updated"
		})
	elseif not arg_2_2 and arg_2_0.CalibrationGuide then
		arg_2_0.CalibrationGuide:closeTree()

		arg_2_0.CalibrationGuide = nil
	end
end

local function var_0_2(arg_3_0)
	return arg_3_0.ButtonList._activeElement
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = Engine.BECCFCBIAA("gpadButtonsConfig", arg_4_1)
	local var_4_1, var_4_2 = string.gsub(var_4_0, "_alt", "")
	local var_4_3 = var_0_2(arg_4_0)

	if var_4_3 then
		if arg_4_2 or var_4_2 > 0 then
			Engine.CBCIHEGADA(var_4_1, arg_4_1)

			if var_4_3 and var_4_3.Dropdown then
				var_4_3.Dropdown:UpdateCurrentTextDropdown(OPTIONS.GetButtonLayoutLabels())
			end
		else
			Engine.CBCIHEGADA(var_4_0 .. "_alt", arg_4_1)

			if var_4_3 and var_4_3.Dropdown then
				var_4_3.Dropdown:UpdateCurrentTextDropdown(OPTIONS.GetButtonLayoutAltLabels())
			end
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.MenuBackgroundImage)

	arg_5_0.chatOptOut = true
	arg_5_0.canFlip = false
	arg_5_0.isQuickAccessShortcutsDisabled = true

	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/QUICK_SETUP"))
	BOOT.BuildButtonLabelHandlers(arg_5_0, arg_5_1, arg_5_0.ButtonTitle, arg_5_0.Description.Text)
	arg_5_0.SwapTriggersPrompt.SwapTriggers:SetAlignment(LUI.Alignment.Left)
	arg_5_0.SwapTriggersPrompt.Line:SetAlignment(LUI.Alignment.Left)
	arg_5_0.SwapTriggersPrompt.Background:SetAlpha(0)
	arg_5_0:registerEventHandler("colorblind_over", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_5_0, "ShowImagePreview")
	end)
	arg_5_0:registerEventHandler("colorblind_up", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_5_0, "HideImagePreview")
	end)
	arg_5_0.ButtonList:registerEventHandler("stickLayout_over", function()
		arg_5_0.StickLayout:processEvent({
			name = "stickLayout_over"
		})
	end)
	arg_5_0.ButtonList:registerEventHandler("stickLayout_up", function()
		arg_5_0.StickLayout:processEvent({
			name = "stickLayout_up"
		})
	end)
	arg_5_0.ButtonList:registerEventHandler("buttonLayout_over", function()
		arg_5_0.ButtonLayout:processEvent({
			name = "buttonLayout_over"
		})
		arg_5_0.SwapTriggersPrompt:processEvent({
			name = "buttonLayout_over"
		})
		arg_5_0.SwapTriggersPrompt:SetAlpha(1)

		arg_5_0.canFlip = true
	end)
	arg_5_0.ButtonList:registerEventHandler("buttonLayout_up", function()
		arg_5_0.ButtonLayout:processEvent({
			name = "buttonLayout_up"
		})
		arg_5_0.SwapTriggersPrompt:processEvent({
			name = "buttonLayout_up"
		})
		arg_5_0.SwapTriggersPrompt:SetAlpha(0)

		arg_5_0.canFlip = false
	end)
	arg_5_0:registerEventHandler("brightness_over", function(arg_12_0, arg_12_1)
		var_0_1(arg_5_0, arg_5_1, true)
	end)
	arg_5_0:registerEventHandler("brightness_up", function(arg_13_0, arg_13_1)
		var_0_1(arg_5_0, arg_5_1, false)
	end)
	arg_5_0:registerEventHandler("brightness_updated", function(arg_14_0, arg_14_1)
		if arg_5_0.CalibrationGuide then
			arg_5_0.CalibrationGuide:processEvent({
				name = "calibration_updated"
			})
		end
	end)
	arg_5_0.MenuBackgroundImage:SetVideoSizeUpdateHandler()
	arg_5_0:registerEventHandler("redirect_button_event_to_target", function(arg_15_0, arg_15_1)
		LUI.FlowManager.GetScopedData(arg_15_0)._redirectBindButtonEventTarget = arg_15_1.target
	end)
	arg_5_0.bindButton:addEventHandler("button_secondary", function(arg_16_0, arg_16_1)
		local var_16_0 = LUI.FlowManager.GetScopedData(arg_16_0)

		if var_16_0._redirectBindButtonEventTarget and var_16_0._redirectBindButtonEventTarget:processEvent(arg_16_1) then
			return true
		end
	end)
	arg_5_0:addEventHandler("buttonLayout_triggerUpdate", function(arg_17_0, arg_17_1)
		var_0_3(arg_17_0, arg_17_1.controller, arg_17_1.resetFlip)
	end)
	arg_5_0.bindButton:registerEventHandler("button_alt1", function(arg_18_0, arg_18_1)
		local var_18_0 = arg_18_0:GetCurrentMenu()

		if var_18_0.ButtonLayout and var_18_0.canFlip then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
			var_18_0.ButtonLayout:dispatchEventToCurrentMenu({
				name = "buttonLayout_triggerUpdate",
				controller = arg_18_1.controller
			})
		end
	end)

	local function var_5_0(arg_19_0, arg_19_1)
		arg_19_0._previewOption = arg_19_1.previewOption
	end

	arg_5_0:addEventHandler("update_button_selected", var_5_0)
end

function BootOptions(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIVerticalNavigator.new()

	var_20_0.id = "BootOptions"
	var_20_0._animationSets = var_20_0._animationSets or {}
	var_20_0._sequences = var_20_0._sequences or {}

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)

	var_20_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_20_1
	})
	var_20_0.HelperBar.id = "HelperBar"

	var_20_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_20_0.HelperBar:setPriority(10)
	var_20_0:addElement(var_20_0.HelperBar)

	local var_20_2 = var_20_0
	local var_20_3
	local var_20_4 = MenuBuilder.BuildRegisteredType("MenuBackgroundImage", {
		controllerIndex = var_20_1
	})

	var_20_4.id = "MenuBackgroundImage"

	var_20_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_20_0:addElement(var_20_4)

	var_20_0.MenuBackgroundImage = var_20_4

	local var_20_5
	local var_20_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_20_1
	})

	var_20_6.id = "MenuTitle"

	var_20_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/QUICK_SETUP"), 0)
	var_20_6.Line:SetLeft(0, 0)
	var_20_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_20_0:addElement(var_20_6)

	var_20_0.MenuTitle = var_20_6

	local var_20_7
	local var_20_8 = LUI.UIText.new()

	var_20_8.id = "ButtonTitle"

	var_20_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_20_8:setText("", 0)
	var_20_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_20_8:SetAlignment(LUI.Alignment.Left)
	var_20_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 811, _1080p * 1603, _1080p * 190, _1080p * 240)
	var_20_0:addElement(var_20_8)

	var_20_0.ButtonTitle = var_20_8

	local var_20_9
	local var_20_10 = MenuBuilder.BuildRegisteredType("QuickSetupVerticalList", {
		controllerIndex = var_20_1
	})

	var_20_10.id = "ButtonList"

	var_20_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 751, _1080p * 202, _1080p * 1044)
	var_20_0:addElement(var_20_10)

	var_20_0.ButtonList = var_20_10

	local var_20_11
	local var_20_12 = LUI.UIImage.new()

	var_20_12.id = "PopupBackground"

	var_20_12:SetRGBFromInt(0, 0)
	var_20_12:SetAlpha(0, 0)
	var_20_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_20_0:addElement(var_20_12)

	var_20_0.PopupBackground = var_20_12

	local var_20_13
	local var_20_14 = MenuBuilder.BuildRegisteredType("ButtonLayoutBootOptions", {
		controllerIndex = var_20_1
	})

	var_20_14.id = "ButtonLayout"

	var_20_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1021, _1080p * 1533, _1080p * 399, _1080p * 911)
	var_20_0:addElement(var_20_14)

	var_20_0.ButtonLayout = var_20_14

	local var_20_15
	local var_20_16 = MenuBuilder.BuildRegisteredType("StickLayoutBootOptions", {
		controllerIndex = var_20_1
	})

	var_20_16.id = "StickLayout"

	var_20_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1022, _1080p * 1534, _1080p * 349, _1080p * 861)
	var_20_0:addElement(var_20_16)

	var_20_0.StickLayout = var_20_16

	local var_20_17
	local var_20_18 = MenuBuilder.BuildRegisteredType("SwapTriggersPrompt", {
		controllerIndex = var_20_1
	})

	var_20_18.id = "SwapTriggersPrompt"

	var_20_18:SetAlpha(0, 0)
	var_20_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 792, _1080p * 1718, _1080p * 357, _1080p * 391)
	var_20_0:addElement(var_20_18)

	var_20_0.SwapTriggersPrompt = var_20_18

	local var_20_19
	local var_20_20 = LUI.UIImage.new()

	var_20_20.id = "ColorblindDescriptionImage"

	var_20_20:SetAlpha(0, 0)
	var_20_20:setImage(RegisterMaterial("image_options_colorblindtype"), 0)
	var_20_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 811, _1080p * 1603, _1080p * 277, _1080p * 725)
	var_20_0:addElement(var_20_20)

	var_20_0.ColorblindDescriptionImage = var_20_20

	local var_20_21
	local var_20_22 = MenuBuilder.BuildRegisteredType("OptionDescription", {
		controllerIndex = var_20_1
	})

	var_20_22.id = "Description"

	var_20_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 811, _1080p * 1744, _1080p * 268, _1080p * 292)
	var_20_0:addElement(var_20_22)

	var_20_0.Description = var_20_22

	local var_20_23
	local var_20_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 236
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 748
		}
	}

	var_20_16:RegisterAnimationSequence("DefaultSequence", var_20_24)

	local function var_20_25()
		var_20_16:AnimateSequence("DefaultSequence")
	end

	var_20_0._sequences.DefaultSequence = var_20_25

	local var_20_26
	local var_20_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 450
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 726,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_20_20:RegisterAnimationSequence("ShowImagePreview", var_20_27)

	local var_20_28 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 739,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 763,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_20_22:RegisterAnimationSequence("ShowImagePreview", var_20_28)

	local function var_20_29()
		var_20_20:AnimateSequence("ShowImagePreview")
		var_20_22:AnimateSequence("ShowImagePreview")
	end

	var_20_0._sequences.ShowImagePreview = var_20_29

	local var_20_30
	local var_20_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 450,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_20_20:RegisterAnimationSequence("HideImagePreview", var_20_31)

	local var_20_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 268
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 292
		}
	}

	var_20_22:RegisterAnimationSequence("HideImagePreview", var_20_32)

	local function var_20_33()
		var_20_20:AnimateSequence("HideImagePreview")
		var_20_22:AnimateSequence("HideImagePreview")
	end

	var_20_0._sequences.HideImagePreview = var_20_33

	var_20_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_20_34 = LUI.UIBindButton.new()

	var_20_34.id = "selfBindButton"

	var_20_0:addElement(var_20_34)

	var_20_0.bindButton = var_20_34

	var_0_4(var_20_0, var_20_1, arg_20_1)
	ACTIONS.AnimateSequence(var_20_0, "DefaultSequence")

	return var_20_0
end

MenuBuilder.registerType("BootOptions", BootOptions)
LockTable(_M)
