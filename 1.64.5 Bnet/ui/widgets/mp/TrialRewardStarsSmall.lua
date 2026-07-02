module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function TrialRewardStarsSmall(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 180 * _1080p, 0, 50 * _1080p)

	var_2_0.id = "TrialRewardStarsSmall"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "StarBorder3"

	var_2_4:SetAlpha(0.6, 0)
	var_2_4:SetColorOp(COLOR_OP.saturation, 0)
	var_2_4:setImage(RegisterMaterial("star_on"), 0)
	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 39, _1080p * 81, _1080p * -46, _1080p * -4)
	var_2_0:addElement(var_2_4)

	var_2_0.StarBorder3 = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "StarBorder2"

	var_2_6:SetAlpha(0.6, 0)
	var_2_6:SetColorOp(COLOR_OP.saturation, 0)
	var_2_6:setImage(RegisterMaterial("star_on"), 0)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -21, _1080p * 21, _1080p * -46, _1080p * -4)
	var_2_0:addElement(var_2_6)

	var_2_0.StarBorder2 = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "StarBorder1"

	var_2_8:SetAlpha(0.6, 0)
	var_2_8:SetColorOp(COLOR_OP.saturation, 0)
	var_2_8:setImage(RegisterMaterial("star_on"), 0)
	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -81, _1080p * -39, _1080p * -46, _1080p * -4)
	var_2_0:addElement(var_2_8)

	var_2_0.StarBorder1 = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIImage.new()

	var_2_10.id = "StarOff1"

	var_2_10:setImage(RegisterMaterial("star_off"), 0)
	var_2_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -77, _1080p * -43, _1080p * -42, _1080p * -8)
	var_2_0:addElement(var_2_10)

	var_2_0.StarOff1 = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIImage.new()

	var_2_12.id = "StarOff2"

	var_2_12:setImage(RegisterMaterial("star_off"), 0)
	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -17, _1080p * 17, _1080p * -42, _1080p * -8)
	var_2_0:addElement(var_2_12)

	var_2_0.StarOff2 = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIImage.new()

	var_2_14.id = "StarOff3"

	var_2_14:setImage(RegisterMaterial("star_off"), 0)
	var_2_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 43, _1080p * 77, _1080p * -42, _1080p * -8)
	var_2_0:addElement(var_2_14)

	var_2_0.StarOff3 = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIImage.new()

	var_2_16.id = "StarOn1"

	var_2_16:setImage(RegisterMaterial("star_on"), 0)
	var_2_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -80, _1080p * -40, _1080p * -45, _1080p * -5)
	var_2_0:addElement(var_2_16)

	var_2_0.StarOn1 = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIImage.new()

	var_2_18.id = "StarOn2"

	var_2_18:setImage(RegisterMaterial("star_on"), 0)
	var_2_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -45, _1080p * -5)
	var_2_0:addElement(var_2_18)

	var_2_0.StarOn2 = var_2_18

	local var_2_19
	local var_2_20 = LUI.UIImage.new()

	var_2_20.id = "StarOn3"

	var_2_20:setImage(RegisterMaterial("star_on"), 0)
	var_2_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 40, _1080p * 80, _1080p * -45, _1080p * -5)
	var_2_0:addElement(var_2_20)

	var_2_0.StarOn3 = var_2_20

	local function var_2_21()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_21

	local var_2_22
	local var_2_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Tier1", var_2_23)

	local var_2_24 = {
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

	var_2_16:RegisterAnimationSequence("Tier1", var_2_24)

	local var_2_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_18:RegisterAnimationSequence("Tier1", var_2_25)

	local var_2_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("Tier1", var_2_26)

	local function var_2_27()
		var_2_8:AnimateSequence("Tier1")
		var_2_16:AnimateSequence("Tier1")
		var_2_18:AnimateSequence("Tier1")
		var_2_20:AnimateSequence("Tier1")
	end

	var_2_0._sequences.Tier1 = var_2_27

	local var_2_28
	local var_2_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Tier2", var_2_29)

	local var_2_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Tier2", var_2_30)

	local var_2_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_16:RegisterAnimationSequence("Tier2", var_2_31)

	local var_2_32 = {
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

	var_2_18:RegisterAnimationSequence("Tier2", var_2_32)

	local var_2_33 = {
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

	var_2_20:RegisterAnimationSequence("Tier2", var_2_33)

	local function var_2_34()
		var_2_6:AnimateSequence("Tier2")
		var_2_8:AnimateSequence("Tier2")
		var_2_16:AnimateSequence("Tier2")
		var_2_18:AnimateSequence("Tier2")
		var_2_20:AnimateSequence("Tier2")
	end

	var_2_0._sequences.Tier2 = var_2_34

	local var_2_35
	local var_2_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("Tier3", var_2_36)

	local var_2_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Tier3", var_2_37)

	local var_2_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Tier3", var_2_38)

	local var_2_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_16:RegisterAnimationSequence("Tier3", var_2_39)

	local var_2_40 = {
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

	var_2_18:RegisterAnimationSequence("Tier3", var_2_40)

	local var_2_41 = {
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

	var_2_20:RegisterAnimationSequence("Tier3", var_2_41)

	local function var_2_42()
		var_2_4:AnimateSequence("Tier3")
		var_2_6:AnimateSequence("Tier3")
		var_2_8:AnimateSequence("Tier3")
		var_2_16:AnimateSequence("Tier3")
		var_2_18:AnimateSequence("Tier3")
		var_2_20:AnimateSequence("Tier3")
	end

	var_2_0._sequences.Tier3 = var_2_42

	local var_2_43
	local var_2_44 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("Tier0", var_2_44)

	local var_2_45 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Tier0", var_2_45)

	local var_2_46 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Tier0", var_2_46)

	local var_2_47 = {
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

	var_2_10:RegisterAnimationSequence("Tier0", var_2_47)

	local var_2_48 = {
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

	var_2_12:RegisterAnimationSequence("Tier0", var_2_48)

	local var_2_49 = {
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

	var_2_14:RegisterAnimationSequence("Tier0", var_2_49)

	local var_2_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_16:RegisterAnimationSequence("Tier0", var_2_50)

	local var_2_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_18:RegisterAnimationSequence("Tier0", var_2_51)

	local var_2_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("Tier0", var_2_52)

	local function var_2_53()
		var_2_4:AnimateSequence("Tier0")
		var_2_6:AnimateSequence("Tier0")
		var_2_8:AnimateSequence("Tier0")
		var_2_10:AnimateSequence("Tier0")
		var_2_12:AnimateSequence("Tier0")
		var_2_14:AnimateSequence("Tier0")
		var_2_16:AnimateSequence("Tier0")
		var_2_18:AnimateSequence("Tier0")
		var_2_20:AnimateSequence("Tier0")
	end

	var_2_0._sequences.Tier0 = var_2_53

	return var_2_0
end

MenuBuilder.registerType("TrialRewardStarsSmall", TrialRewardStarsSmall)
LockTable(_M)
