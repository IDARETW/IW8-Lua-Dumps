module(..., package.seeall)

local var_0_0

local function var_0_1(arg_1_0)
	local var_1_0 = 50 * _1080p
	local var_1_1 = LAYOUT.GetTextWidth(arg_1_0.Text, arg_1_0.controllerIndex)
	local var_1_2, var_1_3, var_1_4, var_1_5 = arg_1_0.Text:getLocalRect()

	arg_1_0.WZWipBacker:SetRight(var_1_2 + var_1_1 + var_1_0)
end

local function var_0_2(arg_2_0, arg_2_1)
	assert(arg_2_1 and arg_2_1.desiredState, "You must provide the desired state (string) as a table property/value.")

	if arg_2_0._lastState ~= arg_2_1.desiredState then
		arg_2_0._lastState = arg_2_1.desiredState

		local var_2_0 = ""

		if arg_2_1.adjustDisplayIfAsianLanguage and (IsLanguageSimplifiedChinese() or IsLanguageKorean() or IsLanguageJapanese()) then
			var_2_0 = "Asian"
		end

		ACTIONS.AnimateSequence(arg_2_0, arg_2_1.desiredState .. var_2_0)
	end

	var_0_1(arg_2_0)
end

local function var_0_3(arg_3_0, arg_3_1)
	arg_3_0._selected = arg_3_1

	if arg_3_0._selected then
		arg_3_0:SetColors(true)
		var_0_2(arg_3_0, {
			desiredState = "Selected",
			adjustDisplayIfAsianLanguage = true
		})
	else
		arg_3_0:SetColors(false)
		var_0_2(arg_3_0, {
			desiredState = "Unselected"
		})
	end
end

local function var_0_4(arg_4_0, arg_4_1)
	if arg_4_1 then
		arg_4_0._theme = arg_4_1
	end
end

local function var_0_5(arg_5_0, arg_5_1)
	if not arg_5_0._theme then
		return
	end

	if arg_5_1 and arg_5_0._theme.selectedSwatch then
		if arg_5_0._theme.selectedTextSwatch then
			arg_5_0.Text:SetRGBFromTable(arg_5_0._theme.selectedTextSwatch, 0)
		else
			arg_5_0.Text:SetRGBFromTable(arg_5_0._theme.selectedSwatch, 0)
		end

		arg_5_0.Cap:SetRGBFromTable(arg_5_0._theme.selectedSwatch, 0)
		arg_5_0.WZWipBacker:SetRGBFromTable(arg_5_0._theme.selectedSwatch, 0)
	elseif not arg_5_1 and arg_5_0._theme.unselectedSwatch then
		if arg_5_0._theme.unselectedTextSwatch then
			arg_5_0.Text:SetRGBFromTable(arg_5_0._theme.unselectedTextSwatch, 0)
		else
			arg_5_0.Text:SetRGBFromTable(arg_5_0._theme.unselectedSwatch, 0)
		end

		arg_5_0.Cap:SetRGBFromTable(arg_5_0._theme.unselectedSwatch, 0)
		arg_5_0.WZWipBacker:SetRGBFromTable(arg_5_0._theme.unselectedSwatch, 0)
	end
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.SetSelected = var_0_3
	arg_6_0.controllerIndex = arg_6_1
	arg_6_0.ApplyTheme = var_0_4
	arg_6_0.SetColors = var_0_5
	arg_6_0._isEnabled = true

	arg_6_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if arg_6_0._selected then
			arg_6_0:SetColors(true)
			var_0_2(arg_6_0, {
				desiredState = "ButtonOverSelected",
				adjustDisplayIfAsianLanguage = true
			})
		else
			arg_6_0:SetColors(true)
			var_0_2(arg_6_0, {
				desiredState = "ButtonOverUnselected",
				adjustDisplayIfAsianLanguage = true
			})
		end
	end)
	arg_6_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		if arg_6_0._selected then
			arg_6_0:SetColors(true)
			var_0_2(arg_6_0, {
				desiredState = "Selected",
				adjustDisplayIfAsianLanguage = true
			})
		else
			arg_6_0:SetColors(false)
			var_0_2(arg_6_0, {
				desiredState = "Unselected"
			})
		end
	end)
	arg_6_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		arg_6_0:SetColors(false)
		var_0_2(arg_6_0, {
			desiredState = "ButtonOverDisabled"
		})
	end)
	arg_6_0:addEventHandler("button_disable", function(arg_10_0, arg_10_1)
		arg_6_0:SetColors(false)
		var_0_2(arg_6_0, {
			desiredState = "Disabled"
		})

		arg_6_0._isEnabled = false
		arg_6_0._selected = false
	end)
	arg_6_0:addEventHandler("button_enable", function(arg_11_0, arg_11_1)
		arg_6_0:SetColors(true)
		var_0_2(arg_6_0, {
			desiredState = "Enabled"
		})

		arg_6_0._isEnabled = true
	end)
