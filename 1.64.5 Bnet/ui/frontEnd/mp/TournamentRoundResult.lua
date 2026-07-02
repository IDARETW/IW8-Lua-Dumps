module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.RoundNum:setText(arg_1_3 + 1)

	local var_1_0 = Tournament.DJEDCCAHBD(arg_1_1 - 1, arg_1_2 - 1, arg_1_3)
	local var_1_1 = SWATCHES.Tournament.tie

	if var_1_0 == 0 then
		var_1_1 = SWATCHES.Tournament.leftTeamWin
	elseif var_1_0 == 1 then
		var_1_1 = SWATCHES.Tournament.rightTeamWin
	end

	arg_1_0.RoundNum:SetRGBFromTable(var_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.RoundNum)

	arg_2_0.Setup = var_0_0
end

function TournamentRoundResult(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_3_0.id = "TournamentRoundResult"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 50, 0, _1080p * 50)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "RoundNum"

	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -42, _1080p * 92, _1080p * 13, _1080p * 35)
	var_3_0:addElement(var_3_6)

	var_3_0.RoundNum = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TournamentRoundResult", TournamentRoundResult)
LockTable(_M)
