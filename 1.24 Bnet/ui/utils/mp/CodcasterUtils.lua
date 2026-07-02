CODCASTER = CODCASTER or {}

function CODCASTER.CanCODCast()
	if Dvar.IBEGCHEFE("splitscreen") or CONDITIONS.IsLaunchChunk() then
		return false
	end

	local var_1_0 = Dvar.IBEGCHEFE("MQRSKQTRLT")
	local var_1_1 = Dvar.IBEGCHEFE("MOSNOQPOSS")
	local var_1_2 = Dvar.IBEGCHEFE("NRMMRSMNPS")

	return var_1_0 or var_1_1 and var_1_2
end

function CODCASTER.SetCODCastingEnabled(arg_2_0)
	Dvar.DHEGHJJJHI("MOSNOQPOSS", arg_2_0)
end

function CODCASTER.IsCODCaster()
	return MLG.FBFGBEC()
end

function CODCASTER.GetMLGTeamInfo(arg_4_0)
	if Engine.DDJFBBJAIG() then
		return nil
	end

	local var_4_0 = MLG.DDCFEAFJE()
	local var_4_1 = MLG.DBBFBFCCEA()

	if var_4_1 and var_4_1.teams and var_4_1.teams[arg_4_0] then
		local var_4_2 = var_4_1.teams[arg_4_0]

		if var_4_0 and var_4_0[var_4_2] then
			return var_4_0[var_4_2]
		end
	end

	return nil
end

function CODCASTER.IsCustomTeamIdentity(arg_5_0)
	return MLG.ShoutcasterProfileVarValue(arg_5_0, "shoutcaster_fe_team_identity") == 1
end

local function var_0_0(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_1 == 1 or arg_6_1 == 2)

	local var_6_0 = CODCASTER.IsCustomTeamIdentity(arg_6_0)
	local var_6_1 = ""
	local var_6_2 = CODCASTER.GetMLGTeamInfo(arg_6_1)

	if var_6_2 then
		if arg_6_2 and var_6_2.teamShortName then
			return var_6_2.teamShortName
		elseif var_6_2.teamName then
			return var_6_2.teamName
		end
	end

	if var_6_0 then
		var_6_1 = MLG.ShoutcasterProfileVarValue(arg_6_0, "shoutcaster_fe_team" .. arg_6_1 .. "_name")

		if var_6_1 == "MENU/FACTION_ALLEGIANCE_NAME" or var_6_1 == "MENU/FACTION_COALITION_NAME" then
			var_6_1 = ToUpperCase(Engine.CBBHFCGDIC(var_6_1))

			MLG.SetShoutcasterProfileVarValue(arg_6_0, "shoutcaster_fe_team" .. arg_6_1 .. "_name", var_6_1)
		end
	end

	if var_6_1 == "" then
		if arg_6_1 == 1 then
			return ToUpperCase(Engine.CBBHFCGDIC("MENU/FACTION_COALITION_NAME"))
		else
			return ToUpperCase(Engine.CBBHFCGDIC("MENU/FACTION_ALLEGIANCE_NAME"))
		end
	end

	return var_6_1
end

local function var_0_1(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_1 == 1 or arg_7_1 == 2)

	local var_7_0 = CODCASTER.IsCustomTeamIdentity(arg_7_0)
	local var_7_1 = ""
	local var_7_2 = ""
	local var_7_3 = arg_7_1 == 1 and 2 or 1
	local var_7_4
	local var_7_5 = CODCASTER.GetMLGTeamInfo(arg_7_1)

	if var_7_5 then
		local var_7_6 = MLG.BIFBICFHID(var_7_5.teamIndex)

		if var_7_6 and var_7_6.logoWhite and var_7_6.logoColor and var_7_6.logoLargeColor then
			if arg_7_2 then
				return nil, var_7_6.logoLargeColor
			end

			return var_7_6.logoWhite, var_7_6.logoColor
		end
	end

	if var_7_0 then
		local var_7_7 = MLG.ShoutcasterProfileVarValue(arg_7_0, "shoutcaster_fe_team" .. arg_7_1 .. "_icon")

		var_7_1 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, var_7_7, CSV.teamLogoTable.cols.logoWhiteMaterial)
		var_7_2 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, var_7_7, CSV.teamLogoTable.cols.logoColorMaterial)
	end

	if var_7_1 == "" then
		var_7_1 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, arg_7_1 - 1, CSV.teamLogoTable.cols.logoWhiteMaterial)
		var_7_2 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, arg_7_1 - 1, CSV.teamLogoTable.cols.logoColorMaterial)
	elseif var_7_1 == "" then
		local var_7_8 = MLG.ShoutcasterProfileVarValue(arg_7_0, "shoutcaster_fe_team" .. var_7_3 .. "_icon")
		local var_7_9 = arg_7_1 - 1

		if var_7_9 == var_7_8 then
			var_7_9 = var_7_9 == 0 and 1 or 0
		end

		var_7_1 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, var_7_9, CSV.teamLogoTable.cols.logoWhiteMaterial)
		var_7_2 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, var_7_9, CSV.teamLogoTable.cols.logoColorMaterial)
	end

	return var_7_1, var_7_2