end

function WZOperatorFilterSelectTextButton(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIButton.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 40 * _1080p)

	var_12_0.id = "WZOperatorFilterSelectTextButton"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "WZWipBacker"

	var_12_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
	var_12_4:SetAlpha(0, 0)
	var_12_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_12_4:Setup9SliceImage(_1080p * 71, _1080p * 8, 0.4800005, 0.3)
	var_12_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 260, _1080p * 3, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.WZWipBacker = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "Cap"

	var_12_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
	var_12_6:SetAlpha(0, 0)
	var_12_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 4, _1080p * 3, 0)
	var_12_0:addElement(var_12_6)

	var_12_0.Cap = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIStyledText.new()

	var_12_8.id = "Text"

	var_12_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_12_8:setText("", 0)
	var_12_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_8:SetWordWrap(false)
	var_12_8:SetAlignment(LUI.Alignment.Left)
	var_12_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 15, _1080p * 420, _1080p * -9, _1080p * 9)
	var_12_0:addElement(var_12_8)

	var_12_0.Text = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIImage.new()

	var_12_10.id = "FavoriteIcon"

	var_12_10:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_12_10:SetAlpha(0, 0)
	var_12_10:setImage(RegisterMaterial("star_favorite"), 0)
	var_12_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -29, _1080p * -5, _1080p * 6, _1080p * 30)
	var_12_0:addElement(var_12_10)

	var_12_0.FavoriteIcon = var_12_10

	local function var_12_11()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_11

	local var_12_12
	local var_12_13 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Enabled", var_12_13)

	local var_12_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_12_6:RegisterAnimationSequence("Enabled", var_12_14)

	local var_12_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("Enabled", var_12_15)

	local function var_12_16()
		var_12_4:AnimateSequence("Enabled")
		var_12_6:AnimateSequence("Enabled")
		var_12_8:AnimateSequence("Enabled")
	end

	var_12_0._sequences.Enabled = var_12_16

	local var_12_17
	local var_12_18 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Disabled", var_12_18)

	local var_12_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Disabled", var_12_19)

	local var_12_20 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		}
	}

	var_12_8:RegisterAnimationSequence("Disabled", var_12_20)

	local function var_12_21()
		var_12_4:AnimateSequence("Disabled")
		var_12_6:AnimateSequence("Disabled")
		var_12_8:AnimateSequence("Disabled")
	end

	var_12_0._sequences.Disabled = var_12_21

	local var_12_22
	local var_12_23 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_12_4:RegisterAnimationSequence("ButtonOverSelected", var_12_23)

	local var_12_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOverSelected", var_12_24)

	local var_12_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverSelected", var_12_25)

	local function var_12_26()
		var_12_4:AnimateSequence("ButtonOverSelected")
		var_12_6:AnimateSequence("ButtonOverSelected")
		var_12_8:AnimateSequence("ButtonOverSelected")
	end

	var_12_0._sequences.ButtonOverSelected = var_12_26

	local var_12_27
	local var_12_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Selected", var_12_28)

	local var_12_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Selected", var_12_29)

	local var_12_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("Selected", var_12_30)

	local function var_12_31()
		var_12_4:AnimateSequence("Selected")
		var_12_6:AnimateSequence("Selected")
		var_12_8:AnimateSequence("Selected")
	end

	var_12_0._sequences.Selected = var_12_31

	local var_12_32
	local var_12_33 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Unselected", var_12_33)

	local var_12_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Unselected", var_12_34)

	local var_12_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("Unselected", var_12_35)

	local function var_12_36()
		var_12_4:AnimateSequence("Unselected")
		var_12_6:AnimateSequence("Unselected")
		var_12_8:AnimateSequence("Unselected")
	end

	var_12_0._sequences.Unselected = var_12_36

	local var_12_37
	local var_12_38 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
		}
	}

	var_12_4:RegisterAnimationSequence("ButtonOverUnselected", var_12_38)

	local var_12_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOverUnselected", var_12_39)

	local var_12_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverUnselected", var_12_40)

	local function var_12_41()
		var_12_4:AnimateSequence("ButtonOverUnselected")
		var_12_6:AnimateSequence("ButtonOverUnselected")
		var_12_8:AnimateSequence("ButtonOverUnselected")
	end

	var_12_0._sequences.ButtonOverUnselected = var_12_41

	local var_12_42
	local var_12_43 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ButtonOverDisabled", var_12_43)

	local var_12_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOverDisabled", var_12_44)

	local var_12_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverDisabled", var_12_45)

	local function var_12_46()
		var_12_4:AnimateSequence("ButtonOverDisabled")
		var_12_6:AnimateSequence("ButtonOverDisabled")
		var_12_8:AnimateSequence("ButtonOverDisabled")
	end

	var_12_0._sequences.ButtonOverDisabled = var_12_46

	local var_12_47
	local var_12_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.splashNotifications.warning
		},
		{
			value = 15066083,
			duration = 1400,
			property = TWEEN_PROPERTY.RGB,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("PulseWarning", var_12_48)

	local function var_12_49()
		var_12_8:AnimateSequence("PulseWarning")
	end

	var_12_0._sequences.PulseWarning = var_12_49

	local var_12_50
	local var_12_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.bindingSuccess
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1333,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("PulseConfirm", var_12_51)

	local function var_12_52()
		var_12_8:AnimateSequence("PulseConfirm")
	end

	var_12_0._sequences.PulseConfirm = var_12_52

	local var_12_53
	local var_12_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("SetFavoriteIcon", var_12_54)

	local function var_12_55()
		var_12_10:AnimateSequence("SetFavoriteIcon")
	end

	var_12_0._sequences.SetFavoriteIcon = var_12_55

	local var_12_56
	local var_12_57 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		}
	}

	var_12_4:RegisterAnimationSequence("ButtonOverSelectedAsian", var_12_57)

	local var_12_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOverSelectedAsian", var_12_58)

	local var_12_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverSelectedAsian", var_12_59)

	local function var_12_60()
		var_12_4:AnimateSequence("ButtonOverSelectedAsian")
		var_12_6:AnimateSequence("ButtonOverSelectedAsian")
		var_12_8:AnimateSequence("ButtonOverSelectedAsian")
	end

	var_12_0._sequences.ButtonOverSelectedAsian = var_12_60

	local var_12_61
	local var_12_62 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
		}
	}

	var_12_4:RegisterAnimationSequence("ButtonOverUnselectedAsian", var_12_62)

	local var_12_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOverUnselectedAsian", var_12_63)

	local var_12_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverUnselectedAsian", var_12_64)

	local function var_12_65()
		var_12_4:AnimateSequence("ButtonOverUnselectedAsian")
		var_12_6:AnimateSequence("ButtonOverUnselectedAsian")
		var_12_8:AnimateSequence("ButtonOverUnselectedAsian")
	end

	var_12_0._sequences.ButtonOverUnselectedAsian = var_12_65

	local var_12_66
	local var_12_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -4
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("SelectedAsian", var_12_67)

	local var_12_68 = {
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
			value = _1080p * -4
		}
	}

	var_12_6:RegisterAnimationSequence("SelectedAsian", var_12_68)

	local var_12_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("SelectedAsian", var_12_69)

	local function var_12_70()
		var_12_4:AnimateSequence("SelectedAsian")
		var_12_6:AnimateSequence("SelectedAsian")
		var_12_8:AnimateSequence("SelectedAsian")
	end

	var_12_0._sequences.SelectedAsian = var_12_70

	local var_12_71
	local var_12_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.bindingSuccess
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.RGB,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("PulseConfirmSelected", var_12_72)

	local function var_12_73()
		var_12_8:AnimateSequence("PulseConfirmSelected")
	end

	var_12_0._sequences.PulseConfirmSelected = var_12_73

	var_0_6(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("WZOperatorFilterSelectTextButton", WZOperatorFilterSelectTextButton)
LockTable(_M)
