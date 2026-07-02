module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 ~= arg_1_0._isElevated then
		if arg_1_1 then
			ACTIONS.AnimateSequence(arg_1_0, "ChangeFast")
		else
			ACTIONS.AnimateSequence(arg_1_0, "ChangeSlow")
		end
	end

	arg_1_0._isElevated = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Rate1:SetMask(arg_2_0.Rate1Mask)
	arg_2_0.Rate2:SetMask(arg_2_0.Rate2Mask)

	arg_2_0.UpdateEKG = var_0_0
	arg_2_0._isElevated = false
end

function WatchEKGT9(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 128 * _1080p)

	var_3_0.id = "WatchEKGT9"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:setUseStencil(true)

	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 2, _1080p * -2)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Glow"

	var_3_6:SetAlpha(0, 0)
	var_3_6:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_6:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -12, 0, _1080p * 1, _1080p * -1)
	var_3_0:addElement(var_3_6)

	var_3_0.Glow = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Rate1"

	var_3_8:SetRGBFromInt(0, 0)
	var_3_8:setImage(RegisterMaterial("icon_watch_ekg_small_t9"), 0)
	var_3_0:addElement(var_3_8)

	var_3_0.Rate1 = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Rate1Mask"

	var_3_10:setImage(RegisterMaterial("stencil_mask"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 512, 0, 0)
	var_3_0:addElement(var_3_10)

	var_3_0.Rate1Mask = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Rate2"

	var_3_12:SetRGBFromInt(0, 0)
	var_3_12:setImage(RegisterMaterial("icon_watch_ekg_large_t9"), 0)
	var_3_0:addElement(var_3_12)

	var_3_0.Rate2 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "Rate2Mask"

	var_3_14:setImage(RegisterMaterial("stencil_mask"), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_14)

	var_3_0.Rate2Mask = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "BootMask"

	var_3_16:SetRGBFromInt(0, 0)
	var_3_0:addElement(var_3_16)

	var_3_0.BootMask = var_3_16

	local function var_3_17()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_17

	local var_3_18
	local var_3_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 512
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 512
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 512
		},
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_3_10:RegisterAnimationSequence("ChangeFast", var_3_19)

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 514
		}
	}

	var_3_14:RegisterAnimationSequence("ChangeFast", var_3_20)

	local function var_3_21()
		var_3_10:AnimateSequence("ChangeFast")
		var_3_14:AnimateSequence("ChangeFast")
	end

	var_3_0._sequences.ChangeFast = var_3_21

	local var_3_22
	local var_3_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.U_Min
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.U_Max
		},
		{
			value = -1,
			duration = 5000,
			property = TWEEN_PROPERTY.U_Min
		},
		{
			value = 0,
			duration = 5000,
			property = TWEEN_PROPERTY.U_Max
		}
	}

	var_3_8:RegisterAnimationSequence("Pulse", var_3_23)

	local var_3_24 = {
		{
			value = -0.01,
			duration = 0,
			property = TWEEN_PROPERTY.U_Min
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.U_Max
		},
		{
			value = -1,
			duration = 5000,
			property = TWEEN_PROPERTY.U_Min
		},
		{
			value = 0,
			duration = 5000,
			property = TWEEN_PROPERTY.U_Max
		}
	}

	var_3_12:RegisterAnimationSequence("Pulse", var_3_24)

	local function var_3_25()
		var_3_8:AnimateLoop("Pulse")
		var_3_12:AnimateLoop("Pulse")
	end

	var_3_0._sequences.Pulse = var_3_25

	local var_3_26
	local var_3_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 514
		}
	}

	var_3_10:RegisterAnimationSequence("ChangeSlow", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 512
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 512
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 512
		},
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_3_14:RegisterAnimationSequence("ChangeSlow", var_3_28)

	local function var_3_29()
		var_3_10:AnimateSequence("ChangeSlow")
		var_3_14:AnimateSequence("ChangeSlow")
	end

	var_3_0._sequences.ChangeSlow = var_3_29

	local var_3_30
	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -40
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 1067,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -40
		},
		{
			value = 0,
			duration = 1067,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 1333,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 512
		},
		{
			duration = 1333,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 552
		}
	}

	var_3_6:RegisterAnimationSequence("PulseGlowSlow", var_3_31)

	local function var_3_32()
		var_3_6:AnimateLoop("PulseGlowSlow")
	end

	var_3_0._sequences.PulseGlowSlow = var_3_32

	local var_3_33
	local var_3_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -40
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 160,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -40
		},
		{
			value = 0,
			duration = 160,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 347,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 512
		},
		{
			duration = 347,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 552
		}
	}

	var_3_6:RegisterAnimationSequence("PulseGlowFast", var_3_34)

	local function var_3_35()
		var_3_6:AnimateLoop("PulseGlowFast")
	end

	var_3_0._sequences.PulseGlowFast = var_3_35

	local var_3_36
	local var_3_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 20,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Boot", var_3_37)

	local function var_3_38()
		var_3_16:AnimateSequence("Boot")
	end

	var_3_0._sequences.Boot = var_3_38

	var_0_1(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "Pulse")
	ACTIONS.AnimateSequence(var_3_0, "PulseGlowSlow")
	ACTIONS.AnimateSequence(var_3_0, "Boot")

	return var_3_0
end

MenuBuilder.registerType("WatchEKGT9", WatchEKGT9)
LockTable(_M)
