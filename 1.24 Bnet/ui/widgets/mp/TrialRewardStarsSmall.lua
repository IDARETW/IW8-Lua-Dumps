module(..., package.seeall)

function TrialRewardStarsSmall(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 180 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "TrialRewardStarsSmall"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "StarBorder3"

	var_1_4:SetAlpha(0.6, 0)
	var_1_4:SetColorOp(COLOR_OP.saturation, 0)
	var_1_4:setImage(RegisterMaterial("star_on"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 39, _1080p * 81, _1080p * -46, _1080p * -4)
	var_1_0:addElement(var_1_4)

	var_1_0.StarBorder3 = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "StarBorder2"

	var_1_6:SetAlpha(0.6, 0)
	var_1_6:SetColorOp(COLOR_OP.saturation, 0)
	var_1_6:setImage(RegisterMaterial("star_on"), 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -21, _1080p * 21, _1080p * -46, _1080p * -4)
	var_1_0:addElement(var_1_6)

	var_1_0.StarBorder2 = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "StarBorder1"

	var_1_8:SetAlpha(0.6, 0)
	var_1_8:SetColorOp(COLOR_OP.saturation, 0)
	var_1_8:setImage(RegisterMaterial("star_on"), 0)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -81, _1080p * -39, _1080p * -46, _1080p * -4)
	var_1_0:addElement(var_1_8)

	var_1_0.StarBorder1 = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "StarOff1"

	var_1_10:setImage(RegisterMaterial("star_off"), 0)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -77, _1080p * -43, _1080p * -42, _1080p * -8)
	var_1_0:addElement(var_1_10)

	var_1_0.StarOff1 = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "StarOff2"

	var_1_12:setImage(RegisterMaterial("star_off"), 0)
	var_1_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -17, _1080p * 17, _1080p * -42, _1080p * -8)
	var_1_0:addElement(var_1_12)

	var_1_0.StarOff2 = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "StarOff3"

	var_1_14:setImage(RegisterMaterial("star_off"), 0)
	var_1_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 43, _1080p * 77, _1080p * -42, _1080p * -8)
	var_1_0:addElement(var_1_14)

	var_1_0.StarOff3 = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "StarOn1"

	var_1_16:setImage(RegisterMaterial("star_on"), 0)
	var_1_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -80, _1080p * -40, _1080p * -45, _1080p * -5)
	var_1_0:addElement(var_1_16)

	var_1_0.StarOn1 = var_1_16

	local var_1_17
	local var_1_18 = LUI.UIImage.new()

	var_1_18.id = "StarOn2"

	var_1_18:setImage(RegisterMaterial("star_on"), 0)
	var_1_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -45, _1080p * -5)
	var_1_0:addElement(var_1_18)

	var_1_0.StarOn2 = var_1_18

	local var_1_19
	local var_1_20 = LUI.UIImage.new()

	var_1_20.id = "StarOn3"

	var_1_20:setImage(RegisterMaterial("star_on"), 0)
	var_1_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 40, _1080p * 80, _1080p * -45, _1080p * -5)
	var_1_0:addElement(var_1_20)

	var_1_0.StarOn3 = var_1_20

	local function var_1_21()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_21

	local var_1_22
	local var_1_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Tier1", var_1_23)

	local var_1_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_1_16:RegisterAnimationSequence("Tier1", var_1_24)

	local var_1_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("Tier1", var_1_25)

	local var_1_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_20:RegisterAnimationSequence("Tier1", var_1_26)

	local function var_1_27()
		var_1_8:AnimateSequence("Tier1")
		var_1_16:AnimateSequence("Tier1")
		var_1_18:AnimateSequence("Tier1")
		var_1_20:AnimateSequence("Tier1")
	end

	var_1_0._sequences.Tier1 = var_1_27

	local var_1_28
	local var_1_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Tier2", var_1_29)

	local var_1_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Tier2", var_1_30)

	local var_1_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Tier2", var_1_31)

	local var_1_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_1_18:RegisterAnimationSequence("Tier2", var_1_32)

	local var_1_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 80
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_20:RegisterAnimationSequence("Tier2", var_1_33)

	local function var_1_34()
		var_1_6:AnimateSequence("Tier2")
		var_1_8:AnimateSequence("Tier2")
		var_1_16:AnimateSequence("Tier2")
		var_1_18:AnimateSequence("Tier2")
		var_1_20:AnimateSequence("Tier2")
	end

	var_1_0._sequences.Tier2 = var_1_34

	local var_1_35
	local var_1_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Tier3", var_1_36)

	local var_1_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Tier3", var_1_37)

	local var_1_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Tier3", var_1_38)

	local var_1_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Tier3", var_1_39)

	local var_1_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("Tier3", var_1_40)

	local var_1_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 80
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		}
	}

	var_1_20:RegisterAnimationSequence("Tier3", var_1_41)

	local function var_1_42()
		var_1_4:AnimateSequence("Tier3")
		var_1_6:AnimateSequence("Tier3")
		var_1_8:AnimateSequence("Tier3")
		var_1_16:AnimateSequence("Tier3")
		var_1_18:AnimateSequence("Tier3")
		var_1_20:AnimateSequence("Tier3")
	end

	var_1_0._sequences.Tier3 = var_1_42

	local var_1_43
	local var_1_44 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Tier0", var_1_44)

	local var_1_45 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Tier0", var_1_45)

	local var_1_46 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Tier0", var_1_46)

	local var_1_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -77
		}
	}

	var_1_10:RegisterAnimationSequence("Tier0", var_1_47)

	local var_1_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		}
	}

	var_1_12:RegisterAnimationSequence("Tier0", var_1_48)

	local var_1_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 77
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -42
		}
	}

	var_1_14:RegisterAnimationSequence("Tier0", var_1_49)

	local var_1_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Tier0", var_1_50)

	local var_1_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_18:RegisterAnimationSequence("Tier0", var_1_51)

	local var_1_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_20:RegisterAnimationSequence("Tier0", var_1_52)

	local function var_1_53()
		var_1_4:AnimateSequence("Tier0")
		var_1_6:AnimateSequence("Tier0")
		var_1_8:AnimateSequence("Tier0")
		var_1_10:AnimateSequence("Tier0")
		var_1_12:AnimateSequence("Tier0")
		var_1_14:AnimateSequence("Tier0")
		var_1_16:AnimateSequence("Tier0")
		var_1_18:AnimateSequence("Tier0")
		var_1_20:AnimateSequence("Tier0")
	end

	var_1_0._sequences.Tier0 = var_1_53

	return var_1_0
end

MenuBuilder.registerType("TrialRewardStarsSmall", TrialRewardStarsSmall)
LockTable(_M)
