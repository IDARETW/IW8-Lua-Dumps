module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.TitleDesc then
		arg_1_0.TitleDesc:setHeight(0)
	end

	if arg_1_0.Spacer then
		arg_1_0.Spacer:setHeight(arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = {
		[LUI.GAME_SOURCE_ID.WARZONE] = "SEASONAL_EVENT/DROP_INTO_CALDERA_DESC",
		[LUI.GAME_SOURCE_ID.VANGUARD] = "SEASONAL_EVENT/LAUNCH_VANGUARD_MP_DESC",
		[LUI.GAME_SOURCE_ID.COLD_WAR] = "SEASONAL_EVENT/LAUNCH_BLACK_OPS_MP_DESC"
	}
	local var_2_1 = arg_2_0._eventData
	local var_2_2 = var_2_0[arg_2_1]

	if var_2_1.titleDescription then
		var_2_2 = var_2_1.titleDescription
	elseif arg_2_1 == LUI.GAME_SOURCE_ID.COLD_WAR and arg_2_0._isCWFreeTrialActive then
		var_2_2 = "SEASONAL_EVENT/BLACK_OPS_FREE_TRIAL_DESC"
	end

	if var_2_1 and var_2_1.eventTitleData and var_2_1.eventTitleData.useCompactTitleLayout then
		local var_2_3 = var_2_1.eventTitleData.compactSpacerHeight and var_2_1.eventTitleData.compactSpacerHeight or 0

		var_0_0(arg_2_0, var_2_3)
	end

	arg_2_0.TitleDesc:setText(Engine.CBBHFCGDIC(var_2_2))
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = {
		[LUI.GAME_SOURCE_ID.WARZONE] = {
			controller_text = "SEASONAL_EVENT/DROP_INTO_CALDERA_PROMPT",
			kbm_text = "SEASONAL_EVENT/DROP_INTO_CALDERA"
		},
		[LUI.GAME_SOURCE_ID.VANGUARD] = {
			controller_text = "SEASONAL_EVENT/CROSS_LAUNCH_PROMPT_VANGUARD_MP",
			kbm_text = "SEASONAL_EVENT/CROSS_LAUNCH_VANGUARD_MP"
		},
		[LUI.GAME_SOURCE_ID.COLD_WAR] = {
			controller_text = "SEASONAL_EVENT/CROSS_LAUNCH_PROMPT_BLACK_OPS_MP",
			kbm_text = "SEASONAL_EVENT/CROSS_LAUNCH_BLACK_OPS_MP"
		}
	}
	local var_3_1 = arg_3_0._eventData
	local var_3_2 = false
	local var_3_3 = var_3_0[arg_3_1]

	if var_3_1 and var_3_1.eventTitleData and var_3_1.eventTitleData.crosslaunchPrompts then
		var_3_3 = var_3_1.eventTitleData.crosslaunchPrompts[arg_3_1]
	elseif arg_3_1 == LUI.GAME_SOURCE_ID.COLD_WAR and arg_3_0._isCWFreeTrialActive then
		var_3_3 = {
			controller_text = "SEASONAL_EVENT/BLACK_OPS_FREE_TRIAL_PROMPT",
			kbm_text = "SEASONAL_EVENT/BLACK_OPS_FREE_TRIAL"
		}

		LAYOUT.SizeTextBackingSizeToText(arg_3_0.SeasonalEventCrossLaunchPrompts, {
			padding = 10,
			textfield = arg_3_0.SeasonalEventCrossLaunchPrompts.PromptLabel,
			textfieldBackingImage = arg_3_0.SeasonalEventCrossLaunchPrompts.Backing
		})

		var_3_2 = not LUI.IsLastInputKeyboardMouse(arg_3_0._controllerIndex)
	end

	arg_3_0.SeasonalEventCrossLaunchPrompts.shouldShowBacking = var_3_2

	return var_3_3
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.GetCrossLaunchPromptData = var_0_2
	arg_4_0.UpdateTitleDescription = var_0_1
	arg_4_0._controllerIndex = arg_4_1
	arg_4_0._eventData = SEASONAL_EVENT.GetCurrentSeasonalEventData()
	arg_4_0._isCWFreeTrialActive = Dvar.IBEGCHEFE("RONTRKPRP")

	ACTIONS.AnimateSequence(arg_4_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function SeasonalEventTitle(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalStackedLayout.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 450 * _1080p)

	var_5_0.id = "SeasonalEventTitle"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:SetSpacing(5 * _1080p)

	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "TitleImg"

	var_5_4:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_5_4:setImage(RegisterMaterial("ui_seasonal_event_title"), 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 430, 0, _1080p * 200)
	var_5_0:addElement(var_5_4)

	var_5_0.TitleImg = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "SpacerCopy0"

	var_5_6:SetAlpha(0, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 651, _1080p * 205, _1080p * 205)
	var_5_0:addElement(var_5_6)

	var_5_0.SpacerCopy0 = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "TitleDesc"

	var_5_8:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 469, _1080p * 210, _1080p * 234)
	var_5_0:addElement(var_5_8)

	var_5_0.TitleDesc = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Spacer"

	var_5_10:SetAlpha(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 651, _1080p * 239, _1080p * 256)
	var_5_0:addElement(var_5_10)

	var_5_0.Spacer = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("SeasonalEventPromptsGroup", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "SeasonalEventCrossLaunchPrompts"

	var_5_12.PromptLabel:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, _1080p * 261, _1080p * 311)
	var_5_0:addElement(var_5_12)

	var_5_0.SeasonalEventCrossLaunchPrompts = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "PromptsSpacer1"

	var_5_14:SetAlpha(0, 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 651, _1080p * 316, _1080p * 317)
	var_5_0:addElement(var_5_14)

	var_5_0.PromptsSpacer1 = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("SeasonalEventPromptsGroup", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "SeasonalEventAllChallengesPrompts"

	var_5_16.PromptLabel:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, _1080p * 322, _1080p * 372)
	var_5_0:addElement(var_5_16)

	var_5_0.SeasonalEventAllChallengesPrompts = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIImage.new()

	var_5_18.id = "PromptsSpacer2"

	var_5_18:SetAlpha(0, 0)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -21, _1080p * 630, _1080p * 377, _1080p * 378)
	var_5_0:addElement(var_5_18)

	var_5_0.PromptsSpacer2 = var_5_18

	local var_5_19
	local var_5_20 = MenuBuilder.BuildRegisteredType("SeasonalEventPromptsGroup", {
		controllerIndex = var_5_1
	})

	var_5_20.id = "SeasonalEventHowToPrompts"

	var_5_20.PromptLabel:SetAlignment(LUI.Alignment.Left)
	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, _1080p * 383, _1080p * 433)
	var_5_0:addElement(var_5_20)

	var_5_0.SeasonalEventHowToPrompts = var_5_20

	local function var_5_21()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_21

	local var_5_22
	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 237
		}
	}

	var_5_8:RegisterAnimationSequence("AR", var_5_23)

	local function var_5_24()
		var_5_8:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_24

	local var_5_25
	local var_5_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 207
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 448
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 12
		}
	}

	var_5_4:RegisterAnimationSequence("SetupLEPEvent", var_5_26)

	local var_5_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_5_8:RegisterAnimationSequence("SetupLEPEvent", var_5_27)

	local function var_5_28()
		var_5_4:AnimateSequence("SetupLEPEvent")
		var_5_8:AnimateSequence("SetupLEPEvent")
	end

	var_5_0._sequences.SetupLEPEvent = var_5_28

	local var_5_29
	local var_5_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2SeasonalEventTheNumbers
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 460
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		}
	}

	var_5_4:RegisterAnimationSequence("SetupNumbersEvent", var_5_30)

	local function var_5_31()
		var_5_4:AnimateSequence("SetupNumbersEvent")
	end

	var_5_0._sequences.SetupNumbersEvent = var_5_31

	local var_5_32
	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 460
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 125
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_haunt_title")
		},
		{
			value = 13019255,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_4:RegisterAnimationSequence("SetupHauntEvent", var_5_33)

	local function var_5_34()
		var_5_4:AnimateSequence("SetupHauntEvent")
	end

	var_5_0._sequences.SetupHauntEvent = var_5_34

	local var_5_35
	local var_5_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_cod_wz_s4_event")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 255
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 523
		}
	}

	var_5_4:RegisterAnimationSequence("SetupArmoredEvent", var_5_36)

	local function var_5_37()
		var_5_4:AnimateSequence("SetupArmoredEvent")
	end

	var_5_0._sequences.SetupArmoredEvent = var_5_37

	local var_5_38
	local var_5_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_cod_wz_s4_event")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 515
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 133
		}
	}

	var_5_4:RegisterAnimationSequence("SetupSeasonalEvent", var_5_39)

	local var_5_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 650
		}
	}

	var_5_8:RegisterAnimationSequence("SetupSeasonalEvent", var_5_40)

	local var_5_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 166
		}
	}

	var_5_10:RegisterAnimationSequence("SetupSeasonalEvent", var_5_41)

	local var_5_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 175
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 225
		}
	}

	var_5_12:RegisterAnimationSequence("SetupSeasonalEvent", var_5_42)

	local var_5_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("SetupSeasonalEvent", var_5_43)

	local var_5_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("SetupSeasonalEvent", var_5_44)

	local function var_5_45()
		var_5_4:AnimateSequence("SetupSeasonalEvent")
		var_5_8:AnimateSequence("SetupSeasonalEvent")
		var_5_10:AnimateSequence("SetupSeasonalEvent")
		var_5_12:AnimateSequence("SetupSeasonalEvent")
		var_5_16:AnimateSequence("SetupSeasonalEvent")
		var_5_20:AnimateSequence("SetupSeasonalEvent")
	end

	var_5_0._sequences.SetupSeasonalEvent = var_5_45

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SeasonalEventTitle", SeasonalEventTitle)
LockTable(_M)
