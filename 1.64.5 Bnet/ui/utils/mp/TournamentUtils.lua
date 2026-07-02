TOURNAMENT = TOURNAMENT or {}
TOURNAMENT.ParticipationStatus = {
	ACTIVE = 1,
	VICTORIOUS = 3,
	ELIMINATED = 2,
	NOT_PARTICIPATING = 0
}
TOURNAMENT.RoundTitles = {
	"TOURNAMENT/PRELIMINARY_ROUNDS",
	"TOURNAMENT/QUARTER_FINALS",
	"TOURNAMENT/SEMI_FINALS",
	"TOURNAMENT/FINAL"
}
TOURNAMENT.PreviewType = {
	PRE_MATCH = 0,
	IN_PROGRESS = 1,
	POST_MATCH = 2,
	LOBBY = 3
}
TOURNAMENT.OperatorPoses = {
	"sdr_mp_crouch_idle",
	"sdr_mp_stand_idle01",
	"sdr_mp_stand_idle01"
}
TOURNAMENT.rewardChallenge = 1544
TOURNAMENT.maxRewards = 4
TOURNAMENT.teamsPerMatch = 2
TOURNAMENT.teamsOnSide = 8
TOURNAMENT.maxPlayersOnTeam = 3
TOURNAMENT.defaultSunsetInterval = 4838400
TOURNAMENT.numSunsetChallenges = 17
TOURNAMENT.quitHistoryDuration = 86400
TOURNAMENT.quitHistoryCount = 4
TOURNAMENT.quitPenalties = {
	1800,
	3600,
	7200,
	1209600
}
TOURNAMENT.Menus = {
	arena = {
		WZ = "WZArenaTournament",
		MP = "ArenaTournament"
	},
	loading = {
		WZ = "WZTournamentLoadingScreen",
		MP = "TournamentLoadingScreen"
	},
	matchmaking = {
		WZ = "WZTournamentMatchmaking",
		MP = "TournamentMatchmaking"
	}
}
TOURNAMENT.Roots = {
	arena = {
		MP = PartyUIRoot.TOURNAMENT_BRACKET,
		WZ = PartyUIRoot.WZ_TOURNAMENT_BRACKET
	},
	loading = {
		MP = PartyUIRoot.TOURNAMENT_LOADING,
		WZ = PartyUIRoot.WZ_TOURNAMENT_LOADING
	},
	matchmaking = {
		MP = PartyUIRoot.TOURNAMENT_MATCHMAKING,
		WZ = PartyUIRoot.WZ_TOURNAMENT_MATCHMAKING
	}
}

function TOURNAMENT.IsF2PTournamentAllowed()
	return Dvar.IBEGCHEFE("LNKTTMTOMR") and not Engine.BDGIEFCCJE() and not CONDITIONS.IsWeGameGovBanned()
end

function TOURNAMENT.GetMenuName(arg_2_0)
	return Engine.HEEFCICJE() and TOURNAMENT.Menus[arg_2_0].WZ or TOURNAMENT.Menus[arg_2_0].MP
end

function TOURNAMENT.GetUIRoot(arg_3_0)
	return Engine.HEEFCICJE() and TOURNAMENT.Roots[arg_3_0].WZ or TOURNAMENT.Roots[arg_3_0].MP
end

function TOURNAMENT.GetUIRootForF2PFromPremiumIfF2PAllowed(arg_4_0)
	local var_4_0 = arg_4_0

	if TOURNAMENT.IsF2PTournamentAllowed() then
		if arg_4_0 == PartyUIRoot.TOURNAMENT_LOADING then
			var_4_0 = PartyUIRoot.WZ_TOURNAMENT_LOADING
		elseif arg_4_0 == PartyUIRoot.TOURNAMENT_MATCHMAKING then
			var_4_0 = PartyUIRoot.WZ_TOURNAMENT_MATCHMAKING
		elseif arg_4_0 == PartyUIRoot.TOURNAMENT_BRACKET then
			var_4_0 = PartyUIRoot.WZ_TOURNAMENT_BRACKET
		end
	end

	return var_4_0
end

function TOURNAMENT.ButtonAction(arg_5_0)
	local function var_5_0(arg_6_0)
		if arg_6_0 then
			TOURNAMENT.OpenTournamentSignUp(arg_5_0)
		end
	end

	if Engine.JACCCCEDI() and not TOURNAMENT.IsF2PTournamentAllowed() then
		LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_5_0, false, {
			premium = true,
			invalidPlaylists = {},
			leavePartyAction = var_5_0
		})
	elseif not Engine.HBIAGEFCC() then
		LUI.FlowManager.RequestPopupMenu(nil, "RemovePlayersMatchmakingPopup", false, arg_5_0, false, {
			subscription = true,
			invalidPlaylists = {},
			leavePartyAction = var_5_0
		})
	else
		var_5_0(true)
	end
end

