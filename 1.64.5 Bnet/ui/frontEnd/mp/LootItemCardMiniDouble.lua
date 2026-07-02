module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0:getParent()

	if var_1_0 then
		var_1_0.FrontLootItemCard:RemoveFromParent()
		var_1_0.LootItemCardShadow:RemoveFromParent()
		var_1_0.LootItemCardShadow:addElementBefore(var_1_0.BackLootItemCard)
		var_1_0.FrontLootItemCard:addElementBefore(var_1_0.LootItemCardShadow)

		var_1_0._cardIdInFront = 2
	end
end

local function var_0_1(arg_2_0)
	local var_2_0 = arg_2_0:getParent()

	if var_2_0 then
		var_2_0.BackLootItemCard:RemoveFromParent()
		var_2_0.LootItemCardShadow:RemoveFromParent()
		var_2_0.LootItemCardShadow:addElementBefore(var_2_0.FrontLootItemCard)
		var_2_0.BackLootItemCard:addElementBefore(var_2_0.LootItemCardShadow)

		var_2_0._cardIdInFront = 1
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_0._backCardPulledUp then
		arg_3_1 = arg_3_1 .. "KBM"
	end

	ACTIONS.AnimateSequence(arg_3_0, arg_3_1)
end

local function var_0_3(arg_4_0)
	if arg_4_0.BackLootItemCard:GetAlpha() > 0 then
		if arg_4_0._cardIdInFront == 1 then
			ACTIONS.AnimateSequence(arg_4_0, "ScaleUpBackCardInBack")
		else
			ACTIONS.AnimateSequence(arg_4_0, "ScaleUpFrontCardInBack")
		end

		arg_4_0._backCardPulledUp = true
	end
end

local function var_0_4(arg_5_0)
	if arg_5_0._backCardPulledUp then
		if arg_5_0._cardIdInFront == 1 then
			ACTIONS.AnimateSequence(arg_5_0, "ScaleDownBackCardInBack")
		else
			ACTIONS.AnimateSequence(arg_5_0, "ScaleDownFrontCardInBack")
		end

		arg_5_0._backCardPulledUp = false
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.PlaySwapAnimation = var_0_2
	arg_6_0.PlayScaleUpBackAnimation = var_0_3
	arg_6_0.PlayScaleDownBackAnimation = var_0_4

	arg_6_0.FrontLootItemCard:SetMiniMode()
	arg_6_0.BackLootItemCard:SetMiniMode()

	arg_6_0._cardIdInFront = 1
end

