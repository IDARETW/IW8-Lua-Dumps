module(..., package.seeall)

local var_0_0 = "ui_shared_transparent"
local var_0_1 = "-1"
local var_0_2 = "Unknown"
local var_0_3 = Teams.allies
local var_0_4 = Teams.free

local function var_0_5(arg_1_0, arg_1_1)
	local var_1_0 = Dvar.CFHDGABACF("scr_br_teamsize")
	local var_1_1
	local var_1_2 = 1

	if SCOREBOARD.IsAARScoreboard() then
		var_1_1 = ((DataSources.frontEnd.AAR.scoreboard.myTeam:GetValue(arg_1_1) or var_0_4) == Teams.allies and DataSources.frontEnd.AAR.scoreboard.numPlayersTeamA or DataSources.frontEnd.AAR.scoreboard.numPlayersTeamB):GetValue(arg_1_1) or var_1_2
	else
		local var_1_3 = Game.DHEDEIHGF() or var_0_3

		var_1_1 = Game.DJABDGEIID(var_1_3) or var_1_2
	end

	var_1_1 = var_1_1 > 0 and var_1_1 or var_1_2

	if CONDITIONS.IsSquadAsTeamEnabled() and CONDITIONS.InGame() then
		local var_1_4 = DataSources.inGame.player.BRData.squadIndex:GetValue(arg_1_1)
		local var_1_5 = Game.CGEEGJIBJE(var_1_4)
		local var_1_6 = Dvar.CFHDGABACF("RRNTNNKNP")

		var_1_1 = var_1_5 < var_1_6 and var_1_5 or var_1_6
	end

	local var_1_7 = var_1_1

	if SCOREBOARD.IsAARScoreboard() then
		local var_1_8 = arg_1_0.storedAARScoreboardData and #arg_1_0.storedAARScoreboardData or 0

		var_1_7 = var_1_8 > 1 and var_1_8 or 1
	else
		var_1_7 = var_1_1 < var_1_0 and var_1_1 or var_1_0
	end

	if arg_1_0.PlayerGrid:GetNumRows() ~= var_1_7 then
		arg_1_0.PlayerGrid:SetNumChildren(var_1_7)
	end

	arg_1_0.PlayerGrid:RefreshContent()
end

local function var_0_6(arg_2_0, arg_2_1)
	arg_2_0.Pip:SetAlpha(0)
	arg_2_0.PlayercardTitle:SetAlpha(0)
	arg_2_0.PlayercardTitleBacking:SetAlpha(0)
	arg_2_0.PlayercardFrame:SetAlpha(0)
	arg_2_0.Playercard:SetAlpha(0)
	arg_2_0.Rank:setText("")
	arg_2_0.Gamertag:setText("")
	arg_2_0.Score1:setText("")
	arg_2_0.Score2:setText("")
	arg_2_0.Score3:setText("")
	arg_2_0.Score4:setText("")

	if arg_2_0.Score5 then
		arg_2_0.Score5:setText("")
	end
end

local function var_0_7(arg_3_0)
	arg_3_0.PlayerGrid:SetDefaultFocus({
		x = 0,
		y = 0
	})
	arg_3_0.PlayerGrid:SetPosition({
		x = 0,
		y = 0
	}, true)
end

