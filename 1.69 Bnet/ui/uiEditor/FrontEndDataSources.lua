DataSources.frontEnd = {
	MainMenu = {
		SP = {},
		MP = {},
		CP = {}
	},
	MP = {
		flow = {},
		CAC = {},
		armory = {
			commonCrate = {},
			rareCrate = {},
			zombieCrate = {},
			zombieRareCrate = {}
		},
		commerce = {},
		conquest = {
			round = {}
		},
		headquarters = {
			combatRecord = {}
		},
		prestigeMenu = {},
		codtv = {},
		cwl = {
			drafting = {}
		}
	},
	CP = {
		fortuneCards = {},
		songs = {},
		prestigeMenu = {},
		reticles = {}
	},
	lobby = {},
	social = {},
	PlayerCard = {},
	lfpPartyInstrumentation = {}
}

function InitFrontEndDataSources()
	InitCommerceDataSources()
	InitSocialDataSources()
	InitLFPDataSources()

	if CONDITIONS.ArePartiesEnabledInMainMenu() then
		InitPartyDataSources()
	end

	DataSources.frontEnd.primaryPlayerUserName = LUI.DataSourceInGlobalModel.new("frontend.primaryPlayerName")
	DataSources.frontEnd.lobby.splitscreenPromptText = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.splitscreenPromptText")
	DataSources.frontEnd.lobby.inSplitScreen = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.inSplitScreen")
	DataSources.frontEnd.lobby.lobbyMusic = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.lobbyMusic")
end

function InitCoreMPFrontEndDataSources()
	if Engine.ECHCFGDDDF() then
		InitCommonMPFrontEndDataSources()
		InitMPCWLDataSources()
		InitConquestDataSources()
		InitHeadquartersDataSources()

		DataSources.frontEnd.MP.usedDoubleXPToken = LUI.DataSourceInControllerModel.new("frontEnd.MP.usedDoubleXPToken", false)
	end
end

function InitSPFrontEndDataSources()
	return
end

function InitCPFrontEndDataSources()
	if Engine.EAIICIFIFA() then
		InitCommonMPFrontEndDataSources()
		InitHeadquartersDataSources()
	end
end

function InitRPFrontEndDataSources()
	return
end

function InitCommerceDataSources()
	DataSources.frontEnd.MP.commerce.craftingCurrency = LUI.DataSourceInControllerModel.new("frontEnd.commerce.currency.crafting")
	DataSources.frontEnd.MP.commerce.baseInGameCurrency = LUI.DataSourceInControllerModel.new("frontEnd.commerce.currency.inGame")
	DataSources.frontEnd.MP.commerce.inGameCurrency = DataSources.frontEnd.MP.commerce.baseInGameCurrency:Filter("adjusted", CoD.GetAdjustedCurrency)
	DataSources.frontEnd.MP.commerce.inGameCurrencyDisplay = LUI.DataSourceInControllerModel.new("frontEnd.commerce.currency.inGameDisplay")
	DataSources.frontEnd.MP.commerce.percentToNextInGameDollar = DataSources.frontEnd.MP.commerce.baseInGameCurrency:Filter("percentToNext", CoD.GetPercentToNextCurrency)
	DataSources.frontEnd.MP.commerce.premiumCurrency = LUI.DataSourceInControllerModel.new("frontEnd.commerce.currency.premium")
	DataSources.frontEnd.MP.commerce.prestigeTokenCurrency = LUI.DataSourceInControllerModel.new("frontEnd.commerce.currency.prestigeToken")
end

function InitMPCWLDataSources()
	DataSources.frontEnd.MP.cwl.drafting.countdownTime = LUI.DataSourceInGlobalModel.new("frontEnd.MP.cwl.drafting.countdownTime")
end

function InitLFPDataSources()
	local function var_8_0(arg_9_0, arg_9_1)
		return LUI.DataSourceInGlobalModel.new(METRICS.LFP_DATASOURCE_PATH .. arg_9_1):GetValue(arg_9_0)
	end

	local function var_8_1(arg_10_0, arg_10_1, arg_10_2)
		return LUI.DataSourceInGlobalModel.new(METRICS.LFP_DATASOURCE_PATH .. arg_10_1):SetValue(arg_10_0, arg_10_2)
	end

	DataSources.frontEnd.lfpPartyInstrumentation.GetLFPValue = var_8_0
	DataSources.frontEnd.lfpPartyInstrumentation.SetLFPValue = var_8_1