function LootItemCardMiniDouble(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 200 * _1080p)

	var_7_0.id = "LootItemCardMiniDouble"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "BackLootItemCard"

	var_7_4:SetAlpha(0, 0)
	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 7, _1080p * -7, _1080p * -26, _1080p * -45)
	var_7_0:addElement(var_7_4)

	var_7_0.BackLootItemCard = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "LootItemCardShadow"

	var_7_6:SetRGBFromInt(0, 0)
	var_7_6:SetAlpha(0, 0)
	var_7_6:setImage(RegisterMaterial("widg_gradient_top_to_bottom_with_base"), 0)
	var_7_6:SetUMin(1, 0)
	var_7_6:SetUMax(0, 0)
	var_7_6:SetVMin(0.9, 0)
	var_7_6:SetVMax(-4, 0)
	var_7_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 7, _1080p * -7, _1080p * -26, 0)
	var_7_0:addElement(var_7_6)

	var_7_0.LootItemCardShadow = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "FrontLootItemCard"

	var_7_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_8)

	var_7_0.FrontLootItemCard = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("EmptyFocusable", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "FlipFocusable"

	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -95, _1080p * 95, _1080p * -65, 0)
	var_7_0:addElement(var_7_10)

	var_7_0.FlipFocusable = var_7_10

	local function var_7_11()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_11

	local var_7_12
	local var_7_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -23
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20,
			onComplete = var_0_0
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_7_4:RegisterAnimationSequence("SwitchToBackCard", var_7_13)

	local var_7_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -25
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -14
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		}
	}

	var_7_6:RegisterAnimationSequence("SwitchToBackCard", var_7_14)

	local var_7_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -23
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		}
	}

	var_7_8:RegisterAnimationSequence("SwitchToBackCard", var_7_15)

	local function var_7_16()
		var_7_4:AnimateSequence("SwitchToBackCard")
		var_7_6:AnimateSequence("SwitchToBackCard")
		var_7_8:AnimateSequence("SwitchToBackCard")
	end

	var_7_0._sequences.SwitchToBackCard = var_7_16

	local var_7_17
	local var_7_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -23
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		}
	}

	var_7_4:RegisterAnimationSequence("SwitchToFrontCard", var_7_18)

	local var_7_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -25
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -14
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		}
	}

	var_7_6:RegisterAnimationSequence("SwitchToFrontCard", var_7_19)

	local var_7_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -23
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20,
			onComplete = var_0_1
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_7_8:RegisterAnimationSequence("SwitchToFrontCard", var_7_20)

	local function var_7_21()
		var_7_4:AnimateSequence("SwitchToFrontCard")
		var_7_6:AnimateSequence("SwitchToFrontCard")
		var_7_8:AnimateSequence("SwitchToFrontCard")
	end

	var_7_0._sequences.SwitchToFrontCard = var_7_21

	local var_7_22
	local var_7_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("ShowBackCard", var_7_23)

	local var_7_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ShowBackCard", var_7_24)

	local function var_7_25()
		var_7_4:AnimateSequence("ShowBackCard")
		var_7_6:AnimateSequence("ShowBackCard")
	end

	var_7_0._sequences.ShowBackCard = var_7_25

	local var_7_26
	local var_7_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("HideBackCard", var_7_27)

	local var_7_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("HideBackCard", var_7_28)

	local function var_7_29()
		var_7_4:AnimateSequence("HideBackCard")
		var_7_6:AnimateSequence("HideBackCard")
	end

	var_7_0._sequences.HideBackCard = var_7_29

	local var_7_30
	local var_7_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_7_4:RegisterAnimationSequence("SwitchToFrontCardSnap", var_7_31)

	local var_7_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_7_6:RegisterAnimationSequence("SwitchToFrontCardSnap", var_7_32)

	local var_7_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			onComplete = var_0_1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
		}
	}

	var_7_8:RegisterAnimationSequence("SwitchToFrontCardSnap", var_7_33)

	local function var_7_34()
		var_7_4:AnimateSequence("SwitchToFrontCardSnap")
		var_7_6:AnimateSequence("SwitchToFrontCardSnap")
		var_7_8:AnimateSequence("SwitchToFrontCardSnap")
	end

	var_7_0._sequences.SwitchToFrontCardSnap = var_7_34

	local var_7_35
	local var_7_36 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -65
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -65
		}
	}

	var_7_4:RegisterAnimationSequence("ScaleUpBackCardInBack", var_7_36)

	local var_7_37 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -65
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ScaleUpBackCardInBack", var_7_37)

	local function var_7_38()
		var_7_4:AnimateSequence("ScaleUpBackCardInBack")
		var_7_6:AnimateSequence("ScaleUpBackCardInBack")
	end

	var_7_0._sequences.ScaleUpBackCardInBack = var_7_38

	local var_7_39
	local var_7_40 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -65
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ScaleUpFrontCardInBack", var_7_40)

	local var_7_41 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -65
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -65
		}
	}

	var_7_8:RegisterAnimationSequence("ScaleUpFrontCardInBack", var_7_41)

	local function var_7_42()
		var_7_6:AnimateSequence("ScaleUpFrontCardInBack")
		var_7_8:AnimateSequence("ScaleUpFrontCardInBack")
	end

	var_7_0._sequences.ScaleUpFrontCardInBack = var_7_42

	local var_7_43
	local var_7_44 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		}
	}

	var_7_4:RegisterAnimationSequence("ScaleDownBackCardInBack", var_7_44)

	local var_7_45 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ScaleDownBackCardInBack", var_7_45)

	local function var_7_46()
		var_7_4:AnimateSequence("ScaleDownBackCardInBack")
		var_7_6:AnimateSequence("ScaleDownBackCardInBack")
	end

	var_7_0._sequences.ScaleDownBackCardInBack = var_7_46

	local var_7_47
	local var_7_48 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ScaleDownFrontCardInBack", var_7_48)

	local var_7_49 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -7
		}
	}

	var_7_8:RegisterAnimationSequence("ScaleDownFrontCardInBack", var_7_49)

	local function var_7_50()
		var_7_6:AnimateSequence("ScaleDownFrontCardInBack")
		var_7_8:AnimateSequence("ScaleDownFrontCardInBack")
	end

	var_7_0._sequences.ScaleDownFrontCardInBack = var_7_50

	local var_7_51
	local var_7_52 = {
		{
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -32
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20,
			onComplete = var_0_0
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_7_4:RegisterAnimationSequence("SwitchToBackCardKBM", var_7_52)

	local var_7_53 = {
		{
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -32
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -65
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -65
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_7_8:RegisterAnimationSequence("SwitchToBackCardKBM", var_7_53)

	local function var_7_54()
		var_7_4:AnimateSequence("SwitchToBackCardKBM")
		var_7_8:AnimateSequence("SwitchToBackCardKBM")
	end

	var_7_0._sequences.SwitchToBackCardKBM = var_7_54

	local var_7_55
	local var_7_56 = {
		{
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -32
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -20
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -65
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -65
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_7_4:RegisterAnimationSequence("SwitchToFrontCardKBM", var_7_56)

	local var_7_57 = {
		{
			duration = 70,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -32
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -32
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20,
			onComplete = var_0_1
		},
		{
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 20
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_7_8:RegisterAnimationSequence("SwitchToFrontCardKBM", var_7_57)

	local function var_7_58()
		var_7_4:AnimateSequence("SwitchToFrontCardKBM")
		var_7_8:AnimateSequence("SwitchToFrontCardKBM")
	end

	var_7_0._sequences.SwitchToFrontCardKBM = var_7_58

	var_0_5(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LootItemCardMiniDouble", LootItemCardMiniDouble)
LockTable(_M)
