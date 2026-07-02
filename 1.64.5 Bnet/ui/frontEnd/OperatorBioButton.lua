module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0._operatorInfo.isSelected or false
end

local function var_0_1(arg_2_0)
	return arg_2_0._operatorInfo.favorited or false
end

local function var_0_2(arg_3_0)
	return arg_3_0._operatorInfo.isUnlocked or false
end

local function var_0_3(arg_4_0)
	return arg_4_0._operatorInfo.isCurrentViewed or false
end

local function var_0_4(arg_5_0, arg_5_1)
	assert(arg_5_1.state)

	local var_5_0 = ""

	if arg_5_0:GetIsSelected() then
		var_5_0 = "Selected"
	elseif arg_5_0:GetIsCurrentlyViewedOperator() then
		var_5_0 = arg_5_0:GetIsUnlocked() and "Viewed" or "ViewedLocked"
	elseif not arg_5_0:GetIsUnlocked() then
		var_5_0 = "Locked"
	else
		ACTIONS.AnimateSequence(arg_5_0, "Unlocked")
	end

	WZWIP.AnimateThemeElement(arg_5_0, arg_5_1.state .. var_5_0)
end

local function var_0_5(arg_6_0, arg_6_1)
	assert(arg_6_0.Selected)

	arg_6_0._operatorInfo.isSelected = arg_6_1

	ACTIONS.AnimateSequence(arg_6_0.Selected, arg_6_1 and "On" or "Off")
	var_0_4(arg_6_0, {
		state = arg_6_1 and "ButtonOver" or "ButtonUp"
	})
end

local function var_0_6(arg_7_0, arg_7_1)
	arg_7_0._operatorInfo.isCurrentViewed = arg_7_1

	var_0_4(arg_7_0, {
		state = arg_7_1 and "ButtonOver" or "ButtonUp"
	})
end

local function var_0_7(arg_8_0)
	var_0_4(arg_8_0, {
		state = "ButtonUp"
	})
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_0._operatorInfo = arg_9_2
	arg_9_0._controllerIndex = arg_9_1

	arg_9_0.OperatorIcon:setImage(RegisterMaterial(arg_9_2.icon))

	arg_9_0._isSelected = arg_9_0.isSelected

	local var_9_0 = OPERATOR.GetOperatorGameSourceID(arg_9_2.ref)
	local var_9_1 = LUI.GetAnimForGameSource(var_9_0)

	ACTIONS.AnimateSequence(arg_9_0.Favorited, arg_9_2.favorited and "On" or "Off")
	ACTIONS.AnimateSequence(arg_9_0.Favorited, var_9_1)

	local function var_9_2(arg_10_0, arg_10_1)
		if not arg_9_3._activeButton or arg_9_3._activeButton ~= arg_10_0 then
			var_0_4(arg_10_0, {
				state = "ButtonOver"
			})
			arg_9_3:OnChildFocused(arg_10_0, arg_9_1)
		end
	end

	arg_9_0:registerEventHandler("button_over", var_9_2)
	var_0_4(arg_9_0, {
		state = "ButtonUp"
	})
end

local function var_0_9(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.LoseButtonFocus = var_0_7
	arg_11_0.Setup = var_0_8
	arg_11_0.GetIsSelected = var_0_0
	arg_11_0.GetIsFavorited = var_0_1
	arg_11_0.GetIsUnlocked = var_0_2
	arg_11_0.GetIsCurrentlyViewedOperator = var_0_3
	arg_11_0.SetButtonState = var_0_4
	arg_11_0.SetSelected = var_0_5
	arg_11_0.SetViewedOperator = var_0_6

	arg_11_0.OperatorIcon:SetMask(arg_11_0.Mask)
	arg_11_0.Overlay:SetMask(arg_11_0.Mask)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_11_0, "WZWipSetup")
	end
end

