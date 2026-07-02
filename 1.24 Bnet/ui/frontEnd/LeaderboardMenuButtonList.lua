module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 then
		arg_1_1:RemoveFromParent()
		arg_1_1:setPriority(arg_1_2)

		if arg_1_0:canAddElement(arg_1_1) then
			arg_1_0:addElement(arg_1_1)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if CONDITIONS.IsMagmaGameMode() then
		var_0_0(arg_2_0, arg_2_0.WarzoneHeader, -1)
		var_0_0(arg_2_0, arg_2_0.MagmaScore, -1)
		var_0_0(arg_2_0, arg_2_0.MagmaKills, -1)
		var_0_0(arg_2_0, arg_2_0.MagmaWins, -1)
		var_0_0(arg_2_0, arg_2_0.MagmaPlaylist, -1)
		var_0_0(arg_2_0, arg_2_0.MagmaBloodMoney, -1)
	elseif CONDITIONS.IsCoreMultiplayer() then
		var_0_0(arg_2_0, arg_2_0.CPHeader, 1)
		var_0_0(arg_2_0, arg_2_0.SurvivalSolo, 1)
		var_0_0(arg_2_0, arg_2_0.SurvivalDuos, 1)
		var_0_0(arg_2_0, arg_2_0.SurvivalTrios, 1)
		var_0_0(arg_2_0, arg_2_0.SurvivalQuads, 1)
	elseif CONDITIONS.IsThirdGameMode() then
		var_0_0(arg_2_0, arg_2_0.CPHeader, -1)
		var_0_0(arg_2_0, arg_2_0.SurvivalSolo, -1)
		var_0_0(arg_2_0, arg_2_0.SurvivalDuos, -1)
		var_0_0(arg_2_0, arg_2_0.SurvivalTrios, -1)
		var_0_0(arg_2_0, arg_2_0.SurvivalQuads, -1)
	end

	arg_2_0.Score:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
			filterType = "Friends",
			leaderboardType = Leaderboards.Boards.Score.Ref
		}, true)
	end)
	arg_2_0.Kills:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
			filterType = "Friends",
			leaderboardType = Leaderboards.Boards.Kills.Ref
		}, true)
	end)
	arg_2_0.Wins:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
			filterType = "Friends",
			leaderboardType = Leaderboards.Boards.Wins.Ref
		}, true)
	end)
	arg_2_0.Standard:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
			canSwitchLeaderboard = true,
			filterType = "Friends",
			leaderboardType = Leaderboards.Boards.TeamDeathmatch.Ref,
			boardsToUse = Leaderboards.BoardReferences.MP
		}, true)
	end)

	if Engine.CIEGIACHAE() then
		if arg_2_0.SurvivalSolo then
			arg_2_0.SurvivalSolo:addEventHandler("button_action", function(arg_7_0, arg_7_1)
				LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
					canSwitchLeaderboard = true,
					filterType = "Friends",
					leaderboardType = Leaderboards.Boards.SurvivalPicadillySolo.Ref,
					boardsToUse = Leaderboards.BoardReferences.CP.SurvivalSolo
				}, true)
			end)
		end

		if arg_2_0.SurvivalDuos then
			arg_2_0.SurvivalDuos:addEventHandler("button_action", function(arg_8_0, arg_8_1)
				LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
					canSwitchLeaderboard = true,
					filterType = "Friends",
					leaderboardType = Leaderboards.Boards.SurvivalPicadillyTwoPlayers.Ref,
					boardsToUse = Leaderboards.BoardReferences.CP.SurvivalDuos
				}, true)
			end)
		end

		if arg_2_0.SurvivalTrios then
			arg_2_0.SurvivalTrios:addEventHandler("button_action", function(arg_9_0, arg_9_1)
				LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
					canSwitchLeaderboard = true,
					filterType = "Friends",
					leaderboardType = Leaderboards.Boards.SurvivalPicadillyThreePlayers.Ref,
					boardsToUse = Leaderboards.BoardReferences.CP.SurvivalTrios
				}, true)
			end)
		end

		if arg_2_0.SurvivalQuads then
			arg_2_0.SurvivalQuads:addEventHandler("button_action", function(arg_10_0, arg_10_1)
				LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
					canSwitchLeaderboard = true,
					filterType = "Friends",
					leaderboardType = Leaderboards.Boards.SurvivalPicadillyFourPlayers.Ref,
					boardsToUse = Leaderboards.BoardReferences.CP.SurvivalQuads
				}, true)
			end)
		end
	end

	if arg_2_0.MagmaScore then
		arg_2_0.MagmaScore:addEventHandler("button_action", function(arg_11_0, arg_11_1)
			LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
				filterType = "Friends",
				leaderboardType = Leaderboards.Boards.MagmaScore.Ref
			}, true)
		end)
	end

	if arg_2_0.MagmaKills then
		arg_2_0.MagmaKills:addEventHandler("button_action", function(arg_12_0, arg_12_1)
			LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
				filterType = "Friends",
				leaderboardType = Leaderboards.Boards.MagmaKills.Ref
			}, true)
		end)
	end

	if arg_2_0.MagmaPlacement then
		arg_2_0.MagmaPlacement:addEventHandler("button_action", function(arg_13_0, arg_13_1)
			LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
				canSwitchLeaderboard = false,
				filterType = "Friends",
				leaderboardType = Leaderboards.Boards.MagmaPlacementTrios.Ref,
				boardsToUse = Leaderboards.BoardReferences.MAGMA.Placement
			}, true)
		end)
	end

	if arg_2_0.MagmaWins then
		arg_2_0.MagmaWins:addEventHandler("button_action", function(arg_14_0, arg_14_1)
			LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
				canSwitchLeaderboard = false,
				filterType = "Friends",
				leaderboardType = Leaderboards.Boards.MagmaWins.Ref,
				boardsToUse = Leaderboards.BoardReferences.MAGMA.Playlist
			}, true)
		end)
	end

	if arg_2_0.MagmaBloodMoney then
		arg_2_0.MagmaBloodMoney:addEventHandler("button_action", function(arg_15_0, arg_15_1)
			LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
				filterType = "Friends",
				leaderboardType = Leaderboards.Boards.MagmaBloodMoney.Ref
			}, true)
		end)
	end
