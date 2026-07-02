module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.currentState == "over" then
		return
	end

	arg_1_0.currentState = "over"

	ACTIONS.AnimateSequence(arg_1_0, "Pulse")
	arg_1_0.Arrow:SetLeft(_1080p * -2, 0)
	arg_1_0.Arrow:SetLeft(_1080p * 1, 150)
	arg_1_0.Arrow:SetRight(_1080p * 14, 0)
	arg_1_0.Arrow:SetRight(_1080p * 17, 150)
	arg_1_0.Arrow:SetAlpha(1)
	arg_1_0.ArrowShadow:SetLeft(_1080p * 1, 0)
	arg_1_0.ArrowShadow:SetLeft(_1080p * 4, 150)
	arg_1_0.ArrowShadow:SetRight(_1080p * 17, 0)
	arg_1_0.ArrowShadow:SetRight(_1080p * 20, 150)
	arg_1_0.ArrowShadow:SetAlpha(0.4)
	arg_1_0.HighlightLeft:SetAlpha(1)
	arg_1_0.HighlightShadow:SetAlpha(0.4)
	arg_1_0.HighlightLeft:SetTopAnchor(0, 150, LUI.EASING.inQuadratic)
	arg_1_0.HighlightLeft:SetBottomAnchor(0, 150, LUI.EASING.inQuadratic)
	arg_1_0.HighlightShadow:SetTopAnchor(0, 150, LUI.EASING.inQuadratic)
	arg_1_0.HighlightShadow:SetBottomAnchor(0, 150, LUI.EASING.inQuadratic)

	if CONDITIONS.IsThirdGameMode(arg_1_0) then
		arg_1_0.HighlightRight:SetAlpha(1)
		arg_1_0.HighlightRight:SetTopAnchor(0, 150, LUI.EASING.inQuadratic)
		arg_1_0.HighlightRight:SetBottomAnchor(0, 150, LUI.EASING.inQuadratic)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0.currentState == "up" then
		return
	end

	arg_2_0.currentState = "up"

	ACTIONS.AnimateSequence(arg_2_0, "PulseStop")
	arg_2_0.Arrow:SetLeft(_1080p * 0, 0)
	arg_2_0.Arrow:SetLeft(_1080p * -2, 150)
	arg_2_0.Arrow:SetRight(_1080p * 17, 0)
	arg_2_0.Arrow:SetRight(_1080p * 14, 150)
	arg_2_0.ArrowShadow:SetLeft(_1080p * 4, 0)
	arg_2_0.ArrowShadow:SetLeft(_1080p * 1, 150)
	arg_2_0.ArrowShadow:SetRight(_1080p * 20, 0)
	arg_2_0.ArrowShadow:SetRight(_1080p * 17, 150)
	arg_2_0.GradientLeft:SetAlpha(0)

	local var_2_0 = arg_2_0.HighlightLeft:SetTopAnchor(0.5, 150, LUI.EASING.inQuadratic)

	if var_2_0 then
		function var_2_0.onComplete()
			arg_2_0.Arrow:SetAlpha(0)
			arg_2_0.ArrowShadow:SetAlpha(0)
			arg_2_0.HighlightLeft:SetAlpha(0)

			if CONDITIONS.IsThirdGameMode(arg_2_0) then
				arg_2_0.HighlightRight:SetAlpha(0)
			end
		end
	end

	arg_2_0.HighlightLeft:SetBottomAnchor(0.5, 150, LUI.EASING.inQuadratic)
	arg_2_0.HighlightShadow:SetTopAnchor(0.5, 150, LUI.EASING.inQuadratic)
	arg_2_0.HighlightShadow:SetBottomAnchor(0.5, 150, LUI.EASING.inQuadratic)

	if CONDITIONS.IsThirdGameMode(arg_2_0) then
		arg_2_0.GradientRightCP:SetAlpha(0)
		arg_2_0.HighlightRight:SetTopAnchor(0.5, 150, LUI.EASING.inQuadratic)
		arg_2_0.HighlightRight:SetBottomAnchor(0.5, 150, LUI.EASING.inQuadratic)
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.Arrow)
	assert(arg_4_0.ArrowShadow)
	assert(arg_4_0.HighlightLeft)
	assert(arg_4_0.HighlightShadow)
	assert(arg_4_0.GradientLeft)

	if CONDITIONS.IsThirdGameMode(arg_4_0) then
		assert(arg_4_0.HighlightRight)
		assert(arg_4_0.GradientRightCP)
	end

	arg_4_0.currentState = "up"

	arg_4_0:addEventHandler("button_over", var_0_0)
	arg_4_0:addEventHandler("button_over_disable", var_0_0)
	arg_4_0:addEventHandler("button_up", var_0_1)
	arg_4_0:addEventHandler("button_disable", var_0_1)
