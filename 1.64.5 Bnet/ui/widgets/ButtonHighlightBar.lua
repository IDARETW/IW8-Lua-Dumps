module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0

	return arg_1_0._silverTheme and "Silver" or arg_1_0._bundleTheme and "BundleEnabled" or WZWIP.CheckForApplyPrependWZWipPrefix("Enabled")
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

		WZWIP.AnimateThemeElement(arg_6_0, "Disabled")
		ACTIONS.AnimateSequence(arg_3_0, "Glow")
		ACTIONS.AnimateSequence(arg_3_0, "On")
	end)
	arg_3_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = arg_3_1
		end

		WZWIP.AnimateThemeElement(arg_7_0, "Disabled")
		ACTIONS.AnimateSequence(arg_3_0, "GlowOff")
		ACTIONS.AnimateSequence(arg_3_0, "Off")
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_3_0, "WZWipSetup")
	end
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

	if CONDITIONS.IsWZWipDvarDisabled() then
		var_8_3 = LUI.UIImage.new()
		var_8_3.id = "Bar"

		var_8_3:SetRGBFromTable(SWATCHES.Global.keyColorDark, 0)
		var_8_0:addElement(var_8_3)

		var_8_0.Bar = var_8_3
	end

	local var_8_4

	if CONDITIONS.IsWZWipDvarDisabled() then
		var_8_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
			controllerIndex = var_8_1
		})
		var_8_4.id = "ButtonGlowTop"

		var_8_4:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
		var_8_4:SetPixelGridEnabled(true)
		var_8_4:SetPixelGridContrast(0.5, 0)
		var_8_4:SetPixelGridBlockWidth(2, 0)
		var_8_4:SetPixelGridBlockHeight(2, 0)
		var_8_4:SetPixelGridGutterWidth(1, 0)
		var_8_4:SetPixelGridGutterHeight(1, 0)
		var_8_4.Glow:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
		var_8_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -5, _1080p * 5)
		var_8_0:addElement(var_8_4)

		var_8_0.ButtonGlowTop = var_8_4
	end

	local var_8_5

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_8_5 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
			controllerIndex = var_8_1
		})
		var_8_5.id = "WZWipButtonGlowTop"

		var_8_5:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_8_5.Glow:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_8_5:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -5, _1080p * 5)
		var_8_0:addElement(var_8_5)

		var_8_0.WZWipButtonGlowTop = var_8_5
	end

	local function var_8_6()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_6

	local function var_8_7()
		return
	end

	var_8_0._sequences.On = var_8_7

	local function var_8_8()
		return
	end

	var_8_0._sequences.Off = var_8_8

	local var_8_9

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_10 = {
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

		var_8_4:RegisterAnimationSequence("Glow", var_8_10)
	end

	local function var_8_11()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_4:AnimateLoop("Glow")
		end
	end

	var_8_0._sequences.Glow = var_8_11

	local var_8_12

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_13 = {
			{
				value = 0.8,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_4:RegisterAnimationSequence("GlowOff", var_8_13)
	end

	local function var_8_14()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_4:AnimateSequence("GlowOff")
		end
	end

	var_8_0._sequences.GlowOff = var_8_14

	local var_8_15

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_16 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColorDark
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Blend_Mode,
				value = BLEND_MODE.blend
			}
		}

		var_8_3:RegisterAnimationSequence("Enabled", var_8_16)
	end

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_17 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Blend_Mode,
				value = BLEND_MODE.blend,
				child = var_8_0.ButtonGlowTop.Glow
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Global.keyColor,
				child = var_8_0.ButtonGlowTop.Glow
			}
		}

		var_8_4:RegisterAnimationSequence("Enabled", var_8_17)
	end

	local function var_8_18()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_3:AnimateLoop("Enabled")
		end

		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_4:AnimateLoop("Enabled")
		end
	end

	var_8_0._sequences.Enabled = var_8_18

	local var_8_19

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_20 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textDisabled
			}
		}

		var_8_3:RegisterAnimationSequence("Disabled", var_8_20)
	end

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_21 = {
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

		var_8_4:RegisterAnimationSequence("Disabled", var_8_21)
	end

	local function var_8_22()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_3:AnimateSequence("Disabled")
		end

		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_4:AnimateSequence("Disabled")
		end
	end

	var_8_0._sequences.Disabled = var_8_22

	local var_8_23

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_24 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.MPArmory.bundleGlow2
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Blend_Mode,
				value = BLEND_MODE.blend
			}
		}

		var_8_3:RegisterAnimationSequence("BundleEnabled", var_8_24)
	end

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_25 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.MPArmory.bundleGlow1
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Blend_Mode,
				value = BLEND_MODE.blend,
				child = var_8_0.ButtonGlowTop.Glow
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.MPArmory.bundleGlow1,
				child = var_8_0.ButtonGlowTop.Glow
			}
		}

		var_8_4:RegisterAnimationSequence("BundleEnabled", var_8_25)
	end

	local function var_8_26()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_3:AnimateSequence("BundleEnabled")
		end

		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_4:AnimateSequence("BundleEnabled")
		end
	end

	var_8_0._sequences.BundleEnabled = var_8_26

	local var_8_27

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_28 = {
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Blend_Mode,
				value = BLEND_MODE.blend
			}
		}

		var_8_3:RegisterAnimationSequence("Silver", var_8_28)
	end

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_29 = {
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Blend_Mode,
				value = BLEND_MODE.blend,
				child = var_8_0.ButtonGlowTop.Glow
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				child = var_8_0.ButtonGlowTop.Glow
			}
		}

		var_8_4:RegisterAnimationSequence("Silver", var_8_29)
	end

	local function var_8_30()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_3:AnimateSequence("Silver")
		end

		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_4:AnimateSequence("Silver")
		end
	end

	var_8_0._sequences.Silver = var_8_30

	local var_8_31

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_32 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZFenceMessage
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_3:RegisterAnimationSequence("WZWipSetup", var_8_32)
	end

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight,
				child = var_8_0.ButtonGlowTop.Glow
			}
		}

		var_8_4:RegisterAnimationSequence("WZWipSetup", var_8_33)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_8_34 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Blend_Mode,
				value = BLEND_MODE.blend,
				child = var_8_0.WZWipButtonGlowTop.Glow
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight,
				child = var_8_0.WZWipButtonGlowTop.Glow
			}
		}

		var_8_5:RegisterAnimationSequence("WZWipSetup", var_8_34)
	end

	local function var_8_35()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_3:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_4:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_8_5:AnimateSequence("WZWipSetup")
		end
	end

	var_8_0._sequences.WZWipSetup = var_8_35

	local var_8_36

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_37 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZFenceMessage
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_3:RegisterAnimationSequence("WZWipDisabled", var_8_37)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_8_38 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Blend_Mode,
				value = BLEND_MODE.blend,
				child = var_8_0.WZWipButtonGlowTop.Glow
			}
		}

		var_8_5:RegisterAnimationSequence("WZWipDisabled", var_8_38)
	end

	local function var_8_39()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_3:AnimateSequence("WZWipDisabled")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_8_5:AnimateSequence("WZWipDisabled")
		end
	end

	var_8_0._sequences.WZWipDisabled = var_8_39

	local var_8_40

	if CONDITIONS.IsWZWipDvarDisabled() then
		local var_8_41 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.WZFenceMessage
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_3:RegisterAnimationSequence("WZWipEnabled", var_8_41)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_8_42 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Blend_Mode,
				value = BLEND_MODE.addWithAlpha,
				child = var_8_0.WZWipButtonGlowTop.Glow
			}
		}

		var_8_5:RegisterAnimationSequence("WZWipEnabled", var_8_42)
	end

	local function var_8_43()
		if CONDITIONS.IsWZWipDvarDisabled() then
			var_8_3:AnimateSequence("WZWipEnabled")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_8_5:AnimateSequence("WZWipEnabled")
		end
	end

	var_8_0._sequences.WZWipEnabled = var_8_43

	var_0_2(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("ButtonHighlightBar", ButtonHighlightBar)
LockTable(_M)
