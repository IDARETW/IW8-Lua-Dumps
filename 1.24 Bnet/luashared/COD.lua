CoD = CoD or {}
CoD.StatsSource = {
	OFFLINE = 1,
	ONLINE = 0
}
CoD.StatsGroup = {
	Common = 2,
	PrivateLoadouts = 4,
	RankedLoadouts = 3,
	NonGame = 5,
	Ranked = 0,
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
