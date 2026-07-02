module(..., package.seeall)
LUI.FlowManager.RequestSetStack("TrialsBR", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "BRMainMenu"
	}
})

local function var_0_0()
	Dvar.DHEGHJJJHI("LNQLRSNMQS", false)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.bindButton)
	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		if Lobby.CAEJIEEEDF() > 0 then
			Lobby.CJBHJEAFGH(0)
		end

		if LUI.FlowManager.IsInStack("FlyInPopup") then
			LUI.FlowManager.RequestLeaveMenuByName("FlyInPopup", true, true)
		end

		Lobby.LeaveCustomGameLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_2_0, true, true)

		return true
	end)
end

function TrialsBR(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "TrialsBR"

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
	local var_4_4 = MenuBuilder.BuildRegisteredType("TrialsContainer", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "TrialsContainer"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_4_0:addElement(var_4_4)

	var_4_0.TrialsContainer = var_4_4

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

MenuBuilder.registerType("TrialsBR", TrialsBR)
LUI.FlowManager.RegisterStackPopBehaviour("TrialsBR", var_0_0)
LockTable(_M)
