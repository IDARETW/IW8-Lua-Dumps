module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_1)

	local var_1_0 = StringTable.DIFCHIGDFB(CSV.operators.file, CSV.operators.cols.ref, arg_1_1, CSV.operators.cols.icon)

	assert(var_1_0)
	arg_1_0.OperatorIcon:setImage(RegisterMaterial(var_1_0))

	local var_1_1 = PlayerData.BFFBGAJGD(arg_1_2, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[arg_1_3]:get() == arg_1_1

	arg_1_0:SetSelected(var_1_1)

	if OPERATOR.IsUnlocked(arg_1_2, arg_1_1) then
		arg_1_0:SetButtonDisabled(false)
	else
		arg_1_0:SetButtonDisabled(true)

		if var_1_1 then
			ACTIONS.AnimateSequence(arg_1_0, "ButtonOverDisabled")
		else
			ACTIONS.AnimateSequence(arg_1_0, "ButtonUpDisabled")
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._factionRef = arg_2_1.factionRef
	arg_2_0._factionIndex = arg_2_1.factionIndex
	arg_2_0._operatorIndex = arg_2_1.operatorIndex
	arg_2_0._operatorRef = arg_2_1.operatorRef
end

local function var_0_2(arg_3_0, arg_3_1)
	if OPERATOR.IsUnlocked(arg_3_1, arg_3_0._operatorRef) then
		local var_3_0 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, arg_3_0._operatorRef)

		arg_3_0._isOperatorNew = Loot.HDJCADADF(arg_3_1, var_3_0)
		arg_3_0._hasNewLoots = OPERATOR.OperatorHasNewLoots(arg_3_1, arg_3_0._operatorRef)

		local var_3_1 = arg_3_0._isOperatorNew or arg_3_0._hasNewLoots

		arg_3_0.NewItemSmallIcon:UpdateAlpha(var_3_1 and 1 or 0, 0, true)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local function var_4_0(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_5_0, "ButtonOver")
		arg_4_1:OnChildFocused(arg_5_0, arg_4_3)
	end

	local function var_4_1(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_6_0, "ButtonOverDisabled")
		arg_4_1:OnChildFocused(arg_6_0, arg_4_3)
	end

	local function var_4_2(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_7_0, "ButtonUpDisabled")
	end

	local function var_4_3(arg_8_0, arg_8_1)
		ACTIONS.AnimateSequence(arg_8_0, "ButtonUp")

		local var_8_0 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, arg_4_0._operatorRef)

		arg_4_0.NewItemSmallIcon:ClearBreadcrumbByID(arg_4_3, var_8_0, true)

		if arg_4_0._isNew and not arg_4_0._hasNewLoots then
			arg_8_0:dispatchEventToCurrentMenu({
				name = "clear_new_operator"
			})
		end
	end

	local function var_4_4(arg_9_0, arg_9_1)
		arg_4_1:OnChildFocused(arg_9_0, arg_4_3)
	end

	local function var_4_5(arg_10_0, arg_10_1)
		if arg_4_1:TransitionFinished() then
			arg_4_0:SetSelected(true)
			arg_4_1:EquipOperator(arg_4_2, arg_4_3)
		end

		return true
	end

	local function var_4_6(arg_11_0, arg_11_1)
		if arg_4_1:TransitionFinished() then
			arg_4_1:ShowMWUpsellPopup(arg_4_3)
		end

		return true
	end

	var_0_0(arg_4_0, arg_4_2.ref, arg_4_3, arg_4_1.currentState)
	arg_4_0:registerEventHandler("button_over_disable", var_4_1)
	arg_4_0:registerEventHandler("button_disable", var_4_2)
	arg_4_0:registerEventHandler("button_over", var_4_0)
	arg_4_0:registerEventHandler("button_up", var_4_3)
	arg_4_0:registerEventHandler("button_action", var_4_5)
	arg_4_0:registerEventHandler("button_action_disable", var_4_6)
	arg_4_0:registerEventHandler("update_focused", var_4_4)
end

local function var_0_4(arg_12_0, arg_12_1)
	assert(arg_12_0.Selected)
	ACTIONS.AnimateSequence(arg_12_0.Selected, arg_12_1 and "On" or "Off")

	arg_12_0.isSelected = arg_12_1

	ACTIONS.AnimateSequence(arg_12_0, arg_12_1 and "EquippedAndNew" or "NotEquippedAndNew")
end

