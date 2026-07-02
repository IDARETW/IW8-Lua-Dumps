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
	arg_5_0._shouldOffsetLockPosition = arg_5_2.shouldOffsetLockPosition

	local function var_5_0(arg_6_0, arg_6_1)
		if arg_6_0._lastState ~= arg_6_1 then
			arg_6_0._lastState = arg_6_1

			WZWIP.AnimateThemeElement(arg_6_0, arg_6_1)
		end
	end

	arg_5_0:SetHandleMouseButton(true)
	arg_5_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		var_5_0(arg_7_0, "ButtonOver")
	end)
	arg_5_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		var_5_0(arg_8_0, "ButtonUp")

		if arg_8_0.MoreInfoButton then
			var_5_0(arg_8_0.MoreInfoButton, "ButtonUp")
		end

		var_5_0(arg_8_0.ArrowRight, "ButtonUp")
		var_5_0(arg_8_0.ArrowLeft, "ButtonUp")
	end)
	arg_5_0:addEventHandler("active", function(arg_9_0, arg_9_1)
		var_5_0(arg_9_0, "Active")
	end)
	arg_5_0:addEventHandler("button_over_active", function(arg_10_0, arg_10_1)
		var_5_0("ButtonOverActive")

		if arg_10_0.MoreInfoButton then
			var_5_0(arg_10_0.MoreInfoButton, "ButtonOver")
		end
	end)
	arg_5_0:addEventHandler("button_active", function(arg_11_0, arg_11_1)
		var_5_0(arg_11_0, "ButtonUpActive")

		if arg_11_0.MoreInfoButton then
			var_5_0(arg_11_0.MoreInfoButton, "ButtonUpActive")
		end
	end)
	arg_5_0:addEventHandler("disable_active", function(arg_12_0, arg_12_1)
		var_5_0(arg_12_0, "DisabledActive")
	end)
	arg_5_0:addEventHandler("button_over_disable_active", function(arg_13_0, arg_13_1)
		var_5_0(arg_13_0, "ButtonOverDisabledActive")
	end)
	arg_5_0:addEventHandler("button_disable_active", function(arg_14_0, arg_14_1)
		var_5_0(arg_14_0, "ButtonUpDisabledActive")
	end)
	arg_5_0:addEventHandler("disable", function(arg_15_0, arg_15_1)
		var_5_0(arg_15_0, "Disabled")
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_16_0, arg_16_1)
		var_5_0(arg_16_0, "ButtonOverDisabled")

		if arg_5_0._shouldOffsetLockPosition then
			var_5_0(arg_16_0, "UpdateSquadFillLockPosition")
		end
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_17_0, arg_17_1)
		var_5_0(arg_17_0, "ButtonUpDisabled")

		if arg_5_0._shouldOffsetLockPosition then
			var_5_0(arg_17_0, "UpdateSquadFillLockPosition")
		end
	end)
	arg_5_0:addEventHandler("gamepad_button", function(arg_18_0, arg_18_1)
		if not arg_18_1.down then
			if arg_18_1.button == "right" then
				var_5_0(arg_18_0.ArrowRight, "Up")
			elseif arg_18_1.button == "left" then
				var_5_0(arg_18_0.ArrowLeft, "Up")
			end
		elseif arg_18_1.button == "right" then
			var_5_0(arg_18_0.ArrowRight, "Down")
		elseif arg_18_1.button == "left" then
			var_5_0(arg_18_0.ArrowLeft, "Down")
		end
	end)
	arg_5_0.ArrowLeft:addEventHandler("leftmousedown", function(arg_19_0, arg_19_1)
		if arg_19_0:isInFocus() then
			var_5_0(arg_19_0, "Down")

			return true
		end
	end)
	arg_5_0.ArrowLeft:addEventHandler("leftmouseup", function(arg_20_0, arg_20_1)
		if arg_20_0:isInFocus() then
			var_5_0(arg_20_0, "Up")

			return true
		end
	end)
	arg_5_0.ArrowRight:addEventHandler("leftmousedown", function(arg_21_0, arg_21_1)
		if arg_21_0:isInFocus() then
			var_5_0(arg_21_0, "Down")

			return true
		end
	end)
	arg_5_0.ArrowRight:addEventHandler("leftmouseup", function(arg_22_0, arg_22_1)
		if arg_22_0:isInFocus() then
			var_5_0(arg_22_0, "Up")

			return true
		end
	end)

	if arg_5_0.MoreInfoButton then
		arg_5_0.MoreInfoButton:addEventHandler("leftmouseup", function(arg_23_0, arg_23_1)
			if arg_23_1.inside and arg_23_0:isInFocus() then
				arg_5_0:customPreviewButtonAction(arg_23_1.controller)
			end
		end)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")
	end
