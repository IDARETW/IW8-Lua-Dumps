module(..., package.seeall)

local var_0_0 = {
	NO_PROGRESS = 0,
	COMPLETE = 2,
	INCOMPLETE = 1
}

local function var_0_1(arg_1_0)
	if arg_1_0 <= 0 then
		return var_0_0.NO_PROGRESS
	elseif arg_1_0 < 1 then
		return var_0_0.INCOMPLETE
	else
		return var_0_0.COMPLETE
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	arg_2_0:SetAlpha(arg_2_1 == var_0_0.NO_PROGRESS and 0 or 1)

	if arg_2_1 == var_0_0.NO_PROGRESS then
		ACTIONS.AnimateSequence(arg_2_0, "NoProgress")
	elseif arg_2_1 == var_0_0.INCOMPLETE then
		ACTIONS.AnimateSequence(arg_2_0, "Incomplete")
	elseif arg_2_1 == var_0_0.COMPLETE then
		ACTIONS.AnimateSequence(arg_2_0, "Complete")
	end
end

local function var_0_3(arg_3_0)
	return arg_3_0._progress
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	assert(type(arg_4_1) == "number")
	assert(type(arg_4_2) == "number")

	if arg_4_3 == nil then
		arg_4_3 = LUI.EASING.linear
	end

	local function var_4_0(arg_5_0, arg_5_1)
		arg_4_0._progress = LUI.clamp(arg_5_0, 0, 1)

		if arg_4_4 then
			arg_4_0.Fill:SetRGBFromTable(arg_4_4, arg_5_1, arg_4_3)
		end

		if arg_4_0._progress < 0.05 then
			arg_4_0.Glow:SetAlpha(0)
		elseif arg_4_0._glowEnabled then
			arg_4_0.Glow:SetAlpha(1, arg_5_1)
		end

		arg_4_0.Cap:SetAnchors(arg_4_0._progress, 1 - arg_4_0._progress, 0, 0, arg_5_1, arg_4_3)
		arg_4_0.Fill:SetAnchors(0, 1 - arg_4_0._progress, 0, 0, arg_5_1, arg_4_3)
		arg_4_0.Glow:SetAnchors(0, 1 - arg_4_0._progress - 0.15, 0, 0, arg_5_1, arg_4_3)
		arg_4_0.Glint:SetAnchors(arg_4_0._progress, 1 - arg_4_0._progress, 0.5, 0.5, arg_5_1, arg_4_3)
	end

	if arg_4_2 > 0 then
		local var_4_1 = math.abs(arg_4_1 - arg_4_0._progress)
		local var_4_2 = var_0_0.NO_PROGRESS

		if var_4_1 > 0 then
			var_4_2 = var_0_0.INCOMPLETE
		end

		local var_4_3 = var_0_1(arg_4_1)

		var_0_2(arg_4_0, var_4_2)
		var_4_0(arg_4_1, arg_4_2)

		arg_4_0._isPlayingAnimation = true
		arg_4_0:Wait(arg_4_2).onComplete = function()
			var_0_2(arg_4_0, var_4_3)
			var_4_0(arg_4_1, 0)

			arg_4_0._isPlayingAnimation = false
		end
	elseif not arg_4_0._isPlayingAnimation then
		var_0_2(arg_4_0, var_0_1(arg_4_1))
		var_4_0(arg_4_1, 0)
	end
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0._glowEnabled = arg_7_1

	if arg_7_1 == false then
		if arg_7_3 and arg_7_3.disableGlowTime then
			arg_7_0.Glow:SetAlpha(0, arg_7_3.disableGlowTime)
		else
			arg_7_0.Glow:SetAlpha(0, 300)
		end
	elseif not arg_7_2 then
		arg_7_0.Glow:SetColorOp(COLOR_OP.saturation)
	else
		arg_7_0.Glow:SetColorOp(COLOR_OP.none)
	end

	if arg_7_3 and arg_7_3.enableImmediately then
		arg_7_0.Glow:SetAlpha(1, 100)
	end
