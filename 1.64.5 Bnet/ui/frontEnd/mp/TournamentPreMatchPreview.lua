module(..., package.seeall)
FrontEndScene.RegisterScene("TournamentMatchPreview", "squad_lobby")

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.TournamentTeamPreview)
	assert(arg_1_0.TournamentWaitingForTeam1)
	assert(arg_1_0.TournamentWaitingForTeam2)
	assert(arg_1_0.MapImage)

	if Engine.BHICADFIHA() then
		if not arg_1_2.roundIndex then
			DebugPrint("WARNING: Missing \"roundIndex\" option for TournamentMatchPreview menu. Only OK after a MyChanges.")

			arg_1_2.roundIndex = 0
		end

		if not arg_1_2.matchIndex then
			DebugPrint("WARNING: Missing \"matchIndex\" option for TournamentMatchPreview menu. Only OK after a MyChanges.")

			arg_1_2.matchIndex = 0
		end
	end

	local var_1_0 = MenuBuilder.BuildRegisteredType("LobbyStatus", {
		controllerIndex = arg_1_1
	})

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 0, _1080p * 500, _1080p * 0, _1080p * 26)
	var_1_0:setPriority(-1)
	arg_1_0:addElement(var_1_0)

	arg_1_2.previewType = TOURNAMENT.PreviewType.PRE_MATCH

	arg_1_0.TournamentTeamPreview:Setup(arg_1_2)

	local var_1_1 = LUI.UITimer.new({
		interval = 1000,
		event = "refreshPreview"
	})

	var_1_1.id = "RefreshPreviewTimer"

	arg_1_0:addElement(var_1_1)

	local var_1_2 = arg_1_2.roundIndex - 1

	if var_1_2 > 0 then
		local var_1_3 = 2 * (arg_1_2.matchIndex - 1) + 1

		arg_1_0.TournamentWaitingForTeam1:Setup(var_1_2, var_1_3)

		local var_1_4 = var_1_3 + 1

		arg_1_0.TournamentWaitingForTeam2:Setup(var_1_2, var_1_4)
	else
		arg_1_0.TournamentWaitingForTeam1:SetAlpha(0)
		arg_1_0.TournamentWaitingForTeam2:SetAlpha(0)
	end

	arg_1_0:registerEventHandler("refreshPreview", function(arg_2_0, arg_2_1)
		arg_1_0.TournamentTeamPreview:Update(arg_1_2)

		if var_1_2 > 0 then
			arg_1_0.TournamentWaitingForTeam1:Update()
			arg_1_0.TournamentWaitingForTeam2:Update()
		end
	end)

	local var_1_5 = TOURNAMENT.GetMapInfoForRound(arg_1_2.roundIndex)

	arg_1_0.MapImage:setImage(RegisterMaterial(var_1_5.image))
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("TOURNAMENT/MATCH_NUM", TOURNAMENT.GetAdjustedMatchIndex(arg_1_2.roundIndex, arg_1_2.matchIndex)))
	arg_1_0.TournamentPlayerNames:SetClientCharacterScene(arg_1_1, arg_1_2.roundIndex, arg_1_2.matchIndex)
end

function TournamentPreMatchPreview(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "TournamentPreMatchPreview"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	var_3_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})
	var_3_0.HelperBar.id = "HelperBar"

	var_3_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_3_0.HelperBar:setPriority(10)
	var_3_0:addElement(var_3_0.HelperBar)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("TournamentTeamPreview", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "TournamentTeamPreview"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 660, _1080p * 1160, _1080p * 154, _1080p * 454)
	var_3_0:addElement(var_3_4)

	var_3_0.TournamentTeamPreview = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "MenuTitle"

	var_3_6.MenuTitle:setText("", 0)
	var_3_6.Line:SetLeft(0, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_3_0:addElement(var_3_6)

	var_3_0.MenuTitle = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("TournamentWaitingForTeam", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "TournamentWaitingForTeam1"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 706, _1080p * 679, _1080p * 903)
	var_3_0:addElement(var_3_8)

	var_3_0.TournamentWaitingForTeam1 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("TournamentWaitingForTeam", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "TournamentWaitingForTeam2"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1173, _1080p * 1673, _1080p * 679, _1080p * 903)
	var_3_0:addElement(var_3_10)

	var_3_0.TournamentWaitingForTeam2 = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "MapImage"

	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 755, _1080p * 1173, _1080p * 583, _1080p * 775)
	var_3_0:addElement(var_3_12)

	var_3_0.MapImage = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "Preview"

	var_3_14:setText(Engine.CBBHFCGDIC("TOURNAMENT/MATCH_PREVIEW"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -98, _1080p * 98, _1080p * 170, _1080p * 194)
	var_3_0:addElement(var_3_14)

	var_3_0.Preview = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("TournamentPlayerNames", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "TournamentPlayerNames"

	var_3_16:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_16)

	var_3_0.TournamentPlayerNames = var_3_16

	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "right",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_3_17 = LUI.UIBindButton.new()

	var_3_17.id = "selfBindButton"

	var_3_0:addElement(var_3_17)

	var_3_0.bindButton = var_3_17

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_3_0.bindButton:addEventHandler("button_start", function(arg_5_0, arg_5_1)
		local var_5_0 = arg_5_1.controller or var_3_1

		ACTIONS.OpenOptionsMenu(var_5_0, "")
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TournamentPreMatchPreview", TournamentPreMatchPreview)
LockTable(_M)
