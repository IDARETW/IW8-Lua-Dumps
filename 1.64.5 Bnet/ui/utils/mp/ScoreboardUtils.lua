SCOREBOARD = SCOREBOARD or {}
SCOREBOARD.columnsPerMode = {}
SCOREBOARD.maxVisibleTeamSize = 10
SCOREBOARD.maxInGameModeColumns = 2
SCOREBOARD.menus = {
	InGame = 1,
	AAR = 2
}
SCOREBOARD.GainFocusSFX = "ui_hilite"
SCOREBOARD.ping = {
	thresholds = {
		good = 150,
		poor = 250,
		fair = 200
	}
}
SCOREBOARD.type = {
	PVPVE = 3,
	MP = 1,
	CP = 2
}
SCOREBOARD.RowImageType = {
	PING = 2,
	DEATH = 1,
	MIC = 0
}
SCOREBOARD.RowImageTextureIndexTable = {
	PING_TEXTURE_3 = 2,
	PING_TEXTURE_2 = 1,
	MIC_TALK_TEXTURE = 5,
	REVIVE_TEXTURE = 7,
	DOGTAGS_MINIMAP_TEXTURE = 8,
	BOMB_TEXTURE = 9,
	DEATH_TEXTURE = 6,
	PING_TEXTURE_4 = 3,
	PING_TEXTURE_1 = 0,
	MIC_MUTE_TEXTURE = 4
}

function SCOREBOARD.InitializeGameTypeColumns(arg_1_0)
	SCOREBOARD.columnReferences = {}
	SCOREBOARD.columnsPerMode = {}
	SCOREBOARD.columnsPerMode[arg_1_0] = {}

	local var_1_0 = StringTable.BJJBBCJGEJ(CSV.scoreboardGameModeColumns.file, CSV.scoreboardGameModeColumns.cols.gameTypeRef, arg_1_0)
	local var_1_1 = CSV.ReadRow(CSV.scoreboardGameModeColumns, var_1_0)

	if not var_1_1 or not var_1_1.numCols or var_1_1.numCols == "" then
		local var_1_2 = StringTable.BJJBBCJGEJ(CSV.scoreboardGameModeColumns.file, CSV.scoreboardGameModeColumns.cols.gameTypeRef, "default")

		var_1_1 = CSV.ReadRow(CSV.scoreboardGameModeColumns, var_1_2)
	end

	local var_1_3 = tonumber(var_1_1.numCols) or 4

	for iter_1_0 = 0, var_1_3 - 1 do
		local var_1_4 = var_1_1["colRef" .. iter_1_0]

		assert(var_1_4)

		local var_1_5 = {
			value = var_1_4
		}

		for iter_1_1 = 0, 2 do
			local var_1_6 = "extraScore" .. iter_1_1

			if var_1_1[var_1_6] == var_1_4 then
				var_1_5.value = var_1_6
			end
		end

		local var_1_7 = StringTable.DIFCHIGDFB(CSV.gameStats.file, CSV.gameStats.cols.ref, var_1_4, CSV.gameStats.cols.name)

		assert(var_1_7)

		var_1_5.name = Engine.CBBHFCGDIC(var_1_7)

		table.insert(SCOREBOARD.columnReferences, var_1_4)

		local var_1_8 = iter_1_0 + 1

		SCOREBOARD.columnsPerMode[arg_1_0][var_1_8] = var_1_5
	end
end

local function var_0_0()
	local var_2_0 = Game.EBEHIFHGD()
	local var_2_1 = Engine.IJEBHJIJF()

	return var_2_0
end

function SCOREBOARD.GetGameType(arg_3_0)
	local var_3_0

	if Engine.EAIICIFIFA() then
		var_3_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")
	elseif SCOREBOARD.IsAARScoreboard() then
		var_3_0 = PlayerData.BFFBGAJGD(arg_3_0, CoD.StatsGroup.Common).round.gameMode:get()
	elseif CONDITIONS.IsWZRumble() then
		if Dvar.DHEEJCCJBH("scr_br_gametype") == "rumble" then
			var_3_0 = "rumble"
		else
			var_3_0 = var_0_0()
		end
	else
		var_3_0 = CONDITIONS.IsWZPayload() and "payload" or CONDITIONS.IsWZRatRace() and "rat_race" or var_0_0()
	end

	return var_3_0
end

