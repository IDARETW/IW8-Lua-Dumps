module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = "FiveRow"

	if arg_1_0.currentAnimation ~= var_1_0 then
		ACTIONS.AnimateSequence(arg_1_0, var_1_0)
	end

	arg_1_0.currentAnimation = var_1_0

	arg_1_0.BaseField:setText(arg_1_1.name)
	arg_1_0.Field1:setText(arg_1_1.kills)
	arg_1_0.Field2:setText(string.format("%.2f", arg_1_1.kdr))
	arg_1_0.Field3:setText(arg_1_1.headShots)
	arg_1_0.Field4:setText(string.format("%.2f", arg_1_1.accuracy))

	arg_1_0.currentItem = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = "SixRow"

	if arg_2_0.currentAnimation ~= var_2_0 then
		ACTIONS.AnimateSequence(arg_2_0, var_2_0)
	end

	arg_2_0.currentAnimation = var_2_0

	arg_2_0.BaseField:setText(arg_2_1.name)
	arg_2_0.Field1:setText(arg_2_1.score)
	arg_2_0.Field2:setText(arg_2_1.timePlayed)
	arg_2_0.Field3:setText(arg_2_1.kills)
	arg_2_0.Field4:setText(string.format("%.2f", arg_2_1.kdr))
	arg_2_0.Field5:setText(string.format("%.2f", arg_2_1.spm))

	arg_2_0.currentItem = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = "TwoRow"

	if arg_3_0.currentAnimation ~= var_3_0 then
		ACTIONS.AnimateSequence(arg_3_0, var_3_0)
	end

	arg_3_0.currentAnimation = var_3_0

	arg_3_0.BaseField:setText(arg_3_1.name)
	arg_3_0.Field1:setText(arg_3_1.extraStat1)

	arg_3_0.currentItem = arg_3_1
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = "TwoRow"

	if arg_4_0.currentAnimation ~= var_4_0 then
		ACTIONS.AnimateSequence(arg_4_0, var_4_0)
	end

	arg_4_0.currentAnimation = var_4_0

	arg_4_0.BaseField:setText(arg_4_1.name)
	arg_4_0.Field1:setText(arg_4_1.uses)

	arg_4_0.currentItem = arg_4_1
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = "TwoRow"

	if arg_5_0.currentAnimation ~= var_5_0 then
		ACTIONS.AnimateSequence(arg_5_0, var_5_0)
	end

	arg_5_0.currentAnimation = var_5_0

	arg_5_0.BaseField:setText(arg_5_1.name)
	arg_5_0.Field1:setText(arg_5_1.extraStat1)

	arg_5_0.currentItem = arg_5_1
end

local function var_0_5(arg_6_0, arg_6_1)
	local var_6_0 = "TwoRow"

	if arg_6_0.currentAnimation ~= var_6_0 then
		ACTIONS.AnimateSequence(arg_6_0, var_6_0)
	end

	arg_6_0.currentAnimation = var_6_0

	arg_6_0.BaseField:setText(arg_6_1.name)
	arg_6_0.Field1:setText(arg_6_1.uses)

	arg_6_0.currentItem = arg_6_1
end

local function var_0_6(arg_7_0, arg_7_1)
	local var_7_0 = "TwoRow"

	if arg_7_0.currentAnimation ~= var_7_0 then
		ACTIONS.AnimateSequence(arg_7_0, var_7_0)
	end

	arg_7_0.currentAnimation = var_7_0

	arg_7_0.BaseField:setText(arg_7_1.name)
	arg_7_0.Field1:setText(arg_7_1.kills)

	arg_7_0.currentItem = arg_7_1
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 39 * _1080p)

	arg_8_0.SetupWeaponRowData = var_0_0
	arg_8_0.SetupGameModeRowData = var_0_1
	arg_8_0.SetupLethalRowData = var_0_2
	arg_8_0.SetupTacticalRowData = var_0_3
	arg_8_0.SetupRigRowData = var_0_6
	arg_8_0.SetupLethalStreakRowData = var_0_4
	arg_8_0.SetupSupportStreakRowData = var_0_5

	arg_8_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		arg_9_0:dispatchEventToCurrentMenu({
			name = "update_record_item",
			currentItem = arg_9_0.currentItem
		})
	end)
end

