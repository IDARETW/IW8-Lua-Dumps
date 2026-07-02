module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SetForceDefaultFocus(true)
end

function TournamentDuoBracket(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalNavigator.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 738 * _1080p)

	var_2_0.id = "TournamentDuoBracket"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("TournamentRoundTitle", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "TournamentRoundTitle"

	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 104, 0, _1080p * 95, _1080p * 136)
	var_2_0:addElement(var_2_4)

	var_2_0.TournamentRoundTitle = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("MatchGroup", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "MatchGroup1"

	var_2_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 287)
	var_2_0:addElement(var_2_6)

	var_2_0.MatchGroup1 = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("MatchGroup", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "MatchGroup2"

	var_2_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 506, _1080p * 648)
	var_2_0:addElement(var_2_8)

	var_2_0.MatchGroup2 = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10 = {
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

	var_2_4:RegisterAnimationSequence("Left", var_2_10)

	local function var_2_11()
		var_2_4:AnimateSequence("Left")
	end

	var_2_0._sequences.Left = var_2_11

	local var_2_12 = {
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

	var_2_4:RegisterAnimationSequence("Right", var_2_12)

	local function var_2_13()
		var_2_4:AnimateSequence("Right")
	end

	var_2_0._sequences.Right = var_2_13

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("TournamentDuoBracket", TournamentDuoBracket)
LockTable(_M)
