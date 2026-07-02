module(..., package.seeall)

function CodcasterSetupButtons(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalList.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 607 * _1080p, 0, 320 * _1080p)

	var_1_0.id = "CodcasterSetupButtons"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(10 * _1080p)

	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericCycleList", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "TeamIdentityArrowButton"

	var_1_4.GenericOptionButtonBase.Title:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM_IDENTITY"), 0)
	var_1_4.Text:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM_IDENTITY_FACTIONS"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 40)
	var_1_0:addElement(var_1_4)

	var_1_0.TeamIdentityArrowButton = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "Team1SettingsButton"
	var_1_6.buttonDescription = Engine.CBBHFCGDIC("CODCASTER/TEAM1_SETTINGS_DESC")

	var_1_6.Text:SetLeft(_1080p * 20, 0)
	var_1_6.Text:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM1_SETTINGS"), 0)
	var_1_6.Text:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 600, _1080p * 50, _1080p * 90)
	var_1_0:addElement(var_1_6)

	var_1_0.Team1SettingsButton = var_1_6

	local var_1_7
	local var_1_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_1_1
	})

	var_1_8.id = "Team2SettingsButton"
	var_1_8.buttonDescription = Engine.CBBHFCGDIC("CODCASTER/TEAM2_SETTINGS_DESC")

	var_1_8.Text:SetLeft(_1080p * 20, 0)
	var_1_8.Text:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM2_SETTINGS"), 0)
	var_1_8.Text:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 600, _1080p * 100, _1080p * 140)
	var_1_0:addElement(var_1_8)

	var_1_0.Team2SettingsButton = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "TeamSwapButton"
	var_1_10.buttonDescription = Engine.CBBHFCGDIC("CODCASTER/SWAP_TEAMS_DESC")

	var_1_10.Text:SetLeft(_1080p * 20, 0)
	var_1_10.Text:setText(Engine.CBBHFCGDIC("CODCASTER/SWAP_TEAMS"), 0)
	var_1_10.Text:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 600, _1080p * 150, _1080p * 190)
	var_1_0:addElement(var_1_10)

	var_1_0.TeamSwapButton = var_1_10

	return var_1_0
end

MenuBuilder.registerType("CodcasterSetupButtons", CodcasterSetupButtons)
LockTable(_M)