function TOURNAMENT.OpenTournamentSignUp(arg_7_0)
	if not TOURNAMENT.DoEntranceCheck(arg_7_0) then
		return
	end

	if Tournament.DBDCBIJFHG() then
		Tournament.BBGDBHCIBA()
		LUI.FlowManager.RequestAddMenu(TOURNAMENT.GetMenuName("arena"), false, arg_7_0, false, {}, true)
	elseif Tournament.EBIIIFGCD(arg_7_0) then
		LUI.FlowManager.RequestPopupMenu(nil, "TournamentBannedPopup", true, arg_7_0, false, {
			duration = Tournament.BJCAJFJJCA(arg_7_0)
		})
	elseif not Tournament.BBAFFAGGHC(arg_7_0) then
		LUI.FlowManager.RequestPopupMenu(nil, "TournamentSignUpAlpha", true, arg_7_0, false)
	else
		local function var_7_0()
			LUI.FlowManager.RequestAddMenu(TOURNAMENT.GetMenuName("loading"), false, arg_7_0, false, {}, true)
		end

		Lobby.TryNavigateToLobby(var_7_0)
	end
end

function TOURNAMENT.GetRoundTitle(arg_9_0)
	local var_9_0 = Tournament.DEAFAIEJGI()
	local var_9_1 = TOURNAMENT.RoundTitles[1]

	if arg_9_0 > 1 then
		local var_9_2 = var_9_0 - arg_9_0
		local var_9_3 = Mirror(var_9_2, 0, 3) + 1

		var_9_1 = TOURNAMENT.RoundTitles[var_9_3]
	end

	return var_9_1
end

