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
	if not arg_3_0._seasonalEventSetup then
		arg_3_0._seasonalEventSetup = true

		arg_3_0.SeasonalEventFullChallengeProgressPanel:Setup()
	end

	ACTIONS.AnimateSequence(arg_3_0, "SeasonalEvent")
	arg_3_0.UnlockCriteria:setText(arg_3_1)
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_1.challengeID and #arg_4_1.challengeID > 0 then
		var_0_0(arg_4_0, arg_4_1)
	else
		arg_4_0.ChallengeProgress:SetAlpha(0)
		arg_4_0.ProgressBar:SetAlpha(0)

		if arg_4_1.level then
			arg_4_0.UnlockCriteria:setText(PROGRESSION.GetUnlockTextWithRank(arg_4_1.level))
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.ChallengeReward)

	arg_5_0.Setup = var_0_3
	arg_5_0.SetupChallenge = var_0_0
	arg_5_0.SetupUnlockCriteria = var_0_1
	arg_5_0.SetupSeasonalEvent = var_0_2
	arg_5_0._controllerIndex = arg_5_1
end

function UnlockRequirements(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 130 * _1080p)

	var_6_0.id = "UnlockRequirements"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIStyledText.new()

	var_6_4.id = "UnlockCriteria"

	var_6_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_4:setText("", 0)
	var_6_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_4:SetAlignment(LUI.Alignment.Left)
	var_6_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_6_4:SetStartupDelay(2000)
	var_6_4:SetLineHoldTime(400)
	var_6_4:SetAnimMoveTime(2000)
	var_6_4:SetAnimMoveSpeed(140)
	var_6_4:SetEndDelay(2000)
	var_6_4:SetCrossfadeTime(1000)
	var_6_4:SetFadeInTime(300)
	var_6_4:SetFadeOutTime(300)
	var_6_4:SetMaxVisibleLines(1)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 396, _1080p * 58, _1080p * 78)
	var_6_0:addElement(var_6_4)

	var_6_0.UnlockCriteria = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "ChallengeProgress"

	var_6_6:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_6_6:setText(Engine.CBBHFCGDIC("CAS/CHALLENGE_PROGRESS"), 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 29, _1080p * -24, _1080p * 96, _1080p * 120)
	var_6_0:addElement(var_6_6)

	var_6_0.ChallengeProgress = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "ProgressBar"

	var_6_8.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_8.Overlay:SetAlpha(0.6, 0)
	var_6_8.Fill:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 29, _1080p * -24, _1080p * 83, _1080p * 93)
	var_6_0:addElement(var_6_8)

	var_6_0.ProgressBar = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "Header"

	var_6_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CAS/UNLOCK_REQUIREMENTS")), 0)
	var_6_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_6_0:addElement(var_6_10)

	var_6_0.Header = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIText.new()

	var_6_12.id = "Reward"

	var_6_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_12:SetAlpha(0, 0)
	var_6_12:setText(Engine.CBBHFCGDIC("CAS/ATTACH_CHALLENGE_REWARD"), 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_12:SetAlignment(LUI.Alignment.Right)
	var_6_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -155, _1080p * -24, _1080p * 58, _1080p * 79)
	var_6_0:addElement(var_6_12)

	var_6_0.Reward = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIText.new()

	var_6_14.id = "ChallengeReward"

	var_6_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_14:SetAlpha(0, 0)
	var_6_14:setText("", 0)
	var_6_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_14:SetAlignment(LUI.Alignment.Right)
	var_6_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -155, _1080p * -24, _1080p * 83, _1080p * 104)
	var_6_0:addElement(var_6_14)

	var_6_0.ChallengeReward = var_6_14

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("SeasonalEventFullChallengeProgressPanel", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "SeasonalEventFullChallengeProgressPanel"

	var_6_16:SetAlpha(0, 0)
	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -15, _1080p * 497, _1080p * 90, _1080p * 192)
	var_6_0:addElement(var_6_16)

	var_6_0.SeasonalEventFullChallengeProgressPanel = var_6_16

	local function var_6_17()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_17

	local var_6_18
	local var_6_19 = {}

	var_6_4:RegisterAnimationSequence("Level", var_6_19)

	local var_6_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Level", var_6_20)

	local var_6_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("Level", var_6_21)

	local function var_6_22()
		var_6_4:AnimateSequence("Level")
		var_6_6:AnimateSequence("Level")
		var_6_16:AnimateSequence("Level")
	end

	var_6_0._sequences.Level = var_6_22

	local var_6_23
	local var_6_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Unlock", var_6_24)

	local var_6_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 120
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Unlock", var_6_25)

	local var_6_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 93
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Unlock", var_6_26)

	local var_6_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("CAS/UNLOCK_REQUIREMENTS")),
			child = var_6_0.Header.Text
		}
	}

	var_6_10:RegisterAnimationSequence("Unlock", var_6_27)

	local var_6_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Unlock", var_6_28)

	local var_6_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("Unlock", var_6_29)

	local var_6_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("Unlock", var_6_30)

	local function var_6_31()
		var_6_4:AnimateSequence("Unlock")
		var_6_6:AnimateSequence("Unlock")
		var_6_8:AnimateSequence("Unlock")
		var_6_10:AnimateSequence("Unlock")
		var_6_12:AnimateSequence("Unlock")
		var_6_14:AnimateSequence("Unlock")
		var_6_16:AnimateSequence("Unlock")
	end

	var_6_0._sequences.Unlock = var_6_31

	local var_6_32
	local var_6_33 = {}

	var_6_4:RegisterAnimationSequence("Challenge", var_6_33)

	local var_6_34 = {
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

	var_6_6:RegisterAnimationSequence("Challenge", var_6_34)

	local var_6_35 = {
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

	var_6_8:RegisterAnimationSequence("Challenge", var_6_35)

	local var_6_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("CAS/ATTACHMENT_CHALLENGE")),
			child = var_6_0.Header.Text
		}
	}

	var_6_10:RegisterAnimationSequence("Challenge", var_6_36)

	local var_6_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Challenge", var_6_37)

	local var_6_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("Challenge", var_6_38)

	local var_6_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("Challenge", var_6_39)

	local function var_6_40()
		var_6_4:AnimateSequence("Challenge")
		var_6_6:AnimateSequence("Challenge")
		var_6_8:AnimateSequence("Challenge")
		var_6_10:AnimateSequence("Challenge")
		var_6_12:AnimateSequence("Challenge")
		var_6_14:AnimateSequence("Challenge")
		var_6_16:AnimateSequence("Challenge")
	end

	var_6_0._sequences.Challenge = var_6_40

	local var_6_41
	local var_6_42 = {}

	var_6_4:RegisterAnimationSequence("NoProgress", var_6_42)

	local var_6_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("NoProgress", var_6_43)

	local var_6_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("NoProgress", var_6_44)

	local var_6_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("NoProgress", var_6_45)

	local function var_6_46()
		var_6_4:AnimateSequence("NoProgress")
		var_6_6:AnimateSequence("NoProgress")
		var_6_8:AnimateSequence("NoProgress")
		var_6_16:AnimateSequence("NoProgress")
	end

	var_6_0._sequences.NoProgress = var_6_46

	local var_6_47
	local var_6_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("UnlockTwoLines", var_6_48)

	local var_6_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 138
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("UnlockTwoLines", var_6_49)

	local var_6_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 111
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("UnlockTwoLines", var_6_50)

	local var_6_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("CAS/UNLOCK_REQUIREMENTS")),
			child = var_6_0.Header.Text
		}
	}

	var_6_10:RegisterAnimationSequence("UnlockTwoLines", var_6_51)

	local var_6_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("UnlockTwoLines", var_6_52)

	local var_6_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("UnlockTwoLines", var_6_53)

	local var_6_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("UnlockTwoLines", var_6_54)

	local function var_6_55()
		var_6_4:AnimateSequence("UnlockTwoLines")
		var_6_6:AnimateSequence("UnlockTwoLines")
		var_6_8:AnimateSequence("UnlockTwoLines")
		var_6_10:AnimateSequence("UnlockTwoLines")
		var_6_12:AnimateSequence("UnlockTwoLines")
		var_6_14:AnimateSequence("UnlockTwoLines")
		var_6_16:AnimateSequence("UnlockTwoLines")
	end

	var_6_0._sequences.UnlockTwoLines = var_6_55

	local var_6_56
	local var_6_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("NoProgressAvailableWarzone", var_6_57)

	local var_6_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("NoProgressAvailableWarzone", var_6_58)

	local var_6_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("NoProgressAvailableWarzone", var_6_59)

	local var_6_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("NoProgressAvailableWarzone", var_6_60)

	local function var_6_61()
		var_6_4:AnimateSequence("NoProgressAvailableWarzone")
		var_6_6:AnimateSequence("NoProgressAvailableWarzone")
		var_6_8:AnimateSequence("NoProgressAvailableWarzone")
		var_6_16:AnimateSequence("NoProgressAvailableWarzone")
	end

	var_6_0._sequences.NoProgressAvailableWarzone = var_6_61

	local var_6_62
	local var_6_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("SeasonalEvent", var_6_63)

	local var_6_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("SeasonalEvent", var_6_64)

	local var_6_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("SeasonalEvent", var_6_65)

	local var_6_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("SeasonalEvent", var_6_66)

	local function var_6_67()
		var_6_4:AnimateSequence("SeasonalEvent")
		var_6_6:AnimateSequence("SeasonalEvent")
		var_6_8:AnimateSequence("SeasonalEvent")
		var_6_16:AnimateSequence("SeasonalEvent")
	end

	var_6_0._sequences.SeasonalEvent = var_6_67

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("UnlockRequirements", UnlockRequirements)
LockTable(_M)
