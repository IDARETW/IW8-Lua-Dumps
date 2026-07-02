module(..., package.seeall)

function TournamentSingleBracket(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 738 * _1080p)

	var_1_0.id = "TournamentSingleBracket"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("TournamentRoundTitle", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "TournamentRoundTitle"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 104, 0, _1080p * 248, _1080p * 289)
	var_1_0:addElement(var_1_4)

	var_1_0.TournamentRoundTitle = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("MatchGroup", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "MatchGroup1"

	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 298, _1080p * 440)
	var_1_0:addElement(var_1_6)

	var_1_0.MatchGroup1 = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -104
		}
	}

	var_1_4:RegisterAnimationSequence("Left", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("Left")
	end

	var_1_0._sequences.Left = var_1_9

	local var_1_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_1_4:RegisterAnimationSequence("Right", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("Right")
	end

	var_1_0._sequences.Right = var_1_11

	return var_1_0
end

MenuBuilder.registerType("TournamentSingleBracket", TournamentSingleBracket)
LockTable(_M)
