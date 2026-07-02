module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._lootType = arg_1_2

	if arg_1_2 == LOOT.itemTypes.WEAPON or arg_1_2 == LOOT.itemTypes.WATCH then
		ACTIONS.AnimateSequence(arg_1_0, "WeaponControls")
	end

	if arg_1_1 and arg_1_1.HelperBar then
		if arg_1_2 == LOOT.itemTypes.WEAPON then
			arg_1_0:AddButtonHelperTextToElement(arg_1_1.HelperBar, {
				priority = 2,
				side = "left",
				gamepad_only = true,
				button_ref = "button_right_stick",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/ROTATE_WEAPON"),
				container = arg_1_0.Rotate
			})
		elseif arg_1_2 == LOOT.itemTypes.WATCH then
			arg_1_0:AddButtonHelperTextToElement(arg_1_1.HelperBar, {
				priority = 2,
				side = "left",
				gamepad_only = true,
				button_ref = "button_right_stick",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/ROTATE_WATCH"),
				container = arg_1_0.Rotate
			})
		elseif arg_1_2 == LOOT.itemTypes.OPERATOR then
			arg_1_0:AddButtonHelperTextToElement(arg_1_1.HelperBar, {
				priority = 2,
				side = "left",
				gamepad_only = true,
				button_ref = "button_right_stick",
				helper_text = Engine.CBBHFCGDIC("MENU/ROTATE_LEFT_RIGHT"),
				container = arg_1_0.Rotate
			})
			arg_1_0:AddButtonHelperTextToElement(arg_1_1.HelperBar, {
				priority = 1,
				side = "left",
				gamepad_only = true,
				button_ref = "button_left_stick",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/MOVE_CAMERA"),
				container = arg_1_0.MoveCamera
			})
			arg_1_0:AddButtonHelperTextToElement(arg_1_1.HelperBar, {
				priority = 5,
				side = "left",
				gamepad_only = true,
				button_ref = "button_right_trigger",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/ZOOM_IN"),
				container = arg_1_0.ZoomIn
			})
			arg_1_0:AddButtonHelperTextToElement(arg_1_1.HelperBar, {
				priority = 5,
				side = "left",
				gamepad_only = true,
				button_ref = "button_left_trigger",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/ZOOM_OUT"),
				container = arg_1_0.ZoomOut
			})
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupLegend = var_0_0

	local function var_2_0(arg_3_0, arg_3_1)
		if LUI.IsLastInputGamepad(arg_3_1.controllerIndex) then
			arg_3_0.RotateKBM:SetAlpha(0)

			if arg_3_0._lootType == LOOT.itemTypes.OPERATOR then
				arg_3_0.MoveCameraKBM:SetAlpha(0)
				arg_3_0.ZoomInKBM:SetAlpha(0)
				arg_3_0.ZoomOutKBM:SetAlpha(0)
			end
		else
			arg_3_0.RotateKBM:SetAlpha(1)

			if arg_3_0._lootType == LOOT.itemTypes.OPERATOR then
				arg_3_0.MoveCameraKBM:SetAlpha(1)
				arg_3_0.ZoomInKBM:SetAlpha(1)
				arg_3_0.ZoomInKBM.Mouse:SetLeft(2)
				arg_3_0.ZoomInKBM.Mouse:SetRight(23)
				arg_3_0.ZoomOutKBM:SetAlpha(1)
				arg_3_0.ZoomOutKBM.Mouse:SetLeft(2)
				arg_3_0.ZoomOutKBM.Mouse:SetRight(23)
			end
		end
	end

	arg_2_0:addAndCallEventHandler("update_input_type", var_2_0, {
		controllerIndex = arg_2_1
	})
end

