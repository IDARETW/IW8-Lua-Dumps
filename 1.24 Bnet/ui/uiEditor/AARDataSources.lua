DataSources.frontEnd.AAR = {
	MP = {
		playerData = {}
	},
	rewards = {},
	scoreboard = {},
	performance = {
		kdHistory = {},
		spmHistory = {}
	},
	medals = {}
}

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = DataSources.frontEnd.lobby.mapName:GetValue(arg_1_1)
	local var_1_1 = math.floor(arg_1_0 / 3600)

	if var_1_1 > 0 then
		local var_1_2 = math.floor(arg_1_0 / 60 - var_1_1 * 60)
		local var_1_3 = string.format("%.2d", arg_1_0 - var_1_1 * 60 * 60 - var_1_2 * 60)

		return Engine.CBBHFCGDIC("LUA_MENU_ZM/TIME_SURVIVED_HOURS", string.format("%.2d", var_1_1), string.format("%.2d", var_1_2), var_1_3, var_1_0)
	else
		local var_1_4 = math.floor(arg_1_0 / 60)
		local var_1_5 = string.format("%.2d", math.floor(arg_1_0 - var_1_4 * 60))

		return Engine.CBBHFCGDIC("LUA_MENU_ZM/TIME_SURVIVED_MINUTES", string.format("%.2d", var_1_4), var_1_5, var_1_0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	return Engine.CBBHFCGDIC("LUA_MENU_ZM/ROUNDS_SURVIVED", arg_2_0)
end

function InitAARScoreboardDataSources(arg_3_0)
	if Engine.EAIICIFIFA() and Engine.JCFIBGGJB(AAR.ClientMatchData.CP) then
		PostMatch.EAIFBEIBA(arg_3_0)
	elseif Engine.JCFIBGGJB(AAR.ClientMatchData.MP) then
		PostMatch.DIHICDDIH(arg_3_0)
	end

	if Engine.ECHCFGDDDF() then
		DataSources.frontEnd.AAR.scoreboard.myTeam = LUI.DataSourceInGlobalModel.new("frontEnd.AAR.scoreBoard.myTeam")
		DataSources.frontEnd.AAR.friendlyScore = LUI.DataSourceInGlobalModel.new("frontEnd.AAR.scoreBoard.friendlyScore")
		DataSources.frontEnd.AAR.enemyScore = LUI.DataSourceInGlobalModel.new("frontEnd.AAR.scoreBoard.enemyScore")
	end

	DataSources.frontEnd.AAR.scoreboard.myPlayerIndex = LUI.DataSourceInGlobalModel.new("frontEnd.AAR.scoreBoard.myPlayerIndex")
	DataSources.frontEnd.AAR.mapName = LUI.DataSourceInGlobalModel.new("frontEnd.AAR.mapName")

	if Engine.EAIICIFIFA() then
		DataSources.frontEnd.AAR.timeSurvived = LUI.DataSourceInGlobalModel.new("frontEnd.AAR.scoreBoard.players.timeSurvived")
		DataSources.frontEnd.AAR.timeSurvivedText = DataSources.frontEnd.AAR.timeSurvived:Filter("text", var_0_0)
		DataSources.frontEnd.AAR.roundsSurvived = LUI.DataSourceInGlobalModel.new("frontEnd.AAR.scoreBoard.players.wavesSurvived")
		DataSources.frontEnd.AAR.roundsSurvivedText = DataSources.frontEnd.AAR.roundsSurvived:Filter("text", var_0_1)
	end

	if CONDITIONS.IsBRGameType() then
		DataSources.frontEnd.AAR.position = LUI.DataSourceInGlobalModel.new("frontEnd.AAR.scoreBoard.myTeam.position")
	end

	if Engine.ECHCFGDDDF() then
		local var_3_0 = MP.GetCurrentGameTypeModifier()

		DataSources.frontEnd.AAR.gameTypeModifier = LUI.DataSourceInGlobalModel.new("frontEnd.AAR.gameTypeModifier", var_3_0)
	end

	DataSources.frontEnd.AAR.gameType = LUI.DataSourceInGlobalModel.new("frontEnd.AAR.gameType")
	DataSources.frontEnd.AAR.gameTime = LUI.DataSourceInGlobalModel.new("frontEnd.AAR.gameTime")

	SCOREBOARD.InitAARScoreboardDataSources(arg_3_0)
end

function InitAARPerformanceDataSources(arg_4_0)
	local var_4_0 = "frontEnd.AAR.performance"

	PostMatch.BGAHEDJBIF(arg_4_0)

	local function var_4_1(arg_5_0, arg_5_1)
		return string.format("%.2f", arg_5_0)
	end

	local function var_4_2(arg_6_0, arg_6_1)
		return string.format("%.1f %%", arg_6_0 * 100)
	end

	DataSources.frontEnd.AAR.performance.kills = LUI.DataSourceInControllerModel.new(var_4_0 .. ".kills")
	DataSources.frontEnd.AAR.performance.deaths = LUI.DataSourceInControllerModel.new(var_4_0 .. ".deaths")
	DataSources.frontEnd.AAR.performance.kdRatio = LUI.DataSourceInControllerModel.new(var_4_0 .. ".kdRatio")
	DataSources.frontEnd.AAR.performance.kdRatioString = DataSources.frontEnd.AAR.performance.kdRatio:Filter("kdRatioString", var_4_1)
	DataSources.frontEnd.AAR.performance.isPlacedInTopThree = LUI.DataSourceInControllerModel.new(var_4_0 .. ".isPlacedInTopThree")
	DataSources.frontEnd.AAR.performance.isPersonalBestKills = LUI.DataSourceInControllerModel.new(var_4_0 .. ".isPersonalBestKills")
	DataSources.frontEnd.AAR.performance.isPersonalBestKD = LUI.DataSourceInControllerModel.new(var_4_0 .. ".isPersonalBestKD")
	DataSources.frontEnd.AAR.performance.gamesPlayed = LUI.DataSourceInControllerModel.new(var_4_0 .. ".gamesPlayed")
	DataSources.frontEnd.AAR.performance.totalWins = LUI.DataSourceInControllerModel.new(var_4_0 .. ".totalWins")
	DataSources.frontEnd.AAR.performance.totalLosses = LUI.DataSourceInControllerModel.new(var_4_0 .. ".totalLosses")
	DataSources.frontEnd.AAR.performance.winLossPercent = LUI.DataSourceInControllerModel.new(var_4_0 .. ".winLossPercent")
	DataSources.frontEnd.AAR.performance.winLossPercentString = DataSources.frontEnd.AAR.performance.winLossPercent:Filter("winLossPercentString", var_4_2)
	DataSources.frontEnd.AAR.performance.kdHistory.maxValue = LUI.DataSourceInControllerModel.new(var_4_0 .. ".kdHistory.maxValue")
	DataSources.frontEnd.AAR.performance.kdHistory.average = LUI.DataSourceInControllerModel.new(var_4_0 .. ".kdHistory.average")
	DataSources.frontEnd.AAR.performance.kdHistory.globalStat = LUI.DataSourceInControllerModel.new(var_4_0 .. ".kdHistory.global")
	DataSources.frontEnd.AAR.performance.kdHistory.personalBestStat = LUI.DataSourceInControllerModel.new(var_4_0 .. ".kdHistory.best")
	DataSources.frontEnd.AAR.performance.kdHistory.personalBestTime = LUI.DataSourceInControllerModel.new(var_4_0 .. ".kdHistory.bestTimestamp")
	DataSources.frontEnd.AAR.performance.spmHistory.maxValue = LUI.DataSourceInControllerModel.new(var_4_0 .. ".spmHistory.maxValue")
	DataSources.frontEnd.AAR.performance.spmHistory.average = LUI.DataSourceInControllerModel.new(var_4_0 .. ".spmHistory.average")
	DataSources.frontEnd.AAR.performance.spmHistory.globalStat = LUI.DataSourceInControllerModel.new(var_4_0 .. ".spmHistory.global")
	DataSources.frontEnd.AAR.performance.spmHistory.personalBestStat = LUI.DataSourceInControllerModel.new(var_4_0 .. ".spmHistory.best")
	DataSources.frontEnd.AAR.performance.spmHistory.personalBestTime = LUI.DataSourceInControllerModel.new(var_4_0 .. ".spmHistory.bestTimestamp")
end

local function var_0_2(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = 0
	local var_7_1 = StringTable.BJJBBCJGEJ(CSV.scoreEventTable.file, CSV.scoreEventTable.cols.ref, arg_7_2.xpScoreEvent)
	local var_7_2 = CSV.ReadRow({
		file = CSV.scoreEventTable.file,
		cols = CSV.scoreEventTable.xpCols
	}, var_7_1)

	for iter_7_0, iter_7_1 in pairs(var_7_2) do
		local var_7_3 = tonumber(iter_7_1)

		if var_7_3 and var_7_3 > 0 then
			var_7_0 = var_7_3

			break
		end
	end

	return {
		text = LUI.DataSourceInControllerModel.new(arg_7_1 .. ".text", arg_7_2.title),
		icon = LUI.DataSourceInControllerModel.new(arg_7_1 .. ".icon", arg_7_2.icon),
		desc = LUI.DataSourceInControllerModel.new(arg_7_1 .. ".desc", arg_7_2.desc),
		xp = LUI.DataSourceInControllerModel.new(arg_7_1 .. ".xp", var_7_0),
		achieved = LUI.DataSourceInControllerModel.new(arg_7_1 .. ".achieved", true)
	}
end

function InitAARDataSources(arg_8_0)
	InitAARScoreboardDataSources(arg_8_0)

	if Engine.ECHCFGDDDF() then
		InitAARPerformanceDataSources(arg_8_0)
	end
end
