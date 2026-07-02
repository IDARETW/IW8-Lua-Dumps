module(..., package.seeall)

local var_0_0 = 1
local var_0_1 = 2
local var_0_2 = 3
local var_0_3 = 4
local var_0_4 = 5
local var_0_5 = 6
local var_0_6 = 69
local var_0_7 = 88
local var_0_8 = 0
local var_0_9 = 1
local var_0_10 = 2
local var_0_11 = {
	3,
	4,
	5,
	6
}
local var_0_12 = 7
local var_0_13 = "Friendly"

function SetPlayer(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._team = arg_1_1
	arg_1_0._row = arg_1_2
end

function GetClientNum(arg_2_0)
	return arg_2_0._clientNum
end

function IsMyRow(arg_3_0)
	return arg_3_0._isCurrentPlayer
end

local function var_0_14(arg_4_0, arg_4_1)
	local var_4_0

	if CONDITIONS.IsCoreMultiplayer() then
		var_4_0 = Game.DGCJIFGJBD(arg_4_0._team, arg_4_0._row, true)
	elseif CONDITIONS.IsThirdGameMode() then
		var_4_0 = Game.DJHFHAFJJE(arg_4_0._row)
	end

	return var_4_0
end

local function var_0_15(arg_5_0)
	if CONDITIONS.IsCoreMultiplayer() then
		if CODCASTER_CONDITIONS.IsMPCODCaster() then
			local var_5_0 = arg_5_0.isFriendly and 1 or 2
			local var_5_1, var_5_2 = CODCASTER.GetTeamColor(arg_5_0._controllerIndex, var_5_0)

			arg_5_0.scoreboardRow:SetAllFieldsColor(var_5_2)
		else
			arg_5_0.scoreboardRow:SetAllFieldsColor(GetIntForColor(SWATCHES.Scoreboard.text))
		end

		if arg_5_0:isInFocus() then
			if arg_5_0.isFriendly then
				arg_5_0.scoreboardRow:SetAllFieldsColor(GetIntForColor(SWATCHES.Scoreboard.friendlyTeam))
				arg_5_0.Glow:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)
				arg_5_0.TextureLayer:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)
				arg_5_0.Line:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)

				if arg_5_0._isCurrentPlayer then
					arg_5_0.scoreboardRow:SetAllFieldsColor(15584086)
				end
			elseif arg_5_0.isEnemy then
				arg_5_0.scoreboardRow:SetAllFieldsColor(GetIntForColor(SWATCHES.Scoreboard.enemyTeam))
				arg_5_0.Glow:SetRGBFromTable(SWATCHES.Scoreboard.enemyTeam)
				arg_5_0.TextureLayer:SetRGBFromTable(SWATCHES.Scoreboard.enemyTeam)
				arg_5_0.Line:SetRGBFromTable(SWATCHES.Scoreboard.enemyTeam)
			else
				arg_5_0.scoreboardRow:SetAllFieldsColor(GetIntForColor(SWATCHES.Scoreboard.friendlyTeam))
				arg_5_0.Glow:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)
				arg_5_0.TextureLayer:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)
				arg_5_0.Line:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)
			end
		elseif arg_5_0._isCurrentPlayer then
			arg_5_0.scoreboardRow:SetAllFieldsColor(15584086)
		end
	elseif CONDITIONS.IsThirdGameMode() then
		if arg_5_0:isInFocus() then
			arg_5_0.scoreboardRow:SetAllFieldsColor(GetIntForColor(SWATCHES.Scoreboard.friendlyTeam))
			arg_5_0.Glow:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)
			arg_5_0.TextureLayer:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)
			arg_5_0.Line:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)

			if arg_5_0._isCurrentPlayer then
				arg_5_0.scoreboardRow:SetAllFieldsColor(GetIntForColor(SWATCHES.Scoreboard.highlight))
			end
		elseif arg_5_0._isCurrentPlayer then
			arg_5_0.scoreboardRow:SetAllFieldsColor(GetIntForColor(SWATCHES.Scoreboard.highlight))
		end
	end

	if arg_5_0._isElder then
		arg_5_0.scoreboardRow:SetFieldColor(var_0_8, GetIntForColor(SWATCHES.genericMenu.elderRank))
	end

	if not Engine.DDJFBBJAIG() and (CONDITIONS.IsArmsRaceGameType(arg_5_0) or CONDITIONS.IsArenaGameType(arg_5_0)) and arg_5_0._clientNum and Game.DCJAGIEFIG(arg_5_0._controllerIndex, arg_5_0._clientNum) then
		local var_5_3 = Game.BAJBBACHFB(arg_5_0._clientNum)

		arg_5_0.scoreboardRow:SetFieldColor(var_0_9, GetIntForColor(var_5_3))
	end
end

local function var_0_16(arg_6_0)
	local var_6_0 = arg_6_0.lootIcons:getFirstChild()

	while var_6_0 do
		var_6_0 = var_6_0:getNextSibling(), arg_6_0.lootIcons:RemoveElement(var_6_0)
	end
end