function CombatRecordRow(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 39 * _1080p)

	var_10_0.id = "CombatRecordRow"
	var_10_0._animationSets = {}
	var_10_0._sequences = {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIBlur.new()

	var_10_4.id = "ListBlur"

	var_10_4:SetBlurStrength(1.5, 0)
	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -1)
	var_10_0:addElement(var_10_4)

	var_10_0.ListBlur = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "Background"

	var_10_6:SetRGBFromInt(0, 0)
	var_10_6:SetAlpha(0.5, 0)
	var_10_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -1)
	var_10_0:addElement(var_10_6)

	var_10_0.Background = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "HighlightBar"

	var_10_8:SetAlpha(0, 0)
	var_10_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 6, 0, 0, 0)
	var_10_0:addElement(var_10_8)

	var_10_0.HighlightBar = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "RowTint"

	var_10_10:SetRGBFromInt(0, 0)
	var_10_10:SetAlpha(0.15, 0)
	var_10_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -1)
	var_10_0:addElement(var_10_10)

	var_10_0.RowTint = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIImage.new()

	var_10_12.id = "Cap"

	var_10_12:SetRGBFromInt(14277081, 0)
	var_10_12:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 6, 0, _1080p * -1)
	var_10_0:addElement(var_10_12)

	var_10_0.Cap = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("GenericButtonSelection", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "GenericButtonSelection"

	var_10_14:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -1)
	var_10_0:addElement(var_10_14)

	var_10_0.GenericButtonSelection = var_10_14

	local var_10_15
	local var_10_16 = LUI.UIStyledText.new()

	var_10_16.id = "Field1"

	var_10_16:SetRGBFromTable(SWATCHES.combatRecord.upRow, 0)
	var_10_16:setText("", 0)
	var_10_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_16:SetAlignment(LUI.Alignment.Center)
	var_10_16:SetStartupDelay(1000)
	var_10_16:SetLineHoldTime(400)
	var_10_16:SetAnimMoveTime(150)
	var_10_16:SetEndDelay(1000)
	var_10_16:SetCrossfadeTime(400)
	var_10_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_16:SetMaxVisibleLines(1)
	var_10_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -757, _1080p * -643, _1080p * 8, _1080p * 28)
	var_10_0:addElement(var_10_16)

	var_10_0.Field1 = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIStyledText.new()

	var_10_18.id = "Field2"

	var_10_18:setText("", 0)
	var_10_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_18:SetAlignment(LUI.Alignment.Center)
	var_10_18:SetStartupDelay(1000)
	var_10_18:SetLineHoldTime(400)
	var_10_18:SetAnimMoveTime(150)
	var_10_18:SetEndDelay(1000)
	var_10_18:SetCrossfadeTime(400)
	var_10_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_18:SetMaxVisibleLines(1)
	var_10_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -631, _1080p * -517, _1080p * 8, _1080p * 28)
	var_10_0:addElement(var_10_18)

	var_10_0.Field2 = var_10_18

	local var_10_19
	local var_10_20 = LUI.UIStyledText.new()

	var_10_20.id = "Field3"

	var_10_20:setText("", 0)
	var_10_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_20:SetAlignment(LUI.Alignment.Center)
	var_10_20:SetStartupDelay(1000)
	var_10_20:SetLineHoldTime(400)
	var_10_20:SetAnimMoveTime(150)
	var_10_20:SetEndDelay(1000)
	var_10_20:SetCrossfadeTime(400)
	var_10_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_20:SetMaxVisibleLines(1)
	var_10_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -505, _1080p * -392, _1080p * 8, _1080p * 28)
	var_10_0:addElement(var_10_20)

	var_10_0.Field3 = var_10_20

	local var_10_21
	local var_10_22 = LUI.UIStyledText.new()

	var_10_22.id = "Field4"

	var_10_22:setText("", 0)
	var_10_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_22:SetAlignment(LUI.Alignment.Center)
	var_10_22:SetStartupDelay(1000)
	var_10_22:SetLineHoldTime(400)
	var_10_22:SetAnimMoveTime(150)
	var_10_22:SetEndDelay(1000)
	var_10_22:SetCrossfadeTime(400)
	var_10_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_22:SetMaxVisibleLines(1)
	var_10_22:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -378, _1080p * -264, _1080p * 8, _1080p * 28)
	var_10_0:addElement(var_10_22)

	var_10_0.Field4 = var_10_22

	local var_10_23
	local var_10_24 = LUI.UIStyledText.new()

	var_10_24.id = "Field5"

	var_10_24:setText("", 0)
	var_10_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_24:SetAlignment(LUI.Alignment.Center)
	var_10_24:SetStartupDelay(1000)
	var_10_24:SetLineHoldTime(400)
	var_10_24:SetAnimMoveTime(150)
	var_10_24:SetEndDelay(1000)
	var_10_24:SetCrossfadeTime(400)
	var_10_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_24:SetMaxVisibleLines(1)
	var_10_24:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -253, _1080p * -139, _1080p * 8, _1080p * 28)
	var_10_0:addElement(var_10_24)

	var_10_0.Field5 = var_10_24

	local var_10_25
	local var_10_26 = LUI.UIStyledText.new()

	var_10_26.id = "Field6"

	var_10_26:setText("", 0)
	var_10_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_26:SetAlignment(LUI.Alignment.Center)
	var_10_26:SetStartupDelay(1000)
	var_10_26:SetLineHoldTime(400)
	var_10_26:SetAnimMoveTime(150)
	var_10_26:SetEndDelay(1000)
	var_10_26:SetCrossfadeTime(400)
	var_10_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_26:SetMaxVisibleLines(1)
	var_10_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -127, _1080p * -13, _1080p * 8, _1080p * 28)
	var_10_0:addElement(var_10_26)

	var_10_0.Field6 = var_10_26

	local var_10_27
	local var_10_28 = LUI.UIStyledText.new()

	var_10_28.id = "BaseField"

	var_10_28:setText("", 0)
	var_10_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_28:SetAlignment(LUI.Alignment.Left)
	var_10_28:SetStartupDelay(1000)
	var_10_28:SetLineHoldTime(400)
	var_10_28:SetAnimMoveTime(150)
	var_10_28:SetEndDelay(1000)
	var_10_28:SetCrossfadeTime(400)
	var_10_28:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_28:SetMaxVisibleLines(1)
	var_10_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 230, _1080p * 8, _1080p * 28)
	var_10_0:addElement(var_10_28)

	var_10_0.BaseField = var_10_28

	local function var_10_29()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_29

	local var_10_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOver", var_10_30)

	local var_10_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.highlightRow
		}
	}

	var_10_16:RegisterAnimationSequence("ButtonOver", var_10_31)

	local var_10_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.highlightRow
		}
	}

	var_10_18:RegisterAnimationSequence("ButtonOver", var_10_32)

	local var_10_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.highlightRow
		}
	}

	var_10_20:RegisterAnimationSequence("ButtonOver", var_10_33)

	local var_10_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.highlightRow
		}
	}

	var_10_22:RegisterAnimationSequence("ButtonOver", var_10_34)

	local var_10_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.highlightRow
		}
	}

	var_10_24:RegisterAnimationSequence("ButtonOver", var_10_35)

	local var_10_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.highlightRow
		}
	}

	var_10_26:RegisterAnimationSequence("ButtonOver", var_10_36)

	local var_10_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.highlightRow
		}
	}

	var_10_28:RegisterAnimationSequence("ButtonOver", var_10_37)

	local function var_10_38()
		var_10_8:AnimateSequence("ButtonOver")
		var_10_16:AnimateSequence("ButtonOver")
		var_10_18:AnimateSequence("ButtonOver")
		var_10_20:AnimateSequence("ButtonOver")
		var_10_22:AnimateSequence("ButtonOver")
		var_10_24:AnimateSequence("ButtonOver")
		var_10_26:AnimateSequence("ButtonOver")
		var_10_28:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_38

	local var_10_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUp", var_10_39)

	local var_10_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.upRow
		}
	}

	var_10_16:RegisterAnimationSequence("ButtonUp", var_10_40)

	local var_10_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.upRow
		}
	}

	var_10_18:RegisterAnimationSequence("ButtonUp", var_10_41)

	local var_10_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.upRow
		}
	}

	var_10_20:RegisterAnimationSequence("ButtonUp", var_10_42)

	local var_10_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.upRow
		}
	}

	var_10_22:RegisterAnimationSequence("ButtonUp", var_10_43)

	local var_10_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.upRow
		}
	}

	var_10_24:RegisterAnimationSequence("ButtonUp", var_10_44)

	local var_10_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.upRow
		}
	}

	var_10_26:RegisterAnimationSequence("ButtonUp", var_10_45)

	local var_10_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.combatRecord.upRow
		}
	}

	var_10_28:RegisterAnimationSequence("ButtonUp", var_10_46)

	local function var_10_47()
		var_10_8:AnimateSequence("ButtonUp")
		var_10_16:AnimateSequence("ButtonUp")
		var_10_18:AnimateSequence("ButtonUp")
		var_10_20:AnimateSequence("ButtonUp")
		var_10_22:AnimateSequence("ButtonUp")
		var_10_24:AnimateSequence("ButtonUp")
		var_10_26:AnimateSequence("ButtonUp")
		var_10_28:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_47

	local var_10_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -758
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -580
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_16:RegisterAnimationSequence("FiveRow", var_10_48)

	local var_10_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -568
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -392
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_18:RegisterAnimationSequence("FiveRow", var_10_49)

	local var_10_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -379
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -202
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_20:RegisterAnimationSequence("FiveRow", var_10_50)

	local var_10_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_22:RegisterAnimationSequence("FiveRow", var_10_51)

	local var_10_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("FiveRow", var_10_52)

	local var_10_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_26:RegisterAnimationSequence("FiveRow", var_10_53)

	local function var_10_54()
		var_10_16:AnimateSequence("FiveRow")
		var_10_18:AnimateSequence("FiveRow")
		var_10_20:AnimateSequence("FiveRow")
		var_10_22:AnimateSequence("FiveRow")
		var_10_24:AnimateSequence("FiveRow")
		var_10_26:AnimateSequence("FiveRow")
	end

	var_10_0._sequences.FiveRow = var_10_54

	local var_10_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -757
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -643
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_16:RegisterAnimationSequence("SevenRow", var_10_55)

	local var_10_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -631
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -517
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_18:RegisterAnimationSequence("SevenRow", var_10_56)

	local var_10_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -505
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -391
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_20:RegisterAnimationSequence("SevenRow", var_10_57)

	local var_10_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -379
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -265
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_22:RegisterAnimationSequence("SevenRow", var_10_58)

	local var_10_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -253
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -139
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_24:RegisterAnimationSequence("SevenRow", var_10_59)

	local var_10_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -127
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_26:RegisterAnimationSequence("SevenRow", var_10_60)

	local function var_10_61()
		var_10_16:AnimateSequence("SevenRow")
		var_10_18:AnimateSequence("SevenRow")
		var_10_20:AnimateSequence("SevenRow")
		var_10_22:AnimateSequence("SevenRow")
		var_10_24:AnimateSequence("SevenRow")
		var_10_26:AnimateSequence("SevenRow")
	end

	var_10_0._sequences.SevenRow = var_10_61

	local var_10_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -758
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -617
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_16:RegisterAnimationSequence("SixRow", var_10_62)

	local var_10_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -607
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -466
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_18:RegisterAnimationSequence("SixRow", var_10_63)

	local var_10_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -456
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -315
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_20:RegisterAnimationSequence("SixRow", var_10_64)

	local var_10_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -305
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -164
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_22:RegisterAnimationSequence("SixRow", var_10_65)

	local var_10_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -154
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_24:RegisterAnimationSequence("SixRow", var_10_66)

	local var_10_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -154
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_26:RegisterAnimationSequence("SixRow", var_10_67)

	local var_10_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 231
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_28:RegisterAnimationSequence("SixRow", var_10_68)

	local function var_10_69()
		var_10_16:AnimateSequence("SixRow")
		var_10_18:AnimateSequence("SixRow")
		var_10_20:AnimateSequence("SixRow")
		var_10_22:AnimateSequence("SixRow")
		var_10_24:AnimateSequence("SixRow")
		var_10_26:AnimateSequence("SixRow")
		var_10_28:AnimateSequence("SixRow")
	end

	var_10_0._sequences.SixRow = var_10_69

	local var_10_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -339
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_16:RegisterAnimationSequence("TwoRow", var_10_70)

	local var_10_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("TwoRow", var_10_71)

	local var_10_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("TwoRow", var_10_72)

	local var_10_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_22:RegisterAnimationSequence("TwoRow", var_10_73)

	local var_10_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("TwoRow", var_10_74)

	local var_10_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_26:RegisterAnimationSequence("TwoRow", var_10_75)

	local var_10_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 393
		},
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_10_28:RegisterAnimationSequence("TwoRow", var_10_76)

	local function var_10_77()
		var_10_16:AnimateSequence("TwoRow")
		var_10_18:AnimateSequence("TwoRow")
		var_10_20:AnimateSequence("TwoRow")
		var_10_22:AnimateSequence("TwoRow")
		var_10_24:AnimateSequence("TwoRow")
		var_10_26:AnimateSequence("TwoRow")
		var_10_28:AnimateSequence("TwoRow")
	end

	var_10_0._sequences.TwoRow = var_10_77

	var_10_0:addEventHandler("button_over", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonOver")
	end)
	var_10_0:addEventHandler("button_up", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonUp")
	end)
	var_0_7(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("CombatRecordRow", CombatRecordRow)
LockTable(_M)
