module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0.TrialsButton then
		arg_1_0.TrialsButton:SetBackgroundVisibility(false)
	end
end

function PrivateMatchPopupButtons(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalList.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 400 * _1080p)

	var_2_0.id = "PrivateMatchPopupButtons"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(10 * _1080p)

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "CustomOnlineButton"

	var_2_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_ONLINE")), 0)
	var_2_4.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_ONLINE_DESC"), 0)
	var_2_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_2_4.DisabledText:SetAnimMoveTime(2000)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_2_0:addElement(var_2_4)

	var_2_0.CustomOnlineButton = var_2_4

	local var_2_5

	if CONDITIONS.IsLocalPlayAllowed(var_2_0) then
		local var_2_6 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_2_1
		})

		var_2_6.id = "LocalPlayButton"

		var_2_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_LOCAL")), 0)
		var_2_6.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_LOCAL_DESC"), 0)
		var_2_6.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_2_6.DisabledText:SetAnimMoveTime(2000)
		var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 60, _1080p * 110)
		var_2_0:addElement(var_2_6)

		var_2_0.LocalPlayButton = var_2_6
	end

	local var_2_7

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() and CONDITIONS.AreTrialsEnabled(var_2_0) then
		local var_2_8 = MenuBuilder.BuildRegisteredType("TrialsButton", {
			controllerIndex = var_2_1
		})

		var_2_8.id = "TrialsButton"

		var_2_8.TrialsButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TRIALS")), 0)
		var_2_8.TrialsButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/TRIALS_DESC"), 0)
		var_2_8.TrialsButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
		var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 120, _1080p * 170)
		var_2_0:addElement(var_2_8)

		var_2_0.TrialsButton = var_2_8
	end

	local var_2_9

	if CONDITIONS.IsGameBattlesAllowed(var_2_0) then
		local var_2_10 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_2_1
		})

		var_2_10.id = "GameBattlesButton"

		var_2_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/GAME_BATTLES_LOBBY"), 0)
		var_2_10.Description:setText(Engine.CBBHFCGDIC("PLATFORM/MLG_GAMEBATTLES_DESC"), 0)
		var_2_10.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
		var_2_10.DisabledText:SetAnimMoveTime(2000)
		var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 180, _1080p * 230)
		var_2_0:addElement(var_2_10)

		var_2_0.GameBattlesButton = var_2_10
	end

	local var_2_11

	if CONDITIONS.IsPrivateTournamentAllowed(var_2_0) then
		local var_2_12 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
			controllerIndex = var_2_1
		})

		var_2_12.id = "TournamentButton"

		var_2_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT")), 0)
		var_2_12.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT_DESC"), 0)
		var_2_12.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_2_12.DisabledText:SetAnimMoveTime(2000)
		var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 240, _1080p * 290)
		var_2_0:addElement(var_2_12)

		var_2_0.TournamentButton = var_2_12
	end

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("PrivateMatchPopupButtons", PrivateMatchPopupButtons)
LockTable(_M)
