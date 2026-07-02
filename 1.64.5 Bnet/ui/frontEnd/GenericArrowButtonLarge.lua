module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	function arg_1_0.AcceptsFocusType(arg_2_0, arg_2_1)
		return arg_2_1 == FocusType.MouseOver
	end

	arg_1_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "ButtonUp")
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "Disabled")
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		WZWIP.AnimateThemeElement(arg_6_0, "Disabled")
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function GenericArrowButtonLarge(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 140 * _1080p, 0, 250 * _1080p)

	var_7_0.id = "GenericArrowButtonLarge"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Arrow"

	var_7_4:SetAlpha(0.7, 0)
	var_7_4:SetZRotation(90, 0)
	var_7_4:SetScale(-0.2, 0)
	var_7_4:setImage(RegisterMaterial("icon_option_arrow_up_down"), 0)
	var_7_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -70, _1080p * 70, _1080p * -70, _1080p * 70)
	var_7_0:addElement(var_7_4)

	var_7_0.Arrow = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "CircularGradient"

	var_7_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_7_6:SetAlpha(0, 0)
	var_7_6:SetPixelGridEnabled(true)
	var_7_6:SetPixelGridContrast(0.5, 0)
	var_7_6:SetPixelGridBlockWidth(2, 0)
	var_7_6:SetPixelGridBlockHeight(2, 0)
	var_7_6:SetPixelGridGutterWidth(1, 0)
	var_7_6:SetPixelGridGutterHeight(1, 0)
	var_7_6:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -107, _1080p * 107, _1080p * -111, _1080p * 111)
	var_7_0:addElement(var_7_6)

	var_7_0.CircularGradient = var_7_6

	local var_7_7

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_7_7 = LUI.UIImage.new()
		var_7_7.id = "WZWipCircularGradient"

		var_7_7:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_7_7:SetAlpha(0, 0)
		var_7_7:setImage(RegisterMaterial("ui_generic_glow"), 0)
		var_7_7:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -107, _1080p * 107, _1080p * -111, _1080p * 111)
		var_7_0:addElement(var_7_7)

		var_7_0.WZWipCircularGradient = var_7_7
	end

	local function var_7_8()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_8

	local var_7_9
	local var_7_10 = {
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

	var_7_4:RegisterAnimationSequence("ButtonOver", var_7_10)

	local var_7_11 = {
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOver", var_7_11)

	local function var_7_12()
		var_7_4:AnimateSequence("ButtonOver")
		var_7_6:AnimateSequence("ButtonOver")
	end

	var_7_0._sequences.ButtonOver = var_7_12

	local var_7_13
	local var_7_14 = {
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

	var_7_4:RegisterAnimationSequence("ButtonUp", var_7_14)

	local var_7_15 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUp", var_7_15)

	local function var_7_16()
		var_7_4:AnimateSequence("ButtonUp")
		var_7_6:AnimateSequence("ButtonUp")
	end

	var_7_0._sequences.ButtonUp = var_7_16

	local var_7_17
	local var_7_18 = {
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

	var_7_4:RegisterAnimationSequence("Disabled", var_7_18)

	local function var_7_19()
		var_7_4:AnimateSequence("Disabled")
	end

	var_7_0._sequences.Disabled = var_7_19

	local var_7_20
	local var_7_21 = {
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

	var_7_4:RegisterAnimationSequence("Enabled", var_7_21)

	local function var_7_22()
		var_7_4:AnimateSequence("Enabled")
	end

	var_7_0._sequences.Enabled = var_7_22

	local function var_7_23()
		return
	end

	var_7_0._sequences.ButtonOverDisabled = var_7_23

	local var_7_24
	local var_7_25 = {
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

	var_7_4:RegisterAnimationSequence("ButtonUpDisabled", var_7_25)

	local function var_7_26()
		var_7_4:AnimateSequence("ButtonUpDisabled")
	end

	var_7_0._sequences.ButtonUpDisabled = var_7_26

	local var_7_27
	local var_7_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipSetup", var_7_28)

	local function var_7_29()
		var_7_4:AnimateSequence("WZWipSetup")
	end

	var_7_0._sequences.WZWipSetup = var_7_29

	local var_7_30
	local var_7_31 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipButtonOver", var_7_31)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_32 = {
			{
				value = 0.3,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipButtonOver", var_7_32)
	end

	local function var_7_33()
		var_7_4:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_7:AnimateSequence("WZWipButtonOver")
		end
	end

	var_7_0._sequences.WZWipButtonOver = var_7_33

	local var_7_34
	local var_7_35 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_35)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_36 = {
			{
				value = 0.2,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_36)
	end

	local function var_7_37()
		var_7_4:AnimateSequence("WZWipButtonOverDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_7:AnimateSequence("WZWipButtonOverDisabled")
		end
	end

	var_7_0._sequences.WZWipButtonOverDisabled = var_7_37

	local var_7_38
	local var_7_39 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipButtonUp", var_7_39)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_40 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipButtonUp", var_7_40)
	end

	local function var_7_41()
		var_7_4:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_7:AnimateSequence("WZWipButtonUp")
		end
	end

	var_7_0._sequences.WZWipButtonUp = var_7_41

	local var_7_42
	local var_7_43 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_43)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_44 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_44)
	end

	local function var_7_45()
		var_7_4:AnimateSequence("WZWipButtonUpDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_7:AnimateSequence("WZWipButtonUpDisabled")
		end
	end

	var_7_0._sequences.WZWipButtonUpDisabled = var_7_45

	local var_7_46
	local var_7_47 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_7_4:RegisterAnimationSequence("WZWipDisabled", var_7_47)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_48 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_7:RegisterAnimationSequence("WZWipDisabled", var_7_48)
	end

	local function var_7_49()
		var_7_4:AnimateSequence("WZWipDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_7:AnimateSequence("WZWipDisabled")
		end
	end

	var_7_0._sequences.WZWipDisabled = var_7_49

	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("GenericArrowButtonLarge", GenericArrowButtonLarge)
LockTable(_M)
