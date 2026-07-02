module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = OPERATOR.IsUnlocked(arg_1_0._controllerIndex, arg_1_0._operatorData.ref)

	ACTIONS.AnimateSequence(arg_1_0, var_1_0 and "ButtonUp" or "ButtonUpLocked")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0._operatorData = arg_2_2
	arg_2_0._controllerIndex = arg_2_1

	arg_2_0.OperatorIcon:setImage(RegisterMaterial(arg_2_2.icon))

	local function var_2_0(arg_3_0, arg_3_1)
		if not arg_2_3._activeButton or arg_2_3._activeButton ~= arg_3_0 then
			local var_3_0 = OPERATOR.IsUnlocked(arg_3_0._controllerIndex, arg_3_0._operatorData.ref)

			ACTIONS.AnimateSequence(arg_3_0, var_3_0 and "ButtonOver" or "ButtonOverLocked")
			arg_2_3:OnChildFocused(arg_3_0, arg_2_1)
		end
	end

	if not OPERATOR.IsUnlocked(arg_2_1, arg_2_2.ref) then
		ACTIONS.AnimateSequence(arg_2_0, "ButtonUpLocked")
	end

	arg_2_0:registerEventHandler("button_over", var_2_0)
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.LoseButtonFocus = var_0_0
	arg_4_0.Setup = var_0_1

	arg_4_0.OperatorIcon:SetMask(arg_4_0.Mask)
	arg_4_0.Overlay:SetMask(arg_4_0.Mask)
end

function OperatorBioButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 144 * _1080p, 0, 146 * _1080p)

	var_5_0.id = "OperatorBioButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "OperatorIcon"

	var_5_4:SetAlpha(0.6, 0)
	var_5_4:SetColorOp(COLOR_OP.saturation, 0)
	var_5_4:SetColorOpParam(0.75, 0)
	var_5_4:setImage(RegisterMaterial("ui_operator_west_charly_portrait"), 0)
	var_5_0:addElement(var_5_4)

	var_5_0.OperatorIcon = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Foreground"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6:SetAlpha(0, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Foreground = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Mask"

	var_5_8:setImage(RegisterMaterial("stencil_mask"), 0)
	var_5_0:addElement(var_5_8)

	var_5_0.Mask = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Overlay"

	var_5_10:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_10:SetAlpha(0, 0)
	var_5_10:setImage(RegisterMaterial("topBottomGradient"), 0)
	var_5_10:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -73, _1080p * 73, _1080p * -73, _1080p * 73)
	var_5_0:addElement(var_5_10)

	var_5_0.Overlay = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Vignette"

	var_5_12:SetRGBFromInt(0, 0)
	var_5_12:SetAlpha(0.4, 0)
	var_5_12:SetColorOpParam(1, 0)
	var_5_12:setImage(RegisterMaterial("bkgd_vignette"), 0)
	var_5_12:SetBlendMode(BLEND_MODE.multiply)
	var_5_0:addElement(var_5_12)

	var_5_0.Vignette = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "Border"

	var_5_14:setImage(RegisterMaterial("ui_operator_bio_box_thumbnail"), 0)
	var_5_0:addElement(var_5_14)

	var_5_0.Border = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIImage.new()

	var_5_16.id = "Lock"

	var_5_16:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_5_16:SetAlpha(0, 0)
	var_5_16:SetScale(-0.67, 0)
	var_5_16:SetColorOp(COLOR_OP.saturation, 0)
	var_5_16:SetColorOpParam(1, 0)
	var_5_16:setImage(RegisterMaterial("icon_lock"), 0)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 7, _1080p * 95, _1080p * -96, _1080p * -8)
	var_5_0:addElement(var_5_16)

	var_5_0.Lock = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "HighlightBottom"

	var_5_18:SetAlpha(0, 0)
	var_5_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -73, _1080p * 73, _1080p * 144, _1080p * 146)
	var_5_0:addElement(var_5_18)

	var_5_0.HighlightBottom = var_5_18

	local var_5_19
	local var_5_20 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_20.id = "HighlightTop"

	var_5_20:SetAlpha(0, 0)
	var_5_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -72, _1080p * 72, 0, _1080p * 2)
	var_5_0:addElement(var_5_20)

	var_5_0.HighlightTop = var_5_20

	local function var_5_21()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_21

	local var_5_22
	local var_5_23 = {
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

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_23)

	local var_5_24 = {
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

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_24)

	local var_5_25 = {
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonOver", var_5_25)

	local var_5_26 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonOver", var_5_26)

	local var_5_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("ButtonOver", var_5_27)

	local var_5_28 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("ButtonOver", var_5_28)

	local var_5_29 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("ButtonOver", var_5_29)

	local function var_5_30()
		var_5_4:AnimateSequence("ButtonOver")
		var_5_6:AnimateSequence("ButtonOver")
		var_5_12:AnimateSequence("ButtonOver")
		var_5_14:AnimateSequence("ButtonOver")
		var_5_16:AnimateSequence("ButtonOver")
		var_5_18:AnimateSequence("ButtonOver")
		var_5_20:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_30

	local var_5_31
	local var_5_32 = {
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

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_32)

	local var_5_33 = {
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

	var_5_6:RegisterAnimationSequence("ButtonUp", var_5_33)

	local var_5_34 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonUp", var_5_34)

	local var_5_35 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonUp", var_5_35)

	local var_5_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("ButtonUp", var_5_36)

	local var_5_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("ButtonUp", var_5_37)

	local var_5_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("ButtonUp", var_5_38)

	local function var_5_39()
		var_5_4:AnimateSequence("ButtonUp")
		var_5_6:AnimateSequence("ButtonUp")
		var_5_10:AnimateSequence("ButtonUp")
		var_5_14:AnimateSequence("ButtonUp")
		var_5_16:AnimateSequence("ButtonUp")
		var_5_18:AnimateSequence("ButtonUp")
		var_5_20:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_39

	local var_5_40
	local var_5_41 = {
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

	var_5_4:RegisterAnimationSequence("ButtonOverLocked", var_5_41)

	local var_5_42 = {
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

	var_5_6:RegisterAnimationSequence("ButtonOverLocked", var_5_42)

	local var_5_43 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonOverLocked", var_5_43)

	local var_5_44 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonOverLocked", var_5_44)

	local var_5_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("ButtonOverLocked", var_5_45)

	local var_5_46 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("ButtonOverLocked", var_5_46)

	local var_5_47 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("ButtonOverLocked", var_5_47)

	local function var_5_48()
		var_5_4:AnimateSequence("ButtonOverLocked")
		var_5_6:AnimateSequence("ButtonOverLocked")
		var_5_10:AnimateSequence("ButtonOverLocked")
		var_5_14:AnimateSequence("ButtonOverLocked")
		var_5_16:AnimateSequence("ButtonOverLocked")
		var_5_18:AnimateSequence("ButtonOverLocked")
		var_5_20:AnimateSequence("ButtonOverLocked")
	end

	var_5_0._sequences.ButtonOverLocked = var_5_48

	local var_5_49
	local var_5_50 = {
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

	var_5_4:RegisterAnimationSequence("ButtonUpLocked", var_5_50)

	local var_5_51 = {
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

	var_5_6:RegisterAnimationSequence("ButtonUpLocked", var_5_51)

	local var_5_52 = {
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

	var_5_10:RegisterAnimationSequence("ButtonUpLocked", var_5_52)

	local var_5_53 = {
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUpLocked", var_5_53)

	local var_5_54 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonUpLocked", var_5_54)

	local var_5_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("ButtonUpLocked", var_5_55)

	local var_5_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("ButtonUpLocked", var_5_56)

	local var_5_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("ButtonUpLocked", var_5_57)

	local function var_5_58()
		var_5_4:AnimateSequence("ButtonUpLocked")
		var_5_6:AnimateSequence("ButtonUpLocked")
		var_5_10:AnimateSequence("ButtonUpLocked")
		var_5_12:AnimateSequence("ButtonUpLocked")
		var_5_14:AnimateSequence("ButtonUpLocked")
		var_5_16:AnimateSequence("ButtonUpLocked")
		var_5_18:AnimateSequence("ButtonUpLocked")
		var_5_20:AnimateSequence("ButtonUpLocked")
	end

	var_5_0._sequences.ButtonUpLocked = var_5_58

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("OperatorBioButton", OperatorBioButton)
LockTable(_M)
