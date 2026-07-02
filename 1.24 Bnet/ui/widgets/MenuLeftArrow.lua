module(..., package.seeall)

function MenuLeftArrow(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 64 * _1080p, 0, 128 * _1080p)

	var_1_0.id = "MenuLeftArrow"
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

	var_1_4.id = "Image"

	var_1_4:setImage(RegisterMaterial("wdg_selection_arrow_left_1"), 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Image = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6 = {
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
			value = 8421504,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_1_4:RegisterAnimationSequence("Blocked", var_1_6)

	local function var_1_7()
		var_1_4:AnimateSequence("Blocked")
	end

	var_1_0._sequences.Blocked = var_1_7

	local var_1_8 = {
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
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("NotBlocked", var_1_8)

	local function var_1_9()
		var_1_4:AnimateLoop("NotBlocked")
	end

	var_1_0._sequences.NotBlocked = var_1_9

	local var_1_10 = {
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
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_1_4:RegisterAnimationSequence("NotBlockedStatic", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("NotBlockedStatic")
	end

	var_1_0._sequences.NotBlockedStatic = var_1_11

	local var_1_12 = {
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
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
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

	var_1_4:RegisterAnimationSequence("MovedLeft", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("MovedLeft")
	end

	var_1_0._sequences.MovedLeft = var_1_13

	var_1_0:addEventHandler("grid_focus_left_blocked", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Blocked")
	end)
	var_1_0:addEventHandler("grid_focus_left_not_blocked", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "NotBlocked")
	end)
	var_1_0:addEventHandler("arrow_button_left_moved", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "MovedLeft")
	end)
	var_1_0:addEventHandler("arrow_button_left_blocked", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Blocked")
	end)
	var_1_0:addEventHandler("arrow_button_left_not_blocked", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "NotBlockedStatic")
	end)

	return var_1_0
end

MenuBuilder.registerType("MenuLeftArrow", MenuLeftArrow)
LockTable(_M)
