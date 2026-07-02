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

	ACTIONS.AnimateSequence(arg_3_0, "Pulse")
end

function MapDecorationSquare(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p)

	var_4_0.id = "MapDecorationSquare"
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

	var_4_4.id = "Square"

	var_4_4:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_4_4:setImage(RegisterMaterial("campaign_decoration_square_01"), 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16)
	var_4_0:addElement(var_4_4)

	var_4_0.Square = var_4_4

	local function var_4_5()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_5

	local var_4_6 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Pulse", var_4_6)

	local function var_4_7()
		var_4_4:AnimateLoop("Pulse")
	end

	var_4_0._sequences.Pulse = var_4_7

	local var_4_8 = {
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_4_4:RegisterAnimationSequence("Appear", var_4_8)

	local function var_4_9()
		var_4_4:AnimateSequence("Appear")
	end

	var_4_0._sequences.Appear = var_4_9

	local var_4_10 = {
		{
			value = -0.95,
			duration = 400,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		}
	}

	var_4_4:RegisterAnimationSequence("Hide", var_4_10)

	local function var_4_11()
		var_4_4:AnimateSequence("Hide")
	end

	var_4_0._sequences.Hide = var_4_11

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MapDecorationSquare", MapDecorationSquare)
LockTable(_M)