local function var_0_5(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.SetupHandlers = var_0_3
	arg_13_0.SetButtonData = var_0_1
	arg_13_0.SetupIfNewItem = var_0_2

	arg_13_0.OperatorIcon:SetMask(arg_13_0.Mask)
	arg_13_0.Overlay:SetMask(arg_13_0.Mask)

	arg_13_0.SetSelected = var_0_4
end

function OperatorSelectButton(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 74 * _1080p, 0, 146 * _1080p)

	var_14_0.id = "OperatorSelectButton"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = LUI.UIBlur.new()

	var_14_4.id = "BlurBG"

	var_14_4:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_14_4:SetBlurStrength(2, 0)
	var_14_0:addElement(var_14_4)

	var_14_0.BlurBG = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIImage.new()

	var_14_6.id = "OperatorIcon"

	var_14_6:SetColorOp(COLOR_OP.saturation, 0)
	var_14_6:SetColorOpParam(1, 0)
	var_14_6:setImage(RegisterMaterial("ui_operator_west_charly_portrait"), 0)
	var_14_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -36, _1080p * 36, 0, 0)
	var_14_0:addElement(var_14_6)

	var_14_0.OperatorIcon = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIImage.new()

	var_14_8.id = "Overlay2"

	var_14_8:SetRGBFromInt(0, 0)
	var_14_8:SetAlpha(0, 0)
	var_14_8:SetColorOpParam(1, 0)
	var_14_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -2, _1080p * 2)
	var_14_0:addElement(var_14_8)

	var_14_0.Overlay2 = var_14_8

	local var_14_9
	local var_14_10 = LUI.UIImage.new()

	var_14_10.id = "Overlay"

	var_14_10:SetRGBFromInt(0, 0)
	var_14_10:SetAlpha(0, 0)
	var_14_10:SetColorOpParam(1, 0)
	var_14_10:setImage(RegisterMaterial("topBottomGradient"), 0)
	var_14_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -2, _1080p * 2)
	var_14_0:addElement(var_14_10)

	var_14_0.Overlay = var_14_10

	local var_14_11
	local var_14_12 = LUI.UIImage.new()

	var_14_12.id = "Vignette"

	var_14_12:SetRGBFromInt(0, 0)
	var_14_12:SetAlpha(0.6, 0)
	var_14_12:SetColorOpParam(1, 0)
	var_14_12:setImage(RegisterMaterial("bkgd_vignette"), 0)
	var_14_12:SetBlendMode(BLEND_MODE.multiply)
	var_14_0:addElement(var_14_12)

	var_14_0.Vignette = var_14_12

	local var_14_13
	local var_14_14 = LUI.UIImage.new()

	var_14_14.id = "Mask"

	var_14_14:setImage(RegisterMaterial("stencil_mask"), 0)
	var_14_0:addElement(var_14_14)

	var_14_0.Mask = var_14_14

	local var_14_15
	local var_14_16 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_14_1
	})

	var_14_16.id = "Selected"

	var_14_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -23, _1080p * -7, _1080p * 7, _1080p * 23)
	var_14_0:addElement(var_14_16)

	var_14_0.Selected = var_14_16

	local var_14_17
	local var_14_18 = LUI.UIImage.new()

	var_14_18.id = "Gradient"

	var_14_18:SetRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_14_18:SetAlpha(0.3, 0)
	var_14_18:SetPixelGridEnabled(true)
	var_14_18:SetPixelGridContrast(0.2, 0)
	var_14_18:SetPixelGridBlockWidth(2, 0)
	var_14_18:SetPixelGridBlockHeight(2, 0)
	var_14_18:SetPixelGridGutterWidth(1, 0)
	var_14_18:SetPixelGridGutterHeight(1, 0)
	var_14_18:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_14_18:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, 0)
	var_14_0:addElement(var_14_18)

	var_14_0.Gradient = var_14_18

	local var_14_19
	local var_14_20 = LUI.UIImage.new()

	var_14_20.id = "Lock"

	var_14_20:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_14_20:SetAlpha(0, 0)
	var_14_20:SetColorOp(COLOR_OP.saturation, 0)
	var_14_20:SetColorOpParam(1, 0)
	var_14_20:setImage(RegisterMaterial("icon_lock"), 0)
	var_14_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -5, _1080p * -25, _1080p * 5, _1080p * 25)
	var_14_0:addElement(var_14_20)

	var_14_0.Lock = var_14_20

	local var_14_21
	local var_14_22 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_14_1
	})

	var_14_22.id = "HighlightTop"

	var_14_22:SetAlpha(0, 0)
	var_14_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_14_0:addElement(var_14_22)

	var_14_0.HighlightTop = var_14_22

	local var_14_23
	local var_14_24 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_14_1
	})

	var_14_24.id = "HighlightBottom"

	var_14_24:SetAlpha(0, 0)
	var_14_24:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_14_0:addElement(var_14_24)

	var_14_0.HighlightBottom = var_14_24

	local var_14_25
	local var_14_26 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_14_1
	})

	var_14_26.id = "NewItemSmallIcon"

	var_14_26:SetAlpha(0, 0)
	var_14_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_14_0:addElement(var_14_26)

	var_14_0.NewItemSmallIcon = var_14_26

	local function var_14_27()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_27

	local var_14_28
	local var_14_29 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOver", var_14_29)

	local var_14_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.addWithAlpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColorMid
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonOver", var_14_30)

	local var_14_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.addWithAlpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColorDark
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonOver", var_14_31)

	local var_14_32 = {
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonOver", var_14_32)

	local var_14_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("ButtonOver", var_14_33)

	local var_14_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonOver", var_14_34)

	local var_14_35 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonOver", var_14_35)

	local var_14_36 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonOver", var_14_36)

	local function var_14_37()
		var_14_6:AnimateSequence("ButtonOver")
		var_14_8:AnimateSequence("ButtonOver")
		var_14_10:AnimateSequence("ButtonOver")
		var_14_12:AnimateSequence("ButtonOver")
		var_14_18:AnimateSequence("ButtonOver")
		var_14_20:AnimateSequence("ButtonOver")
		var_14_22:AnimateSequence("ButtonOver")
		var_14_24:AnimateSequence("ButtonOver")
	end

	var_14_0._sequences.ButtonOver = var_14_37

	local var_14_38
	local var_14_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUp", var_14_39)

	local var_14_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.blend
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonUp", var_14_40)

	local var_14_41 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonUp", var_14_41)

	local var_14_42 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDShadow
		}
	}

	var_14_18:RegisterAnimationSequence("ButtonUp", var_14_42)

	local var_14_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonUp", var_14_43)

	local var_14_44 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonUp", var_14_44)

	local var_14_45 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonUp", var_14_45)

	local function var_14_46()
		var_14_6:AnimateSequence("ButtonUp")
		var_14_10:AnimateSequence("ButtonUp")
		var_14_12:AnimateSequence("ButtonUp")
		var_14_18:AnimateSequence("ButtonUp")
		var_14_20:AnimateSequence("ButtonUp")
		var_14_22:AnimateSequence("ButtonUp")
		var_14_24:AnimateSequence("ButtonUp")
	end

	var_14_0._sequences.ButtonUp = var_14_46

	local var_14_47
	local var_14_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 5066061,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.05,
			duration = 300,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MissionSelectButton.tabBackground
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOverDisabled", var_14_48)

	local var_14_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonOverDisabled", var_14_49)

	local var_14_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonOverDisabled", var_14_50)

	local var_14_51 = {
		{
			value = 0.6,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 29
		}
	}

	var_14_18:RegisterAnimationSequence("ButtonOverDisabled", var_14_51)

	local var_14_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonOverDisabled", var_14_52)

	local var_14_53 = {
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonOverDisabled", var_14_53)

	local var_14_54 = {
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonOverDisabled", var_14_54)

	local function var_14_55()
		var_14_6:AnimateSequence("ButtonOverDisabled")
		var_14_10:AnimateSequence("ButtonOverDisabled")
		var_14_12:AnimateSequence("ButtonOverDisabled")
		var_14_18:AnimateSequence("ButtonOverDisabled")
		var_14_20:AnimateSequence("ButtonOverDisabled")
		var_14_22:AnimateSequence("ButtonOverDisabled")
		var_14_24:AnimateSequence("ButtonOverDisabled")
	end

	var_14_0._sequences.ButtonOverDisabled = var_14_55

	local var_14_56
	local var_14_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 5066061,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUpDisabled", var_14_57)

	local var_14_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonUpDisabled", var_14_58)

	local var_14_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonUpDisabled", var_14_59)

	local var_14_60 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("ButtonUpDisabled", var_14_60)

	local var_14_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonUpDisabled", var_14_61)

	local var_14_62 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonUpDisabled", var_14_62)

	local var_14_63 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonUpDisabled", var_14_63)

	local function var_14_64()
		var_14_6:AnimateSequence("ButtonUpDisabled")
		var_14_10:AnimateSequence("ButtonUpDisabled")
		var_14_12:AnimateSequence("ButtonUpDisabled")
		var_14_18:AnimateSequence("ButtonUpDisabled")
		var_14_20:AnimateSequence("ButtonUpDisabled")
		var_14_22:AnimateSequence("ButtonUpDisabled")
		var_14_24:AnimateSequence("ButtonUpDisabled")
	end

	var_14_0._sequences.ButtonUpDisabled = var_14_64

	local var_14_65
	local var_14_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
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

	var_14_26:RegisterAnimationSequence("EquippedAndNew", var_14_66)

	local function var_14_67()
		var_14_26:AnimateSequence("EquippedAndNew")
	end

	var_14_0._sequences.EquippedAndNew = var_14_67

	local var_14_68
	local var_14_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -11
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_14_26:RegisterAnimationSequence("NotEquippedAndNew", var_14_69)

	local function var_14_70()
		var_14_26:AnimateSequence("NotEquippedAndNew")
	end

	var_14_0._sequences.NotEquippedAndNew = var_14_70

	var_0_5(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("OperatorSelectButton", OperatorSelectButton)
LockTable(_M)
