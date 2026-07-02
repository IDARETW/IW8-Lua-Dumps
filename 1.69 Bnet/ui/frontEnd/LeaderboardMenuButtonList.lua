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
		var_0_0(arg_2_0, arg_2_0.MagmaMiniRoyale, -1)
		var_0_0(arg_2_0, arg_2_0.MagmaRebirth, -1)
		var_0_0(arg_2_0, arg_2_0.MagmaPayload, -1)
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

	if arg_2_0.MagmaMiniRoyale then
		arg_2_0.MagmaMiniRoyale:addEventHandler("button_action", function(arg_16_0, arg_16_1)
			LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
				filterType = "Friends",
				leaderboardType = Leaderboards.Boards.MagmaMiniRoyale.Ref
			}, true)
		end)
	end

	if arg_2_0.MagmaRebirth then
		arg_2_0.MagmaRebirth:addEventHandler("button_action", function(arg_17_0, arg_17_1)
			LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
				filterType = "Friends",
				leaderboardType = Leaderboards.Boards.MagmaRebirth.Ref
			}, true)
		end)
	end

	if arg_2_0.MagmaPayload then
		arg_2_0.MagmaPayload:addEventHandler("button_action", function(arg_18_0, arg_18_1)
			LUI.FlowManager.RequestAddMenu("LeaderboardMenu", true, arg_2_1, false, {
				filterType = "Friends",
				leaderboardType = Leaderboards.Boards.MagmaPayload.Ref
			}, true)
		end)
	end
end

