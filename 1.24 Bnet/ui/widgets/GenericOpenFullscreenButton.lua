module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function GenericOpenFullscreenButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_2_0.id = "GenericOpenFullscreenButton"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "GenericOptionButtonBase"

	var_2_4.Title:SetLeft(_1080p * 20, 0)
	var_2_4.Title:SetRight(_1080p * -375, 0)
	var_2_4.Title:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.GenericOptionButtonBase = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Lock"

	var_2_6:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_2_6:SetAlpha(0, 0)
	var_2_6:setImage(RegisterMaterial("icon_lock"), 0)
	var_2_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * 3, _1080p * 29, _1080p * -13, _1080p * 13)
	var_2_0:addElement(var_2_6)

	var_2_0.Lock = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "Icon"

	var_2_8:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_2_8:SetAlpha(0.7, 0)
	var_2_8:setImage(RegisterMaterial("icon_open_new_window_thin"), 0)
	var_2_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -42, _1080p * -10, _1080p * -16, _1080p * 16)
	var_2_0:addElement(var_2_8)

	var_2_0.Icon = var_2_8

	local var_2_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_2_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_2_0.GenericOptionButtonBase.Title
		}
	}

	var_2_4:RegisterAnimationSequence("DefaultSequence", var_2_9)

	local var_2_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("DefaultSequence", var_2_10)

	local var_2_11 = {
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

	var_2_8:RegisterAnimationSequence("DefaultSequence", var_2_11)

	local function var_2_12()
		var_2_4:AnimateSequence("DefaultSequence")
		var_2_6:AnimateSequence("DefaultSequence")
		var_2_8:AnimateSequence("DefaultSequence")
	end

	var_2_0._sequences.DefaultSequence = var_2_12

	local var_2_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_13)

	local var_2_14 = {
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

	var_2_8:RegisterAnimationSequence("ButtonOver", var_2_14)

	local function var_2_15()
		var_2_6:AnimateSequence("ButtonOver")
		var_2_8:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_15

	local var_2_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_16)

	local var_2_17 = {
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

	var_2_8:RegisterAnimationSequence("ButtonUp", var_2_17)

	local function var_2_18()
		var_2_6:AnimateSequence("ButtonUp")
		var_2_8:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_18

	local var_2_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUpActive", var_2_19)

	local var_2_20 = {
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

	var_2_8:RegisterAnimationSequence("ButtonUpActive", var_2_20)

	local function var_2_21()
		var_2_6:AnimateSequence("ButtonUpActive")
		var_2_8:AnimateSequence("ButtonUpActive")
	end

	var_2_0._sequences.ButtonUpActive = var_2_21

	local var_2_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOverActive", var_2_22)

	local var_2_23 = {
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

	var_2_8:RegisterAnimationSequence("ButtonOverActive", var_2_23)

	local function var_2_24()
		var_2_6:AnimateSequence("ButtonOverActive")
		var_2_8:AnimateSequence("ButtonOverActive")
	end

	var_2_0._sequences.ButtonOverActive = var_2_24

	local var_2_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 375,
			child = var_2_0.GenericOptionButtonBase.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20,
			child = var_2_0.GenericOptionButtonBase.Title
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_25)

	local var_2_26 = {
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

	var_2_8:RegisterAnimationSequence("AR", var_2_26)

	local function var_2_27()
		var_2_4:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_27

	local var_2_28 = {
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

	var_2_6:RegisterAnimationSequence("Locked", var_2_28)

	local var_2_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Locked", var_2_29)

	local function var_2_30()
		var_2_6:AnimateSequence("Locked")
		var_2_8:AnimateSequence("Locked")
	end

	var_2_0._sequences.Locked = var_2_30

	var_2_0:addEventHandler("disable", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "Locked")
	end)
	var_2_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOver")
	end)
	var_2_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUp")
	end)
	var_2_0:addEventHandler("button_active", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUpActive")
	end)
	var_2_0:addEventHandler("button_over_active", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOverActive")
	end)
	PostLoadFunc(var_2_0, var_2_1, arg_2_1)
	ACTIONS.AnimateSequence(var_2_0, "DefaultSequence")

	return var_2_0
end

MenuBuilder.registerType("GenericOpenFullscreenButton", GenericOpenFullscreenButton)
LockTable(_M)