end

function CODCASTER.GetTeamColor(arg_8_0, arg_8_1)
	assert(arg_8_1 == 1 or arg_8_1 == 2)

	local var_8_0 = CODCASTER.GetMLGTeamInfo(arg_8_1)

	if var_8_0 and var_8_0.teamPrimaryColor and var_8_0.teamSecondaryColor then
		return var_8_0.teamPrimaryColor, var_8_0.teamSecondaryColor
	end

	local var_8_1 = CODCASTER.IsCustomTeamIdentity(arg_8_0)
	local var_8_2 = 0
	local var_8_3 = 0

	if var_8_1 then
		var_8_2 = MLG.ShoutcasterProfileVarValue(arg_8_0, "shoutcaster_fe_team" .. arg_8_1 .. "_color")
		var_8_3 = MLG.ShoutcasterProfileVarValue(arg_8_0, "shoutcaster_fe_team" .. arg_8_1 .. "_secondary_color")
	end

	if var_8_2 == 0 then
		if arg_8_1 == 1 then
			var_8_2 = GetIntForColor(SWATCHES.Global.keyColor)
		else
			var_8_2 = GetIntForColor(SWATCHES.HUD.enemyTeam)
		end
	end

	if var_8_3 == 0 then
		var_8_3 = GetIntForColor(COLORS.white)
	end

	return var_8_2, var_8_3
end

function CODCASTER.GetTeamDarkColor(arg_9_0, arg_9_1)
	local var_9_0, var_9_1 = CODCASTER.GetTeamColor(arg_9_0, arg_9_1)
	local var_9_2 = GetColorTableFromIntColor(var_9_0)
	local var_9_3 = GetColorTableFromIntColor(var_9_1)
	local var_9_4 = 4

	var_9_2.r = var_9_2.r / var_9_4
	var_9_2.g = var_9_2.g / var_9_4
	var_9_2.b = var_9_2.b / var_9_4
	var_9_3.r = var_9_3.r / var_9_4
	var_9_3.g = var_9_3.g / var_9_4
	var_9_3.b = var_9_3.b / var_9_4

	local var_9_5 = GetIntForColor(var_9_2)
	local var_9_6 = GetIntForColor(var_9_3)

	return var_9_5, var_9_6
end

function CODCASTER.GetTeamLightColor(arg_10_0, arg_10_1)
	assert(arg_10_1 == 1 or arg_10_1 == 2)

	local var_10_0 = CODCASTER.GetMLGTeamInfo(arg_10_1)

	if var_10_0 then
		if var_10_0.teamPrimaryLightColor and var_10_0.teamSecondaryLightColor then
			return var_10_0.teamPrimaryLightColor, var_10_0.teamSecondaryLightColor
		elseif var_10_0.teamPrimaryColor and var_10_0.teamSecondaryColor then
			return var_10_0.teamPrimaryColor, var_10_0.teamSecondaryColor
		end
	end

	local var_10_1, var_10_2 = CODCASTER.GetTeamColor(arg_10_0, arg_10_1)
	local var_10_3 = GetColorTableFromIntColor(var_10_1)
	local var_10_4 = GetColorTableFromIntColor(var_10_2)
	local var_10_5 = 0.2

	var_10_3.r = math.min(var_10_3.r + var_10_5, 1)
	var_10_3.g = math.min(var_10_3.g + var_10_5, 1)
	var_10_3.b = math.min(var_10_3.b + var_10_5, 1)
	var_10_4.r = math.min(var_10_4.r + var_10_5, 1)
	var_10_4.g = math.min(var_10_4.g + var_10_5, 1)
	var_10_4.b = math.min(var_10_4.b + var_10_5, 1)

	local var_10_6 = GetIntForColor(var_10_3)
	local var_10_7 = GetIntForColor(var_10_4)

	return var_10_6, var_10_7
