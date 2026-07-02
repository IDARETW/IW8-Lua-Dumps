SEASON = SEASON or {}
SEASON.DefaultSeason = 0
SEASON.KR15Season = 3

function SEASON.GetCurrentSeason()
	return Dvar.CFHDGABACF("LRTSSKLKPK")
end

function SEASON.GetName(arg_2_0)
	return StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, arg_2_0, CSV.seasons.cols.name)
end

function SEASON.GetImage(arg_3_0)
	return StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, arg_3_0, CSV.seasons.cols.image)
end

function SEASON.GetSeasonEmblem(arg_4_0, arg_4_1)
	local var_4_0 = CSV.seasons.cols.emblemFirst + (arg_4_1 - 1)

	return StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, arg_4_0, var_4_0)
end

function SEASON.GetSeasonEmblemList(arg_5_0)
	local var_5_0 = {}
	local var_5_1 = CSV.seasons.cols.emblemFirst - CSV.seasons.cols.emblemLast

	for iter_5_0 = 1, var_5_1 do
		table.insert(var_5_0, SEASON.GetSeasonEmblem(arg_5_0, iter_5_0))
	end

	return var_5_0
end

function SEASON.GetSeasonPopupIsResetType(arg_6_0)
	local var_6_0 = SEASON.GetCurrentSeason() - 1

	return var_6_0 >= 0 and (PROGRESSION.GetPlayerSeasonRank(arg_6_0, var_6_0) > 0 or PROGRESSION.GetPlayerSeasonXP(arg_6_0, var_6_0) > 0)
end

function SEASON.OpenSeasonResetPopup(arg_7_0)
	LUI.FlowManager.RequestPopupMenu(nil, "SeasonResetPopup", true, arg_7_0, false, nil)

	return "SeasonResetPopup"
end

function SEASON.OpenSeasonUnlockPopup(arg_8_0)
	LUI.FlowManager.RequestPopupMenu(nil, "SeasonUnlocksPopup", true, arg_8_0, false, nil)

	return "SeasonUnlocksPopup"
end

function SEASON.SeasonEndEpochTime()
	local var_9_0 = Dvar.CFHDGABACF("LLTMKKPKMR")

	var_9_0 = var_9_0 and var_9_0 > 0 and var_9_0 or Engine.DEIDGHDBHD()

	return var_9_0
end