function SCOREBOARD.GetGameTypeNameWithModifier(arg_4_0, arg_4_1)
	local var_4_0 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, arg_4_0, CSV.gameTypesTable.cols.name)
	local var_4_1 = var_4_0 and Engine.CBBHFCGDIC(var_4_0) or ""

	if Engine.ECHCFGDDDF() then
		if arg_4_1 == MP.GAME_TYPE_MODIFIERS.tactical then
			return Engine.CBBHFCGDIC("LUA_MENU_MP/REALISM_GAME_TYPE", var_4_1)
		elseif arg_4_1 == MP.GAME_TYPE_MODIFIERS.hardcore then
			return Engine.CBBHFCGDIC("LUA_MENU_MP/HARDCORE_GAME_TYPE", var_4_1)
		end
	end

	return var_4_1
end

function SCOREBOARD.GetGameModeFieldName(arg_5_0, arg_5_1)
	local var_5_0 = SCOREBOARD.GetGameType(arg_5_0)

	return (SCOREBOARD.columnsPerMode[var_5_0] or SCOREBOARD.columnsPerMode.default)[arg_5_1].value
end

function SCOREBOARD.GetPingIcon(arg_6_0)
	assert(arg_6_0)

	local var_6_0
	local var_6_1 = SCOREBOARD.ping.thresholds.poor
	local var_6_2 = SCOREBOARD.ping.thresholds.fair

	return arg_6_0 <= SCOREBOARD.ping.thresholds.good and "hud_ping_4" or arg_6_0 <= var_6_2 and "hud_ping_3" or arg_6_0 <= var_6_1 and "hud_ping_2" or "hud_ping_1"
end

function SCOREBOARD.CalculateKillDeathRatio(arg_7_0, arg_7_1)
	assert(arg_7_0, arg_7_1)

	if arg_7_1 == 0 then
		arg_7_1 = 1
	end

	local var_7_0 = arg_7_0 / arg_7_1
	local var_7_1 = "%.2f"

	if var_7_0 > 100 then
		var_7_1 = "%.0f"
	elseif var_7_0 > 10 then
		var_7_1 = "%.1f"
	end

	if var_7_0 > 999 then
		var_7_0 = 999
	end

	return string.format(var_7_1, var_7_0)
end

function SCOREBOARD.GetColumnNames(arg_8_0)
	return SCOREBOARD.columnReferences
end

function SCOREBOARD.IsAARScoreboard()
	return Engine.DDJFBBJAIG()
end

