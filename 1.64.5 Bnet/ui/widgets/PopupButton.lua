module(..., package.seeall)

function PostLoadFunc(arg_1_0)
	assert(arg_1_0.Label)

	function arg_1_0.SetText(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_0._doNotForceUpperCase and arg_2_1 or ToUpperCase(arg_2_1)

		arg_2_0.Label:setText(var_2_0)
	end

	local var_1_0 = LUI.Alignment.Center

	arg_1_0:SetNotifyOnLayoutInit(true)
	arg_1_0:addEventHandler("layout_initialized", function(arg_3_0, arg_3_1)
		if arg_3_0.Label then
			var_1_0 = arg_3_0.Label:getHorizontalAlignment()
		end
	end)
	arg_1_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		arg_4_0.Background:SetupButton(arg_4_0.Label, arg_4_0.Label:getText(), var_1_0)
		WZWIP.AnimateThemeElement(arg_4_0, "Focused")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "NotFocused")
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		arg_1_0.Background:SetupButton(arg_6_0.Label, arg_6_0.Label:getText(), var_1_0)
		WZWIP.AnimateThemeElement(arg_6_0, "FocusedDisabled")
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_7_0, "NotFocusedDisabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function PopupButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 40 * _1080p)

	var_8_0.id = "PopupButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_4 = LUI.UIImage.new()

		var_8_4.id = "Backer"

		var_8_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
		var_8_4:SetAlpha(0.6, 0)
		var_8_0:addElement(var_8_4)

		var_8_0.Backer = var_8_4
	end

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "Background"

	var_8_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_6)

	var_8_0.Background = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIText.new()

	var_8_8.id = "Label"

	var_8_8:SetRGBFromInt(8421504, 0)
	var_8_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_8:SetWordWrap(false)
	var_8_8:SetAlignment(LUI.Alignment.Center)
	var_8_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 40, _1080p * -40, _1080p * -12, _1080p * 12)
	var_8_0:addElement(var_8_8)

	var_8_0.Label = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "Lock"

	var_8_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_8_10:SetAlpha(0, 0)
	var_8_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_8_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -26, _1080p * -10, _1080p * -8, _1080p * 8)
	var_8_0:addElement(var_8_10)

	var_8_0.Lock = var_8_10

	local var_8_11

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_8_11 = LUI.UIImage.new()
		var_8_11.id = "TopSep"

		var_8_11:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
		var_8_11:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 2, _1080p * -1, 0, _1080p * 1)
		var_8_0:addElement(var_8_11)

		var_8_0.TopSep = var_8_11
	end

	local var_8_12

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_8_12 = LUI.UIImage.new()
		var_8_12.id = "BotSep"

		var_8_12:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
		var_8_12:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 2, _1080p * -1, 0, _1080p * -1)
		var_8_0:addElement(var_8_12)

		var_8_0.BotSep = var_8_12
	end

	local function var_8_13()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_13

	local var_8_14
	local var_8_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_8:RegisterAnimationSequence("Focused", var_8_15)

	local var_8_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Focused", var_8_16)

	local function var_8_17()
		var_8_8:AnimateSequence("Focused")
		var_8_10:AnimateSequence("Focused")
	end

	var_8_0._sequences.Focused = var_8_17

	local var_8_18
	local var_8_19 = {
		{
			value = 8421504,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_8:RegisterAnimationSequence("NotFocused", var_8_19)

	local var_8_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("NotFocused", var_8_20)

	local function var_8_21()
		var_8_8:AnimateSequence("NotFocused")
		var_8_10:AnimateSequence("NotFocused")
	end

	var_8_0._sequences.NotFocused = var_8_21

	local var_8_22
	local var_8_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_8:RegisterAnimationSequence("NotFocusedDisabled", var_8_23)

	local var_8_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("NotFocusedDisabled", var_8_24)

	local function var_8_25()
		var_8_8:AnimateSequence("NotFocusedDisabled")
		var_8_10:AnimateSequence("NotFocusedDisabled")
	end

	var_8_0._sequences.NotFocusedDisabled = var_8_25

	local var_8_26
	local var_8_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_8:RegisterAnimationSequence("FocusedDisabled", var_8_27)

	local var_8_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("FocusedDisabled", var_8_28)

	local function var_8_29()
		var_8_8:AnimateSequence("FocusedDisabled")
		var_8_10:AnimateSequence("FocusedDisabled")
	end

	var_8_0._sequences.FocusedDisabled = var_8_29

	local var_8_30
	local var_8_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		}
	}

	var_8_8:RegisterAnimationSequence("AR", var_8_31)

	local function var_8_32()
		var_8_8:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_32

	local var_8_33
	local var_8_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight,
			child = var_8_0.Background.TextGlow
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipSetup", var_8_34)

	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipSetup", var_8_35)

	local var_8_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipSetup", var_8_36)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_37 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_8_11:RegisterAnimationSequence("WZWipSetup", var_8_37)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_38 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Top
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -1
			}
		}

		var_8_12:RegisterAnimationSequence("WZWipSetup", var_8_38)
	end

	local function var_8_39()
		var_8_6:AnimateSequence("WZWipSetup")
		var_8_8:AnimateSequence("WZWipSetup")
		var_8_10:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_11:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_12:AnimateSequence("WZWipSetup")
		end
	end

	var_8_0._sequences.WZWipSetup = var_8_39

	local var_8_40
	local var_8_41 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipButtonOver", var_8_41)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_42 = {
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_11:RegisterAnimationSequence("WZWipButtonOver", var_8_42)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_43 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_12:RegisterAnimationSequence("WZWipButtonOver", var_8_43)
	end

	local function var_8_44()
		var_8_8:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_11:AnimateSequence("WZWipButtonOver")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_12:AnimateSequence("WZWipButtonOver")
		end
	end

	var_8_0._sequences.WZWipButtonOver = var_8_44

	local var_8_45
	local var_8_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_46)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_47 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_8_11:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_47)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_48 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_8_12:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_48)
	end

	local function var_8_49()
		var_8_8:AnimateSequence("WZWipButtonOverDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_11:AnimateSequence("WZWipButtonOverDisabled")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_12:AnimateSequence("WZWipButtonOverDisabled")
		end
	end

	var_8_0._sequences.WZWipButtonOverDisabled = var_8_49

	local var_8_50
	local var_8_51 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipButtonUp", var_8_51)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_52 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0.5,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_11:RegisterAnimationSequence("WZWipButtonUp", var_8_52)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_53 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0.5,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_12:RegisterAnimationSequence("WZWipButtonUp", var_8_53)
	end

	local function var_8_54()
		var_8_8:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_11:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_12:AnimateSequence("WZWipButtonUp")
		end
	end

	var_8_0._sequences.WZWipButtonUp = var_8_54

	local var_8_55
	local var_8_56 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_56)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_57 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_8_11:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_57)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_58 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_8_12:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_58)
	end

	local function var_8_59()
		var_8_8:AnimateSequence("WZWipButtonUpDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_11:AnimateSequence("WZWipButtonUpDisabled")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_12:AnimateSequence("WZWipButtonUpDisabled")
		end
	end

	var_8_0._sequences.WZWipButtonUpDisabled = var_8_59

	local var_8_60
	local var_8_61 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipNotFocused", var_8_61)

	local var_8_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipNotFocused", var_8_62)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_63 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0.5,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_11:RegisterAnimationSequence("WZWipNotFocused", var_8_63)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_64 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0.5,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_12:RegisterAnimationSequence("WZWipNotFocused", var_8_64)
	end

	local function var_8_65()
		var_8_8:AnimateSequence("WZWipNotFocused")
		var_8_10:AnimateSequence("WZWipNotFocused")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_11:AnimateSequence("WZWipNotFocused")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_12:AnimateSequence("WZWipNotFocused")
		end
	end

	var_8_0._sequences.WZWipNotFocused = var_8_65

	local var_8_66
	local var_8_67 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipNotFocusedDisabled", var_8_67)

	local var_8_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipNotFocusedDisabled", var_8_68)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_69 = {
			{
				value = 0.3,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_8_11:RegisterAnimationSequence("WZWipNotFocusedDisabled", var_8_69)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_70 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_8_12:RegisterAnimationSequence("WZWipNotFocusedDisabled", var_8_70)
	end

	local function var_8_71()
		var_8_8:AnimateSequence("WZWipNotFocusedDisabled")
		var_8_10:AnimateSequence("WZWipNotFocusedDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_11:AnimateSequence("WZWipNotFocusedDisabled")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_12:AnimateSequence("WZWipNotFocusedDisabled")
		end
	end

	var_8_0._sequences.WZWipNotFocusedDisabled = var_8_71

	local var_8_72
	local var_8_73 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipFocused", var_8_73)

	local var_8_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipFocused", var_8_74)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_75 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_11:RegisterAnimationSequence("WZWipFocused", var_8_75)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_76 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_12:RegisterAnimationSequence("WZWipFocused", var_8_76)
	end

	local function var_8_77()
		var_8_8:AnimateSequence("WZWipFocused")
		var_8_10:AnimateSequence("WZWipFocused")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_11:AnimateSequence("WZWipFocused")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_12:AnimateSequence("WZWipFocused")
		end
	end

	var_8_0._sequences.WZWipFocused = var_8_77

	local var_8_78
	local var_8_79 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipFocusedDisabled", var_8_79)

	local var_8_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipFocusedDisabled", var_8_80)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_81 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.5,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_11:RegisterAnimationSequence("WZWipFocusedDisabled", var_8_81)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_8_82 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.5,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_12:RegisterAnimationSequence("WZWipFocusedDisabled", var_8_82)
	end

	local function var_8_83()
		var_8_8:AnimateSequence("WZWipFocusedDisabled")
		var_8_10:AnimateSequence("WZWipFocusedDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_11:AnimateSequence("WZWipFocusedDisabled")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_8_12:AnimateSequence("WZWipFocusedDisabled")
		end
	end

	var_8_0._sequences.WZWipFocusedDisabled = var_8_83

	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("PopupButton", PopupButton)
LockTable(_M)
