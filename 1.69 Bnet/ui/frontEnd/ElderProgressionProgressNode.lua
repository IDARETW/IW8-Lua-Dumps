module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1 <= arg_1_2

	if arg_1_0._progressReached ~= var_1_0 then
		arg_1_0._progressReached = var_1_0

		if arg_1_0._progressReached then
			arg_1_0.image:setImage(RegisterMaterial(arg_1_0._seasonEmblem))
			ACTIONS.AnimateSequence(arg_1_0, "OnProgressReached")
		else
			ACTIONS.AnimateSequence(arg_1_0, "OnProgressNotReached")
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1.seasonEmblem and #arg_2_1.seasonEmblem > 0 then
		arg_2_0._seasonEmblem = arg_2_1.seasonEmblem
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.OnProgressUpdate = var_0_0
	arg_3_0.SetData = var_0_1
	arg_3_0._progressReached = false
	arg_3_0._seasonEmblem = "seasonEmblem_on"
end

function ElderProgressionProgressNode(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 48 * _1080p, 0, 48 * _1080p)

	var_4_0.id = "ElderProgressionProgressNode"
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

	var_4_4.id = "image"

	var_4_4:SetRGBFromTable(SWATCHES.tabManager.tabTextDisabled, 0)
	var_4_4:setImage(RegisterMaterial("widg_glow_circle"), 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 39, _1080p * 9, _1080p * 39)
	var_4_0:addElement(var_4_4)

	var_4_0.image = var_4_4

	local function var_4_5()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_5

	local var_4_6 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 48,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 48,
			easing = LUI.EASING.inCubic
		},
		{
			value = 16777215,
			duration = 50,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -6
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -6
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 54
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 48
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 48
		}
	}

	var_4_4:RegisterAnimationSequence("OnProgressReached", var_4_6)

	local function var_4_7()
		var_4_4:AnimateSequence("OnProgressReached")
	end

	var_4_0._sequences.OnProgressReached = var_4_7

	local var_4_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_glow_circle")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_4_4:RegisterAnimationSequence("OnProgressNotReached", var_4_8)

	local function var_4_9()
		var_4_4:AnimateSequence("OnProgressNotReached")
	end

	var_4_0._sequences.OnProgressNotReached = var_4_9

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ElderProgressionProgressNode", ElderProgressionProgressNode)
LockTable(_M)