function PreviewControlsLegend(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 281 * _1080p)

	var_4_0.id = "PreviewControlsLegend"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "DoubleNotchedBacker"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 360, 0, _1080p * 281)
	var_4_0:addElement(var_4_4)

	var_4_0.DoubleNotchedBacker = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("PreviewControlsLegendElement", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "ZoomOutKBM"

	var_4_6:SetAlpha(0, 0)
	var_4_6.Mouse:setImage(RegisterMaterial("ui_button_kbm_mousescrolldown"), 0)
	var_4_6.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/ZOOM_OUT"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 325, _1080p * 209, _1080p * 255)
	var_4_0:addElement(var_4_6)

	var_4_0.ZoomOutKBM = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("PreviewControlsLegendElement", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "ZoomInKBM"

	var_4_8:SetAlpha(0, 0)
	var_4_8.Mouse:setImage(RegisterMaterial("ui_button_kbm_mousescrollup"), 0)
	var_4_8.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/ZOOM_IN"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 325, _1080p * 163, _1080p * 209)
	var_4_0:addElement(var_4_8)

	var_4_0.ZoomInKBM = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("PreviewControlsLegendElement", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "MoveCameraKBM"

	var_4_10:SetAlpha(0, 0)
	var_4_10.Mouse:setImage(RegisterMaterial("ui_button_kbm_mouseleftclick_pan"), 0)
	var_4_10.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/MOVE_CAMERA"), 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 325, _1080p * 71, _1080p * 117)
	var_4_0:addElement(var_4_10)

	var_4_0.MoveCameraKBM = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("PreviewControlsLegendElement", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "RotateKBM"

	var_4_12:SetAlpha(0, 0)
	var_4_12.Mouse:setImage(RegisterMaterial("ui_button_kbm_mouseleftclick_rotate"), 0)
	var_4_12.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/ROTATE"), 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 325, _1080p * 117, _1080p * 163)
	var_4_0:addElement(var_4_12)

	var_4_0.RotateKBM = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "ZoomOut"

	if CONDITIONS.AlwaysFalse(var_4_0) then
		var_4_14.Label:setText("Zoom Out", 0)
	end

	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 358, _1080p * 225, _1080p * 245)
	var_4_0:addElement(var_4_14)

	var_4_0.ZoomOut = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "ZoomIn"

	if CONDITIONS.AlwaysFalse(var_4_0) then
		var_4_16.Label:setText("Zoom In", 0)
	end

	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 358, _1080p * 179, _1080p * 199)
	var_4_0:addElement(var_4_16)

	var_4_0.ZoomIn = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "Rotate"

	if CONDITIONS.AlwaysFalse(var_4_0) then
		var_4_18.Label:setText("Rotate", 0)
	end

	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 358, _1080p * 133, _1080p * 153)
	var_4_0:addElement(var_4_18)

	var_4_0.Rotate = var_4_18

	local var_4_19
	local var_4_20 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_4_1
	})

	var_4_20.id = "MoveCamera"

	if CONDITIONS.AlwaysFalse(var_4_0) then
		var_4_20.Label:setText("Move Camera", 0)
	end

	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 358, _1080p * 87, _1080p * 107)
	var_4_0:addElement(var_4_20)

	var_4_0.MoveCamera = var_4_20

	local var_4_21
	local var_4_22 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_22.id = "ControlsHeader"

	var_4_22.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CONTROLS")), 0)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 386, 0, _1080p * 50)
	var_4_0:addElement(var_4_22)

	var_4_0.ControlsHeader = var_4_22

	local function var_4_23()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_23

	local var_4_24
	local var_4_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 143
		}
	}

	var_4_4:RegisterAnimationSequence("WeaponControls", var_4_25)

	local var_4_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WeaponControls", var_4_26)

	local var_4_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WeaponControls", var_4_27)

	local var_4_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WeaponControls", var_4_28)

	local var_4_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 117
		}
	}

	var_4_12:RegisterAnimationSequence("WeaponControls", var_4_29)

	local var_4_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("WeaponControls", var_4_30)

	local var_4_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("WeaponControls", var_4_31)

	local var_4_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 107
		}
	}

	var_4_18:RegisterAnimationSequence("WeaponControls", var_4_32)

	local var_4_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("WeaponControls", var_4_33)

	local function var_4_34()
		var_4_4:AnimateSequence("WeaponControls")
		var_4_6:AnimateSequence("WeaponControls")
		var_4_8:AnimateSequence("WeaponControls")
		var_4_10:AnimateSequence("WeaponControls")
		var_4_12:AnimateSequence("WeaponControls")
		var_4_14:AnimateSequence("WeaponControls")
		var_4_16:AnimateSequence("WeaponControls")
		var_4_18:AnimateSequence("WeaponControls")
		var_4_20:AnimateSequence("WeaponControls")
	end

	var_4_0._sequences.WeaponControls = var_4_34

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("PreviewControlsLegend", PreviewControlsLegend)
LockTable(_M)
