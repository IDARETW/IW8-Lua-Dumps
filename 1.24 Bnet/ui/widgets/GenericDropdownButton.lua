module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		assert(arg_1_0._sequences[arg_1_1], "Missing anim " .. arg_1_1)
		ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
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
			ACTIONS.AnimateSequence(arg_6_0.MoreInfoButton, "ButtonUp")
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
			ACTIONS.AnimateSequence(arg_8_0.MoreInfoButton, "ButtonOver")
		end
	end)
	arg_2_0:addEventHandler("button_active", function(arg_9_0, arg_9_1)
		var_0_0(arg_9_0, "ButtonUpActive")

		if arg_9_0.Dropdown.dropdownButton then
			var_0_0(arg_9_0.Dropdown.dropdownButton, "ButtonUpActive")
		end

		if arg_9_0.MoreInfoButton then
			ACTIONS.AnimateSequence(arg_9_0.MoreInfoButton, "ButtonUp")
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
		local function var_2_0(arg_21_0, arg_21_1)
			if LUI.IsLastInputGamepad(arg_21_1.controllerIndex) then
				arg_21_0.MoreInfoButton:SetAlpha(0)
			else
				arg_21_0.MoreInfoButton:SetAlpha(1)
			end
		end

		arg_2_0.MoreInfoButton:addEventHandler("leftmouseup", function(arg_22_0, arg_22_1)
			if arg_22_1.inside and arg_22_0:isInFocus() then
				arg_2_0:customPreviewButtonAction(arg_22_1.controller)
			end
		end)
		arg_2_0:addEventHandler("update_input_type", var_2_0)
		arg_2_0:addAndCallEventHandler("menu_create", var_2_0, {
			controllerIndex = arg_2_1
		})
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

local function var_0_2(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0._needMoreInfoInnerButton = arg_23_2.needMoreInfoInnerButton
end

function GenericDropdownButton(arg_24_0, arg_24_1)
	local var_24_0 = LUI.UIButton.new()

	var_24_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_24_0.id = "GenericDropdownButton"
	var_24_0._animationSets = var_24_0._animationSets or {}
	var_24_0._sequences = var_24_0._sequences or {}

	local var_24_1 = arg_24_1 and arg_24_1.controllerIndex

	if not var_24_1 and not Engine.DDJFBBJAIG() then
		var_24_1 = var_24_0:getRootController()
	end

	assert(var_24_1)
	var_0_2(var_24_0, var_24_1, arg_24_1)

	local var_24_2 = var_24_0
	local var_24_3
	local var_24_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_24_1
	})

	var_24_4.id = "GenericOptionButtonBase"

	var_24_4.Title:SetLeft(_1080p * 20, 0)
	var_24_4.Title:SetRight(_1080p * -375, 0)
	var_24_4.Title:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_24_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_24_0:addElement(var_24_4)

	var_24_0.GenericOptionButtonBase = var_24_4

	local var_24_5
	local var_24_6 = LUI.UIImage.new()

	var_24_6.id = "ChangeIndicator"

	var_24_6:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_24_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_24_0:addElement(var_24_6)

	var_24_0.ChangeIndicator = var_24_6

	local var_24_7
	local var_24_8 = MenuBuilder.BuildRegisteredType("GenericDropdown", {
		controllerIndex = var_24_1
	})

	var_24_8.id = "Dropdown"

	var_24_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -357, _1080p * -10, 0, 0)
	var_24_0:addElement(var_24_8)

	var_24_0.Dropdown = var_24_8

	local var_24_9
	local var_24_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_24_11 = LUI.UIBorder.new(var_24_10)

	var_24_11.id = "ArrowDefault"

	var_24_11:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_24_11:SetAlpha(0.7, 0)
	var_24_11:SetZRotation(45, 0)
	var_24_11:SetBorderThicknessRight(_1080p * 0, 0)
	var_24_11:SetBorderThicknessTop(_1080p * 0, 0)
	var_24_11:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -31, _1080p * -21, _1080p * -8, _1080p * 2)
	var_24_0:addElement(var_24_11)

	var_24_0.ArrowDefault = var_24_11

	local var_24_12
	local var_24_13 = LUI.UIImage.new()

	var_24_13.id = "Arrow"

	var_24_13:SetAlpha(0, 0)
	var_24_13:SetZRotation(90, 0)
	var_24_13:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_24_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -42, _1080p * -10, _1080p * -11, _1080p * 21)
	var_24_0:addElement(var_24_13)

	var_24_0.Arrow = var_24_13

	local var_24_14

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_24_0) then
		var_24_14 = MenuBuilder.BuildRegisteredType("MoreInfoInnerButton", {
			controllerIndex = var_24_1
		})
		var_24_14.id = "MoreInfoButton"

		var_24_14:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -405, _1080p * -369, 0, 0)
		var_24_0:addElement(var_24_14)

		var_24_0.MoreInfoButton = var_24_14
	end

	local var_24_15
	local var_24_16 = LUI.UIImage.new()

	var_24_16.id = "Lock"

	var_24_16:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_24_16:SetAlpha(0, 0)
	var_24_16:setImage(RegisterMaterial("icon_lock"), 0)
	var_24_16:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -54, _1080p * -24, _1080p * -18, _1080p * 12)
	var_24_0:addElement(var_24_16)

	var_24_0.Lock = var_24_16

	local var_24_17
	local var_24_18 = LUI.UIImage.new()

	var_24_18.id = "LeftLine"

	var_24_18:SetAlpha(0.2, 0)
	var_24_18:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -356, _1080p * -10, _1080p * 10)
	var_24_0:addElement(var_24_18)

	var_24_0.LeftLine = var_24_18

	local var_24_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_24_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_24_0.GenericOptionButtonBase.Title
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_24_4:RegisterAnimationSequence("DefaultSequence", var_24_19)

	local var_24_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_6:RegisterAnimationSequence("DefaultSequence", var_24_20)

	local var_24_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("DefaultSequence", var_24_21)

	local function var_24_22()
		var_24_4:AnimateSequence("DefaultSequence")
		var_24_6:AnimateSequence("DefaultSequence")
		var_24_16:AnimateSequence("DefaultSequence")
	end

	var_24_0._sequences.DefaultSequence = var_24_22

	local var_24_23 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_24_0.GenericOptionButtonBase.Title
		}
	}

	var_24_4:RegisterAnimationSequence("Locked", var_24_23)

	local var_24_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("Locked", var_24_24)

	local function var_24_25()
		var_24_4:AnimateSequence("Locked")
		var_24_16:AnimateSequence("Locked")
	end

	var_24_0._sequences.Locked = var_24_25

	local var_24_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_24_0.GenericOptionButtonBase.Title
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_24_0.GenericOptionButtonBase.Title
		}
	}

	var_24_4:RegisterAnimationSequence("Unlocked", var_24_26)

	local var_24_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("Unlocked", var_24_27)

	local function var_24_28()
		var_24_4:AnimateSequence("Unlocked")
		var_24_16:AnimateSequence("Unlocked")
	end

	var_24_0._sequences.Unlocked = var_24_28

	local var_24_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_24_6:RegisterAnimationSequence("ButtonOver", var_24_29)

	local var_24_30 = {
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

	var_24_13:RegisterAnimationSequence("ButtonOver", var_24_30)

	local function var_24_31()
		var_24_6:AnimateSequence("ButtonOver")
		var_24_13:AnimateSequence("ButtonOver")
	end

	var_24_0._sequences.ButtonOver = var_24_31

	local var_24_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_24_6:RegisterAnimationSequence("ButtonUp", var_24_32)

	local var_24_33 = {
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

	var_24_13:RegisterAnimationSequence("ButtonUp", var_24_33)

	local function var_24_34()
		var_24_6:AnimateSequence("ButtonUp")
		var_24_13:AnimateSequence("ButtonUp")
	end

	var_24_0._sequences.ButtonUp = var_24_34

	local var_24_35 = {
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

	var_24_6:RegisterAnimationSequence("Changed", var_24_35)

	local function var_24_36()
		var_24_6:AnimateSequence("Changed")
	end

	var_24_0._sequences.Changed = var_24_36

	local var_24_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_6:RegisterAnimationSequence("Unchanged", var_24_37)

	local function var_24_38()
		var_24_6:AnimateSequence("Unchanged")
	end

	var_24_0._sequences.Unchanged = var_24_38

	local var_24_39 = {
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

	var_24_11:RegisterAnimationSequence("Opened", var_24_39)

	local var_24_40 = {
		{
			value = 270,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_24_13:RegisterAnimationSequence("Opened", var_24_40)

	local function var_24_41()
		var_24_11:AnimateSequence("Opened")
		var_24_13:AnimateSequence("Opened")
	end

	var_24_0._sequences.Opened = var_24_41

	local var_24_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("Active", var_24_42)

	local function var_24_43()
		var_24_16:AnimateSequence("Active")
	end

	var_24_0._sequences.Active = var_24_43

	local var_24_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_24_6:RegisterAnimationSequence("ButtonOverActive", var_24_44)

	local var_24_45 = {
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

	var_24_13:RegisterAnimationSequence("ButtonOverActive", var_24_45)

	local var_24_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("ButtonOverActive", var_24_46)

	local function var_24_47()
		var_24_6:AnimateSequence("ButtonOverActive")
		var_24_13:AnimateSequence("ButtonOverActive")
		var_24_16:AnimateSequence("ButtonOverActive")
	end

	var_24_0._sequences.ButtonOverActive = var_24_47

	local var_24_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_24_6:RegisterAnimationSequence("ButtonUpActive", var_24_48)

	local var_24_49 = {
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

	var_24_13:RegisterAnimationSequence("ButtonUpActive", var_24_49)

	local var_24_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("ButtonUpActive", var_24_50)

	local function var_24_51()
		var_24_6:AnimateSequence("ButtonUpActive")
		var_24_13:AnimateSequence("ButtonUpActive")
		var_24_16:AnimateSequence("ButtonUpActive")
	end

	var_24_0._sequences.ButtonUpActive = var_24_51

	local var_24_52 = {
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

	var_24_16:RegisterAnimationSequence("Disabled", var_24_52)

	local function var_24_53()
		var_24_16:AnimateSequence("Disabled")
	end

	var_24_0._sequences.Disabled = var_24_53

	local var_24_54 = {
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

	var_24_16:RegisterAnimationSequence("ButtonOverDisabled", var_24_54)

	local function var_24_55()
		var_24_16:AnimateSequence("ButtonOverDisabled")
	end

	var_24_0._sequences.ButtonOverDisabled = var_24_55

	local var_24_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_24_0.GenericOptionButtonBase.Title
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_24_0.GenericOptionButtonBase.Title
		}
	}

	var_24_4:RegisterAnimationSequence("ButtonUpDisabled", var_24_56)

	local var_24_57 = {
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

	var_24_16:RegisterAnimationSequence("ButtonUpDisabled", var_24_57)

	local function var_24_58()
		var_24_4:AnimateSequence("ButtonUpDisabled")
		var_24_16:AnimateSequence("ButtonUpDisabled")
	end

	var_24_0._sequences.ButtonUpDisabled = var_24_58

	local var_24_59 = {
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

	var_24_16:RegisterAnimationSequence("DisabledActive", var_24_59)

	local function var_24_60()
		var_24_16:AnimateSequence("DisabledActive")
	end

	var_24_0._sequences.DisabledActive = var_24_60

	local var_24_61 = {
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

	var_24_16:RegisterAnimationSequence("ButtonOverDisabledActive", var_24_61)

	local function var_24_62()
		var_24_16:AnimateSequence("ButtonOverDisabledActive")
	end

	var_24_0._sequences.ButtonOverDisabledActive = var_24_62

	local var_24_63 = {
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

	var_24_16:RegisterAnimationSequence("ButtonUpDisabledActive", var_24_63)

	local function var_24_64()
		var_24_16:AnimateSequence("ButtonUpDisabledActive")
	end

	var_24_0._sequences.ButtonUpDisabledActive = var_24_64

	local var_24_65 = {
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

	var_24_11:RegisterAnimationSequence("Closed", var_24_65)

	local var_24_66 = {
		{
			value = 90,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_24_13:RegisterAnimationSequence("Closed", var_24_66)

	local function var_24_67()
		var_24_11:AnimateSequence("Closed")
		var_24_13:AnimateSequence("Closed")
	end

	var_24_0._sequences.Closed = var_24_67

	local var_24_68 = {
		{
			value = -0.15,
			duration = 80,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_24_13:RegisterAnimationSequence("Down", var_24_68)

	local function var_24_69()
		var_24_13:AnimateSequence("Down")
	end

	var_24_0._sequences.Down = var_24_69

	local var_24_70 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_24_13:RegisterAnimationSequence("Up", var_24_70)

	local function var_24_71()
		var_24_13:AnimateSequence("Up")
	end

	var_24_0._sequences.Up = var_24_71

	local var_24_72 = {
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

	var_24_13:RegisterAnimationSequence("DownUp", var_24_72)

	local function var_24_73()
		var_24_13:AnimateSequence("DownUp")
	end

	var_24_0._sequences.DownUp = var_24_73

	local var_24_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_24_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_24_0.GenericOptionButtonBase.Title
		}
	}

	var_24_4:RegisterAnimationSequence("AR", var_24_74)

	local var_24_75 = {
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

	var_24_8:RegisterAnimationSequence("AR", var_24_75)

	local var_24_76 = {
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

	var_24_11:RegisterAnimationSequence("AR", var_24_76)

	local var_24_77 = {
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

	var_24_13:RegisterAnimationSequence("AR", var_24_77)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_24_0) then
		local var_24_78 = {
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

		var_24_14:RegisterAnimationSequence("AR", var_24_78)
	end

	local var_24_79 = {
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

	var_24_16:RegisterAnimationSequence("AR", var_24_79)

	local var_24_80 = {
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

	var_24_18:RegisterAnimationSequence("AR", var_24_80)

	local function var_24_81()
		var_24_4:AnimateSequence("AR")
		var_24_8:AnimateSequence("AR")
		var_24_11:AnimateSequence("AR")
		var_24_13:AnimateSequence("AR")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_24_0) then
			var_24_14:AnimateSequence("AR")
		end

		var_24_16:AnimateSequence("AR")
		var_24_18:AnimateSequence("AR")
	end

	var_24_0._sequences.AR = var_24_81

	local var_24_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -412,
			child = var_24_0.GenericOptionButtonBase.Title
		}
	}

	var_24_4:RegisterAnimationSequence("ShorterTitle", var_24_82)

	local function var_24_83()
		var_24_4:AnimateSequence("ShorterTitle")
	end

	var_24_0._sequences.ShorterTitle = var_24_83

	local var_24_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 412,
			child = var_24_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_24_0.GenericOptionButtonBase.Title
		}
	}

	var_24_4:RegisterAnimationSequence("ShorterTitleAR", var_24_84)

	local function var_24_85()
		var_24_4:AnimateSequence("ShorterTitleAR")
	end

	var_24_0._sequences.ShorterTitleAR = var_24_85

	var_24_0:addEventHandler("disable", function(arg_49_0, arg_49_1)
		if not arg_49_1.controller then
			local var_49_0 = var_24_1
		end

		ACTIONS.AnimateSequence(var_24_0, "Disabled")
	end)
	var_24_0:addEventHandler("enable", function(arg_50_0, arg_50_1)
		if not arg_50_1.controller then
			local var_50_0 = var_24_1
		end

		ACTIONS.AnimateSequence(var_24_0, "DefaultSequence")
	end)
	var_24_0:addEventHandler("button_over", function(arg_51_0, arg_51_1)
		if not arg_51_1.controller then
			local var_51_0 = var_24_1
		end

		ACTIONS.AnimateSequence(var_24_0, "ButtonOver")
	end)
	var_24_0:addEventHandler("button_up", function(arg_52_0, arg_52_1)
		if not arg_52_1.controller then
			local var_52_0 = var_24_1
		end

		ACTIONS.AnimateSequence(var_24_0, "ButtonUp")
	end)
	var_0_1(var_24_0, var_24_1, arg_24_1)
	ACTIONS.AnimateSequence(var_24_0, "DefaultSequence")

	return var_24_0
end

MenuBuilder.registerType("GenericDropdownButton", GenericDropdownButton)
LockTable(_M)
