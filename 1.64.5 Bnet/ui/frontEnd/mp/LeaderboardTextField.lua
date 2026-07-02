module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function LeaderboardTextField(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 35 * _1080p)

	var_2_0.id = "LeaderboardTextField"
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

	var_2_4.id = "ColumnTint"

	var_2_4:SetRGBFromInt(0, 0)
	var_2_4:SetAlpha(0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.ColumnTint = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Field"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_6:SetAlpha(0.75, 0)
	var_2_6:setText("N/A", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_6:SetStartupDelay(1000)
	var_2_6:SetLineHoldTime(400)
	var_2_6:SetAnimMoveTime(1000)
	var_2_6:SetAnimMoveSpeed(150)
	var_2_6:SetEndDelay(1000)
	var_2_6:SetCrossfadeTime(1000)
	var_2_6:SetFadeInTime(300)
	var_2_6:SetFadeOutTime(300)
	var_2_6:SetMaxVisibleLines(1)
	var_2_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 7, _1080p * -7, _1080p * -11.5, _1080p * 11.5)
	var_2_0:addElement(var_2_6)

	var_2_0.Field = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
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

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_9)

	local function var_2_10()
		var_2_6:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_10

	local var_2_11
	local var_2_12 = {
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

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_12)

	local function var_2_13()
		var_2_6:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_13

	local var_2_14
	local var_2_15 = {
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

	var_2_6:RegisterAnimationSequence("Player", var_2_15)

	local function var_2_16()
		var_2_6:AnimateSequence("Player")
	end

	var_2_0._sequences.Player = var_2_16

	local var_2_17
	local var_2_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipSetup", var_2_18)

	local function var_2_19()
		var_2_6:AnimateSequence("WZWipSetup")
	end

	var_2_0._sequences.WZWipSetup = var_2_19

	local var_2_20
	local var_2_21 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipButtonOver", var_2_21)

	local function var_2_22()
		var_2_6:AnimateSequence("WZWipButtonOver")
	end

	var_2_0._sequences.WZWipButtonOver = var_2_22

	local var_2_23
	local var_2_24 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipButtonUp", var_2_24)

	local function var_2_25()
		var_2_6:AnimateSequence("WZWipButtonUp")
	end

	var_2_0._sequences.WZWipButtonUp = var_2_25

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("LeaderboardTextField", LeaderboardTextField)
LockTable(_M)
