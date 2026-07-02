module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0._lastAnimFunc ~= arg_2_1 then
		arg_2_0._lastAnimFunc = arg_2_1

		arg_2_1(arg_2_0)
	end
end

local function var_0_2(arg_3_0)
	arg_3_0.Gradient:SetAlpha(1, 0)
	arg_3_0.Gradient:SetRGBFromInt(16742912, 0)
	arg_3_0.Gradient:SetAnchorsAndPosition(0, 0, 0, 0, 0, 20 * _1080p, 0, 0, 0)
	arg_3_0.Gradient:SetAlpha(0.2, 400, LUI.EASING.inQuartic)
	arg_3_0.Gradient:SetRGBFromInt(16774827, 400, LUI.EASING.inQuartic)
	arg_3_0.Gradient:SetAnchorsAndPosition(0, 0, 0, 0, 0, -50 * _1080p, 0, 0, 400, LUI.EASING.inQuartic)
end

local function var_0_3(arg_4_0)
	arg_4_0.Gradient:SetAlpha(0)
	arg_4_0.Gradient:SetAnchorsAndPosition(0, 0.2, 0, 0, 0, 0, 0, 0, 0, LUI.EASING.outBack)
end

local function var_0_4(arg_5_0)
	if not CONDITIONS.IsThirdGameMode() then
		arg_5_0.MainShadow:SetAlpha(0.4, 0)
		arg_5_0.Main:SetRGBFromTable(COLORS.creamyYellow, 0)
		arg_5_0.Main:SetAlpha(1, 0)

		if arg_5_0.Cap then
			arg_5_0.Cap:SetRGBFromInt(0, 0)
			arg_5_0.Cap:SetAlpha(1, 0)
		end

		var_0_2(arg_5_0)
	else
		arg_5_0.Main:SetRGBFromTable(SWATCHES.Zombies.menuHeader, 0)
		arg_5_0.Main:SetAlpha(1, 0)
	end
end

local function var_0_5(arg_6_0)
	if not CONDITIONS.IsThirdGameMode() then
		arg_6_0.MainShadow:SetAlpha(0, 0)
		arg_6_0.GlowRight:SetAlpha(0, 0)
		arg_6_0.GlowMid:SetAlpha(0, 0)
		arg_6_0.GlowLeft:SetAlpha(0, 0)
		arg_6_0.Main:SetAlpha(0.8, 0)
		arg_6_0.Main:SetRGBFromInt(0, 0)
		arg_6_0.Gradient:SetAlpha(0, 100)

		if arg_6_0.Cap then
			arg_6_0.Cap:SetAlpha(1, 0)
			arg_6_0.Cap:SetRGBFromInt(14277081, 0)
		end

		arg_6_0.Main:SetRGBFromTable(SWATCHES.CACAbility, 0)
		var_0_3(arg_6_0)
	else
		arg_6_0.MainShadow:SetAlpha(0, 0)
		arg_6_0.MainShadow:SetRGBFromTable(SWATCHES.Zombies.menuHeader, 0)
		arg_6_0.GlowRight:SetAlpha(0, 0)
		arg_6_0.GlowMid:SetAlpha(0, 0)
		arg_6_0.GlowLeft:SetAlpha(0, 0)
		arg_6_0.Main:SetAlpha(0.8, 0)
		arg_6_0.Main:SetRGBFromInt(0, 0)
		arg_6_0.Gradient:SetAlpha(0, 100)
	end
end

local function var_0_6(arg_7_0)
	if not CONDITIONS.IsThirdGameMode() then
		arg_7_0.MainShadow:SetAlpha(0, 0)
		arg_7_0.GlowRight:SetAlpha(0, 0)
		arg_7_0.GlowMid:SetAlpha(0, 0)
		arg_7_0.GlowLeft:SetAlpha(0, 0)
		arg_7_0.Main:SetAlpha(0.4, 0)
		arg_7_0.Main:SetRGBFromInt(0, 0)
		arg_7_0.Gradient:SetAlpha(0, 100)

		if arg_7_0.Cap then
			arg_7_0.Cap:SetAlpha(1, 0)
			arg_7_0.Cap:SetRGBFromInt(0, 0)
		end

		var_0_3(arg_7_0)
	else
		arg_7_0.MainShadow:SetAlpha(0, 0)
		arg_7_0.MainShadow:SetRGBFromTable(SWATCHES.Zombies.menuHeader, 0)
		arg_7_0.GlowRight:SetAlpha(0, 0)
		arg_7_0.GlowMid:SetAlpha(0, 0)
		arg_7_0.GlowLeft:SetAlpha(0, 0)
		arg_7_0.Main:SetAlpha(0.4, 0)
		arg_7_0.Main:SetRGBFromInt(0, 0)
		arg_7_0.Gradient:SetAlpha(0, 100)
	end
