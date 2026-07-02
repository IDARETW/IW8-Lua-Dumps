module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:setActionSFX(nil)
	arg_1_0:addEventHandler("grid_focus_left_blocked", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_1_0, "Blocked")
		arg_1_0:SetFocusable(false)
	end)
	arg_1_0:addEventHandler("grid_focus_left_not_blocked", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_1_0, "NotBlocked")
		arg_1_0:SetFocusable(true)
	end)
end

function ArrowLeft(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 64 * _1080p, 0, 128 * _1080p)

	var_4_0.id = "ArrowLeft"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Image"

	var_4_4:setImage(RegisterMaterial("wdg_selection_arrow_left_1"), 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Image = var_4_4

	local function var_4_5()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_5

	local var_4_6 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("wdg_selection_arrow_left_1")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_4:RegisterAnimationSequence("Blocked", var_4_6)

	local function var_4_7()
		var_4_4:AnimateSequence("Blocked")
	end

	var_4_0._sequences.Blocked = var_4_7

	local var_4_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("wdg_selection_arrow_left_1_glow")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_4:RegisterAnimationSequence("NotBlocked", var_4_8)

	local function var_4_9()
		var_4_4:AnimateSequence("NotBlocked")
	end

	var_4_0._sequences.NotBlocked = var_4_9

	local var_4_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_4:RegisterAnimationSequence("MovedLeft", var_4_10)

	local function var_4_11()
		var_4_4:AnimateSequence("MovedLeft")
	end

	var_4_0._sequences.MovedLeft = var_4_11

	local var_4_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_4:RegisterAnimationSequence("MoveLoop", var_4_12)

	local function var_4_13()
		var_4_4:AnimateLoop("MoveLoop")
	end

	var_4_0._sequences.MoveLoop = var_4_13

	var_4_0:addEventHandler("grid_focus_left_moved", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "MovedLeft")
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ArrowLeft", ArrowLeft)
LockTable(_M)
