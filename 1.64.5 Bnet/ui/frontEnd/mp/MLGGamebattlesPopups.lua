module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

function MLGGamebattlesFirstTimePopup(arg_1_0, arg_1_1)
	local var_1_0 = {
		title = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"),
		width = _1080p * 900
	}

	var_1_0.defaultFocusIndex = 1
	var_1_0.cancelClosesPopup = true

	local var_1_1 = {
		controllerIndex = arg_1_1.controllerIndex
	}
	local var_1_2 = MenuBuilder.BuildRegisteredType("GameBattlesFirstTimePopup", var_1_1)

	var_1_2.id = "GameBattlesFirstTimePopup"
	var_1_0.listContent = {}

	table.insert(var_1_0.listContent, var_1_2)

	local var_1_3 = MenuBuilder.BuildRegisteredType("PopupList", var_1_0)

	var_1_3.id = "MLGGamebattlesFirstTimePopup"

	return var_1_3
end

function MLGGamebattlesCannotConnectPopup(arg_2_0, arg_2_1)
	local var_2_0 = {
		popup_title = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"),
		message_text = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CANNOT_CONNECT")
	}
	local var_2_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_2_0)

	var_2_1.id = "MLGGamebattlesCannotConnectPopup"

	return var_2_1
end

function MLGGamebattlesNoSocialNetworkPrivilegesPopup(arg_3_0, arg_3_1)
	local var_3_0 = {
		popup_title = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"),
		message_text = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/NO_SOCIAL_PRIVILEGES")
	}
	local var_3_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_3_0)

	var_3_1.id = "MLGGamebattlesNoSocialNetworkPrivilegesPopup"

	return var_3_1
end

function MLGGameBattlesMatchHistoryFailPopup(arg_4_0, arg_4_1)
	local var_4_0 = {
		popup_title = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"),
		message_text = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_HISTORY_FAIL")
	}
	local var_4_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_4_0)

	var_4_1.id = "MLGGameBattlesMatchHistoryFailPopup"

	return var_4_1
end

function MLGGamebattlesUnregisteredPopup(arg_5_0, arg_5_1)
	local var_5_0 = {
		title = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/WELCOME"),
		width = _1080p * 800
	}

	var_5_0.defaultFocusIndex = 1
	var_5_0.cancelClosesPopup = true

	local var_5_1 = {
		controllerIndex = arg_5_1.controllerIndex
	}
	local var_5_2 = MenuBuilder.BuildRegisteredType("GameBattlesUnregisteredUserPopup", var_5_1)

	var_5_2.id = "GameBattlesUnregisteredUserPopup"
	var_5_0.listContent = {}

	table.insert(var_5_0.listContent, var_5_2)

	local var_5_3 = MenuBuilder.BuildRegisteredType("PopupList", var_5_0)

	var_5_3.id = "MLGGamebattlesUnregisteredPopup"

	return var_5_3
end

function MLGGamebattlesMatchExpiredPopup(arg_6_0, arg_6_1)
	local var_6_0 = {
		popup_title = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"),
		message_text = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_EXPIRED", arg_6_1.matchID)
	}
	local var_6_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_6_0)

	var_6_1.id = "MLGGamebattlesMatchExpiredPopup"

	return var_6_1
end

function MLGGamebattlesMatchCancelledPopup(arg_7_0, arg_7_1)
	local var_7_0 = {
		popup_title = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"),
		message_text = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/NO_DEDICATED_SERVER", arg_7_1.matchID)
	}
	local var_7_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_7_0)

	var_7_1.id = "MLGGamebattlesMatchCancelledPopup"

	return var_7_1
end