function LeaderboardMenuButtonList(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIVerticalList.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 908 * _1080p)

	var_19_0.id = "LeaderboardMenuButtonList"

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0

	var_19_0:SetSpacing(10 * _1080p)

	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "MPHeader"

	var_19_4.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_MULTIPLAYER"), 0)
	var_19_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 40)
	var_19_0:addElement(var_19_4)

	var_19_0.MPHeader = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "Score"

	var_19_6.Text:SetLeft(_1080p * 20, 0)
	var_19_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SCORE"), 0)
	var_19_6.Text:SetAlignment(LUI.Alignment.Left)
	var_19_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 50, _1080p * 88)
	var_19_0:addElement(var_19_6)

	var_19_0.Score = var_19_6

	local var_19_7
	local var_19_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_19_1
	})

	var_19_8.id = "Kills"

	var_19_8.Text:SetLeft(_1080p * 20, 0)
	var_19_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_KILLS"), 0)
	var_19_8.Text:SetAlignment(LUI.Alignment.Left)
	var_19_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 98, _1080p * 136)
	var_19_0:addElement(var_19_8)

	var_19_0.Kills = var_19_8

	local var_19_9
	local var_19_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_19_1
	})

	var_19_10.id = "Wins"

	var_19_10.Text:SetLeft(_1080p * 20, 0)
	var_19_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_WINS"), 0)
	var_19_10.Text:SetAlignment(LUI.Alignment.Left)
	var_19_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 146, _1080p * 184)
	var_19_0:addElement(var_19_10)

	var_19_0.Wins = var_19_10

	local var_19_11
	local var_19_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_19_1
	})

	var_19_12.id = "Standard"

	var_19_12.Text:SetLeft(_1080p * 20, 0)
	var_19_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAYLIST"), 0)
	var_19_12.Text:SetAlignment(LUI.Alignment.Left)
	var_19_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 194, _1080p * 232)
	var_19_0:addElement(var_19_12)

	var_19_0.Standard = var_19_12

	local var_19_13

	if not CONDITIONS.IsMagmaGameMode(var_19_0) then
		local var_19_14 = MenuBuilder.BuildRegisteredType("GenericHeader", {
			controllerIndex = var_19_1
		})

		var_19_14.id = "CPHeader"

		var_19_14.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_COOP"), 0)
		var_19_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 242, _1080p * 282)
		var_19_0:addElement(var_19_14)

		var_19_0.CPHeader = var_19_14
	end

	local var_19_15

	if not CONDITIONS.IsMagmaGameMode(var_19_0) then
		local var_19_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_19_1
		})

		var_19_16.id = "SurvivalSolo"

		if not CONDITIONS.IsMagmaGameMode(var_19_0) then
			-- block empty
		end

		var_19_16.Text:SetLeft(_1080p * 20, 0)
		var_19_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SURVIVAL_SOLO"), 0)
		var_19_16.Text:SetAlignment(LUI.Alignment.Left)
		var_19_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 292, _1080p * 330)
		var_19_0:addElement(var_19_16)

		var_19_0.SurvivalSolo = var_19_16
	end

	local var_19_17

	if not CONDITIONS.IsMagmaGameMode(var_19_0) then
		local var_19_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_19_1
		})

		var_19_18.id = "SurvivalDuos"

		if not CONDITIONS.IsMagmaGameMode(var_19_0) then
			-- block empty
		end

		var_19_18.Text:SetLeft(_1080p * 20, 0)
		var_19_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SURVIVAL_DUOS"), 0)
		var_19_18.Text:SetAlignment(LUI.Alignment.Left)
		var_19_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 340, _1080p * 378)
		var_19_0:addElement(var_19_18)

		var_19_0.SurvivalDuos = var_19_18
	end

	local var_19_19

	if not CONDITIONS.IsMagmaGameMode(var_19_0) then
		local var_19_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_19_1
		})

		var_19_20.id = "SurvivalTrios"

		if not CONDITIONS.IsMagmaGameMode(var_19_0) then
			-- block empty
		end

		var_19_20.Text:SetLeft(_1080p * 20, 0)
		var_19_20.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SURVIVAL_TRIOS"), 0)
		var_19_20.Text:SetAlignment(LUI.Alignment.Left)
		var_19_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 388, _1080p * 426)
		var_19_0:addElement(var_19_20)

		var_19_0.SurvivalTrios = var_19_20
	end

	local var_19_21

	if not CONDITIONS.IsMagmaGameMode(var_19_0) then
		local var_19_22 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_19_1
		})

		var_19_22.id = "SurvivalQuads"

		if not CONDITIONS.IsMagmaGameMode(var_19_0) then
			-- block empty
		end

		var_19_22.Text:SetLeft(_1080p * 20, 0)
		var_19_22.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SURVIVAL_QUADS"), 0)
		var_19_22.Text:SetAlignment(LUI.Alignment.Left)
		var_19_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 436, _1080p * 474)
		var_19_0:addElement(var_19_22)

		var_19_0.SurvivalQuads = var_19_22
	end

	if not Engine.CHDGBEFDHB() then
		local var_19_23

		if CONDITIONS.IsMagmaEnabled(var_19_0) then
			local var_19_24 = MenuBuilder.BuildRegisteredType("GenericHeader", {
				controllerIndex = var_19_1
			})

			var_19_24.id = "WarzoneHeader"

			var_19_24.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_WARZONE"), 0)
			var_19_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 484, _1080p * 524)
			var_19_0:addElement(var_19_24)

			var_19_0.WarzoneHeader = var_19_24
		end

		local var_19_25

		if CONDITIONS.IsMagmaEnabled(var_19_0) then
			local var_19_26 = MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_19_1
			})

			var_19_26.id = "MagmaScore"

			if CONDITIONS.IsMagmaEnabled(var_19_0) then
				-- block empty
			end

			var_19_26.Text:SetLeft(_1080p * 20, 0)
			var_19_26.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_SCORE"), 0)
			var_19_26.Text:SetAlignment(LUI.Alignment.Left)
			var_19_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 534, _1080p * 572)
			var_19_0:addElement(var_19_26)

			var_19_0.MagmaScore = var_19_26
		end

		local var_19_27

		if CONDITIONS.IsMagmaEnabled(var_19_0) then
			local var_19_28 = MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_19_1
			})

			var_19_28.id = "MagmaKills"

			if CONDITIONS.IsMagmaEnabled(var_19_0) then
				-- block empty
			end

			var_19_28.Text:SetLeft(_1080p * 20, 0)
			var_19_28.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_KILLS"), 0)
			var_19_28.Text:SetAlignment(LUI.Alignment.Left)
			var_19_28:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 582, _1080p * 620)
			var_19_0:addElement(var_19_28)

			var_19_0.MagmaKills = var_19_28
		end

		local var_19_29

		if CONDITIONS.IsMagmaEnabled(var_19_0) then
			local var_19_30 = MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_19_1
			})

			var_19_30.id = "MagmaWins"

			if CONDITIONS.IsMagmaEnabled(var_19_0) then
				-- block empty
			end

			var_19_30.Text:SetLeft(_1080p * 20, 0)
			var_19_30.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_WINS"), 0)
			var_19_30.Text:SetAlignment(LUI.Alignment.Left)
			var_19_30:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 630, _1080p * 668)
			var_19_0:addElement(var_19_30)

			var_19_0.MagmaWins = var_19_30
		end

		local var_19_31

		if CONDITIONS.AlwaysFalse(var_19_0) then
			local var_19_32 = MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_19_1
			})

			var_19_32.id = "MagmaPlaylist"

			if CONDITIONS.AlwaysFalse(var_19_0) then
				-- block empty
			end

			var_19_32.Text:SetLeft(_1080p * 20, 0)
			var_19_32.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAYLIST"), 0)
			var_19_32.Text:SetAlignment(LUI.Alignment.Left)
			var_19_32:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 678, _1080p * 716)
			var_19_0:addElement(var_19_32)

			var_19_0.MagmaPlaylist = var_19_32
		end

		local var_19_33

		if CONDITIONS.IsMagmaEnabled(var_19_0) then
			local var_19_34 = MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_19_1
			})

			var_19_34.id = "MagmaBloodMoney"

			if CONDITIONS.IsMagmaEnabled(var_19_0) then
				-- block empty
			end

			var_19_34.Text:SetLeft(_1080p * 20, 0)
			var_19_34.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PAYBACK"), 0)
			var_19_34.Text:SetAlignment(LUI.Alignment.Left)
			var_19_34:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 726, _1080p * 764)
			var_19_0:addElement(var_19_34)

			var_19_0.MagmaBloodMoney = var_19_34
		end

		local var_19_35

		if CONDITIONS.IsMagmaEnabled(var_19_0) then
			local var_19_36 = MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_19_1
			})

			var_19_36.id = "MagmaMiniRoyale"

			if CONDITIONS.IsMagmaEnabled(var_19_0) then
				-- block empty
			end

			var_19_36.Text:SetLeft(_1080p * 20, 0)
			var_19_36.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BRMINI"), 0)
			var_19_36.Text:SetAlignment(LUI.Alignment.Left)
			var_19_36:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 774, _1080p * 812)
			var_19_0:addElement(var_19_36)

			var_19_0.MagmaMiniRoyale = var_19_36
		end

		local var_19_37

		if CONDITIONS.IsMagmaEnabled(var_19_0) then
			local var_19_38 = MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_19_1
			})

			var_19_38.id = "MagmaRebirth"

			if CONDITIONS.IsMagmaEnabled(var_19_0) then
				-- block empty
			end

			var_19_38.Text:SetLeft(_1080p * 20, 0)
			var_19_38.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/REBIRTH_NAME"), 0)
			var_19_38.Text:SetAlignment(LUI.Alignment.Left)
			var_19_38:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 822, _1080p * 860)
			var_19_0:addElement(var_19_38)

			var_19_0.MagmaRebirth = var_19_38
		end

		local var_19_39

		if CONDITIONS.IsMagmaEnabled(var_19_0) then
			local var_19_40 = MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_19_1
			})

			var_19_40.id = "MagmaPayload"

			if CONDITIONS.IsMagmaEnabled(var_19_0) then
				-- block empty
			end

			var_19_40.Text:SetLeft(_1080p * 20, 0)
			var_19_40.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/PAYLOAD"), 0)
			var_19_40.Text:SetAlignment(LUI.Alignment.Left)
			var_19_40:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 870, _1080p * 908)
			var_19_0:addElement(var_19_40)

			var_19_0.MagmaPayload = var_19_40
		end
	end

	var_0_1(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("LeaderboardMenuButtonList", LeaderboardMenuButtonList)
LockTable(_M)
