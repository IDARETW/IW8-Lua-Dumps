module(..., package.seeall)
LUI.FlowManager.RequestSetStack("TrialEventMP", {
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

local function var_0_0()
	Dvar.DHEGHJJJHI("LNQLRSNMQS", false)
	Dvar.DHEGHJJJHI("TKRPRPOSQ", false)
	Dvar.DHEGHJJJHI("LOQKLRKQMO", false)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		if Lobby.CAEJIEEEDF() > 0 then
			Lobby.CJBHJEAFGH(0)
		end

		Lobby.LeaveCustomGameLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_2_0, true, true)

		return true
	end)

	if Engine.BHICADFIHA() then
		arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_right_trigger",
			priority = 100,
			helper_text = Engine.JCBDICCAH("DEBUG advance medal")
		})
		arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_shoulderl",
			priority = 101,
			helper_text = Engine.JCBDICCAH("DEBUG event start time - 1 day")
		})
		arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_shoulderr",
			priority = 102,
			helper_text = Engine.JCBDICCAH("DEBUG event start time + 1 day")
		})
	end
end

function TrialEventMP(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "TrialEventMP"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	var_4_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})
	var_4_0.HelperBar.id = "HelperBar"

	var_4_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_4_0.HelperBar:setPriority(10)
	var_4_0:addElement(var_4_0.HelperBar)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("TrialEventContainer", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "TrialEventContainer"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_4_0:addElement(var_4_4)

	var_4_0.TrialEventContainer = var_4_4

	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt2",
		helper_text = Engine.CBBHFCGDIC("TRIALEVENT/OPEN_LEADERBOARD")
	})

	local var_4_5 = LUI.UIBindButton.new()

	var_4_5.id = "selfBindButton"

	var_4_0:addElement(var_4_5)

	var_4_0.bindButton = var_4_5

	var_4_0.bindButton:addEventHandler("button_start", function(arg_5_0, arg_5_1)
		local var_5_0 = arg_5_1.controller or var_4_1

		ACTIONS.OpenOptionsMenu(var_5_0, "LUA_MENU/QUICK_OPTIONS", "")
	end)
	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("TrialEventMP", TrialEventMP)
LUI.FlowManager.RegisterStackPopBehaviour("TrialEventMP", var_0_0)
LockTable(_M)
