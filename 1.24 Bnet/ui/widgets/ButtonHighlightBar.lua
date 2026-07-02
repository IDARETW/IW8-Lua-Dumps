module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0

	return arg_1_0._wzTheme and "WZEnabled" or arg_1_0._bundleTheme and "BundleEnabled" or "Enabled"
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._bundleTheme = arg_2_1

	ACTIONS.AnimateSequence(arg_2_0, var_0_0(arg_2_0))
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.SetupTheme = var_0_1

	arg_3_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = arg_3_1
		end

		ACTIONS.AnimateSequence(arg_3_0, "On")
		ACTIONS.AnimateSequence(arg_3_0, "Glow")
		ACTIONS.AnimateSequence(arg_3_0, var_0_0(arg_3_0))
	end)
	arg_3_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = arg_3_1
		end

		ACTIONS.AnimateSequence(arg_3_0, "Off")
		ACTIONS.AnimateSequence(arg_3_0, "GlowOff")
		ACTIONS.AnimateSequence(arg_3_0, var_0_0(arg_3_0))
	end)
	arg_3_0:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = arg_3_1
		end

		ACTIONS.AnimateSequence(arg_3_0, "Disabled")
		ACTIONS.AnimateSequence(arg_3_0, "Glow")
		ACTIONS.AnimateSequence(arg_3_0, "On")
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = arg_3_1
		end

		ACTIONS.AnimateSequence(arg_3_0, "Disabled")
		ACTIONS.AnimateSequence(arg_3_0, "GlowOff")
		ACTIONS.AnimateSequence(arg_3_0, "Off")
	end)
end

function ButtonHighlightBar(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 2 * _1080p)

	var_8_0.id = "ButtonHighlightBar"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Bar"

	var_8_4:SetRGBFromTable(SWATCHES.Global.keyColorDark, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Bar = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "ButtonGlowTop"

	var_8_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_8_6:SetPixelGridEnabled(true)
	var_8_6:SetPixelGridContrast(0.5, 0)
	var_8_6:SetPixelGridBlockWidth(2, 0)
	var_8_6:SetPixelGridBlockHeight(2, 0)
	var_8_6:SetPixelGridGutterWidth(1, 0)
	var_8_6:SetPixelGridGutterHeight(1, 0)
	var_8_6.Glow:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_8_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -5, _1080p * 5)
	var_8_0:addElement(var_8_6)

	var_8_0.ButtonGlowTop = var_8_6

	local function var_8_7()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_7

	local function var_8_8()
		return
	end

	var_8_0._sequences.On = var_8_8

	local function var_8_9()
		return
	end

	var_8_0._sequences.Off = var_8_9

	local var_8_10
	local var_8_11 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 230,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0.75,
			duration = 850,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 0.88,
			duration = 1200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuintic
		},
		{
			value = 0.8,
			duration = 610,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutBack
		}
	}

	var_8_6:RegisterAnimationSequence("Glow", var_8_11)

	local function var_8_12()
		var_8_6:AnimateLoop("Glow")
	end

	var_8_0._sequences.Glow = var_8_12

	local var_8_13
	local var_8_14 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("GlowOff", var_8_14)

	local function var_8_15()
		var_8_6:AnimateSequence("GlowOff")
	end

	var_8_0._sequences.GlowOff = var_8_15

	local var_8_16
	local var_8_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColorDark
		}
	}

	var_8_4:RegisterAnimationSequence("Enabled", var_8_17)

	local var_8_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor,
			child = var_8_0.ButtonGlowTop.Glow
		}
	}

	var_8_6:RegisterAnimationSequence("Enabled", var_8_18)

	local function var_8_19()
		var_8_4:AnimateSequence("Enabled")
		var_8_6:AnimateSequence("Enabled")
	end

	var_8_0._sequences.Enabled = var_8_19

	local var_8_20
	local var_8_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_4:RegisterAnimationSequence("Disabled", var_8_21)

	local var_8_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled,
			child = var_8_0.ButtonGlowTop.Glow
		}
	}

	var_8_6:RegisterAnimationSequence("Disabled", var_8_22)

	local function var_8_23()
		var_8_4:AnimateSequence("Disabled")
		var_8_6:AnimateSequence("Disabled")
	end

	var_8_0._sequences.Disabled = var_8_23

	local var_8_24
	local var_8_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		}
	}

	var_8_4:RegisterAnimationSequence("WZEnabled", var_8_25)

	local var_8_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1,
			child = var_8_0.ButtonGlowTop.Glow
		}
	}

	var_8_6:RegisterAnimationSequence("WZEnabled", var_8_26)

	local function var_8_27()
		var_8_4:AnimateSequence("WZEnabled")
		var_8_6:AnimateSequence("WZEnabled")
	end

	var_8_0._sequences.WZEnabled = var_8_27

	local var_8_28
	local var_8_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleGlow2
		}
	}

	var_8_4:RegisterAnimationSequence("BundleEnabled", var_8_29)

	local var_8_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleGlow1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleGlow1,
			child = var_8_0.ButtonGlowTop.Glow
		}
	}

	var_8_6:RegisterAnimationSequence("BundleEnabled", var_8_30)

	local function var_8_31()
		var_8_4:AnimateSequence("BundleEnabled")
		var_8_6:AnimateSequence("BundleEnabled")
	end

	var_8_0._sequences.BundleEnabled = var_8_31

	var_0_2(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("ButtonHighlightBar", ButtonHighlightBar)
LockTable(_M)
