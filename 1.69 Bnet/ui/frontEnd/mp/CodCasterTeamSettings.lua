module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CODCASTER/TEAM1_SETTINGS"))

	if arg_1_2.isTeamOne ~= nil then
		arg_1_0.isTeamOne = arg_1_2.isTeamOne
	end

	arg_1_0.CodCasterTeamLogoButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		LUI.FlowManager.RequestAddMenu("CodcasterTeamLogoSettings", true, arg_1_1, false, {
			isTeamOne = arg_1_0.isTeamOne
		})
	end)
	arg_1_0:addEventHandler("color_selected", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_1.intColor
		local var_3_1 = arg_3_1.colorToChange == "primary"
		local var_3_2 = var_3_1 and arg_3_0.CodCasterTeamColorSelector or arg_3_0.CodCasterTeamSecondaryColorSelector
		local var_3_3
		local var_3_4
		local var_3_5
		local var_3_6

		if arg_3_0.isTeamOne then
			var_3_3 = var_3_1 and "shoutcaster_fe_team1_color" or "shoutcaster_fe_team1_secondary_color"
			var_3_4, var_3_5 = CODCASTER.GetTeam1Color(arg_1_1)
		else
			var_3_3 = var_3_1 and "shoutcaster_fe_team2_color" or "shoutcaster_fe_team2_secondary_color"
			var_3_4, var_3_5 = CODCASTER.GetTeam2Color(arg_1_1)
		end

		local var_3_7 = arg_3_0.AlliesColor

		if var_3_1 then
			arg_3_0.PlayerColorInner:SetRGBFromInt(var_3_0, 0)
		else
			arg_3_0.PlayerColorOuter:SetRGBFromInt(var_3_0, 0)
		end

		if var_3_1 then
			if arg_3_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_3_4] ~= nil then
				ACTIONS.AnimateSequence(arg_3_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_3_4], "DefaultSequence")
				arg_3_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_3_4]:SetButtonDisabled(false)
			end

			if var_3_5 == var_3_0 then
				if arg_3_0.CodCasterTeamSecondaryColorSelector.CodCasterTeamColor1.intColor ~= var_3_0 then
					arg_3_0.CodCasterTeamSecondaryColorSelector.CodCasterTeamColor1:processEvent({
						name = "button_action"
					})
				else
					arg_3_0.CodCasterTeamSecondaryColorSelector.CodCasterTeamColor2:processEvent({
						name = "button_action"
					})
				end
			end

			if arg_3_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_3_0] ~= nil then
				ACTIONS.AnimateSequence(arg_3_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_3_0], "Locked")
				arg_3_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_3_0]:SetButtonDisabled(true)
			end

			var_3_7:SetRGBFromInt(var_3_0, 0)
		end

		local var_3_8 = var_3_1 and var_3_2.colorWidgets[var_3_4] or var_3_2.colorWidgets[var_3_5]

		if var_3_8 then
			ACTIONS.AnimateSequence(var_3_8, "DefaultSequence")
		end

		MLG.SetShoutcasterProfileVarValue(arg_1_1, var_3_3, var_3_0)
		ACTIONS.AnimateSequence(var_3_2.colorWidgets[var_3_0], "Selected")
	end)
	arg_1_0:addEventHandler("update_team_name", function(arg_4_0, arg_4_1)
		if arg_4_0.isTeamOne then
			MLG.SetShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team1_name", arg_4_1.teamName)
		else
			MLG.SetShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team2_name", arg_4_1.teamName)
		end
	end)

	local var_1_0 = MLG.ShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team1_color")
	local var_1_1 = MLG.ShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team2_color")
	local var_1_2 = MLG.ShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team1_secondary_color")
	local var_1_3 = MLG.ShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team2_secondary_color")

	if arg_1_0.CodCasterTeamColorSelector.colorWidgets[var_1_0] == nil then
		if var_1_1 == arg_1_0.CodCasterTeamColorSelector.defaultColorTeam1 then
			var_1_0 = arg_1_0.CodCasterTeamColorSelector.defaultColorTeam2
		else
			var_1_0 = arg_1_0.CodCasterTeamColorSelector.defaultColorTeam1
		end

		MLG.SetShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team1_color", var_1_0)
	end

	if arg_1_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_1_2] == nil then
		var_1_2 = arg_1_0.CodCasterTeamSecondaryColorSelector.defaultColorTeam

		MLG.SetShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team1_secondary_color", var_1_2)
	end

	if arg_1_0.CodCasterTeamColorSelector.colorWidgets[var_1_1] == nil then
		if var_1_0 == arg_1_0.CodCasterTeamColorSelector.defaultColorTeam1 then
			var_1_1 = arg_1_0.CodCasterTeamColorSelector.defaultColorTeam2
		else
			var_1_1 = arg_1_0.CodCasterTeamColorSelector.defaultColorTeam1
		end

		MLG.SetShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team2_color", var_1_1)
	end

	if arg_1_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_1_3] == nil then
		var_1_3 = arg_1_0.CodCasterTeamSecondaryColorSelector.defaultColorTeam

		MLG.SetShoutcasterProfileVarValue(arg_1_1, "shoutcaster_fe_team2_secondary_color", var_1_3)
	end

	if arg_1_0.isTeamOne then
		arg_1_0.EnemiesColor:SetRGBFromInt(var_1_1, 0)
		arg_1_0.PlayerColorOuter:SetRGBFromInt(var_1_2, 0)
		arg_1_0.PlayerColorInner:SetRGBFromInt(var_1_0, 0)
		arg_1_0.AlliesColor:SetRGBFromInt(var_1_0, 0)
	else
		arg_1_0.EnemiesColor:SetRGBFromInt(var_1_0, 0)
		arg_1_0.AlliesColor:SetRGBFromInt(var_1_1, 0)
		arg_1_0.PlayerColorOuter:SetRGBFromInt(var_1_3, 0)
		arg_1_0.PlayerColorInner:SetRGBFromInt(var_1_1, 0)
	end

	local var_1_4
	local var_1_5
	local var_1_6
	local var_1_7
	local var_1_8
	local var_1_9
	local var_1_10

	if arg_1_0.isTeamOne then
		var_1_4 = ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/TEAM1_SETTINGS"))
		var_1_5 = var_1_0
		var_1_6 = var_1_2
		var_1_7 = var_1_1
		var_1_8 = var_1_0
		var_1_9 = CODCASTER.GetTeam1Name(arg_1_1)
		var_1_10 = CODCASTER.GetTeam1LogoColorMaterial(arg_1_1)
	else
		var_1_4 = ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/TEAM2_SETTINGS"))
		var_1_5 = var_1_1
		var_1_6 = var_1_3
		var_1_7 = var_1_0
		var_1_8 = var_1_1
		var_1_9 = CODCASTER.GetTeam2Name(arg_1_1)
		var_1_10 = CODCASTER.GetTeam2LogoColorMaterial(arg_1_1)
	end

	arg_1_0.MenuTitle.MenuTitle:setText(var_1_4, 0)
	arg_1_0.PlayerColorVisionCone:SetMask(arg_1_0.FovMask)

	if arg_1_0.CodCasterTeamColorSelector.colorWidgets[var_1_5] ~= nil then
		ACTIONS.AnimateSequence(arg_1_0.CodCasterTeamColorSelector.colorWidgets[var_1_5], "Selected")
	end

	if arg_1_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_1_6] ~= nil then
		ACTIONS.AnimateSequence(arg_1_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_1_6], "Selected")
	end

	if arg_1_0.CodCasterTeamColorSelector.colorWidgets[var_1_7] ~= nil then
		ACTIONS.AnimateSequence(arg_1_0.CodCasterTeamColorSelector.colorWidgets[var_1_7], "Locked")
		arg_1_0.CodCasterTeamColorSelector.colorWidgets[var_1_7]:SetButtonDisabled(true)
	end

	if arg_1_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_1_8] ~= nil then
		ACTIONS.AnimateSequence(arg_1_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_1_8], "Locked")
		arg_1_0.CodCasterTeamSecondaryColorSelector.colorWidgets[var_1_8]:SetButtonDisabled(true)
	end

	if var_1_9 ~= "" then
		arg_1_0.CodCasterTeamNameSelector.TeamName:setText(var_1_9)
	end

	arg_1_0.CodCasterTeamLogoButton.TeamLogo:setImage(RegisterMaterial(var_1_10), 0)
	arg_1_0:addElement(CoD.GetWorldBlur())

	if Engine.ECHCFGDDDF() then
		arg_1_0:addElement(CoD.GetWorldBlur())
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Background)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
end

