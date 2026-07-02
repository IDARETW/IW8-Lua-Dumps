module(..., package.seeall)

local function var_0_0(arg_1_0)
	return function(arg_2_0, arg_2_1)
		local var_2_0 = 2
		local var_2_1 = arg_2_0 == 1
		local var_2_2 = MLG.ShoutcasterProfileVarValue(arg_2_1, "shoutcaster_fe_team_identity")

		arg_1_0.TeamIdentityArrowButton:UpdatePip(var_2_2 + 1, var_2_0)
		arg_1_0.Team1SettingsButton:SetButtonDisabled(var_2_1)
		arg_1_0.Team2SettingsButton:SetButtonDisabled(var_2_1)
		arg_1_0.TeamSwapButton:SetButtonDisabled(var_2_1)
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.CodCasterTeamIdentityInformationPanel.CodCasterTeam1Information
	local var_3_1 = arg_3_0.CodCasterTeamIdentityInformationPanel.CodCasterTeam2Information
	local var_3_2, var_3_3 = CODCASTER.GetTeam1Color(arg_3_1)
	local var_3_4, var_3_5 = CODCASTER.GetTeam2Color(arg_3_1)

	var_3_0.TeamNameText:setText(CODCASTER.GetTeam1Name(arg_3_1), 0)
	var_3_1.TeamNameText:setText(CODCASTER.GetTeam2Name(arg_3_1), 0)
	var_3_0.TeamColorImage:SetRGBFromInt(var_3_2, 0)
	var_3_0.ColoredBackground:SetRGBFromInt(var_3_2, 0)
	var_3_0.TeamNameText:SetRGBFromInt(var_3_3, 0)
	var_3_1.TeamColorImage:SetRGBFromInt(var_3_4, 0)
	var_3_1.ColoredBackground:SetRGBFromInt(var_3_4, 0)
	var_3_1.TeamNameText:SetRGBFromInt(var_3_5, 0)
	var_3_0.TeamSecondaryColorImage:SetRGBFromInt(var_3_3, 0)
	var_3_1.TeamSecondaryColorImage:SetRGBFromInt(var_3_5, 0)
	var_3_0.TeamLogoImage:setImage(RegisterMaterial(CODCASTER.GetTeam1LogoColorMaterial(arg_3_1)), 0)
	var_3_1.TeamLogoImage:setImage(RegisterMaterial(CODCASTER.GetTeam2LogoColorMaterial(arg_3_1)), 0)
end

local function var_0_2(arg_4_0, arg_4_1)
	if arg_4_0 ~= nil then
		local var_4_0 = MLG.ShoutcasterProfileVarValue(arg_4_1, "shoutcaster_fe_team1_" .. arg_4_0)
		local var_4_1 = MLG.ShoutcasterProfileVarValue(arg_4_1, "shoutcaster_fe_team2_" .. arg_4_0)

		MLG.SetShoutcasterProfileVarValue(arg_4_1, "shoutcaster_fe_team1_" .. arg_4_0, var_4_1)
		MLG.SetShoutcasterProfileVarValue(arg_4_1, "shoutcaster_fe_team2_" .. arg_4_0, var_4_0)
	end
end

