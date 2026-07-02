module(..., package.seeall)

function GenericBorderFrame(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p)

	var_1_0.id = "GenericBorderFrame"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Left"

	var_1_4:setImage(RegisterMaterial("ui_default_white"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1, _1080p * 1, _1080p * -1)
	var_1_0:addElement(var_1_4)

	var_1_0.Left = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Right"

	var_1_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_1_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -1, 0, _1080p * 1, _1080p * -1)
	var_1_0:addElement(var_1_6)

	var_1_0.Right = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Top"

	var_1_8:setImage(RegisterMaterial("ui_default_white"), 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_1_0:addElement(var_1_8)

	var_1_0.Top = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Bottom"

	var_1_10:setImage(RegisterMaterial("ui_default_white"), 0)
	var_1_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_1_0:addElement(var_1_10)

	var_1_0.Bottom = var_1_10

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	local var_1_12 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -1
		}
	}

	var_1_4:RegisterAnimationSequence("FromMiddle", var_1_12)

	local var_1_13 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -1
		}
	}

	var_1_6:RegisterAnimationSequence("FromMiddle", var_1_13)

	local var_1_14 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_1_8:RegisterAnimationSequence("FromMiddle", var_1_14)

	local var_1_15 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_1_10:RegisterAnimationSequence("FromMiddle", var_1_15)

	local function var_1_16()
		var_1_4:AnimateSequence("FromMiddle")
		var_1_6:AnimateSequence("FromMiddle")
		var_1_8:AnimateSequence("FromMiddle")
		var_1_10:AnimateSequence("FromMiddle")
	end

	var_1_0._sequences.FromMiddle = var_1_16

	return var_1_0
end

MenuBuilder.registerType("GenericBorderFrame", GenericBorderFrame)
LockTable(_M)
