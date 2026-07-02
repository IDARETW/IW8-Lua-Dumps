module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	function arg_1_0.AcceptsFocusType(arg_2_0, arg_2_1)
		return arg_2_1 == FocusType.MouseOver
	end
end

function TrialEventListArrow(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 140 * _1080p, 0, 250 * _1080p)

	var_3_0.id = "TrialEventListArrow"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Arrow"

	var_3_4:SetAlpha(0.7, 0)
	var_3_4:SetZRotation(90, 0)
	var_3_4:SetScale(-0.2, 0)
	var_3_4:setImage(RegisterMaterial("icon_option_arrow_up_down"), 0)
	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -70, _1080p * 70, _1080p * -70, _1080p * 70)
	var_3_0:addElement(var_3_4)

	var_3_0.Arrow = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "CircularGradient"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_3_6:SetAlpha(0, 0)
	var_3_6:SetPixelGridEnabled(true)
	var_3_6:SetPixelGridContrast(0.5, 0)
	var_3_6:SetPixelGridBlockWidth(2, 0)
	var_3_6:SetPixelGridBlockHeight(2, 0)
	var_3_6:SetPixelGridGutterWidth(1, 0)
	var_3_6:SetPixelGridGutterHeight(1, 0)
	var_3_6:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -107, _1080p * 107, _1080p * -111, _1080p * 111)
	var_3_0:addElement(var_3_6)

	var_3_0.CircularGradient = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8
	local var_3_9 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ButtonOver", var_3_9)

	local var_3_10 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonOver", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("ButtonOver")
		var_3_6:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 0.7,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_4:RegisterAnimationSequence("ButtonUp", var_3_13)

	local var_3_14 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonUp", var_3_14)

	local function var_3_15()
		var_3_4:AnimateSequence("ButtonUp")
		var_3_6:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_3_4:RegisterAnimationSequence("Disabled", var_3_17)

	local function var_3_18()
		var_3_4:AnimateSequence("Disabled")
	end

	var_3_0._sequences.Disabled = var_3_18

	local var_3_19
	local var_3_20 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Enabled", var_3_20)

	local function var_3_21()
		var_3_4:AnimateSequence("Enabled")
	end

	var_3_0._sequences.Enabled = var_3_21

	local function var_3_22()
		return
	end

	var_3_0._sequences.ButtonOverDisabled = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ButtonUpDisabled", var_3_24)

	local function var_3_25()
		var_3_4:AnimateSequence("ButtonUpDisabled")
	end

	var_3_0._sequences.ButtonUpDisabled = var_3_25

	var_3_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_3_0:addEventHandler("button_disable", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "Disabled")
	end)
	var_3_0:addEventHandler("button_over_disable", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "Disabled")
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TrialEventListArrow", TrialEventListArrow)
LockTable(_M)
