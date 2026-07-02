module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LUI.Alignment.Left

	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		arg_1_0.Background:SetupButton(arg_1_0.Text, arg_1_0.Text:getText(), var_1_0)
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_3_0, arg_3_1)
		arg_1_0.Background:SetupButton(arg_1_0.Text, arg_1_0.Text:getText(), var_1_0)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function MPMenuButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 40 * _1080p)

	var_4_0.id = "MPMenuButton"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

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
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "Text"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_6:SetUseEllipses(ELLIPSES.enabled_default)
	var_4_6:SetShadowRGBFromInt(0, 0)
	var_4_6:SetOutlineRGBFromInt(0, 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_6)

	var_4_0.Text = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Lock"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_8:SetAlpha(0, 0)
	var_4_8:setImage(RegisterMaterial("icon_waypoint_locked"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -45, _1080p * 11, _1080p * -24, _1080p * 32)
	var_4_0:addElement(var_4_8)

	var_4_0.Lock = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "Description"

	var_4_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_10:SetAlpha(0, 0)
	var_4_10:setText("", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetShadowRGBFromInt(0, 0)
	var_4_10:SetOutlineRGBFromInt(0, 0)
	var_4_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * 11, _1080p * 411, _1080p * -10, _1080p * 10)
	var_4_0:addElement(var_4_10)

	var_4_0.Description = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_12)

	local var_4_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOver", var_4_13)

	local var_4_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 3000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("ButtonOver", var_4_14)

	local function var_4_15()
		var_4_6:AnimateSequence("ButtonOver")
		var_4_8:AnimateSequence("ButtonOver")
		var_4_10:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_15

	local var_4_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_16)

	local var_4_17 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUp", var_4_17)

	local var_4_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("ButtonUp", var_4_18)

	local function var_4_19()
		var_4_6:AnimateSequence("ButtonUp")
		var_4_8:AnimateSequence("ButtonUp")
		var_4_10:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_19

	local var_4_20 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_6:RegisterAnimationSequence("Locked", var_4_20)

	local var_4_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Locked", var_4_21)

	local function var_4_22()
		var_4_6:AnimateSequence("Locked")
		var_4_8:AnimateSequence("Locked")
	end

	var_4_0._sequences.Locked = var_4_22

	local var_4_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOverDisabled", var_4_23)

	local var_4_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 5000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("ButtonOverDisabled", var_4_24)

	local function var_4_25()
		var_4_6:AnimateSequence("ButtonOverDisabled")
		var_4_10:AnimateSequence("ButtonOverDisabled")
	end

	var_4_0._sequences.ButtonOverDisabled = var_4_25

	local var_4_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUpDisabled", var_4_26)

	local var_4_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("ButtonUpDisabled", var_4_27)

	local function var_4_28()
		var_4_6:AnimateSequence("ButtonUpDisabled")
		var_4_10:AnimateSequence("ButtonUpDisabled")
	end

	var_4_0._sequences.ButtonUpDisabled = var_4_28

	local var_4_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_29)

	local var_4_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		}
	}

	var_4_10:RegisterAnimationSequence("AR", var_4_30)

	local function var_4_31()
		var_4_6:AnimateSequence("AR")
		var_4_10:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_31

	var_4_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonOver")
	end)
	var_4_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonUp")
	end)
	var_4_0:addEventHandler("button_disable", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonUpDisabled")
	end)
	var_4_0:addEventHandler("button_over_disable", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonOverDisabled")
	end)
	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MPMenuButton", MPMenuButton)
LockTable(_M)
