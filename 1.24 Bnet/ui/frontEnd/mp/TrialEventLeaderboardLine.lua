module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Region:setText(Engine.JCBDICCAH(arg_1_1[TRIALS.EventDvarColumns.COUNTRY_CODE]))
	arg_1_0.Bronze:setText(Engine.JCBDICCAH(arg_1_1[TRIALS.EventDvarColumns.BRONZE]))
	arg_1_0.Silver:setText(Engine.JCBDICCAH(arg_1_1[TRIALS.EventDvarColumns.SILVER]))
	arg_1_0.Gold:setText(Engine.JCBDICCAH(arg_1_1[TRIALS.EventDvarColumns.GOLD]))

	local var_1_0 = arg_1_1[TRIALS.EventDvarColumns.GOLD] + arg_1_1[TRIALS.EventDvarColumns.SILVER] + arg_1_1[TRIALS.EventDvarColumns.BRONZE]

	arg_1_0.Total:setText(Engine.JCBDICCAH(var_1_0))
	arg_1_0.Flag:setImage(arg_1_1.material)
end

local function var_0_1(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, "BigEntryNoData")
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
	arg_7_0.FillData = var_0_0
	arg_7_0.SetAsBigWithoutData = var_0_1
	arg_7_0.SetAsSmall = var_0_2
	arg_7_0.SetPositionField = var_0_4
	arg_7_0.SetHeight = var_0_3
	arg_7_0.SetAsDebugFlag = var_0_5
end

function TrialEventLeaderboardLine(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1024 * _1080p, 0, 60 * _1080p)

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

	var_8_4:SetRGBFromInt(5264470, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Flag"

	var_8_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 135, _1080p * 361, 0, 0)
	var_8_0:addElement(var_8_6)

	var_8_0.Flag = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "RegionBackground"

	var_8_8:SetRGBFromInt(3947580, 0)
	var_8_8:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 135, _1080p * 361, _1080p * 15, _1080p * 45)
	var_8_0:addElement(var_8_8)

	var_8_0.RegionBackground = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "Position"

	var_8_10:setText("", 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 103, _1080p * -15, _1080p * 15)
	var_8_0:addElement(var_8_10)

	var_8_0.Position = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIText.new()

	var_8_12.id = "Region"

	var_8_12:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_8_12:setText("", 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetAlignment(LUI.Alignment.Center)
	var_8_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 135, _1080p * 361, _1080p * -15, _1080p * 15)
	var_8_0:addElement(var_8_12)

	var_8_0.Region = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIText.new()

	var_8_14.id = "Gold"

	var_8_14:setText("", 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_14:SetAlignment(LUI.Alignment.Left)
	var_8_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 410, _1080p * 555, _1080p * -9, _1080p * 9)
	var_8_0:addElement(var_8_14)

	var_8_0.Gold = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIText.new()

	var_8_16.id = "Silver"

	var_8_16:setText("", 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_16:SetAlignment(LUI.Alignment.Left)
	var_8_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 569, _1080p * 732, _1080p * -9, _1080p * 9)
	var_8_0:addElement(var_8_16)

	var_8_0.Silver = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIText.new()

	var_8_18.id = "Bronze"

	var_8_18:setText("", 0)
	var_8_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_18:SetAlignment(LUI.Alignment.Left)
	var_8_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 719, _1080p * 858, _1080p * -9, _1080p * 9)
	var_8_0:addElement(var_8_18)

	var_8_0.Bronze = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIText.new()

	var_8_20.id = "Total"

	var_8_20:setText("", 0)
	var_8_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_20:SetAlignment(LUI.Alignment.Left)
	var_8_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 894, _1080p * 1020, _1080p * -12, _1080p * 12)
	var_8_0:addElement(var_8_20)

	var_8_0.Total = var_8_20

	local function var_8_21()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_21

	local var_8_22
	local var_8_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("BottomEntries", var_8_23)

	local var_8_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("BottomEntries", var_8_24)

	local var_8_25 = {}

	var_8_10:RegisterAnimationSequence("BottomEntries", var_8_25)

	local function var_8_26()
		var_8_6:AnimateSequence("BottomEntries")
		var_8_8:AnimateSequence("BottomEntries")
		var_8_10:AnimateSequence("BottomEntries")
	end

	var_8_0._sequences.BottomEntries = var_8_26

	local var_8_27
	local var_8_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("BigEntryNoData", var_8_28)

	local var_8_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("BigEntryNoData", var_8_29)

	local function var_8_30()
		var_8_6:AnimateSequence("BigEntryNoData")
		var_8_8:AnimateSequence("BigEntryNoData")
	end

	var_8_0._sequences.BigEntryNoData = var_8_30

	local var_8_31
	local var_8_32 = {
		{
			value = 16150271,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_6:RegisterAnimationSequence("DebugFlagColor", var_8_32)

	local function var_8_33()
		var_8_6:AnimateSequence("DebugFlagColor")
	end

	var_8_0._sequences.DebugFlagColor = var_8_33

	var_0_6(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("TrialEventLeaderboardLine", TrialEventLeaderboardLine)
LockTable(_M)