end

function CODCASTER.ResizeTeamNameText(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = 45
	local var_11_1 = arg_11_2 or var_11_0
	local var_11_2 = arg_11_0:getText()
	local var_11_3 = arg_11_0:GetCurrentFont()
	local var_11_4, var_11_5, var_11_6, var_11_7 = GetTextDimensions(var_11_2, var_11_3, var_11_1 * _1080p)
	local var_11_8, var_11_9, var_11_10, var_11_11 = arg_11_0:getLocalRect()
	local var_11_12 = var_11_10 - var_11_8
	local var_11_13 = arg_11_1 / _1080p
	local var_11_14 = 5

	while var_11_12 < var_11_6 do
		var_11_1 = var_11_1 - var_11_14
		var_11_13 = var_11_13 + var_11_14

		arg_11_0:SetTop(_1080p * var_11_13, 0)

		local var_11_15, var_11_16, var_11_17

		var_11_15, var_11_16, var_11_6, var_11_17 = GetTextDimensions(var_11_2, var_11_3, var_11_1 * _1080p)
	end
end

function CODCASTER.GetTeamName(arg_12_0, arg_12_1, arg_12_2)
	return var_0_0(arg_12_0, arg_12_1, arg_12_2)
end

function CODCASTER.GetTeam1Name(arg_13_0, arg_13_1)
	return var_0_0(arg_13_0, 1, arg_13_1)
end

function CODCASTER.GetTeam2Name(arg_14_0, arg_14_1)
	return var_0_0(arg_14_0, 2, arg_14_1)
end

function CODCASTER.GetTeamLogoMaterial(arg_15_0, arg_15_1, arg_15_2)
	return var_0_1(arg_15_0, arg_15_1, arg_15_2)
end

function CODCASTER.GetTeam1LogoWhiteMaterial(arg_16_0)
	local var_16_0, var_16_1 = var_0_1(arg_16_0, 1)

	return var_16_0
end

function CODCASTER.GetTeam2LogoWhiteMaterial(arg_17_0)
	local var_17_0, var_17_1 = var_0_1(arg_17_0, 2)

	return var_17_0
end

function CODCASTER.GetTeam1LogoColorMaterial(arg_18_0)
	local var_18_0, var_18_1 = var_0_1(arg_18_0, 1)

	if var_18_1 == "" then
		var_18_1 = var_18_0
	end

	return var_18_1
end

function CODCASTER.GetTeam2LogoColorMaterial(arg_19_0)
	local var_19_0, var_19_1 = var_0_1(arg_19_0, 2)

	if var_19_1 == "" then
		var_19_1 = var_19_0
	end

	return var_19_1
end

function CODCASTER.GetTeam1Color(arg_20_0)
	return CODCASTER.GetTeamColor(arg_20_0, 1)
end

function CODCASTER.GetTeam2Color(arg_21_0)
	return CODCASTER.GetTeamColor(arg_21_0, 2)
end

function CODCASTER.GetTeam1DarkColor(arg_22_0)
	return CODCASTER.GetTeamDarkColor(arg_22_0, 1)
end

function CODCASTER.GetTeam2DarkColor(arg_23_0)
	return CODCASTER.GetTeamDarkColor(arg_23_0, 2)
end

function CODCASTER.GetTeam1LightColor(arg_24_0)
	return CODCASTER.GetTeamLightColor(arg_24_0, 1)
end

function CODCASTER.GetTeam2LightColor(arg_25_0)
	return CODCASTER.GetTeamLightColor(arg_25_0, 2)
end

function CODCASTER.GetProTeamAlias(arg_26_0, arg_26_1)
	local var_26_0 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, arg_26_1, CSV.teamLogoTable.cols.teamAlias)

	if var_26_0 == "" then
		var_26_0 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, arg_26_1, CSV.teamLogoTable.cols.teamName)
	end

	return Engine.CBBHFCGDIC(var_26_0)
