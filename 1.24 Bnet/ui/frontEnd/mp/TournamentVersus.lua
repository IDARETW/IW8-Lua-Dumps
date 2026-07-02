module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.TournamentPlayerNames)
	Streaming.BDDBGGIC(true)

	if not arg_1_2.matchIndex then
		arg_1_2.matchIndex = Tournament.DEADJEGBCJ() + 1
	end

	if not arg_1_2.roundIndex then
		arg_1_2.roundIndex = Tournament.BJGJIJIEGG() + 1
	end

	Dvar.DFIJDJFIFD("match_running", 0)
	Lobby.CheckTURequirement(arg_1_0, arg_1_1)

	arg_1_2.previewType = TOURNAMENT.PreviewType.LOBBY

	arg_1_0.TournamentTeamPreview:Setup(arg_1_2)

	local function var_1_0()
		arg_1_0.TournamentPlayerNames:SetClientCharacterScene(arg_1_1, arg_1_2.roundIndex, arg_1_2.matchIndex)
	end

	MenuUtils.SetupSceneChangeCallback(arg_1_0, var_1_0)
	Lobby.PreloadViewHandsForLocalPlayer(arg_1_1)
end

function TournamentVersus(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "TournamentVersus"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("TournamentPlayerNames", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "TournamentPlayerNames"

	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.TournamentPlayerNames = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("TournamentTeamPreview", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "TournamentTeamPreview"

	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -748, _1080p * 748, _1080p * 170, _1080p * 470)
	var_3_0:addElement(var_3_6)

	var_3_0.TournamentTeamPreview = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "BetaWatermark"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_3_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/BETA")), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_8:SetAlignment(LUI.Alignment.Right)
	var_3_8:SetBlurStrength(2, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 929, _1080p * 999)
	var_3_0:addElement(var_3_8)

	var_3_0.BetaWatermark = var_3_8

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TournamentVersus", TournamentVersus)
LockTable(_M)
