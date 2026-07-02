module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0._recording then
		ACTIONS.AnimateSequence(arg_1_0, "Stop")
	else
		ACTIONS.AnimateSequence(arg_1_0, "DefaultSequence")
	end
end

local function var_0_1(arg_2_0)
	arg_2_0._recording = true

	var_0_0(arg_2_0)
end

local function var_0_2(arg_3_0)
	arg_3_0._recording = false

	var_0_0(arg_3_0)
end

local function var_0_3(arg_4_0)
	arg_4_0._recording = not arg_4_0._recording

	var_0_0(arg_4_0)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._recording = false
	arg_5_0.Record = var_0_1
	arg_5_0.Pause = var_0_2
	arg_5_0.Toggle = var_0_3
end

function RecordStopButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 36 * _1080p, 0, 36 * _1080p)

	var_6_0.id = "RecordStopButton"
	var_6_0._animationSets = {}
	var_6_0._sequences = {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "BG"

	var_6_4:SetRGBFromInt(3092271, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.BG = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("GenericFooterButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "GenericFooterButtonBackground"

	var_6_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.GenericFooterButtonBackground = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "RecordImage"

	var_6_8:SetRGBFromInt(12666694, 0)
	var_6_8:setImage(RegisterMaterial("widg_circle_small"), 0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8)
	var_6_0:addElement(var_6_8)

	var_6_0.RecordImage = var_6_8

	local var_6_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_circle_small")
		},
		{
			value = 12666694,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("DefaultSequence", var_6_9)

	local function var_6_10()
		var_6_8:AnimateSequence("DefaultSequence")
	end

	var_6_0._sequences.DefaultSequence = var_6_10

	local var_6_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			value = 9079434,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 6
		}
	}

	var_6_8:RegisterAnimationSequence("Stop", var_6_11)

	local function var_6_12()
		var_6_8:AnimateSequence("Stop")
	end

	var_6_0._sequences.Stop = var_6_12

	var_0_4(var_6_0, var_6_1, arg_6_1)
	ACTIONS.AnimateSequence(var_6_0, "DefaultSequence")

	return var_6_0
end

MenuBuilder.registerType("RecordStopButton", RecordStopButton)
LockTable(_M)
