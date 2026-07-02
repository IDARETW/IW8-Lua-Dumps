module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("gain_focus", function(arg_2_0, arg_2_1)
		if not arg_2_1.controller then
			local var_2_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, "GainFocus")
		ACTIONS.AnimateSequenceByElement(arg_1_0, {
			elementPath = "self.GenericInnerButtonBackground",
			sequenceName = "GainFocus",
			elementName = "GenericInnerButtonBackground"
		})
	end)
	arg_1_0:addEventHandler("lose_focus", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, "LoseFocus")
		ACTIONS.AnimateSequenceByElement(arg_1_0, {
			elementPath = "self.GenericInnerButtonBackground",
			sequenceName = "LoseFocus",
			elementName = "GenericInnerButtonBackground"
		})
	end)
	arg_1_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, arg_1_0._wzTheme and "WZButtonOver" or "ButtonOver")

		if arg_1_0._wzTheme then
			arg_1_0.GenericInnerButtonBackground.Background:SetRGBFromTable(SWATCHES.genericButton.warzoneTextFocus)
		end
	end)
	arg_1_0:addEventHandler("active", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, "Active")
	end)
	arg_1_0:addEventHandler("button_over_active", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, ACTIONS.AnimateSequence(arg_1_0, arg_1_0._wzTheme and "WZButtonOverActive" or "ButtonOverActive"))

		if arg_1_0._wzTheme then
			arg_1_0.GenericInnerButtonBackground.Background:SetRGBFromTable(SWATCHES.genericButton.warzoneTextFocus)
		end
	end)
	arg_1_0:addEventHandler("button_active", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, "ButtonUpActive")
	end)
end

function GenericIconInnerButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 36 * _1080p, 0, 36 * _1080p)

	var_8_0.id = "GenericIconInnerButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericInnerButtonBackground", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "GenericInnerButtonBackground"

	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.GenericInnerButtonBackground = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Icon"

	var_8_6:SetAlpha(0, 0)
	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -11, _1080p * 21)
	var_8_0:addElement(var_8_6)

	var_8_0.Icon = var_8_6

	local var_8_7
	local var_8_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		}
	}

	var_8_6:RegisterAnimationSequence("DefaultSequence", var_8_8)

	local function var_8_9()
		var_8_6:AnimateSequence("DefaultSequence")
	end

	var_8_0._sequences.DefaultSequence = var_8_9

	local function var_8_10()
		return
	end

	var_8_0._sequences.Locked = var_8_10

	local function var_8_11()
		return
	end

	var_8_0._sequences.NewNotification = var_8_11

	local var_8_12
	local var_8_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_13)

	local function var_8_14()
		var_8_6:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_14

	local var_8_15
	local var_8_16 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_16)

	local function var_8_17()
		var_8_6:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_17

	local function var_8_18()
		return
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_18

	local function var_8_19()
		return
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_19

	local function var_8_20()
		return
	end

	var_8_0._sequences.GainFocus = var_8_20

	local function var_8_21()
		return
	end

	var_8_0._sequences.LoseFocus = var_8_21

	local var_8_22
	local var_8_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		}
	}

	var_8_6:RegisterAnimationSequence("Active", var_8_23)

	local function var_8_24()
		var_8_6:AnimateSequence("Active")
	end

	var_8_0._sequences.Active = var_8_24

	local var_8_25
	local var_8_26 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOverActive", var_8_26)

	local function var_8_27()
		var_8_6:AnimateSequence("ButtonOverActive")
	end

	var_8_0._sequences.ButtonOverActive = var_8_27

	local var_8_28
	local var_8_29 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpActive", var_8_29)

	local function var_8_30()
		var_8_6:AnimateSequence("ButtonUpActive")
	end

	var_8_0._sequences.ButtonUpActive = var_8_30

	local var_8_31
	local var_8_32 = {
		{
			value = -0.15,
			duration = 80,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_8_6:RegisterAnimationSequence("Down", var_8_32)

	local function var_8_33()
		var_8_6:AnimateSequence("Down")
	end

	var_8_0._sequences.Down = var_8_33

	local var_8_34
	local var_8_35 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_8_6:RegisterAnimationSequence("Up", var_8_35)

	local function var_8_36()
		var_8_6:AnimateSequence("Up")
	end

	var_8_0._sequences.Up = var_8_36

	local var_8_37
	local var_8_38 = {
		{
			value = -0.15,
			duration = 80,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_8_6:RegisterAnimationSequence("DownUp", var_8_38)

	local function var_8_39()
		var_8_6:AnimateSequence("DownUp")
	end

	var_8_0._sequences.DownUp = var_8_39

	local var_8_40
	local var_8_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZButtonOverActive", var_8_41)

	local function var_8_42()
		var_8_6:AnimateSequence("WZButtonOverActive")
	end

	var_8_0._sequences.WZButtonOverActive = var_8_42

	local var_8_43
	local var_8_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		}
	}

	var_8_6:RegisterAnimationSequence("WZButtonOver", var_8_44)

	local function var_8_45()
		var_8_6:AnimateSequence("WZButtonOver")
	end

	var_8_0._sequences.WZButtonOver = var_8_45

	var_0_0(var_8_0, var_8_1, arg_8_1)
	ACTIONS.AnimateSequence(var_8_0, "DefaultSequence")

	return var_8_0
end

MenuBuilder.registerType("GenericIconInnerButton", GenericIconInnerButton)
LockTable(_M)
