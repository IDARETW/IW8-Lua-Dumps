module(..., package.seeall)

function ValueToListIndex(arg_1_0, arg_1_1)
	assert(#arg_1_0 > 0)

	for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
		if arg_1_1 == iter_1_1 then
			return iter_1_0
		end
	end

	DebugPrint("Warning: Options Buttons trying to get a value from list that doesn't exist. ( " .. arg_1_1 .. ") Defaulting to 1")

	return 1
end

local function var_0_0(arg_2_0, arg_2_1)
	Engine.DCCBEAGDJE(arg_2_1)
end

local function var_0_1(arg_3_0, arg_3_1)
	Engine.BIJGBJEBIH(arg_3_1)
end

local function var_0_2(arg_4_0, arg_4_1)
	Engine.CGBEIIAHEH(arg_4_1)
end

local function var_0_3(arg_5_0, arg_5_1)
	Engine.DFGAIDGFJC(arg_5_1)
end

local function var_0_4(arg_6_0, arg_6_1)
	Engine.BBBCGJDGBH(arg_6_1)
end

local function var_0_5(arg_7_0, arg_7_1)
	Engine.CABGDFCIDH(arg_7_1)
end

local function var_0_6(arg_8_0, arg_8_1)
	Engine.DEEDAHEFAJ(arg_8_1, arg_8_0)
end

local function var_0_7(arg_9_0, arg_9_1)
	Engine.CIAGIFEAIC(arg_9_1, arg_9_0)
end

local function var_0_8(arg_10_0)
	return function(arg_11_0, arg_11_1)
		Dvar.IICIFEEDC(arg_10_0, arg_11_0)
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_11_1)
	end
end

local function var_0_9(arg_12_0)
	return function(arg_13_0, arg_13_1)
		Dvar.DFIJDJFIFD(arg_12_0, arg_13_0)
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_13_1)
	end
end

local function var_0_10(arg_14_0, arg_14_1)
	Dvar.IICIFEEDC("LKOLMLQRRT", arg_14_0)
	Engine.DAGFFDGFII("profile_setFilmGrain " .. arg_14_0, arg_14_1)
end

local function var_0_11(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0 - 1

	Engine.DAGFFDGFII("profile_toggleMotionBlur " .. var_15_0, arg_15_1)
end

local function var_0_12(arg_16_0, arg_16_1)
	if arg_16_0 == 2 then
		arg_16_0 = 3
	end

	Engine.DAGFFDGFII("profile_setSunShadowSplitscreen " .. arg_16_0 - 1, arg_16_1)
end

local function var_0_13(arg_17_0, arg_17_1)
	Engine.DAGFFDGFII("profile_toggleHoldSprint")
	Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_17_1)
end

