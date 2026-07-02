module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("TournamentBracket", {
	"tournament"
})
LUI.FlowManager.RequestSetStack("TournamentBracket", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "MPMainMenu"
	}
})

local var_0_0 = "frontEnd.mp.tournamentbracket"

local function var_0_1()
	WipeGlobalModelsAtPath(var_0_0)
end

function LeaveTournament(arg_2_0, arg_2_1)
	assert(arg_2_1.TournamentBracket)

	local var_2_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE")
	}
	local var_2_1 = Tournament.BEFJGJJBEI()

	if var_2_1 ~= MP.TournamentParticipationStatus.ELIMINATED and var_2_1 ~= MP.TournamentParticipationStatus.VICTORIOUS then
		Engine.BJDBIAGIDA(SOUND_SETS.prestige.prestigeCancel)
	end

	if Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG() then
		var_2_0.message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVEPARTYANDLOBBY")
	else
		var_2_0.message = Engine.CBBHFCGDIC("XBOXLIVE/LEAVELOBBY")
	end

	function var_2_0.yesAction(arg_3_0, arg_3_1)
		Tournament.DCEADJJC()
		Engine.EBIDFIDHIE("xstopprivateparty")
		Engine.EBIDFIDHIE("xstartprivateparty")
		LUI.FlowManager.RequestLeaveMenu(arg_2_1.TournamentBracket, true, true)
	end

	function var_2_0.noAction()
		return
	end

	local var_2_2 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_2_0)

	var_2_2.id = "LeaveTournament"

	return var_2_2
end

MenuBuilder.registerType("LeaveTournament", LeaveTournament)

function UpdateBracket(arg_5_0)
	local var_5_0 = Tournament.DEAFAIEJGI()

	for iter_5_0 = 1, var_5_0 + 1 do
		local var_5_1 = 2 * 2^(var_5_0 - iter_5_0)

		for iter_5_1 = 1, var_5_1 do
			local var_5_2 = iter_5_0 - 1
			local var_5_3 = (iter_5_1 - 1) / 2
			local var_5_4 = (iter_5_1 - 1) % 2
			local var_5_5 = Tournament.BCGGEDJHCG(var_5_2, var_5_3, var_5_4)

			if var_5_5 >= 0 then
				local var_5_6 = Tournament.DCFJHHBECC(var_5_2, var_5_3, var_5_4)
				local var_5_7 = Engine.CBBHFCGDIC(Tournament.DGEFHBHJDJ(var_5_5)) .. ":" .. var_5_6

				if Tournament.CCHGIAABHJ() == var_5_5 then
					var_5_7 = "->" .. var_5_7
				end

				arg_5_0.bracketList.roundList[iter_5_0].teamButton[iter_5_1].Text:setText(var_5_7, 0)
			else
				arg_5_0.bracketList.roundList[iter_5_0].teamButton[iter_5_1].Text:setText("")
			end

			if Tournament.BEBDGHGIEG(var_5_2, var_5_3) then
				arg_5_0.bracketList.roundList[iter_5_0].teamButton[iter_5_1].Text:SetRGBFromTable(COLORS.HighlightBlue)
			else
				arg_5_0.bracketList.roundList[iter_5_0].teamButton[iter_5_1].Text:SetRGBFromTable(COLORS.white)
			end
		end
	end

	local var_5_8 = Tournament.BEFJGJJBEI()

	if var_5_8 == 0 then
		arg_5_0.ReadyButton.Text:setText("NOT PARTICIPATING")
	elseif var_5_8 == 1 then
		if Tournament.DBEBAGHJCA() then
			arg_5_0.ReadyButton.Text:setText("READY UP (READY)")
		else
			arg_5_0.ReadyButton.Text:setText("READY UP (NOT READY)")
		end
	elseif var_5_8 == 2 then
		arg_5_0.ReadyButton.Text:setText("ELIMINATED")
	elseif var_5_8 == 3 then
		arg_5_0.ReadyButton.Text:setText("VICTORIOUS")
	end
end

