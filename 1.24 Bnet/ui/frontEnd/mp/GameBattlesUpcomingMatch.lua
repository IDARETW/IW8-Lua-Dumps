module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.MatchMessage:setText(Engine.CBBHFCGDIC(arg_1_1), 0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0, var_2_1 = GAMEBATTLES.GetMatchProgressInfo(arg_2_2)

	if not var_2_1 then
		local var_2_2 = arg_2_2.matchTime

		arg_2_0.MatchMessage:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_ID_LABEL") .. " #" .. MLG.BIHFEHBCFB(arg_2_1))
		arg_2_0.BestXOutOfY:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/BEST_X_OUT_OF_Y", arg_2_2.gameCount))
		arg_2_0.MatchDate:setText(Engine.BADEEDFGHB(var_2_2) .. " " .. Engine.CIIGICAIFC(var_2_2))
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.ShowMatchData = var_0_1
	arg_3_0.ShowErrorMessage = var_0_0
end

function GameBattlesUpcomingMatch(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 220 * _1080p)

	var_4_0.id = "GameBattlesUpcomingMatch"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Background"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -230, _1080p * 230, 0, _1080p * 220)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "MatchTime"

	var_4_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -225, _1080p * 225, _1080p * 171, _1080p * 195)
	var_4_0:addElement(var_4_6)

	var_4_0.MatchTime = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "MatchDate"

	var_4_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -225, _1080p * 225, _1080p * 146, _1080p * 170)
	var_4_0:addElement(var_4_8)

	var_4_0.MatchDate = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Divider"

	var_4_10:SetRGBFromInt(11908533, 0)
	var_4_10:SetAlpha(0.75, 0)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -26, _1080p * 22, _1080p * 135, _1080p * 136)
	var_4_0:addElement(var_4_10)

	var_4_0.Divider = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIText.new()

	var_4_12.id = "BestXOutOfY"

	var_4_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Center)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -225, _1080p * 225, _1080p * 98, _1080p * 122)
	var_4_0:addElement(var_4_12)

	var_4_0.BestXOutOfY = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIText.new()

	var_4_14.id = "MatchMessage"

	var_4_14:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_14:setText("", 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Center)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -225, _1080p * 225, _1080p * 73, _1080p * 97)
	var_4_0:addElement(var_4_14)

	var_4_0.MatchMessage = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIText.new()

	var_4_16.id = "Title"

	var_4_16:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_16:setText("", 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_16:SetAlignment(LUI.Alignment.Center)
	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -225, _1080p * 225, _1080p * 15, _1080p * 65)
	var_4_0:addElement(var_4_16)

	var_4_0.Title = var_4_16

	local function var_4_17()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_17

	local var_4_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("NoUpcomingMatch", var_4_18)

	local var_4_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("NoUpcomingMatch", var_4_19)

	local var_4_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("NoUpcomingMatch", var_4_20)

	local var_4_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("NoUpcomingMatch", var_4_21)

	local function var_4_22()
		var_4_6:AnimateSequence("NoUpcomingMatch")
		var_4_8:AnimateSequence("NoUpcomingMatch")
		var_4_10:AnimateSequence("NoUpcomingMatch")
		var_4_12:AnimateSequence("NoUpcomingMatch")
	end

	var_4_0._sequences.NoUpcomingMatch = var_4_22

	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HasUpcomingMatch", var_4_23)

	local var_4_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("HasUpcomingMatch", var_4_24)

	local var_4_25 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("HasUpcomingMatch", var_4_25)

	local var_4_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("HasUpcomingMatch", var_4_26)

	local function var_4_27()
		var_4_6:AnimateSequence("HasUpcomingMatch")
		var_4_8:AnimateSequence("HasUpcomingMatch")
		var_4_10:AnimateSequence("HasUpcomingMatch")
		var_4_12:AnimateSequence("HasUpcomingMatch")
	end

	var_4_0._sequences.HasUpcomingMatch = var_4_27

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("GameBattlesUpcomingMatch", GameBattlesUpcomingMatch)
LockTable(_M)
