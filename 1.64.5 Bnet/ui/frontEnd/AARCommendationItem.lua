module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	ACTIONS.AnimateSequence(arg_1_0, "DisplayItem")
	arg_1_0.Value:setText(arg_1_2.value)
	arg_1_0.Name:setText(arg_1_2.name)
	arg_1_0.Icon:setImage(RegisterMaterial(arg_1_2.icon))
end

local function var_0_1(arg_2_0, arg_2_1)
	ACTIONS.AnimateSequence(arg_2_0, "HideItem")
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Value)
	assert(arg_3_0.Name)
	assert(arg_3_0.Icon)

	arg_3_0.HideItem = var_0_1
	arg_3_0.DisplayItem = var_0_0
end

function AARCommendationItem(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 300 * _1080p)

	var_4_0.id = "AARCommendationItem"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Sparks"

	var_4_4:SetRGBFromTable(SWATCHES.HUD.contested, 0)
	var_4_4:SetAlpha(0, 0)
	var_4_4:SetZRotation(115, 0)
	var_4_4:SetColorOp(COLOR_OP.saturation, 0)
	var_4_4:SetColorOpParam(1.02, 0)
	var_4_4:setImage(RegisterMaterial("commendation_sparks"), 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 88, _1080p * -106, _1080p * 60, _1080p * 254)
	var_4_0:addElement(var_4_4)

	var_4_0.Sparks = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Icon"

	var_4_6:SetColorOp(COLOR_OP.saturation, 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 300)
	var_4_0:addElement(var_4_6)

	var_4_0.Icon = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Name"

	var_4_8:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_4_8:SetAlpha(0, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 18, _1080p * 48)
	var_4_0:addElement(var_4_8)

	var_4_0.Name = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "Value"

	var_4_10:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_4_10:SetAlpha(0, 0)
	var_4_10:setText("", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetWordWrap(false)
	var_4_10:SetAlignment(LUI.Alignment.Center)
	var_4_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 18)
	var_4_0:addElement(var_4_10)

	var_4_0.Value = var_4_10

	local var_4_11
	local var_4_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		}
	}

	var_4_6:RegisterAnimationSequence("DefaultSequence", var_4_12)

	local var_4_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("DefaultSequence", var_4_13)

	local var_4_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("DefaultSequence", var_4_14)

	local function var_4_15()
		var_4_6:AnimateSequence("DefaultSequence")
		var_4_8:AnimateSequence("DefaultSequence")
		var_4_10:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuintic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inQuintic
		}
	}

	var_4_6:RegisterAnimationSequence("DisplayItem", var_4_17)

	local function var_4_18()
		var_4_6:AnimateSequence("DisplayItem")
	end

	var_4_0._sequences.DisplayItem = var_4_18

	local var_4_19
	local var_4_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HideItem", var_4_20)

	local function var_4_21()
		var_4_6:AnimateSequence("HideItem")
	end

	var_4_0._sequences.HideItem = var_4_21

	local var_4_22
	local var_4_23 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ShowText", var_4_23)

	local var_4_24 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("ShowText", var_4_24)

	local function var_4_25()
		var_4_8:AnimateSequence("ShowText")
		var_4_10:AnimateSequence("ShowText")
	end

	var_4_0._sequences.ShowText = var_4_25

	local var_4_26
	local var_4_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ShowTextSnap", var_4_27)

	local function var_4_28()
		var_4_8:AnimateSequence("ShowTextSnap")
	end

	var_4_0._sequences.ShowTextSnap = var_4_28

	local var_4_29
	local var_4_30 = {
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 103
		},
		{
			value = -0.5,
			duration = 250,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 254,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 950,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_4:RegisterAnimationSequence("Slam", var_4_30)

	local var_4_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuintic
		},
		{
			value = 1.75,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP_Param
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		}
	}

	var_4_6:RegisterAnimationSequence("Slam", var_4_31)

	local function var_4_32()
		var_4_4:AnimateSequence("Slam")
		var_4_6:AnimateSequence("Slam")
	end

	var_4_0._sequences.Slam = var_4_32

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("AARCommendationItem", AARCommendationItem)
LockTable(_M)
