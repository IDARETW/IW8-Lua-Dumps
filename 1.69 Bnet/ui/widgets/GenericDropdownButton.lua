module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		assert(arg_1_0._sequences[arg_1_1], "Missing anim " .. arg_1_1)
		WZWIP.AnimateThemeElement(arg_1_0, arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:addEventHandler("dropdown_opened", function(arg_3_0, arg_3_1)
		var_0_0(arg_3_0, "Opened")
	end)
	arg_2_0:addEventHandler("dropdown_closed", function(arg_4_0, arg_4_1)
		var_0_0(arg_4_0, "Closed")
	end)
	arg_2_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		var_0_0(arg_5_0, "ButtonOver")

		if arg_5_0.Dropdown.dropdownButton then
			var_0_0(arg_5_0.Dropdown.dropdownButton, "ButtonOver")
		end
	end)
	arg_2_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		var_0_0(arg_6_0, "ButtonUp")

		if arg_6_0.Dropdown.dropdownButton then
			var_0_0(arg_6_0.Dropdown.dropdownButton, "ButtonUp")
		end

		if arg_6_0.MoreInfoButton then
			var_0_0(arg_6_0.MoreInfoButton, "ButtonUp")
		end
	end)
	arg_2_0:addEventHandler("active", function(arg_7_0, arg_7_1)
		var_0_0(arg_7_0, "Active")
	end)
	arg_2_0:addEventHandler("button_over_active", function(arg_8_0, arg_8_1)
		var_0_0(arg_8_0, "ButtonOverActive")

		if arg_8_0.Dropdown.dropdownButton then
			var_0_0(arg_8_0.Dropdown.dropdownButton, "ButtonOverActive")
		end

		if arg_8_0.MoreInfoButton then
			var_0_0(arg_8_0.MoreInfoButton, "ButtonOver")
		end
	end)
	arg_2_0:addEventHandler("button_active", function(arg_9_0, arg_9_1)
		var_0_0(arg_9_0, "ButtonUpActive")

		if arg_9_0.Dropdown.dropdownButton then
			var_0_0(arg_9_0.Dropdown.dropdownButton, "ButtonUpActive")
		end

		if arg_9_0.MoreInfoButton then
			var_0_0(arg_9_0.MoreInfoButton, "ButtonUp")
		end
	end)
	arg_2_0:addEventHandler("disable_active", function(arg_10_0, arg_10_1)
		var_0_0(arg_10_0, "DisabledActive")
	end)
	arg_2_0:addEventHandler("button_over_disable_active", function(arg_11_0, arg_11_1)
		var_0_0(arg_11_0, "ButtonOverDisabledActive")
	end)
	arg_2_0:addEventHandler("button_disable_active", function(arg_12_0, arg_12_1)
		var_0_0(arg_12_0, "ButtonUpDisabledActive")
	end)
	arg_2_0:addEventHandler("disable", function(arg_13_0, arg_13_1)
		var_0_0(arg_13_0, "Disabled")

		if arg_13_0.Dropdown.dropdownButton then
			var_0_0(arg_13_0.Dropdown.dropdownButton, "Disabled")
		end
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_14_0, arg_14_1)
		var_0_0(arg_14_0, "ButtonOverDisabled")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_15_0, arg_15_1)
		var_0_0(arg_15_0, "ButtonUpDisabled")
	end)
	arg_2_0:addEventHandler("button_action", function(arg_16_0, arg_16_1)
		if not arg_16_0:IsActive() then
			arg_16_0:dispatchEventToParent({
				name = "request_active",
				target = arg_16_0
			})

			return true
		else
			var_0_0(arg_16_0, "DownUp")
		end

		if arg_16_1.mouse then
			return true
		end
	end)
	arg_2_0:addEventHandler("button_action_disable", function(arg_17_0, arg_17_1)
		arg_17_0:dispatchEventToParent({
			name = "request_active",
			target = arg_17_0
		})
	end)
	arg_2_0:addEventHandler("setup_button_data_completed", function(arg_18_0, arg_18_1)
		arg_2_0.Dropdown.dropdownButton:addEventHandler("leftmousedown", function(arg_19_0, arg_19_1)
			if arg_19_0:isInFocus() then
				local var_19_0 = arg_19_0:getParent():getParent()

				var_0_0(var_19_0, "Down")

				return true
			end
		end)
		arg_2_0.Dropdown.dropdownButton:addEventHandler("leftmouseup", function(arg_20_0, arg_20_1)
			if arg_20_0:isInFocus() then
				local var_20_0 = arg_20_0:getParent():getParent()

				var_0_0(var_20_0, "Up")

				return true
			end
		end)
	end)

	if arg_2_0.MoreInfoButton then
		arg_2_0.MoreInfoButton:addEventHandler("leftmouseup", function(arg_21_0, arg_21_1)
			if arg_21_1.inside and arg_21_0:isInFocus() then
				arg_2_0:customPreviewButtonAction(arg_21_1.controller)
			end
		end)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

