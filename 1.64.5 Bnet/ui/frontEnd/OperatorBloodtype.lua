module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = "Blood" .. arg_1_1

	ACTIONS.AnimateSequence(arg_1_0, var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupBloodDetails = var_0_0

	if IsLanguageChinese() or IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "LargeText")
	end
end

function OperatorBloodtype(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 636 * _1080p, 0, 140 * _1080p)

	var_3_0.id = "OperatorBloodtype"
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

	var_3_4.id = "Blood"

	var_3_4:setImage(RegisterMaterial("ui_operator_bio_box_blood_type"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 636, 0, _1080p * 140)
	var_3_0:addElement(var_3_4)

	var_3_0.Blood = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "UNKNOWN"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_6:SetAlpha(0, 0)
	var_3_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BLOODTYPE_UNKNOWN")), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Right)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 320, _1080p * 603, _1080p * 23, _1080p * 45)
	var_3_0:addElement(var_3_6)

	var_3_0.UNKNOWN = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Check"

	var_3_8:setImage(RegisterMaterial("ui_operator_bio_checkmark"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 612, _1080p * 636, _1080p * 63, _1080p * 87)
	var_3_0:addElement(var_3_8)

	var_3_0.Check = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "APOS"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_10:SetAlpha(0.5, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("LUA_MENU/BLOODTYPE_APOS"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 77, _1080p * 93, _1080p * 111)
	var_3_0:addElement(var_3_10)

	var_3_0.APOS = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "OPOS"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_12:SetAlpha(0.5, 0)
	var_3_12:setText(Engine.CBBHFCGDIC("LUA_MENU/BLOODTYPE_OPOS"), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 80, _1080p * 156, _1080p * 93, _1080p * 111)
	var_3_0:addElement(var_3_12)

	var_3_0.OPOS = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "BPOS"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_14:SetAlpha(0.5, 0)
	var_3_14:setText(Engine.CBBHFCGDIC("LUA_MENU/BLOODTYPE_BPOS"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 161, _1080p * 237, _1080p * 93, _1080p * 111)
	var_3_0:addElement(var_3_14)

	var_3_0.BPOS = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIStyledText.new()

	var_3_16.id = "ABPOS"

	var_3_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_16:SetAlpha(0.5, 0)
	var_3_16:setText(Engine.CBBHFCGDIC("LUA_MENU/BLOODTYPE_ABPOS"), 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Center)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 240, _1080p * 316, _1080p * 93, _1080p * 111)
	var_3_0:addElement(var_3_16)

	var_3_0.ABPOS = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "ANEG"

	var_3_18:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_18:SetAlpha(0.5, 0)
	var_3_18:setText(Engine.CBBHFCGDIC("LUA_MENU/BLOODTYPE_ANEG"), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Center)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 320, _1080p * 396, _1080p * 93, _1080p * 111)
	var_3_0:addElement(var_3_18)

	var_3_0.ANEG = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIStyledText.new()

	var_3_20.id = "ONEG"

	var_3_20:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_20:SetAlpha(0.5, 0)
	var_3_20:setText(Engine.CBBHFCGDIC("LUA_MENU/BLOODTYPE_ONEG"), 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_20:SetAlignment(LUI.Alignment.Center)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 399, _1080p * 475, _1080p * 93, _1080p * 111)
	var_3_0:addElement(var_3_20)

	var_3_0.ONEG = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIStyledText.new()

	var_3_22.id = "BNEG"

	var_3_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_22:SetAlpha(0.5, 0)
	var_3_22:setText(Engine.CBBHFCGDIC("LUA_MENU/BLOODTYPE_BNEG"), 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_22:SetAlignment(LUI.Alignment.Center)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 478, _1080p * 554, _1080p * 93, _1080p * 111)
	var_3_0:addElement(var_3_22)

	var_3_0.BNEG = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIStyledText.new()

	var_3_24.id = "ABNEG"

	var_3_24:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_24:SetAlpha(0.5, 0)
	var_3_24:setText(Engine.CBBHFCGDIC("LUA_MENU/BLOODTYPE_ABNEG"), 0)
	var_3_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_24:SetAlignment(LUI.Alignment.Center)
	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 558, _1080p * 634, _1080p * 93, _1080p * 111)
	var_3_0:addElement(var_3_24)

	var_3_0.ABNEG = var_3_24

	local var_3_25
	local var_3_26 = LUI.UIStyledText.new()

	var_3_26.id = "BloodType"

	var_3_26:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_26:SetAlpha(0.5, 0)
	var_3_26:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NOTES_BLOOD_TYPE")), 0)
	var_3_26:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_26:SetAlignment(LUI.Alignment.Left)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 320, _1080p * 23, _1080p * 45)
	var_3_0:addElement(var_3_26)

	var_3_0.BloodType = var_3_26

	local function var_3_27()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_27

	local var_3_28
	local var_3_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("BloodAPOS", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 56
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
		}
	}

	var_3_8:RegisterAnimationSequence("BloodAPOS", var_3_30)

	local function var_3_31()
		var_3_6:AnimateSequence("BloodAPOS")
		var_3_8:AnimateSequence("BloodAPOS")
	end

	var_3_0._sequences.BloodAPOS = var_3_31

	local var_3_32
	local var_3_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		}
	}

	var_3_6:RegisterAnimationSequence("LargeText", var_3_33)

	local var_3_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_3_10:RegisterAnimationSequence("LargeText", var_3_34)

	local var_3_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_3_12:RegisterAnimationSequence("LargeText", var_3_35)

	local var_3_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_3_14:RegisterAnimationSequence("LargeText", var_3_36)

	local var_3_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_3_16:RegisterAnimationSequence("LargeText", var_3_37)

	local var_3_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_3_18:RegisterAnimationSequence("LargeText", var_3_38)

	local var_3_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_3_20:RegisterAnimationSequence("LargeText", var_3_39)

	local var_3_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_3_22:RegisterAnimationSequence("LargeText", var_3_40)

	local var_3_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_3_24:RegisterAnimationSequence("LargeText", var_3_41)

	local var_3_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 54
		}
	}

	var_3_26:RegisterAnimationSequence("LargeText", var_3_42)

	local function var_3_43()
		var_3_6:AnimateSequence("LargeText")
		var_3_10:AnimateSequence("LargeText")
		var_3_12:AnimateSequence("LargeText")
		var_3_14:AnimateSequence("LargeText")
		var_3_16:AnimateSequence("LargeText")
		var_3_18:AnimateSequence("LargeText")
		var_3_20:AnimateSequence("LargeText")
		var_3_22:AnimateSequence("LargeText")
		var_3_24:AnimateSequence("LargeText")
		var_3_26:AnimateSequence("LargeText")
	end

	var_3_0._sequences.LargeText = var_3_43

	local var_3_44
	local var_3_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("BloodOPOS", var_3_45)

	local var_3_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 135
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 159
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("BloodOPOS", var_3_46)

	local function var_3_47()
		var_3_6:AnimateSequence("BloodOPOS")
		var_3_8:AnimateSequence("BloodOPOS")
	end

	var_3_0._sequences.BloodOPOS = var_3_47

	local var_3_48
	local var_3_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("BloodBPOS", var_3_49)

	local var_3_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 239
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("BloodBPOS", var_3_50)

	local function var_3_51()
		var_3_6:AnimateSequence("BloodBPOS")
		var_3_8:AnimateSequence("BloodBPOS")
	end

	var_3_0._sequences.BloodBPOS = var_3_51

	local var_3_52
	local var_3_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("BloodABPOS", var_3_53)

	local var_3_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 294
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 318
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("BloodABPOS", var_3_54)

	local function var_3_55()
		var_3_6:AnimateSequence("BloodABPOS")
		var_3_8:AnimateSequence("BloodABPOS")
	end

	var_3_0._sequences.BloodABPOS = var_3_55

	local var_3_56
	local var_3_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("BloodANEG", var_3_57)

	local var_3_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 374
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 398
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("BloodANEG", var_3_58)

	local function var_3_59()
		var_3_6:AnimateSequence("BloodANEG")
		var_3_8:AnimateSequence("BloodANEG")
	end

	var_3_0._sequences.BloodANEG = var_3_59

	local var_3_60
	local var_3_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("BloodONEG", var_3_61)

	local var_3_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 453
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 477
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("BloodONEG", var_3_62)

	local function var_3_63()
		var_3_6:AnimateSequence("BloodONEG")
		var_3_8:AnimateSequence("BloodONEG")
	end

	var_3_0._sequences.BloodONEG = var_3_63

	local var_3_64
	local var_3_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("BloodBNEG", var_3_65)

	local var_3_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 532
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 556
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("BloodBNEG", var_3_66)

	local function var_3_67()
		var_3_6:AnimateSequence("BloodBNEG")
		var_3_8:AnimateSequence("BloodBNEG")
	end

	var_3_0._sequences.BloodBNEG = var_3_67

	local var_3_68
	local var_3_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("BloodABNEG", var_3_69)

	local var_3_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 612
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 636
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("BloodABNEG", var_3_70)

	local function var_3_71()
		var_3_6:AnimateSequence("BloodABNEG")
		var_3_8:AnimateSequence("BloodABNEG")
	end

	var_3_0._sequences.BloodABNEG = var_3_71

	local var_3_72
	local var_3_73 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("BloodUNKNOWN", var_3_73)

	local var_3_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("BloodUNKNOWN", var_3_74)

	local function var_3_75()
		var_3_6:AnimateSequence("BloodUNKNOWN")
		var_3_8:AnimateSequence("BloodUNKNOWN")
	end

	var_3_0._sequences.BloodUNKNOWN = var_3_75

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("OperatorBloodtype", OperatorBloodtype)
LockTable(_M)
