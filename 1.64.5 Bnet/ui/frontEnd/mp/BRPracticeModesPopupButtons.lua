module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.OrientationButton:AddTooltipData(arg_1_1, {
		tooltipDescription = Engine.CBBHFCGDIC("LUA_MENU/WZ_ORIENTATION_DESC")
	})

	if CONDITIONS.IsBRPracticeModeAvailable() then
		arg_1_0.PracticeButton:AddTooltipData(arg_1_1, {
			tooltipDescription = Engine.CBBHFCGDIC("LUA_MENU/WZ_PRACTICE_DESC")
		})

		if arg_1_0.BloodMoneyButton then
			arg_1_0.BloodMoneyButton:AddTooltipData(arg_1_1, {
				tooltipDescription = Engine.CBBHFCGDIC("LUA_MENU/PLUNDER_TRAINING_DESC")
			})
		end
	end

	if arg_1_0.WarzonePrivateMatch then
		arg_1_0.WarzonePrivateMatch:AddTooltipData(arg_1_1, {
			tooltipDescription = Engine.CBBHFCGDIC("LUA_MENU_MP/WZ_PRIVATE_MATCH_ENTRY_DESC")
		})
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	var_0_0(arg_2_0, arg_2_1)

	if arg_2_0.WarzonePrivateMatch then
		arg_2_0.WarzonePrivateMatch:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			local function var_3_0()
				if Engine.JEDFGECDJ() > 1 then
					LUI.FlowManager.RequestPopupMenu(arg_2_0, "ConfirmShouldRemoveSplitscreenPlayerWarning", true, arg_3_1.controller, false, {
						yesAction = function()
							local var_5_0 = Lobby.KickSplitScreenPlayerAndGetActiveController(arg_3_1.controller or arg_2_1)

							if var_5_0 >= 0 then
								Lobby.OpenWarzonePrivateMatchLobby({
									controllerIndex = var_5_0
								})
							end
						end
					})
				else
					Lobby.OpenWarzonePrivateMatchLobby({
						controllerIndex = arg_3_1.controller or arg_2_1
					})
				end
			end

			Lobby.TryNavigateToLobby(var_3_0)
		end)
	end

	arg_2_0.OrientationButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		Lobby.AttemptOpenBRTutorial(arg_2_1, Lobby.BRTutorialLobbyType.TUTORIAL)
	end)
	arg_2_0.OrientationButton:SetupCheckbox()

	local var_2_0 = OnlineProgression.DFBEBDGCHJ(arg_2_1, BRLOOT.rewardsTypes.TRAINING_REWARD)

	arg_2_0.OrientationButton.CheckBox:SetValue(var_2_0)

	if CONDITIONS.IsBRPracticeModeAvailable() then
		local var_2_1 = OnlineProgression.DFBEBDGCHJ(arg_2_1, BRLOOT.rewardsTypes.PRACTICE_REWARD)

		arg_2_0.PracticeButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
			Lobby.AttemptOpenBRTutorial(arg_2_1, Lobby.BRTutorialLobbyType.PRACTICE)
		end)
		arg_2_0.PracticeButton:SetupCheckbox()
		arg_2_0.PracticeButton.CheckBox:SetValue(var_2_1)
	end

	if CONDITIONS.IsBMTutorialMapAvailable() and arg_2_0.BloodMoneyButton then
		arg_2_0.BloodMoneyButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
			Lobby.AttemptOpenBRTutorial(arg_2_1, Lobby.BRTutorialLobbyType.BLOODMONEY, false)
		end)

		local var_2_2 = OnlineProgression.DFBEBDGCHJ(arg_2_1, BRLOOT.rewardsTypes.BLOOD_MONEY_TRAINING_REWARD)

		arg_2_0.BloodMoneyButton:SetupCheckbox()
		arg_2_0.BloodMoneyButton.CheckBox:SetValue(var_2_2)
	end
end

function BRPracticeModesPopupButtons(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIVerticalList.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 400 * _1080p)

	var_9_0.id = "BRPracticeModesPopupButtons"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0

	var_9_0:SetSpacing(10 * _1080p)

	local var_9_3

	if CONDITIONS.IsWZPrivateMatchEnabled() then
		local var_9_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_9_1
		})

		var_9_4.id = "WarzonePrivateMatch"

		var_9_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WARZONE_PRIVATE_MATCH")), 0)
		var_9_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/WZ_PRIVATE_MATCH_ENTRY_DESC"), 0)
		var_9_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_9_4.DisabledText:SetAnimMoveTime(2000)
		var_9_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
		var_9_0:addElement(var_9_4)

		var_9_0.WarzonePrivateMatch = var_9_4
	end

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "OrientationButton"

	var_9_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WZ_ORIENTATION")), 0)
	var_9_6.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/WZ_ORIENTATION_DESC"), 0)
	var_9_6.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_9_6.DisabledText:SetAnimMoveTime(2000)
	var_9_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
	var_9_0:addElement(var_9_6)

	var_9_0.OrientationButton = var_9_6

	local var_9_7

	if CONDITIONS.IsBRPracticeModeAvailable() then
		local var_9_8 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_9_1
		})

		var_9_8.id = "PracticeButton"

		var_9_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WZ_PRACTICE")), 0)
		var_9_8.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/WZ_PRACTICE_DESC"), 0)
		var_9_8.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_9_8.DisabledText:SetAnimMoveTime(2000)
		var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
		var_9_0:addElement(var_9_8)

		var_9_0.PracticeButton = var_9_8
	end

	local var_9_9

	if CONDITIONS.IsBMTutorialMapAvailable() then
		local var_9_10 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_9_1
		})

		var_9_10.id = "BloodMoneyButton"

		var_9_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLUNDER_TRAINING")), 0)
		var_9_10.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/PLUNDER_TRAINING_DESC"), 0)
		var_9_10.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_9_10.DisabledText:SetAnimMoveTime(2000)
		var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 180, _1080p * 230)
		var_9_0:addElement(var_9_10)

		var_9_0.BloodMoneyButton = var_9_10
	end

	var_0_1(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("BRPracticeModesPopupButtons", BRPracticeModesPopupButtons)
LockTable(_M)