function OperatorBioButton(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIButton.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 144 * _1080p, 0, 146 * _1080p)

	var_12_0.id = "OperatorBioButton"
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

	var_12_4.id = "OperatorIcon"

	var_12_4:SetAlpha(0.6, 0)
	var_12_4:SetColorOp(COLOR_OP.saturation, 0)
	var_12_4:SetColorOpParam(0.75, 0)
	var_12_4:setImage(RegisterMaterial("ui_operator_west_charly_portrait"), 0)
	var_12_0:addElement(var_12_4)

	var_12_0.OperatorIcon = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "Foreground"

	var_12_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_12_6:SetAlpha(0, 0)
	var_12_0:addElement(var_12_6)

	var_12_0.Foreground = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIImage.new()

	var_12_8.id = "Mask"

	var_12_8:setImage(RegisterMaterial("stencil_mask"), 0)
	var_12_0:addElement(var_12_8)

	var_12_0.Mask = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIImage.new()

	var_12_10.id = "Overlay"

	var_12_10:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_12_10:SetAlpha(0, 0)
	var_12_10:setImage(RegisterMaterial("topBottomGradient"), 0)
	var_12_10:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_12_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -73, _1080p * 73, _1080p * -73, _1080p * 73)
	var_12_0:addElement(var_12_10)

	var_12_0.Overlay = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIImage.new()

	var_12_12.id = "Vignette"

	var_12_12:SetRGBFromInt(0, 0)
	var_12_12:SetAlpha(0.4, 0)
	var_12_12:SetColorOpParam(1, 0)
	var_12_12:setImage(RegisterMaterial("bkgd_vignette"), 0)
	var_12_12:SetBlendMode(BLEND_MODE.multiply)
	var_12_0:addElement(var_12_12)

	var_12_0.Vignette = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIImage.new()

	var_12_14.id = "Border"

	var_12_14:setImage(RegisterMaterial("ui_operator_bio_box_thumbnail"), 0)
	var_12_0:addElement(var_12_14)

	var_12_0.Border = var_12_14

	local var_12_15
	local var_12_16 = LUI.UIImage.new()

	var_12_16.id = "Lock"

	var_12_16:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_12_16:SetScale(-0.67, 0)
	var_12_16:SetColorOp(COLOR_OP.saturation, 0)
	var_12_16:SetColorOpParam(1, 0)
	var_12_16:setImage(RegisterMaterial("icon_lock"), 0)
	var_12_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 7, _1080p * 95, _1080p * -96, _1080p * -8)
	var_12_0:addElement(var_12_16)

	var_12_0.Lock = var_12_16

	local var_12_17
	local var_12_18 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_12_1
	})

	var_12_18.id = "HighlightBottom"

	var_12_18:SetAlpha(0, 0)
	var_12_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -73, _1080p * 73, _1080p * 144, _1080p * 146)
	var_12_0:addElement(var_12_18)

	var_12_0.HighlightBottom = var_12_18

	local var_12_19
	local var_12_20 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_12_1
	})

	var_12_20.id = "HighlightTop"

	var_12_20:SetAlpha(0, 0)
	var_12_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -72, _1080p * 72, 0, _1080p * 2)
	var_12_0:addElement(var_12_20)

	var_12_0.HighlightTop = var_12_20

	local var_12_21
	local var_12_22 = MenuBuilder.BuildRegisteredType("FavoritedNotification", {
		controllerIndex = var_12_1
	})

	var_12_22.id = "Favorited"

	var_12_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -1, _1080p * 47, 0, _1080p * 48)
	var_12_0:addElement(var_12_22)

	var_12_0.Favorited = var_12_22

	local var_12_23
	local var_12_24 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_12_1
	})

	var_12_24.id = "Selected"

	var_12_24:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -29, _1080p * -5, _1080p * 5, _1080p * 29)
	var_12_0:addElement(var_12_24)

	var_12_0.Selected = var_12_24

	local var_12_25
	local var_12_26 = {
		borderThicknessLeft = _1080p * 3,
		borderThicknessRight = _1080p * 3,
		borderThicknessTop = _1080p * 3,
		borderThicknessBottom = _1080p * 3
	}
	local var_12_27 = LUI.UIBorder.new(var_12_26)

	var_12_27.id = "BorderEquipped"

	var_12_27:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_12_27:SetAlpha(0, 0)
	var_12_27:SetBorderThicknessLeft(_1080p * 3, 0)
	var_12_27:SetBorderThicknessRight(_1080p * 3, 0)
	var_12_27:SetBorderThicknessTop(_1080p * 3, 0)
	var_12_27:SetBorderThicknessBottom(_1080p * 3, 0)
	var_12_27:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -1, _1080p * 1, _1080p * -1, 0)
	var_12_0:addElement(var_12_27)

	var_12_0.BorderEquipped = var_12_27

	local function var_12_28()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_28

	local var_12_29
	local var_12_30 = {
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.75,
			duration = 200,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ButtonOver", var_12_30)

	local var_12_31 = {
		{
			value = 0.2,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.highlight.frontEnd
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOver", var_12_31)

	local var_12_32 = {
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOver", var_12_32)

	local var_12_33 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonOver", var_12_33)

	local var_12_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonOver", var_12_34)

	local var_12_35 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("ButtonOver", var_12_35)

	local var_12_36 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ButtonOver", var_12_36)

	local function var_12_37()
		var_12_4:AnimateSequence("ButtonOver")
		var_12_6:AnimateSequence("ButtonOver")
		var_12_12:AnimateSequence("ButtonOver")
		var_12_14:AnimateSequence("ButtonOver")
		var_12_16:AnimateSequence("ButtonOver")
		var_12_18:AnimateSequence("ButtonOver")
		var_12_20:AnimateSequence("ButtonOver")
	end

	var_12_0._sequences.ButtonOver = var_12_37

	local var_12_38
	local var_12_39 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.75,
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ButtonUp", var_12_39)

	local var_12_40 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonUp", var_12_40)

	local var_12_41 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonUp", var_12_41)

	local var_12_42 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonUp", var_12_42)

	local var_12_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonUp", var_12_43)

	local var_12_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("ButtonUp", var_12_44)

	local var_12_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ButtonUp", var_12_45)

	local function var_12_46()
		var_12_4:AnimateSequence("ButtonUp")
		var_12_6:AnimateSequence("ButtonUp")
		var_12_10:AnimateSequence("ButtonUp")
		var_12_14:AnimateSequence("ButtonUp")
		var_12_16:AnimateSequence("ButtonUp")
		var_12_18:AnimateSequence("ButtonUp")
		var_12_20:AnimateSequence("ButtonUp")
	end

	var_12_0._sequences.ButtonUp = var_12_46

	local var_12_47
	local var_12_48 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.tabBackground
		},
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ButtonOverLocked", var_12_48)

	local var_12_49 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.highlight.frontEnd
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOverLocked", var_12_49)

	local var_12_50 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonOverLocked", var_12_50)

	local var_12_51 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonOverLocked", var_12_51)

	local var_12_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonOverLocked", var_12_52)

	local var_12_53 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("ButtonOverLocked", var_12_53)

	local var_12_54 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ButtonOverLocked", var_12_54)

	local function var_12_55()
		var_12_4:AnimateSequence("ButtonOverLocked")
		var_12_6:AnimateSequence("ButtonOverLocked")
		var_12_10:AnimateSequence("ButtonOverLocked")
		var_12_14:AnimateSequence("ButtonOverLocked")
		var_12_16:AnimateSequence("ButtonOverLocked")
		var_12_18:AnimateSequence("ButtonOverLocked")
		var_12_20:AnimateSequence("ButtonOverLocked")
	end

	var_12_0._sequences.ButtonOverLocked = var_12_55

	local var_12_56
	local var_12_57 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.tabBackground
		}
	}

	var_12_4:RegisterAnimationSequence("ButtonUpLocked", var_12_57)

	local var_12_58 = {
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonUpLocked", var_12_58)

	local var_12_59 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_12_10:RegisterAnimationSequence("ButtonUpLocked", var_12_59)

	local var_12_60 = {
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonUpLocked", var_12_60)

	local var_12_61 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ButtonUpLocked", var_12_61)

	local var_12_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonUpLocked", var_12_62)

	local var_12_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("ButtonUpLocked", var_12_63)

	local var_12_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("ButtonUpLocked", var_12_64)

	local function var_12_65()
		var_12_4:AnimateSequence("ButtonUpLocked")
		var_12_6:AnimateSequence("ButtonUpLocked")
		var_12_10:AnimateSequence("ButtonUpLocked")
		var_12_12:AnimateSequence("ButtonUpLocked")
		var_12_14:AnimateSequence("ButtonUpLocked")
		var_12_16:AnimateSequence("ButtonUpLocked")
		var_12_18:AnimateSequence("ButtonUpLocked")
		var_12_20:AnimateSequence("ButtonUpLocked")
	end

	var_12_0._sequences.ButtonUpLocked = var_12_65

	local var_12_66
	local var_12_67 = {
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

	var_12_6:RegisterAnimationSequence("WZWipSetup", var_12_67)

	local var_12_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_12_10:RegisterAnimationSequence("WZWipSetup", var_12_68)

	local var_12_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_12_14:RegisterAnimationSequence("WZWipSetup", var_12_69)

	local var_12_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_12_16:RegisterAnimationSequence("WZWipSetup", var_12_70)

	local function var_12_71()
		var_12_6:AnimateSequence("WZWipSetup")
		var_12_10:AnimateSequence("WZWipSetup")
		var_12_14:AnimateSequence("WZWipSetup")
		var_12_16:AnimateSequence("WZWipSetup")
	end

	var_12_0._sequences.WZWipSetup = var_12_71

	local var_12_72
	local var_12_73 = {
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("WZWipButtonOver", var_12_73)

	local var_12_74 = {
		{
			value = 0.2,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("WZWipButtonOver", var_12_74)

	local var_12_75 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("WZWipButtonOver", var_12_75)

	local var_12_76 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("WZWipButtonOver", var_12_76)

	local var_12_77 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("WZWipButtonOver", var_12_77)

	local var_12_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("WZWipButtonOver", var_12_78)

	local function var_12_79()
		var_12_4:AnimateSequence("WZWipButtonOver")
		var_12_12:AnimateSequence("WZWipButtonOver")
		var_12_14:AnimateSequence("WZWipButtonOver")
		var_12_18:AnimateSequence("WZWipButtonOver")
		var_12_20:AnimateSequence("WZWipButtonOver")
		var_12_27:AnimateSequence("WZWipButtonOver")
	end

	var_12_0._sequences.WZWipButtonOver = var_12_79

	local var_12_80
	local var_12_81 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.tabBackground
		},
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("WZWipButtonOverLocked", var_12_81)

	local var_12_82 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("WZWipButtonOverLocked", var_12_82)

	local var_12_83 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("WZWipButtonOverLocked", var_12_83)

	local var_12_84 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("WZWipButtonOverLocked", var_12_84)

	local var_12_85 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("WZWipButtonOverLocked", var_12_85)

	local var_12_86 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("WZWipButtonOverLocked", var_12_86)

	local var_12_87 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("WZWipButtonOverLocked", var_12_87)

	local var_12_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("WZWipButtonOverLocked", var_12_88)

	local function var_12_89()
		var_12_4:AnimateSequence("WZWipButtonOverLocked")
		var_12_6:AnimateSequence("WZWipButtonOverLocked")
		var_12_10:AnimateSequence("WZWipButtonOverLocked")
		var_12_14:AnimateSequence("WZWipButtonOverLocked")
		var_12_16:AnimateSequence("WZWipButtonOverLocked")
		var_12_18:AnimateSequence("WZWipButtonOverLocked")
		var_12_20:AnimateSequence("WZWipButtonOverLocked")
		var_12_27:AnimateSequence("WZWipButtonOverLocked")
	end

	var_12_0._sequences.WZWipButtonOverLocked = var_12_89

	local var_12_90
	local var_12_91 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.75,
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("WZWipButtonUp", var_12_91)

	local var_12_92 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("WZWipButtonUp", var_12_92)

	local var_12_93 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("WZWipButtonUp", var_12_93)

	local var_12_94 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("WZWipButtonUp", var_12_94)

	local var_12_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("WZWipButtonUp", var_12_95)

	local var_12_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("WZWipButtonUp", var_12_96)

	local var_12_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("WZWipButtonUp", var_12_97)

	local var_12_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("WZWipButtonUp", var_12_98)

	local function var_12_99()
		var_12_4:AnimateSequence("WZWipButtonUp")
		var_12_6:AnimateSequence("WZWipButtonUp")
		var_12_10:AnimateSequence("WZWipButtonUp")
		var_12_12:AnimateSequence("WZWipButtonUp")
		var_12_14:AnimateSequence("WZWipButtonUp")
		var_12_18:AnimateSequence("WZWipButtonUp")
		var_12_20:AnimateSequence("WZWipButtonUp")
		var_12_27:AnimateSequence("WZWipButtonUp")
	end

	var_12_0._sequences.WZWipButtonUp = var_12_99

	local var_12_100
	local var_12_101 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("WZWipButtonUpLocked", var_12_101)

	local var_12_102 = {
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_12_6:RegisterAnimationSequence("WZWipButtonUpLocked", var_12_102)

	local var_12_103 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("WZWipButtonUpLocked", var_12_103)

	local var_12_104 = {
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("WZWipButtonUpLocked", var_12_104)

	local var_12_105 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("WZWipButtonUpLocked", var_12_105)

	local var_12_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("WZWipButtonUpLocked", var_12_106)

	local var_12_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("WZWipButtonUpLocked", var_12_107)

	local var_12_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("WZWipButtonUpLocked", var_12_108)

	local var_12_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("WZWipButtonUpLocked", var_12_109)

	local function var_12_110()
		var_12_4:AnimateSequence("WZWipButtonUpLocked")
		var_12_6:AnimateSequence("WZWipButtonUpLocked")
		var_12_10:AnimateSequence("WZWipButtonUpLocked")
		var_12_12:AnimateSequence("WZWipButtonUpLocked")
		var_12_14:AnimateSequence("WZWipButtonUpLocked")
		var_12_16:AnimateSequence("WZWipButtonUpLocked")
		var_12_18:AnimateSequence("WZWipButtonUpLocked")
		var_12_20:AnimateSequence("WZWipButtonUpLocked")
		var_12_27:AnimateSequence("WZWipButtonUpLocked")
	end

	var_12_0._sequences.WZWipButtonUpLocked = var_12_110

	local var_12_111
	local var_12_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		}
	}

	var_12_14:RegisterAnimationSequence("Equipped", var_12_112)

	local var_12_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		}
	}

	var_12_18:RegisterAnimationSequence("Equipped", var_12_113)

	local var_12_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		}
	}

	var_12_20:RegisterAnimationSequence("Equipped", var_12_114)

	local function var_12_115()
		var_12_14:AnimateSequence("Equipped")
		var_12_18:AnimateSequence("Equipped")
		var_12_20:AnimateSequence("Equipped")
	end

	var_12_0._sequences.Equipped = var_12_115

	local var_12_116
	local var_12_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_12_14:RegisterAnimationSequence("UnEquipped", var_12_117)

	local var_12_118 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_12_18:RegisterAnimationSequence("UnEquipped", var_12_118)

	local var_12_119 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_12_20:RegisterAnimationSequence("UnEquipped", var_12_119)

	local function var_12_120()
		var_12_14:AnimateSequence("UnEquipped")
		var_12_18:AnimateSequence("UnEquipped")
		var_12_20:AnimateSequence("UnEquipped")
	end

	var_12_0._sequences.UnEquipped = var_12_120

	local var_12_121
	local var_12_122 = {
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("WZWipButtonOverSelected", var_12_122)

	local var_12_123 = {
		{
			value = 0.2,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("WZWipButtonOverSelected", var_12_123)

	local var_12_124 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("WZWipButtonOverSelected", var_12_124)

	local var_12_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("WZWipButtonOverSelected", var_12_125)

	local var_12_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("WZWipButtonOverSelected", var_12_126)

	local var_12_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("WZWipButtonOverSelected", var_12_127)

	local var_12_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("WZWipButtonOverSelected", var_12_128)

	local function var_12_129()
		var_12_4:AnimateSequence("WZWipButtonOverSelected")
		var_12_12:AnimateSequence("WZWipButtonOverSelected")
		var_12_14:AnimateSequence("WZWipButtonOverSelected")
		var_12_16:AnimateSequence("WZWipButtonOverSelected")
		var_12_18:AnimateSequence("WZWipButtonOverSelected")
		var_12_20:AnimateSequence("WZWipButtonOverSelected")
		var_12_27:AnimateSequence("WZWipButtonOverSelected")
	end

	var_12_0._sequences.WZWipButtonOverSelected = var_12_129

	local var_12_130
	local var_12_131 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.75,
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("WZWipButtonUpSelected", var_12_131)

	local var_12_132 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("WZWipButtonUpSelected", var_12_132)

	local var_12_133 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("WZWipButtonUpSelected", var_12_133)

	local var_12_134 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("WZWipButtonUpSelected", var_12_134)

	local var_12_135 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("WZWipButtonUpSelected", var_12_135)

	local var_12_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("WZWipButtonUpSelected", var_12_136)

	local var_12_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("WZWipButtonUpSelected", var_12_137)

	local var_12_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("WZWipButtonUpSelected", var_12_138)

	local var_12_139 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("WZWipButtonUpSelected", var_12_139)

	local function var_12_140()
		var_12_4:AnimateSequence("WZWipButtonUpSelected")
		var_12_6:AnimateSequence("WZWipButtonUpSelected")
		var_12_10:AnimateSequence("WZWipButtonUpSelected")
		var_12_12:AnimateSequence("WZWipButtonUpSelected")
		var_12_14:AnimateSequence("WZWipButtonUpSelected")
		var_12_16:AnimateSequence("WZWipButtonUpSelected")
		var_12_18:AnimateSequence("WZWipButtonUpSelected")
		var_12_20:AnimateSequence("WZWipButtonUpSelected")
		var_12_27:AnimateSequence("WZWipButtonUpSelected")
	end

	var_12_0._sequences.WZWipButtonUpSelected = var_12_140

	local var_12_141
	local var_12_142 = {
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("WZWipButtonOverViewed", var_12_142)

	local var_12_143 = {
		{
			value = 0.2,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("WZWipButtonOverViewed", var_12_143)

	local var_12_144 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("WZWipButtonOverViewed", var_12_144)

	local var_12_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("WZWipButtonOverViewed", var_12_145)

	local var_12_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("WZWipButtonOverViewed", var_12_146)

	local var_12_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("WZWipButtonOverViewed", var_12_147)

	local var_12_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("WZWipButtonOverViewed", var_12_148)

	local function var_12_149()
		var_12_4:AnimateSequence("WZWipButtonOverViewed")
		var_12_12:AnimateSequence("WZWipButtonOverViewed")
		var_12_14:AnimateSequence("WZWipButtonOverViewed")
		var_12_16:AnimateSequence("WZWipButtonOverViewed")
		var_12_18:AnimateSequence("WZWipButtonOverViewed")
		var_12_20:AnimateSequence("WZWipButtonOverViewed")
		var_12_27:AnimateSequence("WZWipButtonOverViewed")
	end

	var_12_0._sequences.WZWipButtonOverViewed = var_12_149

	local var_12_150
	local var_12_151 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.75,
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("WZWipButtonUpViewed", var_12_151)

	local var_12_152 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("WZWipButtonUpViewed", var_12_152)

	local var_12_153 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("WZWipButtonUpViewed", var_12_153)

	local var_12_154 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("WZWipButtonUpViewed", var_12_154)

	local var_12_155 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("WZWipButtonUpViewed", var_12_155)

	local var_12_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("WZWipButtonUpViewed", var_12_156)

	local var_12_157 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("WZWipButtonUpViewed", var_12_157)

	local var_12_158 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("WZWipButtonUpViewed", var_12_158)

	local var_12_159 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("WZWipButtonUpViewed", var_12_159)

	local function var_12_160()
		var_12_4:AnimateSequence("WZWipButtonUpViewed")
		var_12_6:AnimateSequence("WZWipButtonUpViewed")
		var_12_10:AnimateSequence("WZWipButtonUpViewed")
		var_12_12:AnimateSequence("WZWipButtonUpViewed")
		var_12_14:AnimateSequence("WZWipButtonUpViewed")
		var_12_16:AnimateSequence("WZWipButtonUpViewed")
		var_12_18:AnimateSequence("WZWipButtonUpViewed")
		var_12_20:AnimateSequence("WZWipButtonUpViewed")
		var_12_27:AnimateSequence("WZWipButtonUpViewed")
	end

	var_12_0._sequences.WZWipButtonUpViewed = var_12_160

	local var_12_161
	local var_12_162 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("WZWipButtonDeny", var_12_162)

	local function var_12_163()
		var_12_27:AnimateSequence("WZWipButtonDeny")
	end

	var_12_0._sequences.WZWipButtonDeny = var_12_163

	local var_12_164
	local var_12_165 = {
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.tabBackground
		}
	}

	var_12_4:RegisterAnimationSequence("WZWipButtonOverViewedLocked", var_12_165)

	local var_12_166 = {
		{
			value = 0.2,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("WZWipButtonOverViewedLocked", var_12_166)

	local var_12_167 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("WZWipButtonOverViewedLocked", var_12_167)

	local var_12_168 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("WZWipButtonOverViewedLocked", var_12_168)

	local var_12_169 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("WZWipButtonOverViewedLocked", var_12_169)

	local var_12_170 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("WZWipButtonOverViewedLocked", var_12_170)

	local var_12_171 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("WZWipButtonOverViewedLocked", var_12_171)

	local function var_12_172()
		var_12_4:AnimateSequence("WZWipButtonOverViewedLocked")
		var_12_12:AnimateSequence("WZWipButtonOverViewedLocked")
		var_12_14:AnimateSequence("WZWipButtonOverViewedLocked")
		var_12_16:AnimateSequence("WZWipButtonOverViewedLocked")
		var_12_18:AnimateSequence("WZWipButtonOverViewedLocked")
		var_12_20:AnimateSequence("WZWipButtonOverViewedLocked")
		var_12_27:AnimateSequence("WZWipButtonOverViewedLocked")
	end

	var_12_0._sequences.WZWipButtonOverViewedLocked = var_12_172

	local var_12_173
	local var_12_174 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.25,
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.tabBackground
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_12_4:RegisterAnimationSequence("WZWipButtonUpViewedLocked", var_12_174)

	local var_12_175 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("WZWipButtonUpViewedLocked", var_12_175)

	local var_12_176 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("WZWipButtonUpViewedLocked", var_12_176)

	local var_12_177 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("WZWipButtonUpViewedLocked", var_12_177)

	local var_12_178 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("WZWipButtonUpViewedLocked", var_12_178)

	local var_12_179 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("WZWipButtonUpViewedLocked", var_12_179)

	local var_12_180 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("WZWipButtonUpViewedLocked", var_12_180)

	local var_12_181 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("WZWipButtonUpViewedLocked", var_12_181)

	local var_12_182 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_27:RegisterAnimationSequence("WZWipButtonUpViewedLocked", var_12_182)

	local function var_12_183()
		var_12_4:AnimateSequence("WZWipButtonUpViewedLocked")
		var_12_6:AnimateSequence("WZWipButtonUpViewedLocked")
		var_12_10:AnimateSequence("WZWipButtonUpViewedLocked")
		var_12_12:AnimateSequence("WZWipButtonUpViewedLocked")
		var_12_14:AnimateSequence("WZWipButtonUpViewedLocked")
		var_12_16:AnimateSequence("WZWipButtonUpViewedLocked")
		var_12_18:AnimateSequence("WZWipButtonUpViewedLocked")
		var_12_20:AnimateSequence("WZWipButtonUpViewedLocked")
		var_12_27:AnimateSequence("WZWipButtonUpViewedLocked")
	end

	var_12_0._sequences.WZWipButtonUpViewedLocked = var_12_183

	local var_12_184
	local var_12_185 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("Unlocked", var_12_185)

	local function var_12_186()
		var_12_16:AnimateSequence("Unlocked")
	end

	var_12_0._sequences.Unlocked = var_12_186

	var_0_9(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("OperatorBioButton", OperatorBioButton)
LockTable(_M)
