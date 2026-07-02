module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:GetProgressionData()
	local var_1_1 = arg_1_1:GetChallengeProgress()

	arg_1_0.Ribbon:setImage(RegisterMaterial(var_1_0.ribbonImage))
	arg_1_0.RibbonName:setText(Engine.CBBHFCGDIC(var_1_0.ribbonName))

	local var_1_2 = var_1_0.challengeID
	local var_1_3 = PROGRESSION.GetElderChallengeDescription(var_1_2)
	local var_1_4 = tonumber(PROGRESSION.GetElderChallengeAmount(var_1_2))
	local var_1_5 = var_1_4 <= var_1_1

	if var_1_5 then
		arg_1_0.ProgressLabel:setText(Engine.CBBHFCGDIC("ELDER_PROGRESSION/CHALLENGE_COMPLETE"))
		ACTIONS.AnimateSequence(arg_1_0, "Completed")
	else
		local var_1_6 = var_1_1 / var_1_4

		arg_1_0.ProgressBar.Fill:SetRightAnchor(1 - var_1_6)
		arg_1_0.ProgressLabel:setText(Engine.CBBHFCGDIC("ELDER_PROGRESSION/PROGRESS"))
	end

	arg_1_0.ProgressBar:SetAlpha(var_1_5 and 0 or 1)
	arg_1_0.ChallengeDescription:setText(Engine.CBBHFCGDIC(var_1_3, var_1_4))
	arg_1_0.Progress:setText(Engine.CBBHFCGDIC("ELDER_PROGRESSION/PROGRESS_COUNT", var_1_1, var_1_4))

	local var_1_7 = PROGRESSION.GetElderChallengeXPReward(var_1_2)

	if #var_1_7 > 0 then
		local var_1_8 = {
			image = "icon_xp_token",
			amount = var_1_7
		}

		arg_1_0.ChallengeReward:Setup(var_1_8)
		arg_1_0.ChallengeReward:SetAlpha(1)
	else
		arg_1_0.ChallengeReward:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Ribbon)
	assert(arg_2_0.RibbonName)
	assert(arg_2_0.ChallengeDescription)
	assert(arg_2_0.Progress)
	assert(arg_2_0.ProgressBar)

	arg_2_0.SetDetails = var_0_0
end

function ElderProgressionChallengeDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1262 * _1080p, 0, 200 * _1080p)

	var_3_0.id = "ElderProgressionChallengeDetails"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Ribbon"

	var_3_6:setImage(RegisterMaterial("icon_ribbon_s02_039"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 912, _1080p * 1152, _1080p * 87, _1080p * 167)
	var_3_0:addElement(var_3_6)

	var_3_0.Ribbon = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "RibbonName"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 918, _1080p * 1227, _1080p * 55, _1080p * 79)
	var_3_0:addElement(var_3_8)

	var_3_0.RibbonName = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "ProgressLabel"

	var_3_10:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("ELDER_PROGRESSION/PROGRESS"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_10:SetStartupDelay(1000)
	var_3_10:SetLineHoldTime(400)
	var_3_10:SetAnimMoveTime(2000)
	var_3_10:SetAnimMoveSpeed(50)
	var_3_10:SetEndDelay(1000)
	var_3_10:SetCrossfadeTime(400)
	var_3_10:SetFadeInTime(300)
	var_3_10:SetFadeOutTime(300)
	var_3_10:SetMaxVisibleLines(1)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 469, _1080p * 713, _1080p * 66, _1080p * 94)
	var_3_0:addElement(var_3_10)

	var_3_0.ProgressLabel = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "ProgressBar"

	var_3_12.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_12.Overlay:SetAlpha(0.4, 0)
	var_3_12.Fill:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 469, _1080p * 855, _1080p * 100, _1080p * 108)
	var_3_0:addElement(var_3_12)

	var_3_0.ProgressBar = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "Progress"

	var_3_14:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_14:setText(Engine.CBBHFCGDIC("ELDER_PROGRESSION/PROGRESS_COUNT"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 469, _1080p * 773, _1080p * 112, _1080p * 140)
	var_3_0:addElement(var_3_14)

	var_3_0.Progress = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIStyledText.new()

	var_3_16.id = "ChallengeName"

	var_3_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_16:setText("", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_16:SetWordWrap(false)
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_16:SetStartupDelay(1000)
	var_3_16:SetLineHoldTime(400)
	var_3_16:SetAnimMoveTime(1000)
	var_3_16:SetAnimMoveSpeed(150)
	var_3_16:SetEndDelay(1000)
	var_3_16:SetCrossfadeTime(1000)
	var_3_16:SetFadeInTime(300)
	var_3_16:SetFadeOutTime(300)
	var_3_16:SetMaxVisibleLines(1)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 855, _1080p * 23, _1080p * 59)
	var_3_0:addElement(var_3_16)

	var_3_0.ChallengeName = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "ChallengeDescription"

	var_3_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_18:setText("", 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 440, _1080p * 68, _1080p * 92)
	var_3_0:addElement(var_3_18)

	var_3_0.ChallengeDescription = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "Lock"

	var_3_20:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_3_20:setImage(RegisterMaterial("icon_lock"), 0)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 68, _1080p * 67, _1080p * 117)
	var_3_0:addElement(var_3_20)

	var_3_0.Lock = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIText.new()

	var_3_22.id = "RewardTitle"

	var_3_22:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_3_22:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD"), 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_22:SetAlignment(LUI.Alignment.Left)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 918, _1080p * 1227, _1080p * 23, _1080p * 53)
	var_3_0:addElement(var_3_22)

	var_3_0.RewardTitle = var_3_22

	local var_3_23
	local var_3_24 = MenuBuilder.BuildRegisteredType("ChallengeReward", {
		controllerIndex = var_3_1
	})

	var_3_24.id = "ChallengeReward"

	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 726, _1080p * 826, _1080p * 43, _1080p * 93)
	var_3_0:addElement(var_3_24)

	var_3_0.ChallengeReward = var_3_24

	local function var_3_25()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_25

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Locked", var_3_26)

	local var_3_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Locked", var_3_27)

	local var_3_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Locked", var_3_28)

	local var_3_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Locked", var_3_29)

	local var_3_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Locked", var_3_30)

	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 501
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 92
		}
	}

	var_3_18:RegisterAnimationSequence("Locked", var_3_31)

	local var_3_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Locked", var_3_32)

	local var_3_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Locked", var_3_33)

	local var_3_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Locked", var_3_34)

	local function var_3_35()
		var_3_6:AnimateSequence("Locked")
		var_3_8:AnimateSequence("Locked")
		var_3_10:AnimateSequence("Locked")
		var_3_12:AnimateSequence("Locked")
		var_3_14:AnimateSequence("Locked")
		var_3_18:AnimateSequence("Locked")
		var_3_20:AnimateSequence("Locked")
		var_3_22:AnimateSequence("Locked")
		var_3_24:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_35

	local var_3_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Unlocked", var_3_36)

	local var_3_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Unlocked", var_3_37)

	local var_3_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Unlocked", var_3_38)

	local var_3_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Unlocked", var_3_39)

	local var_3_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Unlocked", var_3_40)

	local var_3_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 440
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 92
		}
	}

	var_3_18:RegisterAnimationSequence("Unlocked", var_3_41)

	local var_3_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("Unlocked", var_3_42)

	local var_3_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Unlocked", var_3_43)

	local var_3_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Unlocked", var_3_44)

	local function var_3_45()
		var_3_6:AnimateSequence("Unlocked")
		var_3_8:AnimateSequence("Unlocked")
		var_3_10:AnimateSequence("Unlocked")
		var_3_12:AnimateSequence("Unlocked")
		var_3_14:AnimateSequence("Unlocked")
		var_3_18:AnimateSequence("Unlocked")
		var_3_20:AnimateSequence("Unlocked")
		var_3_22:AnimateSequence("Unlocked")
		var_3_24:AnimateSequence("Unlocked")
	end

	var_3_0._sequences.Unlocked = var_3_45

	local var_3_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Completed", var_3_46)

	local var_3_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Completed", var_3_47)

	local function var_3_48()
		var_3_12:AnimateSequence("Completed")
		var_3_14:AnimateSequence("Completed")
	end

	var_3_0._sequences.Completed = var_3_48

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ElderProgressionChallengeDetails", ElderProgressionChallengeDetails)
LockTable(_M)
