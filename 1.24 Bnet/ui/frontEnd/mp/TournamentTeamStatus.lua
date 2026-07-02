module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Health)
	assert(arg_1_0.TournamentPlayerStatus)

	local var_1_0 = TOURNAMENT.GetTeamData(arg_1_2.roundIndex, arg_1_2.matchIndex, arg_1_1)

	arg_1_0.Health:setText(var_1_0.totalHealthPercent)
	arg_1_0.TournamentPlayerStatus:Update(TOURNAMENT.GetTeamData(arg_1_2.roundIndex, arg_1_2.matchIndex, arg_1_1), Tournament.BEBDGHGIEG(arg_1_2.roundIndex - 1, arg_1_2.matchIndex - 1))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Update = var_0_0

	arg_2_0.TournamentPlayerStatus:SetNumPlayers(Tournament.DIGGEIGAHD())
end

function TournamentTeamStatus(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 30 * _1080p)

	var_3_0.id = "TournamentTeamStatus"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("TournamentPlayerStatus", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "TournamentPlayerStatus"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 55, 0, _1080p * 30)
	var_3_0:addElement(var_3_4)

	var_3_0.TournamentPlayerStatus = var_3_4

	local var_3_5
	local var_3_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_7 = LUI.UIBorder.new(var_3_6)

	var_3_7.id = "Border"

	var_3_0:addElement(var_3_7)

	var_3_0.Border = var_3_7

	local var_3_8
	local var_3_9 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_10 = LUI.UIBorder.new(var_3_9)

	var_3_10.id = "HealthBorder"

	var_3_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -33, 0, 0, _1080p * 30)
	var_3_0:addElement(var_3_10)

	var_3_0.HealthBorder = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "HealthIcon"

	var_3_12:setImage(RegisterMaterial("hud_icon_extra_health"), 0)
	var_3_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -28, _1080p * -5, _1080p * 3, _1080p * 26)
	var_3_0:addElement(var_3_12)

	var_3_0.HealthIcon = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "Health"

	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -64, _1080p * 86, _1080p * 3, _1080p * 27)
	var_3_0:addElement(var_3_14)

	var_3_0.Health = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 55
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
		}
	}

	var_3_4:RegisterAnimationSequence("Right", var_3_16)

	local var_3_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -33
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
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
		}
	}

	var_3_10:RegisterAnimationSequence("Right", var_3_17)

	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
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
		}
	}

	var_3_12:RegisterAnimationSequence("Right", var_3_18)

	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 86
		}
	}

	var_3_14:RegisterAnimationSequence("Right", var_3_19)

	local function var_3_20()
		var_3_4:AnimateSequence("Right")
		var_3_10:AnimateSequence("Right")
		var_3_12:AnimateSequence("Right")
		var_3_14:AnimateSequence("Right")
	end

	var_3_0._sequences.Right = var_3_20

	local var_3_21 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -55
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_3_4:RegisterAnimationSequence("Left", var_3_21)

	local var_3_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 33
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
		}
	}

	var_3_10:RegisterAnimationSequence("Left", var_3_22)

	local var_3_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
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
		}
	}

	var_3_12:RegisterAnimationSequence("Left", var_3_23)

	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 65
		}
	}

	var_3_14:RegisterAnimationSequence("Left", var_3_24)

	local function var_3_25()
		var_3_4:AnimateSequence("Left")
		var_3_10:AnimateSequence("Left")
		var_3_12:AnimateSequence("Left")
		var_3_14:AnimateSequence("Left")
	end

	var_3_0._sequences.Left = var_3_25

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TournamentTeamStatus", TournamentTeamStatus)
LockTable(_M)
