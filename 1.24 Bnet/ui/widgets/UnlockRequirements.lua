module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.isClassified then
		arg_1_0.UnlockCriteria:setText(Engine.CBBHFCGDIC("LUA_MENU/CLASSIFIED"))
		arg_1_0.ChallengeProgress:SetAlpha(0)
		arg_1_0.ProgressBar:SetAlpha(0)

		return
	end

	arg_1_0.ChallengeProgress:SetAlpha(1)
	arg_1_0.ProgressBar:SetAlpha(1)

	local var_1_0 = Challenge.GetTypeByLootID(arg_1_1.lootID)
	local var_1_1 = Challenge.GetFileTableByType(var_1_0)
	local var_1_2 = StringTable.BJJBBCJGEJ(var_1_1.file, var_1_1.cols.id, arg_1_1.challengeID)

	assert(var_1_2 ~= -1, "Challenge \"" .. arg_1_1.challengeID .. "\" not defined in \"" .. var_1_1.file .. "\"")

	local var_1_3 = CSV.ReadRow(var_1_1, var_1_2)

	if string.match(var_1_3.amount, "|") then
		local var_1_4 = split(var_1_3.amount, "|")
		local var_1_5 = split(var_1_3.loot, "|")

		for iter_1_0 = 1, #var_1_5 do
			if arg_1_1.lootID == tonumber(var_1_5[iter_1_0]) then
				var_1_3.amount = var_1_4[iter_1_0]

				break
			end
		end
	end

	if arg_1_1.XPReward then
		arg_1_0.ChallengeReward:setText(Engine.CBBHFCGDIC("CAS/CHALLENGE_REWARD_XP", arg_1_1.XPReward))
	end

	local var_1_6 = tonumber(var_1_3.amount)
	local var_1_7

	if LOOT.IsUnlockedWithID(arg_1_0._controllerIndex, arg_1_1.lootID) then
		var_1_7 = var_1_6
	else
		var_1_7 = tonumber(arg_1_1.progress)
	end

	arg_1_0.UnlockCriteria:setText(Engine.CBBHFCGDIC(var_1_3.desc, var_1_6, var_1_3.detailDesc))

	if var_1_6 ~= nil and var_1_7 ~= nil then
		assert(var_1_6 ~= 0)

		if var_1_6 <= var_1_7 then
			arg_1_0.ChallengeProgress:setText(Engine.CBBHFCGDIC("CAS/CHALLENGE_PROGRESS", var_1_6, var_1_6))
		else
			arg_1_0.ChallengeProgress:setText(Engine.CBBHFCGDIC("CAS/CHALLENGE_PROGRESS", var_1_7, var_1_6))
		end

		local var_1_8 = LUI.clamp(var_1_7 / var_1_6, 0, 1)

		arg_1_0.ProgressBar:SetProgress(var_1_8, 0)
	else
		ACTIONS.AnimateSequence(arg_1_0, "NoProgress")
	end

	if IsLanguageArabic() then
		arg_1_0.UnlockCriteria:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 29, _1080p * -24, _1080p * 56, _1080p * 80)
		arg_1_0.ChallengeProgress:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 29, _1080p * -24, _1080p * 96, _1080p * 124)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	ACTIONS.AnimateSequence(arg_2_0, "NoProgress")
	arg_2_0.UnlockCriteria:setText(arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_1.challengeID and #arg_3_1.challengeID > 0 then
		var_0_0(arg_3_0, arg_3_1)
	else
		arg_3_0.ChallengeProgress:SetAlpha(0)
		arg_3_0.ProgressBar:SetAlpha(0)

		if arg_3_1.level then
			arg_3_0.UnlockCriteria:setText(PROGRESSION.GetUnlockTextWithRank(arg_3_1.level))
		end
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.ChallengeReward)

	arg_4_0.Setup = var_0_2
	arg_4_0.SetupChallenge = var_0_0
	arg_4_0.SetupUnlockCriteria = var_0_1
	arg_4_0._controllerIndex = arg_4_1
end

