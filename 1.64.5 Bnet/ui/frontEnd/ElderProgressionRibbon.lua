module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0, "ButtonOver")
	arg_1_0._menu:OnChildFocused(arg_1_0)

	arg_1_0._over = true

	if not arg_1_0.challengeComplete then
		ACTIONS.AnimateSequence(arg_1_0, "ButtonOverProgress")
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0.challengeComplete then
		if arg_2_0._over then
			ACTIONS.AnimateSequence(arg_2_0, "ButtonUp")
		else
			ACTIONS.AnimateSequence(arg_2_0, "ButtonUpSnap")
		end
	else
		if arg_2_0._over then
			ACTIONS.AnimateSequence(arg_2_0, "ButtonUpIncomplete")
		else
			ACTIONS.AnimateSequence(arg_2_0, "ButtonUpIncompleteSnap")
		end

		ACTIONS.AnimateSequence(arg_2_0, "ButtonUpProgress")
	end

	arg_2_0._over = false
end

local function var_0_2(arg_3_0, arg_3_1)
	ACTIONS.AnimateSequence(arg_3_0, "ButtonOverDisabled")
	arg_3_0._menu:OnChildFocused(arg_3_0)
end

local function var_0_3(arg_4_0, arg_4_1)
	ACTIONS.AnimateSequence(arg_4_0, "ButtonUpDisabled")
end

local function var_0_4(arg_5_0)
	return arg_5_0._progressionData
end

local function var_0_5(arg_6_0)
	return arg_6_0._ribbonRank
end

local function var_0_6(arg_7_0)
	return arg_7_0._challengeProgress
end

local function var_0_7(arg_8_0)
	return arg_8_0._unlocked
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5)
	return
end