local function var_0_1(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = {}
	local var_10_1 = arg_10_1 .. ".scoreboard.team." .. arg_10_0

	if Engine.ECHCFGDDDF() then
		local var_10_2 = MP.GetTeamInfo(arg_10_0)

		var_10_0.name = LUI.DataSourceInGlobalModel.new(var_10_1 .. ".name", var_10_2.name)
		var_10_0.watermark = LUI.DataSourceInGlobalModel.new(var_10_1 .. ".watermark", var_10_2.watermark)
		var_10_0.logo = LUI.DataSourceInGlobalModel.new(var_10_1 .. ".logo", var_10_2.largeLogo)
	end

	return var_10_0
end

function SCOREBOARD.GetCurrentNumberPlayersAAR(arg_11_0, arg_11_1)
	local var_11_0 = DataSources.frontEnd.AAR

	assert(var_11_0 and var_11_0.scoreboard)

	local var_11_1 = var_11_0.scoreboard

	if Engine.EAIICIFIFA() then
		return var_11_1.numCPPlayers:GetValue(0)
	elseif arg_11_1 == Teams.allies then
		return var_11_1.numPlayersTeamA:GetValue(0)
	elseif arg_11_1 == Teams.axis then
		return var_11_1.numPlayersTeamB:GetValue(0)
	else
		return var_11_1.numFFAPlayers:GetValue(0)
	end
end

function SCOREBOARD.InitAARScoreboardDataSources(arg_12_0)
	SCOREBOARD.InitializeScoreboardUtils(arg_12_0)

	local var_12_0 = "frontEnd.AAR"

	if Engine.ECHCFGDDDF() and SCOREBOARD.IsAARScoreboard() then
		DataSources.frontEnd.AAR.scoreboard.numPlayersTeamA = LUI.DataSourceInGlobalModel.new(var_12_0 .. ".scoreBoard.players.numPlayersTeamA")
		DataSources.frontEnd.AAR.scoreboard.numPlayersTeamB = LUI.DataSourceInGlobalModel.new(var_12_0 .. ".scoreBoard.players.numPlayersTeamB")
		DataSources.frontEnd.AAR.scoreboard.numFFAPlayers = LUI.DataSourceInGlobalModel.new(var_12_0 .. ".scoreBoard.players.numFFAPlayers")
		DataSources.frontEnd.AAR.scoreboard.teamFFA = var_0_1(Teams.free, var_12_0, arg_12_0)
	elseif Engine.EAIICIFIFA() then
		DataSources.frontEnd.AAR.scoreboard.numCPPlayers = LUI.DataSourceInGlobalModel.new(var_12_0 .. ".scoreBoard.players.numCPPlayers")
	end
end

function SCOREBOARD.InitializeScoreboardUtils(arg_13_0)
	local var_13_0 = SCOREBOARD.GetGameType(arg_13_0)

	SCOREBOARD.InitializeGameTypeColumns("default")
	SCOREBOARD.InitializeGameTypeColumns(var_13_0)
end

function SCOREBOARD.GetColReferenceName(arg_14_0)
	return StringTable.DIFCHIGDFB(CSV.gameStats.file, CSV.gameStats.cols.ref, arg_14_0, CSV.gameStats.cols.name)
end

function SCOREBOARD.GetColReferenceIcon(arg_15_0)
	local var_15_0 = StringTable.DIFCHIGDFB(CSV.gameStats.file, CSV.gameStats.cols.ref, arg_15_0, CSV.gameStats.cols.icon)

	if var_15_0 == nil or var_15_0 == "" then
		var_15_0 = "icon_scoreboard_score"
	end

	return var_15_0
end

function SCOREBOARD.GetMaxColumn(arg_16_0)
	local var_16_0 = #SCOREBOARD.GetColumnNames(arg_16_0)
	local var_16_1 = 4

	if CONDITIONS.InGame() then
		if CONDITIONS.IsArenaGameType() then
			var_16_1 = 3
		elseif not SCOREBOARD.IsPostGameScoreboard(arg_16_0) then
			var_16_1 = 2
		end
	end

	return var_16_0 < var_16_1 and var_16_0 or var_16_1
end

function SCOREBOARD.IsPostGameScoreboard(arg_17_0)
	local var_17_0 = false

	if DataSources.inGame ~= nil and arg_17_0 ~= nil and CONDITIONS.IsCoreMultiplayer() then
		var_17_0 = DataSources.inGame.MP.match.matchOver:GetValue(arg_17_0)
	end

	return var_17_0
end

function SCOREBOARD.ToggleMuteAll(arg_18_0)
	local var_18_0 = not Lobby.FJCJFBBF()
	local var_18_1 = SCOREBOARD.IsAARScoreboard()
	local var_18_2 = false

	if not var_18_1 and not Game.BFEEGCHICA(arg_18_0, "ui_scoreboard_freeze") then
		Game.BFGAACEHBH(arg_18_0, var_18_0)

		var_18_2 = true
	elseif var_18_1 and Lobby.BBDICGHE() then
		Lobby.BFGAACEHBH(arg_18_0, var_18_0)

		var_18_2 = true
	end

	if var_18_2 then
		local var_18_3 = {
			icon = "hud_icon_player",
			displayTime = 3000,
			header = Engine.CBBHFCGDIC("LUA_MENU/VOICE_CHAT_MUTE_TOAST_HEADER"),
			controllerIndex = arg_18_0
		}

		if var_18_0 then
			var_18_3.description = Engine.CBBHFCGDIC("LUA_MENU/VOICE_CHAT_MUTE_TOAST_ALL_MUTED")
		else
			var_18_3.description = Engine.CBBHFCGDIC("LUA_MENU/VOICE_CHAT_MUTE_TOAST_ALL_UNMUTED")
		end

		Engine.DBFFAEEFGJ():dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_18_3
		})
	end
end

function SCOREBOARD.GetRowDataIndex(arg_19_0, arg_19_1, arg_19_2)
	if arg_19_0 <= SCOREBOARD.maxVisibleTeamSize or arg_19_2 == 0 then
		return arg_19_2
	end

	local var_19_0 = arg_19_1 - 1
	local var_19_1 = (SCOREBOARD.maxVisibleTeamSize - 2) / 2
	local var_19_2 = 0

	if var_19_0 <= var_19_1 + 1 then
		var_19_2 = 0
	elseif var_19_0 >= arg_19_0 - var_19_1 - 1 then
		var_19_2 = arg_19_0 - SCOREBOARD.maxVisibleTeamSize
	else
		var_19_2 = var_19_0 - var_19_1 - 1
	end

	return arg_19_2 + var_19_2
end

