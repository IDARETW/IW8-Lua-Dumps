module(..., package.seeall)

local var_0_0 = "ui_shared_transparent"
local var_0_1 = "-1"
local var_0_2 = "Unknown"
local var_0_3 = Teams.allies
local var_0_4 = Teams.free

local function var_0_5(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 then
		ACTIONS.AnimateSequence(arg_1_0, "ModThreeStats")

		return
	end

	if CONDITIONS.AreTabletsFilteredOut() then
		ACTIONS.AnimateSequence(arg_1_0, "ModThreeStats")
	else
		ACTIONS.AnimateSequence(arg_1_0, "ModFourStats")
	end
end

local function var_0_6(arg_2_0, arg_2_1)
	var_0_5(arg_2_0, arg_2_1)

	arg_2_0._isBloodMoneyDataAvailable = CONDITIONS.IsBloodMoney() or SCOREBOARD.IsAARScoreboard() and AAR.IsBloodMoneyAARDataReady(arg_2_1)
	arg_2_0._isBRKingSlayerDataAvailable = CONDITIONS.IsBRKingSlayer() or SCOREBOARD.IsAARScoreboard() and AAR.IsBRKingSlayerAARDataReady(arg_2_1)
	arg_2_0._isBRRebirthDataAvailable = CONDITIONS.IsResurgenceRespawn() or SCOREBOARD.IsAARScoreboard() and AAR.IsBRRebirthAARDataReady(arg_2_1)

	if arg_2_0._isBRRebirthDataAvailable then
		arg_2_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/SCORE"), 0)
		arg_2_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_2_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU/REDEPLOYS"), 0)
	elseif arg_2_0._isBloodMoneyDataAvailable then
		arg_2_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_2_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CASH"), 0)
		arg_2_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MISSION_PARTICIPATION"), 0)
		arg_2_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	elseif arg_2_0._isBRKingSlayerDataAvailable then
		arg_2_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/KINGSLAYER_TOTAL"), 0)
		arg_2_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_2_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/KINGSLAYER_KILLS"), 0)
		arg_2_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	elseif CONDITIONS.IsRiskGametype() then
		arg_2_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_2_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RISK_TOKENS"), 0)
		arg_2_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RISK_CAPTURES"), 0)
		arg_2_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	elseif CONDITIONS.IsWZRatRace() then
		arg_2_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_2_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CASH"), 0)
		arg_2_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MISSION_PARTICIPATION"), 0)
		arg_2_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	end
end

local function var_0_7(arg_3_0, arg_3_1)
	local var_3_0 = Dvar.CFHDGABACF("scr_br_teamsize")
	local var_3_1
	local var_3_2 = 1

	if SCOREBOARD.IsAARScoreboard() then
		var_3_1 = ((DataSources.frontEnd.AAR.scoreboard.myTeam:GetValue(arg_3_1) or var_0_4) == Teams.allies and DataSources.frontEnd.AAR.scoreboard.numPlayersTeamA or DataSources.frontEnd.AAR.scoreboard.numPlayersTeamB):GetValue(arg_3_1) or var_3_2
	else
		local var_3_3 = Game.DHEDEIHGF() or var_0_3

		var_3_1 = Game.DJABDGEIID(var_3_3) or var_3_2
	end

	var_3_1 = var_3_1 > 0 and var_3_1 or var_3_2

	local var_3_4 = var_3_1

	if SCOREBOARD.IsAARScoreboard() then
		local var_3_5 = arg_3_0.storedAARScoreboardData and #arg_3_0.storedAARScoreboardData or 0

		var_3_4 = var_3_5 > 1 and var_3_5 or 1
	else
		var_3_4 = var_3_1 < var_3_0 and var_3_1 or var_3_0
	end

	if arg_3_0.PlayerGrid:GetNumRows() ~= var_3_4 then
		arg_3_0.PlayerGrid:SetNumChildren(var_3_4)
	end

	arg_3_0.PlayerGrid:RefreshContent()
end

local function var_0_8(arg_4_0, arg_4_1)
	arg_4_0.placement = -1
	arg_4_0.storedAARScoreboardData = {}

	local var_4_0 = PostMatch.DGCJIFGJBD(arg_4_1, var_0_4)

	if var_4_0 then
		for iter_4_0, iter_4_1 in pairs(var_4_0) do
			if iter_4_1.isMe then
				arg_4_0.placement = iter_4_1.placement

				if arg_4_0.FrontendExtraInfo then
					arg_4_0.FrontendExtraInfo:SetupPlacement(arg_4_1, arg_4_0.placement)
				end

				local var_4_1 = iter_4_1.team

				while iter_4_1 and iter_4_1.team == var_4_1 do
					iter_4_0 = iter_4_0 - 1
					iter_4_1 = var_4_0[iter_4_0]
				end

				iter_4_0 = iter_4_0 + 1
				iter_4_1 = var_4_0[iter_4_0]

				local var_4_2 = 0
				local var_4_3 = var_4_0[var_4_2]

				while var_4_3 do
					if var_4_3.team == var_4_1 then
						arg_4_0.storedAARScoreboardData[#arg_4_0.storedAARScoreboardData + 1] = var_4_3
					end

					var_4_2 = var_4_2 + 1
					var_4_3 = var_4_0[var_4_2]
				end

				return
			end
		end
	end
end

function PostLoadFunc(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.UpdateScoreboardData = var_0_7
	arg_5_0.SetupScoreboardLayout = var_0_5
	arg_5_0.scoreboardData = {}

	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.rowData.isBot
		local var_6_1 = arg_6_0.rowData.clientNum
		local var_6_2 = SCOREBOARD.IsAARScoreboard()
		local var_6_3
		local var_6_4

		if not var_6_2 then
			var_6_4 = Game.BBCDHAEBHD(var_6_1)
			var_6_3 = Game.GJIIJAFBI(var_6_1)
		else
			var_6_4 = arg_6_0.rowData.xuid
			var_6_3 = Friends.CAIJHBHGGC(var_6_4)
		end

		assert(var_6_3)
		assert(var_6_4)

		return {
			isContextualMenu = true,
			clientNum = var_6_1,
			gamertag = arg_6_0.rowData.fullNameWithHash or arg_6_0.rowData.name,
			xuid = var_6_3,
			xuidString = var_6_4,
			controllerIndex = arg_5_1,
			getButtonsCallback = function(arg_7_0)
				return (FRIENDS.GetScoreboardActions(arg_7_0))
			end,
			isAAR = var_6_2,
			isBot = arg_6_0.rowData.isBot,
			isCP = CONDITIONS.IsThirdGameMode()
		}
	end

	arg_5_0.PlayerGrid:SetRefreshChild(function(arg_8_0, arg_8_1, arg_8_2)
		local var_8_0 = arg_5_0.PlayerGrid:GetContentIndex(arg_8_1, arg_8_2)
		local var_8_1
		local var_8_2

		if SCOREBOARD.IsAARScoreboard() then
			var_8_2 = arg_5_0.storedAARScoreboardData[var_8_0 + 1]
		else
			local var_8_3 = Game.DHEDEIHGF() or var_0_3

			var_8_2 = Game.DGCJIFGJBD(var_8_3, var_8_0, true)

			if CONDITIONS.IsDevelopmentBuild() then
				SCOREBOARD.PrintDebugRowDataString(var_8_2)
			end
		end

		if var_8_2 then
			var_8_2.isCurrentPlayer = false

			if SCOREBOARD.IsAARScoreboard() then
				var_8_2.isCurrentPlayer = var_8_2.isMe
			else
				var_8_2.isCurrentPlayer = var_8_2.clientNum and var_8_2.clientNum == Game.DBACJGFHDD()
			end

			local var_8_4 = var_8_2.isCurrentPlayer or SCOREBOARD.IsAARScoreboard() or var_8_2.isBot

			arg_8_0.MicDisplay:SetIsScoreboardState(true)
			arg_8_0.MicDisplay:SetState(var_8_2.isMicOn, var_8_2.isMuted)
			arg_8_0.MicDisplay:SetForceHideState(var_8_4)

			if SCOREBOARD.IsAARScoreboard() then
				var_8_2.missions = BitwiseOperators.band(BitwiseOperators.rshift(var_8_2.extraScore4, 4), 15) + BitwiseOperators.band(BitwiseOperators.rshift(var_8_2.extraScore4, 12), 15) + BitwiseOperators.band(BitwiseOperators.rshift(var_8_2.extraScore1, 4), 15) + BitwiseOperators.band(BitwiseOperators.rshift(var_8_2.extraScore1, 12), 15)
				var_8_2.squadIndex = BitwiseOperators.band(BitwiseOperators.rshift(var_8_2.extraScore3, 14), 3) + 1
				var_8_2.damage = BitwiseOperators.band(var_8_2.extraScore3, 16383)
			else
				var_8_2.squadIndex = Game.DEFDIHBJEH(var_8_2.clientNum) or nil
				var_8_2.missions = BitwiseOperators.band(BitwiseOperators.rshift(var_8_2.extraScore2, 8), 15)
				var_8_2.damage = var_8_2.extraScore3
			end

			local var_8_5 = tonumber(var_8_2.rank) or 0
			local var_8_6 = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_8_5,
				_prestigeLevel = var_8_2.prestige
			})

			var_8_2.rankDisplay = var_8_6._rankDisplay
			var_8_2.rankIcon = var_8_6._rankIcon
			var_8_2.isMasterPrestige = Rank.IsMasterPrestige(var_8_2.prestige)

			arg_8_0:SetIsEvenIndex(var_8_0 % 2 == 0)

			if var_8_2.isCurrentPlayer then
				ACTIONS.AnimateSequence(arg_8_0, "ModIsLocalPlayer")
				ACTIONS.AnimateSequence(arg_8_0, "Player")
			else
				ACTIONS.AnimateSequence(arg_8_0, "ModIsNotLocalPlayer")
			end

			if var_8_2.isMasterPrestige then
				-- block empty
			end

			arg_8_0.PlayerNumberBg:SetAlpha(var_8_2.squadIndex and 1 or 0)

			local var_8_7 = SWATCHES.HUD.background

			if var_8_2.squadIndex and not SCOREBOARD.IsAARScoreboard() then
				var_8_7 = Game.BJGDCJHICE(var_8_2.squadIndex) or SWATCHES.HUD.background
			end

			arg_8_0.PlayerNumberBg:SetRGBFromTable(var_8_7)
			arg_8_0.RankText:setText(var_8_2.rankDisplay or "")
			arg_8_0.RankIcon:setImage(RegisterMaterial(var_8_2.rankIcon and var_8_2.rankIcon ~= "" and var_8_2.rankIcon or var_0_0))
			arg_8_0.PlayerIcon:setImage(RegisterMaterial(var_8_2.headIcon and var_8_2.headIcon ~= "" and var_8_2.headIcon or var_0_0))

			if CONDITIONS.InGame() and CONDITIONS.IsDisplayNameTag() and Game.DDHAAEGIEI(arg_5_1) and var_8_2.fullNameWithHash and #var_8_2.fullNameWithHash > 0 then
				arg_8_0.PlayerName:setText(var_8_2.fullNameWithHash)
			else
				arg_8_0.PlayerName:setText(var_8_2.fullNameWithHash or var_8_2.name or var_0_2)
			end

			if arg_5_0._isBRKingSlayerDataAvailable then
				local var_8_8 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_8_8 = BitwiseOperators.band(var_8_2.extraScore4, 255)
				else
					var_8_8 = BitwiseOperators.band(var_8_2.extraScore0, 255)
				end

				local var_8_9 = Dvar.CFHDGABACF("scr_kingslayer_pointsPerKing") or 5
				local var_8_10 = var_8_2.kills - var_8_8 + var_8_8 * var_8_9

				arg_8_0.Stat1:setText(var_8_10 or var_0_1)
				arg_8_0.Stat2:setText(var_8_2.kills or var_0_1)
				arg_8_0.Stat3:setText(var_8_8 or var_0_1)
				arg_8_0.Stat4:setText(var_8_2.damage or var_0_1)
			elseif arg_5_0._isBloodMoneyDataAvailable or CONDITIONS.IsRiskGametype() or CONDITIONS.IsWZRatRace() then
				arg_8_0.Stat1:setText(var_8_2.kills or var_0_1)

				local var_8_11 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_8_11 = BitwiseOperators.band(var_8_2.extraScore4, 4095)
				else
					var_8_11 = BitwiseOperators.band(var_8_2.extraScore0, 4095)
				end

				local var_8_12 = var_8_11

				if arg_5_0._isBloodMoneyDataAvailable or CONDITIONS.IsWZRatRace() then
					local var_8_13 = var_8_11 * 1000

					var_8_12 = "$" .. var_8_13
				end

				arg_8_0.Stat2:setText(var_8_12 or var_0_1)

				local var_8_14 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_8_14 = BitwiseOperators.band(BitwiseOperators.rshift(var_8_2.extraScore4, 12), 15)
				else
					var_8_14 = BitwiseOperators.band(BitwiseOperators.rshift(var_8_2.extraScore0, 12), 15)
				end

				if var_8_14 == 15 then
					var_8_14 = var_8_14 .. "+"
				end

				arg_8_0.Stat3:setText(var_8_14 or var_0_1)

				if SCOREBOARD.IsAARScoreboard() then
					arg_8_0.Stat4:setText(var_8_2.extraScore5 or var_0_1)
				else
					arg_8_0.Stat4:setText(var_8_2.extraScore1 or var_0_1)
				end
			elseif arg_5_0._isBRRebirthDataAvailable then
				local var_8_15 = 0

				if SCOREBOARD.IsAARScoreboard() then
					var_8_15 = BitwiseOperators.band(var_8_2.extraScore4, 255)
				else
					var_8_15 = BitwiseOperators.band(var_8_2.extraScore0, 255)
				end

				arg_8_0.Stat1:setText(var_8_2.score or var_0_1)
				arg_8_0.Stat2:setText(var_8_2.kills or var_0_1)
				arg_8_0.Stat3:setText(var_8_2.damage or var_0_1)
				arg_8_0.Stat4:setText(var_8_15 or var_0_1)
			else
				arg_8_0.Stat1:setText(var_8_2.score or var_0_1)
				arg_8_0.Stat2:setText(var_8_2.kills or var_0_1)
				arg_8_0.Stat3:setText(var_8_2.damage or var_0_1)

				if not tabletsFilteredOut then
					arg_8_0.Stat4:setText(var_8_2.missions or var_0_1)
				end
			end

			arg_8_0.Stat5:setText(var_8_2.redeploys or var_0_1)

			if arg_8_0.ExtraStatVal then
				arg_8_0.ExtraStatVal:setText(var_8_2.plunder or var_0_1)
			end

			if not Dvar.IBEGCHEFE("LPSPMQSNPQ") and not Dvar.IBEGCHEFE("LSTLQTSSRM") and rankIcon ~= nil then
				arg_8_0.RankText:SetAlpha(1)
				arg_8_0.RankIcon:SetAlpha(1)
			else
				arg_8_0.RankText:SetAlpha(0)
				arg_8_0.RankIcon:SetAlpha(0)
			end

			arg_8_0.rowData = var_8_2

			FRIENDS.SetupPlayerContextualMenuOptions(arg_8_0, arg_5_1, var_5_0)

			if not SCOREBOARD.IsAARScoreboard() and CONDITIONS.IsSpectating(arg_5_1) then
				local var_8_16 = DataSources.inGame.player.BRData.spectatedIsMuted:GetValue(arg_5_1)

				if var_8_2.clientNum == DataSources.inGame.currentPlayerStateClientNum:GetValue(arg_5_1) and var_8_2.isMuted ~= var_8_16 then
					DataSources.inGame.player.BRData.spectatedIsMuted:SetValue(arg_5_1, var_8_2.isMuted)
				end
			end
		else
			arg_8_0.PlayerNumberBg:SetAlpha(0)
			arg_8_0.RankText:setText("")
			arg_8_0.RankIcon:SetAlpha(0)
			arg_8_0.PlayerIcon:SetAlpha(0)
			arg_8_0.PlayerName:setText("")
			arg_8_0.Stat1:setText("")
			arg_8_0.Stat2:setText("")
			arg_8_0.Stat3:setText("")
			arg_8_0.Stat4:setText("")
			arg_8_0.Stat5:setText("")

			if arg_8_0.ExtraStatVal then
				arg_8_0.ExtraStatVal:setText("")
			end
		end
	end)
	var_0_6(arg_5_0, arg_5_1)

	if SCOREBOARD.IsAARScoreboard() then
		var_0_8(arg_5_0, arg_5_1)
	end

	var_0_7(arg_5_0, arg_5_1)

	if not Engine.DDJFBBJAIG() then
		local var_5_1 = DataSources.inGame.MP.brSquadEliminatedActive:GetValue(arg_5_1) == 1
		local var_5_2 = arg_5_2 and arg_5_2.inPauseMenu

		if var_5_2 then
			ACTIONS.AnimateSequence(arg_5_0, "InitTabLayout")
		end

		if var_5_2 or var_5_1 then
			local var_5_3 = 500
			local var_5_4 = LUI.UITimer.new({
				event = "forceScoreboardRefresh",
				interval = var_5_3
			})

			var_5_4.id = "BRScoreboardRefreshForcedRefreshTimer"

			arg_5_0:addElement(var_5_4)
			arg_5_0:registerEventHandler("forceScoreboardRefresh", function(arg_9_0, arg_9_1)
				var_0_7(arg_9_0, arg_9_1.controller or arg_5_1 or Engine.IJEBHJIJF())
			end)
		end
	end
end

function BrTeamScoreboard(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 830 * _1080p)

	var_10_0.id = "BrTeamScoreboard"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 4,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_10_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BRTeamScoreboardRow", {
				controllerIndex = var_10_1
			})
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 3,
		spacingY = _1080p * 3,
		columnWidth = _1080p * 1100,
		rowHeight = _1080p * 46,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_10_5 = LUI.UIGrid.new(var_10_4)

	var_10_5.id = "PlayerGrid"

	var_10_5:setUseStencil(false)
	var_10_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -599, _1080p * 626, _1080p * -166, _1080p * 28)
	var_10_0:addElement(var_10_5)

	var_10_0.PlayerGrid = var_10_5

	local var_10_6
	local var_10_7 = LUI.UIImage.new()

	var_10_7.id = "TitleBg"

	var_10_7:SetAlpha(0.08, 0)
	var_10_7:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -599, _1080p * 626, _1080p * -199, _1080p * -171)
	var_10_0:addElement(var_10_7)

	var_10_0.TitleBg = var_10_7

	local var_10_8
	local var_10_9 = LUI.UIImage.new()

	var_10_9.id = "TitleDivider"

	var_10_9:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_10_9:SetAlpha(0.45, 0)
	var_10_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -599, _1080p * 626, _1080p * -169, _1080p * -168)
	var_10_0:addElement(var_10_9)

	var_10_0.TitleDivider = var_10_9

	local var_10_10
	local var_10_11 = LUI.UIText.new()

	var_10_11.id = "TitleName"

	var_10_11:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_11:setText(Engine.CBBHFCGDIC("MENU/NAME"), 0)
	var_10_11:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_11:SetAlignment(LUI.Alignment.Left)
	var_10_11:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -459, _1080p * -128, _1080p * -197, _1080p * -173)
	var_10_0:addElement(var_10_11)

	var_10_0.TitleName = var_10_11

	local var_10_12
	local var_10_13 = LUI.UIStyledText.new()

	var_10_13.id = "Title2"

	var_10_13:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_13:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
	var_10_13:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_13:SetWordWrap(false)
	var_10_13:SetAlignment(LUI.Alignment.Center)
	var_10_13:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_13:SetStartupDelay(2000)
	var_10_13:SetLineHoldTime(400)
	var_10_13:SetAnimMoveTime(3000)
	var_10_13:SetAnimMoveSpeed(50)
	var_10_13:SetEndDelay(2000)
	var_10_13:SetCrossfadeTime(250)
	var_10_13:SetFadeInTime(300)
	var_10_13:SetFadeOutTime(300)
	var_10_13:SetMaxVisibleLines(1)
	var_10_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, 0, _1080p * 125, _1080p * -197, _1080p * -173)
	var_10_0:addElement(var_10_13)

	var_10_0.Title2 = var_10_13

	local var_10_14
	local var_10_15 = LUI.UIStyledText.new()

	var_10_15.id = "Title1"

	var_10_15:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_15:setText(Engine.CBBHFCGDIC("LUA_MENU/SCORE"), 0)
	var_10_15:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_15:SetWordWrap(false)
	var_10_15:SetAlignment(LUI.Alignment.Center)
	var_10_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_15:SetStartupDelay(2000)
	var_10_15:SetLineHoldTime(400)
	var_10_15:SetAnimMoveTime(3000)
	var_10_15:SetAnimMoveSpeed(50)
	var_10_15:SetEndDelay(2000)
	var_10_15:SetCrossfadeTime(250)
	var_10_15:SetFadeInTime(300)
	var_10_15:SetFadeOutTime(300)
	var_10_15:SetMaxVisibleLines(1)
	var_10_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -125, 0, _1080p * -197, _1080p * -173)
	var_10_0:addElement(var_10_15)

	var_10_0.Title1 = var_10_15

	local var_10_16
	local var_10_17 = LUI.UIStyledText.new()

	var_10_17.id = "Title3"

	var_10_17:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_17:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DAMAGE"), 0)
	var_10_17:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_17:SetWordWrap(false)
	var_10_17:SetAlignment(LUI.Alignment.Center)
	var_10_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_17:SetStartupDelay(2000)
	var_10_17:SetLineHoldTime(400)
	var_10_17:SetAnimMoveTime(3000)
	var_10_17:SetAnimMoveSpeed(50)
	var_10_17:SetEndDelay(2000)
	var_10_17:SetCrossfadeTime(250)
	var_10_17:SetFadeInTime(300)
	var_10_17:SetFadeOutTime(300)
	var_10_17:SetMaxVisibleLines(1)
	var_10_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 125, _1080p * 250, _1080p * -197, _1080p * -173)
	var_10_0:addElement(var_10_17)

	var_10_0.Title3 = var_10_17

	local var_10_18
	local var_10_19 = LUI.UIStyledText.new()

	var_10_19.id = "Title4"

	var_10_19:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_19:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CONTRACTS"), 0)
	var_10_19:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_19:SetWordWrap(false)
	var_10_19:SetAlignment(LUI.Alignment.Center)
	var_10_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_19:SetStartupDelay(2000)
	var_10_19:SetLineHoldTime(400)
	var_10_19:SetAnimMoveTime(3000)
	var_10_19:SetAnimMoveSpeed(50)
	var_10_19:SetEndDelay(2000)
	var_10_19:SetCrossfadeTime(250)
	var_10_19:SetFadeInTime(300)
	var_10_19:SetFadeOutTime(300)
	var_10_19:SetMaxVisibleLines(1)
	var_10_19:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 250, _1080p * 375, _1080p * -197, _1080p * -173)
	var_10_0:addElement(var_10_19)

	var_10_0.Title4 = var_10_19

	local var_10_20
	local var_10_21 = LUI.UIStyledText.new()

	var_10_21.id = "Title5"

	var_10_21:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_21:setText(Engine.CBBHFCGDIC("LUA_MENU/REDEPLOYS"), 0)
	var_10_21:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_21:SetWordWrap(false)
	var_10_21:SetAlignment(LUI.Alignment.Center)
	var_10_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_21:SetStartupDelay(2000)
	var_10_21:SetLineHoldTime(400)
	var_10_21:SetAnimMoveTime(3000)
	var_10_21:SetAnimMoveSpeed(50)
	var_10_21:SetEndDelay(2000)
	var_10_21:SetCrossfadeTime(250)
	var_10_21:SetFadeInTime(300)
	var_10_21:SetFadeOutTime(300)
	var_10_21:SetMaxVisibleLines(1)
	var_10_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 375, _1080p * 500, _1080p * -197, _1080p * -173)
	var_10_0:addElement(var_10_21)

	var_10_0.Title5 = var_10_21

	local var_10_22

	if CONDITIONS.InFrontend() then
		var_10_22 = MenuBuilder.BuildRegisteredType("BRTeamScoreboardExtraInfo", {
			controllerIndex = var_10_1
		})
		var_10_22.id = "FrontendExtraInfo"

		var_10_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 361, _1080p * 1586, _1080p * -274, _1080p * -207)
		var_10_0:addElement(var_10_22)

		var_10_0.FrontendExtraInfo = var_10_22
	end

	local var_10_23
	local var_10_24 = LUI.UIStyledText.new()

	var_10_24.id = "TitleExtraStat"

	var_10_24:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_24:setText(Engine.CBBHFCGDIC("MP/BR_PLUNDER_CASH"), 0)
	var_10_24:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_24:SetWordWrap(false)
	var_10_24:SetAlignment(LUI.Alignment.Center)
	var_10_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_24:SetStartupDelay(2000)
	var_10_24:SetLineHoldTime(400)
	var_10_24:SetAnimMoveTime(3000)
	var_10_24:SetAnimMoveSpeed(50)
	var_10_24:SetEndDelay(2000)
	var_10_24:SetCrossfadeTime(250)
	var_10_24:SetFadeInTime(300)
	var_10_24:SetFadeOutTime(300)
	var_10_24:SetMaxVisibleLines(1)
	var_10_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 501, _1080p * 626, _1080p * -197, _1080p * -173)
	var_10_0:addElement(var_10_24)

	var_10_0.TitleExtraStat = var_10_24

	local function var_10_25()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_25

	local var_10_26
	local var_10_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -550
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 675
		}
	}

	var_10_5:RegisterAnimationSequence("ModFiveStats", var_10_27)

	local var_10_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 550
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -550
		}
	}

	var_10_7:RegisterAnimationSequence("ModFiveStats", var_10_28)

	local var_10_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 550
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -550
		}
	}

	var_10_9:RegisterAnimationSequence("ModFiveStats", var_10_29)

	local var_10_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -411
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -80
		}
	}

	var_10_11:RegisterAnimationSequence("ModFiveStats", var_10_30)

	local var_10_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 49
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 174
		}
	}

	var_10_13:RegisterAnimationSequence("ModFiveStats", var_10_31)

	local var_10_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 49
		}
	}

	var_10_15:RegisterAnimationSequence("ModFiveStats", var_10_32)

	local var_10_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 299
		}
	}

	var_10_17:RegisterAnimationSequence("ModFiveStats", var_10_33)

	local var_10_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 299
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 424
		}
	}

	var_10_19:RegisterAnimationSequence("ModFiveStats", var_10_34)

	local var_10_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 424
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 549
		}
	}

	var_10_21:RegisterAnimationSequence("ModFiveStats", var_10_35)

	if CONDITIONS.InFrontend() then
		local var_10_36 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1510
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 410
			}
		}

		var_10_22:RegisterAnimationSequence("ModFiveStats", var_10_36)
	end

	local var_10_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 550
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 675
		}
	}

	var_10_24:RegisterAnimationSequence("ModFiveStats", var_10_37)

	local function var_10_38()
		var_10_5:AnimateSequence("ModFiveStats")
		var_10_7:AnimateSequence("ModFiveStats")
		var_10_9:AnimateSequence("ModFiveStats")
		var_10_11:AnimateSequence("ModFiveStats")
		var_10_13:AnimateSequence("ModFiveStats")
		var_10_15:AnimateSequence("ModFiveStats")
		var_10_17:AnimateSequence("ModFiveStats")
		var_10_19:AnimateSequence("ModFiveStats")
		var_10_21:AnimateSequence("ModFiveStats")

		if CONDITIONS.InFrontend() then
			var_10_22:AnimateSequence("ModFiveStats")
		end

		var_10_24:AnimateSequence("ModFiveStats")
	end

	var_10_0._sequences.ModFiveStats = var_10_38

	local var_10_39
	local var_10_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -142
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 119
		}
	}

	var_10_5:RegisterAnimationSequence("InitTabLayout", var_10_40)

	local var_10_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -176
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -148
		}
	}

	var_10_7:RegisterAnimationSequence("InitTabLayout", var_10_41)

	local var_10_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -146
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -145
		}
	}

	var_10_9:RegisterAnimationSequence("InitTabLayout", var_10_42)

	local var_10_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -150
		}
	}

	var_10_11:RegisterAnimationSequence("InitTabLayout", var_10_43)

	local var_10_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -150
		}
	}

	var_10_13:RegisterAnimationSequence("InitTabLayout", var_10_44)

	local var_10_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -150
		}
	}

	var_10_15:RegisterAnimationSequence("InitTabLayout", var_10_45)

	local var_10_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -150
		}
	}

	var_10_17:RegisterAnimationSequence("InitTabLayout", var_10_46)

	local var_10_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -150
		}
	}

	var_10_19:RegisterAnimationSequence("InitTabLayout", var_10_47)

	local var_10_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -150
		}
	}

	var_10_21:RegisterAnimationSequence("InitTabLayout", var_10_48)

	if CONDITIONS.InFrontend() then
		local var_10_49 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -255
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -188
			}
		}

		var_10_22:RegisterAnimationSequence("InitTabLayout", var_10_49)
	end

	local var_10_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -150
		}
	}

	var_10_24:RegisterAnimationSequence("InitTabLayout", var_10_50)

	local function var_10_51()
		var_10_5:AnimateSequence("InitTabLayout")
		var_10_7:AnimateSequence("InitTabLayout")
		var_10_9:AnimateSequence("InitTabLayout")
		var_10_11:AnimateSequence("InitTabLayout")
		var_10_13:AnimateSequence("InitTabLayout")
		var_10_15:AnimateSequence("InitTabLayout")
		var_10_17:AnimateSequence("InitTabLayout")
		var_10_19:AnimateSequence("InitTabLayout")
		var_10_21:AnimateSequence("InitTabLayout")

		if CONDITIONS.InFrontend() then
			var_10_22:AnimateSequence("InitTabLayout")
		end

		var_10_24:AnimateSequence("InitTabLayout")
	end

	var_10_0._sequences.InitTabLayout = var_10_51

	local var_10_52
	local var_10_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -487
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 488
		}
	}

	var_10_5:RegisterAnimationSequence("ModFourStats", var_10_53)

	local var_10_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 488
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -487
		}
	}

	var_10_7:RegisterAnimationSequence("ModFourStats", var_10_54)

	local var_10_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 487
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -487
		}
	}

	var_10_9:RegisterAnimationSequence("ModFourStats", var_10_55)

	local var_10_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -347
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		}
	}

	var_10_11:RegisterAnimationSequence("ModFourStats", var_10_56)

	local var_10_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 237
		}
	}

	var_10_13:RegisterAnimationSequence("ModFourStats", var_10_57)

	local var_10_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 111
		}
	}

	var_10_15:RegisterAnimationSequence("ModFourStats", var_10_58)

	local var_10_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 237
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 361
		}
	}

	var_10_17:RegisterAnimationSequence("ModFourStats", var_10_59)

	local var_10_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 361
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 487
		}
	}

	var_10_19:RegisterAnimationSequence("ModFourStats", var_10_60)

	local var_10_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 487
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 611
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ModFourStats", var_10_61)

	if CONDITIONS.InFrontend() then
		local var_10_62 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1447
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 473
			}
		}

		var_10_22:RegisterAnimationSequence("ModFourStats", var_10_62)
	end

	local var_10_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 613
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 737
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -196
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -172
		}
	}

	var_10_24:RegisterAnimationSequence("ModFourStats", var_10_63)

	local function var_10_64()
		var_10_5:AnimateSequence("ModFourStats")
		var_10_7:AnimateSequence("ModFourStats")
		var_10_9:AnimateSequence("ModFourStats")
		var_10_11:AnimateSequence("ModFourStats")
		var_10_13:AnimateSequence("ModFourStats")
		var_10_15:AnimateSequence("ModFourStats")
		var_10_17:AnimateSequence("ModFourStats")
		var_10_19:AnimateSequence("ModFourStats")
		var_10_21:AnimateSequence("ModFourStats")

		if CONDITIONS.InFrontend() then
			var_10_22:AnimateSequence("ModFourStats")
		end

		var_10_24:AnimateSequence("ModFourStats")
	end

	var_10_0._sequences.ModFourStats = var_10_64

	local var_10_65
	local var_10_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -431
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 417
		}
	}

	var_10_5:RegisterAnimationSequence("ModThreeStats", var_10_66)

	local var_10_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 417
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -431
		}
	}

	var_10_7:RegisterAnimationSequence("ModThreeStats", var_10_67)

	local var_10_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 417
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -431
		}
	}

	var_10_9:RegisterAnimationSequence("ModThreeStats", var_10_68)

	local var_10_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -291
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 41
		}
	}

	var_10_11:RegisterAnimationSequence("ModThreeStats", var_10_69)

	local var_10_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 293
		}
	}

	var_10_13:RegisterAnimationSequence("ModThreeStats", var_10_70)

	local var_10_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 167
		}
	}

	var_10_15:RegisterAnimationSequence("ModThreeStats", var_10_71)

	local var_10_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 417
		}
	}

	var_10_17:RegisterAnimationSequence("ModThreeStats", var_10_72)

	local var_10_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 417
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 543
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ModThreeStats", var_10_73)

	local var_10_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 543
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 667
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ModThreeStats", var_10_74)

	if CONDITIONS.InFrontend() then
		local var_10_75 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1377
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 529
			}
		}

		var_10_22:RegisterAnimationSequence("ModThreeStats", var_10_75)
	end

	local var_10_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 669
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 793
		}
	}

	var_10_24:RegisterAnimationSequence("ModThreeStats", var_10_76)

	local function var_10_77()
		var_10_5:AnimateSequence("ModThreeStats")
		var_10_7:AnimateSequence("ModThreeStats")
		var_10_9:AnimateSequence("ModThreeStats")
		var_10_11:AnimateSequence("ModThreeStats")
		var_10_13:AnimateSequence("ModThreeStats")
		var_10_15:AnimateSequence("ModThreeStats")
		var_10_17:AnimateSequence("ModThreeStats")
		var_10_19:AnimateSequence("ModThreeStats")
		var_10_21:AnimateSequence("ModThreeStats")

		if CONDITIONS.InFrontend() then
			var_10_22:AnimateSequence("ModThreeStats")
		end

		var_10_24:AnimateSequence("ModThreeStats")
	end

	var_10_0._sequences.ModThreeStats = var_10_77

	local var_10_78
	local var_10_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -431
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 293
		}
	}

	var_10_5:RegisterAnimationSequence("ModTwoStats", var_10_79)

	local var_10_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -431
		}
	}

	var_10_7:RegisterAnimationSequence("ModTwoStats", var_10_80)

	local var_10_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -431
		}
	}

	var_10_9:RegisterAnimationSequence("ModTwoStats", var_10_81)

	local var_10_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -291
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 41
		}
	}

	var_10_11:RegisterAnimationSequence("ModTwoStats", var_10_82)

	local var_10_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 293
		}
	}

	var_10_13:RegisterAnimationSequence("ModTwoStats", var_10_83)

	local var_10_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 167
		}
	}

	var_10_15:RegisterAnimationSequence("ModTwoStats", var_10_84)

	local var_10_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 293
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 417
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("ModTwoStats", var_10_85)

	local var_10_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 417
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 543
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ModTwoStats", var_10_86)

	local var_10_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 543
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 667
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_21:RegisterAnimationSequence("ModTwoStats", var_10_87)

	if CONDITIONS.InFrontend() then
		local var_10_88 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1253
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 529
			}
		}

		var_10_22:RegisterAnimationSequence("ModTwoStats", var_10_88)
	end

	local var_10_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 669
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 793
		}
	}

	var_10_24:RegisterAnimationSequence("ModTwoStats", var_10_89)

	local function var_10_90()
		var_10_5:AnimateSequence("ModTwoStats")
		var_10_7:AnimateSequence("ModTwoStats")
		var_10_9:AnimateSequence("ModTwoStats")
		var_10_11:AnimateSequence("ModTwoStats")
		var_10_13:AnimateSequence("ModTwoStats")
		var_10_15:AnimateSequence("ModTwoStats")
		var_10_17:AnimateSequence("ModTwoStats")
		var_10_19:AnimateSequence("ModTwoStats")
		var_10_21:AnimateSequence("ModTwoStats")

		if CONDITIONS.InFrontend() then
			var_10_22:AnimateSequence("ModTwoStats")
		end

		var_10_24:AnimateSequence("ModTwoStats")
	end

	var_10_0._sequences.ModTwoStats = var_10_90

	PostLoadFunc(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("BrTeamScoreboard", BrTeamScoreboard)
LockTable(_M)
