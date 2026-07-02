module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2.gbMatch
	local var_1_1 = var_1_0.teams
	local var_1_2 = arg_1_2.alliesWins
	local var_1_3 = arg_1_2.axisWins
	local var_1_4 = var_1_0.gameCount
	local var_1_5 = arg_1_2.isMatchEnd
	local var_1_6
	local var_1_7 = 1
	local var_1_8 = ""

	if var_1_5 then
		ACTIONS.AnimateSequence(arg_1_0, "MatchEnd")

		var_1_6 = var_1_2 < var_1_3 and 1 or 2

		local var_1_9 = var_1_6 == 1 and var_1_3 or var_1_2

		var_1_8 = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_WON", var_1_9)
	else
		ACTIONS.AnimateSequence(arg_1_0, "RoundEnd")

		local var_1_10 = var_1_0.games

		for iter_1_0, iter_1_1 in ipairs(var_1_10) do
			if iter_1_1.status == GAMEBATTLES.MLG_GAME_STATUS.UNPLAYED then
				break
			end

			var_1_7 = iter_1_0
		end

		var_1_6 = var_1_10[var_1_7].status == GAMEBATTLES.MLG_GAME_STATUS.WON_HOME and 1 or 2
		var_1_8 = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/GAME_WON_LINE", var_1_7, var_1_4)
	end

	local var_1_11 = var_1_1[var_1_6].teamName
	local var_1_12 = var_1_1[var_1_6].teamId

	arg_1_0.ResultText:setText(var_1_8)
	arg_1_0.TeamName:setText(var_1_11 .. " #" .. var_1_12)
	arg_1_0.MatchId:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_ID_LABEL") .. " #" .. var_1_0.matchId)
	arg_1_0.ConfirmButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_1_2.onConfirm

		if var_2_0 then
			var_2_0()
		end

		LUI.FlowManager.RequestLeaveMenu(arg_2_0)
		arg_2_0:dispatchEventToRoot({
			name = "gamebattles_match_results_popup_closed"
		})
	end)
end

function GameBattlesMatchResults(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1710 * _1080p, 0, 460 * _1080p)

	var_3_0.id = "GameBattlesMatchResults"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -230, _1080p * 230)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ConfirmButton"

	var_3_6.Text:SetLeft(_1080p * 20, 0)
	var_3_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CONTINUE")), 0)
	var_3_6.Text:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 116, _1080p * 446, _1080p * 363, _1080p * 401)
	var_3_0:addElement(var_3_6)

	var_3_0.ConfirmButton = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Logo"

	var_3_8:setImage(RegisterMaterial("gamebattles_logo_large"), 0)
	var_3_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -770, _1080p * -30, _1080p * 39, _1080p * 439)
	var_3_0:addElement(var_3_8)

	var_3_0.Logo = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "AdditionalInformation"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_RESULT_ADDITIONAL_INFORMATION"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 115, _1080p * 638, _1080p * 274, _1080p * 298)
	var_3_0:addElement(var_3_10)

	var_3_0.AdditionalInformation = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "MatchId"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 115, _1080p * 638, _1080p * 215, _1080p * 239)
	var_3_0:addElement(var_3_12)

	var_3_0.MatchId = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "TeamName"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 115, _1080p * 638, _1080p * 191, _1080p * 215)
	var_3_0:addElement(var_3_14)

	var_3_0.TeamName = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "ResultText"

	var_3_16:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_16:setText(ToUpperCase(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/GAME_WON_LINE")), 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 115, _1080p * 638, _1080p * 128, _1080p * 152)
	var_3_0:addElement(var_3_16)

	var_3_0.ResultText = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "Divider"

	var_3_18:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_3_18:SetAlpha(0.6, 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 563, _1080p * 80, _1080p * 82)
	var_3_0:addElement(var_3_18)

	var_3_0.Divider = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIText.new()

	var_3_20.id = "Title"

	var_3_20:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_3_20:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"), 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_20:SetAlignment(LUI.Alignment.Right)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 563, _1080p * 26, _1080p * 86)
	var_3_0:addElement(var_3_20)

	var_3_0.Title = var_3_20

	local function var_3_21()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_21

	local var_3_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("MatchEnd", var_3_22)

	local function var_3_23()
		var_3_10:AnimateSequence("MatchEnd")
	end

	var_3_0._sequences.MatchEnd = var_3_23

	local var_3_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("RoundEnd", var_3_24)

	local function var_3_25()
		var_3_10:AnimateSequence("RoundEnd")
	end

	var_3_0._sequences.RoundEnd = var_3_25

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GameBattlesMatchResults", GameBattlesMatchResults)
LockTable(_M)
