module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	ACTIONS.AnimateSequence(arg_1_0, "Loop")
	ACTIONS.AnimateSequence(arg_1_0, "Loop2")
	ACTIONS.AnimateSequence(arg_1_0, "Loop3")
	arg_1_0:registerEventHandler("mk2_wide_pattern", function(arg_2_0, arg_2_1)
		arg_2_0.Pattern:setImage(RegisterMaterial("mk2_pattern_wide"), 0)
		arg_2_0.Pattern:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -256, _1080p * 256)
		arg_2_0.PatternAlt:setImage(RegisterMaterial("mk2_pattern_wide"), 0)
		arg_2_0.PatternAlt:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -256, _1080p * 256)
	end)
end

function MK2Pattern(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_3_0.id = "MK2Pattern"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:setUseStencil(true)

	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Pattern"

	var_3_4:setImage(RegisterMaterial("mk2_pattern"), 0)
	var_3_4:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256)
	var_3_0:addElement(var_3_4)

	var_3_0.Pattern = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "PatternAlt"

	var_3_6:SetAlpha(0, 0)
	var_3_6:setImage(RegisterMaterial("mk2_pattern"), 0)
	var_3_6:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256)
	var_3_0:addElement(var_3_6)

	var_3_0.PatternAlt = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Gradient"

	var_3_8:SetAlpha(0, 0)
	var_3_8:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_8:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -160, _1080p * 160, _1080p * -256, _1080p * 256)
	var_3_0:addElement(var_3_8)

	var_3_0.Gradient = var_3_8

	local var_3_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("DefaultSequence", var_3_9)

	local function var_3_10()
		var_3_4:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_10

	local var_3_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.99,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Loop", var_3_11)

	local function var_3_12()
		var_3_4:AnimateLoop("Loop")
	end

	var_3_0._sequences.Loop = var_3_12

	local var_3_13 = {
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
			value = 0.5,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 2000,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 2000,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_6:RegisterAnimationSequence("Loop2", var_3_13)

	local function var_3_14()
		var_3_6:AnimateLoop("Loop2")
	end

	var_3_0._sequences.Loop2 = var_3_14

	local var_3_15 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Loop3", var_3_15)

	local function var_3_16()
		var_3_8:AnimateLoop("Loop3")
	end

	var_3_0._sequences.Loop3 = var_3_16

	var_0_0(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("MK2Pattern", MK2Pattern)
LockTable(_M)
