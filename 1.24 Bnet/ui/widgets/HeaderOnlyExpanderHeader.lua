module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 and LUI.IsLastInputGamepad(arg_1_0._controllerIndex) then
		arg_1_0.ButtonPrompt:SetAlpha(1)
	else
		arg_1_0.ButtonPrompt:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.ShowButtonPrompt = var_0_0
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0._isOver = false

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	local function var_2_0(arg_3_0, arg_3_1)
		arg_3_0:ShowButtonPrompt(arg_3_0._isOver)
	end

	arg_2_0:addAndCallEventHandler("update_input_type", var_2_0, {
		controllerIndex = arg_2_1
	})
	arg_2_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		arg_4_0:ShowButtonPrompt(true)

		arg_4_0._isOver = true
	end)
	arg_2_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		arg_5_0._isOver = false
	end)
end

function HeaderOnlyExpanderHeader(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 38 * _1080p)

	var_6_0.id = "HeaderOnlyExpanderHeader"
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

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 38)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "Title"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -28, _1080p * -9, _1080p * 9)
	var_6_0:addElement(var_6_6)

	var_6_0.Title = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "Arrow"

	var_6_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_8:SetZRotation(90, 0)
	var_6_8:setImage(RegisterMaterial("wdg_selection_arrow_left_1"), 0)
	var_6_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -29, _1080p * -10, 0, _1080p * 38)
	var_6_0:addElement(var_6_8)

	var_6_0.Arrow = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIText.new()

	var_6_10.id = "ExtraInfo"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_10:setText("", 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Right)
	var_6_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -283, _1080p * -68, _1080p * -9, _1080p * 9)
	var_6_0:addElement(var_6_10)

	var_6_0.ExtraInfo = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIText.new()

	var_6_12.id = "ButtonPrompt"

	var_6_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_12:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_ALT1_BUTTON"), 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_12:SetAlignment(LUI.Alignment.Right)
	var_6_12:SetTintFontIcons(true)
	var_6_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -68, _1080p * -35, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_12)

	var_6_0.ButtonPrompt = var_6_12

	local function var_6_13()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_13

	local var_6_14 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -29
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		},
		{
			value = -90,
			duration = 100,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_6_8:RegisterAnimationSequence("Expanded", var_6_14)

	local function var_6_15()
		var_6_8:AnimateSequence("Expanded")
	end

	var_6_0._sequences.Expanded = var_6_15

	local var_6_16 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -29
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		},
		{
			value = 90,
			duration = 100,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_6_8:RegisterAnimationSequence("Collapsed", var_6_16)

	local function var_6_17()
		var_6_8:AnimateSequence("Collapsed")
	end

	var_6_0._sequences.Collapsed = var_6_17

	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -52
		}
	}

	var_6_6:RegisterAnimationSequence("AR", var_6_18)

	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_6_10:RegisterAnimationSequence("AR", var_6_19)

	local function var_6_20()
		var_6_6:AnimateSequence("AR")
		var_6_10:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_20

	local var_6_21 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("Over", var_6_21)

	local function var_6_22()
		var_6_8:AnimateSequence("Over")
	end

	var_6_0._sequences.Over = var_6_22

	local var_6_23 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -29
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_6_8:RegisterAnimationSequence("Up", var_6_23)

	local function var_6_24()
		var_6_8:AnimateSequence("Up")
	end

	var_6_0._sequences.Up = var_6_24

	var_6_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Over")
	end)
	var_6_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Up")
	end)
	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("HeaderOnlyExpanderHeader", HeaderOnlyExpanderHeader)
LockTable(_M)
