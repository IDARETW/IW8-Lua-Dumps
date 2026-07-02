module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function LeaderboardRankField(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 130 * _1080p, 0, 40 * _1080p)

	var_2_0.id = "LeaderboardRankField"
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

	var_2_4.id = "RankIcon"

	var_2_4:SetAlpha(0.75, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 9, _1080p * 33, _1080p * -12, _1080p * 12)
	var_2_0:addElement(var_2_4)

	var_2_0.RankIcon = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "RankDisplay"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_6:SetAlpha(0.75, 0)
	var_2_6:setText("99", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 42, _1080p * -20, _1080p * -11, _1080p * 11)
	var_2_0:addElement(var_2_6)

	var_2_0.RankDisplay = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("Player", var_2_9)

	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Player", var_2_10)

	local function var_2_11()
		var_2_4:AnimateSequence("Player")
		var_2_6:AnimateSequence("Player")
	end

	var_2_0._sequences.Player = var_2_11

	local var_2_12
	local var_2_13 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ButtonOver", var_2_13)

	local var_2_14 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_14)

	local function var_2_15()
		var_2_4:AnimateSequence("ButtonOver")
		var_2_6:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_15

	local var_2_16
	local var_2_17 = {
		{
			value = 0.75,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ButtonUp", var_2_17)

	local var_2_18 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			value = 0.75,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_18)

	local function var_2_19()
		var_2_4:AnimateSequence("ButtonUp")
		var_2_6:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_19

	local var_2_20
	local var_2_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("Disabled", var_2_21)

	local var_2_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Disabled", var_2_22)

	local function var_2_23()
		var_2_4:AnimateSequence("Disabled")
		var_2_6:AnimateSequence("Disabled")
	end

	var_2_0._sequences.Disabled = var_2_23

	local var_2_24
	local var_2_25 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("WZWipSetup", var_2_25)

	local var_2_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipSetup", var_2_26)

	local function var_2_27()
		var_2_4:AnimateSequence("WZWipSetup")
		var_2_6:AnimateSequence("WZWipSetup")
	end

	var_2_0._sequences.WZWipSetup = var_2_27

	local var_2_28
	local var_2_29 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("WZWipButtonOver", var_2_29)

	local var_2_30 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2_Highlight
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipButtonOver", var_2_30)

	local function var_2_31()
		var_2_4:AnimateSequence("WZWipButtonOver")
		var_2_6:AnimateSequence("WZWipButtonOver")
	end

	var_2_0._sequences.WZWipButtonOver = var_2_31

	local var_2_32
	local var_2_33 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("WZWipButtonUp", var_2_33)

	local var_2_34 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipButtonUp", var_2_34)

	local function var_2_35()
		var_2_4:AnimateSequence("WZWipButtonUp")
		var_2_6:AnimateSequence("WZWipButtonUp")
	end

	var_2_0._sequences.WZWipButtonUp = var_2_35

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("LeaderboardRankField", LeaderboardRankField)
LockTable(_M)
