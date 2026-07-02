module(..., package.seeall)

local var_0_0 = 1 / _1080p

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0.pipsPosition == nil then
		arg_1_0:CalculatePositions(arg_1_2)
	end

	arg_1_0:SetPipPosition(arg_1_1)
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_0.PipsLine:GetCurrentAnchorsAndPositions().left * var_0_0
	local var_2_1 = LAYOUT.GetElementWidth(arg_2_0.PipsLine) * var_0_0 / arg_2_2

	return var_2_0 + (arg_2_1 - 1) * var_2_1, var_2_0 + arg_2_1 * var_2_1
end

local function var_0_3(arg_3_0, arg_3_1)
	arg_3_0.pipsPosition = {}

	for iter_3_0 = 1, arg_3_1 do
		local var_3_0, var_3_1 = arg_3_0.CalculatePipPosition(arg_3_0, iter_3_0, arg_3_1)

		table.insert(arg_3_0.pipsPosition, {
			var_3_0,
			var_3_1
		})
	end
end

local function var_0_4(arg_4_0, arg_4_1)
	if arg_4_1 <= #arg_4_0.pipsPosition then
		local var_4_0 = arg_4_0.pipsPosition[arg_4_1]

		arg_4_0.Pip:SetLeft(_1080p * var_4_0[1])
		arg_4_0.Pip:SetRight(_1080p * var_4_0[2])
	end
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.UpdatePip = var_0_1
	arg_5_0.CalculatePositions = var_0_3
	arg_5_0.CalculatePipPosition = var_0_2
	arg_5_0.SetPipPosition = var_0_4

	local var_5_0 = arg_5_2.wzTheme

	if var_5_0 then
		assert(arg_5_0.GenericOptionButtonBase)

		arg_5_0.GenericOptionButtonBase._wzTheme = var_5_0

		assert(arg_5_0.GenericOptionButtonBase.GenericButtonBackground)

		arg_5_0.GenericOptionButtonBase.GenericButtonBackground._wzTheme = var_5_0

		assert(arg_5_0.ArrowRight)

		arg_5_0.ArrowRight._wzTheme = var_5_0

		assert(arg_5_0.ArrowLeft)

		arg_5_0.ArrowLeft._wzTheme = var_5_0
	end

	local function var_5_1(arg_6_0, arg_6_1)
		if arg_6_0._lastState ~= arg_6_1 then
			arg_6_0._lastState = arg_6_1

			ACTIONS.AnimateSequence(arg_6_0, arg_6_1)
		end
	end

	arg_5_0:SetHandleMouseButton(true)
	arg_5_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		var_5_1(arg_7_0, var_5_0 and "WZButtonOver" or "ButtonOver")
	end)
	arg_5_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		var_5_1(arg_8_0, "ButtonUp")

		if arg_8_0.MoreInfoButton then
			ACTIONS.AnimateSequence(arg_8_0.MoreInfoButton, "ButtonUp")
		end
	end)
	arg_5_0:addEventHandler("active", function(arg_9_0, arg_9_1)
		var_5_1(arg_9_0, "Active")
	end)
	arg_5_0:addEventHandler("button_over_active", function(arg_10_0, arg_10_1)
		var_5_1(arg_10_0, var_5_0 and "WZButtonOverActive" or "ButtonOverActive")

		if arg_10_0.MoreInfoButton then
			ACTIONS.AnimateSequence(arg_10_0.MoreInfoButton, "ButtonOver")
		end
	end)
	arg_5_0:addEventHandler("button_active", function(arg_11_0, arg_11_1)
		var_5_1(arg_11_0, "ButtonUpActive")

		if arg_11_0.MoreInfoButton then
			ACTIONS.AnimateSequence(arg_11_0.MoreInfoButton, "ButtonUp")
		end
	end)
	arg_5_0:addEventHandler("disable_active", function(arg_12_0, arg_12_1)
		var_5_1(arg_12_0, "DisabledActive")
	end)
	arg_5_0:addEventHandler("button_over_disable_active", function(arg_13_0, arg_13_1)
		var_5_1(arg_13_0, "ButtonOverDisabledActive")
	end)
	arg_5_0:addEventHandler("button_disable_active", function(arg_14_0, arg_14_1)
		var_5_1(arg_14_0, "ButtonUpDisabledActive")
	end)
	arg_5_0:addEventHandler("disable", function(arg_15_0, arg_15_1)
		var_5_1(arg_15_0, "Disabled")
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_16_0, arg_16_1)
		var_5_1(arg_16_0, "ButtonOverDisabled")
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_17_0, arg_17_1)
		var_5_1(arg_17_0, "ButtonUpDisabled")
	end)
	arg_5_0:addEventHandler("gamepad_button", function(arg_18_0, arg_18_1)
		if not arg_18_1.down then
			if arg_18_1.button == "right" then
				ACTIONS.AnimateSequence(arg_18_0.ArrowRight, "Up")
			elseif arg_18_1.button == "left" then
				ACTIONS.AnimateSequence(arg_18_0.ArrowLeft, "Up")
			end
		elseif arg_18_1.button == "right" then
			ACTIONS.AnimateSequence(arg_18_0.ArrowRight, "Down")
		elseif arg_18_1.button == "left" then
			ACTIONS.AnimateSequence(arg_18_0.ArrowLeft, "Down")
		end
	end)
	arg_5_0.ArrowLeft:addEventHandler("leftmousedown", function(arg_19_0, arg_19_1)
		if arg_19_0:isInFocus() then
			var_5_1(arg_19_0, "Down")

			return true
		end
	end)
	arg_5_0.ArrowLeft:addEventHandler("leftmouseup", function(arg_20_0, arg_20_1)
		if arg_20_0:isInFocus() then
			var_5_1(arg_20_0, "Up")

			return true
		end
	end)
	arg_5_0.ArrowRight:addEventHandler("leftmousedown", function(arg_21_0, arg_21_1)
		if arg_21_0:isInFocus() then
			var_5_1(arg_21_0, "Down")

			return true
		end
	end)
	arg_5_0.ArrowRight:addEventHandler("leftmouseup", function(arg_22_0, arg_22_1)
		if arg_22_0:isInFocus() then
			var_5_1(arg_22_0, "Up")

			return true
		end
	end)

	if arg_5_0.MoreInfoButton then
		local function var_5_2(arg_23_0, arg_23_1)
			if LUI.IsLastInputGamepad(arg_23_1.controllerIndex) then
				arg_23_0.MoreInfoButton:SetAlpha(0)
			else
				arg_23_0.MoreInfoButton:SetAlpha(1)
			end
		end

		arg_5_0.MoreInfoButton:addEventHandler("leftmouseup", function(arg_24_0, arg_24_1)
			if arg_24_1.inside and arg_24_0:isInFocus() then
				arg_5_0:customPreviewButtonAction(arg_24_1.controller)
			end
		end)
		arg_5_0:addEventHandler("update_input_type", var_5_2)
		arg_5_0:addAndCallEventHandler("menu_create", var_5_2, {
			controllerIndex = arg_5_1
		})
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end
end

