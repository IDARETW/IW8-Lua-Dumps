module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	return arg_1_0._useKBMPrompts and LUI.IsLastInputKeyboardMouse(arg_1_1) and "PromptEnabledKBM" or "PromptEnabled"
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_1 ~= nil, "Usage: SeasonalEventContentPanel:SetPromptEnabled( <isEnabled>, <controllerIndex> )")

	if arg_2_0._promptEnabled ~= arg_2_1 then
		arg_2_0._promptEnabled = arg_2_1

		ACTIONS.AnimateSequence(arg_2_0, arg_2_0._promptEnabled and var_0_0(arg_2_0, arg_2_2) or "PromptDisabled")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._promptEnabled = true
	arg_3_0._useKBMPrompts = false

	ACTIONS.AnimateSequence(arg_3_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())

	if arg_3_0._useKBMPrompts then
		arg_3_0:registerAndCallEventHandler("update_input_type", function(arg_4_0, arg_4_1)
			if arg_4_0._promptEnabled then
				ACTIONS.AnimateSequence(arg_4_0, var_0_0(arg_4_0, arg_4_1.controllerIndex))
			end
		end, {
			element = arg_3_0,
			controllerIndex = arg_3_1
		})
	else
		arg_3_0.ButtonPromptContainer:SetMouseFocusBlocker(true)
	end

	arg_3_0.SetPromptEnabled = var_0_1

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function SeasonalEventContentPanel(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 634 * _1080p)

	var_5_0.id = "SeasonalEventContentPanel"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIText.new()

	var_5_4.id = "Header"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_5_4:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT"), 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_4:SetAlignment(LUI.Alignment.Left)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 28)
	var_5_0:addElement(var_5_4)

	var_5_0.Header = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "HeaderLine"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 26, _1080p * 27)
	var_5_0:addElement(var_5_6)

	var_5_0.HeaderLine = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Image1"

	var_5_8:setImage(RegisterMaterial("ui_seasonal_event_halloween_feature_1"), 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 44, _1080p * 234)
	var_5_0:addElement(var_5_8)

	var_5_0.Image1 = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "Title1"

	var_5_10:SetRGBFromTable(SWATCHES.EventPromos.halloweenText, 0)
	var_5_10:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_TITLE_1")), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_10:SetWordWrap(false)
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_10:SetStartupDelay(1000)
	var_5_10:SetLineHoldTime(400)
	var_5_10:SetAnimMoveTime(150)
	var_5_10:SetAnimMoveSpeed(50)
	var_5_10:SetEndDelay(1000)
	var_5_10:SetCrossfadeTime(400)
	var_5_10:SetFadeInTime(300)
	var_5_10:SetFadeOutTime(300)
	var_5_10:SetMaxVisibleLines(1)
	var_5_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 24, _1080p * -24, _1080p * 150, _1080p * 174)
	var_5_0:addElement(var_5_10)

	var_5_0.Title1 = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIText.new()

	var_5_12.id = "Desc1"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_5_12:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_DESC_1"), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 24, _1080p * -24, _1080p * 180, _1080p * 198)
	var_5_0:addElement(var_5_12)

	var_5_0.Desc1 = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "Image2"

	var_5_14:setImage(RegisterMaterial("ui_seasonal_event_halloween_feature_2"), 0)
	var_5_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 244, _1080p * 434)
	var_5_0:addElement(var_5_14)

	var_5_0.Image2 = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIStyledText.new()

	var_5_16.id = "Title2"

	var_5_16:SetRGBFromTable(SWATCHES.EventPromos.halloweenText, 0)
	var_5_16:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_TITLE_2")), 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_16:SetWordWrap(false)
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_16:SetStartupDelay(1000)
	var_5_16:SetLineHoldTime(400)
	var_5_16:SetAnimMoveTime(150)
	var_5_16:SetAnimMoveSpeed(50)
	var_5_16:SetEndDelay(1000)
	var_5_16:SetCrossfadeTime(400)
	var_5_16:SetFadeInTime(300)
	var_5_16:SetFadeOutTime(300)
	var_5_16:SetMaxVisibleLines(1)
	var_5_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 24, _1080p * -24, _1080p * 350, _1080p * 374)
	var_5_0:addElement(var_5_16)

	var_5_0.Title2 = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIText.new()

	var_5_18.id = "Desc2"

	var_5_18:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_5_18:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_DESC_2"), 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_18:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 24, _1080p * -24, _1080p * 380, _1080p * 398)
	var_5_0:addElement(var_5_18)

	var_5_0.Desc2 = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIImage.new()

	var_5_20.id = "Image3"

	var_5_20:setImage(RegisterMaterial("ui_seasonal_event_halloween_feature_3"), 0)
	var_5_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 444, _1080p * 634)
	var_5_0:addElement(var_5_20)

	var_5_0.Image3 = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIStyledText.new()

	var_5_22.id = "Title3"

	var_5_22:SetRGBFromTable(SWATCHES.EventPromos.halloweenText, 0)
	var_5_22:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_TITLE_3")), 0)
	var_5_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_22:SetWordWrap(false)
	var_5_22:SetAlignment(LUI.Alignment.Left)
	var_5_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_22:SetStartupDelay(1000)
	var_5_22:SetLineHoldTime(400)
	var_5_22:SetAnimMoveTime(150)
	var_5_22:SetAnimMoveSpeed(50)
	var_5_22:SetEndDelay(1000)
	var_5_22:SetCrossfadeTime(400)
	var_5_22:SetFadeInTime(300)
	var_5_22:SetFadeOutTime(300)
	var_5_22:SetMaxVisibleLines(1)
	var_5_22:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 24, _1080p * -24, _1080p * 550, _1080p * 574)
	var_5_0:addElement(var_5_22)

	var_5_0.Title3 = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIText.new()

	var_5_24.id = "Desc3"

	var_5_24:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_5_24:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_DESC_3"), 0)
	var_5_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_24:SetAlignment(LUI.Alignment.Left)
	var_5_24:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 24, _1080p * -24, _1080p * 580, _1080p * 598)
	var_5_0:addElement(var_5_24)

	var_5_0.Desc3 = var_5_24

	local var_5_25
	local var_5_26 = LUI.UIText.new()

	var_5_26.id = "ViewBundlesLabel"

	var_5_26:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_5_26:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/VIEW_BUNDLES"), 0)
	var_5_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_26:SetAlignment(LUI.Alignment.Left)
	var_5_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 396, _1080p * 58, _1080p * 82)
	var_5_0:addElement(var_5_26)

	var_5_0.ViewBundlesLabel = var_5_26

	local var_5_27
	local var_5_28 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_5_1
	})

	var_5_28.id = "ButtonPromptContainer"

	var_5_28:SetAlpha(0, 0)

	if CONDITIONS.AlwaysFalse(var_5_0) then
		var_5_28.Label:setText("ButtonPrompt", 0)
	end

	var_5_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 275, _1080p * 50, _1080p * 90)
	var_5_0:addElement(var_5_28)

	var_5_0.ButtonPromptContainer = var_5_28

	local function var_5_29()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_29

	local var_5_30
	local var_5_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_26:RegisterAnimationSequence("PromptEnabled", var_5_31)

	local var_5_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_28:RegisterAnimationSequence("PromptEnabled", var_5_32)

	local function var_5_33()
		var_5_26:AnimateSequence("PromptEnabled")
		var_5_28:AnimateSequence("PromptEnabled")
	end

	var_5_0._sequences.PromptEnabled = var_5_33

	local var_5_34
	local var_5_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_26:RegisterAnimationSequence("PromptDisabled", var_5_35)

	local var_5_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_28:RegisterAnimationSequence("PromptDisabled", var_5_36)

	local function var_5_37()
		var_5_26:AnimateSequence("PromptDisabled")
		var_5_28:AnimateSequence("PromptDisabled")
	end

	var_5_0._sequences.PromptDisabled = var_5_37

	local var_5_38
	local var_5_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 184
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 154
		}
	}

	var_5_10:RegisterAnimationSequence("AR", var_5_39)

	local var_5_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 213
		}
	}

	var_5_12:RegisterAnimationSequence("AR", var_5_40)

	local var_5_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 380
		}
	}

	var_5_16:RegisterAnimationSequence("AR", var_5_41)

	local var_5_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 408
		}
	}

	var_5_18:RegisterAnimationSequence("AR", var_5_42)

	local var_5_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 580
		}
	}

	var_5_22:RegisterAnimationSequence("AR", var_5_43)

	local var_5_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 608
		}
	}

	var_5_24:RegisterAnimationSequence("AR", var_5_44)

	local function var_5_45()
		var_5_10:AnimateSequence("AR")
		var_5_12:AnimateSequence("AR")
		var_5_16:AnimateSequence("AR")
		var_5_18:AnimateSequence("AR")
		var_5_22:AnimateSequence("AR")
		var_5_24:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_45

	local var_5_46
	local var_5_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_atlantis_feature_1")
		}
	}

	var_5_8:RegisterAnimationSequence("AtlantisEvent", var_5_47)

	local var_5_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisLight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_ATLANTIS_TITLE_1"))
		}
	}

	var_5_10:RegisterAnimationSequence("AtlantisEvent", var_5_48)

	local var_5_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_ATLANTIS_DESC_1")
		}
	}

	var_5_12:RegisterAnimationSequence("AtlantisEvent", var_5_49)

	local var_5_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_atlantis_feature_2")
		}
	}

	var_5_14:RegisterAnimationSequence("AtlantisEvent", var_5_50)

	local var_5_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisLight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_ATLANTIS_TITLE_2"))
		}
	}

	var_5_16:RegisterAnimationSequence("AtlantisEvent", var_5_51)

	local var_5_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_ATLANTIS_DESC_2")
		}
	}

	var_5_18:RegisterAnimationSequence("AtlantisEvent", var_5_52)

	local var_5_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_atlantis_feature_3")
		}
	}

	var_5_20:RegisterAnimationSequence("AtlantisEvent", var_5_53)

	local var_5_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisLight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_ATLANTIS_TITLE_3"))
		}
	}

	var_5_22:RegisterAnimationSequence("AtlantisEvent", var_5_54)

	local var_5_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_ATLANTIS_DESC_3")
		}
	}

	var_5_24:RegisterAnimationSequence("AtlantisEvent", var_5_55)

	local function var_5_56()
		var_5_8:AnimateSequence("AtlantisEvent")
		var_5_10:AnimateSequence("AtlantisEvent")
		var_5_12:AnimateSequence("AtlantisEvent")
		var_5_14:AnimateSequence("AtlantisEvent")
		var_5_16:AnimateSequence("AtlantisEvent")
		var_5_18:AnimateSequence("AtlantisEvent")
		var_5_20:AnimateSequence("AtlantisEvent")
		var_5_22:AnimateSequence("AtlantisEvent")
		var_5_24:AnimateSequence("AtlantisEvent")
	end

	var_5_0._sequences.AtlantisEvent = var_5_56

	local var_5_57
	local var_5_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_26:RegisterAnimationSequence("PromptEnabledKBM", var_5_58)

	local var_5_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_28:RegisterAnimationSequence("PromptEnabledKBM", var_5_59)

	local function var_5_60()
		var_5_26:AnimateSequence("PromptEnabledKBM")
		var_5_28:AnimateSequence("PromptEnabledKBM")
	end

	var_5_0._sequences.PromptEnabledKBM = var_5_60

	local var_5_61
	local var_5_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.OutbreakRed
		}
	}

	var_5_4:RegisterAnimationSequence("SetupZombiesEvent", var_5_62)

	local var_5_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.OutbreakRed
		}
	}

	var_5_6:RegisterAnimationSequence("SetupZombiesEvent", var_5_63)

	local var_5_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_outbreak_feature_3")
		}
	}

	var_5_8:RegisterAnimationSequence("SetupZombiesEvent", var_5_64)

	local var_5_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.OutbreakRed
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_OUTBREAK_HEADER_3"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 164
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 188
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("SetupZombiesEvent", var_5_65)

	local var_5_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_OUTBREAK_DESC_3")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 207
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("SetupZombiesEvent", var_5_66)

	local var_5_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("SetupZombiesEvent", var_5_67)

	local var_5_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("SetupZombiesEvent", var_5_68)

	local var_5_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("SetupZombiesEvent", var_5_69)

	local var_5_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("SetupZombiesEvent", var_5_70)

	local var_5_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("SetupZombiesEvent", var_5_71)

	local var_5_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("SetupZombiesEvent", var_5_72)

	local var_5_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_26:RegisterAnimationSequence("SetupZombiesEvent", var_5_73)

	local function var_5_74()
		var_5_4:AnimateSequence("SetupZombiesEvent")
		var_5_6:AnimateSequence("SetupZombiesEvent")
		var_5_8:AnimateSequence("SetupZombiesEvent")
		var_5_10:AnimateSequence("SetupZombiesEvent")
		var_5_12:AnimateSequence("SetupZombiesEvent")
		var_5_14:AnimateSequence("SetupZombiesEvent")
		var_5_16:AnimateSequence("SetupZombiesEvent")
		var_5_18:AnimateSequence("SetupZombiesEvent")
		var_5_20:AnimateSequence("SetupZombiesEvent")
		var_5_22:AnimateSequence("SetupZombiesEvent")
		var_5_24:AnimateSequence("SetupZombiesEvent")
		var_5_26:AnimateSequence("SetupZombiesEvent")
	end

	var_5_0._sequences.SetupZombiesEvent = var_5_74

	var_0_2(var_5_0, var_5_1, arg_5_1)

	if CONDITIONS.IsArabic(var_5_0) then
		ACTIONS.AnimateSequence(var_5_0, "AR")
	end

	return var_5_0
end

MenuBuilder.registerType("SeasonalEventContentPanel", SeasonalEventContentPanel)
LockTable(_M)
