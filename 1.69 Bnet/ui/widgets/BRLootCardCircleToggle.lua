module(..., package.seeall)

function BRLootCardCircleToggle(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 20 * _1080p, 0, 20 * _1080p)

	var_1_0.id = "BRLootCardCircleToggle"
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

	var_1_4.id = "Fill"

	var_1_4:setImage(RegisterMaterial("passive_circle_background"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, _1080p * 2, _1080p * -2)
	var_1_0:addElement(var_1_4)

	var_1_0.Fill = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Background"

	var_1_6:setImage(RegisterMaterial("cac_large_attachment_ring"), 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Background = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8
	local var_1_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("On", var_1_9)

	local var_1_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("On", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("On")
		var_1_6:AnimateSequence("On")
	end

	var_1_0._sequences.On = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Off", var_1_13)

	local var_1_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Off", var_1_14)

	local function var_1_15()
		var_1_4:AnimateSequence("Off")
		var_1_6:AnimateSequence("Off")
	end

	var_1_0._sequences.Off = var_1_15

	local var_1_16
	local var_1_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Empty", var_1_17)

	local var_1_18 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("hud_circle_fill_thick_whole_small")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_1_6:RegisterAnimationSequence("Empty", var_1_18)

	local function var_1_19()
		var_1_4:AnimateSequence("Empty")
		var_1_6:AnimateSequence("Empty")
	end

	var_1_0._sequences.Empty = var_1_19

	local var_1_20
	local var_1_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.attachmentEquipped
		}
	}

	var_1_4:RegisterAnimationSequence("Filled", var_1_21)

	local var_1_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.attachmentEquipped
		}
	}

	var_1_6:RegisterAnimationSequence("Filled", var_1_22)

	local function var_1_23()
		var_1_4:AnimateSequence("Filled")
		var_1_6:AnimateSequence("Filled")
	end

	var_1_0._sequences.Filled = var_1_23

	return var_1_0
end

MenuBuilder.registerType("BRLootCardCircleToggle", BRLootCardCircleToggle)
LockTable(_M)
