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

	local var_1_4 = var_1_1 < var_1_0 and var_1_1 or var_1_0

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
	elseif CONDITIONS.AreTabletsFilteredOut() then
		ACTIONS.AnimateSequence(arg_3_0, "ModThreeStats")
	else
		ACTIONS.AnimateSequence(arg_3_0, "ModFourStats")
	end
end

local function var_0_8(arg_4_0, arg_4_1)
	var_0_7(arg_4_0, arg_4_1)

	if CONDITIONS.IsResurgenceRespawn() then
		arg_4_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/SCORE"), 0)
		arg_4_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_4_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU/REDEPLOYS"), 0)
	elseif CONDITIONS.IsBloodMoney() then
		arg_4_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_4_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CASH"), 0)
		arg_4_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MISSION_PARTICIPATION"), 0)
		arg_4_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	elseif CONDITIONS.IsWZRatRace() then
		arg_4_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_4_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CASH"), 0)
		arg_4_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MISSION_PARTICIPATION"), 0)
		arg_4_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	elseif CONDITIONS.IsBRKingSlayer() then
		arg_4_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/KINGSLAYER_TOTAL"), 0)
		arg_4_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_4_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/KINGSLAYER_KILLS"), 0)
		arg_4_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DAMAGE"), 0)
	elseif CONDITIONS.IsRiskGametype() then
		arg_4_0.Title1:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
		arg_4_0.Title2:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RISK_TOKENS"), 0)
		arg_4_0.Title3:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RISK_CAPTURES"), 0)
		arg_4_0.Title4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CACHES"), 0)
	end

	local var_4_0 = DataSources.inGame.MP.brSquadEliminatedActive:GetValue(arg_4_1) == 1

	if options and options.inPauseMenu or var_4_0 then
		local var_4_1 = 500
		local var_4_2 = LUI.UITimer.new({
			event = "forceScoreboardRefresh",
			interval = var_4_1
		})

		var_4_2.id = "BRScoreboardRefreshForcedRefreshTimer"

		arg_4_0:addElement(var_4_2)
		arg_4_0:registerEventHandler("forceScoreboardRefresh", function(arg_5_0, arg_5_1)
			var_0_5(arg_5_0, arg_5_1.controller or arg_4_1 or Engine.IJEBHJIJF())
		end)
	end
end