end

function MissionCompletedFilter(arg_11_0, arg_11_1)
	return arg_11_0 >= 0
end

function MedalImageFilter(arg_12_0, arg_12_1)
	if arg_12_0 == 1 then
		return "mission_medal_bronze"
	elseif arg_12_0 == 2 then
		return "mission_medal_silver"
	elseif arg_12_0 == 3 then
		return "mission_medal_gold"
	end

	return "mission_medal_target"
end

function InitConquestRoundDataSources()
	DataSources.frontEnd.MP.conquest.round.missionXp = LUI.DataSourceInControllerModel.new("frontEnd.MP.conquest.round.missionXp", 0)
	DataSources.frontEnd.MP.conquest.round.tierCompleted = LUI.DataSourceInControllerModel.new("frontEnd.MP.conquest.round.tierCompleted", 0)
	DataSources.frontEnd.MP.conquest.round.medalImage = DataSources.frontEnd.MP.conquest.round.tierCompleted:Filter("medalImage", MedalImageFilter)
	DataSources.frontEnd.MP.conquest.round.missionCompleted = DataSources.frontEnd.MP.conquest.round.tierCompleted:Filter("missionCompleted", MissionCompletedFilter)
end

function InitConquestDataSources()
	InitConquestRoundDataSources()
end

function InitHeadquartersDataSources()
	DataSources.frontEnd.headquarters = LUI.DataSourceInGlobalModel.new("frontEnd.headquarters")
end

function InitCommonMPFrontEndDataSources()
	if Engine.EAAHGICFBD() then
		InitLobbyDataSources()
		InitCODTvDataSources()
		InitPlayerCardDataSources()
	end
end

local function var_0_0(arg_17_0)
	return arg_17_0 == 1
end

local function var_0_1(arg_18_0, arg_18_1, arg_18_2)
	return function(arg_19_0)
		local var_19_0 = Engine.JCBDICCAH(arg_18_0:GetValue(arg_19_0))
		local var_19_1 = arg_18_1:GetValue(arg_19_0)
		local var_19_2 = arg_18_2:GetValue(arg_19_0)

		if var_19_1 then
			return Engine.CBBHFCGDIC("LUA_MENU_MP/HARDCORE_GAME_TYPE", var_19_0)
		elseif var_19_2 then
			return Engine.CBBHFCGDIC("LUA_MENU_MP/REALISM_GAME_TYPE", var_19_0)
		else
			return var_19_0
		end
	end
end

local function var_0_2(arg_20_0, arg_20_1)
	return function(arg_21_0)
		assert(arg_20_0, "GAMETYPE NOT FOUND")
		assert(arg_20_1, "ISHARDCORE DATA SOURCE NOT FOUND")

		local var_21_0 = arg_20_0:GetValue(arg_21_0)

		if not var_21_0 then
			return
		end

		local var_21_1 = arg_20_1:GetValue(arg_21_0)
		local var_21_2 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_21_0, CSV.gameTypesTable.cols.image)

		if var_21_1 then
			local var_21_3 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_21_0, CSV.gameTypesTable.cols.hardcoreImage)

			if var_21_3 == "" then
				var_21_3 = var_21_2
			end

			return var_21_3 ~= "" and var_21_3 or "icon_playlist_generic"
		else
			return var_21_2 ~= "" and var_21_2 or "icon_playlist_generic"
		end
	end
end

function InitPartyDataSources()
	DataSources.frontEnd.lobby.memberCount = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.count")
	DataSources.frontEnd.lobby.memberMaxCount = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.maxCount")
	DataSources.frontEnd.lobby.isDedi = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.isDedi")
	DataSources.frontEnd.lobby.teamAlliesCount = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.teamAlliesCount")
	DataSources.frontEnd.lobby.teamAxisCount = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.teamAxisCount")
	DataSources.frontEnd.lobby.GameBattlesTeamRosterAlliesCount = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.GameBattlesTeamRosterAlliesCount")
	DataSources.frontEnd.lobby.GameBattlesTeamRosterAxisCount = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.GameBattlesTeamRosterAxisCount")
	DataSources.frontEnd.lobby.friendlyTeamCount = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.friendlyTeamCount")
	DataSources.frontEnd.lobby.friendlySubPartyIndex = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.friendlySubPartyIndex")
	DataSources.frontEnd.lobby.friendlyTeamIndex = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.friendlyTeamIndex")
	DataSources.frontEnd.lobby.friendlySquadIndex = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.friendlySquadIndex")