function CodcasterTeamSettings(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalNavigator.new()

	var_5_0.id = "CodcasterTeamSettings"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	var_5_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})
	var_5_0.HelperBar.id = "HelperBar"

	var_5_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0.HelperBar:setPriority(10)
	var_5_0:addElement(var_5_0.HelperBar)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Background"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:SetAlpha(0.5, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIText.new()

	var_5_6.id = "TeamLogoLabel"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.subheader, 0)
	var_5_6:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM_LOGO_COLON"), 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:setTextStyle(CoD.TextStyle.Shadowed)
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 241, _1080p * 265)
	var_5_0:addElement(var_5_6)

	var_5_0.TeamLogoLabel = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "TeamNameLabel"

	var_5_8:SetRGBFromTable(SWATCHES.genericMenu.subheader, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM_NAME_COLON"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:setTextStyle(CoD.TextStyle.Shadowed)
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 136, _1080p * 160)
	var_5_0:addElement(var_5_8)

	var_5_0.TeamNameLabel = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIText.new()

	var_5_10.id = "TeamColorSecondaryLabel"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.subheader, 0)
	var_5_10:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM_SECONDARY_COLOR_COLON"), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:setTextStyle(CoD.TextStyle.Shadowed)
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 801, _1080p * 825)
	var_5_0:addElement(var_5_10)

	var_5_0.TeamColorSecondaryLabel = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIText.new()

	var_5_12.id = "TeamColorLabel"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.subheader, 0)
	var_5_12:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM_PRIMARY_COLOR_COLON"), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:setTextStyle(CoD.TextStyle.Shadowed)
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 600, _1080p * 624)
	var_5_0:addElement(var_5_12)

	var_5_0.TeamColorLabel = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "TeamColorPreview"

	var_5_14:setImage(RegisterMaterial("codcaster_compass_map_mp_hackney_am"), 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 908, _1080p * 1660, _1080p * 465, _1080p * 1217)
	var_5_0:addElement(var_5_14)

	var_5_0.TeamColorPreview = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "MenuTitle"

	var_5_16.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/TEAM1_SETTINGS")), 0)
	var_5_16.Line:SetLeft(0, 0)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_5_0:addElement(var_5_16)

	var_5_0.MenuTitle = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("CodCasterTeamNameSelector", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "CodCasterTeamNameSelector"

	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 719, _1080p * 170, _1080p * 207)
	var_5_0:addElement(var_5_18)

	var_5_0.CodCasterTeamNameSelector = var_5_18

	local var_5_19
	local var_5_20 = MenuBuilder.BuildRegisteredType("CodCasterTeamLogoButton", {
		controllerIndex = var_5_1
	})

	var_5_20.id = "CodCasterTeamLogoButton"

	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 420, _1080p * 272, _1080p * 562)
	var_5_0:addElement(var_5_20)

	var_5_0.CodCasterTeamLogoButton = var_5_20

	local var_5_21
	local var_5_22 = MenuBuilder.BuildRegisteredType("CodCasterTeamColorSelector", {
		controllerIndex = var_5_1
	})

	var_5_22.id = "CodCasterTeamColorSelector"

	var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 719, _1080p * 629, _1080p * 770)
	var_5_0:addElement(var_5_22)

	var_5_0.CodCasterTeamColorSelector = var_5_22

	local var_5_23
	local var_5_24 = MenuBuilder.BuildRegisteredType("CoDCasterTeamColorSelectorSecondary", {
		controllerIndex = var_5_1
	})

	var_5_24.id = "CodCasterTeamSecondaryColorSelector"

	var_5_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 131, _1080p * 719, _1080p * 832, _1080p * 973)
	var_5_0:addElement(var_5_24)

	var_5_0.CodCasterTeamSecondaryColorSelector = var_5_24

	local var_5_25
	local var_5_26 = LUI.UIImage.new()

	var_5_26.id = "AlliesColor"

	var_5_26:setImage(RegisterMaterial("codcaster_teamsettings_friendlyarrows"), 0)
	var_5_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1087, _1080p * 1253, _1080p * 697, _1080p * 963)
	var_5_0:addElement(var_5_26)

	var_5_0.AlliesColor = var_5_26

	local var_5_27
	local var_5_28 = LUI.UIImage.new()

	var_5_28.id = "EnemiesColor"

	var_5_28:setImage(RegisterMaterial("codcaster_teamsettings_enemyarrows"), 0)
	var_5_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1292, _1080p * 1532, _1080p * 708, _1080p * 936)
	var_5_0:addElement(var_5_28)

	var_5_0.EnemiesColor = var_5_28

	local var_5_29
	local var_5_30 = LUI.UIImage.new()

	var_5_30.id = "PlayerColorVisionCone"

	var_5_30:SetZRotation(251, 0)
	var_5_30:setImage(RegisterMaterial("icon_minimap_player_codcaster_fov_cone"), 0)
	var_5_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1036, _1080p * 1130, _1080p * 824, _1080p * 918)
	var_5_0:addElement(var_5_30)

	var_5_0.PlayerColorVisionCone = var_5_30

	local var_5_31
	local var_5_32 = LUI.UIImage.new()

	var_5_32.id = "FovMask"

	var_5_32:SetZRotation(250, 0)
	var_5_32:setImage(RegisterMaterial("codcaster_teamsettings_player_mask_fov"), 0)
	var_5_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1055, _1080p * 1109, _1080p * 843, _1080p * 897)
	var_5_0:addElement(var_5_32)

	var_5_0.FovMask = var_5_32

	local var_5_33
	local var_5_34 = LUI.UIImage.new()

	var_5_34.id = "PlayerColorOuter"

	var_5_34:SetZRotation(250, 0)
	var_5_34:setImage(RegisterMaterial("icon_minimap_player_codcaster_fullmap_arrow_border"), 0)
	var_5_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1064, _1080p * 1100, _1080p * 852, _1080p * 888)
	var_5_0:addElement(var_5_34)

	var_5_0.PlayerColorOuter = var_5_34

	local var_5_35
	local var_5_36 = LUI.UIImage.new()

	var_5_36.id = "PlayerColorInner"

	var_5_36:SetZRotation(250, 0)
	var_5_36:setImage(RegisterMaterial("icon_minimap_player_codcaster_fullmap_arrow_bg"), 0)
	var_5_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1063, _1080p * 1101, _1080p * 851, _1080p * 889)
	var_5_0:addElement(var_5_36)

	var_5_0.PlayerColorInner = var_5_36

	local var_5_37
	local var_5_38 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_5_1
	})

	var_5_38.id = "LobbyMembersFooter"

	var_5_38:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_5_0:addElement(var_5_38)

	var_5_0.LobbyMembersFooter = var_5_38

	local var_5_39
	local var_5_40 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_40.id = "TipsBacker"

	var_5_40:SetAlpha(0.5, 0)
	var_5_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 854, _1080p * 1714, _1080p * 170, _1080p * 629)
	var_5_0:addElement(var_5_40)

	var_5_0.TipsBacker = var_5_40

	local var_5_41
	local var_5_42 = LUI.UIText.new()

	var_5_42.id = "TipsDescription"

	var_5_42:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_42:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM_SETTINGS_TIPS_DESC"), 0)
	var_5_42:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_42:SetAlignment(LUI.Alignment.Left)
	var_5_42:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1042, _1080p * -297, _1080p * 265, _1080p * 289)
	var_5_0:addElement(var_5_42)

	var_5_0.TipsDescription = var_5_42

	local var_5_43
	local var_5_44 = LUI.UIStyledText.new()

	var_5_44.id = "TipsTitle"

	var_5_44:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_44:setText(ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/TEAM_SETTINGS_TIPS_TITLE")), 0)
	var_5_44:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_44:SetWordWrap(false)
	var_5_44:SetAlignment(LUI.Alignment.Left)
	var_5_44:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_44:SetStartupDelay(2000)
	var_5_44:SetLineHoldTime(400)
	var_5_44:SetAnimMoveTime(2000)
	var_5_44:SetAnimMoveSpeed(150)
	var_5_44:SetEndDelay(2000)
	var_5_44:SetCrossfadeTime(250)
	var_5_44:SetFadeInTime(300)
	var_5_44:SetFadeOutTime(300)
	var_5_44:SetMaxVisibleLines(1)
	var_5_44:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1042, _1080p * -230, _1080p * 188, _1080p * 258)
	var_5_0:addElement(var_5_44)

	var_5_0.TipsTitle = var_5_44

	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_5_45 = LUI.UIBindButton.new()

	var_5_45.id = "selfBindButton"

	var_5_0:addElement(var_5_45)

	var_5_0.bindButton = var_5_45

	var_5_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_5_1
		end

		ACTIONS.LeaveMenu(var_5_0)
	end)
	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CodcasterTeamSettings", CodcasterTeamSettings)
LockTable(_M)
