module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0:SetHandleMouseButton(true)
	arg_1_0:addEventHandler("gain_focus", function(arg_2_0, arg_2_1)
		if not arg_2_0:IsDisabled() then
			ACTIONS.AnimateSequence(arg_2_0, "GainFocus")
			ACTIONS.AnimateSequenceByElement(arg_2_0, {
				elementPath = "self.GenericInnerButtonBackground",
				sequenceName = "GainFocus",
				elementName = "GenericInnerButtonBackground"
			})
		end
	end)
	arg_1_0:addEventHandler("gamepad_button", function(arg_3_0, arg_3_1)
		if arg_3_1.button == "down" or arg_3_1.button == "up" then
			arg_3_0.Text:processEvent({
				active = true,
				name = "text_edit_complete"
			})
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function GenericInnerButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 54 * _1080p)

	var_4_0.id = "GenericInnerButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("GenericInnerButtonBackground", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "GenericInnerButtonBackground"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.GenericInnerButtonBackground = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "Text"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetWordWrap(false)
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_6:SetUseEllipses(ELLIPSES.enabled)
	var_4_6:SetStartupDelay(1000)
	var_4_6:SetLineHoldTime(400)
	var_4_6:SetAnimMoveTime(0)
	var_4_6:SetAnimMoveSpeed(150)
	var_4_6:SetEndDelay(400)
	var_4_6:SetCrossfadeTime(0)
	var_4_6:SetFadeInTime(300)
	var_4_6:SetFadeOutTime(300)
	var_4_6:SetMaxVisibleLines(1)
	var_4_6:SetOutlineRGBFromInt(0, 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 5, _1080p * -5, _1080p * -10, _1080p * 10)
	var_4_0:addElement(var_4_6)

	var_4_0.Text = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Pip"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 18, _1080p * 19)
	var_4_0:addElement(var_4_8)

	var_4_0.Pip = var_4_8

	local var_4_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_4_6:RegisterAnimationSequence("DefaultSequence", var_4_9)

	local function var_4_10()
		var_4_6:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_10

	local var_4_11 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_11)

	local var_4_12 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOver", var_4_12)

	local function var_4_13()
		var_4_6:AnimateSequence("ButtonOver")
		var_4_8:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_13

	local var_4_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_14)

	local var_4_15 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUp", var_4_15)

	local function var_4_16()
		var_4_6:AnimateSequence("ButtonUp")
		var_4_8:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_16

	local function var_4_17()
		return
	end

	var_4_0._sequences.GainFocus = var_4_17

	local function var_4_18()
		return
	end

	var_4_0._sequences.LoseFocus = var_4_18

	local var_4_19 = {
		{
			value = 0.65,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("NotSelected", var_4_19)

	local var_4_20 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("NotSelected", var_4_20)

	local var_4_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("NotSelected", var_4_21)

	local function var_4_22()
		var_4_4:AnimateSequence("NotSelected")
		var_4_6:AnimateSequence("NotSelected")
		var_4_8:AnimateSequence("NotSelected")
	end

	var_4_0._sequences.NotSelected = var_4_22

	local function var_4_23()
		return
	end

	var_4_0._sequences.NoLeftLine = var_4_23

	local var_4_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Selected", var_4_24)

	local var_4_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Selected", var_4_25)

	local function var_4_26()
		var_4_6:AnimateSequence("Selected")
		var_4_8:AnimateSequence("Selected")
	end

	var_4_0._sequences.Selected = var_4_26

	local var_4_27 = {
		{
			value = 5614798,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOverNotSelected", var_4_27)

	local var_4_28 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOverNotSelected", var_4_28)

	local function var_4_29()
		var_4_6:AnimateSequence("ButtonOverNotSelected")
		var_4_8:AnimateSequence("ButtonOverNotSelected")
	end

	var_4_0._sequences.ButtonOverNotSelected = var_4_29

	local var_4_30 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 0.6,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUpNotSelected", var_4_30)

	local var_4_31 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUpNotSelected", var_4_31)

	local function var_4_32()
		var_4_6:AnimateSequence("ButtonUpNotSelected")
		var_4_8:AnimateSequence("ButtonUpNotSelected")
	end

	var_4_0._sequences.ButtonUpNotSelected = var_4_32

	local var_4_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUpActive", var_4_33)

	local var_4_34 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUpActive", var_4_34)

	local function var_4_35()
		var_4_6:AnimateSequence("ButtonUpActive")
		var_4_8:AnimateSequence("ButtonUpActive")
	end

	var_4_0._sequences.ButtonUpActive = var_4_35

	local var_4_36 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOverActive", var_4_36)

	local var_4_37 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOverActive", var_4_37)

	local function var_4_38()
		var_4_6:AnimateSequence("ButtonOverActive")
		var_4_8:AnimateSequence("ButtonOverActive")
	end

	var_4_0._sequences.ButtonOverActive = var_4_38

	local var_4_39 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Disabled", var_4_39)

	local function var_4_40()
		var_4_6:AnimateSequence("Disabled")
	end

	var_4_0._sequences.Disabled = var_4_40

	local var_4_41 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 0.6,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUpActiveNotSelected", var_4_41)

	local var_4_42 = {
		{
			duration = 60,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		},
		{
			duration = 60,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUpActiveNotSelected", var_4_42)

	local function var_4_43()
		var_4_6:AnimateSequence("ButtonUpActiveNotSelected")
		var_4_8:AnimateSequence("ButtonUpActiveNotSelected")
	end

	var_4_0._sequences.ButtonUpActiveNotSelected = var_4_43

	local var_4_44 = {
		{
			value = 5614798,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOverActiveNotSelected", var_4_44)

	local var_4_45 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOverActiveNotSelected", var_4_45)

	local function var_4_46()
		var_4_6:AnimateSequence("ButtonOverActiveNotSelected")
		var_4_8:AnimateSequence("ButtonOverActiveNotSelected")
	end

	var_4_0._sequences.ButtonOverActiveNotSelected = var_4_46

	local var_4_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_47)

	local function var_4_48()
		var_4_6:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_48

	var_4_0:addEventHandler("lose_focus", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "LoseFocus")
		ACTIONS.AnimateSequenceByElement(var_4_0, {
			elementPath = "self.GenericInnerButtonBackground",
			sequenceName = "LoseFocus",
			elementName = "GenericInnerButtonBackground"
		})
	end)
	var_4_0:addEventHandler("enable", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("GenericInnerButton", GenericInnerButton)
LockTable(_M)
