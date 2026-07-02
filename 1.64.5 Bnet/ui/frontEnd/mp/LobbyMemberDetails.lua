module(..., package.seeall)

function LobbyMemberDetails(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalNavigator.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 500 * _1080p)

	var_1_0.id = "LobbyMemberDetails"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("SmallPlayerCard", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "PlayerCard"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 130)
	var_1_0:addElement(var_1_4)

	var_1_0.PlayerCard = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("LobbyMemberStats", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "Stats"

	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 134, _1080p * 266)
	var_1_0:addElement(var_1_6)

	var_1_0.Stats = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local function var_1_8()
		return
	end

	var_1_0._sequences.ShowCluster = var_1_8

	local function var_1_9()
		return
	end

	var_1_0._sequences.HideCluster = var_1_9

	local var_1_10 = {
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1406
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1824
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 767
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 886
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_4:RegisterAnimationSequence("LobbyMembersHL", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("LobbyMembersHL")
	end

	var_1_0._sequences.LobbyMembersHL = var_1_11

	local var_1_12 = {
		{
			duration = 120,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2506.95
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2924.95
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 767
		},
		{
			duration = 120,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 886
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 120,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_4:RegisterAnimationSequence("MainHL", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("MainHL")
	end

	var_1_0._sequences.MainHL = var_1_13

	return var_1_0
end

MenuBuilder.registerType("LobbyMemberDetails", LobbyMemberDetails)
LockTable(_M)
