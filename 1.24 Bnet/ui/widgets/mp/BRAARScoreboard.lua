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

	local var_1_4 = var_1_1

	if SCOREBOARD.IsAARScoreboard() then
		local var_1_5 = arg_1_0.storedAARScoreboardData and #arg_1_0.storedAARScoreboardData or 0

		var_1_4 = var_1_5 > 1 and var_1_5 or 1
	else
		var_1_4 = var_1_1 < var_1_0 and var_1_1 or var_1_0
	end

	if arg_1_0.PlayerGrid:GetNumRows() ~= var_1_4 then
		arg_1_0.PlayerGrid:SetNumChildren(var_1_4)
	end

	arg_1_0.PlayerGrid:RefreshContent()
end

local function var_0_6(arg_2_0, arg_2_1)
	arg_2_0.Pip:SetAlpha(0)
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

local function var_0_7(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_2 then
		ACTIONS.AnimateSequence(arg_3_0, "ModThreeStats")

		return
	end

	if CONDITIONS.AreTabletsFilteredOut() then
		ACTIONS.AnimateSequence(arg_3_0, "ModThreeStats")
	else
		ACTIONS.AnimateSequence(arg_3_0, "ModFourStats")
	end
end

local function var_0_8(arg_4_0, arg_4_1)
	var_0_7(arg_4_0, arg_4_1)

	if CONDITIONS.IsBloodMoney() then
		arg_4_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_4_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CASH"), 0)
		arg_4_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MISSION_PARTICIPATION"), 0)
		arg_4_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	elseif CONDITIONS.IsBRKingSlayer() then
		arg_4_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_4_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/KINGSLAYER_KILLS"), 0)
		arg_4_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/KINGSLAYER_DEATHS"), 0)
		arg_4_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	elseif CONDITIONS.IsRiskGametype() then
		arg_4_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_4_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RISK_TOKENS"), 0)
		arg_4_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RISK_CAPTURES"), 0)
		arg_4_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	end
end

local function var_0_9(arg_5_0, arg_5_1)
	arg_5_0.placement = -1
	arg_5_0.storedAARScoreboardData = {}

	local var_5_0 = PostMatch.DGCJIFGJBD(arg_5_1, var_0_4)

	if var_5_0 then
		DebugPrint("\n Entire Scoreboard DATA vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n")

		for iter_5_0, iter_5_1 in pairs(var_5_0) do
			SCOREBOARD.PrintDebugRowDataString(iter_5_1, {
				enableDebugOverride = true
			})
		end

		for iter_5_2, iter_5_3 in pairs(var_5_0) do
			if iter_5_3.isMe then
				arg_5_0.placement = iter_5_3.placement

				if arg_5_0.FrontendExtraInfo then
					arg_5_0.FrontendExtraInfo:SetupPlacement(arg_5_1, arg_5_0.placement)
				end

				DebugPrint("\n IsMe Row DATA vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n")
				SCOREBOARD.PrintDebugRowDataString(iter_5_3, {
					enableDebugOverride = true
				})

				local var_5_1 = iter_5_3.team

				for iter_5_4, iter_5_5 in pairs(var_5_0) do
					if iter_5_5.team == var_5_1 then
						table.insert(arg_5_0.storedAARScoreboardData, iter_5_5)
					end
				end

				table.sort(arg_5_0.storedAARScoreboardData, function(arg_6_0, arg_6_1)
					return arg_6_0.score > arg_6_1.score
				end)
				AAR.BrUpdatePlayerTeamContractNum(arg_5_1, arg_5_0.storedAARScoreboardData)
				DebugPrint("\n Stored Scoreboard DATA vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n")

				for iter_5_6, iter_5_7 in pairs(arg_5_0.storedAARScoreboardData) do
					SCOREBOARD.PrintDebugRowDataString(iter_5_7, {
						enableDebugOverride = true
					})
				end

				return
			end
		end
	end
end

local function var_0_10(arg_7_0, arg_7_1)
	local var_7_0 = DataSources.inGame.MP.brSquadEliminatedActive:GetValue(arg_7_1) == 1
	local var_7_1 = options and options.inPauseMenu

	if var_7_1 then
		-- block empty
	end

	if var_7_1 or var_7_0 then
		local var_7_2 = 500
		local var_7_3 = LUI.UITimer.new({
			event = "forceScoreboardRefresh",
			interval = var_7_2
		})

		var_7_3.id = "BRScoreboardRefreshForcedRefreshTimer"

		arg_7_0:addElement(var_7_3)
		arg_7_0:registerEventHandler("forceScoreboardRefresh", function(arg_8_0, arg_8_1)
			var_0_5(arg_8_0, arg_8_1.controller or arg_7_1 or Engine.IJEBHJIJF())
		end)
	end
end

function PostLoadFunc(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.UpdateScoreboardData = var_0_5
	arg_9_0.SetupScoreboardLayout = var_0_7
	arg_9_0.scoreboardData = {}

	arg_9_0.PlayerGrid:SetRefreshChild(function(arg_10_0, arg_10_1, arg_10_2)
		local var_10_0 = arg_9_0.PlayerGrid:GetContentIndex(arg_10_1, arg_10_2)

		arg_10_0.index = var_10_0

		local var_10_1
		local var_10_2

		if SCOREBOARD.IsAARScoreboard() then
			var_10_2 = arg_9_0.storedAARScoreboardData[var_10_0 + 1]
		else
			local var_10_3 = Game.DHEDEIHGF() or var_0_3

			var_10_2 = Game.DGCJIFGJBD(var_10_3, var_10_0, true)

			if CONDITIONS.IsDevelopmentBuild() and var_10_2 then
				local var_10_4 = "\n --- In game - playerName: " .. tostring(var_10_2.name) .. "\n ---  In game - team :" .. tostring(var_10_2.team) .. "\n ---  In game - clientNum :" .. tostring(var_10_2.clientNum) .. "\n ---  In game - rank :" .. tostring(var_10_2.rank) .. "\n ---  In game - extra score 0 :" .. tostring(var_10_2.extraScore0) .. "\n ---  In game - extra score 1 :" .. tostring(var_10_2.extraScore1) .. "\n ---  In game - extra score 2 :" .. tostring(var_10_2.extraScore2) .. "\n ---  In game - extra score 3 :" .. tostring(var_10_2.extraScore3) .. "\n ---  In game - extra score 4 :" .. tostring(var_10_2.extraScore4) .. "\n ---  In game - extra score 5 :" .. tostring(var_10_2.extraScore5) .. "\n ---  In game - kills :" .. tostring(var_10_2.kills) .. "\n ---  In game - score :" .. tostring(var_10_2.score) .. "\n ---  In game - damage :" .. tostring(var_10_2.damage)

				DebugPrint(var_10_4)
			end
		end

		if var_10_2 then
			DebugPrint("\n Mute action - mute state: " .. tostring(var_10_2.isMuted))

			if SCOREBOARD.IsAARScoreboard() then
				var_10_2.isCurrentPlayer = var_10_2.isMe
			else
				var_10_2.isCurrentPlayer = var_10_2.clientNum and var_10_2.clientNum == Game.DBACJGFHDD()
			end

			local var_10_5 = var_10_2.isCurrentPlayer or SCOREBOARD.IsAARScoreboard() or var_10_2.isBot

			arg_10_0.MicDisplay:SetIsScoreboardState(true)
			arg_10_0.MicDisplay:SetState(var_10_2.isMicOn, var_10_2.isMuted)
			arg_10_0.MicDisplay:SetForceHideState(var_10_5)

			if SCOREBOARD.IsAARScoreboard() then
				var_10_2.squadIndex = BitwiseOperators.band(BitwiseOperators.rshift(var_10_2.extraScore3, 14), 3) + 1
				var_10_2.damage = BitwiseOperators.band(var_10_2.extraScore3, 16383)
			else
				var_10_2.squadIndex = Game.DEFDIHBJEH(var_10_2.clientNum) or nil
				var_10_2.missions = BitwiseOperators.band(BitwiseOperators.rshift(var_10_2.extraScore2, 8), 15)
				var_10_2.damage = var_10_2.extraScore3
			end

			var_10_2.rankDisplay = PROGRESSION.GetRankDisplay(var_10_2.rank)
			var_10_2.isMasterPrestige = Rank.IsMasterPrestige(var_10_2.prestige)

			if var_10_2.isCurrentPlayer then
				ACTIONS.AnimateSequence(arg_10_0, "Player")
			else
				ACTIONS.AnimateSequence(arg_10_0, "NonPlayer")
			end

			local var_10_6 = SWATCHES.HUD.background

			if var_10_2.squadIndex and not SCOREBOARD.IsAARScoreboard() then
				local var_10_7

				var_10_7 = Game.BJGDCJHICE(var_10_2.squadIndex) or SWATCHES.HUD.background
			end

			arg_10_0.Rank:setText(var_10_2.rankDisplay or "")
			arg_10_0.Gamertag:setText(var_10_2.name or var_0_2)

			if not Dvar.IBEGCHEFE("LPSPMQSNPQ") and not Dvar.IBEGCHEFE("LSTLQTSSRM") then
				arg_10_0.Rank:SetAlpha(1)
			else
				arg_10_0.Rank:SetAlpha(0)
			end

			if CONDITIONS.IsBRKingSlayer() then
				arg_10_0.Score1:setText(var_10_2.kills or var_0_1)

				local var_10_8 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_10_8 = BitwiseOperators.band(var_10_2.extraScore4, 255)
				else
					var_10_8 = BitwiseOperators.band(var_10_2.extraScore0, 255)
				end

				arg_10_0.Score2:setText(var_10_8 or var_0_1)

				local var_10_9 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_10_9 = BitwiseOperators.band(BitwiseOperators.rshift(var_10_2.extraScore4, 8), 255)
				else
					var_10_9 = BitwiseOperators.band(BitwiseOperators.rshift(var_10_2.extraScore0, 8), 255)
				end

				arg_10_0.Score3:setText(var_10_9 or var_0_1)

				if SCOREBOARD.IsAARScoreboard() then
					arg_10_0.Score4:setText(var_10_2.extraScore5 or var_0_1)
				else
					arg_10_0.Score4:setText(var_10_2.extraScore1 or var_0_1)
				end
			elseif CONDITIONS.IsBloodMoney() or CONDITIONS.IsRiskGametype() then
				arg_10_0.Score1:setText(var_10_2.kills or var_0_1)

				local var_10_10 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_10_10 = BitwiseOperators.band(var_10_2.extraScore4, 4095)
				else
					var_10_10 = BitwiseOperators.band(var_10_2.extraScore0, 4095)
				end

				local var_10_11 = var_10_10

				if CONDITIONS.IsBloodMoney() then
					var_10_10 = var_10_10 * 1000
					var_10_11 = "$" .. var_10_10
				end

				arg_10_0.Score2:setText(var_10_11 or var_0_1)

				if arg_9_0.FrontendExtraInfo and not arg_10_0.hasCountedCash then
					arg_9_0.FrontendExtraInfo:SetTotalCash(var_10_10)

					arg_10_0.hasCountedCash = true
				end

				local var_10_12 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_10_12 = BitwiseOperators.band(BitwiseOperators.rshift(var_10_2.extraScore4, 12), 15)
				else
					var_10_12 = BitwiseOperators.band(BitwiseOperators.rshift(var_10_2.extraScore0, 12), 15)
				end

				if var_10_12 == 15 then
					var_10_12 = var_10_12 .. "+"
				end

				arg_10_0.Score3:setText(var_10_12 or var_0_1)

				if SCOREBOARD.IsAARScoreboard() then
					arg_10_0.Score4:setText(var_10_2.extraScore5 or var_0_1)
				else
					arg_10_0.Score4:setText(var_10_2.extraScore1 or var_0_1)
				end
			else
				arg_10_0.Score1:setText(var_10_2.score or var_0_1)
				arg_10_0.Score2:setText(var_10_2.kills or var_0_1)
				arg_10_0.Score3:setText(var_10_2.damage or var_0_1)

				if not tabletsFilteredOut then
					arg_10_0.Score4:setText(var_10_2.missions or var_0_1)
				end
			end

			if arg_10_0.Score5 then
				arg_10_0.Score5:setText(var_10_2.plunder or var_0_1)
			end

			if SCOREBOARD.IsAARScoreboard() then
				if var_10_2.playerCardBackground then
					local var_10_13 = CallingCardUtils.GetCardTexture(var_10_2.playerCardBackground)

					arg_10_0.Playercard:setImage(RegisterMaterial(var_10_13))
				end
			else
				local var_10_14 = CallingCardUtils.GetCardTexture(Game.BABEFDCDIG(var_10_2.clientNum))

				arg_10_0.Playercard:setImage(RegisterMaterial(var_10_14))
			end

			arg_10_0.rowData = var_10_2

			local function var_10_15(arg_11_0)
				local var_11_0 = arg_11_0.rowData.isBot
				local var_11_1 = arg_11_0.rowData.clientNum
				local var_11_2 = SCOREBOARD.IsAARScoreboard()
				local var_11_3
				local var_11_4

				if not var_11_2 then
					var_11_4 = Game.BBCDHAEBHD(var_11_1)
					var_11_3 = Game.GJIIJAFBI(var_11_1)
				else
					var_11_4 = arg_11_0.rowData.xuid
					var_11_3 = Friends.CAIJHBHGGC(var_11_4)
				end

				assert(var_11_3)
				assert(var_11_4)

				return {
					isContextualMenu = true,
					clientNum = var_11_1,
					gamertag = arg_11_0.rowData.name,
					xuid = var_11_3,
					xuidString = var_11_4,
					controllerIndex = arg_9_1,
					getButtonsCallback = function(arg_12_0)
						return (FRIENDS.GetScoreboardActions(arg_12_0))
					end,
					isAAR = var_11_2,
					isBot = arg_11_0.rowData.isBot,
					isCP = CONDITIONS.IsThirdGameMode()
				}
			end

			FRIENDS.SetupPlayerContextualMenuOptions(arg_10_0, arg_9_1, var_10_15)

			if not SCOREBOARD.IsAARScoreboard() and CONDITIONS.IsSpectating(arg_9_1) then
				local var_10_16 = DataSources.inGame.player.BRData.spectatedIsMuted:GetValue(arg_9_1)

				if var_10_2.clientNum == DataSources.inGame.currentPlayerStateClientNum:GetValue(arg_9_1) and var_10_2.isMuted ~= var_10_16 then
					DataSources.inGame.player.BRData.spectatedIsMuted:SetValue(arg_9_1, var_10_2.isMuted)
				end
			end
		else
			var_0_6(arg_10_0, arg_9_1)
		end
	end)
	var_0_8(arg_9_0, arg_9_1)

	if SCOREBOARD.IsAARScoreboard() then
		var_0_9(arg_9_0, arg_9_1)
	else
		var_0_10(arg_9_0, arg_9_1)
	end

	var_0_5(arg_9_0, arg_9_1)
end

function BRAARScoreboard(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_13_0.id = "BRAARScoreboard"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = {
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
		controllerIndex = var_13_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BRAARScoreboardRow", {
				controllerIndex = var_13_1
			})
		end,
		refreshChild = function(arg_15_0, arg_15_1, arg_15_2)
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
	local var_13_5 = LUI.UIGrid.new(var_13_4)

	var_13_5.id = "PlayerGrid"

	var_13_5:setUseStencil(false)
	var_13_5:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 700, _1080p * 350, _1080p * 598)
	var_13_0:addElement(var_13_5)

	var_13_0.PlayerGrid = var_13_5

	local var_13_6
	local var_13_7 = LUI.UIImage.new()

	var_13_7.id = "TitleBg"

	var_13_7:SetAlpha(0.08, 0)
	var_13_7:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 700, _1080p * 314, _1080p * 342)
	var_13_0:addElement(var_13_7)

	var_13_0.TitleBg = var_13_7

	local var_13_8
	local var_13_9 = LUI.UIImage.new()

	var_13_9.id = "TitleDivider"

	var_13_9:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_13_9:SetAlpha(0.45, 0)
	var_13_9:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 700, _1080p * 344, _1080p * 344)
	var_13_0:addElement(var_13_9)

	var_13_0.TitleDivider = var_13_9

	local var_13_10
	local var_13_11 = LUI.UIText.new()

	var_13_11.id = "TitleHashtag"

	var_13_11:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_13_11:setText(Engine.CBBHFCGDIC("MPUI/HASHTAG"), 0)
	var_13_11:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_11:SetAlignment(LUI.Alignment.Center)
	var_13_11:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -691, _1080p * -651, _1080p * 316, _1080p * 340)
	var_13_0:addElement(var_13_11)

	var_13_0.TitleHashtag = var_13_11

	local var_13_12
	local var_13_13 = LUI.UIText.new()

	var_13_13.id = "TitleName"

	var_13_13:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_13_13:setText(Engine.CBBHFCGDIC("MENU/NAME"), 0)
	var_13_13:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_13:SetAlignment(LUI.Alignment.Left)
	var_13_13:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_13:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -405, _1080p * 37, _1080p * 316, _1080p * 340)
	var_13_0:addElement(var_13_13)

	var_13_0.TitleName = var_13_13

	local var_13_14
	local var_13_15 = LUI.UIStyledText.new()

	var_13_15.id = "Title1"

	var_13_15:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_13_15:setText(Engine.CBBHFCGDIC("LUA_MENU/SCORE"), 0)
	var_13_15:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_15:SetWordWrap(false)
	var_13_15:SetAlignment(LUI.Alignment.Center)
	var_13_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_15:SetStartupDelay(2000)
	var_13_15:SetLineHoldTime(400)
	var_13_15:SetAnimMoveTime(3000)
	var_13_15:SetAnimMoveSpeed(50)
	var_13_15:SetEndDelay(2000)
	var_13_15:SetCrossfadeTime(250)
	var_13_15:SetFadeInTime(300)
	var_13_15:SetFadeOutTime(300)
	var_13_15:SetMaxVisibleLines(1)
	var_13_15:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 54, _1080p * 179, _1080p * 316, _1080p * 340)
	var_13_0:addElement(var_13_15)

	var_13_0.Title1 = var_13_15

	local var_13_16
	local var_13_17 = LUI.UIStyledText.new()

	var_13_17.id = "Title2"

	var_13_17:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_13_17:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
	var_13_17:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_17:SetWordWrap(false)
	var_13_17:SetAlignment(LUI.Alignment.Center)
	var_13_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_17:SetStartupDelay(2000)
	var_13_17:SetLineHoldTime(400)
	var_13_17:SetAnimMoveTime(3000)
	var_13_17:SetAnimMoveSpeed(50)
	var_13_17:SetEndDelay(2000)
	var_13_17:SetCrossfadeTime(250)
	var_13_17:SetFadeInTime(300)
	var_13_17:SetFadeOutTime(300)
	var_13_17:SetMaxVisibleLines(1)
	var_13_17:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 179, _1080p * 304, _1080p * 316, _1080p * 340)
	var_13_0:addElement(var_13_17)

	var_13_0.Title2 = var_13_17

	local var_13_18
	local var_13_19 = LUI.UIStyledText.new()

	var_13_19.id = "Title3"

	var_13_19:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_13_19:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DAMAGE"), 0)
	var_13_19:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_19:SetWordWrap(false)
	var_13_19:SetAlignment(LUI.Alignment.Center)
	var_13_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_19:SetStartupDelay(2000)
	var_13_19:SetLineHoldTime(400)
	var_13_19:SetAnimMoveTime(3000)
	var_13_19:SetAnimMoveSpeed(50)
	var_13_19:SetEndDelay(2000)
	var_13_19:SetCrossfadeTime(250)
	var_13_19:SetFadeInTime(300)
	var_13_19:SetFadeOutTime(300)
	var_13_19:SetMaxVisibleLines(1)
	var_13_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 304, _1080p * 429, _1080p * 316, _1080p * 340)
	var_13_0:addElement(var_13_19)

	var_13_0.Title3 = var_13_19

	local var_13_20
	local var_13_21 = LUI.UIStyledText.new()

	var_13_21.id = "Title4"

	var_13_21:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_13_21:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CONTRACTS"), 0)
	var_13_21:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_21:SetWordWrap(false)
	var_13_21:SetAlignment(LUI.Alignment.Center)
	var_13_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_21:SetStartupDelay(2000)
	var_13_21:SetLineHoldTime(400)
	var_13_21:SetAnimMoveTime(3000)
	var_13_21:SetAnimMoveSpeed(50)
	var_13_21:SetEndDelay(2000)
	var_13_21:SetCrossfadeTime(250)
	var_13_21:SetFadeInTime(300)
	var_13_21:SetFadeOutTime(300)
	var_13_21:SetMaxVisibleLines(1)
	var_13_21:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 429, _1080p * 554, _1080p * 316, _1080p * 340)
	var_13_0:addElement(var_13_21)

	var_13_0.Title4 = var_13_21

	local var_13_22
	local var_13_23 = LUI.UIStyledText.new()

	var_13_23.id = "TitleExtraStat"

	var_13_23:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_13_23:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CASH"), 0)
	var_13_23:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_23:SetWordWrap(false)
	var_13_23:SetAlignment(LUI.Alignment.Center)
	var_13_23:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_23:SetStartupDelay(2000)
	var_13_23:SetLineHoldTime(400)
	var_13_23:SetAnimMoveTime(3000)
	var_13_23:SetAnimMoveSpeed(50)
	var_13_23:SetEndDelay(2000)
	var_13_23:SetCrossfadeTime(250)
	var_13_23:SetFadeInTime(300)
	var_13_23:SetFadeOutTime(300)
	var_13_23:SetMaxVisibleLines(1)
	var_13_23:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 554, _1080p * 680, _1080p * 316, _1080p * 340)
	var_13_0:addElement(var_13_23)

	var_13_0.TitleExtraStat = var_13_23

	local var_13_24

	if CONDITIONS.InFrontend(var_13_0) then
		var_13_24 = MenuBuilder.BuildRegisteredType("BRTeamScoreboardExtraInfo", {
			controllerIndex = var_13_1
		})
		var_13_24.id = "FrontendExtraInfo"

		var_13_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 700, _1080p * 248, _1080p * 316)
		var_13_0:addElement(var_13_24)

		var_13_0.FrontendExtraInfo = var_13_24
	end

	local function var_13_25()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_25

	local var_13_26
	local var_13_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 429
		}
	}

	var_13_5:RegisterAnimationSequence("ModThreeStats", var_13_27)

	local var_13_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 429
		}
	}

	var_13_7:RegisterAnimationSequence("ModThreeStats", var_13_28)

	local var_13_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 429
		}
	}

	var_13_9:RegisterAnimationSequence("ModThreeStats", var_13_29)

	local var_13_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_19:RegisterAnimationSequence("ModThreeStats", var_13_30)

	local var_13_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_21:RegisterAnimationSequence("ModThreeStats", var_13_31)

	local var_13_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_23:RegisterAnimationSequence("ModThreeStats", var_13_32)

	if CONDITIONS.InFrontend(var_13_0) then
		local var_13_33 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 429
			}
		}

		var_13_24:RegisterAnimationSequence("ModThreeStats", var_13_33)
	end

	local function var_13_34()
		var_13_5:AnimateSequence("ModThreeStats")
		var_13_7:AnimateSequence("ModThreeStats")
		var_13_9:AnimateSequence("ModThreeStats")
		var_13_19:AnimateSequence("ModThreeStats")
		var_13_21:AnimateSequence("ModThreeStats")
		var_13_23:AnimateSequence("ModThreeStats")

		if CONDITIONS.InFrontend(var_13_0) then
			var_13_24:AnimateSequence("ModThreeStats")
		end
	end

	var_13_0._sequences.ModThreeStats = var_13_34

	local var_13_35
	local var_13_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 554
		}
	}

	var_13_5:RegisterAnimationSequence("ModFourStats", var_13_36)

	local var_13_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 554
		}
	}

	var_13_7:RegisterAnimationSequence("ModFourStats", var_13_37)

	local var_13_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 554
		}
	}

	var_13_9:RegisterAnimationSequence("ModFourStats", var_13_38)

	local var_13_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_21:RegisterAnimationSequence("ModFourStats", var_13_39)

	local var_13_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_23:RegisterAnimationSequence("ModFourStats", var_13_40)

	if CONDITIONS.InFrontend(var_13_0) then
		local var_13_41 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 554
			}
		}

		var_13_24:RegisterAnimationSequence("ModFourStats", var_13_41)
	end

	local function var_13_42()
		var_13_5:AnimateSequence("ModFourStats")
		var_13_7:AnimateSequence("ModFourStats")
		var_13_9:AnimateSequence("ModFourStats")
		var_13_21:AnimateSequence("ModFourStats")
		var_13_23:AnimateSequence("ModFourStats")

		if CONDITIONS.InFrontend(var_13_0) then
			var_13_24:AnimateSequence("ModFourStats")
		end
	end

	var_13_0._sequences.ModFourStats = var_13_42

	local var_13_43
	local var_13_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 304
		}
	}

	var_13_5:RegisterAnimationSequence("ModTwoStats", var_13_44)

	local var_13_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 304
		}
	}

	var_13_7:RegisterAnimationSequence("ModTwoStats", var_13_45)

	local var_13_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 304
		}
	}

	var_13_9:RegisterAnimationSequence("ModTwoStats", var_13_46)

	local var_13_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_19:RegisterAnimationSequence("ModTwoStats", var_13_47)

	local var_13_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_21:RegisterAnimationSequence("ModTwoStats", var_13_48)

	local var_13_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_23:RegisterAnimationSequence("ModTwoStats", var_13_49)

	if CONDITIONS.InFrontend(var_13_0) then
		local var_13_50 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 304
			}
		}

		var_13_24:RegisterAnimationSequence("ModTwoStats", var_13_50)
	end

	local function var_13_51()
		var_13_5:AnimateSequence("ModTwoStats")
		var_13_7:AnimateSequence("ModTwoStats")
		var_13_9:AnimateSequence("ModTwoStats")
		var_13_19:AnimateSequence("ModTwoStats")
		var_13_21:AnimateSequence("ModTwoStats")
		var_13_23:AnimateSequence("ModTwoStats")

		if CONDITIONS.InFrontend(var_13_0) then
			var_13_24:AnimateSequence("ModTwoStats")
		end
	end

	var_13_0._sequences.ModTwoStats = var_13_51

	PostLoadFunc(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("BRAARScoreboard", BRAARScoreboard)
LockTable(_M)
