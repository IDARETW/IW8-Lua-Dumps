CoD = CoD or {}
CoD.StatsSource = {
	OFFLINE = 1,
	ONLINE = 0
}
CoD.StatsGroup = {
	Common = 2,
	PrivateLoadouts = 4,
	RankedLoadouts = 3,
	WZPrivateLoadouts = 6,
	Ranked = 0,
	WZRankedLoadouts = 5,
	NonGame = 7,
	Coop = 1
}
Teams = {
	team2 = 2,
	allies = 2,
	follower = 202,
	axis = 1,
	team5 = 5,
	maxNumTeams = 203,
	team3 = 3,
	spectator = 201,
	team6 = 6,
	free = 0,
	team1 = 1,
	team4 = 4
}
MissionTeams = {
	Wraith = 3,
	SaberTeamSeven = 2,
	OrionInitiative = 1,
	Wolverines = 0,
	BloodAnvil = 4
}
HINT_STYLES = {
	buddyBoost = 1,
	circle = 0
}

function bit(arg_1_0)
	return 2^(arg_1_0 - 1)
end

function hasbit(arg_2_0, arg_2_1)
	return arg_2_1 <= arg_2_0 % (arg_2_1 + arg_2_1)
end

function setbit(arg_3_0, arg_3_1)
	return hasbit(arg_3_0, arg_3_1) and arg_3_0 or arg_3_0 + arg_3_1
end

function clearbit(arg_4_0, arg_4_1)
	return hasbit(arg_4_0, arg_4_1) and arg_4_0 - arg_4_1 or arg_4_0
end

function BitShiftLeft(arg_5_0, arg_5_1)
	return arg_5_0 * 2^arg_5_1
end

function BitShiftRight(arg_6_0, arg_6_1)
	return arg_6_0 / 2^arg_6_1
end

function CoD.CheckAndApplyResetSeasonalPlayerData(arg_7_0)
	local var_7_0 = PlayerData.BFFBGAJGD(arg_7_0, CoD.StatsGroup.Ranked)

	if not var_7_0 or not var_7_0.lastSeenSeason or not var_7_0.lastSeenSeasonalEvent then
		return
	end

	local var_7_1 = tonumber(var_7_0.lastSeenSeason:get())
	local var_7_2 = SEASON.GetCurrentSeasonDataNum()
	local var_7_3 = var_7_1 ~= var_7_2

	if var_7_3 then
		Engine.JHIAHEEHE(arg_7_0, Onboarding.tutorials.SEASON_BINK_WATCH_FLAG)
		Engine.JHIAHEEHE(arg_7_0, Onboarding.tutorials.SEASON_MID_BINK_WATCH_FLAG)
		DebugPrint("Seasonal PlayerData Reset triggered ( last seen season = " .. tostring(var_7_1) .. " | current season = " .. tostring(var_7_2) .. " )")
		var_7_0.lastSeenSeason:set(var_7_2)
	end

	local var_7_4 = tonumber(var_7_0.lastSeenSeasonalEvent:get())
	local var_7_5 = SEASONAL_EVENT.GetCurrentEventID()
	local var_7_6 = var_7_4 ~= var_7_5

	if var_7_6 then
		Engine.JHIAHEEHE(arg_7_0, Onboarding.tutorials.SEASON_EVENT_POPUP_WATCH_FLAG)

		if Dvar.CFHDGABACF("NOSQLRPRKO") ~= 1 and Dvar.CFHDGABACF("MNNPPNRKMN") == 1 then
			Engine.JHIAHEEHE(arg_7_0, Onboarding.tutorials.CORTEZ_INSTANT_GRAT_SHOWN)
			Engine.JHIAHEEHE(arg_7_0, Onboarding.tutorials.CORTEZ_INSTANT_GRAT_SHOWN_AFTER_SEASON_START)
		end

		DebugPrint("Seasonal PlayerData Reset triggered ( last seen seasonal event = " .. tostring(var_7_5) .. " | current seasonal event = " .. tostring(var_7_5) .. " )")
		var_7_0.lastSeenSeasonalEvent:set(var_7_5)
	end

	if var_7_3 or var_7_6 then
		Engine.DAGFFDGFII("uploadstats", arg_7_0)
	end
end

function CoD.CheckAndApplySeasonalEventPlayerData(arg_8_0, arg_8_1)
	local var_8_0 = SEASONAL_EVENT.GetCurrentSeasonalEventOnboadingData()

	if var_8_0 and not var_8_0.WasCompleted(arg_8_0, arg_8_1) then
		Engine.JHIAHEEHE(arg_8_1, Onboarding.tutorials.PAUSE_MENU_LTM)
	end
end
