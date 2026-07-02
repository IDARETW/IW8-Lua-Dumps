module(..., package.seeall)

function LobbyMemberKick(arg_1_0, arg_1_1)
	assert(arg_1_1.xuid)

	local var_1_0 = Engine.JCBDICCAH(Lobby.BGHECFACAB(arg_1_1.xuid))
	local var_1_1 = {
		title = Engine.CBBHFCGDIC("MPUI/KICK_PLAYER"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/KICKPLAYER", var_1_0),
		yesAction = function(arg_2_0, arg_2_1)
			Lobby.DFFAEAIHGG(arg_1_1.xuid)
			DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue(arg_2_1, METRICS.LFPVariables.PARTY_END_REASON, Lobby.LFPEvents.KICK)
		end,
		noAction = function()
			return
		end
	}

	var_1_1.useBnetFont = true

	local var_1_2 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_1_1)

	var_1_2.id = "LobbyMemberKick"

	return var_1_2
end

function LobbyMemberActions(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.isWZPrivateMatch
	local var_4_1 = arg_4_1.xuid

	assert(var_4_1)

	local var_4_2 = Lobby.CHBBHFHJEH(var_4_1)
	local var_4_3 = {
		title = Engine.CBBHFCGDIC("MPUI/PLAYER_OPTIONS")
	}

	var_4_3.message = ""
	var_4_3.buttons = {}
	var_4_3.isWZPrivateMatch = arg_4_1.isWZPrivateMatch

	local var_4_4 = Lobby.BBDICGHE()

	if not var_4_4 or not Lobby.DFFFFJHCEH() or not IsPrivateMatch() then
		local var_4_5

		var_4_5 = not var_4_4 and Lobby.BGIADHIHAG()
	end

	if var_4_0 then
		var_4_3.buttons = FRIENDS.GetWZPrivateMatchLobbyMemberActions(arg_4_1)
	else
		var_4_3.buttons = FRIENDS.GetLobbyMemberActions(arg_4_1)
	end

	for iter_4_0, iter_4_1 in pairs(var_4_3.buttons) do
		if iter_4_1.disabledFunc then
			local var_4_6 = iter_4_1.disabledFunc()

			if type(var_4_6) == "table" then
				iter_4_1.disabled = var_4_6.disabled
			else
				iter_4_1.disabled = var_4_6
			end
		end
	end

	local var_4_7 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_4_3)

	var_4_7.id = "LobbyMemberActions"

	return var_4_7
end

function LobbySquadActions(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.isWZPrivateMatch
	local var_5_1 = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_SELECTION")
	}

	var_5_1.message = ""
	var_5_1.controllerIndex = arg_5_1.controllerIndex
	var_5_1.buttons = {}
	var_5_1.isWZPrivateMatch = arg_5_1.isWZPrivateMatch
	var_5_1.buttons = FRIENDS.GetWZPrivateMatchLobbySquadActions(arg_5_1)

	for iter_5_0, iter_5_1 in pairs(var_5_1.buttons) do
		if iter_5_1.disabledFunc then
			local var_5_2 = iter_5_1.disabledFunc()

			if type(var_5_2) == "table" then
				iter_5_1.disabled = var_5_2.disabled
			else
				iter_5_1.disabled = var_5_2
			end
		end
	end

	local var_5_3 = MenuBuilder.BuildRegisteredType("SquadAssignmentPopup", var_5_1)

	var_5_3.id = "LobbySquadActions"

	return var_5_3
end

if not LobbyMember then
	LobbyMember = {}
end

function playerUnmutable()
	local var_6_0 = {
		message_text = Engine.CBBHFCGDIC("XBOXLIVE/EXTERNALMUTE_TITLE"),
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		button_text = Engine.CBBHFCGDIC("MENU/OK")
	}
	local var_6_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_6_0)

	var_6_1.id = "playerUnmutable"

	return var_6_1
end

MenuBuilder.registerType("playerUnmutable", playerUnmutable)
MenuBuilder.registerType("LobbyMemberKick", LobbyMemberKick)
MenuBuilder.registerType("LobbyMemberActions", LobbyMemberActions)
MenuBuilder.registerType("LobbySquadActions", LobbySquadActions)
LockTable(_M)