local function var_0_6(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0._needMoreInfoInnerButton = arg_25_2.needMoreInfoInnerButton
end

function GenericCycleList(arg_26_0, arg_26_1)
	local var_26_0 = LUI.UIButton.new()

	var_26_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 630 * _1080p, 0, 54 * _1080p)

	var_26_0.id = "GenericCycleList"
	var_26_0._animationSets = var_26_0._animationSets or {}
	var_26_0._sequences = var_26_0._sequences or {}

	local var_26_1 = arg_26_1 and arg_26_1.controllerIndex

	if not var_26_1 and not Engine.DDJFBBJAIG() then
		var_26_1 = var_26_0:getRootController()
	end

	assert(var_26_1)
	var_0_6(var_26_0, var_26_1, arg_26_1)

	local var_26_2 = var_26_0
	local var_26_3
	local var_26_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_26_1
	})

	var_26_4.id = "GenericOptionButtonBase"

	var_26_4.Title:SetLeft(_1080p * 20, 0)
	var_26_4.Title:SetRight(_1080p * -375, 0)
	var_26_4.Title:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_26_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_26_0:addElement(var_26_4)

	var_26_0.GenericOptionButtonBase = var_26_4

	local var_26_5
	local var_26_6 = LUI.UIImage.new()

	var_26_6.id = "PipsLine"

	var_26_6:SetAlpha(0.75, 0)
	var_26_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -78, _1080p * 19, _1080p * 19)
	var_26_0:addElement(var_26_6)

	var_26_0.PipsLine = var_26_6

	local var_26_7
	local var_26_8 = MenuBuilder.BuildRegisteredType("GenericCycleListPip", {
		controllerIndex = var_26_1
	})

	var_26_8.id = "Pip"

	var_26_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -78, _1080p * 19, _1080p * 19)
	var_26_0:addElement(var_26_8)

	var_26_0.Pip = var_26_8

	local var_26_9
	local var_26_10 = LUI.UIStyledText.new()

	var_26_10.id = "Text"

	var_26_10:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_26_10:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_26_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_26_10:SetWordWrap(false)
	var_26_10:SetAlignment(LUI.Alignment.Left)
	var_26_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_26_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_26_10:SetUseEllipses(ELLIPSES.enabled_default)
	var_26_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -347, _1080p * -78, _1080p * -10, _1080p * 10)
	var_26_0:addElement(var_26_10)

	var_26_0.Text = var_26_10

	local var_26_11
	local var_26_12 = LUI.UIImage.new()

	var_26_12.id = "ChangeIndicator"

	var_26_12:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_26_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_26_0:addElement(var_26_12)

	var_26_0.ChangeIndicator = var_26_12

	local var_26_13
	local var_26_14 = LUI.UIImage.new()

	var_26_14.id = "LeftLine"

	var_26_14:SetAlpha(0.2, 0)
	var_26_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -356, _1080p * -10, _1080p * 10)
	var_26_0:addElement(var_26_14)

	var_26_0.LeftLine = var_26_14

	local var_26_15
	local var_26_16 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_26_17 = LUI.UIBorder.new(var_26_16)

	var_26_17.id = "ArrowLeftDefault"

	var_26_17:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_26_17:SetAlpha(0.7, 0)
	var_26_17:SetZRotation(-45, 0)
	var_26_17:SetBorderThicknessRight(_1080p * 0, 0)
	var_26_17:SetBorderThicknessTop(_1080p * 0, 0)
	var_26_17:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -57, _1080p * -47, _1080p * -5, _1080p * 5)
	var_26_0:addElement(var_26_17)

	var_26_0.ArrowLeftDefault = var_26_17

	local var_26_18
	local var_26_19 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_26_20 = LUI.UIBorder.new(var_26_19)

	var_26_20.id = "ArrowRightDefault"

	var_26_20:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_26_20:SetAlpha(0.7, 0)
	var_26_20:SetZRotation(-45, 0)
	var_26_20:SetBorderThicknessLeft(_1080p * 0, 0)
	var_26_20:SetBorderThicknessBottom(_1080p * 0, 0)
	var_26_20:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -32, _1080p * -22, _1080p * -5, _1080p * 5)
	var_26_0:addElement(var_26_20)

	var_26_0.ArrowRightDefault = var_26_20

	local var_26_21
	local var_26_22 = MenuBuilder.BuildRegisteredType("GenericIconInnerButton", {
		controllerIndex = var_26_1
	})

	var_26_22.id = "ArrowRight"

	var_26_22.Icon:SetZRotation(180, 0)
	var_26_22.Icon:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_26_22:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -38, _1080p * -10, 0, 0)
	var_26_0:addElement(var_26_22)

	var_26_0.ArrowRight = var_26_22

	local var_26_23
	local var_26_24 = MenuBuilder.BuildRegisteredType("GenericIconInnerButton", {
		controllerIndex = var_26_1
	})

	var_26_24.id = "ArrowLeft"

	var_26_24.Icon:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_26_24:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -69, _1080p * -41, 0, 0)
	var_26_0:addElement(var_26_24)

	var_26_0.ArrowLeft = var_26_24

	local var_26_25
	local var_26_26 = LUI.UIImage.new()

	var_26_26.id = "Lock"

	var_26_26:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_26_26:SetAlpha(0, 0)
	var_26_26:setImage(RegisterMaterial("icon_lock"), 0)
	var_26_26:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -393, _1080p * -363, _1080p * -15, _1080p * 15)
	var_26_0:addElement(var_26_26)

	var_26_0.Lock = var_26_26

	local var_26_27

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_26_0) then
		var_26_27 = MenuBuilder.BuildRegisteredType("MoreInfoInnerButton", {
			controllerIndex = var_26_1
		})
		var_26_27.id = "MoreInfoButton"

		var_26_27:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -405, _1080p * -369, 0, 0)
		var_26_0:addElement(var_26_27)

		var_26_0.MoreInfoButton = var_26_27
	end

	local var_26_28
	local var_26_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_26_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_26_0.GenericOptionButtonBase.Title
		}
	}

	var_26_4:RegisterAnimationSequence("DefaultSequence", var_26_29)

	local var_26_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_12:RegisterAnimationSequence("DefaultSequence", var_26_30)

	local var_26_31 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_14:RegisterAnimationSequence("DefaultSequence", var_26_31)

	local function var_26_32()
		var_26_4:AnimateSequence("DefaultSequence")
		var_26_12:AnimateSequence("DefaultSequence")
		var_26_14:AnimateSequence("DefaultSequence")
	end

	var_26_0._sequences.DefaultSequence = var_26_32

	local var_26_33
	local var_26_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_26_0.GenericOptionButtonBase.Title
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_26_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		}
	}

	var_26_4:RegisterAnimationSequence("Locked", var_26_34)

	local var_26_35 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -347
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -78
		}
	}

	var_26_10:RegisterAnimationSequence("Locked", var_26_35)

	local var_26_36 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_14:RegisterAnimationSequence("Locked", var_26_36)

	local var_26_37 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("Locked", var_26_37)

	local function var_26_38()
		var_26_4:AnimateSequence("Locked")
		var_26_10:AnimateSequence("Locked")
		var_26_14:AnimateSequence("Locked")
		var_26_26:AnimateSequence("Locked")
	end

	var_26_0._sequences.Locked = var_26_38

	local function var_26_39()
		return
	end

	var_26_0._sequences.NewNotification = var_26_39

	local var_26_40
	local var_26_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_26_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_26_0.GenericOptionButtonBase.Title
		}
	}

	var_26_4:RegisterAnimationSequence("AR", var_26_41)

	local var_26_42 = {
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
			value = _1080p * 77
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 356
		}
	}

	var_26_6:RegisterAnimationSequence("AR", var_26_42)

	local var_26_43 = {
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
			value = _1080p * 77
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 357
		}
	}

	var_26_8:RegisterAnimationSequence("AR", var_26_43)

	local var_26_44 = {
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
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 347
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_26_10:RegisterAnimationSequence("AR", var_26_44)

	local var_26_45 = {
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
			value = _1080p * 357
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 356
		}
	}

	var_26_14:RegisterAnimationSequence("AR", var_26_45)

	local var_26_46 = {
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
		}
	}

	var_26_17:RegisterAnimationSequence("AR", var_26_46)

	local var_26_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 57
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

	var_26_20:RegisterAnimationSequence("AR", var_26_47)

	local var_26_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
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

	var_26_22:RegisterAnimationSequence("AR", var_26_48)

	local var_26_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 38
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

	var_26_24:RegisterAnimationSequence("AR", var_26_49)

	local var_26_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -268
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -238
		}
	}

	var_26_26:RegisterAnimationSequence("AR", var_26_50)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_26_0) then
		local var_26_51 = {
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
				value = _1080p * 366
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 402
			}
		}

		var_26_27:RegisterAnimationSequence("AR", var_26_51)
	end

	local function var_26_52()
		var_26_4:AnimateSequence("AR")
		var_26_6:AnimateSequence("AR")
		var_26_8:AnimateSequence("AR")
		var_26_10:AnimateSequence("AR")
		var_26_14:AnimateSequence("AR")
		var_26_17:AnimateSequence("AR")
		var_26_20:AnimateSequence("AR")
		var_26_22:AnimateSequence("AR")
		var_26_24:AnimateSequence("AR")
		var_26_26:AnimateSequence("AR")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_26_0) then
			var_26_27:AnimateSequence("AR")
		end
	end

	var_26_0._sequences.AR = var_26_52

	local var_26_53
	local var_26_54 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_26_6:RegisterAnimationSequence("ButtonOver", var_26_54)

	local var_26_55 = {
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

	var_26_8:RegisterAnimationSequence("ButtonOver", var_26_55)

	local var_26_56 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_26_10:RegisterAnimationSequence("ButtonOver", var_26_56)

	local var_26_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_26_12:RegisterAnimationSequence("ButtonOver", var_26_57)

	local var_26_58 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_26_14:RegisterAnimationSequence("ButtonOver", var_26_58)

	local var_26_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("ButtonOver", var_26_59)

	local function var_26_60()
		var_26_6:AnimateSequence("ButtonOver")
		var_26_8:AnimateSequence("ButtonOver")
		var_26_10:AnimateSequence("ButtonOver")
		var_26_12:AnimateSequence("ButtonOver")
		var_26_14:AnimateSequence("ButtonOver")
		var_26_26:AnimateSequence("ButtonOver")
	end

	var_26_0._sequences.ButtonOver = var_26_60

	local var_26_61
	local var_26_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_26_6:RegisterAnimationSequence("ButtonUp", var_26_62)

	local var_26_63 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonUp", var_26_63)

	local var_26_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_10:RegisterAnimationSequence("ButtonUp", var_26_64)

	local var_26_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_26_12:RegisterAnimationSequence("ButtonUp", var_26_65)

	local var_26_66 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_14:RegisterAnimationSequence("ButtonUp", var_26_66)

	local var_26_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("ButtonUp", var_26_67)

	local function var_26_68()
		var_26_6:AnimateSequence("ButtonUp")
		var_26_8:AnimateSequence("ButtonUp")
		var_26_10:AnimateSequence("ButtonUp")
		var_26_12:AnimateSequence("ButtonUp")
		var_26_14:AnimateSequence("ButtonUp")
		var_26_26:AnimateSequence("ButtonUp")
	end

	var_26_0._sequences.ButtonUp = var_26_68

	local var_26_69
	local var_26_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		}
	}

	var_26_6:RegisterAnimationSequence("Active", var_26_70)

	local var_26_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		}
	}

	var_26_8:RegisterAnimationSequence("Active", var_26_71)

	local var_26_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("Active", var_26_72)

	local function var_26_73()
		var_26_6:AnimateSequence("Active")
		var_26_8:AnimateSequence("Active")
		var_26_26:AnimateSequence("Active")
	end

	var_26_0._sequences.Active = var_26_73

	local var_26_74
	local var_26_75 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_26_6:RegisterAnimationSequence("ButtonOverActive", var_26_75)

	local var_26_76 = {
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

	var_26_8:RegisterAnimationSequence("ButtonOverActive", var_26_76)

	local var_26_77 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_26_10:RegisterAnimationSequence("ButtonOverActive", var_26_77)

	local var_26_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("ButtonOverActive", var_26_78)

	local function var_26_79()
		var_26_6:AnimateSequence("ButtonOverActive")
		var_26_8:AnimateSequence("ButtonOverActive")
		var_26_10:AnimateSequence("ButtonOverActive")
		var_26_26:AnimateSequence("ButtonOverActive")
	end

	var_26_0._sequences.ButtonOverActive = var_26_79

	local var_26_80
	local var_26_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_26_6:RegisterAnimationSequence("ButtonUpActive", var_26_81)

	local var_26_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonUpActive", var_26_82)

	local var_26_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_10:RegisterAnimationSequence("ButtonUpActive", var_26_83)

	local var_26_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("ButtonUpActive", var_26_84)

	local function var_26_85()
		var_26_6:AnimateSequence("ButtonUpActive")
		var_26_8:AnimateSequence("ButtonUpActive")
		var_26_10:AnimateSequence("ButtonUpActive")
		var_26_26:AnimateSequence("ButtonUpActive")
	end

	var_26_0._sequences.ButtonUpActive = var_26_85

	local var_26_86
	local var_26_87 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_10:RegisterAnimationSequence("Disabled", var_26_87)

	local var_26_88 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_14:RegisterAnimationSequence("Disabled", var_26_88)

	local var_26_89 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("Disabled", var_26_89)

	local function var_26_90()
		var_26_10:AnimateSequence("Disabled")
		var_26_14:AnimateSequence("Disabled")
		var_26_26:AnimateSequence("Disabled")
	end

	var_26_0._sequences.Disabled = var_26_90

	local var_26_91
	local var_26_92 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonOverDisabled", var_26_92)

	local var_26_93 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_26_10:RegisterAnimationSequence("ButtonOverDisabled", var_26_93)

	local var_26_94 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("ButtonOverDisabled", var_26_94)

	local function var_26_95()
		var_26_8:AnimateSequence("ButtonOverDisabled")
		var_26_10:AnimateSequence("ButtonOverDisabled")
		var_26_26:AnimateSequence("ButtonOverDisabled")
	end

	var_26_0._sequences.ButtonOverDisabled = var_26_95

	local var_26_96
	local var_26_97 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_26_8:RegisterAnimationSequence("ButtonUpDisabled", var_26_97)

	local var_26_98 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_10:RegisterAnimationSequence("ButtonUpDisabled", var_26_98)

	local var_26_99 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_14:RegisterAnimationSequence("ButtonUpDisabled", var_26_99)

	local var_26_100 = {
		{
			value = 0.4,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_26_26:RegisterAnimationSequence("ButtonUpDisabled", var_26_100)

	local function var_26_101()
		var_26_8:AnimateSequence("ButtonUpDisabled")
		var_26_10:AnimateSequence("ButtonUpDisabled")
		var_26_14:AnimateSequence("ButtonUpDisabled")
		var_26_26:AnimateSequence("ButtonUpDisabled")
	end

	var_26_0._sequences.ButtonUpDisabled = var_26_101

	local var_26_102
	local var_26_103 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -347
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -78
		}
	}

	var_26_10:RegisterAnimationSequence("DisabledActive", var_26_103)

	local var_26_104 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_14:RegisterAnimationSequence("DisabledActive", var_26_104)

	local var_26_105 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("DisabledActive", var_26_105)

	local function var_26_106()
		var_26_10:AnimateSequence("DisabledActive")
		var_26_14:AnimateSequence("DisabledActive")
		var_26_26:AnimateSequence("DisabledActive")
	end

	var_26_0._sequences.DisabledActive = var_26_106

	local var_26_107
	local var_26_108 = {
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

	var_26_10:RegisterAnimationSequence("ButtonOverDisabledActive", var_26_108)

	local function var_26_109()
		var_26_10:AnimateSequence("ButtonOverDisabledActive")
	end

	var_26_0._sequences.ButtonOverDisabledActive = var_26_109

	local var_26_110
	local var_26_111 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_10:RegisterAnimationSequence("ButtonUpDisabledActive", var_26_111)

	local var_26_112 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_14:RegisterAnimationSequence("ButtonUpDisabledActive", var_26_112)

	local var_26_113 = {
		{
			value = 0.8,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_26_26:RegisterAnimationSequence("ButtonUpDisabledActive", var_26_113)

	local function var_26_114()
		var_26_10:AnimateSequence("ButtonUpDisabledActive")
		var_26_14:AnimateSequence("ButtonUpDisabledActive")
		var_26_26:AnimateSequence("ButtonUpDisabledActive")
	end

	var_26_0._sequences.ButtonUpDisabledActive = var_26_114

	local var_26_115
	local var_26_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -412,
			child = var_26_0.GenericOptionButtonBase.Title
		}
	}

	var_26_4:RegisterAnimationSequence("ShorterTitle", var_26_116)

	local function var_26_117()
		var_26_4:AnimateSequence("ShorterTitle")
	end

	var_26_0._sequences.ShorterTitle = var_26_117

	local var_26_118
	local var_26_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_26_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 412,
			child = var_26_0.GenericOptionButtonBase.Title
		}
	}

	var_26_4:RegisterAnimationSequence("ShorterTitleAR", var_26_119)

	local function var_26_120()
		var_26_4:AnimateSequence("ShorterTitleAR")
	end

	var_26_0._sequences.ShorterTitleAR = var_26_120

	local var_26_121
	local var_26_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -290,
			child = var_26_0.GenericOptionButtonBase.Title
		}
	}

	var_26_4:RegisterAnimationSequence("LongerTitle", var_26_122)

	local var_26_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -237
		}
	}

	var_26_6:RegisterAnimationSequence("LongerTitle", var_26_123)

	local var_26_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -237
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -78
		}
	}

	var_26_8:RegisterAnimationSequence("LongerTitle", var_26_124)

	local var_26_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -225
		}
	}

	var_26_10:RegisterAnimationSequence("LongerTitle", var_26_125)

	local var_26_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -238
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -237
		}
	}

	var_26_14:RegisterAnimationSequence("LongerTitle", var_26_126)

	local var_26_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -274
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -244
		}
	}

	var_26_26:RegisterAnimationSequence("LongerTitle", var_26_127)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_26_0) then
		local var_26_128 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -286
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -250
			}
		}

		var_26_27:RegisterAnimationSequence("LongerTitle", var_26_128)
	end

	local function var_26_129()
		var_26_4:AnimateSequence("LongerTitle")
		var_26_6:AnimateSequence("LongerTitle")
		var_26_8:AnimateSequence("LongerTitle")
		var_26_10:AnimateSequence("LongerTitle")
		var_26_14:AnimateSequence("LongerTitle")
		var_26_26:AnimateSequence("LongerTitle")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_26_0) then
			var_26_27:AnimateSequence("LongerTitle")
		end
	end

	var_26_0._sequences.LongerTitle = var_26_129

	local var_26_130
	local var_26_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 305,
			child = var_26_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_26_0.GenericOptionButtonBase.Title
		}
	}

	var_26_4:RegisterAnimationSequence("LongerTitleAR", var_26_131)

	local var_26_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 245
		}
	}

	var_26_6:RegisterAnimationSequence("LongerTitleAR", var_26_132)

	local var_26_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 245
		}
	}

	var_26_8:RegisterAnimationSequence("LongerTitleAR", var_26_133)

	local var_26_134 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 238
		}
	}

	var_26_10:RegisterAnimationSequence("LongerTitleAR", var_26_134)

	local var_26_135 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 245
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 245
		}
	}

	var_26_14:RegisterAnimationSequence("LongerTitleAR", var_26_135)

	local var_26_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -375
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -345
		}
	}

	var_26_26:RegisterAnimationSequence("LongerTitleAR", var_26_136)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_26_0) then
		local var_26_137 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 255
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 291
			}
		}

		var_26_27:RegisterAnimationSequence("LongerTitleAR", var_26_137)
	end

	local function var_26_138()
		var_26_4:AnimateSequence("LongerTitleAR")
		var_26_6:AnimateSequence("LongerTitleAR")
		var_26_8:AnimateSequence("LongerTitleAR")
		var_26_10:AnimateSequence("LongerTitleAR")
		var_26_14:AnimateSequence("LongerTitleAR")
		var_26_26:AnimateSequence("LongerTitleAR")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_26_0) then
			var_26_27:AnimateSequence("LongerTitleAR")
		end
	end

	var_26_0._sequences.LongerTitleAR = var_26_138

	local var_26_139
	local var_26_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		}
	}

	var_26_6:RegisterAnimationSequence("WZButtonOver", var_26_140)

	local var_26_141 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		}
	}

	var_26_8:RegisterAnimationSequence("WZButtonOver", var_26_141)

	local var_26_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		}
	}

	var_26_10:RegisterAnimationSequence("WZButtonOver", var_26_142)

	local var_26_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_26_12:RegisterAnimationSequence("WZButtonOver", var_26_143)

	local var_26_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		}
	}

	var_26_14:RegisterAnimationSequence("WZButtonOver", var_26_144)

	local var_26_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("WZButtonOver", var_26_145)

	local function var_26_146()
		var_26_6:AnimateSequence("WZButtonOver")
		var_26_8:AnimateSequence("WZButtonOver")
		var_26_10:AnimateSequence("WZButtonOver")
		var_26_12:AnimateSequence("WZButtonOver")
		var_26_14:AnimateSequence("WZButtonOver")
		var_26_26:AnimateSequence("WZButtonOver")
	end

	var_26_0._sequences.WZButtonOver = var_26_146

	local var_26_147
	local var_26_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		}
	}

	var_26_6:RegisterAnimationSequence("WZButtonOverActive", var_26_148)

	local var_26_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		}
	}

	var_26_8:RegisterAnimationSequence("WZButtonOverActive", var_26_149)

	local var_26_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		}
	}

	var_26_10:RegisterAnimationSequence("WZButtonOverActive", var_26_150)

	local var_26_151 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		}
	}

	var_26_14:RegisterAnimationSequence("WZButtonOverActive", var_26_151)

	local var_26_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_26_26:RegisterAnimationSequence("WZButtonOverActive", var_26_152)

	local function var_26_153()
		var_26_6:AnimateSequence("WZButtonOverActive")
		var_26_8:AnimateSequence("WZButtonOverActive")
		var_26_10:AnimateSequence("WZButtonOverActive")
		var_26_14:AnimateSequence("WZButtonOverActive")
		var_26_26:AnimateSequence("WZButtonOverActive")
	end

	var_26_0._sequences.WZButtonOverActive = var_26_153

	var_26_0:addEventHandler("button_up", function(arg_48_0, arg_48_1)
		if not arg_48_1.controller then
			local var_48_0 = var_26_1
		end

		ACTIONS.AnimateSequenceByElement(var_26_0, {
			elementPath = "self.ArrowRight",
			sequenceName = "ButtonUp",
			elementName = "ArrowRight"
		})
		ACTIONS.AnimateSequenceByElement(var_26_0, {
			elementPath = "self.ArrowLeft",
			sequenceName = "ButtonUp",
			elementName = "ArrowLeft"
		})
	end)
	var_0_5(var_26_0, var_26_1, arg_26_1)
	ACTIONS.AnimateSequence(var_26_0, "DefaultSequence")

	return var_26_0
end

MenuBuilder.registerType("GenericCycleList", GenericCycleList)
LockTable(_M)
