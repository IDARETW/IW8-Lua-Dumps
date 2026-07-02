module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1)
	arg_1_0:addEventHandler("disable", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_2_0, "Locked")
	end)
	arg_1_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "ButtonUp")
	end)
	arg_1_0:addEventHandler("button_active", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "ButtonUpActive")
	end)
	arg_1_0:addEventHandler("button_over_active", function(arg_6_0, arg_6_1)
		WZWIP.AnimateThemeElement(arg_6_0, "ButtonOverActive")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function GenericOpenFullscreenButton(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_7_0.id = "GenericOpenFullscreenButton"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "GenericOptionButtonBase"

	var_7_4.Title:SetLeft(_1080p * 20, 0)
	var_7_4.Title:SetRight(_1080p * -375, 0)
	var_7_4.Title:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.GenericOptionButtonBase = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "Lock"

	var_7_6:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_7_6:SetAlpha(0, 0)
	var_7_6:setImage(RegisterMaterial("icon_lock"), 0)
	var_7_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * 3, _1080p * 29, _1080p * -13, _1080p * 13)
	var_7_0:addElement(var_7_6)

	var_7_0.Lock = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "Icon"

	var_7_8:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_7_8:SetAlpha(0.7, 0)
	var_7_8:setImage(RegisterMaterial("icon_open_new_window_thin"), 0)
	var_7_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -42, _1080p * -10, _1080p * -16, _1080p * 16)
	var_7_0:addElement(var_7_8)

	var_7_0.Icon = var_7_8

	local function var_7_9()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_9

	local var_7_10
	local var_7_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOver", var_7_11)

	local var_7_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
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
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOver", var_7_12)

	local function var_7_13()
		var_7_6:AnimateSequence("ButtonOver")
		var_7_8:AnimateSequence("ButtonOver")
	end

	var_7_0._sequences.ButtonOver = var_7_13

	local var_7_14
	local var_7_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUp", var_7_15)

	local var_7_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window_thin")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUp", var_7_16)

	local function var_7_17()
		var_7_6:AnimateSequence("ButtonUp")
		var_7_8:AnimateSequence("ButtonUp")
	end

	var_7_0._sequences.ButtonUp = var_7_17

	local var_7_18
	local var_7_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUpActive", var_7_19)

	local var_7_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window_thin")
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpActive", var_7_20)

	local function var_7_21()
		var_7_6:AnimateSequence("ButtonUpActive")
		var_7_8:AnimateSequence("ButtonUpActive")
	end

	var_7_0._sequences.ButtonUpActive = var_7_21

	local var_7_22
	local var_7_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOverActive", var_7_23)

	local var_7_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
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
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOverActive", var_7_24)

	local function var_7_25()
		var_7_6:AnimateSequence("ButtonOverActive")
		var_7_8:AnimateSequence("ButtonOverActive")
	end

	var_7_0._sequences.ButtonOverActive = var_7_25

	local var_7_26
	local var_7_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_7_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_7_0.GenericOptionButtonBase.Title
		}
	}

	var_7_4:RegisterAnimationSequence("AR", var_7_27)

	local var_7_28 = {
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
			value = _1080p * 42
		}
	}

	var_7_8:RegisterAnimationSequence("AR", var_7_28)

	local function var_7_29()
		var_7_4:AnimateSequence("AR")
		var_7_8:AnimateSequence("AR")
	end

	var_7_0._sequences.AR = var_7_29

	local var_7_30
	local var_7_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		}
	}

	var_7_6:RegisterAnimationSequence("Locked", var_7_31)

	local var_7_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("Locked", var_7_32)

	local function var_7_33()
		var_7_6:AnimateSequence("Locked")
		var_7_8:AnimateSequence("Locked")
	end

	var_7_0._sequences.Locked = var_7_33

	local var_7_34
	local var_7_35 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_7_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_7_0.GenericOptionButtonBase.Title
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipSetup", var_7_35)

	local var_7_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_7_6:RegisterAnimationSequence("WZWipSetup", var_7_36)

	local var_7_37 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window_thin")
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipSetup", var_7_37)

	local function var_7_38()
		var_7_4:AnimateSequence("WZWipSetup")
		var_7_6:AnimateSequence("WZWipSetup")
		var_7_8:AnimateSequence("WZWipSetup")
	end

	var_7_0._sequences.WZWipSetup = var_7_38

	local var_7_39
	local var_7_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("WZWipButtonOver", var_7_40)

	local var_7_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window")
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipButtonOver", var_7_41)

	local function var_7_42()
		var_7_6:AnimateSequence("WZWipButtonOver")
		var_7_8:AnimateSequence("WZWipButtonOver")
	end

	var_7_0._sequences.WZWipButtonOver = var_7_42

	local var_7_43
	local var_7_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("WZWipButtonOverActive", var_7_44)

	local var_7_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window")
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipButtonOverActive", var_7_45)

	local function var_7_46()
		var_7_6:AnimateSequence("WZWipButtonOverActive")
		var_7_8:AnimateSequence("WZWipButtonOverActive")
	end

	var_7_0._sequences.WZWipButtonOverActive = var_7_46

	local var_7_47
	local var_7_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("WZWipButtonUp", var_7_48)

	local var_7_49 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window_thin")
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipButtonUp", var_7_49)

	local function var_7_50()
		var_7_6:AnimateSequence("WZWipButtonUp")
		var_7_8:AnimateSequence("WZWipButtonUp")
	end

	var_7_0._sequences.WZWipButtonUp = var_7_50

	local var_7_51
	local var_7_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("WZWipButtonUpActive", var_7_52)

	local var_7_53 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_open_new_window_thin")
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipButtonUpActive", var_7_53)

	local function var_7_54()
		var_7_6:AnimateSequence("WZWipButtonUpActive")
		var_7_8:AnimateSequence("WZWipButtonUpActive")
	end

	var_7_0._sequences.WZWipButtonUpActive = var_7_54

	PostLoadFunc(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("GenericOpenFullscreenButton", GenericOpenFullscreenButton)
LockTable(_M)
