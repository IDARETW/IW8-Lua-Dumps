module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0()
		local var_2_0 = arg_1_0:GetDataSource().tierCount:GetValue(arg_1_1)

		if var_2_0 ~= nil then
			for iter_2_0 = 1, 5 do
				arg_1_0["box" .. tostring(iter_2_0)]:SetAlpha(var_2_0 < iter_2_0 and 0 or 1, 0)
				arg_1_0["number" .. tostring(iter_2_0)]:SetAlpha(var_2_0 < iter_2_0 and 0 or 1, 0)
			end
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "tierCount", var_1_0)

	local function var_1_1()
		local var_3_0 = arg_1_0:GetDataSource().currentTier:GetValue(arg_1_1)

		if var_3_0 ~= nil then
			ACTIONS.AnimateSequence(arg_1_0, "Tier" .. tostring(var_3_0 + 1))
		end

		local var_3_1 = arg_1_0:GetDataSource().tierCount:GetValue(arg_1_1)

		if var_3_1 ~= nil then
			for iter_3_0 = var_3_1 + 1, 5 do
				ACTIONS.AnimateSequence(arg_1_0, "ClearTier" .. tostring(iter_3_0))
			end
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "currentTier", var_1_1)
end

function ChallengesTiers(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 76 * _1080p)

	var_4_0.id = "ChallengesTiers"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_5 = LUI.UIBorder.new(var_4_4)

	var_4_5.id = "box1"

	var_4_5:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_4_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 121, _1080p * 19, _1080p * 56)
	var_4_0:addElement(var_4_5)

	var_4_0.box1 = var_4_5

	local var_4_6
	local var_4_7 = LUI.UIImage.new()

	var_4_7.id = "highlight1"

	var_4_7:setImage(RegisterMaterial("challenges_tier"), 0)
	var_4_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 134, _1080p * 10, _1080p * 68)
	var_4_0:addElement(var_4_7)

	var_4_0.highlight1 = var_4_7

	local var_4_8
	local var_4_9 = LUI.UIText.new()

	var_4_9.id = "number1"

	var_4_9:SetRGBFromInt(0, 0)
	var_4_9:setText("1", 0)
	var_4_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_9:SetAlignment(LUI.Alignment.Center)
	var_4_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 122, _1080p * 24, _1080p * 52)
	var_4_0:addElement(var_4_9)

	var_4_0.number1 = var_4_9

	local var_4_10
	local var_4_11 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_12 = LUI.UIBorder.new(var_4_11)

	var_4_12.id = "box2"

	var_4_12:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 125, _1080p * 214, _1080p * 19, _1080p * 56)
	var_4_0:addElement(var_4_12)

	var_4_0.box2 = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "highlight2"

	var_4_14:SetAlpha(0, 0)
	var_4_14:setImage(RegisterMaterial("challenges_tier"), 0)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 112, _1080p * 228, _1080p * 10, _1080p * 68)
	var_4_0:addElement(var_4_14)

	var_4_0.highlight2 = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIText.new()

	var_4_16.id = "number2"

	var_4_16:SetAlpha(0.37, 0)
	var_4_16:setText("2", 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_16:SetAlignment(LUI.Alignment.Center)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 124, _1080p * 216, _1080p * 24, _1080p * 52)
	var_4_0:addElement(var_4_16)

	var_4_0.number2 = var_4_16

	local var_4_17
	local var_4_18 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_19 = LUI.UIBorder.new(var_4_18)

	var_4_19.id = "box3"

	var_4_19:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_4_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 218, _1080p * 307, _1080p * 19, _1080p * 56)
	var_4_0:addElement(var_4_19)

	var_4_0.box3 = var_4_19

	local var_4_20
	local var_4_21 = LUI.UIImage.new()

	var_4_21.id = "highlight3"

	var_4_21:SetAlpha(0, 0)
	var_4_21:setImage(RegisterMaterial("challenges_tier"), 0)
	var_4_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 320, _1080p * 10, _1080p * 68)
	var_4_0:addElement(var_4_21)

	var_4_0.highlight3 = var_4_21

	local var_4_22
	local var_4_23 = LUI.UIText.new()

	var_4_23.id = "number3"

	var_4_23:SetAlpha(0.37, 0)
	var_4_23:setText("3", 0)
	var_4_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_23:SetAlignment(LUI.Alignment.Center)
	var_4_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 217, _1080p * 309, _1080p * 24, _1080p * 52)
	var_4_0:addElement(var_4_23)

	var_4_0.number3 = var_4_23

	local var_4_24
	local var_4_25 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_26 = LUI.UIBorder.new(var_4_25)

	var_4_26.id = "box4"

	var_4_26:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_4_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 311, _1080p * 400, _1080p * 19, _1080p * 56)
	var_4_0:addElement(var_4_26)

	var_4_0.box4 = var_4_26

	local var_4_27
	local var_4_28 = LUI.UIImage.new()

	var_4_28.id = "highlight4"

	var_4_28:SetAlpha(0, 0)
	var_4_28:setImage(RegisterMaterial("challenges_tier"), 0)
	var_4_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 297.64, _1080p * 413.64, _1080p * 10, _1080p * 68)
	var_4_0:addElement(var_4_28)

	var_4_0.highlight4 = var_4_28

	local var_4_29
	local var_4_30 = LUI.UIText.new()

	var_4_30.id = "number4"

	var_4_30:SetAlpha(0.37, 0)
	var_4_30:setText("4", 0)
	var_4_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_30:SetAlignment(LUI.Alignment.Center)
	var_4_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 309.64, _1080p * 401.64, _1080p * 24, _1080p * 52)
	var_4_0:addElement(var_4_30)

	var_4_0.number4 = var_4_30

	local var_4_31
	local var_4_32 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_33 = LUI.UIBorder.new(var_4_32)

	var_4_33.id = "box5"

	var_4_33:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_4_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 404, _1080p * 493, _1080p * 19, _1080p * 56)
	var_4_0:addElement(var_4_33)

	var_4_0.box5 = var_4_33

	local var_4_34
	local var_4_35 = LUI.UIImage.new()

	var_4_35.id = "highlight5"

	var_4_35:SetAlpha(0, 0)
	var_4_35:setImage(RegisterMaterial("challenges_tier"), 0)
	var_4_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 390.64, _1080p * 506.64, _1080p * 10, _1080p * 68)
	var_4_0:addElement(var_4_35)

	var_4_0.highlight5 = var_4_35

	local var_4_36
	local var_4_37 = LUI.UIText.new()

	var_4_37.id = "number5"

	var_4_37:SetAlpha(0.37, 0)
	var_4_37:setText("5", 0)
	var_4_37:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_37:SetAlignment(LUI.Alignment.Center)
	var_4_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 404.64, _1080p * 496.64, _1080p * 24, _1080p * 52)
	var_4_0:addElement(var_4_37)

	var_4_0.number5 = var_4_37

	local function var_4_38()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_38

	local var_4_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("Tier1", var_4_39)

	local var_4_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("Tier1", var_4_40)

	local var_4_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_9:RegisterAnimationSequence("Tier1", var_4_41)

	local var_4_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Tier1", var_4_42)

	local var_4_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Tier1", var_4_43)

	local var_4_44 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_16:RegisterAnimationSequence("Tier1", var_4_44)

	local var_4_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Tier1", var_4_45)

	local var_4_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Tier1", var_4_46)

	local var_4_47 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_23:RegisterAnimationSequence("Tier1", var_4_47)

	local var_4_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("Tier1", var_4_48)

	local var_4_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_28:RegisterAnimationSequence("Tier1", var_4_49)

	local var_4_50 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_30:RegisterAnimationSequence("Tier1", var_4_50)

	local var_4_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("Tier1", var_4_51)

	local var_4_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_35:RegisterAnimationSequence("Tier1", var_4_52)

	local var_4_53 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_37:RegisterAnimationSequence("Tier1", var_4_53)

	local function var_4_54()
		var_4_5:AnimateSequence("Tier1")
		var_4_7:AnimateSequence("Tier1")
		var_4_9:AnimateSequence("Tier1")
		var_4_12:AnimateSequence("Tier1")
		var_4_14:AnimateSequence("Tier1")
		var_4_16:AnimateSequence("Tier1")
		var_4_19:AnimateSequence("Tier1")
		var_4_21:AnimateSequence("Tier1")
		var_4_23:AnimateSequence("Tier1")
		var_4_26:AnimateSequence("Tier1")
		var_4_28:AnimateSequence("Tier1")
		var_4_30:AnimateSequence("Tier1")
		var_4_33:AnimateSequence("Tier1")
		var_4_35:AnimateSequence("Tier1")
		var_4_37:AnimateSequence("Tier1")
	end

	var_4_0._sequences.Tier1 = var_4_54

	local var_4_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("Tier2", var_4_55)

	local var_4_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("Tier2", var_4_56)

	local var_4_57 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_9:RegisterAnimationSequence("Tier2", var_4_57)

	local var_4_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Tier2", var_4_58)

	local var_4_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Tier2", var_4_59)

	local var_4_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_16:RegisterAnimationSequence("Tier2", var_4_60)

	local var_4_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Tier2", var_4_61)

	local var_4_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Tier2", var_4_62)

	local var_4_63 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_23:RegisterAnimationSequence("Tier2", var_4_63)

	local var_4_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("Tier2", var_4_64)

	local var_4_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_28:RegisterAnimationSequence("Tier2", var_4_65)

	local var_4_66 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_30:RegisterAnimationSequence("Tier2", var_4_66)

	local var_4_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("Tier2", var_4_67)

	local var_4_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_35:RegisterAnimationSequence("Tier2", var_4_68)

	local var_4_69 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_37:RegisterAnimationSequence("Tier2", var_4_69)

	local function var_4_70()
		var_4_5:AnimateSequence("Tier2")
		var_4_7:AnimateSequence("Tier2")
		var_4_9:AnimateSequence("Tier2")
		var_4_12:AnimateSequence("Tier2")
		var_4_14:AnimateSequence("Tier2")
		var_4_16:AnimateSequence("Tier2")
		var_4_19:AnimateSequence("Tier2")
		var_4_21:AnimateSequence("Tier2")
		var_4_23:AnimateSequence("Tier2")
		var_4_26:AnimateSequence("Tier2")
		var_4_28:AnimateSequence("Tier2")
		var_4_30:AnimateSequence("Tier2")
		var_4_33:AnimateSequence("Tier2")
		var_4_35:AnimateSequence("Tier2")
		var_4_37:AnimateSequence("Tier2")
	end

	var_4_0._sequences.Tier2 = var_4_70

	local var_4_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("Tier3", var_4_71)

	local var_4_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("Tier3", var_4_72)

	local var_4_73 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_9:RegisterAnimationSequence("Tier3", var_4_73)

	local var_4_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Tier3", var_4_74)

	local var_4_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Tier3", var_4_75)

	local var_4_76 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_16:RegisterAnimationSequence("Tier3", var_4_76)

	local var_4_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Tier3", var_4_77)

	local var_4_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Tier3", var_4_78)

	local var_4_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_23:RegisterAnimationSequence("Tier3", var_4_79)

	local var_4_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("Tier3", var_4_80)

	local var_4_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_28:RegisterAnimationSequence("Tier3", var_4_81)

	local var_4_82 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_30:RegisterAnimationSequence("Tier3", var_4_82)

	local var_4_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("Tier3", var_4_83)

	local var_4_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_35:RegisterAnimationSequence("Tier3", var_4_84)

	local var_4_85 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_37:RegisterAnimationSequence("Tier3", var_4_85)

	local function var_4_86()
		var_4_5:AnimateSequence("Tier3")
		var_4_7:AnimateSequence("Tier3")
		var_4_9:AnimateSequence("Tier3")
		var_4_12:AnimateSequence("Tier3")
		var_4_14:AnimateSequence("Tier3")
		var_4_16:AnimateSequence("Tier3")
		var_4_19:AnimateSequence("Tier3")
		var_4_21:AnimateSequence("Tier3")
		var_4_23:AnimateSequence("Tier3")
		var_4_26:AnimateSequence("Tier3")
		var_4_28:AnimateSequence("Tier3")
		var_4_30:AnimateSequence("Tier3")
		var_4_33:AnimateSequence("Tier3")
		var_4_35:AnimateSequence("Tier3")
		var_4_37:AnimateSequence("Tier3")
	end

	var_4_0._sequences.Tier3 = var_4_86

	local var_4_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("Tier4", var_4_87)

	local var_4_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("Tier4", var_4_88)

	local var_4_89 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_9:RegisterAnimationSequence("Tier4", var_4_89)

	local var_4_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Tier4", var_4_90)

	local var_4_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Tier4", var_4_91)

	local var_4_92 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_16:RegisterAnimationSequence("Tier4", var_4_92)

	local var_4_93 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Tier4", var_4_93)

	local var_4_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Tier4", var_4_94)

	local var_4_95 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_23:RegisterAnimationSequence("Tier4", var_4_95)

	local var_4_96 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("Tier4", var_4_96)

	local var_4_97 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_28:RegisterAnimationSequence("Tier4", var_4_97)

	local var_4_98 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_30:RegisterAnimationSequence("Tier4", var_4_98)

	local var_4_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("Tier4", var_4_99)

	local var_4_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_35:RegisterAnimationSequence("Tier4", var_4_100)

	local var_4_101 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_37:RegisterAnimationSequence("Tier4", var_4_101)

	local function var_4_102()
		var_4_5:AnimateSequence("Tier4")
		var_4_7:AnimateSequence("Tier4")
		var_4_9:AnimateSequence("Tier4")
		var_4_12:AnimateSequence("Tier4")
		var_4_14:AnimateSequence("Tier4")
		var_4_16:AnimateSequence("Tier4")
		var_4_19:AnimateSequence("Tier4")
		var_4_21:AnimateSequence("Tier4")
		var_4_23:AnimateSequence("Tier4")
		var_4_26:AnimateSequence("Tier4")
		var_4_28:AnimateSequence("Tier4")
		var_4_30:AnimateSequence("Tier4")
		var_4_33:AnimateSequence("Tier4")
		var_4_35:AnimateSequence("Tier4")
		var_4_37:AnimateSequence("Tier4")
	end

	var_4_0._sequences.Tier4 = var_4_102

	local var_4_103 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("Tier5", var_4_103)

	local var_4_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("Tier5", var_4_104)

	local var_4_105 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_9:RegisterAnimationSequence("Tier5", var_4_105)

	local var_4_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Tier5", var_4_106)

	local var_4_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Tier5", var_4_107)

	local var_4_108 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_16:RegisterAnimationSequence("Tier5", var_4_108)

	local var_4_109 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Tier5", var_4_109)

	local var_4_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Tier5", var_4_110)

	local var_4_111 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_23:RegisterAnimationSequence("Tier5", var_4_111)

	local var_4_112 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("Tier5", var_4_112)

	local var_4_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_28:RegisterAnimationSequence("Tier5", var_4_113)

	local var_4_114 = {
		{
			value = 0.37,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_30:RegisterAnimationSequence("Tier5", var_4_114)

	local var_4_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("Tier5", var_4_115)

	local var_4_116 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_35:RegisterAnimationSequence("Tier5", var_4_116)

	local var_4_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_37:RegisterAnimationSequence("Tier5", var_4_117)

	local function var_4_118()
		var_4_5:AnimateSequence("Tier5")
		var_4_7:AnimateSequence("Tier5")
		var_4_9:AnimateSequence("Tier5")
		var_4_12:AnimateSequence("Tier5")
		var_4_14:AnimateSequence("Tier5")
		var_4_16:AnimateSequence("Tier5")
		var_4_19:AnimateSequence("Tier5")
		var_4_21:AnimateSequence("Tier5")
		var_4_23:AnimateSequence("Tier5")
		var_4_26:AnimateSequence("Tier5")
		var_4_28:AnimateSequence("Tier5")
		var_4_30:AnimateSequence("Tier5")
		var_4_33:AnimateSequence("Tier5")
		var_4_35:AnimateSequence("Tier5")
		var_4_37:AnimateSequence("Tier5")
	end

	var_4_0._sequences.Tier5 = var_4_118

	local var_4_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("ClearTier1", var_4_119)

	local var_4_120 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("ClearTier1", var_4_120)

	local function var_4_121()
		var_4_5:AnimateSequence("ClearTier1")
		var_4_9:AnimateSequence("ClearTier1")
	end

	var_4_0._sequences.ClearTier1 = var_4_121

	local var_4_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ClearTier2", var_4_122)

	local var_4_123 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("ClearTier2", var_4_123)

	local function var_4_124()
		var_4_12:AnimateSequence("ClearTier2")
		var_4_16:AnimateSequence("ClearTier2")
	end

	var_4_0._sequences.ClearTier2 = var_4_124

	local var_4_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("ClearTier3", var_4_125)

	local var_4_126 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_23:RegisterAnimationSequence("ClearTier3", var_4_126)

	local function var_4_127()
		var_4_19:AnimateSequence("ClearTier3")
		var_4_23:AnimateSequence("ClearTier3")
	end

	var_4_0._sequences.ClearTier3 = var_4_127

	local var_4_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("ClearTier4", var_4_128)

	local var_4_129 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("ClearTier4", var_4_129)

	local function var_4_130()
		var_4_26:AnimateSequence("ClearTier4")
		var_4_30:AnimateSequence("ClearTier4")
	end

	var_4_0._sequences.ClearTier4 = var_4_130

	local var_4_131 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_33:RegisterAnimationSequence("ClearTier5", var_4_131)

	local var_4_132 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_37:RegisterAnimationSequence("ClearTier5", var_4_132)

	local function var_4_133()
		var_4_33:AnimateSequence("ClearTier5")
		var_4_37:AnimateSequence("ClearTier5")
	end

	var_4_0._sequences.ClearTier5 = var_4_133

	local var_4_134 = {
		{
			value = 16745216,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_7:RegisterAnimationSequence("CPColorHighlight", var_4_134)

	local var_4_135 = {
		{
			value = 16745216,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_14:RegisterAnimationSequence("CPColorHighlight", var_4_135)

	local var_4_136 = {
		{
			value = 16745216,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_21:RegisterAnimationSequence("CPColorHighlight", var_4_136)

	local var_4_137 = {
		{
			value = 16745216,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_28:RegisterAnimationSequence("CPColorHighlight", var_4_137)

	local var_4_138 = {
		{
			value = 16745216,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_35:RegisterAnimationSequence("CPColorHighlight", var_4_138)

	local function var_4_139()
		var_4_7:AnimateSequence("CPColorHighlight")
		var_4_14:AnimateSequence("CPColorHighlight")
		var_4_21:AnimateSequence("CPColorHighlight")
		var_4_28:AnimateSequence("CPColorHighlight")
		var_4_35:AnimateSequence("CPColorHighlight")
	end

	var_4_0._sequences.CPColorHighlight = var_4_139

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		ACTIONS.AnimateSequence(var_4_0, "CPColorHighlight")
	end

	return var_4_0
end

MenuBuilder.registerType("ChallengesTiers", ChallengesTiers)
LockTable(_M)
