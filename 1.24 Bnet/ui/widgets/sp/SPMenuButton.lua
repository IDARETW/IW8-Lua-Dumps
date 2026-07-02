module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._disabledDescriptionText = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetDisabledText = var_0_0
	arg_2_0._disabledDescriptionText = ""

	local function var_2_0(arg_3_0)
		arg_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 100 * _1080p, 150)
		arg_3_0.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end

	local function var_2_1(arg_4_0)
		arg_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
		arg_4_0.Text:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	end

	arg_2_0:addEventHandler("disable", function(arg_5_0, arg_5_1)
		arg_2_0._defaultDescriptionText = arg_2_0.Description:getText()

		arg_2_0.Description:setText(arg_2_0._disabledDescriptionText)
		ACTIONS.AnimateSequence(arg_5_0, "Disable")
	end)
	arg_2_0:addEventHandler("enable", function(arg_6_0, arg_6_1)
		arg_2_0.Description:setText(arg_2_0._defaultDescriptionText)
		ACTIONS.AnimateSequence(arg_6_0, "Enable")
	end)
	arg_2_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if not LUI.IsLastInputMouseNavigation(arg_2_1) then
			var_2_0(arg_7_0)
			ACTIONS.AnimateSequence(arg_7_0, "ButtonOver")
		else
			ACTIONS.AnimateSequence(arg_7_0, "ButtonOverKBM")
		end

		arg_7_0.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end)
	arg_2_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		var_2_1(arg_8_0)
		ACTIONS.AnimateSequence(arg_8_0, "ButtonUp")
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		if not LUI.IsLastInputMouseNavigation(arg_2_1) then
			var_2_0(arg_9_0)
			ACTIONS.AnimateSequence(arg_9_0, "ButtonOverDisabled")
		else
			ACTIONS.AnimateSequence(arg_9_0, "ButtonOverDisabledKBM")
		end
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_10_0, arg_10_1)
		var_2_1(arg_10_0)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function SPMenuButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 100 * _1080p)

	var_11_0.id = "SPMenuButton"
	var_11_0._animationSets = {}
	var_11_0._sequences = {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "Background"

	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.Background = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIStyledText.new()

	var_11_6.id = "Text"

	var_11_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_6:setText("", 0)
	var_11_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_6:SetAlignment(LUI.Alignment.Left)
	var_11_6:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_11_6:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 380, _1080p * -15, _1080p * 15)
	var_11_0:addElement(var_11_6)

	var_11_0.Text = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "Lock"

	var_11_8:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_11_8:SetAlpha(0, 0)
	var_11_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_11_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -50, _1080p * -10, _1080p * -20, _1080p * 20)
	var_11_0:addElement(var_11_8)

	var_11_0.Lock = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIStyledText.new()

	var_11_10.id = "Description"

	var_11_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_10:SetAlpha(0, 0)
	var_11_10:setText("", 0)
	var_11_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_10:SetAlignment(LUI.Alignment.Left)
	var_11_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -411, _1080p * -50, 0, _1080p * 20)
	var_11_0:addElement(var_11_10)

	var_11_0.Description = var_11_10

	local function var_11_11()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_11

	local var_11_12 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonOver", var_11_12)

	local var_11_13 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOver", var_11_13)

	local function var_11_14()
		var_11_6:AnimateSequence("ButtonOver")
		var_11_10:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_14

	local var_11_15 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonUp", var_11_15)

	local var_11_16 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUp", var_11_16)

	local function var_11_17()
		var_11_6:AnimateSequence("ButtonUp")
		var_11_10:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_17

	local var_11_18 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonOverDisabled", var_11_18)

	local var_11_19 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOverDisabled", var_11_19)

	local function var_11_20()
		var_11_6:AnimateSequence("ButtonOverDisabled")
		var_11_10:AnimateSequence("ButtonOverDisabled")
	end

	var_11_0._sequences.ButtonOverDisabled = var_11_20

	local var_11_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonUpDisabled", var_11_21)

	local var_11_22 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpDisabled", var_11_22)

	local function var_11_23()
		var_11_6:AnimateSequence("ButtonUpDisabled")
		var_11_10:AnimateSequence("ButtonUpDisabled")
	end

	var_11_0._sequences.ButtonUpDisabled = var_11_23

	local var_11_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("Disable", var_11_24)

	local function var_11_25()
		var_11_8:AnimateSequence("Disable")
	end

	var_11_0._sequences.Disable = var_11_25

	local var_11_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("Enable", var_11_26)

	local function var_11_27()
		var_11_8:AnimateSequence("Enable")
	end

	var_11_0._sequences.Enable = var_11_27

	local var_11_28 = {
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonOverKBM", var_11_28)

	local var_11_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOverKBM", var_11_29)

	local function var_11_30()
		var_11_6:AnimateSequence("ButtonOverKBM")
		var_11_10:AnimateSequence("ButtonOverKBM")
	end

	var_11_0._sequences.ButtonOverKBM = var_11_30

	local var_11_31 = {
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_11_31)

	local var_11_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOverDisabledKBM", var_11_32)

	local function var_11_33()
		var_11_6:AnimateSequence("ButtonOverDisabledKBM")
		var_11_10:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_11_0._sequences.ButtonOverDisabledKBM = var_11_33

	local var_11_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_11_6:RegisterAnimationSequence("AR", var_11_34)

	local var_11_35 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -370
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -104
		}
	}

	var_11_10:RegisterAnimationSequence("AR", var_11_35)

	local function var_11_36()
		var_11_6:AnimateSequence("AR")
		var_11_10:AnimateSequence("AR")
	end

	var_11_0._sequences.AR = var_11_36

	var_11_0:addEventHandler("button_disable", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_11_1
		end

		ACTIONS.AnimateSequence(var_11_0, "ButtonUpDisabled")
	end)
	var_0_1(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("SPMenuButton", SPMenuButton)
LockTable(_M)