local function var_0_8(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_2 and not CONDITIONS.IsWZPayload() and not CONDITIONS.IsBRMendotaGameType() then
		ACTIONS.AnimateSequence(arg_4_0, "ModThreeStats")
		var_0_7(arg_4_0)

		return
	end

	if CONDITIONS.AreTabletsFilteredOut() then
		ACTIONS.AnimateSequence(arg_4_0, "ModThreeStats")
	else
		ACTIONS.AnimateSequence(arg_4_0, "ModFourStats")
	end

	var_0_7(arg_4_0)
end

local function var_0_9(arg_5_0, arg_5_1)
	var_0_8(arg_5_0, arg_5_1)

	arg_5_0._isBloodMoneyDataAvailable = CONDITIONS.IsBloodMoney() or SCOREBOARD.IsAARScoreboard() and AAR.IsBloodMoneyAARDataReady(arg_5_1)
	arg_5_0._isBRKingSlayerDataAvailable = CONDITIONS.IsBRKingSlayer() or SCOREBOARD.IsAARScoreboard() and AAR.IsBRKingSlayerAARDataReady(arg_5_1)
	arg_5_0._isBRRebirthDataAvailable = CONDITIONS.IsRebirthGametype() or CONDITIONS.IsRebirthSoloGametype() or CONDITIONS.IsBRResurgenceTrialsGametype() or CONDITIONS.IsBRResurgenceTrialsSoloGametype() or SCOREBOARD.IsAARScoreboard() and AAR.IsBRRebirthAARDataReady(arg_5_1)

	if arg_5_0._isBRRebirthDataAvailable then
		arg_5_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/SCORE"), 0)
		arg_5_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_5_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU/REDEPLOYS"), 0)
	elseif arg_5_0._isBloodMoneyDataAvailable then
		arg_5_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_5_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CASH"), 0)
		arg_5_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MISSION_PARTICIPATION"), 0)
		arg_5_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	elseif arg_5_0._isBRKingSlayerDataAvailable then
		arg_5_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/KINGSLAYER_TOTAL"), 0)
		arg_5_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_5_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/KINGSLAYER_KILLS"), 0)
		arg_5_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DAMAGE"), 0)
	elseif CONDITIONS.IsRiskGametype() then
		arg_5_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_5_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RISK_TOKENS"), 0)
		arg_5_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RISK_CAPTURES"), 0)
		arg_5_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	elseif CONDITIONS.IsWZRatRace() then
		arg_5_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_5_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CASH"), 0)
		arg_5_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MISSION_PARTICIPATION"), 0)
		arg_5_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	elseif CONDITIONS.IsWZPayload() then
		arg_5_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/SCORE"), 0)
		arg_5_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_5_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DAMAGE"), 0)
		arg_5_0.Title4:setText(Engine.CBBHFCGDIC("BR_PAYLOAD/SCOREBOARD_TITLE_TIME_ON_OBJECTIVE"), 0)
	elseif CONDITIONS.IsBRMendotaGameType() then
		arg_5_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/SCORE"), 0)
		arg_5_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_5_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DAMAGE"), 0)
		arg_5_0.Title4:setText(Engine.CBBHFCGDIC("BR_MENDOTA/TITAN_DAMAGE"), 0)
	end
end

local function var_0_10(arg_6_0, arg_6_1)
	arg_6_0.placement = -1
	arg_6_0.storedAARScoreboardData = {}

	local var_6_0 = PostMatch.DGCJIFGJBD(arg_6_1, var_0_4)

	if var_6_0 then
		DebugPrint("\n Entire Scoreboard DATA vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n")

		for iter_6_0, iter_6_1 in pairs(var_6_0) do
			SCOREBOARD.PrintDebugRowDataString(iter_6_1, {
				enableDebugOverride = true
			})
		end

		for iter_6_2, iter_6_3 in pairs(var_6_0) do
			if iter_6_3.isMe then
				arg_6_0.placement = iter_6_3.placement

				if arg_6_0.FrontendExtraInfo then
					arg_6_0.FrontendExtraInfo:SetupPlacement(arg_6_1, arg_6_0.placement)
				end

				DebugPrint("\n IsMe Row DATA vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n")
				SCOREBOARD.PrintDebugRowDataString(iter_6_3, {
					enableDebugOverride = true
				})

				local var_6_1 = iter_6_3.team

				for iter_6_4, iter_6_5 in pairs(var_6_0) do
					if iter_6_5.team == var_6_1 then
						table.insert(arg_6_0.storedAARScoreboardData, iter_6_5)
					end
				end

				table.sort(arg_6_0.storedAARScoreboardData, function(arg_7_0, arg_7_1)
					return arg_7_0.score > arg_7_1.score
				end)
				AAR.BrUpdatePlayerTeamContractNum(arg_6_1, arg_6_0.storedAARScoreboardData)
				DebugPrint("\n Stored Scoreboard DATA vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n")

				for iter_6_6, iter_6_7 in pairs(arg_6_0.storedAARScoreboardData) do
					SCOREBOARD.PrintDebugRowDataString(iter_6_7, {
						enableDebugOverride = true
					})
				end

				return
			end
		end
	end
end

local function var_0_11(arg_8_0, arg_8_1)
	local var_8_0 = DataSources.inGame.MP.brSquadEliminatedActive:GetValue(arg_8_1) == 1
	local var_8_1 = options and options.inPauseMenu

	if var_8_1 then
		-- block empty
	end

	if var_8_1 or var_8_0 then
		local var_8_2 = 500
		local var_8_3 = LUI.UITimer.new({
			event = "forceScoreboardRefresh",
			interval = var_8_2
		})

		var_8_3.id = "BRScoreboardRefreshForcedRefreshTimer"

		arg_8_0:addElement(var_8_3)
		arg_8_0:registerEventHandler("forceScoreboardRefresh", function(arg_9_0, arg_9_1)
			var_0_5(arg_9_0, arg_9_1.controller or arg_8_1 or Engine.IJEBHJIJF())
		end)
	end
end

function PostLoadFunc(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.UpdateScoreboardData = var_0_5
	arg_10_0.SetupScoreboardLayout = var_0_8
	arg_10_0.scoreboardData = {}

	local var_10_0 = Dvar.CFHDGABACF("NLOQPLMLKR") == MP.WarzonePracticePopupStatus.FORCE_BR_MAIN_MENU_FROM_WZ_PRIVATE
	local var_10_1 = not Dvar.IBEGCHEFE("LPSPMQSNPQ") and not Dvar.IBEGCHEFE("LSTLQTSSRM")

	if not var_10_1 or SCOREBOARD.IsAARScoreboard() and var_10_0 then
		ACTIONS.AnimateSequence(arg_10_0, "NoRank")
	end

	arg_10_0.PlayerGrid:SetRefreshChild(function(arg_11_0, arg_11_1, arg_11_2)
		local var_11_0 = arg_10_0.PlayerGrid:GetContentIndex(arg_11_1, arg_11_2)

		arg_11_0.index = var_11_0

		local var_11_1
		local var_11_2

		if SCOREBOARD.IsAARScoreboard() then
			var_11_2 = arg_10_0.storedAARScoreboardData[var_11_0 + 1]

			if CONDITIONS.IsDevelopmentBuild() then
				if not var_11_2.name or var_11_2.name == "" then
					DebugPrint("Debug BR AAR scoreboard: Invalid name.  ClientNum: " .. tostring(var_11_2.clientNum) .. " xuid: " .. tostring(var_11_2.xuid))
				end

				if not var_11_2.rank or var_11_2.rank == "" then
					DebugPrint("Debug BR AAR scoreboard: Invalid rank.  ClientNum: " .. tostring(var_11_2.clientNum) .. " xuid: " .. tostring(var_11_2.xuid))
				end
			end
		else
			local var_11_3 = Game.DHEDEIHGF() or var_0_3
			local var_11_4 = CONDITIONS.IsSquadAsTeamEnabled()

			var_11_2 = Game.DGCJIFGJBD(var_11_3, var_11_0, true, var_11_4)

			if CONDITIONS.IsDevelopmentBuild() and var_11_2 then
				local var_11_5 = "\n --- In game - playerName: " .. tostring(var_11_2.fullNameWithHash or var_11_2.name) .. "\n ---  In game - team :" .. tostring(var_11_2.team) .. "\n ---  In game - clientNum :" .. tostring(var_11_2.clientNum) .. "\n ---  In game - rank :" .. tostring(var_11_2.rank) .. "\n ---  In game - extra score 0 :" .. tostring(var_11_2.extraScore0) .. "\n ---  In game - extra score 1 :" .. tostring(var_11_2.extraScore1) .. "\n ---  In game - extra score 2 :" .. tostring(var_11_2.extraScore2) .. "\n ---  In game - extra score 3 :" .. tostring(var_11_2.extraScore3) .. "\n ---  In game - extra score 4 :" .. tostring(var_11_2.extraScore4) .. "\n ---  In game - extra score 5 :" .. tostring(var_11_2.extraScore5) .. "\n ---  In game - kills :" .. tostring(var_11_2.kills) .. "\n ---  In game - score :" .. tostring(var_11_2.score) .. "\n ---  In game - damage :" .. tostring(var_11_2.damage)

				DebugPrint(var_11_5)
			end
		end

		if var_11_2 then
			DebugPrint("\n Mute action - mute state: " .. tostring(var_11_2.isMuted))

			if SCOREBOARD.IsAARScoreboard() then
				var_11_2.isCurrentPlayer = var_11_2.isMe
			else
				var_11_2.isCurrentPlayer = var_11_2.clientNum and var_11_2.clientNum == Game.DBACJGFHDD()
			end

			local var_11_6 = var_11_2.isCurrentPlayer or SCOREBOARD.IsAARScoreboard() or var_11_2.isBot

			arg_11_0.MicDisplay:SetIsScoreboardState(true)
			arg_11_0.MicDisplay:SetState(var_11_2.isMicOn, var_11_2.isMuted)
			arg_11_0.MicDisplay:SetForceHideState(var_11_6)

			if SCOREBOARD.IsAARScoreboard() then
				var_11_2.squadIndex = BitwiseOperators.band(BitwiseOperators.rshift(var_11_2.extraScore3, 14), 3) + 1
				var_11_2.damage = BitwiseOperators.band(var_11_2.extraScore3, 16383)
			else
				var_11_2.squadIndex = Game.DEFDIHBJEH(var_11_2.clientNum) or nil
				var_11_2.missions = BitwiseOperators.band(BitwiseOperators.rshift(var_11_2.extraScore2, 8), 15)
				var_11_2.damage = var_11_2.extraScore3
			end

			local var_11_7 = PROGRESSION.ValidatePrestigeLevel(var_11_2.prestige, {
				_isBackendPrestigeLevel = true
			})

			var_11_2.rankDisplay = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_11_2.rank,
				_prestigeLevel = var_11_7
			})._rankDisplay
			var_11_2.isMasterPrestige = Rank.IsMasterPrestige(var_11_2.prestige)

			if var_11_2.isCurrentPlayer then
				ACTIONS.AnimateSequence(arg_11_0, "Player")
			else
				ACTIONS.AnimateSequence(arg_11_0, "NonPlayer")
			end

			local var_11_8 = SWATCHES.HUD.background

			if var_11_2.squadIndex and not SCOREBOARD.IsAARScoreboard() then
				local var_11_9

				var_11_9 = Game.BJGDCJHICE(var_11_2.squadIndex) or SWATCHES.HUD.background
			end

			arg_11_0.Rank:setText(var_11_2.rankDisplay or "")

			if CONDITIONS.InGame() and CONDITIONS.IsDisplayNameTag() and Game.DDHAAEGIEI(arg_10_1) and var_11_2.fullNameWithHash and #var_11_2.fullNameWithHash > 0 then
				arg_11_0.Gamertag:setText(var_11_2.fullNameWithHash)
			else
				arg_11_0.Gamertag:setText(var_11_2.fullNameWithHash or var_0_2)
			end

			if not var_10_1 or SCOREBOARD.IsAARScoreboard() and var_10_0 then
				ACTIONS.AnimateSequence(arg_11_0, "NoRank")
			end

			if arg_10_0._isBRKingSlayerDataAvailable then
				local var_11_10 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_11_10 = BitwiseOperators.band(var_11_2.extraScore4, 255)
				else
					var_11_10 = BitwiseOperators.band(var_11_2.extraScore0, 255)
				end

				local var_11_11 = Dvar.CFHDGABACF("scr_kingslayer_pointsPerKing") or 5
				local var_11_12 = var_11_2.kills - var_11_10 + var_11_10 * var_11_11

				arg_11_0.Score1:setText(var_11_12 or var_0_1)
				arg_11_0.Score2:setText(var_11_2.kills or var_0_1)
				arg_11_0.Score3:setText(var_11_10 or var_0_1)
				arg_11_0.Score4:setText(var_11_2.damage or var_0_1)
			elseif arg_10_0._isBloodMoneyDataAvailable or CONDITIONS.IsRiskGametype() or CONDITIONS.IsWZRatRace() then
				arg_11_0.Score1:setText(var_11_2.kills or var_0_1)

				local var_11_13 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_11_13 = BitwiseOperators.band(var_11_2.extraScore4, 4095)
				else
					var_11_13 = BitwiseOperators.band(var_11_2.extraScore0, 4095)
				end

				local var_11_14 = var_11_13

				if arg_10_0._isBloodMoneyDataAvailable or CONDITIONS.IsWZRatRace() then
					var_11_13 = var_11_13 * 1000
					var_11_14 = "$" .. var_11_13
				end

				arg_11_0.Score2:setText(var_11_14 or var_0_1)

				if arg_10_0.FrontendExtraInfo and not arg_11_0.hasCountedCash then
					arg_10_0.FrontendExtraInfo:SetTotalCash(var_11_13)

					arg_11_0.hasCountedCash = true
				end

				local var_11_15 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_11_15 = BitwiseOperators.band(BitwiseOperators.rshift(var_11_2.extraScore4, 12), 15)
				else
					var_11_15 = BitwiseOperators.band(BitwiseOperators.rshift(var_11_2.extraScore0, 12), 15)
				end

				if var_11_15 == 15 then
					var_11_15 = var_11_15 .. "+"
				end

				arg_11_0.Score3:setText(var_11_15 or var_0_1)

				if SCOREBOARD.IsAARScoreboard() then
					arg_11_0.Score4:setText(var_11_2.extraScore5 or var_0_1)
				else
					arg_11_0.Score4:setText(var_11_2.extraScore1 or var_0_1)
				end
			elseif arg_10_0._isBRRebirthDataAvailable then
				local var_11_16 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_11_16 = BitwiseOperators.band(var_11_2.extraScore4, 255)
				else
					var_11_16 = BitwiseOperators.band(var_11_2.extraScore0, 255)
				end

				arg_11_0.Score1:setText(var_11_2.score or var_0_1)
				arg_11_0.Score2:setText(var_11_2.kills or var_0_1)
				arg_11_0.Score3:setText(var_11_2.damage or var_0_1)
				arg_11_0.Score4:setText(var_11_16 or var_0_1)
			elseif CONDITIONS.IsWZPayload() then
				arg_11_0.Score1:setText(var_11_2.score or var_0_1)
				arg_11_0.Score2:setText(var_11_2.kills or var_0_1)
				arg_11_0.Score3:setText(var_11_2.damage or var_0_1)
				arg_11_0.Score4:setText(var_11_2.extraScore0 or var_0_1)
			elseif CONDITIONS.IsBRMendotaGameType() then
				arg_11_0.Score1:setText(var_11_2.score or var_0_1)
				arg_11_0.Score2:setText(var_11_2.kills or var_0_1)
				arg_11_0.Score3:setText(var_11_2.damage or var_0_1)

				if var_11_2.extraScore0 then
					if var_11_2.extraScore0 > 0 then
						arg_11_0.Score4:setText(var_11_2.extraScore0 .. "0")
					else
						arg_11_0.Score4:setText(var_11_2.extraScore0)
					end
				else
					arg_11_0.Score4:setText(var_0_1)
				end
			else
				arg_11_0.Score1:setText(var_11_2.score or var_0_1)
				arg_11_0.Score2:setText(var_11_2.kills or var_0_1)
				arg_11_0.Score3:setText(var_11_2.damage or var_0_1)

				if not tabletsFilteredOut then
					arg_11_0.Score4:setText(var_11_2.missions or var_0_1)
				end
			end

			if arg_11_0.Score5 then
				arg_11_0.Score5:setText(var_11_2.plunder or var_0_1)
			end

			if SCOREBOARD.IsAARScoreboard() then
				if var_11_2.playerCardBackground then
					local var_11_17 = CallingCardUtils.GetCardTexture(var_11_2.playerCardBackground)

					arg_11_0.Playercard:setImage(RegisterMaterial(var_11_17))
				else
					arg_11_0.Playercard:SetAlpha(0)
				end

				if var_11_2.playerCardFrame then
					local var_11_18 = CallingCardFramesUtils.GetFrameTexture(var_11_2.playerCardFrame)

					if var_11_18 ~= nil and type(var_11_18) == "string" and var_11_18 ~= "" then
						arg_11_0.PlayercardFrame:setImage(RegisterMaterial(var_11_18))
						arg_11_0.PlayercardFrame:SetAlpha(1)
					else
						arg_11_0.PlayerCardFrame:SetAlpha(0)
					end
				else
					arg_11_0.PlayerCardFrame:SetAlpha(0)
				end

				if var_11_2.playerCardTitle then
					local var_11_19 = PlayerTitleUtils.GetTitleNameFromID(var_11_2.playerCardTitle)

					if var_11_19 == PlayerTitleUtils.GetTitleNameFromID(PlayerTitleUtils.DefaultTitleID) then
						arg_11_0.PlayercardTitle:SetAlpha(0)
						arg_11_0.PlayercardTitleBacking:SetAlpha(0)
					else
						arg_11_0.PlayercardTitle:SetAlpha(1)
						arg_11_0.PlayercardTitleBacking:SetAlpha(0.5)
						arg_11_0.PlayercardTitle:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(var_11_19)))
					end
				else
					arg_11_0.PlayercardTitle:SetAlpha(0)
					arg_11_0.PlayercardTitleBacking:SetAlpha(0)
				end
			else
				local var_11_20 = Game.BABEFDCDIG(var_11_2.clientNum)

				if var_11_20 ~= nil then
					local var_11_21 = CallingCardUtils.GetCardTexture(var_11_20)

					if var_11_21 ~= nil and type(var_11_21) == "string" and var_11_21 ~= "" then
						arg_11_0.Playercard:setImage(RegisterMaterial(var_11_21))
						arg_11_0.Playercard:SetAlpha(1)
					else
						arg_11_0.Playercard:SetAlpha(0)
					end
				else
					arg_11_0.Playercard:SetAlpha(0)
				end

				local var_11_22 = Game.JACHDAGB(var_11_2.clientNum)

				if var_11_22 ~= nil then
					local var_11_23 = CallingCardFramesUtils.GetFrameTexture(var_11_22)

					if var_11_23 ~= nil and type(var_11_23) == "string" and var_11_23 ~= "" then
						arg_11_0.PlayercardFrame:setImage(RegisterMaterial(var_11_23))
						arg_11_0.PlayercardFrame:SetAlpha(1)
					else
						arg_11_0.PlayercardFrame:SetAlpha(0)
					end
				else
					arg_11_0.PlayercardFrame:SetAlpha(0)
				end

				local var_11_24 = Game.JECHIHCAA(var_11_2.clientNum)

				if var_11_24 ~= nil then
					local var_11_25 = PlayerTitleUtils.GetTitleNameFromID(var_11_24)

					if var_11_25 == PlayerTitleUtils.GetTitleNameFromID(PlayerTitleUtils.DefaultTitleID) then
						arg_11_0.PlayercardTitle:SetAlpha(0)
						arg_11_0.PlayercardTitleBacking:SetAlpha(0)
					else
						arg_11_0.PlayercardTitle:SetAlpha(1)
						arg_11_0.PlayercardTitleBacking:SetAlpha(0.5)
						arg_11_0.PlayercardTitle:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(var_11_25)))
					end
				else
					arg_11_0.PlayercardTitle:SetAlpha(0)
					arg_11_0.PlayercardTitleBacking:SetAlpha(0)
				end
			end

			arg_11_0.rowData = var_11_2

			local function var_11_26(arg_12_0)
				local var_12_0 = arg_12_0.rowData.isBot
				local var_12_1 = arg_12_0.rowData.clientNum
				local var_12_2 = SCOREBOARD.IsAARScoreboard()
				local var_12_3
				local var_12_4

				if not var_12_2 then
					var_12_4 = Game.BBCDHAEBHD(var_12_1)
					var_12_3 = Game.GJIIJAFBI(var_12_1)
				else
					var_12_4 = arg_12_0.rowData.xuid
					var_12_3 = Friends.CAIJHBHGGC(var_12_4)
				end

				assert(var_12_3)
				assert(var_12_4)

				return {
					isContextualMenu = true,
					clientNum = var_12_1,
					gamertag = arg_12_0.rowData.fullNameWithHash or arg_12_0.rowData.name,
					xuid = var_12_3,
					xuidString = var_12_4,
					controllerIndex = arg_10_1,
					getButtonsCallback = function(arg_13_0)
						return (FRIENDS.GetScoreboardActions(arg_13_0))
					end,
					isAAR = var_12_2,
					isBot = arg_12_0.rowData.isBot,
					isCP = CONDITIONS.IsThirdGameMode()
				}
			end

			FRIENDS.SetupPlayerContextualMenuOptions(arg_11_0, arg_10_1, var_11_26)

			if not SCOREBOARD.IsAARScoreboard() and CONDITIONS.IsSpectating(arg_10_1) then
				local var_11_27 = DataSources.inGame.player.BRData.spectatedIsMuted:GetValue(arg_10_1)

				if var_11_2.clientNum == DataSources.inGame.currentPlayerStateClientNum:GetValue(arg_10_1) and var_11_2.isMuted ~= var_11_27 then
					DataSources.inGame.player.BRData.spectatedIsMuted:SetValue(arg_10_1, var_11_2.isMuted)
				end
			end
		else
			var_0_6(arg_11_0, arg_10_1)
		end
	end)
	var_0_9(arg_10_0, arg_10_1)

	if SCOREBOARD.IsAARScoreboard() then
		var_0_10(arg_10_0, arg_10_1)
	else
		var_0_11(arg_10_0, arg_10_1)
	end

	var_0_5(arg_10_0, arg_10_1)

	if CONDITIONS.IsLanguageAsian() then
		ACTIONS.AnimateSequence(arg_10_0, "IsAsianLanguage")
	end
