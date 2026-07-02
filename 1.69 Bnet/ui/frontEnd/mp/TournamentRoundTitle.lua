module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.RoundTitle:setText(Engine.CBBHFCGDIC(TOURNAMENT.GetRoundTitle(arg_1_1.roundIndex)))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
end

function TournamentRoundTitle(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 561 * _1080p, 0, 41 * _1080p)

	var_3_0.id = "TournamentRoundTitle"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "RoundLine"

	var_3_4:SetRGBFromTable(SWATCHES.Tournament.roundText, 0)
	var_3_4:SetAlpha(0.6, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.RoundLine = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "RoundTitle"

	var_3_6:SetRGBFromTable(SWATCHES.Tournament.roundText, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 18, _1080p * 36)
	var_3_0:addElement(var_3_6)

	var_3_0.RoundTitle = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_3_6:RegisterAnimationSequence("Left", var_3_8)

	local function var_3_9()
		var_3_6:AnimateSequence("Left")
	end

	var_3_0._sequences.Left = var_3_9

	local var_3_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_3_6:RegisterAnimationSequence("Center", var_3_10)

	local function var_3_11()
		var_3_6:AnimateSequence("Center")
	end

	var_3_0._sequences.Center = var_3_11

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_3_6:RegisterAnimationSequence("Right", var_3_12)

	local function var_3_13()
		var_3_6:AnimateSequence("Right")
	end

	var_3_0._sequences.Right = var_3_13

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TournamentRoundTitle", TournamentRoundTitle)
LockTable(_M)