function TOURNAMENT.GetPlayerData(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	local var_10_0 = {
		health = Tournament.EAGDDEGHGG(arg_10_0 - 1, arg_10_1 - 1, arg_10_2 - 1, arg_10_3 - 1)
	}

	var_10_0.dead = var_10_0.health <= 0
	var_10_0.ready = Tournament.CAGEFGECJF(arg_10_0 - 1, arg_10_1 - 1, arg_10_2 - 1, arg_10_3 - 1)

	local var_10_1 = Tournament.BCGGEDJHCG(arg_10_0 - 1, arg_10_1 - 1, arg_10_2 - 1)

	var_10_0.name = Tournament.DGEFHBHJDJ(var_10_1) ~= "" and Tournament.BHDJAJECII(var_10_1, arg_10_3 - 1) or ""

	return var_10_0
end

function TOURNAMENT.GetMatchTimeString(arg_11_0, arg_11_1)
	local var_11_0 = Tournament.CFHJJJAEDJ(arg_11_0, arg_11_1)

	if var_11_0 == -1 then
		return Engine.CBBHFCGDIC("TOURNAMENT/OVERTIME"), var_11_0
	elseif var_11_0 == -2 then
		return Engine.CBBHFCGDIC("TOURNAMENT/PRE_GAME"), var_11_0
	elseif var_11_0 == -3 or var_11_0 == -43 then
		return Engine.CBBHFCGDIC("TOURNAMENT/ROUND_END"), var_11_0
	elseif var_11_0 < 0 then
		return "", var_11_0
	else
		return Engine.BJCFFHAIFA(var_11_0 / 1000)
	end
end

function TOURNAMENT.GetTeamColor(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = Tournament.BCGGEDJHCG(arg_12_0 - 1, arg_12_1 - 1, arg_12_2 - 1) + 1

	return SWATCHES.Tournament["team" .. var_12_0] or COLORS.white
end

function TOURNAMENT.GetMyTeamIndex(arg_13_0, arg_13_1)
	local var_13_0 = 1
	local var_13_1 = Tournament.CCHGIAABHJ()

	for iter_13_0 = 1, TOURNAMENT.teamsPerMatch do
		if Tournament.BCGGEDJHCG(arg_13_0 - 1, arg_13_1 - 1, iter_13_0 - 1) == var_13_1 then
			var_13_0 = iter_13_0
		end
	end

	return var_13_0
end

function TOURNAMENT.GetTeamData(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	arg_14_3 = arg_14_3 or {}
	arg_14_3.myTeamID = arg_14_3.myTeamID or Tournament.CCHGIAABHJ()

	local var_14_0 = Tournament.BCGGEDJHCG(arg_14_0 - 1, arg_14_1 - 1, arg_14_2 - 1)
	local var_14_1 = Tournament.DGEFHBHJDJ(var_14_0)
	local var_14_2 = {
		wins = Tournament.DCFJHHBECC(arg_14_0 - 1, arg_14_1 - 1, arg_14_2 - 1),
		name = #var_14_1 > 0 and Engine.CBBHFCGDIC(var_14_1) or Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"),
		isMyTeam = arg_14_3.myTeamID == var_14_0
	}
	local var_14_3 = Tournament.BEJEJJBACA(arg_14_0 - 1, arg_14_1 - 1)

	var_14_2.won = var_14_3 == arg_14_2 - 1
	var_14_2.lost = var_14_3 ~= arg_14_2 - 1 and var_14_3 ~= -1
	var_14_2.players = {}
	var_14_2.totalHealth = 0
	var_14_2.color = TOURNAMENT.GetTeamColor(arg_14_0, arg_14_1, arg_14_2)
	var_14_2.teamID = var_14_0

	local var_14_4 = var_14_2.players

	for iter_14_0 = 1, Tournament.DIGGEIGAHD() do
		var_14_2.players[iter_14_0] = TOURNAMENT.GetPlayerData(arg_14_0, arg_14_1, arg_14_2, iter_14_0, arg_14_3)
		var_14_2.totalHealth = var_14_2.totalHealth + var_14_2.players[iter_14_0].health
	end

	assert(Tournament.DIGGEIGAHD() > 0)

	local var_14_5 = var_14_2.totalHealth / (Tournament.DIGGEIGAHD() * 100)

	var_14_2.totalHealthPercent = Engine.CBBHFCGDIC("CAS/PERCENT", math.floor(var_14_5 * 100))

	return var_14_2
end

function TOURNAMENT.GetMatchData(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {
		canSpectate = Tournament.BEBDGHGIEG(arg_15_0 - 1, arg_15_1 - 1),
		complete = Tournament.EAHDCDDFCD(arg_15_0 - 1, arg_15_1 - 1)
	}

	var_15_0.timeString, var_15_0.time = TOURNAMENT.GetMatchTimeString(arg_15_0 - 1, arg_15_1 - 1)
	var_15_0.teams = {}
	var_15_0.isMyMatch = false

	for iter_15_0 = 1, 2 do
		var_15_0.teams[iter_15_0] = TOURNAMENT.GetTeamData(arg_15_0, arg_15_1, iter_15_0, arg_15_2)

		if var_15_0.teams[iter_15_0].isMyTeam then
			var_15_0.isMyMatch = true
		end
	end

	var_15_0.roundIndex = arg_15_0
	var_15_0.matchIndex = arg_15_1
	var_15_0.subMatchIndex = Tournament.DBGIAJFFHB(arg_15_0 - 1, arg_15_1 - 1) + 1

	return var_15_0
end

function TOURNAMENT.GetRoundData(arg_16_0, arg_16_1)
	arg_16_1 = arg_16_1 or {}
	arg_16_1.roundCount = arg_16_1.roundCount or Tournament.DEAFAIEJGI()

	local var_16_0 = {
		matches = {}
	}
	local var_16_1 = 2^(arg_16_1.roundCount - arg_16_0)

	for iter_16_0 = 1, var_16_1 do
		var_16_0.matches[iter_16_0] = TOURNAMENT.GetMatchData(arg_16_0, iter_16_0, arg_16_1)
	end

	return var_16_0
end

function TOURNAMENT.IsRoundComplete(arg_17_0)
	local var_17_0 = true

	for iter_17_0 = 1, #arg_17_0.matches do
		if not arg_17_0.matches[iter_17_0].complete then
			var_17_0 = false

			break
		end
	end

	return var_17_0
end

function TOURNAMENT.GetFullData()
	local var_18_0 = {}
	local var_18_1 = Tournament.DEAFAIEJGI()
	local var_18_2 = Tournament.CCHGIAABHJ()

	var_18_0.rounds = {}

	for iter_18_0 = 1, var_18_1 + 1 do
		var_18_0.rounds[iter_18_0] = TOURNAMENT.GetRoundData(iter_18_0, {
			roundCount = var_18_1,
			myTeamID = var_18_2
		})
	end

	return var_18_0
end

function TOURNAMENT.GetMyPlacement()
	if Tournament.BEFJGJJBEI() == MP.TournamentParticipationStatus.VICTORIOUS then
		return 1
	end

	local var_19_0 = Tournament.BJGJIJIEGG() + 1

	return 2^(Mirror(var_19_0, 1, Tournament.DEAFAIEJGI()) - 1) + 1
end

function TOURNAMENT.GetMyPlacementImage()
	local var_20_0 = TOURNAMENT.GetMyPlacement()

	if var_20_0 == 1 then
		return RegisterMaterial("tournament_trophy_first_place")
	elseif var_20_0 == 2 then
		return RegisterMaterial("tournament_trophy_second_place")
	elseif var_20_0 == 3 then
		return RegisterMaterial("tournament_trophy_third_place")
	else
		return RegisterMaterial("tournament_trophy_participation")
	end
end

function TOURNAMENT.GetMyPlacementString()
	local var_21_0 = TOURNAMENT.GetMyPlacement()

	return MenuUtils.GetOrdinalNumber(var_21_0)
end

function TOURNAMENT.GetMapNameForRound(arg_22_0)
	local var_22_0 = Tournament.DGIECJBJFB(arg_22_0 - 1)

	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_22_0, CSV.mpMapTable.cols.name))
end

function TOURNAMENT.GetMapInfoForRound(arg_23_0)
	local var_23_0 = Tournament.DGIECJBJFB(arg_23_0 - 1)
	local var_23_1 = StringTable.BJJBBCJGEJ(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_23_0)

	return CSV.ReadRowWithColumns(CSV.mpMapTable, var_23_1, {
		name = CSV.mpMapTable.cols.name,
		image = CSV.mpMapTable.cols.loadingImage
	})
end

function TOURNAMENT.GetAdjustedMatchIndex(arg_24_0, arg_24_1)
	local var_24_0 = Tournament.DEAFAIEJGI()
	local var_24_1 = 0

	for iter_24_0 = 1, arg_24_0 do
		var_24_1 = var_24_1 + TOURNAMENT.teamsOnSide / 2^iter_24_0
	end

	return var_24_1 + arg_24_1 + 1
end

function TOURNAMENT.GetRewardsForRank(arg_25_0)
	local var_25_0 = Tournament.BGDHBAIDHJ()

	if var_25_0 and var_25_0.Rewards then
		return var_25_0.Rewards[arg_25_0]
	end
end

function TOURNAMENT.GetTournamentTeamDatasources(arg_26_0, arg_26_1)
	local var_26_0 = "frontEnd.tournaments.teams"
	local var_26_1 = LUI.DataSourceInGlobalModel.new(var_26_0 .. ".count")
	local var_26_2 = LUI.DataSourceFromList.new(var_26_1)

	local function var_26_3(arg_27_0, arg_27_1)
		return function(arg_28_0, arg_28_1)
			return {
				stickerID = LUI.DataSourceInGlobalModel.new(arg_27_0 .. arg_27_1 .. ".sticker." .. arg_28_1)
			}
		end
	end

	local function var_26_4(arg_29_0, arg_29_1)
		return function(arg_30_0, arg_30_1)
			return {
				variantID = LUI.DataSourceInGlobalModel.new(arg_29_0 .. arg_29_1 .. ".attachment." .. arg_30_1 .. ".variant"),
				attachment = LUI.DataSourceInGlobalModel.new(arg_29_0 .. arg_29_1 .. ".attachment." .. arg_30_1 .. ".attachment")
			}
		end
	end

	local function var_26_5(arg_31_0)
		return function(arg_32_0, arg_32_1)
			local var_32_0 = LUI.DataSourceInGlobalModel.new(arg_31_0 .. arg_32_1 .. ".stickerCount")
			local var_32_1 = LUI.DataSourceFromList.new(var_32_0)

			var_32_1.MakeDataSourceAtIndex = var_26_3(arg_31_0, arg_32_1)

			local var_32_2 = LUI.DataSourceInGlobalModel.new(arg_31_0 .. ".attachmentCount")
			local var_32_3 = LUI.DataSourceFromList.new(var_32_2)

			var_32_3.MakeDataSourceAtIndex = var_26_4(arg_31_0, arg_32_1)

			return {
				weaponLootID = LUI.DataSourceInGlobalModel.new(arg_31_0 .. arg_32_1 .. ".weaponLootID"),
				cosmeticAttachment = LUI.DataSourceInGlobalModel.new(arg_31_0 .. arg_32_1 .. ".cosmeticAttachment"),
				weaponCamo = LUI.DataSourceInGlobalModel.new(arg_31_0 .. arg_32_1 .. ".weaponCamo"),
				stickers = var_32_1,
				attachments = var_32_3
			}
		end
	end

	local function var_26_6(arg_33_0)
		return function(arg_34_0, arg_34_1)
			local var_34_0 = arg_33_0 .. "." .. arg_34_1 .. ".weaponSetup."
			local var_34_1 = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".weaponCount")
			local var_34_2 = LUI.DataSourceFromList.new(var_34_1)

			var_34_2.MakeDataSourceAtIndex = var_26_5(var_34_0)

			local var_34_3 = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".rank." .. arg_34_1)
			local var_34_4 = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".prestige." .. arg_34_1)
			local var_34_5 = Rank.MakeRankIconAggregateFunction(var_34_3, var_34_4)
			local var_34_6 = LUI.AggregateDataSource.new(var_34_3, {
				var_34_3,
				var_34_4
			}, "rankIcon", var_34_5)
			local var_34_7 = Rank.MakeRankDisplayAggregateFunction(var_34_3, var_34_4, true)
			local var_34_8 = LUI.AggregateDataSource.new(var_34_3, {
				var_34_3,
				var_34_4
			}, "display", var_34_7)
			local var_34_9 = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".microphoneState." .. arg_34_1)

			return {
				name = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".name." .. arg_34_1),
				headWest = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".headWest." .. arg_34_1),
				bodyWest = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".bodyWest." .. arg_34_1),
				execWest = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".execWest." .. arg_34_1),
				headEast = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".headEast." .. arg_34_1),
				bodyEast = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".bodyEast." .. arg_34_1),
				execEast = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".execEast." .. arg_34_1),
				selectedOperatorIndex = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".selectedOperatorIndex." .. arg_34_1),
				memberIndex = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".index." .. arg_34_1),
				localPlayerIndex = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".localPlayerIndex." .. arg_34_1),
				weapons = var_34_2,
				displayRank = var_34_8,
				rankIcon = var_34_6,
				microphoneState = var_34_9,
				microphoneIcon = var_34_9:Filter("icon", Mic.GetIcon),
				microphoneAlpha = var_34_9:Filter("alpha", Mic.GetIconAlpha),
				presencePlatform = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".presencePlatform." .. arg_34_1),
				isCrossplayPlayer = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".isCrossplayPlayer." .. arg_34_1),
				isInParty = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".isInParty." .. arg_34_1),
				xuid = LUI.DataSourceInGlobalModel.new(arg_33_0 .. ".xuid." .. arg_34_1)
			}
		end
	end

	function var_26_2.MakeDataSourceAtIndex(arg_35_0, arg_35_1)
		local var_35_0 = var_26_0 .. "." .. arg_35_1 .. ".member"
		local var_35_1 = LUI.DataSourceInGlobalModel.new(var_35_0 .. ".count")
		local var_35_2 = LUI.DataSourceFromList.new(var_35_1)

		var_35_2.MakeDataSourceAtIndex = var_26_6(var_35_0)

		return {
			members = var_35_2
		}
	end

	return var_26_2