end

local function var_0_7(arg_8_0)
	if not CONDITIONS.IsThirdGameMode() then
		arg_8_0.MainShadow:SetAlpha(0.25, 100)
		arg_8_0.Main:SetAlpha(1, 0)
		arg_8_0.Main:SetRGBFromTable(COLORS.creamyYellow, 0)

		if arg_8_0.Cap then
			arg_8_0.Cap:SetRGBFromInt(0, 0)
			arg_8_0.Cap:SetAlpha(1, 0)
		end

		var_0_2(arg_8_0)
	else
		arg_8_0.MainShadow:SetRGBFromTable(SWATCHES.Zombies.menuHeader, 0)
		arg_8_0.MainShadow:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 6, _1080p * 6, 0)
		arg_8_0.Main:SetRGBFromTable(SWATCHES.Zombies.menuHeader, 0)
		arg_8_0.Main:SetAlpha(1, 0)
	end
end

local function var_0_8(arg_9_0)
	arg_9_0.MainShadow:SetAlpha(0.4, 0)
	arg_9_0.Main:SetRGBFromTable(COLORS.creamyYellow, 0)
	arg_9_0.Main:SetAlpha(1, 0)

	if arg_9_0.Cap then
		arg_9_0.Cap:SetRGBFromInt(0, 0)
		arg_9_0.Cap:SetAlpha(1, 0)
	end
end

local function var_0_9(arg_10_0)
	arg_10_0.MainShadow:SetAlpha(0, 0)
	arg_10_0.GlowRight:SetAlpha(0, 0)
	arg_10_0.GlowMid:SetAlpha(0, 0)
	arg_10_0.GlowLeft:SetAlpha(0, 0)
	arg_10_0.Main:SetAlpha(0.8, 0)
	arg_10_0.Main:SetRGBFromInt(0, 0)

	if arg_10_0.Cap then
		arg_10_0.Cap:SetAlpha(0, 0)
	end

	arg_10_0.Main:SetRGBFromTable(SWATCHES.CACAbility, 0)
end

function PostLoadFunc(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.Pick10Over = var_0_8
	arg_11_0.Pick10Up = var_0_9
	arg_11_0.GradientFlashOver = var_0_2
	arg_11_0.GradientFlashUp = var_0_3
	arg_11_0.ButtonOverAnims = var_0_4
	arg_11_0.ButtonUpAnims = var_0_5

	arg_11_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		var_0_0(arg_12_0, "ButtonOver")
		var_0_1(arg_11_0, var_0_4)
	end)
	arg_11_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		var_0_0(arg_13_0, "ButtonUp")
		var_0_1(arg_11_0, var_0_5)
	end)
	arg_11_0:addEventHandler("button_disable", function(arg_14_0, arg_14_1)
		var_0_0(arg_14_0, "Disabled")
		var_0_1(arg_11_0, var_0_6)
	end)
	arg_11_0:addEventHandler("button_over_disable", function(arg_15_0, arg_15_1)
		var_0_0(arg_15_0, "DisabledOver")
		var_0_1(arg_11_0, var_0_7)
	end)
end

