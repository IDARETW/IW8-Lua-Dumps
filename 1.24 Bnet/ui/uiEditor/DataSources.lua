DataSources = {
	alwaysLoaded = {
		input = {
			commands = {}
		},
		MP = {
			CAC = {
				ranked = {},
				private = {}
			},
			ranked = {
				progression = {}
			},
			contracts = {}
		},
		CP = {
			ranked = {
				progression = {}
			},
			loadOut = {}
		},
		playerData = {
			MP = {},
			CP = {}
		},
		telemetry = {},
		activeParty = {}
	},
	debug = {}
}

local var_0_0 = false

function InitCPRankedDataSources()
	if not var_0_0 then
		DataSources.alwaysLoaded.playerData.CP = LUI.DataSourceFromPlayerData.new(CoD.StatsGroup.Coop, CoD.PlayMode.Aliens)
		var_0_0 = true
	end
end
