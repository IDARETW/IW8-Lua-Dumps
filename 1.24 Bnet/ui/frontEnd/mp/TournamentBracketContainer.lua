module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.TournamentFullBracket:UpdateBracket()

	local var_1_0 = LUI.FlowManager.GetScopedData(TOURNAMENT.GetMenuName("arena"))
	local var_1_1 = Tournament.BEFJGJJBEI()

	if TOURNAMENT.CanShowResults() and not var_1_0.shownResults then
		LUI.FlowManager.RequestPopupMenu(arg_1_0, "TournamentResultsPopup", true, controllerIndex)

		var_1_0.shownResults = true
	end

	arg_1_0.TournamentPlayerMatchStatus:UpdatePlayerMatchStatus()

	if not arg_1_1 and arg_1_0:GetCurrentMenu() then
		if TOURNAMENT.CanReadyUp() and not arg_1_0._readyUpAdded and not arg_1_0._readyUpRequested then
			arg_1_0:dispatchEventToCurrentMenu({
				kbm_only = true,
				side = "left",
				name = "add_button_helper_text",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/READY_UP_BUTTON")
			})

			arg_1_0._readyUpAdded = true
		elseif not arg_1_0._removedHelper then
			arg_1_0:dispatchEventToCurrentMenu({
				button_ref = "button_alt1",
				name = "add_button_helper_text",
				helper_text = "",
				side = "left"
			})

			arg_1_0._removedHelper = true
			arg_1_0._readyUpAdded = false
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")

	arg_2_0.UpdateBracket = var_0_0

	assert(arg_2_0.TournamentFullBracket)

	arg_2_0.bindButton = LUI.UIBindButton.new()

	arg_2_0:addElement(arg_2_0.bindButton)

	arg_2_0._readyUpAdded = false

	if Tournament.BEFJGJJBEI() == MP.TournamentParticipationStatus.ACTIVE then
		arg_2_0.bindButton:addEventHandler("button_alt1", function(arg_3_0, arg_3_1)
			arg_2_0:dispatchEventToCurrentMenu({
				button_ref = "button_alt1",
				name = "add_button_helper_text",
				helper_text = "",
				side = "left"
			})

			arg_2_0._removedHelper = true
			arg_2_0._readyUpRequested = true
			arg_2_0:Wait(2000).onComplete = function()
				arg_2_0._readyUpRequested = false
			end
		end)
	end

	local var_2_0 = LUI.UITimer.new({
		interval = 1000,
		event = {
			name = "refreshBracket"
		}
	})

	var_2_0.id = "RefreshBracketTimer"

	arg_2_0:addElement(var_2_0)
	arg_2_0.TournamentFullBracket:SetupStaticFields()
	arg_2_0:registerEventHandler("refreshBracket", function(arg_5_0, arg_5_1)
		arg_5_0:UpdateBracket()
	end)

	local var_2_1 = LUI.FlowManager.GetScopedData(TOURNAMENT.GetMenuName("arena"))

	var_2_1.firstBracketUpdate = true

	arg_2_0:UpdateBracket(true)

	var_2_1.firstBracketUpdate = false

	ACTIONS.ScaleFullscreen(arg_2_0.Darkener)
	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
end

function TournamentBracketContainer(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "TournamentBracketContainer"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Darkener"

	var_6_4:SetRGBFromInt(0, 0)
	var_6_4:SetAlpha(0.5, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Darkener = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("TournamentFullBracket", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "TournamentFullBracket"

	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 204, _1080p * 954)
	var_6_0:addElement(var_6_6)

	var_6_0.TournamentFullBracket = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "BetaWatermark"

	var_6_8:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_8:SetAlpha(0.4, 0)
	var_6_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/BETA")), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_8:SetAlignment(LUI.Alignment.Right)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1434, _1080p * 1824, _1080p * 959, _1080p * 1013)
	var_6_0:addElement(var_6_8)

	var_6_0.BetaWatermark = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("TournamentPlayerMatchStatus", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "TournamentPlayerMatchStatus"

	var_6_10:SetAlpha(0, 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 213, _1080p * 289)
	var_6_0:addElement(var_6_10)

	var_6_0.TournamentPlayerMatchStatus = var_6_10

	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("TournamentBracketContainer", TournamentBracketContainer)
LockTable(_M)
