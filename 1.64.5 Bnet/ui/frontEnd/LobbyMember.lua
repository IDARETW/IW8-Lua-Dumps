module(..., package.seeall)

local var_0_0 = 16

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if not Engine.ECHCFGDDDF() then
		return
	end

	local var_1_0 = arg_1_0:GetCurrentMenu()
	local var_1_1 = arg_1_0:GetDataSource()

	if var_1_0 and var_1_0.SlideToLobbyMembers and arg_1_2 then
		var_1_0:SlideToLobbyMembers()
	end

	if var_1_1 and var_1_0 and var_1_0.LobbyMemberDetails then
		var_1_0.LobbyMemberDetails:SetAlpha(1)
		var_1_0.LobbyMemberDetails.PlayerCard:SetDataSource(var_1_1, arg_1_1)

		local var_1_2 = var_1_1.xuid:GetValue(arg_1_1)
		local var_1_3 = Lobby.CHDFIEBEDI(var_1_2)

		var_1_0.LobbyMemberDetails.Stats:SetData(var_1_3)
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	assert(arg_2_0.PartyStripe)

	if not (IsPublicMatch() and arg_2_1) then
		arg_2_0.PartyStripe:SetAlpha(0)

		return
	end

	arg_2_0.PartyStripe:SetAlpha(1)

	local var_2_0 = {
		COLORS.paleEarth,
		COLORS.orange,
		COLORS.marshGreen,
		COLORS.periwinkle,
		COLORS.blue,
		COLORS.lightCyan,
		COLORS.coralPink,
		COLORS.whaleBlue,
		COLORS.purple,
		COLORS.darkModerateViolet
	}
	local var_2_1 = var_2_0[1 + arg_2_1 % #var_2_0]

	assert(var_2_1)
	arg_2_0.PartyStripe:SetRGBFromTable(var_2_1)
end

local function var_0_3(arg_3_0, arg_3_1)
	assert(arg_3_0.HostIcon)
	arg_3_0.HostIcon:SetAlpha(arg_3_1 and 1 or 0)
end

local function var_0_4(arg_4_0, arg_4_1)
	assert(Teams.allies > Teams.axis)

	local var_4_0 = GetIntForColor(SWATCHES.genericMenu.blackBackground)

	if arg_4_0 == Teams.axis or arg_4_0 == Teams.allies then
		var_4_0 = CODCASTER.GetTeamDarkColor(arg_4_1, Mirror(arg_4_0, Teams.axis, Teams.allies))
	end

	return var_4_0
end

local function var_0_5(arg_5_0)
	local var_5_0 = GetIntForColor(SWATCHES.genericMenu.blackBackground)

	if arg_5_0 == Teams.allies then
		var_5_0 = GetIntForColor(SWATCHES.Global.keyColor)
	elseif arg_5_0 == Teams.axis then
		var_5_0 = GetIntForColor(SWATCHES.HUD.enemyTeam)
	end

	return var_5_0
end

local function var_0_6(arg_6_0, arg_6_1)
	arg_6_0.Gamertag:SetRGBFromTable(arg_6_1)
	arg_6_0.ClanTag:SetRGBFromTable(arg_6_1)
	arg_6_0.HostIcon:SetRGBFromTable(arg_6_1)
	arg_6_0.MicIcon:SetRGBFromTable(arg_6_1)

	if arg_6_0.MPPlayerRole and arg_6_0.MPPlayerRole.RoleName then
		arg_6_0.MPPlayerRole.RoleName:SetRGBFromTable(arg_6_1)
	end
end

local function var_0_7(arg_7_0, arg_7_1)
	arg_7_0._GPDImg = RegisterMaterial("icon_platform_controller")
	arg_7_0._KBMImg = RegisterMaterial("icon_platform_mousekeyboard")

	local var_7_0 = LUI.UIBindButton.new()

	var_7_0.id = "selfBindButton"

	arg_7_0:addElement(var_7_0)

	arg_7_0.bindButton = var_7_0

	local var_7_1
	local var_7_2 = SWATCHES.genericButton.textFocus

	arg_7_0.isInGameBattles = CONDITIONS.IsInGameBattlesMatch()
	arg_7_0.UpdateRowTextColor = var_0_6

	if arg_7_0.isInGameBattles then
		arg_7_0.MicIcon:UnsubscribeFromAllModels()
	end

	arg_7_0:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1.controller

		assert(var_8_0)

		local var_8_1 = arg_8_0:GetDataSource()
		local var_8_2 = var_8_1.memberIndex:GetValue(var_8_0)
		local var_8_3 = var_8_1.desiredTeam:GetValue(var_8_0)
		local var_8_4 = var_8_1.isCrossplayPlayer:GetValue(var_8_0)
		local var_8_5
		local var_8_6

		if arg_8_0.isInGameBattles then
			local var_8_7 = var_8_1.xuid:GetValue(var_8_0)

			if Engine.EBCDCFCBE(var_8_7) then
				return true
			end

			var_8_5 = Friends.CAIJHBHGGC(var_8_7)
			var_8_6 = var_8_1.platformId:GetValue(var_8_0)
		else
			var_8_5 = Lobby.CCHEBJJJEB(var_8_2)
		end

		assert(var_8_5)

		if Engine.BAHIIBFDDG() or Engine.BEFACAIFDD() or not Lobby.CHBBHFHJEH(var_8_5) then
			LUI.FlowManager.RequestPopupMenu(nil, "LobbyMemberActions", true, var_8_0, false, {
				xuid = var_8_5,
				platformId = var_8_6,
				memberIndex = var_8_2,
				memberTeam = var_8_3,
				isCrossplayPlayer = var_8_4
			})
		end

		return true
	end)

	local function var_7_3()
		local var_9_0 = arg_7_0:GetDataSource().gamertag:GetValue(arg_7_1)

		if var_9_0 ~= nil then
			local var_9_1 = arg_7_0:GetDataSource().gamertagWithHash:GetValue(arg_7_1)

			if var_9_1 and #var_9_1 > 0 and CONDITIONS.IsDisplayNameTag() and Engine.DDHAAEGIEI(arg_7_1) then
				var_9_0 = var_9_1
			end

			if Engine.CGABICJHAI() then
				local var_9_2 = Engine.CBAAECBJAJ(var_9_0, var_0_0)

				arg_7_0.Gamertag:setText(var_9_2, 0)
			else
				arg_7_0.Gamertag:setText(var_9_0, 0)
			end

			var_7_1 = arg_7_0:GetDataSource().isMyPlayer:GetValue(arg_7_1)

			if var_7_1 then
				ACTIONS.AnimateSequence(arg_7_0, "IsMyPlayer")
			elseif not arg_7_0.isInGameBattles then
				ACTIONS.AnimateSequence(arg_7_0, "IsNotMyPlayer")
			end
		end

		if arg_7_0.MPPlayerRole then
			ACTIONS.AnimateSequence(arg_7_0.MPPlayerRole, "HideHint")
		end

		local var_9_3 = arg_7_0:GetDataSource().missingGamertag:GetValue(arg_7_1)

		if Engine.EAIICIFIFA() then
			if var_9_3 or CONDITIONS.IsSystemLink() then
				ACTIONS.AnimateSequence(arg_7_0, "HideRank")
			else
				ACTIONS.AnimateSequence(arg_7_0, "ShowRank")
			end
		elseif var_9_3 or CONDITIONS.IsSystemLink() or not CONDITIONS.IsPublicMatch() then
			ACTIONS.AnimateSequence(arg_7_0, "HideRank")
		else
			ACTIONS.AnimateSequence(arg_7_0, "ShowRank")
		end
	end

	arg_7_0.Gamertag:SubscribeToModelThroughElement(arg_7_0, "gamertag", var_7_3)

	local function var_7_4()
		local var_10_0 = arg_7_0:GetDataSource().usingGamepad:GetValue(arg_7_1)

		if var_10_0 ~= nil then
			if var_10_0 then
				arg_7_0.InputMethod:setImage(arg_7_0._GPDImg, 0)
			else
				arg_7_0.InputMethod:setImage(arg_7_0._KBMImg, 0)
			end
		end
	end

	arg_7_0.InputMethod:SubscribeToModelThroughElement(arg_7_0, "usingGamepad", var_7_4)

	local function var_7_5()
		local var_11_0 = arg_7_0:GetDataSource().presencePlatform:GetValue(arg_7_1)

		if var_11_0 ~= nil then
			arg_7_0.SocialPlatformPresence:SetPlatformPresence(ClientPlatformToPresencePlatform[var_11_0])
		end
	end

	arg_7_0.SocialPlatformPresence:SubscribeToModelThroughElement(arg_7_0, "presencePlatform", var_7_5)

	local var_7_6 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.teamsVisible")

	local function var_7_7()
		local var_12_0 = arg_7_0:GetDataSource()

		if not var_12_0 then
			return
		end

		local var_12_1 = var_12_0.memberIndex:GetValue(arg_7_1)

		if var_12_1 ~= nil and var_12_1 % 2 == 0 then
			ACTIONS.AnimateSequence(arg_7_0, "AlternateBackground")
		end

		local var_12_2 = var_12_0.team:GetValue(arg_7_1)

		if not var_12_2 then
			return
		end

		local var_12_3 = var_7_6:GetValue(arg_7_1)

		if CONDITIONS.IsTeamBasedGameType() and var_12_3 and not arg_7_0.isInGameBattles then
			local var_12_4 = Engine.CIGDHFFFEJ()

			if var_12_4 == Teams.allies or var_12_4 == Teams.axis then
				var_7_2 = SWATCHES.genericButton.description

				if var_12_2 == var_12_4 then
					ACTIONS.AnimateSequence(arg_7_0, "Friendly")
				elseif var_12_2 == Teams.spectator then
					ACTIONS.AnimateSequence(arg_7_0, "Spectator")
				elseif var_12_2 == Teams.follower then
					ACTIONS.AnimateSequence(arg_7_0, "Follower")
				else
					ACTIONS.AnimateSequence(arg_7_0, "Enemy")
				end
			end
		else
			var_7_2 = SWATCHES.genericButton.textDefault

			ACTIONS.AnimateSequence(arg_7_0, "NoTeam")
		end

		if not var_7_1 and not arg_7_0.isInGameBattles then
			arg_7_0.UpdateRowTextColor(arg_7_0, var_7_2)
		end

		if (Lobby.GetCurrentGameType() == MP.GameMode.FFAGameType or Lobby.GetCurrentGameType() == MP.GameMode.OICGameType) and arg_7_0.MPPlayerRole then
			arg_7_0.MPPlayerRole.RoleName:SetAlpha(0, 0)
		end
	end

	arg_7_0.BackgroundTint:SubscribeToModel(var_7_6:GetModel(arg_7_1), var_7_7)
	arg_7_0.BackgroundTint:SubscribeToModelThroughElement(arg_7_0, "team", var_7_7)
	arg_7_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		var_0_1(arg_7_0, arg_7_1, arg_13_1.focusType ~= FocusType.MouseOver)
	end)
	arg_7_0:SubscribeToModelThroughElement(arg_7_0, "gamertag", function()
		if arg_7_0:isInFocus() then
			var_0_1(arg_7_0, arg_7_1, false)
		end
	end)
	arg_7_0:SubscribeToModelThroughElement(arg_7_0, "subparty", function(arg_15_0)
		local var_15_0 = DataModel.JJEHAEBDF(arg_15_0)

		if var_15_0 == -1 then
			var_15_0 = nil
		end

		var_0_2(arg_7_0, var_15_0)
	end)

	if not arg_7_0.isInGameBattles then
		arg_7_0:SubscribeToModelThroughElement(arg_7_0, "isPrivatePartyHost", function(arg_16_0)
			local var_16_0 = DataModel.JJEHAEBDF(arg_16_0) == true

			var_0_3(arg_7_0, var_16_0)
		end)
	else
		arg_7_0.UpdateHostIcon = var_0_3

		arg_7_0:SubscribeToModelThroughElement(arg_7_0, "isLobbyHost", function(arg_17_0)
			local var_17_0 = false

			if GAMEBATTLES.HasJoinedMatch(arg_7_1) then
				var_17_0 = DataModel.JJEHAEBDF(arg_17_0) == true
			end

			arg_7_0:UpdateHostIcon(var_17_0)
		end)
	end

	if not Engine.EAIICIFIFA() then
		ACTIONS.AnimateSequence(arg_7_0, "ButtonUp")
	end

	arg_7_0.Rank:SetWordWrap(false)
	arg_7_0:addEventHandler("button_over", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = arg_7_1
		end

		if CONDITIONS.IsMultiplayer(arg_7_0) then
			if arg_7_0.isInGameBattles and arg_7_0:IsDisabled() then
				ACTIONS.AnimateSequence(arg_7_0, "ButtonOverDisabled")

				return
			end

			ACTIONS.AnimateSequence(arg_7_0, "ButtonOver")

			if not var_7_1 then
				arg_7_0.UpdateRowTextColor(arg_7_0, var_7_2)
			end
		end
	end)
	arg_7_0:addEventHandler("button_up", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = arg_7_1
		end

		if CONDITIONS.IsMultiplayer(arg_7_0) then
			if arg_7_0.isInGameBattles and arg_7_0:IsDisabled() then
				ACTIONS.AnimateSequence(arg_7_0, "ButtonUpDisabled")

				return
			end

			ACTIONS.AnimateSequence(arg_7_0, "ButtonUp")

			if not var_7_1 then
				arg_7_0.UpdateRowTextColor(arg_7_0, SWATCHES.genericButton.textDefault)
			end
		end
	end)
	FRIENDS.SetupLobbyMemberContextualMenu(arg_7_0, arg_7_0, arg_7_1)

	local function var_7_8()
		local var_20_0 = arg_7_0:GetDataSource().displayRank:GetValue(arg_7_1)

		if var_20_0 ~= nil then
			local var_20_1 = tonumber(var_20_0) or 0
			local var_20_2 = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_20_1
			})

			ACTIONS.AnimateSequence(arg_7_0, var_20_2._isUsingSeasonalRank and "ElderRank" or "StandardRank")
		end
	end

	arg_7_0:SubscribeToModelThroughElement(arg_7_0, "displayRank", var_7_8)
