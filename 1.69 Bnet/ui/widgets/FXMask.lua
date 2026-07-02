module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Mask:setImage(RegisterMaterial("shred_mask"), 0)

	arg_1_1 = arg_1_1 or 1

	local var_1_0 = {
		{
			vMin = 0,
			uMax = 0.5,
			uMin = 0,
			vMax = 0.25
		},
		{
			vMin = 0,
			uMax = 1,
			uMin = 0.5,
			vMax = 0.25
		},
		{
			vMin = 0.25,
			uMax = 0.5,
			uMin = 0,
			vMax = 0.5
		},
		{
			vMin = 0.25,
			uMax = 1,
			uMin = 0.5,
			vMax = 0.5
		},
		{
			vMin = 0.5,
			uMax = 0.5,
			uMin = 0,
			vMax = 0.75
		},
		{
			vMin = 0.5,
			uMax = 1,
			uMin = 0.5,
			vMax = 0.75
		},
		{
			vMin = 0.75,
			uMax = 0.5,
			uMin = 0,
			vMax = 1
		},
		{
			vMin = 0.75,
			uMax = 1,
			uMin = 0.5,
			vMax = 1
		}
	}
	local var_1_1
	local var_1_2 = 0
	local var_1_3 = 8
	local var_1_4

	local function var_1_5()
		var_1_1 = var_1_0[math.random(1, 8)]
		arg_1_0:Wait(50 / arg_1_1).onComplete = function()
			if var_1_2 < var_1_3 then
				var_1_5()

				var_1_2 = var_1_2 + 1
			else
				var_1_1 = var_1_0[8]
			end

			arg_1_0.Mask:SetUMin(var_1_1.uMin, 0)
			arg_1_0.Mask:SetUMax(var_1_1.uMax, 0)
			arg_1_0.Mask:SetVMin(var_1_1.vMin, 0)
			arg_1_0.Mask:SetVMax(var_1_1.vMax, 0)
		end
	end

	var_1_5()
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_2 = arg_4_2 or 1

	local var_4_0
	local var_4_1 = (not arg_4_3 or arg_4_3 == "in") and true or false

	arg_4_0.Mask:setImage(RegisterMaterial(arg_4_1), 0)

	local var_4_2 = {
		{
			value = 0,
			property = TWEEN_PROPERTY.U_Min,
			duration = 0 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Max,
			duration = 0 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			property = TWEEN_PROPERTY.V_Min,
			duration = 0 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			property = TWEEN_PROPERTY.V_Max,
			duration = 0 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.Alpha,
			duration = 0 / arg_4_2
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.U_Max,
			duration = 150 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Min,
			duration = 150 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.V_Max,
			duration = 280 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			property = TWEEN_PROPERTY.V_Min,
			duration = 280 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			property = TWEEN_PROPERTY.U_Min,
			duration = 130 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Max,
			duration = 130 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Min,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.U_Max,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			property = TWEEN_PROPERTY.V_Max,
			duration = 240 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.V_Min,
			duration = 240 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Max,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			property = TWEEN_PROPERTY.U_Min,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Min,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.U_Max,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.V_Max,
			duration = 240 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			property = TWEEN_PROPERTY.V_Min,
			duration = 240 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			property = TWEEN_PROPERTY.U_Min,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Max,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Min,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.U_Max,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.V_Max,
			duration = 240 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			property = TWEEN_PROPERTY.V_Min,
			duration = 240 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.U_Max,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Min,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		}
	}

	arg_4_0.Mask:RegisterAnimationSequence("DissolveIn", var_4_2)

	local function var_4_3()
		arg_4_0.Mask:AnimateSequence("DissolveIn")
	end

	arg_4_0._sequences.DissolveIn = var_4_3

	local var_4_4 = {
		{
			value = 1,
			property = TWEEN_PROPERTY.V_Max,
			duration = 0 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			property = TWEEN_PROPERTY.V_Min,
			duration = 0 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.U_Max,
			duration = 0 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Min,
			duration = 0 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.Alpha,
			duration = 0 / arg_4_2
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.V_Min,
			duration = 280 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			property = TWEEN_PROPERTY.V_Max,
			duration = 280 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			property = TWEEN_PROPERTY.Alpha,
			duration = 1000 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Max,
			duration = 150 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			property = TWEEN_PROPERTY.U_Min,
			duration = 150 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.U_Max,
			duration = 130 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Min,
			duration = 130 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			property = TWEEN_PROPERTY.V_Min,
			duration = 240 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.V_Max,
			duration = 240 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			property = TWEEN_PROPERTY.U_Min,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Max,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.U_Max,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Min,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			property = TWEEN_PROPERTY.U_Min,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Max,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			property = TWEEN_PROPERTY.V_Max,
			duration = 240 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			property = TWEEN_PROPERTY.V_Min,
			duration = 240 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Min,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			property = TWEEN_PROPERTY.U_Max,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			property = TWEEN_PROPERTY.U_Min,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			property = TWEEN_PROPERTY.U_Max,
			duration = 120 / arg_4_2,
			easing = LUI.EASING.snap
		}
	}

	arg_4_0.Mask:RegisterAnimationSequence("DissolveOut", var_4_4)

	local function var_4_5()
		arg_4_0.Mask:AnimateSequence("DissolveOut")
	end

	arg_4_0._sequences.DissolveOut = var_4_5

	ACTIONS.AnimateSequence(arg_4_0, var_4_1 and "DissolveIn" or "DissolveOut")