end

function CODCASTER.GetProTeamName(arg_27_0, arg_27_1)
	local var_27_0 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, arg_27_1, CSV.teamLogoTable.cols.teamName)

	return Engine.CBBHFCGDIC(var_27_0)
end

function CODCASTER.CanFollow()
	return CODCASTER.CanCODCast()
end

function CODCASTER.ResetTeamSettings(arg_29_0)
	MLG.SetShoutcasterProfileVarValue(arg_29_0, "shoutcaster_fe_team_identity", 0)
	MLG.SetShoutcasterProfileVarValue(arg_29_0, "shoutcaster_fe_team1_name", Engine.CBBHFCGDIC("MENU/FACTION_COALITION_NAME"))
	MLG.SetShoutcasterProfileVarValue(arg_29_0, "shoutcaster_fe_team1_color", 0)
	MLG.SetShoutcasterProfileVarValue(arg_29_0, "shoutcaster_fe_team1_secondary_color", 0)
	MLG.SetShoutcasterProfileVarValue(arg_29_0, "shoutcaster_fe_team1_icon", 0)
	MLG.SetShoutcasterProfileVarValue(arg_29_0, "shoutcaster_fe_team2_name", Engine.CBBHFCGDIC("MENU/FACTION_ALLEGIANCE_NAME"))
	MLG.SetShoutcasterProfileVarValue(arg_29_0, "shoutcaster_fe_team2_color", 0)
	MLG.SetShoutcasterProfileVarValue(arg_29_0, "shoutcaster_fe_team2_secondary_color", 0)
	MLG.SetShoutcasterProfileVarValue(arg_29_0, "shoutcaster_fe_team2_icon", 1)
end