end

function BRAARScoreboard(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_14_0.id = "BRAARScoreboard"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 4,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_14_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BRAARScoreboardRow", {
				controllerIndex = var_14_1
			})
		end,
		refreshChild = function(arg_16_0, arg_16_1, arg_16_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 1400,
		rowHeight = _1080p * 56,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_14_5 = LUI.UIGrid.new(var_14_4)

	var_14_5.id = "PlayerGrid"

	var_14_5:setUseStencil(true)
	var_14_5:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 700, _1080p * 350, _1080p * 598)
	var_14_0:addElement(var_14_5)

	var_14_0.PlayerGrid = var_14_5

	local var_14_6
	local var_14_7 = LUI.UIImage.new()

	var_14_7.id = "TitleBg"

	var_14_7:SetAlpha(0.08, 0)
	var_14_7:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 657, _1080p * 314, _1080p * 342)
	var_14_0:addElement(var_14_7)

	var_14_0.TitleBg = var_14_7

	local var_14_8
	local var_14_9 = LUI.UIImage.new()

	var_14_9.id = "TitleDivider"

	var_14_9:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_14_9:SetAlpha(0.45, 0)
	var_14_9:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 700, _1080p * 344, _1080p * 344)
	var_14_0:addElement(var_14_9)

	var_14_0.TitleDivider = var_14_9

	local var_14_10
	local var_14_11 = LUI.UIText.new()

	var_14_11.id = "TitleHashtag"

	var_14_11:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_11:setText(Engine.CBBHFCGDIC("MPUI/HASHTAG"), 0)
	var_14_11:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_14_11:SetAlignment(LUI.Alignment.Center)
	var_14_11:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -691, _1080p * -651, _1080p * 316, _1080p * 340)
	var_14_0:addElement(var_14_11)

	var_14_0.TitleHashtag = var_14_11

	local var_14_12
	local var_14_13 = LUI.UIText.new()

	var_14_13.id = "TitleName"

	var_14_13:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_13:setText(Engine.CBBHFCGDIC("MENU/NAME"), 0)
	var_14_13:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_14_13:SetAlignment(LUI.Alignment.Left)
	var_14_13:SetOptOutRightToLeftAlignmentFlip(true)
	var_14_13:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -405, _1080p * 37, _1080p * 316, _1080p * 340)
	var_14_0:addElement(var_14_13)

	var_14_0.TitleName = var_14_13

	local var_14_14
	local var_14_15 = LUI.UIStyledText.new()

	var_14_15.id = "Title1"

	var_14_15:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_15:setText(Engine.CBBHFCGDIC("LUA_MENU/SCORE"), 0)
	var_14_15:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_14_15:SetWordWrap(false)
	var_14_15:SetAlignment(LUI.Alignment.Center)
	var_14_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_15:SetStartupDelay(2000)
	var_14_15:SetLineHoldTime(400)
	var_14_15:SetAnimMoveTime(3000)
	var_14_15:SetAnimMoveSpeed(50)
	var_14_15:SetEndDelay(2000)
	var_14_15:SetCrossfadeTime(250)
	var_14_15:SetFadeInTime(300)
	var_14_15:SetFadeOutTime(300)
	var_14_15:SetMaxVisibleLines(1)
	var_14_15:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 54, _1080p * 146, _1080p * 316, _1080p * 340)
	var_14_0:addElement(var_14_15)

	var_14_0.Title1 = var_14_15

	local var_14_16
	local var_14_17 = LUI.UIStyledText.new()

	var_14_17.id = "Title2"

	var_14_17:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_17:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
	var_14_17:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_14_17:SetWordWrap(false)
	var_14_17:SetAlignment(LUI.Alignment.Center)
	var_14_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_17:SetStartupDelay(2000)
	var_14_17:SetLineHoldTime(400)
	var_14_17:SetAnimMoveTime(3000)
	var_14_17:SetAnimMoveSpeed(50)
	var_14_17:SetEndDelay(2000)
	var_14_17:SetCrossfadeTime(250)
	var_14_17:SetFadeInTime(300)
	var_14_17:SetFadeOutTime(300)
	var_14_17:SetMaxVisibleLines(1)
	var_14_17:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 179, _1080p * 271, _1080p * 316, _1080p * 340)
	var_14_0:addElement(var_14_17)

	var_14_0.Title2 = var_14_17

	local var_14_18
	local var_14_19 = LUI.UIStyledText.new()

	var_14_19.id = "Title3"

	var_14_19:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_19:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DAMAGE"), 0)
	var_14_19:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_14_19:SetWordWrap(false)
	var_14_19:SetAlignment(LUI.Alignment.Center)
	var_14_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_19:SetStartupDelay(2000)
	var_14_19:SetLineHoldTime(400)
	var_14_19:SetAnimMoveTime(3000)
	var_14_19:SetAnimMoveSpeed(50)
	var_14_19:SetEndDelay(2000)
	var_14_19:SetCrossfadeTime(250)
	var_14_19:SetFadeInTime(300)
	var_14_19:SetFadeOutTime(300)
	var_14_19:SetMaxVisibleLines(1)
	var_14_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 304, _1080p * 396, _1080p * 316, _1080p * 340)
	var_14_0:addElement(var_14_19)

	var_14_0.Title3 = var_14_19

	local var_14_20
	local var_14_21 = LUI.UIStyledText.new()

	var_14_21.id = "Title4"

	var_14_21:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_21:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CONTRACTS"), 0)
	var_14_21:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_14_21:SetWordWrap(false)
	var_14_21:SetAlignment(LUI.Alignment.Center)
	var_14_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_21:SetStartupDelay(2000)
	var_14_21:SetLineHoldTime(400)
	var_14_21:SetAnimMoveTime(3000)
	var_14_21:SetAnimMoveSpeed(50)
	var_14_21:SetEndDelay(2000)
	var_14_21:SetCrossfadeTime(250)
	var_14_21:SetFadeInTime(300)
	var_14_21:SetFadeOutTime(300)
	var_14_21:SetMaxVisibleLines(1)
	var_14_21:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 429, _1080p * 521, _1080p * 316, _1080p * 340)
	var_14_0:addElement(var_14_21)

	var_14_0.Title4 = var_14_21

	local var_14_22
	local var_14_23 = LUI.UIStyledText.new()

	var_14_23.id = "TitleExtraStat"

	var_14_23:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_23:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CASH"), 0)
	var_14_23:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_14_23:SetWordWrap(false)
	var_14_23:SetAlignment(LUI.Alignment.Center)
	var_14_23:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_23:SetStartupDelay(2000)
	var_14_23:SetLineHoldTime(400)
	var_14_23:SetAnimMoveTime(3000)
	var_14_23:SetAnimMoveSpeed(50)
	var_14_23:SetEndDelay(2000)
	var_14_23:SetCrossfadeTime(250)
	var_14_23:SetFadeInTime(300)
	var_14_23:SetFadeOutTime(300)
	var_14_23:SetMaxVisibleLines(1)
	var_14_23:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 554, _1080p * 647, _1080p * 316, _1080p * 340)
	var_14_0:addElement(var_14_23)

	var_14_0.TitleExtraStat = var_14_23

	local var_14_24

	if CONDITIONS.InFrontend() then
		var_14_24 = MenuBuilder.BuildRegisteredType("BRTeamScoreboardExtraInfo", {
			controllerIndex = var_14_1
		})
		var_14_24.id = "FrontendExtraInfo"

		var_14_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 657, _1080p * 248, _1080p * 316)
		var_14_0:addElement(var_14_24)

		var_14_0.FrontendExtraInfo = var_14_24
	end

	local function var_14_25()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_25

	local var_14_26
	local var_14_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 434
		}
	}

	var_14_5:RegisterAnimationSequence("ModThreeStats", var_14_27)

	local var_14_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 434
		}
	}

	var_14_7:RegisterAnimationSequence("ModThreeStats", var_14_28)

	local var_14_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 434
		}
	}

	var_14_9:RegisterAnimationSequence("ModThreeStats", var_14_29)

	local var_14_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_19:RegisterAnimationSequence("ModThreeStats", var_14_30)

	local var_14_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_21:RegisterAnimationSequence("ModThreeStats", var_14_31)

	local var_14_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_23:RegisterAnimationSequence("ModThreeStats", var_14_32)

	if CONDITIONS.InFrontend() then
		local var_14_33 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 434
			}
		}

		var_14_24:RegisterAnimationSequence("ModThreeStats", var_14_33)
	end

	local function var_14_34()
		var_14_5:AnimateSequence("ModThreeStats")
		var_14_7:AnimateSequence("ModThreeStats")
		var_14_9:AnimateSequence("ModThreeStats")
		var_14_19:AnimateSequence("ModThreeStats")
		var_14_21:AnimateSequence("ModThreeStats")
		var_14_23:AnimateSequence("ModThreeStats")

		if CONDITIONS.InFrontend() then
			var_14_24:AnimateSequence("ModThreeStats")
		end
	end

	var_14_0._sequences.ModThreeStats = var_14_34

	local var_14_35
	local var_14_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 559
		}
	}

	var_14_5:RegisterAnimationSequence("ModFourStats", var_14_36)

	local var_14_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 559
		}
	}

	var_14_7:RegisterAnimationSequence("ModFourStats", var_14_37)

	local var_14_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 559
		}
	}

	var_14_9:RegisterAnimationSequence("ModFourStats", var_14_38)

	local var_14_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_21:RegisterAnimationSequence("ModFourStats", var_14_39)

	local var_14_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_23:RegisterAnimationSequence("ModFourStats", var_14_40)

	if CONDITIONS.InFrontend() then
		local var_14_41 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 559
			}
		}

		var_14_24:RegisterAnimationSequence("ModFourStats", var_14_41)
	end

	local function var_14_42()
		var_14_5:AnimateSequence("ModFourStats")
		var_14_7:AnimateSequence("ModFourStats")
		var_14_9:AnimateSequence("ModFourStats")
		var_14_21:AnimateSequence("ModFourStats")
		var_14_23:AnimateSequence("ModFourStats")

		if CONDITIONS.InFrontend() then
			var_14_24:AnimateSequence("ModFourStats")
		end
	end

	var_14_0._sequences.ModFourStats = var_14_42

	local var_14_43
	local var_14_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 309
		}
	}

	var_14_5:RegisterAnimationSequence("ModTwoStats", var_14_44)

	local var_14_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 309
		}
	}

	var_14_7:RegisterAnimationSequence("ModTwoStats", var_14_45)

	local var_14_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 309
		}
	}

	var_14_9:RegisterAnimationSequence("ModTwoStats", var_14_46)

	local var_14_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_19:RegisterAnimationSequence("ModTwoStats", var_14_47)

	local var_14_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_21:RegisterAnimationSequence("ModTwoStats", var_14_48)

	local var_14_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_23:RegisterAnimationSequence("ModTwoStats", var_14_49)

	if CONDITIONS.InFrontend() then
		local var_14_50 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 309
			}
		}

		var_14_24:RegisterAnimationSequence("ModTwoStats", var_14_50)
	end

	local function var_14_51()
		var_14_5:AnimateSequence("ModTwoStats")
		var_14_7:AnimateSequence("ModTwoStats")
		var_14_9:AnimateSequence("ModTwoStats")
		var_14_19:AnimateSequence("ModTwoStats")
		var_14_21:AnimateSequence("ModTwoStats")
		var_14_23:AnimateSequence("ModTwoStats")

		if CONDITIONS.InFrontend() then
			var_14_24:AnimateSequence("ModTwoStats")
		end
	end

	var_14_0._sequences.ModTwoStats = var_14_51

	local var_14_52
	local var_14_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 338
		}
	}

	var_14_13:RegisterAnimationSequence("IsAsianLanguage", var_14_53)

	local var_14_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 338
		}
	}

	var_14_15:RegisterAnimationSequence("IsAsianLanguage", var_14_54)

	local var_14_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 338
		}
	}

	var_14_17:RegisterAnimationSequence("IsAsianLanguage", var_14_55)

	local var_14_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 338
		}
	}

	var_14_19:RegisterAnimationSequence("IsAsianLanguage", var_14_56)

	local var_14_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 338
		}
	}

	var_14_21:RegisterAnimationSequence("IsAsianLanguage", var_14_57)

	local var_14_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 338
		}
	}

	var_14_23:RegisterAnimationSequence("IsAsianLanguage", var_14_58)

	local function var_14_59()
		var_14_13:AnimateSequence("IsAsianLanguage")
		var_14_15:AnimateSequence("IsAsianLanguage")
		var_14_17:AnimateSequence("IsAsianLanguage")
		var_14_19:AnimateSequence("IsAsianLanguage")
		var_14_21:AnimateSequence("IsAsianLanguage")
		var_14_23:AnimateSequence("IsAsianLanguage")
	end

	var_14_0._sequences.IsAsianLanguage = var_14_59

	local var_14_60
	local var_14_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_11:RegisterAnimationSequence("NoRank", var_14_61)

	local var_14_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -449
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_14_13:RegisterAnimationSequence("NoRank", var_14_62)

	local function var_14_63()
		var_14_11:AnimateSequence("NoRank")
		var_14_13:AnimateSequence("NoRank")
	end

	var_14_0._sequences.NoRank = var_14_63

	PostLoadFunc(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("BRAARScoreboard", BRAARScoreboard)
LockTable(_M)
