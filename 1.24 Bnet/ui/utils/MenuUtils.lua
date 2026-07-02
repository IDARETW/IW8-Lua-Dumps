MenuUtils = MenuUtils or {}
MenuUtils.MenusBlockingConnectionPopups = {
	"popup_leave_game",
	"leave_public_mp_lobby",
	"leave_private_mp_lobby",
	"MPPauseMenu"
}
MenuUtils.FENCEDLCTIMER = 5000

function MenuUtils.AddDismissPauseMenuKBMHandler(arg_1_0)
	arg_1_0:addEventHandler("gamepad_button", function(arg_2_0, arg_2_1)
		if arg_2_1.down and arg_2_1.button == "dismiss_pause_menu" and not Engine.DDJFBBJAIG() then
			if Engine.CAADCDEEIA() then
				ACTIONS.ResumeGame(arg_2_0)
			end

			local var_2_0 = Engine.DBFFAEEFGJ().flowManager:GetStackTop()

			LUI.FlowManager.RequestCloseAllMenus(var_2_0.name, true, arg_2_1.controller)

			return true
		end

		return false
	end)
end

function MenuUtils.CanShowConnectionPopups()
	local var_3_0 = true
	local var_3_1 = Engine.DBFFAEEFGJ().flowManager:GetStackTop()

	if var_3_1 then
		for iter_3_0, iter_3_1 in ipairs(MenuUtils.MenusBlockingConnectionPopups) do
			if iter_3_1 == var_3_1.name then
				var_3_0 = false

				break
			end
		end
	end

	return var_3_0
end

function MenuUtils.GetOrdinalPlacment(arg_4_0)
	local var_4_0 = ""

	if arg_4_0 < 100 then
		if arg_4_0 == 11 or arg_4_0 == 12 or arg_4_0 == 13 then
			var_4_0 = "MP/FOURTH_PLACE"
		elseif arg_4_0 % 10 == 1 then
			var_4_0 = "MP/FIRST_PLACE"
		elseif arg_4_0 % 10 == 2 then
			var_4_0 = "MP/SECOND_PLACE"
		elseif arg_4_0 % 10 == 3 then
			var_4_0 = "MP/THIRD_PLACE"
		else
			var_4_0 = "MP/FOURTH_PLACE"
		end
	elseif arg_4_0 >= 100 then
		var_4_0 = (arg_4_0 % 100 == 11 or arg_4_0 % 100 == 12 or arg_4_0 % 100 == 13) and "MP/FOURTH_PLACE" or arg_4_0 % 100 == 1 and "MP/FIRST_PLACE" or arg_4_0 % 100 == 2 and "MP/SECOND_PLACE" or arg_4_0 % 100 == 3 and "MP/THIRD_PLACE" or "MP/FOURTH_PLACE"
	end

	return (Engine.CBBHFCGDIC(var_4_0, arg_4_0))
end

function MenuUtils.GetOrdinalNumber(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1 and "_FEM" or ""

	if arg_5_0 == 1 then
		return Engine.CBBHFCGDIC("MP/FIRST_PLACE" .. var_5_0, arg_5_0)
	elseif arg_5_0 == 2 then
		return Engine.CBBHFCGDIC("MP/SECOND_PLACE" .. var_5_0, arg_5_0)
	elseif arg_5_0 == 3 then
		return Engine.CBBHFCGDIC("MP/THIRD_PLACE" .. var_5_0, arg_5_0)
	else
		return Engine.CBBHFCGDIC("MP/FOURTH_PLACE" .. var_5_0, arg_5_0)
	end
end

function MenuUtils.SetupSceneChangeCallback(arg_6_0, arg_6_1)
	assert(arg_6_1 and type(arg_6_1) == "function")

	arg_6_0._sceneTimer = LUI.UITimer.new({
		interval = 50,
		event = "check_scene_transition"
	})

	arg_6_0:addElement(arg_6_0._sceneTimer)
	arg_6_0:registerEventHandler("check_scene_transition", function(arg_7_0, arg_7_1)
		if #Dvar.DHEEJCCJBH("NRLKQRRMKK") == 0 and Engine.DHEEHAJFEA() then
			arg_7_0._sceneTimer:closeTree()

			arg_7_0._sceneTimer = nil

			arg_6_1()
		end

		return true
	end)
end

function MenuUtils.WaitForEntitySystem(arg_8_0, arg_8_1)
	assert(arg_8_1 and type(arg_8_1) == "function")

	arg_8_0._entitySystemTimer = LUI.UITimer.new({
		interval = 100,
		event = "check_entity_system_allocated"
	})

	arg_8_0:addElement(arg_8_0._entitySystemTimer)
	arg_8_0:registerEventHandler("check_entity_system_allocated", function(arg_9_0, arg_9_1)
		if Engine.DHEEHAJFEA() and arg_9_0._entitySystemTimer then
			arg_9_0._entitySystemTimer:closeTree()

			arg_9_0._entitySystemTimer = nil

			arg_8_1()
		end

		return true
	end)
end

function MenuUtils.GetMainMenu()
	if Engine.EAIICIFIFA() then
		return "CPMainMenu"
	elseif Engine.ECHCFGDDDF() then
		if Engine.HEEFCICJE() then
			return "BRMainMenu"
		else
			return "MPMainMenu"
		end
	else
		return "MainMeu"
	end
end
