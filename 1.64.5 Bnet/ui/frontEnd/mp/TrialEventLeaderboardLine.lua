module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Background:SetRGBFromTable(arg_1_1 % 2 == 0 and COLORS.black or COLORS.white)
	arg_1_0.Region:setText(Engine.JCBDICCAH(arg_1_2[TRIALS.EventDvarColumns.COUNTRY_CODE]))
	arg_1_0.Bronze:setText(Engine.JCBDICCAH(arg_1_2[TRIALS.EventDvarColumns.BRONZE]))
	arg_1_0.Silver:setText(Engine.JCBDICCAH(arg_1_2[TRIALS.EventDvarColumns.SILVER]))
	arg_1_0.Gold:setText(Engine.JCBDICCAH(arg_1_2[TRIALS.EventDvarColumns.GOLD]))

	local var_1_0 = arg_1_2[TRIALS.EventDvarColumns.GOLD] + arg_1_2[TRIALS.EventDvarColumns.SILVER] + arg_1_2[TRIALS.EventDvarColumns.BRONZE]

	arg_1_0.Total:setText(Engine.JCBDICCAH(var_1_0))
	arg_1_0.Flag:setImage(arg_1_2.material)
end

local function var_0_1(arg_2_0, arg_2_1)
	ACTIONS.AnimateSequence(arg_2_0, "BigEntryNoData")
	arg_2_0.Background:SetRGBFromTable(arg_2_1 % 2 == 0 and COLORS.black or COLORS.white)
	arg_2_0.Region:setText(Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"))
	arg_2_0.Bronze:setText(Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"))
	arg_2_0.Silver:setText(Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"))
	arg_2_0.Gold:setText(Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"))
	arg_2_0.Total:setText(Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"))
end

local function var_0_2(arg_3_0)
	ACTIONS.AnimateSequence(arg_3_0, "BottomEntries")
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, arg_4_1)
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0.Position:setText(arg_5_1)
end

local function var_0_5(arg_6_0)
	ACTIONS.AnimateSequence(arg_6_0, "DebugFlagColor")
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.SetupRow = var_0_0
	arg_7_0.SetWithoutData = var_0_1
	arg_7_0.SetAsSmall = var_0_2
	arg_7_0.SetPositionField = var_0_4
	arg_7_0.SetHeight = var_0_3
	arg_7_0.SetAsDebugFlag = var_0_5
end

function TrialEventLeaderboardLine(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1120 * _1080p, 0, 46 * _1080p)

	var_8_0.id = "TrialEventLeaderboardLine"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Background"

	var_8_4:SetAlpha(0.1, 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 46)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Flag"

	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 137, _1080p * 321, 0, _1080p * 46)
	var_8_0:addElement(var_8_6)

	var_8_0.Flag = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIText.new()

	var_8_8.id = "Position"

	var_8_8:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_8_8:setText("", 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_8:SetAlignment(LUI.Alignment.Left)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 120, _1080p * 8, _1080p * 38)
	var_8_0:addElement(var_8_8)

	var_8_0.Position = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "Region"

	var_8_10:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_8_10:setText("USA", 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Center)
	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 405, _1080p * 458, _1080p * 11, _1080p * 35)
	var_8_0:addElement(var_8_10)

	var_8_0.Region = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIText.new()

	var_8_12.id = "Gold"

	var_8_12:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_8_12:setText("", 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetAlignment(LUI.Alignment.Center)
	var_8_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 550, _1080p * 676, _1080p * 11, _1080p * 35)
	var_8_0:addElement(var_8_12)

	var_8_0.Gold = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIText.new()

	var_8_14.id = "Silver"

	var_8_14:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_8_14:setText("", 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_14:SetAlignment(LUI.Alignment.Center)
	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 692, _1080p * 818, _1080p * 11, _1080p * 35)
	var_8_0:addElement(var_8_14)

	var_8_0.Silver = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIText.new()

	var_8_16.id = "Bronze"

	var_8_16:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_8_16:setText("", 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_16:SetAlignment(LUI.Alignment.Center)
	var_8_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 834, _1080p * 960, _1080p * 11, _1080p * 35)
	var_8_0:addElement(var_8_16)

	var_8_0.Bronze = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIText.new()

	var_8_18.id = "Total"

	var_8_18:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_8_18:setText("2,500,000", 0)
	var_8_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_18:SetAlignment(LUI.Alignment.Center)
	var_8_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 976, _1080p * 1102, _1080p * 11, _1080p * 35)
	var_8_0:addElement(var_8_18)

	var_8_0.Total = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIImage.new()

	var_8_20.id = "Cap"

	var_8_20:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_8_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 6, 0, _1080p * 46)
	var_8_0:addElement(var_8_20)

	var_8_0.Cap = var_8_20

	local function var_8_21()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_21

	local var_8_22
	local var_8_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		}
	}

	var_8_4:RegisterAnimationSequence("BottomEntries", var_8_23)

	local var_8_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 257
		}
	}

	var_8_6:RegisterAnimationSequence("BottomEntries", var_8_24)

	local var_8_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		}
	}

	var_8_8:RegisterAnimationSequence("BottomEntries", var_8_25)

	local var_8_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		}
	}

	var_8_10:RegisterAnimationSequence("BottomEntries", var_8_26)

	local var_8_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		}
	}

	var_8_12:RegisterAnimationSequence("BottomEntries", var_8_27)

	local var_8_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		}
	}

	var_8_14:RegisterAnimationSequence("BottomEntries", var_8_28)

	local var_8_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		}
	}

	var_8_16:RegisterAnimationSequence("BottomEntries", var_8_29)

	local var_8_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		}
	}

	var_8_18:RegisterAnimationSequence("BottomEntries", var_8_30)

	local var_8_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		}
	}

	var_8_20:RegisterAnimationSequence("BottomEntries", var_8_31)

	local function var_8_32()
		var_8_4:AnimateSequence("BottomEntries")
		var_8_6:AnimateSequence("BottomEntries")
		var_8_8:AnimateSequence("BottomEntries")
		var_8_10:AnimateSequence("BottomEntries")
		var_8_12:AnimateSequence("BottomEntries")
		var_8_14:AnimateSequence("BottomEntries")
		var_8_16:AnimateSequence("BottomEntries")
		var_8_18:AnimateSequence("BottomEntries")
		var_8_20:AnimateSequence("BottomEntries")
	end

	var_8_0._sequences.BottomEntries = var_8_32

	local var_8_33
	local var_8_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("BigEntryNoData", var_8_34)

	local var_8_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("BigEntryNoData", var_8_35)

	local var_8_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("BigEntryNoData", var_8_36)

	local var_8_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("BigEntryNoData", var_8_37)

	local var_8_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("BigEntryNoData", var_8_38)

	local var_8_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("BigEntryNoData", var_8_39)

	local function var_8_40()
		var_8_6:AnimateSequence("BigEntryNoData")
		var_8_10:AnimateSequence("BigEntryNoData")
		var_8_12:AnimateSequence("BigEntryNoData")
		var_8_14:AnimateSequence("BigEntryNoData")
		var_8_16:AnimateSequence("BigEntryNoData")
		var_8_18:AnimateSequence("BigEntryNoData")
	end

	var_8_0._sequences.BigEntryNoData = var_8_40

	local var_8_41
	local var_8_42 = {
		{
			value = 16150271,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_6:RegisterAnimationSequence("DebugFlagColor", var_8_42)

	local function var_8_43()
		var_8_6:AnimateSequence("DebugFlagColor")
	end

	var_8_0._sequences.DebugFlagColor = var_8_43

	local var_8_44
	local var_8_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.trialEvent.trialGold
		}
	}

	var_8_8:RegisterAnimationSequence("FirstPlace", var_8_45)

	local var_8_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.trialEvent.trialGold
		}
	}

	var_8_20:RegisterAnimationSequence("FirstPlace", var_8_46)

	local function var_8_47()
		var_8_8:AnimateSequence("FirstPlace")
		var_8_20:AnimateSequence("FirstPlace")
	end

	var_8_0._sequences.FirstPlace = var_8_47

	local var_8_48
	local var_8_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.trialEvent.trialSilver
		}
	}

	var_8_8:RegisterAnimationSequence("SecondPlace", var_8_49)

	local var_8_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.trialEvent.trialSilver
		}
	}

	var_8_20:RegisterAnimationSequence("SecondPlace", var_8_50)

	local function var_8_51()
		var_8_8:AnimateSequence("SecondPlace")
		var_8_20:AnimateSequence("SecondPlace")
	end

	var_8_0._sequences.SecondPlace = var_8_51

	local var_8_52
	local var_8_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.trialEvent.trialBronze
		}
	}

	var_8_8:RegisterAnimationSequence("ThirdPlace", var_8_53)

	local var_8_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.trialEvent.trialBronze
		}
	}

	var_8_20:RegisterAnimationSequence("ThirdPlace", var_8_54)

	local function var_8_55()
		var_8_8:AnimateSequence("ThirdPlace")
		var_8_20:AnimateSequence("ThirdPlace")
	end

	var_8_0._sequences.ThirdPlace = var_8_55

	var_0_6(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("TrialEventLeaderboardLine", TrialEventLeaderboardLine)
LockTable(_M)
