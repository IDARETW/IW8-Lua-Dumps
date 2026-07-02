module(..., package.seeall)

function LeaderboardRankField(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 130 * _1080p, 0, 40 * _1080p)

	var_1_0.id = "LeaderboardRankField"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "RankIcon"

	var_1_4:SetAlpha(0.75, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 9, _1080p * 33, _1080p * -12, _1080p * 12)
	var_1_0:addElement(var_1_4)

	var_1_0.RankIcon = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "RankDisplay"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_1_6:SetAlpha(0.75, 0)
	var_1_6:setText("99", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 42, _1080p * -20, _1080p * -11, _1080p * 11)
	var_1_0:addElement(var_1_6)

	var_1_0.RankDisplay = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8
	local var_1_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Player", var_1_9)

	local var_1_10 = {
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

	var_1_6:RegisterAnimationSequence("Player", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("Player")
		var_1_6:AnimateSequence("Player")
	end

	var_1_0._sequences.Player = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_13)

	local var_1_14 = {
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

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_14)

	local function var_1_15()
		var_1_4:AnimateSequence("ButtonOver")
		var_1_6:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_15

	local var_1_16
	local var_1_17 = {
		{
			value = 0.75,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_17)

	local var_1_18 = {
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

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_18)

	local function var_1_19()
		var_1_4:AnimateSequence("ButtonUp")
		var_1_6:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_19

	local var_1_20
	local var_1_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Disabled", var_1_21)

	local var_1_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Disabled", var_1_22)

	local function var_1_23()
		var_1_4:AnimateSequence("Disabled")
		var_1_6:AnimateSequence("Disabled")
	end

	var_1_0._sequences.Disabled = var_1_23

	return var_1_0
end

MenuBuilder.registerType("LeaderboardRankField", LeaderboardRankField)
LockTable(_M)