function PostLoadFunc(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.UpdateScoreboardData = var_0_5
	arg_6_0.SetupScoreboardLayout = var_0_7
	arg_6_0.scoreboardData = {}

	arg_6_0.PlayerGrid:SetRefreshChild(function(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = arg_6_0.PlayerGrid:GetContentIndex(arg_7_1, arg_7_2)
		local var_7_1
		local var_7_2
		local var_7_3 = Game.DHEDEIHGF() or var_0_3
		local var_7_4 = Game.DGCJIFGJBD(var_7_3, var_7_0, true)

		if var_7_4 then
			var_7_4.isCurrentPlayer = var_7_4.clientNum and var_7_4.clientNum == Game.DBACJGFHDD()

			local var_7_5 = var_7_4.isCurrentPlayer or var_7_4.isBot

			arg_7_0.MicDisplay:SetIsScoreboardState(true)
			arg_7_0.MicDisplay:SetState(var_7_4.isMicOn, var_7_4.isMuted)
			arg_7_0.MicDisplay:SetForceHideState(var_7_5)

			var_7_4.squadIndex = Game.DEFDIHBJEH(var_7_4.clientNum) or nil
			var_7_4.missions = BitwiseOperators.band(BitwiseOperators.rshift(var_7_4.extraScore2, 8), 15)
			var_7_4.damage = var_7_4.extraScore3
			var_7_4.rankDisplay = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_7_4.rank
			})._rankDisplay
			var_7_4.isMasterPrestige = Rank.IsMasterPrestige(var_7_4.prestige)

			if var_7_4.isCurrentPlayer then
				ACTIONS.AnimateSequence(arg_7_0, "Player")
			end

			local var_7_6 = SWATCHES.HUD.background

			if var_7_4.squadIndex then
				local var_7_7

				var_7_7 = Game.BJGDCJHICE(var_7_4.squadIndex) or SWATCHES.HUD.background
			end

			arg_7_0.Rank:setText(var_7_4.rankDisplay or "")
			arg_7_0.Gamertag:setText(var_7_4.name or var_0_2)

			if not Dvar.IBEGCHEFE("LPSPMQSNPQ") and not Dvar.IBEGCHEFE("LSTLQTSSRM") then
				arg_7_0.Rank:SetAlpha(1)
			else
				arg_7_0.Rank:SetAlpha(0)
			end

			if CONDITIONS.IsBRKingSlayer() then
				local var_7_8 = 0
				local var_7_9 = BitwiseOperators.band(var_7_4.extraScore0, 255)
				local var_7_10 = Dvar.CFHDGABACF("scr_kingslayer_pointsPerKing") or 5
				local var_7_11 = var_7_4.kills - var_7_9 + var_7_9 * var_7_10

				arg_7_0.Score1:setText(var_7_11 or var_0_1)
				arg_7_0.Score2:setText(var_7_4.kills or var_0_1)
				arg_7_0.Score3:setText(var_7_9 or var_0_1)
				arg_7_0.Score4:setText(var_7_4.damage or var_0_1)
			elseif CONDITIONS.IsBloodMoney() or CONDITIONS.IsRiskGametype() or CONDITIONS.IsWZRatRace() then
				arg_7_0.Score1:setText(var_7_4.kills or var_0_1)

				local var_7_12 = 0
				local var_7_13 = BitwiseOperators.band(var_7_4.extraScore0, 4095)
				local var_7_14 = var_7_13

				if CONDITIONS.IsBloodMoney() or CONDITIONS.IsWZRatRace() then
					local var_7_15 = var_7_13 * 1000

					var_7_14 = "$" .. var_7_15
				end

				arg_7_0.Score2:setText(var_7_14 or var_0_1)

				local var_7_16 = 0
				local var_7_17 = BitwiseOperators.band(BitwiseOperators.rshift(var_7_4.extraScore0, 12), 15)

				if var_7_17 == 15 then
					var_7_17 = var_7_17 .. "+"
				end

				arg_7_0.Score3:setText(var_7_17 or var_0_1)
				arg_7_0.Score4:setText(var_7_4.extraScore1 or var_0_1)
			elseif CONDITIONS.IsResurgenceRespawn() then
				local var_7_18 = 0
				local var_7_19 = BitwiseOperators.band(var_7_4.extraScore0, 255)

				arg_7_0.Score1:setText(var_7_4.score or var_0_1)
				arg_7_0.Score2:setText(var_7_4.kills or var_0_1)
				arg_7_0.Score3:setText(var_7_4.damage or var_0_1)
				arg_7_0.Score4:setText(var_7_19 or var_0_1)
			else
				arg_7_0.Score1:setText(var_7_4.score or var_0_1)
				arg_7_0.Score2:setText(var_7_4.kills or var_0_1)
				arg_7_0.Score3:setText(var_7_4.damage or var_0_1)

				if not tabletsFilteredOut then
					arg_7_0.Score4:setText(var_7_4.missions or var_0_1)
				end
			end

			if arg_7_0.Score5 then
				arg_7_0.Score5:setText(var_7_4.plunder or var_0_1)
			end

			local var_7_20 = CallingCardUtils.GetCardTexture(Game.BABEFDCDIG(var_7_4.clientNum))

			arg_7_0.Playercard:setImage(RegisterMaterial(var_7_20))

			arg_7_0.rowData = var_7_4

			local function var_7_21(arg_8_0)
				local var_8_0 = arg_8_0.rowData.isBot
				local var_8_1 = arg_8_0.rowData.clientNum
				local var_8_2
				local var_8_3
				local var_8_4 = Game.BBCDHAEBHD(var_8_1)
				local var_8_5 = Game.GJIIJAFBI(var_8_1)

				assert(var_8_5)
				assert(var_8_4)

				return {
					isContextualMenu = true,
					clientNum = var_8_1,
					gamertag = arg_8_0.rowData.name,
					xuid = var_8_5,
					xuidString = var_8_4,
					controllerIndex = arg_6_1,
					getButtonsCallback = function(arg_9_0)
						return (FRIENDS.GetScoreboardActions(arg_9_0))
					end,
					isBot = arg_8_0.rowData.isBot,
					isCP = CONDITIONS.IsThirdGameMode()
				}
			end

			FRIENDS.SetupPlayerContextualMenuOptions(arg_7_0, arg_6_1, var_7_21)

			if CONDITIONS.IsSpectating(arg_6_1) then
				local var_7_22 = DataSources.inGame.player.BRData.spectatedIsMuted:GetValue(arg_6_1)

				if var_7_4.clientNum == DataSources.inGame.currentPlayerStateClientNum:GetValue(arg_6_1) and var_7_4.isMuted ~= var_7_22 then
					DataSources.inGame.player.BRData.spectatedIsMuted:SetValue(arg_6_1, var_7_4.isMuted)
				end
			end
		else
			var_0_6(arg_7_0, arg_6_1)
		end
	end)
	var_0_8(arg_6_0, arg_6_1)
	var_0_5(arg_6_0, arg_6_1)
