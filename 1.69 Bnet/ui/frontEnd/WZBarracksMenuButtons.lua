module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0:setGainFocusSFX(SOUND_SETS.mpMainMenu.move)
	arg_1_0:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown)
	assert(arg_1_0.Description)
	arg_1_0:AddTooltipData(controllerIndex, {
		tooltipDescription = arg_1_0.Description:getText()
	})
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.ProgressionButton then
		var_0_0(arg_2_0.ProgressionButton)
	end

	if arg_2_0.CustomizeButton then
		var_0_0(arg_2_0.CustomizeButton)
		arg_2_0.CustomizeButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			if CONDITIONS.IsOnlineAndSignedIn(arg_3_1.controller) then
				ACTIONS.OpenMenu("BarracksCustomize", true, arg_3_1.controller)
			end
		end)
	end

	if arg_2_0.RecordsButton then
		var_0_0(arg_2_0.RecordsButton)
	end

	if arg_2_0.AchievementButton then
		if Engine.EAABDHIDFJ() then
			arg_2_0.AchievementButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MSSTORE_PLATFORM/ACHIEVEMENT")), 0)
			arg_2_0.AchievementButton.Description:setText(Engine.CBBHFCGDIC("MSSTORE_PLATFORM/ACHIEVEMENTS_DESC"), 0)
		end

		var_0_0(arg_2_0.AchievementButton)
	end

	local var_2_0 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	local function var_2_1()
		if Engine.JEDFGECDJ() > 1 and not var_2_0:GetValue(arg_2_1) then
			local var_4_0 = Engine.IJEBHJIJF()
		end
	end

	arg_2_0:SubscribeToModel(var_2_0:GetModel(arg_2_1), var_2_1)
end

function WZBarracksMenuButtons(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalList.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 600 * _1080p)

	var_5_0.id = "WZBarracksMenuButtons"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:SetSpacing(10 * _1080p)

	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "ProgressionButton"

	var_5_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PROGRESSION")), 0)
	var_5_4.Description:setText(Engine.CBBHFCGDIC("ONBOARDING/CAREER_LEASONLEVELING_TITLE"), 0)
	var_5_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_5_4.DisabledText:SetAnimMoveTime(2000)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_5_0:addElement(var_5_4)

	var_5_0.ProgressionButton = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "CustomizeButton"

	var_5_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CUSTOMIZATION")), 0)
	var_5_6.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/IDENTITY_EDIT_DESC"), 0)
	var_5_6.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_5_6.DisabledText:SetAnimMoveTime(2000)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
	var_5_0:addElement(var_5_6)

	var_5_0.CustomizeButton = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "RecordsButton"

	var_5_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/RECORDS")), 0)
	var_5_8.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/BARRACKS_RECORDS_DESC"), 0)
	var_5_8.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_5_8.DisabledText:SetAnimMoveTime(2000)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
	var_5_0:addElement(var_5_8)

	var_5_0.RecordsButton = var_5_8

	local var_5_9

	if CONDITIONS.IsPCAchievementsMenuAvailable() then
		var_5_9 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_5_1
		})
		var_5_9.id = "AchievementButton"

		var_5_9.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ACHIEVEMENT")), 0)
		var_5_9.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/ACHIEVEMENTS_DESC"), 0)
		var_5_9.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_5_9.DisabledText:SetAnimMoveTime(2000)
		var_5_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 180, _1080p * 230)
		var_5_0:addElement(var_5_9)

		var_5_0.AchievementButton = var_5_9
	end

	var_5_4:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_1.controller or var_5_1

		ACTIONS.OpenMenu("ProgressionMenu", true, var_6_0)
	end)
	var_5_6:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1.controller or var_5_1

		ACTIONS.OpenMenu("BarracksCustomize", true, var_7_0)
	end)
	var_5_8:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1.controller or var_5_1

		ACTIONS.OpenMenu("BarracksRecords", true, var_8_0)
	end)

	if CONDITIONS.IsPCAchievementsMenuAvailable() then
		var_5_9:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			local var_9_0 = arg_9_1.controller or var_5_1

			if CONDITIONS.IsPCAchievementsMenuAvailable() then
				ACTIONS.OpenPCAchievementMenu(var_9_0)
			end
		end)
	end

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("WZBarracksMenuButtons", WZBarracksMenuButtons)
LockTable(_M)
