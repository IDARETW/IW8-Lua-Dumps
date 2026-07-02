module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MPTabsMenu)
	assert(arg_1_0.MPTabsMenu.Nat)
	assert(arg_1_0.HelperBar)

	if Lobby.IsSplitScreenEnabled() then
		LUI.FlowManager.RequestLeaveMenuByName("BRLookForParty", true, true)

		return true
	end

	Lobby.SetUpLookForPartyDefaultBinaryData()
	arg_1_0.MPTabsMenu:SetupBackButtonHandler(function(arg_2_0, arg_2_1)
		LUI.FlowManager.RequestLeaveMenuByName("BRLookForParty", true, true)

		return true
	end)
	arg_1_0.MPTabsMenu:SetupTabs(arg_1_1, {
		firstTabWidget = "BRLookForPartyWidgetsContainer"
	})
	assert(arg_1_0.bindButton)
	arg_1_0.bindButton:addEventHandler("button_start", function(arg_3_0, arg_3_1)
		ACTIONS.OpenOptionsMenu(arg_3_1.controller)
	end)
	arg_1_0.bindButton:addEventHandler("button_left_trigger", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_1_0.MPTabsMenu.activeTabWidget

		if var_4_0 and var_4_0.LeftTriggerOverride then
			return var_4_0.LeftTriggerOverride(arg_4_0, arg_4_1)
		end

		return false
	end)

	if not Onboarding.LookForParty.WasCompleted(arg_1_0, arg_1_1) then
		local var_1_0 = ONBOARDING_DATA.GetLookForPartyData()

		function var_1_0.confirmButton.action(arg_5_0, arg_5_1)
			ACTIONS.LeaveMenu(arg_5_0)
		end

		LUI.FlowManager.RequestPopupMenu(arg_1_0, "onboardingpopup", true, arg_1_1, false, var_1_0)
		Onboarding.LookForParty.MarkCompleted(arg_1_0, arg_1_1)
	end
end

function BRLookForParty(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "BRLookForParty"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	var_6_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})
	var_6_0.HelperBar.id = "HelperBar"

	var_6_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0.HelperBar:setPriority(10)
	var_6_0:addElement(var_6_0.HelperBar)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("MPTabsMenu", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "MPTabsMenu"

	var_6_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.MPTabsMenu = var_6_4

	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_6_5 = LUI.UIBindButton.new()

	var_6_5.id = "selfBindButton"

	var_6_0:addElement(var_6_5)

	var_6_0.bindButton = var_6_5

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("BRLookForParty", BRLookForParty)
LockTable(_M)