local function var_0_17(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0.lootIconPool[arg_7_1] = {}

	for iter_7_0 = 1, arg_7_2 do
		arg_7_0.lootIconPool[arg_7_1][iter_7_0] = LUI.UIImage.new()

		arg_7_0.lootIconPool[arg_7_1][iter_7_0]:SetAnchorsAndPosition(0, 1, 1, 1, _1080p * 0, _1080p * 32, _1080p * 16, _1080p * -16)

		arg_7_0.lootIconPool[arg_7_1][iter_7_0].id = "LootIcon"

		arg_7_0.lootIconPool[arg_7_1][iter_7_0]:SetAlpha(1, 0)
		arg_7_0.lootIconPool[arg_7_1][iter_7_0]:SetRGBFromTable(arg_7_3, 0)
		arg_7_0.lootIconPool[arg_7_1][iter_7_0]:setImage(RegisterMaterial("iw7_waypoint_diamond_backing_base"), 0)
	end
end

local function var_0_18(arg_8_0)
	local var_8_0 = 4
	local var_8_1 = 1
	local var_8_2 = 1
	local var_8_3 = 1
	local var_8_4 = 1
	local var_8_5 = 1

	arg_8_0.lootIconPool = {}

	var_0_17(arg_8_0, var_0_0, var_8_0, COLORS.lightGrey)
	var_0_17(arg_8_0, var_0_1, var_8_1, COLORS.green)
	var_0_17(arg_8_0, var_0_2, var_8_2, COLORS.cobaltBlue)
	var_0_17(arg_8_0, var_0_3, var_8_3, COLORS.fullPurple)
	var_0_17(arg_8_0, var_0_4, var_8_4, COLORS.epicOrange)
	var_0_17(arg_8_0, var_0_5, var_8_5, COLORS.brightGold)
end

local function var_0_19(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.lootIconPool[arg_9_1][arg_9_2]

	arg_9_0.lootIcons:addElement(var_9_0)
end

local function var_0_20(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_1) do
		for iter_10_2 = 1, iter_10_1 do
			var_0_19(arg_10_0, iter_10_0, iter_10_2)
		end
	end
end

local function var_0_21(arg_11_0)
	var_0_16(arg_11_0)

	if arg_11_0._clientNum < 20 then
		local var_11_0 = Game.BFEEGCHICA(arg_11_0._controllerIndex, "ui_droploot_inv_" .. arg_11_0._clientNum)
		local var_11_1 = math.floor(var_11_0 / 100000)
		local var_11_2 = var_11_0 % 100000
		local var_11_3 = math.floor(var_11_2 / 10000)
		local var_11_4 = var_11_2 % 10000
		local var_11_5 = math.floor(var_11_4 / 1000)
		local var_11_6 = var_11_4 % 1000
		local var_11_7 = math.floor(var_11_6 / 100)
		local var_11_8 = var_11_6 % 100
		local var_11_9 = math.floor(var_11_8 / 10)
		local var_11_10 = var_11_8 % 10
		local var_11_11 = {
			var_11_10,
			var_11_9,
			var_11_7,
			var_11_5,
			var_11_3,
			var_11_1
		}

		var_0_20(arg_11_0, var_11_11)
	end
end

local function var_0_22(arg_12_0, arg_12_1)
	if arg_12_0.scoreboardRow then
		arg_12_0.scoreboardRow:SetImageData(SCOREBOARD.RowImageType.MIC, SCOREBOARD.RowImageTextureIndexTable.MIC_TALK_TEXTURE, _1080p * 1, _1080p * 25, _1080p * -12, _1080p * 12, 0, 1, 0)
		arg_12_0.scoreboardRow:SetImageData(SCOREBOARD.RowImageType.DEATH, SCOREBOARD.RowImageTextureIndexTable.DEATH_TEXTURE, _1080p * 383, _1080p * 407, _1080p * -12, _1080p * 12, 0, 1, 0)
		arg_12_0.scoreboardRow:SetImageData(SCOREBOARD.RowImageType.PING, SCOREBOARD.RowImageTextureIndexTable.PING_TEXTURE_1, _1080p * -31, _1080p * -5, _1080p * -2, _1080p * 12, 2, 1, 0)
	end
end

local function var_0_23(arg_13_0, arg_13_1)
	if CONDITIONS.IsCoreMultiplayer() then
		if SCOREBOARD.IsAARScoreboard() then
			arg_13_0._gameType = DataSources.frontEnd.AAR.gameType:GetValue(arg_13_1)
		else
			arg_13_0._gameType = DataSources.inGame.MP.match.gameType:GetValue(arg_13_1)
		end

		arg_13_0._gameType = arg_13_0._gameType or "tdm"

		if arg_13_0._gameType == "hvt" or Dvar.IBEGCHEFE("scr_game_inGameLoot") or Dvar.IBEGCHEFE("scr_" .. arg_13_0._gameType .. "_inGameLoot") then
			local var_13_0 = LUI.UIHorizontalStackedLayout.new()

			var_13_0:SetAnchorsAndPosition(0, 1, 1, 1, _1080p * 0, _1080p * 32, _1080p * 16, _1080p * -16)
			var_13_0:SetSpacing(_1080p * -24)
			arg_13_0:addElement(var_13_0)

			arg_13_0.lootIcons = var_13_0

			var_0_18(arg_13_0)
		end
	end
end

local function var_0_24(arg_14_0)
	assert(arg_14_0._controllerIndex)

	local var_14_0 = arg_14_0._clientNum
	local var_14_1 = SCOREBOARD.IsAARScoreboard()
	local var_14_2
	local var_14_3

	if not var_14_1 then
		var_14_3 = Game.BBCDHAEBHD(var_14_0)
		var_14_2 = Game.GJIIJAFBI(var_14_0)
	else
		var_14_3 = arg_14_0._xuid
		var_14_2 = Friends.CAIJHBHGGC(var_14_3)
	end

	assert(var_14_2)
	assert(var_14_3)

	return {
		isContextualMenu = true,
		clientNum = var_14_0,
		gamertag = arg_14_0._name,
		xuid = var_14_2,
		xuidString = var_14_3,
		controllerIndex = arg_14_0._controllerIndex,
		getButtonsCallback = function(arg_15_0)
			return (FRIENDS.GetScoreboardActions(arg_15_0))
		end,
		isAAR = var_14_1,
		isBot = arg_14_0._isBot,
		isCP = CONDITIONS.IsThirdGameMode()
	}
end

local function var_0_25(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	if not Engine.DDJFBBJAIG() then
		if Engine.CGABICJHAI() then
			assert(arg_16_2.ping)

			local var_16_0 = ""
			local var_16_1 = 0
			local var_16_2 = false

			if CONDITIONS.IsCoreMultiplayer() then
				var_16_2 = DataSources.inGame.MP.match.matchOver:GetValue(arg_16_0._controllerIndex)
			else
				var_16_2 = LUI.PostGameManager.IsPostGame(arg_16_0._controllerIndex)
			end

			if not var_16_2 then
				var_16_0 = string.format("%d", arg_16_2.ping)
				var_16_1 = arg_16_3[SCOREBOARD.GetMaxColumn(arg_16_0._controllerIndex) + 1]
			end

			if CONDITIONS.IsThirdGameMode() then
				arg_16_0.scoreboardRow:SetFieldAndPosition(var_0_12, var_16_0, 935 * _1080p, LUI.Alignment.Center)
			else
				arg_16_0.scoreboardRow:SetFieldAndPosition(var_0_12, var_16_0, var_16_1 * _1080p, LUI.Alignment.Center)
			end

			local var_16_3 = arg_16_3[#arg_16_3]

			arg_16_0.scoreboardRow:SetRight(var_16_3 * _1080p)
		elseif arg_16_2.ping then
			local var_16_4 = SCOREBOARD.GetPingIcon(arg_16_2.ping)
			local var_16_5

			if var_16_4 == "hud_ping_1" then
				var_16_5 = SCOREBOARD.RowImageTextureIndexTable.PING_TEXTURE_1
			elseif var_16_4 == "hud_ping_2" then
				var_16_5 = SCOREBOARD.RowImageTextureIndexTable.PING_TEXTURE_2
			elseif var_16_4 == "hud_ping_3" then
				var_16_5 = SCOREBOARD.RowImageTextureIndexTable.PING_TEXTURE_3
			elseif var_16_4 == "hud_ping_4" then
				var_16_5 = SCOREBOARD.RowImageTextureIndexTable.PING_TEXTURE_4
			end

			if var_16_5 then
				arg_16_0.scoreboardRow:SetImageTexture(SCOREBOARD.RowImageType.PING, var_16_5)
			end
		end
	end
end

local function var_0_26(arg_17_0, arg_17_1, arg_17_2)
	if SCOREBOARD.IsAARScoreboard() then
		arg_17_0.scoreboardRow:SetImageVisibility(SCOREBOARD.RowImageType.MIC, 0)
	else
		assert(arg_17_2.isMuted ~= nil)

		local var_17_0 = arg_17_2.isMuted and SCOREBOARD.RowImageTextureIndexTable.MIC_MUTE_TEXTURE or SCOREBOARD.RowImageTextureIndexTable.MIC_TALK_TEXTURE

		arg_17_0.scoreboardRow:SetImageTexture(SCOREBOARD.RowImageType.MIC, var_17_0)
		assert(arg_17_2.isMicOn ~= nil)
		assert(arg_17_2.isMuted ~= nil)

		local var_17_1
		local var_17_2 = (arg_17_2.isMicOn or arg_17_2.isMuted) and "MicOn" or "MicOff"

		if arg_17_0._micAnim ~= var_17_2 then
			if var_17_2 == "MicOn" then
				arg_17_0.scoreboardRow:SetImageVisibility(SCOREBOARD.RowImageType.MIC, 1)
			else
				arg_17_0.scoreboardRow:SetImageVisibility(SCOREBOARD.RowImageType.MIC, 0)
			end

			arg_17_0._micAnim = var_17_2
		end
	end
end

local function var_0_27(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_0._row or 0
	local var_18_1 = var_0_14(arg_18_0, arg_18_2)

	local function var_18_2(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
		if arg_19_0.refreshMuteTimer then
			arg_19_0:RemoveElement(arg_19_0.refreshMuteTimer)
			arg_19_0.refreshMuteTimer:closeTree()

			arg_19_0.refreshMuteTimer = nil
		end

		arg_19_2:RefreshContent()
		var_0_26(arg_19_0, arg_19_1, arg_19_3)
	end

	if var_18_1.isMuted ~= arg_18_3.isMuted then
		var_18_2(arg_18_0, arg_18_2, arg_18_1, var_18_1)
	elseif arg_18_0.refreshMuteTimer == nil then
		local var_18_3 = 50

		arg_18_0.refreshMuteTimer = LUI.UITimer.new({
			interval = var_18_3,
			event = "checkClientConnection" .. var_18_0
		})
		arg_18_0.refreshMuteTimer.id = "refreshMuteTimer" .. var_18_0

		arg_18_0:addElement(arg_18_0.refreshMuteTimer)
		arg_18_0:registerEventHandler("checkClientConnection" .. var_18_0, function(arg_20_0, arg_20_1)
			local var_20_0 = var_0_14(arg_18_0, arg_18_2)

			if var_20_0.isMuted ~= arg_18_3.isMuted then
				var_18_2(arg_18_0, arg_18_2, arg_18_1, var_20_0)
			end
		end)
	end
end

local function var_0_28(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	if not Engine.DDJFBBJAIG() then
		assert(arg_21_2.isDead ~= nil)

		local var_21_0 = arg_21_2.isDead

		assert(arg_21_2.hasDogtag ~= nil)

		local var_21_1 = arg_21_2.hasDogtag
		local var_21_2 = DataSources.inGame.MP.match.postGameState:GetValue(arg_21_0._controllerIndex)
		local var_21_3 = false
		local var_21_4 = Game.DHEDEIHGF()
		local var_21_5 = Game.DHEDEIHGF(arg_21_0._clientNum)

		if var_21_0 then
			if var_21_1 then
				arg_21_0.scoreboardRow:SetImageTexture(SCOREBOARD.RowImageType.DEATH, SCOREBOARD.RowImageTextureIndexTable.DOGTAGS_MINIMAP_TEXTURE)
			elseif Dvar.CFHDGABACF("scr_player_lastStand") == 2 or Dvar.CFHDGABACF("scr_" .. arg_21_0._gameType .. "_lastStand") then
				if var_21_4 == var_21_5 then
					arg_21_0.scoreboardRow:SetImageTexture(SCOREBOARD.RowImageType.DEATH, SCOREBOARD.RowImageTextureIndexTable.REVIVE_TEXTURE)
				else
					arg_21_0.scoreboardRow:SetImageTexture(SCOREBOARD.RowImageType.DEATH, SCOREBOARD.RowImageTextureIndexTable.DEATH_TEXTURE)
				end
			else
				arg_21_0.scoreboardRow:SetImageTexture(SCOREBOARD.RowImageType.DEATH, SCOREBOARD.RowImageTextureIndexTable.DEATH_TEXTURE)
			end

			var_21_3 = true
		else
			var_21_3 = false

			if CONDITIONS.IsBombGametype() and Game.BFEEGCHICA(arg_21_0._controllerIndex, "ui_bomb_carrier") == arg_21_0._clientNum and var_21_5 == var_21_4 then
				arg_21_0.scoreboardRow:SetImageTexture(SCOREBOARD.RowImageType.DEATH, SCOREBOARD.RowImageTextureIndexTable.BOMB_TEXTURE)

				var_21_3 = true
			end
		end

		if arg_21_0._showPlayerDeathIcon ~= var_21_3 and var_21_2 <= PostGameState.ROUND_END then
			arg_21_0._showPlayerDeathIcon = var_21_3

			arg_21_0.scoreboardRow:SetImageVisibility(SCOREBOARD.RowImageType.DEATH, var_21_3 and 1 or 0)
		end

		if not Dvar.IBEGCHEFE("LPSPMQSNPQ") and not Dvar.IBEGCHEFE("LSTLQTSSRM") and arg_21_3 ~= nil then
			arg_21_0.RankIcon:SetAlpha(0.75)
		else
			arg_21_0.RankIcon:SetAlpha(0)
		end
	end
end

local function var_0_29(arg_22_0, arg_22_1, arg_22_2)
	if not arg_22_0:isInFocus() and arg_22_0._isCurrentPlayer ~= arg_22_0._wasCurrentPlayer then
		(function()
			ACTIONS.AnimateSequence(arg_22_0, "Hide")

			if not Engine.DDJFBBJAIG() then
				arg_22_0.scoreboardRow:SetImageRGBFromTable(SCOREBOARD.RowImageType.PING, SWATCHES.Scoreboard.overText)
			end
		end)()

		arg_22_0._wasCurrentPlayer = arg_22_0._isCurrentPlayer
	end
end

local function var_0_30(arg_24_0, arg_24_1, arg_24_2)
	assert(arg_24_2.name)

	local var_24_0 = arg_24_2.name

	if MLG.FBFGBEC(arg_24_0._controllerIndex) then
		local var_24_1 = CODCASTER_PLAYERLIST.GetCompetitiveName(var_24_0, arg_24_2.clientNum, false)

		if var_24_1 then
			var_24_0 = var_24_1
		end
	end

	local var_24_2 = arg_24_2.clanTag

	if SCOREBOARD.IsAARScoreboard() and var_24_2 and #var_24_2 > 0 then
		local var_24_3 = string.find(var_24_0, "]")

		if var_24_3 then
			local var_24_4 = string.sub(var_24_0, var_24_3 + 1, #var_24_0)

			var_24_0 = "[" .. var_24_2 .. "]" .. var_24_4
		end
	end

	arg_24_0.scoreboardRow:SetFieldAndPosition(var_0_9, var_24_0, var_0_7 * _1080p, LUI.Alignment.Left)
end

local function var_0_31(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0
	local var_25_1 = not Dvar.IBEGCHEFE("LPSPMQSNPQ") and not Dvar.IBEGCHEFE("LSTLQTSSRM")

	var_25_1 = var_25_1 and not CONDITIONS.IsArenaGameType()
	var_25_1 = var_25_1 and not MLG.JIHGCIJCG()

	if var_25_1 then
		local var_25_2
		local var_25_3

		if CONDITIONS.IsCoreMultiplayer() then
			if arg_25_0._isCurrentPlayer then
				var_25_2 = PROGRESSION.GetPlayerRank(arg_25_0._controllerIndex)
				var_25_3 = PROGRESSION.GetRankDisplay(var_25_2)
				var_25_0 = PROGRESSION.GetRankIcon(var_25_2)
			else
				var_25_2 = arg_25_2.rank
				var_25_3 = PROGRESSION.GetRankDisplay(var_25_2)
				var_25_0 = PROGRESSION.GetRankIcon(var_25_2)
			end
		elseif CONDITIONS.IsThirdGameMode() then
			if SCOREBOARD.IsAARScoreboard() then
				var_25_2 = arg_25_2.rank
				var_25_3 = PROGRESSION.GetRankDisplay(var_25_2)
				var_25_0 = PROGRESSION.GetRankIcon(var_25_2, arg_25_2.prestige)
			else
				var_25_2 = Game.BDHJABHDDC(arg_25_0._clientNum)
				var_25_3 = PROGRESSION.GetRankDisplay(var_25_2)
				var_25_0 = PROGRESSION.GetRankIcon(var_25_2)

				DebugPrint("\n ----------------------- CP player rank info: " .. var_25_2 .. " displayRank: " .. var_25_3 .. " rankIcon" .. var_25_0 .. " clientNum" .. arg_25_0._clientNum)
			end
		end

		arg_25_0._isElder = var_25_2 > PROGRESSION.GetMaxRank()

		arg_25_0.scoreboardRow:SetFieldAndPosition(var_0_8, var_25_3, var_0_6 * _1080p, LUI.Alignment.Center)

		if var_25_0 ~= nil then
			arg_25_0.RankIcon:setImage(RegisterMaterial(var_25_0), 0)
			arg_25_0.RankIcon:SetAlpha(0.75)
		else
			arg_25_0.RankIcon:SetAlpha(0)
		end
	else
		arg_25_0.RankIcon:SetAlpha(0)
	end

	return var_25_0
end

local function var_0_32(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	local var_26_0 = SCOREBOARD.GetMaxColumn(arg_26_0._controllerIndex)

	for iter_26_0 = 1, var_26_0 do
		local var_26_1 = SCOREBOARD.GetGameModeFieldName(arg_26_0._controllerIndex, iter_26_0)

		if var_26_1 then
			local var_26_2 = arg_26_2[var_26_1]

			assert(var_26_2)

			local var_26_3 = var_0_11[iter_26_0]
			local var_26_4 = arg_26_3[iter_26_0]

			if type(var_26_2) == "number" then
				arg_26_0.scoreboardRow:SetFieldAndPosition(var_26_3, string.format("%d", var_26_2), var_26_4 * _1080p, LUI.Alignment.Center)
			elseif type(var_26_2) == "string" then
				arg_26_0.scoreboardRow:SetFieldAndPosition(var_26_3, var_26_2, var_26_4 * _1080p, LUI.Alignment.Center)
			end
		end
	end
end

function UpdateVoteCheckMark(arg_27_0, arg_27_1)
	local var_27_0 = Game.BFEEGCHICA(arg_27_0._controllerIndex, "ui_votesys_player" .. arg_27_0._clientNum)

	if var_27_0 ~= nil and var_27_0 == 1 then
		ACTIONS.AnimateSequence(arg_27_0, "RetryMarkOn")
	elseif var_27_0 ~= nil and var_27_0 == 2 then
		ACTIONS.AnimateSequence(arg_27_0, "RetryMarkX")
	elseif var_27_0 ~= nil and var_27_0 == 0 then
		ACTIONS.AnimateSequence(arg_27_0, "RetryHide")
	end
end

function RefreshRowContent(arg_28_0, arg_28_1, arg_28_2)
	assert(arg_28_0._controllerIndex)
	arg_28_0:SetPlayer(arg_28_1, arg_28_2)

	local var_28_0 = SCOREBOARD.IsAARScoreboard()
	local var_28_1

	if arg_28_0._row ~= nil then
		if var_28_0 then
			var_28_1 = PostMatch.DGCJIFGJBD(arg_28_0._controllerIndex, arg_28_0._team)

			if not var_28_1 then
				return
			end

			var_28_1 = var_28_1[arg_28_0._row]
		else
			var_28_1 = var_0_14(arg_28_0, controllerIndex)
		end
	end

	if var_28_1 then
		if CONDITIONS.IsDevelopmentBuild() then
			SCOREBOARD.PrintDebugRowDataString(var_28_1)
		end

		arg_28_0._clientNum = var_28_1.clientNum
		arg_28_0._name = var_28_1.name

		if CONDITIONS.IsCoreMultiplayer() then
			arg_28_0._isBot = var_28_1.isBot or false
		elseif CONDITIONS.IsThirdGameMode() then
			arg_28_0._isBot = false
		end

		arg_28_0._xuid = var_28_1.xuid

		FRIENDS.SetupPlayerContextualMenuOptions(arg_28_0, arg_28_0._controllerIndex, var_0_24)

		if CONDITIONS.IsCoreMultiplayer() and (arg_28_0._gameType == MP.GameMode.HardpointGameType or arg_28_0._gameType == MP.GameMode.TDefGameType or arg_28_0._gameType == MP.GameMode.InfectGameType or arg_28_0._gameType == MP.GameMode.GrndGameType) then
			assert(var_28_1.extraScore0)

			var_28_1.extraScore0 = string.format("%.1d:%.2d", math.floor(var_28_1.extraScore0 / 60 % 60), var_28_1.extraScore0 % 60)
		end

		assert(var_28_1)
		assert(var_28_1.clientNum or var_28_0)
		assert(var_28_1.xuid or not var_28_0)

		arg_28_0._isCrossplayPlayer = var_28_1.isCrossplayPlayer
		arg_28_0._xuid = var_28_1.xuid
		arg_28_0._localClientNum = -1
		arg_28_0._clientNum = -1

		if CONDITIONS.IsCoreMultiplayer() then
			if var_28_0 then
				if not (Engine.JEDFGECDJ() > 1) then
					arg_28_0._isCurrentPlayer = var_28_1.isMe
				else
					arg_28_0._localClientNum = var_28_1.localClientNum and var_28_1.localClientNum or -1
					arg_28_0._isCurrentPlayer = var_28_1.localClientNum ~= -1
				end
			else
				arg_28_0._clientNum = var_28_1.clientNum and var_28_1.clientNum or -1
				arg_28_0._isCurrentPlayer = arg_28_0._clientNum == Game.DBACJGFHDD(arg_28_0._controllerIndex)
			end
		elseif CONDITIONS.IsThirdGameMode() then
			arg_28_0._clientNum = var_28_1.clientNum and var_28_1.clientNum or -1
			arg_28_0._isCurrentPlayer = not var_28_0 and arg_28_0._clientNum == Game.DBACJGFHDD()
		end

		arg_28_0._isCurrentPlayer = arg_28_0._isCurrentPlayer or false

		arg_28_0.scoreboardRow:SetIsPlayer(arg_28_0._isCurrentPlayer, arg_28_0._clientNum, arg_28_0._localClientNum)

		local var_28_2 = 62
		local var_28_3 = 375 + var_28_2
		local var_28_4 = {
			515 + var_28_2,
			655 + var_28_2,
			795 + var_28_2,
			935 + var_28_2
		}

		if not Engine.DDJFBBJAIG() and CONDITIONS.IsArenaGameType() then
			local var_28_5 = 30

			var_28_3 = var_28_5 + 345 + 35

			local var_28_6 = 85

			var_28_4[1] = var_28_3 + var_28_6
			var_28_4[2] = var_28_4[1] + var_28_6
			var_28_4[3] = var_28_4[2] + var_28_6
			var_28_4[4] = var_28_4[3] + var_28_6

			local var_28_7 = 32
			local var_28_8 = var_28_5 + 285

			arg_28_0.scoreboardRow:SetImagePosition(SCOREBOARD.RowImageType.DEATH, _1080p * var_28_8, _1080p * (var_28_8 + var_28_7), _1080p * -16, _1080p * 16)
		end

		if CONDITIONS.IsCoreMultiplayer() then
			assert(var_28_1.kills)
			assert(var_28_1.deaths)

			var_28_1.kdRatio = SCOREBOARD.CalculateKillDeathRatio(var_28_1.kills, var_28_1.deaths)
		end

		local var_28_9

		if not MLG.IsCDLActive(controllerIndex) then
			var_28_9 = var_0_31(arg_28_0, controllerIndex, var_28_1)
		end

		var_0_30(arg_28_0, controllerIndex, var_28_1)
		var_0_29(arg_28_0, controllerIndex, var_28_1)
		var_0_26(arg_28_0, controllerIndex, var_28_1)
		var_0_25(arg_28_0, controllerIndex, var_28_1, var_28_4)

		if CONDITIONS.IsCoreMultiplayer() then
			assert(var_28_1.score)

			local var_28_10 = string.format("%d", var_28_1.score)

			arg_28_0.scoreboardRow:SetFieldAndPosition(var_0_10, var_28_10, var_28_3 * _1080p, LUI.Alignment.Center)
			var_0_32(arg_28_0, controllerIndex, var_28_1, var_28_4)
			var_0_28(arg_28_0, controllerIndex, var_28_1, var_28_9)

			if arg_28_0._gameType == "hvt" or Dvar.IBEGCHEFE("scr_game_inGameLoot") or Dvar.IBEGCHEFE("scr_" .. arg_28_0._gameType .. "_inGameLoot") then
				var_0_21(arg_28_0)
			end
		elseif CONDITIONS.IsThirdGameMode() then
			assert(var_28_1.kills)
			assert(var_28_1.revives)
			assert(var_28_1.downs)

			if var_28_1.kills then
				arg_28_0.scoreboardRow:SetFieldAndPosition(3, string.format("%d", var_28_1.kills), 592 * _1080p, LUI.Alignment.Center)
			end

			if var_28_1.revives then
				arg_28_0.scoreboardRow:SetFieldAndPosition(4, string.format("%d", var_28_1.revives), 717 * _1080p, LUI.Alignment.Center)
			end

			if var_28_1.downs then
				arg_28_0.scoreboardRow:SetFieldAndPosition(5, string.format("%d", var_28_1.downs), 832 * _1080p, LUI.Alignment.Center)
			end
		end
	end

	if CONDITIONS.IsThirdGameMode() and CONDITIONS.InGame() and arg_28_0._voteOmnvarHandler ~= true then
		arg_28_0._voteOmnvarHandler = true

		if arg_28_0._clientNum and arg_28_0._clientNum >= 0 then
			arg_28_0:registerOmnvarHandler("ui_votesys_player" .. arg_28_0._clientNum, function(arg_29_0, arg_29_1)
				UpdateVoteCheckMark(arg_29_0)
			end)
		end
	end

	var_0_15(arg_28_0)
end

local function var_0_33(arg_30_0, arg_30_1)
	local var_30_0 = LUI.UIScoreboardRow.new()

	var_30_0:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -10, _1080p * 10)
	var_30_0:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_30_0:SetAllFieldsColor(GetIntForColor(SWATCHES.Scoreboard.text))
	var_30_0:SetAlignment(LUI.Alignment.Center)
	arg_30_0:addElement(var_30_0)

	arg_30_0.scoreboardRow = var_30_0
end

function PostLoadFunc(arg_31_0, arg_31_1, arg_31_2)
	var_0_33(arg_31_0, arg_31_1)

	arg_31_0._controllerIndex = arg_31_1
	arg_31_0.RefreshRowContent = RefreshRowContent
	arg_31_0.SetPlayer = SetPlayer
	arg_31_0.GetClientNum = GetClientNum
	arg_31_0.IsMyRow = IsMyRow

	if CONDITIONS.IsThirdGameMode() and CONDITIONS.InGame() then
		ACTIONS.AnimateSequence(arg_31_0, "RetryHide")
	end

	local var_31_0 = LUI.UIBindButton.new()

	var_31_0.id = "selfBindButton"

	arg_31_0:addElement(var_31_0)

	arg_31_0.bindButton = var_31_0

	arg_31_0.bindButton:addEventHandler("button_primary", function(arg_32_0, arg_32_1)
		if arg_31_0:isInFocus() and arg_31_0._isBot == false and not arg_31_0._isCurrentPlayer then
			local var_32_0 = SCOREBOARD.IsAARScoreboard()

			if arg_31_0._clientNum and not var_32_0 and not Game.BFEEGCHICA(arg_31_1, "ui_scoreboard_freeze") then
				if arg_31_0._row ~= nil then
					local var_32_1 = var_0_14(arg_31_0, arg_31_1)

					Game.CBEICJFEHB(arg_31_0._clientNum)

					local var_32_2 = arg_31_0:getParent()

					if var_32_2 and (#var_32_2:getAllFocusedChildren() > 0 or var_32_2:isInFocus()) then
						var_0_27(arg_31_0, var_32_2, arg_31_1, var_32_1)
					end
				end

				return true
			elseif arg_31_0._xuid and var_32_0 and Lobby.BBDICGHE() then
				Lobby.CGCFCDJBH(arg_31_1, arg_31_0._xuid)
				arg_31_0:RefreshRowContent(arg_31_0._team, arg_31_0._row)

				return true
			end
		end
	end)
	arg_31_0.bindButton:addEventHandler("button_left", function(arg_33_0, arg_33_1)
		if arg_33_1.qualifier == "dpad" and (#arg_33_0:getParent():getAllFocusedChildren() > 0 or arg_33_0:getParent():isInFocus()) then
			if not arg_31_0._isCrossplayPlayer and Engine.HDGDBCJFG() and not CONDITIONS.IsSystemLink(arg_31_0) and arg_31_0._isBot == false then
				local var_33_0 = SCOREBOARD.IsAARScoreboard()

				if not var_33_0 and arg_31_0._clientNum and not Game.BFEEGCHICA(arg_31_1, "ui_scoreboard_freeze") then
					Engine.BJBCAJFECC(arg_31_1, arg_31_0._clientNum)
				elseif var_33_0 and arg_31_0._xuid then
					Lobby.GICFBJBBJ(arg_31_1, arg_31_0._xuid)
				end
			end

			return true
		end
	end)
	arg_31_0:addEventHandler("button_up", function(arg_34_0, arg_34_1)
		local var_34_0 = arg_31_0._isCurrentPlayer

		arg_31_0.scoreboardRow:SetAlpha(0.8)
		ACTIONS.AnimateSequence(arg_31_0, "ButtonUp")

		if var_34_0 then
			arg_31_0.scoreboardRow:SetAlpha(1, 0)

			if not Engine.DDJFBBJAIG() then
				arg_31_0.scoreboardRow:SetImageRGBFromTable(SCOREBOARD.RowImageType.PING, SWATCHES.Scoreboard.overText)
			end
		else
			ACTIONS.AnimateSequence(arg_31_0, "Hide")

			if not Engine.DDJFBBJAIG() then
				arg_31_0.scoreboardRow:SetImageRGBFromTable(SCOREBOARD.RowImageType.PING, SWATCHES.Scoreboard.overText)
			end
		end

		var_0_15(arg_31_0)

		if not Engine.DDJFBBJAIG() and Engine.EAIICIFIFA() and LUI.PostGameManager.IsPostGame(arg_31_1) then
			arg_31_0:dispatchEventToCurrentMenu({
				name = "row_lose_focus"
			})
		end

		if not Engine.DDJFBBJAIG() and Engine.EAIICIFIFA() then
			local var_34_1 = SCOREBOARD.GetCurrentScoreBoardMenu(arg_34_0, arg_31_1)
			local var_34_2

			if var_34_1 then
				var_34_2 = var_34_1.ButtonHelperBar
			end

			if var_34_2 ~= nil then
				var_34_1:RemoveButtonHelperTextFromElement(var_34_2, "button_dpad_left", "right")
				var_34_1:RemoveButtonHelperTextFromElement(var_34_2, "button_primary", "left")

				if LUI.IsLastInputGamepad(arg_31_1) then
					var_34_1:RemoveButtonHelperTextFromElement(var_34_2, "button_r3", "left")
				end
			end
		end
	end)
	arg_31_0:addEventHandler("button_over", function(arg_35_0, arg_35_1)
		arg_31_0.scoreboardRow:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_31_0, "ButtonOver")
		var_0_15(arg_31_0)

		if not Engine.DDJFBBJAIG() then
			arg_31_0.scoreboardRow:SetImageRGBFromTable(SCOREBOARD.RowImageType.PING, SWATCHES.Scoreboard.secondPlace)
		end

		local var_35_0 = SCOREBOARD.GetCurrentScoreBoardMenu(arg_35_0, arg_31_1)
		local var_35_1

		if var_35_0 then
			if SCOREBOARD.IsAARScoreboard() and CONDITIONS.IsCoreMultiplayer() then
				local var_35_2 = arg_31_0

				while var_35_2 ~= nil and var_35_2.id ~= "AARTeamScoreboard" do
					var_35_2 = var_35_2:getParent()
				end

				if var_35_2 then
					var_35_1 = var_35_2.ButtonHelperBar
				end
			else
				var_35_1 = var_35_0.ButtonHelperBar
			end
		end

		if not Engine.DDJFBBJAIG() and Engine.EAIICIFIFA() and LUI.PostGameManager.IsPostGame(arg_31_1) then
			arg_31_0:dispatchEventToCurrentMenu({
				name = "row_gain_focus"
			})
		end

		if var_35_1 ~= nil then
			local var_35_3 = arg_31_0._isCurrentPlayer == true

			if arg_31_0._isBot == true then
				var_35_0:RemoveButtonHelperTextFromElement(var_35_1, "button_primary", "right")
				var_35_0:RemoveButtonHelperTextFromElement(var_35_1, "button_dpad_left", "right")

				if LUI.IsLastInputGamepad(arg_31_1) then
					var_35_0:RemoveButtonHelperTextFromElement(var_35_1, "button_r3", "right")
				end
			else
				if not arg_31_0._isCrossplayPlayer and not CONDITIONS.IsSystemLink(arg_31_0) and not Engine.CGABICJHAI() and not Engine.DDJFBBJAIG() then
					local var_35_4 = "left"

					if not Engine.DDJFBBJAIG() then
						var_35_4 = Engine.EAIICIFIFA() and not LUI.PostGameManager.IsPostGame(arg_31_1) and "left" or "right"
					end

					var_35_0:AddButtonHelperTextToElement(var_35_1, {
						priority = 1,
						gamepad_only = true,
						button_ref = "button_dpad_left",
						helper_text = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE"),
						side = var_35_4
					})
				else
					var_35_0:RemoveButtonHelperTextFromElement(var_35_1, "button_dpad_left", "right")
				end

				if LUI.IsLastInputGamepad(arg_31_1) or CONDITIONS.IsGamepadEnabled() then
					if Engine.CJJAFGIFAC(arg_31_1) and var_35_3 ~= true then
						local var_35_5 = "left"

						if not Engine.DDJFBBJAIG() then
							var_35_0:AddButtonHelperTextToElement(var_35_1, {
								priority = 3,
								gamepad_only = true,
								button_ref = "button_r3",
								helper_text = Engine.CBBHFCGDIC("MENU/REPORT_PLAYER"),
								side = var_35_5
							})
						end
					else
						var_35_0:RemoveButtonHelperTextFromElement(var_35_1, "button_r3", "right")
					end
				end

				local var_35_6 = true
				local var_35_7 = true

				if SCOREBOARD.IsAARScoreboard() then
					var_35_6 = Lobby.BBDICGHE()
				elseif arg_31_0._clientNum ~= nil then
					var_35_7 = Game.CJHJAFIEFF(arg_31_0._clientNum)
				end

				if var_35_3 ~= true and var_35_6 == true and var_35_7 == true and not Engine.DDJFBBJAIG() then
					var_35_0:AddButtonHelperTextToElement(var_35_1, {
						priority = 2,
						ignoreTooltip = true,
						button_ref = "button_primary",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/MUTE_UNMUTE"),
						side = Engine.EAIICIFIFA() and not LUI.PostGameManager.IsPostGame(arg_31_1) and "left" or "right"
					})
				elseif var_35_3 ~= true and var_35_6 == true and var_35_7 == true and Engine.DDJFBBJAIG() and not SCOREBOARD.IsAARScoreboard() then
					var_35_0:AddButtonHelperTextToElement(var_35_1, {
						side = "left",
						priority = 2,
						ignoreTooltip = true,
						button_ref = "button_primary",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/MUTE_UNMUTE")
					})
				else
					var_35_0:RemoveButtonHelperTextFromElement(var_35_1, "button_primary", "left")
				end
			end
		end

		local var_35_8 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.maxCount"):GetValue(arg_31_1)

		if SCOREBOARD.IsAARScoreboard() then
			if not Engine.DDJFBBJAIG() then
				arg_31_0.scoreboardRow:SetImageRGBFromTable(SCOREBOARD.RowImageType.PING, SWATCHES.Scoreboard.overText)
			else
				arg_31_0.scoreboardRow:SetImageVisibility(SCOREBOARD.RowImageType.PING, 0)
			end
		end
	end)

	arg_31_0.isFriendly = arg_31_2.isFriendly
	arg_31_0.isEnemy = arg_31_2.isEnemy

	var_0_22(arg_31_0, arg_31_1)
	var_0_23(arg_31_0, arg_31_1)
	arg_31_0.bindButton:addEventHandler("button_right", function(arg_36_0, arg_36_1)
		if arg_31_0:isInFocus() then
			arg_31_0:RefreshRowContent(arg_31_0._team, arg_31_0._row)
		end
	end)
	arg_31_0.bindButton:addEventHandler("button_right_stick", function(arg_37_0, arg_37_1)
		if LUI.IsLastInputGamepad(arg_31_1) then
			if arg_31_0:isInFocus() and arg_31_0._isBot == false and not arg_31_0._isCurrentPlayer then
				local var_37_0 = Game.GJIIJAFBI(arg_31_0._clientNum)

				LUI.FlowManager.RequestPopupMenu(nil, "ReportPlayer", true, arg_31_0._controllerIndex, false, {
					xuid = var_37_0
				})
			end
		else
			arg_31_0:RefreshRowContent(arg_31_0._team, arg_31_0._row)
		end
	end)
	arg_31_0:setGainFocusSFX(nil)
	arg_31_0:addEventHandler("open_scoreboard", function(arg_38_0, arg_38_1)
		arg_31_0:setGainFocusSFX(SCOREBOARD.GainFocusSFX)
	end)
	arg_31_0:addEventHandler("close_scoreboard", function(arg_39_0, arg_39_1)
		arg_31_0:setGainFocusSFX(nil)
	end)
	var_0_15(arg_31_0)
	arg_31_0.scoreboardRow:SetAlpha(0.8)
end

function ScoreboardRow(arg_40_0, arg_40_1)
	local var_40_0 = LUI.UIButton.new()

	var_40_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1072 * _1080p, 0, 28 * _1080p)

	var_40_0.id = "ScoreboardRow"
	var_40_0._animationSets = var_40_0._animationSets or {}
	var_40_0._sequences = var_40_0._sequences or {}

	local var_40_1 = arg_40_1 and arg_40_1.controllerIndex

	if not var_40_1 and not Engine.DDJFBBJAIG() then
		var_40_1 = var_40_0:getRootController()
	end

	assert(var_40_1)

	local var_40_2 = var_40_0
	local var_40_3

	if not CONDITIONS.IsSplitscreen(var_40_0) then
		local var_40_4 = LUI.UIImage.new()

		var_40_4.id = "TextGlow"

		var_40_4:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
		var_40_4:SetAlpha(0, 0)
		var_40_4:SetPixelGridEnabled(true)
		var_40_4:SetPixelGridContrast(0.5, 0)
		var_40_4:SetPixelGridBlockWidth(2, 0)
		var_40_4:SetPixelGridBlockHeight(2, 0)
		var_40_4:SetPixelGridGutterWidth(1, 0)
		var_40_4:SetPixelGridGutterHeight(1, 0)
		var_40_4:setImage(RegisterMaterial("button_glow_circle"), 0)
		var_40_4:Setup3SliceHorizontalImage(_1080p * 12, 0.1)
		var_40_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -365, _1080p * -16, _1080p * 16)
		var_40_0:addElement(var_40_4)

		var_40_0.TextGlow = var_40_4
	end

	local var_40_5

	if not CONDITIONS.IsSplitscreen(var_40_0) then
		var_40_5 = LUI.UIImage.new()
		var_40_5.id = "Highlight"

		var_40_5:SetRGBFromTable(SWATCHES.genericButton.background, 0)
		var_40_5:SetAlpha(0, 0)
		var_40_0:addElement(var_40_5)

		var_40_0.Highlight = var_40_5
	end

	local var_40_6
	local var_40_7 = LUI.UIImage.new()

	var_40_7.id = "TextureLayer"

	var_40_7:SetAlpha(0, 0)
	var_40_7:SetPixelGridEnabled(true)
	var_40_7:SetPixelGridContrast(0.8, 0)
	var_40_7:SetPixelGridBlockWidth(2, 0)
	var_40_7:SetPixelGridBlockHeight(2, 0)
	var_40_7:SetPixelGridGutterWidth(1, 0)
	var_40_7:SetPixelGridGutterHeight(1, 0)
	var_40_7:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_40_7:Setup9SliceImage(_1080p * 89, _1080p * 0, 0.48, 0)
	var_40_0:addElement(var_40_7)

	var_40_0.TextureLayer = var_40_7

	local var_40_8
	local var_40_9 = LUI.UIImage.new()

	var_40_9.id = "RankIcon"

	var_40_9:SetAlpha(0, 0)
	var_40_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 36, _1080p * 62, _1080p * -13, _1080p * 13)
	var_40_0:addElement(var_40_9)

	var_40_0.RankIcon = var_40_9

	local var_40_10
	local var_40_11 = LUI.UIImage.new()

	var_40_11.id = "Glow"

	var_40_11:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_40_11:SetAlpha(0, 0)
	var_40_11:SetPixelGridEnabled(true)
	var_40_11:SetPixelGridContrast(0.5, 0)
	var_40_11:SetPixelGridBlockWidth(2, 0)
	var_40_11:SetPixelGridBlockHeight(2, 0)
	var_40_11:SetPixelGridGutterWidth(1, 0)
	var_40_11:SetPixelGridGutterHeight(1, 0)
	var_40_11:setImage(RegisterMaterial("button_glow"), 0)
	var_40_11:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_40_11:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
	var_40_0:addElement(var_40_11)

	var_40_0.Glow = var_40_11

	local var_40_12
	local var_40_13 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_40_14 = LUI.UIBorder.new(var_40_13)

	var_40_14.id = "Line"

	var_40_14:SetAlpha(0, 0)
	var_40_14:SetBorderThicknessLeft(_1080p * 0, 0)
	var_40_14:SetBorderThicknessRight(_1080p * 0, 0)
	var_40_0:addElement(var_40_14)

	var_40_0.Line = var_40_14

	local var_40_15

	if CONDITIONS.IsThirdGameMode(var_40_0) then
		var_40_15 = LUI.UIImage.new()
		var_40_15.id = "RetryMark"

		var_40_15:SetAlpha(0, 0)
		var_40_15:setImage(RegisterMaterial("hud_check"), 0)
		var_40_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -15, _1080p * 17, _1080p * -2, _1080p * 30)
		var_40_0:addElement(var_40_15)

		var_40_0.RetryMark = var_40_15
	end

	local var_40_16
	local var_40_17 = LUI.UIText.new()

	var_40_17.id = "RetryNo"

	var_40_17:SetRGBFromInt(15356755, 0)
	var_40_17:SetAlpha(0, 0)
	var_40_17:SetScale(-0.14, 0)
	var_40_17:setText("X", 0)
	var_40_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_40_17:SetAlignment(LUI.Alignment.Center)
	var_40_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -18, _1080p * 20, _1080p * -4, _1080p * 32)
	var_40_0:addElement(var_40_17)

	var_40_0.RetryNo = var_40_17

	local function var_40_18()
		return
	end

	var_40_0._sequences.DefaultSequence = var_40_18

	local var_40_19

	if not CONDITIONS.IsSplitscreen(var_40_0) then
		local var_40_20 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0.5,
				duration = 750,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0.6,
				duration = 750,
				property = TWEEN_PROPERTY.Alpha,
				easing = LUI.EASING.outQuadratic
			}
		}

		var_40_5:RegisterAnimationSequence("Pulse", var_40_20)
	end

	local function var_40_21()
		if not CONDITIONS.IsSplitscreen(var_40_0) then
			var_40_5:AnimateLoop("Pulse")
		end
	end

	var_40_0._sequences.Pulse = var_40_21

	local var_40_22

	if not CONDITIONS.IsSplitscreen(var_40_0) then
		local var_40_23 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_40_5:RegisterAnimationSequence("Hide", var_40_23)
	end

	local function var_40_24()
		if not CONDITIONS.IsSplitscreen(var_40_0) then
			var_40_5:AnimateSequence("Hide")
		end
	end

	var_40_0._sequences.Hide = var_40_24

	local var_40_25

	if not CONDITIONS.IsSplitscreen(var_40_0) then
		local var_40_26 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_40_5:RegisterAnimationSequence("ButtonOver", var_40_26)
	end

	local var_40_27 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("hud_white_fill_scope")
		}
	}

	var_40_7:RegisterAnimationSequence("ButtonOver", var_40_27)

	local var_40_28 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_40_11:RegisterAnimationSequence("ButtonOver", var_40_28)

	local var_40_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_40_14:RegisterAnimationSequence("ButtonOver", var_40_29)

	local function var_40_30()
		if not CONDITIONS.IsSplitscreen(var_40_0) then
			var_40_5:AnimateSequence("ButtonOver")
		end

		var_40_7:AnimateSequence("ButtonOver")
		var_40_11:AnimateSequence("ButtonOver")
		var_40_14:AnimateSequence("ButtonOver")
	end

	var_40_0._sequences.ButtonOver = var_40_30

	local var_40_31

	if not CONDITIONS.IsSplitscreen(var_40_0) then
		local var_40_32 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_40_5:RegisterAnimationSequence("ButtonUp", var_40_32)
	end

	local var_40_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_40_7:RegisterAnimationSequence("ButtonUp", var_40_33)

	local var_40_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_40_11:RegisterAnimationSequence("ButtonUp", var_40_34)

	local var_40_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_40_14:RegisterAnimationSequence("ButtonUp", var_40_35)

	local function var_40_36()
		if not CONDITIONS.IsSplitscreen(var_40_0) then
			var_40_5:AnimateSequence("ButtonUp")
		end

		var_40_7:AnimateSequence("ButtonUp")
		var_40_11:AnimateSequence("ButtonUp")
		var_40_14:AnimateSequence("ButtonUp")
	end

	var_40_0._sequences.ButtonUp = var_40_36

	local var_40_37

	if CONDITIONS.IsThirdGameMode(var_40_0) then
		local var_40_38 = {
			{
				value = 2,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = -0.25,
				duration = 100,
				property = TWEEN_PROPERTY.Scale
			},
			{
				value = 1,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_40_15:RegisterAnimationSequence("RetryMarkOn", var_40_38)
	end

	local function var_40_39()
		if CONDITIONS.IsThirdGameMode(var_40_0) then
			var_40_15:AnimateSequence("RetryMarkOn")
		end
	end

	var_40_0._sequences.RetryMarkOn = var_40_39

	local var_40_40
	local var_40_41 = {
		{
			value = 1.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_40_17:RegisterAnimationSequence("RetryMarkX", var_40_41)

	local function var_40_42()
		var_40_17:AnimateSequence("RetryMarkX")
	end

	var_40_0._sequences.RetryMarkX = var_40_42

	local var_40_43

	if CONDITIONS.IsThirdGameMode(var_40_0) then
		local var_40_44 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_40_15:RegisterAnimationSequence("RetryHide", var_40_44)
	end

	local var_40_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_40_17:RegisterAnimationSequence("RetryHide", var_40_45)

	local function var_40_46()
		if CONDITIONS.IsThirdGameMode(var_40_0) then
			var_40_15:AnimateSequence("RetryHide")
		end

		var_40_17:AnimateSequence("RetryHide")
	end

	var_40_0._sequences.RetryHide = var_40_46

	PostLoadFunc(var_40_0, var_40_1, arg_40_1)

	return var_40_0
end

MenuBuilder.registerType("ScoreboardRow", ScoreboardRow)
LockTable(_M)
