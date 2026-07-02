SURVEY = SURVEY or {}

function SURVEY.SendSurveyDlogResponseEvent(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	Engine.CEJJDJJHIJ(arg_1_0, "dlog_event_client_survey_response_data", {
		button_order = arg_1_1,
		button_selection = arg_1_2,
		is_quitter = arg_1_3
	})
end

function SURVEY.PostGameSurveyYesButtonPressed(arg_2_0, arg_2_1, arg_2_2)
	SURVEY.SendSurveyDlogResponseEvent(arg_2_0, arg_2_1, 0, arg_2_2)
	Engine.EEDIGBACC(arg_2_0, arg_2_1, 0, arg_2_2)
end

function SURVEY.PostGameSurveyNoButtonPressed(arg_3_0, arg_3_1, arg_3_2)
	SURVEY.SendSurveyDlogResponseEvent(arg_3_0, arg_3_1, 1, arg_3_2)
	Engine.EEDIGBACC(arg_3_0, arg_3_1, 1, arg_3_2)
end

function SURVEY.PostGameSurveySkipButtonPressed(arg_4_0, arg_4_1, arg_4_2)
	SURVEY.SendSurveyDlogResponseEvent(arg_4_0, arg_4_1, 2, arg_4_2)
	Engine.EEDIGBACC(arg_4_0, arg_4_1, 2, arg_4_2)
end

function SURVEY.PostGameSurveyBackButtonPressed(arg_5_0, arg_5_1, arg_5_2)
	SURVEY.SendSurveyDlogResponseEvent(arg_5_0, arg_5_1, 3, arg_5_2)
	Engine.EEDIGBACC(arg_5_0, arg_5_1, 3, arg_5_2)
end

function SURVEY.OpenPostGameSurveyIfRequired(arg_6_0, arg_6_1)
	if not IsPublicMatch() then
		return false
	end

	if Engine.BAJIADIDFC() == true then
		Dvar.DHEGHJJJHI("LRKSQRLNKN", false)

		local var_6_0 = math.random(0, 5)
		local var_6_1 = {}

		if var_6_0 == 0 then
			var_6_1.label1 = Engine.CBBHFCGDIC("LUA_MENU/SURVEY_POST_MATCH_SKIP")
			var_6_1.action1 = SURVEY.PostGameSurveySkipButtonPressed
			var_6_1.label2 = Engine.CBBHFCGDIC("LUA_MENU/YES")
			var_6_1.action2 = SURVEY.PostGameSurveyYesButtonPressed
			var_6_1.label3 = Engine.CBBHFCGDIC("LUA_MENU/NO")
			var_6_1.action3 = SURVEY.PostGameSurveyNoButtonPressed
		elseif var_6_0 == 1 then
			var_6_1.label1 = Engine.CBBHFCGDIC("LUA_MENU/SURVEY_POST_MATCH_SKIP")
			var_6_1.action1 = SURVEY.PostGameSurveySkipButtonPressed
			var_6_1.label2 = Engine.CBBHFCGDIC("LUA_MENU/NO")
			var_6_1.action2 = SURVEY.PostGameSurveyNoButtonPressed
			var_6_1.label3 = Engine.CBBHFCGDIC("LUA_MENU/YES")
			var_6_1.action3 = SURVEY.PostGameSurveyYesButtonPressed
		elseif var_6_0 == 2 then
			var_6_1.label1 = Engine.CBBHFCGDIC("LUA_MENU/YES")
			var_6_1.action1 = SURVEY.PostGameSurveyYesButtonPressed
			var_6_1.label2 = Engine.CBBHFCGDIC("LUA_MENU/NO")
			var_6_1.action2 = SURVEY.PostGameSurveyNoButtonPressed
			var_6_1.label3 = Engine.CBBHFCGDIC("LUA_MENU/SURVEY_POST_MATCH_SKIP")
			var_6_1.action3 = SURVEY.PostGameSurveySkipButtonPressed
		elseif var_6_0 == 3 then
			var_6_1.label1 = Engine.CBBHFCGDIC("LUA_MENU/YES")
			var_6_1.action1 = SURVEY.PostGameSurveyYesButtonPressed
			var_6_1.label2 = Engine.CBBHFCGDIC("LUA_MENU/SURVEY_POST_MATCH_SKIP")
			var_6_1.action2 = SURVEY.PostGameSurveySkipButtonPressed
			var_6_1.label3 = Engine.CBBHFCGDIC("LUA_MENU/NO")
			var_6_1.action3 = SURVEY.PostGameSurveyNoButtonPressed
		elseif var_6_0 == 4 then
			var_6_1.label1 = Engine.CBBHFCGDIC("LUA_MENU/NO")
			var_6_1.action1 = SURVEY.PostGameSurveyNoButtonPressed
			var_6_1.label2 = Engine.CBBHFCGDIC("LUA_MENU/YES")
			var_6_1.action2 = SURVEY.PostGameSurveyYesButtonPressed
			var_6_1.label3 = Engine.CBBHFCGDIC("LUA_MENU/SURVEY_POST_MATCH_SKIP")
			var_6_1.action3 = SURVEY.PostGameSurveySkipButtonPressed
		elseif var_6_0 == 5 then
			var_6_1.label1 = Engine.CBBHFCGDIC("LUA_MENU/NO")
			var_6_1.action1 = SURVEY.PostGameSurveyNoButtonPressed
			var_6_1.label2 = Engine.CBBHFCGDIC("LUA_MENU/SURVEY_POST_MATCH_SKIP")
			var_6_1.action2 = SURVEY.PostGameSurveySkipButtonPressed
			var_6_1.label3 = Engine.CBBHFCGDIC("LUA_MENU/YES")
			var_6_1.action3 = SURVEY.PostGameSurveyYesButtonPressed
		end

		var_6_1.buttonOrder = var_6_0
		var_6_1.isQuitter = arg_6_1

		LUI.FlowManager.RequestPopupMenu(unused, "PostMatchSurveyPopup", false, arg_6_0, false, var_6_1)
	end
end
