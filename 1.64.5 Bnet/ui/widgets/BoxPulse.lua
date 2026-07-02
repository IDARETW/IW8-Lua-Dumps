module(..., package.seeall)

function BoxPulse(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p)

	var_1_0.id = "BoxPulse"
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

	var_1_4.id = "PulseImage"

	var_1_0:addElement(var_1_4)

	var_1_0.PulseImage = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 900,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 1000,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_1_4:RegisterAnimationSequence("PulseLoop", var_1_6)

	local function var_1_7()
		var_1_4:AnimateLoop("PulseLoop")
	end

	var_1_0._sequences.PulseLoop = var_1_7

	ACTIONS.AnimateSequence(var_1_0, "PulseLoop")

	return var_1_0
end

MenuBuilder.registerType("BoxPulse", BoxPulse)
LockTable(_M)
