module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	local function var_1_1()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

		arg_1_0:Wait(15000).onComplete = var_1_1

		arg_1_0.TimeLabel:setText(var_2_0)
	end

	var_1_1()
end

function WatchFaceDigital01(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_3_0.id = "WatchFaceDigital01"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "InnerRing"

	var_3_6:SetRGBFromInt(65490, 0)
	var_3_6:SetAlpha(0.4, 0)
	var_3_6:SetYRotation(180, 0)
	var_3_6:SetZRotation(74, 0)
	var_3_6:setImage(RegisterMaterial("hud_reticle_45c"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 110, _1080p * 18, _1080p * 110)
	var_3_0:addElement(var_3_6)

	var_3_0.InnerRing = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "OuterRing"

	var_3_8:SetRGBFromInt(65490, 0)
	var_3_8:SetAlpha(0.8, 0)
	var_3_8:SetZRotation(74, 0)
	var_3_8:setImage(RegisterMaterial("hud_reticle_45c"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 115, _1080p * 13, _1080p * 115)
	var_3_0:addElement(var_3_8)

	var_3_0.OuterRing = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "CircleHider"

	var_3_10:SetRGBFromInt(0, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, _1080p * 70, _1080p * 125)
	var_3_0:addElement(var_3_10)

	var_3_0.CircleHider = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "TimeLabel"

	var_3_12:SetRGBFromInt(65513, 0)
	var_3_12:setText("00:00", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 115, _1080p * 42, _1080p * 70)
	var_3_0:addElement(var_3_12)

	var_3_0.TimeLabel = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "Line6"

	var_3_14:SetRGBFromInt(65490, 0)
	var_3_14:SetAlpha(0.1, 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, _1080p * 107, _1080p * 115)
	var_3_0:addElement(var_3_14)

	var_3_0.Line6 = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "Line5"

	var_3_16:SetRGBFromInt(65490, 0)
	var_3_16:SetAlpha(0.2, 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, _1080p * 96, _1080p * 101)
	var_3_0:addElement(var_3_16)

	var_3_0.Line5 = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "Line4"

	var_3_18:SetRGBFromInt(65490, 0)
	var_3_18:SetAlpha(0.4, 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, _1080p * 88, _1080p * 92)
	var_3_0:addElement(var_3_18)

	var_3_0.Line4 = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "Line3"

	var_3_20:SetRGBFromInt(65490, 0)
	var_3_20:SetAlpha(0.6, 0)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, _1080p * 82, _1080p * 85)
	var_3_0:addElement(var_3_20)

	var_3_0.Line3 = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIImage.new()

	var_3_22.id = "Line2"

	var_3_22:SetRGBFromInt(65490, 0)
	var_3_22:SetAlpha(0.7, 0)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, _1080p * 78, _1080p * 80)
	var_3_0:addElement(var_3_22)

	var_3_0.Line2 = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIImage.new()

	var_3_24.id = "Line1"

	var_3_24:SetRGBFromInt(65490, 0)
	var_3_24:SetAlpha(0.8, 0)
	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 128, _1080p * 76, _1080p * 77)
	var_3_0:addElement(var_3_24)

	var_3_0.Line1 = var_3_24

	local function var_3_25()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_25

	local var_3_26 = {
		{
			value = -50,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 309,
			duration = 8000,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_3_6:RegisterAnimationSequence("Rotate", var_3_26)

	local var_3_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 359,
			duration = 4000,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_3_8:RegisterAnimationSequence("Rotate", var_3_27)

	local function var_3_28()
		var_3_6:AnimateLoop("Rotate")
		var_3_8:AnimateLoop("Rotate")
	end

	var_3_0._sequences.Rotate = var_3_28

	local var_3_29 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 1800,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Flash", var_3_29)

	local var_3_30 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 1700,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Flash", var_3_30)

	local var_3_31 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 1600,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Flash", var_3_31)

	local var_3_32 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 350,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.9,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Flash", var_3_32)

	local var_3_33 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 1400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Flash", var_3_33)

	local var_3_34 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 1300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Flash", var_3_34)

	local function var_3_35()
		var_3_14:AnimateLoop("Flash")
		var_3_16:AnimateLoop("Flash")
		var_3_18:AnimateLoop("Flash")
		var_3_20:AnimateLoop("Flash")
		var_3_22:AnimateLoop("Flash")
		var_3_24:AnimateLoop("Flash")
	end

	var_3_0._sequences.Flash = var_3_35

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "Rotate")
	ACTIONS.AnimateSequence(var_3_0, "Flash")

	return var_3_0
end

MenuBuilder.registerType("WatchFaceDigital01", WatchFaceDigital01)
LockTable(_M)
