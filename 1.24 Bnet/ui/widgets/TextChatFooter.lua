module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.InputTextButton)

	function arg_1_0.InputTextButton.textZoneActiveChangeCallback(arg_2_0, arg_2_1)
		if arg_2_1 then
			ACTIONS.AnimateSequence(arg_1_0, "GainFocus")
		else
			ACTIONS.AnimateSequence(arg_1_0, "DefaultSequence")
		end
	end

	local var_1_0, var_1_1, var_1_2, var_1_3 = arg_1_0.CurrentChannel:getLocalRect()

	arg_1_0._currentChannelInitialLeft = var_1_0
end

function TextChatFooter(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 540 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "TextChatFooter"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("TextChatInputTextButton", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "InputTextButton"

	var_3_4:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 131, _1080p * -10, _1080p * -13, _1080p * 11)
	var_3_0:addElement(var_3_4)

	var_3_0.InputTextButton = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "CurrentChannel"

	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 10, _1080p * 121, _1080p * -11, _1080p * 9)
	var_3_0:addElement(var_3_6)

	var_3_0.CurrentChannel = var_3_6

	local var_3_7
	local var_3_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_9 = LUI.UIBorder.new(var_3_8)

	var_3_9.id = "Border"

	var_3_9:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_3_9:SetAlpha(0, 0)
	var_3_0:addElement(var_3_9)

	var_3_0.Border = var_3_9

	local var_3_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Left,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Right,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Bottom,
			value = _1080p * 1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_3_9:RegisterAnimationSequence("DefaultSequence", var_3_10)

	local function var_3_11()
		var_3_9:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_11

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Left,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Right,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Bottom,
			value = _1080p * 1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_3_9:RegisterAnimationSequence("ChatActive", var_3_12)

	local function var_3_13()
		var_3_9:AnimateSequence("ChatActive")
	end

	var_3_0._sequences.ChatActive = var_3_13

	local var_3_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -7
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_3_9:RegisterAnimationSequence("GainFocus", var_3_14)

	local function var_3_15()
		var_3_9:AnimateSequence("GainFocus")
	end

	var_3_0._sequences.GainFocus = var_3_15

	local var_3_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Right,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Left,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Bottom,
			value = _1080p * 1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_3_9:RegisterAnimationSequence("AutocompleteActive", var_3_16)

	local function var_3_17()
		var_3_9:AnimateSequence("AutocompleteActive")
	end

	var_3_0._sequences.AutocompleteActive = var_3_17

	var_0_0(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("TextChatFooter", TextChatFooter)
LockTable(_M)