local function var_0_3(arg_5_0)
	var_0_2("name", arg_5_0)
	var_0_2("color", arg_5_0)
	var_0_2("secondary_color", arg_5_0)
	var_0_2("icon", arg_5_0)
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CODCASTER/EDIT_SETTINGS"))

	local var_6_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = false,
		controllerIndex = arg_6_1
	})

	arg_6_0:addElement(var_6_0)

	arg_6_0.isInCustomTeamIdentityMode = MLG.ShoutcasterProfileVarValue(arg_6_1, "shoutcaster_fe_team_identity")

	local var_6_1 = arg_6_0
	local var_6_2 = {
		wrapAround = true,
		labels = {
			Engine.CBBHFCGDIC("CODCASTER/TEAM_IDENTITY_FACTIONS"),
			Engine.CBBHFCGDIC("CODCASTER/TEAM_IDENTITY_CUSTOM")
		},
		action = var_0_0(arg_6_0.CodcasterSetupButtons),
		defaultValue = 1 + arg_6_0.isInCustomTeamIdentityMode,
		UpdateContent = function(arg_7_0)
			arg_7_0.Text:setText(arg_7_0.labels[arg_7_0.currentValue], arg_7_0.updateDuration)

			local var_7_0 = arg_7_0.currentValue - 1

			MLG.SetShoutcasterProfileVarValue(arg_6_1, "shoutcaster_fe_team_identity", var_7_0)
			var_6_1.OptionTitle:setText(ToUpperCase(arg_7_0.Text:getText()))
			var_0_1(var_6_1, arg_6_1)
		end
	}

	arg_6_0.CodcasterSetupButtons.TeamIdentityArrowButton:UpdatePip(arg_6_0.isInCustomTeamIdentityMode + 1, #var_6_2.labels)

	local function var_6_3()
		ACTIONS.AnimateSequence(var_6_1.CodCasterTeamIdentityInformationPanel, "DefaultSequence")
	end

	local function var_6_4(arg_9_0, arg_9_1)
		var_6_3(codcasterMenu)
		var_6_1.OptionTitle:setText(ToUpperCase(arg_9_0.Text:getText()))

		local var_9_0 = var_6_1.CodcasterSetupButtons
		local var_9_1 = arg_9_0.id

		if var_9_1 == var_9_0.TeamIdentityArrowButton.id then
			var_6_1.OptionDescription:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM_IDENTITY_DESC"))
			ACTIONS.AnimateSequence(var_6_1.CodCasterTeamIdentityInformationPanel, "ShowBoth")
		elseif var_9_1 == var_9_0.Team1SettingsButton.id then
			var_6_1.OptionDescription:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM1_SETTINGS_DESC"))
			ACTIONS.AnimateSequence(var_6_1.CodCasterTeamIdentityInformationPanel, "ShowTeam1Only")
		elseif var_9_1 == var_9_0.Team2SettingsButton.id then
			var_6_1.OptionDescription:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM2_SETTINGS_DESC"))
			ACTIONS.AnimateSequence(var_6_1.CodCasterTeamIdentityInformationPanel, "ShowTeam2Only")
		elseif var_9_1 == var_9_0.TeamSwapButton.id then
			var_6_1.OptionDescription:setText(Engine.CBBHFCGDIC("CODCASTER/SWAP_TEAMS_DESC"))
			ACTIONS.AnimateSequence(var_6_1.CodCasterTeamIdentityInformationPanel, "ShowBoth")
		end
	end

	LUI.AddUIArrowTextButtonLogic(arg_6_0.CodcasterSetupButtons.TeamIdentityArrowButton, arg_6_1, var_6_2)

	if arg_6_0.isInCustomTeamIdentityMode == 0 then
		arg_6_0.CodcasterSetupButtons.Team1SettingsButton:SetButtonDisabled(true)
		arg_6_0.CodcasterSetupButtons.Team2SettingsButton:SetButtonDisabled(true)
		arg_6_0.CodcasterSetupButtons.TeamSwapButton:SetButtonDisabled(true)
	end

	arg_6_0.CodcasterSetupButtons.TeamSwapButton:addEventHandler("button_over", var_6_4)
	arg_6_0.CodcasterSetupButtons.TeamSwapButton:addEventHandler("button_over_disable", var_6_4)
	arg_6_0.CodcasterSetupButtons.Team1SettingsButton:addEventHandler("button_over", var_6_4)
	arg_6_0.CodcasterSetupButtons.Team1SettingsButton:addEventHandler("button_over_disable", var_6_4)
	arg_6_0.CodcasterSetupButtons.Team2SettingsButton:addEventHandler("button_over", var_6_4)
	arg_6_0.CodcasterSetupButtons.Team2SettingsButton:addEventHandler("button_over_disable", var_6_4)
	arg_6_0.CodcasterSetupButtons.Team1SettingsButton:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_1.controller or arg_6_1

		LUI.FlowManager.RequestAddMenu("CodcasterTeamSettings", true, var_10_0, false, {
			isTeamOne = true
		})
	end)
	arg_6_0.CodcasterSetupButtons.Team2SettingsButton:addEventHandler("button_action", function(arg_11_0, arg_11_1)
		local var_11_0 = arg_11_1.controller or arg_6_1

		LUI.FlowManager.RequestAddMenu("CodcasterTeamSettings", true, var_11_0, false, {
			isTeamOne = false
		})
	end)
	arg_6_0.CodcasterSetupButtons.TeamSwapButton:addEventHandler("button_action", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.controller or arg_6_1

		var_0_3(var_12_0)
		var_0_1(arg_6_0, var_12_0)
	end)
	ACTIONS.ScaleFullscreen(arg_6_0.Background)
	LAYOUT.AddAspectRatioFadeFrame(arg_6_0, arg_6_1)
end

