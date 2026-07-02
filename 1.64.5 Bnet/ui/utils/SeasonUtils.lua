SEASON = SEASON or {}
SEASON.DefaultSeason = 0
SEASON.KR15Season = 9
SEASON.NUM_SEASONS_PER_PREMIUM_PRODUCT = 6
SEASON.SEASON_PRESTIGE_MASTER_STARTS = 7
SEASON.WZ_LEGACY_SEASON_NUM = 18
SEASON.WZ_LEGACY_SEASON_DISPLAY_NUM = 6
SEASON.CHAPTER_NUM_T9 = 2
SEASON.CHAPTER_NUM_VG = 3

function SEASON.GetCurrentSeasonDataNum(arg_1_0)
	if arg_1_0 and arg_1_0.isForBattlePass then
		local var_1_0 = Dvar.CFHDGABACF("MMKKTMKTQS")

		if var_1_0 and var_1_0 > 0 then
			return var_1_0
		end
	end

	return Dvar.CFHDGABACF("LRTSSKLKPK")
end

function SEASON.GetCurrentChapterNum(arg_2_0)
	local var_2_0 = SEASON.GetCurrentSeasonDataNum(arg_2_0)

	return SEASON.GetChapterNumFromSeasonDataNum(var_2_0)
end

function SEASON.GetCurrentSeasonDisplayNum(arg_3_0)
	local var_3_0 = arg_3_0 and arg_3_0.seasonDataNumToUse or SEASON.GetCurrentSeasonDataNum(arg_3_0)
	local var_3_1 = var_3_0

	if var_3_0 > SEASON.NUM_SEASONS_PER_PREMIUM_PRODUCT then
		var_3_1 = (var_3_0 - 1) % SEASON.NUM_SEASONS_PER_PREMIUM_PRODUCT + 1
	end

	return var_3_1
end

function SEASON.GetSeasonDataNumFromDisplayNum(arg_4_0)
	return arg_4_0 + (SEASON.GetCurrentChapterNum() - 1) * SEASON.NUM_SEASONS_PER_PREMIUM_PRODUCT
end

function SEASON.GetChapterNumFromSeasonDataNum(arg_5_0)
	assert(arg_5_0 ~= nil and arg_5_0 >= 1)

	return math.floor((arg_5_0 - 1) / SEASON.NUM_SEASONS_PER_PREMIUM_PRODUCT) + 1
end

function SEASON.GetStartingSeasonDataNumForChapter(arg_6_0)
	assert(arg_6_0 ~= nil and arg_6_0 >= 1)

	return (arg_6_0 - 1) * SEASON.NUM_SEASONS_PER_PREMIUM_PRODUCT + 1
end

function SEASON.GetLocalizedName(arg_7_0)
	local var_7_0 = arg_7_0 and arg_7_0.seasonDataNumToUse or SEASON.GetCurrentSeasonDataNum(arg_7_0)
	local var_7_1 = StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, var_7_0, CSV.seasons.cols.name)
	local var_7_2 = SEASON.GetCurrentSeasonDisplayNum(arg_7_0)

	return Engine.CBBHFCGDIC(var_7_1, var_7_2)
end

function SEASON.GetLocalizedSimpleName(arg_8_0)
	local var_8_0 = SEASON.GetCurrentSeasonDisplayNum(arg_8_0)

	return Engine.CBBHFCGDIC("LUA_MENU/SEASON_NUM", var_8_0)
end

function SEASON.GetImage(arg_9_0)
	return StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, arg_9_0, CSV.seasons.cols.image)
end

function SEASON.GetSeasonEmblem(arg_10_0, arg_10_1)
	local var_10_0 = CSV.seasons.cols.emblemFirst + (arg_10_1 - 1)

	return StringTable.DIFCHIGDFB(CSV.seasons.file, CSV.seasons.cols.index, arg_10_0, var_10_0)
end

function SEASON.GetSeasonEmblemList(arg_11_0)
	local var_11_0 = {}
	local var_11_1 = CSV.seasons.cols.emblemFirst - CSV.seasons.cols.emblemLast

	for iter_11_0 = 1, var_11_1 do
		table.insert(var_11_0, SEASON.GetSeasonEmblem(arg_11_0, iter_11_0))
	end

	return var_11_0
end

function SEASON.SeasonEndEpochTime()
	local var_12_0 = Dvar.CFHDGABACF("LLTMKKPKMR")

	var_12_0 = var_12_0 and var_12_0 > 0 and var_12_0 or Engine.DEIDGHDBHD()

	return var_12_0
end
