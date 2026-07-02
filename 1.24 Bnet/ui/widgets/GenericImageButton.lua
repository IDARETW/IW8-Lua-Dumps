module(..., package.seeall)

function GenericImageButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 140 * _1080p, 0, 140 * _1080p)

	var_1_0.id = "GenericImageButton"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "LoadoutItemButtonBackground"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.LoadoutItemButtonBackground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Icon"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -36, _1080p * 36, _1080p * -26, _1080p * 46)
	var_1_0:addElement(var_1_6)

	var_1_0.Icon = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "ItemName"

	var_1_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 7, _1080p * -7, _1080p * 7, _1080p * 25)
	var_1_0:addElement(var_1_8)

	var_1_0.ItemName = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Lock"

	var_1_10:SetAlpha(0, 0)
	var_1_10:setImage(RegisterMaterial("cp_wepbuild_lock"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 51, _1080p * 83, _1080p * 64, _1080p * 96)
	var_1_0:addElement(var_1_10)

	var_1_0.Lock = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_12)

	local function var_1_13()
		var_1_8:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_13

	local var_1_14 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_14)

	local var_1_15 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_15)

	local function var_1_16()
		var_1_6:AnimateSequence("ButtonUp")
		var_1_8:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_16

	local var_1_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Disabled", var_1_17)

	local function var_1_18()
		var_1_10:AnimateSequence("Disabled")
	end

	var_1_0._sequences.Disabled = var_1_18

	local var_1_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Enabled", var_1_19)

	local function var_1_20()
		var_1_10:AnimateSequence("Enabled")
	end

	var_1_0._sequences.Enabled = var_1_20

	local var_1_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -36
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

	var_1_6:RegisterAnimationSequence("WithText", var_1_21)

	local var_1_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("WithText", var_1_22)

	local var_1_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 96
		}
	}

	var_1_10:RegisterAnimationSequence("WithText", var_1_23)

	local function var_1_24()
		var_1_6:AnimateSequence("WithText")
		var_1_8:AnimateSequence("WithText")
		var_1_10:AnimateSequence("WithText")
	end

	var_1_0._sequences.WithText = var_1_24

	local var_1_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -14
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -14
		}
	}

	var_1_6:RegisterAnimationSequence("NoText", var_1_25)

	local var_1_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("NoText", var_1_26)

	local var_1_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 86
		}
	}

	var_1_10:RegisterAnimationSequence("NoText", var_1_27)

	local function var_1_28()
		var_1_6:AnimateSequence("NoText")
		var_1_8:AnimateSequence("NoText")
		var_1_10:AnimateSequence("NoText")
	end

	var_1_0._sequences.NoText = var_1_28

	var_1_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
		ACTIONS.AnimateSequence(var_1_0, "Enabled")
	end)
	var_1_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
		ACTIONS.AnimateSequence(var_1_0, "Enabled")
	end)
	var_1_0:addEventHandler("button_over_disable", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Disabled")
	end)
	var_1_0:addEventHandler("button_disable", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Disabled")
	end)

	return var_1_0
end

MenuBuilder.registerType("GenericImageButton", GenericImageButton)
LockTable(_M)