local function var_0_9(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.Setup = var_0_8

	arg_10_0:registerEventHandler("button_up", var_0_1)
	arg_10_0:registerEventHandler("button_over", var_0_0)
	arg_10_0:registerEventHandler("button_over_disable", var_0_2)
	arg_10_0:registerEventHandler("button_disable", var_0_3)
end

function ElderProgressionRibbon(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 125 * _1080p, 0, 44 * _1080p)

	var_11_0.id = "ElderProgressionRibbon"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Background"

	var_11_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_11_4:SetAlpha(0.5, 0)
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 7, _1080p * -7, _1080p * 5, _1080p * -5)
	var_11_0:addElement(var_11_4)

	var_11_0.Background = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "TextureLayer"

	var_11_6:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_11_6:SetAlpha(0.1, 0)
	var_11_6:SetPixelGridEnabled(true)
	var_11_6:SetPixelGridContrast(0.8, 0)
	var_11_6:SetPixelGridBlockWidth(2, 0)
	var_11_6:SetPixelGridBlockHeight(2, 0)
	var_11_6:SetPixelGridGutterWidth(1, 0)
	var_11_6:SetPixelGridGutterHeight(1, 0)
	var_11_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 7, _1080p * -7, _1080p * 5, _1080p * -5)
	var_11_0:addElement(var_11_6)

	var_11_0.TextureLayer = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "Ribbon"

	var_11_8:SetAlpha(0.5, 0)
	var_11_8:setImage(RegisterMaterial("icon_ribbon_s02_019"), 0)
	var_11_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -53.5, _1080p * 52.5, _1080p * -15, _1080p * 15)
	var_11_0:addElement(var_11_8)

	var_11_0.Ribbon = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "TopBar"

	var_11_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 7, _1080p * -7, _1080p * 3, _1080p * 5)
	var_11_0:addElement(var_11_10)

	var_11_0.TopBar = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "BottomBar"

	var_11_12:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 7, _1080p * -7, _1080p * -5, _1080p * -3)
	var_11_0:addElement(var_11_12)

	var_11_0.BottomBar = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "ProgressBar"

	var_11_14:SetAlpha(0.5, 0)
	var_11_14.Overlay:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_11_14.Fill:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 7, _1080p * -7, _1080p * -8, _1080p * -5)
	var_11_0:addElement(var_11_14)

	var_11_0.ProgressBar = var_11_14

	local function var_11_15()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_15

	local var_11_16 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonOver", var_11_16)

	local var_11_17 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		},
		{
			value = 0.3,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonOver", var_11_17)

	local var_11_18 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -53.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 52.5
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

	var_11_8:RegisterAnimationSequence("ButtonOver", var_11_18)

	local var_11_19 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOver", var_11_19)

	local var_11_20 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOver", var_11_20)

	local function var_11_21()
		var_11_4:AnimateSequence("ButtonOver")
		var_11_6:AnimateSequence("ButtonOver")
		var_11_8:AnimateSequence("ButtonOver")
		var_11_10:AnimateSequence("ButtonOver")
		var_11_12:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_21

	local var_11_22 = {
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonUp", var_11_22)

	local var_11_23 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonUp", var_11_23)

	local var_11_24 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -53.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 52.5
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
		},
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUp", var_11_24)

	local var_11_25 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUp", var_11_25)

	local var_11_26 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUp", var_11_26)

	local function var_11_27()
		var_11_4:AnimateSequence("ButtonUp")
		var_11_6:AnimateSequence("ButtonUp")
		var_11_8:AnimateSequence("ButtonUp")
		var_11_10:AnimateSequence("ButtonUp")
		var_11_12:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_27

	local var_11_28 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonOverDisabled", var_11_28)

	local var_11_29 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonOverDisabled", var_11_29)

	local var_11_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.lockColor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12.5
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOverDisabled", var_11_30)

	local var_11_31 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOverDisabled", var_11_31)

	local var_11_32 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverDisabled", var_11_32)

	local var_11_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonOverDisabled", var_11_33)

	local function var_11_34()
		var_11_4:AnimateSequence("ButtonOverDisabled")
		var_11_6:AnimateSequence("ButtonOverDisabled")
		var_11_8:AnimateSequence("ButtonOverDisabled")
		var_11_10:AnimateSequence("ButtonOverDisabled")
		var_11_12:AnimateSequence("ButtonOverDisabled")
		var_11_14:AnimateSequence("ButtonOverDisabled")
	end

	var_11_0._sequences.ButtonOverDisabled = var_11_34

	local var_11_35 = {
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonUpDisabled", var_11_35)

	local var_11_36 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonUpDisabled", var_11_36)

	local var_11_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -13
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.lockColor
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpDisabled", var_11_37)

	local var_11_38 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpDisabled", var_11_38)

	local var_11_39 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpDisabled", var_11_39)

	local var_11_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonUpDisabled", var_11_40)

	local function var_11_41()
		var_11_4:AnimateSequence("ButtonUpDisabled")
		var_11_6:AnimateSequence("ButtonUpDisabled")
		var_11_8:AnimateSequence("ButtonUpDisabled")
		var_11_10:AnimateSequence("ButtonUpDisabled")
		var_11_12:AnimateSequence("ButtonUpDisabled")
		var_11_14:AnimateSequence("ButtonUpDisabled")
	end

	var_11_0._sequences.ButtonUpDisabled = var_11_41

	local var_11_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("Incomplete", var_11_42)

	local function var_11_43()
		var_11_8:AnimateSequence("Incomplete")
	end

	var_11_0._sequences.Incomplete = var_11_43

	local var_11_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("Complete", var_11_44)

	local var_11_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("Complete", var_11_45)

	local function var_11_46()
		var_11_8:AnimateSequence("Complete")
		var_11_14:AnimateSequence("Complete")
	end

	var_11_0._sequences.Complete = var_11_46

	local var_11_47 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonOverProgress", var_11_47)

	local function var_11_48()
		var_11_14:AnimateSequence("ButtonOverProgress")
	end

	var_11_0._sequences.ButtonOverProgress = var_11_48

	local var_11_49 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonUpProgress", var_11_49)

	local function var_11_50()
		var_11_14:AnimateSequence("ButtonUpProgress")
	end

	var_11_0._sequences.ButtonUpProgress = var_11_50

	local var_11_51 = {
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonUpIncomplete", var_11_51)

	local var_11_52 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonUpIncomplete", var_11_52)

	local var_11_53 = {
		{
			value = 0.3,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -53.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 52.5
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
		},
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpIncomplete", var_11_53)

	local var_11_54 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpIncomplete", var_11_54)

	local var_11_55 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpIncomplete", var_11_55)

	local function var_11_56()
		var_11_4:AnimateSequence("ButtonUpIncomplete")
		var_11_6:AnimateSequence("ButtonUpIncomplete")
		var_11_8:AnimateSequence("ButtonUpIncomplete")
		var_11_10:AnimateSequence("ButtonUpIncomplete")
		var_11_12:AnimateSequence("ButtonUpIncomplete")
	end

	var_11_0._sequences.ButtonUpIncomplete = var_11_56

	local var_11_57 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonUpSnap", var_11_57)

	local var_11_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonUpSnap", var_11_58)

	local var_11_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -53.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 52.5
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
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpSnap", var_11_59)

	local var_11_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpSnap", var_11_60)

	local var_11_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpSnap", var_11_61)

	local function var_11_62()
		var_11_4:AnimateSequence("ButtonUpSnap")
		var_11_6:AnimateSequence("ButtonUpSnap")
		var_11_8:AnimateSequence("ButtonUpSnap")
		var_11_10:AnimateSequence("ButtonUpSnap")
		var_11_12:AnimateSequence("ButtonUpSnap")
	end

	var_11_0._sequences.ButtonUpSnap = var_11_62

	local var_11_63 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("ButtonUpIncompleteSnap", var_11_63)

	local var_11_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonUpIncompleteSnap", var_11_64)

	local var_11_65 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -53.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 52.5
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
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpIncompleteSnap", var_11_65)

	local var_11_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpIncompleteSnap", var_11_66)

	local var_11_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpIncompleteSnap", var_11_67)

	local function var_11_68()
		var_11_4:AnimateSequence("ButtonUpIncompleteSnap")
		var_11_6:AnimateSequence("ButtonUpIncompleteSnap")
		var_11_8:AnimateSequence("ButtonUpIncompleteSnap")
		var_11_10:AnimateSequence("ButtonUpIncompleteSnap")
		var_11_12:AnimateSequence("ButtonUpIncompleteSnap")
	end

	var_11_0._sequences.ButtonUpIncompleteSnap = var_11_68

	var_0_9(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("ElderProgressionRibbon", ElderProgressionRibbon)
LockTable(_M)
