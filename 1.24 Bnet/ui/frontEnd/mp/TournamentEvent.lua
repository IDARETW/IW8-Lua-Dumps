module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2.killerTeam == 0

	arg_1_0.RightArrow:SetAlpha(var_1_0 and 1 or 0, 0)
	arg_1_0.LeftArrow:SetAlpha(var_1_0 and 0 or 1, 1)
	ACTIONS.AnimateSequence(arg_1_0, var_1_0 and "HeadshotRight" or "HeadshotLeft")

	local var_1_1 = WEAPON.GetImage(arg_1_2.killerWeapon)

	arg_1_0.EventIcon:setImage(RegisterMaterial(var_1_1))
	arg_1_0.HeadShot:SetAlpha(arg_1_2.killerHeadshot and 1 or 0)

	local var_1_2 = Tournament.BCGGEDJHCG(arg_1_2.round, arg_1_2.match, 0)

	arg_1_0.PlayerTeam1:setText(Tournament.BHDJAJECII(var_1_2, var_1_0 and arg_1_2.killer or arg_1_2.victim))

	local var_1_3 = Tournament.BCGGEDJHCG(arg_1_2.round, arg_1_2.match, 1)

	arg_1_0.PlayerTeam2:setText(Tournament.BHDJAJECII(var_1_3, var_1_0 and arg_1_2.victim or arg_1_2.killer))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.RightArrow)
	assert(arg_2_0.LeftArrow)
	assert(arg_2_0.EventIcon)
	assert(arg_2_0.HeadShot)
	assert(arg_2_0.PlayerTeam1)
	assert(arg_2_0.PlayerTeam2)

	arg_2_0.Update = var_0_0
end

function TournamentEvent(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 30 * _1080p)

	var_3_0.id = "TournamentEvent"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_5 = LUI.UIBorder.new(var_3_4)

	var_3_5.id = "Border"

	var_3_0:addElement(var_3_5)

	var_3_0.Border = var_3_5

	local var_3_6
	local var_3_7 = LUI.UIText.new()

	var_3_7.id = "PlayerTeam1"

	var_3_7:setText("", 0)
	var_3_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_7:SetAlignment(LUI.Alignment.Right)
	var_3_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 221, _1080p * 3, _1080p * 27)
	var_3_0:addElement(var_3_7)

	var_3_0.PlayerTeam1 = var_3_7

	local var_3_8
	local var_3_9 = LUI.UIText.new()

	var_3_9.id = "PlayerTeam2"

	var_3_9:setText("", 0)
	var_3_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_9:SetAlignment(LUI.Alignment.Left)
	var_3_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 382, _1080p * 596, _1080p * 3, _1080p * 27)
	var_3_0:addElement(var_3_9)

	var_3_0.PlayerTeam2 = var_3_9

	local var_3_10
	local var_3_11 = LUI.UIImage.new()

	var_3_11.id = "EventIcon"

	var_3_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 283, _1080p * 317, _1080p * 5, _1080p * 25)
	var_3_0:addElement(var_3_11)

	var_3_0.EventIcon = var_3_11

	local var_3_12
	local var_3_13 = LUI.UIImage.new()

	var_3_13.id = "LeftArrow"

	var_3_13:SetAlpha(0, 0)
	var_3_13:setImage(RegisterMaterial("hud_score_arrow"), 0)
	var_3_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 237, _1080p * 254, _1080p * 6, _1080p * 24)
	var_3_0:addElement(var_3_13)

	var_3_0.LeftArrow = var_3_13

	local var_3_14
	local var_3_15 = LUI.UIImage.new()

	var_3_15.id = "RightArrow"

	var_3_15:SetAlpha(0, 0)
	var_3_15:SetZRotation(180, 0)
	var_3_15:setImage(RegisterMaterial("hud_score_arrow"), 0)
	var_3_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 346, _1080p * 363, _1080p * 6, _1080p * 24)
	var_3_0:addElement(var_3_15)

	var_3_0.RightArrow = var_3_15

	local var_3_16
	local var_3_17 = LUI.UIImage.new()

	var_3_17.id = "HeadShot"

	var_3_17:SetAlpha(0, 0)
	var_3_17:setImage(RegisterMaterial("death_headshot"), 0)
	var_3_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 320, _1080p * 343, _1080p * 3, _1080p * 27)
	var_3_0:addElement(var_3_17)

	var_3_0.HeadShot = var_3_17

	local function var_3_18()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_18

	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 320
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 343
		}
	}

	var_3_17:RegisterAnimationSequence("HeadshotRight", var_3_19)

	local function var_3_20()
		var_3_17:AnimateSequence("HeadshotRight")
	end

	var_3_0._sequences.HeadshotRight = var_3_20

	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 277
		}
	}

	var_3_17:RegisterAnimationSequence("HeadshotLeft", var_3_21)

	local function var_3_22()
		var_3_17:AnimateSequence("HeadshotLeft")
	end

	var_3_0._sequences.HeadshotLeft = var_3_22

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TournamentEvent", TournamentEvent)
LockTable(_M)