function CodcasterSetup(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0.id = "CodcasterSetup"

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	var_13_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_13_1
	})
	var_13_0.HelperBar.id = "HelperBar"

	var_13_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_13_0.HelperBar:setPriority(10)
	var_13_0:addElement(var_13_0.HelperBar)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "Background"

	var_13_4:SetRGBFromInt(0, 0)
	var_13_4:SetAlpha(0.5, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Background = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "Backer"

	var_13_6:SetAlpha(0.5, 0)
	var_13_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 803, _1080p * 1663, _1080p * 216, _1080p * 357)
	var_13_0:addElement(var_13_6)

	var_13_0.Backer = var_13_6

	local var_13_7
	local var_13_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_13_1
	})

	var_13_8.id = "MenuTitle"

	var_13_8.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/EDIT_SETTINGS")), 0)
	var_13_8.Line:SetLeft(0, 0)
	var_13_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_13_0:addElement(var_13_8)

	var_13_0.MenuTitle = var_13_8

	local var_13_9
	local var_13_10 = MenuBuilder.BuildRegisteredType("CodcasterSetupButtons", {
		controllerIndex = var_13_1
	})

	var_13_10.id = "CodcasterSetupButtons"

	var_13_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 737, _1080p * 216, _1080p * 608)
	var_13_0:addElement(var_13_10)

	var_13_0.CodcasterSetupButtons = var_13_10

	local var_13_11
	local var_13_12 = LUI.UIText.new()

	var_13_12.id = "OptionsLabel"

	var_13_12:SetAlpha(0, 0)
	var_13_12:setText(ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/SETTINGS")), 0)
	var_13_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_12:SetAlignment(LUI.Alignment.Left)
	var_13_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 98, _1080p * 598, _1080p * 163.5, _1080p * 208.5)
	var_13_0:addElement(var_13_12)

	var_13_0.OptionsLabel = var_13_12

	local var_13_13
	local var_13_14 = MenuBuilder.BuildRegisteredType("CodCasterTeamIdentityInformationPanel", {
		controllerIndex = var_13_1
	})

	var_13_14.id = "CodCasterTeamIdentityInformationPanel"

	var_13_14:SetScale(0.5, 0)
	var_13_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 883, _1080p * 1361, _1080p * 476, _1080p * 853)
	var_13_0:addElement(var_13_14)

	var_13_0.CodCasterTeamIdentityInformationPanel = var_13_14

	local var_13_15
	local var_13_16 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_13_1
	})

	var_13_16.id = "ButtonDescription"

	var_13_16:SetAlpha(0, 0)
	var_13_16.Description:SetRight(_1080p * 415, 0)
	var_13_16.Description:SetRGBFromInt(16777215, 0)
	var_13_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 675.98, _1080p * 707.98)
	var_13_0:addElement(var_13_16)

	var_13_0.ButtonDescription = var_13_16

	local var_13_17
	local var_13_18 = LUI.UIText.new()

	var_13_18.id = "OptionTitle"

	var_13_18:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_13_18:setText(ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/QUICK_SETTINGS")), 0)
	var_13_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_13_18:SetAlignment(LUI.Alignment.Left)
	var_13_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1091, _1080p * -278, _1080p * 229, _1080p * 299)
	var_13_0:addElement(var_13_18)

	var_13_0.OptionTitle = var_13_18

	local var_13_19
	local var_13_20 = LUI.UIText.new()

	var_13_20.id = "OptionDescription"

	var_13_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_20:setText(Engine.CBBHFCGDIC("CODCASTER/QUICK_SETTINGS_DESC"), 0)
	var_13_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_20:SetAlignment(LUI.Alignment.Left)
	var_13_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1088, _1080p * -343, _1080p * 303, _1080p * 327)
	var_13_0:addElement(var_13_20)

	var_13_0.OptionDescription = var_13_20

	local var_13_21
	local var_13_22 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_13_1
	})

	var_13_22.id = "LobbyMembersFooter"

	var_13_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_13_0:addElement(var_13_22)

	var_13_0.LobbyMembersFooter = var_13_22

	var_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_13_23 = LUI.UIBindButton.new()

	var_13_23.id = "selfBindButton"

	var_13_0:addElement(var_13_23)

	var_13_0.bindButton = var_13_23

	var_13_0.bindButton:addEventHandler("button_secondary", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_13_1
		end

		ACTIONS.LeaveMenu(var_13_0)
	end)
	var_0_4(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("CodcasterSetup", CodcasterSetup)
LockTable(_M)
