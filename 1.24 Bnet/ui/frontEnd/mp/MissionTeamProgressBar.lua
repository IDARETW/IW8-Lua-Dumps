module(..., package.seeall)

function MissionTeamProgressBar(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 100 * _1080p)

	var_1_0.id = "MissionTeamProgressBar"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIStyledText.new()

	var_1_4.id = "MaxLeveL"

	var_1_4:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAX_RANK")), 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetStartupDelay(1000)
	var_1_4:SetLineHoldTime(400)
	var_1_4:SetAnimMoveTime(150)
	var_1_4:SetEndDelay(1000)
	var_1_4:SetCrossfadeTime(400)
	var_1_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_4:SetMaxVisibleLines(1)
	var_1_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 4, _1080p * 86, _1080p * 46.75, _1080p * 63.25)
	var_1_0:addElement(var_1_4)

	var_1_0.MaxLeveL = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "LevelLabel"

	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/RANK_CAPS"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 3, _1080p * -8, _1080p * 17, _1080p * 37)
	var_1_0:addElement(var_1_6)

	var_1_0.LevelLabel = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "black"

	var_1_8:SetRGBFromInt(0, 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 43, _1080p * -23)
	var_1_0:addElement(var_1_8)

	var_1_0.black = var_1_8

	local var_1_9

	if not CONDITIONS.IsThirdGameMode(var_1_0) then
		local var_1_10 = LUI.UIImage.new()

		var_1_10.id = "left"

		var_1_10:setImage(RegisterMaterial("challenges_progress_hori_bg_left"), 0)
		var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -8, _1080p * 16, _1080p * 37, _1080p * 73)
		var_1_0:addElement(var_1_10)

		var_1_0.left = var_1_10
	end

	local var_1_11

	if not CONDITIONS.IsThirdGameMode(var_1_0) then
		local var_1_12 = LUI.UIImage.new()

		var_1_12.id = "center"

		var_1_12:setImage(RegisterMaterial("challenges_progress_hori_bg_center"), 0)
		var_1_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, _1080p * -18, _1080p * 37, _1080p * 73)
		var_1_0:addElement(var_1_12)

		var_1_0.center = var_1_12
	end

	local var_1_13

	if not CONDITIONS.IsThirdGameMode(var_1_0) then
		local var_1_14 = LUI.UIImage.new()

		var_1_14.id = "right"

		var_1_14:setImage(RegisterMaterial("challenges_progress_hori_bg_right"), 0)
		var_1_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -18, _1080p * 6, _1080p * 37, _1080p * 73)
		var_1_0:addElement(var_1_14)

		var_1_0.right = var_1_14
	end

	local var_1_15

	if not CONDITIONS.IsThirdGameMode(var_1_0) then
		local var_1_16 = LUI.UIImage.new()

		var_1_16.id = "Fill"

		var_1_16:setImage(RegisterMaterial("challenges_progress_hori_center"), 0)
		var_1_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 8, _1080p * -8, _1080p * 38, _1080p * 74)
		var_1_0:addElement(var_1_16)

		var_1_0.Fill = var_1_16
	end

	local function var_1_17()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_17

	local var_1_18 = {
		{
			value = 16752128,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_6:RegisterAnimationSequence("CommanderRankLevelColor", var_1_18)

	local function var_1_19()
		var_1_6:AnimateSequence("CommanderRankLevelColor")
	end

	var_1_0._sequences.CommanderRankLevelColor = var_1_19

	return var_1_0
end

MenuBuilder.registerType("MissionTeamProgressBar", MissionTeamProgressBar)
LockTable(_M)