end

local function var_0_6(arg_8_0, arg_8_1)
	arg_8_0.GetProgress = var_0_3
	arg_8_0.SetProgress = var_0_4
	arg_8_0.EnableGlow = var_0_5

	arg_8_0.Cap:SetMask(arg_8_0.Mask)
	arg_8_0.Mask:SetAlpha(1)

	arg_8_0._progress = 0
end

function BattlePassProgressBar(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 6 * _1080p)

	var_9_0.id = "BattlePassProgressBar"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Fill"

	var_9_4:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_9_4:setImage(RegisterMaterial("battlepass_progressbar_greyscale"), 0)
	var_9_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.Fill = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "Cap"

	var_9_6:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_9_6:SetAlpha(0.5, 0)
	var_9_6:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_9_6:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_9_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -15, 0, 0, 0)
	var_9_0:addElement(var_9_6)

	var_9_0.Cap = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIImage.new()

	var_9_8.id = "Glint"

	var_9_8:setImage(RegisterMaterial("battlepass_progressbar_glint"), 0)
	var_9_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -19, _1080p * 21, _1080p * -20, _1080p * 20)
	var_9_0:addElement(var_9_8)

	var_9_0.Glint = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "Glow"

	var_9_10:SetAlpha(0, 0)
	var_9_10:setImage(RegisterMaterial("battlepass_progressbar_atlas"), 0)
	var_9_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -10, _1080p * -10, _1080p * -23, _1080p * 23)
	var_9_0:addElement(var_9_10)

	var_9_0.Glow = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIImage.new()

	var_9_12.id = "Mask"

	var_9_12:SetAlpha(0, 0)
	var_9_12:setImage(RegisterMaterial("stencil_mask"), 0)
	var_9_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -23, _1080p * 23)
	var_9_0:addElement(var_9_12)

	var_9_0.Mask = var_9_12

	local function var_9_13()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_13

	local var_9_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Complete", var_9_14)

	local var_9_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("Complete", var_9_15)

	local function var_9_16()
		var_9_6:AnimateSequence("Complete")
		var_9_8:AnimateSequence("Complete")
	end

	var_9_0._sequences.Complete = var_9_16

	local var_9_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		}
	}

	var_9_4:RegisterAnimationSequence("Free", var_9_17)

	local var_9_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_9_6:RegisterAnimationSequence("Free", var_9_18)

	local var_9_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_9_8:RegisterAnimationSequence("Free", var_9_19)

	local function var_9_20()
		var_9_4:AnimateSequence("Free")
		var_9_6:AnimateSequence("Free")
		var_9_8:AnimateSequence("Free")
	end

	var_9_0._sequences.Free = var_9_20

	local var_9_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_9_4:RegisterAnimationSequence("Purchased", var_9_21)

	local var_9_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_9_6:RegisterAnimationSequence("Purchased", var_9_22)

	local var_9_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_9_8:RegisterAnimationSequence("Purchased", var_9_23)

	local function var_9_24()
		var_9_4:AnimateSequence("Purchased")
		var_9_6:AnimateSequence("Purchased")
		var_9_8:AnimateSequence("Purchased")
	end

	var_9_0._sequences.Purchased = var_9_24

	local var_9_25 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Incomplete", var_9_25)

	local var_9_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("Incomplete", var_9_26)

	local function var_9_27()
		var_9_6:AnimateSequence("Incomplete")
		var_9_8:AnimateSequence("Incomplete")
	end

	var_9_0._sequences.Incomplete = var_9_27

	local var_9_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("NoProgress", var_9_28)

	local function var_9_29()
		var_9_8:AnimateSequence("NoProgress")
	end

	var_9_0._sequences.NoProgress = var_9_29

	var_0_6(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("BattlePassProgressBar", BattlePassProgressBar)
LockTable(_M)
