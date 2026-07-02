module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1.challenge
	local var_1_1 = arg_1_1.objectiveIndex

	arg_1_0.CheckBox:SetValue(var_1_0.complete, true)

	if var_1_0.objectives and var_1_0.numObjectivesComplete then
		if var_1_0.name and #var_1_0.name > 0 then
			arg_1_0.ChallengeName:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_SKIN_OBJECTIVE_CHALLENGE", var_1_0.name, var_1_1))
		else
			arg_1_0.ChallengeName:setText("")
		end
	end

	if var_1_0.isBattlePassLocked then
		arg_1_0.ProgressCount:setText(Engine.CBBHFCGDIC("CHALLENGE/LOCKED_BATTLEPASS_MISSION", Engine.JCBDICCAH(var_1_0.battlePassLevelToUnlock)))
		ACTIONS.AnimateSequence(arg_1_0, "BattlePassLocked")
	else
		local var_1_2 = arg_1_2.desc
		local var_1_3 = arg_1_2.amount

		if var_1_2 and #var_1_2 > 0 then
			arg_1_0.ObjectiveLabel:setText(Engine.CBBHFCGDIC(var_1_2, var_1_3))
		end

		arg_1_0.ProgressBar:SetAlpha(1)
		arg_1_0.ProgressCount:SetAlpha(1)

		local var_1_4 = tonumber(arg_1_2.progress) / tonumber(var_1_3)
		local var_1_5 = LUI.clamp(var_1_4, 0, 1)

		arg_1_0.ProgressBar.Fill:SetRightAnchor(1 - var_1_5, 0)
		arg_1_0.ProgressCount:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_CHALLENGE_PROGRESS", arg_1_2.progress, tonumber(var_1_3)))
		arg_1_0.ChallengeName:SetMaxVisibleLines(1)
		arg_1_0.ChallengeName:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		ACTIONS.AnimateSequence(arg_1_0, "MissionChallenge")
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.desc
	local var_2_1 = arg_2_1.amount

	arg_2_0.ChallengeName:setText(Engine.CBBHFCGDIC("LUA_MENU/PROGRESS"))

	if arg_2_1.progress and var_2_1 and #var_2_1 > 0 then
		arg_2_0.ProgressBar:SetAlpha(1)
		arg_2_0.ProgressCount:SetAlpha(1)

		local var_2_2 = tonumber(arg_2_1.progress) / tonumber(var_2_1)
		local var_2_3 = LUI.clamp(var_2_2, 0, 1)

		arg_2_0.ProgressBar.Fill:SetRightAnchor(1 - var_2_3, 0)

		local var_2_4 = arg_2_1.timeRemaining and arg_2_1.timeRemaining or 500000
		local var_2_5 = Engine.BJCFFHAIFA(var_2_4)

		arg_2_0.ProgressCount:setText(var_2_5)
	else
		arg_2_0.ProgressBar:SetAlpha(0)
		arg_2_0.ProgressCount:SetAlpha(0)
	end

	arg_2_0.ChallengeReward:Setup(arg_2_1.rewardInfo)
	arg_2_0.ChallengeName:SetMaxVisibleLines(1)
	arg_2_0.ChallengeName:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	ACTIONS.AnimateSequence(arg_2_0, "Challenge")
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1.desc
	local var_3_1 = arg_3_1.amount

	if var_3_0 and #var_3_0 > 0 then
		arg_3_0.ChallengeName:setText(Engine.CBBHFCGDIC(var_3_0, var_3_1))
	end

	arg_3_0.ChallengeName:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)

	if arg_3_1.progress and var_3_1 and #var_3_1 > 0 then
		arg_3_0.ChallengeName:SetMaxVisibleLines(2)
		arg_3_0.ProgressBar:SetAlpha(1)
		arg_3_0.ProgressCount:SetAlpha(1)

		local var_3_2 = tonumber(arg_3_1.progress) / tonumber(var_3_1)
		local var_3_3 = LUI.clamp(var_3_2, 0, 1)

		arg_3_0.ProgressBar.Fill:SetRightAnchor(1 - var_3_3, 0)
		arg_3_0.ProgressCount:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_CHALLENGE_PROGRESS", arg_3_1.progress, tonumber(var_3_1)))
	else
		arg_3_0.ProgressBar:SetAlpha(0)
		arg_3_0.ProgressCount:SetAlpha(0)
		arg_3_0.ChallengeName:SetMaxVisibleLines(4)
	end

	ACTIONS.AnimateSequence(arg_3_0, "UnlockCriteria")
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.ChallengeName)
	assert(arg_4_0.ProgressBar)

	arg_4_0.SetupChallengeInfo = var_0_1
	arg_4_0.SetupLockedInfo = var_0_2
	arg_4_0.SetupMissionChallengeInfo = var_0_0