end

function TOURNAMENT.GetTeamDatasource(arg_36_0, arg_36_1)
	return arg_36_0:GetDataSourceAtIndex(arg_36_1)
end

function TOURNAMENT.GetClientCharacterIndex(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0 == 0 and "ArenaLeft" or "ArenaRight"

	return FrontEndScene.ClientCharacters[var_37_0 .. arg_37_1]
end

function TOURNAMENT.SetCharacterVisible(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = TOURNAMENT.GetClientCharacterIndex(arg_38_0, arg_38_1)

	FrontEndScene.SetCharacterVisible(var_38_0, arg_38_2)
end

function TOURNAMENT.CanCancelRegistration(arg_39_0)
	return Tournament.BBAFFAGGHC(arg_39_0) and not Tournament.BEAIBEGFFB()
end

function TOURNAMENT.RequestClientCharacterData(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4)
	local var_40_0 = {
		arg_40_1,
		arg_40_2
	}
	local var_40_1 = {}
	local var_40_2 = {}
	local var_40_3 = {}
	local var_40_4 = {}
	local var_40_5 = {}
	local var_40_6 = {}
	local var_40_7 = {}
	local var_40_8 = {
		var_40_6,
		var_40_7
	}

	for iter_40_0 = 1, #var_40_0 do
		local var_40_9 = var_40_0[iter_40_0]
		local var_40_10 = var_40_9.members:GetCountValue(arg_40_3)

		if not var_40_10 then
			return
		end

		local var_40_11

		if iter_40_0 == 1 then
			var_40_11 = Lobby.GetSuperFactionIndexFromTeam(arg_40_4)
		else
			local var_40_12 = Mirror(arg_40_4, Teams.axis, Teams.allies)

			var_40_11 = Lobby.GetSuperFactionIndexFromTeam(var_40_12)
		end

		for iter_40_1 = 0, var_40_10 do
			local var_40_13 = var_40_9.members:GetDataSourceAtIndex(iter_40_1, arg_40_3)

			if var_40_13 then
				local var_40_14 = Lobby.GetPlayerCardDataForPartyMember(arg_40_3, var_40_13)

				if var_40_14.bodyEast and var_40_14.bodyWest and var_40_14.headEast and var_40_14.headWest and #var_40_14.weapons > 0 then
					local var_40_15, var_40_16 = Lobby.GetModelDetailsFromPlayerCard(var_40_14, var_40_11, arg_40_3)
					local var_40_17 = Lobby.GetWeaponLoadoutDetailsFromPlayerCard(var_40_14, 1, arg_40_3)
					local var_40_18 = Lobby.GetWeaponLoadoutDetailsFromPlayerCard(var_40_14, 2, arg_40_3)
					local var_40_19 = var_40_13.memberIndex:GetValue(arg_40_3)
					local var_40_20, var_40_21 = Lobby.TrySwapWeapons(var_40_17, var_40_18)

					table.insert(var_40_4, var_40_20)
					table.insert(var_40_5, var_40_21)
					table.insert(var_40_3, var_40_20)
					table.insert(var_40_3, var_40_21)
					table.insert(var_40_1, var_40_15)
					table.insert(var_40_2, var_40_16)

					local var_40_22 = Lobby.GetPetFromPlayerCard(var_40_14, var_40_11)

					if var_40_22 then
						table.insert(var_40_1, OPERATOR.GetPetModel(var_40_22))
					end

					table.insert(var_40_8[iter_40_0], {
						memberIndex = var_40_19,
						primaryWeaponModel = var_40_20,
						secondaryWeaponModel = var_40_21,
						bodyModel = var_40_15,
						headModel = var_40_16,
						superfactionIndex = var_40_11,
						pet = var_40_22
					})
				end
			end
		end
	end

	FrontEndScene.RequestBodyModels(var_40_1)
	FrontEndScene.RequestHeadModels(var_40_2)
	FrontEndScene.RequestWeaponWorldModels(var_40_3)

	return var_40_8
end

function TOURNAMENT.GetPetIndexForCharacter(arg_41_0)
	local var_41_0

	if arg_41_0 >= FrontEndScene.ClientCharacters.ArenaRight1 then
		local var_41_1 = arg_41_0 - FrontEndScene.ClientCharacters.ArenaRight1

		var_41_0 = FrontEndScene.ClientCharacters.LobbyPet3 + var_41_1
	else
		var_41_0 = FrontEndScene.ClientCharacters.LobbyPet1 + arg_41_0
	end

	if var_41_0 <= FrontEndScene.ClientCharacters.LobbyPet4 then
		return var_41_0
	end
end

function TOURNAMENT.UpdateClientCharacters(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = 1
	local var_42_1 = false
	local var_42_2 = false

	for iter_42_0 = 1, #arg_42_1 do
		local var_42_3 = arg_42_1[iter_42_0]
		local var_42_4 = arg_42_2[iter_42_0]

		for iter_42_1 = 1, #var_42_3 do
			local var_42_5 = var_42_3[iter_42_1]

			if var_42_5 then
				if not var_42_4[iter_42_1]:getParent() then
					local var_42_6 = var_42_4[iter_42_1 - 1]
					local var_42_7 = var_42_4[iter_42_1 + 1]

					if var_42_6 and var_42_6:getParent() then
						var_42_4[iter_42_1]:addElementAfter(var_42_6)

						var_42_1 = true
					end

					if not var_42_1 and var_42_7 and var_42_7:getParent() then
						var_42_4[iter_42_1]:addElementBefore(var_42_7)
					end
				end

				local var_42_8 = TOURNAMENT.GetClientCharacterIndex(iter_42_0 - 1, var_42_5.memberIndex + 1)
				local var_42_9

				if var_42_5.pet then
					var_42_9 = TOURNAMENT.GetPetIndexForCharacter(var_42_8)
				end

				Lobby.UpdateLocalClientCharacter(arg_42_0, var_42_8, var_42_5.bodyModel, var_42_5.headModel, var_42_0, var_42_4[iter_42_1], var_42_5.primaryWeaponModel, var_42_5.secondaryWeaponModell, nil, var_42_5.pet, var_42_9)

				var_42_0 = var_42_0 + 1
			else
				TOURNAMENT.SetCharacterVisible(iter_42_0 - 1, iter_42_1, false)
			end
		end

		local var_42_10 = #var_42_3 + 1

		while var_42_10 <= #var_42_4 do
			var_42_4[var_42_10]:RemoveFromParent()

			var_42_10 = var_42_10 + 1
			var_42_2 = true
		end
	end

	return var_42_2
end

function TOURNAMENT.RecordCurrentTournament(arg_43_0)
	if Tournament.BEAIBEGFFB() then
		local var_43_0 = PlayerData.BFFBGAJGD(arg_43_0, CoD.StatsGroup.NonGame)
		local var_43_1 = Engine.DEIDGHDBHD()

		var_43_0.currentTournament:set(var_43_1)
		ACTIONS.UploadStats(nil, arg_43_0)
	end
end

function TOURNAMENT.ClearCurrentTournament(arg_44_0)
	PlayerData.BFFBGAJGD(arg_44_0, CoD.StatsGroup.NonGame).currentTournament:set(0)
	ACTIONS.UploadStats(nil, arg_44_0)
end

function TOURNAMENT.DoEntranceCheck(arg_45_0, arg_45_1)
	local var_45_0 = true
	local var_45_1 = Dvar.CFHDGABACF("TMNTQMNQN")

	if var_45_1 > 0 then
		local var_45_2 = var_45_1 * 0.01
		local var_45_3 = var_45_2 * TOURNAMENT.quitHistoryDuration
		local var_45_4 = PlayerData.BFFBGAJGD(arg_45_0, CoD.StatsGroup.NonGame)
		local var_45_5 = var_45_4.currentTournament:get()
		local var_45_6 = var_45_4.bigTournamentBanStart:get()
		local var_45_7 = Engine.DEIDGHDBHD()
		local var_45_8 = 0
		local var_45_9 = 0

		if var_45_6 ~= 0 then
			local var_45_10 = var_45_7 - var_45_6
			local var_45_11 = var_45_2 * TOURNAMENT.quitPenalties[TOURNAMENT.quitHistoryCount]

			if var_45_10 < var_45_11 then
				local var_45_12 = {
					duration = 1000 * (var_45_11 - var_45_10)
				}

				LUI.FlowManager.RequestPopupMenu(nil, "TournamentBannedPopup", true, arg_45_0, false, var_45_12)

				var_45_0 = false
			else
				var_45_4.bigTournamentBanStart:set(0)
			end
		end

		if var_45_5 ~= 0 then
			local var_45_13 = 0
			local var_45_14 = var_45_7 - var_45_4.tournamentQuits[0]:get()

			for iter_45_0 = 1, TOURNAMENT.quitHistoryCount - 1 do
				local var_45_15 = var_45_4.tournamentQuits[iter_45_0]:get()
				local var_45_16 = var_45_7 - var_45_15

				if var_45_14 < var_45_16 then
					var_45_13 = iter_45_0

					local var_45_17 = var_45_15

					var_45_14 = var_45_16
				end
			end

			var_45_4.tournamentQuits[var_45_13]:set(var_45_7)
			var_45_4.currentTournament:set(0)
			ACTIONS.UploadStats(nil, arg_45_0)
		end

		for iter_45_1 = 0, TOURNAMENT.quitHistoryCount - 1 do
			local var_45_18 = var_45_4.tournamentQuits[iter_45_1]:get()

			if var_45_18 ~= 0 then
				local var_45_19 = var_45_7 - var_45_18

				if var_45_19 < var_45_3 then
					if var_45_19 < var_45_7 - var_45_8 then
						var_45_8 = var_45_18
					end

					var_45_9 = var_45_9 + 1
				else
					var_45_4.tournamentQuits[iter_45_1]:set(0)
				end
			end
		end

		if var_45_0 and var_45_9 > 0 then
			local var_45_20 = var_45_7 - var_45_8
			local var_45_21 = var_45_2 * TOURNAMENT.quitPenalties[var_45_9]

			if var_45_20 < var_45_21 then
				local var_45_22 = {
					duration = 1000 * (var_45_21 - var_45_20)
				}

				LUI.FlowManager.RequestPopupMenu(nil, "TournamentBannedPopup", true, arg_45_0, false, var_45_22)

				var_45_0 = false
			end

			if var_45_9 == TOURNAMENT.quitHistoryCount then
				var_45_4.bigTournamentBanStart:set(var_45_8)
				ACTIONS.UploadStats(nil, arg_45_0)
			end
		end
	end

	if Engine.JEDFGECDJ() > 1 then
		local var_45_23 = {
			controllerIndex = arg_45_0,
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("LUA_MENU_MP/SPLITSCREEN_SINGLE_UNSUPPORTED_MODE", Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT")),
			buttons = {
				{
					label = Engine.CBBHFCGDIC("MENU/OK"),
					action = function()
						LUI.FlowManager.RequestLeaveMenu()
					end
				}
			}
		}

		LUI.FlowManager.RequestPopupMenu(nil, "RestrictSplitScreenPopup", true, arg_45_0, false, var_45_23)

		var_45_0 = false
	elseif not Tournament.DBCBAIAJII() then
		LUI.FlowManager.RequestPopupMenu(nil, "TournamentTooManyPlayers", true, arg_45_0, false)

		var_45_0 = false
	end

	if not var_45_0 and arg_45_1 then
		Tournament.DCEADJJC()
	end

	return var_45_0
end

function TOURNAMENT.GetMyCurrentMatchInfo()
	local var_47_0 = TOURNAMENT.GetFullData()

	for iter_47_0 = 1, #var_47_0.rounds do
		local var_47_1 = var_47_0.rounds[iter_47_0]

		for iter_47_1 = 1, #var_47_1.matches do
			local var_47_2 = var_47_1.matches[iter_47_1]

			if var_47_2.isMyMatch and not var_47_2.complete then
				return var_47_2
			end
		end
	end
end

function TOURNAMENT.GetRewardRowIndex()
	local var_48_0 = TOURNAMENT.rewardChallenge
	local var_48_1 = Dvar.CFHDGABACF("sunset_tournament_interval") or TOURNAMENT.defaultSunsetInterval
	local var_48_2 = Engine.DEIDGHDBHD()
	local var_48_3
	local var_48_4 = Dvar.CFHDGABACF("MLRKKOMSNT")

	if var_48_2 < var_48_4 then
		var_48_3 = StringTable.BJJBBCJGEJ(CSV.tournamentChallenges.file, CSV.tournamentChallenges.cols.id, TOURNAMENT.rewardChallenge)
	else
		local var_48_5 = math.floor((var_48_2 - var_48_4) / var_48_1 % TOURNAMENT.numSunsetChallenges)

		var_48_3 = StringTable.BJJBBCJGEJ(CSV.tournamentChallenges.file, CSV.tournamentChallenges.cols.sunsetIndex, var_48_5)
	end

	return var_48_3
end

function TOURNAMENT.GetAllRewards(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0
	local var_49_1 = TOURNAMENT.GetRewardRowIndex()

	if arg_49_1 then
		var_49_0 = Loot.DGJJHEHII(arg_49_0)
	else
		local var_49_2 = StringTable.CBGJCDIHCE(CSV.tournamentChallenges.file, var_49_1, CSV.tournamentChallenges.cols.loot)

		var_49_0 = LUI.Split(var_49_2, "|")
	end

	local var_49_3 = StringTable.CBGJCDIHCE(CSV.tournamentChallenges.file, var_49_1, CSV.tournamentChallenges.cols.XPReward)
	local var_49_4 = LUI.Split(var_49_3, "|")
	local var_49_5 = {}
	local var_49_6 = math.max(#var_49_0, #var_49_4)

	for iter_49_0 = 1, var_49_6 do
		local var_49_7 = {}

		if var_49_4[iter_49_0] and tonumber(var_49_4[iter_49_0]) > 0 then
			local var_49_8 = {}

			var_49_8.type = "xp"
			var_49_8.name = Engine.CBBHFCGDIC("CHALLENGE/N_XP", var_49_4[iter_49_0])
			var_49_8.image = "icon_xp_token"
			var_49_8.amount = tonumber(var_49_4[iter_49_0])
			var_49_7.xp = var_49_8

			if arg_49_1 and arg_49_2 and iter_49_0 <= #var_49_4 - (arg_49_2 - 1) then
				table.insert(var_49_5, var_49_8)
			end
		end

		if var_49_0[iter_49_0] then
			local var_49_9 = tonumber(var_49_0[iter_49_0])

			if var_49_9 ~= LOOT.emptyID then
				local var_49_10 = LOOT.IsUnlockedWithID(arg_49_0, var_49_9)
				local var_49_11 = {
					lootID = var_49_9,
					unlocked = var_49_10
				}

				var_49_11.type = LOOT.GetTypeForID(var_49_11.lootID)
				var_49_11.ref = LOOT.GetItemRef(var_49_11.type, var_49_11.lootID)
				var_49_11.name = LOOT.GetItemName(var_49_11.type, var_49_11.ref, var_49_11.lootID)
				var_49_11.rarity = LOOT.GetItemQuality(var_49_11.type, var_49_11.ref, var_49_11.lootID)
				var_49_11.rarityImage = LOOT.GetRarityImage(var_49_11.rarity)
				var_49_11.rarityColor = LOOT.GetRarityColor(var_49_11.rarity)
				var_49_11.image = LOOT.GetItemImage(var_49_11.type, var_49_11.ref, var_49_11.lootID)
				var_49_7.loot = var_49_11

				if arg_49_1 then
					table.insert(var_49_5, var_49_11)
				end
			end
		end

		if (var_49_7.loot or var_49_7.xp) and not arg_49_1 then
			table.insert(var_49_5, var_49_7)
		end
	end

	return var_49_5
end

function TOURNAMENT.GetMyReward(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = TOURNAMENT.GetAllRewards(arg_50_0, arg_50_2)

	return arg_50_2 and var_50_0 or var_50_0[arg_50_1]
end

function TOURNAMENT.CanShowResults()
	local var_51_0 = Tournament.BEFJGJJBEI()

	return var_51_0 == MP.TournamentParticipationStatus.ELIMINATED or var_51_0 == MP.TournamentParticipationStatus.VICTORIOUS
end

function TOURNAMENT.CanReadyUp()
	local var_52_0 = Tournament.BEFJGJJBEI()
	local var_52_1 = TOURNAMENT.GetMyCurrentMatchInfo()

	if var_52_0 == MP.TournamentParticipationStatus.ACTIVE and var_52_1 then
		local var_52_2 = var_52_1.teams[1].teamID ~= -1 and var_52_1.teams[2].teamID ~= -1

		if not Tournament.DBEBAGHJCA() and not var_52_1.complete and var_52_2 then
			return true
		end
	end

	return false
end

function TOURNAMENT.GetMapPoolData()
	local var_53_0 = {}
	local var_53_1 = {
		Dvar.DHEEJCCJBH("MMPRPLKNLR"),
		Dvar.DHEEJCCJBH("SNLKKOSSK"),
		(Dvar.DHEEJCCJBH("MMRMQQLSRT"))
	}

	if Dvar.DHEEJCCJBH("LLSSNNLTQM") then
		var_53_1[4] = Dvar.DHEEJCCJBH("LLSSNNLTQM")
	end

	for iter_53_0 = 1, #var_53_1 do
		local var_53_2 = var_53_1[iter_53_0]
		local var_53_3 = split(var_53_2, ",")

		for iter_53_1 = 1, #var_53_3 do
			local var_53_4 = var_53_3[iter_53_1]
			local var_53_5 = false
			local var_53_6 = {
				ref = var_53_3[iter_53_1],
				name = MP.GetMapName(var_53_4),
				image = MP.GetMapImage(var_53_4)
			}

			if #var_53_0 == 0 then
				table.insert(var_53_0, var_53_6)
			end

			for iter_53_2 = 1, #var_53_0 do
				if var_53_6.ref == var_53_0[iter_53_2].ref then
					var_53_5 = true

					break
				else
					var_53_5 = false
				end
			end

			if not var_53_5 then
				table.insert(var_53_0, var_53_6)
			end
		end
	end

	return var_53_0
end