function CODCASTER.CreateCODCasterSettingsButton(arg_30_0, arg_30_1)
	if Dvar.IBEGCHEFE("LSQNRLMKST") and not CONDITIONS.IsSplitscreen() then
		local var_30_0 = "frontEnd.MP.privateLobby.buttons"
		local var_30_1 = LUI.DataSourceInGlobalModel.new(var_30_0 .. ".disableButton")
		local var_30_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isGameStartRequested")

		if arg_30_0.codcasterSettingsButton == nil then
			if arg_30_0.ButtonDescription then
				arg_30_0:RemoveElement(arg_30_0.ButtonDescription)
			end

			if Dvar.IBEGCHEFE("LPSPMQSNPQ") == true or CONDITIONS.IsCoreMultiplayer() then
				local var_30_3 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
					controllerIndex = arg_30_1
				})

				var_30_3.id = "Codcaster"

				var_30_3.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/CAPS")), 0)
				var_30_3.DisabledText:setText(Engine.CBBHFCGDIC("CODCASTER/CODCASTER_BUTTON_DISABLED"), 0)
				var_30_3.Description:setText(Engine.CBBHFCGDIC("CODCASTER/EDIT_SETTINGS_TOOL_TIP"), 0)
				var_30_3:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
				arg_30_0:addElement(var_30_3)

				arg_30_0.codcasterSettingsButton = var_30_3
			else
				local var_30_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
					controllerIndex = arg_30_1
				})

				var_30_4.id = "Codcaster"
				var_30_4.buttonDescription = Engine.CBBHFCGDIC("CODCASTER/EDIT_SETTINGS_TOOL_TIP")

				var_30_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/CAPS")), 0)
				var_30_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 150, _1080p * 190)
				arg_30_0:addElement(var_30_4)

				arg_30_0.codcasterSettingsButton = var_30_4
			end

			arg_30_0.codcasterSettingsButton:addEventHandler("button_action", function(arg_31_0, arg_31_1)
				local var_31_0 = arg_31_1.controller or arg_30_1

				if Dvar.IBEGCHEFE("lui_disable_codcaster_options_tab") ~= true then
					ACTIONS.OpenOptionsMenu(var_31_0, "codCaster")
				else
					LUI.FlowManager.RequestAddMenu("CodcasterSetup", true, var_31_0, false)
				end
			end)

			local var_30_5 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count")
			local var_30_6 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.teamSpectatorCount")
			local var_30_7 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.teamFollowerCount")
			local var_30_8 = LUI.DataSourceFromList.new(var_30_5)

			var_30_8.MakeDataSourceAtIndex = Lobby.GetLobbyMemberDataSourceAtIndex("alwaysLoaded.activeParty.members")

			local function var_30_9(arg_32_0)
				local var_32_0 = var_30_2:GetValue(arg_32_0)

				if CONDITIONS.IsTeamBasedGameType() and not var_32_0 then
					for iter_32_0 = 0, var_30_8:GetCountValue(arg_32_0) - 1 do
						local var_32_1 = var_30_8:GetDataSourceAtIndex(iter_32_0)

						if var_32_1.isMyPlayer:GetValue(arg_32_0) then
							local var_32_2 = var_32_1.desiredTeam:GetValue(arg_32_0)

							if var_32_2 == Teams.spectator or var_32_2 == Teams.follower then
								return false
							end
						end
					end
				end

				return true
			end

			local var_30_10 = LUI.AggregateDataSource.new(var_30_1, {
				var_30_5,
				var_30_6,
				var_30_7,
				var_30_2
			}, "codcasterSettingsDisabled", var_30_9)

			local function var_30_11()
				if var_30_10:GetValue(arg_30_1) == true then
					local var_33_0 = arg_30_0.codcasterSettingsButton.Description:getText() .. "\n\n^3" .. arg_30_0.codcasterSettingsButton.DisabledText:getText() .. "^7"

					arg_30_0.codcasterSettingsButton:AddTooltipData(arg_30_1, {
						tooltipDescription = var_33_0
					})
				else
					arg_30_0.codcasterSettingsButton:AddTooltipData(arg_30_1, {
						tooltipDescription = arg_30_0.codcasterSettingsButton.Description:getText()
					})
				end
			end

			local function var_30_12()
				arg_30_0.codcasterSettingsButton:SetButtonDisabled(var_30_10:GetValue(arg_30_1))
				var_30_11()
			end

			arg_30_0:SubscribeToModel(var_30_10:GetModel(arg_30_1), var_30_12)

			if arg_30_0.ButtonDescription then
				arg_30_0:addElement(arg_30_0.ButtonDescription)
			end

			var_30_11()
		end

		if MLG.DBIBHEAEGD() then
			local var_30_13 = isInLobby and Lobby.DFFFFJHCEH() and IsPrivateMatch() or not isInLobby and Lobby.BGIADHIHAG()

			if arg_30_0.reorderLobbyButton == nil and var_30_13 and (Dvar.IBEGCHEFE("LPSPMQSNPQ") == true or CONDITIONS.IsCoreMultiplayer()) then
				local var_30_14 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
					controllerIndex = arg_30_1
				})

				var_30_14.id = "ReorderButton"

				var_30_14.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODCASTER/REORDER_LOBBY")), 0)
				var_30_14.Description:setText(Engine.CBBHFCGDIC("CODCASTER/REORDER_LOBBY_TOOL_TIP"), 0)
				var_30_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
				arg_30_0:addElement(var_30_14)

				arg_30_0.reorderLobbyButton = var_30_14

				arg_30_0.reorderLobbyButton:addEventHandler("button_action", function(arg_35_0, arg_35_1)
					MLG.CACGICCIHI(arg_30_1)
				end)

				local function var_30_15(arg_36_0)
					local var_36_0 = var_30_2:GetValue(arg_36_0)

					if CONDITIONS.IsTeamBasedGameType() and not var_36_0 then
						return false
					end

					return true
				end

				local var_30_16 = LUI.AggregateDataSource.new(var_30_1, {
					var_30_2
				}, "codcasterSettingsDisabled", var_30_15)

				local function var_30_17()
					arg_30_0.reorderLobbyButton:SetButtonDisabled(var_30_16:GetValue(arg_30_1))
				end

				arg_30_0:SubscribeToModel(var_30_16:GetModel(arg_30_1), var_30_17)
			end
		end
	end
