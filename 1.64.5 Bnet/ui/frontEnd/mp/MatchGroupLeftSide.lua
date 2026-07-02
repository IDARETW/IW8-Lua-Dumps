module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = MenuBuilder.BuildRegisteredType("BracketTeam", {
		bracketTeam = 1,
		controllerIndex = arg_1_1,
		isLeft = arg_1_2.isLeft
	})

	var_1_0.id = "BracketTeam1"

	var_1_0:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 104, 0, _1080p * 48, _1080p * 86)
	arg_1_0:addElement(var_1_0)

	arg_1_0.BracketTeam1 = var_1_0

	local var_1_1 = MenuBuilder.BuildRegisteredType("BracketTeam", {
		bracketTeam = 2,
		controllerIndex = arg_1_1,
		isLeft = arg_1_2.isLeft
	})

	var_1_1.id = "BracketTeam2"

	var_1_1:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 104, 0, _1080p * 88, _1080p * 126)
	arg_1_0:addElement(var_1_1)

	arg_1_0.BracketTeam2 = var_1_1
end

function MatchGroupLeftSide(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 406 * _1080p, 0, 126 * _1080p)

	var_2_0.id = "MatchGroupLeftSide"
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

	var_2_4.id = "StatusBacker"

	var_2_4:SetRGBFromTable(SWATCHES.Tournament.bracketBacker, 0)
	var_2_4:SetAlpha(0, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -404, _1080p * 48, _1080p * 126)
	var_2_0:addElement(var_2_4)

	var_2_0.StatusBacker = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "RoundTxt"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_2_6:SetAlpha(0, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("TOURNAMENT/ROUND"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 97, _1080p * 65, _1080p * 83)
	var_2_0:addElement(var_2_6)

	var_2_0.RoundTxt = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "RoundNum"

	var_2_8:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_2_8:SetAlpha(0, 0)
	var_2_8:setText("", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Center)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 72, _1080p * 50, _1080p * 68)
	var_2_0:addElement(var_2_8)

	var_2_0.RoundNum = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIText.new()

	var_2_10.id = "MatchTimeRemain"

	var_2_10:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_2_10:SetAlpha(0, 0)
	var_2_10:setText(Engine.CBBHFCGDIC("TOURNAMENT/REMAIN"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Center)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 97, _1080p * 106, _1080p * 124)
	var_2_0:addElement(var_2_10)

	var_2_0.MatchTimeRemain = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIStyledText.new()

	var_2_12.id = "MatchTimeString"

	var_2_12:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_2_12:SetAlpha(0, 0)
	var_2_12:setText("", 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_12:SetAlignment(LUI.Alignment.Center)
	var_2_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_12:SetStartupDelay(1000)
	var_2_12:SetLineHoldTime(400)
	var_2_12:SetAnimMoveTime(2000)
	var_2_12:SetAnimMoveSpeed(50)
	var_2_12:SetEndDelay(1000)
	var_2_12:SetCrossfadeTime(400)
	var_2_12:SetFadeInTime(300)
	var_2_12:SetFadeOutTime(300)
	var_2_12:SetMaxVisibleLines(1)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 93, _1080p * 90, _1080p * 108)
	var_2_0:addElement(var_2_12)

	var_2_0.MatchTimeString = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIImage.new()

	var_2_14.id = "MatchStatusLine"

	var_2_14:SetRGBFromTable(SWATCHES.Tournament.bracketLine, 0)
	var_2_14:SetAlpha(0, 0)
	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 102, _1080p * 102, _1080p * 86, _1080p * 88)
	var_2_0:addElement(var_2_14)

	var_2_0.MatchStatusLine = var_2_14

	local var_2_15
	local var_2_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_16.id = "MatchNumButton"

	var_2_16.Text:SetLeft(_1080p * 20, 0)
	var_2_16.Text:setText(ToUpperCase("Match Number"), 0)
	var_2_16.Text:SetAlignment(LUI.Alignment.Left)
	var_2_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 104, _1080p * 406, 0, _1080p * 38)
	var_2_0:addElement(var_2_16)

	var_2_0.MatchNumButton = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIImage.new()

	var_2_18.id = "WinnerColor"

	var_2_18:SetRGBFromTable(SWATCHES.Tournament.bracketBacker, 0)
	var_2_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 6, _1080p * 48, _1080p * 126)
	var_2_0:addElement(var_2_18)

	var_2_0.WinnerColor = var_2_18

	local var_2_19
	local var_2_20 = LUI.UIImage.new()

	var_2_20.id = "StatusDivider"

	var_2_20:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_2_20:SetAlpha(0, 0)
	var_2_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 86, _1080p * 86, _1080p * 88)
	var_2_0:addElement(var_2_20)

	var_2_0.StatusDivider = var_2_20

	local function var_2_21()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_21

	local var_2_22 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -304
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_2_4:RegisterAnimationSequence("InProgress", var_2_22)

	local var_2_23 = {
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 140,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("InProgress", var_2_23)

	local var_2_24 = {
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("InProgress", var_2_24)

	local var_2_25 = {
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("InProgress", var_2_25)

	local var_2_26 = {
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("InProgress", var_2_26)

	local var_2_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("InProgress", var_2_27)

	local var_2_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 102,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_2_18:RegisterAnimationSequence("InProgress", var_2_28)

	local var_2_29 = {
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("InProgress", var_2_29)

	local function var_2_30()
		var_2_4:AnimateSequence("InProgress")
		var_2_6:AnimateSequence("InProgress")
		var_2_8:AnimateSequence("InProgress")
		var_2_10:AnimateSequence("InProgress")
		var_2_12:AnimateSequence("InProgress")
		var_2_14:AnimateSequence("InProgress")
		var_2_18:AnimateSequence("InProgress")
		var_2_20:AnimateSequence("InProgress")
	end

	var_2_0._sequences.InProgress = var_2_30

	local var_2_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -304
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -304
		}
	}

	var_2_4:RegisterAnimationSequence("Completed", var_2_31)

	local var_2_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Completed", var_2_32)

	local var_2_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Completed", var_2_33)

	local var_2_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("Completed", var_2_34)

	local var_2_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("Completed", var_2_35)

	local var_2_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 102
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 102
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 406,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_2_14:RegisterAnimationSequence("Completed", var_2_36)

	local var_2_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBackerCompleted
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 102,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_2_18:RegisterAnimationSequence("Completed", var_2_37)

	local var_2_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("Completed", var_2_38)

	local function var_2_39()
		var_2_4:AnimateSequence("Completed")
		var_2_6:AnimateSequence("Completed")
		var_2_8:AnimateSequence("Completed")
		var_2_10:AnimateSequence("Completed")
		var_2_12:AnimateSequence("Completed")
		var_2_14:AnimateSequence("Completed")
		var_2_18:AnimateSequence("Completed")
		var_2_20:AnimateSequence("Completed")
	end

	var_2_0._sequences.Completed = var_2_39

	local var_2_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 102
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -304
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_2_4:RegisterAnimationSequence("MyMatchWaiting", var_2_40)

	local var_2_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("MyMatchWaiting", var_2_41)

	local var_2_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("MyMatchWaiting", var_2_42)

	local var_2_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("MyMatchWaiting", var_2_43)

	local var_2_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("MyMatchWaiting", var_2_44)

	local var_2_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("MyMatchWaiting", var_2_45)

	local var_2_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 102
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_2_18:RegisterAnimationSequence("MyMatchWaiting", var_2_46)

	local var_2_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("MyMatchWaiting", var_2_47)

	local function var_2_48()
		var_2_4:AnimateSequence("MyMatchWaiting")
		var_2_6:AnimateSequence("MyMatchWaiting")
		var_2_8:AnimateSequence("MyMatchWaiting")
		var_2_10:AnimateSequence("MyMatchWaiting")
		var_2_12:AnimateSequence("MyMatchWaiting")
		var_2_14:AnimateSequence("MyMatchWaiting")
		var_2_18:AnimateSequence("MyMatchWaiting")
		var_2_20:AnimateSequence("MyMatchWaiting")
	end

	var_2_0._sequences.MyMatchWaiting = var_2_48

	local var_2_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -304
		}
	}

	var_2_4:RegisterAnimationSequence("InProgressSnap", var_2_49)

	local var_2_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("InProgressSnap", var_2_50)

	local var_2_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("InProgressSnap", var_2_51)

	local var_2_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("InProgressSnap", var_2_52)

	local var_2_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("InProgressSnap", var_2_53)

	local var_2_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		}
	}

	var_2_18:RegisterAnimationSequence("InProgressSnap", var_2_54)

	local var_2_55 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("InProgressSnap", var_2_55)

	local function var_2_56()
		var_2_4:AnimateSequence("InProgressSnap")
		var_2_6:AnimateSequence("InProgressSnap")
		var_2_8:AnimateSequence("InProgressSnap")
		var_2_12:AnimateSequence("InProgressSnap")
		var_2_14:AnimateSequence("InProgressSnap")
		var_2_18:AnimateSequence("InProgressSnap")
		var_2_20:AnimateSequence("InProgressSnap")
	end

	var_2_0._sequences.InProgressSnap = var_2_56

	local var_2_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -404
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("CompletedSnap", var_2_57)

	local var_2_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("CompletedSnap", var_2_58)

	local var_2_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("CompletedSnap", var_2_59)

	local var_2_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("CompletedSnap", var_2_60)

	local var_2_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("CompletedSnap", var_2_61)

	local var_2_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 406
		}
	}

	var_2_14:RegisterAnimationSequence("CompletedSnap", var_2_62)

	local var_2_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBackerCompleted
		}
	}

	var_2_18:RegisterAnimationSequence("CompletedSnap", var_2_63)

	local var_2_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("CompletedSnap", var_2_64)

	local function var_2_65()
		var_2_4:AnimateSequence("CompletedSnap")
		var_2_6:AnimateSequence("CompletedSnap")
		var_2_8:AnimateSequence("CompletedSnap")
		var_2_10:AnimateSequence("CompletedSnap")
		var_2_12:AnimateSequence("CompletedSnap")
		var_2_14:AnimateSequence("CompletedSnap")
		var_2_18:AnimateSequence("CompletedSnap")
		var_2_20:AnimateSequence("CompletedSnap")
	end

	var_2_0._sequences.CompletedSnap = var_2_65

	local var_2_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -304
		}
	}

	var_2_4:RegisterAnimationSequence("MyMatchWaitingSnap", var_2_66)

	local var_2_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("MyMatchWaitingSnap", var_2_67)

	local var_2_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("MyMatchWaitingSnap", var_2_68)

	local var_2_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("MyMatchWaitingSnap", var_2_69)

	local var_2_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("MyMatchWaitingSnap", var_2_70)

	local var_2_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("MyMatchWaitingSnap", var_2_71)

	local var_2_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		}
	}

	var_2_18:RegisterAnimationSequence("MyMatchWaitingSnap", var_2_72)

	local var_2_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("MyMatchWaitingSnap", var_2_73)

	local function var_2_74()
		var_2_4:AnimateSequence("MyMatchWaitingSnap")
		var_2_6:AnimateSequence("MyMatchWaitingSnap")
		var_2_8:AnimateSequence("MyMatchWaitingSnap")
		var_2_10:AnimateSequence("MyMatchWaitingSnap")
		var_2_12:AnimateSequence("MyMatchWaitingSnap")
		var_2_14:AnimateSequence("MyMatchWaitingSnap")
		var_2_18:AnimateSequence("MyMatchWaitingSnap")
		var_2_20:AnimateSequence("MyMatchWaitingSnap")
	end

	var_2_0._sequences.MyMatchWaitingSnap = var_2_74

	local var_2_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -304
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_2_75)

	local var_2_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_2_76)

	local var_2_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_2_77)

	local var_2_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_2_78)

	local var_2_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = "test",
			duration = 0,
			property = TWEEN_PROPERTY.Text
		}
	}

	var_2_12:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_2_79)

	local var_2_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_2_80)

	local var_2_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 102
		}
	}

	var_2_18:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_2_81)

	local var_2_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_2_82)

	local function var_2_83()
		var_2_4:AnimateSequence("NotMyMatchWaitingSnap")
		var_2_6:AnimateSequence("NotMyMatchWaitingSnap")
		var_2_8:AnimateSequence("NotMyMatchWaitingSnap")
		var_2_10:AnimateSequence("NotMyMatchWaitingSnap")
		var_2_12:AnimateSequence("NotMyMatchWaitingSnap")
		var_2_14:AnimateSequence("NotMyMatchWaitingSnap")
		var_2_18:AnimateSequence("NotMyMatchWaitingSnap")
		var_2_20:AnimateSequence("NotMyMatchWaitingSnap")
	end

	var_2_0._sequences.NotMyMatchWaitingSnap = var_2_83

	local var_2_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -304
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_2_4:RegisterAnimationSequence("NotMyMatchInProgress", var_2_84)

	local var_2_85 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("NotMyMatchInProgress", var_2_85)

	local var_2_86 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("NotMyMatchInProgress", var_2_86)

	local var_2_87 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("NotMyMatchInProgress", var_2_87)

	local var_2_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("NotMyMatchInProgress", var_2_88)

	local var_2_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 102
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_2_18:RegisterAnimationSequence("NotMyMatchInProgress", var_2_89)

	local var_2_90 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("NotMyMatchInProgress", var_2_90)

	local function var_2_91()
		var_2_4:AnimateSequence("NotMyMatchInProgress")
		var_2_6:AnimateSequence("NotMyMatchInProgress")
		var_2_8:AnimateSequence("NotMyMatchInProgress")
		var_2_12:AnimateSequence("NotMyMatchInProgress")
		var_2_14:AnimateSequence("NotMyMatchInProgress")
		var_2_18:AnimateSequence("NotMyMatchInProgress")
		var_2_20:AnimateSequence("NotMyMatchInProgress")
	end

	var_2_0._sequences.NotMyMatchInProgress = var_2_91

	local var_2_92 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("DisplayMatchTime", var_2_92)

	local var_2_93 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 90
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("DisplayMatchTime", var_2_93)

	local function var_2_94()
		var_2_10:AnimateSequence("DisplayMatchTime")
		var_2_12:AnimateSequence("DisplayMatchTime")
	end

	var_2_0._sequences.DisplayMatchTime = var_2_94

	local var_2_95 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("DisplayMatchMsg", var_2_95)

	local var_2_96 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 98
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 116
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("DisplayMatchMsg", var_2_96)

	local function var_2_97()
		var_2_10:AnimateSequence("DisplayMatchMsg")
		var_2_12:AnimateSequence("DisplayMatchMsg")
	end

	var_2_0._sequences.DisplayMatchMsg = var_2_97

	local var_2_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -304
		}
	}

	var_2_4:RegisterAnimationSequence("NotMyMatchInProgressSnap", var_2_98)

	local var_2_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("NotMyMatchInProgressSnap", var_2_99)

	local var_2_100 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("NotMyMatchInProgressSnap", var_2_100)

	local var_2_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("NotMyMatchInProgressSnap", var_2_101)

	local var_2_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 6
		}
	}

	var_2_18:RegisterAnimationSequence("NotMyMatchInProgressSnap", var_2_102)

	local var_2_103 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("NotMyMatchInProgressSnap", var_2_103)

	local function var_2_104()
		var_2_4:AnimateSequence("NotMyMatchInProgressSnap")
		var_2_6:AnimateSequence("NotMyMatchInProgressSnap")
		var_2_8:AnimateSequence("NotMyMatchInProgressSnap")
		var_2_14:AnimateSequence("NotMyMatchInProgressSnap")
		var_2_18:AnimateSequence("NotMyMatchInProgressSnap")
		var_2_20:AnimateSequence("NotMyMatchInProgressSnap")
	end

	var_2_0._sequences.NotMyMatchInProgressSnap = var_2_104

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("MatchGroupLeftSide", MatchGroupLeftSide)
LockTable(_M)