function MLGGamebattlesMatchForfeitPopup(arg_8_0, arg_8_1)
	local var_8_0 = MenuBuilder.BuildRegisteredType("GameBattlesMatchForfeit", arg_8_1)

	var_8_0.id = "GameBattlesMatchForfeit"

	local var_8_1 = {
		hideFrame = true,
		defaultFocusIndex = 1,
		title = "",
		cancelClosesPopup = true,
		width = _1080p * 1710,
		listContent = {
			var_8_0
		}
	}
	local var_8_2 = MenuBuilder.BuildRegisteredType("PopupList", var_8_1)

	var_8_2.id = "MLGGamebattlesMatchForfeitPopup"

	return var_8_2
end

function MLGGamebattlesMatchResultsPopup(arg_9_0, arg_9_1)
	local var_9_0 = MenuBuilder.BuildRegisteredType("GameBattlesMatchResults", arg_9_1)

	var_9_0.id = "GameBattlesMatchResults"

	local var_9_1 = {
		hideFrame = true,
		defaultFocusIndex = 1,
		title = "",
		cancelClosesPopup = true,
		width = _1080p * 1710,
		listContent = {
			var_9_0
		}
	}
	local var_9_2 = MenuBuilder.BuildRegisteredType("PopupList", var_9_1)

	var_9_2.id = "MLGGamebattlesMatchResultsPopup"

	return var_9_2
end

function MLGGamebattlesCantJoinGamePopup(arg_10_0, arg_10_1)
	local var_10_0 = {
		popup_title = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"),
		message_text = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CANNOT_JOIN_GAME")
	}
	local var_10_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_10_0)

	var_10_1.id = "MLGGamebattlesCantJoinGamePopup"

	return var_10_1
end

function MLGGamebattlesCantHostGamePopup(arg_11_0, arg_11_1)
	local var_11_0 = {
		popup_title = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"),
		message_text = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CANNOT_HOST_GAME")
	}
	local var_11_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_11_0)

	var_11_1.id = "MLGGamebattlesCantHostGamePopup"

	return var_11_1
end

local function var_0_0(arg_12_0, arg_12_1)
	local var_12_0 = {}

	var_12_0.width = 600
	var_12_0.title = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS")
	var_12_0.message = Engine.CBBHFCGDIC("MLG_GAMEBATTLES/SPLITSCREEN_WARNING")
	var_12_0.defaultFocusIndex = 1
	var_12_0.cancelClosesPopup = true
	var_12_0.buttonsClosePopup = true

	local var_12_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_12_0)

	var_12_1.id = "MLGGamebattlesSplitscreenPopup"

	return var_12_1
end

MenuBuilder.registerType("MLGGamebattlesFirstTimePopup", MLGGamebattlesFirstTimePopup)
MenuBuilder.registerType("MLGGamebattlesCannotConnectPopup", MLGGamebattlesCannotConnectPopup)
MenuBuilder.registerType("MLGGamebattlesNoSocialNetworkPrivilegesPopup", MLGGamebattlesNoSocialNetworkPrivilegesPopup)
MenuBuilder.registerType("MLGGameBattlesMatchHistoryFailPopup", MLGGameBattlesMatchHistoryFailPopup)
MenuBuilder.registerType("MLGGamebattlesUnregisteredPopup", MLGGamebattlesUnregisteredPopup)
MenuBuilder.registerType("MLGGamebattlesMatchCancelledPopup", MLGGamebattlesMatchCancelledPopup)
MenuBuilder.registerType("MLGGamebattlesMatchExpiredPopup", MLGGamebattlesMatchExpiredPopup)
MenuBuilder.registerType("MLGGamebattlesMatchForfeitPopup", MLGGamebattlesMatchForfeitPopup)
MenuBuilder.registerType("MLGGamebattlesMatchResultsPopup", MLGGamebattlesMatchResultsPopup)
MenuBuilder.registerType("MLGGamebattlesCantJoinGamePopup", MLGGamebattlesCantJoinGamePopup)
MenuBuilder.registerType("MLGGamebattlesCantHostGamePopup", MLGGamebattlesCantHostGamePopup)
MenuBuilder.registerType("MLGGamebattlesSplitscreenPopup", var_0_0)
