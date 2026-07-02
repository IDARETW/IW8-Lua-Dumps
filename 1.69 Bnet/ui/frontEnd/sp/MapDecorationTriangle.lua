module(..., package.seeall)

local function var_0_0(arg_1_0)
	ACTIONS.AnimateSequence(arg_1_0, "Appear")

	arg_1_0:Wait(arg_1_0._transitionDuration).onComplete = function()
		ACTIONS.AnimateSequence(arg_1_0, "Pulse")
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.PlayAnim = var_0_0
	arg_3_0._transitionDuration = 500
end

function MapDecorationTriangle(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p)

	var_4_0.id = "MapDecorationTriangle"
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

	var_4_4.id = "Triangle1"

	var_4_4:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_4:setImage(RegisterMaterial("campaign_world_map_triangle"), 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -10, _1080p * -2)
	var_4_0:addElement(var_4_4)

	var_4_0.Triangle1 = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Triangle2"

	var_4_6:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_6:SetAlpha(0.5, 0)
	var_4_6:setImage(RegisterMaterial("campaign_world_map_triangle"), 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4)
	var_4_0:addElement(var_4_6)

	var_4_0.Triangle2 = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Triangle3"

	var_4_8:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_8:SetAlpha(0.5, 0)
	var_4_8:setImage(RegisterMaterial("campaign_world_map_triangle"), 0)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * 2, _1080p * 10)
	var_4_0:addElement(var_4_8)

	var_4_0.Triangle3 = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.25,
			duration = 133,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		},
		{
			duration = 267,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 267,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
		},
		{
			value = 0.5,
			duration = 267,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_4_4:RegisterAnimationSequence("Appear", var_4_10)

	local var_4_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
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
			value = 0,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 133,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 1
		},
		{
			duration = 133,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			value = -0.2,
			duration = 400,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.snap
		},
		{
			duration = 133,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 133,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			value = 0.5,
			duration = 267,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 133,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 133,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		},
		{
			value = 0,
			duration = 133,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Appear", var_4_11)

	local var_4_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		},
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
			duration = 267,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 267,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			value = 0,
			duration = 267,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.1,
			duration = 467,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			value = 0.5,
			duration = 333,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 133,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_4_8:RegisterAnimationSequence("Appear", var_4_12)

	local function var_4_13()
		var_4_4:AnimateSequence("Appear")
		var_4_6:AnimateSequence("Appear")
		var_4_8:AnimateSequence("Appear")
	end

	var_4_0._sequences.Appear = var_4_13

	local var_4_14 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 2400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Pulse", var_4_14)

	local var_4_15 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 2600,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Pulse", var_4_15)

	local var_4_16 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 2800,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Pulse", var_4_16)

	local function var_4_17()
		var_4_4:AnimateLoop("Pulse")
		var_4_6:AnimateLoop("Pulse")
		var_4_8:AnimateLoop("Pulse")
	end

	var_4_0._sequences.Pulse = var_4_17

	local var_4_18 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Hide", var_4_18)

	local var_4_19 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Hide", var_4_19)

	local var_4_20 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Hide", var_4_20)

	local function var_4_21()
		var_4_4:AnimateSequence("Hide")
		var_4_6:AnimateSequence("Hide")
		var_4_8:AnimateSequence("Hide")
	end

	var_4_0._sequences.Hide = var_4_21

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MapDecorationTriangle", MapDecorationTriangle)
LockTable(_M)
