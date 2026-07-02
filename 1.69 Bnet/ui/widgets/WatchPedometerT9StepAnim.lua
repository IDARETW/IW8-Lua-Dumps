module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.StepFlipbook)
	assert(arg_1_0.StepFlipbookMask)
	arg_1_0.StepFlipbook:SetMask(arg_1_0.StepFlipbookMask)
end

function WatchPedometerT9StepAnim(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 156 * _1080p, 0, 175 * _1080p)

	var_2_0.id = "WatchPedometerT9StepAnim"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "StepFlipbook"

	var_2_4:SetRGBFromInt(2895923, 0)
	var_2_4:setImage(RegisterMaterial("watch_step_anim"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1553, 0, _1080p * 175)
	var_2_0:addElement(var_2_4)

	var_2_0.StepFlipbook = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "StepFlipbookMask"

	var_2_6:setImage(RegisterMaterial("stencil_mask"), 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 156, 0, _1080p * 175)
	var_2_0:addElement(var_2_6)

	var_2_0.StepFlipbookMask = var_2_6

	local var_2_7
	local var_2_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1553
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -155,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1398,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -310,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1243,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -465,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1088,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -620,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 933,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 778,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -775,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -930,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 622,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1086,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 467,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1242,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 312,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1397,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 156,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1397,
			easing = LUI.EASING.snap
		},
		{
			duration = 90,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 156,
			easing = LUI.EASING.snap
		}
	}

	var_2_4:RegisterAnimationSequence("DefaultSequence", var_2_8)

	local function var_2_9()
		var_2_4:AnimateLoop("DefaultSequence")
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	var_0_0(var_2_0, var_2_1, arg_2_1)
	ACTIONS.AnimateSequence(var_2_0, "DefaultSequence")

	return var_2_0
end

MenuBuilder.registerType("WatchPedometerT9StepAnim", WatchPedometerT9StepAnim)
LockTable(_M)