end

function LeaderboardMenuButtonList(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIVerticalList.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 772 * _1080p)

	var_16_0.id = "LeaderboardMenuButtonList"

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0

	var_16_0:SetSpacing(10 * _1080p)

	local var_16_3
	local var_16_4 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_16_1
	})

	var_16_4.id = "MPHeader"

	var_16_4.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_MULTIPLAYER"), 0)
	var_16_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 40)
	var_16_0:addElement(var_16_4)

	var_16_0.MPHeader = var_16_4

	local var_16_5
	local var_16_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_16_1
	})

	var_16_6.id = "Score"

	var_16_6.Text:SetLeft(_1080p * 20, 0)
	var_16_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SCORE"), 0)
	var_16_6.Text:SetAlignment(LUI.Alignment.Left)
	var_16_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 50, _1080p * 88)
	var_16_0:addElement(var_16_6)

	var_16_0.Score = var_16_6

	local var_16_7
	local var_16_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_16_1
	})

	var_16_8.id = "Kills"

	var_16_8.Text:SetLeft(_1080p * 20, 0)
	var_16_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_KILLS"), 0)
	var_16_8.Text:SetAlignment(LUI.Alignment.Left)
	var_16_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 98, _1080p * 136)
	var_16_0:addElement(var_16_8)

	var_16_0.Kills = var_16_8

	local var_16_9
	local var_16_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_16_1
	})

	var_16_10.id = "Wins"

	var_16_10.Text:SetLeft(_1080p * 20, 0)
	var_16_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_WINS"), 0)
	var_16_10.Text:SetAlignment(LUI.Alignment.Left)
	var_16_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 146, _1080p * 184)
	var_16_0:addElement(var_16_10)

	var_16_0.Wins = var_16_10

	local var_16_11
	local var_16_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_16_1
	})

	var_16_12.id = "Standard"

	var_16_12.Text:SetLeft(_1080p * 20, 0)
	var_16_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAYLIST"), 0)
	var_16_12.Text:SetAlignment(LUI.Alignment.Left)
	var_16_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 194, _1080p * 232)
	var_16_0:addElement(var_16_12)

	var_16_0.Standard = var_16_12

	local var_16_13

	if Engine.CIEGIACHAE() and not CONDITIONS.IsMagmaGameMode(var_16_0) then
		local var_16_14 = MenuBuilder.BuildRegisteredType("GenericHeader", {
			controllerIndex = var_16_1
		})

		var_16_14.id = "CPHeader"

		var_16_14.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_COOP"), 0)
		var_16_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 242, _1080p * 282)
		var_16_0:addElement(var_16_14)

		var_16_0.CPHeader = var_16_14
	end

	local var_16_15

	if Engine.CIEGIACHAE() and not CONDITIONS.IsMagmaGameMode(var_16_0) then
		local var_16_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_16_1
		})

		var_16_16.id = "SurvivalSolo"

		if Engine.CIEGIACHAE() and not CONDITIONS.IsMagmaGameMode(var_16_0) then
			-- block empty
		end

		var_16_16.Text:SetLeft(_1080p * 20, 0)
		var_16_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SURVIVAL_SOLO"), 0)
		var_16_16.Text:SetAlignment(LUI.Alignment.Left)
		var_16_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 292, _1080p * 330)
		var_16_0:addElement(var_16_16)

		var_16_0.SurvivalSolo = var_16_16
	end

	local var_16_17

	if Engine.CIEGIACHAE() and not CONDITIONS.IsMagmaGameMode(var_16_0) then
		local var_16_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_16_1
		})

		var_16_18.id = "SurvivalDuos"

		if Engine.CIEGIACHAE() and not CONDITIONS.IsMagmaGameMode(var_16_0) then
			-- block empty
		end

		var_16_18.Text:SetLeft(_1080p * 20, 0)
		var_16_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SURVIVAL_DUOS"), 0)
		var_16_18.Text:SetAlignment(LUI.Alignment.Left)
		var_16_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 340, _1080p * 378)
		var_16_0:addElement(var_16_18)

		var_16_0.SurvivalDuos = var_16_18
	end

	local var_16_19

	if Engine.CIEGIACHAE() and not CONDITIONS.IsMagmaGameMode(var_16_0) then
		local var_16_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_16_1
		})

		var_16_20.id = "SurvivalTrios"

		if Engine.CIEGIACHAE() and not CONDITIONS.IsMagmaGameMode(var_16_0) then
			-- block empty
		end

		var_16_20.Text:SetLeft(_1080p * 20, 0)
		var_16_20.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SURVIVAL_TRIOS"), 0)
		var_16_20.Text:SetAlignment(LUI.Alignment.Left)
		var_16_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 388, _1080p * 426)
		var_16_0:addElement(var_16_20)

		var_16_0.SurvivalTrios = var_16_20
	end

	local var_16_21

	if Engine.CIEGIACHAE() and not CONDITIONS.IsMagmaGameMode(var_16_0) then
		local var_16_22 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_16_1
		})

		var_16_22.id = "SurvivalQuads"

		if Engine.CIEGIACHAE() and not CONDITIONS.IsMagmaGameMode(var_16_0) then
			-- block empty
		end

		var_16_22.Text:SetLeft(_1080p * 20, 0)
		var_16_22.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SURVIVAL_QUADS"), 0)
		var_16_22.Text:SetAlignment(LUI.Alignment.Left)
		var_16_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 436, _1080p * 474)
		var_16_0:addElement(var_16_22)

		var_16_0.SurvivalQuads = var_16_22
	end

	local var_16_23

	if CONDITIONS.IsMagmaEnabled(var_16_0) then
		local var_16_24 = MenuBuilder.BuildRegisteredType("GenericHeader", {
			controllerIndex = var_16_1
		})

		var_16_24.id = "WarzoneHeader"

		var_16_24.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_WARZONE"), 0)
		var_16_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 484, _1080p * 524)
		var_16_0:addElement(var_16_24)

		var_16_0.WarzoneHeader = var_16_24
	end

	local var_16_25

	if CONDITIONS.IsMagmaEnabled(var_16_0) then
		local var_16_26 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_16_1
		})

		var_16_26.id = "MagmaScore"

		if CONDITIONS.IsMagmaEnabled(var_16_0) then
			-- block empty
		end

		var_16_26.Text:SetLeft(_1080p * 20, 0)
		var_16_26.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SCORE"), 0)
		var_16_26.Text:SetAlignment(LUI.Alignment.Left)
		var_16_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 534, _1080p * 572)
		var_16_0:addElement(var_16_26)

		var_16_0.MagmaScore = var_16_26
	end

	local var_16_27

	if CONDITIONS.IsMagmaEnabled(var_16_0) then
		local var_16_28 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_16_1
		})

		var_16_28.id = "MagmaKills"

		if CONDITIONS.IsMagmaEnabled(var_16_0) then
			-- block empty
		end

		var_16_28.Text:SetLeft(_1080p * 20, 0)
		var_16_28.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_KILLS"), 0)
		var_16_28.Text:SetAlignment(LUI.Alignment.Left)
		var_16_28:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 582, _1080p * 620)
		var_16_0:addElement(var_16_28)

		var_16_0.MagmaKills = var_16_28
	end

	local var_16_29

	if CONDITIONS.IsMagmaEnabled(var_16_0) then
		local var_16_30 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_16_1
		})

		var_16_30.id = "MagmaWins"

		if CONDITIONS.IsMagmaEnabled(var_16_0) then
			-- block empty
		end

		var_16_30.Text:SetLeft(_1080p * 20, 0)
		var_16_30.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_WINS"), 0)
		var_16_30.Text:SetAlignment(LUI.Alignment.Left)
		var_16_30:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 630, _1080p * 668)
		var_16_0:addElement(var_16_30)

		var_16_0.MagmaWins = var_16_30
	end

	local var_16_31

	if CONDITIONS.AlwaysFalse(var_16_0) then
		local var_16_32 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_16_1
		})

		var_16_32.id = "MagmaPlaylist"

		if CONDITIONS.AlwaysFalse(var_16_0) then
			-- block empty
		end

		var_16_32.Text:SetLeft(_1080p * 20, 0)
		var_16_32.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAYLIST"), 0)
		var_16_32.Text:SetAlignment(LUI.Alignment.Left)
		var_16_32:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 678, _1080p * 716)
		var_16_0:addElement(var_16_32)

		var_16_0.MagmaPlaylist = var_16_32
	end

	local var_16_33

	if CONDITIONS.IsMagmaEnabled(var_16_0) then
		local var_16_34 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_16_1
		})

		var_16_34.id = "MagmaBloodMoney"

		if CONDITIONS.IsMagmaEnabled(var_16_0) then
			-- block empty
		end

		var_16_34.Text:SetLeft(_1080p * 20, 0)
		var_16_34.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PAYBACK"), 0)
		var_16_34.Text:SetAlignment(LUI.Alignment.Left)
		var_16_34:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 726, _1080p * 764)
		var_16_0:addElement(var_16_34)

		var_16_0.MagmaBloodMoney = var_16_34
	end

	var_0_1(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("LeaderboardMenuButtonList", LeaderboardMenuButtonList)
LockTable(_M)
