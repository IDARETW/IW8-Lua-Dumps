module(..., package.seeall)

function LobbyMemberKick(arg_1_0, arg_1_1)
	assert(arg_1_1.xuid)

	local var_1_0 = Engine.JCBDICCAH(Lobby.BGHECFACAB(arg_1_1.xuid))
	local var_1_1 = {
		title = Engine.CBBHFCGDIC("MPUI/KICK_PLAYER"),
		message = Engine.CBBHFCGDIC("XBOXLIVE/KICKPLAYER", var_1_0),
		yesAction = function(arg_2_0, arg_2_1)
			Lobby.DFFAEAIHGG(arg_1_1.xuid)
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
	local var_4_0 = arg_4_1.xuid

	assert(var_4_0)

	local var_4_1 = Lobby.CHBBHFHJEH(var_4_0)
	local var_4_2 = {
		title = Engine.CBBHFCGDIC("MPUI/PLAYER_OPTIONS")
	}

	var_4_2.message = ""
	var_4_2.buttons = {}

	local var_4_3 = Lobby.BBDICGHE()

	if not var_4_3 or not Lobby.DFFFFJHCEH() or not IsPrivateMatch() then
		local var_4_4

		var_4_4 = not var_4_3 and Lobby.BGIADHIHAG()
	end

	var_4_2.buttons = FRIENDS.GetLobbyMemberActions(arg_4_1)

	for iter_4_0, iter_4_1 in pairs(var_4_2.buttons) do
		if iter_4_1.disabledFunc then
			local var_4_5 = iter_4_1.disabledFunc()

			if type(var_4_5) == "table" then
				iter_4_1.disabled = var_4_5.disabled
			else
				iter_4_1.disabled = var_4_5
			end
		end
	end

	local var_4_6 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_4_2)

	var_4_6.id = "LobbyMemberActions"

	return var_4_6
end

if not LobbyMember then
	LobbyMember = {}
end

function playerUnmutable()
	local var_5_0 = {
		message_text = Engine.CBBHFCGDIC("XBOXLIVE/EXTERNALMUTE_TITLE"),
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		button_text = Engine.CBBHFCGDIC("MENU/OK")
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_5_0)

	var_5_1.id = "playerUnmutable"

	return var_5_1
end

MenuBuilder.registerType("playerUnmutable", playerUnmutable)
MenuBuilder.registerType("LobbyMemberKick", LobbyMemberKick)
MenuBuilder.registerType("LobbyMemberActions", LobbyMemberActions)
LockTable(_M)
