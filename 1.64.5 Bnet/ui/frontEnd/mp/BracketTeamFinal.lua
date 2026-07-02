module(..., package.seeall)

local var_0_0 = {
	WON = 1,
	MY_TEAM = 2
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0
	local var_1_1 = LUI.FlowManager.GetScopedData(TOURNAMENT.GetMenuName("arena"))

	assert(var_1_0.TeamName)
	assert(var_1_0.Wins)

	local var_1_2 = arg_1_2.teams[arg_1_1]

	var_1_0.TeamName:setText(var_1_2.name)
	var_1_0.ReadyFlash:SetRGBFromTable(var_1_2.color)

	local var_1_3 = arg_1_2.canSpectate or arg_1_2.complete

	var_1_0.Wins:setText(var_1_3 and var_1_2.wins or Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"))

	if arg_1_0._matchData and var_1_2.wins ~= arg_1_0._matchData.teams[arg_1_1].wins and not var_1_1.firstBracketUpdate then
		ACTIONS.AnimateSequence(var_1_0, "ScoreFlash")
	end

	if var_1_2.won and arg_1_0._state ~= var_0_0.WON and arg_1_2.complete then
		arg_1_0._state = var_0_0.WON

		var_1_0.Wins:SetRGBFromTable(COLORS.white)
		var_1_0.TeamName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		ACTIONS.AnimateSequence(var_1_0, var_1_2.isMyTeam and "WonMyTeam" or "WonNotMyTeam")
	elseif not var_1_2.won and var_1_2.isMyTeam and arg_1_0._state ~= var_0_0.MY_TEAM then
		ACTIONS.AnimateSequence(var_1_0, "MyTeam")

		arg_1_0._state = var_0_0.MY_TEAM

		var_1_0.TeamName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	end

	if not arg_1_2.complete then
		if arg_1_2.canSpectate then
			ACTIONS.AnimateSequence(var_1_0, "InProgressSnap")
		elseif arg_1_2.isMyMatch then
			arg_1_0._youIndicator:SetAlpha(var_1_2.isMyTeam and 1 or 0)
			ACTIONS.AnimateSequence(arg_1_0, "MyMatch")

			if arg_1_0._matchData and arg_1_0._matchData.canSpectate ~= arg_1_2.canSpectate then
				ACTIONS.AnimateSequence(var_1_0, "MyMatchWaiting")
			else
				ACTIONS.AnimateSequence(var_1_0, "MyMatchWaitingSnap")
			end
		else
			ACTIONS.AnimateSequence(var_1_0, "NotMyMatchWaitingSnap")
		end
	else
		arg_1_0._youIndicator:SetAlpha(0)
		ACTIONS.AnimateSequence(var_1_0, "CompletedSnap")

		if not var_1_2.won and arg_1_0._matchData and arg_1_0._matchData.complete ~= arg_1_2.complete then
			ACTIONS.AnimateSequence(var_1_0, "Lost")
		elseif not var_1_2.won then
			ACTIONS.AnimateSequence(var_1_0, "LostSnap")
		end
	end

	if not arg_1_0._fullTeamReady then
		local var_1_4 = true

		for iter_1_0 = 1, #var_1_2.players do
			var_1_4 = var_1_4 and var_1_2.players[iter_1_0].ready
		end

		if var_1_4 and arg_1_2.isMyMatch then
			arg_1_0._fullTeamReady = true

			if not var_1_1.firstBracketUpdate then
				ACTIONS.AnimateSequence(var_1_0, arg_1_0._isLeft and "TeamReadyFlashRight" or "TeamReadyFlashRight")
			end
		end
	end

	arg_1_0._matchData = arg_1_2
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Update = var_0_1
	arg_2_0._isLeft = arg_2_2.isLeft
	arg_2_0._youIndicator = arg_2_0._isLeft and arg_2_0.YouIndicatorRight or arg_2_0.YouIndicatorLeft

	ACTIONS.AnimateSequence(arg_2_0, arg_2_0._isLeft and "FinalsLeft" or "FinalsRight")
end

function BracketTeamFinal(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 224 * _1080p, 0, 140 * _1080p)

	var_3_0.id = "BracketTeamFinal"
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

	var_3_4.id = "NameBacker"

	var_3_4:SetRGBFromTable(SWATCHES.Tournament.bracketBacker, 0)
	var_3_4:SetAlpha(0.2, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -38, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.NameBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Flash"

	var_3_6:SetAlpha(0, 0)
	var_3_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_3_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -224, _1080p * -1, _1080p * 12, _1080p * -38)
	var_3_0:addElement(var_3_6)

	var_3_0.Flash = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Wins"

	var_3_8:SetRGBFromTable(SWATCHES.Tournament.roundText, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -194, _1080p * -30, _1080p * 24, _1080p * 94)
	var_3_0:addElement(var_3_8)

	var_3_0.Wins = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "TeamName"

	var_3_10:SetRGBFromTable(SWATCHES.Tournament.roundText, 0)
	var_3_10:setText("Alpha Team ", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_10:SetStartupDelay(1000)
	var_3_10:SetLineHoldTime(400)
	var_3_10:SetAnimMoveTime(2000)
	var_3_10:SetAnimMoveSpeed(50)
	var_3_10:SetEndDelay(1000)
	var_3_10:SetCrossfadeTime(400)
	var_3_10:SetFadeInTime(300)
	var_3_10:SetFadeOutTime(300)
	var_3_10:SetMaxVisibleLines(1)
	var_3_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -65, _1080p * 39, _1080p * 63)
	var_3_0:addElement(var_3_10)

	var_3_0.TeamName = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "TeamColor"

	var_3_12:SetRGBFromTable(SWATCHES.Tournament.bracketBacker, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -8, _1080p * -2, _1080p * -38, 0)
	var_3_0:addElement(var_3_12)

	var_3_0.TeamColor = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "ReadyFlash"

	var_3_14:SetAlpha(0, 0)
	var_3_14:SetAnchorsAndPosition(0, 0, 1, 0, 0, _1080p * -1, _1080p * 2, _1080p * 40)
	var_3_0:addElement(var_3_14)

	var_3_0.ReadyFlash = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("YouIndicatorLeft", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "YouIndicatorLeft"

	var_3_16:SetAlpha(0, 0)
	var_3_16:SetScale(-0.25, 0)
	var_3_16:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -70, _1080p * 5, _1080p * 36, _1080p * 66)
	var_3_0:addElement(var_3_16)

	var_3_0.YouIndicatorLeft = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("YouIndicatorRight", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "YouIndicatorRight"

	var_3_18:SetAlpha(0, 0)
	var_3_18:SetScale(-0.25, 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -5, _1080p * 70, _1080p * 36, _1080p * 66)
	var_3_0:addElement(var_3_18)

	var_3_0.YouIndicatorRight = var_3_18

	local function var_3_19()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_19

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNeutral
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("WonMyTeam", var_3_20)

	local function var_3_21()
		var_3_10:AnimateSequence("WonMyTeam")
	end

	var_3_0._sequences.WonMyTeam = var_3_21

	local var_3_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.highlight
		}
	}

	var_3_10:RegisterAnimationSequence("MyTeam", var_3_22)

	local function var_3_23()
		var_3_10:AnimateSequence("MyTeam")
	end

	var_3_0._sequences.MyTeam = var_3_23

	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_3_10:RegisterAnimationSequence("FinalsLeft", var_3_24)

	local var_3_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8
		}
	}

	var_3_12:RegisterAnimationSequence("FinalsLeft", var_3_25)

	local function var_3_26()
		var_3_10:AnimateSequence("FinalsLeft")
		var_3_12:AnimateSequence("FinalsLeft")
	end

	var_3_0._sequences.FinalsLeft = var_3_26

	local var_3_27 = {
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

	var_3_4:RegisterAnimationSequence("Right", var_3_27)

	local var_3_28 = {
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

	var_3_6:RegisterAnimationSequence("Right", var_3_28)

	local var_3_29 = {
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

	var_3_8:RegisterAnimationSequence("Right", var_3_29)

	local var_3_30 = {
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

	var_3_10:RegisterAnimationSequence("Right", var_3_30)

	local var_3_31 = {
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

	var_3_14:RegisterAnimationSequence("Right", var_3_31)

	local function var_3_32()
		var_3_4:AnimateSequence("Right")
		var_3_6:AnimateSequence("Right")
		var_3_8:AnimateSequence("Right")
		var_3_10:AnimateSequence("Right")
		var_3_14:AnimateSequence("Right")
	end

	var_3_0._sequences.Right = var_3_32

	local var_3_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 102
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 160,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12,
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

	var_3_6:RegisterAnimationSequence("ScoreFlash", var_3_33)

	local function var_3_34()
		var_3_6:AnimateSequence("ScoreFlash")
	end

	var_3_0._sequences.ScoreFlash = var_3_34

	local function var_3_35()
		return
	end

	var_3_0._sequences.InProgress = var_3_35

	local var_3_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBackerCompleted
		}
	}

	var_3_4:RegisterAnimationSequence("Completed", var_3_36)

	local function var_3_37()
		var_3_4:AnimateSequence("Completed")
	end

	var_3_0._sequences.Completed = var_3_37

	local var_3_38 = {
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

	var_3_14:RegisterAnimationSequence("MyMatchWaiting", var_3_38)

	local function var_3_39()
		var_3_14:AnimateSequence("MyMatchWaiting")
	end

	var_3_0._sequences.MyMatchWaiting = var_3_39

	local var_3_40 = {
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

	var_3_14:RegisterAnimationSequence("InProgressSnap", var_3_40)

	local function var_3_41()
		var_3_14:AnimateSequence("InProgressSnap")
	end

	var_3_0._sequences.InProgressSnap = var_3_41

	local var_3_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBackerCompleted
		}
	}

	var_3_4:RegisterAnimationSequence("CompletedSnap", var_3_42)

	local var_3_43 = {
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

	var_3_14:RegisterAnimationSequence("CompletedSnap", var_3_43)

	local function var_3_44()
		var_3_4:AnimateSequence("CompletedSnap")
		var_3_14:AnimateSequence("CompletedSnap")
	end

	var_3_0._sequences.CompletedSnap = var_3_44

	local var_3_45 = {
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

	var_3_14:RegisterAnimationSequence("MyMatchWaitingSnap", var_3_45)

	local function var_3_46()
		var_3_14:AnimateSequence("MyMatchWaitingSnap")
	end

	var_3_0._sequences.MyMatchWaitingSnap = var_3_46

	local var_3_47 = {
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

	var_3_14:RegisterAnimationSequence("NotMyMatchWaitingSnap", var_3_47)

	local function var_3_48()
		var_3_14:AnimateSequence("NotMyMatchWaitingSnap")
	end

	var_3_0._sequences.NotMyMatchWaitingSnap = var_3_48

	local var_3_49 = {
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
			value = 0.6,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 223,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_14:RegisterAnimationSequence("TeamReadyFlashLeft", var_3_49)

	local function var_3_50()
		var_3_14:AnimateSequence("TeamReadyFlashLeft")
	end

	var_3_0._sequences.TeamReadyFlashLeft = var_3_50

	local var_3_51 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Lost", var_3_51)

	local var_3_52 = {
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_8:RegisterAnimationSequence("Lost", var_3_52)

	local var_3_53 = {
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

	var_3_10:RegisterAnimationSequence("Lost", var_3_53)

	local var_3_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBackerCompleted
		}
	}

	var_3_12:RegisterAnimationSequence("Lost", var_3_54)

	local function var_3_55()
		var_3_4:AnimateSequence("Lost")
		var_3_8:AnimateSequence("Lost")
		var_3_10:AnimateSequence("Lost")
		var_3_12:AnimateSequence("Lost")
	end

	var_3_0._sequences.Lost = var_3_55

	local var_3_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		}
	}

	var_3_10:RegisterAnimationSequence("FinalsRight", var_3_56)

	local var_3_57 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2
		}
	}

	var_3_12:RegisterAnimationSequence("FinalsRight", var_3_57)

	local function var_3_58()
		var_3_10:AnimateSequence("FinalsRight")
		var_3_12:AnimateSequence("FinalsRight")
	end

	var_3_0._sequences.FinalsRight = var_3_58

	local var_3_59 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_8:RegisterAnimationSequence("LostSnap", var_3_59)

	local var_3_60 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNameLost
		}
	}

	var_3_10:RegisterAnimationSequence("LostSnap", var_3_60)

	local var_3_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.bracketBackerCompleted
		}
	}

	var_3_12:RegisterAnimationSequence("LostSnap", var_3_61)

	local function var_3_62()
		var_3_8:AnimateSequence("LostSnap")
		var_3_10:AnimateSequence("LostSnap")
		var_3_12:AnimateSequence("LostSnap")
	end

	var_3_0._sequences.LostSnap = var_3_62

	local function var_3_63()
		return
	end

	var_3_0._sequences.NotMyTeam = var_3_63

	local var_3_64 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0.6,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -224,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 450,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_14:RegisterAnimationSequence("TeamReadyFlashRight", var_3_64)

	local function var_3_65()
		var_3_14:AnimateSequence("TeamReadyFlashRight")
	end

	var_3_0._sequences.TeamReadyFlashRight = var_3_65

	local var_3_66 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("MyMatch", var_3_66)

	local function var_3_67()
		var_3_4:AnimateSequence("MyMatch")
	end

	var_3_0._sequences.MyMatch = var_3_67

	local var_3_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Tournament.teamNameLost
		}
	}

	var_3_10:RegisterAnimationSequence("WonNotMyTeam", var_3_68)

	local function var_3_69()
		var_3_10:AnimateSequence("WonNotMyTeam")
	end

	var_3_0._sequences.WonNotMyTeam = var_3_69

	var_0_2(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BracketTeamFinal", BracketTeamFinal)
LockTable(_M)