function SCOREBOARD.UpdateMutePrompt(arg_20_0, arg_20_1, arg_20_2)
	if not Engine.ECHCFGDDDF() or not CODCASTER.CanCODCast() or not CODCASTER.IsCODCaster() then
		if arg_20_0 then
			if Engine.BGGJFFFAFG(arg_20_2) then
				arg_20_1.ButtonHelperText:PushButtonPrompt({
					side = "right",
					priority = 1,
					gamepad_only = true,
					button_ref = "button_dpad_right",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/UNMUTE_ALL")
				})
			else
				arg_20_1.ButtonHelperText:PushButtonPrompt({
					kbm_only = true,
					priority = 1,
					ignoreTooltip = true,
					clickable = true,
					side = "right",
					button_ref = "button_r3",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/UNMUTE_ALL")
				})
			end
		elseif Engine.BGGJFFFAFG(arg_20_2) then
			arg_20_1.ButtonHelperText:PushButtonPrompt({
				side = "right",
				priority = 1,
				gamepad_only = true,
				button_ref = "button_dpad_right",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/MUTE_ALL")
			})
		else
			arg_20_1.ButtonHelperText:PushButtonPrompt({
				kbm_only = true,
				priority = 1,
				ignoreTooltip = true,
				clickable = true,
				side = "right",
				button_ref = "button_r3",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/MUTE_ALL")
			})
		end
	end
end

function SCOREBOARD.PrintDebugRowDataString(arg_21_0, arg_21_1)
	if arg_21_0 and (Dvar.IBEGCHEFE("LPRMKKQOS") or arg_21_1 and arg_21_1.enableDebugOverride) then
		local var_21_0 = (SCOREBOARD.IsAARScoreboard() and "\n Frontend " or "\n In-game") .. "\n --- playerName: " .. tostring(arg_21_0.name) .. "\n ---- team :" .. tostring(arg_21_0.team) .. "\n ---- clientNum :" .. tostring(arg_21_0.clientNum) .. "\n ---- rank :" .. tostring(arg_21_0.rank) .. "\n ---- extra score 0 :" .. tostring(arg_21_0.extraScore0) .. "\n ---- extra score 1 :" .. tostring(arg_21_0.extraScore1) .. "\n ---- extra score 2 :" .. tostring(arg_21_0.extraScore2) .. "\n ---- extra score 3 :" .. tostring(arg_21_0.extraScore3) .. "\n ---- extra score 4 :" .. tostring(arg_21_0.extraScore4) .. "\n ---- extra score 5 :" .. tostring(arg_21_0.extraScore5) .. "\n ---- kills :" .. tostring(arg_21_0.kills) .. "\n ---- score :" .. tostring(arg_21_0.score) .. "\n ---- damage :" .. tostring(arg_21_0.damage)

		DebugPrint(var_21_0)
	end
end

function SCOREBOARD.GetName()
	local var_22_0 = Game.EBEHIFHGD()
	local var_22_1

	if Engine.EAIICIFIFA() then
		if Dvar.DHEEJCCJBH("MOLPOSLOMO") == "cp_pvpve" then
			var_22_1 = "ScoreboardPvPvE"
		else
			var_22_1 = "CPMenuMap"
		end
	elseif CONDITIONS.IsWZPayload() then
		var_22_1 = Dvar.CFHDGABACF("debug_gsc_spawn_choice_enabled") == 1 and "BRMenuMap" or "WZPayloadMenuMap"
	elseif CONDITIONS.IsMagmaGameMode() then
		var_22_1 = CONDITIONS.IsRealismMode() and "BRRMenuMap" or "BRMenuMap"
	else
		var_22_1 = CONDITIONS.IsArenaGameType() and "ArenaScoreboard" or CONDITIONS.IsTrialGameType() and "TrialScoreboard" or GameX.gameModeIsFFA(var_22_0) and "FFAScoreboard" or "TeamScoreboard"
	end

	return var_22_1
end

function SCOREBOARD.GetCurrentScoreBoardMenu(arg_23_0, arg_23_1)
	local var_23_0

	if SCOREBOARD.IsAARScoreboard() then
		var_23_0 = arg_23_0:GetCurrentMenu()
	else
		var_23_0 = Engine.DBFFAEEFGJ().flowManager:GetMenuByName(SCOREBOARD.GetName())

		if var_23_0 == nil then
			var_23_0 = LUI.ScoreboardLayer.GetScoreboardMenu(arg_23_1)
		end
	end

	return var_23_0
end
