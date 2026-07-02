module(..., package.seeall)

function BracketTeamLeftSide(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 304 * _1080p, 0, 38 * _1080p)

	var_1_0.id = "BracketTeamLeftSide"
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

	var_1_4.id = "NameBacker"

	var_1_4:SetRGBFromTable(SWATCHES.Tournament.bracketBacker, 0)
	var_1_4:SetAlpha(0.2, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -40, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.NameBacker = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "ScoreBacker"

	var_1_6:SetRGBFromTable(SWATCHES.Tournament.bracketBacker, 0)
	var_1_6:SetAlpha(0.2, 0)
	var_1_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -38, 0, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.ScoreBacker = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Flash"

	var_1_8:SetAlpha(0, 0)
	var_1_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -38, 0, 0, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.Flash = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "Wins"

	var_1_10:SetRGBFromTable(SWATCHES.Tournament.roundText, 0)
	var_1_10:setText("", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Center)
	var_1_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -35, _1080p * -3, _1080p * 7, _1080p * 31)
	var_1_0:addElement(var_1_10)

	var_1_0.Wins = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "TeamName"

	var_1_12:SetRGBFromTable(SWATCHES.Tournament.roundText, 0)
	var_1_12:setText("", 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_12:SetStartupDelay(1000)
	var_1_12:SetLineHoldTime(400)
	var_1_12:SetAnimMoveTime(2000)
	var_1_12:SetAnimMoveSpeed(50)
	var_1_12:SetEndDelay(1000)
	var_1_12:SetCrossfadeTime(400)
	var_1_12:SetFadeInTime(300)
	var_1_12:SetFadeOutTime(300)
	var_1_12:SetMaxVisibleLines(1)
	var_1_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 16, _1080p * -110, _1080p * -12, _1080p * 12)
	var_1_0:addElement(var_1_12)

	var_1_0.TeamName = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "TeamColor"

	var_1_14:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_1_14:SetAlpha(0, 0)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -8, _1080p * -2, 0, 0)
	var_1_0:addElement(var_1_14)

	var_1_0.TeamColor = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "ReadyFlash"

	var_1_16:SetAlpha(0, 0)
	var_1_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -104, _1080p * -408, 0, _1080p * 38)
	var_1_0:addElement(var_1_16)

	var_1_0.ReadyFlash = var_1_16

	local var_1_17
	local var_1_18 = MenuBuilder.BuildRegisteredType("YouIndicatorLeft", {
		controllerIndex = var_1_1
	})

	var_1_18.id = "YouIndicator"

	var_1_18:SetAlpha(0, 0)
	var_1_18:SetScale(-0.25, 0)
	var_1_18:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -115, _1080p * -45, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_18)

	var_1_0.YouIndicator = var_1_18

	local function var_1_19()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_19

	local var_1_20 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNameLost
		}
	}

	var_1_4:RegisterAnimationSequence("WonMyTeam", var_1_20)

	local var_1_21 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNameLost
		}
	}

	var_1_6:RegisterAnimationSequence("WonMyTeam", var_1_21)

	local var_1_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNeutral
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("WonMyTeam", var_1_22)

	local var_1_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNeutral
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("WonMyTeam", var_1_23)

	local var_1_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("WonMyTeam", var_1_24)

	local function var_1_25()
		var_1_4:AnimateSequence("WonMyTeam")
		var_1_6:AnimateSequence("WonMyTeam")
		var_1_10:AnimateSequence("WonMyTeam")
		var_1_12:AnimateSequence("WonMyTeam")
		var_1_14:AnimateSequence("WonMyTeam")
	end

	var_1_0._sequences.WonMyTeam = var_1_25

	local var_1_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.highlight
		}
	}

	var_1_12:RegisterAnimationSequence("MyTeam", var_1_26)

	local function var_1_27()
		var_1_12:AnimateSequence("MyTeam")
	end

	var_1_0._sequences.MyTeam = var_1_27

	local var_1_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_4:RegisterAnimationSequence("FinalsLeft", var_1_28)

	local var_1_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("FinalsLeft", var_1_29)

	local var_1_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_8:RegisterAnimationSequence("FinalsLeft", var_1_30)

	local var_1_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 33
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_10:RegisterAnimationSequence("FinalsLeft", var_1_31)

	local var_1_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -72
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
		}
	}

	var_1_12:RegisterAnimationSequence("FinalsLeft", var_1_32)

	local var_1_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_14:RegisterAnimationSequence("FinalsLeft", var_1_33)

	local var_1_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_16:RegisterAnimationSequence("FinalsLeft", var_1_34)

	local function var_1_35()
		var_1_4:AnimateSequence("FinalsLeft")
		var_1_6:AnimateSequence("FinalsLeft")
		var_1_8:AnimateSequence("FinalsLeft")
		var_1_10:AnimateSequence("FinalsLeft")
		var_1_12:AnimateSequence("FinalsLeft")
		var_1_14:AnimateSequence("FinalsLeft")
		var_1_16:AnimateSequence("FinalsLeft")
	end

	var_1_0._sequences.FinalsLeft = var_1_35

	local var_1_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_4:RegisterAnimationSequence("Right", var_1_36)

	local var_1_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("Right", var_1_37)

	local var_1_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_8:RegisterAnimationSequence("Right", var_1_38)

	local var_1_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_10:RegisterAnimationSequence("Right", var_1_39)

	local var_1_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 62
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
		}
	}

	var_1_12:RegisterAnimationSequence("Right", var_1_40)

	local var_1_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 57
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_14:RegisterAnimationSequence("Right", var_1_41)

	local var_1_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_16:RegisterAnimationSequence("Right", var_1_42)

	local function var_1_43()
		var_1_4:AnimateSequence("Right")
		var_1_6:AnimateSequence("Right")
		var_1_8:AnimateSequence("Right")
		var_1_10:AnimateSequence("Right")
		var_1_12:AnimateSequence("Right")
		var_1_14:AnimateSequence("Right")
		var_1_16:AnimateSequence("Right")
	end

	var_1_0._sequences.Right = var_1_43

	local var_1_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 38
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 160,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.5,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 840,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_8:RegisterAnimationSequence("ScoreFlash", var_1_44)

	local function var_1_45()
		var_1_8:AnimateSequence("ScoreFlash")
	end

	var_1_0._sequences.ScoreFlash = var_1_45

	local var_1_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -98,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -98,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_1_14:RegisterAnimationSequence("InProgress", var_1_46)

	local function var_1_47()
		var_1_14:AnimateSequence("InProgress")
	end

	var_1_0._sequences.InProgress = var_1_47

	local var_1_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBackerCompleted
		}
	}

	var_1_4:RegisterAnimationSequence("Completed", var_1_48)

	local var_1_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBackerCompleted
		}
	}

	var_1_6:RegisterAnimationSequence("Completed", var_1_49)

	local var_1_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -98
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_1_14:RegisterAnimationSequence("Completed", var_1_50)

	local function var_1_51()
		var_1_4:AnimateSequence("Completed")
		var_1_6:AnimateSequence("Completed")
		var_1_14:AnimateSequence("Completed")
	end

	var_1_0._sequences.Completed = var_1_51

	local var_1_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -98
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_14:RegisterAnimationSequence("MyMatchWaiting", var_1_52)

	local var_1_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_16:RegisterAnimationSequence("MyMatchWaiting", var_1_53)

	local function var_1_54()
		var_1_14:AnimateSequence("MyMatchWaiting")
		var_1_16:AnimateSequence("MyMatchWaiting")
	end

	var_1_0._sequences.MyMatchWaiting = var_1_54

	local var_1_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -98
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_14:RegisterAnimationSequence("InProgressSnap", var_1_55)

	local var_1_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_16:RegisterAnimationSequence("InProgressSnap", var_1_56)

	local function var_1_57()
		var_1_14:AnimateSequence("InProgressSnap")
		var_1_16:AnimateSequence("InProgressSnap")
	end

	var_1_0._sequences.InProgressSnap = var_1_57

	local var_1_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBackerCompleted
		}
	}

	var_1_4:RegisterAnimationSequence("CompletedSnap", var_1_58)

	local var_1_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBackerCompleted
		}
	}

	var_1_6:RegisterAnimationSequence("CompletedSnap", var_1_59)

	local var_1_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_14:RegisterAnimationSequence("CompletedSnap", var_1_60)

	local var_1_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_16:RegisterAnimationSequence("CompletedSnap", var_1_61)

	local function var_1_62()
		var_1_4:AnimateSequence("CompletedSnap")
		var_1_6:AnimateSequence("CompletedSnap")
		var_1_14:AnimateSequence("CompletedSnap")
		var_1_16:AnimateSequence("CompletedSnap")
	end

	var_1_0._sequences.CompletedSnap = var_1_62

	local var_1_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -98
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_14:RegisterAnimationSequence("MyMatchWaitingSnap", var_1_63)

	local var_1_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_16:RegisterAnimationSequence("MyMatchWaitingSnap", var_1_64)

	local function var_1_65()
		var_1_14:AnimateSequence("MyMatchWaitingSnap")
		var_1_16:AnimateSequence("MyMatchWaitingSnap")
	end

	var_1_0._sequences.MyMatchWaitingSnap = var_1_65

	local var_1_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_14:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_1_66)

	local var_1_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_16:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_1_67)

	local function var_1_68()
		var_1_14:AnimateSequence("NotMyMatchWaitingSnap")
		var_1_16:AnimateSequence("NotMyMatchWaitingSnap")
	end

	var_1_0._sequences.NotMyMatchWaitingSnap = var_1_68

	local var_1_69 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -408
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.6,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_16:RegisterAnimationSequence("TeamReadyFlash", var_1_69)

	local function var_1_70()
		var_1_16:AnimateSequence("TeamReadyFlash")
	end

	var_1_0._sequences.TeamReadyFlash = var_1_70

	local var_1_71 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Lost", var_1_71)

	local var_1_72 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Lost", var_1_72)

	local var_1_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNameLost
		},
		{
			value = 0.7,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_10:RegisterAnimationSequence("Lost", var_1_73)

	local var_1_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNameLost
		},
		{
			value = 0.7,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_12:RegisterAnimationSequence("Lost", var_1_74)

	local var_1_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBackerCompleted
		}
	}

	var_1_14:RegisterAnimationSequence("Lost", var_1_75)

	local function var_1_76()
		var_1_4:AnimateSequence("Lost")
		var_1_6:AnimateSequence("Lost")
		var_1_10:AnimateSequence("Lost")
		var_1_12:AnimateSequence("Lost")
		var_1_14:AnimateSequence("Lost")
	end

	var_1_0._sequences.Lost = var_1_76

	local var_1_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
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
		}
	}

	var_1_4:RegisterAnimationSequence("FinalsRight", var_1_77)

	local var_1_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -38
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("FinalsRight", var_1_78)

	local var_1_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -38
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_8:RegisterAnimationSequence("FinalsRight", var_1_79)

	local var_1_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_10:RegisterAnimationSequence("FinalsRight", var_1_80)

	local var_1_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -9
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
		}
	}

	var_1_12:RegisterAnimationSequence("FinalsRight", var_1_81)

	local var_1_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_1_14:RegisterAnimationSequence("FinalsRight", var_1_82)

	local function var_1_83()
		var_1_4:AnimateSequence("FinalsRight")
		var_1_6:AnimateSequence("FinalsRight")
		var_1_8:AnimateSequence("FinalsRight")
		var_1_10:AnimateSequence("FinalsRight")
		var_1_12:AnimateSequence("FinalsRight")
		var_1_14:AnimateSequence("FinalsRight")
	end

	var_1_0._sequences.FinalsRight = var_1_83

	local var_1_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNameLost
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("LostSnap", var_1_84)

	local var_1_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNameLost
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("LostSnap", var_1_85)

	local function var_1_86()
		var_1_10:AnimateSequence("LostSnap")
		var_1_12:AnimateSequence("LostSnap")
	end

	var_1_0._sequences.LostSnap = var_1_86

	local function var_1_87()
		return
	end

	var_1_0._sequences.NotMyTeam = var_1_87

	local var_1_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNameLost
		},
		{
			value = 0.85,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("WonNotMyTeam", var_1_88)

	local var_1_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNameLost
		},
		{
			value = 0.85,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("WonNotMyTeam", var_1_89)

	local function var_1_90()
		var_1_10:AnimateSequence("WonNotMyTeam")
		var_1_12:AnimateSequence("WonNotMyTeam")
	end

	var_1_0._sequences.WonNotMyTeam = var_1_90

	local var_1_91 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("MyMatch", var_1_91)

	local var_1_92 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("MyMatch", var_1_92)

	local function var_1_93()
		var_1_4:AnimateSequence("MyMatch")
		var_1_6:AnimateSequence("MyMatch")
	end

	var_1_0._sequences.MyMatch = var_1_93

	return var_1_0
end

MenuBuilder.registerType("BracketTeamLeftSide", BracketTeamLeftSide)
LockTable(_M)