end

function LobbyMember(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIButton.new()

	var_21_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 620 * _1080p, 0, 38 * _1080p)

	var_21_0.id = "LobbyMember"
	var_21_0._animationSets = var_21_0._animationSets or {}
	var_21_0._sequences = var_21_0._sequences or {}

	local var_21_1 = arg_21_1 and arg_21_1.controllerIndex

	if not var_21_1 and not Engine.DDJFBBJAIG() then
		var_21_1 = var_21_0:getRootController()
	end

	assert(var_21_1)

	local var_21_2 = var_21_0
	local var_21_3
	local var_21_4 = LUI.UIImage.new()

	var_21_4.id = "Backer"

	var_21_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_21_4:SetAlpha(0.45, 0)
	var_21_0:addElement(var_21_4)

	var_21_0.Backer = var_21_4

	local var_21_5
	local var_21_6 = LUI.UIImage.new()

	var_21_6.id = "TextureLayer"

	var_21_6:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam, 0)
	var_21_6:SetAlpha(0, 0)
	var_21_6:SetPixelGridEnabled(true)
	var_21_6:SetPixelGridContrast(0.8, 0)
	var_21_6:SetPixelGridBlockWidth(2, 0)
	var_21_6:SetPixelGridBlockHeight(2, 0)
	var_21_6:SetPixelGridGutterWidth(1, 0)
	var_21_6:SetPixelGridGutterHeight(1, 0)
	var_21_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_21_6:Setup9SliceImage(_1080p * 89, _1080p * 0, 0.48, 0)
	var_21_0:addElement(var_21_6)

	var_21_0.TextureLayer = var_21_6

	local var_21_7
	local var_21_8 = LUI.UIImage.new()

	var_21_8.id = "Glow"

	var_21_8:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam, 0)
	var_21_8:SetAlpha(0, 0)
	var_21_8:SetPixelGridEnabled(true)
	var_21_8:SetPixelGridContrast(0.5, 0)
	var_21_8:SetPixelGridBlockWidth(2, 0)
	var_21_8:SetPixelGridBlockHeight(2, 0)
	var_21_8:SetPixelGridGutterWidth(1, 0)
	var_21_8:SetPixelGridGutterHeight(1, 0)
	var_21_8:setImage(RegisterMaterial("button_glow"), 0)
	var_21_8:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_21_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
	var_21_0:addElement(var_21_8)

	var_21_0.Glow = var_21_8

	local var_21_9
	local var_21_10 = LUI.UIImage.new()

	var_21_10.id = "BackgroundTint"

	var_21_10:SetRGBFromTable(SWATCHES.Scoreboard.background, 0)
	var_21_10:SetAlpha(0.85, 0)
	var_21_0:addElement(var_21_10)

	var_21_0.BackgroundTint = var_21_10

	local var_21_11
	local var_21_12 = LUI.UIImage.new()

	var_21_12.id = "Line"

	var_21_12:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam, 0)
	var_21_12:SetAlpha(0, 0)
	var_21_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_21_0:addElement(var_21_12)

	var_21_0.Line = var_21_12

	local var_21_13

	if CONDITIONS.IsPlayerRoleAllowed(var_21_0) then
		var_21_13 = MenuBuilder.BuildRegisteredType("MPPlayerRole", {
			controllerIndex = var_21_1
		})
		var_21_13.id = "MPPlayerRole"

		var_21_13:SetRGBFromTable(SWATCHES.text.primaryText, 0)

		if CONDITIONS.IsPlayerRoleAllowed(var_21_0) then
			var_21_13:SetDataSourceThroughElement(var_21_0, nil)
		end

		var_21_13.Fader:SetAlpha(0, 0)
		var_21_13.RoleName:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
		var_21_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -218, _1080p * 12, _1080p * -9, _1080p * 9)
		var_21_0:addElement(var_21_13)

		var_21_0.MPPlayerRole = var_21_13
	end

	local var_21_14
	local var_21_15 = LUI.UIStyledText.new()

	var_21_15.id = "Gamertag"

	var_21_15:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_21_15:setText("WWWWWWWWWWWWWWWW", 0)
	var_21_15:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_21_15:SetWordWrap(false)
	var_21_15:SetAlignment(LUI.Alignment.Left)
	var_21_15:SetOptOutRightToLeftAlignmentFlip(true)
	var_21_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_21_15:SetUseEllipses(ELLIPSES.enabled_default)
	var_21_15:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 211, _1080p * 417, _1080p * -11, _1080p * 11)
	var_21_0:addElement(var_21_15)

	var_21_0.Gamertag = var_21_15

	local var_21_16
	local var_21_17 = LUI.UIText.new()

	var_21_17.id = "ClanTag"

	var_21_17:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_21_17:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_21_17:SetWordWrap(false)
	var_21_17:SetAlignment(LUI.Alignment.Center)
	var_21_17:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 129, _1080p * 208, _1080p * -11, _1080p * 11)

	local function var_21_18()
		local var_22_0 = var_21_0:GetDataSource().clanTag:GetValue(var_21_1)

		if var_22_0 ~= nil then
			var_21_17:setText(var_22_0, 0)
		end
	end

	var_21_17:SubscribeToModelThroughElement(var_21_0, "clanTag", var_21_18)
	var_21_0:addElement(var_21_17)

	var_21_0.ClanTag = var_21_17

	local var_21_19
	local var_21_20 = LUI.UIImage.new()

	var_21_20.id = "RankIcon"

	var_21_20:SetRGBFromTable(SWATCHES.CAC.performanceHeader, 0)
	var_21_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 74, _1080p * 98, _1080p * -12, _1080p * 12)

	local function var_21_21()
		local var_23_0 = var_21_0:GetDataSource().rankIcon:GetValue(var_21_1)

		if var_23_0 ~= nil then
			var_21_20:setImage(RegisterMaterial(var_23_0), 0)
		end
	end

	var_21_20:SubscribeToModelThroughElement(var_21_0, "rankIcon", var_21_21)
	var_21_0:addElement(var_21_20)

	var_21_0.RankIcon = var_21_20

	local var_21_22
	local var_21_23 = LUI.UIText.new()

	var_21_23.id = "Rank"

	var_21_23:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_21_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_21_23:SetWordWrap(false)
	var_21_23:SetAlignment(LUI.Alignment.Right)
	var_21_23:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 40, _1080p * 71, _1080p * -12, _1080p * 12)

	local function var_21_24()
		local var_24_0 = var_21_0:GetDataSource().displayRank:GetValue(var_21_1)

		if var_24_0 ~= nil then
			var_21_23:setText(var_24_0, 0)
		end
	end

	var_21_23:SubscribeToModelThroughElement(var_21_0, "displayRank", var_21_24)
	var_21_0:addElement(var_21_23)

	var_21_0.Rank = var_21_23

	local var_21_25
	local var_21_26 = LUI.UIImage.new()

	var_21_26.id = "MicIcon"

	var_21_26:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_21_26:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 5, _1080p * 37, _1080p * -16, _1080p * 16)

	local function var_21_27()
		local var_25_0 = var_21_0:GetDataSource().microphoneAlpha:GetValue(var_21_1)

		if var_25_0 ~= nil then
			var_21_26:SetAlpha(var_25_0, 0)
		end
	end

	var_21_26:SubscribeToModelThroughElement(var_21_0, "microphoneAlpha", var_21_27)

	local function var_21_28()
		local var_26_0 = var_21_0:GetDataSource().microphoneIcon:GetValue(var_21_1)

		if var_26_0 ~= nil then
			var_21_26:setImage(RegisterMaterial(var_26_0), 0)
		end
	end

	var_21_26:SubscribeToModelThroughElement(var_21_0, "microphoneIcon", var_21_28)
	var_21_0:addElement(var_21_26)

	var_21_0.MicIcon = var_21_26

	local var_21_29
	local var_21_30 = LUI.UIImage.new()

	var_21_30.id = "HostIcon"

	var_21_30:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_21_30:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_21_30:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 108, _1080p * 128, _1080p * -10, _1080p * 10)
	var_21_0:addElement(var_21_30)

	var_21_0.HostIcon = var_21_30

	local var_21_31
	local var_21_32 = LUI.UIImage.new()

	var_21_32.id = "Divider"

	var_21_32:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_21_32:SetAlpha(0.25, 0)
	var_21_32:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 103, _1080p * 105, _1080p * 2, _1080p * -2)
	var_21_0:addElement(var_21_32)

	var_21_0.Divider = var_21_32

	local var_21_33
	local var_21_34 = LUI.UIImage.new()

	var_21_34.id = "PartyStripe"

	var_21_34:SetRGBFromTable(SWATCHES.BattleRoyale.BRSBAttraction, 0)
	var_21_34:SetAlpha(0.8, 0)
	var_21_34:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, 0, 0)
	var_21_0:addElement(var_21_34)

	var_21_0.PartyStripe = var_21_34

	local var_21_35
	local var_21_36 = LUI.UIImage.new()

	var_21_36.id = "InputMethod"

	var_21_36:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_21_36:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -66, _1080p * -38, _1080p * -14, _1080p * 14)
	var_21_0:addElement(var_21_36)

	var_21_0.InputMethod = var_21_36

	local var_21_37
	local var_21_38 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_21_1
	})

	var_21_38.id = "SocialPlatformPresence"

	var_21_38:SetAlpha(0.75, 0)
	var_21_38:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -31, _1080p * -9, _1080p * 8, _1080p * 30)
	var_21_0:addElement(var_21_38)

	var_21_0.SocialPlatformPresence = var_21_38

	local function var_21_39()
		return
	end

	var_21_0._sequences.DefaultSequence = var_21_39

	local var_21_40
	local var_21_41 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_4:RegisterAnimationSequence("ButtonUp", var_21_41)

	local var_21_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonUp", var_21_42)

	local var_21_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_8:RegisterAnimationSequence("ButtonUp", var_21_43)

	local var_21_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("ButtonUp", var_21_44)

	local var_21_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_12:RegisterAnimationSequence("ButtonUp", var_21_45)

	local var_21_46 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_38:RegisterAnimationSequence("ButtonUp", var_21_46)

	local function var_21_47()
		var_21_4:AnimateSequence("ButtonUp")
		var_21_6:AnimateSequence("ButtonUp")
		var_21_8:AnimateSequence("ButtonUp")
		var_21_10:AnimateSequence("ButtonUp")
		var_21_12:AnimateSequence("ButtonUp")
		var_21_38:AnimateSequence("ButtonUp")
	end

	var_21_0._sequences.ButtonUp = var_21_47

	local var_21_48
	local var_21_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_4:RegisterAnimationSequence("ButtonOver", var_21_49)

	local var_21_50 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonOver", var_21_50)

	local var_21_51 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_21_8:RegisterAnimationSequence("ButtonOver", var_21_51)

	local var_21_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("ButtonOver", var_21_52)

	local var_21_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_21_12:RegisterAnimationSequence("ButtonOver", var_21_53)

	local var_21_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_38:RegisterAnimationSequence("ButtonOver", var_21_54)

	local function var_21_55()
		var_21_4:AnimateSequence("ButtonOver")
		var_21_6:AnimateSequence("ButtonOver")
		var_21_8:AnimateSequence("ButtonOver")
		var_21_10:AnimateSequence("ButtonOver")
		var_21_12:AnimateSequence("ButtonOver")
		var_21_38:AnimateSequence("ButtonOver")
	end

	var_21_0._sequences.ButtonOver = var_21_55

	local var_21_56
	local var_21_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_20:RegisterAnimationSequence("ShowRank", var_21_57)

	local var_21_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_23:RegisterAnimationSequence("ShowRank", var_21_58)

	local var_21_59 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_32:RegisterAnimationSequence("ShowRank", var_21_59)

	local function var_21_60()
		var_21_20:AnimateSequence("ShowRank")
		var_21_23:AnimateSequence("ShowRank")
		var_21_32:AnimateSequence("ShowRank")
	end

	var_21_0._sequences.ShowRank = var_21_60

	local var_21_61
	local var_21_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_20:RegisterAnimationSequence("HideRank", var_21_62)

	local var_21_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_23:RegisterAnimationSequence("HideRank", var_21_63)

	local var_21_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_32:RegisterAnimationSequence("HideRank", var_21_64)

	local function var_21_65()
		var_21_20:AnimateSequence("HideRank")
		var_21_23:AnimateSequence("HideRank")
		var_21_32:AnimateSequence("HideRank")
	end

	var_21_0._sequences.HideRank = var_21_65

	local function var_21_66()
		return
	end

	var_21_0._sequences.AlternateBackground = var_21_66

	local var_21_67

	if CONDITIONS.IsPlayerRoleAllowed(var_21_0) then
		local var_21_68 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.highlight,
				child = var_21_0.MPPlayerRole.RoleName
			}
		}

		var_21_13:RegisterAnimationSequence("IsMyPlayer", var_21_68)
	end

	local var_21_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_21_15:RegisterAnimationSequence("IsMyPlayer", var_21_69)

	local var_21_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_21_17:RegisterAnimationSequence("IsMyPlayer", var_21_70)

	local var_21_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_21_30:RegisterAnimationSequence("IsMyPlayer", var_21_71)

	local function var_21_72()
		if CONDITIONS.IsPlayerRoleAllowed(var_21_0) then
			var_21_13:AnimateSequence("IsMyPlayer")
		end

		var_21_15:AnimateSequence("IsMyPlayer")
		var_21_17:AnimateSequence("IsMyPlayer")
		var_21_30:AnimateSequence("IsMyPlayer")
	end

	var_21_0._sequences.IsMyPlayer = var_21_72

	local var_21_73

	if CONDITIONS.IsPlayerRoleAllowed(var_21_0) then
		local var_21_74 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textDefault,
				child = var_21_0.MPPlayerRole.RoleName
			}
		}

		var_21_13:RegisterAnimationSequence("IsNotMyPlayer", var_21_74)
	end

	local var_21_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_21_15:RegisterAnimationSequence("IsNotMyPlayer", var_21_75)

	local var_21_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_21_17:RegisterAnimationSequence("IsNotMyPlayer", var_21_76)

	local var_21_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_21_30:RegisterAnimationSequence("IsNotMyPlayer", var_21_77)

	local function var_21_78()
		if CONDITIONS.IsPlayerRoleAllowed(var_21_0) then
			var_21_13:AnimateSequence("IsNotMyPlayer")
		end

		var_21_15:AnimateSequence("IsNotMyPlayer")
		var_21_17:AnimateSequence("IsNotMyPlayer")
		var_21_30:AnimateSequence("IsNotMyPlayer")
	end

	var_21_0._sequences.IsNotMyPlayer = var_21_78

	local var_21_79
	local var_21_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.friendlyTeam
		}
	}

	var_21_6:RegisterAnimationSequence("Friendly", var_21_80)

	local var_21_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.friendlyTeam
		}
	}

	var_21_8:RegisterAnimationSequence("Friendly", var_21_81)

	local var_21_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Lobby.FriendlyTeamHighlight
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("Friendly", var_21_82)

	local var_21_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.friendlyTeam
		}
	}

	var_21_12:RegisterAnimationSequence("Friendly", var_21_83)

	local function var_21_84()
		var_21_6:AnimateSequence("Friendly")
		var_21_8:AnimateSequence("Friendly")
		var_21_10:AnimateSequence("Friendly")
		var_21_12:AnimateSequence("Friendly")
	end

	var_21_0._sequences.Friendly = var_21_84

	local var_21_85
	local var_21_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeam
		}
	}

	var_21_6:RegisterAnimationSequence("Enemy", var_21_86)

	local var_21_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeam
		}
	}

	var_21_8:RegisterAnimationSequence("Enemy", var_21_87)

	local var_21_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Lobby.EnemyTeamHighlight
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("Enemy", var_21_88)

	local var_21_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeam
		}
	}

	var_21_12:RegisterAnimationSequence("Enemy", var_21_89)

	local function var_21_90()
		var_21_6:AnimateSequence("Enemy")
		var_21_8:AnimateSequence("Enemy")
		var_21_10:AnimateSequence("Enemy")
		var_21_12:AnimateSequence("Enemy")
	end

	var_21_0._sequences.Enemy = var_21_90

	local var_21_91
	local var_21_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.friendlyTeam
		}
	}

	var_21_6:RegisterAnimationSequence("NoTeam", var_21_92)

	local var_21_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.friendlyTeam
		}
	}

	var_21_8:RegisterAnimationSequence("NoTeam", var_21_93)

	local var_21_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.background
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("NoTeam", var_21_94)

	local var_21_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.friendlyTeam
		}
	}

	var_21_12:RegisterAnimationSequence("NoTeam", var_21_95)

	local var_21_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_21_26:RegisterAnimationSequence("NoTeam", var_21_96)

	local function var_21_97()
		var_21_6:AnimateSequence("NoTeam")
		var_21_8:AnimateSequence("NoTeam")
		var_21_10:AnimateSequence("NoTeam")
		var_21_12:AnimateSequence("NoTeam")
		var_21_26:AnimateSequence("NoTeam")
	end

	var_21_0._sequences.NoTeam = var_21_97

	local var_21_98
	local var_21_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.spectator
		}
	}

	var_21_6:RegisterAnimationSequence("Spectator", var_21_99)

	local var_21_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.spectator
		}
	}

	var_21_8:RegisterAnimationSequence("Spectator", var_21_100)

	local var_21_101 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.spectatorDark
		}
	}

	var_21_10:RegisterAnimationSequence("Spectator", var_21_101)

	local var_21_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.spectator
		}
	}

	var_21_12:RegisterAnimationSequence("Spectator", var_21_102)

	local function var_21_103()
		var_21_6:AnimateSequence("Spectator")
		var_21_8:AnimateSequence("Spectator")
		var_21_10:AnimateSequence("Spectator")
		var_21_12:AnimateSequence("Spectator")
	end

	var_21_0._sequences.Spectator = var_21_103

	local var_21_104
	local var_21_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.follower
		}
	}

	var_21_6:RegisterAnimationSequence("Follower", var_21_105)

	local var_21_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.follower
		}
	}

	var_21_8:RegisterAnimationSequence("Follower", var_21_106)

	local var_21_107 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.followerDark
		}
	}

	var_21_10:RegisterAnimationSequence("Follower", var_21_107)

	local var_21_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.follower
		}
	}

	var_21_12:RegisterAnimationSequence("Follower", var_21_108)

	local function var_21_109()
		var_21_6:AnimateSequence("Follower")
		var_21_8:AnimateSequence("Follower")
		var_21_10:AnimateSequence("Follower")
		var_21_12:AnimateSequence("Follower")
	end

	var_21_0._sequences.Follower = var_21_109

	local var_21_110

	if CONDITIONS.IsPlayerRoleAllowed(var_21_0) then
		local var_21_111 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_21_13:RegisterAnimationSequence("GameBattles", var_21_111)
	end

	local var_21_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 67
		}
	}

	var_21_15:RegisterAnimationSequence("GameBattles", var_21_112)

	local var_21_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_17:RegisterAnimationSequence("GameBattles", var_21_113)

	local var_21_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_20:RegisterAnimationSequence("GameBattles", var_21_114)

	local var_21_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_23:RegisterAnimationSequence("GameBattles", var_21_115)

	local var_21_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60
		}
	}

	var_21_30:RegisterAnimationSequence("GameBattles", var_21_116)

	local var_21_117 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_32:RegisterAnimationSequence("GameBattles", var_21_117)

	local var_21_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_34:RegisterAnimationSequence("GameBattles", var_21_118)

	local function var_21_119()
		if CONDITIONS.IsPlayerRoleAllowed(var_21_0) then
			var_21_13:AnimateSequence("GameBattles")
		end

		var_21_15:AnimateSequence("GameBattles")
		var_21_17:AnimateSequence("GameBattles")
		var_21_20:AnimateSequence("GameBattles")
		var_21_23:AnimateSequence("GameBattles")
		var_21_30:AnimateSequence("GameBattles")
		var_21_32:AnimateSequence("GameBattles")
		var_21_34:AnimateSequence("GameBattles")
	end

	var_21_0._sequences.GameBattles = var_21_119

	local var_21_120
	local var_21_121 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_4:RegisterAnimationSequence("ButtonOverDisabled", var_21_121)

	local var_21_122 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonOverDisabled", var_21_122)

	local var_21_123 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_21_8:RegisterAnimationSequence("ButtonOverDisabled", var_21_123)

	local var_21_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("ButtonOverDisabled", var_21_124)

	local var_21_125 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_21_12:RegisterAnimationSequence("ButtonOverDisabled", var_21_125)

	local function var_21_126()
		var_21_4:AnimateSequence("ButtonOverDisabled")
		var_21_6:AnimateSequence("ButtonOverDisabled")
		var_21_8:AnimateSequence("ButtonOverDisabled")
		var_21_10:AnimateSequence("ButtonOverDisabled")
		var_21_12:AnimateSequence("ButtonOverDisabled")
	end

	var_21_0._sequences.ButtonOverDisabled = var_21_126

	local var_21_127
	local var_21_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		}
	}

	var_21_10:RegisterAnimationSequence("IsNotConnectedPlayer", var_21_128)

	local var_21_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_21_15:RegisterAnimationSequence("IsNotConnectedPlayer", var_21_129)

	local function var_21_130()
		var_21_10:AnimateSequence("IsNotConnectedPlayer")
		var_21_15:AnimateSequence("IsNotConnectedPlayer")
	end

	var_21_0._sequences.IsNotConnectedPlayer = var_21_130

	local var_21_131
	local var_21_132 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_4:RegisterAnimationSequence("ButtonUpDisabled", var_21_132)

	local var_21_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_6:RegisterAnimationSequence("ButtonUpDisabled", var_21_133)

	local var_21_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_8:RegisterAnimationSequence("ButtonUpDisabled", var_21_134)

	local var_21_135 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_10:RegisterAnimationSequence("ButtonUpDisabled", var_21_135)

	local var_21_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_21_12:RegisterAnimationSequence("ButtonUpDisabled", var_21_136)

	local function var_21_137()
		var_21_4:AnimateSequence("ButtonUpDisabled")
		var_21_6:AnimateSequence("ButtonUpDisabled")
		var_21_8:AnimateSequence("ButtonUpDisabled")
		var_21_10:AnimateSequence("ButtonUpDisabled")
		var_21_12:AnimateSequence("ButtonUpDisabled")
	end

	var_21_0._sequences.ButtonUpDisabled = var_21_137

	local var_21_138
	local var_21_139 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.elderRank
		}
	}

	var_21_23:RegisterAnimationSequence("ElderRank", var_21_139)

	local function var_21_140()
		var_21_23:AnimateSequence("ElderRank")
	end

	var_21_0._sequences.ElderRank = var_21_140

	local var_21_141
	local var_21_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_21_23:RegisterAnimationSequence("StandardRank", var_21_142)

	local function var_21_143()
		var_21_23:AnimateSequence("StandardRank")
	end

	var_21_0._sequences.StandardRank = var_21_143

	if CONDITIONS.IsPlayerRoleAllowed(var_21_0) then
		var_21_13:SetDataSourceThroughElement(var_21_0, nil)
	end

	var_0_7(var_21_0, var_21_1, arg_21_1)

	if (not CONDITIONS.IsPublicMatch(var_21_0) or CONDITIONS.IsSystemLink(var_21_0)) and not CONDITIONS.IsThirdGameMode(var_21_0) then
		ACTIONS.AnimateSequence(var_21_0, "HideRank")
	end

	if CONDITIONS.IsThirdGameMode(var_21_0) and CONDITIONS.IsSystemLink(var_21_0) then
		ACTIONS.AnimateSequence(var_21_0, "HideRank")
	end

	return var_21_0
end

MenuBuilder.registerType("LobbyMember", LobbyMember)
LockTable(_M)