local function var_0_14(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = {
		wrapAround = false,
		action = arg_18_2.action,
		decimalPlacesToRound = arg_18_2.bounds.DecimalsToRound,
		defaultValue = LUI.clamp(arg_18_2.defaultValue, arg_18_2.bounds.Min, arg_18_2.bounds.Max),
		max = arg_18_2.bounds.Max,
		min = arg_18_2.bounds.Min,
		step = arg_18_2.bounds.Step,
		fillElement = arg_18_0.GenericFillBar.Fill
	}

	LUI.AddUIArrowFillBarButtonLogic(arg_18_0, arg_18_1, var_18_0)
end

local function var_0_15(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = CONDITIONS.IsMagmaGameMode()

	if var_19_0 then
		assert(arg_19_0.LootCardDetailWidget)
	end

	assert(arg_19_0.StickLayout)
	assert(arg_19_0.ButtonLayout)
	assert(arg_19_0.LookInversion)
	assert(arg_19_0.FlightInversion)
	assert(arg_19_0.SprintCancelsReload)
	assert(arg_19_0.Vibration)
	assert(arg_19_0.HorizontalSensitivity)
	assert(arg_19_0.VerticalSensitivity)
	assert(arg_19_0.AimAssistType)
	assert(arg_19_0.MountConfig)

	local var_19_1 = arg_19_0:getParent()

	if var_19_1 ~= nil then
		arg_19_0.vList:AddArrow(var_19_1.ArrowUp)
		arg_19_0.vList:AddArrow(var_19_1.ArrowDown)
	end

	assert(arg_19_0.TargetAssist)

	if Engine.CAADCDEEIA() or Engine.EAIICIFIFA() then
		assert(arg_19_0.AimAssist)
	end

	if Engine.EAAHGICFBD() and Engine.BFDACIJIAD(arg_19_1) and not CONDITIONS.IsSplitscreen() then
		assert(arg_19_0.MotionBlur)
	end

	if var_19_0 then
		local var_19_2 = Dvar.CFHDGABACF("MSLNPQSPLM")
		local var_19_3 = {
			wrapAround = false,
			labels = OPTIONS.lootCardDetailLabels,
			action = var_0_9("MSLNPQSPLM"),
			defaultValue = var_19_2
		}

		LUI.AddUIArrowTextButtonLogic(arg_19_0.LootCardDetailWidget, arg_19_1, var_19_3)
	end

	local var_19_4 = Engine.BECCFCBIAA("gpadSticksConfig", arg_19_1)
	local var_19_5 = OPTIONS.stickLayoutStrings[var_19_4]

	arg_19_0.StickLayout.DynamicText:setText(Engine.CBBHFCGDIC(var_19_5))

	local var_19_6 = Engine.BECCFCBIAA(OPTIONS.GetCurrentGpadButtonsConfigName(var_19_0), arg_19_1)
	local var_19_7 = OPTIONS.buttonLayoutStrings[var_19_6] and OPTIONS.buttonLayoutStrings[var_19_6] or "MENU/NOMAD_TACTICAL_ALT"

	arg_19_0.ButtonLayout.DynamicText:setText(Engine.CBBHFCGDIC(var_19_7))

	local var_19_8 = Engine.BECCFCBIAA("mountButtonConfig", arg_19_1)
	local var_19_9 = {
		wrapAround = true,
		labels = {
			"Disabled",
			"Double-Tap ADS",
			"Hold ADS + Melee",
			"Hold ADS + Sprint",
			"Toggle Secondary Offhand",
			"Hold Secondary Offhand",
			"Hold ADS"
		},
		defaultValue = var_19_8,
		action = var_0_7
	}

	LUI.AddUIArrowTextButtonLogic(arg_19_0.MountConfig, arg_19_1, var_19_9)

	local var_19_10 = Engine.BECCFCBIAA("invertPitchGamepad", arg_19_1)
	local var_19_11 = {
		wrapAround = true,
		labels = OPTIONS.disableButtonLabels,
		action = var_0_0,
		defaultValue = var_19_10 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
	}

	LUI.AddUIArrowTextButtonLogic(arg_19_0.LookInversion, arg_19_1, var_19_11)

	local var_19_12 = Engine.BECCFCBIAA("invertPitchFlyingGamepad", arg_19_1)
	local var_19_13 = {
		wrapAround = true,
		labels = OPTIONS.disableButtonLabels,
		action = var_0_1,
		defaultValue = var_19_12 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
	}

	LUI.AddUIArrowTextButtonLogic(arg_19_0.FlightInversion, arg_19_1, var_19_13)

	local var_19_14 = Engine.BECCFCBIAA("sprintCancelsReload", arg_19_1)
	local var_19_15 = {
		wrapAround = true,
		labels = OPTIONS.disableButtonLabels,
		action = var_0_2,
		defaultValue = var_19_14 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
	}

	LUI.AddUIArrowTextButtonLogic(arg_19_0.SprintCancelsReload, arg_19_1, var_19_15)

	local var_19_16 = Engine.BECCFCBIAA("holdSprint", arg_19_1)
	local var_19_17 = {
		wrapAround = true,
		labels = OPTIONS.disableButtonLabels,
		action = var_0_13,
		defaultValue = var_19_16 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
	}

	LUI.AddUIArrowTextButtonLogic(arg_19_0.HoldSprint, arg_19_1, var_19_17)

	local var_19_18 = Engine.BECCFCBIAA("rumble", arg_19_1)
	local var_19_19 = {
		wrapAround = true,
		labels = OPTIONS.disableButtonLabels,
		action = var_0_3,
		defaultValue = var_19_18 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
	}

	LUI.AddUIArrowTextButtonLogic(arg_19_0.Vibration, arg_19_1, var_19_19)
	assert(arg_19_0.Colorblind)
	OPTIONS.CreateColorBlindFilterLogic(arg_19_0.Colorblind, arg_19_1)

	if Engine.CAADCDEEIA() or Engine.EAIICIFIFA() then
		local var_19_20 = Engine.BECCFCBIAA("autoAim", arg_19_1)
		local var_19_21 = {
			wrapAround = true,
			labels = OPTIONS.disableButtonLabels,
			action = var_0_4,
			defaultValue = var_19_20 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
		}

		LUI.AddUIArrowTextButtonLogic(arg_19_0.AimAssist, arg_19_1, var_19_21)
	end

	local var_19_22 = Engine.BECCFCBIAA("targetAssist", arg_19_1)
	local var_19_23 = {
		wrapAround = true,
		labels = OPTIONS.disableButtonLabels,
		action = var_0_5,
		defaultValue = var_19_22 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
	}

	LUI.AddUIArrowTextButtonLogic(arg_19_0.TargetAssist, arg_19_1, var_19_23)

	local var_19_24 = Dvar.BJJCJHDBII("NQQNNPQPKR")
	local var_19_25 = {
		wrapAround = false,
		labels = OPTIONS.GetSensitivityLabels(),
		action = var_0_8("NQQNNPQPKR"),
		defaultValue = var_19_24
	}

	LUI.AddUIArrowTextButtonLogic(arg_19_0.HorizontalSensitivity, arg_19_1, var_19_25)

	local var_19_26 = Dvar.BJJCJHDBII("MRKPMKMRQL")
	local var_19_27 = {
		wrapAround = false,
		labels = OPTIONS.GetSensitivityLabels(),
		action = var_0_8("MRKPMKMRQL"),
		defaultValue = var_19_26
	}

	LUI.AddUIArrowTextButtonLogic(arg_19_0.VerticalSensitivity, arg_19_1, var_19_27)

	if Engine.BFDACIJIAD(arg_19_1) then
		assert(arg_19_0.FilmGrainAtten)
		assert(arg_19_0.FilmGrainAtten.GenericFillBar)
		assert(arg_19_0.FilmGrainAtten.GenericFillBar.Fill)

		local var_19_28 = Dvar.BJJCJHDBII("LKOLMLQRRT")
		local var_19_29 = {
			wrapAround = false,
			decimalPlacesToRound = 3,
			action = var_0_10,
			defaultValue = var_19_28,
			max = SliderBounds.FilmGrainAttenSlider.Max,
			min = SliderBounds.FilmGrainAttenSlider.Min,
			step = SliderBounds.FilmGrainAttenSlider.Step,
			fillElement = arg_19_0.FilmGrainAtten.GenericFillBar.Fill
		}

		LUI.AddUIArrowFillBarButtonLogic(arg_19_0.FilmGrainAtten, arg_19_1, var_19_29)
	end

	if Engine.EAAHGICFBD() and Engine.BFDACIJIAD(arg_19_1) and not CONDITIONS.IsSplitscreen() then
		local var_19_30 = Dvar.IBEGCHEFE("MKNMSLSLRL")
		local var_19_31 = {
			wrapAround = true,
			labels = OPTIONS.disableButtonLabels,
			action = var_0_11,
			defaultValue = var_19_30 and OPTIONS.disableButtonOptions.ENABLED or OPTIONS.disableButtonOptions.DISABLED
		}

		LUI.AddUIArrowTextButtonLogic(arg_19_0.MotionBlur, arg_19_1, var_19_31)
	end

	local var_19_32 = Engine.BECCFCBIAA("aimAssistType", arg_19_1)
	local var_19_33 = {
		wrapAround = true,
		labels = {
			"Standard",
			"Experimental",
			"Enhanced"
		},
		action = var_0_6,
		defaultValue = var_19_32
	}

	LUI.AddUIArrowTextButtonLogic(arg_19_0.AimAssistType, arg_19_1, var_19_33)

	if Engine.EABCCIBFIG() then
		assert(arg_19_0.InputMethod)

		local var_19_34 = Engine.BECCFCBIAA("gpadEnabled", arg_19_1)
		local var_19_35 = {
			wrapAround = true,
			labels = {
				Engine.CBBHFCGDIC("LUA_MENU/KEYBOARD_AND_MOUSE"),
				Engine.CBBHFCGDIC("PLATFORM_UI/GAMEPAD")
			},
			action = function(arg_20_0, arg_20_1)
				Engine.CIGGHDDHGJ(arg_20_1, arg_20_0 == 2)
				Engine.DAGFFDGFII("updategamerprofile")
			end,
			defaultValue = var_19_34 and 2 or 1
		}

		LUI.AddUIArrowTextButtonLogic(arg_19_0.InputMethod, arg_19_1, var_19_35)
	end

	if Engine.EAAHGICFBD() and Engine.BFDACIJIAD(arg_19_1) and CONDITIONS.IsSplitscreen() then
		assert(arg_19_0.SplitscreenShadows)

		local var_19_36 = Dvar.DHEEJCCJBH("OLSOQRKNLO")
		local var_19_37 = Dvar.DCEBHAJGCJ("OLSOQRKNLO")
		local var_19_38 = ValueToListIndex(var_19_37, var_19_36)
		local var_19_39 = math.min(var_19_38, 2)
		local var_19_40 = {
			wrapAround = true,
			labels = {
				Engine.CBBHFCGDIC("LUA_MENU/DISABLED"),
				Engine.CBBHFCGDIC("LUA_MENU_MP/SHADOW_ALL_OBJECTS")
			},
			action = var_0_12,
			defaultValue = var_19_39
		}

		LUI.AddUIArrowTextButtonLogic(arg_19_0.SplitscreenShadows, arg_19_1, var_19_40)
	end
end

function OptionsButtons(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIElement.new()

	var_21_0.id = "OptionsButtons"

	local var_21_1 = LUI.UIElement.new()

	var_21_1.id = "OptionsButtonsStencil"

	var_21_1:setUseStencil(true)
	var_21_1:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 140, 0, 0)

	var_21_0.listStencil = var_21_1

	var_21_0:addElement(var_21_1)

	var_21_0.vList = LUI.UIGrid.new({
		maxVisibleColumns = 1,
		wrapY = true,
		maxRows = 25,
		maxVisibleRows = CONDITIONS.IsSplitscreen() and 6 or 14,
		spacingY = 8 * _1080p
	})

	var_21_0.vList:SetAnchorsAndPosition(0, 0, 0, 1, 0, -140 * _1080p, 0, 490 * _1080p)

	var_21_0.vList.id = "OptionsButtonsList"

	var_21_1:addElement(var_21_0.vList)

	local var_21_2 = arg_21_1 or {}
	local var_21_3 = var_21_2.controllerIndex
	local var_21_4 = _1080p * 40

	if CONDITIONS.IsBRGameType(var_21_0) then
		local var_21_5 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
			controllerIndex = var_21_3
		})

		var_21_5.id = "LootCardDetailWidget"

		var_21_5:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

		var_21_5.buttonDescription = Engine.CBBHFCGDIC("MENU/OPTIONS_LOOT_CARD_DETAILS_DESC")

		var_21_5.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/OPTIONS_LOOT_CARD_DETAILS")), 0)
		var_21_0.vList:AddElement(var_21_5)

		var_21_0.LootCardDetailWidget = var_21_5
	end

	local var_21_6 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = var_21_3
	})

	var_21_6.id = "StickLayout"

	var_21_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_6.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_STICK_LAYOUT_DESC")

	var_21_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/STICK_LAYOUT_CAP")), 0)
	var_21_6:addEventHandler("button_action", function(arg_22_0, arg_22_1)
		ACTIONS.OpenMenu("StickLayout", true, var_21_3)
	end)
	var_21_0.vList:AddElement(var_21_6)

	var_21_0.StickLayout = var_21_6

	local var_21_7 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = var_21_3
	})

	var_21_7.id = "ButtonLayout"

	var_21_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_7.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_BUTTON_LAYOUT_DESC")

	var_21_7.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BUTTON_LAYOUT_CAPS")), 0)
	var_21_0.vList:AddElement(var_21_7)
	var_21_7:addEventHandler("button_action", function(arg_23_0, arg_23_1)
		ACTIONS.OpenMenu("ButtonLayout", true, var_21_3)
	end)

	var_21_0.ButtonLayout = var_21_7

	local var_21_8 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_21_3
	})

	var_21_8.id = "MountConfig"

	var_21_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_8.buttonDescription = "Button configuration for contextual weapon mount."

	var_21_8.Title:setText(ToUpperCase("Mount Activation"), 0)
	var_21_0.vList:AddElement(var_21_8)

	var_21_0.MountConfig = var_21_8

	local var_21_9 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_21_3
	})

	var_21_9.id = "LookInversion"

	var_21_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_9.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_LOOK_INVERSION_DESC")

	var_21_9.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/LOOK_INVERSION_CAPS")), 0)
	var_21_0.vList:AddElement(var_21_9)

	var_21_0.LookInversion = var_21_9

	local var_21_10 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_21_3
	})

	var_21_10.id = "FlightInversion"

	var_21_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_10.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_FLY_INVERSION_DESC")

	var_21_10.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/FLY_INVERSION_CAPS")), 0)

	if not Engine.EAIICIFIFA() then
		var_21_0.vList:AddElement(var_21_10)
	end

	var_21_0.FlightInversion = var_21_10

	local var_21_11 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_21_3
	})

	var_21_11.id = "SprintCancelsReload"

	var_21_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_11.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_SPRINT_CANCELS_RELOAD_DESC")

	var_21_11.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/SPRINT_CANCELS_RELOAD_CAPS")), 0)
	var_21_0.vList:AddElement(var_21_11)

	var_21_0.SprintCancelsReload = var_21_11

	local var_21_12 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_21_3
	})

	var_21_12.id = "HoldSprint"

	var_21_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_12.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_HOLD_SPRINT_DESC")

	var_21_12.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/HOLD_SPRINT_CAPS")), 0)
	var_21_0.vList:AddElement(var_21_12)

	var_21_0.HoldSprint = var_21_12

	local var_21_13 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_21_3
	})

	var_21_13.id = "Vibration"

	var_21_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_13.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_VIBRATION_DESC")

	var_21_13.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("PLATFORM/CONTROLLER_VIBRATION_CAPS")), 0)
	var_21_0.vList:AddElement(var_21_13)

	var_21_0.Vibration = var_21_13

	local var_21_14 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_21_3
	})

	var_21_14.id = "HorizontalSensitivity"

	var_21_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_14.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_HORZ_SENSITIVITY_DESC")

	var_21_14.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("PLATFORM/LOOK_HORZ_SENSITIVITY")), 0)
	var_21_0.vList:AddElement(var_21_14)

	var_21_0.HorizontalSensitivity = var_21_14

	local var_21_15 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_21_3
	})

	var_21_15.id = "VerticalSensitivity"

	var_21_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_15.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_VERT_SENSITIVITY_DESC")

	var_21_15.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("PLATFORM/LOOK_VERT_SENSITIVITY")), 0)
	var_21_0.vList:AddElement(var_21_15)

	var_21_0.VerticalSensitivity = var_21_15

	if (Engine.DDJFBBJAIG() or not CONDITIONS.IsSplitscreen()) and Engine.BFDACIJIAD(var_21_3) then
		local var_21_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_21_3
		})

		var_21_16.id = "SafeArea"

		var_21_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

		var_21_16.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/SAFE_AREA_DESC")

		var_21_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SAFE_AREA_CAPS")), 0)
		var_21_0.vList:AddElement(var_21_16)
		var_21_16:addEventHandler("button_action", function(arg_24_0, arg_24_1)
			LUI.FlowManager.RequestAddMenu("ScreenMargins", true, var_21_3, false)
		end)

		var_21_0.SafeArea = var_21_16
	end

	if Engine.BFDACIJIAD(var_21_3) or Engine.CIEGIACHAE() then
		local var_21_17 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_21_3
		})

		var_21_17.id = "AudioOptions"

		var_21_17:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

		var_21_17.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/AUDIO_OPTIONS_DESC")

		var_21_17.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/AUDIO_OPTIONS_CAPS")), 0)
		var_21_0.vList:AddElement(var_21_17)
		var_21_17:addEventHandler("button_action", function(arg_25_0, arg_25_1)
			LUI.FlowManager.RequestAddMenu("AudioOptions", true, var_21_3, false)
		end)

		var_21_0.AudioOptions = var_21_17
	end

	if Engine.EAAHGICFBD() and Engine.BFDACIJIAD(var_21_3) and not CONDITIONS.IsSplitscreen() then
		local var_21_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_21_3
		})

		var_21_18.id = "NetworkDiagnosticOptions"

		var_21_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

		var_21_18.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/NETWORK_DIAGNOSTIC_OPTIONS_DESC")

		var_21_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NETWORK_DIAGNOSTIC_OPTIONS_CAPS")), 0)
		var_21_0.vList:AddElement(var_21_18)
		var_21_18:addEventHandler("button_action", function(arg_26_0, arg_26_1)
			LUI.FlowManager.RequestAddMenu("NetworkDiagnosticOptions", true, var_21_3, false)
		end)

		var_21_0.NetworkDiagnosticOptions = var_21_18
	end

	if Engine.DDJFBBJAIG() and Engine.BFDACIJIAD(var_21_3) or Engine.BFDACIJIAD(var_21_3) then
		if Engine.DJDAJEJDE() then
			var_21_0.HDRBrightness = MenuBuilder.BuildRegisteredType("GenericFillBarArrowButton", {
				controllerIndex = var_21_3
			})
			var_21_0.HDRBrightness.id = "HDRBrightness"

			var_21_0.HDRBrightness:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

			var_21_0.HDRBrightness.buttonDescription = Engine.CBBHFCGDIC("MENU/HDR_BRIGHTNESS_BTN_DESC")

			var_21_0.HDRBrightness.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/HDR_BRIGHTNESS_BTN")))
			var_21_0.vList:AddElement(var_21_0.HDRBrightness)

			var_21_2 = {
				controllerIndex = var_21_3,
				defaultValue = Mirror(Dvar.BJJCJHDBII("PPNORSOSS"), SliderBounds.HDRGamma.Min, SliderBounds.HDRGamma.Max),
				bounds = SliderBounds.HDRGamma,
				action = function(arg_27_0, arg_27_1)
					arg_27_0 = Mirror(arg_27_0, SliderBounds.HDRGamma.Min, SliderBounds.HDRGamma.Max)

					Dvar.IICIFEEDC("PPNORSOSS", arg_27_0)
					Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_27_1)
					var_21_0:dispatchEventToCurrentMenu({
						name = "brightness_updated"
					})
				end
			}

			var_0_14(var_21_0.HDRBrightness, var_21_3, var_21_2)

			if not Engine.EBFEGIICEF() then
				var_21_0.HDRBlackPoint = MenuBuilder.BuildRegisteredType("GenericFillBarArrowButton", {
					controllerIndex = var_21_3
				})
				var_21_0.HDRBlackPoint.id = "HDRBlackPoint"

				var_21_0.HDRBlackPoint:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

				var_21_0.HDRBlackPoint.buttonDescription = Engine.CBBHFCGDIC("MENU/HDR_BLACK_POINT_BTN_DESC")

				var_21_0.HDRBlackPoint.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/HDR_BLACK_POINT_BTN")))
				var_21_0.vList:AddElement(var_21_0.HDRBlackPoint)

				var_21_2 = {
					controllerIndex = var_21_3,
					defaultValue = Dvar.BJJCJHDBII("LLTNTOTMMT"),
					bounds = SliderBounds.HDRMinLum,
					action = function(arg_28_0, arg_28_1)
						Dvar.IICIFEEDC("LLTNTOTMMT", arg_28_0)
						Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_28_1)
						var_21_0:dispatchEventToCurrentMenu({
							name = "black_point_updated"
						})
					end
				}

				var_0_14(var_21_0.HDRBlackPoint, var_21_3, var_21_2)

				var_21_0.HDRWhitePoint = MenuBuilder.BuildRegisteredType("GenericFillBarArrowButton", {
					controllerIndex = var_21_3
				})
				var_21_0.HDRWhitePoint.id = "HDRWhitePoint"

				var_21_0.HDRWhitePoint:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

				var_21_0.HDRWhitePoint.buttonDescription = Engine.CBBHFCGDIC("MENU/HDR_WHITE_POINT_BTN_DESC")

				var_21_0.HDRWhitePoint.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/HDR_WHITE_POINT_BTN")))
				var_21_0.vList:AddElement(var_21_0.HDRWhitePoint)

				var_21_2 = {
					controllerIndex = var_21_3,
					defaultValue = Dvar.BJJCJHDBII("NKQOMLOSN"),
					bounds = SliderBounds.HDRMaxLum,
					action = function(arg_29_0, arg_29_1)
						Dvar.IICIFEEDC("NKQOMLOSN", arg_29_0)
						Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_29_1)
						var_21_0:dispatchEventToCurrentMenu({
							name = "white_point_updated"
						})
					end
				}

				var_0_14(var_21_0.HDRWhitePoint, var_21_3, var_21_2)
			end
		else
			var_21_0.Brightness = MenuBuilder.BuildRegisteredType("GenericFillBarArrowButton", {
				controllerIndex = var_21_3
			})
			var_21_0.Brightness.id = "Brightness"

			var_21_0.Brightness:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

			var_21_0.Brightness.buttonDescription = Engine.CBBHFCGDIC("MENU/BRIGHTNESS_DESC1")

			var_21_0.Brightness.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BRIGHTNESS")))
			var_21_0.vList:AddElement(var_21_0.Brightness)

			var_21_2 = {
				controllerIndex = var_21_3,
				defaultValue = Dvar.BJJCJHDBII("NMRKMSMTOO"),
				bounds = SliderBounds.Brightness,
				action = OPTIONS.GetBrightnessToggle(var_21_0)
			}

			var_0_14(var_21_0.Brightness, var_21_3, var_21_2)
		end
	end

	if Engine.BFDACIJIAD(var_21_3) then
		local var_21_19 = MenuBuilder.BuildRegisteredType("GenericFillBarArrowButton", {
			controllerIndex = var_21_3
		})

		var_21_19.id = "FilmGrainAtten"

		var_21_19:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

		var_21_19.buttonDescription = Engine.CBBHFCGDIC("MENU/FILM_GRAIN_ATTEN_DESC")

		var_21_19.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/FILM_GRAIN_ATTEN")), 0)
		var_21_0.vList:AddElement(var_21_19)

		var_21_0.FilmGrainAtten = var_21_19
	end

	local var_21_20 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_21_3
	})

	var_21_20.id = "Colorblind"

	var_21_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_20.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/COLOR_BLIND_DESC")

	var_21_20.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COLORBLIND_FILTER_CAPS")), 0)
	var_21_0.vList:AddElement(var_21_20)

	var_21_0.Colorblind = var_21_20

	if Engine.CAADCDEEIA() or Engine.EAIICIFIFA() then
		local var_21_21
		local var_21_22 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
			controllerIndex = var_21_3
		})

		var_21_22.id = "AimAssist"

		var_21_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

		var_21_22.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_AIM_ASSIST_DESC")

		var_21_22.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/AIM_ASSIST_CAPS")), 0)
		var_21_0.vList:AddElement(var_21_22)

		var_21_0.AimAssist = var_21_22
	end

	local var_21_23
	local var_21_24 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_21_3
	})

	var_21_24.id = "TargetAssist"

	var_21_24:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_24.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_TARGET_ASSIST_DESC")

	var_21_24.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/TARGET_ASSIST_CAPS")), 0)
	var_21_0.vList:AddElement(var_21_24)

	var_21_0.TargetAssist = var_21_24

	local var_21_25 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_21_3
	})

	var_21_25.id = "AimAssistType"

	var_21_25:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_25.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/OPTIONS_AIM_ASSIST_DESC")

	var_21_25.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/AIM_ASSIST_CAPS")), 0)
	var_21_0.vList:AddElement(var_21_25)

	var_21_0.AimAssistType = var_21_25

	if Engine.EAAHGICFBD() and Engine.BFDACIJIAD(var_21_3) and not CONDITIONS.IsSplitscreen() then
		local var_21_26 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
			controllerIndex = var_21_3
		})

		var_21_26.id = "MotionBlur"

		var_21_26:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

		var_21_26.buttonDescription = Engine.CBBHFCGDIC("MENU/MOTION_BLUR_DESC")

		var_21_26.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/MOTION_BLUR_CAPS")), 0)
		var_21_0.vList:AddElement(var_21_26)

		var_21_0.MotionBlur = var_21_26
	end

	if Engine.EAAHGICFBD() and Engine.BFDACIJIAD(var_21_3) and CONDITIONS.IsSplitscreen() then
		local var_21_27 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
			controllerIndex = var_21_3
		})

		var_21_27.id = "SplitscreenShadows"

		var_21_27:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

		var_21_27.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU_MP/SHADOW_DESC")

		var_21_27.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/SHADOWS")), 0)
		var_21_0.vList:AddElement(var_21_27)

		var_21_0.SplitscreenShadows = var_21_27
	end

	if Engine.BHICADFIHA() and not Engine.DDJFBBJAIG() and Engine.EAAHGICFBD() then
		var_21_0.vList:AddElement(OPTIONS.GetGunsmithDebugButton(var_21_4, var_21_3))
	end

	if Engine.EABCCIBFIG() then
		local var_21_28
		local var_21_29 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
			controllerIndex = var_21_3
		})

		var_21_29.id = "InputMethod"

		var_21_29:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

		var_21_29.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/INPUT_METHOD_DESC")

		var_21_29.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INPUT_METHOD")), 0)
		var_21_0.vList:AddElement(var_21_29)

		var_21_0.InputMethod = var_21_29
	end

	local var_21_30 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_21_3
	})

	var_21_30.id = "SpamRemoval"

	var_21_30:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, var_21_4, 0)

	var_21_30.buttonDescription = "SpamRemoval"

	var_21_30:addEventHandler("button_action", function(arg_30_0, arg_30_1)
		CoD.SpamRemovalAction()
	end)
	var_21_30.Text:setText("Spam Removal")
	var_21_0.vList:AddElement(var_21_30)
	var_0_15(var_21_0, var_21_3, var_21_2)

	return var_21_0
end

MenuBuilder.registerType("OptionsButtons", OptionsButtons)
LockTable(_M)
