module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._isVisible = false
	arg_1_0._controllerIndex = arg_1_1

	local function var_1_0(arg_2_0, arg_2_1)
		if arg_2_1 and not LUI.IsLastInputMouseNavigation(arg_2_0._controllerIndex) then
			WZWIP.AnimateThemeElement(arg_2_0, "FocusedGamepad")

			arg_2_0._isVisible = true
		else
			WZWIP.AnimateThemeElement(arg_2_0, "UnFocusedGamepad")

			arg_2_0._isVisible = false
		end
	end

	local function var_1_1(arg_3_0, arg_3_1)
		if LUI.IsLastInputGamepad(arg_3_1.controllerIndex) then
			if arg_3_0._isVisible then
				WZWIP.AnimateThemeElement(arg_3_0, "FocusedGamepad")
			end

			arg_3_0.ButtonPrompt:setText(LocalizeString("LUA_MENU/PAD_ALT1_BUTTON"), 0)
		else
			WZWIP.AnimateThemeElement(arg_3_0, "UnFocusedGamepad")
		end
	end

	arg_1_0:addAndCallEventHandler("update_input_type", var_1_1, {
		controllerIndex = arg_1_1
	})

	arg_1_0.UpdatePrompt = var_1_0

	arg_1_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "FocusedKBM")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "UnFocusedKBM")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function GenericExpanderExpandWidget(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 28 * _1080p)

	var_6_0.id = "GenericExpanderExpandWidget"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "Background"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "ExpandMe"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_6:setText(Engine.CBBHFCGDIC("LUA_MENU/EXPANDER_ADVANCED"), 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 16, _1080p * -16, _1080p * -9, _1080p * 9)
	var_6_0:addElement(var_6_6)

	var_6_0.ExpandMe = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "ButtonPrompt"

	var_6_8:SetAlpha(0, 0)
	var_6_8:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_ALT1_BUTTON"), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1, _1080p * -1, _1080p * 5, _1080p * 23)
	var_6_0:addElement(var_6_8)

	var_6_0.ButtonPrompt = var_6_8

	local function var_6_9()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_9

	local var_6_10
	local var_6_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/EXPANDER_COLLAPSE")
		}
	}

	var_6_6:RegisterAnimationSequence("Expanded", var_6_11)

	local function var_6_12()
		var_6_6:AnimateSequence("Expanded")
	end

	var_6_0._sequences.Expanded = var_6_12

	local var_6_13
	local var_6_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/EXPANDER_ADVANCED")
		}
	}

	var_6_6:RegisterAnimationSequence("Collapsed", var_6_14)

	local function var_6_15()
		var_6_6:AnimateSequence("Collapsed")
	end

	var_6_0._sequences.Collapsed = var_6_15

	local var_6_16
	local var_6_17 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 48
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -48
		}
	}

	var_6_6:RegisterAnimationSequence("FocusedGamepad", var_6_17)

	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -17
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("FocusedGamepad", var_6_18)

	local function var_6_19()
		var_6_6:AnimateSequence("FocusedGamepad")
		var_6_8:AnimateSequence("FocusedGamepad")
	end

	var_6_0._sequences.FocusedGamepad = var_6_19

	local var_6_20
	local var_6_21 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		}
	}

	var_6_6:RegisterAnimationSequence("UnFocusedGamepad", var_6_21)

	local var_6_22 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -1
		}
	}

	var_6_8:RegisterAnimationSequence("UnFocusedGamepad", var_6_22)

	local function var_6_23()
		var_6_6:AnimateSequence("UnFocusedGamepad")
		var_6_8:AnimateSequence("UnFocusedGamepad")
	end

	var_6_0._sequences.UnFocusedGamepad = var_6_23

	local var_6_24
	local var_6_25 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		}
	}

	var_6_6:RegisterAnimationSequence("FocusedKBM", var_6_25)

	local function var_6_26()
		var_6_6:AnimateSequence("FocusedKBM")
	end

	var_6_0._sequences.FocusedKBM = var_6_26

	local var_6_27
	local var_6_28 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		}
	}

	var_6_6:RegisterAnimationSequence("UnFocusedKBM", var_6_28)

	local function var_6_29()
		var_6_6:AnimateSequence("UnFocusedKBM")
	end

	var_6_0._sequences.UnFocusedKBM = var_6_29

	local var_6_30
	local var_6_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -19
		}
	}

	var_6_6:RegisterAnimationSequence("AR", var_6_31)

	local function var_6_32()
		var_6_6:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_32

	local var_6_33
	local var_6_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipSetup", var_6_34)

	local function var_6_35()
		var_6_6:AnimateSequence("WZWipSetup")
	end

	var_6_0._sequences.WZWipSetup = var_6_35

	local var_6_36
	local var_6_37 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 48
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -48
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipFocusedGamepad", var_6_37)

	local var_6_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -17
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipFocusedGamepad", var_6_38)

	local function var_6_39()
		var_6_6:AnimateSequence("WZWipFocusedGamepad")
		var_6_8:AnimateSequence("WZWipFocusedGamepad")
	end

	var_6_0._sequences.WZWipFocusedGamepad = var_6_39

	local var_6_40
	local var_6_41 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipFocusedKBM", var_6_41)

	local function var_6_42()
		var_6_6:AnimateSequence("WZWipFocusedKBM")
	end

	var_6_0._sequences.WZWipFocusedKBM = var_6_42

	local var_6_43
	local var_6_44 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipUnFocusedGamepad", var_6_44)

	local var_6_45 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -1
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipUnFocusedGamepad", var_6_45)

	local function var_6_46()
		var_6_6:AnimateSequence("WZWipUnFocusedGamepad")
		var_6_8:AnimateSequence("WZWipUnFocusedGamepad")
	end

	var_6_0._sequences.WZWipUnFocusedGamepad = var_6_46

	local var_6_47
	local var_6_48 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipUnFocusedKBM", var_6_48)

	local function var_6_49()
		var_6_6:AnimateSequence("WZWipUnFocusedKBM")
	end

	var_6_0._sequences.WZWipUnFocusedKBM = var_6_49

	local var_6_50
	local var_6_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/EXPANDER_ADVANCED")
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipCollapsed", var_6_51)

	local function var_6_52()
		var_6_6:AnimateSequence("WZWipCollapsed")
	end

	var_6_0._sequences.WZWipCollapsed = var_6_52

	local var_6_53
	local var_6_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/EXPANDER_COLLAPSE")
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipExpanded", var_6_54)

	local function var_6_55()
		var_6_6:AnimateSequence("WZWipExpanded")
	end

	var_6_0._sequences.WZWipExpanded = var_6_55

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("GenericExpanderExpandWidget", GenericExpanderExpandWidget)
LockTable(_M)