function UnlockRequirements(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 130 * _1080p)

	var_5_0.id = "UnlockRequirements"
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

	var_5_4.id = "UnlockCriteria"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_4:setText("", 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_4:SetAlignment(LUI.Alignment.Left)
	var_5_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_4:SetStartupDelay(2000)
	var_5_4:SetLineHoldTime(400)
	var_5_4:SetAnimMoveTime(2000)
	var_5_4:SetAnimMoveSpeed(140)
	var_5_4:SetEndDelay(2000)
	var_5_4:SetCrossfadeTime(1000)
	var_5_4:SetFadeInTime(300)
	var_5_4:SetFadeOutTime(300)
	var_5_4:SetMaxVisibleLines(1)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 396, _1080p * 58, _1080p * 78)
	var_5_0:addElement(var_5_4)

	var_5_0.UnlockCriteria = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIText.new()

	var_5_6.id = "ChallengeProgress"

	var_5_6:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_6:setText(Engine.CBBHFCGDIC("CAS/CHALLENGE_PROGRESS"), 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 29, _1080p * -24, _1080p * 96, _1080p * 120)
	var_5_0:addElement(var_5_6)

	var_5_0.ChallengeProgress = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "ProgressBar"

	var_5_8.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_8.Overlay:SetAlpha(0.6, 0)
	var_5_8.Fill:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 29, _1080p * -24, _1080p * 83, _1080p * 93)
	var_5_0:addElement(var_5_8)

	var_5_0.ProgressBar = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "Header"

	var_5_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/UNLOCK_REQUIREMENTS")), 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_5_0:addElement(var_5_10)

	var_5_0.Header = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIText.new()

	var_5_12.id = "Reward"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_12:SetAlpha(0, 0)
	var_5_12:setText(Engine.CBBHFCGDIC("CAS/ATTACH_CHALLENGE_REWARD"), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Right)
	var_5_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -155, _1080p * -24, _1080p * 58, _1080p * 79)
	var_5_0:addElement(var_5_12)

	var_5_0.Reward = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIText.new()

	var_5_14.id = "ChallengeReward"

	var_5_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_14:SetAlpha(0, 0)
	var_5_14:setText("", 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Right)
	var_5_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -155, _1080p * -24, _1080p * 83, _1080p * 104)
	var_5_0:addElement(var_5_14)

	var_5_0.ChallengeReward = var_5_14

	local function var_5_15()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16
	local var_5_17 = {}

	var_5_4:RegisterAnimationSequence("Level", var_5_17)

	local var_5_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Level", var_5_18)

	local function var_5_19()
		var_5_4:AnimateSequence("Level")
		var_5_6:AnimateSequence("Level")
	end

	var_5_0._sequences.Level = var_5_19

	local var_5_20
	local var_5_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120
		}
	}

	var_5_6:RegisterAnimationSequence("Unlock", var_5_21)

	local var_5_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 93
		}
	}

	var_5_8:RegisterAnimationSequence("Unlock", var_5_22)

	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("CAS/UNLOCK_REQUIREMENTS")),
			child = var_5_0.Header.Text
		}
	}

	var_5_10:RegisterAnimationSequence("Unlock", var_5_23)

	local var_5_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Unlock", var_5_24)

	local var_5_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("Unlock", var_5_25)

	local function var_5_26()
		var_5_6:AnimateSequence("Unlock")
		var_5_8:AnimateSequence("Unlock")
		var_5_10:AnimateSequence("Unlock")
		var_5_12:AnimateSequence("Unlock")
		var_5_14:AnimateSequence("Unlock")
	end

	var_5_0._sequences.Unlock = var_5_26

	local var_5_27
	local var_5_28 = {}

	var_5_4:RegisterAnimationSequence("Challenge", var_5_28)

	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 154
		}
	}

	var_5_6:RegisterAnimationSequence("Challenge", var_5_29)

	local var_5_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 117
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 127
		}
	}

	var_5_8:RegisterAnimationSequence("Challenge", var_5_30)

	local var_5_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("CAS/ATTACHMENT_CHALLENGE")),
			child = var_5_0.Header.Text
		}
	}

	var_5_10:RegisterAnimationSequence("Challenge", var_5_31)

	local var_5_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Challenge", var_5_32)

	local var_5_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("Challenge", var_5_33)

	local function var_5_34()
		var_5_4:AnimateSequence("Challenge")
		var_5_6:AnimateSequence("Challenge")
		var_5_8:AnimateSequence("Challenge")
		var_5_10:AnimateSequence("Challenge")
		var_5_12:AnimateSequence("Challenge")
		var_5_14:AnimateSequence("Challenge")
	end

	var_5_0._sequences.Challenge = var_5_34

	local var_5_35
	local var_5_36 = {}

	var_5_4:RegisterAnimationSequence("NoProgress", var_5_36)

	local var_5_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("NoProgress", var_5_37)

	local var_5_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("NoProgress", var_5_38)

	local function var_5_39()
		var_5_4:AnimateSequence("NoProgress")
		var_5_6:AnimateSequence("NoProgress")
		var_5_8:AnimateSequence("NoProgress")
	end

	var_5_0._sequences.NoProgress = var_5_39

	local var_5_40
	local var_5_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 138
		}
	}

	var_5_6:RegisterAnimationSequence("UnlockTwoLines", var_5_41)

	local var_5_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 111
		}
	}

	var_5_8:RegisterAnimationSequence("UnlockTwoLines", var_5_42)

	local var_5_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("CAS/UNLOCK_REQUIREMENTS")),
			child = var_5_0.Header.Text
		}
	}

	var_5_10:RegisterAnimationSequence("UnlockTwoLines", var_5_43)

	local var_5_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("UnlockTwoLines", var_5_44)

	local var_5_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("UnlockTwoLines", var_5_45)

	local function var_5_46()
		var_5_6:AnimateSequence("UnlockTwoLines")
		var_5_8:AnimateSequence("UnlockTwoLines")
		var_5_10:AnimateSequence("UnlockTwoLines")
		var_5_12:AnimateSequence("UnlockTwoLines")
		var_5_14:AnimateSequence("UnlockTwoLines")
	end

	var_5_0._sequences.UnlockTwoLines = var_5_46

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("UnlockRequirements", UnlockRequirements)
LockTable(_M)