local function var_0_2(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0:SetAlpha(0, 0)
	arg_6_0:SetAlpha(1, 400, LUI.EASING.outQuadratic)

	arg_6_0.menuModelPath = var_0_0

	DebugPrint("TournamentBracket - PostLoadFunc")

	local var_6_0 = _1080p * 35
	local var_6_1 = LUI.UIHorizontalList.new()

	var_6_1:SetAnchorsAndPosition(0, 1, 0, 1, 100 * _1080p, 200 * _1080p, 600 * _1080p, 700 * _1080p)
	var_6_1:SetAlignment(LUI.Alignment.Left)
	var_6_1:SetSpacing(var_6_0)

	var_6_1.id = "bracketList"

	var_6_1:SetNoWrap(true)
	arg_6_0:addElement(var_6_1)

	arg_6_0.bracketList = var_6_1

	local var_6_2 = Tournament.DEAFAIEJGI()

	var_6_1.roundList = {}

	for iter_6_0 = 1, var_6_2 + 1 do
		local var_6_3 = 40 * _1080p
		local var_6_4 = var_6_3 + 40 * _1080p
		local var_6_5 = {
			verticalAlignment = LUI.Alignment.Middle
		}
		local var_6_6 = LUI.UIVerticalList.new(var_6_5)

		var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, 0 * _1080p, 250 * _1080p, 0 * _1080p, 40 * _1080p)
		var_6_6:SetSpacing(var_6_4 * 2^(iter_6_0 - 1) - var_6_3)

		var_6_6.id = "roundList" .. iter_6_0

		var_6_6:SetNoWrap(true)
		var_6_1:addElement(var_6_6)

		var_6_1.roundList[iter_6_0] = var_6_6

		local var_6_7 = 2 * 2^(var_6_2 - iter_6_0)

		var_6_6.teamButton = {}

		for iter_6_1 = 1, var_6_7 do
			local var_6_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = arg_6_1
			})

			var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, 0 * _1080p, 250 * _1080p, 0 * _1080p, var_6_3)

			var_6_8.id = "teamButton" .. iter_6_0 .. "-" .. iter_6_1
			var_6_8.roundIndex = iter_6_0 - 1
			var_6_8.matchIndex = (iter_6_1 - 1) / 2

			var_6_8.Text:SetAlignment(LUI.Alignment.Left)
			var_6_8:addEventHandler("button_action", function(arg_7_0)
				Tournament.CIIGEAICBD(arg_7_0.roundIndex, arg_7_0.matchIndex)
			end)
			var_6_6:addElement(var_6_8)

			var_6_6.teamButton[iter_6_1] = var_6_8
		end
	end

	arg_6_0.ReadyButton:addEventHandler("button_action", function(arg_8_0)
		if Tournament.DBEBAGHJCA() then
			Tournament.DCEGEADDJG(0)
		else
			Tournament.DCEGEADDJG(1)
		end
	end)
	arg_6_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_1.controller or arg_6_1

		if not Lobby.AreWePrivatePartyHost() then
			LUI.FlowManager.RequestPopupMenu(nil, "LeaveTournament", true, var_9_0, false, {
				TournamentBracket = arg_6_0
			})
		else
			Tournament.DCEADJJC()
			ACTIONS.LeaveMenu(arg_6_0)
		end

		return true
	end)

	if not Lobby.GFFECBCCF() then
		Engine.DAGFFDGFII("xstartprivateparty", arg_6_1)
	end

	arg_6_0.ReadyButton.navigation = {}
	arg_6_0.ReadyButton.navigation.down = arg_6_0.bracketList
	arg_6_0.ReadyButton.navigation.left = arg_6_0.LobbyMembers
	arg_6_0.ReadyButton.navigation.right = arg_6_0.LobbyMembers
	arg_6_0.bracketList.navigation = {}
	arg_6_0.bracketList.navigation.up = arg_6_0.ReadyButton
	arg_6_0.bracketList.navigation.left = arg_6_0.LobbyMembers
	arg_6_0.bracketList.navigation.right = arg_6_0.LobbyMembers
	arg_6_0.LobbyMembers.navigation = {}
	arg_6_0.LobbyMembers.navigation.left = arg_6_0.ReadyButton
	arg_6_0.LobbyMembers.navigation.right = arg_6_0.ReadyButton

	local var_6_9 = LUI.UITimer.new({
		interval = 1000,
		event = {
			name = "refreshBracket"
		}
	})

	var_6_9.id = "RefreshBracketTimer"

	arg_6_0:addElement(var_6_9)
	arg_6_0:registerEventHandler("refreshBracket", function(arg_10_0, arg_10_1)
		UpdateBracket(arg_10_0)
	end)
	arg_6_0:processEvent({
		name = "refreshBracket"
	})
end

function TournamentBracket(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIHorizontalNavigator.new()

	var_11_0.id = "TournamentBracket"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	var_11_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_11_1
	})
	var_11_0.HelperBar.id = "HelperBar"

	var_11_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_11_0.HelperBar:setPriority(10)
	var_11_0:addElement(var_11_0.HelperBar)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "ReadyButton"

	var_11_4.Text:SetLeft(_1080p * 20, 0)
	var_11_4.Text:setText(ToUpperCase("READY"), 0)
	var_11_4.Text:SetAlignment(LUI.Alignment.Left)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 185, _1080p * 223)
	var_11_0:addElement(var_11_4)

	var_11_0.ReadyButton = var_11_4

	local var_11_5
	local var_11_6 = MenuBuilder.BuildRegisteredType("LobbyMembers", {
		controllerIndex = var_11_1
	})

	var_11_6.id = "LobbyMembers"

	var_11_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -589, _1080p * -96, _1080p * 215, _1080p * 859)
	var_11_0:addElement(var_11_6)

	var_11_0.LobbyMembers = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "MenuTitle"

	var_11_8.MenuTitle:setText(ToUpperCase("Tournament Bracket"), 0)
	var_11_8.Line:SetLeft(0, 0)
	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_11_0:addElement(var_11_8)

	var_11_0.MenuTitle = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "FrontendCameraMover"

	var_11_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 200, _1080p * -400, _1080p * 400)
	var_11_0:addElement(var_11_10)

	var_11_0.FrontendCameraMover = var_11_10

	local var_11_11

	if CONDITIONS.InFrontendPublicMP(var_11_0) then
		local var_11_12 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_11_1
		})

		var_11_12.id = "MPPlayerDetails"

		var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_11_0:addElement(var_11_12)

		var_11_0.MPPlayerDetails = var_11_12
	end

	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_11_13 = LUI.UIBindButton.new()

	var_11_13.id = "selfBindButton"

	var_11_0:addElement(var_11_13)

	var_11_0.bindButton = var_11_13

	var_11_0.bindButton:addEventHandler("button_start", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.controller or var_11_1

		ACTIONS.OpenOptionsMenu(var_12_0, "")
	end)
	var_0_2(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("TournamentBracket", TournamentBracket)
LUI.FlowManager.RegisterStackPopBehaviour("TournamentBracket", var_0_1)
LockTable(_M)
