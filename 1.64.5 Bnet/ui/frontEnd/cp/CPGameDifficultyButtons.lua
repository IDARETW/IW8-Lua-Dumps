module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.button1:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if not arg_2_1.controller then
			local var_2_0 = arg_1_1
		end

		Engine.DAGFFDGFII("set scr_cp_difficulty 0")
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.button2:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = arg_1_1
		end

		Engine.DAGFFDGFII("set scr_cp_difficulty 1")
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.button3:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = arg_1_1
		end

		Engine.DAGFFDGFII("set scr_cp_difficulty 2")
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.button4:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = arg_1_1
		end

		Engine.DAGFFDGFII("set scr_cp_difficulty 3")
		ACTIONS.LeaveMenu(arg_1_0)
	end)
end

function CPGameDifficultyButtons(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIVerticalNavigator.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 400 * _1080p)

	var_6_0.id = "CPGameDifficultyButtons"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "button1"

	var_6_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/DIFFICULTY_EASY")), 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 40)
	var_6_0:addElement(var_6_4)

	var_6_0.button1 = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "button2"

	var_6_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/DIFFICULTY_MEDIUM")), 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 50, _1080p * 90)
	var_6_0:addElement(var_6_6)

	var_6_0.button2 = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "button3"

	var_6_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/DIFFICULTY_HARD")), 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 100, _1080p * 140)
	var_6_0:addElement(var_6_8)

	var_6_0.button3 = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "button4"

	var_6_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/DIFFICULTY_VETERAN")), 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 150, _1080p * 190)
	var_6_0:addElement(var_6_10)

	var_6_0.button4 = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "ButtonDescription"

	var_6_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_6_12.Description:SetRight(_1080p * 415, 0)
	var_6_12.Description:SetRGBFromInt(16777215, 0)
	var_6_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 210, _1080p * 310)
	var_6_0:addElement(var_6_12)

	var_6_0.ButtonDescription = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIImage.new()

	var_6_14.id = "ForSpacing"

	var_6_14:SetAlpha(0, 0)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 5, _1080p * 270, _1080p * 275)
	var_6_0:addElement(var_6_14)

	var_6_0.ForSpacing = var_6_14

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("CPGameDifficultyButtons", CPGameDifficultyButtons)
LockTable(_M)