end

local function var_0_2(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = "block_dissolve_sm_mask"

	var_0_1(arg_7_0, var_7_0, arg_7_1, arg_7_2)
end

local function var_0_3(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = "block_dissolve_lg_mask"

	var_0_1(arg_8_0, var_8_0, arg_8_1, arg_8_2)
end

local function var_0_4(arg_9_0, arg_9_1)
	arg_9_0.Mask:SetUMin(0.5, 0)
	arg_9_0.Mask:SetVMin(0.75, 0)
	arg_9_0.Mask:SetUMax(1, 0)
	arg_9_0.Mask:SetVMax(1, 0)

	if arg_9_1 == "in" then
		arg_9_0.Mask:SetAlpha(1)
	else
		arg_9_0.Mask:SetAlpha(0)
	end
end

local function var_0_5(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.Shred = var_0_0
	arg_10_0.Snap = var_0_4
	arg_10_0.DissolveSmall = var_0_2
	arg_10_0.DissolveLarge = var_0_3
end

function FXMask(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1024 * _1080p, 0, 256 * _1080p)

	var_11_0.id = "FXMask"
	var_11_0._animationSets = {}
	var_11_0._sequences = {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Mask"

	var_11_4:setImage(RegisterMaterial("block_dissolve_lg_mask"), 0)
	var_11_4:SetUMax(0.5, 0)
	var_11_4:SetVMax(0.25, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.Mask = var_11_4

	local function var_11_5()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_5

	local var_11_6 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 133,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 133,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 133,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 133,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 133,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		}
	}

	var_11_4:RegisterAnimationSequence("Sequence", var_11_6)

	local function var_11_7()
		var_11_4:AnimateSequence("Sequence")
	end

	var_11_0._sequences.Sequence = var_11_7

	local var_11_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("Blink", var_11_8)

	local function var_11_9()
		var_11_4:AnimateLoop("Blink")
	end

	var_11_0._sequences.Blink = var_11_9

	local var_11_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 133,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 533,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 133,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 133,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 133,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 133,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 133,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 133,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 67,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 67,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		}
	}

	var_11_4:RegisterAnimationSequence("DissolveOut", var_11_10)

	local function var_11_11()
		var_11_4:AnimateSequence("DissolveOut")
	end

	var_11_0._sequences.DissolveOut = var_11_11

	local var_11_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 60,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 60,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 60,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 60,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 60,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 60,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 60,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 60,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		}
	}

	var_11_4:RegisterAnimationSequence("SequenceFast", var_11_12)

	local function var_11_13()
		var_11_4:AnimateSequence("SequenceFast")
	end

	var_11_0._sequences.SequenceFast = var_11_13

	local var_11_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 60,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 60,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 60,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 60,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 60,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		}
	}

	var_11_4:RegisterAnimationSequence("DissolveOutFast", var_11_14)

	local function var_11_15()
		var_11_4:AnimateSequence("DissolveOutFast")
	end

	var_11_0._sequences.DissolveOutFast = var_11_15

	local var_11_16 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		}
	}

	var_11_4:RegisterAnimationSequence("On", var_11_16)

	local function var_11_17()
		var_11_4:AnimateSequence("On")
	end

	var_11_0._sequences.On = var_11_17

	var_0_5(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("FXMask", FXMask)
LockTable(_M)
