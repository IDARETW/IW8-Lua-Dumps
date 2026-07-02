module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Player:SetRGBFromTable(arg_1_1)
	arg_1_0.Kills:SetRGBFromTable(arg_1_1)
	arg_1_0.Revives:SetRGBFromTable(arg_1_1)
	arg_1_0.Downs:SetRGBFromTable(arg_1_1)

	if Engine.CGABICJHAI() then
		arg_1_0.Ping:SetRGBFromTable(arg_1_1)
	end
end

local function var_0_1(arg_2_0)
	var_0_0(arg_2_0, SWATCHES.Scoreboard.text)

	if arg_2_0:isInFocus() then
		var_0_0(arg_2_0, SWATCHES.Scoreboard.friendlyTeam)
		arg_2_0.Glow:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)
		arg_2_0.TextureLayer:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)
		arg_2_0.Line:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam)

		if arg_2_0._isCurrentPlayer then
			var_0_0(arg_2_0, SWATCHES.Scoreboard.highlight)
		end
	elseif arg_2_0._isCurrentPlayer then
		var_0_0(arg_2_0, SWATCHES.Scoreboard.highlight)
	end
end

function UpdateVoteCheckMark(arg_3_0, arg_3_1)
	local var_3_0 = Game.BFEEGCHICA(arg_3_0._controllerIndex, "ui_votesys_player" .. arg_3_0._clientNum)

	if var_3_0 ~= nil and var_3_0 == 1 then
		ACTIONS.AnimateSequence(arg_3_0, "RetryMarkOn")
	elseif var_3_0 ~= nil and var_3_0 == 2 then
		ACTIONS.AnimateSequence(arg_3_0, "RetryMarkX")
	end
end

