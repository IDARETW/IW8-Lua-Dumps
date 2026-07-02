module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = OPERATOR.GetOperatorGameSourceID(arg_1_1)
	local var_1_1 = LUI.GetAnimForGameSource(var_1_0)

	ACTIONS.AnimateSequence(arg_1_0, var_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetSnipeIcon = var_0_0
end

function WZOperatorSelectSnipe(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 48 * _1080p)

	var_3_0.id = "WZOperatorSelectSnipe"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "MWBackground"

	var_3_4:SetRGBFromTable(SWATCHES.genericButton.backgroundFocusDark, 0)
	var_3_4:SetAlpha(0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.MWBackground = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "CWBackground"

	var_3_6:SetRGBFromTable(SWATCHES.Store.ZeusRedDark, 0)
	var_3_6:SetAlpha(0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.CWBackground = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "VGBackground"

	var_3_8:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_3_8:SetAlpha(0.5, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.VGBackground = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "SnipeIcon"

	var_3_10:setImage(RegisterMaterial("ui_mp_wz_icon_snipe_vanguard_large"), 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -106, _1080p * 106, _1080p * -36, _1080p * 36)
	var_3_0:addElement(var_3_10)

	var_3_0.SnipeIcon = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_3_4:RegisterAnimationSequence("MW", var_3_13)

	local var_3_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("MW", var_3_14)

	local var_3_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("MW", var_3_15)

	local var_3_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_icon_snipe_mw")
		},
		{
			value = -0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -194
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 194
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 102
		}
	}

	var_3_10:RegisterAnimationSequence("MW", var_3_16)

	local function var_3_17()
		var_3_4:AnimateSequence("MW")
		var_3_6:AnimateSequence("MW")
		var_3_8:AnimateSequence("MW")
		var_3_10:AnimateSequence("MW")
	end

	var_3_0._sequences.MW = var_3_17

	local var_3_18
	local var_3_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("CW", var_3_19)

	local var_3_20 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_3_6:RegisterAnimationSequence("CW", var_3_20)

	local var_3_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("CW", var_3_21)

	local var_3_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_icon_snipe_blackops")
		},
		{
			value = -0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -180
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 180
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 102
		}
	}

	var_3_10:RegisterAnimationSequence("CW", var_3_22)

	local function var_3_23()
		var_3_4:AnimateSequence("CW")
		var_3_6:AnimateSequence("CW")
		var_3_8:AnimateSequence("CW")
		var_3_10:AnimateSequence("CW")
	end

	var_3_0._sequences.CW = var_3_23

	local var_3_24
	local var_3_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("VG", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("VG", var_3_26)

	local var_3_27 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("VG", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_icon_snipe_vanguard_large")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			value = -0.54,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_10:RegisterAnimationSequence("VG", var_3_28)

	local function var_3_29()
		var_3_4:AnimateSequence("VG")
		var_3_6:AnimateSequence("VG")
		var_3_8:AnimateSequence("VG")
		var_3_10:AnimateSequence("VG")
	end

	var_3_0._sequences.VG = var_3_29

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZOperatorSelectSnipe", WZOperatorSelectSnipe)
LockTable(_M)
