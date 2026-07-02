module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("CPGameSetup", {
	"host"
})

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuTitle)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/GAME_SETUP_CAPS"))
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
end

function CPGameSetup(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalNavigator.new()

	var_2_0.id = "CPGameSetup"

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
	local var_2_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "MenuTitle"

	var_2_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GAME_SETUP_CAPS")), 0)
	var_2_4.Line:SetLeft(0, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_2_0:addElement(var_2_4)

	var_2_0.MenuTitle = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("CPGameSetupButtons", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "CPGameSetupButtons"

	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 530, _1080p * 216, _1080p * 395)
	var_2_0:addElement(var_2_6)

	var_2_0.CPGameSetupButtons = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("ESportsRulesLabel", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "ESportsRulesLabel"

	var_2_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1178, _1080p * 1778, _1080p * 94, _1080p * 124)
	var_2_0:addElement(var_2_8)

	var_2_0.ESportsRulesLabel = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("GameSetupDetails", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "GameSetupDetails"

	var_2_10.DisabledMessage:SetLeft(0, 0)
	var_2_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 696, _1080p * -255, _1080p * -100)
	var_2_0:addElement(var_2_10)

	var_2_0.GameSetupDetails = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIText.new()

	var_2_12.id = "DebugText"

	var_2_12:setText("THIS IS A DEBUG MENU", 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_12:SetAlignment(LUI.Alignment.Left)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 154, _1080p * 184)
	var_2_0:addElement(var_2_12)

	var_2_0.DebugText = var_2_12

	var_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_2_13 = LUI.UIBindButton.new()

	var_2_13.id = "selfBindButton"

	var_2_0:addElement(var_2_13)

	var_2_0.bindButton = var_2_13

	var_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CPGameSetup", CPGameSetup)
LockTable(_M)
