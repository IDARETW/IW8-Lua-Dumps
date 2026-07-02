module(..., package.seeall)

function CaCSelectedMessage(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 132 * _1080p, 0, 20 * _1080p)

	var_1_0.id = "CaCSelectedMessage"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "EndCapRightGlow"

	var_1_4:SetRGBFromInt(16767586, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -64, 0, _1080p * -64, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.EndCapRightGlow = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "EndCapRight"

	var_1_6:SetAlpha(0, 0)
	var_1_6:SetZRotation(180, 0)
	var_1_6:setImage(RegisterMaterial("wdg_slot_cut_out_1"), 0)
	var_1_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -19, 0, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.EndCapRight = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Inactive", var_1_8)

	local function var_1_9()
		var_1_6:AnimateSequence("Inactive")
	end

	var_1_0._sequences.Inactive = var_1_9

	local var_1_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -64
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -64
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.8,
			duration = 590,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.inSine
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.inSine
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inSine
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inSine
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.inSine
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -64,
			easing = LUI.EASING.inSine
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.inSine
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -64,
			easing = LUI.EASING.inSine
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Activate", var_1_10)

	local var_1_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Activate", var_1_11)

	local function var_1_12()
		var_1_4:AnimateSequence("Activate")
		var_1_6:AnimateSequence("Activate")
	end

	var_1_0._sequences.Activate = var_1_12

	local var_1_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Active", var_1_13)

	local function var_1_14()
		var_1_6:AnimateSequence("Active")
	end

	var_1_0._sequences.Active = var_1_14

	local var_1_15 = {
		{
			value = 12259328,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_4:RegisterAnimationSequence("ThirdModeColor", var_1_15)

	local function var_1_16()
		var_1_4:AnimateSequence("ThirdModeColor")
	end

	var_1_0._sequences.ThirdModeColor = var_1_16

	ACTIONS.AnimateSequence(var_1_0, "Inactive")

	if CONDITIONS.IsThirdGameMode(var_1_0) then
		ACTIONS.AnimateSequence(var_1_0, "ThirdModeColor")
	end

	return var_1_0
end

MenuBuilder.registerType("CaCSelectedMessage", CaCSelectedMessage)
LockTable(_M)