end

function InitLobbyDataSources()
	if not CONDITIONS.ArePartiesEnabledInMainMenu() then
		InitPartyDataSources()
	end

	DataSources.frontEnd.lobby.isSolo = DataSources.frontEnd.lobby.memberCount:Filter("isSolo", var_0_0)
	DataSources.frontEnd.lobby.mapName = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.mapName")
	DataSources.frontEnd.lobby.mapRef = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.mapRef")
	DataSources.frontEnd.lobby.mapImage = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.mapImage")
	DataSources.frontEnd.lobby.missionName = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.missionName")
	DataSources.frontEnd.lobby.gameType = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.gameType")
	DataSources.frontEnd.lobby.gameTypeName = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.gameTypeName")
	DataSources.frontEnd.lobby.isHardcoreGameType = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isHardcoreGameType")
	DataSources.frontEnd.lobby.isRealismGameType = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isRealismGameType")
	DataSources.frontEnd.lobby.battleRoyale = {}
	DataSources.frontEnd.lobby.battleRoyale.selectedMode = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.battleRoyale.selectedMode")
	DataSources.frontEnd.lobby.battleRoyale.fillType = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.battleRoyale.fillType")
	DataSources.frontEnd.lobby.battleRoyale.playlist = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.battleRoyale.playlist")

	local var_23_0 = DataSources.frontEnd.lobby.gameType
	local var_23_1 = DataSources.frontEnd.lobby.isHardcoreGameType
	local var_23_2 = DataSources.frontEnd.lobby.isRealismGameType

	DataSources.frontEnd.lobby.gameTypeImage = LUI.AggregateDataSource.new(var_23_0, {
		var_23_0,
		var_23_1
	}, "gameTypeImage", var_0_2(var_23_0, var_23_1))

	local var_23_3 = DataSources.frontEnd.lobby.gameTypeName

	DataSources.frontEnd.lobby.gameTypeNameWithModifier = LUI.AggregateDataSource.new(var_23_3, {
		var_23_3,
		var_23_1,
		var_23_2
	}, "gameTypeNameWithModifier", var_0_1(var_23_3, var_23_1, var_23_2))
	DataSources.frontEnd.lobby.votingComplete = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.votingComplete")
	DataSources.frontEnd.lobby.votingTime = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.votingTime")
	DataSources.frontEnd.lobby.timeRemaining = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.timeRemaining")
	DataSources.frontEnd.lobby.isUIFadingOut = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isUIFadingOut")
end

function InitCODTvDataSources()
	DataSources.frontEnd.MP.codtv.streamLiveCount = LUI.DataSourceInGlobalModel.new("mlgcontent.streams.liveCount")
	DataSources.frontEnd.MP.codtv.streamCount = LUI.DataSourceInGlobalModel.new("mlgcontent.streams.count")
	DataSources.frontEnd.MP.codtv.vodCount = LUI.DataSourceInGlobalModel.new("mlgcontent.VOD.count")
end

function InitSocialDataSources()
	DataSources.frontEnd.social.friendRequestCount = LUI.DataSourceInGlobalModel.new("frontEnd.social.friendRequestCount")
	DataSources.frontEnd.social.partyInvitationCount = LUI.DataSourceInGlobalModel.new("frontEnd.social.partyInvitationCount")
	DataSources.frontEnd.social.regimentInvitationCount = LUI.DataSourceInGlobalModel.new("frontEnd.social.regimentInvitationCount")
	DataSources.frontEnd.social.allRequestCount = LUI.DataSourceInGlobalModel.new("frontEnd.social.allRequestCount")
end

function InitPlayerCardDataSources()
	local var_26_0 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"

	DataSources.frontEnd.PlayerCard.title = LUI.DataSourceInControllerModel.new(var_26_0 .. ".titleIndex")
	DataSources.frontEnd.PlayerCard.frame = LUI.DataSourceInControllerModel.new(var_26_0 .. ".frameIndex")
	DataSources.frontEnd.PlayerCard.background = LUI.DataSourceInControllerModel.new(var_26_0 .. ".backgroundIndex")
end