end

function OperatorChallengeLabel(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 410 * _1080p, 0, 85 * _1080p)

	var_5_0.id = "OperatorChallengeLabel"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIStyledText.new()

	var_5_4.id = "ChallengeName"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_4:setText("", 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_4:SetAlignment(LUI.Alignment.Left)
	var_5_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_4:SetStartupDelay(2000)
	var_5_4:SetLineHoldTime(400)
	var_5_4:SetAnimMoveTime(5000)
	var_5_4:SetAnimMoveSpeed(1000)
	var_5_4:SetEndDelay(2000)
	var_5_4:SetCrossfadeTime(250)
	var_5_4:SetFadeInTime(300)
	var_5_4:SetFadeOutTime(300)
	var_5_4:SetMaxVisibleLines(1)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
	var_5_0:addElement(var_5_4)

	var_5_0.ChallengeName = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "ProgressBar"

	var_5_6.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_6.Overlay:SetAlpha(0.6, 0)
	var_5_6.Fill:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -25, _1080p * -15)
	var_5_0:addElement(var_5_6)

	var_5_0.ProgressBar = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "ProgressCount"

	var_5_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -59, _1080p * -39)
	var_5_0:addElement(var_5_8)

	var_5_0.ProgressCount = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("ChallengeReward", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "ChallengeReward"

	var_5_10:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -129, _1080p * -29, _1080p * -82, _1080p * -34)
	var_5_0:addElement(var_5_10)

	var_5_0.ChallengeReward = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "CheckBox"

	var_5_12:SetAlpha(0.5, 0)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 49, _1080p * 27, _1080p * 75)
	var_5_0:addElement(var_5_12)

	var_5_0.CheckBox = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "LockIcon"

	var_5_14:SetRGBFromTable(SWATCHES.genericMenu.locked, 0)
	var_5_14:SetAlpha(0, 0)
	var_5_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 46, _1080p * 30, _1080p * 72)
	var_5_0:addElement(var_5_14)

	var_5_0.LockIcon = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIStyledText.new()

	var_5_16.id = "ObjectiveLabel"

	var_5_16:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_16:setText("", 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_16:SetStartupDelay(2000)
	var_5_16:SetLineHoldTime(400)
	var_5_16:SetAnimMoveTime(2000)
	var_5_16:SetAnimMoveSpeed(150)
	var_5_16:SetEndDelay(2000)
	var_5_16:SetCrossfadeTime(250)
	var_5_16:SetFadeInTime(300)
	var_5_16:SetFadeOutTime(300)
	var_5_16:SetMaxVisibleLines(2)
	var_5_16:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 54, _1080p * -63, _1080p * -57, _1080p * -39)
	var_5_0:addElement(var_5_16)

	var_5_0.ObjectiveLabel = var_5_16

	local function var_5_17()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_17

	local var_5_18
	local var_5_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_5_4:RegisterAnimationSequence("UnlockCriteria", var_5_19)

	local var_5_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -18
		}
	}

	var_5_6:RegisterAnimationSequence("UnlockCriteria", var_5_20)

	local var_5_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		},
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
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_5_8:RegisterAnimationSequence("UnlockCriteria", var_5_21)

	local var_5_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("UnlockCriteria", var_5_22)

	local var_5_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("UnlockCriteria", var_5_23)

	local var_5_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("UnlockCriteria", var_5_24)

	local function var_5_25()
		var_5_4:AnimateSequence("UnlockCriteria")
		var_5_6:AnimateSequence("UnlockCriteria")
		var_5_8:AnimateSequence("UnlockCriteria")
		var_5_10:AnimateSequence("UnlockCriteria")
		var_5_12:AnimateSequence("UnlockCriteria")
		var_5_16:AnimateSequence("UnlockCriteria")
	end

	var_5_0._sequences.UnlockCriteria = var_5_25

	local var_5_26
	local var_5_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -118
		}
	}

	var_5_4:RegisterAnimationSequence("Challenge", var_5_27)

	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -15
		}
	}

	var_5_6:RegisterAnimationSequence("Challenge", var_5_28)

	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -118
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_5_8:RegisterAnimationSequence("Challenge", var_5_29)

	local var_5_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Challenge", var_5_30)

	local var_5_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Challenge", var_5_31)

	local var_5_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("Challenge", var_5_32)

	local var_5_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("Challenge", var_5_33)

	local function var_5_34()
		var_5_4:AnimateSequence("Challenge")
		var_5_6:AnimateSequence("Challenge")
		var_5_8:AnimateSequence("Challenge")
		var_5_10:AnimateSequence("Challenge")
		var_5_12:AnimateSequence("Challenge")
		var_5_14:AnimateSequence("Challenge")
		var_5_16:AnimateSequence("Challenge")
	end

	var_5_0._sequences.Challenge = var_5_34

	local var_5_35
	local var_5_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 54
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_5_6:RegisterAnimationSequence("MissionChallenge", var_5_36)

	local var_5_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -15
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_5_8:RegisterAnimationSequence("MissionChallenge", var_5_37)

	local var_5_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("MissionChallenge", var_5_38)

	local var_5_39 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -48
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_5_12:RegisterAnimationSequence("MissionChallenge", var_5_39)

	local var_5_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 78
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("MissionChallenge", var_5_40)

	local var_5_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.title
		}
	}

	var_5_16:RegisterAnimationSequence("MissionChallenge", var_5_41)

	local function var_5_42()
		var_5_6:AnimateSequence("MissionChallenge")
		var_5_8:AnimateSequence("MissionChallenge")
		var_5_10:AnimateSequence("MissionChallenge")
		var_5_12:AnimateSequence("MissionChallenge")
		var_5_14:AnimateSequence("MissionChallenge")
		var_5_16:AnimateSequence("MissionChallenge")
	end

	var_5_0._sequences.MissionChallenge = var_5_42

	local var_5_43
	local var_5_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("BattlePassLocked", var_5_44)

	local var_5_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -44
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_5_8:RegisterAnimationSequence("BattlePassLocked", var_5_45)

	local var_5_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("BattlePassLocked", var_5_46)

	local var_5_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 81
		}
	}

	var_5_12:RegisterAnimationSequence("BattlePassLocked", var_5_47)

	local var_5_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 84
		}
	}

	var_5_14:RegisterAnimationSequence("BattlePassLocked", var_5_48)

	local var_5_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("BattlePassLocked", var_5_49)

	local function var_5_50()
		var_5_6:AnimateSequence("BattlePassLocked")
		var_5_8:AnimateSequence("BattlePassLocked")
		var_5_10:AnimateSequence("BattlePassLocked")
		var_5_12:AnimateSequence("BattlePassLocked")
		var_5_14:AnimateSequence("BattlePassLocked")
		var_5_16:AnimateSequence("BattlePassLocked")
	end

	var_5_0._sequences.BattlePassLocked = var_5_50

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("OperatorChallengeLabel", OperatorChallengeLabel)
LockTable(_M)
