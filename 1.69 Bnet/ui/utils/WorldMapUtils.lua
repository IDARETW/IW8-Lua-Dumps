WORLD_MAP = {}
WORLD_MAP.MapStates = {
	Reward = 4,
	Available = 2,
	Complete = 3,
	Unavailable = 1
}
WORLD_MAP.Regions = {
	URZIKSTAN = "urzikstan",
	GLOBAL_UPPER = "globalUpper",
	UK = "uk",
	GLOBAL_LOWER = "globalLower"
}
WORLD_MAP.UrzikstanLocation = {
	left = 2510,
	top = 743
}
WORLD_MAP.UkLocation = {
	left = 734,
	top = 348
}

function WORLD_MAP.BuildCurrentMap(arg_1_0)
	local var_1_0 = Engine.DEGIFDFHA()
	local var_1_1 = StringTable.DIFCHIGDFB(CSV.worldMap.file, CSV.worldMap.cols.index, var_1_0, CSV.worldMap.cols.widget)

	if var_1_1 and #var_1_1 > 0 then
		local var_1_2 = MenuBuilder.BuildRegisteredType(var_1_1, {
			controllerIndex = arg_1_0
		})

		var_1_2.id = "worldMap"

		WORLD_MAP.GenerateNavigationTables(var_1_2)

		return var_1_2
	end
end

function WORLD_MAP.GenerateNavigationTables(arg_2_0)
	local var_2_0 = arg_2_0:getFirstChild()

	while var_2_0 do
		local var_2_1 = var_2_0:getNextSibling()

		if var_2_0.SetupNavigation then
			var_2_0:SetupNavigation(arg_2_0)
		end

		var_2_0 = var_2_1
	end
end

function WORLD_MAP.SetHandleMouse(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0:getFirstChild()

	while var_3_0 do
		var_3_0 = var_3_0:getNextSibling(), var_3_0:SetHandleMouse(arg_3_1)
	end
end

function WORLD_MAP.GetClaimedTerritories(arg_4_0)
	return 1
end

function WORLD_MAP.GetOperationName()
	return "Operation Sandstorm"
end

function WORLD_MAP.GetEventName()
	return "Three kings event"
end

function WORLD_MAP.GetOperationFactionDetails()
	local var_7_0 = {
		leadFactionDetails = {}
	}

	var_7_0.leadFactionDetails.name = "Faction Name"
	var_7_0.leadFactionDetails.description = "Brief description about the faction"
	var_7_0.leadFactionDetails.image = "ui_default_white"
	var_7_0.leadFactionDetails.imageHeading = Engine.CBBHFCGDIC("LUA_MENU/LEAD_FACTION")
	var_7_0.operationDetails = {}
	var_7_0.operationDetails.name = "Commander Name"
	var_7_0.operationDetails.description = "Brief description about the Commander"
	var_7_0.operationDetails.image = "ui_default_white"
	var_7_0.operationDetails.imageHeading = Engine.CBBHFCGDIC("LUA_MENU/FACTION_OPERATOR")

	return var_7_0
end

function WORLD_MAP.GetOperationRewards()
	local var_8_0 = {}

	for iter_8_0 = 1, 3 do
		table.insert(var_8_0, WORLD_MAP.GetTerritoryRewardData(iter_8_0))
	end

	return var_8_0
end

function WORLD_MAP.GetPrimaryObjective()
	local var_9_0 = {}

	var_9_0.description = "Take providences to work towards liberating S.A.S"
	var_9_0.status = 0
	var_9_0.title = Engine.CBBHFCGDIC("LUA_MENU/PRIMARY_OBJECTIVE")
	var_9_0.image = "ui_default_white"

	return var_9_0
end

function WORLD_MAP.GetOptionalObjective()
	local var_10_0 = {}

	var_10_0.description = "Liberate all territories to receive operational bonus"
	var_10_0.status = 1
	var_10_0.title = Engine.CBBHFCGDIC("LUA_MENU/OPTIONAL_OBJECTIVE")
	var_10_0.image = "ui_default_white"

	return var_10_0
end

function WORLD_MAP.GetTerritoryData(arg_11_0)
	return {
		icon = WORLD_MAP.GetTerritoryIcon(arg_11_0),
		name = WORLD_MAP.GetTerritoryName(arg_11_0),
		playlist = WORLD_MAP.GetTerritoryPlaylistID(arg_11_0),
		mission = WORLD_MAP.GetTerritoryMissionData(arg_11_0)
	}
end

function WORLD_MAP.GetTerritoryRewardData(arg_12_0)
	local var_12_0 = {}

	var_12_0.territory = "Territory Name"
	var_12_0.name = "Reward Name"
	var_12_0.type = "Item Type"
	var_12_0.image = "ui_default_white"
	var_12_0.status = "Status"

	return var_12_0
end

function WORLD_MAP.GetTerritoryMissionData(arg_13_0)
	local var_13_0 = {}
	local var_13_1 = math.random(1, 3)

	if var_13_1 == 1 then
		var_13_0.missionDesc = "Play 2 matches of headquarters"
		var_13_0.missionName = "Headquarters"
		var_13_0.currProgress = 1
		var_13_0.maxProgress = 2
	elseif var_13_1 == 2 then
		var_13_0.missionDesc = "Play 3 matches of insert playlist here"
		var_13_0.missionName = "Playlist"
		var_13_0.currProgress = 1
		var_13_0.maxProgress = 3
	elseif var_13_1 == 3 then
		var_13_0.missionDesc = "Play 5 matches of TDM"
		var_13_0.missionName = "Team Deathmatch"
		var_13_0.currProgress = 3
		var_13_0.maxProgress = 5
	end

	var_13_0.reward = math.random(1000, 3000)

	return var_13_0
end

function WORLD_MAP.GetTerritoryIcon(arg_14_0)
	return "gamemode_team_deathmatch"
end

function WORLD_MAP.GetTerritoryPlaylistID(arg_15_0)
	return -1
end

function WORLD_MAP.GetTerritoryName(arg_16_0)
	return "S.A.B.F"
end

function WORLD_MAP.GetTerritoryState(arg_17_0)
	return WORLD_MAP.MapStates.Available
end
