module(..., package.seeall)
FrontEndScene.RegisterScene("TournamentMatchPreview", "squad_lobby")

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.TournamentTeamPreview)
	assert(arg_1_0.TournamentMatchInfo)

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

	arg_1_2.previewType = TOURNAMENT.PreviewType.IN_PROGRESS

	arg_1_0.TournamentTeamPreview:Setup(arg_1_2)
	arg_1_0.TournamentMatchInfo:SetupStaticFields(arg_1_2)

	local var_1_1 = LUI.UITimer.new({
		interval = 1000,
		event = "refreshPreview"
	})

	var_1_1.id = "RefreshPreviewTimer"

	arg_1_0:addElement(var_1_1)
	arg_1_0:registerEventHandler("refreshPreview", function(arg_2_0, arg_2_1)
		arg_1_0.TournamentTeamPreview:Update(arg_1_2)
		arg_1_0.TournamentMatchInfo:Update(arg_1_2)
	end)
	assert(arg_1_0.bindButton)
	arg_1_0.bindButton:addEventHandler("button_alt1", function(arg_3_0, arg_3_1)
		Tournament.CIIGEAICBD(arg_1_2.roundIndex - 1, arg_1_2.matchIndex - 1)
	end)
	arg_1_0.TournamentPlayerNames:SetClientCharacterScene(arg_1_1, arg_1_2.roundIndex, arg_1_2.matchIndex)

	local function var_1_2(arg_4_0, arg_4_1)
		if LUI.IsLastInputGamepad(arg_4_1.controllerIndex) then
			if arg_4_0.SpectateButton then
				arg_4_0:RemoveElement(arg_4_0.SpectateButton)
			end

			arg_4_0.Spectate:SetAlpha(1)
			arg_4_0.Spectate:setText(Engine.CBBHFCGDIC("TOURNAMENT/SPECTATE"), 0)
		elseif not arg_4_0.SpectateButton then
			arg_4_0:addElement(arg_4_0.SpectateButton)
		end
	end

	arg_1_0:addAndCallEventHandler("update_input_type", var_1_2, {
		controllerIndex = arg_1_1
	})
	arg_1_0.SpectateButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		Tournament.CIIGEAICBD(arg_1_2.roundIndex - 1, arg_1_2.matchIndex - 1)
	end)
end

function TournamentMatchPreview(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "TournamentMatchPreview"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	var_6_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})
	var_6_0.HelperBar.id = "HelperBar"

	var_6_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0.HelperBar:setPriority(10)
	var_6_0:addElement(var_6_0.HelperBar)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Backer"

	var_6_4:SetRGBFromInt(0, 0)
	var_6_4:SetAlpha(0.5, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 632, _1080p * 1260, _1080p * 185, _1080p * 822)
	var_6_0:addElement(var_6_4)

	var_6_0.Backer = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("TournamentTeamPreview", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "TournamentTeamPreview"

	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 660, _1080p * 1260, _1080p * 154, _1080p * 454)
	var_6_0:addElement(var_6_6)

	var_6_0.TournamentTeamPreview = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "MenuTitle"

	var_6_8.MenuTitle:setText(Engine.CBBHFCGDIC("TOURNAMENT/MATCH_PREVIEW"), 0)
	var_6_8.Line:SetLeft(0, 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_6_0:addElement(var_6_8)

	var_6_0.MenuTitle = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("TournamentMatchInfo", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "TournamentMatchInfo"

	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 660, _1080p * 1260, _1080p * 448, _1080p * 748)
	var_6_0:addElement(var_6_10)

	var_6_0.TournamentMatchInfo = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIText.new()

	var_6_12.id = "Spectate"

	var_6_12:setText(Engine.CBBHFCGDIC("TOURNAMENT/SPECTATE"), 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_12:SetAlignment(LUI.Alignment.Center)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 782, _1080p * 806)
	var_6_0:addElement(var_6_12)

	var_6_0.Spectate = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIText.new()

	var_6_14.id = "Preview"

	var_6_14:setText(Engine.CBBHFCGDIC("TOURNAMENT/MATCH_UPDATE"), 0)
	var_6_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_14:SetAlignment(LUI.Alignment.Center)
	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -98, _1080p * 98, _1080p * 170, _1080p * 194)
	var_6_0:addElement(var_6_14)

	var_6_0.Preview = var_6_14

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("TournamentPlayerNames", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "TournamentPlayerNames"

	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 200, _1080p * 600)
	var_6_0:addElement(var_6_16)

	var_6_0.TournamentPlayerNames = var_6_16

	local var_6_17
	local var_6_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_6_1
	})

	var_6_18.id = "SpectateButton"

	var_6_18.Text:SetLeft(_1080p * 35, 0)
	var_6_18.Text:setText(Engine.CBBHFCGDIC("TOURNAMENT/SPECTATE"), 0)
	var_6_18.Text:SetAlignment(LUI.Alignment.Center)
	var_6_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 717, _1080p * 1175, _1080p * 774, _1080p * 814)
	var_6_0:addElement(var_6_18)

	var_6_0.SpectateButton = var_6_18

	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "right",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_6_19 = LUI.UIBindButton.new()

	var_6_19.id = "selfBindButton"

	var_6_0:addElement(var_6_19)

	var_6_0.bindButton = var_6_19

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_6_1
		end

		ACTIONS.LeaveMenu(var_6_0)
	end)
	var_6_0.bindButton:addEventHandler("button_start", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1.controller or var_6_1

		ACTIONS.OpenOptionsMenu(var_8_0, "")
	end)
	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("TournamentMatchPreview", TournamentMatchPreview)
LockTable(_M)
