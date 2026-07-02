module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	ACTIONS.AnimateSequence(arg_1_0, "NotBlockedStatic")
	arg_1_0:registerEventHandler("mouseenter", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_2_0, "NotBlocked")
	end)
	arg_1_0:registerEventHandler("mouseleave", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, "NotBlockedStatic")
	end)
	arg_1_0:addEventHandler("button_action", function()
		local var_4_0 = "MovedRight"
		local var_4_1 = "button_shoulderr"

		ACTIONS.AnimateSequence(arg_1_0, var_4_0)

		local var_4_2 = arg_1_0:GetCurrentMenu()

		assert(var_4_2)
		var_4_2:processEvent({
			name = var_4_1,
			controller = arg_1_1
		})
	end)

	arg_1_0.m_requireFocusType = FocusType.MouseOver
end

function ArrowRightClick(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 64 * _1080p, 0, 128 * _1080p)

	var_5_0.id = "ArrowRightClick"
	var_5_0._animationSets = {}
	var_5_0._sequences = {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Image"

	var_5_4:setImage(RegisterMaterial("wdg_selection_arrow_right_1"), 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Image = var_5_4

	local function var_5_5()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_5

	local var_5_6 = {
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
			value = RegisterMaterial("wdg_selection_arrow_right_1")
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

	var_5_4:RegisterAnimationSequence("Blocked", var_5_6)

	local function var_5_7()
		var_5_4:AnimateSequence("Blocked")
	end

	var_5_0._sequences.Blocked = var_5_7

	local var_5_8 = {
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
			value = RegisterMaterial("wdg_selection_arrow_right_1_glow")
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
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 1,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom_Anchor,
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
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4,
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
			duration = 260,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.outQuadratic
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
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_5_4:RegisterAnimationSequence("NotBlocked", var_5_8)

	local function var_5_9()
		var_5_4:AnimateLoop("NotBlocked")
	end

	var_5_0._sequences.NotBlocked = var_5_9

	local var_5_10 = {
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
			value = RegisterMaterial("wdg_selection_arrow_right_1_glow")
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

	var_5_4:RegisterAnimationSequence("NotBlockedStatic", var_5_10)

	local function var_5_11()
		var_5_4:AnimateSequence("NotBlockedStatic")
	end

	var_5_0._sequences.NotBlockedStatic = var_5_11

	local var_5_12 = {
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
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Top
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
			property = TWEEN_PROPERTY.Top_Anchor,
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
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4,
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
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.outQuadratic
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
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_5_4:RegisterAnimationSequence("MovedRight", var_5_12)

	local function var_5_13()
		var_5_4:AnimateSequence("MovedRight")
	end

	var_5_0._sequences.MovedRight = var_5_13

	var_5_0:addEventHandler("grid_focus_right_blocked", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "Blocked")
	end)
	var_5_0:addEventHandler("grid_focus_right_not_blocked", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "NotBlocked")
	end)
	var_5_0:addEventHandler("arrow_button_right_moved", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "MovedRight")
	end)
	var_5_0:addEventHandler("arrow_button_right_blocked", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "Blocked")
	end)
	var_5_0:addEventHandler("arrow_button_right_not_blocked", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "NotBlockedStatic")
	end)
	var_5_0:addEventHandler("grid_focus_right_moved", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "MovedRight")
	end)
	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ArrowRightClick", ArrowRightClick)
LockTable(_M)