end

function CODCASTER.DestroyCODCasterSettingsButton(arg_38_0, arg_38_1)
	if arg_38_0.codcasterSettingsButton ~= nil then
		arg_38_0.codcasterSettingsButton:closeTree()

		arg_38_0.codcasterSettingsButton = nil
	end
end

function CODCASTER.SetTeamColorLogo(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	local var_39_0, var_39_1 = CODCASTER.GetTeamLogoMaterial(arg_39_1, arg_39_2, arg_39_3)
	local var_39_2, var_39_3 = CODCASTER.GetTeamColor(arg_39_1, arg_39_2)

	if var_39_1 ~= "" then
		arg_39_0:setImage(RegisterMaterial(var_39_1), 0)
	else
		arg_39_0:setImage(RegisterMaterial(var_39_0), 0)

		if CODCASTER.IsCustomTeamIdentity(arg_39_1) then
			local var_39_4 = GetColorTableFromIntColor(var_39_2)
			local var_39_5 = 0.3

			var_39_4.r = math.min(var_39_4.r + var_39_5, 1)
			var_39_4.g = math.min(var_39_4.g + var_39_5, 1)
			var_39_4.b = math.min(var_39_4.b + var_39_5, 1)

			arg_39_0:SetRGBFromTable(var_39_4, 0)
		else
			arg_39_0:SetRGBFromInt(var_39_2, 0)
		end
	end
end

function CODCASTER.RemoveClanTagFromName(arg_40_0)
	local var_40_0 = arg_40_0

	if string.find(var_40_0, "%[") then
		local var_40_1, var_40_2, var_40_3 = string.match(var_40_0, "(.*)%s?(%[.+%])%s?(.*)")

		if var_40_1 and var_40_1 ~= "" then
			var_40_0 = var_40_1
		elseif var_40_3 and var_40_3 ~= "" then
			var_40_0 = var_40_3
		end

		var_40_0 = LUI.Trim(var_40_0)
	end

	return var_40_0
end

function CODCASTER.GetDominationPointTextFromNumber(arg_41_0)
	local var_41_0 = ""

	if arg_41_0 and arg_41_0 > 0 then
		var_41_0 = string.char(string.byte("A") + arg_41_0 - 1)
	end

	return var_41_0
end

function CODCASTER.IsDataViewVisible(arg_42_0)
	return MLG.ShoutcasterProfileVarBool(arg_42_0, "shoutcaster_dataview")
end

function CODCASTER.RedispatchOmnvarUpdateEvent(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = Game.BFEEGCHICA(arg_43_1, arg_43_2)

	if var_43_0 then
		local var_43_1 = {
			name = "omnvar_update",
			controller = arg_43_1,
			omnvar = arg_43_2,
			value = var_43_0
		}

		arg_43_0:dispatchEventToRoot(var_43_1)
	end
end

CODCASTER.fastDecodeLetterLength = 5
CODCASTER.fastDecodeMaxRandChars = 3
CODCASTER.fastDecodeUpdatesPerLetter = 4
CODCASTER.INVALID_CLIENTNUM = -1
CODCASTER.CAMERA_TYPES = {
	FREE = 1,
	AERIAL = 2,
	SPECTATOR = 0
}
CODCASTER.AERIAL_FOCUS_TYPE = {
	FREE = 1,
	TETHERED = 0,
	BARYCENTER = 2
}

local var_0_2 = {
	rokkr = "ui_playercard_823",
	royalravens = "ui_playercard_822",
	faze = "ui_playercard_816",
	opticgaming = "ui_playercard_821",
	subliners = "ui_playercard_824",
	legion = "ui_playercard_825",
	guerillas = "ui_playercard_820",
	surge = "ui_playercard_826",
	huntsmen = "ui_playercard_817",
	ultra = "ui_playercard_827",
	mutineers = "ui_playercard_819",
	empire = "ui_playercard_818"
}

function CODCASTER.GetCDLTeamPlayerCardIndex(arg_44_0)
	return var_0_2[arg_44_0]
end