local function var_0_2(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0._needMoreInfoInnerButton = arg_22_2.needMoreInfoInnerButton
end

function GenericDropdownButton(arg_23_0, arg_23_1)
	local var_23_0 = LUI.UIButton.new()

	var_23_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_23_0.id = "GenericDropdownButton"
	var_23_0._animationSets = var_23_0._animationSets or {}
	var_23_0._sequences = var_23_0._sequences or {}

	local var_23_1 = arg_23_1 and arg_23_1.controllerIndex

	if not var_23_1 and not Engine.DDJFBBJAIG() then
		var_23_1 = var_23_0:getRootController()
	end

	assert(var_23_1)
	var_0_2(var_23_0, var_23_1, arg_23_1)

	local var_23_2 = var_23_0
	local var_23_3
	local var_23_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_23_1
	})

	var_23_4.id = "GenericOptionButtonBase"

	var_23_4.Title:SetLeft(_1080p * 20, 0)
	var_23_4.Title:SetRight(_1080p * -375, 0)
	var_23_4.Title:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_23_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_23_0:addElement(var_23_4)

	var_23_0.GenericOptionButtonBase = var_23_4

	local var_23_5
	local var_23_6 = LUI.UIImage.new()

	var_23_6.id = "ChangeIndicator"

	var_23_6:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_23_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_23_0:addElement(var_23_6)

	var_23_0.ChangeIndicator = var_23_6

	local var_23_7
	local var_23_8 = MenuBuilder.BuildRegisteredType("GenericDropdown", {
		controllerIndex = var_23_1
	})

	var_23_8.id = "Dropdown"

	var_23_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -357, _1080p * -10, _1080p * 9, 0)
	var_23_0:addElement(var_23_8)

	var_23_0.Dropdown = var_23_8

	local var_23_9
	local var_23_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_23_11 = LUI.UIBorder.new(var_23_10)

	var_23_11.id = "ArrowDefault"

	var_23_11:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_23_11:SetAlpha(0.7, 0)
	var_23_11:SetZRotation(45, 0)
	var_23_11:SetBorderThicknessRight(_1080p * 0, 0)
	var_23_11:SetBorderThicknessTop(_1080p * 0, 0)
	var_23_11:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -31, _1080p * -21, _1080p * -8, _1080p * 2)
	var_23_0:addElement(var_23_11)

	var_23_0.ArrowDefault = var_23_11

	local var_23_12
	local var_23_13 = LUI.UIImage.new()

	var_23_13.id = "Arrow"

	var_23_13:SetZRotation(90, 0)
	var_23_13:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_23_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -42, _1080p * -10, _1080p * -11, _1080p * 21)
	var_23_0:addElement(var_23_13)

	var_23_0.Arrow = var_23_13

	local var_23_14

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_23_0) then
		var_23_14 = MenuBuilder.BuildRegisteredType("MoreInfoInnerButton", {
			controllerIndex = var_23_1
		})
		var_23_14.id = "MoreInfoButton"

		var_23_14:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -405, _1080p * -369, 0, 0)
		var_23_0:addElement(var_23_14)

		var_23_0.MoreInfoButton = var_23_14
	end

	local var_23_15
	local var_23_16 = LUI.UIImage.new()

	var_23_16.id = "Lock"

	var_23_16:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_23_16:SetAlpha(0, 0)
	var_23_16:setImage(RegisterMaterial("icon_lock"), 0)
	var_23_16:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -54, _1080p * -24, _1080p * -18, _1080p * 12)
	var_23_0:addElement(var_23_16)

	var_23_0.Lock = var_23_16

	local var_23_17
	local var_23_18 = LUI.UIImage.new()

	var_23_18.id = "LeftLine"

	var_23_18:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_23_18:SetAlpha(0.2, 0)
	var_23_18:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -356, _1080p * -10, _1080p * 10)
	var_23_0:addElement(var_23_18)

	var_23_0.LeftLine = var_23_18

	local function var_23_19()
		return
	end

	var_23_0._sequences.DefaultSequence = var_23_19

	local var_23_20
	local var_23_21 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("Locked", var_23_21)

	local var_23_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("Locked", var_23_22)

	local function var_23_23()
		var_23_4:AnimateSequence("Locked")
		var_23_16:AnimateSequence("Locked")
	end

	var_23_0._sequences.Locked = var_23_23

	local var_23_24
	local var_23_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_23_0.GenericOptionButtonBase.Title
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("Unlocked", var_23_25)

	local var_23_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("Unlocked", var_23_26)

	local function var_23_27()
		var_23_4:AnimateSequence("Unlocked")
		var_23_16:AnimateSequence("Unlocked")
	end

	var_23_0._sequences.Unlocked = var_23_27

	local var_23_28
	local var_23_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_23_6:RegisterAnimationSequence("ButtonOver", var_23_29)

	local var_23_30 = {
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
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_13:RegisterAnimationSequence("ButtonOver", var_23_30)

	local function var_23_31()
		var_23_6:AnimateSequence("ButtonOver")
		var_23_13:AnimateSequence("ButtonOver")
	end

	var_23_0._sequences.ButtonOver = var_23_31

	local var_23_32
	local var_23_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_23_6:RegisterAnimationSequence("ButtonUp", var_23_33)

	local var_23_34 = {
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
			duration = 40,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		}
	}

	var_23_13:RegisterAnimationSequence("ButtonUp", var_23_34)

	local function var_23_35()
		var_23_6:AnimateSequence("ButtonUp")
		var_23_13:AnimateSequence("ButtonUp")
	end

	var_23_0._sequences.ButtonUp = var_23_35

	local var_23_36
	local var_23_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_23_6:RegisterAnimationSequence("Changed", var_23_37)

	local function var_23_38()
		var_23_6:AnimateSequence("Changed")
	end

	var_23_0._sequences.Changed = var_23_38

	local var_23_39
	local var_23_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("Unchanged", var_23_40)

	local function var_23_41()
		var_23_6:AnimateSequence("Unchanged")
	end

	var_23_0._sequences.Unchanged = var_23_41

	local var_23_42
	local var_23_43 = {
		{
			value = 225,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_23_11:RegisterAnimationSequence("Opened", var_23_43)

	local var_23_44 = {
		{
			value = 270,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_23_13:RegisterAnimationSequence("Opened", var_23_44)

	local function var_23_45()
		var_23_11:AnimateSequence("Opened")
		var_23_13:AnimateSequence("Opened")
	end

	var_23_0._sequences.Opened = var_23_45

	local var_23_46
	local var_23_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("Active", var_23_47)

	local function var_23_48()
		var_23_16:AnimateSequence("Active")
	end

	var_23_0._sequences.Active = var_23_48

	local var_23_49
	local var_23_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_23_6:RegisterAnimationSequence("ButtonOverActive", var_23_50)

	local var_23_51 = {
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
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_13:RegisterAnimationSequence("ButtonOverActive", var_23_51)

	local var_23_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("ButtonOverActive", var_23_52)

	local function var_23_53()
		var_23_6:AnimateSequence("ButtonOverActive")
		var_23_13:AnimateSequence("ButtonOverActive")
		var_23_16:AnimateSequence("ButtonOverActive")
	end

	var_23_0._sequences.ButtonOverActive = var_23_53

	local var_23_54
	local var_23_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_23_6:RegisterAnimationSequence("ButtonUpActive", var_23_55)

	local var_23_56 = {
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
			duration = 40,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		}
	}

	var_23_13:RegisterAnimationSequence("ButtonUpActive", var_23_56)

	local var_23_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("ButtonUpActive", var_23_57)

	local function var_23_58()
		var_23_6:AnimateSequence("ButtonUpActive")
		var_23_13:AnimateSequence("ButtonUpActive")
		var_23_16:AnimateSequence("ButtonUpActive")
	end

	var_23_0._sequences.ButtonUpActive = var_23_58

	local var_23_59
	local var_23_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -360
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("Disabled", var_23_60)

	local function var_23_61()
		var_23_16:AnimateSequence("Disabled")
	end

	var_23_0._sequences.Disabled = var_23_61

	local var_23_62
	local var_23_63 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -359
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -391
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_23_16:RegisterAnimationSequence("ButtonOverDisabled", var_23_63)

	local function var_23_64()
		var_23_16:AnimateSequence("ButtonOverDisabled")
	end

	var_23_0._sequences.ButtonOverDisabled = var_23_64

	local var_23_65
	local var_23_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_23_0.GenericOptionButtonBase.Title
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("ButtonUpDisabled", var_23_66)

	local var_23_67 = {
		{
			value = 0.4,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -360,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_23_16:RegisterAnimationSequence("ButtonUpDisabled", var_23_67)

	local function var_23_68()
		var_23_4:AnimateSequence("ButtonUpDisabled")
		var_23_16:AnimateSequence("ButtonUpDisabled")
	end

	var_23_0._sequences.ButtonUpDisabled = var_23_68

	local var_23_69
	local var_23_70 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -360
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_23_16:RegisterAnimationSequence("DisabledActive", var_23_70)

	local function var_23_71()
		var_23_16:AnimateSequence("DisabledActive")
	end

	var_23_0._sequences.DisabledActive = var_23_71

	local var_23_72
	local var_23_73 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -391
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -359
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_23_16:RegisterAnimationSequence("ButtonOverDisabledActive", var_23_73)

	local function var_23_74()
		var_23_16:AnimateSequence("ButtonOverDisabledActive")
	end

	var_23_0._sequences.ButtonOverDisabledActive = var_23_74

	local var_23_75
	local var_23_76 = {
		{
			value = 0.8,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -360,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_23_16:RegisterAnimationSequence("ButtonUpDisabledActive", var_23_76)

	local function var_23_77()
		var_23_16:AnimateSequence("ButtonUpDisabledActive")
	end

	var_23_0._sequences.ButtonUpDisabledActive = var_23_77

	local var_23_78
	local var_23_79 = {
		{
			value = 45,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		}
	}

	var_23_11:RegisterAnimationSequence("Closed", var_23_79)

	local var_23_80 = {
		{
			value = 90,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_23_13:RegisterAnimationSequence("Closed", var_23_80)

	local function var_23_81()
		var_23_11:AnimateSequence("Closed")
		var_23_13:AnimateSequence("Closed")
	end

	var_23_0._sequences.Closed = var_23_81

	local var_23_82
	local var_23_83 = {
		{
			value = -0.15,
			duration = 80,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_23_13:RegisterAnimationSequence("Down", var_23_83)

	local function var_23_84()
		var_23_13:AnimateSequence("Down")
	end

	var_23_0._sequences.Down = var_23_84

	local var_23_85
	local var_23_86 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_23_13:RegisterAnimationSequence("Up", var_23_86)

	local function var_23_87()
		var_23_13:AnimateSequence("Up")
	end

	var_23_0._sequences.Up = var_23_87

	local var_23_88
	local var_23_89 = {
		{
			value = -0.15,
			duration = 80,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_23_13:RegisterAnimationSequence("DownUp", var_23_89)

	local function var_23_90()
		var_23_13:AnimateSequence("DownUp")
	end

	var_23_0._sequences.DownUp = var_23_90

	local var_23_91
	local var_23_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_23_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("AR", var_23_92)

	local var_23_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 357
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_23_8:RegisterAnimationSequence("AR", var_23_93)

	local var_23_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_23_11:RegisterAnimationSequence("AR", var_23_94)

	local var_23_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 43
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_23_13:RegisterAnimationSequence("AR", var_23_95)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_23_0) then
		local var_23_96 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 366
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 402
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			}
		}

		var_23_14:RegisterAnimationSequence("AR", var_23_96)
	end

	local var_23_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 36
		}
	}

	var_23_16:RegisterAnimationSequence("AR", var_23_97)

	local var_23_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 356
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 357
		}
	}

	var_23_18:RegisterAnimationSequence("AR", var_23_98)

	local function var_23_99()
		var_23_4:AnimateSequence("AR")
		var_23_8:AnimateSequence("AR")
		var_23_11:AnimateSequence("AR")
		var_23_13:AnimateSequence("AR")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_23_0) then
			var_23_14:AnimateSequence("AR")
		end

		var_23_16:AnimateSequence("AR")
		var_23_18:AnimateSequence("AR")
	end

	var_23_0._sequences.AR = var_23_99

	local var_23_100
	local var_23_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -412,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("ShorterTitle", var_23_101)

	local function var_23_102()
		var_23_4:AnimateSequence("ShorterTitle")
	end

	var_23_0._sequences.ShorterTitle = var_23_102

	local var_23_103
	local var_23_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 412,
			child = var_23_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("ShorterTitleAR", var_23_104)

	local function var_23_105()
		var_23_4:AnimateSequence("ShorterTitleAR")
	end

	var_23_0._sequences.ShorterTitleAR = var_23_105

	local var_23_106
	local var_23_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("WZWipSetup", var_23_107)

	local var_23_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZWipSetup", var_23_108)

	local var_23_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_23_11:RegisterAnimationSequence("WZWipSetup", var_23_109)

	local var_23_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_13:RegisterAnimationSequence("WZWipSetup", var_23_110)

	local var_23_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipSetup", var_23_111)

	local function var_23_112()
		var_23_4:AnimateSequence("WZWipSetup")
		var_23_6:AnimateSequence("WZWipSetup")
		var_23_11:AnimateSequence("WZWipSetup")
		var_23_13:AnimateSequence("WZWipSetup")
		var_23_16:AnimateSequence("WZWipSetup")
	end

	var_23_0._sequences.WZWipSetup = var_23_112

	local var_23_113
	local var_23_114 = {
		{
			value = 225,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_23_11:RegisterAnimationSequence("WZWipOpened", var_23_114)

	local var_23_115 = {
		{
			value = 270,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_23_13:RegisterAnimationSequence("WZWipOpened", var_23_115)

	local function var_23_116()
		var_23_11:AnimateSequence("WZWipOpened")
		var_23_13:AnimateSequence("WZWipOpened")
	end

	var_23_0._sequences.WZWipOpened = var_23_116

	local var_23_117
	local var_23_118 = {
		{
			value = 45,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		}
	}

	var_23_11:RegisterAnimationSequence("WZWipClosed", var_23_118)

	local var_23_119 = {
		{
			value = 90,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_23_13:RegisterAnimationSequence("WZWipClosed", var_23_119)

	local function var_23_120()
		var_23_11:AnimateSequence("WZWipClosed")
		var_23_13:AnimateSequence("WZWipClosed")
	end

	var_23_0._sequences.WZWipClosed = var_23_120

	local var_23_121
	local var_23_122 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZWipButtonOver", var_23_122)

	local var_23_123 = {
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
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_13:RegisterAnimationSequence("WZWipButtonOver", var_23_123)

	local function var_23_124()
		var_23_6:AnimateSequence("WZWipButtonOver")
		var_23_13:AnimateSequence("WZWipButtonOver")
	end

	var_23_0._sequences.WZWipButtonOver = var_23_124

	local var_23_125
	local var_23_126 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZWipButtonOverActive", var_23_126)

	local var_23_127 = {
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
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_13:RegisterAnimationSequence("WZWipButtonOverActive", var_23_127)

	local var_23_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipButtonOverActive", var_23_128)

	local function var_23_129()
		var_23_6:AnimateSequence("WZWipButtonOverActive")
		var_23_13:AnimateSequence("WZWipButtonOverActive")
		var_23_16:AnimateSequence("WZWipButtonOverActive")
	end

	var_23_0._sequences.WZWipButtonOverActive = var_23_129

	local var_23_130
	local var_23_131 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -359
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -391
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipButtonOverDisabled", var_23_131)

	local function var_23_132()
		var_23_16:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_23_0._sequences.WZWipButtonOverDisabled = var_23_132

	local var_23_133
	local var_23_134 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -391
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -359
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipButtonOverDisabledActive", var_23_134)

	local function var_23_135()
		var_23_16:AnimateSequence("WZWipButtonOverDisabledActive")
	end

	var_23_0._sequences.WZWipButtonOverDisabledActive = var_23_135

	local var_23_136
	local var_23_137 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZWipChanged", var_23_137)

	local function var_23_138()
		var_23_6:AnimateSequence("WZWipChanged")
	end

	var_23_0._sequences.WZWipChanged = var_23_138

	local var_23_139
	local var_23_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -360
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipDisabled", var_23_140)

	local function var_23_141()
		var_23_16:AnimateSequence("WZWipDisabled")
	end

	var_23_0._sequences.WZWipDisabled = var_23_141

	local var_23_142
	local var_23_143 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -360
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipDisabledActive", var_23_143)

	local function var_23_144()
		var_23_16:AnimateSequence("WZWipDisabledActive")
	end

	var_23_0._sequences.WZWipDisabledActive = var_23_144

	local var_23_145
	local var_23_146 = {
		{
			value = -0.15,
			duration = 80,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_23_13:RegisterAnimationSequence("WZWipDown", var_23_146)

	local function var_23_147()
		var_23_13:AnimateSequence("WZWipDown")
	end

	var_23_0._sequences.WZWipDown = var_23_147

	local var_23_148
	local var_23_149 = {
		{
			value = -0.15,
			duration = 80,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_23_13:RegisterAnimationSequence("WZWipDownUp", var_23_149)

	local function var_23_150()
		var_23_13:AnimateSequence("WZWipDownUp")
	end

	var_23_0._sequences.WZWipDownUp = var_23_150

	local var_23_151
	local var_23_152 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("WZWipLocked", var_23_152)

	local var_23_153 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipLocked", var_23_153)

	local function var_23_154()
		var_23_4:AnimateSequence("WZWipLocked")
		var_23_16:AnimateSequence("WZWipLocked")
	end

	var_23_0._sequences.WZWipLocked = var_23_154

	local var_23_155
	local var_23_156 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("WZWipUnlocked", var_23_156)

	local var_23_157 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipUnlocked", var_23_157)

	local function var_23_158()
		var_23_4:AnimateSequence("WZWipUnlocked")
		var_23_16:AnimateSequence("WZWipUnlocked")
	end

	var_23_0._sequences.WZWipUnlocked = var_23_158

	local var_23_159
	local var_23_160 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipActive", var_23_160)

	local function var_23_161()
		var_23_16:AnimateSequence("WZWipActive")
	end

	var_23_0._sequences.WZWipActive = var_23_161

	local var_23_162
	local var_23_163 = {
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
			duration = 40,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		}
	}

	var_23_13:RegisterAnimationSequence("WZWipButtonUp", var_23_163)

	local function var_23_164()
		var_23_13:AnimateSequence("WZWipButtonUp")
	end

	var_23_0._sequences.WZWipButtonUp = var_23_164

	local var_23_165
	local var_23_166 = {
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
			duration = 40,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 40,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		}
	}

	var_23_13:RegisterAnimationSequence("WZWipButtonUpActive", var_23_166)

	local var_23_167 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipButtonUpActive", var_23_167)

	local function var_23_168()
		var_23_13:AnimateSequence("WZWipButtonUpActive")
		var_23_16:AnimateSequence("WZWipButtonUpActive")
	end

	var_23_0._sequences.WZWipButtonUpActive = var_23_168

	local var_23_169
	local var_23_170 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_23_0.GenericOptionButtonBase.Title
		}
	}

	var_23_4:RegisterAnimationSequence("WZWipButtonUpDisabled", var_23_170)

	local var_23_171 = {
		{
			value = 0.4,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -360,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipButtonUpDisabled", var_23_171)

	local function var_23_172()
		var_23_4:AnimateSequence("WZWipButtonUpDisabled")
		var_23_16:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_23_0._sequences.WZWipButtonUpDisabled = var_23_172

	local var_23_173
	local var_23_174 = {
		{
			value = 0.8,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -390,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -360,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 50,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_23_16:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_23_174)

	local function var_23_175()
		var_23_16:AnimateSequence("WZWipButtonUpDisabledActive")
	end

	var_23_0._sequences.WZWipButtonUpDisabledActive = var_23_175

	local var_23_176
	local var_23_177 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_23_13:RegisterAnimationSequence("WZWipUp", var_23_177)

	local function var_23_178()
		var_23_13:AnimateSequence("WZWipUp")
	end

	var_23_0._sequences.WZWipUp = var_23_178

	local var_23_179
	local var_23_180 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_23_6:RegisterAnimationSequence("WZWipUnChanged", var_23_180)

	local function var_23_181()
		var_23_6:AnimateSequence("WZWipUnChanged")
	end

	var_23_0._sequences.WZWipUnChanged = var_23_181

	var_0_1(var_23_0, var_23_1, arg_23_1)

	return var_23_0
end

MenuBuilder.registerType("GenericDropdownButton", GenericDropdownButton)
LockTable(_M)
