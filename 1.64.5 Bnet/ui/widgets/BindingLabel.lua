module(..., package.seeall)

local function var_0_0(arg_1_0)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
		arg_1_0.Text:SetAlignment(LUI.Alignment.Right)
	end
end

function BindingLabel(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 22 * _1080p)

	var_2_0.id = "BindingLabel"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Backgound"

	var_2_4:SetRGBFromTable(SWATCHES.KeyBinding.binding, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Backgound = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Text"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.notificationBackground, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("MENU/BINDING"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 6, 0, _1080p * 2, _1080p * -2)
	var_2_0:addElement(var_2_6)

	var_2_0.Text = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("GainFocus", var_2_8)

	local var_2_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("GainFocus", var_2_9)

	local function var_2_10()
		var_2_4:AnimateSequence("GainFocus")
		var_2_6:AnimateSequence("GainFocus")
	end

	var_2_0._sequences.GainFocus = var_2_10

	local var_2_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 22
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.85,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_2_4:RegisterAnimationSequence("Binding", var_2_11)

	local var_2_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Binding", var_2_12)

	local function var_2_13()
		var_2_4:AnimateSequence("Binding")
		var_2_6:AnimateSequence("Binding")
	end

	var_2_0._sequences.Binding = var_2_13

	local var_2_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		}
	}

	var_2_4:RegisterAnimationSequence("BindingSucces", var_2_14)

	local var_2_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("BindingSucces", var_2_15)

	local function var_2_16()
		var_2_4:AnimateSequence("BindingSucces")
		var_2_6:AnimateSequence("BindingSucces")
	end

	var_2_0._sequences.BindingSucces = var_2_16

	local var_2_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -6
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_17)

	local function var_2_18()
		var_2_6:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_18

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BindingLabel", BindingLabel)
LockTable(_M)
