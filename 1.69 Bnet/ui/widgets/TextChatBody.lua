module(..., package.seeall)

function TextChatBody(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 540 * _1080p, 0, 215 * _1080p)

	var_1_0.id = "TextChatBody"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "BackgroundFull"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.textFocusAlt, 0)
	var_1_4:SetAlpha(0.85, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BackgroundFull = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("TextChatEntriesList", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "TextChatEntriesList"

	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -10, _1080p * 7, _1080p * -5)
	var_1_0:addElement(var_1_6)

	var_1_0.TextChatEntriesList = var_1_6

	local var_1_7
	local var_1_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_1_9 = LUI.UIBorder.new(var_1_8)

	var_1_9.id = "TextChatBorder"

	var_1_9:SetRGBFromTable(SWATCHES.CAC.button, 0)
	var_1_9:SetBorderThicknessBottom(_1080p * 0, 0)
	var_1_0:addElement(var_1_9)

	var_1_0.TextChatBorder = var_1_9

	local var_1_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("DefaultSequence", var_1_10)

	local var_1_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_1_6:RegisterAnimationSequence("DefaultSequence", var_1_11)

	local var_1_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("DefaultSequence", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("DefaultSequence")
		var_1_6:AnimateSequence("DefaultSequence")
		var_1_9:AnimateSequence("DefaultSequence")
	end

	var_1_0._sequences.DefaultSequence = var_1_13

	local var_1_14 = {
		{
			value = 0.85,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Expanded", var_1_14)

	local var_1_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_1_6:RegisterAnimationSequence("Expanded", var_1_15)

	local var_1_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("Expanded", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("Expanded")
		var_1_6:AnimateSequence("Expanded")
		var_1_9:AnimateSequence("Expanded")
	end

	var_1_0._sequences.Expanded = var_1_17

	local var_1_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("InGameCollapsed", var_1_18)

	local var_1_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_1_6:RegisterAnimationSequence("InGameCollapsed", var_1_19)

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("InGameCollapsed", var_1_20)

	local function var_1_21()
		var_1_4:AnimateSequence("InGameCollapsed")
		var_1_6:AnimateSequence("InGameCollapsed")
		var_1_9:AnimateSequence("InGameCollapsed")
	end

	var_1_0._sequences.InGameCollapsed = var_1_21

	local var_1_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("InGameExpanded", var_1_22)

	local var_1_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		}
	}

	var_1_6:RegisterAnimationSequence("InGameExpanded", var_1_23)

	local var_1_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("InGameExpanded", var_1_24)

	local function var_1_25()
		var_1_4:AnimateSequence("InGameExpanded")
		var_1_6:AnimateSequence("InGameExpanded")
		var_1_9:AnimateSequence("InGameExpanded")
	end

	var_1_0._sequences.InGameExpanded = var_1_25

	local var_1_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("CollapsedSingle", var_1_26)

	local var_1_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_1_6:RegisterAnimationSequence("CollapsedSingle", var_1_27)

	local var_1_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("CollapsedSingle", var_1_28)

	local function var_1_29()
		var_1_4:AnimateSequence("CollapsedSingle")
		var_1_6:AnimateSequence("CollapsedSingle")
		var_1_9:AnimateSequence("CollapsedSingle")
	end

	var_1_0._sequences.CollapsedSingle = var_1_29

	local var_1_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("InGameExpandedInactive", var_1_30)

	local var_1_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("InGameExpandedInactive", var_1_31)

	local function var_1_32()
		var_1_4:AnimateSequence("InGameExpandedInactive")
		var_1_9:AnimateSequence("InGameExpandedInactive")
	end

	var_1_0._sequences.InGameExpandedInactive = var_1_32

	local var_1_33 = {
		{
			value = 0.85,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ExpandedInactive", var_1_33)

	local var_1_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_1_6:RegisterAnimationSequence("ExpandedInactive", var_1_34)

	local var_1_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("ExpandedInactive", var_1_35)

	local function var_1_36()
		var_1_4:AnimateSequence("ExpandedInactive")
		var_1_6:AnimateSequence("ExpandedInactive")
		var_1_9:AnimateSequence("ExpandedInactive")
	end

	var_1_0._sequences.ExpandedInactive = var_1_36

	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	return var_1_0
end

MenuBuilder.registerType("TextChatBody", TextChatBody)
LockTable(_M)
