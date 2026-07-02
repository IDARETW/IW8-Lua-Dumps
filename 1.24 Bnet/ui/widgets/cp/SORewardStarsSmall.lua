module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 then
		LUI.clamp(arg_1_1, 0, #arg_1_0._stars)
		ACTIONS.AnimateSequence(arg_1_0, "Tier" .. arg_1_1)
	else
		arg_1_0:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateStars = var_0_0
	arg_2_0._stars = {
		arg_2_0.SORewardStar1,
		arg_2_0.SORewardStar2,
		arg_2_0.SORewardStar3
	}
end

function SORewardStarsSmall(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 180 * _1080p, 0, 50 * _1080p)

	var_3_0.id = "SORewardStarsSmall"
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

	var_3_4.id = "StarBorder3"

	var_3_4:SetAlpha(0.6, 0)
	var_3_4:SetColorOp(COLOR_OP.saturation, 0)
	var_3_4:setImage(RegisterMaterial("star_on"), 0)
	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 31, _1080p * 73, _1080p * -46, _1080p * -4)
	var_3_0:addElement(var_3_4)

	var_3_0.StarBorder3 = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "StarBorder2"

	var_3_6:SetAlpha(0.6, 0)
	var_3_6:SetColorOp(COLOR_OP.saturation, 0)
	var_3_6:setImage(RegisterMaterial("star_on"), 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -21, _1080p * 21, _1080p * -46, _1080p * -4)
	var_3_0:addElement(var_3_6)

	var_3_0.StarBorder2 = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "StarBorder1"

	var_3_8:SetAlpha(0.6, 0)
	var_3_8:SetColorOp(COLOR_OP.saturation, 0)
	var_3_8:setImage(RegisterMaterial("star_on"), 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -73, _1080p * -31, _1080p * -46, _1080p * -4)
	var_3_0:addElement(var_3_8)

	var_3_0.StarBorder1 = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "StarOff1"

	var_3_10:setImage(RegisterMaterial("star_off"), 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -69, _1080p * -35, _1080p * -42, _1080p * -8)
	var_3_0:addElement(var_3_10)

	var_3_0.StarOff1 = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "StarOff2"

	var_3_12:setImage(RegisterMaterial("star_off"), 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -17, _1080p * 17, _1080p * -42, _1080p * -8)
	var_3_0:addElement(var_3_12)

	var_3_0.StarOff2 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "StarOff3"

	var_3_14:setImage(RegisterMaterial("star_off"), 0)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 35, _1080p * 69, _1080p * -42, _1080p * -8)
	var_3_0:addElement(var_3_14)

	var_3_0.StarOff3 = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "StarOn1"

	var_3_16:SetAlpha(0, 0)
	var_3_16:setImage(RegisterMaterial("star_on"), 0)
	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -72, _1080p * -32, _1080p * -45, _1080p * -5)
	var_3_0:addElement(var_3_16)

	var_3_0.StarOn1 = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "StarOn2"

	var_3_18:SetAlpha(0, 0)
	var_3_18:setImage(RegisterMaterial("star_on"), 0)
	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -45, _1080p * -5)
	var_3_0:addElement(var_3_18)

	var_3_0.StarOn2 = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "StarOn3"

	var_3_20:SetAlpha(0, 0)
	var_3_20:setImage(RegisterMaterial("star_on"), 0)
	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 32, _1080p * 72, _1080p * -45, _1080p * -5)
	var_3_0:addElement(var_3_20)

	var_3_0.StarOn3 = var_3_20

	local function var_3_21()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_21

	local var_3_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Tier1", var_3_22)

	local var_3_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 21
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Tier1", var_3_23)

	local var_3_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		}
	}

	var_3_8:RegisterAnimationSequence("Tier1", var_3_24)

	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Tier1", var_3_25)

	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Tier1", var_3_26)

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Tier1", var_3_27)

	local var_3_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		}
	}

	var_3_16:RegisterAnimationSequence("Tier1", var_3_28)

	local var_3_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		}
	}

	var_3_18:RegisterAnimationSequence("Tier1", var_3_29)

	local var_3_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		}
	}

	var_3_20:RegisterAnimationSequence("Tier1", var_3_30)

	local function var_3_31()
		var_3_4:AnimateSequence("Tier1")
		var_3_6:AnimateSequence("Tier1")
		var_3_8:AnimateSequence("Tier1")
		var_3_10:AnimateSequence("Tier1")
		var_3_12:AnimateSequence("Tier1")
		var_3_14:AnimateSequence("Tier1")
		var_3_16:AnimateSequence("Tier1")
		var_3_18:AnimateSequence("Tier1")
		var_3_20:AnimateSequence("Tier1")
	end

	var_3_0._sequences.Tier1 = var_3_31

	local var_3_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Tier2", var_3_32)

	local var_3_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 21
		}
	}

	var_3_6:RegisterAnimationSequence("Tier2", var_3_33)

	local var_3_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		}
	}

	var_3_8:RegisterAnimationSequence("Tier2", var_3_34)

	local var_3_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Tier2", var_3_35)

	local var_3_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Tier2", var_3_36)

	local var_3_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Tier2", var_3_37)

	local var_3_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		}
	}

	var_3_16:RegisterAnimationSequence("Tier2", var_3_38)

	local var_3_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		}
	}

	var_3_18:RegisterAnimationSequence("Tier2", var_3_39)

	local var_3_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		}
	}

	var_3_20:RegisterAnimationSequence("Tier2", var_3_40)

	local function var_3_41()
		var_3_4:AnimateSequence("Tier2")
		var_3_6:AnimateSequence("Tier2")
		var_3_8:AnimateSequence("Tier2")
		var_3_10:AnimateSequence("Tier2")
		var_3_12:AnimateSequence("Tier2")
		var_3_14:AnimateSequence("Tier2")
		var_3_16:AnimateSequence("Tier2")
		var_3_18:AnimateSequence("Tier2")
		var_3_20:AnimateSequence("Tier2")
	end

	var_3_0._sequences.Tier2 = var_3_41

	local var_3_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		}
	}

	var_3_4:RegisterAnimationSequence("Tier3", var_3_42)

	local var_3_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 21
		}
	}

	var_3_6:RegisterAnimationSequence("Tier3", var_3_43)

	local var_3_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		}
	}

	var_3_8:RegisterAnimationSequence("Tier3", var_3_44)

	local var_3_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Tier3", var_3_45)

	local var_3_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Tier3", var_3_46)

	local var_3_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Tier3", var_3_47)

	local var_3_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		}
	}

	var_3_16:RegisterAnimationSequence("Tier3", var_3_48)

	local var_3_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		}
	}

	var_3_18:RegisterAnimationSequence("Tier3", var_3_49)

	local var_3_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		}
	}

	var_3_20:RegisterAnimationSequence("Tier3", var_3_50)

	local function var_3_51()
		var_3_4:AnimateSequence("Tier3")
		var_3_6:AnimateSequence("Tier3")
		var_3_8:AnimateSequence("Tier3")
		var_3_10:AnimateSequence("Tier3")
		var_3_12:AnimateSequence("Tier3")
		var_3_14:AnimateSequence("Tier3")
		var_3_16:AnimateSequence("Tier3")
		var_3_18:AnimateSequence("Tier3")
		var_3_20:AnimateSequence("Tier3")
	end

	var_3_0._sequences.Tier3 = var_3_51

	local var_3_52 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		}
	}

	var_3_4:RegisterAnimationSequence("Tier0", var_3_52)

	local var_3_53 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 21
		}
	}

	var_3_6:RegisterAnimationSequence("Tier0", var_3_53)

	local var_3_54 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		}
	}

	var_3_8:RegisterAnimationSequence("Tier0", var_3_54)

	local var_3_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		}
	}

	var_3_10:RegisterAnimationSequence("Tier0", var_3_55)

	local var_3_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
		}
	}

	var_3_12:RegisterAnimationSequence("Tier0", var_3_56)

	local var_3_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		}
	}

	var_3_14:RegisterAnimationSequence("Tier0", var_3_57)

	local var_3_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		}
	}

	var_3_16:RegisterAnimationSequence("Tier0", var_3_58)

	local var_3_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		}
	}

	var_3_18:RegisterAnimationSequence("Tier0", var_3_59)

	local var_3_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		}
	}

	var_3_20:RegisterAnimationSequence("Tier0", var_3_60)

	local function var_3_61()
		var_3_4:AnimateSequence("Tier0")
		var_3_6:AnimateSequence("Tier0")
		var_3_8:AnimateSequence("Tier0")
		var_3_10:AnimateSequence("Tier0")
		var_3_12:AnimateSequence("Tier0")
		var_3_14:AnimateSequence("Tier0")
		var_3_16:AnimateSequence("Tier0")
		var_3_18:AnimateSequence("Tier0")
		var_3_20:AnimateSequence("Tier0")
	end

	var_3_0._sequences.Tier0 = var_3_61

	local var_3_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		}
	}

	var_3_4:RegisterAnimationSequence("Star1Empty", var_3_62)

	local var_3_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 21
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Star1Empty", var_3_63)

	local var_3_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Star1Empty", var_3_64)

	local var_3_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		}
	}

	var_3_10:RegisterAnimationSequence("Star1Empty", var_3_65)

	local var_3_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
		}
	}

	var_3_12:RegisterAnimationSequence("Star1Empty", var_3_66)

	local var_3_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		}
	}

	var_3_14:RegisterAnimationSequence("Star1Empty", var_3_67)

	local var_3_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		}
	}

	var_3_16:RegisterAnimationSequence("Star1Empty", var_3_68)

	local var_3_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		}
	}

	var_3_18:RegisterAnimationSequence("Star1Empty", var_3_69)

	local var_3_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		}
	}

	var_3_20:RegisterAnimationSequence("Star1Empty", var_3_70)

	local function var_3_71()
		var_3_4:AnimateSequence("Star1Empty")
		var_3_6:AnimateSequence("Star1Empty")
		var_3_8:AnimateSequence("Star1Empty")
		var_3_10:AnimateSequence("Star1Empty")
		var_3_12:AnimateSequence("Star1Empty")
		var_3_14:AnimateSequence("Star1Empty")
		var_3_16:AnimateSequence("Star1Empty")
		var_3_18:AnimateSequence("Star1Empty")
		var_3_20:AnimateSequence("Star1Empty")
	end

	var_3_0._sequences.Star1Empty = var_3_71

	local var_3_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		}
	}

	var_3_4:RegisterAnimationSequence("Star1On", var_3_72)

	local var_3_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 21
		}
	}

	var_3_6:RegisterAnimationSequence("Star1On", var_3_73)

	local var_3_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Star1On", var_3_74)

	local var_3_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		}
	}

	var_3_10:RegisterAnimationSequence("Star1On", var_3_75)

	local var_3_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
		}
	}

	var_3_12:RegisterAnimationSequence("Star1On", var_3_76)

	local var_3_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		}
	}

	var_3_14:RegisterAnimationSequence("Star1On", var_3_77)

	local var_3_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Star1On", var_3_78)

	local var_3_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		}
	}

	var_3_18:RegisterAnimationSequence("Star1On", var_3_79)

	local var_3_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Star1On", var_3_80)

	local function var_3_81()
		var_3_4:AnimateSequence("Star1On")
		var_3_6:AnimateSequence("Star1On")
		var_3_8:AnimateSequence("Star1On")
		var_3_10:AnimateSequence("Star1On")
		var_3_12:AnimateSequence("Star1On")
		var_3_14:AnimateSequence("Star1On")
		var_3_16:AnimateSequence("Star1On")
		var_3_18:AnimateSequence("Star1On")
		var_3_20:AnimateSequence("Star1On")
	end

	var_3_0._sequences.Star1On = var_3_81

	local var_3_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		}
	}

	var_3_4:RegisterAnimationSequence("Star3On", var_3_82)

	local var_3_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 21
		}
	}

	var_3_6:RegisterAnimationSequence("Star3On", var_3_83)

	local var_3_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		}
	}

	var_3_8:RegisterAnimationSequence("Star3On", var_3_84)

	local var_3_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Star3On", var_3_85)

	local var_3_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Star3On", var_3_86)

	local var_3_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Star3On", var_3_87)

	local var_3_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		}
	}

	var_3_16:RegisterAnimationSequence("Star3On", var_3_88)

	local var_3_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		}
	}

	var_3_18:RegisterAnimationSequence("Star3On", var_3_89)

	local var_3_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		}
	}

	var_3_20:RegisterAnimationSequence("Star3On", var_3_90)

	local function var_3_91()
		var_3_4:AnimateSequence("Star3On")
		var_3_6:AnimateSequence("Star3On")
		var_3_8:AnimateSequence("Star3On")
		var_3_10:AnimateSequence("Star3On")
		var_3_12:AnimateSequence("Star3On")
		var_3_14:AnimateSequence("Star3On")
		var_3_16:AnimateSequence("Star3On")
		var_3_18:AnimateSequence("Star3On")
		var_3_20:AnimateSequence("Star3On")
	end

	var_3_0._sequences.Star3On = var_3_91

	local var_3_92 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		}
	}

	var_3_4:RegisterAnimationSequence("Star3Empty", var_3_92)

	local var_3_93 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -21
		}
	}

	var_3_6:RegisterAnimationSequence("Star3Empty", var_3_93)

	local var_3_94 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -73
		}
	}

	var_3_8:RegisterAnimationSequence("Star3Empty", var_3_94)

	local var_3_95 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -69
		}
	}

	var_3_10:RegisterAnimationSequence("Star3Empty", var_3_95)

	local var_3_96 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		}
	}

	var_3_12:RegisterAnimationSequence("Star3Empty", var_3_96)

	local var_3_97 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		}
	}

	var_3_14:RegisterAnimationSequence("Star3Empty", var_3_97)

	local var_3_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		}
	}

	var_3_16:RegisterAnimationSequence("Star3Empty", var_3_98)

	local var_3_99 = {
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
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		}
	}

	var_3_18:RegisterAnimationSequence("Star3Empty", var_3_99)

	local var_3_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		}
	}

	var_3_20:RegisterAnimationSequence("Star3Empty", var_3_100)

	local function var_3_101()
		var_3_4:AnimateSequence("Star3Empty")
		var_3_6:AnimateSequence("Star3Empty")
		var_3_8:AnimateSequence("Star3Empty")
		var_3_10:AnimateSequence("Star3Empty")
		var_3_12:AnimateSequence("Star3Empty")
		var_3_14:AnimateSequence("Star3Empty")
		var_3_16:AnimateSequence("Star3Empty")
		var_3_18:AnimateSequence("Star3Empty")
		var_3_20:AnimateSequence("Star3Empty")
	end

	var_3_0._sequences.Star3Empty = var_3_101

	local var_3_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Star2On", var_3_102)

	local var_3_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 21
		}
	}

	var_3_6:RegisterAnimationSequence("Star2On", var_3_103)

	local var_3_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		}
	}

	var_3_8:RegisterAnimationSequence("Star2On", var_3_104)

	local var_3_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Star2On", var_3_105)

	local var_3_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 17
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Star2On", var_3_106)

	local var_3_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Star2On", var_3_107)

	local var_3_108 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		}
	}

	var_3_16:RegisterAnimationSequence("Star2On", var_3_108)

	local var_3_109 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 47
		}
	}

	var_3_18:RegisterAnimationSequence("Star2On", var_3_109)

	local var_3_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		}
	}

	var_3_20:RegisterAnimationSequence("Star2On", var_3_110)

	local function var_3_111()
		var_3_4:AnimateSequence("Star2On")
		var_3_6:AnimateSequence("Star2On")
		var_3_8:AnimateSequence("Star2On")
		var_3_10:AnimateSequence("Star2On")
		var_3_12:AnimateSequence("Star2On")
		var_3_14:AnimateSequence("Star2On")
		var_3_16:AnimateSequence("Star2On")
		var_3_18:AnimateSequence("Star2On")
		var_3_20:AnimateSequence("Star2On")
	end

	var_3_0._sequences.Star2On = var_3_111

	local var_3_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Star2Empty", var_3_112)

	local var_3_113 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 48
		}
	}

	var_3_6:RegisterAnimationSequence("Star2Empty", var_3_113)

	local var_3_114 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -4
		}
	}

	var_3_8:RegisterAnimationSequence("Star2Empty", var_3_114)

	local var_3_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Star2Empty", var_3_115)

	local var_3_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 44
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Star2Empty", var_3_116)

	local var_3_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Star2Empty", var_3_117)

	local var_3_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		}
	}

	var_3_16:RegisterAnimationSequence("Star2Empty", var_3_118)

	local var_3_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 47
		}
	}

	var_3_18:RegisterAnimationSequence("Star2Empty", var_3_119)

	local var_3_120 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		}
	}

	var_3_20:RegisterAnimationSequence("Star2Empty", var_3_120)

	local function var_3_121()
		var_3_4:AnimateSequence("Star2Empty")
		var_3_6:AnimateSequence("Star2Empty")
		var_3_8:AnimateSequence("Star2Empty")
		var_3_10:AnimateSequence("Star2Empty")
		var_3_12:AnimateSequence("Star2Empty")
		var_3_14:AnimateSequence("Star2Empty")
		var_3_16:AnimateSequence("Star2Empty")
		var_3_18:AnimateSequence("Star2Empty")
		var_3_20:AnimateSequence("Star2Empty")
	end

	var_3_0._sequences.Star2Empty = var_3_121

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SORewardStarsSmall", SORewardStarsSmall)
LockTable(_M)
