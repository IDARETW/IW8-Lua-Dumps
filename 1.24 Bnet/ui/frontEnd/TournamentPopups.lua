module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = {
		title = Engine.CBBHFCGDIC("TOURNAMENT/WARNING"),
		message = Engine.CBBHFCGDIC("TOURNAMENT/WARNING_MESSAGE"),
		controllerIndex = arg_1_1.controllerIndex,
		buttons = {
			{
				label = Engine.CBBHFCGDIC("TOURNAMENT/WARNING_CONFIRM"),
				action = function()
					LUI.FlowManager.RequestLeaveMenu(self)
				end
			}
		}
	}

	return MenuBuilder.BuildRegisteredType("GenericImagePopup", var_1_0)
end

local function var_0_1(arg_3_0, arg_3_1)
	assert(arg_3_1.menu)

	local var_3_0 = {
		title = Engine.CBBHFCGDIC("TOURNAMENT/WARNING")
	}

	Engine.BJDBIAGIDA(SOUND_SETS.prestige.prestigeCancel)

	if Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG() then
		var_3_0.message = Engine.CBBHFCGDIC("TOURNAMENT/LEAVE_PARTY_AND_TOURNAMENT")
	else
		var_3_0.message = Engine.CBBHFCGDIC("TOURNAMENT/LEAVE_TOURNAMENT")
	end

	function var_3_0.yesAction(arg_4_0, arg_4_1)
		Tournament.DCEADJJC()
		Lobby.LeavePublicLobby()
		Lobby.LeaveCommonMPMainMenu(arg_3_1.menu, arg_4_1)
		LUI.FlowManager.RequestLeaveMenu(arg_3_1.menu, true, true)
	end

	local var_3_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_3_0)

	var_3_1.id = "LeaveTournamentHoldingPen"

	return var_3_1
end

local function var_0_2(arg_5_0, arg_5_1)
	assert(arg_5_1.menu)

	local var_5_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("TOURNAMENT/LEAVE_PARTY_REGISTRATION")
	}

	Engine.BJDBIAGIDA(SOUND_SETS.prestige.prestigeCancel)

	function var_5_0.yesAction(arg_6_0, arg_6_1)
		Lobby.LeavePublicLobby()
		Lobby.LeaveCommonMPMainMenu(arg_5_1.menu, arg_6_1)
		LUI.FlowManager.RequestLeaveMenu(arg_5_1.menu, true, true)
	end

	local var_5_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_5_0)

	var_5_1.id = "LeavePartyAndCancelTournamentRegistration"

	return var_5_1
end

local function var_0_3(arg_7_0, arg_7_1)
	assert(arg_7_1.menu)

	local var_7_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("TOURNAMENT/CANCEL_MESSAGE")
	}

	Engine.BJDBIAGIDA(SOUND_SETS.prestige.prestigeCancel)

	function var_7_0.yesAction(arg_8_0, arg_8_1)
		if TOURNAMENT.CanCancelRegistration(arg_8_1) then
			Tournament.FFFECBJGJ(arg_8_1)
			LUI.FlowManager.RequestLeaveMenu(arg_7_1.menu, true, true)
		else
			LUI.FlowManager.RequestLeaveMenu(arg_8_0, true, true)
		end
	end

	local var_7_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_7_0)

	var_7_1.id = "CancelTournamentSignUp"

	local var_7_2 = LUI.UITimer.new({
		interval = 500,
		event = "check_for_matchmaking"
	})

	var_7_2.id = "timer"

	var_7_1:addElement(var_7_2)
	var_7_1:registerEventHandler("check_for_matchmaking", function(arg_9_0, arg_9_1)
		if Tournament.BAEACBHFGF() then
			LUI.FlowManager.RequestLeaveMenu(arg_9_0, true, true)
		end
	end)

	local function var_7_3()
		local var_10_0 = Lobby.GFFECBCCF()
		local var_10_1 = Lobby.BGIADHIHAG()
		local var_10_2 = var_10_0 and not var_10_1

		var_10_2 = var_10_2 or not TOURNAMENT.CanCancelRegistration(controllerIndex)

		if var_10_2 then
			LUI.FlowManager.RequestLeaveMenu(var_7_1, true, true)
		end
	end

	local var_7_4 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_7_5 = DataSources.frontEnd.lobby.memberCount

	var_7_1:SubscribeToModel(var_7_4:GetModel(controllerIndex), var_7_3)
	var_7_1:SubscribeToModel(var_7_5:GetModel(controllerIndex), var_7_3)

	return var_7_1
end

function TournamentNoSplitscreen()
	local var_11_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/SPLITSCREEN_SINGLE_UNSUPPORTED_MODE", Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT"))
	}
	local var_11_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_11_0)

	var_11_1.id = "TournamentNoSplitscreen"

	return var_11_1
end

function TournamentTooManyPlayers()
	local var_12_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message = Engine.CBBHFCGDIC("TOURNAMENT/MAX_PARTY_WARNING", Tournament.BJDIDJCEAA())
	}
	local var_12_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_12_0)

	var_12_1.id = "TournamentTooManyPlayers"

	return var_12_1
end

MenuBuilder.registerType("LeaveTournamentHoldingPen", var_0_1)
MenuBuilder.registerType("LeavePartyAndCancelTournamentRegistration", var_0_2)
MenuBuilder.registerType("TournamentWarningPopup", var_0_0)
MenuBuilder.registerType("TournamentNoSplitscreen", TournamentNoSplitscreen)
MenuBuilder.registerType("TournamentTooManyPlayers", TournamentTooManyPlayers)
MenuBuilder.registerType("CancelTournamentSignUp", var_0_3)
LockTable(_M)
