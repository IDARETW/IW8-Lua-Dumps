module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = LUI.PostGameManager.IsPostGame(arg_1_1.controllerIndex)
	local var_1_1 = DataSources.inGame.MP.brSquadEliminatedActive:GetValue(arg_1_1.controllerIndex) >= 1

	DebugPrint("------ Play Again State: brSquadEliminatedActive: " .. tostring(var_1_1))

	local var_1_2 = not var_1_1 and not var_1_0

	if CONDITIONS.IsBloodMoney() or CONDITIONS.IsRiskGametype() or CONDITIONS.IsWZRatRace() or CONDITIONS.IsBRKingSlayer() then
		DebugPrint("------ Play Again State: gametype check entered")

		var_1_2 = false
	else
		local var_1_3 = DataSources.inGame.MP.brPlayerPosition:GetValue(arg_1_1.controllerIndex)

		DebugPrint("------ Play Again State: playerPosition: " .. tostring(var_1_3))

		if var_1_3 == 1 then
			var_1_2 = false
		end
	end

	local var_1_4 = Engine.CBBHFCGDIC("MP_BR_INGAME/PLAY_AGAIN_PARTY_HOST_DESC")

	if var_1_2 then
		var_1_4 = var_1_4 .. "\n" .. Engine.CBBHFCGDIC("MP_BR_INGAME/PLAY_AGAIN_PARTY_HOST_LEAVE_PARTY_WARNING")
	end

	local var_1_5 = {
		title = Engine.CBBHFCGDIC("PLATFORM_UI/EOG_SUMMARY_PLAY_AGAIN"),
		message = var_1_4,
		buttons = {
			{
				label = Engine.CBBHFCGDIC("MENU/LEAVE_WITH_PARTY"),
				disabled = var_1_2,
				action = function(arg_2_0, arg_2_1)
					BR.SetPlayAgainChoice(BR.PlayAgainChoice.WITH_PARTY)
					BR.ExecuteBREndTransition(arg_2_0, arg_2_1, BR.PLAY_AGAIN_WITH_PARTY_COMMAND)
				end
			},
			{
				label = Engine.CBBHFCGDIC("MENU/LEAVE_WITHOUT_PARTY"),
				action = function(arg_3_0, arg_3_1)
					BR.SetPlayAgainChoice(BR.PlayAgainChoice.WITHOUT_PARTY)
					BR.ExecuteBREndTransition(arg_3_0, arg_3_1, BR.PLAY_AGAIN_WITHOUT_PARTY_COMMAND)
				end
			},
			{
				label = Engine.CBBHFCGDIC("MENU/CANCEL"),
				action = function(arg_4_0, arg_4_1)
					return
				end
			}
		}
	}
	local var_1_6 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_1_5)

	var_1_6.id = "PlayAgainPartyHostPopup"

	return var_1_6
end

MenuBuilder.registerType("PlayAgainPartyHostPopup", var_0_0)

local function var_0_1(arg_5_0, arg_5_1)
	local var_5_0 = {
		title = Engine.CBBHFCGDIC("PLATFORM_UI/EOG_SUMMARY_PLAY_AGAIN"),
		message = Engine.CBBHFCGDIC("MP_BR_INGAME/PLAY_AGAIN_DESC"),
		yesAction = function(arg_6_0, arg_6_1)
			BR.SetPlayAgainChoice(BR.PlayAgainChoice.WITHOUT_PARTY)
			BR.ExecuteBREndTransition(arg_6_0, arg_6_1, BR.PLAY_AGAIN_WITHOUT_PARTY_COMMAND)
		end
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_5_0)

	var_5_1.id = "PlayAgainPopup"

	return var_5_1
end

MenuBuilder.registerType("PlayAgainPopup", var_0_1)

local function var_0_2(arg_7_0, arg_7_1)
	local var_7_0 = {
		title = Engine.CBBHFCGDIC("PLATFORM_UI/EOG_SUMMARY_PLAY_AGAIN"),
		message = Engine.CBBHFCGDIC("MP_BR_INGAME/PLAY_AGAIN_LEAVE_PARTY_DESC"),
		yesAction = function(arg_8_0, arg_8_1)
			BR.SetPlayAgainChoice(BR.PlayAgainChoice.WITHOUT_PARTY)
			BR.ExecuteBREndTransition(arg_8_0, arg_8_1, BR.PLAY_AGAIN_WITHOUT_PARTY_COMMAND)
		end
	}
	local var_7_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_7_0)

	var_7_1.id = "PlayAgainPartyMemberPopup"

	return var_7_1
end

MenuBuilder.registerType("PlayAgainPartyMemberPopup", var_0_2)

local function var_0_3(arg_9_0, arg_9_1)
	local var_9_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/RESTART_PRACTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/RESTART_PRACTICE_DESC"),
		yesAction = function(arg_10_0, arg_10_1)
			Engine.EBIDFIDHIE("map_restart")
		end
	}
	local var_9_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_9_0)

	var_9_1.id = "RestartPracticePopup"

	return var_9_1
end

MenuBuilder.registerType("RestartPracticePopup", var_0_3)

local function var_0_4(arg_11_0, arg_11_1)
	local var_11_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/RESTART_PRACTICE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/RESTART_PRACTICE_DESC"),
		yesAction = function(arg_12_0, arg_12_1)
			BR.ExecuteBREndTransition(arg_12_0, arg_12_1, "map_restart")
		end
	}
	local var_11_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_11_0)

	var_11_1.id = "EndRestartPracticePopup"

	return var_11_1
end

MenuBuilder.registerType("EndRestartPracticePopup", var_0_4)

local function var_0_5(arg_13_0, arg_13_1)
	local var_13_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU_MP/LEAVE_PLAY_AGAIN_SQUAD"),
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/LEAVE_PLAY_AGAIN_SQUAD_DESC"),
		yesAction = function(arg_14_0, arg_14_1)
			if arg_13_1.buttons then
				arg_13_1.buttons:processEvent({
					name = "leave_play_again_squad"
				})
			end

			LUI.FlowManager.RequestLeaveMenuByName("LeavePlayAgainSquadPopup", true, true)
		end
	}
	local var_13_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_13_0)

	var_13_1.id = "LeavePlayAgainSquadPopup"

	return var_13_1
end

MenuBuilder.registerType("LeavePlayAgainSquadPopup", var_0_5)
LockTable(_M)