end

local function var_0_6(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0._needMoreInfoInnerButton = arg_24_2.needMoreInfoInnerButton
end

function GenericCycleList(arg_25_0, arg_25_1)
	local var_25_0 = LUI.UIButton.new()

	var_25_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 630 * _1080p, 0, 54 * _1080p)

	var_25_0.id = "GenericCycleList"
	var_25_0._animationSets = var_25_0._animationSets or {}
	var_25_0._sequences = var_25_0._sequences or {}

	local var_25_1 = arg_25_1 and arg_25_1.controllerIndex

	if not var_25_1 and not Engine.DDJFBBJAIG() then
		var_25_1 = var_25_0:getRootController()
	end

	assert(var_25_1)
	var_0_6(var_25_0, var_25_1, arg_25_1)

	local var_25_2 = var_25_0
	local var_25_3
	local var_25_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_25_1
	})

	var_25_4.id = "GenericOptionButtonBase"

	var_25_4.Title:SetLeft(_1080p * 20, 0)
	var_25_4.Title:SetRight(_1080p * -375, 0)
	var_25_4.Title:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_25_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_25_0:addElement(var_25_4)

	var_25_0.GenericOptionButtonBase = var_25_4

	local var_25_5
	local var_25_6 = LUI.UIImage.new()

	var_25_6.id = "PipsLine"

	var_25_6:SetRGBFromTable(SWATCHES.CH2.WZGenericTabText, 0)
	var_25_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -78, _1080p * 18, _1080p * 19)
	var_25_0:addElement(var_25_6)

	var_25_0.PipsLine = var_25_6

	local var_25_7
	local var_25_8 = MenuBuilder.BuildRegisteredType("GenericCycleListPip", {
		controllerIndex = var_25_1
	})

	var_25_8.id = "Pip"

	var_25_8:SetAlpha(0.5, 0)
	var_25_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -78, _1080p * 14, _1080p * 19)
	var_25_0:addElement(var_25_8)

	var_25_0.Pip = var_25_8

	local var_25_9
	local var_25_10 = LUI.UIStyledText.new()

	var_25_10.id = "Text"

	var_25_10:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_25_10:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_25_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_10:SetWordWrap(false)
	var_25_10:SetAlignment(LUI.Alignment.Left)
	var_25_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_25_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_25_10:SetUseEllipses(ELLIPSES.enabled_default)
	var_25_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -347, _1080p * -78, _1080p * -10, _1080p * 10)
	var_25_0:addElement(var_25_10)

	var_25_0.Text = var_25_10

	local var_25_11
	local var_25_12 = LUI.UIImage.new()

	var_25_12.id = "ChangeIndicator"

	var_25_12:SetAlpha(0, 0)
	var_25_12:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_25_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_25_0:addElement(var_25_12)

	var_25_0.ChangeIndicator = var_25_12

	local var_25_13
	local var_25_14 = LUI.UIImage.new()

	var_25_14.id = "LeftLine"

	var_25_14:SetAlpha(0.2, 0)
	var_25_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -357, _1080p * -356, _1080p * -10, _1080p * 10)
	var_25_0:addElement(var_25_14)

	var_25_0.LeftLine = var_25_14

	local var_25_15
	local var_25_16 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_25_17 = LUI.UIBorder.new(var_25_16)

	var_25_17.id = "ArrowLeftDefault"

	var_25_17:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_25_17:SetAlpha(0.7, 0)
	var_25_17:SetZRotation(-45, 0)
	var_25_17:SetBorderThicknessRight(_1080p * 0, 0)
	var_25_17:SetBorderThicknessTop(_1080p * 0, 0)
	var_25_17:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -57, _1080p * -47, _1080p * -5, _1080p * 5)
	var_25_0:addElement(var_25_17)

	var_25_0.ArrowLeftDefault = var_25_17

	local var_25_18
	local var_25_19 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_25_20 = LUI.UIBorder.new(var_25_19)

	var_25_20.id = "ArrowRightDefault"

	var_25_20:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_25_20:SetAlpha(0.7, 0)
	var_25_20:SetZRotation(-45, 0)
	var_25_20:SetBorderThicknessLeft(_1080p * 0, 0)
	var_25_20:SetBorderThicknessBottom(_1080p * 0, 0)
	var_25_20:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -32, _1080p * -22, _1080p * -5, _1080p * 5)
	var_25_0:addElement(var_25_20)

	var_25_0.ArrowRightDefault = var_25_20

	local var_25_21
	local var_25_22 = MenuBuilder.BuildRegisteredType("GenericIconInnerButton", {
		controllerIndex = var_25_1
	})

	var_25_22.id = "ArrowRight"

	var_25_22.Icon:SetZRotation(180, 0)
	var_25_22.Icon:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_25_22:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -38, _1080p * -10, 0, 0)
	var_25_0:addElement(var_25_22)

	var_25_0.ArrowRight = var_25_22

	local var_25_23
	local var_25_24 = MenuBuilder.BuildRegisteredType("GenericIconInnerButton", {
		controllerIndex = var_25_1
	})

	var_25_24.id = "ArrowLeft"

	var_25_24.Icon:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_25_24:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -69, _1080p * -41, 0, 0)
	var_25_0:addElement(var_25_24)

	var_25_0.ArrowLeft = var_25_24

	local var_25_25
	local var_25_26 = LUI.UIImage.new()

	var_25_26.id = "Lock"

	var_25_26:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_25_26:SetAlpha(0, 0)
	var_25_26:setImage(RegisterMaterial("icon_lock"), 0)
	var_25_26:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -393, _1080p * -363, _1080p * -15, _1080p * 15)
	var_25_0:addElement(var_25_26)

	var_25_0.Lock = var_25_26

	local var_25_27

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_25_0) then
		var_25_27 = MenuBuilder.BuildRegisteredType("MoreInfoInnerButton", {
			controllerIndex = var_25_1
		})
		var_25_27.id = "MoreInfoButton"

		var_25_27:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -405, _1080p * -369, 0, 0)
		var_25_0:addElement(var_25_27)

		var_25_0.MoreInfoButton = var_25_27
	end

	local function var_25_28()
		return
	end

	var_25_0._sequences.DefaultSequence = var_25_28

	local var_25_29
	local var_25_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_25_0.GenericOptionButtonBase.Title
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_25_0.GenericOptionButtonBase.Title
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

	var_25_4:RegisterAnimationSequence("Locked", var_25_30)

	local var_25_31 = {
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

	var_25_10:RegisterAnimationSequence("Locked", var_25_31)

	local var_25_32 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("Locked", var_25_32)

	local var_25_33 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("Locked", var_25_33)

	local function var_25_34()
		var_25_4:AnimateSequence("Locked")
		var_25_10:AnimateSequence("Locked")
		var_25_14:AnimateSequence("Locked")
		var_25_26:AnimateSequence("Locked")
	end

	var_25_0._sequences.Locked = var_25_34

	local function var_25_35()
		return
	end

	var_25_0._sequences.NewNotification = var_25_35

	local var_25_36
	local var_25_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_25_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_25_0.GenericOptionButtonBase.Title
		}
	}

	var_25_4:RegisterAnimationSequence("AR", var_25_37)

	local var_25_38 = {
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

	var_25_6:RegisterAnimationSequence("AR", var_25_38)

	local var_25_39 = {
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

	var_25_8:RegisterAnimationSequence("AR", var_25_39)

	local var_25_40 = {
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

	var_25_10:RegisterAnimationSequence("AR", var_25_40)

	local var_25_41 = {
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

	var_25_14:RegisterAnimationSequence("AR", var_25_41)

	local var_25_42 = {
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

	var_25_17:RegisterAnimationSequence("AR", var_25_42)

	local var_25_43 = {
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

	var_25_20:RegisterAnimationSequence("AR", var_25_43)

	local var_25_44 = {
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

	var_25_22:RegisterAnimationSequence("AR", var_25_44)

	local var_25_45 = {
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

	var_25_24:RegisterAnimationSequence("AR", var_25_45)

	local var_25_46 = {
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

	var_25_26:RegisterAnimationSequence("AR", var_25_46)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_25_0) then
		local var_25_47 = {
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

		var_25_27:RegisterAnimationSequence("AR", var_25_47)
	end

	local function var_25_48()
		var_25_4:AnimateSequence("AR")
		var_25_6:AnimateSequence("AR")
		var_25_8:AnimateSequence("AR")
		var_25_10:AnimateSequence("AR")
		var_25_14:AnimateSequence("AR")
		var_25_17:AnimateSequence("AR")
		var_25_20:AnimateSequence("AR")
		var_25_22:AnimateSequence("AR")
		var_25_24:AnimateSequence("AR")
		var_25_26:AnimateSequence("AR")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_25_0) then
			var_25_27:AnimateSequence("AR")
		end
	end

	var_25_0._sequences.AR = var_25_48

	local var_25_49
	local var_25_50 = {
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

	var_25_6:RegisterAnimationSequence("ButtonOver", var_25_50)

	local var_25_51 = {
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

	var_25_8:RegisterAnimationSequence("ButtonOver", var_25_51)

	local var_25_52 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_25_10:RegisterAnimationSequence("ButtonOver", var_25_52)

	local var_25_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_25_12:RegisterAnimationSequence("ButtonOver", var_25_53)

	local var_25_54 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_25_14:RegisterAnimationSequence("ButtonOver", var_25_54)

	local var_25_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("ButtonOver", var_25_55)

	local function var_25_56()
		var_25_6:AnimateSequence("ButtonOver")
		var_25_8:AnimateSequence("ButtonOver")
		var_25_10:AnimateSequence("ButtonOver")
		var_25_12:AnimateSequence("ButtonOver")
		var_25_14:AnimateSequence("ButtonOver")
		var_25_26:AnimateSequence("ButtonOver")
	end

	var_25_0._sequences.ButtonOver = var_25_56

	local var_25_57
	local var_25_58 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		}
	}

	var_25_6:RegisterAnimationSequence("ButtonUp", var_25_58)

	local var_25_59 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonUp", var_25_59)

	local var_25_60 = {
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

	var_25_10:RegisterAnimationSequence("ButtonUp", var_25_60)

	local var_25_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_25_12:RegisterAnimationSequence("ButtonUp", var_25_61)

	local var_25_62 = {
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

	var_25_14:RegisterAnimationSequence("ButtonUp", var_25_62)

	local var_25_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("ButtonUp", var_25_63)

	local function var_25_64()
		var_25_6:AnimateSequence("ButtonUp")
		var_25_8:AnimateSequence("ButtonUp")
		var_25_10:AnimateSequence("ButtonUp")
		var_25_12:AnimateSequence("ButtonUp")
		var_25_14:AnimateSequence("ButtonUp")
		var_25_26:AnimateSequence("ButtonUp")
	end

	var_25_0._sequences.ButtonUp = var_25_64

	local var_25_65
	local var_25_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		}
	}

	var_25_6:RegisterAnimationSequence("Active", var_25_66)

	local var_25_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		}
	}

	var_25_8:RegisterAnimationSequence("Active", var_25_67)

	local var_25_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("Active", var_25_68)

	local function var_25_69()
		var_25_6:AnimateSequence("Active")
		var_25_8:AnimateSequence("Active")
		var_25_26:AnimateSequence("Active")
	end

	var_25_0._sequences.Active = var_25_69

	local var_25_70
	local var_25_71 = {
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

	var_25_6:RegisterAnimationSequence("ButtonOverActive", var_25_71)

	local var_25_72 = {
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

	var_25_8:RegisterAnimationSequence("ButtonOverActive", var_25_72)

	local var_25_73 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_25_10:RegisterAnimationSequence("ButtonOverActive", var_25_73)

	local var_25_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("ButtonOverActive", var_25_74)

	local function var_25_75()
		var_25_6:AnimateSequence("ButtonOverActive")
		var_25_8:AnimateSequence("ButtonOverActive")
		var_25_10:AnimateSequence("ButtonOverActive")
		var_25_26:AnimateSequence("ButtonOverActive")
	end

	var_25_0._sequences.ButtonOverActive = var_25_75

	local var_25_76
	local var_25_77 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		}
	}

	var_25_6:RegisterAnimationSequence("ButtonUpActive", var_25_77)

	local var_25_78 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonUpActive", var_25_78)

	local var_25_79 = {
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

	var_25_10:RegisterAnimationSequence("ButtonUpActive", var_25_79)

	local var_25_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("ButtonUpActive", var_25_80)

	local function var_25_81()
		var_25_6:AnimateSequence("ButtonUpActive")
		var_25_8:AnimateSequence("ButtonUpActive")
		var_25_10:AnimateSequence("ButtonUpActive")
		var_25_26:AnimateSequence("ButtonUpActive")
	end

	var_25_0._sequences.ButtonUpActive = var_25_81

	local var_25_82
	local var_25_83 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("Disabled", var_25_83)

	local var_25_84 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("Disabled", var_25_84)

	local var_25_85 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("Disabled", var_25_85)

	local function var_25_86()
		var_25_10:AnimateSequence("Disabled")
		var_25_14:AnimateSequence("Disabled")
		var_25_26:AnimateSequence("Disabled")
	end

	var_25_0._sequences.Disabled = var_25_86

	local var_25_87
	local var_25_88 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonOverDisabled", var_25_88)

	local var_25_89 = {
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

	var_25_10:RegisterAnimationSequence("ButtonOverDisabled", var_25_89)

	local var_25_90 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("ButtonOverDisabled", var_25_90)

	local function var_25_91()
		var_25_8:AnimateSequence("ButtonOverDisabled")
		var_25_10:AnimateSequence("ButtonOverDisabled")
		var_25_26:AnimateSequence("ButtonOverDisabled")
	end

	var_25_0._sequences.ButtonOverDisabled = var_25_91

	local var_25_92
	local var_25_93 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_25_8:RegisterAnimationSequence("ButtonUpDisabled", var_25_93)

	local var_25_94 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("ButtonUpDisabled", var_25_94)

	local var_25_95 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("ButtonUpDisabled", var_25_95)

	local var_25_96 = {
		{
			value = 0.4,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_25_26:RegisterAnimationSequence("ButtonUpDisabled", var_25_96)

	local function var_25_97()
		var_25_8:AnimateSequence("ButtonUpDisabled")
		var_25_10:AnimateSequence("ButtonUpDisabled")
		var_25_14:AnimateSequence("ButtonUpDisabled")
		var_25_26:AnimateSequence("ButtonUpDisabled")
	end

	var_25_0._sequences.ButtonUpDisabled = var_25_97

	local var_25_98
	local var_25_99 = {
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

	var_25_10:RegisterAnimationSequence("DisabledActive", var_25_99)

	local var_25_100 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("DisabledActive", var_25_100)

	local var_25_101 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("DisabledActive", var_25_101)

	local function var_25_102()
		var_25_10:AnimateSequence("DisabledActive")
		var_25_14:AnimateSequence("DisabledActive")
		var_25_26:AnimateSequence("DisabledActive")
	end

	var_25_0._sequences.DisabledActive = var_25_102

	local var_25_103
	local var_25_104 = {
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

	var_25_10:RegisterAnimationSequence("ButtonOverDisabledActive", var_25_104)

	local function var_25_105()
		var_25_10:AnimateSequence("ButtonOverDisabledActive")
	end

	var_25_0._sequences.ButtonOverDisabledActive = var_25_105

	local var_25_106
	local var_25_107 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("ButtonUpDisabledActive", var_25_107)

	local var_25_108 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("ButtonUpDisabledActive", var_25_108)

	local var_25_109 = {
		{
			value = 0.8,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_25_26:RegisterAnimationSequence("ButtonUpDisabledActive", var_25_109)

	local function var_25_110()
		var_25_10:AnimateSequence("ButtonUpDisabledActive")
		var_25_14:AnimateSequence("ButtonUpDisabledActive")
		var_25_26:AnimateSequence("ButtonUpDisabledActive")
	end

	var_25_0._sequences.ButtonUpDisabledActive = var_25_110

	local var_25_111
	local var_25_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -412,
			child = var_25_0.GenericOptionButtonBase.Title
		}
	}

	var_25_4:RegisterAnimationSequence("ShorterTitle", var_25_112)

	local function var_25_113()
		var_25_4:AnimateSequence("ShorterTitle")
	end

	var_25_0._sequences.ShorterTitle = var_25_113

	local var_25_114
	local var_25_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_25_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 412,
			child = var_25_0.GenericOptionButtonBase.Title
		}
	}

	var_25_4:RegisterAnimationSequence("ShorterTitleAR", var_25_115)

	local function var_25_116()
		var_25_4:AnimateSequence("ShorterTitleAR")
	end

	var_25_0._sequences.ShorterTitleAR = var_25_116

	local var_25_117
	local var_25_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -290,
			child = var_25_0.GenericOptionButtonBase.Title
		}
	}

	var_25_4:RegisterAnimationSequence("LongerTitle", var_25_118)

	local var_25_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -237
		}
	}

	var_25_6:RegisterAnimationSequence("LongerTitle", var_25_119)

	local var_25_120 = {
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

	var_25_8:RegisterAnimationSequence("LongerTitle", var_25_120)

	local var_25_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -225
		}
	}

	var_25_10:RegisterAnimationSequence("LongerTitle", var_25_121)

	local var_25_122 = {
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

	var_25_14:RegisterAnimationSequence("LongerTitle", var_25_122)

	local var_25_123 = {
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

	var_25_26:RegisterAnimationSequence("LongerTitle", var_25_123)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_25_0) then
		local var_25_124 = {
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

		var_25_27:RegisterAnimationSequence("LongerTitle", var_25_124)
	end

	local function var_25_125()
		var_25_4:AnimateSequence("LongerTitle")
		var_25_6:AnimateSequence("LongerTitle")
		var_25_8:AnimateSequence("LongerTitle")
		var_25_10:AnimateSequence("LongerTitle")
		var_25_14:AnimateSequence("LongerTitle")
		var_25_26:AnimateSequence("LongerTitle")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_25_0) then
			var_25_27:AnimateSequence("LongerTitle")
		end
	end

	var_25_0._sequences.LongerTitle = var_25_125

	local var_25_126
	local var_25_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 305,
			child = var_25_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_25_0.GenericOptionButtonBase.Title
		}
	}

	var_25_4:RegisterAnimationSequence("LongerTitleAR", var_25_127)

	local var_25_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 245
		}
	}

	var_25_6:RegisterAnimationSequence("LongerTitleAR", var_25_128)

	local var_25_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 245
		}
	}

	var_25_8:RegisterAnimationSequence("LongerTitleAR", var_25_129)

	local var_25_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 238
		}
	}

	var_25_10:RegisterAnimationSequence("LongerTitleAR", var_25_130)

	local var_25_131 = {
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

	var_25_14:RegisterAnimationSequence("LongerTitleAR", var_25_131)

	local var_25_132 = {
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

	var_25_26:RegisterAnimationSequence("LongerTitleAR", var_25_132)

	if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_25_0) then
		local var_25_133 = {
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

		var_25_27:RegisterAnimationSequence("LongerTitleAR", var_25_133)
	end

	local function var_25_134()
		var_25_4:AnimateSequence("LongerTitleAR")
		var_25_6:AnimateSequence("LongerTitleAR")
		var_25_8:AnimateSequence("LongerTitleAR")
		var_25_10:AnimateSequence("LongerTitleAR")
		var_25_14:AnimateSequence("LongerTitleAR")
		var_25_26:AnimateSequence("LongerTitleAR")

		if CONDITIONS.ShouldCreateMoreInfoInnerButton(var_25_0) then
			var_25_27:AnimateSequence("LongerTitleAR")
		end
	end

	var_25_0._sequences.LongerTitleAR = var_25_134

	local var_25_135
	local var_25_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_25_0.GenericOptionButtonBase.Title
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_25_0.GenericOptionButtonBase.Title
		}
	}

	var_25_4:RegisterAnimationSequence("WZWipSetup", var_25_136)

	local var_25_137 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("WZWipSetup", var_25_137)

	local var_25_138 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_25_8:RegisterAnimationSequence("WZWipSetup", var_25_138)

	local var_25_139 = {
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

	var_25_10:RegisterAnimationSequence("WZWipSetup", var_25_139)

	local var_25_140 = {
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

	var_25_12:RegisterAnimationSequence("WZWipSetup", var_25_140)

	local var_25_141 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("WZWipSetup", var_25_141)

	local var_25_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipSetup", var_25_142)

	local function var_25_143()
		var_25_4:AnimateSequence("WZWipSetup")
		var_25_6:AnimateSequence("WZWipSetup")
		var_25_8:AnimateSequence("WZWipSetup")
		var_25_10:AnimateSequence("WZWipSetup")
		var_25_12:AnimateSequence("WZWipSetup")
		var_25_14:AnimateSequence("WZWipSetup")
		var_25_26:AnimateSequence("WZWipSetup")
	end

	var_25_0._sequences.WZWipSetup = var_25_143

	local var_25_144
	local var_25_145 = {
		{
			value = 0.75,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("WZWipButtonOver", var_25_145)

	local var_25_146 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_8:RegisterAnimationSequence("WZWipButtonOver", var_25_146)

	local var_25_147 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("WZWipButtonOver", var_25_147)

	local var_25_148 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("WZWipButtonOver", var_25_148)

	local var_25_149 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipButtonOver", var_25_149)

	local function var_25_150()
		var_25_6:AnimateSequence("WZWipButtonOver")
		var_25_8:AnimateSequence("WZWipButtonOver")
		var_25_10:AnimateSequence("WZWipButtonOver")
		var_25_14:AnimateSequence("WZWipButtonOver")
		var_25_26:AnimateSequence("WZWipButtonOver")
	end

	var_25_0._sequences.WZWipButtonOver = var_25_150

	local var_25_151
	local var_25_152 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("WZWipButtonUp", var_25_152)

	local var_25_153 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_8:RegisterAnimationSequence("WZWipButtonUp", var_25_153)

	local var_25_154 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("WZWipButtonUp", var_25_154)

	local var_25_155 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("WZWipButtonUp", var_25_155)

	local var_25_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipButtonUp", var_25_156)

	local function var_25_157()
		var_25_6:AnimateSequence("WZWipButtonUp")
		var_25_8:AnimateSequence("WZWipButtonUp")
		var_25_10:AnimateSequence("WZWipButtonUp")
		var_25_14:AnimateSequence("WZWipButtonUp")
		var_25_26:AnimateSequence("WZWipButtonUp")
	end

	var_25_0._sequences.WZWipButtonUp = var_25_157

	local var_25_158
	local var_25_159 = {
		{
			value = 0.75,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("WZWipButtonOverActive", var_25_159)

	local var_25_160 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_8:RegisterAnimationSequence("WZWipButtonOverActive", var_25_160)

	local var_25_161 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("WZWipButtonOverActive", var_25_161)

	local var_25_162 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("WZWipButtonOverActive", var_25_162)

	local var_25_163 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipButtonOverActive", var_25_163)

	local function var_25_164()
		var_25_6:AnimateSequence("WZWipButtonOverActive")
		var_25_8:AnimateSequence("WZWipButtonOverActive")
		var_25_10:AnimateSequence("WZWipButtonOverActive")
		var_25_14:AnimateSequence("WZWipButtonOverActive")
		var_25_26:AnimateSequence("WZWipButtonOverActive")
	end

	var_25_0._sequences.WZWipButtonOverActive = var_25_164

	local var_25_165
	local var_25_166 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_25_166)

	local var_25_167 = {
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

	var_25_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_25_167)

	local var_25_168 = {
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

	var_25_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_25_168)

	local var_25_169 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_25_12:RegisterAnimationSequence("WZWipButtonOverDisabled", var_25_169)

	local var_25_170 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("WZWipButtonOverDisabled", var_25_170)

	local var_25_171 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -394
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -362
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
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipButtonOverDisabled", var_25_171)

	local function var_25_172()
		var_25_6:AnimateSequence("WZWipButtonOverDisabled")
		var_25_8:AnimateSequence("WZWipButtonOverDisabled")
		var_25_10:AnimateSequence("WZWipButtonOverDisabled")
		var_25_12:AnimateSequence("WZWipButtonOverDisabled")
		var_25_14:AnimateSequence("WZWipButtonOverDisabled")
		var_25_26:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_25_0._sequences.WZWipButtonOverDisabled = var_25_172

	local var_25_173
	local var_25_174 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_25_8:RegisterAnimationSequence("WZWipButtonOverDisabledActive", var_25_174)

	local var_25_175 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("WZWipButtonOverDisabledActive", var_25_175)

	local var_25_176 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -394
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -362
		},
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
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipButtonOverDisabledActive", var_25_176)

	local function var_25_177()
		var_25_8:AnimateSequence("WZWipButtonOverDisabledActive")
		var_25_10:AnimateSequence("WZWipButtonOverDisabledActive")
		var_25_26:AnimateSequence("WZWipButtonOverDisabledActive")
	end

	var_25_0._sequences.WZWipButtonOverDisabledActive = var_25_177

	local var_25_178
	local var_25_179 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("WZWipButtonUpActive", var_25_179)

	local var_25_180 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		}
	}

	var_25_8:RegisterAnimationSequence("WZWipButtonUpActive", var_25_180)

	local var_25_181 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("WZWipButtonUpActive", var_25_181)

	local var_25_182 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipButtonUpActive", var_25_182)

	local function var_25_183()
		var_25_6:AnimateSequence("WZWipButtonUpActive")
		var_25_8:AnimateSequence("WZWipButtonUpActive")
		var_25_10:AnimateSequence("WZWipButtonUpActive")
		var_25_26:AnimateSequence("WZWipButtonUpActive")
	end

	var_25_0._sequences.WZWipButtonUpActive = var_25_183

	local var_25_184
	local var_25_185 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_25_185)

	local var_25_186 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_8:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_25_186)

	local var_25_187 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_25_187)

	local var_25_188 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_25_188)

	local var_25_189 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -393
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -363
		},
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
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipButtonUpDisabledActive", var_25_189)

	local function var_25_190()
		var_25_6:AnimateSequence("WZWipButtonUpDisabledActive")
		var_25_8:AnimateSequence("WZWipButtonUpDisabledActive")
		var_25_10:AnimateSequence("WZWipButtonUpDisabledActive")
		var_25_14:AnimateSequence("WZWipButtonUpDisabledActive")
		var_25_26:AnimateSequence("WZWipButtonUpDisabledActive")
	end

	var_25_0._sequences.WZWipButtonUpDisabledActive = var_25_190

	local var_25_191
	local var_25_192 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_25_192)

	local var_25_193 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_25_193)

	local var_25_194 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_25_194)

	local var_25_195 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -393
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -363
		},
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
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipButtonUpDisabled", var_25_195)

	local function var_25_196()
		var_25_6:AnimateSequence("WZWipButtonUpDisabled")
		var_25_8:AnimateSequence("WZWipButtonUpDisabled")
		var_25_10:AnimateSequence("WZWipButtonUpDisabled")
		var_25_26:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_25_0._sequences.WZWipButtonUpDisabled = var_25_196

	local var_25_197
	local var_25_198 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("WZWipDisabled", var_25_198)

	local var_25_199 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("WZWipDisabled", var_25_199)

	local var_25_200 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("WZWipDisabled", var_25_200)

	local var_25_201 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipDisabled", var_25_201)

	local function var_25_202()
		var_25_6:AnimateSequence("WZWipDisabled")
		var_25_10:AnimateSequence("WZWipDisabled")
		var_25_14:AnimateSequence("WZWipDisabled")
		var_25_26:AnimateSequence("WZWipDisabled")
	end

	var_25_0._sequences.WZWipDisabled = var_25_202

	local var_25_203
	local var_25_204 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("WZWipDisabledActive", var_25_204)

	local var_25_205 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("WZWipDisabledActive", var_25_205)

	local var_25_206 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("WZWipDisabledActive", var_25_206)

	local var_25_207 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipDisabledActive", var_25_207)

	local function var_25_208()
		var_25_6:AnimateSequence("WZWipDisabledActive")
		var_25_10:AnimateSequence("WZWipDisabledActive")
		var_25_14:AnimateSequence("WZWipDisabledActive")
		var_25_26:AnimateSequence("WZWipDisabledActive")
	end

	var_25_0._sequences.WZWipDisabledActive = var_25_208

	local var_25_209
	local var_25_210 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_25_0.GenericOptionButtonBase.Title
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

	var_25_4:RegisterAnimationSequence("WZWipLocked", var_25_210)

	local var_25_211 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("WZWipLocked", var_25_211)

	local var_25_212 = {
		{
			value = 0.2,
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

	var_25_10:RegisterAnimationSequence("WZWipLocked", var_25_212)

	local var_25_213 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("WZWipLocked", var_25_213)

	local var_25_214 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipLocked", var_25_214)

	local function var_25_215()
		var_25_4:AnimateSequence("WZWipLocked")
		var_25_6:AnimateSequence("WZWipLocked")
		var_25_10:AnimateSequence("WZWipLocked")
		var_25_14:AnimateSequence("WZWipLocked")
		var_25_26:AnimateSequence("WZWipLocked")
	end

	var_25_0._sequences.WZWipLocked = var_25_215

	local var_25_216
	local var_25_217 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -273
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -243
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipUpdateSquadFillLockPosition", var_25_217)

	local function var_25_218()
		var_25_26:AnimateSequence("WZWipUpdateSquadFillLockPosition")
	end

	var_25_0._sequences.WZWipUpdateSquadFillLockPosition = var_25_218

	var_25_0:addEventHandler("button_up", function(arg_58_0, arg_58_1)
		if not arg_58_1.controller then
			local var_58_0 = var_25_1
		end

		ACTIONS.AnimateSequenceByElement(var_25_0, {
			elementPath = "self.ArrowRight",
			sequenceName = "ButtonUp",
			elementName = "ArrowRight"
		})
		ACTIONS.AnimateSequenceByElement(var_25_0, {
			elementPath = "self.ArrowLeft",
			sequenceName = "ButtonUp",
			elementName = "ArrowLeft"
		})
	end)
	var_0_5(var_25_0, var_25_1, arg_25_1)

	return var_25_0
end

MenuBuilder.registerType("GenericCycleList", GenericCycleList)
LockTable(_M)