end

function GenericButtonSelection(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_5_0.id = "GenericButtonSelection"
	var_5_0._animationSets = {}
	var_5_0._sequences = {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3

	if CONDITIONS.IsThirdGameMode(var_5_0) then
		local var_5_4 = LUI.UIImage.new()

		var_5_4.id = "GradientRightCP"

		var_5_4:SetRGBFromTable(SWATCHES.HUD.warning, 0)
		var_5_4:SetAlpha(0, 0)
		var_5_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
		var_5_4:SetBlendMode(BLEND_MODE.addWithAlpha)
		var_5_4:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -15, 0, 0)
		var_5_0:addElement(var_5_4)

		var_5_0.GradientRightCP = var_5_4
	end

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "GradientLeft"

	var_5_6:SetRGBFromTable(SWATCHES.HUD.warning, 0)
	var_5_6:SetAlpha(0, 0)
	var_5_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_5_6:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 15, 0, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.GradientLeft = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "ArrowShadow"

	var_5_8:SetRGBFromTable(SWATCHES.splashNotifications.splashAlternativeColor1Dark, 0)
	var_5_8:SetAlpha(0, 0)
	var_5_8:SetZRotation(90, 0)
	var_5_8:setImage(RegisterMaterial("hud_arrow"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 2, _1080p * 18, _1080p * -5.5, _1080p * 5.5)
	var_5_0:addElement(var_5_8)

	var_5_0.ArrowShadow = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "HighlightShadow"

	var_5_10:SetRGBFromTable(SWATCHES.splashNotifications.splashAlternativeColor1Dark, 0)
	var_5_10:SetAlpha(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 3, _1080p * 9, 0, 0)
	var_5_0:addElement(var_5_10)

	var_5_0.HighlightShadow = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Arrow"

	var_5_12:SetRGBFromInt(16767586, 0)
	var_5_12:SetAlpha(0, 0)
	var_5_12:SetZRotation(90, 0)
	var_5_12:setImage(RegisterMaterial("hud_arrow"), 0)
	var_5_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -1, _1080p * 15, _1080p * -5.5, _1080p * 5.5)
	var_5_0:addElement(var_5_12)

	var_5_0.Arrow = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "HighlightLeft"

	var_5_14:SetRGBFromInt(16767586, 0)
	var_5_14:SetAlpha(0, 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 6, 0, 0)
	var_5_0:addElement(var_5_14)

	var_5_0.HighlightLeft = var_5_14

	local var_5_15

	if CONDITIONS.IsThirdGameMode(var_5_0) then
		local var_5_16 = LUI.UIImage.new()

		var_5_16.id = "HighlightRight"

		var_5_16:SetRGBFromTable(SWATCHES.Zombies.menuHeader, 0)
		var_5_16:SetAlpha(0, 0)
		var_5_16:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -5, 0, 0, 0)
		var_5_0:addElement(var_5_16)

		var_5_0.HighlightRight = var_5_16
	end

	local function var_5_17()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_17

	local var_5_18 = {
		{
			value = 0.2,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
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
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outSine
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 25,
			easing = LUI.EASING.outSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.outSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.outSine
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.outSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.outSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.outSine
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 25
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
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
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
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inSine
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20,
			easing = LUI.EASING.inSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.inSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Bottom,
			easing = LUI.EASING.inSine
		},
		{
			value = 0.15,
			duration = 1200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Left_Anchor,
			easing = LUI.EASING.inSine
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Right_Anchor,
			easing = LUI.EASING.inSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Top_Anchor,
			easing = LUI.EASING.inSine
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Bottom_Anchor,
			easing = LUI.EASING.inSine
		}
	}

	var_5_6:RegisterAnimationSequence("Pulse", var_5_18)

	local function var_5_19()
		var_5_6:AnimateLoop("Pulse")
	end

	var_5_0._sequences.Pulse = var_5_19

	local var_5_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 15
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
			value = 1,
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

	var_5_6:RegisterAnimationSequence("PulseStop", var_5_20)

	local function var_5_21()
		var_5_6:AnimateSequence("PulseStop")
	end

	var_5_0._sequences.PulseStop = var_5_21

	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("GenericButtonSelection", GenericButtonSelection)
LockTable(_M)
