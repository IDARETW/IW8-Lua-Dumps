module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("CPGameDifficulty", {
	"host"
})

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuTitle)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_CP/DIFFICULTY"))
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
end

function CPGameDifficulty(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalNavigator.new()

	var_2_0.id = "CPGameDifficulty"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	var_2_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_2_1
	})
	var_2_0.HelperBar.id = "HelperBar"

	var_2_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_2_0.HelperBar:setPriority(10)
	var_2_0:addElement(var_2_0.HelperBar)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("MatchDetails", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "MatchDetails"

	var_2_4:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 131, _1080p * 531, _1080p * -265, _1080p * -135)
	var_2_0:addElement(var_2_4)

	var_2_0.MatchDetails = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "MenuTitle"

	var_2_6.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/DIFFICULTY")), 0)
	var_2_6.Line:SetLeft(0, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_2_0:addElement(var_2_6)

	var_2_0.MenuTitle = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("CPGameDifficultyButtons", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "CPGameDifficultyButtons"

	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 131, _1080p * 731, _1080p * 216, _1080p * 616)
	var_2_0:addElement(var_2_8)

	var_2_0.CPGameDifficultyButtons = var_2_8

	var_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 2,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_2_9 = LUI.UIBindButton.new()

	var_2_9.id = "selfBindButton"

	var_2_0:addElement(var_2_9)

	var_2_0.bindButton = var_2_9

	var_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_0.bindButton:addEventHandler("button_start", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_1.controller or var_2_1

		ACTIONS.OpenOptionsMenu(var_4_0, "")
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CPGameDifficulty", CPGameDifficulty)
LockTable(_M)
