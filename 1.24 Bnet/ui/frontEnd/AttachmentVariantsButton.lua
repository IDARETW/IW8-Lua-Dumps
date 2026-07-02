module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._attachmentData = arg_1_3

	local var_1_0 = #arg_1_3.variants - 1

	arg_1_0:SetAlpha(arg_1_1 and 1 or 0)
	arg_1_0:SetHandleMouse(arg_1_1)
	arg_1_0:SetMouseFocusBlocker(not arg_1_1)
	arg_1_0:SetButtonDisabled(arg_1_2)
	arg_1_0.VariantCount:setText(var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0

	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")
		ACTIONS.AnimateSequence(arg_3_0, "Expand")
		arg_2_0:dispatchEventToCurrentMenu({
			name = "update_showcase",
			attachmentData = arg_3_0._attachmentData
		})
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
		ACTIONS.AnimateSequence(arg_4_0, "Collapse")
	end)
end

function AttachmentVariantsButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 62 * _1080p, 0, 62 * _1080p)

	var_5_0.id = "AttachmentVariantsButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "LoadoutItemButtonBackground"

	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.LoadoutItemButtonBackground = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "VariantIcon"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_6:setImage(RegisterMaterial("icon_menu_variant"), 0)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -14, _1080p * 14, _1080p * -24, _1080p * 4)
	var_5_0:addElement(var_5_6)

	var_5_0.VariantIcon = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "VariantCount"

	var_5_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_8:setText("99", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -42, _1080p * -20, _1080p * 6, _1080p * 28)
	var_5_0:addElement(var_5_8)

	var_5_0.VariantCount = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Arrow"

	var_5_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_10:SetAlpha(0.8, 0)
	var_5_10:setImage(RegisterMaterial("wdg_button_arrow_tip"), 0)
	var_5_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -10, _1080p * -3, _1080p * -6, _1080p * 6)
	var_5_0:addElement(var_5_10)

	var_5_0.Arrow = var_5_10

	local var_5_11
	local var_5_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_6:RegisterAnimationSequence("DefaultSequence", var_5_12)

	local var_5_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_5_8:RegisterAnimationSequence("DefaultSequence", var_5_13)

	local var_5_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("DefaultSequence", var_5_14)

	local function var_5_15()
		var_5_6:AnimateSequence("DefaultSequence")
		var_5_8:AnimateSequence("DefaultSequence")
		var_5_10:AnimateSequence("DefaultSequence")
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16
	local var_5_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Collapse", var_5_17)

	local var_5_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_5_8:RegisterAnimationSequence("Collapse", var_5_18)

	local var_5_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Collapse", var_5_19)

	local function var_5_20()
		var_5_6:AnimateSequence("Collapse")
		var_5_8:AnimateSequence("Collapse")
		var_5_10:AnimateSequence("Collapse")
	end

	var_5_0._sequences.Collapse = var_5_20

	local var_5_21
	local var_5_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Expand", var_5_22)

	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_5_8:RegisterAnimationSequence("Expand", var_5_23)

	local var_5_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Expand", var_5_24)

	local function var_5_25()
		var_5_6:AnimateSequence("Expand")
		var_5_8:AnimateSequence("Expand")
		var_5_10:AnimateSequence("Expand")
	end

	var_5_0._sequences.Expand = var_5_25

	local var_5_26
	local var_5_27 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_27)

	local var_5_28 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_28)

	local function var_5_29()
		var_5_6:AnimateSequence("ButtonOver")
		var_5_8:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_29

	local var_5_30
	local var_5_31 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonUp", var_5_31)

	local var_5_32 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_32)

	local function var_5_33()
		var_5_6:AnimateSequence("ButtonUp")
		var_5_8:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_33

	var_5_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_0_1(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "DefaultSequence")

	return var_5_0
end

MenuBuilder.registerType("AttachmentVariantsButton", AttachmentVariantsButton)
LockTable(_M)