end

function BRPauseMenuScoreboard(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1400 * _1080p, 0, 340 * _1080p)

	var_10_0.id = "BRPauseMenuScoreboard"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3

	if CONDITIONS.InFrontend(var_10_0) then
		var_10_3 = MenuBuilder.BuildRegisteredType("BRTeamScoreboardExtraInfo", {
			controllerIndex = var_10_1
		})
		var_10_3.id = "FrontendExtraInfo"

		var_10_3:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 700, 0, _1080p * 68)
		var_10_0:addElement(var_10_3)

		var_10_0.FrontendExtraInfo = var_10_3
	end

	local var_10_4
	local var_10_5 = LUI.UIImage.new()

	var_10_5.id = "TitleBg"

	var_10_5:SetAlpha(0.08, 0)
	var_10_5:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 700, _1080p * 68, _1080p * 96)
	var_10_0:addElement(var_10_5)

	var_10_0.TitleBg = var_10_5

	local var_10_6
	local var_10_7 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 3,
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
		controllerIndex = var_10_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BRAARScoreboardRow", {
				controllerIndex = var_10_1
			})
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
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
	local var_10_8 = LUI.UIGrid.new(var_10_7)

	var_10_8.id = "PlayerGrid"

	var_10_8:setUseStencil(false)
	var_10_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -700, _1080p * 700, _1080p * 96, _1080p * 344)
	var_10_0:addElement(var_10_8)

	var_10_0.PlayerGrid = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIText.new()

	var_10_10.id = "TitleHashtag"

	var_10_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_10:setText(Engine.CBBHFCGDIC("MPUI/HASHTAG"), 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_10:SetAlignment(LUI.Alignment.Center)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -691, _1080p * -651, _1080p * 72, _1080p * 96)
	var_10_0:addElement(var_10_10)

	var_10_0.TitleHashtag = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIText.new()

	var_10_12.id = "TitleName"

	var_10_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_12:setText(Engine.CBBHFCGDIC("MENU/NAME"), 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_12:SetAlignment(LUI.Alignment.Left)
	var_10_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -408, _1080p * 34, _1080p * 72, _1080p * 96)
	var_10_0:addElement(var_10_12)

	var_10_0.TitleName = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIStyledText.new()

	var_10_14.id = "Title1"

	var_10_14:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_14:setText(Engine.CBBHFCGDIC("LUA_MENU/SCORE"), 0)
	var_10_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_14:SetWordWrap(false)
	var_10_14:SetAlignment(LUI.Alignment.Center)
	var_10_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_14:SetStartupDelay(2000)
	var_10_14:SetLineHoldTime(400)
	var_10_14:SetAnimMoveTime(3000)
	var_10_14:SetAnimMoveSpeed(50)
	var_10_14:SetEndDelay(2000)
	var_10_14:SetCrossfadeTime(250)
	var_10_14:SetFadeInTime(300)
	var_10_14:SetFadeOutTime(300)
	var_10_14:SetMaxVisibleLines(1)
	var_10_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 56, _1080p * 181, _1080p * 72, _1080p * 96)
	var_10_0:addElement(var_10_14)

	var_10_0.Title1 = var_10_14

	local var_10_15
	local var_10_16 = LUI.UIStyledText.new()

	var_10_16.id = "Title2"

	var_10_16:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_16:setText(Engine.CBBHFCGDIC("LUA_MENU/KILLS"), 0)
	var_10_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_16:SetWordWrap(false)
	var_10_16:SetAlignment(LUI.Alignment.Center)
	var_10_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_16:SetStartupDelay(2000)
	var_10_16:SetLineHoldTime(400)
	var_10_16:SetAnimMoveTime(3000)
	var_10_16:SetAnimMoveSpeed(50)
	var_10_16:SetEndDelay(2000)
	var_10_16:SetCrossfadeTime(250)
	var_10_16:SetFadeInTime(300)
	var_10_16:SetFadeOutTime(300)
	var_10_16:SetMaxVisibleLines(1)
	var_10_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 181, _1080p * 306, _1080p * 72, _1080p * 96)
	var_10_0:addElement(var_10_16)

	var_10_0.Title2 = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIStyledText.new()

	var_10_18.id = "Title3"

	var_10_18:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DAMAGE"), 0)
	var_10_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_18:SetWordWrap(false)
	var_10_18:SetAlignment(LUI.Alignment.Center)
	var_10_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_18:SetStartupDelay(2000)
	var_10_18:SetLineHoldTime(400)
	var_10_18:SetAnimMoveTime(3000)
	var_10_18:SetAnimMoveSpeed(50)
	var_10_18:SetEndDelay(2000)
	var_10_18:SetCrossfadeTime(250)
	var_10_18:SetFadeInTime(300)
	var_10_18:SetFadeOutTime(300)
	var_10_18:SetMaxVisibleLines(1)
	var_10_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 306, _1080p * 431, _1080p * 72, _1080p * 96)
	var_10_0:addElement(var_10_18)

	var_10_0.Title3 = var_10_18

	local var_10_19
	local var_10_20 = LUI.UIStyledText.new()

	var_10_20.id = "Title4"

	var_10_20:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_20:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CONTRACTS"), 0)
	var_10_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_20:SetWordWrap(false)
	var_10_20:SetAlignment(LUI.Alignment.Center)
	var_10_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_20:SetStartupDelay(2000)
	var_10_20:SetLineHoldTime(400)
	var_10_20:SetAnimMoveTime(3000)
	var_10_20:SetAnimMoveSpeed(50)
	var_10_20:SetEndDelay(2000)
	var_10_20:SetCrossfadeTime(250)
	var_10_20:SetFadeInTime(300)
	var_10_20:SetFadeOutTime(300)
	var_10_20:SetMaxVisibleLines(1)
	var_10_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 431, _1080p * 556, _1080p * 72, _1080p * 96)
	var_10_0:addElement(var_10_20)

	var_10_0.Title4 = var_10_20

	local var_10_21
	local var_10_22 = LUI.UIStyledText.new()

	var_10_22.id = "TitleExtraStat"

	var_10_22:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_10_22:setText(Engine.CBBHFCGDIC("MP/BR_PLUNDER_CASH"), 0)
	var_10_22:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_22:SetWordWrap(false)
	var_10_22:SetAlignment(LUI.Alignment.Center)
	var_10_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_22:SetStartupDelay(2000)
	var_10_22:SetLineHoldTime(400)
	var_10_22:SetAnimMoveTime(3000)
	var_10_22:SetAnimMoveSpeed(50)
	var_10_22:SetEndDelay(2000)
	var_10_22:SetCrossfadeTime(250)
	var_10_22:SetFadeInTime(300)
	var_10_22:SetFadeOutTime(300)
	var_10_22:SetMaxVisibleLines(1)
	var_10_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 556, _1080p * 682, _1080p * 72, _1080p * 96)
	var_10_0:addElement(var_10_22)

	var_10_0.TitleExtraStat = var_10_22

	local function var_10_23()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_23

	local var_10_24

	if CONDITIONS.InFrontend(var_10_0) then
		local var_10_25 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 556
			}
		}

		var_10_3:RegisterAnimationSequence("ModFourStats", var_10_25)
	end

	local var_10_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 556
		}
	}

	var_10_5:RegisterAnimationSequence("ModFourStats", var_10_26)

	local var_10_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 556
		}
	}

	var_10_8:RegisterAnimationSequence("ModFourStats", var_10_27)

	local var_10_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("ModFourStats", var_10_28)

	local var_10_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_22:RegisterAnimationSequence("ModFourStats", var_10_29)

	local function var_10_30()
		if CONDITIONS.InFrontend(var_10_0) then
			var_10_3:AnimateSequence("ModFourStats")
		end

		var_10_5:AnimateSequence("ModFourStats")
		var_10_8:AnimateSequence("ModFourStats")
		var_10_20:AnimateSequence("ModFourStats")
		var_10_22:AnimateSequence("ModFourStats")
	end

	var_10_0._sequences.ModFourStats = var_10_30

	local var_10_31

	if CONDITIONS.InFrontend(var_10_0) then
		local var_10_32 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 431
			}
		}

		var_10_3:RegisterAnimationSequence("ModThreeStats", var_10_32)
	end

	local var_10_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 431
		}
	}

	var_10_5:RegisterAnimationSequence("ModThreeStats", var_10_33)

	local var_10_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 431
		}
	}

	var_10_8:RegisterAnimationSequence("ModThreeStats", var_10_34)

	local var_10_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("ModThreeStats", var_10_35)

	local var_10_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_22:RegisterAnimationSequence("ModThreeStats", var_10_36)

	local function var_10_37()
		if CONDITIONS.InFrontend(var_10_0) then
			var_10_3:AnimateSequence("ModThreeStats")
		end

		var_10_5:AnimateSequence("ModThreeStats")
		var_10_8:AnimateSequence("ModThreeStats")
		var_10_20:AnimateSequence("ModThreeStats")
		var_10_22:AnimateSequence("ModThreeStats")
	end

	var_10_0._sequences.ModThreeStats = var_10_37

	local var_10_38

	if CONDITIONS.InFrontend(var_10_0) then
		local var_10_39 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 306
			}
		}

		var_10_3:RegisterAnimationSequence("ModTwoStats", var_10_39)
	end

	local var_10_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 306
		}
	}

	var_10_5:RegisterAnimationSequence("ModTwoStats", var_10_40)

	local var_10_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 306
		}
	}

	var_10_8:RegisterAnimationSequence("ModTwoStats", var_10_41)

	local var_10_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("ModTwoStats", var_10_42)

	local var_10_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("ModTwoStats", var_10_43)

	local var_10_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_22:RegisterAnimationSequence("ModTwoStats", var_10_44)

	local function var_10_45()
		if CONDITIONS.InFrontend(var_10_0) then
			var_10_3:AnimateSequence("ModTwoStats")
		end

		var_10_5:AnimateSequence("ModTwoStats")
		var_10_8:AnimateSequence("ModTwoStats")
		var_10_18:AnimateSequence("ModTwoStats")
		var_10_20:AnimateSequence("ModTwoStats")
		var_10_22:AnimateSequence("ModTwoStats")
	end

	var_10_0._sequences.ModTwoStats = var_10_45

	PostLoadFunc(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("BRPauseMenuScoreboard", BRPauseMenuScoreboard)
LockTable(_M)