function RefreshRowContent(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:SetPlayer(arg_4_1, arg_4_2)
	assert(arg_4_0.Player)
	assert(arg_4_0.Kills)
	assert(arg_4_0.Revives)
	assert(arg_4_0.Downs)
	assert(arg_4_0._controllerIndex)

	local var_4_0 = SCOREBOARD.IsAARScoreboard()
	local var_4_1

	if var_4_0 then
		var_4_1 = PostMatch.DGCJIFGJBD(arg_4_0._controllerIndex, arg_4_0._team)

		if not var_4_1 then
			return
		end

		var_4_1 = var_4_1[arg_4_0._row]
	else
		var_4_1 = Game.DJHFHAFJJE(arg_4_0._row)
	end

	if var_4_1 then
		arg_4_0._xuid = var_4_1.xuid

		local function var_4_2()
			assert(arg_4_0._controllerIndex)

			local var_5_0 = var_4_1.clientNum
			local var_5_1 = SCOREBOARD.IsAARScoreboard()
			local var_5_2
			local var_5_3

			if not var_5_1 then
				var_5_3 = Game.BBCDHAEBHD(var_5_0)
				var_5_2 = Game.GJIIJAFBI(var_5_0)
			else
				var_5_3 = var_4_1.xuid
				var_5_2 = Friends.CAIJHBHGGC(var_5_3)
			end

			assert(var_5_2)
			assert(var_5_3)

			return {
				isCP = true,
				clientNum = var_5_0,
				gamertag = var_4_1.fullNameWithHash or var_4_1.name,
				xuid = var_5_2,
				xuidString = var_5_3,
				controllerIndex = arg_4_0._controllerIndex,
				getButtonsCallback = function(arg_6_0)
					return (FRIENDS.GetScoreboardActions(arg_6_0))
				end,
				isAAR = var_5_1
			}
		end

		FRIENDS.SetupPlayerContextualMenuOptions(arg_4_0, arg_4_0._controllerIndex, var_4_2)
		assert(var_4_1)
		assert(var_4_1.clientNum)
		assert(var_4_1.fullNameWithHash or var_4_1.name)
		assert(var_4_1.kills)
		assert(var_4_1.revives)
		assert(var_4_1.downs)
		assert(var_4_1.isMicOn ~= nil)
		assert(var_4_1.isMuted ~= nil)

		arg_4_0._clientNum = var_4_1.clientNum

		arg_4_0.RankIcon:SetAlpha(0, 0)
		arg_4_0.RankDisplay:SetAlpha(0, 0)

		if arg_4_0._clientNum then
			assert(arg_4_0.RankIcon)
			assert(arg_4_0.RankDisplay)

			local var_4_3 = ""
			local var_4_4 = ""

			if arg_4_0._clientNum >= 0 then
				if var_4_0 then
					local var_4_5 = tonumber(var_4_1.rank) or 0
					local var_4_6 = PROGRESSION.GetPlayerProgressionData({
						_combinedRankNum = var_4_5,
						_prestigeLevel = var_4_1.prestige
					})

					var_4_3 = var_4_6._rankDisplay
					var_4_4 = var_4_6._rankIcon

					arg_4_0.RankIcon:setImage(RegisterMaterial(var_4_4), 0)
				else
					var_4_3 = Game.BAJEAFFCGG(arg_4_0._clientNum)
					var_4_4 = Game.HGEFIIJID(arg_4_0._clientNum)
				end
			end

			if not CONDITIONS.IsSystemLink(arg_4_0) then
				if var_4_3 and var_4_4 and var_4_3 ~= "" and var_4_4 ~= "" then
					arg_4_0.RankIcon:setImage(RegisterMaterial(var_4_4), 0)
					arg_4_0.RankDisplay:setText(var_4_3)
				end

				ACTIONS.AnimateSequence(arg_4_0, "RankShow")
			else
				ACTIONS.AnimateSequence(arg_4_0, "RankHide")
			end

			if arg_4_0._voteOmnvarHandler ~= true then
				arg_4_0._voteOmnvarHandler = true

				arg_4_0:registerOmnvarHandler("ui_votesys_player" .. arg_4_0._clientNum, function(arg_7_0, arg_7_1)
					UpdateVoteCheckMark(arg_7_0)
				end)
			end
		end

		arg_4_0.Player:setText(var_4_1.fullNameWithHash or var_4_1.name)
		arg_4_0.Kills:setText(var_4_1.kills)
		arg_4_0.Revives:setText(var_4_1.revives)
		arg_4_0.Downs:setText(var_4_1.downs)

		if Engine.CGABICJHAI() and not arg_4_0._isPostMatchScreen and not Engine.DDJFBBJAIG() and var_4_1.ping then
			arg_4_0.Ping:setText(var_4_1.ping)
		end

		arg_4_0._isCurrentPlayer = not var_4_0 and arg_4_0._clientNum == Game.DBACJGFHDD()

		var_0_1(arg_4_0)

		local var_4_7 = var_4_1.isMuted and "icon_mic_muted" or "icon_mic_talking"

		arg_4_0.Speaker:setImage(RegisterMaterial(var_4_7))
		assert(var_4_1.isMicOn ~= nil)
		assert(var_4_1.isMuted ~= nil)

		local var_4_8
		local var_4_9 = (var_4_1.isMicOn or var_4_1.isMuted) and "MicOn" or "MicOff"

		if arg_4_0._micAnim ~= var_4_9 then
			ACTIONS.AnimateSequence(arg_4_0, var_4_9)

			arg_4_0._micAnim = var_4_9
		end
	end
end

function SetPlayer(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._team = arg_8_1
	arg_8_0._row = arg_8_2
end

function GetClientNum(arg_9_0)
	return arg_9_0._clientNum
end

function IsMyRow(arg_10_0)
	return arg_10_0._isCurrentPlayer
end

local function var_0_2(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.scoreboardRow = arg_11_0
	arg_11_0._controllerIndex = arg_11_1
	arg_11_0.RefreshRowContent = RefreshRowContent
	arg_11_0.SetPlayer = SetPlayer
	arg_11_0.GetClientNum = GetClientNum
	arg_11_0.IsMyRow = IsMyRow
	arg_11_0._voteOmnvarHandler = false

	local var_11_0 = LUI.UIBindButton.new()

	var_11_0.id = "bindButton"

	arg_11_0:addElement(var_11_0)

	arg_11_0.bindButton = var_11_0

	local var_11_1 = LUI.UIBindButton.new()

	var_11_1.id = "selfBindButton"

	arg_11_0:addElement(var_11_1)

	arg_11_0.bindButton = var_11_1

	arg_11_0.bindButton:addEventHandler("button_primary", function(arg_12_0, arg_12_1)
		if arg_11_0:isInFocus() and (not LUI.ScoreboardLayer or not LUI.ScoreboardLayer:IsShowingCPMap()) and not arg_11_0._isCurrentPlayer then
			local var_12_0 = SCOREBOARD.IsAARScoreboard()

			if arg_11_0._clientNum and not var_12_0 then
				Game.CBEICJFEHB(arg_11_0._clientNum)
				arg_11_0:RefreshRowContent(arg_11_0._team, arg_11_0._row)

				return true
			elseif arg_11_0._xuid and var_12_0 and Lobby.BBDICGHE() then
				Lobby.CGCFCDJBH(arg_11_1, arg_11_0._xuid)
				arg_11_0:RefreshRowContent(arg_11_0._team, arg_11_0._row)

				return true
			end
		end
	end)
	arg_11_0.bindButton:addEventHandler("button_left", function(arg_13_0, arg_13_1)
		if arg_13_1.qualifier == "dpad" and (not LUI.ScoreboardLayer or not LUI.ScoreboardLayer:IsShowingCPMap()) and (#arg_13_0:getParent():getAllFocusedChildren() > 0 or arg_13_0:getParent():isInFocus()) then
			if (Engine.HDGDBCJFG() or Engine.EAABDHIDFJ() or Engine.BEFACAIFDD()) and not CONDITIONS.IsSystemLink(arg_11_0) then
				local var_13_0 = SCOREBOARD.IsAARScoreboard()

				if not var_13_0 and arg_11_0._clientNum then
					Engine.BJBCAJFECC(arg_11_0._controllerIndex, arg_11_0._clientNum)
				elseif var_13_0 and arg_11_0._xuid then
					Lobby.GICFBJBBJ(arg_11_1, arg_11_0._xuid)
				end
			end

			return true
		end
	end)
	arg_11_0:addEventHandler("button_up", function()
		var_0_1(arg_11_0)

		local var_14_0 = arg_11_0._isCurrentPlayer

		arg_11_0.Speaker:SetRGBFromInt(16777215, 0)
		arg_11_0.scoreboardRow:SetAlpha(0.8)
		ACTIONS.AnimateSequence(arg_11_0, "ButtonUp")

		if var_14_0 then
			arg_11_0.scoreboardRow:SetAlpha(1, 0)
		else
			ACTIONS.AnimateSequence(arg_11_0, "Hide")
		end
	end)
	arg_11_0:addEventHandler("button_over", function(arg_15_0, arg_15_1)
		var_0_1(arg_11_0)
		arg_11_0.scoreboardRow:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_11_0, "ButtonOver")

		local var_15_0 = SCOREBOARD.GetCurrentScoreBoardMenu(arg_15_0, arg_11_1)

		if var_15_0 ~= nil and var_15_0.ButtonHelperBar ~= nil and (not LUI.ScoreboardLayer or not LUI.ScoreboardLayer:IsShowingCPMap()) then
			var_15_0:AddButtonHelperTextToElement(var_15_0.ButtonHelperBar, {
				clickable = false,
				priority = 0,
				side = "left",
				gamepad_only = true,
				button_ref = "button_select",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLOSE")
			})

			local var_15_1 = arg_11_0._isCurrentPlayer == true

			if arg_11_0._isBot == true then
				var_15_0:RemoveButtonHelperTextFromElement(var_15_0.ButtonHelperBar, "button_primary", SCOREBOARD.IsAARScoreboard() and "right" or "left")
				var_15_0:RemoveButtonHelperTextFromElement(var_15_0.ButtonHelperBar, "button_dpad_left", SCOREBOARD.IsAARScoreboard() and "right" or "left")
			else
				if not CONDITIONS.IsSystemLink(arg_11_0) and (Engine.HDGDBCJFG() or Engine.EAABDHIDFJ()) and not LUI.ScoreboardLayer:IsShowingCPMap() then
					var_15_0:AddButtonHelperTextToElement(var_15_0.ButtonHelperBar, {
						clickable = false,
						priority = 1,
						side = "left",
						gamepad_only = true,
						button_ref = "button_dpad_left",
						helper_text = Engine.CBBHFCGDIC("XBOXLIVE/VIEW_PROFILE")
					})
				else
					var_15_0:RemoveButtonHelperTextFromElement(var_15_0.ButtonHelperBar, "button_dpad_left", SCOREBOARD.IsAARScoreboard() and "right" or "left")
				end

				local var_15_2 = true
				local var_15_3 = true

				if SCOREBOARD.IsAARScoreboard() then
					var_15_2 = Lobby.BBDICGHE()
				elseif arg_11_0._clientNum ~= nil then
					var_15_3 = Game.CJHJAFIEFF(arg_11_0._clientNum)
				end

				if var_15_1 ~= true and var_15_2 == true and var_15_3 == true then
					var_15_0:AddButtonHelperTextToElement(var_15_0.ButtonHelperBar, {
						clickable = false,
						priority = 2,
						side = "left",
						gamepad_only = true,
						button_ref = "button_primary",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/MUTE_UNMUTE")
					})
				else
					var_15_0:RemoveButtonHelperTextFromElement(var_15_0.ButtonHelperBar, "button_primary", SCOREBOARD.IsAARScoreboard() and "right" or "left")
				end
			end
		end

		local var_15_4 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.maxCount"):GetValue(arg_11_1)
	end)
	arg_11_0:setGainFocusSFX(nil)

	if Engine.CGABICJHAI() then
		arg_11_0:addEventHandler("post_match_screen_notify", function(arg_16_0, arg_16_1)
			arg_11_0._isPostMatchScreen = true

			arg_11_0.Ping:SetAlpha(0)
		end)

		if SCOREBOARD.IsAARScoreboard() then
			ACTIONS.AnimateSequence(arg_11_0, "isConsole")
		else
			ACTIONS.AnimateSequence(arg_11_0, "isPC")
		end
	else
		ACTIONS.AnimateSequence(arg_11_0, "isConsole")
	end

	arg_11_0:addEventHandler("open_scoreboard", function(arg_17_0, arg_17_1)
		arg_11_0:setGainFocusSFX(SCOREBOARD.GainFocusSFX)
	end)
	arg_11_0:addEventHandler("close_scoreboard", function(arg_18_0, arg_18_1)
		arg_11_0:setGainFocusSFX(nil)
	end)
	var_0_1(arg_11_0)
end

function CPScoreboardRow(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIButton.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 980 * _1080p, 0, 28 * _1080p)

	var_19_0.id = "CPScoreboardRow"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = LUI.UIImage.new()

	var_19_4.id = "Highlight"

	var_19_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_19_4:SetAlpha(0, 0)
	var_19_0:addElement(var_19_4)

	var_19_0.Highlight = var_19_4

	local var_19_5
	local var_19_6 = LUI.UIImage.new()

	var_19_6.id = "TextureLayer"

	var_19_6:SetAlpha(0, 0)
	var_19_6:SetPixelGridEnabled(true)
	var_19_6:SetPixelGridContrast(0.8, 0)
	var_19_6:SetPixelGridBlockWidth(2, 0)
	var_19_6:SetPixelGridBlockHeight(2, 0)
	var_19_6:SetPixelGridGutterWidth(1, 0)
	var_19_6:SetPixelGridGutterHeight(1, 0)
	var_19_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_19_6:Setup9SliceImage(_1080p * 89, _1080p * 0, 0.48, 0)
	var_19_0:addElement(var_19_6)

	var_19_0.TextureLayer = var_19_6

	local var_19_7
	local var_19_8 = LUI.UIImage.new()

	var_19_8.id = "Glow"

	var_19_8:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_19_8:SetAlpha(0, 0)
	var_19_8:SetPixelGridEnabled(true)
	var_19_8:SetPixelGridContrast(0.5, 0)
	var_19_8:SetPixelGridBlockWidth(2, 0)
	var_19_8:SetPixelGridBlockHeight(2, 0)
	var_19_8:SetPixelGridGutterWidth(1, 0)
	var_19_8:SetPixelGridGutterHeight(1, 0)
	var_19_8:setImage(RegisterMaterial("button_glow"), 0)
	var_19_8:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_19_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
	var_19_0:addElement(var_19_8)

	var_19_0.Glow = var_19_8

	local var_19_9
	local var_19_10 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_19_11 = LUI.UIBorder.new(var_19_10)

	var_19_11.id = "Line"

	var_19_11:SetAlpha(0, 0)
	var_19_11:SetBorderThicknessLeft(_1080p * 0, 0)
	var_19_11:SetBorderThicknessRight(_1080p * 0, 0)
	var_19_0:addElement(var_19_11)

	var_19_0.Line = var_19_11

	local var_19_12
	local var_19_13 = LUI.UIText.new()

	var_19_13.id = "Player"

	var_19_13:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_19_13:setText("", 0)
	var_19_13:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_19_13:SetAlignment(LUI.Alignment.Left)
	var_19_13:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_13:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 120, _1080p * 690, _1080p * -11, _1080p * 11)
	var_19_0:addElement(var_19_13)

	var_19_0.Player = var_19_13

	local var_19_14
	local var_19_15 = LUI.UIText.new()

	var_19_15.id = "Kills"

	var_19_15:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_19_15:setText("", 0)
	var_19_15:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_19_15:SetAlignment(LUI.Alignment.Center)
	var_19_15:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_15:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 551, _1080p * 651, _1080p * -11, _1080p * 11)
	var_19_0:addElement(var_19_15)

	var_19_0.Kills = var_19_15

	local var_19_16
	local var_19_17 = LUI.UIText.new()

	var_19_17.id = "Revives"

	var_19_17:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_19_17:setText("", 0)
	var_19_17:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_19_17:SetAlignment(LUI.Alignment.Center)
	var_19_17:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_17:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 671, _1080p * 771, _1080p * -11, _1080p * 11)
	var_19_0:addElement(var_19_17)

	var_19_0.Revives = var_19_17

	local var_19_18
	local var_19_19 = LUI.UIText.new()

	var_19_19.id = "Downs"

	var_19_19:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_19_19:setText("", 0)
	var_19_19:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_19_19:SetAlignment(LUI.Alignment.Center)
	var_19_19:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_19:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 791, _1080p * 891, _1080p * -11, _1080p * 11)
	var_19_0:addElement(var_19_19)

	var_19_0.Downs = var_19_19

	local var_19_20
	local var_19_21 = LUI.UIImage.new()

	var_19_21.id = "Speaker"

	var_19_21:SetAlpha(0, 0)
	var_19_21:setImage(RegisterMaterial("icon_mic_talking"), 0)
	var_19_21:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16)
	var_19_0:addElement(var_19_21)

	var_19_0.Speaker = var_19_21

	local var_19_22
	local var_19_23 = LUI.UIImage.new()

	var_19_23.id = "RankIcon"

	var_19_23:SetAlpha(0, 0)
	var_19_23:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 38, _1080p * 70, _1080p * -16, _1080p * 16)
	var_19_0:addElement(var_19_23)

	var_19_0.RankIcon = var_19_23

	local var_19_24
	local var_19_25 = LUI.UIText.new()

	var_19_25.id = "RankDisplay"

	var_19_25:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_19_25:SetAlpha(0, 0)
	var_19_25:setText("---", 0)
	var_19_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_25:SetWordWrap(false)
	var_19_25:SetAlignment(LUI.Alignment.Center)
	var_19_25:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_25:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 75, _1080p * 115, _1080p * -12, _1080p * 12)
	var_19_0:addElement(var_19_25)

	var_19_0.RankDisplay = var_19_25

	local var_19_26

	if CONDITIONS.IsPC(var_19_0) then
		local var_19_27 = LUI.UIText.new()

		var_19_27.id = "Ping"

		var_19_27:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
		var_19_27:setText("", 0)
		var_19_27:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
		var_19_27:SetAlignment(LUI.Alignment.Center)
		var_19_27:SetOptOutRightToLeftAlignmentFlip(true)
		var_19_27:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 915, _1080p * 1015, _1080p * -11, _1080p * 11)
		var_19_0:addElement(var_19_27)

		var_19_0.Ping = var_19_27
	end

	local var_19_28
	local var_19_29 = LUI.UIImage.new()

	var_19_29.id = "RetryMark"

	var_19_29:SetAlpha(0, 0)
	var_19_29:setImage(RegisterMaterial("hud_check"), 0)
	var_19_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 70, _1080p * 102, 0, _1080p * 32)
	var_19_0:addElement(var_19_29)

	var_19_0.RetryMark = var_19_29

	local var_19_30
	local var_19_31 = LUI.UIText.new()

	var_19_31.id = "RetryNo"

	var_19_31:SetRGBFromTable(SWATCHES.HUD.enemyTeam, 0)
	var_19_31:SetAlpha(0, 0)
	var_19_31:setText("X", 0)
	var_19_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_31:SetAlignment(LUI.Alignment.Center)
	var_19_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 71, _1080p * 109, _1080p * -11, _1080p * 37)
	var_19_0:addElement(var_19_31)

	var_19_0.RetryNo = var_19_31

	local function var_19_32()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_32

	local var_19_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_4:RegisterAnimationSequence("ButtonOver", var_19_33)

	local var_19_34 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("ButtonOver", var_19_34)

	local var_19_35 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_8:RegisterAnimationSequence("ButtonOver", var_19_35)

	local var_19_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_11:RegisterAnimationSequence("ButtonOver", var_19_36)

	local function var_19_37()
		var_19_4:AnimateSequence("ButtonOver")
		var_19_6:AnimateSequence("ButtonOver")
		var_19_8:AnimateSequence("ButtonOver")
		var_19_11:AnimateSequence("ButtonOver")
	end

	var_19_0._sequences.ButtonOver = var_19_37

	local var_19_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_4:RegisterAnimationSequence("ButtonUp", var_19_38)

	local var_19_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("ButtonUp", var_19_39)

	local var_19_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_8:RegisterAnimationSequence("ButtonUp", var_19_40)

	local var_19_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_11:RegisterAnimationSequence("ButtonUp", var_19_41)

	local function var_19_42()
		var_19_4:AnimateSequence("ButtonUp")
		var_19_6:AnimateSequence("ButtonUp")
		var_19_8:AnimateSequence("ButtonUp")
		var_19_11:AnimateSequence("ButtonUp")
	end

	var_19_0._sequences.ButtonUp = var_19_42

	local var_19_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_21:RegisterAnimationSequence("MicOn", var_19_43)

	local function var_19_44()
		var_19_21:AnimateSequence("MicOn")
	end

	var_19_0._sequences.MicOn = var_19_44

	local var_19_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_21:RegisterAnimationSequence("MicOff", var_19_45)

	local function var_19_46()
		var_19_21:AnimateSequence("MicOff")
	end

	var_19_0._sequences.MicOff = var_19_46

	local var_19_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_23:RegisterAnimationSequence("RankShow", var_19_47)

	local var_19_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_25:RegisterAnimationSequence("RankShow", var_19_48)

	local function var_19_49()
		var_19_23:AnimateSequence("RankShow")
		var_19_25:AnimateSequence("RankShow")
	end

	var_19_0._sequences.RankShow = var_19_49

	local var_19_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_23:RegisterAnimationSequence("RankHide", var_19_50)

	local var_19_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_25:RegisterAnimationSequence("RankHide", var_19_51)

	local function var_19_52()
		var_19_23:AnimateSequence("RankHide")
		var_19_25:AnimateSequence("RankHide")
	end

	var_19_0._sequences.RankHide = var_19_52

	local var_19_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.caution
		}
	}

	var_19_13:RegisterAnimationSequence("ButtonUpPlayer", var_19_53)

	local var_19_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.caution
		}
	}

	var_19_15:RegisterAnimationSequence("ButtonUpPlayer", var_19_54)

	local var_19_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.caution
		}
	}

	var_19_17:RegisterAnimationSequence("ButtonUpPlayer", var_19_55)

	local var_19_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.caution
		}
	}

	var_19_19:RegisterAnimationSequence("ButtonUpPlayer", var_19_56)

	local function var_19_57()
		var_19_13:AnimateSequence("ButtonUpPlayer")
		var_19_15:AnimateSequence("ButtonUpPlayer")
		var_19_17:AnimateSequence("ButtonUpPlayer")
		var_19_19:AnimateSequence("ButtonUpPlayer")
	end

	var_19_0._sequences.ButtonUpPlayer = var_19_57

	local var_19_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_4:RegisterAnimationSequence("Hide", var_19_58)

	local function var_19_59()
		var_19_4:AnimateSequence("Hide")
	end

	var_19_0._sequences.Hide = var_19_59

	local var_19_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_19_4:RegisterAnimationSequence("isPC", var_19_60)

	local var_19_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_19_6:RegisterAnimationSequence("isPC", var_19_61)

	local var_19_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 7
		}
	}

	var_19_8:RegisterAnimationSequence("isPC", var_19_62)

	local var_19_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_19_11:RegisterAnimationSequence("isPC", var_19_63)

	local function var_19_64()
		var_19_4:AnimateSequence("isPC")
		var_19_6:AnimateSequence("isPC")
		var_19_8:AnimateSequence("isPC")
		var_19_11:AnimateSequence("isPC")
	end

	var_19_0._sequences.isPC = var_19_64

	local var_19_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -100
		}
	}

	var_19_4:RegisterAnimationSequence("isConsole", var_19_65)

	local var_19_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -100
		}
	}

	var_19_6:RegisterAnimationSequence("isConsole", var_19_66)

	local var_19_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -107
		}
	}

	var_19_8:RegisterAnimationSequence("isConsole", var_19_67)

	local var_19_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -100
		}
	}

	var_19_11:RegisterAnimationSequence("isConsole", var_19_68)

	local function var_19_69()
		var_19_4:AnimateSequence("isConsole")
		var_19_6:AnimateSequence("isConsole")
		var_19_8:AnimateSequence("isConsole")
		var_19_11:AnimateSequence("isConsole")
	end

	var_19_0._sequences.isConsole = var_19_69

	local var_19_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_29:RegisterAnimationSequence("RetryMarkOn", var_19_70)

	local function var_19_71()
		var_19_29:AnimateSequence("RetryMarkOn")
	end

	var_19_0._sequences.RetryMarkOn = var_19_71

	local var_19_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_31:RegisterAnimationSequence("RetryMarkX", var_19_72)

	local function var_19_73()
		var_19_31:AnimateSequence("RetryMarkX")
	end

	var_19_0._sequences.RetryMarkX = var_19_73

	var_0_2(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("CPScoreboardRow", CPScoreboardRow)
LockTable(_M)