function GenericListButtonBackground(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 215 * _1080p, 0, 30 * _1080p)

	var_16_0.id = "GenericListButtonBackground"
	var_16_0._animationSets = {}
	var_16_0._sequences = {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = LUI.UIImage.new()

	var_16_4.id = "DropShadow"

	var_16_4:SetRGBFromInt(0, 0)
	var_16_4:SetAlpha(0.3, 0)
	var_16_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_16_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 4)
	var_16_0:addElement(var_16_4)

	var_16_0.DropShadow = var_16_4

	local var_16_5
	local var_16_6 = LUI.UIImage.new()

	var_16_6.id = "MainShadow"

	var_16_6:SetRGBFromInt(13398272, 0)
	var_16_6:SetAlpha(0, 0)
	var_16_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 6, _1080p * 6, _1080p * 6, _1080p * 6)
	var_16_0:addElement(var_16_6)

	var_16_0.MainShadow = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIImage.new()

	var_16_8.id = "GlowRight"

	var_16_8:SetRGBFromInt(12080170, 0)
	var_16_8:SetAlpha(0, 0)
	var_16_8:SetZRotation(180, 0)
	var_16_8:setImage(RegisterMaterial("wdg_button_glow_left"), 0)
	var_16_8:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_16_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -32, _1080p * 32, _1080p * -8, _1080p * 8)
	var_16_0:addElement(var_16_8)

	var_16_0.GlowRight = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIImage.new()

	var_16_10.id = "GlowMid"

	var_16_10:SetRGBFromInt(12080170, 0)
	var_16_10:SetAlpha(0, 0)
	var_16_10:setImage(RegisterMaterial("wdg_button_glow_mid"), 0)
	var_16_10:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_16_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 11, _1080p * -32, _1080p * -8, _1080p * 8)
	var_16_0:addElement(var_16_10)

	var_16_0.GlowMid = var_16_10

	local var_16_11
	local var_16_12 = LUI.UIImage.new()

	var_16_12.id = "GlowLeft"

	var_16_12:SetRGBFromInt(12080170, 0)
	var_16_12:SetAlpha(0, 0)
	var_16_12:setImage(RegisterMaterial("wdg_button_glow_left"), 0)
	var_16_12:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_16_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -12, _1080p * 11, _1080p * -8, _1080p * 8)
	var_16_0:addElement(var_16_12)

	var_16_0.GlowLeft = var_16_12

	local var_16_13
	local var_16_14 = LUI.UIImage.new()

	var_16_14.id = "Main"

	var_16_14:SetRGBFromInt(0, 0)
	var_16_14:SetAlpha(0.8, 0)
	var_16_0:addElement(var_16_14)

	var_16_0.Main = var_16_14

	local var_16_15
	local var_16_16 = LUI.UIImage.new()

	var_16_16.id = "Gradient"

	var_16_16:SetRGBFromInt(16774827, 0)
	var_16_16:SetAlpha(0, 0)
	var_16_16:setImage(RegisterMaterial("wdg_gradient_flare"), 0)
	var_16_16:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_16_16:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 6, _1080p * 215, 0, 0)
	var_16_0:addElement(var_16_16)

	var_16_0.Gradient = var_16_16

	local var_16_17

	if not CONDITIONS.IsThirdGameMode(var_16_0) then
		local var_16_18 = LUI.UIImage.new()

		var_16_18.id = "Cap"

		var_16_18:SetRGBFromInt(14277081, 0)
		var_16_18:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 6, 0, 0)
		var_16_0:addElement(var_16_18)

		var_16_0.Cap = var_16_18
	end

	local function var_16_19()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_19

	local var_16_20 = {
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOver", var_16_20)

	local var_16_21 = {
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonOver", var_16_21)

	local var_16_22 = {
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonOver", var_16_22)

	local function var_16_23()
		var_16_8:AnimateLoop("ButtonOver")
		var_16_10:AnimateLoop("ButtonOver")
		var_16_12:AnimateLoop("ButtonOver")
	end

	var_16_0._sequences.ButtonOver = var_16_23

	local function var_16_24()
		return
	end

	var_16_0._sequences.ButtonUp = var_16_24

	local function var_16_25()
		return
	end

	var_16_0._sequences.Disabled = var_16_25

	local var_16_26 = {
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		}
	}

	var_16_8:RegisterAnimationSequence("DisabledOver", var_16_26)

	local var_16_27 = {
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		}
	}

	var_16_10:RegisterAnimationSequence("DisabledOver", var_16_27)

	local var_16_28 = {
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		}
	}

	var_16_12:RegisterAnimationSequence("DisabledOver", var_16_28)

	local function var_16_29()
		var_16_8:AnimateLoop("DisabledOver")
		var_16_10:AnimateLoop("DisabledOver")
		var_16_12:AnimateLoop("DisabledOver")
	end

	var_16_0._sequences.DisabledOver = var_16_29

	local var_16_30 = {
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		}
	}

	var_16_8:RegisterAnimationSequence("Pick10Over", var_16_30)

	local var_16_31 = {
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		}
	}

	var_16_10:RegisterAnimationSequence("Pick10Over", var_16_31)

	local var_16_32 = {
		{
			value = 0.25,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outSine
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inSine
		}
	}

	var_16_12:RegisterAnimationSequence("Pick10Over", var_16_32)

	local function var_16_33()
		var_16_8:AnimateLoop("Pick10Over")
		var_16_10:AnimateLoop("Pick10Over")
		var_16_12:AnimateLoop("Pick10Over")
	end

	var_16_0._sequences.Pick10Over = var_16_33

	local function var_16_34()
		return
	end

	var_16_0._sequences.Pick10Up = var_16_34

	local var_16_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_16_6:RegisterAnimationSequence("AlignMainShadow", var_16_35)

	local function var_16_36()
		var_16_6:AnimateSequence("AlignMainShadow")
	end

	var_16_0._sequences.AlignMainShadow = var_16_36

	PostLoadFunc(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("GenericListButtonBackground", GenericListButtonBackground)
LockTable(_M)
