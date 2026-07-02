module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._isVisible = false
	arg_1_0._controllerIndex = arg_1_1

	local function var_1_0(arg_2_0, arg_2_1)
		if arg_2_1 and not LUI.IsLastInputMouseNavigation(arg_2_0._controllerIndex) then
			ACTIONS.AnimateSequence(arg_2_0, "FocusedGamepad")

			arg_2_0._isVisible = true
		else
			ACTIONS.AnimateSequence(arg_2_0, "UnFocusedGamepad")

			arg_2_0._isVisible = false
		end
	end

	local function var_1_1(arg_3_0, arg_3_1)
		if LUI.IsLastInputGamepad(arg_3_1.controllerIndex) then
			if arg_3_0._isVisible then
				ACTIONS.AnimateSequence(arg_3_0, "FocusedGamepad")
			end

			arg_3_0.ButtonPrompt:setText(LocalizeString("LUA_MENU/PAD_ALT1_BUTTON"), 0)
		else
			ACTIONS.AnimateSequence(arg_3_0, "UnFocusedGamepad")
		end
	end

	arg_1_0:addAndCallEventHandler("update_input_type", var_1_1, {
		controllerIndex = arg_1_1
	})

	arg_1_0.UpdatePrompt = var_1_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function GenericExpanderExpandWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 28 * _1080p)

	var_4_0.id = "GenericExpanderExpandWidget"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Background"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "ExpandMe"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("LUA_MENU/EXPANDER_ADVANCED"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 16, _1080p * -16, _1080p * -9, _1080p * 9)
	var_4_0:addElement(var_4_6)

	var_4_0.ExpandMe = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "ButtonPrompt"

	var_4_8:SetAlpha(0, 0)
	var_4_8:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_ALT1_BUTTON"), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1, _1080p * -1, _1080p * 5, _1080p * 23)
	var_4_0:addElement(var_4_8)

	var_4_0.ButtonPrompt = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/EXPANDER_COLLAPSE")
		}
	}

	var_4_6:RegisterAnimationSequence("Expanded", var_4_10)

	local function var_4_11()
		var_4_6:AnimateSequence("Expanded")
	end

	var_4_0._sequences.Expanded = var_4_11

	local var_4_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/EXPANDER_ADVANCED")
		}
	}

	var_4_6:RegisterAnimationSequence("Collapsed", var_4_12)

	local function var_4_13()
		var_4_6:AnimateSequence("Collapsed")
	end

	var_4_0._sequences.Collapsed = var_4_13

	local var_4_14 = {
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

	var_4_6:RegisterAnimationSequence("FocusedGamepad", var_4_14)

	local var_4_15 = {
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

	var_4_8:RegisterAnimationSequence("FocusedGamepad", var_4_15)

	local function var_4_16()
		var_4_6:AnimateSequence("FocusedGamepad")
		var_4_8:AnimateSequence("FocusedGamepad")
	end

	var_4_0._sequences.FocusedGamepad = var_4_16

	local var_4_17 = {
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

	var_4_6:RegisterAnimationSequence("UnFocusedGamepad", var_4_17)

	local var_4_18 = {
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

	var_4_8:RegisterAnimationSequence("UnFocusedGamepad", var_4_18)

	local function var_4_19()
		var_4_6:AnimateSequence("UnFocusedGamepad")
		var_4_8:AnimateSequence("UnFocusedGamepad")
	end

	var_4_0._sequences.UnFocusedGamepad = var_4_19

	local var_4_20 = {
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

	var_4_6:RegisterAnimationSequence("FocusedKBM", var_4_20)

	local function var_4_21()
		var_4_6:AnimateSequence("FocusedKBM")
	end

	var_4_0._sequences.FocusedKBM = var_4_21

	local var_4_22 = {
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

	var_4_6:RegisterAnimationSequence("UnFocusedKBM", var_4_22)

	local function var_4_23()
		var_4_6:AnimateSequence("UnFocusedKBM")
	end

	var_4_0._sequences.UnFocusedKBM = var_4_23

	local var_4_24 = {
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

	var_4_6:RegisterAnimationSequence("AR", var_4_24)

	local function var_4_25()
		var_4_6:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_25

	var_4_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "FocusedKBM")
	end)
	var_4_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "UnFocusedKBM")
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("GenericExpanderExpandWidget", GenericExpanderExpandWidget)
LockTable(_M)
